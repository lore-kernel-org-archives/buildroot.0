From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Feb 2020 14:33:48 +0100
Subject: [Buildroot] Split per-package dirs for dependencies and installation
Message-ID: <20200228143348.14391427@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

During the Buildroot Developers Meeting, we discussed the progress of
the top-level parallel build support, and identified two issues:

 (1) The per-package host and target directories are read/write, and
     due to the fact that we use hardlinks, if a package has the bad
     idea of modifying/overwriting a file that was installed by
     another package, this change is visible in all other per-package
     host/target directories, which violates the isolation between the
     build of the different packages.

 (2) The per-package logic breaks the <pkg>-reconfigure, <pkg>-rebuild
     and <pkg>-reinstall targets, as I explained in a previous e-mail
     in
     http://lists.busybox.net/pipermail/buildroot/2019-December/268908.html.

As part of the Buildroot Developers Meeting, we thought of the
following solution:

 - The host/target directories of package A dependencies are collected
   in $(PER_PACKAGE_DIR)/A/host-deps and
   $(PER_PACKAGE_DIR)/A/target-deps respectively.

 - These folders are made read-only once the dependencies have been
   rsynced into them. This prevents incorrect modifications of files
   in these folders.

 - During the configure/build steps, HOST_DIR points to
   $(PER_PACKAGE_DIR)/A/host-deps and TARGET_DIR points to
   $(PER_PACKAGE_DIR)/A/target-deps. However, at installation time,
   HOST_DIR and TARGET_DIR points to other, empty directories, which
   are writable. The aim here was to also solve the issue of the
   reconfigure/rebuild/reinstall targets.

So, I took a stab at implementing this, and well, it's not that easy:

 - As expected, some packages do more than installing stuff in their
   install step. As a trivial example, for some funky reason, even a
   "simple" package like Busybox calls ARCH-gcc during its install
   step. Except that during the install step, HOST_DIR is empty, and
   certainly does not contain any cross-compiler. The build fails.

 - Worse is the case of host packages. We configure them with
   --prefix=$(HOST_DIR)/usr, which points to
   $(PER_PACKAGE_DIR)/A/host-deps. So when we run "make install", they
   want to install in $(PER_PACKAGE_DIR)/A/host-deps, not in
   $(PER_PACKAGE_DIR)/A/host, which is the read/write empty directory we
   want packages to install into. I don't see any good way to fix that.

Overall, I am wondering if we couldn't instead keep a single
HOST_DIR/TARGET_DIR, but make only the *files* read-only. Having the
files read-only would prevent modifications of existing files, but
since the directories are read/write, additional files can be added by
the new package. This would solve issue (1) above.

It would however not solve issue (2). As outlined in my December
e-mail, another possible direction to solve issue (2) is to rely on
the package file list, but it's a bit annoying to rely on this as part
of the build process, as we so far do not rely on that.

Do you have some ideas or feedback ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

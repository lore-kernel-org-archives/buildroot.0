From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 20:44:22 +0200
Subject: [Buildroot] Report from the Buildroot Summer Camp
Message-ID: <20170706204422.78b39f6d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

From Saturday to Wednesday, 7 Buildroot developers gathered in
Brittany, France for a 5-day hackaton. Peter Korsgaard, Yann Morin,
Arnout Vandecappelle, Samuel Martin, Romain Naour, Maxime Hadjinlian
and myself participated to this event. Fabrice Fontaine, a Buildroot
contributor from the area, also joined us for a barbecue.

You had anyway probably already discovered that "something" was going
on by looking at the mailing list and commit activity.

In total, we applied 384 patches, and made useful progress on a number
of topics, even though they haven't all been merged yet.

Here are the main highlights of things that have been merged:

 - Improvements to the runtime test infrastructure:

   * Patches from Ricardo that make the tests executable in parallel,
     as well as other improvements, have been merged.

   * The runtime tests are now executed daily by the Gitlab CI
     infrastructure (see .gitlab-ci.yml for details). This was done by
     Thomas Petazzoni.

     Therefore, Gitlab now sends an e-mail every day to the mailing
     list with the result of those tests. Unfortunately, Gitlab
     notification e-mails do not contain a To: field in their headers,
     so this might break filtering for people filtering on To/Cc
     instead of using the List-Id header.

   * A few tests have been added to test external toolchain related
     features

 - Utilities directly useful to the user have been moved from
   support/scripts/ to the top-level utils/ directory. It currently
   contains check-package, get-developers, scancpan, scanpypi,
   size-stats-compare, test-pkg, and the new brmake.

   The latter is a small make wrapper that you can use to get a
   cleaner output of Buildroot builds, while keeping the entire build
   log into a file.

   The patches, and brmake script, were provided by Yann E. Morin.

 - We no longer download patches from Github, and generally changed
   our policy to only use the per-package <pkg>_PATCH variable when
   downloaded patches are guaranteed to be stable. Indeed, patches
   from Github are generated on the fly, and their contents can change
   slightly over time, making the hash of such patches invalid. We
   have therefore modified all packages downloading patches from
   Github so that they contain the patches directly in the package
   directory.

   This was done by Thomas Petazzoni, after discussion with Peter
   Korsgaard and Arnout Vandecappelle.

 - Support for storing the hash of license files inside the .hash file
   has been added. The idea is that this will allow us to detect when
   the contents of license files are changed by upstream developers.

   Patches were provided by Yann E. Morin.

 - Support for building Busybox as individual binaries has finally
   been merged. It's a small thing, but it was the last missing piece
   for basic SELinux support, an effort that was started many years
   ago by folks from Rockwell Collins. Thanks to Arnout Vandecapelle
   for doing the final polishing on those patches.

 - The ext2 filesystem image creation logic has been changed to use
   mkfs.ext2/3/4 from e2fsprogs, rather than our mke2img wrapper +
   genext2fs. This allows to directly generate ext4 images, benefit
   from automated optimal block size calculation, and more.

   Thanks to Samuel Martin, who picked up the patches from Yann
   E. Morin and S?bastien Szymanski, merged them together, and did the
   final polishing.

 - A major rework of the gettext handling has been made. We now rely
   on uClibc-ng stub libintl implementation, which allows to avoid the
   need for building gettext if you don't need internationalization. A
   BR2_SYSTEM_ENABLE_NLS option has been added to enable Native
   Language Support, which is disabled by default.

   This also allows to avoid lots of static linking issues with
   libintl, and many libintl related workarounds have already been
   removed from the tree. Indeed, we no longer support providing
   internationalization in static linking configurations.

   This was done by Thomas Petazzoni, with lots of input and
   discussion from Arnout Vandecappelle.

 - The $(HOST_DIR)/usr has been removed, and everything moved one
   level up into $(HOST_DIR). We have kept a $(HOST_DIR)/usr symbolic
   link pointing to $(HOST_DIR) to preserve backward compatibility.

   This was all done by Arnout Vandecappelle.

 - We have merged a few patches from Yann E. Morin preparing the way
   for improvements in systemd support. Yann patches create a
   ifupdown-scripts package to contain the ifupdown related files,
   instead of having them in the skeleton. They also fix a number of
   issues with timezone handling.

 - Peter Korsgaard has handled a number of security updates, and
   published the maintenance releases 2017.02.4 and 2017.05.1.

 - Obviously, many, many package updates have been merged.

Here are the highlights of other topics being worked on and/or
discussed, but that haven't been completed/merged yet:

 - Maxime Hadjinlian has worked on a patch series reworking the
   download logic, with two goals:

    1. Store the downloaded files in per-package sub-folders under
       $(DL_DIR). Instead of having all downloaded files in a flat
       directory, they would be stored in $(DL_DIR)/<package>/. This
       will avoid collisions if two packages download a file of the
       same name.

    2. Implement Git caching, to avoid re-cloning entire Git
       repositories when just the version of a package has
       changed. The idea is that when fetching from Git, we keep a
       bare repository in $(DL_DIR)/<package>/git/, and use it
       whenever new downloads of the same package are needed, even for
       different versions. This will greatly speed up the download of
       large packages like the Linux kernel, as it won't re-clone the
       entire Git repository each time the version changes.

   Maxime has sent one iteration of the patches on the mailing list,
   but more work is needed to polish them.

 - Yann E. Morin has worked on his patch series to split the skeleton
   package into different packages depending on the init system
   (busybox, sysv, systemd) and his support for using systemd on a
   read-only filesystem.

   Yann had already sent such a work on the mailing list a while
   ago. Hopefully, with the work done during the last days, a new
   iteration will be available soon.

 - Romain Naour has worked on LLVM/Clang support, in order to support
   llvm-pipe in Mesa, as well as OpenCL. He has posted his patches for
   review and comments on the mailing list, as there are some
   non-trivial remaining issues.

 - Discussion about the libressl integration and libssl/ssl virtual
   package has occured. We have decide to simply add libssl as a
   regular standalone package, with a "depends on
   !BR2_PACKAGE_OPENSSL". Packages that want to use OpenSSL or
   LibreSSL will have to explicitly support both. Depending on the
   results, we will see later if a virtual package is useful or not.

 - While not present at the hackaton, Wolfgang Grandegger has worked
   very hard on improving the reuse of the toolchain as a relocatable
   SDK. This work has tow main components. The first is to rewrite the
   binaries so they refer to their dynamic libraries as a relative
   path.  This is done with the fix-rpath script and the patchelf
   program. The other part is a script that should be run when the
   toolchain is moved to a different location, to update all the text
   files (e.g. .pc files).  This series is already in its 7th
   iteration but is not yet entirely ready.

We have also discussed the next Buildroot Developers meeting, which
traditionally takes place around the Embedded Linux Conference
Europe. Since this year ELCE takes place from Monday 23 to Wednesday
25 of October, the Buildroot Developers meeting will take place on
Saturday 21 and Sunday 22 of October. We will send a separate e-mail
about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

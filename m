From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 13:02:53 +0100
Subject: [Buildroot] Per-package breaks -reconfigure, -rebuild, -reinstall
Message-ID: <20191212130253.2cb543ba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

After working a bit with per-package enabled builds, I realized that
the current implementation breaks our -reconfigure, -rebuild and
-reinstall targets.

Let me explain the situation. Package "zulu" has a make-level dependency
on package "host-pkgconf". You do a build with both host-pkgconf and
zulu. host-pkgconf gets installed in
output/per-package/host-pkgconf/host, and then when zulu is built, the
host-pkgconf installation is rsync'ed into
output/per-package/zulu/host. In the host-finalize step, we create
output/host by rsync'ing output/per-package/host-pkgconf/host into
output/host, and then output/per-package/zulu/host into output/host.

Everything is fine, the result is correct, we're happy.

Now, I make some dummy change in output/build/host-pkgconf-<version>/,
and issue "make host-pkgconf-rebuild all".

What happens is:

 (1) host-pkgconf gets rebuilt

 (2) host-pkgconf gets reinstalled in
     output/per-package/host-pkgconf/host

 (3) host-finalize rsync output/per-package/host-pkgconf/host and
     output/per-package/zulu/host into output/host.

At the end, what we have in output/host is the old version of
host-pkgconf, which comes from output/per-package/zulu/host, and not
the new one with my change, which is only in
output/per-package/host-pkgconf/host/.

This clearly breaks the current semantic of the -reconfigure, -rebuild
and -reinstall targets.

The question is how to we solve this ?

During the last Buildroot Developers meeting, we discussed that instead
of accumulating dependencies of package A *and* installing package A in
the same per-package folder, it should perhaps be split, like:

  output/per-package/foo/host-dependencies <- where we rsync the dependencies
  output/per-package/foo/host <- where we install foo

(and ditto for target, of course)

This would allow the final rsync to create the global target and global
host directories to only copy from each per-package directory what was
installed by this package.

I see two ways of implementing this:

 (1) During the configure and build steps, HOST_DIR points to
     $(PER_PACKAGE_DIR)/pkg/host-dependencies and TARGET_DIR to
     $(PER_PACKAGE_DIR)/pkg/target-dependencies. Then then during the
     installation steps, HOST_DIR points to $(PER_PACKAGE_DIR)/pkg/host
     and TARGET_DIR to $(PER_PACKAGE_DIR)/pkg/target. The drawback that
     I see is that I'm sure some package do some funky stuff in their
     install step, and if the target or host folder is empty things
     will go wrong.

 (2) Keep the logic as it is today, but using the "installed file list"
     logic to extract from $(PER_PACKAGE_DIR)/pkg/{host,target} was has
     really been installed by *that* package specifically.

What do you think ? Do you have other ideas or suggestions ?

Thomas

-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

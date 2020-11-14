From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 10:57:06 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/slirp: security
 bump to version 4.3.1
Message-ID: <20201114101646.213BA83493@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ddc01ee308de2a56d1c2f18f107073772f6213c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

- Use an up to date fork (spice slirp is archived and has not been
  updated since 2012)
- Add COPYRIGHT as the license file
- BSD-4-Clause has been replaced by BSD-3-Clause since
  https://gitlab.freedesktop.org/slirp/libslirp/-/commit/3bac39137a652b24b89d5b9e2a39600619fbe1d3
  https://gitlab.freedesktop.org/slirp/libslirp/-/commit/f9f6e69c4e1d9a43af30bfe791b31789ffa04954
- Add hash file
- Switch to meson-package
- Fix multiple security vulnerabilities: CVE-2014-3640, CVE-2017-11434,
  CVE-2019-6778, CVE-2019-9824, CVE-2019-14378 and CVE-2020-10756

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 97fcae8ddf71b02402225ed1b3d0e3d5ea367ed5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/slirp/Config.in  | 17 ++++++-----------
 package/slirp/slirp.hash |  3 +++
 package/slirp/slirp.mk   | 20 +++++++-------------
 3 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/package/slirp/Config.in b/package/slirp/Config.in
index 51dea9700f..8f57c4fa6a 100644
--- a/package/slirp/Config.in
+++ b/package/slirp/Config.in
@@ -1,16 +1,10 @@
 config BR2_PACKAGE_SLIRP
 	bool "slirp"
 	help
-	  The Spice project aims to provide a complete open source
-	  solution for interaction with virtualized desktop devices.
-	  The Spice project deals with both the virtualized devices
-	  and the front-end. Interaction between front-end and
-	  back-end is done using VD-Interfaces.
+	  libslirp is a user-mode networking library used by virtual
+	  machines, containers or various tools.
 
-	  This package implements the slirp-part for Spice. Slirp
-	  emulates a PPP or SLIP connection over a normal terminal.
-
-	  http://www.spice-space.org/
+	  https://gitlab.freedesktop.org/slirp/libslirp/
 
 	  NOTE:
 	  This package has some history of a unique kind:
@@ -21,5 +15,6 @@ config BR2_PACKAGE_SLIRP
 	    - during that period, QEMU (Fabrice BELLARD) forked the code
 	      and included it in QEMU
 	    - and it was imported from this breed by the Spice project
-	      around May 2009
-	    - which is what we use here
+	      around May 2009 which archived it in 2012
+	    - So we switched to
+	      https://gitlab.freedesktop.org/slirp/libslirp
diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
new file mode 100644
index 0000000000..3051179df9
--- /dev/null
+++ b/package/slirp/slirp.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  6b1641f04d41bc45f94018ac8d42d3c9f3ba0e463cbeacf5f26fe83fc050161e  libslirp-v4.3.1.tar.bz2
+sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 7cfead65e2..4351818952 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -4,18 +4,12 @@
 #
 ################################################################################
 
-# There's no tarball releases of slirp, so we use the git repo
-# Also, there's no tag, so we use a random SHA1 (master's HEAD
-# of today)
-SLIRP_VERSION = 8c2da74c1385242f20799fec8c04f8378edc6550
-SLIRP_SITE = git://anongit.freedesktop.org/spice/slirp
-SLIRP_LICENSE = BSD-4-Clause, BSD-2-Clause
-# Note: The license file 'COPYRIGHT' is missing from the sources,
-# although some files refer to it.
+SLIRP_VERSION = 4.3.1
+SLIRP_SOURCE = libslirp-v$(SLIRP_VERSION).tar.bz2
+SLIRP_SITE = \
+	https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$(SLIRP_VERSION)
+SLIRP_LICENSE = BSD-3-Clause
+SLIRP_LICENSE_FILES = COPYRIGHT
 SLIRP_INSTALL_STAGING = YES
 
-# As we're using the git tree, there's no ./configure,
-# so we need to autoreconf.
-SLIRP_AUTORECONF = YES
-
-$(eval $(autotools-package))
+$(eval $(meson-package))

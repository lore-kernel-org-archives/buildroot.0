From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 11:30:29 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] dropbear: fix build with
 non-SSP capable toolchain
Message-ID: <20180827093022.D17708E7F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dccaff8e82d40e0da90decf7ddc7e626232a0937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

By default, Dropbear's configure script enables hardening
flags. Unfortunately, the check for SSP only uses AC_COMPILE_IFELSE(),
and therefore doesn't properly test for the availability of libssp,
visible only at link time.

In addition, Buildroot passes its own hardening flags, depending on
various global options. So, we simply disable hardening flags in
Dropbear.

This fixes a build failure with non-SSP capable toolchains happening
since the bump to 2018.76.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b0aafef6198ee292c4f426295e92cc9b601c2338)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 236f9b4762..10cb99b5e4 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -12,6 +12,11 @@ DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 
+# Disable hardening flags added by dropbear configure.ac, and let
+# Buildroot add them when the relevant options are enabled. This
+# prevents dropbear from using SSP support when not available.
+DROPBEAR_CONF_OPTS = --disable-harden
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
 # Build dbclient, and create a convenience symlink named ssh
 DROPBEAR_PROGRAMS += dbclient

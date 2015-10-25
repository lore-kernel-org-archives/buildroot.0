From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 23:15:30 +0100
Subject: [Buildroot] [git commit] openpgm: bump to version release-5-2-122
Message-ID: <20151025222031.0236381801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16a6b5c2a8477390de75ae576477760738ae9cbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the same time perform a GitHub migration, since Google Code will
disappear soon.

- Bump to version release-5-2-122
- Switch to GitHub
- Remove trailing slash from OPENPGM_SUBDIR
- Remove unnecessary python dependencies
- Add a hook to create the missing m4 directory, needed to autoreconf
- Add a hash file
- Rewrap the help text to 72 characters length
- Change the project URL

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openpgm/Config.in    |   13 +++++++------
 package/openpgm/openpgm.hash |    2 ++
 package/openpgm/openpgm.mk   |   17 ++++++++++++-----
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
index 3e90422..d541d13 100644
--- a/package/openpgm/Config.in
+++ b/package/openpgm/Config.in
@@ -6,13 +6,14 @@ config BR2_PACKAGE_OPENPGM
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
-	  OpenPGM is an open source implementation of the Pragmatic General
-	  Multicast (PGM) specification in RFC 3208 available at www.ietf.org.
-	  PGM is a reliable and scalable multicast protocol that enables
-	  receivers to detect loss, request retransmission of lost data, or
-	  notify an application of unrecoverable loss.
+	  OpenPGM is an open source implementation of the Pragmatic
+	  General Multicast (PGM) specification in RFC 3208 available at
+	  www.ietf.org. PGM is a reliable and scalable multicast
+	  protocol that enables receivers to detect loss, request
+	  retransmission of lost data, or notify an application of
+	  unrecoverable loss.
 
-	  http://code.google.com/p/openpgm/
+	  https://github.com/steve-o/openpgm/
 
 comment "openpgm needs a toolchain w/ wchar, threads"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
diff --git a/package/openpgm/openpgm.hash b/package/openpgm/openpgm.hash
new file mode 100644
index 0000000..f20e02a
--- /dev/null
+++ b/package/openpgm/openpgm.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ecd48fd0bcfd8351ce6dcf31b063dd8fe83d3dab41bca62a6ebd6880a88c4a69  openpgm-release-5-2-122.tar.gz
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index d54e8eb..42b0a5d 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -4,15 +4,22 @@
 #
 ################################################################################
 
-OPENPGM_VERSION = 5.1.118~dfsg
-OPENPGM_SOURCE = libpgm-$(OPENPGM_VERSION).tar.gz
-OPENPGM_SITE = http://openpgm.googlecode.com/files
+OPENPGM_VERSION = release-5-2-122
+OPENPGM_SITE = $(call github,steve-o,openpgm,$(OPENPGM_VERSION))
 OPENPGM_LICENSE = LGPLv2.1+
 OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
 OPENPGM_INSTALL_STAGING = YES
+OPENPGM_SUBDIR = openpgm/pgm
 OPENPGM_AUTORECONF = YES
-OPENPGM_SUBDIR = openpgm/pgm/
-OPENPGM_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+
+# We need to create the m4 directory to make sure that autoreconf will
+# start calling libtoolize. Otherwise it will start with aclocal and it
+# will fail because the m4 directory doesn't exist.
+define OPENPGM_CREATE_M4_DIR
+	mkdir -p $(@D)/$(OPENPGM_SUBDIR)/m4
+endef
+OPENPGM_POST_PATCH_HOOKS += OPENPGM_CREATE_M4_DIR
+
 OPENPGM_CONF_ENV = \
 	ac_cv_file__proc_cpuinfo=yes \
 	ac_cv_file__dev_rtc=no \

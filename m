From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 23:10:49 +0100
Subject: [Buildroot] [git commit] package/libdvbcsa: New package
Message-ID: <20141027221340.0C05EB1AF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f3481268c97e231632547a85c02a02df2d584de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/libdvbcsa/Config.in      |    9 +++++++++
 package/libdvbcsa/libdvbcsa.hash |    4 ++++
 package/libdvbcsa/libdvbcsa.mk   |   31 +++++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4f16a39..8be24f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -756,6 +756,7 @@ endmenu
 menu "Multimedia"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
+	source "package/libdvbcsa/Config.in"
 	source "package/libdvbsi/Config.in"
 	source "package/libdvdnav/Config.in"
 	source "package/libdvdread/Config.in"
diff --git a/package/libdvbcsa/Config.in b/package/libdvbcsa/Config.in
new file mode 100644
index 0000000..dd7dc15
--- /dev/null
+++ b/package/libdvbcsa/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBDVBCSA
+	bool "libdvbcsa"
+	help
+	  libdvbcsa is a free implementation of the DVB Common Scrambling
+	  Algorithm - DVB/CSA - with encryption and decryption capabilities
+
+	  As libdvbcsa implements a standard, it is completely legal to use it.
+
+	  http://www.videolan.org/developers/libdvbcsa.html
diff --git a/package/libdvbcsa/libdvbcsa.hash b/package/libdvbcsa/libdvbcsa.hash
new file mode 100644
index 0000000..d8360e6
--- /dev/null
+++ b/package/libdvbcsa/libdvbcsa.hash
@@ -0,0 +1,4 @@
+# From http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha256
+sha256	4db78af5cdb2641dfb1136fe3531960a477c9e3e3b6ba19a2754d046af3f456d	libdvbcsa-1.1.0.tar.gz
+# From http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha1
+sha1	5f4640a7e93ae6494f24a881414e5c343f803365				libdvbcsa-1.1.0.tar.gz
diff --git a/package/libdvbcsa/libdvbcsa.mk b/package/libdvbcsa/libdvbcsa.mk
new file mode 100644
index 0000000..ef1d957
--- /dev/null
+++ b/package/libdvbcsa/libdvbcsa.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libdvbcsa
+#
+################################################################################
+
+LIBDVBCSA_VERSION = 1.1.0
+LIBDVBCSA_SITE = http://download.videolan.org/pub/videolan/libdvbcsa/$(LIBDVBCSA_VERSION)
+LIBDVBCSA_LICENSE = GPLv2+
+LIBDVBCSA_LICENSE_FILES = COPYING
+LIBDVBCSA_INSTALL_STAGING = YES
+
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+LIBDVBCSA_CONF_OPTS += --enable-mmx
+else
+LIBDVBCSA_CONF_OPTS += --disable-mmx
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+LIBDVBCSA_CONF_OPTS += --enable-sse2
+else
+LIBDVBCSA_CONF_OPTS += --disable-sse2
+endif
+
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
+LIBDVBCSA_CONF_OPTS += --enable-altivec
+else
+LIBDVBCSA_CONF_OPTS += --disable-altivec
+endif
+
+$(eval $(autotools-package))

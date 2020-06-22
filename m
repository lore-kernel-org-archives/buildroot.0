From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Mon, 22 Jun 2020 12:53:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: new package
Message-ID: <20200622105359.31340-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libnids is a C based networking library,
part of networking intrusion detection tools.
It can watch network traffic & provide informations.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---

Hello guys, things to note about this lib

   + glic & glib2 are the main dependencies, libnet & libpcap
   also required, the proposed selections should take care
   of everything

   + running ./configure as is, leads to an internal makefile
   pointing to host /usr env (I don't know why). Therefore
   possibly pointing to host libpcap & libnet. I work this out
   by forcing 'prefix' & 'exec_prefix' variables with a
   LIBNIDS_CONF_OPTS. Maybe someone more knowledgeable will have
   an input

   + More info here: http://libnids.sourceforge.net/

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libnids/Config.in    | 19 +++++++++++++++++++
 package/libnids/libnids.hash |  3 +++
 package/libnids/libnids.mk   | 17 +++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/libnids/Config.in
 create mode 100644 package/libnids/libnids.hash
 create mode 100644 package/libnids/libnids.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dc9fa8a718..fb6d4cec64 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1053,6 +1053,7 @@ F:	package/c-icap-modules/
 F:	package/sdl2/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
+F:	package/libnids/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
diff --git a/package/Config.in b/package/Config.in
index dc24921e0f..e2bb004015 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1710,6 +1710,7 @@ menu "Networking"
 	source "package/libnfnetlink/Config.in"
 	source "package/libnftnl/Config.in"
 	source "package/libnice/Config.in"
+	source "package/libnids/Config.in"
 	source "package/libnl/Config.in"
 	source "package/liboauth/Config.in"
 	source "package/liboping/Config.in"
diff --git a/package/libnids/Config.in b/package/libnids/Config.in
new file mode 100644
index 0000000000..ba3beee7f2
--- /dev/null
+++ b/package/libnids/Config.in
@@ -0,0 +1,19 @@
+comment "libnids requires a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_LIBNIDS
+	bool "libnids"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBNET
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Libnids is an implementation of an E-component
+	  of Network Intrusion Detection System.
+	  libnids watches all local network traffic,
+	  and provides convenient information on them to
+	  perform further analysis.
+	  Libnids offers IP defragmentation,
+	  TCP stream assembly, TCP port scan detection.
+
+	  http://libnids.sourceforge.net/
diff --git a/package/libnids/libnids.hash b/package/libnids/libnids.hash
new file mode 100644
index 0000000000..4a2949c39d
--- /dev/null
+++ b/package/libnids/libnids.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 314b4793e0902fbf1fdb7fb659af37a3c1306ed1aad5d1c84de6c931b351d359  libnids-1.24.tar.gz
+sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
new file mode 100644
index 0000000000..5e83aade33
--- /dev/null
+++ b/package/libnids/libnids.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libnids
+#
+################################################################################
+
+LIBNIDS_VERSION = 1.24
+LIBNIDS_SITE = https://sourceforge.net/projects/libnids/files/libnids/$(LIBNIDS_VERSION)
+LIBNIDS_LICENSE = GPL-2.0
+LIBNIDS_LICENSE_FILES = COPYING
+LIBNIDS_INSTALL_STAGING = YES
+
+LIBNIDS_CONF_OPTS += \
+	prefix="$(STAGING_DIR)/usr" \
+	exec_prefix="$(STAGING_DIR)/usr"
+
+$(eval $(autotools-package))
-- 
2.20.1

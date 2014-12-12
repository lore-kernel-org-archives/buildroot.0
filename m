From: Thierry Bultel <tbultel@free.fr>
Date: Fri, 12 Dec 2014 22:24:39 +0100
Subject: [Buildroot] [PATCH v3 1/2] Added mpd-mpc, mpc client to mpd
Message-ID: <1418419480-7570-1-git-send-email-tbultel@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---

Changes v2 -> v3
  - dependency to host-pkgconf (noticed by J?rg Krause)
  - optional dependency to libiconv
  - configure environnement for C99 compiler

Changes v1 -> v2
  - No needed dependency to mpd (suggested by Thomas)
  - Added hash and license information

Signed-off-by: Thierry Bultel <tbultel@free.fr>
---
 package/Config.in            |  1 +
 package/mpd-mpc/Config.in    |  7 +++++++
 package/mpd-mpc/mpd-mpc.hash |  2 ++
 package/mpd-mpc/mpd-mpc.mk   | 23 +++++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/mpd-mpc/Config.in
 create mode 100644 package/mpd-mpc/mpd-mpc.hash
 create mode 100644 package/mpd-mpc/mpd-mpc.mk

diff --git a/package/Config.in b/package/Config.in
index dd3a46e..74ac5b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -19,6 +19,7 @@ menu "Audio and video applications"
 	source "package/madplay/Config.in"
 	source "package/modplugtools/Config.in"
 	source "package/mpd/Config.in"
+	source "package/mpd-mpc/Config.in"
 	source "package/mpg123/Config.in"
 	source "package/mplayer/Config.in"
 	source "package/musepack/Config.in"
diff --git a/package/mpd-mpc/Config.in b/package/mpd-mpc/Config.in
new file mode 100644
index 0000000..1debc83
--- /dev/null
+++ b/package/mpd-mpc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MPD_MPC
+	bool "mpd-mpc"
+	select BR2_PACKAGE_LIBMPDCLIENT
+	help
+	  A minimalist command line interface to MPD.
+
+	  http://www.musicpd.org/clients/mpc/
diff --git a/package/mpd-mpc/mpd-mpc.hash b/package/mpd-mpc/mpd-mpc.hash
new file mode 100644
index 0000000..d1fa7b1
--- /dev/null
+++ b/package/mpd-mpc/mpd-mpc.hash
@@ -0,0 +1,2 @@
+# No upstream hashes for the following:
+sha1 dd1577cfff1d8324bc27c97fb26d88b845118800  mpc-0.26.tar.xz
diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
new file mode 100644
index 0000000..70eab69
--- /dev/null
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# mpd-mpc
+#
+################################################################################
+
+MPD_MPC_VERSION_MAJOR = 0
+MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).26
+MPD_MPC_SITE = http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
+MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
+MPD_MPC_LICENSE = GPLv2+
+MPD_MPC_LICENSE_FILES = COPYING
+MPD_MPC_DEPENDENCIES = host-pkgconf libmpdclient
+MPD_MPC_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MPD_MPC_DEPENDENCIES += libiconv
+MPD_MPC_CONF_OPTS += --enable-iconv
+else
+MPD_MPC_CONF_OPTS += --disable-iconv
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1

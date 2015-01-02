From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 17:05:31 +0100
Subject: [Buildroot] [git commit] mpd-mpc: new package
Message-ID: <20150102160717.8634B80D94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f2367f416baa3e146f0ac8355bd7dacdcdec74d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Changed hash file to use SHA256
 - Remove libiconv handling, since the iconv detection in mpc is
   broken: if it's not available in the C library, it expects to find
   iconv() in libintl (from gettext). But it's actually libiconv that
   provides iconv() for non-locale capable uClibc toolchains. But
   since anyway the package builds fine without iconv() support and
   properly detects when it's available, don't bother with this.]

Signed-off-by: Thierry Bultel <tbultel@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/mpd-mpc/Config.in    |    7 +++++++
 package/mpd-mpc/mpd-mpc.hash |    2 ++
 package/mpd-mpc/mpd-mpc.mk   |   16 ++++++++++++++++
 4 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2def872..1abcaa8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -20,6 +20,7 @@ menu "Audio and video applications"
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
index 0000000..4f348d5
--- /dev/null
+++ b/package/mpd-mpc/mpd-mpc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 20735f7173cce56bec50c1d8b4633751052dc68365b29a6113206dc1cdc6e242 mpc-0.26.tar.xz
diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
new file mode 100644
index 0000000..4e08c65
--- /dev/null
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -0,0 +1,16 @@
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
+$(eval $(autotools-package))

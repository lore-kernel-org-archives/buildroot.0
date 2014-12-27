From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:28:19 +0100
Subject: [Buildroot] [git commit] package/libxkbcommon: fix builds
	with/without X11
Message-ID: <20141227162826.1CA3B80464@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30fd52a727061a73eabea1b1665c24f5649017d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to explicitly disable X11 support when X11 is not available.
Conversely, when it is, we need to add the required dependencies.

Fixes a slew of autobuild failures:
    http://autobuild.buildroot.org/results/587/58794f894a4950b77e38d5fc877852d6cc507d8c/
    http://autobuild.buildroot.org/results/927/92741f6b9b7909b226c200e453ac6cee8af5abd6/
    http://autobuild.buildroot.org/results/51c/51cb09f7f267319948c685f905e29afe99f59589/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxkbcommon/Config.in       |    1 +
 package/libxkbcommon/libxkbcommon.mk |    7 +++++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
index 0a52c6f..4da1289 100644
--- a/package/libxkbcommon/Config.in
+++ b/package/libxkbcommon/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBXKBCOMMON
 	bool "libxkbcommon"
+	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	help
 	  xkbcommon is a keymap compiler and support library which
 	  processes a reduced subset of keymaps as defined by the XKB
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 2d30506..12d5f16 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -15,4 +15,11 @@ LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 # uses C99 features
 LIBXKBCOMMON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
+ifeq ($(BR2_PACKAGE_XORG7),y)
+LIBXKBCOMMON_CONF_OPTS += --enable-x11
+LIBXKBCOMMON_DEPENDENCIES += libxcb
+else
+LIBXKBCOMMON_CONF_OPTS += --disable-x11
+endif
+
 $(eval $(autotools-package))

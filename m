From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 20:53:56 +0200
Subject: [Buildroot] [git commit] vlc: select libvorbis when opus is also
	selected
Message-ID: <20140414185513.265AD9C03F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34df9c717a0132310e3770a37e70637649ca5847
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_PACKAGE_OPUS is selected then vlc will be built with support for
opus passing "--enable-opus" option to the configure script. But when
the configure script checks for the opus library it also checks for the
ogg library at the same time, so if only opus has been installed and not
ogg, then it will fail with an error message like this one:

checking for OPUS... no
configure: error: Library ogg opus needed for opus was not found

Fixes:
   http://autobuild.buildroot.net/results/4da/4da8e7cfb35c351e5d623835118512248d331d16/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/Config.in |    1 +
 package/vlc/vlc.mk    |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index b7c6088..cdb0d16 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_VLC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
 	help
 	  VLC is a free and open source cross-platform multimedia player
 	  and framework that plays most multimedia files as well as DVD,
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index a9ee620..bcb592c 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -127,7 +127,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPUS),y)
 VLC_CONF_OPT += --enable-opus
-VLC_DEPENDENCIES += opus
+VLC_DEPENDENCIES += libvorbis opus
 else
 VLC_CONF_OPT += --disable-opus
 endif

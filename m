From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 14:25:28 +0200
Subject: [Buildroot] [git commit] package/tvheadend: add option to enable
 IPTV support
Message-ID: <20210404120102.064EE7FA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=428277b03ef67dfd5c947770f38c3d4569ad6eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some IPTV streams will need ffmpef, the command line tool), while some
won't, so we just suggest that to the user in the help text.

There were two alternatives, but neither were very convincing:
  - always enforce that ffmpeg is enabled
  - only enforce ffmpeg to be enabled when the package is already
    enabled

In either case, that may cary the ffmpeg tool when it really is not
needed. So leave it to the user to decide whether they want it or not.

tvheadend now has a bunch of options, so make it a sub-menu.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr:
  - do not forcibly enable ffmpeg-the-commandline-tool
  - one option per-commit
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tvheadend/Config.in    | 14 +++++++++++++-
 package/tvheadend/tvheadend.mk |  6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index cc42f8b4cd..da6dce50f3 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -3,7 +3,7 @@ comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
-config BR2_PACKAGE_TVHEADEND
+menuconfig BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on !BR2_STATIC_LIBS # dladdr()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -34,6 +34,18 @@ config BR2_PACKAGE_TVHEADEND_DESCRAMBLER
 	help
 	  Enable support for various descrambler modules.
 
+config BR2_PACKAGE_TVHEADEND_IPTV
+	bool "IPTV support"
+	default y
+	help
+	  Enable IPTV support.
+
+	  Note that some IPTV streams will need to be piped through
+	  ffmpeg (the commandline tool), so you may have to enable it
+	  with:
+	    BR2_PACKAGE_FFMPEG=y
+	    BR2_PACKAGE_FFMPEG_FFMPEG=y
+
 config BR2_PACKAGE_TVHEADEND_SATIP
 	bool "SAT>IP support"
 	default y
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index dd963f2e94..b694c44e3b 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -79,6 +79,12 @@ TVHEADEND_CONF_OPTS += \
 	--disable-constcw
 endif
 
+ifeq ($(BR2_PACKAGE_TVHEADEND_IPTV),y)
+TVHEADEND_CONF_OPTS += --enable-iptv
+else
+TVHEADEND_CONF_OPTS += --disable-iptv
+endif
+
 ifeq ($(BR2_PACKAGE_TVHEADEND_SATIP),y)
 TVHEADEND_CONF_OPTS += --enable-satip_client --enable-satip_server
 else

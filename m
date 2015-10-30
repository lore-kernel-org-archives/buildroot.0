From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Oct 2015 16:43:40 +0100
Subject: [Buildroot] [PATCH 1/4] package/dvblast: needs iconv always
In-Reply-To: <cover.1446219805.git.yann.morin.1998@free.fr>
References: <cover.1446219805.git.yann.morin.1998@free.fr>
Message-ID: <64a273c2431ecee72e0e7084dc4edee8850bb5d8.1446219805.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dvblast wants iconv functions even without locales.

Fixes:
    http://autobuild.buildroot.org/results/03f/03fe6dc17d7f36d9b8c7ced402850def95d8feb3/
    http://autobuild.buildroot.org/results/064/0647b0180ac9a6bf6172742e388df9a9e584d91b/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julian Scheel <julian@jusst.de>
---
 package/dvblast/Config.in  |  1 +
 package/dvblast/dvblast.mk | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index ac8b4ae..da78943 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DVBLAST
 	bool "dvblast"
 	select BR2_PACKAGE_BITSTREAM
 	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on !BR2_bfin  # libev
 	help
 	  DVBlast is a simple and powerful MPEG-2/TS demux and
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
index 11a2dc8..ef9a666 100644
--- a/package/dvblast/dvblast.mk
+++ b/package/dvblast/dvblast.mk
@@ -11,12 +11,19 @@ DVBLAST_LICENSE = GPLv2+, WTFPL
 DVBLAST_LICENSE_FILES = COPYING COPYING.WTFPL
 DVBLAST_DEPENDENCIES = bitstream libev
 
+DVBLAST_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+DVBLAST_DEPENDENCIES += libiconv
+DVBLAST_MAKE_ENV += LDLIBS=-liconv
+endif
+
 define DVBLAST_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(DVBLAST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define DVBLAST_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+	$(DVBLAST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
 endef
 
 $(eval $(generic-package))
-- 
1.9.1

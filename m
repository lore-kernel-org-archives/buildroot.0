From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  1 Mar 2016 14:20:55 +0200
Subject: [Buildroot] [PATCH] slang: fix static link with ncurses
Message-ID: <4aa51349a8c68f15bfc5ba169eeea9c6e9959128.1456834855.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

slang does forgets ncurses that is a dependency of readline when linking the
slsh binary. Correct this.

While at it, also make sure to use staging ncurses5-config script and not the
host one.

Fixes:
http://autobuild.buildroot.net/results/1dc/1dc52048254c32a24070fef1c1039cebb32e7ac1/
http://autobuild.buildroot.net/results/c17/c176511cbb147c2d8cb0ec0ff3c1612ce8971cb8/
http://autobuild.buildroot.net/results/78d/78dc2ba07b1d7f888aab94e223f3e0b1a1df3af5/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/slang/slang.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 1a7576afc363..464d92065112 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -40,6 +40,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 SLANG_DEPENDENCIES += ncurses
+SLANG_CONF_ENV += ac_cv_path_nc5config=$(STAGING_DIR)/usr/bin/ncurses5-config
+ifeq ($(BR2_STATIC_LIBS),y)
+SLANG_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs ncurses`"
+endif
 else
 SLANG_CONF_OPTS += ac_cv_path_nc5config=no
 endif
-- 
2.7.0

From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Dec 2013 11:07:31 +0200
Subject: [Buildroot] [PATCH 3/3] civetweb: fix build for xtensa
In-Reply-To: <cover.1388480526.git.baruch@tkos.co.il>
References: <cover.1388480526.git.baruch@tkos.co.il>
Message-ID: <1814fee0803c17a20ca8304e689fdd3c448cfc15.1388480526.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The civetweb package bundled sqlite3 generates an object that is too large for
the xtensa default placement of literals in a dedicated section. Use
-mtext-section-literal to place literals in the text section.

Fixes
http://autobuild.buildroot.net/results/d14/d142f3ce17ab22cc39f9117c114318c1b5cadfc5/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/civetweb/civetweb.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 4c8f4e8..b950890 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -25,6 +25,9 @@ endif
 
 ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
 	CIVETWEB_CONF_OPT += WITH_LUA=1
+ifeq ($(BR2_xtensa),y)
+	CIVETWEB_COPT += -mtext-section-literals
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
1.8.5.2

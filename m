From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 19 Apr 2016 21:15:44 +0300
Subject: [Buildroot] [PATCH 1/3] c-icap: avoid host library search path
Message-ID: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

c-icap adds link time -rpath ${exec_prefix}/lib which defaults to /usr/lib.
This adds host libraries to the search path which is bad for cross
compilation. Direct make exec_prefix variable to staging instead.

Fixes:
http://autobuild.buildroot.net/results/077/077374329b2782dbb4b4a9ee7af264cdda311ccc/
http://autobuild.buildroot.net/results/057/057a88179150a4f02990d7b9b0d8f2de3c9da1a3/
http://autobuild.buildroot.net/results/da6/da62b80989df6b8f1b5557b4987d7a6999d30bb8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/c-icap/c-icap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index b4defb87379a..40926ea8e5d8 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -17,6 +17,7 @@ C_ICAP_CONF_OPTS = \
 	--without-perl \
 	--enable-large-files \
 	--enable-ipv6
+C_ICAP_MAKE_OPTS = exec_prefix=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 C_ICAP_CONF_OPTS += --with-berkeleydb
-- 
2.8.0.rc3

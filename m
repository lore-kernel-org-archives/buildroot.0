From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Sun, 25 Oct 2015 11:52:53 +0200
Subject: [Buildroot] [PATCH 1/1] boost.mk: allow building both static and
	shared
Message-ID: <1445766773-19279-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

Use BR2_SHARED_STATIC_LIBS for building both static and shared boost libs.
The static libs are copied to the staging directory. Only the shared libs are
copied to the rootfs image.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/boost/boost.mk |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 8159ed5..40a030b 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -90,8 +90,14 @@ BOOST_OPTS += toolset=gcc \
 	     threading=multi \
 	     abi=$(BOOST_ABI) \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-	     link=$(if $(BR2_STATIC_LIBS),static,shared) \
-	     runtime-link=$(if $(BR2_STATIC_LIBS),static,shared)
+
+ifeq ($(BR2_STATIC_LIBS),y)
+BOOST_OPTS += link=static runtime-link=static
+else ifeq ($(BR2_SHARED_LIBS),y)
+BOOST_OPTS += link=shared runtime-link=shared
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+# no additional BOOST_OPTS
+endif
 
 ifeq ($(BR2_PACKAGE_BOOST_LOCALE),y)
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
1.7.9.5

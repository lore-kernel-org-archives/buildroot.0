From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2015 07:28:09 +0100
Subject: [Buildroot] [git commit] boost.mk: allow building both static and
	shared
Message-ID: <20151026062836.5B10481D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=239f54c2feb06b7c0807135d1f27715ccb0a9d34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use BR2_SHARED_STATIC_LIBS for building both static and shared boost libs.
The static libs are copied to the staging directory. Only the shared libs are
copied to the rootfs image.

[Thomas:
 - remove empty else clause, and instead add a comment that explains
   why we're doing something only for the BR2_STATIC_LIBS=y and
   BR2_SHARED_LIBS=y.
 - remove trailing backslash at the end of the BOOST_CONF_OPTS
   definition.]

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/boost.mk |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 8159ed5..16d05cd 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -89,9 +89,15 @@ endif
 BOOST_OPTS += toolset=gcc \
 	     threading=multi \
 	     abi=$(BOOST_ABI) \
-	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-	     link=$(if $(BR2_STATIC_LIBS),static,shared) \
-	     runtime-link=$(if $(BR2_STATIC_LIBS),static,shared)
+	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release)
+
+# By default, Boost build and installs both the shared and static
+# variants. Override that if we want static only or shared only.
+ifeq ($(BR2_STATIC_LIBS),y)
+BOOST_OPTS += link=static runtime-link=static
+else ifeq ($(BR2_SHARED_LIBS),y)
+BOOST_OPTS += link=shared runtime-link=shared
+endif
 
 ifeq ($(BR2_PACKAGE_BOOST_LOCALE),y)
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)

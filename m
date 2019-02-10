From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 12:45:28 +0100
Subject: [Buildroot] [PATCH 12/12] package/mongodb: add libcurl optional
 dependency
In-Reply-To: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210114528.1753-12-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/mongodb.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index b63010426d..e420ecb41d 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -30,7 +30,6 @@ MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
 
 MONGODB_SCONS_OPTS = \
 	--disable-warnings-as-errors \
-	--enable-free-mon=off \
 	--use-system-boost \
 	--use-system-pcre \
 	--use-system-snappy \
@@ -59,6 +58,13 @@ else
 MONGODB_SCONS_OPTS += --js-engine=none --allocator=system
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+MONGODB_DEPENDENCIES += libcurl
+MONGODB_SCONS_OPTS += --enable-free-mon=on
+else
+MONGODB_SCONS_OPTS += --enable-free-mon=off
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGODB_DEPENDENCIES += openssl
 MONGODB_SCONS_OPTS += \
-- 
2.14.1

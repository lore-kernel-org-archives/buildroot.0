From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 19:07:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: Replace work-around to
	fix gcc-4.7 compile error
Message-ID: <1413738477-4079-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/beecrypt/beecrypt-0004-gcc-4.7.patch |   19 +++++++++++++++++++
 package/beecrypt/beecrypt.mk                 |    6 ------
 2 files changed, 19 insertions(+), 6 deletions(-)
 create mode 100644 package/beecrypt/beecrypt-0004-gcc-4.7.patch

diff --git a/package/beecrypt/beecrypt-0004-gcc-4.7.patch b/package/beecrypt/beecrypt-0004-gcc-4.7.patch
new file mode 100644
index 0000000..767f789
--- /dev/null
+++ b/package/beecrypt/beecrypt-0004-gcc-4.7.patch
@@ -0,0 +1,19 @@
+Really fixes gcc-4.7 related compile error:
+../../include/beecrypt/c++/util/AbstractSet.h:59:27: error: 'containsAll' was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
+
+Downloaded from upstream bugtracker:
+http://sourceforge.net/p/beecrypt/patches/10/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/include/beecrypt/c++/util/AbstractSet.h
++++ b/include/beecrypt/c++/util/AbstractSet.h
+@@ -56,7 +56,7 @@
+ 					if (c->size() != size())
+ 						return false;
+ 
+-					return containsAll(*c);
++					return this->containsAll(*c);
+ 				}
+ 				return false;
+ 			}
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index e9e701b..7d2ee08 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -11,12 +11,6 @@ BEECRYPT_INSTALL_STAGING = YES
 BEECRYPT_LICENSE = LGPLv2.1+
 BEECRYPT_LICENSE_FILES = COPYING.LIB
 
-# beecrypt contains C++ code that g++ 4.7 doesn't really
-# like. Upstream does not seem to be really active, so workaround this
-# by passing -fpermissive.
-BEECRYPT_CONF_ENV = \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -fpermissive"
-
 BEECRYPT_CONF_OPTS = \
 		--disable-expert-mode \
 		--without-java \
-- 
1.7.10.4

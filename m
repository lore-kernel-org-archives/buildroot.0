From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] webkit: bump to version 1.2.5
Message-ID: <20101222232250.A9B1A8E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e4cce3732ce024cd0b7139ac3aeeaca9da6c7e0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...h => webkit-fix-build-issue-with-old-gtk.patch} |    0
 ...ch => webkit-fix-compilation-on-DirectFB.patch} |    0
 package/webkit/webkit-fix-pool.patch               |   67 ++++++++++++++++++++
 ...tr_np.patch => webkit-pthread_getattr_np.patch} |    0
 package/webkit/webkit.mk                           |   10 +--
 5 files changed, 70 insertions(+), 7 deletions(-)
 rename package/webkit/{webkit-1.2.3-fix-build-issue-with-old-gtk.patch => webkit-fix-build-issue-with-old-gtk.patch} (100%)
 rename package/webkit/{webkit-1.2.3-fix-compilation-on-DirectFB.patch => webkit-fix-compilation-on-DirectFB.patch} (100%)
 create mode 100644 package/webkit/webkit-fix-pool.patch
 rename package/webkit/{webkit-1.2.3-pthread_getattr_np.patch => webkit-pthread_getattr_np.patch} (100%)

diff --git a/package/webkit/webkit-1.2.3-fix-build-issue-with-old-gtk.patch b/package/webkit/webkit-fix-build-issue-with-old-gtk.patch
similarity index 100%
rename from package/webkit/webkit-1.2.3-fix-build-issue-with-old-gtk.patch
rename to package/webkit/webkit-fix-build-issue-with-old-gtk.patch
diff --git a/package/webkit/webkit-1.2.3-fix-compilation-on-DirectFB.patch b/package/webkit/webkit-fix-compilation-on-DirectFB.patch
similarity index 100%
rename from package/webkit/webkit-1.2.3-fix-compilation-on-DirectFB.patch
rename to package/webkit/webkit-fix-compilation-on-DirectFB.patch
diff --git a/package/webkit/webkit-fix-pool.patch b/package/webkit/webkit-fix-pool.patch
new file mode 100644
index 0000000..5a66a82
--- /dev/null
+++ b/package/webkit/webkit-fix-pool.patch
@@ -0,0 +1,67 @@
+Description: Fixup pool and add sparc support
+Nixed from gentoo
+
+--- webkit-1.2.1.orig/JavaScriptCore/wtf/ListHashSet.h
++++ webkit-1.2.1/JavaScriptCore/wtf/ListHashSet.h
+@@ -127,7 +127,7 @@ namespace WTF {
+             : m_freeList(pool())
+             , m_isDoneWithInitialFreeList(false)
+         { 
+-            memset(m_pool.pool, 0, sizeof(m_pool.pool));
++            memset(m_pool, 0, sizeof(m_pool));
+         }
+ 
+         Node* allocate()
+@@ -171,7 +171,7 @@ namespace WTF {
+         }
+ 
+     private:
+-        Node* pool() { return reinterpret_cast<Node*>(m_pool.pool); }
++        Node* pool() { return reinterpret_cast<Node*>(m_pool); }
+         Node* pastPool() { return pool() + m_poolSize; }
+ 
+         bool inPool(Node* node)
+@@ -182,10 +182,7 @@ namespace WTF {
+         Node* m_freeList;
+         bool m_isDoneWithInitialFreeList;
+         static const size_t m_poolSize = 256;
+-        union {
+-            char pool[sizeof(Node) * m_poolSize];
+-            double forAlignment;
+-        } m_pool;
++        uint32_t m_pool[(sizeof(Node) * m_poolSize + sizeof(uint32_t) - 1) / sizeof(uint32_t)];
+     };
+ 
+     template<typename ValueArg> struct ListHashSetNode {
+--- webkit-1.2.1.orig/WebCore/platform/text/AtomicString.cpp
++++ webkit-1.2.1/WebCore/platform/text/AtomicString.cpp
+@@ -103,9 +103,9 @@ static inline bool equal(StringImpl* str
+     if (string->length() != length)
+         return false;
+ 
++#if CPU(ARM) || CPU(SPARC) || CPU(SH4)
+     // FIXME: perhaps we should have a more abstract macro that indicates when
+     // going 4 bytes at a time is unsafe
+-#if CPU(ARM) || CPU(SH4)
+     const UChar* stringCharacters = string->characters();
+     for (unsigned i = 0; i != length; ++i) {
+         if (*stringCharacters++ != *characters++)
+--- webkit-1.2.1.orig/WebCore/platform/text/StringHash.h
++++ webkit-1.2.1/WebCore/platform/text/StringHash.h
+@@ -54,13 +54,13 @@ namespace WebCore {
+ 
+             // FIXME: perhaps we should have a more abstract macro that indicates when
+             // going 4 bytes at a time is unsafe
+-#if CPU(ARM) || CPU(SH4)
++#if CPU(ARM) || CPU(SPARC) || CPU(SH4)
+             const UChar* aChars = a->characters();
+             const UChar* bChars = b->characters();
+-            for (unsigned i = 0; i != aLength; ++i) {
++            for (unsigned i = 0; i != aLength; ++i)
+                 if (*aChars++ != *bChars++)
+                     return false;
+-            }
++
+             return true;
+ #else
+             /* Do it 4-bytes-at-a-time on architectures where it's safe */
diff --git a/package/webkit/webkit-1.2.3-pthread_getattr_np.patch b/package/webkit/webkit-pthread_getattr_np.patch
similarity index 100%
rename from package/webkit/webkit-1.2.3-pthread_getattr_np.patch
rename to package/webkit/webkit-pthread_getattr_np.patch
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 3f4e8fe..7a5429c 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -3,16 +3,12 @@
 # webkit
 #
 #############################################################
-WEBKIT_VERSION = 1.2.3
-WEBKIT_SOURCE = webkit-$(WEBKIT_VERSION).tar.gz
-WEBKIT_SITE = http://www.webkitgtk.org
 
+WEBKIT_VERSION = 1.2.5
+WEBKIT_SITE = http://www.webkitgtk.org
 WEBKIT_INSTALL_STAGING = YES
-WEBKIT_LIBTOOL_PATCH = NO
-
-WEBKIT_DEPENDENCIES = host-flex host-gperf icu libcurl libxml2 libxslt	\
+WEBKIT_DEPENDENCIES = host-flex host-gperf icu libcurl libxml2 libxslt \
 			libgtk2 sqlite enchant libsoup jpeg libgail
-
 WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-- 
1.7.2.2

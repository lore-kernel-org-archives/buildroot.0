From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 May 2018 18:11:36 +0200
Subject: [Buildroot] [PATCH 1/1] libcap: only install shared version
Message-ID: <20180508161136.13531-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If BR2_SHARED_LIBS is set, only install shared version of library
(continue to build both libraries through all target as there is no
libcap.so target but only a libcap.so.$(VERSION).$(MINOR))

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap/libcap.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 48c2cb3456..247fd8a58f 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -20,8 +20,12 @@ LIBCAP_MAKE_TARGET = libcap.a libcap.pc
 LIBCAP_MAKE_INSTALL_TARGET = install-static
 else
 LIBCAP_MAKE_TARGET = all
+ifeq ($(BR2_SHARED_LIBS),y)
+LIBCAP_MAKE_INSTALL_TARGET = install-shared
+else
 LIBCAP_MAKE_INSTALL_TARGET = install
 endif
+endif
 
 LIBCAP_MAKE_FLAGS = \
 	BUILD_CC="$(HOSTCC)" \
-- 
2.14.1

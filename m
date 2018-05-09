From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  9 May 2018 10:43:05 +0200
Subject: [Buildroot] [PATCH v2,1/1] libcap: only install shared version
Message-ID: <20180509084305.18797-1-fontaine.fabrice@gmail.com>
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
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update to have a clearer approach

 package/libcap/libcap.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 48c2cb3456..a947fa0686 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -18,6 +18,9 @@ HOST_LIBCAP_DEPENDENCIES = host-gperf
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBCAP_MAKE_TARGET = libcap.a libcap.pc
 LIBCAP_MAKE_INSTALL_TARGET = install-static
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBCAP_MAKE_TARGET = all
+LIBCAP_MAKE_INSTALL_TARGET = install-shared
 else
 LIBCAP_MAKE_TARGET = all
 LIBCAP_MAKE_INSTALL_TARGET = install
-- 
2.14.1

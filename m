From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 21:58:33 +0200
Subject: [Buildroot] [PATCH 6/6] package/lldpd: add libcap optional
 dependency
In-Reply-To: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
References: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
Message-ID: <20190407195833.9275-6-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap optional dependency has been added in version 1.0.2 with
https://github.com/vincentbernat/lldpd/commit/f6933edaf2edea12ef72ef7c70958c2a617f6a1f

Also refactor check and valgrind optional dependencies to put them on a
single line

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lldpd/lldpd.mk | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 99de40d498..86c825c4e1 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -6,18 +6,15 @@
 
 LLDPD_VERSION = 1.0.3
 LLDPD_SITE = http://media.luffy.cx/files/lldpd
-LLDPD_DEPENDENCIES = host-pkgconf libevent
+LLDPD_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_CHECK),check) \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
+	libevent \
+	$(if $(BR2_PACKAGE_VALGRIND),valgrind)
 LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PACKAGE_CHECK),y)
-LLDPD_DEPENDENCIES += check
-endif
-
-ifeq ($(BR2_PACKAGE_VALGRIND),y)
-LLDPD_DEPENDENCIES += valgrind
-endif
-
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
 # WCHAR in toolchain. But actually we do not need WCHAR at lldpd
-- 
2.20.1

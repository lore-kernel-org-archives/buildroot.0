From: Yi Zheng <goodmenzy@gmail.com>
Date: Mon, 4 Nov 2019 21:58:50 +0800
Subject: [Buildroot] [PATCH] netsniff-ng: add libsodium/nacl dependency,
 to build curvetun tool
In-Reply-To: <CAMw6YJJa9Favw3SHoxukWD5R-nyLkXF_nT7=Ewv4T4v0h15F9w@mail.gmail.com>
References: <CAJPHfYPx=t_sWDGZ=U9FNmAZ7EHgG6wzpKfemvuTqrS2uXKsZA@mail.gmail.com>
 <CAMw6YJJa9Favw3SHoxukWD5R-nyLkXF_nT7=Ewv4T4v0h15F9w@mail.gmail.com>
Message-ID: <CAJPHfYNyXxcquSd_FQf4wD44Mz4p-Dj9LRjEJgNrLKb8Ss52_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tool 'curvetun' in netsniff-ng package can only be built
when NACL/Sodium lib is added.

Adjust the dependency and the configure environ settings to
build the curvetun tool.

Signed-off-by: Yi Zheng <goodmenzy@gmail.com>
---
 Makefile                           |  1 +
 package/netsniff-ng/Config.in      |  5 +++++
 package/netsniff-ng/netsniff-ng.mk | 13 ++++++++++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bab34ab9b5..e028a0dc60 100644
--- a/Makefile
+++ b/Makefile
@@ -1198,3 +1198,4 @@ include docs/manual/manual.mk
 .PHONY: $(noconfig_targets)

 endif #umask / $(CURDIR) / $(O)
+
diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 5d1407baac..9adae0510a 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -27,6 +27,11 @@ config BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN
 comment "mausezahn needs glibc or musl toolchain"
     depends on BR2_TOOLCHAIN_USES_UCLIBC

+config BR2_PACKAGE_NETSNIFF_NG_CURVETUN
+    bool "curvetun"
+    default y
+    select BR2_PACKAGE_LIBSODIUM
+
 endif

 comment "netsniff-ng needs a toolchain w/ threads, headers >= 3.0"
diff --git a/package/netsniff-ng/netsniff-ng.mk
b/package/netsniff-ng/netsniff-ng.mk
index 283ecaf245..b6b03403ad 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -9,11 +9,22 @@ NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
 NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
 NETSNIFF_NG_LICENSE = GPL-2.0
 NETSNIFF_NG_LICENSE_FILES = README COPYING
+
+NETSNIFF_NG_DEPENDENCIES = libnl libpcap libnetfilter_conntrack liburcu
+
+ifeq ($(BR2_PACKAGE_NETSNIFF_NG_CURVETUN),y)
+# Prevent netsniff-ng configure script from finding a host installed nacl
+NETSNIFF_NG_CONF_ENV = \
+    NACL_INC_DIR=$(STAGING_DIR)/usr/include/sodium \
+    NACL_LIB_DIR=$(STAGING_DIR)/lib \
+    NACL_LIB=sodium
+NETSNIFF_NG_DEPENDENCIES += libsodium
+else
 # Prevent netsniff-ng configure script from finding a host installed nacl
 NETSNIFF_NG_CONF_ENV = \
     NACL_INC_DIR=/dev/null \
     NACL_LIB_DIR=/dev/null
-NETSNIFF_NG_DEPENDENCIES = libnl libpcap libnetfilter_conntrack liburcu
+endif

 ifeq ($(BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN),y)
 NETSNIFF_NG_DEPENDENCIES += libcli libnet
-- 
2.23.0

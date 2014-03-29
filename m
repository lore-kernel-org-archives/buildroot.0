From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 11:33:49 +0100
Subject: [Buildroot] [git commit] libndp: new package
Message-ID: <20140329103417.82F539C3EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d07ad8026eaedc3fb01c94ac56791aeef3202f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add patch to add stdarg.h include needed on uClibc, add
missing upstream URL in Config.in, fix license to be LGPLv2.1+ instead
of LGPLv2.1]

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/libndp/Config.in                           |   12 ++++++++++++
 .../libndp/libndp-01-missing-stdarg-include.patch  |   16 ++++++++++++++++
 package/libndp/libndp.mk                           |   15 +++++++++++++++
 4 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ad75d9b..2fee0ef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -714,6 +714,7 @@ source "package/libmbus/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
+source "package/libndp/Config.in"
 source "package/libnetfilter_acct/Config.in"
 source "package/libnetfilter_conntrack/Config.in"
 source "package/libnetfilter_cthelper/Config.in"
diff --git a/package/libndp/Config.in b/package/libndp/Config.in
new file mode 100644
index 0000000..bb9093b
--- /dev/null
+++ b/package/libndp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBNDP
+	bool "libndp"
+	depends on BR2_INET_IPV6
+	help
+	  This package contains a library which provides a wrapper
+	  for IPv6 Neighbor Discovery Protocol. It also provides a tool
+	  named ndptool for sending and receiving NDP messages.
+
+	  https://github.com/jpirko/libndp
+
+comment "libndp needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/libndp/libndp-01-missing-stdarg-include.patch b/package/libndp/libndp-01-missing-stdarg-include.patch
new file mode 100644
index 0000000..e10848e
--- /dev/null
+++ b/package/libndp/libndp-01-missing-stdarg-include.patch
@@ -0,0 +1,16 @@
+Add missing <stdarg.h> include for va_list
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/include/ndp.h
+===================================================================
+--- a/include/ndp.h
++++ b/include/ndp.h
+@@ -20,6 +20,7 @@
+ #ifndef _NDP_H_
+ #define _NDP_H_
+ 
++#include <stdarg.h>
+ #include <stdbool.h>
+ #include <netinet/in.h>
+ 
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
new file mode 100644
index 0000000..55d172b
--- /dev/null
+++ b/package/libndp/libndp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libndp
+#
+################################################################################
+
+LIBNDP_VERSION = v1.2
+LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
+LIBNDP_LICENSE = LGPLv2.1+
+LIBNDP_LICENSE_FILES = COPYING
+LIBNDP_AUTORECONF = YES
+LIBNDP_INSTALL_STAGING = YES
+LIBNDP_CONF_OPT = --disable-debug
+
+$(eval $(autotools-package))

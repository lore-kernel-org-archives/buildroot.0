From: Laurent Charpentier <laurent_pubs@yahoo.com>
Date: Mon, 15 Jan 2018 13:54:34 +0100
Subject: [Buildroot] [PATCH v2 1/2] open-lldp: new package
Message-ID: <20180115125435.16464-1-laurent_pubs@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The lldpad package comes with utilities to manage an LLDP interface with
support for reading and configuring TLVs. TLVs and interfaces are individual
controlled allowing flexible configuration for TX only, RX only, or TX/RX
modes per TLV.

http://open-lldp.org/

Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 .../open-lldp/0001-lldpad-vdptool-getline.patch    | 10 +++++++++
 package/open-lldp/Config.in                        | 12 +++++++++++
 package/open-lldp/open-lldp.hash                   |  2 ++
 package/open-lldp/open-lldp.mk                     | 25 ++++++++++++++++++++++
 6 files changed, 53 insertions(+)
 create mode 100644 package/open-lldp/0001-lldpad-vdptool-getline.patch
 create mode 100644 package/open-lldp/Config.in
 create mode 100644 package/open-lldp/open-lldp.hash
 create mode 100644 package/open-lldp/open-lldp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bbe9d405c1..56dae14fb1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -929,6 +929,9 @@ F:	package/qt5/
 N:	Julien Floret <julien.floret@6wind.com>
 F:	package/lldpd/
 
+N:	Laurent Charpentier <laurent_pubs@yahoo.com>
+F:	package/open-lldp/
+
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
 F:	package/easy-rsa/
diff --git a/package/Config.in b/package/Config.in
index 01f4095be5..37e1e753e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1760,6 +1760,7 @@ endif
 	source "package/odhcp6c/Config.in"
 	source "package/odhcploc/Config.in"
 	source "package/olsr/Config.in"
+	source "package/open-lldp/Config.in"
 	source "package/open-plc-utils/Config.in"
 	source "package/openntpd/Config.in"
 	source "package/openobex/Config.in"
diff --git a/package/open-lldp/0001-lldpad-vdptool-getline.patch b/package/open-lldp/0001-lldpad-vdptool-getline.patch
new file mode 100644
index 0000000000..ac2e62ff16
--- /dev/null
+++ b/package/open-lldp/0001-lldpad-vdptool-getline.patch
@@ -0,0 +1,10 @@
+--- open-lldp-036e314/vdptool.c 2015-08-24 19:31:59.000000000 +0200
++++ open-lldp-036e314_patched/vdptool.c 2018-01-10 10:16:24.096431555 +0100
+@@ -36,6 +36,7 @@
+  * set and query VSI profile settings.
+  */
+
++#define _GNU_SOURCE
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <unistd.h>
diff --git a/package/open-lldp/Config.in b/package/open-lldp/Config.in
new file mode 100644
index 0000000000..79eefee71b
--- /dev/null
+++ b/package/open-lldp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_OPEN_LLDP
+	bool "open-lldp"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBCONFIG
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_READLINE
+	help
+	  This package contains the Linux user space daemon and
+	  configuration tool for Intel LLDP Agent with Enhanced Ethernet
+	  support for the Data Center.
+
+	  http://open-lldp.org/
diff --git a/package/open-lldp/open-lldp.hash b/package/open-lldp/open-lldp.hash
new file mode 100644
index 0000000000..6fef5b2999
--- /dev/null
+++ b/package/open-lldp/open-lldp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 217124f24ac57d3191ab33c53fccf5d7319e83f9029610be3c3cb71392480a2a  open-lldp-036e314.tar.gz
diff --git a/package/open-lldp/open-lldp.mk b/package/open-lldp/open-lldp.mk
new file mode 100644
index 0000000000..d062b6795b
--- /dev/null
+++ b/package/open-lldp/open-lldp.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# open-lldp
+#
+################################################################################
+
+OPEN_LLDP_VERSION = 036e314bd93602f7388262cc37faf8b626980af1
+OPEN_LLDP_SITE = git://open-lldp.org/open-lldp.git
+OPEN_LLDP_SITE_METHOD = git
+OPEN_LLDP_DEPENDENCIES = readline libnl libconfig
+OPEN_LLDP_LICENSE = GPL-2.0
+OPEN_LLDP_LICENSE_FILES = COPYING
+
+# Fetching from git, need to generate configure/Makefile.in
+OPEN_LLDP_AUTORECONF = YES
+
+# Run the bootstrap.sh command.
+# (from the 'lldpad Application Install' section of the README file)
+define OPEN_LLDP_BOOTSTRAP
+	(cd $(@D) && ./bootstrap.sh)
+endef
+
+OPEN_LLDP_PRE_CONFIGURE_HOOKS += OPEN_LLDP_BOOTSTRAP
+
+$(eval $(autotools-package))
-- 
2.14.3

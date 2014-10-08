From: David Bachelart <david.bachelart@bbright.com>
Date: Wed,  8 Oct 2014 17:00:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] ipmiutil: new package
In-Reply-To: <1412780403-11092-1-git-send-email-david.bachelart@bbright.com>
References: <1412780403-11092-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1412780403-11092-2-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in            |    1 +
 package/ipmiutil/Config.in   |   16 ++++++++++++++++
 package/ipmiutil/ipmiutil.mk |   15 +++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/ipmiutil/Config.in
 create mode 100644 package/ipmiutil/ipmiutil.mk

diff --git a/package/Config.in b/package/Config.in
index ea89c96..3fd3583 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -325,6 +325,7 @@ endif
 	source "package/intel-microcode/Config.in"
 	source "package/iostat/Config.in"
 	source "package/ipmitool/Config.in"
+	source "package/ipmiutil/Config.in"
 	source "package/irda-utils/Config.in"
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
diff --git a/package/ipmiutil/Config.in b/package/ipmiutil/Config.in
new file mode 100644
index 0000000..43ca244
--- /dev/null
+++ b/package/ipmiutil/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_IPMIUTIL
+	bool "ipmiutil"
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  The ipmiutil package provides easy-to-use utilities to view the SEL,
+	  perform an IPMI chassis reset, set up the IPMI LAN and Platform Event Filter
+	  entries to allow SNMP alerts, Serial-Over-LAN console, event daemon, and
+	  other IPMI tasks.
+
+	  http://ipmiutil.sourceforge.net/
+
+comment "ipmiutil needs a toolchain w/ ssp, mmu, threads"
+	depends on !BR2_TOOLCHAIN_HAS_SSP || !BR2_USE_MMU || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
new file mode 100644
index 0000000..739d5cb
--- /dev/null
+++ b/package/ipmiutil/ipmiutil.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# ipmiutil
+#
+################################################################################
+
+IPMIUTIL_VERSION = 2.9.4
+IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files/
+
+IPMIUTIL_DEPENDENCIES = openssl
+
+IPMIUTIL_LICENSE = BSD-2c
+IPMIUTIL_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4

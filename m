From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 20:33:18 +0200
Subject: [Buildroot] [PATCH 1/4] mpdecimal: new package
In-Reply-To: <1406140401-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1406140401-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1406140401-16997-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/mpdecimal/Config.in    | 10 ++++++++++
 package/mpdecimal/mpdecimal.mk | 24 ++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/mpdecimal/Config.in
 create mode 100644 package/mpdecimal/mpdecimal.mk

diff --git a/package/Config.in b/package/Config.in
index 703fd3d..f921b0a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -856,6 +856,7 @@ menu "Other"
 	source "package/linux-pam/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/mpc/Config.in"
+	source "package/mpdecimal/Config.in"
 	source "package/mpfr/Config.in"
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
diff --git a/package/mpdecimal/Config.in b/package/mpdecimal/Config.in
new file mode 100644
index 0000000..929d415
--- /dev/null
+++ b/package/mpdecimal/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MPDECIMAL
+	bool "mpdecimal"
+	help
+	  mpdecimal is a package for correctly-rounded arbitrary
+	  precision decimal floating point arithmetic. Starting from
+	  version 2.4, mpdecimal includes only the libmpdec
+	  library. Further mpdecimal development will focus
+	  exclusively on libmpdec.
+
+	  http://www.bytereef.org/mpdecimal/
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
new file mode 100644
index 0000000..cb028a5
--- /dev/null
+++ b/package/mpdecimal/mpdecimal.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# mpdecimal
+#
+################################################################################
+
+MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases/
+MPDECIMAL_VERSION = 2.4.0
+MPDECIMAL_INSTALL_STAGING = YES
+MPDECIMAL_LICENSE = BSD-2c
+MPDECIMAL_LICENSE_FILES = LICENSE.txt
+MPDECIMAL_CONF_OPT = LD="$(TARGET_CC)"
+
+# On i386, by default, mpdecimal tries to uses <fenv.h> which is not
+# available in musl/glibc. So in this case, we tell mpdecimal to use
+# the generic 32 bits code, which is anyway the one used on ARM,
+# PowerPC, etc.
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+ifeq ($(BR2_i386),y)
+MPDECIMAL_CONF_ENV += MACHINE=ansi32
+endif
+endif
+
+$(eval $(autotools-package))
-- 
2.0.0

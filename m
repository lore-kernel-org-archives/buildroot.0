From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 7 Apr 2017 07:58:12 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add choice for Cobalt/Mercury
	core
In-Reply-To: <20170406234139.31532-2-sikor6@gmail.com>
References: <20170406234139.31532-1-sikor6@gmail.com>
 <20170406234139.31532-2-sikor6@gmail.com>
Message-ID: <CAAXf6LWHf2vkyHZuq95mOCsApOte4cKc03aGYM27L_rfJA7fQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 7, 2017 12:42 AM, "Pawel Sikora" <sikor6@gmail.com> wrote:

Add an option choice for Cobalt or Mercury core
depending on option BR2_LINUX_KERNEL_EXT_XENOMAI.

With this option enabled and with appropriate patch
applied, default option will be Cobalt core.

With this option disabled, so in case of building
Xenomai userspace with the native Linux Kernel,
Mercury core will be used as default.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
---
 package/xenomai/Config.in  | 30 ++++++++++++++++++++++++++++++
 package/xenomai/xenomai.mk |  4 ++++
 2 files changed, 34 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index b548ee810..b8c9430f5 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -51,6 +51,36 @@ config BR2_PACKAGE_XENOMAI_VERSION
          BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
          Kernel -> Linux Kernel Extensions menu.

+choice
+       prompt "Xenomai core"
+       default BR2_PACKAGE_XENOMAI_MERCURY
+       help
+         Manually select the Xenomai core. Default option depends if
+         you selected BR2_LINUX_KERNEL_EXT_XENOMAI.
+         If yes, then default option will be Cobalt.
+         Otherwise you can use just the Mercury core with the
+         native Linux kernel.
+
+config BR2_PACKAGE_XENOMAI_MERCURY
+       bool "Mercury"
+       depends on !BR2_LINUX_KERNEL_EXT_XENOMAI
+       help
+         Select Mercury core for the Xenomai userspace.
+         If you want Cobalt core, you need to enable
+         BR2_LINUX_KERNEL_EXT_XENOMAI in the Linux Kernel ->
+         Linux Kernel Extensions menu.
+
+config BR2_PACKAGE_XENOMAI_COBALT
+       bool "Cobalt"
+       depends on BR2_LINUX_KERNEL_EXT_XENOMAI
+       help
+         Select Cobalt core for the Xenomai userspace.
+         If you want Mercury core, you need to disable
+         BR2_LINUX_KERNEL_EXT_XENOMAI in the Linux Kernel ->
+         Linux Kernel Extensions menu.
+
+endchoice
+
 config BR2_PACKAGE_XENOMAI_TESTSUITE
        bool "Install testsuite"
        help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index c9e810e05..dbb07eb33 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -23,6 +23,10 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR)
install-user

 XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/
--disable-doc-install

+ifeq ($(BR2_PACKAGE_XENOMAI_MERCURY),y)
+XENOMAI_CONF_OPTS += --with-core=mercury
+endif


Wouldn't it be clear to have an else here that explicitly sets core=cobalt
? Then we don't rely on the default of xenomai.

Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170407/14699286/attachment.html>

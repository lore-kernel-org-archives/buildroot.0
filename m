From: Clark Rawlins <clark.rawlins@escient.com>
Date: Fri, 28 Sep 2007 14:16:22 -0400
Subject: [Buildroot] Kernel Download Error with external toolchain
In-Reply-To: <20070928180849.GQ20951@aon.at>
References: <1190985506.17683.6.camel@venture.bit63.org>
	<20070928180849.GQ20951@aon.at>
Message-ID: <1191003382.6616.9.camel@venture.bit63.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2007-09-28 at 20:08 +0200, Bernhard Fischer wrote:
> On Fri, Sep 28, 2007 at 09:18:26AM -0400, Clark Rawlins wrote:
> >When attempting to build a fairly simple config including a kernel using
> >an external toolchain I am getting the following error:
> >
> >http://www.kernel.org/pub/linux/kernel/v2.6//linux-...tar.bz2
> 
> Index: target/linux/Config.in
> ===================================================================
> --- target/linux/Config.in	(revision 20084)
> +++ target/linux/Config.in	(working copy)
> @@ -15,7 +15,6 @@ config BR2_PACKAGE_LINUX
>  config BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG
>  	bool "linux kernel experimental configuration"
>  	depends on BR2_PACKAGE_LINUX
> -	depends on BR2_TARGET_ATMEL
>  	default n
>  	help
>  	  More advanced configuration (in development)
> 
> Another thing that is hidden behind some odd ATMEL symbol. What was the
> reasoning for hiding this one, too?

Alas,

I saw this earlier as well and attempted the same change you made but
with the same result end result.

(snip)
wget --passive-ftp -nd  -P /home/crawlins/src/br-trunk/dl
http://www.kernel.org/pub/linux/kernel/v2.6//linux-...tar.bz2
--14:10:41--
http://www.kernel.org/pub/linux/kernel/v2.6//linux-...tar.bz2
           => `/home/crawlins/src/br-trunk/dl/linux-...tar.bz2'
Resolving www.kernel.org... 204.152.191.37, 204.152.191.5
Connecting to www.kernel.org|204.152.191.37|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
14:10:42 ERROR 404: Not Found.

make: *** [/home/crawlins/src/br-trunk/dl/linux-...tar.bz2] Error 1


Here is the diff between my previous config and the config after
removing the depends on BR2_TARGET_ATMEL line as noted above. I took the
defaults except to ask that the kernel get copied to my rootfs instead
of somewhere else.


--- buildroot.config	2007-09-28 14:12:58.090882697 -0400
+++ .config	2007-09-28 14:10:34.576202778 -0400
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Sep 28 09:00:42 2007
+# Fri Sep 28 14:10:34 2007
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -490,5 +490,46 @@
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX=y
 # BR2_KERNEL_HURD is not set
+BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG=y
 BR2_PACKAGE_LINUX_KCONFIG="config-2.6.21"
-BR2_PACKAGE_LINUX_FORMAT="bzImage"
+BR2_PACKAGE_LINUX_FORMAT="uImage"
+# BR2_LINUX_2_6_SNAP is not set
+# BR2_LINUX_2_6_MM is not set
+# BR2_LINUX_2_6_STABLE is not set
+BR2_LINUX_2_6_22_1=y
+# BR2_LINUX_2_6_22 is not set
+# BR2_LINUX_2_6_21_6 is not set
+# BR2_LINUX_2_6_21_1 is not set
+# BR2_LINUX_2_6_21 is not set
+# BR2_LINUX_2_6_20_4 is not set
+# BR2_LINUX_2_6_20 is not set
+# BR2_LINUX_2_6_19_2 is not set
+# BR2_LINUX_2_6_19 is not set
+# BR2_LINUX_2_6_18 is not set
+# BR2_LINUX_2_6_17 is not set
+# BR2_LINUX_2_6_16 is not set
+# BR2_LINUX_2_6_15 is not set
+# BR2_LINUX_2_6_23 is not set
+# BR2_LINUX_CUSTOM is not set
+
+#
+# Patches
+#
+BR2_LINUX_BSP_PATCH=""
+BR2_DOWNLOAD_LINUX26_VERSION="2.6.22.1"
+BR2_LINUX26_VERSION="2.6.22.1"
+BR2_LINUX26_RC_PATCH=""
+BR2_PACKAGE_LINUX_USE_KCONFIG=y
+# BR2_LINUX26_DEFCONFIG is not set
+# BR2_LINUX_CUSTOMIZE is not set
+# BR2_LINUX_BIN_BZIMAGE is not set
+BR2_LINUX_BIN_UIMAGE=y
+# BR2_LINUX_BIN_VMLINUX is not set
+# BR2_LINUX_BIN_ZIMAGE is not set
+# BR2_LINUX_BIN_CUSTOM is not set
+
+#
+# Destinations for linux kernel binaries
+#
+BR2_LINUX_IN_ROOTFS=y
+# BR2_LINUX_COPY is not set

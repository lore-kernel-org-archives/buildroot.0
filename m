From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Dec 2016 20:10:06 +0100
Subject: [Buildroot] [PATCH v4] usbip: new package
In-Reply-To: <20161223182451.GB3592@free.fr>
References: <20161213175356.GB3546@free.fr>
 <1481736504-12256-1-git-send-email-tal.shorer@gmail.com>
 <20161223182451.GB3592@free.fr>
Message-ID: <20161223191006.GC3592@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2016-12-23 19:24 +0100, Yann E. MORIN spake thusly:
> On 2016-12-14 19:28 +0200, Tal Shorer spake thusly:
> > add the usbip package from the kernel source, allowing users to share
> > usb devices over a network connection
> 
> So, I finally had time to test this. I'm sad to report that it does not
> work... :-(
[--SNIP--]
> I've stopped here, I started another build with a more recent toolchain
> with more recent kernel headers. I'll further report when the build is
> finished...

OK, so I was able to eventually build it with those changes:

diff --git a/package/usbip/Config.in b/package/usbip/Config.in
index bb92a05..d12839a 100644
--- a/package/usbip/Config.in
+++ b/package/usbip/Config.in
@@ -4,11 +4,13 @@ config BR2_PACKAGE_USBIP
 	bool "usbip"
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # usbutils <- libusb
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_	17
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_USBUTILS
 	help
 	  usbip is a set of tools that allows machines to share their
 	  usb devices over the network, to be driven by a remote client.
 
-comment "usbip needs udev /dev management and toolchain w/ threads"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
+comment "usbip needs udev /dev management and a toolchain w/ threads, dynamic library, headers >= 3.17"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
index 7c8e244..43d0466 100644
--- a/package/usbip/usbip.mk
+++ b/package/usbip/usbip.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-# No USBIP_SITE, no USB_VERSION, we vampirise the code from the
+# No USBIP_SITE, no USBIP_VERSION, we vampirise the code from the
 # linux kernel
-USBIP_PATCH_DEPENDENCIES = linux
-USBIP_DEPENDENCIES = udev
+USBIP_DEPENDENCIES = udev linux
 
+USBIP_AUTORECONF = YES
 USBIP_CONF_OPTS = --without-tcp-wrappers
 
 USBIP_SRC_DIR = $(wildcard \


(not sure if the patch did not get mangled when I copy-pasted it.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

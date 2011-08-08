From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 08 Aug 2011 16:55:25 +0200
Subject: [Buildroot] Adding libev to buildroot
In-Reply-To: <4E3FE254.7030004@roth-itk.de>
References: <4E3E72BF.9040302@roth-itk.de>
 <CAGm1_ktR=-TywrmxLORcmG3Hch1=RsqDusL9y+UmJKt6=gT30A@mail.gmail.com>
 <4E3F79CF.40608@roth-itk.de>
 <CAGm1_ktqDGmoRtbWuN8uDM3qiL00K+kS-VbyVcDV3p9sqav9Jg@mail.gmail.com>
 <4E3FE254.7030004@roth-itk.de>
Message-ID: <4E3FF8DD.6070507@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernhard,

> I did a patch according to Linus' description.
> I hope this works and describes clearly the changes I did.
> 
> Just today I was recompiling a new root filesystem and libev works just like a charm!
> Keep your good work going, thank you!

Thank you for the patch. Some remarks below:

1. the patches should be sent "inline", so it is easier to comment on them
2. your' Signed-off-by is still missing (see other patches on the list)
3. don't use :=, use = instead
4. this is autotools based package, so following template should be used http://buildroot.uclibc.org/buildroot.html#autotools-tutorial

I've reworked your patch. So please execute "make clean" or remove all files installed by installation of libev and test it with reworked patch.

Yegor

---
 package/Config.in       |    1 +
 package/libev/Config.in |    6 ++++++
 package/libev/libev.mk  |   11 +++++++++++
 3 files changed, 18 insertions(+)

Index: b/package/Config.in
===================================================================
--- a/package/Config.in
+++ b/package/Config.in
@@ -341,6 +341,7 @@
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
+source "package/libev/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/libnspr/Config.in"
Index: b/package/libev/Config.in
===================================================================
--- /dev/null
+++ b/package/libev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBEV
+	bool "libev"
+	help
+	  Userspace library for handling asynchronous notifications
+
+	  http://software.schmorp.de/pkg/libev.html
Index: b/package/libev/libev.mk
===================================================================
--- /dev/null
+++ b/package/libev/libev.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libev
+#
+#############################################################
+LIBEV_VERSION = 4.04
+LIBEV_SOURCE = libev-$(LIBEV_VERSION).tar.gz
+LIBEV_SITE = http://dist.schmorp.de/libev/
+LIBEV_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libev))

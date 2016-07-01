From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  1 Jul 2016 18:03:33 +0200
Subject: [Buildroot] [PATCH] package/linux-headers: do not default to any
	version for custom headers
Message-ID: <1467389013-24303-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, for a custom headers version, or for the same headers as the
kernel, wedefault to a "very old" version (i.e. 2.6.x in practice).

However, as Vivien explained, when using the same headers as the kernel,
and the kernel is set to use the default version (aka latest version
known to Buildroot) of the kernel, one would expect the headers are
automatically tracking the latest version. Off course, that expectation
is broken because of the above.

However, whatever version we default to, it will probably not be
correct, whether we default to the latest version or to the "very old"
version.

So, simply drop the specific default version, so the default is now the
latest version.

Note: that has the potential to break existing defconfig files that
relied on the "very old" version to be the default. Well, whatever,
they'll get a build failre quite early, and it is easy to fix.

Reported-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1def30c..930acc1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -106,7 +106,6 @@ config BR2_DEFAULT_KERNEL_VERSION
 choice
 	bool "Custom kernel headers series"
 	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL
-	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
 	help
 	  Specify the kernel headers series you manually selected, above.
 
-- 
2.7.4

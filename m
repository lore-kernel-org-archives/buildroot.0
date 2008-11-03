From: hartleys <hartleys@visionengravers.com>
Date: Mon, 3 Nov 2008 16:09:10 -0500
Subject: [Buildroot] svn commit: trunk/buildroot:
	toolchaintoolchain/external-toolchain
In-Reply-To: <20081103101839.6021A3C915@busybox.net>
References: <20081103101839.6021A3C915@busybox.net>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C91694@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, November 03, 2008 3:19 AM, jacmet at uclibc.org wrote:
> Date: 2008-11-03 02:18:39 -0800 (Mon, 03 Nov 2008) New Revision: 23908
> 
> Log:
> External toolchain support improvements
>
> Improve external toolchain support
>
> * Do not put kernel-headers in the dependencies of BASE_TARGETS in
>   the case where BR2_TOOLCHAIN_SOURCE is not y. The kernel headers
>   are already supposed to be part of the external toolchain, so
>   there's no need to download, extract and install them.
>
> * In the configuration system, don't display the kernel headers
>   version selection list when an external toolchain is selected. This
>   is implemented by moving the source
>   "toolchain/kernel-headers/Config.in" inside the if
>   BR2_TOOLCHAIN_SOURCE in toolchain/Config.in.2.

With these two patches I can no longer build kernel 2.6.27.3 using an
external 4.1.1-920t toolchain.

I know I should just build a new toolchain with buildroot but I have
never been able to successfully get one working. That step I just do not
get.....

Removing the following two patches fixes the problem. Any other
solution?

Thanks,
Hartley

<snip>

Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-11-03 06:16:36 UTC (rev 23907)
+++ trunk/buildroot/Makefile	2008-11-03 10:18:39 UTC (rev 23908)
@@ -202,7 +202,7 @@
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 BASE_TARGETS:=uclibc-configured binutils cross_compiler
uclibc-target-utils kernel-headers
 else
-BASE_TARGETS:=uclibc kernel-headers
+BASE_TARGETS:=uclibc
 endif
 TARGETS:=
 

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2008-11-03 06:16:36 UTC
(rev 23907)
+++ trunk/buildroot/toolchain/Config.in.2	2008-11-03 10:18:39 UTC
(rev 23908)
@@ -1,8 +1,7 @@
 #
 
-source "toolchain/kernel-headers/Config.in"
-
 if BR2_TOOLCHAIN_SOURCE
+source "toolchain/kernel-headers/Config.in"
 source "toolchain/uClibc/Config.in"
 source "toolchain/binutils/Config.in"
 source "toolchain/gcc/Config.in"

From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 14:43:25 +0200
Subject: [Buildroot] [PATCH v2] uboot-tools: bump to version 2014.04
In-Reply-To: <1398684231-8957-1-git-send-email-abrodkin@synopsys.com>
References: <1398684231-8957-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <535E4CED.6000806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/14 13:23, Alexey Brodkin wrote:
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

 v1 had a much better commit message.


> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
> Changes compared to v1:
> 
>  * Fixed building of U-Boot tools for the target
>  * Properly set compiler and linker flags in case of cross-compilation
> 
>  .../uboot-tools-01-drop-configh-from-tools.patch   | 32 +++++-----------------
>  .../uboot-tools-02-hostcflags-override-fix.patch   | 29 --------------------
>  package/uboot-tools/uboot-tools.mk                 | 19 ++++++++-----
>  3 files changed, 19 insertions(+), 61 deletions(-)
>  delete mode 100644 package/uboot-tools/uboot-tools-02-hostcflags-override-fix.patch
> 
> diff --git a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
> index 21995ec..6466287 100644
> --- a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
> +++ b/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
> @@ -1,14 +1,9 @@
> -We need to build u-boot tools without a board configuration for the target.
> -fw_env just uses config.h to define the default environment of the created
> -image, so it really isn't mandatory.
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 No need to drop this commit log...

 I also don't really like this patch to begin with, because sometimes I
_do_ need fw_setenv to be able to generate a default environment. But
that, of course, would be a separate patch.

> -
> -diff -Nura u-boot-2013.01.orig/tools/env/fw_env.h u-boot-2013.01/tools/env/fw_env.h
> ---- u-boot-2013.01.orig/tools/env/fw_env.h	2013-01-19 07:50:53.879241660 -0300
> -+++ u-boot-2013.01/tools/env/fw_env.h	2013-01-19 07:58:11.897903403 -0300
> -@@ -21,15 +21,6 @@
> -  * MA 02111-1307 USA
> +diff --git a/tools/env/fw_env.h b/tools/env/fw_env.h
> +index aff471b..dfe7439 100644
> +--- a/tools/env/fw_env.h
> ++++ b/tools/env/fw_env.h
> +@@ -5,14 +5,6 @@
> +  * SPDX-License-Identifier:	GPL-2.0+
>    */
>   
>  -/* Pull in the current config to define the default environment */
> @@ -19,19 +14,6 @@ diff -Nura u-boot-2013.01.orig/tools/env/fw_env.h u-boot-2013.01/tools/env/fw_en
>  -#else
>  -#include <config.h>
>  -#endif
> --
> + 

 Useless change.

>   /*
>    * To build the utility with the static configuration
> -  * comment out the next line.
> -diff -Nura u-boot-2013.01.orig/tools/env/Makefile u-boot-2013.01/tools/env/Makefile
> ---- u-boot-2013.01.orig/tools/env/Makefile	2013-01-19 07:50:53.879241660 -0300
> -+++ u-boot-2013.01/tools/env/Makefile	2013-01-19 07:59:34.926486346 -0300
> -@@ -26,7 +26,7 @@
> - HOSTSRCS := $(SRCTREE)/lib/crc32.c  fw_env.c  fw_env_main.c
> - HOSTSRCS += $(SRCTREE)/lib/ctype.c $(SRCTREE)/lib/linux_string.c
> - HOSTSRCS += $(SRCTREE)/common/env_attr.c $(SRCTREE)/common/env_flags.c
> --HEADERS	:= fw_env.h $(OBJTREE)/include/config.h
> -+HEADERS	:= fw_env.h
> - 
> - # Compile for a hosted environment on the target
> - HOSTCPPFLAGS  = -idirafter $(SRCTREE)/include \


 Otherwise, looks good to me.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

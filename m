From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 May 2014 22:57:56 +0200
Subject: [Buildroot] [PATCH 4 of 7] toolchain/toolchain-buildroot:
 migrate to virtual package infrastructure
In-Reply-To: <4a84f87803add852946f.1399822728@argentina>
References: <patchbomb.1399822724@argentina>
 <4a84f87803add852946f.1399822728@argentina>
Message-ID: <20140511205756.GH3428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-05-11 17:38 +0200, Thomas De Schampheleire spake thusly:
> This patch migrates the toolchain and toolchain-buildroot packages to the
> virtual package infrastructure, 

For a true conversion to the virtual package infra, it should have been
using these variables:
    BR2_$(PACKAGE)_HAS_TOOLCHAIN
    BR2_$(PACKAGE)_PROVIDES_TOOLCHAIN

But I guess in this case it is a bit far-fetched and over-reaching...

graph-depends is still happy, so am I. ;-)

> causing the log messages to change from:
> 
> >>> toolchain undefined Downloading
> >>> toolchain undefined Extracting
> ...
> 
> to
> 
> >>> toolchain virtual Downloading
> >>> toolchain virtual Extracting
> ...
> 
> and similar for 'toolchain-buildroot', simply because it looks nicer.
> 
> At the same time, the directory names also become toolchain-virtual,
> toolchain-buildroot-virtual instead of the corresponding 'undefined'
> variants.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

AS previously, when the prior preceding patches have been applied (or
reworked):

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2:
> - use virtual-package infrastructure instead of explicitly defining VERSION
> - exclude toolchain-external from this patch
> 
>  toolchain/toolchain-buildroot/toolchain-buildroot.mk |  4 +---
>  toolchain/toolchain/toolchain.mk                     |  4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> --- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> +++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> @@ -4,8 +4,6 @@
>  #
>  ################################################################################
>  
> -TOOLCHAIN_BUILDROOT_SOURCE =
> -
>  BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
>  
>  # Triggering the build of the host-gcc-final will automatically do the
> @@ -16,4 +14,4 @@ TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-
>  
>  TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
> -$(eval $(generic-package))
> +$(eval $(virtual-package))
> diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
> --- a/toolchain/toolchain/toolchain.mk
> +++ b/toolchain/toolchain/toolchain.mk
> @@ -4,8 +4,6 @@
>  #
>  ################################################################################
>  
> -TOOLCHAIN_SOURCE =
> -
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>  TOOLCHAIN_DEPENDENCIES += toolchain-buildroot
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> @@ -14,6 +12,6 @@ endif
>  
>  TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
> -$(eval $(generic-package))
> +$(eval $(virtual-package))
>  
>  toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

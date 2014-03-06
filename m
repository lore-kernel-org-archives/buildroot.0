From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Mar 2014 00:17:25 +0100
Subject: [Buildroot] [PATCH 1/1] [V4] toolchain: control vendor part in
 GNU_TARGET_NAME
In-Reply-To: <884EA965490E3C4D8E66AEF41E980250096191@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E980250096191@ezex10.ezchip.com>
Message-ID: <20140306231725.GA32126@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noam, All,

On 2014-03-06 11:25 +0000, Noam Camus spake thusly:
> This option allows to customize the "vendor" part of the toolchain tuple, where the toolchain tuple has the form <arch>-<vendor>-<os>-<libc>. Use this option in situations where gcc might make different decisions based on the vendor part of the tuple.

Overly-long line, please wrap at <80 chars.

(Or maybe your mailer is broken?)

> Signed-off-by: Noam Camus <noamc@ezchip.com>
> ---
>  package/Makefile.in                     |   17 ++++++++++++++++-
>  toolchain/toolchain-buildroot/Config.in |   16 ++++++++++++++++
>  2 files changed, 32 insertions(+), 1 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in index 454f614..bd9f18c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -20,8 +20,23 @@ endif
>  MAKE1:=$(HOSTMAKE) -j1
>  MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
>  
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> +TARGET_VENDOR = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
> +else
> +TARGET_VENDOR = buildroot
> +endif
> +
> +# Sanity checks
> +ifeq ($(TARGET_VENDOR),)
> +$(error BR2_TOOLCHAIN_BUILDROOT_VENDOR is not allowed to be empty) 
> +endif ifeq ($(TARGET_VENDOR),unknown) $(error 
> +BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
> +        It might be confused with the native toolchain) endif

Highly broken.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 17:08:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/dmalloc: unconditionally set
 -fPIC
In-Reply-To: <20210514212602.2274195-1-fontaine.fabrice@gmail.com>
References: <20210514212602.2274195-1-fontaine.fabrice@gmail.com>
Message-ID: <20210515150859.GN2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-14 23:26 +0200, Fabrice Fontaine spake thusly:
> Unconditionally set -fPIC to avoid the following build failure which is
> raised since commit 19ec872f169a851b48ba04d22432b7c0939847d4:
> 
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/or1k-linux-ld -shared --whole-archive -soname libdmallocxx.so -o libdmallocxx.so.t libdmallocxx.a
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/or1k-linux-ld: libdmallocxx.a(arg_check.o): non-pic relocation against symbol _dmalloc_flags
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/or1k-linux-ld: libdmallocxx.a(arg_check.o): non-pic relocation against symbol _dmalloc_flags
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/or1k-linux-ld: libdmallocxx.a(arg_check.o): pc-relative relocation against dynamic symbol dmalloc_verify_pnt
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/62c9c6aebca60649bd6f635125507bf10d63fc05

I don't think this is the correct fix.

Indeed, that build has BR2_STATIC_LIBS=y so we are supposed to only
build static libs, not shared ones.

Yet, dmalloc is attempting a shared build;
    /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/or1k-linux-ld
    -shared --whole-archive -soname libdmallocxx.so -o libdmallocxx.so.t
    libdmallocxx.a

That's because we have an unconditional:
    DMALLOC_CONF_OPTS = --enable-shlib

which I guess should be changed to being conditional to !BR2_STATIC_LIBS

Care to look into that, please?

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dmalloc/dmalloc.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
> index 638fe0fcda..8300cc7f19 100644
> --- a/package/dmalloc/dmalloc.mk
> +++ b/package/dmalloc/dmalloc.mk
> @@ -14,11 +14,7 @@ DMALLOC_LICENSE_FILES = dmalloc.h.1
>  
>  DMALLOC_INSTALL_STAGING = YES
>  DMALLOC_CONF_OPTS = --enable-shlib
> -DMALLOC_CFLAGS = $(TARGET_CFLAGS)
> -
> -ifeq ($(BR2_STATIC_LIBS),)
> -DMALLOC_CFLAGS += -fPIC
> -endif
> +DMALLOC_CFLAGS = $(TARGET_CFLAGS) -fPIC
>  
>  ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>  DMALLOC_CONF_OPTS += --enable-cxx
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

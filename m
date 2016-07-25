From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jul 2016 23:52:58 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
 HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <20160725195227.21112-1-draeman@bbn.com>
References: <20160725195227.21112-1-draeman@bbn.com>
Message-ID: <20160725215258.GE5958@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2016-07-25 15:52 -0400, David Raeman spake thusly:
> HOST_CFLAGS includes a search path for HOST_DIR/usr/include using -I.  When
> HOST_CFLAGS is used by a package, these flags are passed to the compiler ahead
> of flags passed by the package's internal make system.  If a package has a
> header file with the same name as a header file in HOST_DIR, this causes the
> toolchain to prefer the file from the system include directory because its -I
> appears first on the command line.  I believe conflicts should prefer the file
                                     ^^^
Please, no personal messages like this. Use alternate, neutral
sentences, maybe something like:

    In such a case, the package-provided file should take precedence
    over any system-installed header.

> provided by the package.  This can be accomplished by using -isystem, which is
> more appropriate then -I for system-level include paths.
> 
> Real-world example: I need libfdt present in my HOST_DIR to install a patched
> version of QEMU.  Meanwhile, the u-boot package provides its own copy of
> libfdt.h that is modified from upstream.  If I have libfdt installed into
> HOST_DIR, then host-uboot-tools fails to build because it grabs the libfdt.h
> from the HOST_DIR area instead of using the patched version from its own
> source tree.  This patch corrects this issue.

Same here, please rephrase so that the sentences are neutral:

    For example, qemu from the Foo repository does not bundle a libfdt,
    and will use the system one when installed. However, qemu has a
    libfdt.h header, when libfdt installs its own libfdt.h.

> This assumes the -isystem flag is supported by the host compiler.

After discussing with Thomas on IRC, this is virtually the case for all
current gcc versions: even gcc-3.x had it, and it's long been deprecated
now.
 
> Signed-off-by: David Raeman <draeman@bbn.com>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index afd5d3a..b0ef706 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -222,7 +222,7 @@ UNZIP := $(shell which unzip || type -p unzip) -q
>  
>  APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
>  
> -HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
> +HOST_CPPFLAGS  = -isystem $(HOST_DIR)/usr/include

As I was telling Thomas: the idea totally makes sense, but I can't
assess how it would break...

Still, we can't know if we don;t apply it, so:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>o

Regards,
Yann E. MORIN.

>  HOST_CFLAGS   ?= -O2
>  HOST_CFLAGS   += $(HOST_CPPFLAGS)
>  HOST_CXXFLAGS += $(HOST_CFLAGS)
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 11:15:37 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/elfutils: does not
 build with musl
In-Reply-To: <1438983471-26367-1-git-send-email-yann.morin.1998@free.fr>
References: <1438983471-26367-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150808111537.18bbf886@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  7 Aug 2015 23:37:51 +0200, Yann E. MORIN wrote:

> diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
> index 6c6856e..19ab8fc 100644
> --- a/package/elfutils/Config.in
> +++ b/package/elfutils/Config.in
> @@ -1,6 +1,7 @@
> -comment "elfutils needs a toolchain w/ wchar, dynamic library"
> +comment "elfutils needs a uClibc or (e)glibc toolchain w/ wchar, dynamic library"
>  	depends on !BR2_bfin
>  	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_USES_GLIBC

Now that I read this again, I believe this is wrong. It should be:

	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)

with your version, the comment can only be visible when a toolchain
that is *not* uclibc and *not* glibc is used. I.e, the comment is now
only visible when musl is used. Which is not what we want.

Can you send a follow-up patch to fix this (I already pushed and
applied your patch).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

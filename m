From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 16:27:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/sngrep: fix static build with
 gnutls
In-Reply-To: <20170520162751.30809-2-romain.naour@gmail.com>
References: <20170520162751.30809-1-romain.naour@gmail.com>
 <20170520162751.30809-2-romain.naour@gmail.com>
Message-ID: <20170523162742.23372fb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 May 2017 18:27:51 +0200, Romain Naour wrote:

> diff --git a/package/sngrep/0003-configure.ac-switch-to-pkg-config-to-find-gnutls.patch b/package/sngrep/0003-configure.ac-switch-to-pkg-config-to-find-gnutls.patch
> new file mode 100644
> index 0000000..67b21a2
> --- /dev/null
> +++ b/package/sngrep/0003-configure.ac-switch-to-pkg-config-to-find-gnutls.patch
> @@ -0,0 +1,60 @@
> +From b0428b0279b03d88520b79b651f692d9aea65f8c Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Sat, 20 May 2017 15:00:16 +0200
> +Subject: [PATCH] configure.ac: switch to pkg-config to find gnutls.

This patch looks good, but the description could use some improvement.

> +Like for openssl in patch [1] and for the same reason,
> +use pkg-config to find gnutls.
> +
> +gnutls can be linked with :
> +    -lintl -lgmp -lunistring -lhogweed -lnettle -ltasn1 -lz

And ?

> ++	AC_PATH_PROG([LIBGCRYPT_CONFIG],[libgcrypt-config],[no])
> ++	if test "x${LIBGCRYPT_CONFIG}" = "xno"; then
> ++	    AC_MSG_FAILURE([libgcrypt-config not found in PATH])

Use AC_MSG_ERROR() here.

> ++	fi
> ++	AC_CHECK_LIB(
> ++		[gcrypt],
> ++		[gcry_md_map_name],
> ++		[LIBGCRYPT_CFLAGS="`${LIBGCRYPT_CONFIG} --cflags`"
> ++		LIBGCRYPT_LIBS="`${LIBGCRYPT_CONFIG} --libs`"
> ++		],
> ++		[AC_MSG_ERROR([ You need to have libgcrypt installed to compile sngrep])],
> ++		[`${LIBGCRYPT_CONFIG} --libs --cflags`]
> ++		)

I don't understand what you're doing here. What about instead:

 - If LIBGCRYPT_CONFIG != no, use it to assign LIBGCRYPT_{CFLAGS,LIBS}

 - If LIBGCRYPT_CONFIG == no, fall back to AC_CHECK_LIB

What do you think ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

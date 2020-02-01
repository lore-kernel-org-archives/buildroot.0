From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Feb 2020 23:14:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/file: drop host-file
In-Reply-To: <20200201110427.1682488-2-fontaine.fabrice@gmail.com>
References: <20200201110427.1682488-1-fontaine.fabrice@gmail.com>
 <20200201110427.1682488-2-fontaine.fabrice@gmail.com>
Message-ID: <20200201221448.GB21372@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-01 12:04 +0100, Fabrice Fontaine spake thusly:
> file does not need a dependency on host-file and as host-file was only
> used by file, drop host-file altogether
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

That dependendcy was dded in 2005, with a message stating (roughly) that
we need to have a file version on the host that is not older than the
version on the target.

And indeed, it does not build on my autobuilder, with this error message
(yes, file is nice enough to not fail miserably and provide a useful
message):

    Making all in magic
    Cannot use the installed version of file (5.14) to
    cross-compile file 5.38
    Please install file 5.38 locally first

So, I'll reject this patch.

Regards,
Yann E. MORIN.

> ---
>  package/file/file.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/file/file.mk b/package/file/file.mk
> index 42f9524ed1..b2e1e7c171 100644
> --- a/package/file/file.mk
> +++ b/package/file/file.mk
> @@ -6,15 +6,12 @@
>  
>  FILE_VERSION = 5.38
>  FILE_SITE = ftp://ftp.astron.com/pub/file
> -FILE_DEPENDENCIES = host-file
> -HOST_FILE_DEPENDENCIES = host-zlib
>  FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>  FILE_INSTALL_STAGING = YES
>  FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
>  FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
>  # We're patching configure.ac
>  FILE_AUTORECONF = YES
> -HOST_FILE_CONF_OPTS = --disable-libseccomp
>  
>  ifeq ($(BR2_PACKAGE_BZIP2),y)
>  FILE_CONF_OPTS += --enable-bzlib
> @@ -45,4 +42,3 @@ FILE_CONF_OPTS += --disable-zlib
>  endif
>  
>  $(eval $(autotools-package))
> -$(eval $(host-autotools-package))
> -- 
> 2.24.1
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

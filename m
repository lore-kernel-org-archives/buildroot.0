From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Nov 2015 18:36:10 +0100
Subject: [Buildroot] [PATCH v2] pkgconf: fix incorrect
 variable-directory sysroot prefixing
In-Reply-To: <1446501424-26609-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446501424-26609-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151104173610.GC4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-11-02 18:57 -0300, Gustavo Zacarias spake thusly:
> According to the pkg-config documents ("specification") when
> sysroot-prefixing is enabled via PKG_CONFIG_SYSROOT_DIR this should only
> be applied to -I/-L directories (includes, library directories), and not
> to all of the other variables that can specify a directory.
> 
> However xorg uses mapdir/sdkdir in a similar fashion in what could be
> considered an abuse of the spec, hence needs to be prefixed as well.
> And what's more, it also uses includedir in a nonstandard fashion just
> requesting the value via 'pkg-config --variable=includedir libfoo' which
> doesn't pass the standard prefixing rules for the --cflags and --libs
> invocation.
> 
> This patch makes pkgconf behave in the pkg-config specified way with the
> added exception for the includedir, libdir, mapdir and sdkdir variables
> which are prefixed.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks! :-)

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...-Fix-all-variables-sysroot-prefix-problem.patch | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
> 
> diff --git a/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch b/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
> new file mode 100644
> index 0000000..bac9f62
> --- /dev/null
> +++ b/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
> @@ -0,0 +1,58 @@
> +From abc7a780f2a52a1aa3ee288e17140b817b545cc3 Mon Sep 17 00:00:00 2001
> +From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Date: Mon, 2 Nov 2015 18:38:00 -0300
> +Subject: [PATCH] Fix all-variables sysroot prefix problem
> +
> +According to the pkg-config specifications (or rather documentation)
> +only the -L/-I directory entries should be sysroot-prefixed.
> +
> +We also need to prefix the mapdir/sdkdir variables since they're used by
> +xorg and expected that way.
> +
> +Also allow prefixing for includedir and libdir since in some silly cases
> +the directories may be requested barebones via pkg-config
> +--variable=includedir libfool for example.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +---
> + main.c | 17 ++++++++++++-----
> + 1 file changed, 12 insertions(+), 5 deletions(-)
> +
> +diff --git a/main.c b/main.c
> +index 6947126..52d16c2 100644
> +--- a/main.c
> ++++ b/main.c
> +@@ -313,9 +313,12 @@ print_variable(pkg_t *pkg, void *data, unsigned int flags)
> + 			memset(req->buf, 0, sizeof(req->buf));
> + 
> + 			if (*var == '/' && (flags & PKGF_MUNGE_SYSROOT_PREFIX) &&
> +-			    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))))
> +-				strlcat(req->buf, sysroot_dir, sizeof(req->buf));
> +-
> ++			    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))) &&
> ++			    	(!strcmp(req->variable, "includedir") || \
> ++				    !strcmp(req->variable, "libdir") || \
> ++				    !strcmp(req->variable, "mapdir") || \
> ++				    !strcmp(req->variable, "sdkdir")))
> ++					strlcat(req->buf, sysroot_dir, sizeof(req->buf));
> + 			strlcat(req->buf, var, sizeof(req->buf));
> + 			return;
> + 		}
> +@@ -323,8 +326,12 @@ print_variable(pkg_t *pkg, void *data, unsigned int flags)
> + 		strlcat(req->buf, " ", sizeof(req->buf));
> + 
> + 		if (*var == '/' && (flags & PKGF_MUNGE_SYSROOT_PREFIX) &&
> +-		    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))))
> +-			strlcat(req->buf, sysroot_dir, sizeof(req->buf));
> ++		    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))) &&
> ++		    	(!strcmp(req->variable, "includedir") || \
> ++			    !strcmp(req->variable, "libdir") || \
> ++			    !strcmp(req->variable, "mapdir") || \
> ++			    !strcmp(req->variable, "sdkdir")))
> ++				strlcat(req->buf, sysroot_dir, sizeof(req->buf));
> + 
> + 		strlcat(req->buf, var, sizeof(req->buf));
> + 	}
> +-- 
> +2.4.10
> +
> -- 
> 2.4.10
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

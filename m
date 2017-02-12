From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 13:34:56 +0100
Subject: [Buildroot] [PATCH v2] infra/ccache: avoid color diagnostics
 with GCC older than v4.9
In-Reply-To: <1486899181-8210-1-git-send-email-casantos@datacom.ind.br>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <1486899181-8210-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170212123456.GB11105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2017-02-12 09:33 -0200, Carlos Santos spake thusly:
> Ensure that the GCC_COLORS environment variable is empty when calling
> ccache. When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to
> GCC but this flag requires GCC v4.9 or later. Older versions complain
> about the unrecognized command line option.
> 
> That behavior is hard-coded in ccache; we would need a patch to either
> make it optional or disable it at all. Notice also that the problem is
> not detectable in the autobuilders because they redirect the output to
> files/pipes and ccache adds the offending flag only when stderr is a
> terminal.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Should go to master.

Regards,
Yann E. MORIN.

> ---
> Changes v1->v2
>   Fix indentation, use positive logic and improve the commit message,
>   acording to comments from Thomas Petazzoni and Yann E. MORIN.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/Makefile.in | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 4a3eb26..e5e595a 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -236,6 +236,13 @@ export PERL5LIB=$(HOST_DIR)/usr/lib/perl
>  
>  TARGET_MAKE_ENV = PATH=$(BR_PATH)
>  
> +# When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
> +# this flag requires GCC v4.9 or later. Older versions fail, complaining
> +# about unrecognized command line option.
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),)
> +TARGET_MAKE_ENV += GCC_COLORS=""
> +endif
> +
>  TARGET_CONFIGURE_OPTS = \
>  	$(TARGET_MAKE_ENV) \
>  	AR="$(TARGET_AR)" \
> @@ -285,6 +292,11 @@ HOST_MAKE_ENV = \
>  	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>  	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
>  
> +# Prevent ccache from passing '-fdiagnostics-color' (see above).
> +ifeq ($(BR2_HOST_GCC_AT_LEAST_4_9),)
> +HOST_MAKE_ENV += GCC_COLORS=""
> +endif
> +
>  HOST_CONFIGURE_OPTS = \
>  	$(HOST_MAKE_ENV) \
>  	AR="$(HOSTAR)" \
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

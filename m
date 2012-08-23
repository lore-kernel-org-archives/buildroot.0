From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 23 Aug 2012 17:09:00 +0200
Subject: [Buildroot] [UNSURE] [PATCH] luajit: bug fix - prevent target
 CFLAGS from being used in host tool compile.
In-Reply-To: <1344993930-2730-1-git-send-email-danomimanchego123@gmail.com>
References: <1344993930-2730-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAB0FRsvVF5+BEuHkOvx6dc9tWO=hqDv+1DUjjdU4UvQWc0LpdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Francois Perrad <francois.perrad@gadz.org>

2012/8/15 Danomi Manchego <danomimanchego123@gmail.com>:
> The luajit amalgamation compile starts with building a host tool, and then
> uses it to build itself.  However, when CFLAGS is specified, as opposed to
> TARGET_CFLAGS, then it is used for both HOST and TARGET builds.  So if you
> add something target specific into 'Target Optimizations' (for example,
> '-mfpu=neon -mfloat-abi=softfp' for ARM Cortex-A8), then it gets into the
> host tool compile, which then fails (because my build machine is not an
> ARM Cortext-A8).  This can be fixed by using TARGET_CFLAGS and
> TARGET_LDFLAGS, instead of CFLAGS and LDFLAGS, respectively.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/luajit/luajit.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index e4c46d8..913bc0c 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -42,8 +42,8 @@ define LUAJIT_BUILD_CMDS
>                 TARGET_LD="$(TARGET_CC)" \
>                 TARGET_AR="$(TARGET_AR) rcus" \
>                 TARGET_STRIP="$(TARGET_STRIP)" \
> -               CFLAGS="$(TARGET_CFLAGS)" \
> -               LDFLAGS="$(TARGET_LDFLAGS)" \
> +               TARGET_CFLAGS="$(TARGET_CFLAGS)" \
> +               TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
>                 HOST_CC="$(LUAJIT_HOST_CC)" \
>                 HOST_CFLAGS="$(HOST_CFLAGS)" \
>                 HOST_LDFLAGS="$(HOST_LDFLAGS)" \
> --
> 1.7.9.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 22 Apr 2019 19:14:08 +0200
Subject: [Buildroot] [PATCH] package/qt5base: fix qmake parallel build
In-Reply-To: <20190422095842.61772-1-giulio.benetti@micronovasrl.com>
References: <c060cbb3-21e2-5dcd-18ec-835106f2e682@micronovasrl.com>
 <20190422095842.61772-1-giulio.benetti@micronovasrl.com>
Message-ID: <CAOf5uwmv=+tLL2g=L+VNa24BG1esHmANm0OgTGDzn2MwBeJKZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Mon, Apr 22, 2019 at 11:59 AM Giulio Benetti
<giulio.benetti@micronovasrl.com> wrote:
>
> When configuring qt5base, qmake is built, but it's not built in parallel
> mode. This is due to MAKEFLAGS having 2 dashes on its tail, so this:
> MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)"
> expands in this(i.e. 5 njobs):
> MAKEFLAGS="--no-print-directory -- -j5"
> and -j5 gets ignored due to "--" preceeding -j5.
> Double dashes are part of $(MAKEFLAGS) only when evaluated by shell.
>
> Swap $(MAKEFLAGS) and -j$(PARALLEL_JOBS) to avoid having "--" before
> -j$(PARALLEL_JOBS), this way -j$(PARALLEL_JOBS) won't be ignored by
> ./configure.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---

Tested-by: Michael Trimarchi <michael@amarulasolutions.com>

Thank you

Michael
>  package/qt5/qt5base/qt5base.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 0b45c50a66..e73b8931aa 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -324,7 +324,7 @@ define QT5BASE_CONFIGURE_CMDS
>         (cd $(@D); \
>                 $(TARGET_MAKE_ENV) \
>                 PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> -               MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
> +               MAKEFLAGS="-j$(PARALLEL_JOBS) $(MAKEFLAGS)" \
>                 ./configure \
>                 -v \
>                 -prefix /usr \
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |

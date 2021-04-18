From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 18 Apr 2021 23:59:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/valgrind: Add a setting for LTO
 build
In-Reply-To: <20210418183658.1675843-1-glex.spb@gmail.com>
References: <20210418183658.1675843-1-glex.spb@gmail.com>
Message-ID: <20210418235913.142664da@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gleb,
On Sun, 18 Apr 2021 19:36:58 +0100, Gleb Mazovetskiy <glex.spb@gmail.com> wrote:

> Valgrind LTO build takes over an hour on my Ryzen 3950x.
>

Can confirm a build time increase (AMD Ryzen 7 1800X):

- without LTO:

real	0m54,741s
user	3m29,941s
sys	0m10,949s

- with LTO:

real	5m48,009s
user	6m23,040s
sys	0m13,197s

> This is not always worth it for the ~10% size reduction and a small
> performance improvement it offers (see https://www.valgrind.org/docs/manual/dist.news.html)
>
> Adds a new `BR2_VALGRIND_ENABLE_LTO` setting to control LTO enablement
> for Valgrind separately from the global BR2_GCC_ENABLE_LTO setting.
>
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  package/valgrind/Config.in   | 10 ++++++++++
>  package/valgrind/valgrind.mk |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
> index 56e4af21fa..eff54e7949 100644
> --- a/package/valgrind/Config.in
> +++ b/package/valgrind/Config.in
> @@ -84,4 +84,14 @@ config BR2_PACKAGE_VALGRIND_NULGRIND
>  	help
>  	  This option allows to install the Nulgrind tool
>
> +if BR2_GCC_ENABLE_LTO
> +
> +config BR2_VALGRIND_ENABLE_LTO
> +	bool "Build Valgrind with link-time optimization"
> +	help
> +	  This produces a faster / smaller valgrind (up to 10%) at the cost
> +	  of massively increased build time (can be over an hour).

Be careful with absolute times, depends strongly on the used hardware...
(out of interest, what is your baseline compile time?)...

Would move this section up-to/before the tools selection section...

Regards,
Peter

> +
> +endif
> +
>  endif
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index b87e1e518f..07fb1f7d42 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -50,7 +50,7 @@ VALGRIND_CONF_OPTS += \
>  	--host=$(patsubst arm-%,armv7-%,$(GNU_TARGET_NAME))
>  endif
>
> -ifeq ($(BR2_GCC_ENABLE_LTO),y)
> +ifeq ($(BR2_VALGRIND_ENABLE_LTO),y)
>  VALGRIND_CONF_OPTS += --enable-lto
>  else
>  VALGRIND_CONF_OPTS += --disable-lto

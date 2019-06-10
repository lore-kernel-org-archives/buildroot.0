From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 20:45:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang: do not set static
 linking for host target
In-Reply-To: <20190610154007.28310-1-mirza.krak@northern.tech>
References: <20190610154007.28310-1-mirza.krak@northern.tech>
Message-ID: <16a75f6d-2849-c806-e530-d8e88b8a54ae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 17:40, Mirza Krak wrote:
> The current logic will set the "-static" flag when building go
> host packages if BR2_STATIC_LIBS is set, this will not work as
> there is no support to link host packages statically.
> 
> Fix this by applying this logic only for target builds.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>

 Applied to master, thanks.


> ---
> 
> Fixes: http://autobuild.buildroot.net/results/f9b/f9ba64ab4c8d7fa6cb301fab37ee4141ba442f61/build-end.log

 This should have gone above the --- and the Sob. Unfortunately, I hadn't
noticed, so now I pushed it without the fixes tag...

 Regards,
 Arnout

> 
>  package/pkg-golang.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 72e8f6b7af..e47de17aba 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -58,10 +58,6 @@ define inner-golang-package
> 
>  $(2)_WORKSPACE ?= _gopath
> 
> -ifeq ($(BR2_STATIC_LIBS),y)
> -$(2)_LDFLAGS += -extldflags '-static'
> -endif
> -
>  $(2)_BUILD_OPTS += \
>  	-ldflags "$$($(2)_LDFLAGS)" \
>  	-tags "$$($(2)_TAGS)" \
> @@ -106,6 +102,11 @@ endif
>  # file.
>  ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +$(2)_LDFLAGS += -extldflags '-static'
> +endif
> +
>  # Build package for target
>  define $(2)_BUILD_CMDS
>  	$$(foreach d,$$($(2)_BUILD_TARGETS),\
> --
> 2.11.0
> 

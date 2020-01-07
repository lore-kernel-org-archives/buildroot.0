From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 7 Jan 2020 16:32:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/exim: fix host build
In-Reply-To: <20200104213459.853758-1-bernd.kuhls@t-online.de>
References: <20200104213459.853758-1-bernd.kuhls@t-online.de>
Message-ID: <121dd68e-8863-f645-0809-de4b20811c1c@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On 04/01/20 22:34, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/5a7/5a765f0e65e20266c7203412a46c684a40b66ea3/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Locally I cannot reproduce the problem, hopefully this patch will fix
> the problem.

I also tried to reproduce the issue locally, but on my host (Ubuntu
18.04) all the builds succeed.

>  package/exim/exim.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 118ee4a1a4..1f814ef195 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -125,7 +125,7 @@ define EXIM_BUILD_CMDS
>  	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)/build-br macro_predef \
>  		CC=$(HOSTCC) \
>  		LNCC=$(HOSTCC) \
> -		CFLAGS="$(HOST_CFLAGS)" \
> +		CFLAGS="-std=c99 $(HOST_CFLAGS)" \

Applying your patch the builds still work, as expected. Then I tried to
pass -std=c90 instead of c99, and bang, they started failing! So I also
assume your patch solves the failure.

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca

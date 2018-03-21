From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Mar 2018 09:25:29 +0200
Subject: [Buildroot] [RFC] lm-sensors: fix static build
In-Reply-To: <4c4c3f8770727f91fb173fbc077dd8b7c15cc216.1520531013.git.baruch@tkos.co.il>
References: <4c4c3f8770727f91fb173fbc077dd8b7c15cc216.1520531013.git.baruch@tkos.co.il>
Message-ID: <20180321072529.ei7kpaqiaiz2kot3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

On Thu, Mar 08, 2018 at 07:43:33PM +0200, Baruch Siach wrote:
> Add -static to the link command line to have libgcc resolve libc
> symbols. This overrides the default -Wl,-rpath,/usr/lib, which is
> useless for static build anyway.
> 
> Fixes:
> http://autobuild.buildroot.net/results/25d/25d580bee6f609f6b28ebd6cc96d180179901b0e/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> 
> I'm not sure this is the right fix. Adding -lc to the failed link
> command also fixes the issue. But libc is always a dependency of libgcc.
> 
> It is also not clear why this issue appeared now. This is the only
> lm-sensors failure in the current autobuilder database. The only recent
> change that might be related is the musl bump to 1.1.19.

It seems like multicat has the same issue with static musl 1.1.19 build:

  http://autobuild.buildroot.net/results/d63/d638bc172183a3ae0c46c8a69bd3f214dedeb0a4/build-end.log

So maybe it is a toolchain issue.

> ---
>  package/lm-sensors/lm-sensors.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
> index f581b5cd8f21..6fc7ce4981c9 100644
> --- a/package/lm-sensors/lm-sensors.mk
> +++ b/package/lm-sensors/lm-sensors.mk
> @@ -26,7 +26,7 @@ LM_SENSORS_MAKE_OPTS = \
>  	PREFIX=/usr
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
> -LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=0
> +LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=0 EXLDFLAGS=-static
>  else
>  LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=1
>  endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

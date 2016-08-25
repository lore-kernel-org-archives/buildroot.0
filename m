From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 25 Aug 2016 06:51:52 +0300
Subject: [Buildroot] [PATCH 2/2] package/iputils: link with -lintl
In-Reply-To: <20160824231003.29262-2-arnout@mind.be>
References: <20160824231003.29262-1-arnout@mind.be>
 <20160824231003.29262-2-arnout@mind.be>
Message-ID: <20160825035151.7bnivzapacqugsri@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Aug 25, 2016 at 01:10:03AM +0200, Arnout Vandecappelle (Essensium/Mind) wrote:
> libgcrypt pulls in gpg-error which links with libintl if available.
> Since iputils doesn't use libtool, -lintl has to be passed explicitly
> for static builds.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f81/f81eabb37788aa6dcdadf4034889c84bef78b876
> http://autobuild.buildroot.net/results/f29/f296e8fba1e79f96d3d119aa4c8207ed4b80694b
> http://autobuild.buildroot.net/results/478/478a88cd892a119970cfca717ea7f5517bfc4cea
> http://autobuild.buildroot.net/results/920/920d2d1d967691779f79fa54a38fac5adc5a8ee4
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/iputils/iputils.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index d6398f7..47f3e28 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -26,6 +26,10 @@ endif
>  IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_SYSFS=no USE_IDN=no\
>  	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>  
> +ifeq ($(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT),yy)
> +IPUTILS_MAKE_OPTS += ADDLIB='-lintl'
> +endif

I think this should be limited to BR2_STATIC_LIBS. It may not change much the 
end result, but it makes the motivation clearer.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

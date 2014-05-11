From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 11 May 2014 08:13:53 +0300
Subject: [Buildroot] [git commit] tcl: needs threads
In-Reply-To: <20140508211528.D9EA29CB25@busybox.osuosl.org>
References: <20140508211528.D9EA29CB25@busybox.osuosl.org>
Message-ID: <20140511051353.GC4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, May 08, 2014 at 11:14:17PM +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=a1134320e6ff0e34df79459a490b43d6582497bc
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixes http://autobuild.buildroot.net/results/486/48696710a270ac69d6d62654779f164075cb3451/
> 
> Tcl itself has a --disable-threads configure flag, but it unconditially
> configures its packages with --enable-threads, causing build failure.

Actually it's only the itcl extension that enables threading unconditionally 
in the version we use. This has changed in the development tree. See 
http://core.tcl.tk/itcl/ci/d0b8b2fa30f9f74b0779ea871eb5883b43d6096b?sbs=0 . So 
on the next version bump a no threads build should work again.

baruch

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/tcl/Config.in |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tcl/Config.in b/package/tcl/Config.in
> index db41d65..c3d0d87 100644
> --- a/package/tcl/Config.in
> +++ b/package/tcl/Config.in
> @@ -3,14 +3,15 @@ config BR2_PACKAGE_TCL
>  	# fork()
>  	depends on BR2_USE_MMU
>  	depends on BR2_INET_IPV6
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  TCL (Tool Command Language) is a simple textual language.
>  
>  	  http://www.tcl.tk
>  
> -comment "tcl needs a toolchain w/ ipv6"
> +comment "tcl needs a toolchain w/ ipv6, threads"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_INET_IPV6
> +	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
>  
>  if BR2_PACKAGE_TCL

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

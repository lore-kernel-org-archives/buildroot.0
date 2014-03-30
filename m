From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Mar 2014 12:25:05 +0300
Subject: [Buildroot] [PATCH 1/1] mtools: Does not compile on bfin
In-Reply-To: <1396171235-18112-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396171235-18112-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140330092505.GE4579@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Mar 30, 2014 at 11:20:35AM +0200, Bernd Kuhls wrote:
> Fixes http://autobuild.buildroot.net/results/c0f/c0ff79569690b5799c25c09bde581cee6acb9910/
> 
> expand.o: In function `_safePopenOut':
> expand.c:(.text+0x1e): undefined reference to `_fork'
> precmd.o: In function `_precmd':
> precmd.c:(.text+0x16): undefined reference to `_fork'
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mtools/Config.in |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mtools/Config.in b/package/mtools/Config.in
> index 5865223..1c83b9e 100644
> --- a/package/mtools/Config.in
> +++ b/package/mtools/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_MTOOLS
>  	bool "mtools"
>  	depends on BR2_USE_WCHAR
> +	depends on !BR2_bfin # fork()
>  	depends on BR2_USE_MMU # fork()

Blackfin and a non-MMU architecture, so this dependency is redundant. The 
build failure at 
http://autobuild.buildroot.net/results/c0f/c0ff79569690b5799c25c09bde581cee6acb9910/ 
predates commit 56e404bb883b0 (mtools: needs mmu) that added the MMU 
dependency.

baurch

>  	help
>  	  Mtools is a collection of utilities to access MS-DOS disks from
> -- 
> 1.7.10.4

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

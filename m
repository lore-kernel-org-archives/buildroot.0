From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Dec 2013 20:32:18 +0200
Subject: [Buildroot] [PATCH] uclibc: add a special Xtensa version
In-Reply-To: <1387734039-15203-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1387734039-15203-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131222183218.GA4180@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Dec 22, 2013 at 06:40:39PM +0100, Thomas Petazzoni wrote:
> Currently, the Xtensa architecture uses the "snapshot" version of
> uClibc. This means that the build is not reproducible, since it will
> pick whatever latest version of uClibc is available at the moment of
> the build.
> 
> This commit replaces that by adding a special Xtensa version, which
> points to a well-known Git commit. This is something we should
> hopefully be able to remove once the uClibc people realize that doing
> a 0.9.34 release would be useful.
> 
> Should probably fix:
> 
>   http://autobuild.buildroot.org/results/5d6/5d6072a038acf894d832704e36c1d43f0254abf5/build-end.log
> 
> at least I wasn't able to reproduce the build problem.

Thanks of looking into this. Commit 9591091f1 is quite old, however, and is 
missing a few important xtensa fixes like a20d9fe539 and caee562063. Since 
this breakage is new, It's probably related to the commits pushed to public 
git repo in the last few days. Specifically I suspect 2a021ae81c3 (buildsys: 
update unifdef), but I didn't look too deeply into it.

Can you verify that 3a3ad3dfc1 as default uClibc version for xtensa doesn't 
break the builds? 

BTW, I'd also appreciate your response on 
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/72570.

Thanks,
baruch

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/uclibc/Config.in | 6 ++++++
>  package/uclibc/uclibc.mk | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 7b2d6a7..7ebe32a 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -20,6 +20,10 @@ choice
>  		bool "uClibc 0.9.33.x"
>  		depends on !(BR2_arc || BR2_avr32 || BR2_xtensa)
>  
> +	config BR2_UCLIBC_VERSION_XTENSA_GIT
> +		bool "uClibc Git Xtensa"
> +		depends on BR2_xtensa
> +
>  	config BR2_UCLIBC_VERSION_SNAPSHOT
>  		bool "daily snapshot"
>  		depends on !(BR2_arc)
> @@ -39,6 +43,7 @@ config BR2_UCLIBC_VERSION_STRING
>  	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
>  	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
>  	default "9f0f466d3b17181ce88be36ce24a775774fe686c" if BR2_arc
> +	default "9591091f150e8a86c47efbea5def21fa67fffb07" if BR2_UCLIBC_VERSION_XTENSA_GIT
>  	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
>  
>  config BR2_UCLIBC_CONFIG
> @@ -48,6 +53,7 @@ config BR2_UCLIBC_CONFIG
>  	default "package/uclibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
>  	default "package/uclibc/uClibc-snapshot.config" if BR2_arc
>  	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
> +	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_XTENSA_GIT
>  	help
>  	  Some people may wish to use their own modified uClibc configuration
>  	  file and will specify their config file location with this option.
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 9e04771..bf1de05 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -12,6 +12,9 @@ UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
>  else ifeq ($(BR2_arc),y)
>  UCLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,uClibc,$(UCLIBC_VERSION))
>  UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
> +else ifeq ($(BR2_UCLIBC_VERSION_XTENSA_GIT),y)
> +UCLIBC_SITE = git://git.busybox.net/uClibc
> +UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
>  else
>  UCLIBC_SITE = http://www.uclibc.org/downloads
>  UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.xz
> -- 
> 1.8.3.2
> 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

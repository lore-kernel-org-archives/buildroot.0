From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 1 Jun 2014 15:24:59 +0300
Subject: [Buildroot] [PATCHv2 2/2] glibc: add eglibc 2.19-svnr25243 and
 choice menu
In-Reply-To: <1401623919-16671-2-git-send-email-gustavo@zacarias.com.ar>
References: <1401623919-16671-1-git-send-email-gustavo@zacarias.com.ar>
 <1401623919-16671-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140601122459.GF4280@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Sun, Jun 01, 2014 at 08:58:39AM -0300, Gustavo Zacarias wrote:
> Add glibc 2.19-svnr25243 and a choice menu to select between different
> eglibc versions.
> Blacklist it for PowerPC SPE since it's broken.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/glibc/Config.in | 17 +++++++++++++++++
>  package/glibc/glibc.mk  |  2 +-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index dbb1a19..494c0f9 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -1,3 +1,20 @@
> +if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
> +
> +choice
> +	prompt "eglibc version"
> +	default BR2_EGLIBC_VERSION_2_18
> +
> +config BR2_EGLIBC_VERSION_2_18
> +	bool "2.18-svnr23787"
> +
> +config BR2_EGLIBC_VERSION_2_19
> +	bool "2.19-svnr25243"
> +	depends on !BR2_powerpc_SPE
> +
> +endchoice
> +
> +endif
> +
>  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  
>  choice
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index d02ab7e..f841fd0 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
> -GLIBC_VERSION = 2.18-svnr23787
> +GLIBC_VERSION = $(if $(BR2_EGLIBC_VERSION_2_19),2.19-svnr25243,2.18-svnr23787)

Is it possible to use BR2_EGLIBC_VERSION_2_1{8,9} here and avoid version 
string duplication?

baruch

>  GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
>  GLIBC_SOURCE = eglibc-$(GLIBC_VERSION).tar.bz2
>  GLIBC_SRC_SUBDIR = libc

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 5 Jan 2017 20:49:33 +0200
Subject: [Buildroot] [PATCH 1/1] pure-ftpd: Added pure-ftpd quotas
 config option
In-Reply-To: <1483641714-6962-1-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1483641714-6962-1-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <20170105184933.wnnfmvcpmlaubypc@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bryce,

On Thu, Jan 05, 2017 at 12:41:54PM -0600, Bryce Ferguson wrote:
> Added the pure-ftp quotas option.  When selected, the --with-quotas
> compiler option is passed which enables the quota feature.
> 
> Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
> ---
>  package/pure-ftpd/Config.in    | 7 +++++++
>  package/pure-ftpd/pure-ftpd.mk | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
> index 85fdef3..df28c4c 100644
> --- a/package/pure-ftpd/Config.in
> +++ b/package/pure-ftpd/Config.in
> @@ -20,4 +20,11 @@ config BR2_PACKAGE_PURE_FTPD_FTPWHO
>  	  client sessions.  Only the system administrator may run this.  Output
>  	  can be text (default), HTML, XML data and parser-optimized.
>  
> +config BR2_PACKAGE_PURE_FTPD_QUOTAS
> +	bool "quotas"
> +	help
> +	  Enable virtual quotas. With virtual quotas, restrictions can be placed
> +	  on the maximum number of files a user can store in his account.  In
> +	  addition, restrictions can also be placed on the total size.

What is the impact of this feature on executable size? In case the impact is 
small compared to the size of pure-ftpd itself, the general preference in 
Buildroot is to just enable the feature unconditionally.

baruch

> +
>  endif
> diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
> index 80e432a..95e7065 100644
> --- a/package/pure-ftpd/pure-ftpd.mk
> +++ b/package/pure-ftpd/pure-ftpd.mk
> @@ -49,4 +49,8 @@ ifeq ($(BR2_PACKAGE_PURE_FTPD_FTPWHO),y)
>  PURE_FTPD_CONF_OPTS += --with-ftpwho
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PURE_FTPD_QUOTAS),y)
> +PURE_FTPD_CONF_OPTS += --with-quotas
> +endif
> +
>  $(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

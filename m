From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:47:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: Use echo-dummy
 gettext script if NLS is not enabled
In-Reply-To: <1550084055-9176-1-git-send-email-email@gmail.com>
References: <1550084055-9176-1-git-send-email-email@gmail.com>
Message-ID: <20190215224759.522c3207@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Wed, 13 Feb 2019 20:54:15 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> From: Vadim Kochan <vadim4j@gmail.com>
> 
> gettext is used only as external tool in ecryptfs utils which can easy
> be replaced by 'echo' if NLS is not required. So changed a bit semantic
> of Config file - select gettext package only if NLS is enabled,
> otherwise a dummy-echo script is generated as 'gettext' replacement.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/ecryptfs-utils/Config.in         |  2 +-
>  package/ecryptfs-utils/ecryptfs-utils.mk | 10 ++++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
> index 6652d33..1438c17 100644
> --- a/package/ecryptfs-utils/Config.in
> +++ b/package/ecryptfs-utils/Config.in
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
>  	select BR2_PACKAGE_LIBNSS
>  	# runtime dependency only, some scripts are using the
>  	# 'gettext' program to get translations
> -	select BR2_PACKAGE_GETTEXT
> +	select BR2_PACKAGE_GETTEXT if BR2_SYSTEM_ENABLE_NLS
>  	# runtime dependency only
>  	select BR2_PACKAGE_GETENT
>  	help
> diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
> index eb3194b..a2a0af6 100644
> --- a/package/ecryptfs-utils/ecryptfs-utils.mk
> +++ b/package/ecryptfs-utils/ecryptfs-utils.mk
> @@ -25,4 +25,14 @@ else
>  ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
>  endif
>  
> +ifneq ($(BR2_SYSTEM_ENABLE_NLS),y)
> +define ECRYPTFS_UTILS_GETTEXT_DUMMY_INSTALL
> +	echo '#! /bin/sh' > $(@D)/gettext
> +	echo 'echo $$@' >> $(@D)/gettext
> +
> +	$(INSTALL) -m 0755 -D $(@D)/gettext $(TARGET_DIR)/usr/bin/gettext

I understand the idea, but I don't think it's good for ecryptfs-utils
to install a tool called "gettext". Maybe some gettext-tiny package
should provide this dummy target gettext program ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

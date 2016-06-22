From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Jun 2016 23:20:32 +0200
Subject: [Buildroot] [PATCH 1/1] fs/tar: support passing long options to
 tar
In-Reply-To: <1466464689-29532-1-git-send-email-fhunleth@troodon-software.com>
References: <1466464689-29532-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <189e4068-b3b3-3152-b99b-9727f2f9485e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-06-16 01:18, Frank Hunleth wrote:
> This change modifies how options are passed to tar to support long
> options. Unfortunately, it breaks configurations that previously used
> this feature. Before the change, options were passed using the
> single-letter without a '-' form. E.g., if the user wanted to turn on
> verbose output, they would have to specify 'v'. With this change, the
> user would need to pass '-v'. The help text is updated to make the
> requirement more clear.

 I may be mistaken, but wouldn't we conserve full backward compatibility by using

	tar $(TAR_OPTS) -cf ...


 Regards,
 Arnout

> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  fs/tar/Config.in | 5 +++--
>  fs/tar/tar.mk    | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/tar/Config.in b/fs/tar/Config.in
> index 63663ec..14fc7a4 100644
> --- a/fs/tar/Config.in
> +++ b/fs/tar/Config.in
> @@ -48,5 +48,6 @@ config BR2_TARGET_ROOTFS_TAR_OPTIONS
>  	depends on BR2_TARGET_ROOTFS_TAR
>  	default ""
>  	help
> -	  Any other flags you want to pass to tar
> -	  Refer to tar --help for details
> +	  Pass additional commandline arguments to tar. Use the '-' or '--'
> +	  forms of options rather than the single-letter combining forms.
> +	  Refer to tar --help for details.
> diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
> index 28219cf..d598f52 100644
> --- a/fs/tar/tar.mk
> +++ b/fs/tar/tar.mk
> @@ -7,7 +7,7 @@
>  TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
>  
>  define ROOTFS_TAR_CMD
> -	tar -c$(TAR_OPTS)f $@ --numeric-owner -C $(TARGET_DIR) .
> +	tar -c $(TAR_OPTS) -f $@ --numeric-owner -C $(TARGET_DIR) .
>  endef
>  
>  $(eval $(call ROOTFS_TARGET,tar))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

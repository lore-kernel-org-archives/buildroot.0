From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Feb 2012 13:09:35 +0100
Subject: [Buildroot] [PATCH] DOWNLOAD: change $1=DIRECTORY_URL,
	$2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <6ed41ff2885fccbd8f3fd9d31ea1f647c3e0c6fc.1329476889.git.alvaro.gamez@hazent.com>
References: <201202171014.04114.arnout@mind.be>
 <6ed41ff2885fccbd8f3fd9d31ea1f647c3e0c6fc.1329476889.git.alvaro.gamez@hazent.com>
Message-ID: <201202181309.35296.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Sorry, there are still a few things I missed before...

On Friday 17 February 2012 12:10:01 Alvaro G. M wrote:

[snip]
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index 33461b4..a96031e 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -203,11 +203,11 @@ endef
>  # to prepend the path with a slash: scp://[user@]host:/absolutepath
>  define DOWNLOAD_SCP
>  	test -e $(DL_DIR)/$(2) || \
> -	$(SCP) $(call stripurischeme,$(call qstrip,$(1)))/$(2) $(DL_DIR)
> +	$(SCP) '$(call stripurischeme,$(call qstrip,$(1)))' $(DL_DIR)/$(2)
>  endef
>  
>  define SOURCE_CHECK_SCP
> -	$(SSH) $(call domain,$(1),:) ls $(call notdomain,$(1)/$(2),:) > /dev/null
> +	$(SSH) $(call domain,$(1),:) ls $(call notdomain,$(1),:) > /dev/null

 There should probably be quotes here as well.  Although, when you use
scp, it's not very likely that the directory name contains evil characters.

>  endef
>  
>  define SHOW_EXTERNAL_DEPS_SCP
> @@ -238,11 +238,11 @@ endef
>  
>  define DOWNLOAD_WGET
>  	test -e $(DL_DIR)/$(2) || \
> -	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
> +	$(WGET) -O $(DL_DIR)/$(2) '$(call qstrip,$(1))'
>  endef
>  
>  define SOURCE_CHECK_WGET
> -  $(WGET) --spider $(call qstrip,$(1))/$(2)
> +  $(WGET) --spider $(call qstrip,$(1))

 Here quotes are definitely needed or we get in trouble with URLs 
containing & or ;.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

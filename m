From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Mar 2017 23:30:36 +0200
Subject: [Buildroot] [PATCH 1/4] system: do not overwrite /bin/sh
 Busybox symlink
In-Reply-To: <1490564623-26806-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490564623-26806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490564623-26806-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <e4c57a87-237c-bc5b-43d2-3eea29d35430@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-03-17 23:43, Thomas Petazzoni wrote:
> The BR2_SYSTEM_BIN_SH hidden option defines to what binary the /bin/sh
> symlinks should point to. If busybox is chosen, then /bin/sh is created
> to point to /bin/busybox.
> 
> This works fine with the default installation mode of Busybox, but it
> fails with the upcoming "individual binaries" mode, in which each applet
> is installed as its own binary, and /bin/busybox doesn't exist: we get
> /bin/sh as a broken symlink to /bin/busybox.
> 
> Since Busybox already installs its own /bin/sh symlink, properly
> pointing to /bin/ash or /bin/hush depending on the selected shell, it
> doesn't make sense for the BR2_SYSTEM_BIN_SH logic to override
> this. Just let Busybox install its own /bin/sh by making
> BR2_SYSTEM_BIN_SH empty when Busybox shell is selected as /bin/sh.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 I was worried that the other shells might overwrite the symlink created by
busybox in their install commands, but apparently none of them do. I tried bash,
dash, mksh and zsh. So

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
> This is proposed as an alternative to
> https://patchwork.ozlabs.org/patch/686673/. If people believe
> https://patchwork.ozlabs.org/patch/686673/ is a better solution, I'm
> fine as well.

 No, that solution is wrong I think if /bin/sh is not busybox, because then the
symlink will not be created at all.

 Regards,
 Arnout

> ---
>  package/skeleton/skeleton.mk | 2 ++
>  system/Config.in             | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 1000161..9940944 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -203,10 +203,12 @@ define SKELETON_BIN_SH
>  	rm -f $(TARGET_DIR)/bin/sh
>  endef
>  else
> +ifneq ($(SKELETON_TARGET_GENERIC_BIN_SH),)
>  define SKELETON_BIN_SH
>  	ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
>  endef
>  endif
> +endif
>  TARGET_FINALIZE_HOOKS += SKELETON_BIN_SH
>  
>  ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> diff --git a/system/Config.in b/system/Config.in
> index 3ddf843..b47ae43 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -298,7 +298,6 @@ endchoice # /bin/sh
>  
>  config BR2_SYSTEM_BIN_SH
>  	string
> -	default "busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
>  	default "bash"    if BR2_SYSTEM_BIN_SH_BASH
>  	default "dash"    if BR2_SYSTEM_BIN_SH_DASH
>  	default "mksh"    if BR2_SYSTEM_BIN_SH_MKSH
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

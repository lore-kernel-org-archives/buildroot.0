From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jul 2014 18:43:52 +0200
Subject: [Buildroot] [PATCH 5/6] systemd: add hook to fix /run, /var
In-Reply-To: <1404406659-31109-6-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1404406659-31109-6-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <53BACE48.2070603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/14 18:57, Eric Le Bihan wrote:
> Add a post installation hook to fix target runtime data directories
> /var/{lock,run,tmp} and /run. Theses directories will be populated by
> systemd according to the configuration files from /usr/lib/tmpfiles.d.

 I don't understand why this is needed, or how this can work...

 Currently, /run, /var/run, /var/lock, and /var/tmp are all symlinks to /tmp
where a tmpfs is mounted. I would expect that this is OK for systemd.

 With this change, /run no longer links to /tmp, but it becomes a directory on
the rootfs. So unless systemd mounts a tmpfs on /run, this won't work at all.
And on my Debian sid system which uses systemd, I see that /run is mounted in
/init in the initramfs, so before systemd is started. We don't do that in
buildroot, so how can this work?


 Regards,
 Arnout


> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/systemd/systemd.mk |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 25bea0b..2da65e6 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -149,11 +149,24 @@ define SYSTEMD_SANITIZE_PATH_IN_UNITS
>  		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
>  endef
>  
> +# /var/{lock,run,tmp} and /run will be populated at runtime by Systemd
> +# according to the configuration files from /usr/lib/tmpfiles.d/.
> +define SYSTEMD_FIX_RUNTIME_DIRS_HOOK
> +	$(RM) -rf $(TARGET_DIR)/var/lock
> +	$(RM) -rf $(TARGET_DIR)/var/run
> +	$(RM) -rf $(TARGET_DIR)/var/tmp
> +	ln -sf ../run $(TARGET_DIR)/var/run
> +	ln -sf ../run $(TARGET_DIR)/var/lock
> +	$(RM) -rf $(TARGET_DIR)/run
> +	mkdir -p $(TARGET_DIR)/run
> +endef
> +
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  	SYSTEMD_INSTALL_INIT_HOOK \
>  	SYSTEMD_INSTALL_TTY_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK \
>  	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
> +	SYSTEMD_FIX_RUNTIME_DIRS_HOOK \
>  	SYSTEMD_SANITIZE_PATH_IN_UNITS
>  
>  define SYSTEMD_USERS
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

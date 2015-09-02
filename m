From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Sep 2015 22:59:52 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
References: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55E76348.3020509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-09-15 00:55, Yann E. MORIN wrote:
> systemd is incresaingly expected things to live in /usr/bin or

 increasingly

> /usr/sbin.
> 
> However, a lot of packages stil install stuff directly into /bin or

 still

> /sbin.
> 
> Add an option so that /bin and /sbin be symlinks to /usr/bin and

 be -> are

> /usr/sbin. Ditto for .lib for consistency.

 .lib -> /lib

 In reality, this option is only tangentially related to systemd. Rather, it's a
Fedora feature [1] that was taken over by Lennart P. and therefore by systemd
[2]. A better name for the feature is "merged /usr".


> That option is forcibly enabled when the init system is systemd.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/skeleton/skeleton.mk | 17 ++++++++++++++++-
>  system/Config.in             | 13 +++++++++++++
>  system/skeleton/bin/.empty   |  0
>  system/skeleton/lib/.empty   |  0
>  system/skeleton/sbin/.empty  |  0
>  5 files changed, 29 insertions(+), 1 deletion(-)
>  delete mode 100644 system/skeleton/bin/.empty
>  delete mode 100644 system/skeleton/lib/.empty
>  delete mode 100644 system/skeleton/sbin/.empty
> 
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 48e7085..173b485 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -19,14 +19,29 @@ else
>  SKELETON_PATH = system/skeleton
>  endif
>  
> +ifeq ($(BR2_ROOTFS_USR_SYMLINKS),y)
> +define SKELETON_USR_SYMLINKS
> +	ln -snf usr/bin $(TARGET_DIR)/bin
> +	ln -snf usr/sbin $(TARGET_DIR)/sbin
> +	ln -snf usr/lib $(TARGET_DIR)/lib
> +endef
> +else
> +define SKELETON_NO_USR_SYMLINKS

 I would define only a single variable: SKELETON_USR_SYMLINKS_OR_DIRECTORIES.

> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/bin
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/sbin
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib
> +endef
> +endif
> +
>  define SKELETON_INSTALL_TARGET_CMDS
>  	rsync -a --ignore-times $(SYNC_VCS_EXCLUSIONS) \
>  		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  		$(SKELETON_PATH)/ $(TARGET_DIR)/
> +	$(SKELETON_NO_USR_SYMLINKS)
> +	$(SKELETON_USR_SYMLINKS)
>  	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
>  		$(TARGET_DIR_WARNING_FILE)
>  	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
> -	mkdir -p $(TARGET_DIR)/usr
>  	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
>  endef
>  
> diff --git a/system/Config.in b/system/Config.in
> index fad829d..96860d1 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -88,6 +88,7 @@ config BR2_INIT_SYSTEMD
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> +	select BR2_ROOTFS_USR_SYMLINKS
>  	select BR2_PACKAGE_SYSTEMD
>  
>  comment 'systemd needs an (e)glibc toolchain, headers >= 3.10'
> @@ -178,6 +179,18 @@ endif
>  
>  if BR2_ROOTFS_SKELETON_DEFAULT
>  
> +config BR2_ROOTFS_USR_SYMLINKS
> +	bool "Use symlinks to /usr for /bin, /sbin and /lib"

 I like this summary!

> +	help
> +	  If you say 'n' here, then /bin /sbin and /lib and their
> +	  counterparts in /usr will be separate directories. This
> +	  is the traditional UNIX way. In this case, /usr can be a
> +	  partition separate from / .
> +
> +	  If you say 'y' here, then /bin /sbin and /lib will be symlinks

 If you say 'y' here, then /bin, /sbin and /lib will be merged to their
counterparts in /usr and replaced by symlinks.

> +	  to their counterparts in /usr. This is the new systemd way. In

 There's not much point to refer to systemd here, since it is forcibly selected
in the systemd case.

> +	  this case, /usr has to be on the / partition.

 /usr cannot be a separate filesystem.


 BTW I wouldn't mind if this option would default to y eventually. I've been
doing this (using a custom skeleton) for quite a while now.

 Regards,
 Arnout


> +
>  config BR2_TARGET_ENABLE_ROOT_LOGIN
>  	bool "Enable root login with password"
>  	default y
> diff --git a/system/skeleton/bin/.empty b/system/skeleton/bin/.empty
> deleted file mode 100644
> index e69de29..0000000
> diff --git a/system/skeleton/lib/.empty b/system/skeleton/lib/.empty
> deleted file mode 100644
> index e69de29..0000000
> diff --git a/system/skeleton/sbin/.empty b/system/skeleton/sbin/.empty
> deleted file mode 100644
> index e69de29..0000000
> 

[1] https://fedoraproject.org/wiki/Features/UsrMove
[2] http://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

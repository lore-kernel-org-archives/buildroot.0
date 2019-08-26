From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2019 23:33:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: add configs to select
 which binaries are built
In-Reply-To: <20190826173751.13832-1-alejandro.gonzalez.correo@gmail.com>
References: <20190826173751.13832-1-alejandro.gonzalez.correo@gmail.com>
Message-ID: <afec5004-19b6-58d1-e818-e4af4303411d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alejandro,

On 26/08/2019 19:37, Alejandro Gonz?lez wrote:
> By default, the iputils build script might build binaries which are
> useless for certain applications, like tftpd. Those binaries will bloat
> the target filesystem unless a post-build script removes them manually,
> which is cumbersome and doesn't shorten build times.

 Generally, we only add such options if the space savings are significant. Could
you indicate how much can be saved? It's sufficient to just compare the size of
1 tool with the size of all together (and for good measure, the total filesystem
size as well).


> 
> These changes add Kconfig options which let the user select what
> binaries are built with ease.
> 
> Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
> ---
>  package/iputils/Config.in  |  64 ++++++++++++++++++++
>  package/iputils/iputils.mk | 119 ++++++++++++++++++++++++++++++-------
>  2 files changed, 163 insertions(+), 20 deletions(-)
> 
> diff --git a/package/iputils/Config.in b/package/iputils/Config.in
> index b5d9141a7d..cb3d03072a 100644
> --- a/package/iputils/Config.in
> +++ b/package/iputils/Config.in
> @@ -7,3 +7,67 @@ config BR2_PACKAGE_IPUTILS
>  	  etc.
>  
>  	  https://github.com/iputils/iputils
[snip]
> +config BR2_PACKAGE_IPUTILS_NINFOD
> +	bool "ninfod"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>

 It also requires a crypto package, according to the .mk file. So you should add
something like:

	select BR2_PACKAGE_NETTLE if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_OPENSSL

> +	default y
> +	help
> +	  Installs ninfod.
> +
> +endif
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 4a06581790..291114abb9 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -17,6 +17,68 @@ IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
>  IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
>  IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  
> +# Selectively build binaries
> +
> +ifeq ($(BR2_PACKAGE_IPUTILS_ARPING),y)
> +IPUTILS_CONF_OPTS += -DBUILD_ARPING=true
> +else
> +IPUTILS_CONF_OPTS += -DBUILD_ARPING=false
> +endif

 Since no dependencies need to be added here, we generally prefer the following
pattern:

IPUTILS_CONF_OPTS = \
	-DBUID_ARPING=$(if $(BR2_PACKAGE_IPUTILS_ARPING),true,false) \
	...

(but it's not so important)

 On the other hand, we also like it if a condition is checked only once, and all
modifications that need to be done for that condition are collected below it. So
you'd have something like:

ifeq ($(BR2_PACKAGE_IPUTILS_ARPING),y)
IPUTILS_CONF_OPTS += -DBUILD_ARPING=true
... define hook
... add arping to permissions
else
IPUTILS_CONF_OPTS += -DBUILD_ARPING=false
endif

 However, the "add arping to permissions" bit is not so easy to do :-(

[snip]
>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  IPUTILS_CONF_OPTS += -DUSE_CAP=true
>  IPUTILS_DEPENDENCIES += libcap
> @@ -49,57 +111,74 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
>  IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false

 This bit can be removed since it's already handled by the Config.in.

>  endif
>  
> -# ninfod requires <pthread.h>
> -ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
> -endif
> -
>  ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
>  IPUTILS_CONF_OPTS += -DUSE_GETTEXT=true
>  else
>  IPUTILS_CONF_OPTS += -DUSE_GETTEXT=false
>  endif
>  
> -IPUTILS_CONF_OPTS += -DBUILD_TRACEROUTE6=true
> -
>  # XSL Stylesheets for DocBook 5 not packaged for buildroot
>  IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false
>  
>  # move iputils binaries to the same location as where Busybox installs
>  # the corresponding applets, so that we have a single version of the
>  # tools (from iputils)
> -define IPUTILS_MOVE_BINARIES
> +define IPUTILS_MOVE_ARPING_BINARY
>  	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
> +endef
> +ifeq ($(BR2_PACKAGE_IPUTILS_ARPING),y)

 For hooks, we generally also put the hook definition inside the condition. So
just move the ifeq just before the define.

> +IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_ARPING_BINARY
> +endif
> +
> +define IPUTILS_MOVE_PING_BINARY
>  	$(if $(BR2_ROOTFS_MERGED_USR),,\

 This could be simplified together with the ping condition, into:

ifeq ($(BR2_PACKAGE_IPUTILS_PING):$(BR2_ROOTFS_MERGED_USR),y:)
define IPUTILS_MOVE_PING_BINARY
	mv $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping)
endef
IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_PING_BINARY
endif

>  		mv $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping)
> +endef
> +ifeq ($(BR2_PACKAGE_IPUTILS_PING),y)
> +IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_PING_BINARY
> +endif
> +
> +define IPUTILS_MOVE_TFTPD_BINARY
>  	mv $(TARGET_DIR)/usr/bin/tftpd $(TARGET_DIR)/usr/sbin/tftpd
>  endef
> -IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_BINARIES
> +ifeq ($(BR2_PACKAGE_IPUTILS_TFTPD),y)
> +IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_TFTPD_BINARY
> +endif
>  
>  # upstream requires distros to create symlink
>  define IPUTILS_CREATE_PING6_SYMLINK
>  	ln -sf $(TARGET_DIR)/bin/ping $(TARGET_DIR)/bin/ping6
>  endef
> +ifeq ($(BR2_PACKAGE_IPUTILS_PING),y)
>  IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
> +endif
>  
>  # handle permissions ourselves
>  IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
>  ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
>  define IPUTILS_PERMISSIONS
> -	/usr/sbin/arping      f 755 0 0 - - - - -
> -	/usr/bin/clockdiff    f 755 0 0 - - - - -
> -	|xattr cap_net_raw+p
> -	/bin/ping             f 755 0 0 - - - - -
> -	|xattr cap_net_raw+p
> -	/usr/bin/traceroute6  f 755 0 0 - - - - -
> -	|xattr cap_net_raw+p
> +	$(if $(BR2_PACKAGE_IPUTILS_ARPING),y,\

 I guess you haven't tested this, because it's wrong :-) $(if ...) is not like
ifeq, it can only check for non-empty. So if should be

	$(if $(BR2_PACKAGE_IPUTILS_ARPING),\


 This is getting pretty ugly though... But I don't see an easy way to make it
better.

 Regards,
 Arnout

> +		/usr/sbin/arping      f 755 0 0 - - - - -)
> +	$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),y,\
> +		/usr/bin/clockdiff    f 755 0 0 - - - - -
> +		|xattr cap_net_raw+p)
> +	$(if $(BR2_PACKAGE_IPUTILS_PING),y,\
> +		/bin/ping             f 755 0 0 - - - - -
> +		|xattr cap_net_raw+p)
> +	$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),y,\
> +		/usr/bin/traceroute6  f 755 0 0 - - - - -
> +		|xattr cap_net_raw+p)
>  endef
>  else
>  define IPUTILS_PERMISSIONS
> -	/usr/sbin/arping      f  755 0 0 - - - - -
> -	/usr/bin/clockdiff    f 4755 0 0 - - - - -
> -	/bin/ping             f 4755 0 0 - - - - -
> -	/usr/bin/traceroute6  f 4755 0 0 - - - - -
> +	$(if $(BR2_PACKAGE_IPUTILS_ARPING),y,\
> +		/usr/sbin/arping      f  755 0 0 - - - - -)
> +	$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),y,\
> +		/usr/bin/clockdiff    f 4755 0 0 - - - - -)
> +	$(if $(BR2_PACKAGE_IPUTILS_PING),y,\
> +		/bin/ping             f 4755 0 0 - - - - -)
> +	$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),y,\
> +		/usr/bin/traceroute6  f 4755 0 0 - - - - -)
>  endef
>  endif
>  
> 

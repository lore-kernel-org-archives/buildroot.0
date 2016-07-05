From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jul 2016 09:49:04 +0200
Subject: [Buildroot] [PATCH 18/24 v2] package/skeleton-sysv: split into
 skeleton-common
In-Reply-To: <08822ae5-4462-c666-b22e-8b9f2e6bd6ec@gmail.com>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <d94b8f876ad9ec2e439cccf25eb0c08384a93d02.1466622379.git.yann.morin.1998@free.fr>
 <08822ae5-4462-c666-b22e-8b9f2e6bd6ec@gmail.com>
Message-ID: <20160705074904.GD6533@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-03 13:05 +0200, Romain Naour spake thusly:
> Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> > Add skeleton-common, the base skeleton shared between the sysv/busybox
> > and systemd skeletons (the latter to come in followup patches).
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
[--SNIP--]
> > diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
> > new file mode 100644
> > index 0000000..544cce7
> > --- /dev/null
> > +++ b/package/skeleton-common/skeleton-common.mk
> > @@ -0,0 +1,99 @@
> > +################################################################################
> > +#
> > +# skeleton-common
> > +#
> > +################################################################################
> > +
> > +SKELETON_COMMON_SOURCE =
> > +
> > +SKELETON_COMMON_ADD_TOOLCHAIN_DEPENDENCY = NO
> > +SKELETON_COMMON_ADD_SKELETON_DEPENDENCY = NO
> > +
> > +SKELETON_COMMON_INSTALL_STAGING = YES
> > +
> > +SKELETON_COMMON_PATH = system/skeleton
> > +
> > +# Provided by the 'skeleton' package:
> > +# - SKELETON_USR_SYMLINKS_OR_DIRS
> > +# - SKELETON_LIB_SYMLINK
> > +
> > +SKELETON_COMMON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
> > +SKELETON_COMMON_TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
> > +SKELETON_COMMON_TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
> > +SKELETON_COMMON_TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
> > +SKELETON_COMMON_TARGET_GENERIC_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
> > +
> > +ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
> > +ifeq ($(SKELETON_TARGET_GENERIC_ROOT_PASSWD),)
> > +SKELETON_ROOT_PASSWORD =
> 
> SKELETON_ROOT_PASSWORD should be renamed to SKELETON_COMMON_ROOT_PASSWORD ?

Done.

> > +else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)),)
> > +SKELETON_ROOT_PASSWORD = '$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)'
> > +else
> > +SKELETON_DEPENDENCIES += host-mkpasswd
> 
> s/SKELETON_DEPENDENCIES/SKELETON_COMMON_DEPENDENCIES/ even if mkpasswd is used
> in a target finalize hook.

Done.

Thanks! :-)

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> > +# This variable will only be evaluated in the finalize stage, so we can
> > +# be sure that host-mkpasswd will have already been built by that time.
> > +SKELETON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_TARGET_GENERIC_PASSWD_METHOD)" "$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)"`"
> > +endif
> > +else # !BR2_TARGET_ENABLE_ROOT_LOGIN
> > +SKELETON_ROOT_PASSWORD = "*"
> > +endif
> > +
> > +define SKELETON_COMMON_INSTALL_TARGET_CMDS
> > +	$(call SKELETON_RSYNC,$(SKELETON_COMMON_PATH),$(TARGET_DIR))
> > +	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
> > +	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
> > +	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
> > +	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
> > +		$(TARGET_DIR_WARNING_FILE)
> > +endef
> > +
> > +# For the staging dir, we don't really care about /bin and /sbin.
> > +# But for consistency with the target dir, and to simplify the code,
> > +# we still handle them for the merged or non-merged /usr cases.
> > +# Since the toolchain is not yet available, the staging is not yet
> > +# populated, so we need to create the directories in /usr
> > +define SKELETON_COMMON_INSTALL_STAGING_CMDS
> > +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
> > +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
> > +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
> > +	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
> > +	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
> > +	ln -snf lib $(STAGING_DIR)/$(SKELETON_LIB_SYMLINK)
> > +	ln -snf lib $(STAGING_DIR)/usr/$(SKELETON_LIB_SYMLINK)
> > +endef
> > +
> > +ifneq ($(SKELETON_COMMON_TARGET_GENERIC_HOSTNAME),)
> > +define SKELETON_COMMON_SET_HOSTNAME
> > +	mkdir -p $(TARGET_DIR)/etc
> > +	echo "$(SKELETON_COMMON_TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
> > +	$(SED) '$$a \127.0.1.1\t$(SKELETON_COMMON_TARGET_GENERIC_HOSTNAME)' \
> > +		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
> > +endef
> > +SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_HOSTNAME
> > +endif
> > +
> > +ifneq ($(SKELETON_COMMON_TARGET_GENERIC_ISSUE),)
> > +define SKELETON_COMMON_SET_ISSUE
> > +	mkdir -p $(TARGET_DIR)/etc
> > +	echo "$(SKELETON_COMMON_TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
> > +endef
> > +SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_ISSUE
> > +endif
> > +
> > +define SKELETON_COMMON_SET_ROOT_PASSWD
> > +	$(SED) s,^root:[^:]*:,root:$(SKELETON_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
> > +endef
> > +SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_ROOT_PASSWD
> > +
> > +ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
> > +define SKELETON_COMMON_BIN_SH
> > +	rm -f $(TARGET_DIR)/bin/sh
> > +endef
> > +else
> > +define SKELETON_COMMON_BIN_SH
> > +	ln -sf $(SKELETON_COMMON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
> > +endef
> > +endif
> > +SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_BIN_SH
> > +
> > +$(eval $(generic-package))
> > diff --git a/package/skeleton-sysv/Config.in b/package/skeleton-sysv/Config.in
> > index 95c796f..2f6dbd9 100644
> > --- a/package/skeleton-sysv/Config.in
> > +++ b/package/skeleton-sysv/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_SKELETON_SYSV
> >  	bool
> >  	select BR2_PACKAGE_HAS_SKELETON
> > +	select BR2_PACKAGE_SKELETON_COMMON
> >  
> >  config BR2_PACKAGE_PROVIDES_SKELETON
> >  	default "skeleton-sysv" if BR2_PACKAGE_SKELETON_SYSV
> > diff --git a/package/skeleton-sysv/skeleton-sysv.mk b/package/skeleton-sysv/skeleton-sysv.mk
> > index aa0b65c..6e15b15 100644
> > --- a/package/skeleton-sysv/skeleton-sysv.mk
> > +++ b/package/skeleton-sysv/skeleton-sysv.mk
> > @@ -8,6 +8,8 @@ SKELETON_SYSV_SOURCE =
> >  
> >  SKELETON_SYSV_PROVIDES = skeleton
> >  
> > +SKELETON_SYSV_DEPENDENCIES = skeleton-common
> > +
> >  SKELETON_SYSV_ADD_TOOLCHAIN_DEPENDENCY = NO
> >  SKELETON_SYSV_ADD_SKELETON_DEPENDENCY = NO
> >  
> > @@ -27,48 +29,6 @@ SKELETON_SYSV_INSTALL_STAGING = YES
> >  # - SKELETON_SET_NETWORK_IFUPDOWN_LOOPBACK
> >  # - SKELETON_SET_NETWORK_IFUPDOWN_DHCP
> >  
> > -define SKELETON_INSTALL_TARGET_CMDS
> > -	$(call SKELETON_RSYNC,system/skeleton,$(TARGET_DIR))
> > -	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
> > -	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
> > -	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
> > -	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
> > -		$(TARGET_DIR_WARNING_FILE)
> > -endef
> > -
> > -# For the staging dir, we don't really care about /bin and /sbin.
> > -# But for consistency with the target dir, and to simplify the code,
> > -# we still handle them for the merged or non-merged /usr cases.
> > -# Since the toolchain is not yet available, the staging is not yet
> > -# populated, so we need to create the directories in /usr
> > -define SKELETON_SYSV_INSTALL_STAGING_CMDS
> > -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
> > -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
> > -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
> > -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
> > -	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
> > -	ln -snf lib $(STAGING_DIR)/$(SKELETON_LIB_SYMLINK)
> > -	ln -snf lib $(STAGING_DIR)/usr/$(SKELETON_LIB_SYMLINK)
> > -endef
> > -
> > -ifneq ($(SKELETON_TARGET_GENERIC_HOSTNAME),)
> > -define SKELETON_SYSV_SET_HOSTNAME
> > -	mkdir -p $(TARGET_DIR)/etc
> > -	echo "$(SKELETON_TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
> > -	$(SED) '$$a \127.0.1.1\t$(SKELETON_TARGET_GENERIC_HOSTNAME)' \
> > -		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
> > -endef
> > -SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_SET_HOSTNAME
> > -endif
> > -
> > -ifneq ($(SKELETON_TARGET_GENERIC_ISSUE),)
> > -define SKELETON_SYSV_SET_ISSUE
> > -	mkdir -p $(TARGET_DIR)/etc
> > -	echo "$(SKELETON_TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
> > -endef
> > -SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_SET_ISSUE
> > -endif
> > -
> >  define SKELETON_SYSV_SET_NETWORK
> >  	mkdir -p $(TARGET_DIR)/etc/network/
> >  	$(SKELETON_SET_NETWORK_IFUPDOWN_LOOPBACK)
> > @@ -76,22 +36,6 @@ define SKELETON_SYSV_SET_NETWORK
> >  endef
> >  SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_SET_NETWORK
> >  
> > -define SKELETON_SYSV_SET_ROOT_PASSWD
> > -	$(SED) s,^root:[^:]*:,root:$(SKELETON_SYSV_ROOT_PASSWORD):, $(TARGET_DIR)/etc/shadow
> > -endef
> > -SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_SET_ROOT_PASSWD
> > -
> > -ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
> > -define SKELETON_SYSV_BIN_SH
> > -	rm -f $(TARGET_DIR)/bin/sh
> > -endef
> > -else
> > -define SKELETON_SYSV_BIN_SH
> > -	ln -sf $(SKELETON_TARGET_GENERIC_BIN_SH) $(TARGET_DIR)/bin/sh
> > -endef
> > -endif
> > -SKELETON_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_SYSV_BIN_SH
> > -
> >  ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> >  ifeq ($(BR2_INIT_SYSV),y)
> >  # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
> > diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> > index b791650..d93f939 100644
> > --- a/package/skeleton/skeleton.mk
> > +++ b/package/skeleton/skeleton.mk
> > @@ -16,10 +16,6 @@ $(eval $(virtual-package))
> >  # The following definitions are to be used by the specific skeletons:
> >  # - SKELETON_USR_SYMLINKS_OR_DIRS
> >  # - SKELETON_LIB_SYMLINK
> > -# - SKELETON_TARGET_GENERIC_HOSTNAME
> > -# - SKELETON_TARGET_GENERIC_ISSUE
> > -# - SKELETON_TARGET_ROOT_PASSWD
> > -# - SKELETON_TARGET_GENERIC_BIN_SH
> >  # - SKELETON_TARGET_GENERIC_GETTY_PORT
> >  # - SKELETON_TARGET_GENERIC_GETTY_BAUDRATE
> >  # - SKELETON_TARGET_GENERIC_GETTY_TERM
> > @@ -58,11 +54,7 @@ else
> >  SKELETON_LIB_SYMLINK = lib32
> >  endif
> >  
> > -SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
> > -SKELETON_TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
> > -SKELETON_TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
> > -SKELETON_TARGET_GENERIC_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
> > -SKELETON_TARGET_GENERIC_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
> > +# The various init systems have different ways of dealing with those:
> >  SKELETON_TARGET_GENERIC_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
> >  SKELETON_TARGET_GENERIC_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
> >  SKELETON_TARGET_GENERIC_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
> > @@ -93,18 +85,3 @@ define SKELETON_SET_NETWORK_IFUPDOWN_DHCP
> >  		$(TARGET_DIR)/etc/network/nfs_check
> >  endef
> >  endif
> > -
> > -ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
> > -ifeq ($(SKELETON_TARGET_GENERIC_ROOT_PASSWD),)
> > -SKELETON_ROOT_PASSWORD =
> > -else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)),)
> > -SKELETON_ROOT_PASSWORD = '$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)'
> > -else
> > -SKELETON_DEPENDENCIES += host-mkpasswd
> > -# This variable will only be evaluated in the finalize stage, so we can
> > -# be sure that host-mkpasswd will have already been built by that time.
> > -SKELETON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_TARGET_GENERIC_PASSWD_METHOD)" "$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)"`"
> > -endif
> > -else # !BR2_TARGET_ENABLE_ROOT_LOGIN
> > -SKELETON_ROOT_PASSWORD = "*"
> > -endif
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

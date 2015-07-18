From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 15:22:08 +0200
Subject: [Buildroot] [PATCH v9 06/15] linux-pam: selinux support
In-Reply-To: <1436905227-26937-7-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436905227-26937-7-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150718152208.2fe2534e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue, 14 Jul 2015 15:20:18 -0500, Clayton Shotwell wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

This commit is far too complicated to not have any commit log, and I
believe it would benefit from being split in several smaller commits,
such as (an example, other splits might make more sense) :

 * Adding the host-linux-pam variant

 * Adding the optional selinux and audit dependencies

 * Adding the pam.d mess-up logic.

> diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
> index 26b627e..72ead8e 100644
> --- a/package/linux-pam/linux-pam.mk
> +++ b/package/linux-pam/linux-pam.mk
> @@ -8,6 +8,9 @@ LINUX_PAM_VERSION = 1.1.8
>  LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
>  LINUX_PAM_SITE = http://linux-pam.org/library
>  LINUX_PAM_INSTALL_STAGING = YES
> +
> +# lckpwdf is included with shadow
> +# cracklib and libdb are not currently present in buildroot

What is lckpwdf ? What are you adding a reference to it here?

>  LINUX_PAM_CONF_OPTS = \
>  	--disable-prelude \
>  	--disable-isadir \
> @@ -15,8 +18,10 @@ LINUX_PAM_CONF_OPTS = \
>  	--disable-db \
>  	--disable-regenerate-docu \
>  	--enable-securedir=/lib/security \
> +	--disable-cracklib \

Maybe put it next to --disable-db, instead of in the middle of the
directory related options.

>  	--libdir=/lib
> -LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf
> +
> +LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf host-linux-pam

Do we need this new host-linux-pam dependency in all situations? We
only need it when this new system-auth.pam file needs to be used. It
used to work just fine until now without that. Can you comment as to
what you're trying to achieve with this system-auth.pam file, and in
which situations do we need it vs. not need it ?

>  LINUX_PAM_AUTORECONF = YES
>  LINUX_PAM_LICENSE = BSD-3c
>  LINUX_PAM_LICENSE_FILES = Copyright
> @@ -26,12 +31,61 @@ LINUX_PAM_DEPENDENCIES += gettext
>  LINUX_PAM_MAKE_OPTS += LIBS=-lintl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +	LINUX_PAM_CONF_OPTS += --enable-selinux
> +	LINUX_PAM_DEPENDENCIES += libselinux
> +else
> +	LINUX_PAM_CONF_OPTS += --disable-selinux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +	LINUX_PAM_CONF_OPTS += --enable-audit
> +	LINUX_PAM_DEPENDENCIES += audit
> +else
> +	LINUX_PAM_CONF_OPTS += --disable-audit
> +endif

Indentation is wrong: we don't indent such lines (I know some packages
do not respect this, but we should fix them).

> +
>  # Install default pam config (deny everything)
>  define LINUX_PAM_INSTALL_CONFIG
>  	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
>  		$(TARGET_DIR)/etc/pam.d/other
>  endef
>  
> +# Use the host-pam pam_conv1 app to create the pam.d files
> +define LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
> +	if [ -d $(TARGET_DIR)/etc/pam.d/ ]; then \
> +		mv $(TARGET_DIR)/etc/pam.d/ $(TARGET_DIR)/etc/pam.d.orig/; \
> +	fi; \
> +	cd $(TARGET_DIR)/etc/ && \
> +	cat $(@D)/conf/pam.conf | $(HOST_DIR)/usr/bin/pam_conv1; \
> +	if [ -d $(TARGET_DIR)/etc/pam.d.orig ]; then \
> +		cp -a $(TARGET_DIR)/etc/pam.d/* $(TARGET_DIR)/etc/pam.d.orig/; \
> +		rm -rf $(TARGET_DIR)/etc/pam.d/; \
> +		mv $(TARGET_DIR)/etc/pam.d.orig/ $(TARGET_DIR)/etc/pam.d/; \
> +	fi;
> +	$(INSTALL) -D -m 0644 package/linux-pam/system-auth.pamd $(TARGET_DIR)/etc/pam.d/system-auth

Why do you have all those lines in a single shell command? I don't
really see the reason. Something like:

	if [ -d $(TARGET_DIR)/etc/pam.d/ ]; then \
		mv $(TARGET_DIR)/etc/pam.d/ $(TARGET_DIR)/etc/pam.d.orig/; \
	fi
	cd $(TARGET_DIR)/etc/ && cat $(@D)/conf/pam.conf | $(HOST_DIR)/usr/bin/pam_conv1
	if [ -d $(TARGET_DIR)/etc/pam.d.orig ]; then \
		cp -a $(TARGET_DIR)/etc/pam.d/* $(TARGET_DIR)/etc/pam.d.orig/; \
		rm -rf $(TARGET_DIR)/etc/pam.d/; \
		mv $(TARGET_DIR)/etc/pam.d.orig/ $(TARGET_DIR)/etc/pam.d/; \
	fi
	$(INSTALL) -D -m 0644 package/linux-pam/system-auth.pamd $(TARGET_DIR)/etc/pam.d/system-auth

Should work just as well.

However, I don't quite understand what is happening here. What is
installed in /etc/pam.d/ before linux-pam gets installed? Maybe
nothing, in which case we could avoid the pam.d.orig dance altogether ?

In any case, this needs a better comment above it to explain what's
going on. And you are doing all this unconditionally, regardless of
whether SELinux support is used or not, which seems a bit weird.

> +endef
> +
> +LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
>  LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_INSTALL_CONFIG
>  
> +HOST_LINUX_PAM_DEPENDENCIES = host-flex host-pkgconf
> +
> +HOST_LINUX_PAM_CONF_OPTS = --disable-rpath \

--disable-rpath should be on the next line.

> +               --enable-read-both-confs \
> +               --disable-regenerate-docu \
> +               --disable-isadir \
> +               --disable-nis \
> +               --enable-securedir=/lib/security \
> +               --disable-prelude \
> +               --disable-cracklib \
> +               --disable-lckpwdf \
> +               --disable-db \
> +               --disable-selinux \
> +               --disable-audit \

Use one tab for indentation.

> +
> +define HOST_LINUX_PAM_INSTALL_CMDS
> +	$(INSTALL) -m 755 $(@D)/conf/pam_conv1/pam_conv1 $(HOST_DIR)/usr/bin/

-D + full path for the destination.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

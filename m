From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Dec 2016 21:25:08 +0100
Subject: [Buildroot] [PATCH v13 4/8] util-linux: selinux, audit,
 and pam support
In-Reply-To: <1477423570-15694-4-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <1477423570-15694-4-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <20161206212508.44fc1232@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 14:26:06 -0500, Bryce Ferguson wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> This patch adds optional libselinux ,audit and pam support to linux utilities.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>

There are a few things I don't like in this patch. I'm going to submit
two alternative patches as a replacement. I'm interested in your
feedback about those replacement patches (especially if they work fine
for you).


> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +UTIL_LINUX_DEPENDENCIES += libselinux
> +UTIL_LINUX_CONF_OPTS += --with-selinux
> +else
> +UTIL_LINUX_CONF_OPTS += --without-selinux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +UTIL_LINUX_DEPENDENCIES += audit
> +UTIL_LINUX_CONF_OPTS += --with-audit
> +else
> +UTIL_LINUX_CONF_OPTS += --without-audit
> +endif

As was already stated, optional audit support is already in
util-linux.mk.

> +
>  # Used by cramfs utils
>  UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
>  
> @@ -179,9 +193,25 @@ define UTIL_LINUX_INSTALL_PAMFILES
>  	$(INSTALL) -m 0644 package/util-linux/su.pam \
>  		$(TARGET_DIR)/etc/pam.d/su-l
>  endef
> +
> +# Add the required hooks to the pam files if SELinux is enabled
> +# SED expression adds these lines to /etc/pam.d/login,/etc/pam.d/su-l and /etc/pam.d/su files
> +#   session		required	pam_selinux.so close
> +#   session		required	pam_selinux.so open
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +define UTIL_LINUX_FIXUP_PAMFILES
> +	for file in login su su-l ; do \
> +		$(SED) '/selinux/d' $(TARGET_DIR)/etc/pam.d/$${file}; \
> +		$(SED) '0,/session/s/session/session		required	pam_selinux.so close\nsession/' $(TARGET_DIR)/etc/pam.d/$${file}; \
> +		echo "session		required	pam_selinux.so open" >> $(TARGET_DIR)/etc/pam.d/$${file}; \
> +	done
> +endef
> +endif

I don't like this, for two reasons:

 - The SED expressions are really really complicated.

 - You're tweaking /etc/pam.d/login, which has not been installed by
   this package, but by the linux-pam package.

See my alternate proposal, which I'll send in a few minutes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

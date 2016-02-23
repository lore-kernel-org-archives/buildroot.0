From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 23:07:51 +0100
Subject: [Buildroot] [Buildroot PATCH Selinux v10 10/11] util-linux:
 selinux, audit, and pam support
In-Reply-To: <1455603506-26138-10-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <1455603506-26138-10-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160223230751.5206e180@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Niranjan Reddy,

As usual, no commit log, even if some non-trivial things are happening
here. It is *really* important to explain what happens, otherwise
review is very difficult.

On Tue, 16 Feb 2016 11:48:25 +0530, Niranjan Reddy wrote:

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

This part is OK.

> +
>  # Used by cramfs utils
>  UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
>  
> @@ -159,9 +173,22 @@ define UTIL_LINUX_INSTALL_PAMFILES
>  	$(INSTALL) -m 0644 package/util-linux/su.pam \
>  		$(TARGET_DIR)/etc/pam.d/su-l
>  endef
> +
> +# Add the required hooks to the pam files if SELinux is enabled
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +define UTIL_LINUX_FIXUP_PAMFILES
> +	for file in login su su-l ; do \
> +		$(SED) '/selinux/d' $(TARGET_DIR)/etc/pam.d/$${file}; \
> +		$(SED) '0,/session/s/session/session		required	pam_selinux.so close\nsession/' $(TARGET_DIR)/etc/pam.d/$${file}; \
> +		echo "session		required	pam_selinux.so open" >> $(TARGET_DIR)/etc/pam.d/$${file}; \
> +	done

This *might* be OK, but I have to admit that the second SED expression
is somewhat convoluted, so it would be good to expand a bit the
explanation in the comment above.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

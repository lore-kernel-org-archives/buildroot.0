From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 14 May 2015 19:31:24 +0200
Subject: [Buildroot] [PATCH v5 05/24] audit: new package
In-Reply-To: <1431553177-7280-6-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-6-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <CAHXCMML9oehV+CVYc6_NbDa6e8YHvORvV-ipbbGGr1WKSYuXpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Clayton,

On Wed, May 13, 2015 at 11:39 PM, Clayton Shotwell
<clayton.shotwell@rockwellcollins.com> wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
[...]

> --- /dev/null
> +++ b/package/audit/audit.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# audit
> +#
> +################################################################################
> +
> +AUDIT_VERSION = 2.4.1
> +AUDIT_SITE = http://people.redhat.com/sgrubb/audit/
> +AUDIT_LICENSE = GPLv2
> +AUDIT_LICENSE_FILES = COPYING
> +
> +AUDIT_INSTALL_STAGING = YES
> +AUDIT_AUTORECONF = YES
> +
> +AUDIT_CONF_OPTS = --without-python
> +
> +ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
> +       AUDIT_DEPENDENCIES += libcap-ng
> +       AUDIT_CONF_OPTS += --with-libcap-ng=yes
> +else
> +       AUDIT_CONF_OPTS += --with-libcap-ng=no
> +endif
> +
> +ifeq ($(BR2_armeb),y)
> +       AUDIT_CONF_OPTS += --with-arm
> +endif
> +ifeq ($(BR2_arm),y)
> +       AUDIT_CONF_OPTS += --with-arm
> +endif
This could be condensed in:
ifeq ($(BR2_armeb)$(BR2_arm),y)
       AUDIT_CONF_OPTS += --with-arm
endif

> +ifeq ($(BR2_aarch64),y)
> +       AUDIT_CONF_OPTS += --with-aarch64
> +endif
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +       AUDIT_CONF_OPTS += --enable-shared=no
> +endif
> +
> +define AUDIT_INSTALL_INIT_SYSV
> +       $(INSTALL) -m 755 package/audit/S01auditd $(TARGET_DIR)/etc/init.d/
> +endef
> +
> +define AUDIT_REMOVE_STARTUP_SCRIPT_DIR
> +       $(RM) -rf $(TARGET_DIR)/etc/rc.d
> +endef
> +AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_REMOVE_STARTUP_SCRIPT_DIR
> +
> +$(eval $(autotools-package))
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel

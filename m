From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2011 00:11:25 +0200
Subject: [Buildroot] [PATCH v2] New packages: acl and attr
In-Reply-To: <4E09D306.7010201@visionsystems.de>
References: <4E09D306.7010201@visionsystems.de>
Message-ID: <20110712001125.29dab8cd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Jun 2011 15:11:34 +0200,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> +comment "acl requires attr to be built"
> +        depends on !BR2_PACKAGE_ATTR

Please get rid of this, as ATTR selects ACL, so ATTR is always visible,
and will automatically select ACL if enabled.

> Index: b/package/acl/acl.mk
> ===================================================================
> --- /dev/null
> +++ b/package/acl/acl.mk
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# acl
> +#
> +#############################################################
> +
> +ACL_VERSION = 2.2.49
> +ACL_SOURCE := acl_$(ACL_VERSION).orig.tar.gz

Use = instead of :=

> +ACL_SITE = http://ftp.debian.org/debian/pool/main/a/acl
> +ACL_INSTALL_STAGING = YES
> +ACL_DEPENDENCIES = attr
> +ACL_CONF_OPT = --enable-gettext=no
> +
> +# override installation paths, due to non-conform installation routine

Could you change the comment to something like :

# While the configuration system uses autoconf, the Makefiles are
# hand-written and do not use automake. Therefore, we have to hack
# around their deficiencies by passing installation paths.

(or something similar, at least mentioning that the root of the problem
is that automake isn't used).

> +ACL_INSTALL_STAGING_OPT = prefix=$(STAGING_DIR)/usr exec_prefix=$(TARGET_DIR)/usr PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib install-dev install-lib
> +ACL_INSTALL_TARGET_OPT = prefix=$(TARGET_DIR)/usr exec_prefix=$(TARGET_DIR)/usr install install-lib

Maybe :

ACL_COMMON_INSTALL_OPTS = 		\
	prefix=$(STAGING_DIR)/usr 	\
	exec_prefix=$(TARGET_DIR)/usr

ACL_INSTALL_STAGING_OPT = 			\
	$(ACL_COMMON_INSTALL_OPTS)		\
	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
	install-dev install-lib

ACL_INSTALL_TARGET_OPT =
	$(ACL_COMMON_INSTALL_OPTS)		\
	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
	install install-lib


> +ATTR_VERSION = 2.4.46
> +ATTR_SOURCE := attr_$(ATTR_VERSION).orig.tar.gz

= instead of :=

> +# override installation paths, due to non-conform installation routine
> +ATTR_INSTALL_STAGING_OPT = prefix=$(STAGING_DIR)/usr exec_prefix=$(STAGING_DIR)/usr PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib install-dev install-lib
> +ATTR_INSTALL_TARGET_OPT = prefix=$(TARGET_DIR)/usr exec_prefix=$(TARGET_DIR)/usr install install-lib

Same as previous package.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

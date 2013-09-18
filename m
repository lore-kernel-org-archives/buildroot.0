From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Wed, 18 Sep 2013 17:03:27 -0500
Subject: [Buildroot] [PATCH 1/1] iputils: new package
In-Reply-To: <1379533013-13209-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1379533013-13209-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <OF293F3CE4.C9BDFB06-ON86257BEA.00790EBC-86257BEA.00792B22@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Found a better way to check for uClibc and the state of IPV6 support. 
Workin on v2 of this patch.

Matt

Matt Weber <mlweber1@rockwellcollins.com> wrote on 09/18/2013 02:36:53 PM:

> From: Matt Weber <mlweber1@rockwellcollins.com>
> To: buildroot at busybox.net
> Cc: Matt Weber <mlweber1@rockwellcollins.com>
> Date: 09/18/2013 02:36 PM
> Subject: [PATCH 1/1] iputils: new package
> 
> This new package adds full versions of ping/traceroute/etc.
> 
> Built against GCC4.7 ARM, x86 uclibc IPv6 and uclibc no IPv6.
> 
> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> ---
>  package/Config.in          |    1 +
>  package/iputils/Config.in  |    7 +++++
>  package/iputils/iputils.mk |   57 +++++++++++++++++++++++++++++++++
> +++++++++++
>  3 files changed, 65 insertions(+), 0 deletions(-)
>  create mode 100644 package/iputils/Config.in
>  create mode 100644 package/iputils/iputils.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 973d32c..14ca821 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -792,6 +792,7 @@ source "package/iproute2/Config.in"
>  source "package/ipsec-tools/Config.in"
>  source "package/ipset/Config.in"
>  source "package/iptables/Config.in"
> +source "package/iputils/Config.in"
>  source "package/iw/Config.in"
>  source "package/kismet/Config.in"
>  source "package/knock/Config.in"
> diff --git a/package/iputils/Config.in b/package/iputils/Config.in
> new file mode 100644
> index 0000000..92bbea9
> --- /dev/null
> +++ b/package/iputils/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_IPUTILS
> +   bool "iputils"
> +   help
> +     This package is set of small useful utilities for Linux 
networking.
> +     It includes complete versions of ping, traceroute, etc.
> +
> +     http://sourceforge.net/projects/iputils/
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> new file mode 100644
> index 0000000..b4576cc
> --- /dev/null
> +++ b/package/iputils/iputils.mk
> @@ -0,0 +1,57 @@
> 
+################################################################################
> +#
> +# iputils
> +#
> 
+################################################################################
> +
> +IPUTILS_VERSION = 20121011
> +IPUTILS_SITE = http://www.skbuff.net/iputils/
> +IPUTILS_SOURCE = iputils-s$(IPUTILS_VERSION).tar.bz2
> +IPUTILS_LICENSE = GPLv2+ BSD-3c
> +# Only included a license file for BSD.
> +IPUTILS_LICENSE_FILES = COPYING
> +
> +IPUTILS_DEPENDENCIES = libcap libsysfs openssl
> +# Build after busybox so target ends up with this package's full
> +# versions of the applications instead of busybox applets.
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> +IPUTILS_DEPENDENCIES += busybox
> +endif
> +
> +define IPUTILS_IPV6_TARGET_CMDS
> +   $(INSTALL) -D -m 755 $(@D)/ping6       $(TARGET_DIR)/bin/ping6
> +   $(INSTALL) -D -m 755 $(@D)/tracepath6  $(TARGET_DIR)/bin/tracepath6
> +   $(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
> +endef
> +IPUTILS_IPV6_MKTARGETS = ping6 tracepath6 traceroute6
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +ifneq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
> +define IPUTILS_IPV6_TARGET_CMDS
> +endef
> +define IPUTILS_IPV6_MKTARGETS
> +endef
> +endif
> +endif
> +
> +IPUTILS_MKTARGETS = arping clockdiff ping rarpd rdisc tftpd 
> tracepath $(IPUTILS_IPV6_MKTARGETS)
> +
> +IPUTILS_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) KERNEL_INCLUDE=$
> (STAGING_DIR)/usr/include/linux \
> +      CFLAGS+="-D_GNU_SOURCE -Wstrict-prototypes -Wall -
> DCAPABILITIES -DUSE_SYSFS"
> +
> +define IPUTILS_BUILD_CMDS
> +   $(MAKE) -C $(@D) $(IPUTILS_MAKE_CMDS) DESTDIR=$(STAGING_DIR) $
> (IPUTILS_MKTARGETS)
> +endef
> +
> +define IPUTILS_INSTALL_TARGET_CMDS
> +   $(INSTALL) -D -m 755 $(@D)/arping      $(TARGET_DIR)/sbin/arping
> +   $(INSTALL) -D -m 755 $(@D)/clockdiff   $(TARGET_DIR)/bin/clockdiff
> +   $(INSTALL) -D -m 755 $(@D)/ping        $(TARGET_DIR)/bin/ping
> +   $(INSTALL) -D -m 755 $(@D)/rarpd       $(TARGET_DIR)/sbin/rarpd
> +   $(INSTALL) -D -m 755 $(@D)/rdisc       $(TARGET_DIR)/sbin/rdisc
> +   $(INSTALL) -D -m 755 $(@D)/tftpd $(TARGET_DIR)/usr/sbin/in.tftpd
> +   $(INSTALL) -D -m 755 $(@D)/tracepath   $(TARGET_DIR)/bin/tracepath
> +   $(IPUTILS_IPV6_TARGET_CMDS)
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.7.1
> 

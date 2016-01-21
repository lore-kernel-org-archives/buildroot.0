From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 22:13:24 +0100
Subject: [Buildroot] [PATCH] ifupdown: bump to version 0.8.8
In-Reply-To: <1453401915-7117-1-git-send-email-gustavo@zacarias.com.ar>
References: <1453401915-7117-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160121221324.62c48f5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Thu, 21 Jan 2016 15:45:15 -0300, Gustavo Zacarias wrote:

> -IFUPDOWN_VERSION = 0.8.2
> +IFUPDOWN_VERSION = 0.8.8
>  IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
> -IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20151205T042642Z/pool/main/i/ifupdown
> +IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160113T035819Z/pool/main/i/ifupdown
>  IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
>  IFUPDOWN_LICENSE = GPLv2+
>  IFUPDOWN_LICENSE_FILES = COPYING
> @@ -23,4 +23,13 @@ define IFUPDOWN_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) BASEDIR=$(TARGET_DIR) -C $(@D) install
>  endef
>  
> +# We need to switch from /bin/ip to /sbin/ip
> +IFUPDOWN_DEFN_FILES = can inet inet6 ipx link meta
> +define IFUPDOWN_MAKE_IP_IN_SBIN
> +	for f in $(IFUPDOWN_DEFN_FILES) ; do \
> +		$(SED) 's,/bin/ip,/sbin/ip,' $(@D)/$$f.defn ; \
> +	done
> +endef
> +IFUPDOWN_POST_PATCH_HOOKS += IFUPDOWN_MAKE_IP_IN_SBIN

For this kind of things, I think my personal preference would be to
have a real patch rather than a post patch hook.

Peter ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Nov 2014 23:09:47 +0100
Subject: [Buildroot] [PATCH 05/10] start-stop-daemon: new package
In-Reply-To: <1415969096-3032-6-git-send-email-gustavo@zacarias.com.ar>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54667DAB.5060503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/11/14 13:44, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[snip]
> diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
> new file mode 100644
> index 0000000..7a699d0
> --- /dev/null
> +++ b/package/start-stop-daemon/start-stop-daemon.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# start-stop-daemon
> +#
> +################################################################################
> +
> +START_STOP_DAEMON_VERSION = 1.16.15

 Why not 1.17.21?

> +START_STOP_DAEMON_SOURCE = dpkg_$(START_STOP_DAEMON_VERSION).tar.xz
> +START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20140616T044945Z/pool/main/d/dpkg
> +START_STOP_DAEMON_CONF_OPTS = --disable-dselect --disable-update-alternatives \
> +	--exec-prefix=/
> +START_STOP_DAEMON_DEPENDENCIES = host-pkgconf \
> +	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
> +START_STOP_DAEMON_LICENSE = GPLv2+
> +START_STOP_DAEMON_LICENSE_FILES = debian/copyright

 COPYING seems more appropriate/usual.


 Regards,
 Arnout

> +
> +define START_STOP_DAEMON_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/lib/compat
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/utils
> +endef
> +
> +define START_STOP_DAEMON_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/utils/start-stop-daemon \
> +		$(TARGET_DIR)/sbin/start-stop-daemon
> +endef
> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

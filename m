From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 18:22:28 +0100
Subject: [Buildroot] [PATCH v3 1/2] omap-u-boot-utils: add new host
	package
In-Reply-To: <1331844852-4609-2-git-send-email-luca@lucaceresoli.net>
References: <1331844852-4609-1-git-send-email-luca@lucaceresoli.net>
 <1331844852-4609-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <201203181822.28975.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 15 March 2012 21:54:11 Luca Ceresoli wrote:
[snip]
> +#############################################################
> +#
> +# omap-u-boot-utils
> +#
> +#############################################################
> +
> +OMAP_U_BOOT_UTILS_VERSION = 8aff852322
> +OMAP_U_BOOT_UTILS_SITE = git://github.com/nmenon/omap-u-boot-utils.git
> +OMAP_U_BOOT_UTILS_SITE_METHOD = git

 SITE_METHOD is actually redundant because it is derived from the
git:// prefix.  Still, I prefer this site method.

 OTOH, for the URL, I prefer tu use the http URL.  Many company
firewalls block git traffic.

> +
> +define HOST_OMAP_U_BOOT_UTILS_BUILD_CMDS
> +	$(MAKE) -C $(@D)
> +endef
> +
> +define HOST_OMAP_U_BOOT_UTILS_INSTALL_CMDS
> +	for f in gpsign pserial tagger ucmd ukermit ; do \
> +		[ -f ${HOST_DIR}/usr/bin/$$f ] || \

 Why this condition?  The result is that when you bump the version and
don't do a make clean, the old version will still be installed in the
host directory.


 Regards,
 Arnout

> +		  install -m 755 -D $(@D)/$$f ${HOST_DIR}/usr/bin/$$f ; \
> +	done
> +endef
> +
> +$(eval $(call GENTARGETS,host))
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

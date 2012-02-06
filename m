From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2012 00:39:09 +0100
Subject: [Buildroot] [PATCH 1/2] Add lpc3250loader to the host tools
In-Reply-To: <1328358091-20998-1-git-send-email-alexandre.belloni@piout.net>
References: <1328358091-20998-1-git-send-email-alexandre.belloni@piout.net>
Message-ID: <201202070039.09571.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 04 February 2012 13:21:30 Alexandre Belloni wrote:
[snip]
> diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
> new file mode 100644
> index 0000000..d66cd4a
> --- /dev/null
> +++ b/package/lpc3250loader/lpc3250loader.mk
> @@ -0,0 +1,9 @@
> +LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
> +LPC3250LOADER_VERSION = master
> +LPC3250LOADER_SITE_METHOD = git

 It's a bug in Makefile.package.in that the site method is needed here...
All the ifdefs there are wrong and should be replaced by ?=

 Anyway, since this is a host-only package, I think it should be

HOST_LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
HOST_LPC3250LOADER_VERSION = master

which works fine without the site-method.

 And finally, I think we should use a specific tag or sha instead of 'master'.

> +
> +define HOST_LPC3250LOADER_INSTALL_CMDS
> +	cp -a $(@D)/* $(HOST_DIR)/usr/bin/
 There should be an mkdir -p here, or else
for f in $(@D)/*; do $(INSTALL) -D -m 0755 $$f $(HOST_DIR)/usr/bin/$$f; done

> +endef
> +
> +$(eval $(call GENTARGETS,host))
> 

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

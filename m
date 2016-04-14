From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Apr 2016 23:59:16 +0200
Subject: [Buildroot] [PATCH v13 01/26] package/freeswitch: new package
In-Reply-To: <1460662320-1437-2-git-send-email-bernd.kuhls@t-online.de>
References: <1460662320-1437-1-git-send-email-bernd.kuhls@t-online.de>
 <1460662320-1437-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <571012B4.6010803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/14/16 21:31, Bernd Kuhls wrote:
> This commit adds freeswitch without any configured modules and with a
> minimal set of non-optional dependencies. All other dependencies and
> modules will be added by further patches in this series.
>
> PLease note that freeswitch source repo bundles some libraries which are
> also available as buildroot packages. The freeswitch build system does
> not allow to use system libraries in these cases:
>
> apr, apr-util, libsrtp, libvpx, libyuv, sofia-sip, tiff
>
> The reason are patches to these packages by the freeswitch project which
> are not yet upstream. There is an open JIRA report for this situation:
> https://freeswitch.org/jira/si/jira.issueviews:issue-html/FS-353/FS-353.html
>
> More historic infos can be found here:
> http://article.gmane.org/gmane.comp.telephony.freeswitch.devel/2715
> https://freeswitch.org/the-missing-link/
>
> In the 1.6.7 version bump libvpx & libyuv were also moved in-tree:
> https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/febe0f8dacea2d2a31902b3dc469be757f8c3c4d
> https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/44da905b4f6b3b35e94b4948fb70dec7b5071ded
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  Build-test on sh4aeb (i.e. exotic arch) with Sourcery toolchain.

  However...

[snip]
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> new file mode 100644
> index 0000000..e5f1ea5
> --- /dev/null
> +++ b/package/freeswitch/freeswitch.mk
> @@ -0,0 +1,81 @@
> +################################################################################
> +#
> +# freeswitch
> +#
> +################################################################################
> +
> +FREESWITCH_VERSION = 1.6.7
> +FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
> +FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
> +FREESWITCH_LICENSE = MPLv1.1
> +FREESWITCH_LICENSE_FILES = COPYING

  It's a shame that it takes until v13 to come to this, but the bundled 
libraries of course have different licenses... So for instance this would become

FREESWITCH_LICENSE = MPLv1.1, LGPLv2+ (sofia-sip)
FREESWITCH_LICENSE_FILES = \
	COPYING \
	libs/sofia-sip/COPYING \
	libs/sofia-sip/COPYRIGHTS
etc.

  I've uploaded the package to fossology [1] for easy analysis. But the existing 
buildroot packages can already be a good guideline.

> +
> +# required dependencies
> +FREESWITCH_DEPENDENCIES = \
> +	host-pkgconf \
> +	jpeg \
> +	libcurl \
> +	openssl \
> +	pcre \
> +	speex \
> +	sqlite \
> +	util-linux \
> +	zlib
> +
> +# freeswitch comes with pre-enabled modules, since we want to control
> +# the modules ourselves reset the upstream configuration
> +define FREESWITCH_RESET_MODULES
> +	> $(@D)/modules.conf
> +endef
> +FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_RESET_MODULES

  Note that with patch 2, this bit is no longer needed. I.e., it should be 
removed in patch 2.


  Regards,
  Arnout

[1] 
https://fossology.ist.unomaha.edu/?mod=browse&folder=1&show=quick&upload=9&item=19341

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

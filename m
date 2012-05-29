From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 May 2012 21:12:29 +0200
Subject: [Buildroot] [PATCH] New package: freerdp
In-Reply-To: <1337809509-29526-1-git-send-email-git@jlunz.de>
References: <1337809509-29526-1-git-send-email-git@jlunz.de>
Message-ID: <4FC51F9D.6000503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/23/12 23:45, Julian Lunz wrote:
[snip]
> +if BR2_PACKAGE_FREERDP
> +
> +config BR2_PACKAGE_FREERDP_WITHCUPS
> +    bool "CUPS support"
  You need to add 'select BR2_PACKAGE_CUPS'.

  But in fact, in this case I think it could be turned around: compile with
cups support if BR2_PACKAGE_CUPS is selected.  I.e., remove these
config options and in the .mk file:
[snip]
> +ifeq ($(BR2_PACKAGE_FREERDP_WITHCUPS),y)
  replace with
ifeq ($(BR2_PACKAGE_CUPS),y)


  On the other hand, for some of these (particularly alsa and Xinerama) it's
probably more user-friendly to have a config option like you have now.

> +FREERDP_CONF_OPT += -DWITH_CUPS=ON
> +FREERDP_DEPENDENCIES += cups
> +else
> +FREERDP_CONF_OPT += -DWITH_CUPS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FREERDP_WITHFFMPEG),y)
> +FREERDP_CONF_OPT += -DWITH_FFMPEG=ON
> +FREERDP_DEPENDENCIES += ffmpeg
> +else
> +FREERDP_CONF_OPT += -DWITH_FFMPEG=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FREERDP_WITHALSA),y)
> +FREERDP_CONF_OPT += -DWITH_ALSA=ON
> +FREERDP_DEPENDENCIES += alsa-utils
  Shouldn't this be alsa-lib, rather than alsa-utils?

[snip]


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

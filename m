From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 12:10:55 +0200
Subject: [Buildroot] [PATCH] espeak: add support for static builds
In-Reply-To: <1425637368-63956-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1425637368-63956-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150406121055.3ea10b9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 6 Mar 2015 10:22:48 +0000, Vicente Olivert Riera wrote:

>  define ESPEAK_BUILD_CMDS
>  	$(MAKE) -C $(@D)/src  $(TARGET_CONFIGURE_OPTS) \
> -		AUDIO="$(ESPEAK_AUDIO_BACKEND)" all
> +		AUDIO="$(ESPEAK_AUDIO_BACKEND)" \
> +		$(if $(BR2_STATIC_LIBS),speak,all)

This does not work quite well: in shared scenarios, espeak is building
four things:

 * the espeak binary
 * the speak binary
 * the libespeak.a static library
 * the libespeak.so shared library

Now, with your change, in static scenarios, you're only building the
"speak" binary. The "espeak" binary is no longer built, and neither is
the libespeak.a static library.

In such cases, if someone is really interested in being able to support
static-only build, that someone should work with upstream a proper
patch to make that possible, and then add support in Buildroot. I don't
think espeak is a very likely candidate for use in static-only
environments, so it's not worse the additional mess in Buildroot.

I've committed a patch that disables espeak when BR2_STATIC_LIBS is
enabled, and marked your patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

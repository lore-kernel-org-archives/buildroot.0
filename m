From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Oct 2013 18:10:24 +0100
Subject: [Buildroot] [PATCH 1/1] jack2: new package
In-Reply-To: <1382744168-14259-1-git-send-email-wzab01@gmail.com>
References: <1256826d-31b9-4b85-8834-35694e372fac@email.android.com>
 <1382658143-3850-1-git-send-email-wzab01@gmail.com>
 <1382744168-14259-1-git-send-email-wzab01@gmail.com>
Message-ID: <20131027181024.14201db4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech M. Zabolotny,

On Sat, 26 Oct 2013 01:36:08 +0200, Wojciech M. Zabolotny wrote:
> I corrected downloading of sources from the github, according to
> suggestion received from Thomas De Schampheleire.

This shouldn't be part of the commit log, but of the changelog. See
http://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog.

> diff --git a/package/jack2/Config.in b/package/jack2/Config.in
> new file mode 100644
> index 0000000..c82bc15
> --- /dev/null
> +++ b/package/jack2/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_JACK2
> +	bool "jack2"
> +	select BR2_PACKAGE_LIBSAMPLERATE
> +	select BR2_PACKAGE_LIBSNDFILE

libsndfile depends on largefile, so you should propagate this
dependency here.

> +	help
> +         JACK Audio Connection Kit (server and example clients)
> +         http://jackaudio.org/
> +	  
> +	 JACK is a low-latency sound server, allowing multiple applications to
> +	 connect to one audio device, and to share audio between themselves.
> + 
> +  	 This package contains the daemon jackd as well as some example clients.

Indentation is wrong for the help text. It should be one tab + two
spaces. And the upstream URL should be at the end. See
http://buildroot.org/downloads/manual/manual.html#writing-rules-config-in.

> diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
> new file mode 100644
> index 0000000..5ab751f
> --- /dev/null
> +++ b/package/jack2/jack2.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# jack2
> +#
> +################################################################################
> +
> +JACK2_VERSION = 37976441044d69b91d61d8f6278949a39cf1b7b7
> +JACK2_SITE = http://github.com/jackaudio/jack2/tarball/$(JACK2_VERSION)
> +JACK2_LICENSE = LGPLv2.1+
> +JACK2_DEPENDENCIES = \
> +      libsamplerate \
> +      libsndfile
> +
> +define JACK2_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		$(TARGET_CONFIGURE_OPTS)	\
> +		./waf configure			\
> +		--prefix=/usr			\
> +                --alsa				\

From this --alsa option, I seem to understand that it is using ALSA.
Are you sure it shouldn't depend on alsa-lib as well?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

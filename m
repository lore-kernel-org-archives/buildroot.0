From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 21:53:36 +0200
Subject: [Buildroot] [PATCH] mpdstate: add package
In-Reply-To: <20160530063656.GC31737@airbook.vandijck-laurijssen.be>
References: <20160530063656.GC31737@airbook.vandijck-laurijssen.be>
Message-ID: <20160612215336.06191b9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 May 2016 08:36:56 +0200, Kurt Van Dijck wrote:
> Mpdstate listens for MPD state changes and outputs them
> on stdout. It is easy to write a script that receives mpdstate's output
> on stdin an act upon some of the events.
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Isn't the same thing achievable with the "mpc idle" feature, which
allows you to listen for events from mpd ?

Like your other package, I'd prefer to have some evidence of even some
limited adoption/usage of a software package before adding it to
Buildroot.

Nonetheless, here is a review below.

> diff --git a/package/mpdstate/Config.in b/package/mpdstate/Config.in
> new file mode 100644
> index 0000000..e3a5688
> --- /dev/null
> +++ b/package/mpdstate/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_MPDSTATE
> +	bool "mpdstate"
> +	help
> +	  mpdstate is a small C-program which outputs the state of an MPD
> +	  (Music Player Daemon). The program keeps waiting for changes and
> +	  outputs immediately the state changes that I found important.

Please avoid first person sentences. This strengthen the feeling of
"this is a personal project and nobody else but the original author is
using it".

> +	  The output is easily parsed with shell scripting,
> +	  and that is how I automate my MPD boxes to:
> +	  - enable a LED when MPD is playing
> +	  - activate the power amplifier's power when MPD is playing

Please add an empty line here, followed by the URL of the upstream
project homepage.

> diff --git a/package/mpdstate/mpdstate.mk b/package/mpdstate/mpdstate.mk
> new file mode 100644
> index 0000000..82436d4
> --- /dev/null
> +++ b/package/mpdstate/mpdstate.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# mpdstate
> +#
> +################################################################################
> +
> +MPDSTATE_VERSION = r3
> +MPDSTATE_SITE = git://github.com/kurt-vd/mpdstate.git

Please use the Github helper, and add a hash file.

> +MPDSTATE_LICENSE = GPLv3
> +MPDSTATE_LICENSE_FILES = LICENSE
> +
> +define MPDSTATE_CONFIGURE_CMDS
> +	echo "PREFIX=/" > $(@D)/config.mk

We normally use /usr as the prefix, not /.

> +	echo "CFLAGS=$(TARGET_CFLAGS)" >> $(@D)/config.mk
> +	echo "CPPFLAGS=$(TARGET_CPPFLAGS)" >> $(@D)/config.mk
> +	echo "CXXFLAGS=$(TARGET_CXXFLAGS)" >> $(@D)/config.mk
> +	echo "LDFLAGS=$(TARGET_LDFLAGS)" >> $(@D)/config.mk
> +	echo "LDLIBS+=$(TARGET_LDLIBS)" >> $(@D)/config.mk
> +	echo "CC=$(TARGET_CC)" >> $(@D)/config.mk
> +	echo "CXX=$(TARGET_CXX)" >> $(@D)/config.mk
> +	echo "LD=$(TARGET_LD)" >> $(@D)/config.mk
> +	echo "AS=$(TARGET_AS)" >> $(@D)/config.mk

You can pass all those variables on the make command line, and
therefore use $(TARGET_CONFIGURE_OPTS) instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

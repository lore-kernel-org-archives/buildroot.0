From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 May 2017 11:40:30 +0200
Subject: [Buildroot] [PATCH v3 1/1] linuxptp: new package
In-Reply-To: <1494836789-26058-1-git-send-email-brain@jikos.cz>
References: <1494836789-26058-1-git-send-email-brain@jikos.cz>
Message-ID: <20170515114030.0e40ace0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 May 2017 10:26:29 +0200, Petr Kulhavy wrote:
> Add the Linux PTP Project package.
> http://linuxptp.sourceforge.net/
> 
> The sysV and systemd init scripts start the daemon in automatic mode on eth0.
> 
> Signed-off-by: Petr Kulhavy <brain@jikos.cz>

Thanks for this new iteration! A few comments below.


>  package/linuxptp/0001-adjtime-fix.patch         | 12 ++++
>  package/linuxptp/0002-ethhdr-fix.patch          | 10 ++++
>  package/linuxptp/0003-time_t-fix.patch          | 10 ++++
>  package/linuxptp/0004-clock_nanosleep-fix.patch | 74 +++++++++++++++++++++++++
>  package/linuxptp/Config.in                      | 13 +++++
>  package/linuxptp/S65ptp4l                       | 36 ++++++++++++

Everything should be named linuxptp.

>  package/linuxptp/linuxptp.hash                  |  2 +
>  package/linuxptp/linuxptp.mk                    | 38 +++++++++++++
>  package/linuxptp/ptp4l.service                  | 10 ++++

Ditto. Please search globally for every occurrence of ptp4l in your
patch, and fix the different instances to be linuxptp, i.e the name of
the package.

> diff --git a/package/linuxptp/0001-adjtime-fix.patch b/package/linuxptp/0001-adjtime-fix.patch
> new file mode 100644
> index 0000000..a892220
> --- /dev/null
> +++ b/package/linuxptp/0001-adjtime-fix.patch

All patches should have a description + Signed-off-by. Since the
upstream Linux PTP project uses Git, please create Git formatted
patches (git format-patch -N).

> +--- linuxptp-1.8/makefile.old	2017-05-15 00:41:33.370113834 +0200
> ++++ linuxptp-1.8/makefile	2017-05-15 00:41:03.710283744 +0200
> +@@ -20,7 +20,7 @@
> + DEBUG	=
> + CC	= $(CROSS_COMPILE)gcc
> + VER     = -DVER=$(version)
> +-CFLAGS	= -Wall $(VER) $(incdefs) $(DEBUG) $(EXTRA_CFLAGS)
> ++CFLAGS	+= -Wall $(VER) $(incdefs) $(DEBUG) $(EXTRA_CFLAGS)

How is this related to the clock_nanosleep() issue ?

> diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
> new file mode 100644
> index 0000000..7e4a77b
> --- /dev/null
> +++ b/package/linuxptp/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LINUXPTP
> +	bool "Linux PTP"

Please use just the name of the package, all lowercase:

	bool "linuxptp"

> diff --git a/package/linuxptp/S65ptp4l b/package/linuxptp/S65ptp4l
> new file mode 100755
> index 0000000..50b9e96
> --- /dev/null
> +++ b/package/linuxptp/S65ptp4l
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +#
> +# Start ptp4l

ptp4l -> linuxptp (everywhere).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

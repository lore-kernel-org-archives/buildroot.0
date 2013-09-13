From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Sep 2013 11:24:06 +0200
Subject: [Buildroot] [PATCH] tcping: new package
In-Reply-To: <1379057638-27970-1-git-send-email-rebillout@syscom.ch> ("Arnaud
 =?utf-8?Q?R=C3=A9billout=22's?= message of "Fri, 13 Sep 2013 09:33:58
 +0200")
References: <5232BED1.5040603@syscom.ch>
 <1379057638-27970-1-git-send-email-rebillout@syscom.ch>
Message-ID: <87d2odnkg9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnaud" == Arnaud R?billout <rebillout@syscom.ch> writes:

Hi,

 Arnaud> tcping does a TCP connect to the given ip/port combination. The user can
 Arnaud> specify a timeout in seconds. This is useful in shell scripts running in
 Arnaud> firewalled environments. Often SYNs are just being dropped by firewalls,
 Arnaud> thus connection establishment will be retried several times (for minutes)
 Arnaud> until a TCP timeout is reached. With tcping it is possible to check first
 Arnaud> if the desired port is reachable and then start connection establishment.

 Arnaud> http://www.linuxco.de/tcping/tcping.html

 Arnaud> Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
 Arnaud> ---

Please clearly mark patch version and what you have changed to ease
review. The way to do this is to add the revision after PATCH in subject
(E.G. [PATCHv2]) and to write a small change long here under the ---
line.

 Arnaud>  package/Config.in        |  1 +
 Arnaud>  package/tcping/Config.in | 11 +++++++++++
 Arnaud>  package/tcping/tcping.mk | 20 ++++++++++++++++++++
 Arnaud>  3 files changed, 32 insertions(+)
 Arnaud>  create mode 100644 package/tcping/Config.in
 Arnaud>  create mode 100644 package/tcping/tcping.mk

 Arnaud> diff --git a/package/Config.in b/package/Config.in
 Arnaud> index 2351839..fc1ec87 100644
 Arnaud> --- a/package/Config.in
 Arnaud> +++ b/package/Config.in
 Arnaud> @@ -854,6 +854,7 @@ source "package/squid/Config.in"
 Arnaud>  source "package/strongswan/Config.in"
 Arnaud>  source "package/stunnel/Config.in"
 Arnaud>  source "package/tcpdump/Config.in"
 Arnaud> +source "package/tcping/Config.in"
 Arnaud>  source "package/tcpreplay/Config.in"
 Arnaud>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Arnaud>  source "package/tftpd/Config.in"
 Arnaud> diff --git a/package/tcping/Config.in b/package/tcping/Config.in
 Arnaud> new file mode 100644
 Arnaud> index 0000000..93cf322
 Arnaud> --- /dev/null
 Arnaud> +++ b/package/tcping/Config.in
 Arnaud> @@ -0,0 +1,11 @@
 Arnaud> +config BR2_PACKAGE_TCPING
 Arnaud> +	bool "tcping"
 Arnaud> +	help
 Arnaud> +	  tcping does a TCP connect to the given ip/port combination. The user can
 Arnaud> +	  specify a timeout in seconds. This is useful in shell scripts running in
 Arnaud> +	  firewalled environments. Often SYNs are just being dropped by firewalls,
 Arnaud> +	  thus connection establishment will be retried several times (for minutes)
 Arnaud> +	  until a TCP timeout is reached. With tcping it is possible to check first
 Arnaud> +	  if the desired port is reachable and then start connection establishment.
 Arnaud> +

The help lines are too long. Please wrap after ~column 70 so it fits
into menuconfig with a normal 80char window.

 Arnaud> +	  http://www.linuxco.de/tcping/tcping.html
 Arnaud> diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
 Arnaud> new file mode 100644
 Arnaud> index 0000000..1472ad4
 Arnaud> --- /dev/null
 Arnaud> +++ b/package/tcping/tcping.mk
 Arnaud> @@ -0,0 +1,20 @@
 Arnaud> +################################################################################
 Arnaud> +#
 Arnaud> +# tcping
 Arnaud> +#
 Arnaud> +################################################################################
 Arnaud> +
 Arnaud> +TCPING_VERSION = 1.3.5
 Arnaud> +TCPING_SITE = http://www.linuxco.de/tcping
 Arnaud> +TCPING_LICENSE = GPLv3+
 Arnaud> +TCPING_LICENSE_FILES = LICENSE
 Arnaud> +
 Arnaud> +define TCPING_BUILD_CMDS
 Arnaud> +	$(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS)" -C $(@D) tcping.linux

You should also pass TARGET_LDFLAGS. As the Makefile is really simple I
just added it to CCFLAGS.

Committed with these minor fixes, thanks.

-- 
Bye, Peter Korsgaard

From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Jun 2012 09:43:19 +0200
Subject: [Buildroot] [PATCH][resend] new package : p910nd print server
In-Reply-To: <CAPOFwxopE6DvRWF0uDimpS0HPmJ_jxt-0EKonkvC5b6xVnzpyQ@mail.gmail.com>
References: <CAPOFwxopE6DvRWF0uDimpS0HPmJ_jxt-0EKonkvC5b6xVnzpyQ@mail.gmail.com>
Message-ID: <4FCF0A17.8030907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/12 21:52, David Purdy wrote:
> p910nd is a lightweight, nonspooling printserver that accepts jobs
> on ports 9100-9102 via network, and sends them directly to a USB
> printer.  It is ideally suited for embedded devices and diskless
> workstations.

  Please include a Signed-off-by line for yourself.  This is a short way
for you to assert that you are entitled to contribute the patch under
buildroot's GPL license.  See  http://kerneltrap.org/files/Jeremy/DCO.txt
for more  details.


  The rest of my comments are a bit of nitpicking.

[snip]
> diff --git a/package/p910nd/Config.in b/package/p910nd/Config.in
> new file mode 100644
> index 0000000..490dace
> --- /dev/null
> +++ b/package/p910nd/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_P910ND
> +	bool "p910nd"
> +	help
> +	  p910nd is a small printer daemon intended for diskless
> +	  workstations. Using ports 9100-9102, it accepts
> +	  print jobs and passes them directly to a USB printer.
> +
> +	  http://p910nd.sourceforge.net/

  Doesn't this package rely on any external libary at all?
Not even libusb?

> diff --git a/package/p910nd/S55p910nd b/package/p910nd/S55p910nd
> new file mode 100644
> index 0000000..8778a62
> --- /dev/null
> +++ b/package/p910nd/S55p910nd
> @@ -0,0 +1,48 @@
> +#!/bin/sh
> +
> +DEFAULT=/etc/default/p910nd

  We don't normally have a /etc/default directory.  Even so, it
normally contains shell fragments rather than configuration files
(at least it does on Debian+derivatives).

  Instead I would name the config file /etc/p910nd.conf

> +RUN_D=/var/run
> +
> +_start() {
> + mkdir -p $RUN_D

  We usually use tabs to indent shell scripts.

> + [ -f $DEFAULT ]&&  (

  Space between ] and &&

  The sub-shell isn't needed, { ... } would be sufficient.
Or it could even be left out since there's only one command
(while) inside.

> +  while read port options; do
> +   case "$port" in
> +    ""|\#*)
> +     continue;
> +   esac
> +   p910nd $options $port

  We usually use start-stop-daemon to control daemons.

> +   if [ $? -ne 0 ]; then
> +    exit 1
> +   fi
> +  done
> + )<  $DEFAULT
> + exit 0
> +}
> +
> +_stop() {
> + [ -f $DEFAULT ]&&  (
> +  while read port options; do
> +   case "$port" in
> +    ""|\#*)
> +     continue;
> +   esac
> +   PID_F=$RUN_D/p910${port}d.pid
> +   [ -f $PID_F ]&&  kill $(cat $PID_F)

  This has the annoying effect of not killing things properly
if the configuration file has changed.  What about:

	for PID_F in $RUN_D/p910?d.pid; do
		start-stop-daemon -K -p $PID_F -x /usr/sbin/p910nd
	done

> +   rm $PID_F
> +  done
> + )<  $DEFAULT
> +}
> +
> +case $1 in
> + start)
> +  _start
> +  ;;
> + stop)
> +  _stop
> +  ;;
> + *)
> +  echo "usage: $0 (start|stop)"

  Please add a restart as well.

> +  exit 1
> +esac
> +exit $?
> diff --git a/package/p910nd/p910nd-0.95-use_var-lock-instead-of-var_log_subsys_p910nd.patch
> b/package/p910nd/p910nd-0.95-use_var-lock-instead-of-var_log_subsys_p910nd.patch
> new file mode 100644
> index 0000000..867b8cf
> --- /dev/null
> +++ b/package/p910nd/p910nd-0.95-use_var-lock-instead-of-var_log_subsys_p910nd.patch
> @@ -0,0 +1,13 @@
> +Index: p910nd/p910nd.c

  Patches should start with a comment explaining what the patch does and why
it is needed, just like a commit message.  It should also contain a
Signed-off-by line.

> +===================================================================
> +--- p910nd.orig/p910nd.c	2011-11-14 22:47:41.986401420 +0100
> ++++ p910nd/p910nd.c	2011-11-14 22:49:27.274923524 +0100
> +@@ -122,7 +122,7 @@
> + #ifdef		LOCKFILE_DIR
> + #define		LOCKFILE	LOCKFILE_DIR "/p910%cd"

  Wouldn't it be possible to simply add -DLOCKFILE_DIR='"/var/lock"' to CFLAGS
(if the Makefile allows extending CFLAGS with something extra).

> + #else
> +-#define		LOCKFILE	"/var/lock/subsys/p910%cd"
> ++#define		LOCKFILE	"/var/lock/p910%cd"
> + #endif
> + #ifndef		PRINTERFILE
> + #define         PRINTERFILE     "/dev/lp%c"
> diff --git a/package/p910nd/p910nd.default b/package/p910nd/p910nd.default
> new file mode 100644
> index 0000000..77317cf
> --- /dev/null
> +++ b/package/p910nd/p910nd.default
> @@ -0,0 +1,9 @@
> +# printing port list, in the form "number [options]"
> +# where:
> +#  - number is the port number in the range [0-9]
> +#    the p910nd daemon will listen on tcp port 9100+number
> +#  - options can be :
> +#    -b to turn on bidirectional copying.
> +#    -f to specify a different printer device.
> +#
> +0  -b -f /dev/usb/lp0
> diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
> new file mode 100644
> index 0000000..c229b32
> --- /dev/null
> +++ b/package/p910nd/p910nd.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# p910nd
> +#
> +#############################################################
> +
> +P910ND_VERSION = 0.95
> +P910ND_SITE =
> http://voxel.dl.sourceforge.net/project/p910nd/p910nd/$(P910ND_VERSION)

  Use $(BR2_SOURCEFORGE_MIRROR) instead of a fixed mirror (voxel).

  Also, it looks like your patch is line-wrapped, so it won't apply cleanly.
The easiest way to avoid this is to use git send-email (see the man page
on how to use it with gmail).

> +P910ND_SOURCE = p910nd-$(P910ND_VERSION).tar.bz2
> +
> +define P910ND_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)

  Nowadays, we usually use

$(MAKE) $(TARGET_CONFIGURE_OPTS) $(P910ND_MAKE_OPTS) -C $(@D)

where P910ND_MAKE_OPTS are the extra make flags, if any (in this
case none).

> +endef
> +
> +define P910ND_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/p910nd $(TARGET_DIR)/usr/sbin/p910nd
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/default

  Creating the directory is done automatically by the -D option used below.

> +	$(INSTALL) -m 0755 -D package/p910nd/p910nd.default
> $(TARGET_DIR)/etc/default/p910nd

  This one shouldn't be executable (mode 0644 instead of 0755).

> +	$(INSTALL) -m 0755 -D package/p910nd/S55p910nd
> $(TARGET_DIR)/etc/init.d/S55p910nd
> +
> +endef
> +
> +$(eval $(call GENTARGETS,package,p910nd))

  The extra arguments for GENTARGETS are unnecessary.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

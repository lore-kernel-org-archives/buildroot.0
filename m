From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 17:16:07 +0200
Subject: [Buildroot] [PATCH 1/1] add daemon mode support to pulseaudio
In-Reply-To: <1367584523-8491-1-git-send-email-jeremy.rosen@openwide.fr>
 (=?utf-8?B?IkrDqXLDqW15?= Rosen"'s message of "Fri, 3 May 2013 14:35:22
 +0200")
References: <1367584523-8491-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <87ehdmvkqw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?my" == J?r?my Rosen <jeremy.rosen@openwide.fr> writes:

 J?r?my> pulseaudio documentation recommands not using the daemon mode unless you
 J?r?my> are on a headless system, but since that is the common case for a
 J?r?my> buildroot installation, install the related user and groups


 J?r?my> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
 J?r?my> ---
 J?r?my>  package/multimedia/pulseaudio/Config.in     |   10 +++++++
 J?r?my>  package/multimedia/pulseaudio/S50pulseaudio |   39 +++++++++++++++++++++++++++
 J?r?my>  package/multimedia/pulseaudio/pulseaudio.mk |   13 +++++++++
 J?r?my>  3 files changed, 62 insertions(+)
 J?r?my>  create mode 100755 package/multimedia/pulseaudio/S50pulseaudio

 J?r?my> diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
 J?r?my> index 03c2613..bdc87ba 100644
 J?r?my> --- a/package/multimedia/pulseaudio/Config.in
 J?r?my> +++ b/package/multimedia/pulseaudio/Config.in
 J?r?my> @@ -19,5 +19,15 @@ config BR2_PACKAGE_PULSEAUDIO
 
 J?r?my>  	  http://pulseaudio.org
 
 J?r?my> +config BR2_PACKAGE_PULSEAUDIO_DAEMON
 J?r?my> +	bool "start pulseaudio as a system daemon"
 J?r?my> +	depends on BR2_PACKAGE_PULSEAUDIO
 J?r?my> +	help
 J?r?my> +	  PulseAudio can be started as a system daemon. This is not the
 J?r?my> +	  recommanded way of using PulseAudio unless you are building a
 J?r?my> +	  headless system
 J?r?my> +
 J?r?my> +
 J?r?my>  comment "pulseaudio requires a toolchain with WCHAR, LARGEFILE and threads support"
 J?r?my>  	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 J?r?my> +
 J?r?my> diff --git a/package/multimedia/pulseaudio/S50pulseaudio b/package/multimedia/pulseaudio/S50pulseaudio
 J?r?my> new file mode 100755
 J?r?my> index 0000000..be71022
 J?r?my> --- /dev/null
 J?r?my> +++ b/package/multimedia/pulseaudio/S50pulseaudio
 J?r?my> @@ -0,0 +1,39 @@
 J?r?my> +#!/bin/sh
 J?r?my> +#
 J?r?my> +# Starts pulseaudio.
 J?r?my> +#
 J?r?my> +
 J?r?my> +
 J?r?my> +start() {
 J?r?my> + 	echo -n "Starting pulseaudio: "
 J?r?my> +	umask 077
 J?r?my> +	/usr/bin/pulseaudio --system --daemonize
 J?r?my> +	echo "OK"
 J?r?my> +}
 J?r?my> +stop() {
 J?r?my> +	echo -n "Stopping pulseaudio: "
 J?r?my> +	pulseaudio --kill
 J?r?my> +	echo "OK"
 J?r?my> +}
 J?r?my> +restart() {
 J?r?my> +	stop
 J?r?my> +	start
 J?r?my> +}
 J?r?my> +
 J?r?my> +case "$1" in
 J?r?my> +  start)
 J?r?my> +  	start
 J?r?my> +	;;
 J?r?my> +  stop)
 J?r?my> +  	stop
 J?r?my> +	;;

You use a mix of spaces and tabs for indentation in this script.

 J?r?my> +  restart|reload)
 J?r?my> +  	restart
 J?r?my> +	;;
 J?r?my> +  *)
 J?r?my> +	echo "Usage: $0 {start|stop|restart}"
 J?r?my> +	exit 1
 J?r?my> +esac
 J?r?my> +
 J?r?my> +exit $?
 J?r?my> +
 J?r?my> diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
 J?r?my> index e78eb42..d326dcc 100644
 J?r?my> --- a/package/multimedia/pulseaudio/pulseaudio.mk
 J?r?my> +++ b/package/multimedia/pulseaudio/pulseaudio.mk
 J?r?my> @@ -84,4 +84,17 @@ endef
 J?r?my>  PULSEAUDIO_POST_INSTALL_TARGET_HOOKS += PULSEAUDIO_REMOVE_VALA
 J?r?my>  endif
 
 J?r?my> +ifeq($(BR2_PACKAGE_PULSEAUDIO_DAEMON);y)

That seems wrong. It should be:

ifeq ($(BR2_PACKAGE_PULSEAUDIO_DAEMON),y)

 J?r?my> +define PULSEAUDIO_USERS
 J?r?my> +	pulse -1 pulse -1 * /var/run/pulse - audio,pulse-access
 J?r?my> +endef
 J?r?my> +
 J?r?my> +define PULSEAUDIO_INSTALL_INIT_SYSV
 J?r?my> +	[ -f $(TARGET_DIR)/etc/init.d/S50pulseaudio ] || \
 J?r?my> +		$(INSTALL) -D -m 755 package/multimedia/pulseaudio/S50pulseaudio \
 J?r?my> +			$(TARGET_DIR)/etc/init.d/S50pulseaudio
 J?r?my> +endef

As we now have support for post-build scripts, we no longer need the
hack about checking if the script is already present in the skeleton, so
that can be removed.

Committed with these fixes (and the typos Thomas pointed out), thanks.

Are you actively using pulseaudio? 3.0 got released some months ago,
care to test and send a patch to upgrade to it?

-- 
Bye, Peter Korsgaard

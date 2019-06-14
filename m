From: yann.morin at orange.com <yann.morin@orange.com>
Date: Fri, 14 Jun 2019 08:17:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add disable
 pivot_root option
In-Reply-To: <1560458829-20187-1-git-send-email-frasigal@gmail.com>
References: <1560458829-20187-1-git-send-email-frasigal@gmail.com>
Message-ID: <14308_1560493044_5D033BF4_14308_222_1_20190614061722.GA2485@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2019-06-13 23:47 +0300, Frank Sigalas spake thusly:
> Sets the environment variable DOCKER_RAMDISK before starting dockerd.

[--SNIP--]
> diff --git a/package/docker-engine/S60dockerd-ramdisk b/package/docker-engine/S60dockerd-ramdisk
> new file mode 100644
> index 0000000..a1092b6
> --- /dev/null
> +++ b/package/docker-engine/S60dockerd-ramdisk
> @@ -0,0 +1,38 @@
> +#!/bin/sh
> +
> +NAME=dockerd
> +DAEMON=/usr/bin/$NAME
> +PIDFILE=/var/run/$NAME.pid
> +DAEMON_ARGS=""
> +
> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME $1

The existing package/docker-engine/S60dockerd script also parses
similarly named file, so why can't you provide (e.g. in an overlay) this
configuraiton file taht would just contain:

    export DOCKER_RAMDISK=1

The config files in /etc/default/ are the place where such local
customisations mustr be done.

Besides, your solution does not cover the systemd case anyway (for which
Christian alrady provided an example). But that is not even needed
either, because this is still a local customisation.

Regards,
Yann E. MORIN.

> +do_start() {
> +        echo -n "Starting $NAME: "
> +        start-stop-daemon --start --quiet --background --make-pidfile \
> +		--pidfile $PIDFILE --exec /usr/bin/env DOCKER_RAMDISK=1 $DAEMON -- $DAEMON_ARGS \
> +                && echo "OK" || echo "FAIL"
> +}
> +
> +do_stop() {
> +        echo -n "Stopping $NAME: "
> +        start-stop-daemon --stop --quiet --pidfile $PIDFILE \
> +                && echo "OK" || echo "FAIL"
> +}
> +
> +case "$1" in
> +        start)
> +                do_start
> +                ;;
> +        stop)
> +                do_stop
> +                ;;
> +        restart)
> +                do_stop
> +                sleep 1
> +                do_start
> +                ;;
> +	*)
> +                echo "Usage: $0 {start|stop|restart}"
> +                exit 1
> +esac
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 50d4129..d4608fb 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -51,6 +51,12 @@ else
>  DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
>  endif
>  
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_RAMDISK),y)
> +DOCKER_ENGINE_INIT_SCRIPT = S60dockerd-ramdisk
> +else
> +DOCKER_ENGINE_INIT_SCRIPT = S60dockerd
> +endif
> +
>  DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
>  
>  define DOCKER_ENGINE_RUN_AUTOGEN
> @@ -74,7 +80,7 @@ define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
>  endef
>  
>  define DOCKER_ENGINE_INSTALL_INIT_SYSV
> -	$(INSTALL) -D -m 755 package/docker-engine/S60dockerd \
> +	$(INSTALL) -D -m 755 package/docker-engine/$(DOCKER_ENGINE_INIT_SCRIPT) \
>  		$(TARGET_DIR)/etc/init.d/S60dockerd
>  endef
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

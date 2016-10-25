From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 25 Oct 2016 15:44:28 -0400
Subject: [Buildroot] [PATCH v2 1/2] rabbitmq-server: new package
In-Reply-To: <87bmy8jl7m.fsf@dell.be.48ers.dk>
References: <1477410548-9977-1-git-send-email-fhunleth@troodon-software.com>
 <87bmy8jl7m.fsf@dell.be.48ers.dk>
Message-ID: <CA+-urNQbHROqF0PAyPAaVtYKEA=3RTt8ZxYRKMF6SRxahvWcuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Oct 25, 2016 at 3:13 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:
>
>  > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>  > ---
>  > Changes v1 -> v2:
>  >   - Add symlinks to rabbitmq control programs so that they show up
>  >     in /usr/sbin (per Peter Korsgaard)
>  >   - Added init scripts to automatically start rabbitmq-server (per
>  >     Peter)
>  >   - In the license details, list RabbitMQ's license first (per Peter)
>  >   - Add "select BR2_PACKAGE_OPENSSL" after testing in a minimal
>  >     configuration.
>
> Thanks.
>
>> diff --git a/package/rabbitmq-server/S50rabbitmq-server b/package/rabbitmq-server/S50rabbitmq-server
>  > new file mode 100755
>  > index 0000000..1a34a61
>  > --- /dev/null
>  > +++ b/package/rabbitmq-server/S50rabbitmq-server
>  > @@ -0,0 +1,36 @@
>  > +#!/bin/sh
>  > +#
>  > +# Start/stop rabbitmq-server
>  > +#
>  > +
>  > +INSTALLUSER=rabbitmq
>  > +RUNDIR=/var/run/rabbitmq
>  > +
>  > +# Create RUNDIR.
>  > +mkrundir() {
>  > +    install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$RUNDIR"
>  > +}
>
> Having this in a seperate function when it is only called once doesn't
> really add any value imho.
>
>> +
>  > +case "$1" in
>  > +  start)
>  > +        mkrundir || exit 1
>  > +        printf "Starting rabbitmq-server: "
>  > +        su -c "/usr/sbin/rabbitmq-server -detached" - "$INSTALLUSER" 2> /dev/null
>  > +        [ $? = 0 ] && echo "OK" || echo "FAIL"
>  > +    ;;
>  > +  stop)
>  > +        printf "Stopping rabbitmq-server: "
>  > +        su -c "/usr/sbin/rabbitmqctl stop" - "$INSTALLUSER"
>  > +        [ $? = 0 ] && echo "OK" || echo "FAIL"
>  > +    ;;
>  > +  restart|reload)
>  > +        "$0" stop || true
>  > +        "$0" start
>  > +    ;;
>  > +  *)
>  > +        echo "Usage: $0 {start|stop|restart}"
>  > +        exit 1
>  > +esac
>  > +
>  > +exit $?
>  > +
>
> exit $? is the default anyway, so I've dropped this (and the trailing
> empty lines).
>
>> diff --git a/package/rabbitmq-server/rabbitmq-server.hash b/package/rabbitmq-server/rabbitmq-server.hash
>  > new file mode 100644
>  > index 0000000..be21477
>  > --- /dev/null
>  > +++ b/package/rabbitmq-server/rabbitmq-server.hash
>  > @@ -0,0 +1,2 @@
>  > +# Locally computed
>  > +sha256 c696134e863f99191a301288c12d69ff00b7e648107ee52c8686ae047dde1bee  rabbitmq-server-3.6.1.tar.xz
>  > diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
>  > new file mode 100644
>  > index 0000000..8da5cdd
>  > --- /dev/null
>  > +++ b/package/rabbitmq-server/rabbitmq-server.mk
>  > @@ -0,0 +1,55 @@
>  > +#############################################################
>  > +#
>  > +# rabbitmq-server
>  > +#
>  > +#############################################################
>  > +
>  > +RABBITMQ_SERVER_VERSION = 3.6.1
>  > +RABBITMQ_SERVER_SITE = http://www.rabbitmq.com/releases/rabbitmq-server/v$(RABBITMQ_SERVER_VERSION)
>  > +RABBITMQ_SERVER_SOURCE = rabbitmq-server-$(RABBITMQ_SERVER_VERSION).tar.xz
>  > +RABBITMQ_SERVER_LICENSE = MPLv1.1, Apache-2.0, BSD-2c, EPL, MIT, MPLv2.0
>  > +RABBITMQ_SERVER_LICENSE_FILES = LICENSE-MPL-RabbitMQ \
>  > +                            LICENSE LICENSE-APACHE2-ExplorerCanvas \
>  > +                            LICENSE-APL2-Rebar LICENSE-APL2-Stomp-Websocket \
>  > +                            LICENSE-BSD-base64js LICENSE-BSD-glMatrix \
>  > +                            LICENSE-EPL-OTP LICENSE-MIT-EJS10 \
>  > +                            LICENSE-MIT-Flot LICENSE-MIT-jQuery164 \
>  > +                            LICENSE-MIT-Mochi LICENSE-MIT-Mochiweb \
>  > +                            LICENSE-MIT-Sammy060 LICENSE-MIT-SockJS \
>  > +                            LICENSE-MPL2
>  > +RABBITMQ_SERVER_DEPENDS = erlang libxslt
>  > +RABBITMQ_SERVER_TARGET_BINS = rabbitmq-plugins rabbitmq-server rabbitmqctl rabbitmq-env rabbitmq-defaults
>  > +
>  > +define RABBITMQ_SERVER_BUILD_CMDS
>  > +    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>  > +endef
>  > +
>  > +define RABBITMQ_SERVER_INSTALL_TARGET_CMDS
>  > +    $(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
>  > +
>  > +    for bin in $(RABBITMQ_SERVER_TARGET_BINS); do \
>  > +            ln -sf /usr/lib/erlang/lib/rabbitmq_server-$(RABBITMQ_SERVER_VERSION)/sbin/$$bin \
>  > +                    $(TARGET_DIR)/usr/sbin/$$bin; \
>
> It is imho nicer to use relative symlinks so they resolve correctly on
> the build host as well, so I changed /usr/lib to ../lib.

Ahh, now I understand why I've seen so many relative links in BR.
Makes sense. Thanks for the explanation.

>
> Committed with these fixes, thanks.
>
>  > +++ b/package/rabbitmq-server/rabbitmq-server.service
>  > @@ -0,0 +1,15 @@
>  > +[Unit]
>  > +Description=RabbitMQ Messaging Server
>  > +After=syslog.target network.target
>  > +
>  > +[Service]
>  > +Type=simple
>  > +User=rabbitmq
>  > +Group=rabbitmq
>  > +Environment=HOME=/var/lib/rabbitmq
>  > +WorkingDirectory=/var/lib/rabbitmq
>  > +ExecStart=/usr/sbin/rabbitmq-server
>  > +ExecStop=/usr/sbin/rabbitmqctl stop
>
> How does /var/run/rabbitmq get created in the systemd case?

I'm actually getting skeptical that /var/run/rabbitmq really gets
used. I saw that it was included somewhere else, but I think it's
bogus. Our rabbitmq-server was originally running on a system that
used BusyBox init. We're in the process of converting to systemd, and
so far rabbitmq-server appears to be working without the directory.
I'll be doing more testing in the next couple weeks, and assuming
everything goes well, I'll send a patch up removing the
/var/run/rabbitmq parts.

Thanks,
Frank

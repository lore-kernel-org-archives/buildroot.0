From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 14 Jun 2020 21:22:24 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/iwd: add sysv init script
In-Reply-To: <20200614100044.GK2346@scaer>
References: <20200612232433.18442-1-ps.report@gmx.net>
 <20200612232433.18442-3-ps.report@gmx.net>
 <20200614100044.GK2346@scaer>
Message-ID: <20200614212224.2796adc3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun, 14 Jun 2020 12:00:44 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2020-06-13 01:24 +0200, Peter Seiderer spake thusly:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/iwd/S40iwd | 30 ++++++++++++++++++++++++++++++
> >  package/iwd/iwd.mk |  7 +++++++
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 package/iwd/S40iwd
> >
> > diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
> > new file mode 100644
> > index 0000000000..4a720b43c2
> > --- /dev/null
> > +++ b/package/iwd/S40iwd
> > @@ -0,0 +1,30 @@
> > +#!/bin/sh
> > +#
> > +# Start iwd daemon
> > +#
> > +
> > +# Create needed directories.
> > +[ -d /tmp/iwd/hotspot ] || mkdir -p /tmp/iwd/hotspot
>
> No need to test-and-create, as mkdir -p does that well for you already.

Did copy from S30dbus...., will fix it...

>
> Is that script just about acting as a hotspot, then?

No (and did yet test only the client part), but iwd does not start up
without a hotspot directory...

>
> > +case "$1" in
> > +    start)
> > +	printf "Starting iwd:"
> > +	/usr/libexec/iwd &
> > +	echo "OK"
>
> This script has a mix of leading spaces and TABs.
>
> Don't mix (use spaces please! ;-] ).

Arghh, still have no xterm which does the tab-copy right...and there
are always some space/tabs I am missing...., will fix...


>
> > +        ;;
> > +    stop)
> > +	printf "Stopping iwd:"
> > +	killall iwd
>
> Can't we use start-stop-daemon instead? See package/busybox/S01syslogd
> as a template.

O.k, will take a look at it...

Regards,
Peter

>
> > +	[ $? = 0 ] && echo "OK" || echo "FAIL"
> > +        ;;
> > +    restart|reload)
> > +        "$0" stop
> > +        "$0" start
> > +        ;;
> > +    *)
> > +        echo "Usage: $0 {start|stop|restart|reload}"
> > +	exit 1
> > +        ;;
> > +esac
> > +
> > +exit $?
> > diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> > index d105d3b128..285fef2fd8 100644
> > --- a/package/iwd/iwd.mk
> > +++ b/package/iwd/iwd.mk
> > @@ -65,4 +65,11 @@ IWD_POST_INSTALL_TARGET_HOOKS += \
> >  	IWD_INSTALL_CONFIG_FILE \
> >  	IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
> >
> > +define IWD_INSTALL_INIT_SYSV
> > +	$(INSTALL) -m 0755 -D package/iwd/S40iwd \
> > +		$(TARGET_DIR)/etc/init.d/S40iwd
> > +	mkdir -p $(TARGET_DIR)/var/lib/iwd
> > +	ln -sf /tmp/iwd/hotspot $(TARGET_DIR)/var/lib/iwd/hotspot
> > +endef
> > +
> >  $(eval $(autotools-package))
> > --
> > 2.26.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>

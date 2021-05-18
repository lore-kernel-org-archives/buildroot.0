From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 18 May 2021 16:33:41 +0300
Subject: [Buildroot] [PATCH 4/6] package/seatd: install init scripts
In-Reply-To: <20210516140036.GG2506@scaer>
References: <20210513163325.1775639-1-aperez@igalia.com>
 <20210513163325.1775639-5-aperez@igalia.com> <20210516140036.GG2506@scaer>
Message-ID: <20210518163341.GI1064184@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 May 2021 16:00:36 +0200 "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> Adrian, All,
> 
> On 2021-05-13 19:33 +0300, Adrian Perez de Castro spake thusly:
> > Add commands to the seatd package to install the systemd unit included
> > in the source tarball and a SysV init script.
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  package/seatd/S70seatd | 38 ++++++++++++++++++++++++++++++++++++++
> >  package/seatd/seatd.mk | 10 ++++++++++
> >  2 files changed, 48 insertions(+)
> >  create mode 100755 package/seatd/S70seatd
> > 
> > diff --git a/package/seatd/S70seatd b/package/seatd/S70seatd
> > new file mode 100755
> > index 0000000000..a91302c6c1
> > --- /dev/null
> > +++ b/package/seatd/S70seatd
> > @@ -0,0 +1,38 @@
> > +#! /bin/sh
> > +#
> > +# Starts seatd
> > +#
> > +
> > +DAEMON=/usr/bin/seatd
> > +PIDFILE=/run/seatd.pid
> > +
> > +case "$1" in
> > +	start)
> > +		printf 'Starting seatd: '
> > +		if start-stop-daemon -S -x "$DAEMON" -p "$PIDFILE" -m -b -- -g video
> 
> I guess this means using the 'video' group, right?

Yes, it's the ?video? group.

> Currently, we do define the video group in the default skeleton, but I
> wonder if we should not ensure the group does exist:
> 
>     define SEATD_USERS
>         - - video -1 - - - - -
>     endef
> 
> I have no strong feeling about it, though..

I was not aware that more than one package can define the same user/group
in FOO_USERS without it being a conflict. I'll add it, because I suppose it
may be good to ensure it will always be created, even if for example someone
is using a custom base skeleton.

> > +		then
> > +			echo OK
> > +		else
> > +			echo FAIL
> > +		fi
> > +		;;
> > +	stop)
> > +		if start-stop-daemon -K -x "$DAEMON" -p "$PIDFILE"
> > +		then
> > +			echo OK
> > +		else
> > +			echo FAIL
> > +		fi
> > +		;;
> > +	restart)
> > +		"$0" stop || true
> > +		sleep 1
> > +		"$0" start
> > +		;;
> > +	*)
> > +		echo "Usage: $0 {start|stop|restart}"
> > +		exit 1
> > +		;;
> > +esac
> > +
> > +exit 0
> > diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
> > index 45da53904f..abb7cb888f 100644
> > --- a/package/seatd/seatd.mk
> > +++ b/package/seatd/seatd.mk
> > @@ -39,4 +39,14 @@ else
> >  SEATD_CONF_OPTS += -Dserver=disabled
> >  endif
> >  
> > +define SEATD_INSTALL_INIT_SYSV
> > +	$(INSTALL) -m 0755 -D $(SEATD_PKGDIR)/S70seatd \
> > +		$(TARGET_DIR)/etc/init.d/S70seatd
> > +endef
> > +
> > +define SEATD_INSTALL_INIT_SYSTEMD
> > +	$(INSTALL) -m 0644 -D $(@D)/contrib/systemd/seatd.service \
> > +		$(TARGET_DIR)/usr/lib/systemd/system/seatd.service
> > +endef

Also I just realized that the SEATD_INSTALL_INIT_* definitions should be
done conditionally if the daemon is built. I will keep that in mind :)

Cheers,
-Adrian

> >  $(eval $(meson-package))
> > -- 
> > 2.31.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210518/355df618/attachment.asc>

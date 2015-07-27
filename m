From: =?UTF-8?Q?Aur=C3=A9lien_Chabot?= <aurelien@chabot.fr>
Date: Mon, 27 Jul 2015 21:37:22 +0200
Subject: [Buildroot] [PATCH 2/2] rpcbind: add systemd support
In-Reply-To: <CAGduivxnLp-jFbF59bvDNTDsvZwcdyAFu4tJgrJnGzntfk+kmg@mail.gmail.com>
References: <1437339759-21456-1-git-send-email-aurelien@chabot.fr>
 <1437339759-21456-2-git-send-email-aurelien@chabot.fr>
 <CAGduivxnLp-jFbF59bvDNTDsvZwcdyAFu4tJgrJnGzntfk+kmg@mail.gmail.com>
Message-ID: <CAJup9chJ6t6ohc6iwnxH2g3bepV-DJdNMN+pNcc6DKB8vL8uSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 27, 2015 at 12:01 AM, Maxime Hadjinlian <
maxime.hadjinlian@gmail.com> wrote:

> Hi Aur?lien, all
>
>
>
> On Sun, Jul 19, 2015 at 11:02 PM, Aur?lien Chabot <aurelien@chabot.fr>
> wrote:
> > Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> > ---
> >  package/rpcbind/rpcbind.mk      | 18 +++++++++++++++++-
> >  package/rpcbind/rpcbind.service | 10 ++++++++++
> >  package/rpcbind/rpcbind.socket  |  8 ++++++++
> >  3 files changed, 35 insertions(+), 1 deletion(-)
> >  create mode 100644 package/rpcbind/rpcbind.service
> >  create mode 100644 package/rpcbind/rpcbind.socket
> >
> > diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
> > index d879de1..5396480 100644
> > --- a/package/rpcbind/rpcbind.mk
> > +++ b/package/rpcbind/rpcbind.mk
> > @@ -14,11 +14,27 @@ RPCBIND_CONF_ENV += \
> >         CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
> >  RPCBIND_DEPENDENCIES += libtirpc host-pkgconf
> >  RPCBIND_CONF_OPTS += --with-rpcuser=root
> > -RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
> > +
> > +ifeq ($(BR2_INIT_SYSTEMD),y)
> > +       RPCBIND_CONF_OPTS +=
> --with-systemdsystemunitdir=/usr/lib/systemd/system
> > +else
> > +       RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
> > +endif
> > +
> > +define RPCBIND_INSTALL_INIT_SYSTEMD
> > +       $(INSTALL) -m 0755 -D package/rpcbind/rpcbind.service \
> > +               $(TARGET_DIR)/usr/lib/systemd/system/rpcbind.service
> > +       $(INSTALL) -m 0755 -D package/rpcbind/rpcbind.socket \
> > +               $(TARGET_DIR)/usr/lib/systemd/system/rpcbind.socket
> > +       mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
> > +       ln -fs ../../../../usr/lib/systemd/system/rpcbind.socket \
> > +
>  $(TARGET_DIR)/etc/systemd/system/sockets.target.wants/rpcbind.socket
> > +endef
> >
> >  define RPCBIND_INSTALL_INIT_SYSV
> >         $(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
> >                 $(TARGET_DIR)/etc/init.d/S30rpcbind
> >  endef
> >
> > +
> >  $(eval $(autotools-package))
> > diff --git a/package/rpcbind/rpcbind.service
> b/package/rpcbind/rpcbind.service
> > new file mode 100644
> > index 0000000..b7a32a1
> > --- /dev/null
> > +++ b/package/rpcbind/rpcbind.service
> > @@ -0,0 +1,10 @@
> > +[Unit]
> > +Description=RPC bind service
> > +Requires=rpcbind.socket
> > +
> > +[Service]
> > +Type=forking
> > +ExecStart=/usr/bin/rpcbind
> > +
> > +[Install]
> > +Also=rpcbind.socket
> > diff --git a/package/rpcbind/rpcbind.socket
> b/package/rpcbind/rpcbind.socket
> > new file mode 100644
> > index 0000000..d63c1d9
> > --- /dev/null
> > +++ b/package/rpcbind/rpcbind.socket
> > @@ -0,0 +1,8 @@
> > +[Unit]
> > +Description=RPCbind Server Activation Socket
> > +
> > +[Socket]
> > +ListenStream=/var/run/rpcbind.sock
> > +
> > +[Install]
> > +WantedBy=sockets.target
> Did you took them from Arch Linux ? It doesn't really matter, just
> nice to add a note if you took them from their repo.
>

Yes, I took them from ArchLinux. I'll put a note on the commit message.


> Also, there was some modification on rpcbind, and your patch doesn't
> apply anymore, nothing that can't be fixed though.
>

I'll do a new revision of the patch ASAP.


>
> Acked-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> > --
> > 2.4.6
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150727/ce632bdd/attachment.html>

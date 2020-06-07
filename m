From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 7 Jun 2020 21:31:53 +0200
Subject: [Buildroot] [PATCH 4/4] package/openssh: add sd
 socket-activated ssh daemon services
In-Reply-To: <CADYdroPgiZyWpMXW5x082G6hS+E8nT-3snbYCrPeZ1rYt2BYgw@mail.gmail.com>
References: <20200605225905.14082-1-nolange79@gmail.com>
 <20200605225905.14082-4-nolange79@gmail.com>
 <CAFvCimXvo_pXCk8B8S13W7av52AvCsRQc2nA1eTFff=XQU4M5g@mail.gmail.com>
 <CADYdroPgiZyWpMXW5x082G6hS+E8nT-3snbYCrPeZ1rYt2BYgw@mail.gmail.com>
Message-ID: <CAFvCimXg6NsWyufFX3XnyVsP6=vRpeh--+wTzv4unmernjZQOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 7 juin 2020 ? 21:11, Norbert Lange <nolange79@gmail.com> a ?crit :

> Am So., 7. Juni 2020 um 13:07 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> >
> >
> >
> > Le sam. 6 juin 2020 ? 00:59, Norbert Lange <nolange79@gmail.com> a
> ?crit :
> >>
> >> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> >> ---
> >>  package/openssh/openssh.mk               |  6 +++---
> >>  package/openssh/sshd-host-keygen.service |  2 +-
> >>  package/openssh/sshd.socket              | 11 +++++++++++
> >>  package/openssh/sshd at .service            | 10 ++++++++++
> >>  4 files changed, 25 insertions(+), 4 deletions(-)
> >>  create mode 100644 package/openssh/sshd.socket
> >>  create mode 100644 package/openssh/sshd at .service
> >>
> >> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> >> index 6b3ee1f5f4..1f2638e9c9 100644
> >> --- a/package/openssh/openssh.mk
> >> +++ b/package/openssh/openssh.mk
> >> @@ -114,9 +114,9 @@ endef
> >>  OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
> >>
> >>  define OPENSSH_INSTALL_INIT_SYSTEMD
> >> -       mkdir $(TARGET_DIR)/usr/lib/systemd/system
> >> -       $(INSTALL) -m 644 package/openssh/sshd*.service \
> >> -               $(TARGET_DIR)/usr/lib/systemd/system/
> >> +       mkdir -p $(TARGET_DIR)/usr/lib/systemd/system
> >> +       $(INSTALL) -m 644 package/openssh/sshd*.service
> package/openssh/sshd.socket \
> >> +               $(TARGET_DIR)/usr/lib/systemd/system/.
> >>         $(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
> >>  endef
> >>
> >> diff --git a/package/openssh/sshd-host-keygen.service
> b/package/openssh/sshd-host-keygen.service
> >> index 058e671c44..ffde622b01 100644
> >> --- a/package/openssh/sshd-host-keygen.service
> >> +++ b/package/openssh/sshd-host-keygen.service
> >> @@ -17,4 +17,4 @@ Type=oneshot
> >>  RemainAfterExit=yes
> >>
> >>  [Install]
> >> -WantedBy=sshd.service
> >> +WantedBy=sshd.service sshd.socket
> >> diff --git a/package/openssh/sshd.socket b/package/openssh/sshd.socket
> >> new file mode 100644
> >> index 0000000000..bbae9ed7aa
> >> --- /dev/null
> >> +++ b/package/openssh/sshd.socket
> >> @@ -0,0 +1,11 @@
> >> +[Unit]
> >> +Description=OpenBSD Secure Shell server socket
> >> +Before=sshd.service
> >> +Conflicts=sshd.service
> >
> > No, that would stop the socket when the service is started, and you
> don't want that.
> > If you do that, only one connection would be accepted before the socket
> is stoped
> > and since you have accept=yes no further connections would be accepted
>
> there is the singular sshd service
> and the sshd.socket which spawns sshd@ instance services.
> Those are mutually exclusive (because of the "Conflicts"), the
> "Before" line just ensures that the sshd.socket wins out by default.
>
>
aah right, I messed up sshd.service and sshd at .service in my head.
my bad.

I personally think we shouldn't install both methods.
either choose a distro-wide decision or provide a config option

Anyway, I see what you are doing now, and that should work, AFAICT.

I still think that it's cool that openssh supports all those startup
methods,
but I'm not convinced we need to support all of them in BR.

Thoughts ?

Regards
Jeremy

> >
> >>
> >> +
> >> +[Socket]
> >> +ListenStream=22
> >> +Accept=yes
> >> +
> >> +[Install]
> >> +WantedBy=sockets.target
> >> diff --git a/package/openssh/sshd at .service b/package/openssh/sshd@
> .service
> >> new file mode 100644
> >> index 0000000000..b3a590d9a3
> >> --- /dev/null
> >> +++ b/package/openssh/sshd at .service
> >> @@ -0,0 +1,10 @@
> >> +[Unit]
> >> +Description=OpenBSD Secure Shell server per-connection daemon
> >> +Documentation=man:sshd(8) man:sshd_config(5)
> >> +After=auditd.service
> >> +
> >> +[Service]
> >> +ExecStart=-/usr/sbin/sshd -i
> >> +StandardInput=socket
> >> +RuntimeDirectory=sshd
> >> +RuntimeDirectoryMode=0755
> >
> >
> > I am a bit confused, you have both an ssh.service and a ssh.socket+ssh@
> .service
> > Wouldn't those two fight over port 22 ?
>
> No, on a fresh installation, the socket will be started, the sshd
> service will not because of the "Conflicts".
> if you manually enable/start the sshd.service then the socket will be
> shutdown first.
>
> >
> >
> >
> >>
> >> --
> >> 2.26.2
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
> >
> > --
> >
> >
> > 20 rue des Jardins
> > 92600 Asni?res-sur-Seine
> >
> > J?r?my ROSEN
> > Architecte technique
> >
> >  jeremy.rosen at smile.fr
> >   +33 6 88 25 87 42
> >  http://www.smile.eu
>
> Norbert
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200607/a3eff4e2/attachment.html>

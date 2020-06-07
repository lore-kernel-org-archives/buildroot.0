From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 7 Jun 2020 23:43:05 +0200
Subject: [Buildroot] [PATCH 4/4] package/openssh: add sd
 socket-activated ssh daemon services
In-Reply-To: <CADYdroM=C+w2BhU6EQjVyh_SFnnCbaQXwRg3Aff8DDrD=-MAVA@mail.gmail.com>
References: <20200605225905.14082-1-nolange79@gmail.com>
 <20200605225905.14082-4-nolange79@gmail.com>
 <CAFvCimXvo_pXCk8B8S13W7av52AvCsRQc2nA1eTFff=XQU4M5g@mail.gmail.com>
 <CADYdroPgiZyWpMXW5x082G6hS+E8nT-3snbYCrPeZ1rYt2BYgw@mail.gmail.com>
 <CAFvCimXg6NsWyufFX3XnyVsP6=vRpeh--+wTzv4unmernjZQOA@mail.gmail.com>
 <CADYdroNue6TAbG+w6d08gH+E-fWApG=tYmq5JqvGDmJvnUGTug@mail.gmail.com>
 <CADYdroM=C+w2BhU6EQjVyh_SFnnCbaQXwRg3Aff8DDrD=-MAVA@mail.gmail.com>
Message-ID: <CAFvCimUEE-7n-=dbpFZC1mQ+sKQUCp7WoMd7XMxx5cwrpzKcPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sounds good... the help text might need a little work, but I like the idea
itself...

Le dim. 7 juin 2020 ? 23:30, Norbert Lange <nolange79@gmail.com> a ?crit :

> Am So., 7. Juni 2020 um 21:45 Uhr schrieb Norbert Lange <
> nolange79 at gmail.com>:
> >
> > Am So., 7. Juni 2020 um 21:32 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> > >
> > >
> > >
> > > Le dim. 7 juin 2020 ? 21:11, Norbert Lange <nolange79@gmail.com> a
> ?crit :
> > >>
> > >> Am So., 7. Juni 2020 um 13:07 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> > >> >
> > >> >
> > >> >
> > >> > Le sam. 6 juin 2020 ? 00:59, Norbert Lange <nolange79@gmail.com> a
> ?crit :
> > >> >>
> > >> >> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > >> >> ---
> > >> >>  package/openssh/openssh.mk               |  6 +++---
> > >> >>  package/openssh/sshd-host-keygen.service |  2 +-
> > >> >>  package/openssh/sshd.socket              | 11 +++++++++++
> > >> >>  package/openssh/sshd at .service            | 10 ++++++++++
> > >> >>  4 files changed, 25 insertions(+), 4 deletions(-)
> > >> >>  create mode 100644 package/openssh/sshd.socket
> > >> >>  create mode 100644 package/openssh/sshd at .service
> > >> >>
> > >> >> diff --git a/package/openssh/openssh.mk b/package/openssh/
> openssh.mk
> > >> >> index 6b3ee1f5f4..1f2638e9c9 100644
> > >> >> --- a/package/openssh/openssh.mk
> > >> >> +++ b/package/openssh/openssh.mk
> > >> >> @@ -114,9 +114,9 @@ endef
> > >> >>  OPENSSH_POST_INSTALL_TARGET_HOOKS +=
> OPENSSH_INSTALL_SERVER_PROGRAMS
> > >> >>
> > >> >>  define OPENSSH_INSTALL_INIT_SYSTEMD
> > >> >> -       mkdir $(TARGET_DIR)/usr/lib/systemd/system
> > >> >> -       $(INSTALL) -m 644 package/openssh/sshd*.service \
> > >> >> -               $(TARGET_DIR)/usr/lib/systemd/system/
> > >> >> +       mkdir -p $(TARGET_DIR)/usr/lib/systemd/system
> > >> >> +       $(INSTALL) -m 644 package/openssh/sshd*.service
> package/openssh/sshd.socket \
> > >> >> +               $(TARGET_DIR)/usr/lib/systemd/system/.
> > >> >>         $(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
> > >> >>  endef
> > >> >>
> > >> >> diff --git a/package/openssh/sshd-host-keygen.service
> b/package/openssh/sshd-host-keygen.service
> > >> >> index 058e671c44..ffde622b01 100644
> > >> >> --- a/package/openssh/sshd-host-keygen.service
> > >> >> +++ b/package/openssh/sshd-host-keygen.service
> > >> >> @@ -17,4 +17,4 @@ Type=oneshot
> > >> >>  RemainAfterExit=yes
> > >> >>
> > >> >>  [Install]
> > >> >> -WantedBy=sshd.service
> > >> >> +WantedBy=sshd.service sshd.socket
> > >> >> diff --git a/package/openssh/sshd.socket
> b/package/openssh/sshd.socket
> > >> >> new file mode 100644
> > >> >> index 0000000000..bbae9ed7aa
> > >> >> --- /dev/null
> > >> >> +++ b/package/openssh/sshd.socket
> > >> >> @@ -0,0 +1,11 @@
> > >> >> +[Unit]
> > >> >> +Description=OpenBSD Secure Shell server socket
> > >> >> +Before=sshd.service
> > >> >> +Conflicts=sshd.service
> > >> >
> > >> > No, that would stop the socket when the service is started, and you
> don't want that.
> > >> > If you do that, only one connection would be accepted before the
> socket is stoped
> > >> > and since you have accept=yes no further connections would be
> accepted
> > >>
> > >> there is the singular sshd service
> > >> and the sshd.socket which spawns sshd@ instance services.
> > >> Those are mutually exclusive (because of the "Conflicts"), the
> > >> "Before" line just ensures that the sshd.socket wins out by default.
> > >>
> > >
> > > aah right, I messed up sshd.service and sshd at .service in my head.
> > > my bad.
> > >
> > > I personally think we shouldn't install both methods.
> > > either choose a distro-wide decision or provide a config option
> > >
> > > Anyway, I see what you are doing now, and that should work, AFAICT.
> > >
> > > I still think that it's cool that openssh supports all those startup
> methods,
> > > but I'm not convinced we need to support all of them in BR.
> >
> > sshd is better for throughput/efficiency if you have alot connections,
> >
> > the socket option saves memory if you rarely have connections (and is
> > actually a simpler service file).
> >
> > I would support both, but let users pick.
> >
> > Norbert
>
> How about this option:
>
> config BR2_PACKAGE_OPENSSH_SERVER_SOCKET
> bool "server socket"
> depends on BR2_INIT_SYSTEMD
> help
>   Systemd socket activation server.
>
> makefile gonna get allota ifdefs, right now it's a bit naive anyway,
> as you could pick server and not key_utils and then the services (sys
> and systemd) would fail when trying to verify/generate the host keys.
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200607/b76f928e/attachment.html>

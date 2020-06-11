From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Thu, 11 Jun 2020 08:14:43 +0200
Subject: [Buildroot] [PATCH 2/4] package/openssh: improve integration
 for systemd
In-Reply-To: <CADYdroOstEhuORpimWeO4D-0ENEhNxUa2cv-X8qNrbZvEEGmSA@mail.gmail.com>
References: <20200605225905.14082-1-nolange79@gmail.com>
 <20200605225905.14082-2-nolange79@gmail.com>
 <CAFvCimXCm=x_T9jSrnXHsNvZQwjp8Oy4eFMdPQ_JTgX1X8uOVQ@mail.gmail.com>
 <CADYdroPp+YZXqaAJNKM=FF5ZQfYxm-2c0Z5N0QfzYyFdAnBH6Q@mail.gmail.com>
 <CAFvCimWh8THn3i6E4nu6juCLNH9O7ieyjm+2R86fXSS9pQMR7A@mail.gmail.com>
 <CADYdroM-D8REHx3opjs2ZBct5obJWhxc5gt9P2kqwx31cwmHmQ@mail.gmail.com>
 <CAFvCimVofQ7d_ZDrrqMVcH2ES-7BtDAtUmOpZBPCa_eY3srS-A@mail.gmail.com>
 <CADYdroOstEhuORpimWeO4D-0ENEhNxUa2cv-X8qNrbZvEEGmSA@mail.gmail.com>
Message-ID: <CAFvCimXV8Uf4mmXZuZAk+u5ZC8UD93iUMqjKzF3iVyLMi3U-yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sure

Reviewed-by J?r?my Rosen <jeremy.rosen@smile.fr>

Sorry for noticing that everything was adressed

Le jeu. 11 juin 2020 ? 02:04, Norbert Lange <nolange79@gmail.com> a ?crit :

> Am So., 7. Juni 2020 um 21:42 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> >
> >
> >
> > Le dim. 7 juin 2020 ? 21:24, Norbert Lange <nolange79@gmail.com> a
> ?crit :
> >>
> >> Am So., 7. Juni 2020 um 21:16 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> >> >
> >> >
> >> >
> >> > Le dim. 7 juin 2020 ? 21:03, Norbert Lange <nolange79@gmail.com> a
> ?crit :
> >> >>
> >> >> Am So., 7. Juni 2020 um 12:54 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
> >> >> >
> >> >> >
> >> >> >
> >> >> > Le sam. 6 juin 2020 ? 00:59, Norbert Lange <nolange79@gmail.com>
> a ?crit :
> >> >> >>
> >> >> >> the openssh daemon is not suited for systemd's simple
> >> >> >> service type. dependend services should only start
> >> >> >> when sshd is ready to accept connections.
> >> >> >>
> >> >> >> A patch is added from debian to allow openssh
> >> >> >> to communicate this state.
> >> >> >>
> >> >> >> Restarts are prevented if the reason is a faulty
> >> >> >> config file (errocode 255).
> >> >> >>
> >> >> >> The "user confinement directory" is changed to
> >> >> >> '/run/sshd' which is automatically managed by systemd.
> >> >> >>
> >> >> >> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> >> >> >> ---
> >> >> >>  package/openssh/00-systemd-readiness.patch | 84
> ++++++++++++++++++++++
> >> >> >>  package/openssh/openssh.mk                 | 14 +++-
> >> >> >>  package/openssh/sshd-sysusers.conf         |  2 +-
> >> >> >>  package/openssh/sshd.service               | 13 +++-
> >> >> >>  4 files changed, 109 insertions(+), 4 deletions(-)
> >> >> >>  create mode 100644 package/openssh/00-systemd-readiness.patch
> >> >> >>
> >> >> >> diff --git a/package/openssh/00-systemd-readiness.patch
> b/package/openssh/00-systemd-readiness.patch
> >> >> >> new file mode 100644
> >> >> >> index 0000000000..be3b6b0074
> >> >> >> --- /dev/null
> >> >> >> +++ b/package/openssh/00-systemd-readiness.patch
> >> >> >> @@ -0,0 +1,84 @@
> >> >> >> +From ab765b2bd55062a704f09da8f8c1c4ad1d6630a7 Mon Sep 17
> 00:00:00 2001
> >> >> >> +From: Michael Biebl <biebl@debian.org>
> >> >> >> +Date: Mon, 21 Dec 2015 16:08:47 +0000
> >> >> >> +Subject: Add systemd readiness notification support
> >> >> >> +
> >> >> >> +Bug-Debian: https://bugs.debian.org/778913
> >> >> >> +Forwarded: no
> >> >> >> +Last-Update: 2017-08-22
> >> >> >> +
> >> >> >> +Patch-Name: systemd-readiness.patch
> >> >> >> +---
> >> >> >> + configure.ac | 24 ++++++++++++++++++++++++
> >> >> >> + sshd.c       |  9 +++++++++
> >> >> >> + 2 files changed, 33 insertions(+)
> >> >> >> +
> >> >> >> +diff --git a/configure.ac b/configure.ac
> >> >> >> +index e894db9fc..c119d6fd1 100644
> >> >> >> +--- a/configure.ac
> >> >> >> ++++ b/configure.ac
> >> >> >> +@@ -4499,6 +4499,29 @@ AC_ARG_WITH([kerberos5],
> >> >> >> + AC_SUBST([GSSLIBS])
> >> >> >> + AC_SUBST([K5LIBS])
> >> >> >> +
> >> >> >> ++# Check whether user wants systemd support
> >> >> >> ++SYSTEMD_MSG="no"
> >> >> >> ++AC_ARG_WITH(systemd,
> >> >> >> ++      [  --with-systemd          Enable systemd support],
> >> >> >> ++      [ if test "x$withval" != "xno" ; then
> >> >> >> ++              AC_PATH_TOOL([PKGCONFIG], [pkg-config], [no])
> >> >> >> ++              if test "$PKGCONFIG" != "no"; then
> >> >> >> ++                      AC_MSG_CHECKING([for libsystemd])
> >> >> >> ++                      if $PKGCONFIG --exists libsystemd; then
> >> >> >> ++                              SYSTEMD_CFLAGS=`$PKGCONFIG
> --cflags libsystemd`
> >> >> >> ++                              SYSTEMD_LIBS=`$PKGCONFIG --libs
> libsystemd`
> >> >> >> ++                              CPPFLAGS="$CPPFLAGS
> $SYSTEMD_CFLAGS"
> >> >> >> ++                              SSHDLIBS="$SSHDLIBS $SYSTEMD_LIBS"
> >> >> >> ++                              AC_MSG_RESULT([yes])
> >> >> >> ++                              AC_DEFINE(HAVE_SYSTEMD, 1,
> [Define if you want systemd support.])
> >> >> >> ++                              SYSTEMD_MSG="yes"
> >> >> >> ++                      else
> >> >> >> ++                              AC_MSG_RESULT([no])
> >> >> >> ++                      fi
> >> >> >> ++              fi
> >> >> >> ++      fi ]
> >> >> >> ++)
> >> >> >> ++
> >> >> >> + # Looking for programs, paths and files
> >> >> >> +
> >> >> >> + PRIVSEP_PATH=/var/empty
> >> >> >> +@@ -5305,6 +5328,7 @@ echo "                   libldns support:
> $LDNS_MSG"
> >> >> >> + echo "  Solaris process contract support: $SPC_MSG"
> >> >> >> + echo "           Solaris project support: $SP_MSG"
> >> >> >> + echo "         Solaris privilege support: $SPP_MSG"
> >> >> >> ++echo "                   systemd support: $SYSTEMD_MSG"
> >> >> >> + echo "       IP address in \$DISPLAY hack: $DISPLAY_HACK_MSG"
> >> >> >> + echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
> >> >> >> + echo "                  BSD Auth support: $BSD_AUTH_MSG"
> >> >> >> +diff --git a/sshd.c b/sshd.c
> >> >> >> +index 4e8ff0662..5e7679a33 100644
> >> >> >> +--- a/sshd.c
> >> >> >> ++++ b/sshd.c
> >> >> >> +@@ -85,6 +85,10 @@
> >> >> >> + #include <prot.h>
> >> >> >> + #endif
> >> >> >> +
> >> >> >> ++#ifdef HAVE_SYSTEMD
> >> >> >> ++#include <systemd/sd-daemon.h>
> >> >> >> ++#endif
> >> >> >> ++
> >> >> >> + #include "xmalloc.h"
> >> >> >> + #include "ssh.h"
> >> >> >> + #include "ssh2.h"
> >> >> >> +@@ -1951,6 +1955,11 @@ main(int ac, char **av)
> >> >> >> +                       }
> >> >> >> +               }
> >> >> >> +
> >> >> >> ++#ifdef HAVE_SYSTEMD
> >> >> >> ++              /* Signal systemd that we are ready to accept
> connections */
> >> >> >> ++              sd_notify(0, "READY=1");
> >> >> >> ++#endif
> >> >> >> ++
> >> >> >> +               /* Accept a connection and return in a forked
> child */
> >> >> >> +               server_accept_loop(&sock_in, &sock_out,
> >> >> >> +                   &newsock, config_s);
> >> >> >> diff --git a/package/openssh/openssh.mk b/package/openssh/
> openssh.mk
> >> >> >> index 55b917e20a..d425db1428 100644
> >> >> >> --- a/package/openssh/openssh.mk
> >> >> >> +++ b/package/openssh/openssh.mk
> >> >> >> @@ -12,6 +12,7 @@ OPENSSH_CONF_ENV = \
> >> >> >>         LD="$(TARGET_CC)" \
> >> >> >>         LDFLAGS="$(TARGET_CFLAGS)" \
> >> >> >>         LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
> >> >> >> +OPENSSH_AUTORECONF = YES
> >> >> >>  OPENSSH_CONF_OPTS = \
> >> >> >>         --sysconfdir=/etc/ssh \
> >> >> >>         --with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
> >> >> >> @@ -22,9 +23,20 @@ OPENSSH_CONF_OPTS = \
> >> >> >>         --disable-wtmpx \
> >> >> >>         --disable-strip
> >> >> >>
> >> >> >> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> >> >> >> +OPENSSH_DEPENDENCIES = systemd
> >> >> >> +
> >> >> >> +OPENSSH_CONF_OPTS += \
> >> >> >> +       --with-privsep-path=/run/sshd \
> >> >> >> +       --with-pid-dir=/run \
> >> >> >> +       --with-systemd
> >> >> >> +
> >> >> >> +else
> >> >> >> +
> >> >> >>  define OPENSSH_PERMISSIONS
> >> >> >>         /var/empty d 755 root root - - - - -
> >> >> >>  endef
> >> >> >
> >> >> >
> >> >> > Do we still need this when using systemd, or can it be commented
> out ?
> >> >>
> >> >> Not sure what you mean with "this"?
> >> >> The OPENSSH_PERMISSIONS block is needed when not using systemd and it
> >> >> is only active then.
> >> >>
> >> >
> >> > my bad, I missed the enclosing ifeq()
> >> >
> >> >>
> >> >> >
> >> >> >
> >> >> >>
> >> >> >> +endif
> >> >> >>
> >> >> >>  ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
> >> >> >>  OPENSSH_CONF_OPTS += --without-pie
> >> >> >> @@ -72,7 +84,7 @@ define OPENSSH_INSTALL_SYSTEMD_SYSUSERS
> >> >> >>  endef
> >> >> >>  else
> >> >> >>  define OPENSSH_USERS
> >> >> >> -       sshd -1 sshd -1 * /var/empty - - SSH drop priv user
> >> >> >> +       sshd -1 sshd -1 * $(if
> $(BR2_PACKAGE_SYSTEMD),/run/sshd,/var/empty) - - SSH drop priv user
> >> >> >>  endef
> >> >> >>  endif
> >> >> >>
> >> >> >> diff --git a/package/openssh/sshd-sysusers.conf
> b/package/openssh/sshd-sysusers.conf
> >> >> >> index ac77aec065..303d0dbb63 100644
> >> >> >> --- a/package/openssh/sshd-sysusers.conf
> >> >> >> +++ b/package/openssh/sshd-sysusers.conf
> >> >> >> @@ -1 +1 @@
> >> >> >> -u sshd - "SSH drop priv user" /var/empty
> >> >> >> +u sshd - "SSH drop priv user" /run/sshd
> >> >> >> diff --git a/package/openssh/sshd.service
> b/package/openssh/sshd.service
> >> >> >> index b5e96b3a25..715bd3f7eb 100644
> >> >> >> --- a/package/openssh/sshd.service
> >> >> >> +++ b/package/openssh/sshd.service
> >> >> >> @@ -1,11 +1,20 @@
> >> >> >>  [Unit]
> >> >> >>  Description=OpenSSH server daemon
> >> >> >> -After=syslog.target network.target auditd.service
> >> >> >> +Documentation=man:sshd(8) man:sshd_config(5)
> >> >> >> +After=network.target auditd.service
> >> >> >>
> >> >> >>
> >> >> >>  [Service]
> >> >> >>  ExecStartPre=/usr/bin/ssh-keygen -A
> >> >> >> -ExecStart=/usr/sbin/sshd -D -e
> >> >> >> +ExecStartPre=/usr/sbin/sshd -t
> >> >> >> +ExecStart=/usr/sbin/sshd -D
> >> >> >
> >> >> > You droped the -e, so  you are logging to syslog
> >> >> > However you droped the dependency on syslog.target earlier...
> >> >> > (maybe it should be syslog.socket instead of .target, btw)
> >> >>
> >> >>
> >> >> syslog.target is long long gone, and the syslog will be
> >> >> unconditionally available
> >> >> https://www.freedesktop.org/wiki/Software/systemd/syslog/
> >> >>
> >> >>
> >> >> >
> >> >> >
> >> >> > how exactly do you want to log  ? (I think logging to stdout is
> better, it will be
> >> >> > redirected to the journal.
> >> >>
> >> >>
> >> >> stdout is not really useful if syslog is supported.
> >> >>
> >> > i'd go the other way round
> >> >
> >> > syslog is not really necessary if stdout is available,
> >> > but it's a matter of taste :P so let's go your way.
> >>
> >> Its more the point, that Openssh already implemented syslog, and thats
> >> a clear functional superset of listening to stdout.
> >>
> >> >
> >> >>
> >> >> >
> >> >> >
> >> >> >>
> >> >> >> +ExecReload=/usr/sbin/sshd -t
> >> >> >>  ExecReload=/bin/kill -HUP $MAINPID
> >> >> >> +KillMode=process
> >> >> >
> >> >> >
> >> >> > Wouldn't mixed be better here ?
> >> >> > I'm not really sure what the use-case for procss is anyway...
> >> >>
> >> >>
> >> >> I taken that from debian, I could not argue against it (there is a
> >> >> long discussion which I linked above).
> >> >> Can you argue *for* mixed?
> >> >>
> >> >
> >> >
> >> > I didn't see any link
> >> > * process : SIGTERM and SIGKILL is sent only to MainPID
> >> > * mixed : SIGTERM is sent to MainPID, SIGKILL is sent to every
> process in the service cgroup.
> >> >
> >> > This means that if all works well, they do the same thing
> >> >
> >> > in case the MainPID fails to properly terminate its children, process
> would leave children alive
> >> > but mixed woul kill everybody
> >> >
> >> > Since we are trying to terminate the service, it makes sense to me to
> make sur all child process
> >> > are killed.
> >> >
> >> > but I don't see your link so I may be missing something
> >>
> >> The link is in the added patch: https://bugs.debian.org/778913
> >>
> >> As said, I could not argue either way, but I got some respect for the
> >> debian guys ;)
> >>
> >
> > The thread does not actually discuss process vs mixed...
> >
> > so doesn't really help here.
> > OTOH, the debian version has been vetted by mbiel which is a systemc
> core-maintainer.
> >
> > so i would go with mixed if I were to write the service from scratch,
> but since I don't have an
> > explanation for the choice of process, I'm not entirely sure...
> >
> > A possibility is that ssh creates a process per connection. in that case
> > * process would not kill all ongoing connections
> > * mixed would
> >
> > maybe it was chosen to protect existing connection. that would make some
> sense.
>
> Well, debian and arch seem to agree on using "process", I guess it
> means to just prevent
> new connections and not kill existing ones?
>
> Can I get a "reviewed-by" for this patch, so this and #3 can be merged?
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200611/4fb1bac3/attachment.html>

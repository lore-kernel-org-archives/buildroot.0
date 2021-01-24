From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 10:36:41 +0100
Subject: [Buildroot] [PATCH 1/3] package/sysklogd: bump to verson 2.2.0
In-Reply-To: <20210122154333.1927190-2-troglobit@gmail.com>
References: <20210122154333.1927190-1-troglobit@gmail.com>
 <20210122154333.1927190-2-troglobit@gmail.com>
Message-ID: <20210124093641.GJ926565@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim, All,

On 2021-01-22 16:43 +0100, Joachim Wiberg spake thusly:
> - Prefer maintainer provided package, not GitHub generated archive
> - Local backport of O_CLOEXEC patch not needed anymore, in v2.2.0
> - Install to /usr, with config in /etc and logs in /var
> - Update systemd unit file
>   - New daemon path, /usr/sbin
>   - Add support for /etc/default/syslogd, same as SysV init script

This patch does four different things;

 1. bumps the version, switching to maintainer's archive
 2. removes the --without-logger configure option
 3. changes the ./configure options for prefix et al. (more on that later)
 4. extends the systemd service unit to include the environment

This should have been four patches.

However, as already discussed in a review for mrouted, the --prefix,
--sysconfdir, and --localstatedir are already the value passed by the
autotools-package infra, so aer not needed. But wy do you want to switch
the logger from / to /usr ?

See commit 33642d8d959 (package/sysklogd: fix installation path of the
daemons), where the installation path was changed:

 1. to match the paths tht are used in the init scripts
 2. to match the location where busybox would install its applet

So your patch breaks that, because it does not update the two init
scripts, and will let busybox install its applet in /sbin.

Granted, there should have been a comment above the _CONF_OPTS line to
explain that was intentional.

Finally, why is the --without-logger option removed entirely in this
patch, when your patch 2 makes it a configurable option?

I've applied the version bump and the systemd stuff as two separate
patches, and dropped the rest.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  ...RCE_required_for_O_CLOEXEC_on_uClibc.patch | 44 -------------------
>  package/sysklogd/sysklogd.hash                |  2 +-
>  package/sysklogd/sysklogd.mk                  |  8 ++--
>  package/sysklogd/syslogd.service              |  3 +-
>  4 files changed, 6 insertions(+), 51 deletions(-)
>  delete mode 100644 package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
> 
> diff --git a/package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch b/package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
> deleted file mode 100644
> index 684b6b3e4c..0000000000
> --- a/package/sysklogd/0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 93117e58016de6f604e67263b5135adbba032367 Mon Sep 17 00:00:00 2001
> -From: Joachim Wiberg <troglobit@gmail.com>
> -Date: Sun, 30 Aug 2020 11:41:45 +0200
> -Subject: [PATCH] Define _GNU_SOURCE, required for O_CLOEXEC on uClibc
> -
> -When building sysklogd on a uClibc system we must define _GNU_SOURCE to
> -get O_CLOEXEC.
> -
> -Since _GNU_SOURCE is also required for asprintf() with GLIBC, as used by
> -the pidfile() replacement function, we drop it from there and rely on
> -AM_CPPFLAGS for all sources.
> -
> -Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> -Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>
> ----
> - lib/pidfile.c   | 1 -
> - src/Makefile.am | 2 +-
> - 2 files changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/lib/pidfile.c b/lib/pidfile.c
> -index a26de73..886a29c 100644
> ---- a/lib/pidfile.c
> -+++ b/lib/pidfile.c
> -@@ -31,7 +31,6 @@
> -  * POSSIBILITY OF SUCH DAMAGE.
> -  */
> - 
> --#define _GNU_SOURCE		/* Needed with GLIBC to get asprintf() */
> - #include <sys/stat.h>		/* utimensat() */
> - #include <sys/time.h>		/* utimensat() on *BSD */
> - #include <sys/types.h>
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index 9b80a02..1909ada 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -36,7 +36,7 @@ endif
> - AM_CFLAGS             = -W -Wall -Wextra
> - AM_CFLAGS            += -Wno-unused-result -Wno-unused-parameter -fno-strict-aliasing
> - AM_CPPFLAGS           = -DSYSCONFDIR=\"@sysconfdir@\" -DRUNSTATEDIR=\"@runstatedir@\"
> --AM_CPPFLAGS          += -D_BSD_SOURCE -D_DEFAULT_SOURCE
> -+AM_CPPFLAGS          += -D_BSD_SOURCE -D_DEFAULT_SOURCE -D_GNU_SOURCE
> - 
> - syslogd_SOURCES       = syslogd.c syslogd.h socket.c socket.h syslog.h
> - syslogd_SOURCES      += timer.c timer.h queue.h compat.h
> diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
> index 978a670d30..91550aa0dc 100644
> --- a/package/sysklogd/sysklogd.hash
> +++ b/package/sysklogd/sysklogd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  09fe1edca882a9ae976cdbf516786edc1629347b9507d45dc005d9d969f94702  sysklogd-2.1.2.tar.gz
> +sha256  60546ae50a9f30b31c19ed9a3ad788ce5798025b0f9a0d552c1a04d5eeac494d  sysklogd-2.2.0.tar.gz
>  sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index 200738897d..fc54ab6936 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -4,14 +4,12 @@
>  #
>  ################################################################################
>  
> -SYSKLOGD_VERSION = 2.1.2
> -SYSKLOGD_SITE = $(call github,troglobit,sysklogd,v$(SYSKLOGD_VERSION))
> +SYSKLOGD_VERSION = 2.2.0
> +SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
>  SYSKLOGD_LICENSE = BSD-3-Clause
>  SYSKLOGD_LICENSE_FILES = LICENSE
>  SYSKLOGD_CPE_ID_VALID = YES
> -# From git
> -SYSKLOGD_AUTORECONF = YES
> -SYSKLOGD_CONF_OPTS = --exec-prefix=/ --without-logger
> +SYSKLOGD_CONF_OPTS =  --prefix=/usr --sysconfdir=/etc --localstatedir=/var
>  
>  define SYSKLOGD_INSTALL_SAMPLE_CONFIG
>  	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
> diff --git a/package/sysklogd/syslogd.service b/package/sysklogd/syslogd.service
> index 1bf1bb3bd9..0e14369596 100644
> --- a/package/sysklogd/syslogd.service
> +++ b/package/sysklogd/syslogd.service
> @@ -3,7 +3,8 @@ Description=System Logging Service
>  Requires=syslog.socket
>  
>  [Service]
> -ExecStart=/sbin/syslogd -m 0 -F
> +EnvironmentFile=-/etc/default/syslogd
> +ExecStart=/usr/sbin/syslogd -m 0 -F $SYSLOGD_ARGS
>  StandardOutput=null
>  Restart=on-failure
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

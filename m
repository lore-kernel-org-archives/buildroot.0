From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 22:19:55 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/lftp: don't use host's path
In-Reply-To: <1419712467-20090-1-git-send-email-romain.naour@openwide.fr>
References: <1419712467-20090-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141227211955.GN4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-12-27 21:34 +0100, Romain Naour spake thusly:
> lftp try to link with -L/usr/lib/lftp/$(LFTP_VERSION) if
> DESTDIR is not set.
> 
> Remove useless -L option which point to a location where
> no libraries are installed.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: remove -L option instead of setting DESTDIR to STAGING_DIR
>     (ThomasP)
> 
>  .../lftp/0001-Remove-unused-libraries-path.patch   | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/lftp/0001-Remove-unused-libraries-path.patch
> 
> diff --git a/package/lftp/0001-Remove-unused-libraries-path.patch b/package/lftp/0001-Remove-unused-libraries-path.patch
> new file mode 100644
> index 0000000..3521ec8
> --- /dev/null
> +++ b/package/lftp/0001-Remove-unused-libraries-path.patch
> @@ -0,0 +1,46 @@
> +From 30e575f18416d67732be1e0350ee727b72b2d225 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Sat, 27 Dec 2014 20:56:56 +0100
> +Subject: [PATCH] Remove unused libraries path
> +
> +When building proto modules the path to library files is
> +specified with -L$(DESTDIR)$(pkgverlibdir) which point to
> +directory that doesn't exist.
> +
> +Also, when cross-compiling and $(DESTDIR) is empty,
> +$(pkgverlibdir) contains a path to the host libraries
> +(/usr/lib/lftp/4.5.5) which is considered unsafe.
> +
> +Anyway, those -L are not needed: by the time where
> +proto modules gets built/linked, no libraries are
> +installed in this location.
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + src/Makefile.am | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index d715d0a..0e221cf 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -59,11 +59,11 @@ liblftp_pty_la_LDFLAGS     = -avoid-version -rpath $(pkgverlibdir)
> + liblftp_network_la_LDFLAGS = -avoid-version -rpath $(pkgverlibdir) $(OPENSSL_LDFLAGS)
> + liblftp_network_la_LIBADD  = $(SOCKSLIBS) $(OPENSSL_LIBS) $(LIBGNUTLS_LIBS) $(GNULIB)
> + 
> +-proto_ftp_la_LIBADD  = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la
> +-proto_http_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la $(EXPAT_LIBS) $(ZLIB)
> +-proto_fish_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la liblftp-pty.la
> +-proto_sftp_la_LIBADD = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la liblftp-pty.la
> +-cmd_torrent_la_LIBADD  = -L$(DESTDIR)$(pkgverlibdir) liblftp-network.la
> ++proto_ftp_la_LIBADD  = liblftp-network.la
> ++proto_http_la_LIBADD = liblftp-network.la $(EXPAT_LIBS) $(ZLIB)
> ++proto_fish_la_LIBADD = liblftp-network.la liblftp-pty.la
> ++proto_sftp_la_LIBADD = liblftp-network.la liblftp-pty.la
> ++cmd_torrent_la_LIBADD  = liblftp-network.la
> + 
> + liblftp_tasks_la_SOURCES = PollVec.cc PollVec.h SMTask.cc SMTask.h ProcWait.cc\
> +  ProcWait.h GetPass.cc GetPass.h ConnectionSlot.cc ConnectionSlot.h\
> +-- 
> +1.9.3
> +
> -- 
> 1.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

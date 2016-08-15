From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Aug 2016 17:23:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/lldpd: disable use of libbsd
In-Reply-To: <87shu6oywx.fsf@ketchup.mtl.sfl>
References: <1471171604-16162-1-git-send-email-yann.morin.1998@free.fr>
 <87shu6oywx.fsf@ketchup.mtl.sfl>
Message-ID: <20160815152310.GG5822@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Viven, All,

On 2016-08-15 11:05 -0400, Vivien Didelot spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
[--SNIP--]
> > diff --git a/package/lldpd/0002-configure-do-not-check-for-libbsd.patch b/package/lldpd/0002-configure-do-not-check-for-libbsd.patch
> > new file mode 100644
> > index 0000000..b89b442
> > --- /dev/null
> > +++ b/package/lldpd/0002-configure-do-not-check-for-libbsd.patch
> > @@ -0,0 +1,62 @@
> > +From 0801a066cd4a24a858ddfa7c62c7802e0f5533a8 Mon Sep 17 00:00:00 2001
> > +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +Date: Sun, 14 Aug 2016 12:15:17 +0200
> > +Subject: [PATCH] configure: do not check for libbsd
> > +
> > +libbsd causes build issues because it .pc file is borked: it contains
> > +-isystem in CFLAGS, which is not munged by pkg-config, so we end up
> > +using the headers of the build machine, causing all sorts of hard to
> > +debug trouble at build time.
> > +
> > +lldpd uses libbsd to a few helper functions, but has fallback in case
> > +libbsd is not available. The only feature that is lost when not using
> > +libbsd is that the neighbour name is no longer displayed in the
> > +/proc/self/cmdline. As the author of lldpd said on IRC: "people should
> > +survive! ;-)"
> > +
> > +So we just remove the detection of libbsd altogether.
> > +
> > +Fixes:
> > +    http://autobuild.buildroot.org/results/6b7/6b70fa379e834ec71cc260ba6af771b531ca3511/
> > +    http://autobuild.buildroot.org/results/769/769074c4bb67336ae6679f2c1cd2a8220d2bec24/
> > +    http://autobuild.buildroot.org/results/c8a/c8a6001f437701ecc75f6c9252935645bda8a8c8/
> > +    [...]
> > +
> > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +---
> > + configure.ac | 19 -------------------
> > + 1 file changed, 19 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index dd723b0..45498ce 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -165,25 +165,6 @@ AC_FUNC_MALLOC
> > + AC_FUNC_REALLOC
> > + AC_FUNC_FORK
> > + 
> > +-# Some functions can be in libbsd
> > +-PKG_CHECK_MODULES([libbsd], [libbsd-overlay], [
> > +-  _save_CFLAGS="$CFLAGS"
> > +-  _save_LIBS="$LIBS"
> > +-  CFLAGS="$CFLAGS $libbsd_CFLAGS"
> > +-  LIBS="$LIBS $libbsd_LIBS"
> > +-  AC_MSG_CHECKING([if libbsd can be linked correctly])
> > +-  AC_LINK_IFELSE([AC_LANG_SOURCE([[int main() { return 0; }]])],
> > +-    [
> > +-      AC_MSG_RESULT(yes)
> > +-      LLDP_CFLAGS="$LLDP_CFLAGS $libbsd_CFLAGS"
> > +-      LLDP_LDFLAGS="$LLDP_LDFLAGS $libbsd_LIBS"
> > +-    ],[
> > +-      AC_MSG_RESULT(no)
> > +-      CFLAGS="$_save_CFLAGS"
> > +-      LIBS="$_save_LIBS"
> > +-    ])
> > +-], [:])
> > +-
> > + # setproctitle may have an _init function
> > + AC_REPLACE_FUNCS([setproctitle])
> > + AC_CHECK_FUNCS([setproctitle_init])
> > +-- 
> > +2.7.4
> > +
> 
> Did you send this patch upstream to lldpd?

No. I don't think this patch is correct for upstream, see below.

> I've seen that Vincent pushed something already for that -isystem
> issue.

Yes, we discussed it on IRC with Vincent the other day. I'm still unsure
of the implications (I haven't tested it, in fact), but for Buildroot,
we need a quick patch for the next release. The bove patch is just that:
a woarkaround for us to have a stable release.

We can work after the release to update lldpd with a newer upstream
release or an upstream patch, though.

> No risk to conflict?

Oh, probably, yes, since both touch the exact same code! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

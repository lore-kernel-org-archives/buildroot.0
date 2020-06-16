From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 16 Jun 2020 09:09:57 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/freeswitch: add patch to fix
 build issues
In-Reply-To: <CAEyMn7am11TOOs3b-Yu5EQqRkOqV6Njq5HhvbGCXUhe3Wj_WiQ@mail.gmail.com>
References: <20200609082519.15482-1-heiko.thiery@gmail.com>
 <20200610222909.4c971e82@windsurf.home>
 <CAEyMn7am11TOOs3b-Yu5EQqRkOqV6Njq5HhvbGCXUhe3Wj_WiQ@mail.gmail.com>
Message-ID: <CAEyMn7abLZBqTE5iEeyTKBnnMCqsRQDdUV78T3cWxcQfX89i-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Do., 11. Juni 2020 um 11:12 Uhr schrieb Heiko Thiery
<heiko.thiery@gmail.com>:
>
> Hi Thomas,
>
> Am Mi., 10. Juni 2020 um 22:29 Uhr schrieb Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>:
> >
> > On Tue,  9 Jun 2020 10:25:20 +0200
> > Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> > > diff --git a/package/freeswitch/0001-disable-the-check-for-check-lib.patch b/package/freeswitch/0001-disable-the-check-for-check-lib.patch
> > > new file mode 100644
> > > index 0000000000..213d7d35f4
> > > --- /dev/null
> > > +++ b/package/freeswitch/0001-disable-the-check-for-check-lib.patch
> > > @@ -0,0 +1,33 @@
> > > +From 6a63b51efdf431960711832d78225e50772ba8aa Mon Sep 17 00:00:00 2001
> > > +From: Heiko Thiery <heiko.thiery@gmail.com>
> > > +Date: Tue, 9 Jun 2020 08:32:51 +0200
> > > +Subject: [PATCH] disable the check for check lib
> > > +
> > > +Do not set the define HAVE_CHECK to prevent building code with
> > > +incompatible check lib.
> > > +
> > > +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > > +---
> > > + libs/sofia-sip/configure.ac | 6 +++---
> > > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > > +
> > > +diff --git a/libs/sofia-sip/configure.ac b/libs/sofia-sip/configure.ac
> > > +index 9542208cb6..ebc677628d 100644
> > > +--- a/libs/sofia-sip/configure.ac
> > > ++++ b/libs/sofia-sip/configure.ac
> > > +@@ -249,9 +249,9 @@ SAC_TPORT
> > > + dnl Check is used for testing
> > > + PKG_CHECK_MODULES(CHECK, check >= 0.9.4, have_check="yes", have_check="no")
> > > + AM_CONDITIONAL(HAVE_CHECK, test x"$have_check" = "xyes")
> > > +-if test x"$have_check" = "xyes"; then
> > > +-   AC_DEFINE([HAVE_CHECK], 1, [Define to 1 if check library is available])
> > > +-fi
> > > ++#if test x"$have_check" = "xyes"; then
> > > ++#   AC_DEFINE([HAVE_CHECK], 1, [Define to 1 if check library is available])
> > > ++#fi
> >
> > Since we're anyway patching the configure.ac script, can we do better,
> > and add a --enable/--disable or --with/--without option, and then use
> > it from freeswitch Makefile.am to disable building sofia-sip tests ?
>
> I have to admit I've no experience with automake and co. But I will
> give it a try.

Unfortunately I did not find a better solution for that problem. As I
said, my autoconf knowledge is not that good. What I did so far is I
added an option (--without-check) to disable the "PKG_CHECK_MODULES"
for the check unit test framework [1]. Then I added the
'--without-check' to the configure.gnu script that is called from the
toplevel makefile of freeswitch. But then I hit the next issues while
installing ;-(

I hope that there will be a better solution upstream for the next release.

[1] https://github.com/signalwire/freeswitch/blob/master/libs/sofia-sip/configure.ac#L250
[2] https://github.com/signalwire/freeswitch/blob/master/libs/sofia-sip/configure.gnu

-- 
Heiko

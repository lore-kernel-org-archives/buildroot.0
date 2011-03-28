From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 28 Mar 2011 12:21:57 -0500
Subject: [Buildroot] Add Package: htop
In-Reply-To: <AANLkTikJvMyKTpn4yZp3JrsvXREU=hM0GxgCuE7heB4i@mail.gmail.com>
References: <4D90B11D.4070607@AdTran.com>
	<AANLkTikJvMyKTpn4yZp3JrsvXREU=hM0GxgCuE7heB4i@mail.gmail.com>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99AAED@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Mon, Mar 28, 2011 at 12:02 PM, Andy Kennedy wrote:
> > Adds package htop. ?Changes made based upon e-mails with Mike
> Frysinger
> > and Gerhard Heift. ?The autoreconf change is important for anyone
> using
> > uClibc as there is no widely available backtrace (yet).
> 
> this ver looks mostly sane ...
> 
> > ++AC_CHECK_HEADERS([execinfo.h],[:],[:])
> 
> no need for munging the other branches
>   AC_CHECK_HEADERS([execinfo.h])
> 
> > ++if test "$cross_compiling" = "no"; then
> > + AC_CHECK_FILE($PROCDIR/stat,,AC_MSG_ERROR(Cannot find
> /proc/stat. Make sure you have a Linux-compatible /proc filesystem
> mounted. See the file README for help.))
> > + AC_CHECK_FILE($PROCDIR/meminfo,,AC_MSG_ERROR(Cannot find
> /proc/meminfo. Make sure you have a Linux-compatible /proc
> filesystem mounted. See the file README for help.))
> > ++fi
> 
> AC_CHECK_FILE has fallback cases for cross-compiling i thought, so
> you
> shouldnt need to check cross_compiling yourself

The error was really strange.  I submitted this patch to htop and
they tested, modified and included it as a fix.  The problem was that
when one is cross compiling, the test for /proc fails since the build
is a cross build -- there were enough smarts to not test when cross
building, however, the return value was a failure for the /proc
tests.  This _should_ not occur so we skip the whole test.

This patch was derived by getting the current branch via svn and
running a diff against configure.ac.

> -mike

Andy

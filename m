From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 29 Apr 2018 18:40:05 +0000
Subject: [Buildroot] [PATCH 1/1] zeromq: add libatomic linkage when
 available
In-Reply-To: <20180428153900.0f809228@windsurf>
References: <20180426195309.26042-1-asafka7@gmail.com>
 <20180428153900.0f809228@windsurf>
Message-ID: <CALFsTFVARKTJVVrkBwAKt9Qud3EiNo6tDO4UhAwtnWvWG3kOyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

I completely agree that the solution should be on upstream, and the current
solution is easiest one but not the best one. I'll try to build a patch on
the upstream and send it here.

Asaf.

On Sat, Apr 28, 2018, 09:39 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Asaf,
>
> On Thu, 26 Apr 2018 22:53:09 +0300, Asaf Kahlon wrote:
> > Fixes:
> >
> http://autobuild.buildroot.net/results/ff5f7d3bcd713db9c9d92a746d6ad7134748fe16
> >
> http://autobuild.buildroot.net/results/9a743da1c3be673288c3482a9e7ddea12750206f
> >
> http://autobuild.buildroot.net/results/818b12387e6117569c4fab310b98c11fac80c047
> >
> > If libatomic is available, it should be added to LIBS in CONF_ENV, since
> without
> > it we can get into a state in which symbols like __atomic_fetch_sub_4,
> > __atomic_compare_exchange_4 and __atomic_fetch_add_4 can't be found.
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  package/zeromq/zeromq.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
> > index 8273cad763..214bd9e35c 100644
> > --- a/package/zeromq/zeromq.mk
> > +++ b/package/zeromq/zeromq.mk
> > @@ -58,4 +58,8 @@ else
> >  ZEROMQ_CONF_OPTS += --disable-libunwind
> >  endif
> >
> > +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> > +ZEROMQ_CONF_OPTS += LIBS=-latomic
> > +endif
>
> While this does fix the problem, I don't think it's the most ideal fix.
> Indeed, the solution should be upstreamed. Currently, zeromq
> configure.ac uses LIBZMQ_CHECK_ATOMIC_INTRINSICS, which is implemented
> in acinclude.m4, to detect the availability of atomic intrinsics.
>
> It goes like this:
>
> AC_DEFUN([LIBZMQ_CHECK_ATOMIC_INTRINSICS], [{
>     AC_MSG_CHECKING(whether compiler supports __atomic_Xxx intrinsics)
>     AC_COMPILE_IFELSE([AC_LANG_SOURCE([
> /* atomic intrinsics test */
> int v = 0;
> int main (int, char **)
> {
>     int t = __atomic_add_fetch (&v, 1, __ATOMIC_ACQ_REL);
>     return t;
> }
>     ])],
>     [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" ; $1],
>     [AC_MSG_RESULT(no)  ; libzmq_cv_has_atomic_instrisics="no"  ; $2]
>     )
> }])
>
> It does only an AC_COMPILE_IFELSE(), so it succeeds on Sparc, as the
> need for -latomic only appears at link time.
>
> So I believe it should be changed to test with AC_LINK_IFELSE, and if
> it fails, test with AC_LINK_IFELSE with -latomic, to determine
>
>  (1) If atomic intrinsics are available
>
>  (2) If -latomic is needed to use atomic intrinsics
>
> Do you think you could have a look at implementing something like this ?
>
> That being said, I agree that a number of other packages in Buildroot
> are fixed by just passing LIBS=-latomic.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180429/a2dce3f6/attachment.html>

From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 31 May 2021 12:44:20 +0200
Subject: [Buildroot] [PATCHv3 11/15] package/sofia-sip: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <b46b5074-12c3-8099-5946-de715f715a8e@mind.be>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-12-patrickdepinguin@gmail.com>
 <0fd19bad-277f-ae7d-1928-fd4dc0bf6fcc@mind.be>
 <CAAXf6LVGSaNNgncfR4wUo+gpLgusD+uoS8amFKeb6tiRGQ+pCg@mail.gmail.com>
 <b46b5074-12c3-8099-5946-de715f715a8e@mind.be>
Message-ID: <CAAXf6LXyd2nCvGPFYs9SH05no7Z9+wy1COn7r1XiYxczU+g70Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

El vie, 28 may 2021 a las 23:07, Arnout Vandecappelle
(<arnout@mind.be>) escribi?:
>
>
>
> On 28/05/2021 20:35, Thomas De Schampheleire wrote:
> > El mar, 25 may 2021 a las 23:32, Arnout Vandecappelle
> > (<arnout@mind.be>) escribi?:
> >>
> >>
> >> On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> >>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >>>
> >>> BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
> >>> should have no negative effect on performance.
> >>>
> >>> Introduction of 'assert' statements, 'debug'-type builds with additional
> >>> logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.
> >>>
> >>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >>> ---
> >>>  package/sofia-sip/sofia-sip.mk | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
> >>> index 5c383400ff..cb867ba0dc 100644
> >>> --- a/package/sofia-sip/sofia-sip.mk
> >>> +++ b/package/sofia-sip/sofia-sip.mk
> >>> @@ -30,7 +30,7 @@ SOFIA_SIP_CONF_OPTS += \
> >>>       --without-openssl
> >>>  endif
> >>>
> >>> -ifeq ($(BR2_ENABLE_DEBUG),y)
> >>> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
> >>>  SOFIA_SIP_CONF_OPTS += --enable-ndebug
> >>  Actually, the logic was inverted here (already wrong in the current situation):
> >> --enable-ndebug should be given when RUNTIME_DEBUG is *not* set.
> > Indeed, you're right. I'll add a patch to fix that first.
> >
> >>  However, I think we should define -DNDEBUG in TARGET_CPPFLAGS, so it wouldn't
> >> be necessary to pass it explicitly here (--enable-ndebug does nothing more than
> >> defining NDEBUG).
> > In a previous iteration I basically did that, but dropped that patch
> > because it also had effect in the toolchain wrapper,
>
>  No it doesn't... TARGET_CFLAGS isn't set in the toolchain wrapper. Only
> arch-specific options are there, and BR2_TARGET_OPTIMIZATION (which is intended
> for arch-specific -m flags).

I had to reproduce the issue in order to understand where my
conclusion was wrong.

The compiler wrapper indeed does not pass these flags.
The problem in our case is that the -DNDEBUG is passed via a
<project>-config script to external compilations. In our case, xenomai
is used, and it provides a 'xeno-config' script to get the correct
compilation and linker flags. The generated file contains the flags
set by Buildroot in XENO_BASE_CFLAGS . With the mentioned patch, this
would include -DNDEBUG.
And the output of 'xeno-config [...] --cflags' was used in the
compilation of the external project.

We can work around that by filtering the output of 'xeno-config' in
our local makefiles.

Note that Thomas Petazzoni had initial doubts on the mentioned patch
(http://patchwork.ozlabs.org/project/buildroot/patch/20210212135451.22786-3-patrickdepinguin at gmail.com/).

If you think we should re-add it to the series, I will do it.

Thanks,
Thomas

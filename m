From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 9 Sep 2016 07:29:11 +0200
Subject: [Buildroot] [PATCH] package/mono: fix undefined reference to tls
In-Reply-To: <20160908134257.55ca818c@free-electrons.com>
References: <1473324667-31678-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160908134257.55ca818c@free-electrons.com>
Message-ID: <CA+TH9Vm4Q=XVaNBMk77MTx4bSscrm4DxEVk3ek2_dbVX64tg=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

2016-09-08 13:42 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> Thanks for investigating this issue!
>
> On Thu,  8 Sep 2016 10:51:07 +0200, Angelo Compagnucci wrote:
> > This commit fixes the nasty undefined reference to tls bug experienced
> with musl.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/048f04488cb8c7f4c32b828aa5214e
> bc22ba0153
> > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> > ---
> >  package/mono/mono.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> > index 3d0b9bc..de4f16b 100644
> > --- a/package/mono/mono.mk
> > +++ b/package/mono/mono.mk
> > @@ -26,6 +26,10 @@ MONO_CONF_OPTS = --disable-gtk-doc \
> >       --disable-mcs-build \
> >       --enable-static
> >
> > +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> > +MONO_CONF_OPTS += --with-tls=pthread
> > +endif
>
> Hum, that's interesting. Do you have more details about what this
> --with-tls option is doing?
>

Actually, it sets another variable (HAVE_KW_THREAD) that it's used around
the code to accommodate the use of __thread or phtread as local storage.


> Is --with-tls related to Thread Local Storage provided by the compiler ?
>

Yes, absolutely!


>
> Indeed, TLS support in gcc was disabled for musl toolchains until
> recently (i.e until commit
> https://git.buildroot.org/buildroot/commit/package/gcc?id=
> 1bd02bc230e1b3b22ca3eb23fb3dcb91b878283a).
>
> Since the toolchain that was causing the build failure was built
> *prior* to this commit, maybe this commit fixes the issue, as it would
> make musl toolchains have TLS support enabled in gcc.
>
> Could you test this using the internal toolchain backend, and see if
> without your fix the problem isn't already fixed? If that's the case,
> I'll simply rebuild the pre-built toolchains.
>

I tested both the pre-compiled musl external toolchain and a musl internal
toolchain I compiled and I can confirm that it's working without this patch.
So, probably simply rebuilding the autobuild toolchain should solve the
problem.

Sincerely, Angelo


>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160909/716811ea/attachment.html>

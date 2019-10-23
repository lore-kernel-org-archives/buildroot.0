From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 23 Oct 2019 12:48:37 -0700
Subject: [Buildroot] [PATCH v14 4/5] package/pkg-meson.mk: set Python
 sysconfigdata
In-Reply-To: <99a57ce9-4573-87c9-d978-f14e7fa00dba@mind.be>
References: <20191021200438.97453-1-aduskett@gmail.com>
 <20191021200438.97453-5-aduskett@gmail.com>
 <20191022225920.7e35e42e@windsurf>
 <b3699991-75ec-157a-0a4f-913a7a1d83f8@mind.be>
 <99a57ce9-4573-87c9-d978-f14e7fa00dba@mind.be>
Message-ID: <CAFSsvmo-p82=f3CvVeybD6vvr7qwPWoDqDcCV-qG=r-U+mv-SA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Arnout;

I absolutely can!
I will do so today, and if it works, I will send a V15 with you as the
author of the patch.

Thanks!

Adam

On Tue, Oct 22, 2019 at 3:19 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 22/10/2019 23:58, Arnout Vandecappelle wrote:
> >  Note that this patch was authored by me, Adam accidentally took over authorship
> > (which is why he said on IRC he needs to send a v15).
> >
> > On 22/10/2019 22:59, Thomas Petazzoni wrote:
> >> On Mon, 21 Oct 2019 13:04:37 -0700
> >> aduskett at gmail.com wrote:
> >>
> >>> +   _PYTHON_SYSCONFIGDATA_NAME="$$(if $$(BR2_PACKAGE_PYTHON3),$$(PKG_PYTHON_SYSCONFIGDATA_NAME),_sysconfigdata)" \
> >>
> >> Why do we need this conditional on BR2_PACKAGE_PYTHON3 ?
> >> package/pkg-python.mk is using PKG_PYTHON_SYSCONFIGDATA_NAME
> >> unconditionally, regardless of Python 2.x vs. Python 3.x. Could you
> >> explain this ?
> >
> >  I can :-)
> >
> >  It's a mistake. I noticed that PKG_PYTHON_SYSCONFIGDATA_NAME was left empty for
> > python2, so I made sure it got the correct value (in Python2 there is only one
> > _sysconfigdata). However, python2 doesn't have the _PYTHON_SYSCONFIGDATA_NAME
> > variable so it's meaningless.
> >
> >  Should be tested if things work OK with python2 on target, but I expect they do.
>
>  I hadn't read Adam's remark in the cover letter yet, about how this patch
> breaks the build of libglib2.
>
>  I suspect that we shold not set _PYTHON_SYSCONFIGDATA_NAME if python3 is not
> selected. Indeed, python3 *will* observe this environment variable, but if
> target python3 is not selected, it will be empty. meson will do checks for
> host-python, and setting that environment variable will break the check (which
> is BTW an example of the comment I made in the commit log of this patch: "Note
> that this approach will still break things when meson needs to build something
> for the host during a target build."). libglib2 indeed does use python3 during
> the build, so it asks meson to check for it, but since it doesn't try to build C
> modules for the host, it still works even with a wrong _sysconfigdata.
>
>  Adam, could you test if this works better?
>
> +       $$(if
> $$(BR2_PACKAGE_PYTHON3),_PYTHON_SYSCONFIGDATA_NAME="$$(PKG_PYTHON_SYSCONFIGDATA_NAME)")
> \
>
>
>
>  Regards,
>  Arnout

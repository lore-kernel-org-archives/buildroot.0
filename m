From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Tue, 3 Dec 2013 10:13:52 +0100
Subject: [Buildroot] [buildroot] libevas build failure analysis
In-Reply-To: <CAKAx1ciXsAPtG-uegQC5CPO8yJFPG4gn7CvuzVZ2JQh_T0FrAA@mail.gmail.com>
References: <CACjG4B+qJvuzX=dZz5F7jNyc_m796_j2m9NZ91fpsoy52SX8VQ@mail.gmail.com>
 <CAKAx1cgki9JiRqU=zJJ0P8g5XpG7NEZN9WcBuYMa4mNyv2C-RA@mail.gmail.com>
 <CACjG4B+AJ0F4BmrSVrfzMidVgUFGwWt7sBoxUD3QZyp0x6+EAw@mail.gmail.com>
 <CACjG4BLqXqufuzSHYWghXcZuWMpBPjbFUU7xGzLhSjQQrghK8A@mail.gmail.com>
 <CAKAx1ciXsAPtG-uegQC5CPO8yJFPG4gn7CvuzVZ2JQh_T0FrAA@mail.gmail.com>
Message-ID: <CACjG4BJvjp0HpOn+FvKYQt6WYNZG-uYaVth16oCfPL_ynk9k9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

About adding a requirement to have a toolchain with thread support,is there
any chips/boards that can't have thread support in their toolchain ?

And as you said, I guess have EFL 1.7 and 1.8 for some time is a good idea.


2013/12/3 Lionel Orry <lionel.orry@gmail.com>

> Hi,
>
> On Tue, Dec 3, 2013 at 9:32 AM, arnaud aujon <arnaud.aujon@gmail.com>
> wrote:
> > Hi,
> >
> > I got an answer from upstream, they said threads are mandatory in 1.8
> > release, don't know yet about our current 1.7.7, do we have any plan
> bumping
> > to 1.8 ?
> >
>
> They just released the 1.8 version, I think it's time to think about
> the bump, but there are some quite fundamental changes between 1.7 and
> 1.8 (most noticeable one is the merged tree instead of separate source
> code for core libraries), and the bump is probably not that easy at
> first, and then, I also suppose there are some applications that may
> still need 1.7 among buildroot users.
>
> I would then suggest to have EFL 1.7 and EFL 1.8 in parallel for some
> time. Maybe we should create efl18 package.
>
> As for EFL 1.7, maybe the easiest to do is require a toolchain with
> threads support.
>
> What do you think ?
>
> >
> > 2013/11/28 arnaud aujon <arnaud.aujon@gmail.com>
> >>
> >> Ok, the problem has been reported to the dev ML, I will follow this.
> >>
> >> Regards,
> >>
> >> Arnaud
> >>
> >>
> >> 2013/11/28 Lionel Orry <lionel.orry@gmail.com>
> >>>
> >>> Can you send an email on e-devel maiiling list? They are about to put
> >>> EFL 1.7 in maintenance as soon as 1.8 is released, so I guess it's
> >>> time to tell them, I'm sure they will correct it quickly
> >>>
> >>>
> >>> On Thu, Nov 28, 2013 at 8:04 PM, arnaud aujon <arnaud.aujon@gmail.com>
> >>> wrote:
> >>> > Hi there,
> >>> >
> >>> > A quick analysis of libevas build failure
> >>> >
> >>> > (
> http://autobuild.buildroot.org/results/15c/15cfb974e428b20ba230321cd8b59a82308785af/
> )
> >>> >
> >>> > The build fails because the member 'delete_me' of the
> Image_Entry_Flags
> >>> > structure is undefined. This is because there is a ifdef
> >>> > BUILD_ASYNC_PRELOAD
> >>> > surrounding this member which is not defined during the build because
> >>> > the
> >>> > toolchain doesn't have thread support.
> >>> >
> >>> > From libevas.mk :
> >>> > # async image preload support needs threads support in toolchain
> >>> > ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> >>> > LIBEVAS_CONF_OPT += --disable-async-preload
> >>> > endif
> >>> >
> >>> > But it seems like the file evas_cache2.c is using 'delete_me'
> >>> > regardless of
> >>> > the 'async image preload support'
> >>> >
> >>> > I don't have the time to investigate more, but it looks like without
> >>> > threads
> >>> > we should use 'lib/cache' and not 'lib/cache2'  which are defining
> the
> >>> > same
> >>> > symboles but 'cache2' absolutely need threads support, 'cache'
> doesn't
> >>> > .
> >>> > So I guess we have to fix the makefile to use this the 'cache'
> >>> > implementation.
> >>> >
> >>> > Does someone  know what we should do here ?
> >>> >
> >>> > Regards,
> >>> >
> >>> > Arnaud
> >>> >
> >>> >
> >>> > _______________________________________________
> >>> > buildroot mailing list
> >>> > buildroot at busybox.net
> >>> > http://lists.busybox.net/mailman/listinfo/buildroot
> >>
> >>
> >
>
> Cheers
> Lionel
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131203/2459b792/attachment.html>

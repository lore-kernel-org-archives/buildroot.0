From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 6 Feb 2014 21:40:12 +0100
Subject: [Buildroot] [PATCH] open2300: fix build failure
In-Reply-To: <20140206100523.34e8247b@skate>
References: <1391634562-1680-1-git-send-email-s.martin49@gmail.com>
 <20140206100523.34e8247b@skate>
Message-ID: <CAHXCMMLFy4dNPwUPK4xHp-E2_Af-AOarJSh17QL-rgBL7TnUZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


On Thu, Feb 6, 2014 at 10:05 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Samuel Martin,
>
> On Wed,  5 Feb 2014 22:09:22 +0100, Samuel Martin wrote:
>
> > +- allow to extend CFLAGS and CC_LDFLAGS
>
> [...]
>
> > +-CFLAGS = -Wall -O3 -DVERSION=\"$(VERSION)\"
> > +-CC_LDFLAGS = -lm
> > +-CC_WINFLAG =
> > ++CFLAGS += -Wall -O3 -DVERSION=\"$(VERSION)\"
> > ++CC_LDFLAGS += -lm
> > ++CC_WINFLAG =
>
> This doesn't allow to extend CFLAGS if the CFLAGS is passed on the
> right hand side of the "make" call.
>
> I.e, with your patch, if you do:
>
>         make CFLAGS=-something
>
> Then the CFLAGS will only contain "-something", not "-something -Wall
> -O3 -DVERSION...". However, with your patch, it works if you do:
>
>         CFLAGS=-something make
>
> In Buildroot, we indeed often do $(TARGET_CONFIGURE_OPTS) $(MAKE),
> which means CFLAGS is passed on the left side of make. But this
> specific package does not do this:
>
>         $(MAKE) CC=... LD=... -C $(@D)
>
> So it doesn't pass CFLAGS, so there is no problem for now, but if it
> started to pass CFLAGS on the right side of make, then your patch
> wouldn't work.
>
> Instead, if you want it to work in all cases, it should be:
>
> override CFLAGS += -Wall -O3 ...
>

I did know all these fine details. Thanks a lot for the explanation.
I'll fix it and repost shortly.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140206/b5009e3b/attachment.html>

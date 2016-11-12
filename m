From: Anand Sivaram <aspnair@gmail.com>
Date: Sat, 12 Nov 2016 15:24:37 +0530
Subject: [Buildroot] Question about Compilation Flags
In-Reply-To: <20161112102142.5fba57e8@free-electrons.com>
References: <CAHBw83fzS2uZUXUrpF6+Q41G3gUEPg5uW3DXu=YauG447FjDtA@mail.gmail.com>
 <20161111150343.74bfc8b1@free-electrons.com>
 <CAHBw83d+5FzcxpBxmeDM=-uUyMyXLw8pDeywoYrF91pV8wR7ag@mail.gmail.com>
 <20161112102142.5fba57e8@free-electrons.com>
Message-ID: <CAHBw83c4yBvKLp0uTutTmz=9Cy_nCCKu9Pb4k_Ms9=qXBBBd1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

A couple of points I noticed.  ffunction-sections/data-sections increase
the size because each function/data goes to its own section with section
header etc.
But if the library/application has unused functions they would be removed
at link time by gc-sections.  If the lib/app has been written carefully
without any unused function, then we will not get any savings at all.

The problem with lighttpd is that it uses dlopen() to load different
plugins like mod_cgi, most_fastcgi etc.  Programs like vlc/gstreamer who
use plugins framework also do the same.  But, gc-section could be removing
some essential functions marking them as unused.  There is a --entry option
used by ld (as per man ld) which we could use to specifiy the entry
function.

Currently I am planning to use function/data section for the whole
buildroot but avoiding lighttpd as you suggested.

Thanks and Regards

Anand






On 12 November 2016 at 14:51, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Sat, 12 Nov 2016 13:06:11 +0530, Anand Sivaram wrote:
>
> > Thank you very much for the reply.  I think BR2_TARGET_OPTIMIZATION and
> > BR2_TARGET_LDFLAGS are
> > better solutions than what I did in config/Makefile.in
> >
> > I will try lighttpd.mk changes as you suggested.
> >
> > These are the numbers I found without changing lighttpd in a special way.
> >
> > du -ks output/target/ (default buildroot for mips without
> > function/data/gc-section)
> > 26188   output/target/
> > du -ks output/target/ (with function/data/gc-sections)
> > 25012   output/target/
> >
> > That gives a saving of 1176 KB then.
>
> That's not bad indeed, about 4.4% space saving.
>
> Thanks for the feedback!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161112/350dbb2e/attachment.html>

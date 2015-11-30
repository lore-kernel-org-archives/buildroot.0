From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 30 Nov 2015 13:07:36 -0200
Subject: [Buildroot] Missing 'sys/queue.h' on musl
In-Reply-To: <87h9k3n4f9.fsf@dell.be.48ers.dk>
References: <CANu7NGtDTbf+0uOcqZQON_E4cwQtRzqiGU=y-NGDe3jjOF0+RQ@mail.gmail.com>
 <20151128184915.6017fae9@free-electrons.com>
 <CANu7NGsZ6J3-n+zmKf+Ueds8_ePbvZydEPchfQokgqTAWhELHw@mail.gmail.com>
 <20151128192022.6bc8d7fd@free-electrons.com>
 <CANu7NGvmMFc9xADTq_ES7h=13LcnLH5yYJO9KV+8mSYSB-VVtg@mail.gmail.com>
 <20151129092811.0d05dabd@free-electrons.com> <20151129095306.GA3630@free.fr>
 <565B78D8.6070103@mind.be> <20151129233338.261cf080@free-electrons.com>
 <87h9k3n4f9.fsf@dell.be.48ers.dk>
Message-ID: <CANu7NGuKGNtVyiWqN=KW1kW5zQA35NLaFVE2JP4GoS0wh3vuqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I'm not so familiar with the toolchain infrastructure, so I need some help
from buildroot wizards...:)

I have created a package called sys-queue that will only install queue.h on
the staging dir.

Then to make musl generated toolchain depends on sys-queue, I added the
following lines to toolchain/toolchain-buildroot/toolchain-buildroot.mk:

ifeq ($(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
TOOLCHAIN_BUILDROOT_DEPENDENCIES += sys-queue
endif

It worked like a charm. Is this the correct approach?

Also, I am struggling to find out a way to do the same thing on the
external toolchain. Using the DEPENDENCIES approach, it will process the
sys-queue package before the external toolchain package, and it is best to
do it after. Any ideas?

Thanks!

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-11-30 8:54 GMT-02:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> writes:
>
>  > Hello,
>  > On Sun, 29 Nov 2015 23:14:48 +0100, Arnout Vandecappelle wrote:
>
>  >> > Adding such a package would be a Buildroot peculiarity, which I would
>  >> > prefer we avoid.
>  >>
>  >> +1 to that.
>  >>
>  >> Also take into account that we only install it to staging, so there is
> really
>  >> nothing to gain from installing it conditionally.
>  >>
>  >> The only question is whether to do it in the toolchain virtual package
> (which
>  >> would be unusual to say the least), or duplicate it in the musl and
> external
>  >> toolchain packages. I actually think the latter is the way to go.
>
>  > That's all fine with me. It is a lot better than duplicating
>  > sys/queue.h everywhere. It is kind of adding a patch on top of musl
>  > that we would have to keep on our side forever, but since it's just a
>  > separate header file, there's no maintenance cost, so I think it's fine.
>
>  > Regarding doing it in the toolchain virtual package or duplicate in
>  > musl and external toolchain packages, I don't have a strong opinion
>  > either way, so if Arnout feels like doing the duplication is better
>  > then so be it. Despite the duplication I also believe it is more
>  > logical to have it in the musl and external toolchain packages, since
>  > doing that in the toolchain virtual package would make that package no
>  > longer purely virtual.
>
> Indeed, I agree with Arnout here.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151130/d90f7f70/attachment.html>

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Mar 2018 20:30:52 +0100
Subject: [Buildroot] Trouble with offline build
In-Reply-To: <87a7vtldor.fsf@dell.be.48ers.dk>
References: <CAMd7AX_bD6b4c2xhnsWPicPCETk9z3bDP4yT9k3Jpd9Op1F8tA@mail.gmail.com>
 <20180228045310.bugxi5bb3w2djjaa@tarshish>
 <20180228075533.564a23b7@windsurf.home>
 <87a7vtldor.fsf@dell.be.48ers.dk>
Message-ID: <20180301193052.GC2449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2018-02-28 09:29 +0100, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>  > To be honest, I don't really see how to solve that problem. the
>  > host-{cmake,lzip,xzcat,tar} issue could probably be solved by
>  > downloading all of them even if some of them won't be needed (we may
>  > have a "make all-source" that differs from "make source" to avoid "make
>  > source" from downloading useless stuff). However, for the host
>  > architecture difference, I'm not sure how to proceed, and I'm not sure
>  > there is a reasonable solution.

There is for example the case where we could download a different
archive depending on the host machine. For example, we can download a
different Linaro toolchain,depending on whether we're runnign on a 32-
or a 64-bit x86 host.

>  > Bottom line: should we document/make it clear that doing a "make
>  > source" on machine A and then do a build on machine B is not
>  > guaranteeing a fully offline build ?

Yes, because there is no way that machine A knows about what machine B
will be...

Heck, for this toolchain stuff, that would also break if machine A is
x86 but machine B is something else (e.g. PPC).

In fact, we're not even able to guarantee that a .config file from
machine A is buildable on machine B...

> > It's a bit of a pity, because I
>  > know there are some environment where only a given machine has Internet
>  > access, and the developer machines don't, but I don't see a good way of
>  > solving this in Buildroot.
> Me neither. Historically, make source was meant to ensure that
> everything is downloaded now so you could go offline and continue
> building _ON_THE_SAME_MACHINE_. This potentially does indeed break down
> if you try to reuse the download directory on another machine, but I
> don't quite see how we can solve this for all situations.

I don't have a good idea either. Yes, such are environment are more
widesoread than usually thought. For example, a CI infra may not have
internet access at all (real life experience!), so an intermediate
server is used as a filer...

Anyway, I'm afraid there is no technical solution, except maybe we could
have something like (names to refine later) running on the build machine:

    make prepare-scripted-source

then move the tree to the internet-facing machine, and run:

    make scripted-source

and finally move the tree back to the build machine to resume
building...

Short of doing something along those lines, there is not muh we can do,
I'm afraid... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

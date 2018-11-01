From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Nov 2018 18:04:28 +0100
Subject: [Buildroot] [PATCH] Config.in: add BR2_DL_DIR_OPTS
In-Reply-To: <CAGt4E5vUJGDUnO1vhzkMqdP86Li05Ae+eMmSNN1h8g85MsXK7g@mail.gmail.com>
References: <20181031213930.49837-1-mmayer@broadcom.com>
 <23d9ca8b-1c2a-5f1b-891e-5867b25d1ec7@mind.be>
 <20181101122302.GS28575@scaer>
 <CAGt4E5vUJGDUnO1vhzkMqdP86Li05Ae+eMmSNN1h8g85MsXK7g@mail.gmail.com>
Message-ID: <20181101170428.GV28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-11-01 08:16 -0700, Markus Mayer spake thusly:
> On Thu, 1 Nov 2018 at 05:23, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-11-01 13:19 +0100, Arnout Vandecappelle spake thusly:
> > > On 31/10/18 22:39, Markus Mayer wrote:
> > > > Provide a simple mechanism to pass extra arguments to "mkdir" when
> > > > creating download directories. This can be helpful if one needs the
> > > > download directories to be writable multiple users ("shared download
> > > > cache").
> > >
> > >  I think having a Config.in option for this is way overkill. You can just make
> > > the directory before calling Buildroot, right? And if it is a shared directory,
> > > it should be created only once anyway.
> >
> > Yes for the top-level BR2_DL_DIR. But Buildroot does create sub-dirs,
> > one per package, and Bbuildroot also enforces the umask to 0022, which
> > means sub-dirs will not have the group-writable bit set.
> 
> Yep. That's exactly the problem we are running into. There was no
> issue when buildroot wasn't creating sub-dirs per package. But now,
> with a sub-dir per package, those sub-directories end up being
> non-writable by group, which means that a different user building
> buildroot at a time when there is a new source tar-ball to download,
> will receive a permission error.
> 
> BTW, the whole exercise of using a shared "dl" directory is to
> conserve disk space on build machines.

Note: I'm all in favour of fixing this use-case, but I have a few other
suggestion in addition to fixing the issue:

0. one may use newgrp to switch to the grou that owns the download
   directory:
    - first, prepare the directory:
        $ mkdir /some/place/dl-dir
        $ chown some-group /some/place/dl-dir
        $ chmod g+rwxs /some/place/dl-dir
    - now, each user uses newgrp:
        $ export BR2_DL_DIR=/some/place/dl-dir
        $ newgrp some-group
        $ make source

1. one could also use a de-duplicating filesystem, like btrfs for example.

But as I said, I'd like we also fix your use-case, and I have a series
locally that gets rid of the umask altogether. But even that will
require that participating users use an appropriate umask of course.

Regards,
Yann E. MORIN.

> Thanks,
> -Markus
> 
> > Regards,
> > Yann E. MORIN.
> >
> > >  Regards,
> > >  Arnout
> > >
> > > [snip]
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 1 Nov 2018 08:16:56 -0700
Subject: [Buildroot] [PATCH] Config.in: add BR2_DL_DIR_OPTS
In-Reply-To: <20181101122302.GS28575@scaer>
References: <20181031213930.49837-1-mmayer@broadcom.com>
 <23d9ca8b-1c2a-5f1b-891e-5867b25d1ec7@mind.be>
 <20181101122302.GS28575@scaer>
Message-ID: <CAGt4E5vUJGDUnO1vhzkMqdP86Li05Ae+eMmSNN1h8g85MsXK7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 1 Nov 2018 at 05:23, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Arnout, All,
>
> On 2018-11-01 13:19 +0100, Arnout Vandecappelle spake thusly:
> > On 31/10/18 22:39, Markus Mayer wrote:
> > > Provide a simple mechanism to pass extra arguments to "mkdir" when
> > > creating download directories. This can be helpful if one needs the
> > > download directories to be writable multiple users ("shared download
> > > cache").
> >
> >  I think having a Config.in option for this is way overkill. You can just make
> > the directory before calling Buildroot, right? And if it is a shared directory,
> > it should be created only once anyway.
>
> Yes for the top-level BR2_DL_DIR. But Buildroot does create sub-dirs,
> one per package, and Bbuildroot also enforces the umask to 0022, which
> means sub-dirs will not have the group-writable bit set.

Yep. That's exactly the problem we are running into. There was no
issue when buildroot wasn't creating sub-dirs per package. But now,
with a sub-dir per package, those sub-directories end up being
non-writable by group, which means that a different user building
buildroot at a time when there is a new source tar-ball to download,
will receive a permission error.

BTW, the whole exercise of using a shared "dl" directory is to
conserve disk space on build machines.

Thanks,
-Markus

> Regards,
> Yann E. MORIN.
>
> >  Regards,
> >  Arnout
> >
> > [snip]
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

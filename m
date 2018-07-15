From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jul 2018 21:45:49 +0200
Subject: [Buildroot] [PATCH 4/5] support/docker: add an Arch image
In-Reply-To: <CAFGQKxe5qQQm=k+CXipjS8U0eJ3nxFB20xJ0QYSMRDbqb1sOPg@mail.gmail.com>
References: <cover.1531463897.git.yann.morin.1998@free.fr>
 <b909713a26b89db6eae65efffa7e05a8136fd9df.1531463897.git.yann.morin.1998@free.fr>
 <CAFGQKxd62h=khKBwP7RwM1uVsAQybHJVjuxNHfPfmaq3Re83gw@mail.gmail.com>
 <F34B3E21-3366-44DD-891B-401FF71F20E9@free.fr>
 <20180715090539.GA2516@scaer>
 <CAFGQKxe5qQQm=k+CXipjS8U0eJ3nxFB20xJ0QYSMRDbqb1sOPg@mail.gmail.com>
Message-ID: <20180715194549.GG2516@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2018-07-15 20:30 +0100, Martin Bark spake thusly:
> On 15 July 2018 at 10:05, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > So, the reasoning is that, since we use a pinned version of the
> > repository, running "pacman -Sy --noconfirm" will always yield the same
> > state of the distribution.
> >
> > Now, it happens that we need to add a new package to the image, e.g. for
> > local testing. We can thus re-use the intermediate, locally-cached image
> > that has the local repository updated.
> >
> > It kinda speeds up things a bit.
> 
> Yes where you have a pinned package repo i agree splitting the update
> and install is ok.  So for debian and archlinux this is true but for
> alpine you do need the update and install in one RUN

Agreed on principle.

However, I'd like we use the same constructs in all our dockerfiles, for
consistency sake.

And even if I did not expend too much time at making the Alpine image
reproducible, I expect that we can ultimately make it so, if it is not
already.

In fact, I even expected people to show up and say "hey! what you did
makes ofr a reproducible image," or "hey! here's how you can make it
reproducible." ;-)

Regards,
Yann E. MORIN.

[--SNIP--]
> >> >> +        qemu \
> >> >> +        qemu-arch-extra \
> >> >
> >> >If you change to using qemu-headless and qemu-headless-arch-extra
> >> >packages it saves about 500MB on the image size
> >
> > Ah, that one is interesting to know! :-)
> >
> > However, are we sure that we don;t need the headed version of qemu?
> >
> > And why do we even have to have qemu in the image to start with, in the
> > end?
> 
> Good questions i don't know the answer to.  I assume it's something to
> do with automated testing.
> 
> Thanks
> 
> Martin
> 
> >
> > Regards,
> > Yann E. MORIN.
> >
> >> >Thanks
> >> >
> >> >Martin
> >> >
> >> >> +        rsync \
> >> >> +        subversion \
> >> >> +        unzip \
> >> >> +        wget
> >> >> +
> >> >> +RUN sed -i 's/# *\(en_US.UTF-8\)/\1/' /etc/locale.gen \
> >> >> +    && /usr/sbin/locale-gen
> >> >> +
> >> >> +RUN useradd -ms /bin/bash br-user
> >> >> +
> >> >> +USER br-user
> >> >> +WORKDIR /home/br-user
> >> >> +ENV HOME /home/br-user
> >> >> +ENV LC_ALL en_US.UTF-8
> >> >> --
> >> >> 2.14.1
> >> >>
> >> >> _______________________________________________
> >> >> buildroot mailing list
> >> >> buildroot at busybox.net
> >> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >>
> >> Martin, All,
> >> --
> >> Sent from my phone. Please excuse my brevity.
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

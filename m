From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Mar 2020 18:33:27 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/libtextstyle: new package
In-Reply-To: <20200314152512.708b5d06@windsurf>
References: <20200312201004.3848419-1-aduskett@gmail.com>
 <20200314152512.708b5d06@windsurf>
Message-ID: <20200323173327.GH22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-03-14 15:25 +0100, Thomas Petazzoni spake thusly:
> On Thu, 12 Mar 2020 13:10:01 -0700
> aduskett at gmail.com wrote:
> 
> > From: Adam Duskett <Aduskett@gmail.com>
> > 
> > This library provides an easy way to add styling to programs that produce
> > output to a console or terminal emulator window.
> > 
> > libtextstyle is for you if your application produces text that is more readable
> > when it is accompanied with styling information, such as color, font attributes
> > (weight, posture), or underlining.
> > 
> > Newer versions of gettext-gnu require this package.
> > 
> > Tested with test-pkg -p gettext-tiny in Debian 10 and Centos 7
> > 
> >             br-arm-full [1/6]: OK
> >  br-arm-cortex-a9-glibc [2/6]: OK
> >   br-arm-cortex-m4-full [3/6]: OK
> >          br-x86-64-musl [4/6]: OK
> >      br-arm-full-static [5/6]: OK
> >            sourcery-arm [6/6]: OK
> > 
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> 
> I'm confused. Why do we need a separate for this, if this is part of
> gettext-gnu, and needed only by gettext-gnu ?

So, for the records, in cae you missed the IRC discussion:

  - our gettext-gnu package has: HOST_GETTEXT_GNU_SUBDIR = gettext-tools
    so only the gettext-tools sub-directory is configured and built

  - gettext-tools need libtextstyle, but that is not getting configured
    nor built

So we have three options:

  - add hooks to configure + build libtextstyles as a pre-configure hook
    in gettext-gnu, and install it in a pre-install hook,

  - add a separate package for libtextstyle,

  - revert to building the whole of gettext.

Adam did some timings with BR2_JLEVEL=4, and he got:

  - just getext-tools:      38.86s user 22.13s system 124% cpu 49.035 total
  - just libtextstyles:     40.78s user 14.57s system 146% cpu 37.817 total
  - whole of gettext:       203.18s user 122.87s system 161% cpu 3:22.39 total

So, the whole of gettext is still ~4x the time to build the tools and
libtextstyle. This is not acceptable...

I think hacking the build of libtextstyles with hooks is not gonna fly
far either.

So we're back at a separate package as the only viable solution, I'm
afraid.

Does that make sense?

Of course, we need to write that down in a commit log somewhere... ;-)

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

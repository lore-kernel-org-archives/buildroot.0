From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jul 2014 01:22:07 +0200
Subject: [Buildroot] [v2 3/3] perl-net-ssleay: fix build
In-Reply-To: <20140714224346.GP3684@free.fr>
References: <1404406406-9209-1-git-send-email-francois.perrad@gadz.org>
 <1404406406-9209-3-git-send-email-francois.perrad@gadz.org>
 <20140713133552.GD3588@free.fr>
 <CAB0FRsuVFTVYA9D7MqSjm7VdzDeDFXGGM9moziB86U0wFY8CCg@mail.gmail.com>
 <20140714224346.GP3684@free.fr>
Message-ID: <20140714232207.GQ3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-07-15 00:43 +0200, Yann E. MORIN spake thusly:
> On 2014-07-14 21:52 +0200, Fran?ois Perrad spake thusly:
> > 2014-07-13 15:35 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > > On 2014-07-03 18:53 +0200, Francois Perrad spake thusly:
> > >> the following error occurs after the previous patch
> > >>     arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-shared '
> > >>
> > >> so, force LDDLFLAGS without quote
> > >>
> > >> note: previously LDDLFLAGS was correct
> > >> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > >
> > > I've dropped this patch from my resend [0], and marked it Rejected in
> > > the patchwork, because I submitted an alternative patch, and C extensions
> > > to Perl can not be built static anyway.
> > 
> > On my box, with all patches already applied in the trunk, I still need
> > this patch.
> 
> Ah, I see. I re-tested here, and indeed, it does perl-net-ssleay does
> not build anymore.
> 
> I swear I was able to build it before I removed that patch... :-(

OK, that's probably because I had removed -shared fron pkg-perl.mk and
forgot about it.

> However, I have investigated a bit, and here are my findings:
> 
>   - our pkg-perl simply calls 'perl' to run the configure steps
>   - this calls to the host system's perl
>   - it also passes (among many other flags)::
>         --config lddlflags="-shared $$(TARGET_LDFLAGS)"

I tried to set TARGET_LDFLAGS="-g" since -g is simply ignored by ld, and
I left the -shared in lddlflags on the configure line, but then, here's
what I got:
    arm-linux-gnueabihf-gcc: error: unrecognized command line option ?-shared -g?

Bummer! So, if we pass more than one option to --lddlflags, the perl
infra completely derails, and sets LDDLFLAGS in the Makefile, to:
    LDDLFLAGS = '-shared -g'

Bad, real bad... :-(

OK, let's see what happens to other extensions. What about
perl-mojolicious? Here's what LDDLFLAGS looks like with -shared on the
configure line, and TARGET_LDFLAGS=-g:
    LDDLFLAGS = -shared -g

Oooookay... And other extensions are OK, too.

So, that's not the perl infra that is brain-dead, that's really
perl-net-ssleay which is completely f*cked up... :-(

OK, I'll revive your patch, with a few quirks...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jul 2014 00:43:46 +0200
Subject: [Buildroot] [v2 3/3] perl-net-ssleay: fix build
In-Reply-To: <CAB0FRsuVFTVYA9D7MqSjm7VdzDeDFXGGM9moziB86U0wFY8CCg@mail.gmail.com>
References: <1404406406-9209-1-git-send-email-francois.perrad@gadz.org>
 <1404406406-9209-3-git-send-email-francois.perrad@gadz.org>
 <20140713133552.GD3588@free.fr>
 <CAB0FRsuVFTVYA9D7MqSjm7VdzDeDFXGGM9moziB86U0wFY8CCg@mail.gmail.com>
Message-ID: <20140714224346.GP3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-07-14 21:52 +0200, Fran?ois Perrad spake thusly:
> 2014-07-13 15:35 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > On 2014-07-03 18:53 +0200, Francois Perrad spake thusly:
> >> the following error occurs after the previous patch
> >>     arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-shared '
> >>
> >> so, force LDDLFLAGS without quote
> >>
> >> note: previously LDDLFLAGS was correct
> >> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> >
> > I've dropped this patch from my resend [0], and marked it Rejected in
> > the patchwork, because I submitted an alternative patch, and C extensions
> > to Perl can not be built static anyway.
> 
> On my box, with all patches already applied in the trunk, I still need
> this patch.

Ah, I see. I re-tested here, and indeed, it does perl-net-ssleay does
not build anymore.

I swear I was able to build it before I removed that patch... :-(

However, I have investigated a bit, and here are my findings:

  - our pkg-perl simply calls 'perl' to run the configure steps
  - this calls to the host system's perl
  - it also passes (among many other flags)::
        --config lddlflags="-shared $$(TARGET_LDFLAGS)"
  - this gets shoehorned into the generated Makefile as:
        LDDLFLAGS = '-shared '
  - which, when calling gcc for the link step, is then passed as:
        ...-gcc  '-shared ' ...
  - which is interpreted by gcc as the option '-shared ', so with a
    trailing space.

Removing the -shared from the configure steps yields a Makefile with:
        LDDLFLAGS = -shared -L/usr/local/lib -fstack-protector

Notice how there is no longer any single-quote around the value. And
now, it builds!

However, there is an unwanted -L/usr/local/lib option, which is properly
wrong, since we're doing cross-compilation. So, where does it come from?

Well, remember we're calling the host system's perl. On my system, I was
able to track the definition of LDDLFALGS to this file:
    /usr/lib/perl/5.18.2/Config_heavy.pl

which aptly contains:
    lddlflags='-shared -L/usr/local/lib -fstack-protector'

Changing the 'local' in there by 'YEM' would yield a Makefile for
perl-net-ssleay with, guess what? The following:
    LDDLFLAGS = -shared -L/usr/YEM/lib -fstack-protector

Bingo!

But why doesn't it take the value we pass on the configure line? Ah, for
my config, $(TARGET_LDFLAGS) is empty. So, it seems that if we pass an
empty value to --lddlflags, then it uses the default value specified in
the installation's files. That's not good...

So, it seems we would need to do one of the following:

  - find a way to pass a no-op, non-empty value to lddlflags, or
  - munge all generated Makefile so they no longer have paths to the
    host system libs/includes, or
  - tell the host perl not to use system paths, but I guess perl is not
    well equipped to be gentle to cross-compiletion, or
  - build our own host-perl and munge its installed files so they point
    to $(STAGING_DIR) (instead of $(HOST_DIR), probably)

Heck, I think the first option is the quickest as a workaround, but that
the latest is the safest, although the most complex. I doubt the third
would be that easy, while with the second option, we may miss
something... :-(

In any case, the -shared value in the configure steps is absolutely not
needed (and it breaks the build!) I'm testing the other extensions now
to see if we can really remove it...

BTW, all the above is also valid for LDFLAGS, sicne mine also contain an
option -L/usr/local/lib .

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

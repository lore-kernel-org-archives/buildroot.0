From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jan 2021 23:06:39 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/uclibc: add backtrace
 support option
In-Reply-To: <CABNF3=ZESct_f8X5mULEzwupkXgDZaXK0awjxrZatBqx+mWczg@mail.gmail.com>
References: <20210111130705.25005-1-andrea.ricchi@amarulasolutions.com>
 <20210111171441.GY3044608@scaer>
 <CABNF3=ZESct_f8X5mULEzwupkXgDZaXK0awjxrZatBqx+mWczg@mail.gmail.com>
Message-ID: <20210112220639.GA3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrea, All,

+Peter, +Thomas, +Arnout for additional feedback: question toward the
end of the mail...

On 2021-01-11 20:49 +0100, Andrea Ricchi spake thusly:
> On Mon, Jan 11, 2021 at 6:14 PM Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
> > On 2021-01-11 14:07 +0100, Andrea Ricchi spake thusly:
> > > Add toolchain configuration to support execinfo.h and backtrace
> > > features.
> > >
> > > Signed-off-by: Andrea Ricchi < [2]andrea.ricchi@amarulasolutions.com>
> > > ---
> > > Changes v2 -> v3:
> > >? ?- Remove BR2_USE_BACKTRACE selection (suggested by Angelo Compagnucci)
> > Ah, you noticed already, good. :-)
> > I did not see the review mail by Angelo, so internal review I guess. In
> > that case, it would have been nice that you Cc-ed him on the v3, with a
> > ?Cc: tag right below your own SoB line, so that git sends the Cc
> > automatically. Basically, it is customary to add people that provided a
> > review as Cc of your respins.
> Understood. This is my first patch and I'm getting used to this review process.?

Sure, hence my comments. ;-)

> Let me know if other changes are needed.

No, that's OK.

But looking from a wider perspective, there is the question of how many
uClibc configure options we want to have in the Buildroot config (as
raised by Thomas on IRC).

There are already two ways to customize the uClibc configuration:

  - BR2_UCLIBC_CONFIG, which allows one to use a (def)config that differs
    from the one bundled in Buildroot, and

  - BR2_UCLIBC_CONFIG_FRAGMENT_FILES, which allows one to provide
    additional fragments (def)config that apply on top of BR2_UCLIBC_CONFIG.

Adding yet a third way, options in the Buidlroot main menu, will make
the thing even more complex to manage.

We can argue that we currently have four options to configure uClibc
from the Buildroot's own config:

  - BR2_TOOLCHAIN_BUILDROOT_WCHAR, that drives whether wide chars are
    available,

  - BR2_TOOLCHAIN_BUILDROOT_LOCALE, which drives whether locales are
    supported,

  - BR2_PTHREADS_NATIVE, BR2_PTHREADS, and BR2_PTHREAD_DEBUG, which
    drive whether threads ara vailable, and which flavour to use, and

  - BR2_TOOLCHAIN_BUILDROOT_USE_SSP, which drives whether stack-smashing
    protection is enabled.

However, those four options are fundamental features of the C library,
that impact the features present in the toolchain. We must know about
those to know whether a package will build/work or not, and hide/show
it appropriately. No need to show a package to the user if it is known
that package will not build or run.

I.e. without the knowledge about those features, the configuration of
Buildroot would be very incomplete.

On the other hand, support for libubacktrace in uClibc is not so much a
core feature. If we add such an option, we could end up having quite a
lot of additional options too, and we definitely can't duplicate the
whole uClibc config setup in Buildroot.

An often-brought excuse for adding such an option, is that it makes it
that the configuration is nicely packed into a single file. I find this
to be a bit overblown, tbh, because that configuration file has to be
stored somewhere (in a VCS most probably), and there are already other
additional files that will be needed for a real-world system, like the
runtime configuration files, but also users tables, post-build scripts,
genimage setupcriptions, and a whole lot more. Adding another (def)config
and/or fragment is not that much a hurdle I would say.

So, even if the patch is looking good from a technical point of view, is
it a good feature to add, or is that use-case not better served using
the existing BR2_UCLIBC_CONFIG and/or BR2_UCLIBC_CONFIG_FRAGMENT_FILES
mechanisms?

On my part I'm still about 50/50, maybe still leaning a bit toward 'no',
but I'm not dead-set...

Peter, Thomas, Arnout, others: quid?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

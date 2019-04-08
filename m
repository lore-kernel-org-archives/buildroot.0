From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Apr 2019 18:36:56 +0200
Subject: [Buildroot] [PATCH] linux: use host pkg-config when host libelf
 is set
In-Reply-To: <8a20aa305ce3318c3f07a7aec30ab56a1bbabcc9.camel@intel.com>
References: <20190404192413.10205-2-stuart.summers@intel.com>
 <20190405184712.5582-1-stuart.summers@intel.com>
 <20190406203117.GD2659@scaer>
 <8a20aa305ce3318c3f07a7aec30ab56a1bbabcc9.camel@intel.com>
Message-ID: <20190408163656.GA23890@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stuart, All,

On 2019-04-08 16:00 +0000, Summers, Stuart spake thusly:
> On Sat, 2019-04-06 at 22:31 +0200, Yann E. MORIN wrote:
> > On 2019-04-05 11:47 -0700, Stuart Summers spake thusly:
> > > A patch was added to the Linux kernel in 5.1.0-rc3 which
> > > adds a requirement that the host build environment include
> > > pkg-config. Add the correct host-pkgconf dependency and
> > > environment variables to ensure Linux picks up the correct
> > > libraries.
[--SNIP--]
> > > -ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
> > > -LINUX_DEPENDENCIES += host-elfutils
> > > -endif
> > 
> > Why did you move that block around?
> 
> Moved this for a single conditional after the initial LINUX_MAKE_ENV =
> ...

Ah OK, makes sense.

However, this means that the various BR2_LINUX_KERNEL_NEEDS_HOST_*
blocks are all scatered around in the file, now.

What about:

  - move the existign LINUX_MAKE_ENV assignment earlier in the file,

  - keep the block in-place and expand it, like:

    ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
    LINUX_DEPENDENCIES += host-elfutils host-pkgconf
    LINUX_MAKE_ENV += \
        blablabla
    endif

> I could have alternatively separated into two
> LINUX_KERNEL_NEEDS_HOST_LIBELF conditions, but I opted to squash them
> together.

Which is correct, I just missed the existing LINUX_MAKE_ENV location.

[--SNIP--]
> > If needed, please expand that blacklist with the two additional
> > PKG_CONFIG_ALLOW_SYSTEM_{CFLAGS,LIBS} this patch introduces.
> 
> I apologize for my lack of understanding in this area. I'm happy to add
> this to the blacklist you mentioned. At least local testing seems to
> indicate that "make linux-menuconfig" works both with and without the
> blacklist. I tried this with a default configuration (make distclean ->
> make menuconfig -> enable Linux and use an architecture default config
> file -> make linux-menuconfig), and this results in a full host
> structure being set up in output/host. So it seems like the blacklist
> of these two extra variables isn't strictly necessary. Or am I missing
> something? That said, looking at the documentation, maybe this takes
> away the ability for a user to have a custom pkg-config path - I'm
> using the default installation. So in that sense, blacklisting does
> seem like the right thing to do. I'll add this and post a quick update.

TBH, I think we should really blacklist them, indeed, so that we are
sure the distro provided pkg-config works as expected.

Thanks for the feedback!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

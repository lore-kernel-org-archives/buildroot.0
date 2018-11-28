From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Nov 2018 19:57:38 +0100
Subject: [Buildroot] [PATCH 1/1] libbsd: remove usage of
 __register_atfork
In-Reply-To: <CAPi7W82qbG+XTWfrbMfkY0D8SJz7K5oPKDVSt8N7GVftkS5OxQ@mail.gmail.com>
References: <20181003175409.26025-1-fontaine.fabrice@gmail.com>
 <20181014105813.7123ba04@windsurf>
 <CAPi7W82qbG+XTWfrbMfkY0D8SJz7K5oPKDVSt8N7GVftkS5OxQ@mail.gmail.com>
Message-ID: <20181128185738.GA18074@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-11-28 18:04 +0100, Fabrice Fontaine spake thusly:
> Dear all,
> Le dim. 14 oct. 2018 ? 10:58, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
> >
> > Hello,
> >
> > +Arnout in Cc.
> >
> > On Wed,  3 Oct 2018 19:54:09 +0200, Fabrice Fontaine wrote:
> > > The following error is raised by minizip:
> > >
> > > [100%] Linking C executable minizip
> > > /home/peko/autobuild/instance-0/output/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libbsd.a(arc4random.o): In function `_rs_init.part.1':
> > > arc4random.c:(.text+0xaa): undefined reference to `__register_atfork'
> > > collect2: error: ld returned 1 exit status
> > >
> > > As specified in openssl/Config.in, uClibc on noMMU doesn't provide
> > > __register_atfork() so, as suggested by Arnout during review of minizip
> > > patch (https://patchwork.ozlabs.org/patch/978000), remove usage of this
> > > function from libbsd to always use pthread_atfork
> > >
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/df2dcbdceaa01a2ae37bf09140e4dbef0a5b9489
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  ...02-Remove-usage-of-__register_atfork.patch | 39 +++++++++++++++++++
> > >  1 file changed, 39 insertions(+)
> > >  create mode 100644 package/libbsd/0002-Remove-usage-of-__register_atfork.patch
> >
> > With this change, the build fails in the CI of libbsd:
> > https://gitlab.freedesktop.org/ffontaine/libbsd/-/jobs/26984:

That's because the test should link with -pthread, maybe something not
too far fromm:

    overlay_LDADD = -pthread

(totally untested)

> > http://refspecs.linuxbase.org/LSB_3.0.0/LSB-PDA/LSB-PDA/baselib--register-atfork.html.
> OK, so I'll send a new patch to remove this change and add the
> following dependency on libbsd and minizip:
> # uClibc on noMMU doesn't provide __register_atfork()
> depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)

Works for me too, I guess, until upstream fixes their mess.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

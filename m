From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 28 Nov 2018 18:04:38 +0100
Subject: [Buildroot] [PATCH 1/1] libbsd: remove usage of
 __register_atfork
In-Reply-To: <20181014105813.7123ba04@windsurf>
References: <20181003175409.26025-1-fontaine.fabrice@gmail.com>
 <20181014105813.7123ba04@windsurf>
Message-ID: <CAPi7W82qbG+XTWfrbMfkY0D8SJz7K5oPKDVSt8N7GVftkS5OxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,
Le dim. 14 oct. 2018 ? 10:58, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> +Arnout in Cc.
>
> On Wed,  3 Oct 2018 19:54:09 +0200, Fabrice Fontaine wrote:
> > The following error is raised by minizip:
> >
> > [100%] Linking C executable minizip
> > /home/peko/autobuild/instance-0/output/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libbsd.a(arc4random.o): In function `_rs_init.part.1':
> > arc4random.c:(.text+0xaa): undefined reference to `__register_atfork'
> > collect2: error: ld returned 1 exit status
> >
> > As specified in openssl/Config.in, uClibc on noMMU doesn't provide
> > __register_atfork() so, as suggested by Arnout during review of minizip
> > patch (https://patchwork.ozlabs.org/patch/978000), remove usage of this
> > function from libbsd to always use pthread_atfork
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/df2dcbdceaa01a2ae37bf09140e4dbef0a5b9489
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...02-Remove-usage-of-__register_atfork.patch | 39 +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 package/libbsd/0002-Remove-usage-of-__register_atfork.patch
>
> With this change, the build fails in the CI of libbsd:
> https://gitlab.freedesktop.org/ffontaine/libbsd/-/jobs/26984:
>
> ../src/.libs/libbsd.so: undefined reference to `pthread_atfork'
>
> I guess that's because pthread_atfork() requires linking against
> libpthread ?
>
> Also, pthread_atfork() does not have the dso_handle argument that
> __register_atfork() has. Is this important in the context of libbsd ?
> See
> https://gitlab.com/gnutls/gnutls/commit/84b1a7ac383bf1db4c73b8f044170446deca8b2e
> for example. I would assume no, because there was already a fallback on
> pthread_atfork() in libbsd.
>
> Also, Arnout said __register_atfork() is an internal function, but
> it is documented in LSB:
> http://refspecs.linuxbase.org/LSB_3.0.0/LSB-PDA/LSB-PDA/baselib--register-atfork.html.
OK, so I'll send a new patch to remove this change and add the
following dependency on libbsd and minizip:
# uClibc on noMMU doesn't provide __register_atfork()
depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 May 2021 11:41:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: handle b_pie
In-Reply-To: <20210529092141.GO2788252@scaer>
References: <20210528191748.1598384-1-fontaine.fabrice@gmail.com>
 <20210529090943.GM2788252@scaer> <20210529092141.GO2788252@scaer>
Message-ID: <CAPi7W81QTY2s-sraNPmB4wL3GSR4zys1cwW9D69OZWGZ0ZhWNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Le sam. 29 mai 2021 ? 11:21, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2021-05-29 11:09 +0200, Yann E. MORIN spake thusly:
> > On 2021-05-28 21:17 +0200, Fabrice Fontaine spake thusly:
> > > pipewire unconditionally enables b_pie since version 0.3.20 and
> > > https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/abe73c9146cd223b40b22581b1fd58bc044c671e
> > > which will raise the following build failure on m68k since commit
> > > a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9:
> > >
> > > /srv/storage/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/9.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-1/output-1/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
> > > (.text+0x4): undefined reference to `__shared_flat_add_library'
> > >
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/c258a2736661af8ea73abeda2503d8682e65f1e2
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  package/pkg-meson.mk | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > > index a57820d4d2..a55063d58e 100644
> > > --- a/package/pkg-meson.mk
> > > +++ b/package/pkg-meson.mk
> > > @@ -91,6 +91,7 @@ define $(2)_CONFIGURE_CMDS
> > >             --default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
> > >             --buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
> > >             --cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> > > +           -Db_pie=$(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),true,false) \
> [--SNIP--]
> > In the meantime, I think it is still correct to have b_pie on the
> > command line for our infra, like we have strip, so: applied to master,
> > thanks.
>
> Given a later patch that arrived in parallel, it turns out this patch
> was not correct, and that we still have a bit of interrogation on that,
> so I've reverted it, sorry. I'll keep an eye on the discussions...
I think that the second version of this patch (i.e. always disabling
b_pie through command line) is the best option because:
- PIE is already enabled by the toolchain-wrapper:
hardening-check
output/build/pipewire-0.3.26/build/spa/plugins/audioconvert/benchmark-resample
output/build/pipewire-0.3.26/build/spa/plugins/audioconvert/benchmark-resample:
 Position Independent Executable: yes
- Enabling PIE in two different places is not future-proof and is not
done in any other infrastructures (autotools, cmake, etc.). I think
this is also the reason why strip is unconditionally disabled in the
command line (it is already handled in Makefile.in)
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice

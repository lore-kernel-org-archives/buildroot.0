From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 28 Oct 2019 09:38:55 +0100
Subject: [Buildroot] [PATCH 1/1] Config.in: disable PIC/PIE if the
 toolchain does not support PIE
In-Reply-To: <CAPi7W80aAdRFmTh_yFwOA9L+hWPzYp_m4Q3i165awR67Lcdoiw@mail.gmail.com>
References: <20191027220334.23505-1-fontaine.fabrice@gmail.com>
 <CANQCQpZs-YTANwfOiQsy7ReQ1ABser_eeKzE3p-RHjDuQoruWg@mail.gmail.com>
 <CAPi7W80aAdRFmTh_yFwOA9L+hWPzYp_m4Q3i165awR67Lcdoiw@mail.gmail.com>
Message-ID: <CAPi7W82q1mCBEZc-p7ue=8sQiLS3P-1Vq9+aef2Vgd-hJT-rQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 28 oct. 2019 ? 09:32, Fabrice Fontaine
<fontaine.fabrice@gmail.com> a ?crit :
>
> Dear Matthew,
>
> Le lun. 28 oct. 2019 ? 00:22, Matthew Weber
> <matthew.weber@collins.com> a ?crit :
> >
> > Fabrice,
> >
> > On Sun, Oct 27, 2019 at 5:03 PM Fabrice Fontaine
> > <fontaine.fabrice@gmail.com> wrote:
> > >
> > > m68k does not seem to really support PIE as it raises the following
> > > build failure with aer-inject:
> > > /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/7.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
> > > (.text+0x4): undefined reference to `__shared_flat_add_library'
> > > /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/7.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: final link failed: bad value
> > >
> >
> > I wonder where this ever got to add support as in 2006 as they were
> > trying for m68k.
> > https://lists.uclibc.org/pipermail/uclibc/2006-July/036766.html
> >
> > > We also have another build failure with uclibc on microblazeel:
> > > /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/8.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: final link failed: bad value
> > > collect2: error: ld returned 1 exit status
> > > Makefile.in:114: recipe for target '../utils/getconf' failed
> > >
> >
> > This one looks like it might be fixable and an issue with compile
> > flags missing but link time options being set.  I'm wondering what its
> > doing as the error is in the target install step of the package.
> I tried to fix it for a couple of hours without any luck. What I found
> until now is that the build failure is linked to the
> BR2_UCLIBC_INSTALL_UTILS option which builds and installs uclibc
> utilities such as getconf for the target. Build and install is done in
> UCLIBC_INSTALL_UTILS_TARGET (which is strange but I assume this is to
> avoid an UCLIBC_BUILD_UTILS_TARGET). Build failure is raised by
> Scrt1.o which is built during the previous step but I don't know why
> binutils complains about a missing -fPIC especially that is does
> complain only for microblaze :-/.
For information, the same build failure is raised on microblaze with alsa-lib:
http://autobuild.buildroot.net/results/6c9/6c921a2ab4dd136d064b3016c0af8e8333c2064c//alsa-lib-1.1.9/config.log
> >
> >
> > > So add a BR2_TOOLCHAIN_SUPPORTS_PIE dependency on BR2_PIC_PIE
> > >
> > > Fixes:
> > >  - http://autobuild.buildroot.net/results/4cdd6f0368cc9d3c6e88f01b1a8929eb0839b638
> > >  - http://autobuild.buildroot.net/results/a82a484409149d7f9aff6140ddcb89f627f508c7
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  Config.in | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/Config.in b/Config.in
> > > index ebbb6b41f4..010b0774e3 100644
> > > --- a/Config.in
> > > +++ b/Config.in
> > > @@ -697,10 +697,15 @@ comment "Security Hardening Options"
> > >  config BR2_PIC_PIE
> > >         bool "Build code with PIC/PIE"
> > >         depends on BR2_SHARED_LIBS
> > > +       depends on BR2_TOOLCHAIN_SUPPORTS_PIE
> > >         help
> > >           Generate Position-Independent Code (PIC) and link
> > >           Position-Independent Executables (PIE).
> > >
> > > +comment "PIC/PIE needs a toolchain w/ PIE"
> > > +       depends on BR2_SHARED_LIBS
> > > +       depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
> > > +
> > >  choice
> > >         bool "Stack Smashing Protection"
> > >         default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
> > > @@ -783,12 +788,16 @@ config BR2_RELRO_PARTIAL
> > >
> > >  config BR2_RELRO_FULL
> > >         bool "Full"
> > > +       depends on BR2_TOOLCHAIN_SUPPORTS_PIE
> > >         select BR2_PIC_PIE
> > >         help
> > >           This option includes the partial configuration, but also marks
> > >           the GOT as read-only at the cost of initialization time during
> > >           program loading, i.e every time an executable is started.
> > >
> > > +comment "RELRO Full needs a toolchain w/ PIE"
> > > +       depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
> > > +
> > >  endchoice
> > >
> > >  comment "RELocation Read Only (RELRO) needs shared libraries"
> > > --
> > > 2.23.0
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
> >
> > --
> >
> > Matthew Weber | Associate Director Software Engineer | Commercial Avionics
> >
> > COLLINS AEROSPACE
> >
> > 400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
> >
> > Tel: +1 319 295 7349 | FAX: +1 319 263 6099
> >
> > matthew.weber at collins.com | collinsaerospace.com
> >
> >
> >
> > CONFIDENTIALITY WARNING: This message may contain proprietary and/or
> > privileged information of Collins Aerospace and its affiliated
> > companies. If you are not the intended recipient, please 1) Do not
> > disclose, copy, distribute or use this message or its contents. 2)
> > Advise the sender by return email. 3) Delete all copies (including all
> > attachments) from your computer. Your cooperation is greatly
> > appreciated.
> >
> >
> > Any export restricted material should be shared using my
> > matthew.weber at corp.rockwellcollins.com address.
> Best Regards,
>
> Fabrice
Best Regards,

Fabrice

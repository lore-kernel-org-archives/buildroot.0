From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Oct 2019 12:12:55 +0100
Subject: [Buildroot] [PATCH 1/1] Config.in: -fstack-protector-all needs
 PIE
In-Reply-To: <CANQCQpbYaOhgdHDaAZkdBUCh-TOjpaMoipzgbV3KUiJvUVwDJg@mail.gmail.com>
References: <20191029095736.16586-1-fontaine.fabrice@gmail.com>
 <CANQCQpbYaOhgdHDaAZkdBUCh-TOjpaMoipzgbV3KUiJvUVwDJg@mail.gmail.com>
Message-ID: <CAPi7W805KLB8GjOqtJdG1joSOQA8QLx=avoT0AiMn8Rj0xxNTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew,

Le mar. 29 oct. 2019 ? 11:45, Matthew Weber
<matthew.weber@collins.com> a ?crit :
>
> Fabrice,
>
> On Tue, Oct 29, 2019 at 4:57 AM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > jpeg-turbo fails to build with BR2_SSP_ALL on:
> >
> > /data/buildroot/buildroot-test/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-linux-gnu/7.3.1/../../../../aarch64_be-linux-gnu/bin/ld: ../CMakeFiles/simd.dir/jsimd_none.c.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against external symbol `__stack_chk_guard@@GLIBC_2.17' can not be used when making a shared object; recompile with -fPIC
> >
> > Fix this issue by selecting BR2_PIC_PIE (if possible) with BR2_SSP_ALL
>
> Interesting, I hadn't run into this on other non-aarch64 arch when I
> was testing SSP strong (maybe its just a SSP all bug?).  Here's a
> pretty good thread with details that support a similar case of QEMU on
> Redhat needing fPIC.
> https://bugzilla.redhat.com/show_bug.cgi?id=1232499
This build failure happens only with BR2_SSP_ALL. I build-tested
jpeg-turbo with BR2_SSP_STRONG and without BR2_PIC_PIE, it builds
fine.
>
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/51459f3f26aa2e2a038ee717548266aaec05bafc
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  Config.in | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Config.in b/Config.in
> > index 010b0774e3..3efa171405 100644
> > --- a/Config.in
> > +++ b/Config.in
> > @@ -751,11 +751,18 @@ config BR2_SSP_STRONG
> >
> >  config BR2_SSP_ALL
> >         bool "-fstack-protector-all"
> > +       depends on BR2_SHARED_LIBS
> > +       depends on BR2_TOOLCHAIN_SUPPORTS_PIE
> > +       select BR2_PIC_PIE
> >         help
> >           Like -fstack-protector except that all functions are
> >           protected. This option might have a significant performance
> >           impact on the compiled binaries.
> >
> > +comment "-fstack-protector-all needs a toolchain w/ PIE"
> > +       depends on BR2_SHARED_LIBS
> > +       depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
> > +
> >  endchoice
> >
> >  config BR2_SSP_OPTION
> > --
> > 2.23.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
>
> Matthew Weber | Associate Director Software Engineer | Commercial Avionics
>
> COLLINS AEROSPACE
>
> 400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
>
> Tel: +1 319 295 7349 | FAX: +1 319 263 6099
>
> matthew.weber at collins.com | collinsaerospace.com
>
>
>
> CONFIDENTIALITY WARNING: This message may contain proprietary and/or
> privileged information of Collins Aerospace and its affiliated
> companies. If you are not the intended recipient, please 1) Do not
> disclose, copy, distribute or use this message or its contents. 2)
> Advise the sender by return email. 3) Delete all copies (including all
> attachments) from your computer. Your cooperation is greatly
> appreciated.
>
>
> Any export restricted material should be shared using my
> matthew.weber at corp.rockwellcollins.com address.
Best Regards,

Fabrice

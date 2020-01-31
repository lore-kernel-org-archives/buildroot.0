From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 31 Jan 2020 09:11:25 -0600
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-buildroot: PPC64
 support in musl requires ALTIVEC
In-Reply-To: <2389f55d-8fc4-041a-95e6-acceb9ed297b@smile.fr>
References: <20200131144106.18054-1-vfazio@xes-inc.com>
 <2389f55d-8fc4-041a-95e6-acceb9ed297b@smile.fr>
Message-ID: <CANQCQpYoHcf5Uddexi9uVrdZ-7QhVQpD6FV8s5w=LvAPX2CfJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent,

On Fri, Jan 31, 2020 at 8:56 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> Hi Vincent,
>
> Le 31/01/2020 ? 15:41, Vincent Fazio a ?crit :
> > musl assumes all PPC64(LE) CPUs support ALTIVEC instructions. However,
> > the e5500 does not support ALTIVEC so builds targeting this CPU using
> > musl will generate illegal instructions.
> >
> > Disable musl if the PPC64(LE) CPU does not support ALTIVEC instructions.
>
> Thanks for this patch.

Thanks as well for the patch.  It actually applies to both LE and BE
e5500 targets

>
> Can you add these two links from my toolchains-builder instance:
> https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092743
> https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092744
>
> Also I'm adding Matt in Cc:
>
> Best regards,
> Romain
>
> >
> > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> > ---
> >  toolchain/toolchain-buildroot/Config.in | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> > index a980f766ac..09a46822c9 100644
> > --- a/toolchain/toolchain-buildroot/Config.in
> > +++ b/toolchain/toolchain-buildroot/Config.in
> > @@ -83,8 +83,10 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
> >       bool "musl"
> >       depends on BR2_aarch64     || BR2_arm   || BR2_armeb   || BR2_i386 || \
> >                  BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
> > -                BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
> > -                BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
> > +                BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_RISCV_64 || \
> > +                BR2_sh          || BR2_x86_64 || \
> > +                ((BR2_powerpc64 || BR2_powerpc64le) && BR2_POWERPC_CPU_HAS_ALTIVEC)
> > +                # musl assumes all PPC64 targets support ALTIVEC instructions
> >       depends on !BR2_powerpc_SPE # not supported, build breaks
> >       # sh2 nommu is supported by musl, but we don't have support
> >       # for it in Buildroot.
> >
>


-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.

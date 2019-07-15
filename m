From: Guo Ren <guoren@kernel.org>
Date: Tue, 16 Jul 2019 07:06:24 +0800
Subject: [Buildroot] [PATCH 1/2] arch/csky: restrict ck610 to the C-SKY
 gcc port
In-Reply-To: <20190715165328.GL29941@scaer>
References: <cover.1563098054.git.yann.morin.1998@free.fr>
 <c19ea092f48534429b8d71fe1ae13cb8856008b1.1563098054.git.yann.morin.1998@free.fr>
 <CAJF2gTQJV0rDrN4GU6pza7J-Rp0JnXZ6XeTh23qbn_x_Z+RZUA@mail.gmail.com>
 <20190715165328.GL29941@scaer>
Message-ID: <CAJF2gTQ9drjRONdtWH6uW+JEJXWE-vZKc3fBeOijLta8FH2DCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked, thx

On Tue, Jul 16, 2019 at 12:53 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Guo, All,
>
> On 2019-07-16 00:02 +0800, Guo Ren spake thusly:
> > On Sun, Jul 14, 2019 at 5:54 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > >
> > > As Guo explained, upstream gcc does not support abi-v1 (only abi-v2), but
> > > ck610 needs abi-v1 [0] [1]
> > >
> > > To simplify things, we make the whole C-SKY architecture require gcc-9
> > > or later, and add a single exception in gcc to force the ck610 to use
> > > the C-SKY port.
> > >
> > > [0] http://lists.busybox.net/pipermail/buildroot/2019-July/254386.html
> > > [1] package/Makefile.in#73
> > >
> > > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > > Cc: Guo Ren <guoren@kernel.org>
> > > Cc: Arnout Vandecappelle <arnout@mind.be>
> > > Cc: Romain Naour <romain.naour@gmail.com>
> > > ---
> > >  arch/Config.in             | 3 +++
> > >  arch/Config.in.csky        | 2 ++
> > >  package/gcc/Config.in.host | 3 +++
> > >  3 files changed, 8 insertions(+)
> > >
> > > diff --git a/arch/Config.in b/arch/Config.in
> > > index d8d841b1a2..9d1a06872d 100644
> > > --- a/arch/Config.in
> > > +++ b/arch/Config.in
> > > @@ -78,6 +78,9 @@ config BR2_aarch64_be
> > >  config BR2_csky
> > >         bool "csky"
> > >         select BR2_ARCH_HAS_MMU_MANDATORY
> > > +       # Most variants are support by gcc-9+, except one that is handled as a
> > > +       # special exception in package/gcc/Config.in.host
> > > +       select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
> > We recommand using  BR2_GCC_VERSION_CSKY not BR2_GCC_VERSION_9_X. I
> > don't want GCC_9 as default for buildroot user and they could select
> > it by themself.
>
> This new 'select' does not change the pereferred gcc version. It just
> limits which ones are available.
>
> By selecting BR2_ARCH_NEEDS_GCC_AT_LEAST_9, we ensure that any version
> of gcc below 9.x are not visible.
>
> But the C-SKY specific gcc version, BR2_GCC_VERSION_CSKY, is not
> impacted by this restriction.
>
> So, with this patch, when BR2_csky=y:
>
>   - with ck610, only BR2_GCC_VERSION_CSKY is available, labelled "gcc
>     csky" in the gcc version selection, in menuconfig;
>
>   - with any other variant, BR2_GCC_VERSION_CSKY and BR2_GCC_VERSION_9_X
>     are both available, and BR2_GCC_VERSION_CSKY is the dfault.
Great, thx for these patches and we'll improve GCC_9 continuously in future.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

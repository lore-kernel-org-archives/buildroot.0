From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Mar 2021 19:19:35 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/batman-adv: fix compile with
 BR2_PACKAGE_BATMAN_ADV_BATMAN_V disabled
In-Reply-To: <CA+h8R2p+uepuOOpG=QbZ+y4bEzQZ4eL6BQU1wScyqXfVXALYZA@mail.gmail.com>
References: <20210314223207.13460-1-ps.report@gmx.net>
 <CA+h8R2qT=su3CO8OCVbQtdpsZezCxsrnq2UtWWNJVp+ZP75r8A@mail.gmail.com>
 <20210315225046.522e98f6@gmx.net>
 <CA+h8R2p+uepuOOpG=QbZ+y4bEzQZ4eL6BQU1wScyqXfVXALYZA@mail.gmail.com>
Message-ID: <20210316191935.6cfb47fa@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Mon, 15 Mar 2021 18:45:20 -0700, Christian Stewart <christian@paral.in> wrote:

> Hi Peter,
>
> On Mon, Mar 15, 2021 at 2:50 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > On Mon, 15 Mar 2021 14:00:38 -0700, Christian Stewart <christian@paral.in> wrote:
> > > On Sun, Mar 14, 2021 at 3:32 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > >
> > > > The given 'CONFIG_BATMAN_ADV_BATMAN_V=' is enough to trigger the wrong
> > > > code compile path in net/batman-adv/bat_v.h missing the static inline
> > > > dummy implementations.
> > > >
> > > > Fixes:
> > >
> > > Unfortunately after applying this commit it still breaks.
> > >
> > > I confirmed that the CONFIG_BATMAN_ADV_BATMAN_V is not being set now.
> > >
> > >
> > > CONFIG_BATMAN_ADV=m
> > > CONFIG_BATMAN_ADV_BLA=y
> > > CONFIG_BATMAN_ADV_DAT=y
> > > CONFIG_BATMAN_ADV_MCAST=y
> > > M=build/batman-adv-2021.0/net/batman-adv
> > > make modules
> > >
> > > [snip]
> > >
> > >   MODPOST /build/batman-adv-2021.0/net/batman-adv/Module.symvers
> > > ERROR: modpost: "batadv_v_mesh_free" undefined!
> > > ERROR: modpost: "batadv_v_mesh_init" undefined!
> > > ERROR: modpost: "batadv_v_hardif_init" undefined!
> > > ERROR: modpost: "batadv_v_init" undefined!
> >
> > Mind to share your defconfig (which cross-compiler)?
> >
> > Did you do a complete re-build of the batman-adv-2021.0
> > package (rm -rf build/batman-adv-2021.0 && make batman-adv)?
>
> Buildroot toolchain,
>
> BR2_x86_64=y
> BR2_TOOLCHAIN=y
> BR2_TOOLCHAIN_USES_GLIBC=y
> BR2_TOOLCHAIN_BUILDROOT=y
> BR2_BINUTILS_VERSION_2_35_X=y
> BR2_GCC_VERSION_10_X=y
> BR2_PACKAGE_BATMAN_ADV=y
>
> Yes, deleted the build/batman-adv* dir and fully re-built, and
> confirmed that it was not setting the BATMAN_ADV_V flag anymore.

O.k, using the following defconfig I get the same failure:

BR2_x86_64=y
BR2_GCC_VERSION_10_X=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_PACKAGE_BATMAN_ADV=y

My RPi4 test case had an RPi4 linux kernel already enabling the build-in
batman-adv module inclusive batman-v...

Hopefully fixed this time for real with

https://patchwork.ozlabs.org/project/buildroot/patch/20210316181429.30804-1-ps.report at gmx.net/
https://patchwork.ozlabs.org/project/buildroot/patch/20210316181429.30804-2-ps.report at gmx.net/

and a note about the linux mainline kernel module added with

https://patchwork.ozlabs.org/project/buildroot/patch/20210316181429.30804-3-ps.report at gmx.net/

Regards,
Peter

>
> Thanks,
> Christian
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

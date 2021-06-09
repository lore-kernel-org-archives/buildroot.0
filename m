From: Drew Fustini <drew@beagleboard.org>
Date: Wed, 9 Jun 2021 10:49:37 -0700
Subject: [Buildroot] [PATCH 1/3] beaglev: update to new starfive linux
 and u-boot
In-Reply-To: <CAEUhbmXX-Qu-MHB_C3y=ECW4-uDqCS_KTbkS3kJzR3tcY3K1jw@mail.gmail.com>
References: <20210609063834.2193864-1-drew@beagleboard.org>
 <CAEUhbmXX-Qu-MHB_C3y=ECW4-uDqCS_KTbkS3kJzR3tcY3K1jw@mail.gmail.com>
Message-ID: <20210609174937.GB2234548@x1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 09, 2021 at 08:24:35PM +0800, Bin Meng wrote:
> On Wed, Jun 9, 2021 at 3:15 PM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > Update the commit id for u-boot to include fixes from the starfive-tech
> > u-boot repository:
> >
> > 494e5ef7b807 jh7100: Enable full 2M L2 cache
> > 4571f5a4e1e4 vic7100: enable cache ways (L2 cache)
> > abb06422a5cd Remove fdt_high and initrd_high for Starfive
> > 93099a61c7b0 starfive: beaglev: Disable SIFIVE_CLINT and enable RISCV_TIMER
> > bfb5abac3d1f Revert "riscv: Enable the SiFive CLINT block driver in S-Mode(VIC7100 ONLY)"
> > 7b70e1d44ba9 defconfig: enable cache_wayenable for better performance
> > 7c585978616b configs: earlycon=sbi is deprecated
> >
> > The commit abb06422a5cd ("Remove fdt_high and initrd_high for Starfive")
> > has removed the need for buildroot to patch the fdt_addr_r address.
> >
> > Update linux from commit in the old 5.10 branch that Fedora image was
> > using to head of esmil_starlight branch [1] which is currently based
> > on 5.13-rc5 and represents the best kernel for this board [2].
> >
> > In addition, the updated kernel now has jh7100-beaglev-starlight.dtb so
> > buildroot no longer needs to copy the dtb from u-boot.
> >
> > [1] https://github.com/starfive-tech/linux/tree/esmil_starlight
> > [2] https://github.com/starfive-tech/linux/issues/26
> >
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > ---
> >  board/beaglev/extlinux.conf                   |  2 +-
> >  ...s-starfive-vic7100-adjust-fdt_addr_r.patch | 39 -------------------
> >  board/beaglev/post-build.sh                   |  6 ---
> >  configs/beaglev_defconfig                     | 15 +++----
> >  4 files changed, 9 insertions(+), 53 deletions(-)
> >  delete mode 100644 board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
> >
> 
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> 
> No switch to upstream OpenSBI yet?

I attempted switching to upstream OpenSBI and generic platform but I
could not get it to boot.  I do want to further troubleshoot that with
you but, for now, I did not feel it is that important in the context of
buildroot.

The urgency for this patch is to get buildroot pointing to the 5.13
kernel as it has fixes for several problems in the older 5.10 kernel
that buildroot currently points to.  A buildroot user looking at
upstream right now would not know that we have moved on to 5.13.

Another practical issue is that upstream OpensBI generates a much bigger
fw_payload.bin.out. Commit 2524b0e [1] in starfive-tech/opensbi makes it
easier for people doing uboot development as the xmodem transfer of
fw_payload.bin.out is much faster.

thanks,
drew

[1] https://github.com/starfive-tech/opensbi/commit/2524b0ecd8684b42bc7a4c69794f40f11cbbe2a5

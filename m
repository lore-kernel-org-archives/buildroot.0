From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 2 Nov 2019 21:07:36 -0300
Subject: [Buildroot] [PATCH] package/dtc: do not install headers for the
 host version
In-Reply-To: <20191102180249.GC2710@scaer>
References: <20191102122947.8231-1-unixmania@gmail.com>
 <20191102180249.GC2710@scaer>
Message-ID: <CAJ4jsafCQ5APKP=khmRS15TyCjzPLHqJLs4Xs0wqCZRLfnw=5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 2, 2019 at 3:02 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Carlos, All,
>
> On 2019-11-02 09:29 -0300, unixmania at gmail.com spake thusly:
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > None of the packages that depend on host-dtc need the headers and they
>
> That's not the case with host-qemu, with system emulation enabled:
>
>     $ cat defconfig
>     BR2_arm=y
>     BR2_cortex_a7=y
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_INIT_NONE=y
>     BR2_SYSTEM_BIN_SH_NONE=y
>     # BR2_PACKAGE_BUSYBOX is not set
>     # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>     # BR2_TARGET_ROOTFS_TAR is not set
>     BR2_PACKAGE_HOST_QEMU=y
>     BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
>
>     $ make >build.log 2>&1
>
>     $ grep 'fdt support'
>
> With master:
>     fdt support       system
>
> With your patch:
>     fdt support       git
>
> So this patch means that host-qemu now uses its bundled copy rather than
> the one installed by host-dtc.
>
> Now, whether we prefer that to the current mess, let's see...

The bundled dtc code is not so old (v1.4.7) and is probably the one
with which qemu is tested so I don't think it wold be a real problem.

Titouan Christophe (in CC) was looking for an alternate approach,
disabling the compilation of the dtc shipped with the Kernel when
host-dtc is selected. Let's wait for the results.

-- 
Carlos Santos <unixmania@gmail.com>

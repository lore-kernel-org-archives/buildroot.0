From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 6 Sep 2020 19:39:58 +0200
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <CA+h8R2pjvm7Wr_hkS2wtqhzqESmgqTtxivkdTLdEr07ngJLTbQ@mail.gmail.com>
References: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
 <52-5f356200-5-2c492440@36238474>
 <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
 <CA+h8R2oi0GRLYdumQOYxwON=xd7p_8pn+WoknjRd5N24Vr_5KQ@mail.gmail.com>
 <20200816220620.65159d1d@windsurf.home>
 <CA+h8R2qO01wwrEJdTx2puEbDv6mv31YxyAjG5nCn6hosPAW_aQ@mail.gmail.com>
 <CA+h8R2pjvm7Wr_hkS2wtqhzqESmgqTtxivkdTLdEr07ngJLTbQ@mail.gmail.com>
Message-ID: <20200906193958.2b4199a4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian, *,

On Sat, 5 Sep 2020 19:33:23 -0700, Christian Stewart <christian@paral.in> wrote:

> Hi all,
>
> Finally got around to running this test.
>
> I previously tested an Odroid XU4 with GCC 10 and latest binutils, and
> it worked.
>
> Now with a test against GCC 9 on a Odroid HC2, it's not working (ssh
> exits immediately after successful auth).
>
> Testing against OpenSSH 8.3p1 now and figuring out exactly why this is
> happening, if it's the GCC version or what.

Tested on RPi3, the following defconfig works (buildroot-git-d1c3f077e24a41f004945f94aceb6f059c58e423,
linux-5.4.51):

BR2_arm=y
BR2_cortex_a53=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,1c64f4bc22811d2d371b271daa3fb27895a8abdd)/linux-1c64f4bc22811d2d371b271daa3fb27895a8abdd.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_OPENSSH=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y


And the following defconfig fails (linux-4.19.126):

BR2_arm=y
BR2_cortex_a53=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,676fd5a6f2a9b365da0e0371ef11acbb74cb69d5)/linux-676fd5a6f2a9b365da0e0371ef11acbb74cb69d5.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_OPENSSH=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y


The differences are:

-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y

and

-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,1c64f4bc22811d2d371b271daa3fb27895a8abdd)/linux-1c64f4bc22811d2d371b271daa3fb27895a8abdd.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,676fd5a6f2a9b365da0e0371ef11acbb74cb69d5)/linux-676fd5a6f2a9b365da0e0371ef11acbb74cb69d5.tar.gz"


The last lines of sshd failure strace are:

468   write(2, "Accepted none for root from 192."..., 59 <unfinished ...>
490   clock_gettime(CLOCK_BOOTTIME, {tv_sec=306, tv_nsec=379381706}) = 0
490   clock_nanosleep_time64(CLOCK_REALTIME, 0, {tv_sec=0, tv_nsec=24656548290918313},  <unfinished ...>) = ?
490   +++ killed by SIGSYS +++
468   <... write resumed>)              = 59
468   --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_KILLED, si_pid=490, si_uid=1000, si_status=SIGSYS, si_utime=7, si_stime=2} ---
468   write(2, "debug1: monitor_child_preauth: r"..., 82) = 82
468   read(5, "", 4)                    = 0
468   write(2, "debug1: do_cleanup\r\n", 20) = 20
468   write(2, "debug1: Killing privsep child 49"..., 35) = 35
468   kill(490, SIGKILL)                = 0
468   exit_group(255)                   = ?
468   +++ exited with 255 +++


In the failing case __NR_clock_nanosleep_time64 is not defined, so
SC_ALLOW(__NR_clock_nanosleep_time64) in openssh-8.3p1/sandbox-seccomp-filter.c
is not set...., but the strace output shows clock_nanosleep_time64() is called
(and aborted with SIGSYS)...

Regards,
Peter

>
> On Mon, Aug 17, 2020 at 2:36 PM Christian Stewart <christian@paral.in> wrote:
> > On Sun, Aug 16, 2020 at 1:06 PM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > > On Sun, 16 Aug 2020 12:59:02 -0700
> > > Christian Stewart <christian@paral.in> wrote:
> > >
> > > > FWIW I actually had the same, was trying to test an odroid XU4 and the
> > > > SSH server was immediately closing the connection. I double-checked
> > > > that openssh was at the latest version & I was on the latest buildroot
> > > > master as well, and assumed at the time it must have had something to
> > > > do with the kernel bump I was testing.
> > > >
> > > > Now I'm thinking maybe this was causing it. Will test again later today.
> > >
> > > Could you try applying:
> > >
> > >  https://github.com/openssh/openssh-portable/commit/beee0ef61866cb567b9abc23bd850f922e59e3f0
> > >  https://github.com/openssh/openssh-portable/commit/69298ebfc2c066acee5d187eac8ce9f38c796630
> > >
> > > and see if it helps ?
>
> Have not tried these yet but I think they are included in 8.3 anyway.
>
> > == Test 1: pi3 w/ gcc 10 glibc binutils 2.34
> >
> > PASS
>
> Strangely this one worked.
>
> Best regards,
> Christian
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

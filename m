From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Sun, 13 Sep 2020 13:30:51 +0200
Subject: [Buildroot] [PATCH 2/3] arch: new architecture IBM s390x
In-Reply-To: <20200912223100.GI10548@scaer>
References: <20200910174143.311039-1-egorenar@linux.ibm.com>
 <20200910174143.311039-3-egorenar@linux.ibm.com>
 <20200912223100.GI10548@scaer>
Message-ID: <87o8m97w2c.fsf@oc8242746057.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Aleksander, All,
>
> Thanks for this new architecture support!
>
> Would it be possible for you to pitch in a few word how IBM is using
> Buildroot with s390x?
>

Very good question. I'm, as Linux kernel developer, use it (now that it
works) everywhere for testing my custom Linux kernels & initramfs
during development :)
Here are a couple of use cases at my work:
- As build system in syzkaller setup (for kernel fuzzing)
- To test kdump/kexec kernels and in general for testing crash dumps
with kdump
- A lot of testing with QEMU + KVM on IBM/Z
- And in general for any kind of kernel testing with QEMU and real hardware

I think, many colleagues will follow my example after it is upstreamed.

>
> This patch does too many things; it should be split in more
> self-contained patches:
>
>  1. add the basic arch support:
>         DEVELOPERS                              |  3 +++
>         Makefile                                |  1 +
>         arch/Config.in                          | 13 +++++++++
>         arch/Config.in.s390x                    | 35 +++++++++++++++++++++++++
>     Note that BR2_s390x should probably select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
>     in this first patch, to only rely on an external toolchain as a
>     first step (makes a simpler, smaller patch, easier to review)
>
>  2. add support for the internal toolchain:
>         package/gcc/gcc.mk                      |  5 ++++
>         toolchain/toolchain-buildroot/Config.in |  6 ++---
>     and then BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT can now be dropped.
>
>  3. add bzImage support in Linux:
>         linux/Config.in                         |  2 +-
>
>  4. add the defconfig:
>         board/qemu/s390x/linux.config           | 35 +++++++++++++++++++++++++
>         board/qemu/s390x/post-build.sh          | 11 ++++++++
>         board/qemu/s390x/readme.txt             |  6 +++++
>         configs/qemu_s390x_defconfig            | 11 ++++++++
>
>  6. one patch for each of the packages that gains an s390x capability:
>         package/cmake/Config.in                 |  3 ++-
>         package/go/Config.in.host               |  2 +-
>         package/kexec/Config.in                 |  2 +-
>         package/liburcu/Config.in               |  2 +-
>         package/makedumpfile/Config.in          |  2 +-
>         package/systemd/Config.in               |  1 +
>
> See also below for more tidbits...
>

Done.

>
> Please also add board/qemu/s390x/ and configs/qemu_s390x_defconfig.
>

Done.

>
> The default of a choice is always the first item that is available, so
> no need to provide it in this case.
>

Done.

>
> Why can't you set Buildroot's option: BR2_TARGET_GENERIC_GETTY_PORT="tty1" ?
>

Hmm, i tried your suggestion, but i do not get a login prompt :(
I took this script from some other qemu board.


> Hint: if you end that line with a comment naming the defconfig, it will
> be automatically boot-tested in our weekly gitlab-ci pipelines.
>
> Romain ^^^^, can you xonfirm this is how tit works? And that multi-line
> are supported (IIRC, they should be)?
>

Done. I see now that other qemu boards use that.

>
> This will by default use the latest kernel version known by Buildroot,
> so when we update the kernel in Buildroot, this defconfig would use the
> newer version of the kernel.
>
> However, we prefer that defconfigs are known-tested to work, and thus
> that they use a pinned version of the kernel:
>
>     BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>     BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.7"
>

Done.


> Any reason we can't use a defconfig in the kerenl tree?
>

Done.

The version 2 of the series is following up.

Thanks you very much for your review and constructive criticism
Regards
Alexander Egorenkov

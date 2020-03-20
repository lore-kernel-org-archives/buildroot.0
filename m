From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Mar 2020 22:03:55 +0100
Subject: [Buildroot] configuration fragment file names
In-Reply-To: <CAFjuYxzo4me4Lhj=gKFNWF-F81DvqWqkn72WjVSA9pVxGOrhBw@mail.gmail.com>
References: <CAFjuYxzo4me4Lhj=gKFNWF-F81DvqWqkn72WjVSA9pVxGOrhBw@mail.gmail.com>
Message-ID: <20200320220355.108d93b4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Robert,

On Fri, 20 Mar 2020 16:24:52 +0000
Robert Hammond <rob.hammondit@gmail.com> wrote:

> Hi , I am trying to configure a Linux Kernel build using an NXP QorIQ arm64
> kernel branch.
> the configs in the kernel for this are arch/arm64/configs/defconfig
> and arch/arm64/configs/lsdk.config
> 
> ( a copy of the kernel source for this can be found here )
> https://source.codeaurora.org/external/qoriq/qoriq-components/linux
> 
> In the buildroot menu system I have selected to use the in-tree defconfig
> file which is does and picks up the arm64 default. If I don't specify the
> other fragment it builds
> 
> However, I'm not having much luck in pointing it towards the other config
> fragment.
> I've tried specifying the fragment file name on it's own and with the
> relative path from the linux top level directory i.e. both just lsdk.config
> and arch/arm64/configs/lsdk.config .

The fragment path is relative to the top-level Buildroot source
directory, not to the top-level Linux source directory.

Indeed, most of the time, the Linux kernel config fragments are not
part of the kernel tree, but rather stored outside.

You can however try to use $(LINUX_DIR)/arch/arm64/configs/lsdk.config
as the value for BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES, it might work
(but I haven't tested).

> In both cases the error :-
> 
> for f in ./arch/arm64/configs/defconfig ; do if [ ! -f "${f}" ]; then
> printf "Kconfig fragment '%s' for '%s' does not exist\n" "${f}" "linux";
> exit 1; fi; done
> Kconfig fragment './arch/arm64/configs/defconfig' for 'linux' does not exist

This error happens if you specify ./arch/arm64/configs/defconfig as
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE, which should also contain a path
relative to the Buildroot source tree.

If you want to use the architecture default defconfig, enable the
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG option instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

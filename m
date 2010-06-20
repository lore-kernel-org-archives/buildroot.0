From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jun 2010 15:37:16 +0200
Subject: [Buildroot] [pull request] Pull request for branch linux-cleanup
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20100620153716.63b1ff25@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Jun 2010 20:50:04 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Here is a set of 10 patches that completely rewrites the Linux kernel
> compilation process in Buildroot. It is supposed to be applied on top
> of the bootloaders-cleanup branch I've sent yesterday.
> 
> I've fairly drastically reduced the number of options to configure the
> kernel, and particulary removed the horrible mess of version
> selection. See the first commit in this branch for what remains in
> terms of configuration options for the kernel. As I've removed quite a
> few things, I'm interested to know how you're using Buildroot to build
> your kernel, and whether this proposal still matches your use cases.
> 
> Peter: for me, this patch set is ready for inclusion, unless there are
> comments, of course.

I've pushed a newer version, with the following changes since the
previous post :

 * Provide a "same as kernel headers" choice for the version selection

 * Use "depends on" instead of an "if...endif" block when a single
   option needs to be conditionnaly shown

 * Merge BR2_LINUX_KERNEL_PATCH and BR2_LINUX_KERNEL_PATCH_LOCATION
   into a single option. When the option value is empty, not patch is
   applied. When the option value is non empty, it is considered as a
   path or URL to a patch to be applied to the kernel.

 * Rename BR2_LINUX_KERNEL_USE_CUSTOM to
   BR2_LINUX_KERNEL_USE_CUSTOM_FILE.

 * Fix the default value for the kernel binary format: BR2_i386
   instead of BR2_386 and bzImage by default on BR2_x86_64.

 * Use BR2_KERNEL_MIRROR where appropriate

 * Use the $(shell...) construct instead of back-quotes

 * Use $(filter ...) instead of multiple $(findstring ...)

 * Fix escaping of linux-*.patch -> linux-\*.patch

 * Remove yes "" | make oldconfig constructs

 * Install the modules only if CONFIG_MODULES is enabled

 * Add newline at the end of linux.mk.

 * Add $(TARGET_MAKE_ENV) to $(MAKE) invocations so that a PATH
   containing $(HOST_DIR)/usr/bin is used when building the
   kernel. This is needed in order to allow the kernel to find mkimage
   and other host tools (module-init-tools). This fixes the problem
   reported by Ossy.

 * Rename option mentioning "stable" so as to not use the "stable"
   wording since it could be confusing for users.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

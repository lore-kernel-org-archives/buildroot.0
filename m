From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Feb 2014 17:08:22 +0100
Subject: [Buildroot] [PATCH] [RFC] BR2_KERNEL_HEADERS_TARGET: Add
 support for using target kernel for toolchain kernel headers.
In-Reply-To: <CAHCQUcAoruaNKt98BFU=fHpF2V6x4VbNg0J+kiuZ2n8zzKP9Hw@mail.gmail.com>
References: <CAHCQUcAoruaNKt98BFU=fHpF2V6x4VbNg0J+kiuZ2n8zzKP9Hw@mail.gmail.com>
Message-ID: <20140204170822.34f57774@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Magnus Edenhill,

On Wed, 17 Apr 2013 12:51:09 +0200, Magnus Edenhill wrote:

> This patch allows the toolchain to use the target kernel's headers instead
> of having to download an  additional linux tree just for the toolchain.
> 
> Tested with the internal toolchain.
> 
> Only problem observed is that the kernel-headers..../.unpacked target is
> recreated on sub-sequent 'make' invocations, which recreates uclibc. But
> someone with more make-wizardry may be able to solve that.
> 
> It also copies the linux source, which may not be strictly required, but it
> seemed to be the safest option for now.
> 
> ---
>  toolchain/kernel-headers/Config.in         |    8 ++++++++
>  toolchain/kernel-headers/kernel-headers.mk |    8 ++++++++
>  2 files changed, 16 insertions(+)

Thanks for this contribution, and sorry for the long delay. During the
current Buildroot meeting, we have looked at this patch, and came up
with some suggestions before it can be merged:

 1/ It should be rebased on top of the latest master, in which a number
    of changes have been made to the internal toolchain backend.

 2/ Instead of copying the Linux kernel sources from LINUX_DIR,
    LINUX_HEADERS_DIR should do its own download and extract of the
    kernel sources. So package/linux-headers/linux-headers.mk should
    look like:

ifeq ($(BR2_KERNEL_HEADERS_SAME_AS_KERNEL),y)
LINUX_HEADERS_VERSION = $(LINUX_VERSION)
LINUX_HEADERS_SOURCE = $(LINUX_SOURCE)
LINUX_HEADERS_SITE = $(LINUX_SITE)
LINUX_HEADERS_SITE_METHOD = $(LINUX_SITE_METHOD)
else
LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
else
LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
endif
LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
endif

The idea is that when we want to use the same kernel sources for the
kernel headers and the kernel itself, we define the version, source,
site and site method variables to be the same.

> 
> diff --git a/toolchain/kernel-headers/Config.in
> b/toolchain/kernel-headers/Config.in
> index 6155ef1..dc04fd2 100644
> --- a/toolchain/kernel-headers/Config.in
> +++ b/toolchain/kernel-headers/Config.in
> @@ -52,6 +52,13 @@ choice
> 
>   config BR2_KERNEL_HEADERS_SNAP
>   bool "Local Linux snapshot (linux-2.6.tar.bz2)"
> +
> + config BR2_KERNEL_HEADERS_TARGET
> + bool "Target Linux kernel"
> + depends on BR2_LINUX_KERNEL
> + help

Your patch was broken in terms of tabs. Can you make sure to use "git
send-email" instead, so that your patch doesn't get modified by your
e-mail client?

Would you mind working on this and submit an updated patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

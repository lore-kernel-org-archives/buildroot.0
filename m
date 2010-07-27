From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 13:42:09 +0200
Subject: [Buildroot] Evaluation of make variables
In-Reply-To: <1280226977.22687.37.camel@dubciaranr1.verifone.com>
References: <1280226977.22687.37.camel@dubciaranr1.verifone.com>
Message-ID: <20100727134209.5fddfa7b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Jul 2010 11:36:17 +0100
Quotient Remainder <quotientvremainder@gmail.com> wrote:

> An example, I was trying to convert U-Boot's makefile to genpackage.

While I'd like to see the bootloaders use an infrastructure, the
genpackage infrastructure is really designed for *packages* (with the
concept of staging and target installation, which are meaningless
concepts for bootloaders). I'm not sure just using the genpackage
infrastructure is OK. But I'm open to see the result of your work and
see how it looks.

> Here is an excerpt.
> ---
> define U_BOOT_POST_PATCH_HOOK_CUSTOM
> 	echo -e "\n\n\n\nU_BOOT_POST_PATCH_HOOK_CUSTOM.\n\n\n"
> ifneq ($(qstrip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
> 	toolchain/patch-kernel.sh $(@D) $(U_BOOT_CUSTOM_PATCH_DIR)
> u-boot-$(U_BOOT_VERSION)-\*.patch endif
> endef # U_BOOT_POST_PATCH_HOOK_CUSTOM.

You can't use make ifeq/ifneq tests inside define...endef blocks.
That's the major drawback of the package infrastructure. So you have do
something like:

define U_BOOT_POST_PATCH_HOOK_CUSTOM
	toolchain/patch-kernel.sh $(@D) $(U_BOOT_CUSTOM_PATCH_DIR) u-boot-$(U_BOOT_VERSION)-\*.patch
endef

ifneq ($(qstrip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
U_BOOT_POST_PATCH_HOOKS+=U_BOOT_POST_PATCH_HOOK_CUSTOM
endif

I.e, use no condition inside the hook implementation, and put the
condition at the hook registration site.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

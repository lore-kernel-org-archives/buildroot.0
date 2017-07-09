From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 15:48:53 +0200
Subject: [Buildroot] [PATCH v2 4/7] arch/xtensa: accept the overlay to
 be an URL
In-Reply-To: <1499602921-25097-5-git-send-email-jcmvbkbc@gmail.com>
References: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
 <1499602921-25097-5-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170709154853.68622a94@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Jul 2017 05:21:58 -0700, Max Filippov wrote:

> diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
> index ecb9c1086a70..ba3e3025b7d0 100644
> --- a/arch/arch.mk.xtensa
> +++ b/arch/arch.mk.xtensa
> @@ -9,7 +9,15 @@
>  #       tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(@D) --strip-components=1 gcc
>  #   endif
>  ################################################################################
> -ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
> +BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
> +ifneq ($(filter http://% https://% ftp://% scp://%,$(BR_ARCH_XTENSA_OVERLAY_FILE)),)
> +ARCH_XTENSA_OVERLAY_URL = $(BR_ARCH_XTENSA_OVERLAY_FILE)
> +ARCH_XTENSA_OVERLAY_FILE = $(BR2_DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))

We should be using $(DL_DIR) instead of $(BR2_DL_DIR). Also, an issue
here is that this will not work nicely with the per-package
sub-directory in DL_DIR that Maxime Hadjinlian is working on.

Indeed, we have a single download that is done by a lot of different
packages. Since the downloaded file is quite small, I would advocate
that we simply re-download it for each of gcc, binutils, linux, etc.

Another issue that I have is that we're not checking its hash, even if
the file used in the qemu xtensa defconfigs doesn't have any version
information in its name, making it quite likely that the contents of
the file will change without us knowing.

But indeed, I don't see how it can have a hash, since it's a custom
stuff.

In any case, I'd like to hear about a direction to solve the
per-package DL_DIR issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2014 18:53:38 +0100
Subject: [Buildroot] [PATCH v2 2/5] gnu-efi: new package
In-Reply-To: <1392766441-2160-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392766441-2160-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392766441-2160-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140219175338.GA3400@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-19 00:33 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
[--SNIP--]
> diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
> new file mode 100644
> index 0000000..28eb17e
> --- /dev/null
> +++ b/package/gnu-efi/gnu-efi.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# gnu-efi
> +#
> +################################################################################
> +
> +GNU_EFI_VERSION = 3.0u
> +GNU_EFI_SOURCE = gnu-efi_$(GNU_EFI_VERSION).orig.tar.gz
> +GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi/
> +GNU_EFI_INSTALL_STAGING = YES
> +GNU_EFI_LICENSE = GPLv2+ (gnuefi), BSD (efilib)
> +GNU_EFI_LICENSE_FILES = debian/copyright
> +
> +ifeq ($(BR2_i386),y)
> +GNU_EFI_PLATFORM=ia32
> +else ifeq ($(BR2_x86_64),y)
> +GNU_EFI_PLATFORM=x86_64
> +endif

Shouldn't we do like for grub: some EFI-BIOS on x86-64 machines might be
a 32-bit EFI-BIOS, in which case we'd want to build the 32-bit version
even if the target is 64-bit?

> +define GNU_EFI_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		ARCH=$(GNU_EFI_PLATFORM)
> +endef
> +
> +define GNU_EFI_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		INSTALLROOT=$(TARGET_DIR) \
> +		PREFIX=/usr ARCH=$(GNU_EFI_PLATFORM) install
> +endef
> +
> +define GNU_EFI_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		INSTALLROOT=$(STAGING_DIR) \
> +		PREFIX=/usr ARCH=$(GNU_EFI_PLATFORM) install
> +endef

Why install in target/ and staging/, and not in images/ ?

Also, this is used to build EFI applications, so I'd expect some host
tools to be built and isntalled, too. What am I missing?

(Hmm... Maybe I should look at the rest of the series...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

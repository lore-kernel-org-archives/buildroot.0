From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Feb 2021 14:26:50 +0100
Subject: [Buildroot] [PATCH-NEXT 4/4] linux: build after linux-firmware
 if enabled for early loading support
In-Reply-To: <87sg60cl73.fsf@dell.be.48ers.dk>
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-5-peter@korsgaard.com>
 <20210213101326.GR1679218@scaer> <87sg60cl73.fsf@dell.be.48ers.dk>
Message-ID: <20210213132650.GT1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-02-13 11:32 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > On 2021-02-12 19:40 +0100, Peter Korsgaard spake thusly:
>  >> To support building in (a subset of) the linux-firmware files into the
>  >> kernel using the CONFIG_EXTRA_FIRMWARE option, we need to ensure that the
>  >> firmware files are installed before the Linux kernel is built, similar to
>  >> how it is done for intel-microcode.
>  >> 
>  >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  >> ---
>  >> linux/linux.mk | 3 ++-
>  >> 1 file changed, 2 insertions(+), 1 deletion(-)
>  >> 
>  >> diff --git a/linux/linux.mk b/linux/linux.mk
>  >> index a212f42c28..5e4b319cf1 100644
>  >> --- a/linux/linux.mk
>  >> +++ b/linux/linux.mk
>  >> @@ -78,7 +78,8 @@ LINUX_MAKE_ENV = \
>  >> 
>  >> LINUX_INSTALL_IMAGES = YES
>  >> LINUX_DEPENDENCIES = host-kmod \
>  >> -	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode)
>  >> +	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
>  >> +	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware)
> 
>  > You also need to tell the kernel where to find those firmware files,
>  > with CONFIG_EXTRA_FIRMWARE_DIR, otherwise it will look in /lib/firmware.
> 
> Yes, but that you can take care of in linux config file/fragment. We
> already expose BR2_BINARIES_DIR in the environment for this, E.G. you
> can do:
> 
> CONFIG_EXTRA_FIRMWARE_DIR="${BR_BINARIES_DIR}"
> CONFIG_EXTRA_FIRMWARE="intel-ucode/06-5e-03 i915/kbl_dmc_ver1_04.bin"
> 
> (or whatever files you want to include).

But don't we want to make that seamless for the user? If they don't have
CONFIG_EXTRA_FIRMWARE=y, then setting CONFIG_EXTRA_FIRMWARE_DIR is a
no-op.

I think it is not obvious for a user to know that they can use
${BR_BINARIES_DIR} in their kernel defconfig/fragment: this is
documented nowhere. Also, with the BR_ (not BR2_) prefix, it is in
that namespace which we intedned to be reserved (but that we never
enforced) for internal, non-public variables...

>  > So we'd need something like:
>  >     $(if $(BR2_PACKAGE_LINUX_FIRMWARE),
>  >         $(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE_DIR,"$${BR_BINARIES_DIR}/linux-firmware"))
> 
> NIT: Only ${BR_BINARIES_DIR}, not a linux-firmware subdir, otherwise you
> cannot include both microcode and linux-firmware files.

Meh.. That's not nice, because then it means BINARIES_DIR is clutterred
by all those firmware files.

Also, intel-microcode is in a sub-directory, and will make it less easy
for users to find the file(s) they will actually have to flash on their
devices...

Can we move those so that we can use: CONFIG_EXTRA_FIRMWARE_DIR="$(BINARIES_DIR)/firmware/"
(for example)?

>  > (note the $$ escaping and the use of a shell-level variable, like is
>  > done for CONFIG_INITRAMFS_SOURCE).
> Given that the user already has to use a custom kernel config
> file/fragment to specify what files to include, I don't think it makes
> sense to override the CONFIG_EXTRA_FIRMWARE_DIR setting. We don't do it
> for intel-microcode either.

I think we should, too.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

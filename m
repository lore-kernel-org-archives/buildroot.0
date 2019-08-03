From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Aug 2019 00:27:23 +0200
Subject: [Buildroot] [PATCH v12 5/6] package/qemu: drop host kernel
 version check
In-Reply-To: <20190623212342.41809-6-aduskett@gmail.com>
References: <20190623212342.41809-1-aduskett@gmail.com>
 <20190623212342.41809-6-aduskett@gmail.com>
Message-ID: <cfd4e689-1642-3c9e-3677-e973db67c83e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/06/2019 23:23, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> There is no clean way to check if a program will actually run using host-qemu,
> making this check too restrictive.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

 Applied to master, thanks.

 I've also added a warning in the help text that things may go wrong in
unexpected ways, to have at least *something* for the user.

 The rest of the series of for tomorrow. Hopefully :-)

 Regards,
 Arnout

> ---
> Changes v11 - v12:
>   - Re-add this patch to the series as it was missing in V11.
> Changes v1 -> v10:
>   - Add this patch to the series.
> 
>  package/qemu/qemu.mk | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 73e0778d73..c57126b486 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -240,28 +240,6 @@ ifneq ($(HOST_QEMU_HOST_SYSTEM_TYPE),Linux)
>  $(error "qemu-user can only be used on Linux hosts")
>  endif
>  
> -# kernel version as major*256 + minor
> -HOST_QEMU_HOST_SYSTEM_VERSION = $(shell uname -r | awk -F. '{ print $$1 * 256 + $$2 }')
> -HOST_QEMU_TARGET_SYSTEM_VERSION = $(shell echo $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) | awk -F. '{ print $$1 * 256 + $$2 }')
> -HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(HOST_QEMU_TARGET_SYSTEM_VERSION) && echo OK)
> -
> -#
> -# The principle of qemu-user is that it emulates the instructions of
> -# the target architecture when running the binary, and then when this
> -# binary does a system call, it converts this system call into a
> -# system call on the host machine. This mechanism makes an assumption:
> -# that the target binary will not do system calls that do not exist on
> -# the host. This basically requires that the target binary should be
> -# built with kernel headers that are older or the same as the kernel
> -# version running on the host machine.
> -#
> -
> -ifeq ($(BR_BUILDING),y)
> -ifneq ($(HOST_QEMU_COMPARE_VERSION),OK)
> -$(error "Refusing to build qemu-user: target Linux version newer than host's.")
> -endif
> -endif # BR_BUILDING
> -
>  else # BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
>  HOST_QEMU_OPTS += --disable-linux-user
>  endif # BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
> 

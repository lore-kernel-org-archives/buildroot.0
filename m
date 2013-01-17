From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 17 Jan 2013 12:02:52 -0800
Subject: [Buildroot] [PATCH] dockstar bsp
In-Reply-To: <20130117172427.190cdb5b@skate>
References: <1356821139-9103-1-git-send-email-stevecalfee@gmail.com>
 <20130117172427.190cdb5b@skate>
Message-ID: <CAJJ6jxu20X877BvUdU7OH1Lm63RQ=6-zT70_Dew2vAX+6s5upw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 17, 2013 at 8:24 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Steve Calfee,
>
> On Sat, 29 Dec 2012 14:45:39 -0800, Steve Calfee wrote:
>> Simple bsp for the Seagate Dockstar.
>>
>> Builds and runs using buildroot 2012.11
>>
>> Signed-off-by: Steve Calfee <stevecalfee@gmail.com>
>> ---
>>  board/sheevaplug/Config.in                         |   13 +
>>  board/sheevaplug/Makefile.in                       |    4 +
>>  board/sheevaplug/seagatedockstar/Makefile.in       |    5 +
>
> No, we really don't want per-board configuration options or Makefiles.
> A board is just a particular configuration of Buildroot.
>
> Moreover your Makefile.in files still reference some old files in
> target/device/ that no longer exist.
>
>>  board/sheevaplug/seagatedockstar/README            |   62 +++++
>
> The README file should not be a story of how the thing was written, but
> simply how to use this configuration on this particular hardware (how
> to flash the images, etc.).
>
>>  .../dockstar_dev_external_toolchain_defconfig      |   24 ++
>>  .../dockstar_internal_toolchain_defconfig          |   21 ++
>>  .../dockstar_toolchain_only_defconfig              |   16 ++
>
> Those configurations are useless as they are not visible through "make
> help" or "make <foobar>_defconfig". And anyway, we only want one
> configuration per board.
>
>>  .../seagatedockstar/linux-3.2plus.config           |  294 ++++++++++++++++++++
>>  board/sheevaplug/seagatedockstar/patchrootfs.sh    |   14 +
>>  .../seagatedockstar/skeleton/etc/inittab           |   46 +++
>>  .../sheevaplug/seagatedockstar/skeleton/etc/shadow |   12 +
>
> Why is it needed to override the default inittab and shadow?
>
>>  configs/dockstart_defconfig                        |   21 ++
>
>> --- /dev/null
>> +++ b/configs/dockstart_defconfig
>> @@ -0,0 +1,21 @@
>> +BR2_arm=y
>> +BR2_arm926t=y
>
> Ok for those two ones.
>
>> +BR2_JLEVEL=4
>> +BR2_PACKAGE_GDB=y
>> +BR2_ENABLE_LOCALE_PURGE=y
>> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
>> +BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
>> +BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
>> +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
>> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
>> +BR2_TARGET_GENERIC_HOSTNAME="dockstar"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Dockstar and Buildroot"
>> +BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/board/sheevaplug/seagatedockstar/patchrootfs.sh"
>
> I don't think any of these is needed.
>
>> +BR2_TARGET_ROOTFS_UBIFS=y
>> +BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB=y
>> +BR2_TARGET_ROOTFS_UBI=y
>> +BR2_TARGET_ROOTFS_TAR_GZIP=y
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(topdir)board/sheevaplug/seagatedockstar/linux-3.2plus.config"
>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>
> Ok. Is installation of the kernel image inside the target filesystem
> really needed? How does this board boots?
>
> To summarize, a board configuration in Buildroot is just:
>
>  * A minimal defconfig in configs/<blabla>_defconfig, that selects the
>    proper architecture, proper bootloader, filesystem image format and
>    kernel version/configuration. No toolchain options, no packages, etc.
>
>  * Possibly in board/<manufacturer>/<boardname>/, a kernel
>    configuration file, a README file, and other files that have to be
>    added in the root filesystem to make the board work.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Hi Thomas,

Thank you for your review. I will simplify and try again.

Regards, Steve

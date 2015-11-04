From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 4 Nov 2015 08:58:16 -0800
Subject: [Buildroot] [PATCH] protobuf: bump to 2.6.1
In-Reply-To: <CAKbGBLhqvqwODLAj0zOxYk2Y9-NoBi_uHbS-4rHgp5TcEAV07Q@mail.gmail.com>
References: <1446626241-25745-1-git-send-email-steven@uplinklabs.net>
 <20151104120319.30a10287@free-electrons.com>
 <CAKbGBLhqvqwODLAj0zOxYk2Y9-NoBi_uHbS-4rHgp5TcEAV07Q@mail.gmail.com>
Message-ID: <CAKbGBLi5tuV+opoR120-1vxZNnYH2sCQP4tYi-jE-vMoa6z51w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 4, 2015 at 7:28 AM, Steven Noonan <steven@uplinklabs.net> wrote:
> On Wed, Nov 4, 2015 at 3:03 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Steven Noonan,
>>
>> On Wed,  4 Nov 2015 00:37:21 -0800, Steven Noonan wrote:
>>> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
>>> ---
>>>  package/protobuf/protobuf.hash | 2 ++
>>>  package/protobuf/protobuf.mk   | 2 +-
>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>  create mode 100644 package/protobuf/protobuf.hash
>>
>> There have already been several attempts at bumping protobuf to 2.6.x,
>> but each time there were some issues.
>>
>> Search for:
>>
>> Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.1
>> Date: Mon, 22 Jun 2015 14:58:59 -0300
>>
>> Subject: [Buildroot] [PATCH 1/1] protobuf/protobuf-c: bump versions
>> Date: Thu, 13 Aug 2015 21:41:21 -0400
>>
>> Can you look into these threads and check that your bump takes into
>> account those problems ?
>
> Thanks for pointing those out. I'll take a look.

One of the threads I found is confusing. It bumped protobuf to 2.6.1
but also enabled building for PowerPC. But I see no indication in the
protobuf 2.6.1 sources that PowerPC is a supported architecture, so I
wouldn't have expected it to work -- and the patch was presumably not
applied for that reason. This issue should not affect my patch, as I
didn't touch the architecture requirements in
package/protobuf/Config.in (or in anything depending on protobuf).

I also saw threads talking about compile problems on pre-GCC 4.7
toolchains, but I successfully built on x86_64 with as old as GCC 4.4
(but didn't try older than that).

>> Most notably, make sure that protobuf-c builds fine, and
>> python-protobuf builds fine. But look at the threads for other
>> potential issues.

I'll submit a separate patch upgrading protobuf-c to v1.1.1.

With the protobuf 2.6.1 patch and my [unsubmitted] protobuf-c v1.1.1
patch, I successfully built with this defconfig (basically
qemu_x86_64_defconfig + protobuf and any packages using it):

BR2_x86_64=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="4.2"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.2.config"
BR2_PACKAGE_OLA=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PROTOBUF=y
BR2_PACKAGE_PROTOBUF_C=y
BR2_PACKAGE_COLLECTD=y
BR2_PACKAGE_MOSH=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set


And to cover all my bases I also tried the same with a similarly
modified qemu_mipsel_malta_defconfig:

BR2_mipsel=y
BR2_mips_32r2=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="4.2"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.2.config"
BR2_LINUX_KERNEL_VMLINUX=y
BR2_PACKAGE_OLA=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PROTOBUF=y
BR2_PACKAGE_PROTOBUF_C=y
BR2_PACKAGE_COLLECTD=y
BR2_PACKAGE_MOSH=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set


Didn't run into any build problems with either one.

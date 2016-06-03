From: Jeroen Roovers <jer@airfi.aero>
Date: Fri, 3 Jun 2016 16:00:42 +0200
Subject: [Buildroot] Fwd: [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
In-Reply-To: <20160603151804.41a9baa7@free-electrons.com>
References: <1455102927-28502-1-git-send-email-jer@airfi.aero>
 <CANCHnQppW3mmP=6WGBChD06+7ns0u1D5R6MQb=pxCmV6nQ7=Mw@mail.gmail.com>
 <20160603151804.41a9baa7@free-electrons.com>
Message-ID: <CANCHnQqhQjhG6EBapYvSODPCXjMFpLZx2AAB4bnUWuJuy4kcKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch *doesn't* pass LDFLAGS down; GNU make simply picks up the
exported LDFLAGS from buildroot and integrates it with its own flags.
I only found out because when I set BR2_TARGET_LDFLAGS using the usual
GCC flags and did a complete rebuild, I found that only uboot failed
to build.

I'll resend the patch when I find the time.

On 3 June 2016 at 15:18, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 10 Feb 2016 16:03:23 +0100, Jeroen Roovers wrote:
>> ---------- Forwarded message ----------
>> From: Jeroen Roovers <jer@airfi.aero>
>> Date: 10 February 2016 at 12:15
>> Subject: [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
>> To: buildroot at buildroot.org
>> Cc: Jeroen Roovers <jer@airfi.aero>
>>
>>
>>     If we want to set proper LDFLAGS, then we need to mangle that in the
>>     uboot build system as it calls ld(1) (in fact ld.bfd) directly,
>>     where the "-Wl," prefix should only be used when the linker is
>>     called indirectly through gcc(1).
>>
>> Signed-off-by: Jeroen Roovers <jer@airfi.aero>
>
> I have not been able to reproduce a build problem, since TARGET_LDFLAGS
> are currently not passed to U-Boot. So the following defconfig builds
> fine:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.05-rc2-3-g011d4e2.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_TARGET_LDFLAGS="-Wl,--as-needed"
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
>
> So maybe your patch is also about *passing* LDFLAGS down to U-Boot ?
>
> In any case, your commit log had some "mail forwarding" related
> contents. Could you resend an updated version, which explains a bit
> better that the patch also *passes* LDFLAGS down to U-Boot, and with
> fixed up commit log?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

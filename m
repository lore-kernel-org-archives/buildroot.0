From: Tom <fivemiletom@gmail.com>
Date: Fri, 17 Aug 2007 10:55:02 -0700
Subject: [Buildroot] unable to fix Arm EABI in UClibc Menuconfig
In-Reply-To: <12198764.post@talk.nabble.com>
References: <12198764.post@talk.nabble.com>
Message-ID: <46C5E0F6.7050906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hebbar wrote:
> Hi All,
>  
>  With new buildroot snapshot, whatever i do to set ARM Target as EABI - it
> reverts back to OABI because of which i am getting below mentioned error. I
> set it to ARM EABI "Make menuconfig & make uclibc-menuconfig". i tried
> setting manually in uclibc-9.29.0.config & uclibc-9.29.0-wchar.config. If i
> set it manually in buildroot/toolchain_build_arm/uClibc-0.9.29 & then go to
> "make uclibc-menuconfig" still it reverts back to ARM OABI. 
> 
> Kindly help me to solve this. I didnt face this in last weeks Snapshot(of
> around last wek thursday). but from oday its happening. 

When I used buildroot (Jun 2007) and pre-prepared files (.config with 
BR2_ARM_EABI=y and uClibc-0.9.29.config with CONFIG_ARM_EABI=y), I ran 
into similar behavior:
After unzipping buildroot and then copying the files to the appropriate 
locations, starting a build / doing menuconfig would, at some point, 
always change uClibc config back to OABI, causing this error you describe.
However, when just manually changing it back to EABI then and restarting 
the build, eventually it would build fully. As the buildroot 
documentation talked about getting the full build only in several config 
/ build steps, I did not pursue this any further.

> 
> This is my buildroot .config
> 
> BR2_arm=y
> BR2_arm926t=y
> BR2_ARM_TYPE="ARM926T"
> # BR2_ARM_OABI is not set
> BR2_ARM_EABI=y
> BR2_ARCH="arm"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_TUNE="arm9tdmi"
> 
> Error ---------->
> 
> make[4]: `conf' is up to date.
>   CC extra/locale/locale_data.os
>   CC libc/sysdeps/linux/arm/brk.os
>   CC libc/sysdeps/linux/arm/ioperm.os
>   CC libc/sysdeps/linux/arm/iopl.os
>   CC libc/sysdeps/linux/arm/mmap.os
>   CC libc/sysdeps/linux/arm/posix_fadvise.os
> libc/sysdeps/linux/arm/posix_fadvise.c: In function '__libc_posix_fadvise':
> libc/sysdeps/linux/arm/posix_fadvise.c:20: warning: right shift count >=
> width of type
> libc/sysdeps/linux/arm/posix_fadvise.c:20: warning: right shift count >=
> width of type
>   CC libc/sysdeps/linux/arm/posix_fadvise64.os
>   CC libc/sysdeps/linux/arm/sigaction.os
>   CC libc/sysdeps/linux/arm/__syscall_error.os
>   CC libc/sysdeps/linux/arm/syscall.os
> libc/sysdeps/linux/arm/syscall.c: In function 'syscall':
> libc/sysdeps/linux/arm/syscall.c:28: error: '__NR_syscall' undeclared (first
> use in this function)
> libc/sysdeps/linux/arm/syscall.c:28: error: (Each undeclared identifier is
> reported only once
> libc/sysdeps/linux/arm/syscall.c:28: error: for each function it appears
> in.)
> make[2]: *** [libc/sysdeps/linux/arm/syscall.os] Error 1
> make[1]: *** [lib/libc.so.0] Error 2
> make[1]: Leaving directory
> `/home/guru/project/original/bldrt/buildroot/toolchain_build_arm/uClibc-0.9.29'
> make: ***
> [/home/guru/project/original/bldrt/buildroot/toolchain_build_arm/uClibc-0.9.29/lib/libc.a]
> Error 2
> 
> 
> Regards
> Gururaja

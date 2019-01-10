From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jan 2019 20:59:37 +0100
Subject: [Buildroot] [PATCH 2/3] gnuchess: disable -O2 and -O3 for ARM
 cortex-M cpus
In-Reply-To: <20190110175955.31565-2-fontaine.fabrice@gmail.com>
References: <20190110175955.31565-1-fontaine.fabrice@gmail.com>
 <20190110175955.31565-2-fontaine.fabrice@gmail.com>
Message-ID: <20190110205937.291e10d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Jan 2019 18:59:54 +0100, Fabrice Fontaine wrote:
> When building with -O2 (or -O3), link fails on:
> 
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/arm-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -Wl,-elf2flt -static  -Wl,-elf2flt -static   -Wl,-elf2flt -static -o gnuchess main.o components.o  frontend/libfrontend.a adapter/libadapter.a engine/libengine.a -lreadline -lncurses
> ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
> ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
> ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
> ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
> ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
> ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
> ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context

Interesting. In commit
https://git.buildroot.net/buildroot/commit/?id=49f574237983ae2e69e4a4c43df7be98902a63be,
we are doing exactly the opposite: when -Os is used, we pass -O2.

Romain reported the issue at
https://sourceware.org/bugzilla/show_bug.cgi?id=20552, and as you can
see, we got a tremendous amount of feedback from the binutils
developers :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

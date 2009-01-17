From: Daniel Mack <daniel@caiaq.de>
Date: Sat, 17 Jan 2009 21:27:03 +0100
Subject: [Buildroot] Trouble with buildroot for ARM EABI
In-Reply-To: <034D9638-D4E9-4DED-98B3-005DEBB99B00@caiaq.de>
References: <034D9638-D4E9-4DED-98B3-005DEBB99B00@caiaq.de>
Message-ID: <20090117202703.GA24265@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Jan 17, 2009 at 01:26:42AM +0100, Daniel Mack wrote:
> we've been hunting down weird effects regarding a build for ARM EABI  
> with the 20090113 br2 snapshot.
> 
> As far as we tracked things down, at least one of the culprits is the  
> uClibc package which does not generate bits/sysnum.h correctly. The  
> file include/unistd.h that ships with the kernel defines the syscall  
> numbers depending on __ARM_EABI__, which is not set correctly by  
> uclibc when it is included to generate sysnum.h. Hence, the generated  
> file (eventually in build_arm/staging_dir/usr/include/bits/sysnum.h)  
> contains false assumptions about the offset of syscalls as it sets it  
> to 0x900000 which is only valid for OABI. The effect of this  
> misbehaviour are instantly crashing target binaries, at least when  
> OABI compat support is switched off in the kernel config.

Here is a patch that corrects this behaviour (sent as patch creating a
patch, so I can inline it here). I'll also send this upstream to uclibc
as soon as the bugtracker server is back from his weekend break.

But anyway, there needs to be a fix for buildroot as well, as I'd say
uclibc-0.9.30 ships in a broken state.

Comments on this?

Best regards,
Daniel


--- /dev/null	2009-01-13 12:00:33.996423014 +0100
+++ toolchain/uClibc/uClibc-0.9.30-gen-bits-syscall-eabi.patch	2009-01-17 20:51:35.000000000 +0100
@@ -0,0 +1,12 @@
+--- ./extra/scripts/gen_bits_syscall_h.sh.orig	2009-01-17 20:42:02.000000000 +0100
++++ ./extra/scripts/gen_bits_syscall_h.sh	2009-01-17 20:48:27.000000000 +0100
+@@ -22,6 +22,9 @@
+ *)     CC_SYSNUM_ARGS="-dN" ;;
+ esac
+ 
++grep -q "^CONFIG_ARM_EABI=y" .config && \
++	INCLUDE_OPTS="${INCLUDE_OPTS} -D__ARM_EABI__"
++
+ ( echo "#include <asm/unistd.h>";
+   echo "#include <asm/unistd.h>" |
+   $CC -E $CC_SYSNUM_ARGS $INCLUDE_OPTS - |

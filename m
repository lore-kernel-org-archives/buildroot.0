From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Thu, 30 Aug 2007 08:42:33 +0200
Subject: [Buildroot] AVR32 defconfig
In-Reply-To: <00ca01c7ea3f$e32af130$6e00a8c0@JONATHAN>
References: <00ca01c7ea3f$e32af130$6e00a8c0@JONATHAN>
Message-ID: <1188456153.30555.4.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2007-08-29 at 09:24 -0400, Jonathan Dumaresq wrote:

<cut Atmel snapshot of Buildroot>
 
> When i do the same thing with the latest buildroot, I have to manualy
> choose option. Since i'm not an expert, i choose usualy the default to
> start. But this time, i get an error at compile time. 
>  
> so to resume, i do this.
>  
> make atngw100_defconfig
> make
> only push the return when question asked. 

If you are asked about a FPU in uClibc, you must answer no. AVR32
devices does not have a FPU.

> here the error that i have.
>  
> make[2]: Entering directory
> `/home/dumarjo/buildroot/toolchain_build_avr32/uClibc-0.9.28.3-avr32-2.0/libc/sysdeps/linux/i386'ln -fs ../libc/sysdeps/linux/i386/fpu_control.h ../../../../include/

ring-ring

For some reason uClibc is configured for i386, and that is why some
assembler instructions fail later in your compilation.

> make[2]: Leaving directory
> `/home/dumarjo/buildroot/toolchain_build_avr32/uClibc-0.9.28.3-avr32-2.0/libc/sysdeps/linux/i386'
> /usr/bin/make -j1 -C  ldso
> make[2]: Entering directory
> `/home/dumarjo/buildroot/toolchain_build_avr32/uClibc-0.9.28.3-avr32-2.0/ldso'
> /usr/bin/make -j1 -C ldso
> make[3]: Entering directory
> `/home/dumarjo/buildroot/toolchain_build_avr32/uClibc-0.9.28.3-avr32-2.0/ldso/ldso'
> /home/dumarjo/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-stack-protector -falign-jumps=0 -falign-loops=0 -Os -funit-at-a-time -DUCLIBC_LDSO=\"ld-uClibc.so.0\" -fPIC -DUCLIBC_RUNTIME_PREFIX=\"/\" -fno-builtin -nostdinc -D_LIBC -DLDSO_ELFINTERP=\"i386/elfinterp.c\" -I../../ldso/ldso/i386 -I../../ldso/include -I../../ldso/ldso -I../../include -D_GNU_SOURCE -isystem /home/dumarjo/buildroot/build_avr32/staging_dir/bin/../lib/gcc/avr32-linux-uclibc/4.1.2/include  -c i386/resolve.S -o i386/resolve.o
> i386/resolve.S: Assembler messages:
> i386/resolve.S:30: Error: unrecognized instruction `pusha'
> i386/resolve.S:31: Error: unrecognized instruction `lea 0x20(%esp),%
> eax'
> i386/resolve.S:32: Error: unrecognized instruction `pushl 4(%eax)'
> i386/resolve.S:33: Error: unrecognized instruction `pushl (%eax)'
> i386/resolve.S:38: Error: unrecognized instruction `popl %ebx'
> i386/resolve.S:39: Error: unrecognized instruction `addl
> $_GLOBAL_OFFSET_TABLE_+[.-.L24],%ebx'
> i386/resolve.S:40: Error: unrecognized instruction `movl
> _dl_linux_resolver at GOT(%ebx),%ebx'
> i386/resolve.S:41: Error: bad expression
> i386/resolve.S:45: Error: unrecognized instruction `movl %eax,0x28(%
> esp)'
> i386/resolve.S:47: Error: unrecognized instruction `addl $0x8,%esp'
> i386/resolve.S:48: Error: unrecognized instruction `popa'
> i386/resolve.S:49: Error: invalid return value `$4'
> make[3]: *** [i386/resolve.o] Error 1
> make[3]: Leaving directory
> `/home/dumarjo/buildroot/toolchain_build_avr32/uClibc-0.9.28.3-avr32-2.0/ldso/ldso'
> make[2]: *** [ldso] Error 2
> make[2]: Leaving directory
> `/home/dumarjo/buildroot/toolchain_build_avr32/uClibc-0.9.28.3-avr32-2.0/ldso'
> make[1]: *** [_dir_ldso] Error 2
> make[1]: Leaving directory
> `/home/dumarjo/buildroot/toolchain_build_avr32/uClibc-0.9.28.3-avr32-2.0'
> make: ***
> [/home/dumarjo/buildroot/toolchain_build_avr32/uClibc-0.9.28.3-avr32-2.0/lib/libc.a] Error 2
> debian:/home/dumarjo/buildroot#
>  
> i probably have setting in the config file that is not correct.

Check what architecture is chosen in uClibc configuration:
cd toolchain_build_avr32/uClibc-0.9.28.3
make menuconfig

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer

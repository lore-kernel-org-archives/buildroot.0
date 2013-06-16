From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jun 2013 18:03:00 +0200
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <kphffs$v5g$1@ger.gmane.org>
References: <kphffs$v5g$1@ger.gmane.org>
Message-ID: <20130616180300.68ba98a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Nielsen,

On Sat, 15 Jun 2013 20:26:09 +1000, Adam Nielsen wrote:

> I'm trying to compile a toolchain with elf2flt enabled, but I'm having 
> problems getting binutils to compile.
> 
> Normally the parameter "-W,-elf2flt" is passed to GCC to tell it to pass 

Should be -Wl,-elf2flt, but you got it correct in the log below, so I
guess this one was just a typo.

> "-elf2flt" to the linker.  elf2flt then picks this up and does what it needs 
> to, courtesy of a wrapper script around "ld".  I have set this parameter in 
> TARGET_CFLAGS in one of the buildroot makefiles.
> 
> However when I am compiling binutils, it seems that elf2flt has not been 
> installed yet, so it is not recognising the -elf2flt option, and gives me this 
> error:
> 
> arm-buildroot-linux-uclibcgnueabi-gcc -o conftest -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -Wl,-elf2flt 
> -DBR_BINFMT_FLAT   --static -Wl,-rpath -Wl,/foo conftest.c  >&5
> arm-buildroot-linux-uclibcgnueabi/bin/ld: warning: cannot find entry symbol 
> lf2flt; defaulting to 00000000000080c0
> 
> I think binutils needs to use elf2flt, otherwise any binaries it produces will 
> not be in BFLT format, so I am guessing I need to tell buildroot to compile 
> elf2flt before binutils.  Does this sound correct?  Is it even possible to 
> compile something like that before binutils?  Or do I have to somehow avoid 
> passing the -elf2flt parameter to binutils?  How might one achieve this?

Are we talking about the cross binutils (i.e the one that runs on your
development PC and generates code for your target platform), or the
target binutils (i.e the one that runs on your target platform and
generates code for your target platform) ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

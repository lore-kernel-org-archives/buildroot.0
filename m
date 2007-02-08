From: Steve Rodgers <hwstar@rodgers.sdcoxmail.com>
Date: Thu, 8 Feb 2007 15:59:40 -0800
Subject: [Buildroot] Buildroot: Problem locating crt1.o on target system
	[more info]
In-Reply-To: <200702081138.38218.hwstar@rodgers.sdcoxmail.com>
References: <200702081138.38218.hwstar@rodgers.sdcoxmail.com>
Message-ID: <200702081559.40799.hwstar@rodgers.sdcoxmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I discovered that if I move crt1.o, crti.o and crtn.o to my build directory on 
the target system where the C source lives, the test.c file compiles 
correctly. 

Looking at the gcc-v output, gcc is expecting these files to be in the build 
directory, not in /usr/lib! 

What changes would be required to gcc- gcc-uclibc-3.x.mk to resolve this so 
that /usr/lib/crtX.0 files can be brought in from /usr/lib?


Here's the output of gcc -v test.c:

GNU assembler version 2.16.1 (i586-linux-uclibc) using BFD version 2.16.1
 /usr/libexec/gcc/i586-linux-uclibc/3.4.2/collect2 --eh-frame-hdr -m elf_i386 
-dynamic-linker /lib/ld-uClibc.so.0 crt1.o 
crti.o /usr/lib/gcc/i586-linux-uclibc/3.4.2/crtbegin.o 
-L/usr/lib/gcc/i586-linux-uclibc/3.4.2 
-L/usr/lib/gcc/i586-linux-uclibc/3.4.2 /tmp/ccAcPbA4.o -lgcc --as-needed 
-lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s 
--no-as-needed /usr/lib/gcc/i586-linux-uclibc/3.4.2/crtend.o crtn.o
/usr/bin/ld: crt1.o: No such file: No such file or directory
collect2: ld returned 1 exit status


Steve.



On Thursday 08 February 2007 11:38, Steve Rodgers wrote:
> I've been using buildroot for quite some time and recently decided to
> upgrade it as some of the packages in the older version I'm using are no
> longer available for download.
>
> I've run into a problem using the C compiler and linker on the target
> system. I can't compile a simple "hello world" program written in C on the
> target system.
>
> The compiler/linker complains it can't find crt1.o, even though it is
> located in /user/lib. The exact error message is:
>
> ?/usr/bin/ld: crt1.o: No such file: No such file or directory
>
> I configured buildroot for gcc 3.4.2 and binutils 2.16. I selected the the
> 2.4.31 kernel headers.
>
> The system in question ?was built using the 2/6/07 snapshot tarball of
> buildroot.
>
> The config file for buildroot is attached.
>
> Is there some configuration option I missed?
>
> TIA Steve.

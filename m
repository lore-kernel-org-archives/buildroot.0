From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Nov 2010 20:25:37 +0100
Subject: [Buildroot] running tools on build host?
In-Reply-To: <201011071149.48457.oao@oao.no>
References: <201011071149.48457.oao@oao.no>
Message-ID: <20101116202537.37f4ab2f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Nov 2010 11:49:47 +0100
Odd Arild Olsen <oao@oao.no> wrote:

> I have built the gcc/uclibc toolchain and got the files installed in a 
> /usr/local directory. 
> 
> I develop for an embedded i386 machine and need uClibc for that.
> 
> I also wish to execute the compiled programs on the build machine during 
> development. But I have not found any combination of options and environment 
> variables that let me run the program with dynamic linking. The linker always 
> goes to the /lib directory and gets confused by libc6 stuff.   
> 
> I can compile and run a statically linked program
> 
> And I can compile the program and then copy the executable to the root image, 
> chroot and run it
> 
> Are there any way I can set this up so I can run my programs on the build host 
> without copying the toolchain librariess to /lib

This is a bit clunky, but you could try something like :

 gcc -o foobar foobar.c \
	-Wl,--dynamic-linker=/path/to/your/lib/ld-uClibc.so \
	-Wl,-rpath=/path/to/your/lib \
	-Wl,-rpath=/path/to/your/usr/lib

I haven't tried, so I don't know if it really works, but it probably
should. Running your programs inside a chroot is definitely a better
solution.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

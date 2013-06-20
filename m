From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 15:52:36 +0200
Subject: [Buildroot] Bizarre behavior of armeb toolchain
In-Reply-To: <20130620154130.1606594d@skate>
References: <20130620154130.1606594d@skate>
Message-ID: <20130620155236.45eda7ac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 20 Jun 2013 15:41:30 +0200, Thomas Petazzoni wrote:

>  (*) On ARMv7 however, the code is different whether -mbig-endian is
>  passed or not, even though an "armeb-linux" compiler is supposed to
>  generate big endian code by default. When no flags is passed, both the
>  data *and* code are big-endian (so it's BE32 like on ARMv5), but
>  passing -mbig-endian makes the thing behave properly (code is
>  little-endian, data is big-endian).

Interestingly, this problem is visible when you run gcc with the -v
option, and look at the options passed to collect2.

when no options are passed to gcc (and it generates incorrect BE32
code), the options passed to collect2 are:

/home/test/outputs/armv7be/host/usr/libexec/gcc/armeb-buildroot-linux-uclibcgnueabi/4.7.3/collect2
	--sysroot=/home/test/outputs/armv7be/host/usr/armeb-buildroot-linux-uclibcgnueabi/sysroot
	--eh-frame-hdr
	-dynamic-linker /lib/ld-uClibc.so.0
	-X -m armelfb_linux_eabi -o toto
	[...]
	/tmp/ccJDVjCg.o

When -mbig-endian is passed to gcc, gcc then passes the following
options to collect2:

/home/test/outputs/armv7be/host/usr/libexec/gcc/armeb-buildroot-linux-uclibcgnueabi/4.7.3/collect2
	--sysroot=/home/test/outputs/armv7be/host/usr/armeb-buildroot-linux-uclibcgnueabi/sysroot
	--eh-frame-hdr
	--be8
	-dynamic-linker /lib/ld-uClibc.so.0
	-X -EB -m armelfb_linux_eabi -o toto
	[...]
	/tmp/ccnje5oi.o

Notice how it passes -EB and more importantly --be8, which indicates to
ld that it should swap code to make it little endian again (after it
has been generated big endian by as).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

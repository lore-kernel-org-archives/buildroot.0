From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jul 2014 08:46:43 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-07-29
In-Reply-To: <20140730105634.1e250e42@free-electrons.com>
References: <20140730063011.69EB41014F6@stock.ovh.net>
 <20140730105634.1e250e42@free-electrons.com>
Message-ID: <53D8DB23.5040206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/30/2014 05:56 AM, Thomas Petazzoni wrote:

>>        arc |                  openssh-6.6p1 | NOK | http://autobuild.buildroot.net/results/26218e028f3d2c77c5192b45154627f08384b688/
> 
> log.c:67:25: error: 'VIS_SAFE' undeclared (first use in this function)
>  #define LOG_STDERR_VIS (VIS_SAFE|VIS_OCTAL)
> 
> Gustavo, Alexey ?

Hi.
The ARC toolchain is doing something funky here, from openssh's config.log:

configure:10462: checking for strnvis
configure:10462:
/home/gustavoz/b/arc/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc
-o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -Wall -Wpointer-arith -Wuninitialized
-Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess
-Wno-pointer-sign -Wno-unused-result -fno-strict-aliasing
-D_FORTIFY_SOURCE=2 -ftrapv -fno-builtin-memset -fPIE
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe
-Os  -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -pie conftest.c -lutil
-lz  >&5
/home/gustavoz/b/arc/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
/home/gustavoz/b/arc/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/crt1.o:
warning: unresolvable relocation against symbol `__uClibc_main' from
.text section
/home/gustavoz/b/arc/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
/home/gustavoz/b/arc/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o:
warning: unresolvable relocation against symbol
`__deregister_frame_info@@GCC_3.0' from .text section
/home/gustavoz/b/arc/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
/home/gustavoz/b/arc/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o:
warning: unresolvable relocation against symbol
`__deregister_frame_info@@GCC_3.0' from .text section
/home/gustavoz/b/arc/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
/home/gustavoz/b/arc/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o:
warning: unresolvable relocation against symbol
`__register_frame_info@@GCC_3.0' from .text section
/home/gustavoz/b/arc/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
/home/gustavoz/b/arc/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o:
warning: unresolvable relocation against symbol
`__register_frame_info@@GCC_3.0' from .text section
configure:10462: $? = 0
configure:10462: result: yes

Which results in detecting strnvis which doesn't exist in linux at all.
If we go ac_cv_func_stnvis=no it's a hack and doesn't work completely
since it fails on other openbsd-compat detections making it fail to
build for other reasons.
Regards.

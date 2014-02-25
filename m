From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Feb 2014 21:30:37 +0100
Subject: [Buildroot] [PATCH 02/24] lua: refactor install steps
In-Reply-To: <530CD566.7090305@mind.be>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-3-git-send-email-francois.perrad@gadz.org>
 <530CD566.7090305@mind.be>
Message-ID: <530CFD6D.2000106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/14 18:39, Arnout Vandecappelle wrote:
>  Not related to this patch, but it seems to me that the .so is built and
> installed unconditionally, even on BR2_PREFER_STATIC and BINFMT_FLAT. How
> can this even work?

 Answering my own question: it can't:

http://autobuild.buildroot.net/results/44e/44e2a79a29172a28ff3024a9d75e89a204efc22d/build-end.log

/home/test/test/2/output/host/usr/bin/bfin-uclinux-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe
-Os   -Wl,-elf2flt -Wall -fPIC -DLUA_USE_POSIX -DLUA_USE_DLOPEN   -c -o
loadlib.o loadlib.c
loadlib.c:61:19: error: dlfcn.h: No such file or directory
loadlib.c: In function 'll_unloadlib':
loadlib.c:64: warning: implicit declaration of function 'dlclose'
loadlib.c: In function 'll_load':
loadlib.c:69: warning: implicit declaration of function 'dlopen'
loadlib.c:69: error: 'RTLD_NOW' undeclared (first use in this function)
loadlib.c:69: error: (Each undeclared identifier is reported only once
loadlib.c:69: error: for each function it appears in.)
loadlib.c:69: warning: initialization makes pointer from integer without
a cast
loadlib.c:70: warning: implicit declaration of function 'dlerror'
loadlib.c:70: warning: passing argument 2 of 'lua_pushstring' makes
pointer from integer without a cast
loadlib.c: In function 'll_sym':
loadlib.c:76: warning: implicit declaration of function 'dlsym'
loadlib.c:77: warning: passing argument 2 of 'lua_pushstring' makes
pointer from integer without a cast


 Clearly it needs !BR2_PREFER_STATIC. Fix is not entirely trivial because
of the large number of reverse dependencies.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

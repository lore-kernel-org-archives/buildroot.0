From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 29 Sep 2011 11:50:14 +0200
Subject: [Buildroot] Status of valgrind on powerpc
Message-ID: <CAAXf6LUVQc9JRgoOiKy84BnsiRLqXOxHbd6k+1RzQMpRQA4T0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[now sending correctly to the mailing list as well]

Hi,

I'm wondering what the status is of building valgrind for powerpc...

Not so long ago, the powerpc package was not available for powerpc;
Peter disabled it because a.out is missing.
But recently, Thomas enabled powerpc building again, with commit
http://git.buildroot.net/buildroot/commit/?id=afabcb63816806aa8c971000c486f4e108aeb117
(valgrind: bump to 3.6.1 and add support for ARMv7)
Also recently, I see a patch from Baruch Siach (valgrind: workaround
for segmentation fault on PowerPC) that hints that valgrind should at
least build for powerpc.

If I try this, I get:
/repo/tdescham/reborn/buildroot-valgrind/output/host/usr/bin/powerpc-linux-gcc
-DHAVE_CONFIG_H -I. -I..  -I.. -I../include -I../VEX/pub -DVGA_ppc32=1
-DVGO_linux=1 -DVGP_ppc32_linux=1 -I../coregrind
-DVG_LIBDIR="\"/usr/lib/valgrind"\" -DVG_PLATFORM="\"ppc32-linux\""
-m32 -O2 -g -Wall -Wmissing-prototypes -Wshadow -Wpointer-arith
-Wstrict-prototypes -Wmissing-declarations -Wno-format-zero-length
-fno-strict-aliasing -Wno-long-long -pipe -Os  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wno-pointer-sign
-fno-stack-protector -MT libcoregrind_ppc32_linux_a-readstabs.o -MD
-MP -MF .deps/libcoregrind_ppc32_linux_a-readstabs.Tpo -c -o
libcoregrind_ppc32_linux_a-readstabs.o `test -f
'm_debuginfo/readstabs.c' || echo './'`m_debuginfo/readstabs.c
In file included from m_debuginfo/readstabs.c:53:
/repo/tdescham/reborn/buildroot-valgrind/output/host/usr/powerpc-unknown-linux-uclibc/sysroot/usr/include/a.out.h:1:25:
error: linux/a.out.h: No such file or directory
m_debuginfo/readstabs.c: In function 'vgModuleLocal_read_debuginfo_stabs':
m_debuginfo/readstabs.c:139: error: invalid application of 'sizeof' to
incomplete type 'struct nlist'
m_debuginfo/readstabs.c:139: warning: division by zero
m_debuginfo/readstabs.c:142: error: invalid use of undefined type 'struct nlist'
m_debuginfo/readstabs.c:142: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:148: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:148: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:148: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:149: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:150: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:151: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:163: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:214: error: invalid use of undefined type 'struct nlist'
m_debuginfo/readstabs.c:214: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:215: error: invalid use of undefined type 'struct nlist'
m_debuginfo/readstabs.c:215: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:232: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:243: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:268: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:293: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:303: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:339: error: dereferencing pointer to incomplete type
m_debuginfo/readstabs.c:353: error: dereferencing pointer to incomplete type
make[4]: *** [libcoregrind_ppc32_linux_a-readstabs.o] Error 1
make[4]: *** Waiting for unfinished jobs....


Hence my question: is it supposed to work now? If yes, what am I
missing? (This is buildroot-2011.05 with the latest valgrind changes).
I will try buildroot-2011.08 to see if it works better.

Thanks,
Thomas

From: Jon Doe <ffplay99@gmail.com>
Date: Thu, 30 Jun 2011 19:31:44 +0200
Subject: [Buildroot] [PATCH] native gcc,
	libc.so and uclibc undefined reference
Message-ID: <BANLkTinjDc=WwWHpLx+=BLOOVWwpvUqKiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've found that the target filesystem is missing /usr/lib/libc.so
(simple script) when choosing the native gcc compiler package.

This causes native gcc to fall back to static linking (libc.a), even
though "-shared" is specified. You can see this by observing gcc
-Wl,verbose output. When building shared code it returns this cryptic
error message:

/home/nn/buildroot/output/staging/usr/lib/libc.a(__uClibc_main.os): In
function `__uClibc_fini':
__uClibc_main.c:(.text+0x6c): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x74): undefined reference to `__fini_array_end'
/home/nn/buildroot/output/staging/usr/lib/libc.a(__uClibc_main.os): In
function `__uClibc_main':
__uClibc_main.c:(.text+0x250): undefined reference to
`__preinit_array_start'
__uClibc_main.c:(.text+0x254): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x25c): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x260): undefined reference to `__init_array_end'
/home/nn/buildroot/output/staging/usr/arm-linux-uclibcgnueabi/bin/ld:
./libgcc_s.so.1.tmp: hidden symbol `__fini_array_end' isn't defined
/home/nn/buildroot/output/staging/usr/arm-linux-uclibcgnueabi/bin/ld:
final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[3]: *** [libgcc_s.so] Error 1

Here's a patch:

diff -ruN buildroot-2011.05/scripts/copy.sh
buildroot-2011.05-new/scripts/copy.sh
--- buildroot-2011.05/scripts/copy.sh??? 2011-05-27 16:18:21.000000000 +0200
+++ buildroot-2011.05-new/scripts/copy.sh??? 2011-06-30 16:02:59.059803037 +0200
@@ -6,6 +6,7 @@
?echo "Copying development files to target..."

?cp -af ${STAGING_DIR}/usr/include ${TARGET_DIR}/usr
+cp -af ${STAGING_DIR}/usr/lib/libc.so ${TARGET_DIR}/usr/lib/libc.so

?for LIBSDIR in /lib /usr/lib; do
???? for WILDCARD in *.a *.la; do

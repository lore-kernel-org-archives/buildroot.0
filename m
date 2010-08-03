From: Malte Starostik <m-starostik@versanet.de>
Date: Tue, 3 Aug 2010 14:27:40 +0200
Subject: [Buildroot] GNU_TARGET_NAME vs. REAL_GNU_TARGET_NAME
Message-ID: <201008031427.41292.m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm building with an external i686-pc-linux-uclibc toolchain.  On a x86_64-pc-
linux-gnu host this is not a problem, but on a i686-pc-linux-gnu host, things 
get fuzzy.
kexec builds a host binary bin/bin-to-hex which is run during the build 
process.  On the i686 host, configure does recognize that it's cross 
compiling, but somehow both ${build} and ${host} wind up as "i686-pc-linux-
gnu" which skips some cross compiling assignments and in the end the host 
binary is built with the target toolchain and breaks the build.

If I replace $(GNU_TARGET_NAME) with $(REAL_GNU_TARGET_NAME) in the --host and 
--target arguments to configure in package/Makefile.autotools.in, everything 
works as expected.  GNU_TARGET_NAME expands to "i686-linux", which is indeed 
rather ambigious in my setup.
Now I wonder if this fix (or workaround?) would generally work or if it fails 
miserably for just about any non-i686 target?  In the latter case, maybe some 
special handling could do where host and target have the same arch but 
different libc or otherwise different toolchain?

Cheers,
Malte

From: Ronny Meeus <ronny.meeus@gmail.com>
Date: Tue, 2 Oct 2012 15:57:43 +0200
Subject: [Buildroot] Question about 64Bit kernel and 32Bit applications
Message-ID: <CAMJ=MEd+eR2Z1yUKu541TQzQJOhu-fpa6HDLD0e-0+n-Jt-6WA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I'm using buildroot to build an environment for MIPS (Cavium).
For this I use a 64 bit toolchain provided by Cavium.

My buildroot configuration is as follows:
* Buildroot 2012.05
* Target Architecture: MIPS (big endian)
* Target Architecture Variant: mips 64
* Target ABI: n64
* glibc

Building and deploying the kernel / busybox in this configuration
works without issues.

I want to deploy on this configuration "legacy" applications that need
to run in 32 bit mode.
So in fact I want to have a mixture of 32 and 64 bit
(busybox,dropbear,...) applications to be present on the board.

Is this supported in buildroot? If it is, how can this be configured?

What I already did is changing the .mk files in the package directory
to pass the correct options to build 32 bit variants to the individual
libraries (libUIO / xenomai-forge / libfuse) I want to use.
This works, but I consider it as a workaround since I only have 32 bit
variants of these libraries. To be correct, I should have both a 32
and a 64 bit version of each of these libraries.
I also need to adapt all the packages I want to include, which is
something I would like to configure at buildroot level.

This is what I changed for libfuse for example:
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -13,7 +13,8 @@ LIBFUSE_CONF_OPT= --disable-nls \
                --disable-example \
                --disable-kernel-module \
                --enable-lib \
-               --enable-util
+               --enable-util \
+               CFLAGS="-mabi=n32 -march=octeon2"
LDFLAGS="-Wl,-melf32btsmipn32" CPPFLAGS="-mabi=n32 -march=octeon2"


On the short term, it would also be fine to have user-land compiled
completely in 32 bit mode while the kernel is compiled in 64 bit mode.
If this is supported in some way, I would be fine for the moment but
in the future we want to run a mixture of both 32 and 64 bit apps.

---
Ronny

From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 21 Nov 2016 12:21:28 +0100
Subject: [Buildroot] Analysis of autobuild failures 18-19/11
In-Reply-To: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
Message-ID: <20161121112128.GP27313@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Arnout Vandecappelle wrote,

>  Hi all,
> 
>  Here's an analysis of autobuild failures. It looks a bit different from what
> Thomas usually sends because I based it on the website rather than the mail. I
> eliminated the ones that are already fixed in git, and also the powerpc64le
> failures that are due to libtool.m4.
> 
>  I'm not putting the people from get-developers in Cc, because they already get
> these mails.
> 
> http://autobuild.buildroot.net/results/d47fa41aa860d82471b83ac90967d3a3dacd8611
> m68k / 5208	lcdapi-v0.10	uclibc	static
> 
> > /tmp/cc6S5lwR.s: Assembler messages:
> > /tmp/cc6S5lwR.s: Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
> > Please report this bug.
> > Makefile:784: recipe for target 'lcdapi/api/liblcdapi_la-LCDHorizontalBar.lo' failed
> 
>  ICE... Waldemar?

This could be avoided by using something like the following (example
for libasplib):
diff --git a/package/libasplib/libasplib.mk
b/package/libasplib/libasplib.mk
index 41aeaeb..b09d739 100644
--- a/package/libasplib/libasplib.mk
+++ b/package/libasplib/libasplib.mk
@@ -10,4 +10,11 @@ LIBASPLIB_LICENSE = GPLv3+
 LIBASPLIB_LICENSE_FILES = LICENSE
 LIBASPLIB_INSTALL_STAGING = YES
 
+# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
+ifeq ($(BR2_m68k_cf),y)
+LIBASPLIB_CXXFLAGS += -fno-dwarf2-cfi-asm
+endif
+
+LIBASPLIB_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(LIBASPLIB_CXXFLAGS)"
+
 $(eval $(cmake-package))

Unfortunately libasplib cmake infrastructure ignores my
CMAKE_CXX_FLAGS. 

The m68k/coldfire uclinux seems to have some limitation regarding
CFI assembly generation, as elf2flt lacks some features.
See here for the comment in the code of GNU as:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=gas/config/tc-m68k.h;h=30ca2cb35e0b00048c52bda0dc04ae0cdef5cc3a;hb=HEAD#l180

With gcc -fno-dwarf2-cfi-asm we can disable the CFI generation and
at least fix the compile errors for those packages.
 
Not sure if it will break some exception handling in C++ code or if
it only disables the ability to debug the code.
 
> http://autobuild.buildroot.net/results/4fb4353bce614b64b30b05d06831e0d0f38a48dd
> bfin / bf532	libarchive-3.2.1	uclibc	static
> 
> > ./.libs/libarchive.a(archive_random.o): In function `_archive_random':
> > libarchive/archive_random.c:(.text+0x158): undefined reference to `_pthread_mutex_lock'
> > libarchive/archive_random.c:(.text+0x20a): undefined reference to `_pthread_mutex_unlock'
> 
>  pthread static linking problem with the ADI toolchain. Probably solved with
> current uClibc-ng.

Yes, absolutely. May be disable for this toolchain, like Thomas did
for some other package recently.
 
best regards
 Waldemar

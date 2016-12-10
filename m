From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 16:00:09 +0100
Subject: [Buildroot] [git commit] sdl_mixer: fix static linking issue
Message-ID: <20161210150019.E29308183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69c365a9d1c820ba64482e06e0907471372f790d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LDFLAGS must be passed when creating binaries.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../sdl_mixer/0002-add-LDFLAGS-while-linking.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch b/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch
new file mode 100644
index 0000000..4144660
--- /dev/null
+++ b/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch
@@ -0,0 +1,29 @@
+Pass LDFLAGS while creating binaries.
+
+Fixes following linking error with uClibc-ng:
+br/output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o): In function `_Unwind_Find_FDE':
+br/output/build/host-gcc-final-5.4.0/build/powerpc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:465: undefined reference to `dl_iterate_phdr'
+collect2: error: ld returned 1 exit status
+
+Since uClibc-ng 1.0.18 a circular dependency between libc and libgcc
+exist, when static linking is used. It can be resolved by the compiler
+when -static is correctly passed in the linking step.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur SDL_mixer-1.2.12.orig/Makefile.in SDL_mixer-1.2.12/Makefile.in
+--- SDL_mixer-1.2.12.orig/Makefile.in	2012-01-15 23:01:04.000000000 +0100
++++ SDL_mixer-1.2.12/Makefile.in	2016-12-07 08:29:22.479786596 +0100
+@@ -66,10 +66,10 @@
+ 	$(LIBTOOL) --mode=link $(CC) -o $@ $(OBJECTS) $(VERSION_OBJECTS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS)
+ 
+ $(objects)/playwave$(EXE): $(objects)/playwave.lo $(objects)/$(TARGET)
+-	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playwave.lo $(SDL_CFLAGS) $(SDL_LIBS) $(objects)/$(TARGET)
++	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playwave.lo $(SDL_CFLAGS) $(SDL_LIBS) $(LDFLAGS) $(objects)/$(TARGET)
+ 
+ $(objects)/playmus$(EXE): $(objects)/playmus.lo $(objects)/$(TARGET)
+-	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playmus.lo $(SDL_CFLAGS) $(SDL_LIBS) $(objects)/$(TARGET)
++	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playmus.lo $(SDL_CFLAGS) $(SDL_LIBS) $(LDFLAGS) $(objects)/$(TARGET)
+ 
+ install: all install-hdrs install-lib #install-bin
+ install-hdrs:

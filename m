From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 7 Dec 2016 20:09:00 +0100
Subject: [Buildroot] [PATCH] sdl_mixer: fix static linking issue
Message-ID: <20161207190900.GA18119@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LDFLAGS must be passed when creating binaries.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
while testing the berkeley db fix, this error occured afterwards, so
no autobuilder reference.
---
 .../sdl_mixer/0002-add-LDFLAGS-while-linking.patch   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch

diff --git a/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch b/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch
new file mode 100644
index 0000000..5c55a48
--- /dev/null
+++ b/package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch
@@ -0,0 +1,20 @@
+Pass LDFLAGS while creating binaries.
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
-- 
2.1.4

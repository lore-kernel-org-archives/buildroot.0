From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:15:56 +0100
Subject: [Buildroot] [git commit] package/mpd: add patch to fix linking with
	ogg
Message-ID: <20170113152114.72B977F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=159bbae9db0d03a1e5557be70fd9bb17f9babf2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building mpds internal static xiph library needs to link with libogg.
Otherwise building mpd fails with:

```
/mips-linux-gnu/bin/ld: libxiph.a(libxiph_a-OggVisitor.o): undefined
reference to symbol 'ogg_stream_packetout'
```

Add a patch which adds OGG_LIBS to XIPH_LIBS so that the linker finds
the necessary ogg library.

Fixes:
http://autobuild.buildroot.net/results/9f0/9f062dc51daed5c5047faa8d79ecbd4e228f2572/
http://autobuild.buildroot.net/results/1cc/1cc097c5022bd3161dc03b0866cb04075c944a64/
http://autobuild.buildroot.net/results/2e3/2e3dbcdea34053675a0139c1911b6da1a6670e2c/
.. and more.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...002-Makefile.am-fix-linking-xiph-with-ogg.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/mpd/0002-Makefile.am-fix-linking-xiph-with-ogg.patch b/package/mpd/0002-Makefile.am-fix-linking-xiph-with-ogg.patch
new file mode 100644
index 0000000..1fe6095
--- /dev/null
+++ b/package/mpd/0002-Makefile.am-fix-linking-xiph-with-ogg.patch
@@ -0,0 +1,41 @@
+From 6ef588b2c230eae15f7f2563eca9d5f40c78d1d0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Wed, 11 Jan 2017 21:06:37 +0100
+Subject: [PATCH] Makefile.am: fix linking xiph with ogg
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The internal static xiph library needs to link with libogg. Otherwise
+building mpd will fail:
+
+```
+/mips-linux-gnu/bin/ld: libxiph.a(libxiph_a-OggVisitor.o): undefined
+reference to symbol 'ogg_stream_packetout'
+```
+
+Upstream status: Pending
+http://mailman.blarg.de/pipermail/mpd-devel/2017-January/000594.html
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e0202b0cc..9030e68fb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -614,7 +614,8 @@ libxiph_a_SOURCES += \
+ 	src/lib/xiph/OggStreamState.hxx
+ endif
+ 
+-XIPH_LIBS = libxiph.a
++XIPH_LIBS = libxiph.a \
++	$(OGG_LIBS)
+ 
+ endif
+ 
+-- 
+2.11.0
+

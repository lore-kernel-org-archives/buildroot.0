From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:42:35 +0200
Subject: [Buildroot] [git commit] package/mplayer: Fix static linking with
	tremor & libogg
Message-ID: <20160704094256.2263880741@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e63e6dc87d327f65c0bcf7c68878d4f83ee973e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/bc9/bc98fa585399b53ea181dbaf392b93424145911d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/0005-tremor-ogg.patch | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/mplayer/0005-tremor-ogg.patch b/package/mplayer/0005-tremor-ogg.patch
new file mode 100644
index 0000000..b4d6505
--- /dev/null
+++ b/package/mplayer/0005-tremor-ogg.patch
@@ -0,0 +1,29 @@
+Fix static linking with tremor & libogg
+
+The order of the libraries needs to be changed to fix a bug during
+static linking caught by buildroot autobuilders:
+
+http://autobuild.buildroot.net/results/bc9/bc98fa585399b53ea181dbaf392b93424145911d/
+
+/home/test/autobuild/instance-3/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libvorbisidec.a(synthesis.o): In function `_vorbis_synthesis1':
+synthesis.c:(.text+0x90): undefined reference to `oggpack_readinit'
+synthesis.c:(.text+0x9c): undefined reference to `oggpack_read'
+[...]
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(patch sent upstream:
+ http://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2016-July/073501.html)
+
+Index: configure
+===================================================================
+--- a/configure	(revision 37873)
++++ b/configure	(working copy)
+@@ -6629,7 +6629,7 @@
+   def_tremor='#define CONFIG_TREMOR 1'
+   codecmodules="tremor $codecmodules"
+   res_comment="integer libvorbis"
+-  extra_ldflags="$extra_ldflags -logg -lvorbisidec"
++  extra_ldflags="$extra_ldflags -lvorbisidec -logg"
+ elif test "$_libvorbis" = yes ; then
+   _vorbis=yes
+   def_vorbis='#define CONFIG_OGGVORBIS 1'

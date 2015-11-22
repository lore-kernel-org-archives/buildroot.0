From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 13:57:45 +0100
Subject: [Buildroot] [git commit] package/mpd: fix static build issue with
	alsa
Message-ID: <20151122125750.D1BDE81D7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47cab068fbd29d29d78535787f8f54f2f7f83798
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpd forgets to link the archive libmixer_plugins.a against libasound leading
to undefined references in a static context.

Add a patch sent upstream to fix:
http://autobuild.buildroot.net/results/f10/f10c6ea2d29bbcef8f33fc9ba1430e99edca895d/
http://autobuild.buildroot.net/results/312/31212c484f452fe4ea6ae084d3edefc4580830d8/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/0003-fix-static-build-with-alsa.patch |   32 +++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/mpd/0003-fix-static-build-with-alsa.patch b/package/mpd/0003-fix-static-build-with-alsa.patch
new file mode 100644
index 0000000..4ba0449
--- /dev/null
+++ b/package/mpd/0003-fix-static-build-with-alsa.patch
@@ -0,0 +1,32 @@
+From bba7b8e5fed79a7fecacf5468ade35a3ae0a0f8e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sat, 21 Nov 2015 23:51:43 +0100
+Subject: [PATCH 1/1] Makefile.am: fix static build with alsa
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add ALSA_LIBS to MIXER_LIBS, otherwise building mpd in a static context fails
+with lot of undefined references to alsa-lib (libasound) required by
+src/mixer/plugins/AlsaMixerPlugin.cxx.
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 89819de..307fcba 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1219,6 +1219,7 @@ liboutput_plugins_a_SOURCES = \
+ 
+ MIXER_LIBS = \
+ 	libmixer_plugins.a \
++	$(ALSA_LIBS) \
+ 	$(PULSE_LIBS)
+ 
+ MIXER_API_SRC = \
+-- 
+2.6.2
+

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Mar 2011 22:27:06 +0100
Subject: [Buildroot] [git commit master 1/1] makedevs: don't call /bin/sync
	after creating nodes
Message-ID: <20110312212828.9E17D8FFCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=707dc469aa4f51a85a62b2587ac57ef2a4db7873
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3475

There's no real reason to sync after creating the device nodes,
and it slows down the file system image creating quite a lot on
busy systems, so get rid of it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                     |    8 ++++++--
 package/makedevs/makedevs.c |    3 ---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index adc9298..eafa201 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,8 +2,12 @@
 
 	Updated/fixed packages: avahi, busybox, dropbear, ffmpeg,
 	file, gnuconfig, gst-ffmpeg, imagemagick, libdnet, libpng,
-	libxml2, libxslt, mpg123, pkg-config, qt, samba, squashfs,
-	xerces, xorg-server, xz
+	libxml2, libxslt, makedevs, mpg123, pkg-config, qt, samba,
+	squashfs, xerces, xorg-server, xz
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#3475: Calling sync on large filesystems when not always necessary
 
 2011.02, Released February 28th, 2011:
 
diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 79cfc60..9fc71af 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -536,8 +536,5 @@ loop:
 	}
 	fclose(table);
 
-	if (system("/bin/sync"))
-		bb_error_msg("sync failed, continuing anyway");
-
 	return 0;
 }
-- 
1.7.3.4

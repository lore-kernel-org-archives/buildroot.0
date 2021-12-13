Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785F0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 331B04022E;
	Mon, 13 Dec 2021 21:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lcW6EfKxHryX; Mon, 13 Dec 2021 21:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 158444040C;
	Mon, 13 Dec 2021 21:17:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7E0E1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26FFF402A9
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QadfZFNI1SK8 for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 177EF402D2
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A90E83799; Mon, 13 Dec 2021 21:09:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 22:09:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9610b982896a59f23f6c8984fbdec86deb8d24ce
X-Git-Newrev: 20eaaf074d2a95209cdfdd9461f2027fe7240ea0
X-Patchwork-Hint: ignore
Message-Id: <20211213210952.4A90E83799@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/bluez5_utils: fix
 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=20eaaf074d2a95209cdfdd9461f2027fe7240ea0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

pause() is defined in glibc since the very early times; it appears in
upstream commit 28f540f45bba (initial import) in 1995 [0].

Bluez has been defining a function named pause() for ages too, since
comit caab74c97542 (media: Implement new callbacks for pass-through
operations) in 2013 [1]

With the recent bump to glibc 2.34.xxx, the build now fails because the
two pause() clash:

    profiles/audio/media.c:1284:13: error: conflicting types for 'pause'
     1284 | static bool pause(void *user_data)
          |             ^~~~~
    In file included from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
                     from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
                     from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
                     from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib.h:34,
                     from profiles/audio/media.c:21:
    /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:489:12: note: previous declaration of 'pause' was here
      489 | extern int pause (void);
          |            ^~~~~

The culprit is indeed glibc 2.34, as can be seen in this result matrix:

         \   bluez5_utils
    glibc \  5.60  |  5.61
    -------\-------+--------
    2.33   |  OK   |   OK
    -------+-------+--------
    2.34   |  KO   |   KO

Even though we first bumped to glibc 2.34, then to blues5_utils 5.61,
we did not notice build issues with bluez5_utils 5.60 because the two
bumps were too close to each other for the failure to trigger in the
autobuilders.

The underlying reason that pause() is now causing issues with glibc 2.34
is not obvious: glibc is a big beast, and finding such issues is not
easy. However, we can see that the pause() provided by NPTL has been
dropped in favour of the generic one, so maybe this is causing symbol
visibility or weakness to change or something...

We fix that by renaming the local pause() in bluez5_utils with a
namespace-prefix, like some other functions there already have.

Fixes:
  - http://autobuild.buildroot.org/results/c4f/c4fbface34be8815838fd7201621d7a8fddd32c5/
  - http://autobuild.buildroot.org/results/62b/62b88740f19fbe4a1ad7959dc141d539eb88c1f8/

[0] https://sourceware.org/git/?p=glibc.git;a=commit;h=28f540f45bbacd939bfd07f213bcad2bf730b1bf
[1] https://github.com/bluez/bluez/commit/caab74c97542a56b591f0b16b44ab6ba4b40f0f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: extend commit log with the glibc culprit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a02927b94ae4e8688571536667550853abda7b51)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-profiles-audio-media.c-rename-pause.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch b/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
new file mode 100644
index 0000000000..a7fabc9edd
--- /dev/null
+++ b/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
@@ -0,0 +1,52 @@
+From 0bb5785a68a2799db003364770be3764af9b9034 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Sep 2021 13:55:49 +0200
+Subject: [PATCH] profiles/audio/media.c: rename pause
+
+Rename pause to media_player_pause to avoid the following build failure:
+
+profiles/audio/media.c:1284:13: error: conflicting types for 'pause'
+ 1284 | static bool pause(void *user_data)
+      |             ^~~~~
+In file included from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
+                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
+                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
+                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib.h:34,
+                 from profiles/audio/media.c:21:
+/tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:489:12: note: previous declaration of 'pause' was here
+  489 | extern int pause (void);
+      |            ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c4fbface34be8815838fd7201621d7a8fddd32c5
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ profiles/audio/media.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/profiles/audio/media.c b/profiles/audio/media.c
+index 267722542..f93b74e67 100644
+--- a/profiles/audio/media.c
++++ b/profiles/audio/media.c
+@@ -1281,7 +1281,7 @@ static bool stop(void *user_data)
+ 	return media_player_send(mp, "Stop");
+ }
+ 
+-static bool pause(void *user_data)
++static bool media_player_pause(void *user_data)
+ {
+ 	struct media_player *mp = user_data;
+ 
+@@ -1331,7 +1331,7 @@ static struct avrcp_player_cb player_cb = {
+ 	.set_volume = set_volume,
+ 	.play = play,
+ 	.stop = stop,
+-	.pause = pause,
++	.pause = media_player_pause,
+ 	.next = next,
+ 	.previous = previous,
+ };
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

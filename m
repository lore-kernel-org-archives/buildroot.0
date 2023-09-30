Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BD6E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 09:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A4183C8B;
	Sat, 30 Sep 2023 09:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A4183C8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vxr5wsiplQn1; Sat, 30 Sep 2023 09:00:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B0A683CE6;
	Sat, 30 Sep 2023 09:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B0A683CE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86D751BF397
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70B0E81E3E
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70B0E81E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GgmeRJaS8Lo for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 09:00:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86EB781380
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86EB781380
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 733D0838B3; Sat, 30 Sep 2023 09:00:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 10:59:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32cec3be9766498f472fd463aaff00f4e7ad554d
X-Git-Newrev: 0e655158627fba890c5a42074c722521ac48ef5d
X-Patchwork-Hint: ignore
Message-Id: <20230930090016.733D0838B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/runtime-test: fix weston test
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e655158627fba890c5a42074c722521ac48ef5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The weston runtime test uses the CRC of the framebuffer to detect that
"something" is being drawned on the framebuffer. This requires that the
sampling of the CRC happens does not happen too early after trigerring
an action, or the rendering may be not be finishe, either:

  - weston may not have had time to initialise, or
  - the test application may not have started rednering,

The sequence of rendering that has been observed yields this sequence of
CRCs (elided for brevity):

  - boot:
    - alternating between 0x4c4126bf and 0x5d2f9aa5: console cursor
      blinking

  - start weston:
    - 0x4c4126bf: weston switches to a cleared vt, no blinking cursor
      ...
    - 0xe54b7895: weston is starting
      ...
    - 0xe54b7895: wayland socket appears!
      ...
    - 0x6bf28bdf: weston is ready
      ...

  - start weston-simple-egl:
    - 0x6bf28bdf: application is starting
      ...
    - 0xNNNNNNNN: random CRCs while the application renders
      ...

  - stop weston-simple-egl:
    - 0xNNNNNNNN: zero, one, or two random CRCs while the application
        renders before it handles SIGTERM
    - 0x6bf28bdf: application is stopped
      ...

  - stop weston:
    - 0x6bf28bdf: a few CRC identical to when weston was started, while
        weston is processing SIGTERM
    - oscillating between 0x4c4126bf and 0x5d2f9aa5: console cursor
        blinking, back to initial vt, weston dead.

So, we need to wait "enough" after each action. Moreover, when the
wayland socket appears, weston may not have stabilised yet, so we also
need to wait after the socket appears.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_weston.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index 276788c649..df1b7a4135 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -78,6 +78,7 @@ class TestWeston(infra.basetest.BRTest):
         wayland_socket = "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}"
         cmd = f"while [ ! -e \"{wayland_socket}\" ] ; do sleep 1 ; done"
         self.assertRunOk(cmd, timeout=10)
+        time.sleep(4)
 
     def stop_weston(self):
         cmd = "killall weston && sleep 3"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

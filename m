Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C58C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7E1960BE9;
	Wed, 27 Jul 2022 13:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7E1960BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CXnPRXJ01hS6; Wed, 27 Jul 2022 13:57:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA67960D75;
	Wed, 27 Jul 2022 13:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA67960D75
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF10B1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9CEE40889
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9CEE40889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWg_40QlCjqV for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:57:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70A534150F
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70A534150F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4631486612; Wed, 27 Jul 2022 13:43:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 15:56:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9a38a42ac817b963be2b4b51d218c5eabb1059d
X-Git-Newrev: 42f7f451ecd27dfe721092515eef09c47bc03bc5
X-Patchwork-Hint: ignore
Message-Id: <20220727134344.4631486612@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/boot-qemu-image.py:
 increase the timeout by 10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42f7f451ecd27dfe721092515eef09c47bc03bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As for the Buildroot testsuite, multiply every emulator timeout by 10
to avoid sporadic failures in elastic runners.

qemu_arm_vexpress_tz_defconfig tested locally with sucess.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084046

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/boot-qemu-image.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
index fba1533bb7..ba50ea69ee 100755
--- a/support/scripts/boot-qemu-image.py
+++ b/support/scripts/boot-qemu-image.py
@@ -25,7 +25,7 @@ def main():
     qemu_start = os.path.join(os.getcwd(), 'output/images/start-qemu.sh')
 
     child = pexpect.spawn(qemu_start, ['serial-only'],
-                          timeout=5, encoding='utf-8',
+                          timeout=50, encoding='utf-8',
                           env={"QEMU_AUDIO_DRV": "none"})
 
     # We want only stdout into the log to avoid double echo
@@ -36,7 +36,7 @@ def main():
     time.sleep(1)
 
     try:
-        child.expect(["buildroot login:"], timeout=60)
+        child.expect(["buildroot login:"], timeout=600)
     except pexpect.EOF as e:
         # Some emulations require a fork of qemu-system, which may be
         # missing on the system, and is not provided by Buildroot.
@@ -58,7 +58,7 @@ def main():
     child.sendline("root\r")
 
     try:
-        child.expect(["# "], timeout=60)
+        child.expect(["# "], timeout=600)
     except pexpect.EOF:
         print("Cannot connect to shell")
         sys.exit(1)
@@ -69,7 +69,7 @@ def main():
     child.sendline("poweroff\r")
 
     try:
-        child.expect(["System halted"], timeout=60)
+        child.expect(["System halted"], timeout=600)
         child.expect(pexpect.EOF)
     except pexpect.EOF:
         pass
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

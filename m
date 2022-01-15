Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD636C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 14:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 689F840477;
	Sat, 15 Jan 2022 14:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvKHW5icBTEz; Sat, 15 Jan 2022 14:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7600F404ED;
	Sat, 15 Jan 2022 14:34:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 500701BF293
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CCCD40325
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SoLEcsYpIUeH for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 14:33:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5608F4089B
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 14:33:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso13329186wmj.2
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 06:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnIjLcwFnUvMEHoQ2urV11To6566R0hrkHLdd2bKw8A=;
 b=lIi9fn0ylRIPhj6Ra8+2kNnUaiUp3dCxRxvErC8LpSd1uAgy+4iQUrV+fydrc3I2Ih
 OT1Pvq7s/s5Z7G6NBlEibz/htV8WqGaRZmmqfNwFWlDhrXq1T/ACuO86A03s5QUIFZbR
 VLGTNS1CXwWd3eKCeaivt/jhPqu3tmwsFU/qNlPZGiHprEAAXfkNncPYXj9G8wpJBZ6Q
 PNH+z8OUSNJlDfnCzS/CTu5IPzBBfIxzHcoE7/PnWeY+zZSO8SoWHfeoY4+5fYwFRapw
 zw52nxq6b7LveC8evzdTlyCNvtvUVZCr49OanmQGiXeq3uSx71ikOo3Mx90JHTCNe3K6
 6UiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnIjLcwFnUvMEHoQ2urV11To6566R0hrkHLdd2bKw8A=;
 b=fvzQmz7E8t9cQTbmd1sEs5H3XKHT1QqZfwPUN5aZNqOY3tV1a90Ou/7/iFc/Rfh64G
 9SZYFFWYWqvHHYlvexG7bpUURpUTStSvyeA8LdbIx6RU1xb/E1p6DnrOU2e98u5As/Qk
 JIhZwpHUuZ4ILhNP3KkKqSvysM9xbyvKepZ4CNWZdTS4XvNHqNOSlkGDNR+L6yAKHM72
 HJICW7ly0hPVhe/iT6DWyu1S4R6s6kS4EcNANA1NERFggNIZDUEI5p26+ODjKHMaJSrr
 YBnQPJeEunYoJTWfwcNn/NTCwCyuENja6+42p7OcVrrQVGF6JCkeAUNcvpl8XN8rK5GN
 hLcQ==
X-Gm-Message-State: AOAM533d6QNLB7mN8p98mAZIRYlyZwaW/p5KVIyqgFjmiJWAzBojuP/M
 s59RdqNdZwr0gVx+Q25PoMy7iWpiDNg=
X-Google-Smtp-Source: ABdhPJwWkJ7BQ5U8ASUMSVvQNUR0g8zB1KG8DOCn7nttMTCI6VBA/mCt6khNOrGNXGDavUcIQS1xvQ==
X-Received: by 2002:a1c:e913:: with SMTP id q19mr20013164wmc.87.1642257228644; 
 Sat, 15 Jan 2022 06:33:48 -0800 (PST)
Received: from atlas.home (amontpellier-158-1-160-63.w92-145.abo.wanadoo.fr.
 [92.145.131.63])
 by smtp.gmail.com with ESMTPSA id b6sm4754512wrd.17.2022.01.15.06.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 06:33:48 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 15:33:44 +0100
Message-Id: <20220115143344.12319-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220115143344.12319-1-romain.naour@gmail.com>
References: <20220115143344.12319-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/scripts/boot-qemu-image.py:
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As for the Buildroot testsuite, multiply every emulator timeout by 10
to avoid sporadic failures in elastic runners.

qemu_arm_vexpress_tz_defconfig tested locally with sucess.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084046

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

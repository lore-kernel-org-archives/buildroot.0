Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9948C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 10:08:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2045B60F91
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 10:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2045B60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D470F40292;
	Sat,  4 Sep 2021 10:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAJ8GJncoFIR; Sat,  4 Sep 2021 10:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E98240262;
	Sat,  4 Sep 2021 10:08:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDB1A1BF5AD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 10:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA87F40262
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 10:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JKdB--MxPq_5 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 10:08:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7299E40259
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 10:08:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b10so2214473wru.0
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 03:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D3RvkZTyCTcyB6X78+SFj/AWG43Y2yvM9lT2zZ43ebs=;
 b=M0Hz5WuYLM9TbuifhYsgTdsxXuueTBo/ogfYbibVzOKoyqH21n/i3KH/z5Y+OU1o9C
 ImSos+jYS+JgjqDNhrwClTjw0l3Cpnh6sDP08U3i2ToloLMTYyzoYMDnonNwRzz5v9CV
 U1JUKwGAKA9/YeJ0pjmtdtkg+vAiIWxIfGqLq3vIc30VDnBez5Er70BqaNe1e5t7/hzi
 zZU6G5LtJQ8e1JWY5lUFYMGGk5VHnHsHRI5NCBfpfEr3qyINZiftlXvIu6OuRlGEByhS
 EfrcddCR/TXrKj0nJ0whVJ8uWXgEotd6oYmokYf/RQGc98JJA8sonHL2zZUHtEasaDWy
 1lYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D3RvkZTyCTcyB6X78+SFj/AWG43Y2yvM9lT2zZ43ebs=;
 b=ClIs3wnNAgdQ8qCAD55FLj1SjFKM2Dv8wjKE2N0LTLdibeA+Oukc3M8G3PrxQW1IiA
 b5y/sFF5U+sfgDCuIgCpOYcV5iy4YTukoMc63rRwAh9YAGBuRbqbg+7TwUG4na3P+D+7
 NaJae8NvsaB00Smp9Ug6fhp6+mQ4/rKIglu5te0K/aPV6Zqs3/pCsPofYt6XlGJjdX1L
 np+aVvBgcLJENu89/21i1Q9uNUoJvp86k7aOqA0UmFUkSDZ8IV60GYGJH6YRzl/AGE+w
 cDpAqKbpy+FOn1j8z5bDdBCrXFzjjUSGY1afzv63yT6kj0prJZ+uMmnv4LuTTxSeaGOh
 yhJw==
X-Gm-Message-State: AOAM5308pEmXbC3kmahUvgFYCqJLGYu+6O8zKHr5dkAgH1iLX0lCUsEo
 WFjp0FKWmpmzr4ONhfsgGRYb8OP129Q=
X-Google-Smtp-Source: ABdhPJzsBHWN4SrAjV9RQjgWow+VSlkdV5GKn3ZAK7DIMLg7WVsPuWU6pw8xKb/5XV2rY5xVsPVaYA==
X-Received: by 2002:adf:d231:: with SMTP id k17mr3293405wrh.389.1630750123725; 
 Sat, 04 Sep 2021 03:08:43 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id o2sm1794172wrh.13.2021.09.04.03.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 03:08:43 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Sep 2021 12:08:36 +0200
Message-Id: <20210904100837.1785198-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC 1/2] support/testing: test_ubi.py enable qemu's
 cfi flash01 old multiple chip handling
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The ubi/ubifs test (test_ubi.py) rely on a Qemu bug present in 2.8.0 that was fixed in Qemu 2.9.0 [1].
The ubi/ubifs settings must be updated to run with Qemu >= 2.9.0 using the new multiple chip handling.

The issue was not detected until now since we are sill using an old qemu (2.8 from Debian stretch)
for testing in gitlab (using the Buildroot Docker image used by gitlab-ci.yml).
The test will fail with qemu >= 2.9.

In order to be able to the the test with any Qemu version >= 2.9, enable the
hw-compat property to retain the old behaviour on 2.8 and earlier versions.
(This property is not supported by qemu 2.8.0).

Tested with qemu 2.9.0.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1543100932

[1] https://git.qemu.org/?p=qemu.git;a=commit;h=feb0b1aa11f14ee71660aba46b46387d1f923c9e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
This will not work with Qemu 2.8.0 since this property doesn't exist.

I tried to update the ubi/ubifs settings without success.
---
 support/testing/tests/fs/test_ubi.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 7321f83da9..9cacf3b4b7 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -32,7 +32,8 @@ class TestUbi(infra.basetest.BRTest):
                            kernel_cmdline=["root=ubi0:rootfs",
                                            "ubi.mtd=0",
                                            "rootfstype=ubifs"],
-                           options=["-drive", "file={},if=pflash".format(img)])
+                           options=["-global", "driver=cfi.pflash01,property=old-multiple-chip-handling,value=on",
+                                    "-drive", "file={},if=pflash".format(img)])
         self.emulator.login()
         cmd = "mount | grep 'ubi0:rootfs on / type ubifs'"
         _, exit_code = self.emulator.run(cmd)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

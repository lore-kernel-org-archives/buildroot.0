Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FB2C48260
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 12:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E756064E;
	Sat, 10 Feb 2024 12:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjUfdcK7S6Kc; Sat, 10 Feb 2024 12:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C09260651
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C09260651;
	Sat, 10 Feb 2024 12:26:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9EBF1BF3C6
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 12:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6136405CB
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 12:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6_YoHTUoJ5B for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 12:26:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E9C4401F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E9C4401F3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E9C4401F3
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 12:26:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4938E13F8D5;
 Sat, 10 Feb 2024 13:25:58 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 13:25:52 +0100
Message-ID: <20240210122552.1001346-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707567959;
 bh=A9hTfoR55F6+nU7A+v2QrQwrcpm5Xqe7W8gRfN/+bIU=;
 h=From:To:Cc:Subject:Date:From;
 b=Z91flnQW+HdxyX71e9ujphChStPpXPaSsnAwYxbU0iMeVpGaN6wwjdufgsDquoti6
 rPkLzs9ORSpU1wsrHZvt9jXKDz0LDw7GCqsTEk1XUuMioMHUuA6rLUAEeBO5l3+DqQ
 HXKuw/HUi39ul1mYdrJDsRgfQ1f4nZBD3MFI4X6hYgdsKMq3V5MBzt1m/8gDFL4uTa
 1q9uhDMBJ+sYosmNtrJoXlChcqR3G5e/ZF1bkPpwJ8VYLX+U0M5mhU3Nqgwq1qO8ET
 YeQyLlCcm6lbIKrfS+2ZvBGhrNeg77QU51+T5DtdpI8gjVKR8MiGho+AzMBYeYWAv1
 o/lMAi+HdJCyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Z91flnQW
Subject: [Buildroot] [PATCH 1/1] support/testing: libgpgme: increase gpg key
 generation timeout
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gpg key generation can take longer than the default timeout on a
loaded or slow test host. The commit increase the timeout for the
key generation command to prevent the test to randomly fail.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_libgpgme.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_libgpgme.py b/support/testing/tests/package/test_libgpgme.py
index 28a33bab03..b497891249 100644
--- a/support/testing/tests/package/test_libgpgme.py
+++ b/support/testing/tests/package/test_libgpgme.py
@@ -37,7 +37,7 @@ class TestLibGpgme(infra.basetest.BRTest):
         # We now create our gpg key.
         cmd = "gpg --batch --passphrase ''"
         cmd += f" --quick-generate-key {gpg_userid} default default"
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=30)
 
         # We should now see our key in the list.
         self.assertRunOk(gpgme_listkey)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

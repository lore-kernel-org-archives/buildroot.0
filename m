Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E7FC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2233B42203;
	Wed,  7 Feb 2024 19:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ep7xivCheJf3; Wed,  7 Feb 2024 19:44:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4739642206
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4739642206;
	Wed,  7 Feb 2024 19:44:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 294251BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23B5D42206
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GeBEb_FAKbJr for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:44:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A6C542203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6C542203
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A6C542203
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:44:36 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 335DA13F8A9;
 Wed,  7 Feb 2024 20:44:34 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 20:44:28 +0100
Message-ID: <20240207194428.591147-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707335075;
 bh=hYq+G2vV0vRezNFWVQQFgPvEDgvctzqrhS+cJE2834Q=;
 h=From:To:Cc:Subject:Date:From;
 b=F538V3XPsIFFUPovQawTmlMhJ+FjzkensnymR1xR+h95pBld5TjuNqccDkCpIBAZm
 i9zVTeFrqAc18GxqXjRkuZC6BZ61E2eP+00yLE4xsdlUTRevNlZeabx4DFeIqjccWi
 z6+Fa5Vc7u0TpR9WAvuFtSQh86sb0iMAhCUK1+W+khRYuFpcKh8OUBk0lnu/L5sWn4
 Fj3kCXGFE2Gd+8pAbAUcN8TrRK3AirebUUDnbXrFfZ9lT9vTjtSQ1iopNjKKjMqnPg
 K2Vgtmx1b0q+56g3Rj9fJe1Jrrzr7vVCG/9hzmWbtSZGCLeAR313SlcFZR2rGdJITr
 fgeQ55IoLEUFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F538V3XP
Subject: [Buildroot] [PATCH 1/1] support/testing: gnupg2: increase a timeout
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

The symmetric encryption test can sometimes take longer than the default
timeout. This commit increase the timeout to 10 seconds for that
command.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_gnupg2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
index 4505e1c339..2b18f54fa3 100644
--- a/support/testing/tests/package/test_gnupg2.py
+++ b/support/testing/tests/package/test_gnupg2.py
@@ -37,7 +37,7 @@ class TestGnupg2(infra.basetest.BRTest):
         # Test symmetric encrypt
         cmd = "gpg --batch --symmetric"
         cmd += " --passphrase '{}' {}".format(good_passphrase, plain_file)
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=10)
 
         # Test symmetric decrypt
         cmd = "gpg --batch --decrypt"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

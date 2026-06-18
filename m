Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51066CD98F3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118C74141F;
	Thu, 18 Jun 2026 12:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJfXkh3WNAI5; Thu, 18 Jun 2026 12:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27C9041487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787025;
	bh=NJlCEAxrmd2XuGF77AqIKsC7u5BxsgVm+GEf/+rSdLw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=K/gQb2h7Q2ii+lMt8ElxJlOiMQ87utsS1Xwq9mgAyYim2wUZvI2rXWjww1Yo1T+f5
	 TK2tMvyE3+WPyP83cuzTdMGB9HT2cTKw/0MKqftkP/p5b5Cum71BCDbxYNrlvVqe4z
	 A36yvXBN58aQyVJtQhDdu94ewVvC8MsB9gJixaqXwh7EyYJhxcVR7s5zM2wPgunhW6
	 wy3NFuPYhaFVEplwsNnixYiCpNKKVUYn4dF0Nlq8ZJ6A+/7I18Oxj8+Qvt/GkxnpqX
	 LHj5KXJQvqRI+Oi8iehUNR5efWOrdTUBwdsmTk+h6xBRESobzcZZ6W5Uw/a2irVUiw
	 irTnXaa5NnskA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27C9041487;
	Thu, 18 Jun 2026 12:50:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2181A1F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13AF083C51
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70CYHDrj6ASY for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0951483C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0951483C4F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0951483C4F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 890534671; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBq-0000000CJvD-3gt8;
 Thu, 18 Jun 2026 14:49:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:06 +0200
Message-ID: <20260618124835.2935850-15-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Zzo+Ejj3Hmpf3tqHAJT0o4wzwtmo8tN1ffVfRkJfMb/ZpJY3iCEtIRyx5tSdCUEOO8o4WdOrT9xlux+BdVCoKuOrsMnmJ8L7pY3erwKU6H3SSJ27e68+QXP5Dtfz0djh2sVPx59d5Ux6WJqp+KeUzQnYzvWwNI+ita2G7Gi/FeL6T2x9moyWRbMqDdgBigaw7fqNYMhvIpdPQg14kzGB3Cq64EX1Uf7VWA7Ex/JiLzSc5Jg5C+1tuXaiS3Zl4CzAAJVzH3ka96o9ej23Ld4qJ5f2wbE3tmwkKXT7NyZ0eS4v70XGygD8QlZCm3Ar0FGNyUip48eVkSib4s4ANxVElw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=tJbum1/HK2o20WBHLaZGhwjaW2muA7GpWt5FwExv8IQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Zzo+Ejj3
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 15/29] support/testing: test_kmod.py: use
 assertRunNotOk()
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_kmod.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_kmod.py b/support/testing/tests/package/test_kmod.py
index 3c06589b2b..a88257ef57 100644
--- a/support/testing/tests/package/test_kmod.py
+++ b/support/testing/tests/package/test_kmod.py
@@ -73,8 +73,7 @@ class TestKmod(infra.basetest.BRTest):
         # With this test configuration, we are not supposed to have an
         # eth0 Ethernet interface yet. Attempting to show info on this
         # interface is expected to fail .
-        _, ret = self.emulator.run("ip link show dev eth0")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("ip link show dev eth0")
 
         # We try to load the module.
         self.assertRunOk("modprobe virtio-net")
@@ -101,5 +100,4 @@ class TestKmod(infra.basetest.BRTest):
 
         # Now the driver is unloaded, we should no longer be able to
         # ping the emulator.
-        _, ret = self.emulator.run(ping_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(ping_cmd)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

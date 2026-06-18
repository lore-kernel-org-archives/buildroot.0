Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C28DCD98F3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01CE9414A1;
	Thu, 18 Jun 2026 12:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Arc-b3ejGJSH; Thu, 18 Jun 2026 12:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 057184143B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787028;
	bh=0K4kJ7EqYbHnGEBjT8NTI1bd3YthiZLAgtLGc8Tq6Dw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nvZ/5nmSKKLS7Lcl+mbtFwitqgW4HK7oNYkFdF7ZrocobCxvNYhn2oXtnsGEa5IL4
	 aWjMbiLLZ7xm+vVw+OZlRLOjEc62aQFIqEUTBcJYfg+s937t4qxo+S9JM2SEH+bRtp
	 2LPN466+leX8yAvWm/J0OEk8cZtBip+aa0Ls1oK620NbZpSigyvG/HGKysSu+PFifT
	 8j9qlny5f3/t3TycuLIkKzbKZn9aTUYM++mbIDdSsYJEN4eHUPxVW+bSc33Z9dh9zt
	 NY+h475vDUs165hJPZyVsfQ+lVMWMrhevEcd/19oCE13nag/GsFgZrT3wBXGbfaw4z
	 7EaDSYW7KcRbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 057184143B;
	Thu, 18 Jun 2026 12:50:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ED161F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CBDA40DA7
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBu62KJxBi4e for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37F574063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37F574063F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37F574063F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1696335016; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBr-0000000CJvS-3tWT;
 Thu, 18 Jun 2026 14:49:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:08 +0200
Message-ID: <20260618124835.2935850-17-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PIh9EKW+Ss4yTGWsgxCLC64siDXKiC6HKkOTztRAMPB69SmLR4ihBAVC840qEmaIFjeq3SPwFzwfFUUC79yk8BI0tYgqV1rmamAu44Xy/JJPX9kFcTZTibk/MY6VoafdKjufkcwSwOt6TZ+5LR41vjhaDgSepIseWkQ6U1SY19Qhelq3kFByptopIsnuHQAWibtjnZNllWXYjbAcrgb9CpoYa3VQBMAb7PFZC2ZWWfO3Cev4hupSi2uH1HhmkpZ+2oDh47HbQ434DQpIYwIM7r+SzJs2GybF+1e2SPuvelv33JWMpVT075saXea4G+Sj+uuUIlxDO9JN0CBc0Z46IQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=CqJpehwP/zFu5eEyqztqBgQFybjouEvGQT0AxLqFHUY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=PIh9EKW+
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 17/29] support/testing: test_lsof.py: use
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
 support/testing/tests/package/test_lsof.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_lsof.py b/support/testing/tests/package/test_lsof.py
index b0478dfbb7..336a951549 100644
--- a/support/testing/tests/package/test_lsof.py
+++ b/support/testing/tests/package/test_lsof.py
@@ -28,8 +28,7 @@ class TestLsof(infra.basetest.BRTest):
         self.assertRunOk("lsof")
 
         # Check lsof fails if requested file is not opened
-        _, exit_code = self.emulator.run("lsof {}".format(test_file))
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("lsof {}".format(test_file))
 
         # Open the test file from the shell on descriptor 10
         self.assertRunOk("exec 10> {}".format(test_file))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

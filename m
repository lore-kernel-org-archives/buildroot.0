Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D27CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A09F4177C;
	Thu, 18 Jun 2026 12:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QjBYGzNqFc2; Thu, 18 Jun 2026 12:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ED5341461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787038;
	bh=zjeRm8PfxrhXUl5ZMPg47ihRBGE2rpN9FOJ3J8/7gRs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E3vZdWqyzlJPTK3AQNM9x1WjiTIOfDdUDB9OQixlchNhrKH6h1/sAndyVq6xgpp0p
	 WjlH2A4ZdX0+ptdIsw+/Uq/AeGWDKo7gr1bejcpmiEyUkxqDK8mot/6n18AtoKi8Ka
	 on6Qmqk1+rin86+UxUwyNsxWFn5GUuQuPgInpjnJ1hF2Yh29tOJ7ovR/OaN2VJjDDt
	 jUDtt/bl+lfcwVUeprbfw+TuOZd41zAzYreU0ZFa1a70FSZA05BQlO6BeEVNX/GrSP
	 ZQsIL3e244CfvM0Seq8lMtI8sOtq2mhh+qDyEEQkbSrWvgRXmWehMingErNhP/yZkP
	 Pso+GiKEnwchA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ED5341461;
	Thu, 18 Jun 2026 12:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CD7A131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E85B4063F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DN7mUO3NBYQg for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D619840DA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D619840DA7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D619840DA7
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1906845964; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBv-0000000CJwH-2J2y;
 Thu, 18 Jun 2026 14:49:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:15 +0200
Message-ID: <20260618124835.2935850-24-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=N2wftEKqP4IKRY5Xv04t+WGxiowaGvSZ1R6ijcSeb4TPKbCwasyMwKHyOCRSlN+i+PtLK2hZAWcwpK9obwRVNnQ9DnE0E+46KbuddSsHJZ6o8jyYF9GfBf4UPPQEF3NloK7gebZzOi4LIA88H+KmANmtnlLwc9NAW9hMjQhXD1CUOzOnrOn8/AqrMzDiTWE98LiUV+zFFA/sdxPoJIzCXl1fsEjoTrZarugLAZHNGAOjnePMzuShZ4h7PFEe5HnflDEQJ/GGwMS/7BWCBDYzNZ3MH0u1YkyuusCrsEK9jW4zzQigzGQEC1Pooa2ocetsp9ogx8PjVqomFdRZZxQjxw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=s7w8+H5t4ByJUFO91sOLUMNyOSm67LxVYblhBo9zZgc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=N2wftEKq
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 24/29] support/testing: test_rasdaemon.py: use
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
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_rasdaemon.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_rasdaemon.py b/support/testing/tests/package/test_rasdaemon.py
index ec29f1785b..2ae6fd2c28 100644
--- a/support/testing/tests/package/test_rasdaemon.py
+++ b/support/testing/tests/package/test_rasdaemon.py
@@ -43,5 +43,4 @@ class TestRasdaemon(infra.basetest.BRTest):
         self.assertRunOk("/etc/init.d/S95rasdaemon restart")
         self.assertRunOk("pidof /usr/sbin/rasdaemon")
         self.assertRunOk("/etc/init.d/S95rasdaemon stop")
-        _, ret = self.emulator.run("pidof /usr/sbin/rasdaemon")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("pidof /usr/sbin/rasdaemon")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

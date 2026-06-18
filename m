Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCE2CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DB0414BB;
	Thu, 18 Jun 2026 12:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hG-q10KtUAUB; Thu, 18 Jun 2026 12:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F61414B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787029;
	bh=OETJmTzezHxjWIcjFPIEAETJFZLx082CjWuoX9cp120=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tJiMbbzQvxVfgR1BQcbjh67ielP/aJzYyYlFsXjBkMmCgqE9Mj0FOtthcqd/19YAv
	 VHzHbDeTgivj7Qa0FazfNiSFnpl4X0eRLsOUXv3y3u9GTD5c0jfnU0I42kwx4GGBIv
	 4VOMTeqKxkeXm1xoHRBiOiDDoH/ePgFY9WvE3VHxJO3GD+2mWXLim80sVCoj5U/6v5
	 Paz7Oy/UFWlpub3dR7XBDMzLMcZHNhRrV6FHWFLg3EqZKJiFCoQJnOtGGHwL9jbN9s
	 Fgf5NWxaWfxtKgfd7R/Pl0ItcWC7V33goNgpvU6z35m8QKxfAsYQPbSwVFCUrhM7d6
	 Z9n0nKmZR7ENw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6F61414B3;
	Thu, 18 Jun 2026 12:50:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 415D71F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3398B83C51
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsNOACimK9Ft for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F60383C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F60383C4F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F60383C4F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -962060844; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBs-0000000CJva-1sYe;
 Thu, 18 Jun 2026 14:49:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:09 +0200
Message-ID: <20260618124835.2935850-18-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LlXYauUFOjUM5b61RGu6LEhIoRkhNspf4W6p1tPsx0CFMbufzIN8J/0vQqbMYx1xy9pxPREAefRt0djxj2uBPAIrtSj95XHl+cQ6fXcX9WVRZyRb6kO7U6G4kakOvBj+GCFZ7IJAjAhF6ot4CdR36tuep87gWFBQfxgpJvgzVpJrTHbrr6K62JVIOVmLQHTF92vVfcLIdMLINTD975x1LZPOgr5gBZWSiOe6J7pTb/IIg+hSwznMi/fjHcMvfUogL7mZOLb5y4ENQZIb9kwVqQSqrAAN531iRPj+OTlFUHAmsLCrhXDyBxkBKmkltZtX+G5CS1G4J19T73x1cyyROQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=3WPDQU3aX4hepYAo0rfVZj0tvZuPzo3djb1IrG9luDg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LlXYauUF
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 18/29] support/testing: test_mariadb.py: use
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
 support/testing/tests/package/test_mariadb.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_mariadb.py b/support/testing/tests/package/test_mariadb.py
index 67ae61c3e1..9ffe6aa3b3 100644
--- a/support/testing/tests/package/test_mariadb.py
+++ b/support/testing/tests/package/test_mariadb.py
@@ -179,8 +179,7 @@ class TestMariaDB(infra.basetest.BRTest):
         self.assertRunOk("/etc/init.d/S97mysqld stop")
 
         # Check the server is stopped.
-        _, exit_code = self.emulator.run("mariadb-admin ping")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("mariadb-admin ping")
 
         # Restart the server.
         self.assertRunOk("/etc/init.d/S97mysqld start")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

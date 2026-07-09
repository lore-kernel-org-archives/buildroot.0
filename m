Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753DEC44506
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 11:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E72360F71;
	Thu,  9 Jul 2026 11:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNCwub1EijUC; Thu,  9 Jul 2026 11:15:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7195860F60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783595726;
	bh=O1+s/dB5/Qj8qZQmYG1qTldxKIkCArHKP6ae0X9YWB8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9DFVeDMsSW1XCpsxsaSKvJUuO59kXDtdm5bjlH6+orqaYb7aZjxmAX4G0C24laLa
	 awix+b6ezVHMXESDfifhl1Du+Jtm8oOrlxdfjKxNFHbYUhGAdFsosouNQMMskdJFm6
	 aYL+h/92Rq+eXIU20ix7cm3Edq5i11MO9TZ1b6nBLhWN0CQxrjOT54KhCviLP8OKfN
	 0kjpe17iM0yhWkhOk/BBDpjuVKoyerNY1yWP+3WqHZ+xeHiahYCqhD1X+8LIF7/ZXY
	 GKte0ZxLRhsrFkAsOgxcGy3znA1HbQVNwhfqhN4BSXcqfXdSxpYrE/sTV1ighVtOGy
	 86BFETKeEVqQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7195860F60;
	Thu,  9 Jul 2026 11:15:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EF812E5
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 352C260F60
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqFQ78UIqVFb for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 11:15:24 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DCA160E40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DCA160E40
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DCA160E40
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:15:24 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 9E69ABDE586E;
 Thu, 09 Jul 2026 13:09:15 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Andreas Ziegler <br025@umbiko.net>
Date: Thu,  9 Jul 2026 13:08:15 +0200
Message-ID: <20260709110822.305873-12-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709110822.305873-1-br025@umbiko.net>
References: <20260709110822.305873-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783595356; bh=l/u05lHv9MtbQervM6MQ8F3S8nbAdb+WAPw0nJiipnc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CNu5l1X0JaEn2jlqzntY7LGFVHClGS86ZO3LbZWIYWJTjqTf21YP6f9UhVsTtdxkO
 6NIwl5MKRdYDSjOF+vEUJAh3QaNywckQcXrbH9+/Z4vG3PAdWYTNLEXgccrMt+FPH9
 DnWDCpK7lJBRIgJkKbRIs63csAt+E160O2FY6jws=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=CNu5l1X0
Subject: [Buildroot] [PATCH v2 11/11] DEVELOPERS: add entry for test_mpd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fdfab8b489..4718ac9926 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -199,6 +199,8 @@ F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
 F:	package/mpd/
+F:	support/testing/tests/package/test_mpd/
+F:	support/testing/tests/package/test_mpd.py
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

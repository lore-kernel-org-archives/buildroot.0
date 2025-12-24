Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190CDE7848A
	for <buildroot@archiver.kernel.org>; Wed, 24 Dec 2025 20:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B837160ACE;
	Wed, 24 Dec 2025 20:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ek-DWT61IozZ; Wed, 24 Dec 2025 20:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E749A60ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766606600;
	bh=cK0LJvuLJ2aGRzlVyroQjvWFrpv3vMoDOzoVX7CP81I=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oPBg286mpswav48HTUEiIMaRGHmD9q/FlEMEFFc6Q7JoJLYZzPLU8y54+0jMZIOOi
	 3lDuLzKcvNcmCRnoTjPBBCJZzLm436spLw+4o4c7e2jRupp6hjJ5MYM09NJmN/Cqse
	 Xwl4miFOkYwkAGIOadoDuPPMlfTJcmXB3hMDEkWx9wloBWMUuEow9rfcBl5X+Uh0OH
	 JVHelOrQCTxIjI8sv6mEMFsUh9HeeqG0jptU6SU511/kiFq95Rv82szLa9IguSJ1Lp
	 moqd6rxY8OPoUDxhuB8zfmDIQlql0/nGcY3tpe55GzS/hW7CKk0MQip4dr2UqLA+W0
	 o+lmH5mubhM5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E749A60ADA;
	Wed, 24 Dec 2025 20:03:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E158B9
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 20:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F7D24006D
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 20:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TM3DNRQSIcr4 for <buildroot@buildroot.org>;
 Wed, 24 Dec 2025 20:03:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 814BF40057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 814BF40057
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 814BF40057
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 20:03:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id YV4iv9eY2fibdYV4jvd4pP; Wed, 24 Dec 2025 21:03:13 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 24 Dec 2025 20:59:35 +0100
Message-ID: <20251224195935.4089179-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251224195935.4089179-1-giulio.benetti@benettiengineering.com>
References: <20251224195935.4089179-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBwIdDfJtKrio8polVVXFoV8VFmCxhfCY9vDsbqoyQtwECKwsZ07bQiaacEyEMtujp4cVD5qFr+sfpELp8rZZt/XBRFw23rUw9RtyUK5fsaSSzh1fcJ6
 iUvWvgdZX0XpD/9I4ARqFZ8Zve9f2389nz+rCf9UWGYo9I0eUgVLfeP/Wm3eLiQJp3Wo9fzddKgmZbUk8a3XKTnGgkyAvN52SlWtZFTl/1ryNq5Opa0MHV6N
 V2wDd4v0TZMHegBFP0PJa0SX2Ba90NVZ1BLnRnKB/78=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766606593; bh=kXOP8AYYlDnTOAircoySDs+UuYOsJ7anZ++lVSOLG6M=;
 h=From:To:Subject:Date:MIME-Version;
 b=AFvK1nk1EpqclbXCSQ8p/lY05i6SCZYLSBpWpHZ2vn5ot/rRvuCGbdKotuTzSYfzG
 DU4ewiMBL1OHl6nL5CaZxyh2JDKCllcb8AmI9MDAiYGTaQFMlvD3Ul6y4ExjCEjCCI
 Hp2GMSD53id7sEmWlXZNMaQ3KueZ+2P//uIwcQdCFMF0tpj1fyKxKP4KNrfA8HQaHB
 L+cfx4zsvAtaXkX5lapYJOlw5t5LuWXVQPwE0CIp8JoRUyaw9q+14yjmYdZyWPet0o
 7lEWIrUZA1V/OMZVcGjeSk/D7nN+9SB/C3dhYsZmqwtuSAgMXohhIWAHk8TlMDZpi3
 KrAem2cG9QGRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=AFvK1nk1
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package
 util-linux
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d576fe9c61..d39e8ab30f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1334,6 +1334,7 @@ F:	package/swugenerator/
 F:	package/swupdate/
 F:	package/trace-cmd/
 F:	package/udisks/
+F:	package/util-linux/
 F:	package/vim/
 F:	package/wilc-driver/
 F:	package/zlib-ng/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

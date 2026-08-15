Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3514C5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8578780E4E;
	Sat, 15 Aug 2026 22:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMB2oA31_MvG; Sat, 15 Aug 2026 22:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AFAC80DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786831229;
	bh=Rv7eyFgWdkpHjzUKoEIZFkgWmE2PBbYI4xrW4pKK0tQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=USpsu5djRQvgDQ8o0sfDErK9f7na/LkAsPI6dChJoRA3SoIKc0iJU5ohCcTKHVwn8
	 Gvtu7qG8RKguRmEvPSRQbPD9KeqcF+7seQAJy9AvttTCYLn4zR61oP4S1grl+QbAq0
	 UReHOK6kGVyiECBlYt7dgOBZhtXdrm6fggdgzRJ5VtFkFVTvk+R/oTHdMH1gIANxFd
	 AzsTwP+5WpNLjEJ5laXaq9MQMtWLXSjjBATT1hLmA4TofByQkt8sAxOQKyfvq68K2D
	 569pC5J6HdBps8oROr8zcQQem3BrWZlnf8a3k9oxv7MXNmuR2FiR0CrkajPt8CcA9s
	 ldKQTOWeKADFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AFAC80DFA;
	Sat, 15 Aug 2026 22:00:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77EE8336
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E636400E6
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KksG92xy70ps for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 22:00:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.53;
 helo=smtpcmd0653.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC151400D1
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC151400D1
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=NzpLgj6A
Received: from smtpcmd0653.aruba.it (smtpcmd0653.aruba.it [62.149.156.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC151400D1
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:00:26 +0000 (UTC)
Received: from localhost.localdomain ([93.138.165.36])
 by Aruba SMTP with ESMTPSA
 id vMJYwZqtOdarQvMJZwNswx; Sat, 15 Aug 2026 23:53:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1786830797; bh=aFVl7NZ2pwNTXE7NB018/k8OQJuc10LGQcacOVGdkpA=;
 h=From:To:Subject:Date:MIME-Version;
 b=NzpLgj6AJv6fpQKTPs20TR07lb3dZOjeAIC+1vmcrGYswznddXPilCp1U9XbE/qtd
 IeGDv4DyxM2Ps6vHtU+B3HRDamuqWp6LcwcgSTs8sZ+TGFTNJ5VuvidszMFgpO7Alb
 5DQhIbPw3WbE/tI7xCodqxvWGw3jVdhjwL9YtLLdwdqEUNy3K7kdPDE3OlC8QLcUVl
 jLJHgA7E2UhERWTacrXsv07KQrbxzHpRfbNN4cy4pmwa97h91OvmKfs00XIWljtx/q
 4YbxuO2L+yvc/LhZd7sga47O3SqGZl6HXWe+In39TqYtjM362GFswEVaKRj+U/fvlc
 C98zAXg6zTOcQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 15 Aug 2026 23:53:14 +0200
Message-ID: <20260815215314.929324-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKM2OtAXlkIk98klj1w6ZZsbvZWwpm33n+/FcZzuUT818GNS2IbehDOzaDWV7aFzFk/A2wTKfPLyhavcQ1D0AkVvdapBYPGzOTIk7jUyCMFwHz1tw29t
 HPqhowR7CM6x18J3f1SUo3DlAtHrz0fGxE/1jUwLTDlH9xT8+VMXcSyq/e1ji3GOjzvHBiM2dm/CpInSDc2olgSocysqONIuQbi5ybjV7kYxeIoj9C/LawI1
 utWqllbIQ+9kwm5PQ64hnFgkh3sbHz8AYYRdmo0cV5FrpTxk2dmGi3MrCP8Lsn1r
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.7
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

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.7/docs/v2.8.7-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index dada277347..c6ce35a52b 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  8004265fd993885d08f7b633dbe056851de1a210307613a4ebddc743fccefe5a  cryptsetup-2.8.6.tar.xz
+sha256  e776f0d381e86ca61042c457069491fe8e0ac286780c7c3b1e4f9921abc961da  cryptsetup-2.8.7.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 758d8ef403..28b9927e4a 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).7
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

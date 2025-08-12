Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8B4CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 07:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CA541E51;
	Tue, 12 Aug 2025 07:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0NjHxYjomYN; Tue, 12 Aug 2025 07:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4866A41EB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4866A41EB9;
	Tue, 12 Aug 2025 07:48:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58957B8B
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A1B1840E6
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gD97XGunOSHi for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 07:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46EAF83FFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46EAF83FFE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46EAF83FFE
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:48:01 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 846547815; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 12 Aug 2025 07:36:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uljYt-008h48-1q;
 Tue, 12 Aug 2025 09:36:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 09:36:43 +0200
Message-Id: <20250812073645.2072147-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AGQulO1LFvrUJDvCQ6TKGgjeel49VM00FQvclh7BTpIHAFZ7FWEV4LCN/stTPKSVbke4K065++spMbKYTSnlhkCyRZw6UqqCsAj0BYGiWxuiyasVdlQSpITSbezx6kfoUu7YnkVBHE1Vg9R++ywMLBM5xo1QJJPp12fqAbfOAnkkQq+l7FTeeapWnit7UG0xeRAiBO68sM8fvmynkb22TqIdjza8pi0fmRsmJC3c3iz2tRrsP4AvtafvfUVSTyDsGPJETvd+UMf04NfJ4G3tDVI5pMQqXoV/sb/C2tC+I/i3E0SRpFvL7EqzuTcvpsJGeLIEwHnEl7Z5RBBWGvA5yA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ZusXbIs0D87TT8IONb5CkuFPOM8Zl9UWdCQHwwEtTRA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=AGQulO1L
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 1/3] Makefile: release: make manual build
 reproducible
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

The manual contains build timestamps like:

Buildroot 2025.08-rc1 manual generated on 2025-08-12 06:43:37 UTC

Making it not reproducible.  Luckily asciidoc respects SOURCE_DATE_EPOCH, so
use that to use the timestamp of the latest git commit instead.

Notice: The release and manual targets are marked as noconfig targets (and
need to stay like that for make release), so we cannot use the
BR2_REPRODUCIBLE logic.  Instead manually set SOURCE_DATE_EPOCH.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 203d90510d..33e8563e93 100644
--- a/Makefile
+++ b/Makefile
@@ -1250,7 +1250,8 @@ release: OUT = buildroot-$(BR2_VERSION)
 # documentation to the git output
 release:
 	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
-	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
+	SOURCE_DATE_EPOCH=$$(git log -1 --format=%at 2> /dev/null) \
+		$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
 	$(MAKE) O=$(OUT) distclean
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

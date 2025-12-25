Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA19E7AD67
	for <buildroot@archiver.kernel.org>; Thu, 25 Dec 2025 21:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 652A081149;
	Thu, 25 Dec 2025 21:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIenxu225bor; Thu, 25 Dec 2025 21:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E80518113A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766698313;
	bh=JOBzGqD6guTsADN+85KuSh8/LxLbpZlNABh1lFdrxkQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VbrUwivurdnsZsk0XQgBx68I4+PMVASYLN0UiuKC/eIPzbDVQqQGnmK7FDxuM/PMl
	 QbZHACVUF96yuAt4REtVK1TswwGWbVEddDcbNk196VJwNHYfjnbhuSZ1CU2yQmcyQ+
	 IqbxX8Lxf7BZLTgNb4mjZRhQBNpZU40++xlq5cLl0DOI3wiaPM1i1HJSoQMc4km/Dq
	 AHCqo8EK9LPFgSyNFOTQsWfaKSM4M32NKahV/gufx/h1e3RvIjdx2FI1CIw8EdRhrn
	 nbHEBAAh2iio31iNH6jxHjTMIrPyVCgRhlzDaMjtbjCe/g4ToVrbU4EolR/trJnKQI
	 +9jUWqkrD6jpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E80518113A;
	Thu, 25 Dec 2025 21:31:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8346B9
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF5B840193
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MJcwfRCqqNe for <buildroot@buildroot.org>;
 Thu, 25 Dec 2025 21:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB8E040129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8E040129
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB8E040129
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:31:47 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id YsvwvMgiqlZ8PYsvxvqCPG; Thu, 25 Dec 2025 22:31:45 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 25 Dec 2025 22:19:06 +0100
Message-ID: <20251225211907.2300253-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGtI0p30RMH177z0c8Kvf7rO1FqpEkgK+nFvfpiVx9knR/GsYRB+2+5hmMlO2tJd2x+B/YxH8+yQwAdMA+wbj1w7mcGP3fbdITxCCwFurojlELpPt0Sv
 3ik0/MGtZzZtF1gf8xp1WDwEpFhkeACNz9AMCS2Sm4ekboe/D+CwrJsSaMVoHSyFT1EiEhRn47TOZKes6ETUibssYK4zaQTgoCSpZjPfHt6liCRowmJW2b7J
 gcfcqsH6WW9A8K/PWQtS4EWuDBfKmf8L0BR/8scL8r8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766698305; bh=FuSk1Z+0EvtQkZa+rU04+MISujVNPVqQ6Ym1gFkcm10=;
 h=From:To:Subject:Date:MIME-Version;
 b=DASRmOLJ8HoB26cJVYCkEFZxhK+6PndWJPO8UdqX6skK8bbRmvBbT/y17xHrAyBd+
 0xO3D23Ok1aBrRKIGtqElSMj+GXPtCV+NFJdaColGdUvibmeT19m4pJcRX+XmjrwN6
 AfEfJb7gEE2riVpZQlpYrco49dYf7nebm3g1874uXG4Te4hGGzWHDHgAjrvUmzw8dw
 a1fKciVYe9BVStfQYC4Cls2v7hI/iHz04tdZ7ofgI394PbNDmhK7Xj+L5F+SzvS8tf
 MJCXApNieGKvImzDdIQeN+QlsX+p7IawA/H3C/KcHf3la2O7cpg9aa4jrhLWuAnJ7x
 PYrx14kI9EWdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DASRmOLJ
Subject: [Buildroot] [PATCH 1/2] package/tmux: bump to version 3.6a
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

Changes: https://github.com/tmux/tmux/blob/3.6a/CHANGES
Release Notes: https://github.com/tmux/tmux/issues/4745

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...rnings-on-32-bit-architectures.-GitH.patch | 28 -------------------
 package/tmux/tmux.hash                        |  2 +-
 package/tmux/tmux.mk                          |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch

diff --git a/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch b/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch
deleted file mode 100644
index e9cd9d5acc..0000000000
--- a/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f812b8d30456c071ee23e9a02d6ce16036fd3f68 Mon Sep 17 00:00:00 2001
-From: Nicholas Marriott <nicholas.marriott@gmail.com>
-Date: Wed, 29 Oct 2025 08:47:45 +0000
-Subject: [PATCH] Cast to avoid warnings on 32-bit architectures. GitHub issue
- 4597.
-
-Upstream: https://github.com/tmux/tmux/commit/f812b8d30456c071ee23e9a02d6ce16036fd3f68
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- compat/utf8proc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/compat/utf8proc.c b/compat/utf8proc.c
-index dd4ab27f..147da696 100644
---- a/compat/utf8proc.c
-+++ b/compat/utf8proc.c
-@@ -48,7 +48,7 @@ utf8proc_mbtowc(wchar_t *pwc, const char *s, size_t n)
- 	 * *pwc == -1 indicates invalid codepoint
- 	 * slen < 0 indicates an error
- 	 */
--	slen = utf8proc_iterate(s, n, pwc);
-+	slen = utf8proc_iterate(s, n, (utf8proc_int32_t*)pwc);
- 	if (*pwc == (wchar_t)-1 || slen < 0)
- 		return (-1);
- 	return (slen);
--- 
-2.47.3
-
diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index c4eb508d78..867fbd6c55 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  16216bd0877170dfcc64157085ba9013610b12b082548c7c9542cc0103198951  tmux-3.5a.tar.gz
+sha256  b6d8d9c76585db8ef5fa00d4931902fa4b8cbe8166f528f44fc403961a3f3759  tmux-3.6a.tar.gz
 sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 4cceeabfc5..1f98cad706 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 3.5a
+TMUX_VERSION = 3.6a
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

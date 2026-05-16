Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9495CD4F3C
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 20:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C76141E62;
	Sat, 16 May 2026 20:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VTOVMyYjYTb; Sat, 16 May 2026 20:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8582B41D7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778962030;
	bh=2cMjiLFNPfVC283Efpt4ZZh+geFU1gPvVqye8l0LPp8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s4CmrqhqiOLu7lbQ9I5QO+zUtusV8y6ek4tRyvoZ+hJzpZzutoU4aa+GJnYuG77D7
	 ljHowmcmmAGloZPbF84JYyGxtJRNZyqANLj76FbwGfHUex6h8OscrKHAIiZmr8DwHF
	 /sWrwxRAoraeZJTK3dJv0xy2mAJs8J+J5SiyHHhF4nHiWt8xJadENRZOH3l3UXhdmh
	 kTZErbF9InE0mI0Q393NwGm6omi32230L2Sk/MPJ2hG9cneeGNt12TDV2a3i2hvZcg
	 0lIXVKigmRwS7tFI6w2oweDZmmcrsOpQZvPRhX8NWwZcO8E1/ufh+voY4RopZF3umH
	 trZ5EBtHCrYsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8582B41D7B;
	Sat, 16 May 2026 20:07:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E341E206
 for <buildroot@buildroot.org>; Sat, 16 May 2026 20:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E034885144
 for <buildroot@buildroot.org>; Sat, 16 May 2026 20:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBfLTNXDp3E9 for <buildroot@buildroot.org>;
 Sat, 16 May 2026 20:07:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D04BC85143
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D04BC85143
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D04BC85143
 for <buildroot@buildroot.org>; Sat, 16 May 2026 20:07:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id OLHtwkU3xJWrEOLHuwQPuc; Sat, 16 May 2026 22:07:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Sat, 16 May 2026 22:06:08 +0200
Message-ID: <20260516200608.345615-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfALK2o8JWz4eOswKCE0whMyA53T1YJCDoA5mv7hG44qBYA6xuyWIKjd9EJPbQf4Bd9FDfEGkBKIFFefwacbrp5ywtvFWLlhvhmOvu8JGlxVozLva+GAa
 4K8CayiDWL7+BaM2dXHQjVCiTDdNS+p5HGlGwO4N/bHmliYFgvTWbT7KJy4771FBHlBpaWr8i2og9eIjpD0dXXIHTduHhhMMtzKju+bFufiGJg9mRo2IHQ9e
 gOlcHAuNd0ZSpSKRYG/473KgM2jadKMnIPJkiza2kdNDTXYVHN2SfudDL1x6JFkm25+UFTJXKhwX5hVfddklqQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1778962026; bh=pgS+nIdUApuuUWlyA08MFzrEjr9zgL6F8vyXARsfPlU=;
 h=From:To:Subject:Date:MIME-Version;
 b=JmV3sD4bwgSfbGDjF8G2WFho2iHmz7VsmQlYA7a1fhTNqV7nR1yiv2HlTcCARQn94
 JEort5DWzA5U93a77lVHl/Tc3y6wvVsc5RO6CRdmwVc42T+NqiWIeXp13J6qRDMUN1
 t1/zBjkR+9fZ2F4VWn7keAsrQQA7dO9JsfI8eDuuXpIEUC0WA8BLQArI920lbxZwMn
 kp/aZObyDfGbD1VPaavQspuzQVJfJiFU9w/0gvbLk0M9Y2blpnpY1vLXn2hdrvy1k5
 2dLUYjcwgRqaNxW+xnl1esyPoASwkWxjDz7oL8YjE92FzO9yQKaWeZdL6q2yDLE1FQ
 a2pJOLweXB8yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=JmV3sD4b
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.124
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
https://hg-edge.mozilla.org/projects/nss/file/4b5e60e1b567c823a2a9c3a218d7122868d3c4fb/doc/rst/releases/nss_3_124.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 0f5ec9c8ee..4d08187fcb 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_1_RTM/src/SHA256SUMS
-sha256  42065a3ff780a9710a3dddcd1cee9b9be2aa40628883cea851d562eb58b178b0  nss-3.123.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_124_RTM/src/SHA256SUMS
+sha256  80da9f1cbcb267293b2248818d288bc02f874d6a34f1989a2828401d74a0bc9b  nss-3.124.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 3426995368..86d2fcd41c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.123.1
+LIBNSS_VERSION = 3.124
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

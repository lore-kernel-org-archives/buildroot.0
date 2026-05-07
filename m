Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B179CD3439
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 13:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0EEC60A5B;
	Thu,  7 May 2026 13:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUniyLWyWuuG; Thu,  7 May 2026 13:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D740160AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778162106;
	bh=AOl6qwpK5EtlQrP0EIOQlae6felKCIh0+jLaJWNVEDY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=V0wtC7LhaFP3dNiKukODhWCpaMMswpuPdGzuYLHDi1bP7nLxvVILTcs8iXtxSk111
	 8oJHEwshixL7nPlf3bWhONLxKOPZk81Vz+E8zfZdzvA88FdDh08fw8qCBCE4dKD8Sn
	 6aq2zbNa+39H5emtk/go5mWk4PR2dFDgo/bvXtPZne71fN1M4OQeMbbLWjpA7RG/3c
	 Lg0NEV8X1ZXuiGZVEV56oX2vRF+q49xBqBnIkFBVTt26FxkzUnkhyHrIyZOqwVaVuS
	 l3nOxpgumlH78ZT9zKGpUmL4MkCdcxAcTI6d55sGgnd87c7y1X/tiaOS3mxiTYIT4F
	 s3KMnXic9iMSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D740160AAF;
	Thu,  7 May 2026 13:55:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD24D317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 13:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C317E407CE
 for <buildroot@buildroot.org>; Thu,  7 May 2026 13:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SNUjH4dm3tg for <buildroot@buildroot.org>;
 Thu,  7 May 2026 13:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B185407B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B185407B6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B185407B6
 for <buildroot@buildroot.org>; Thu,  7 May 2026 13:55:02 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3D1522C82961;
 Thu, 07 May 2026 15:55:00 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  7 May 2026 15:54:53 +0200
Message-ID: <20260507135455.980874-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778162100; bh=mylkNDTXYgeAXlRi5TmI5ieZt22rF/ir8fkL4jupdPw=;
 h=From:To:Cc:Subject:Date;
 b=uagxH8JIEsyNzdVQPgfs5M/NQKQuek0IrOhi3d1IXJ6ZzFOUqxT3LoLLabC+Nphio
 a3CYevfzgFUiqTScynrbCLmkOMbUqQsV9z4deyYPR+hBZWTE5hFGAV8MQZne1RRxFJ
 +W12cholpebwhgpF2e6zKDSXAALLJpkjSiKoFsn/LKwqRkVAKyeX0D52opcKqRMjAk
 59KYwqba3j6lrdBTyFwp+IfWKP2pdkkxBWZSE+r0zZYbcl75UePalX/FOVpe9ByQaX
 Oc7fzWsgDRKz58wveiwr5RLvKqepfiVXRw3C06ZhHJr0MckGvB1gekqIyd1Mj5soyZ
 6flAt9IXzNC7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=uagxH8JI
Subject: [Buildroot] [PATCH 2025.02.x] package/util-linux: fix loopdev
 nofollow patch
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

eeb65cf0f6753da6bc53197b971aec12ba647026 manually backported upstream
util-linux security fix (util-linux: 5e390467b26a3cf3fecc04e1a0d482dff3162fc4)
but didn't account for ul_canonicalize_path being named just canonicalize_path
in 2.40.x. Use the upstream backported patch from the 2.40.x maintenance
branch instead.

Fixes: eeb65cf0f6753da6bc53197b971aec12ba647026

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../util-linux/0006-add-loopdev-fl-nofollow.patch | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/util-linux/0006-add-loopdev-fl-nofollow.patch b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
index 21b1e2596c..15e92fa61e 100644
--- a/package/util-linux/0006-add-loopdev-fl-nofollow.patch
+++ b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
@@ -1,4 +1,4 @@
-From 5e390467b26a3cf3fecc04e1a0d482dff3162fc4 Mon Sep 17 00:00:00 2001
+From 0000ca30646d03f9dfbab9f62a5ce21a939c1018 Mon Sep 17 00:00:00 2001
 From: Karel Zak <kzak@redhat.com>
 Date: Thu, 19 Feb 2026 13:59:46 +0100
 Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks
@@ -47,9 +47,8 @@ Addresses: https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4
 Signed-off-by: Karel Zak <kzak@redhat.com>
 
 CVE: CVE-2026-27456
-Upstream: https://github.com/util-linux/util-linux/commit/5e390467b26a3cf3fecc04e1a0d482dff3162fc4
-[Titouan: Adapt patch to apply cleanly onto util-linux 2.40]
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+Upstream: https://github.com/util-linux/util-linux/commit/0000ca30646d03f9dfbab9f62a5ce21a939c1018
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
 ---
  include/loopdev.h           | 3 ++-
  lib/loopdev.c               | 7 ++++++-
@@ -57,7 +56,7 @@ Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
  3 files changed, 10 insertions(+), 3 deletions(-)
 
 diff --git a/include/loopdev.h b/include/loopdev.h
-index d10bf7f37..0f85dd254 100644
+index d10bf7f3765..0f85dd25456 100644
 --- a/include/loopdev.h
 +++ b/include/loopdev.h
 @@ -139,7 +139,8 @@ enum {
@@ -71,7 +70,7 @@ index d10bf7f37..0f85dd254 100644
  
  /*
 diff --git a/lib/loopdev.c b/lib/loopdev.c
-index c72fb2c40..3d2274693 100644
+index c72fb2c404b..28fb489e402 100644
 --- a/lib/loopdev.c
 +++ b/lib/loopdev.c
 @@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc, const char *filename)
@@ -82,7 +81,7 @@ index c72fb2c40..3d2274693 100644
 +	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
 +		lc->filename = strdup(filename);
 +	else
-+		lc->filename = ul_canonicalize_path(filename);
++		lc->filename = canonicalize_path(filename);
  	if (!lc->filename)
  		return -errno;
  
@@ -96,7 +95,7 @@ index c72fb2c40..3d2274693 100644
  	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
  		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
 diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
-index 597b9339a..4df1915a6 100644
+index 597b9339ac0..4df1915a619 100644
 --- a/libmount/src/hook_loopdev.c
 +++ b/libmount/src/hook_loopdev.c
 @@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DE1C61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43BA0405CC;
	Wed, 26 Aug 2026 12:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyNNFxQgLjYt; Wed, 26 Aug 2026 12:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747825;
	bh=EXE0Es09r/QY9oRJvmCWnXewOCGsKWaJGP+TFE6SBEc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=plbUDSqri9Kq+Ai3XkhjM/aVVzSQS8GlhesbqSUCNQmAdSnPFEgIAmNKWWecJzJHh
	 axCFi/boYG23fnWrIp5xbeGAfeBDczp74u/ktnRg5lfApO3yt8wjQfRRN93B9uteGS
	 NP7BBpEJxnTYuTQLHCDQNrKj7mPrHZdEBofNFMFJNxXn+4jIV1YHSm9T02NudiRIRM
	 JjtE5NRTPdNW+9wq4linh5iqxuqetMku/8Pf97hIN4G0Fv+YFomnajJkUZYx1ECXOW
	 io4+3c6Nma/ZKG0uzS5sEhKp2Cn4lb2FtpfIkK3gRPjy/tV2x0h/NYICrYOhcTy5kn
	 5HPQ9xoWXGNmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4807C40693;
	Wed, 26 Aug 2026 12:37:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC0F472
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1CD74005F
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOAvHFChHieR for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9106400AF
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:55 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6a422090b2fso1241966a12.0
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747813; x=1788352613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VKxODdGCV76sR8BUNfzJxsx8OLu8eD0QsM4FGLpUVw0=;
 b=a6B4lr2gQZlfExE/FtAG4zcHMtuwfNaXMTrlXGmsnNhoS4iYpmKs4zIu+VG8oUvHMC
 ryyqH9Ud0jw5gONu5WAMdP8TfJ45jFjHKNTf38WA84DRWAc77I831aEevZx6bpTL8F4e
 WebbP04Pj5PzlX7EEKV9pIe2BWwgzVYpUfxNW61HM2LOLUVoSmjUNerZTCTUCBWnwMx7
 5RfZWPQ+2Y5xtH1OfmnsvgS6j6WRiOaLaNiyhYbF8yeAIgBgLtHMMY+gRbjYc36M3hYD
 xNMAmOjCYs1MxZ+5bFENnWSTA/gRa4wQyhRCQUc94kQCxMbjgGjuRrB2xa+xRd0bkvH7
 aOuQ==
X-Gm-Message-State: AFuF++mGzN+4i32avKXKoUe3YQq7iIW8W3VNPKx0scCFPj75rUQN74ug
 nUxzA/MuSU5eWTrSgZU5zKGyu01oI7l9FxtqcAz5al7tpgnvN8pof1W/c+dEvit90j4/YS8CEY8
 Zb8G7res=
X-Gm-Gg: AR+sD13o/oqRX/6myN/bYHw0iykIsL1iustDLR87++VtwJ6ogl0HVlrtqKTpcFvMZWM
 d878FR6A8xtKbWXKO/E+xSRUtfEKLgZYPu2c4BLX1qOhzvp+NPbMfzKA+RV8rWN8LUOmNyb5auX
 1MZF3pKY2HiPU+u5Bsy7WmOYfMZUKTGdHoryjY7Z0rypMyh6HEYJtu8xv68t7u4b+6ZkP00A05c
 iEf1veV5qIe7fEi0L1KSEi3sFwaGpNeKLw9wSD5tAxpbSAXGwy+nllDSa69Cl+JpBGL2ses0Oky
 0nhkFJMnjrTBYnfqrUAjXReNPPpBTgPzAbvbzNxtxNkRBECnZGmdqudv6tYSfD0EtMgb+si5/Lv
 9eIqtZsk1QWacp+LCMpA5BV/5EDhP0Iz/E+qG/HynfPYxQSc1bu/nm/Z58dqbPigLy7dExa84WS
 0jFBfKHROwhSNl7KqGOP7TB7PgLYXuRSwL3FvcqRgR1fr8G+4r0zg/hHyOX+WeAbvgYezn326GX
 X/1
X-Received: by 2002:a05:6402:234d:b0:6a3:f47c:969 with SMTP id
 4fb4d7f45d1cf-6a5df5b0e3bmr9248117a12.3.1787747813559; 
 Wed, 26 Aug 2026 05:36:53 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:28 +0200
Message-ID: <20260826123637.410258-8-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 07/16] package/clamav: add patch
 for CVE-2026-20214
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...av-fix-fsg-section-loop-underflow-51.patch | 40 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 package/clamav/0006-libclamav-fix-fsg-section-loop-underflow-51.patch

diff --git a/package/clamav/0006-libclamav-fix-fsg-section-loop-underflow-51.patch b/package/clamav/0006-libclamav-fix-fsg-section-loop-underflow-51.patch
new file mode 100644
index 0000000000..e7561b47cd
--- /dev/null
+++ b/package/clamav/0006-libclamav-fix-fsg-section-loop-underflow-51.patch
@@ -0,0 +1,40 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Wed, 17 Jun 2026 09:25:13 -0400
+Subject: Libclamav: fix FSG section loop underflow (#51)
+
+A malformed FSG sample can leave the recovered section count at
+zero in the v1.31 unpacker path. The code then allocates space for
+one section entry but initializes recovered RVAs with a loop bound
+that underflows, causing an out-of-bounds write past the end of the
+sections array.
+
+Fix the loop bound by iterating while t is strictly less than the
+section count. This preserves the intended behavior for valid
+nonzero counts and correctly performs zero iterations when no
+original sections were recovered.
+
+Credit: Trail of Bits, in collaboration with Anthropic
+
+CLAM-2966
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/042bc35d0a89d6658de30ebc8494b3532e73dcc8
+CVE: CVE-2026-20214
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/pe.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libclamav/pe.c b/libclamav/pe.c
+index 23f4c4ae0d..c894ec7ca8 100644
+--- a/libclamav/pe.c
++++ b/libclamav/pe.c
+@@ -3753,7 +3753,7 @@ int cli_scanpe(cli_ctx *ctx)
+         }
+ 
+         sections[0].rva = newedi;
+-        for (t = 0; t <= (uint32_t)sectcnt - 1; t++)
++        for (t = 0; t < (uint32_t)sectcnt; t++)
+             sections[t + 1].rva = (((support[t * 2] | (support[t * 2 + 1] << 8)) - 2) << 12) - EC32(peinfo->pe_opt.opt32.ImageBase);
+ 
+         if (!peinfo->sections[i + 1].rsz || !(src = fmap_need_off_once(map, peinfo->sections[i + 1].raw, ssize))) {
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 67042efeb8..1a464a8326 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -39,6 +39,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20213
 # 0005-libclamav-enforce-installshield-extraction-limits-55.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20216
 
+# 0006-libclamav-fix-fsg-section-loop-underflow-51.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20214
+
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

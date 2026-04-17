Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6BEF43695
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 12:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9222060DCB;
	Fri, 17 Apr 2026 12:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QKFuSL6xQNG; Fri, 17 Apr 2026 12:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A76460DAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776427611;
	bh=F5bslr2VMalqzchaRbZBCqwjr46amdYDBVT5TSDJbfQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=nV/YNmhN7jttwWbNfiies3GDjU2uQl6OinB41XUd1jDflhYW3qfhZli4G4143I3At
	 BgMEnBvBPhliqJp2gXHe+ddXOcu9gHlZKpRpoMQMNmeOVPbS3xHZUIJDD97s2n98ub
	 ZlDqKeBa3VFTAGuZ5AXKDsXz3jIm3RmauIw8iaRXB6AYJrDqNWNO2Rg93qu8j5jIua
	 ZzauWTw/GMeHl/scOUVPlLwNtws0AVqPpvH9IpBUiWScPH3VIuzFHk1EVxOcZa5Wog
	 AukFnL1MZ1iL0LfWTS0E2yhMDRytfUAl24FeAblKkMM43D8XCjtoeXIF3msV2a6664
	 JSPRGsXs0c/5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A76460DAD;
	Fri, 17 Apr 2026 12:06:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B3DC396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 12:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FFCA60DAD
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 12:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3TiyEcXc01V for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 12:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 549BF60766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 549BF60766
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 549BF60766
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 12:06:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43eb012ac4fso380318f8f.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 05:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776427605; x=1777032405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=72KJMHJsa1XZ0qrS593TYLuNljAFLWrZg1YbrQEhuec=;
 b=a1BD7RQyGJzGlcp+R09gB8wLGF0CHO7BoP6OjNhdX5hUye/OkGngUHmQirKFCiquGQ
 8jsqIgOh94wAlOapGxqb7WbOBNCZmwkD0LxL055BP6PVNLOz9CPExYxvKTTFBG+mwq5+
 1B8L9MHZuFBUzDGyeGvsOEaJpsIIFP/yKaHBTSnGEKLZGCdhwV0aHKyO52OJ2M2V3VRk
 F7z2Dl3hKFkGnfZlj91d2XozclQZQBX0v3Nmd8lQ8rge45Ca3Q3vY4EwFSn/L1L7d8V4
 xFGzNqbTvlz5a+mg3lvXCmluuaqDoi1FmuJ3iEMxicGvy3v3x0mvhX592BNk45tkgjOA
 i1Yg==
X-Gm-Message-State: AOJu0YweUiwIusUzOQQAmUR3vKLNQWP8xZ+Lo7/+30QYm06j33OiU6Ad
 O6MmZDZQLz5iLYwYidhRl6yM6Ybl5Fi2Mula1E/NqGP196nz+ks3N1a8L3UgqonRscQgboEHtAl
 bY24p
X-Gm-Gg: AeBDievaTg3fgP3yQ19Xmm1VP9HhgeT9pdoXH+R5UugmyfeY+t7qWRSA5M7ejilbqFd
 c+yc4NANPtNp68y9osXaIhpqgdcUWYB5WA+loGxLs8cS+KOxt5z4CntyQ5NUxLeIcHN/7Xvt8Cp
 /tm0pLvwKgAVPnnoNooRK125vAwpNgsfAI6zouGTZiR1wqIMoC5JFEDfDq7WRr+F226dkldZmZ3
 2OTU8DQNcXfJwJImKZsuyLHlzDa72BHz03s/IZD1ReJm+uo4NKLSAyi1DHmZjqId/foK8P28coO
 qrmz45gXuiX3VyoFu0YFrIvcpnEMpDNCXxP585nC7TKk8DEHSQmJyAGoe9GJnus9Jp2IUwIFDqj
 CRRDo6feyCL7pmZMS0JcqCR8N1EEB8jAglqzpW5xkLrZWkEsZHTwFg7iWeNlXfpHVWzYxbYYNzB
 QY1isMyTFoXN+RDs7VWdby5L1sETY=
X-Received: by 2002:a05:6000:25ca:b0:43c:fde6:2126 with SMTP id
 ffacd0b85a97d-43fe3e0fde7mr3899852f8f.37.1776427604406; 
 Fri, 17 Apr 2026 05:06:44 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a341sm4421878f8f.24.2026.04.17.05.06.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 05:06:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 14:06:41 +0200
Message-ID: <20260417120641.174060-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417120641.174060-1-thomas.perale@mind.be>
References: <20260417120641.174060-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776427605; x=1777032405; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=72KJMHJsa1XZ0qrS593TYLuNljAFLWrZg1YbrQEhuec=;
 b=MgU1+6thU6s6CjCyOw4q4U53LvsUqpEvnY9htV4q6j9PSwoXMsp7NdA1MRgxXNOuMJ
 Z1dZXdzaWxSkEiQG+AkTx7RYttDSoUqs992ShUqebnCB5/Fuce38gTRsg9xMsZ1Y0I9/
 UIMVy6UgjR8NT/CfYXdnBXvw3Wmy9s4c4tQnUljAMQU5xTk+fEzgY/hnL4IzWP1R+Nc4
 AbouUb9aMi3BOh2txto5F6YFC0qscC1cd/xO4xx2L+hCA/Knxq2I20nB6X3RZuWfPXYF
 0hCiEiYFolbwtq85e3m2j9IuvkTfb/scRa9TDBTKOUO2bVDND0qieT9S9a8pXkSJuAMP
 Tb9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MgU1+6th
Subject: [Buildroot] [PATCH 2/2 2025.02.x] package/xz: patch CVE-2026-34743
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- CVE-2026-34743:
    XZ Utils provide a general-purpose data-compression library plus
    command-line tools. Prior to version 5.8.3, if lzma_index_decoder()
    was used to decode an Index that contained no Records, the resulting
    lzma_index was left in a state where where a subsequent
    lzma_index_append() would allocate too little memory, and a buffer
    overflow would occur. This issue has been patched in version 5.8.3.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-34743
  - https://security-tracker.debian.org/tracker/CVE-2026-34743
  - https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87

(cherry picked from commit 724635227314010518372c5bad4d37d7c58950c1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...buffer-overflow-in-lzma-index-append.patch | 62 +++++++++++++++++++
 package/xz/xz.mk                              |  5 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch

diff --git a/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch b/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
new file mode 100644
index 0000000000..034122d4f7
--- /dev/null
+++ b/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
@@ -0,0 +1,62 @@
+From c8c22869e780ff57c96b46939c3d79ff99395f87 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Sun, 29 Mar 2026 19:11:21 +0300
+Subject: [PATCH] liblzma: Fix a buffer overflow in lzma_index_append()
+
+If lzma_index_decoder() was used to decode an Index that contained no
+Records, the resulting lzma_index had an invalid internal "prealloc"
+value. If lzma_index_append() was called on this lzma_index, too
+little memory would be allocated and a buffer overflow would occur.
+
+While this combination of the API functions is meant to work, in the
+real-world apps this call sequence is rare or might not exist at all.
+
+This bug is older than xz 5.0.0, so all stable releases are affected.
+
+Reported-by: GitHub user christos-spearbit
+CVE: CVE-2026-34743
+Upstream: https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/liblzma/common/index.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
+index 6add6a683..c4aadb9b0 100644
+--- a/src/liblzma/common/index.c
++++ b/src/liblzma/common/index.c
+@@ -433,6 +433,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records)
+ 	if (records > PREALLOC_MAX)
+ 		records = PREALLOC_MAX;
+ 
++	// If index_decoder.c calls us with records == 0, it's decoding
++	// an Index that has no Records. In that case the decoder won't call
++	// lzma_index_append() at all, and i->prealloc isn't used during
++	// the Index decoding either.
++	//
++	// Normally the first lzma_index_append() call from the Index decoder
++	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
++	// lzma_index_append() isn't called and the resetting of prealloc
++	// won't occur either. Thus, if records == 0, use the default value
++	// INDEX_GROUP_SIZE instead.
++	//
++	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <= 5.8.2
++	// didn't have this check and could set i->prealloc = 0, which would
++	// result in a buffer overflow if the application called
++	// lzma_index_append() after decoding an empty Index. Appending
++	// Records after decoding an Index is a rare thing to do, but
++	// it is supposed to work.
++	if (records == 0)
++		records = INDEX_GROUP_SIZE;
++
+ 	i->prealloc = (size_t)(records);
+ 	return;
+ }
+@@ -685,6 +705,7 @@ lzma_index_append(lzma_index *i, const lzma_allocator *allocator,
+ 		++g->last;
+ 	} else {
+ 		// We need to allocate a new group.
++		assert(i->prealloc > 0);
+ 		g = lzma_alloc(sizeof(index_group)
+ 				+ i->prealloc * sizeof(index_record),
+ 				allocator);
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 60c2df70ee..205ab928a7 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -22,7 +22,10 @@ HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
 # 0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
 # 0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
 # 0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
-XZ_IGNORE_CVES = CVE-2025-31115
+XZ_IGNORE_CVES += CVE-2025-31115
+
+# 0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
+XZ_IGNORE_CVES += CVE-2026-34743
 
 XZ_CONF_OPTS = \
 	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

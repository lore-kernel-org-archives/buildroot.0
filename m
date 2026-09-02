Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECABCC624D9
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB87140A70;
	Wed,  2 Sep 2026 13:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVOMiEhptLBX; Wed,  2 Sep 2026 13:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355042;
	bh=0zVor9eFd+dID7Z8R2yEIvk4+DSDFwMdccQvQEVHJNE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dv6jYb5/yDZ5tzhyKA++ZRYZcBZC4aHKt4ScscFXAvzlzIyfTEX/9R3NfVPgVcV3h
	 vnI5I2dCEHPjrcxWXjd+czJEfEl02mjQQM88sY3P9NLx582Ie2GGUOsWRWlx/4Ni+G
	 88Qvj2p3jNoAXGRQ5zzlfRlVzUUqBBgOiNgsGlveCQZDbSZvJTCMyaSOyZa4s6/S+o
	 Uo22PNE3WV8UOFBxBKL0dokiMDr52hXwCPkv1i2ZCtIDMIrkrWF2vGzYlVRevzxqvY
	 SpaMOQ6VWSIFtgP/gl8N1ihkrxmihVCmnJ9bGCcswKBN/Vr8NW3qH2wL3OmiurEH1R
	 aYBn2O8ZU1+lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7C64085E;
	Wed,  2 Sep 2026 13:17:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AB734AD
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 685B6606F5
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0sYxnH_BkNC for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5262F606F1
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:10 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-482f9309813so1052785f8f.1
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355029; x=1788959829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AR4x18cWCpmidg+BJjuLTbpnRA4sBzA9XALAuKneOnY=;
 b=SXc0tRADkIJgyKhirRCUnn1ffsHD/qxZ3SLXsxQkJKgzbR3Y8OkyuKd2ZGLUKJ0Qkb
 STUxaob8pDoy6FnUsQnyLT87Pgodrq4Q6+f+n3MEBw1SaeOV2jHsGJMoqpaIp7Nr/iSj
 adRpR449kKC+inBoVjR3O5F+bBaYvyaae/fPKnEhw77Hvh5Z3xErASaVnGW3LoG9gAoh
 7FcWZe4o/W9X6G5b4FB8tqRzfw2lDMRcj/L5gRiJ8SKb3O+/GGhG6dCfOOOgA1czV/59
 0vo9cnYHedgpObJkEoczMJdnTDmQ8FKT7GNC53u93BiGPELXBqsp/PPo/e9nED7seqW/
 iBow==
X-Gm-Message-State: AFuF++nTmqH4Fn4FFa5tZE+S1i7HWs6C8FH0TcQSY/45Fp9B+kCrReds
 JjM8VMfC9O+nVQUUpsgtSp6/Uiq6eNpoIDOxA7JJTOboGXiV3YACwmcCulBVMpEykME9zYaYWwB
 Tim2xh9I=
X-Gm-Gg: AYBFou0K4fN78Lb524GcHaNsXx8AGoVQJJXci0Nmr+0pNkXOYtwHhoMgBBOhOk04KIe
 W3e8LPcaXyZPTjNGMOYpAS+iiF7ZL2UGd0bcrGscJBAwTrdXJ4OjUtur/9phTonuusGK47D5XH1
 Z+aqN/tk+S6GDusOOxO2pDIs9o/szl6IIs4HVbGAUVzXQji97973zvy8o/jrPBVlNtjf+HoEQO3
 NTyLGyaLE0Ry+Xr70Av2YiCIwWwOeeakEchh40x6dEsPng3EBIZAXdd/SfMZig/ovWSm0UvnhIq
 AUkgdJ0ac8xmnFpvIPcR9CJ8HfvbMrQRF/KkprNSMTIdEa1eSg7bTg+61n5IK0ALd0z15YYrDlB
 b09edz/7HfdAdR0BZmn4kDJwvG4v1AKepMipIYGqaLV92neiO+OcfpTue4e3FYN164CJOabV69K
 hg6eP5nOWnKgJErQjiKGUn11zKwfGvy0b1duSowOBwFjfGQYVwkFLOEwCnE2dbuON34xP8eD9ih
 zy2
X-Received: by 2002:a05:6000:4819:b0:47f:e748:3ae3 with SMTP id
 ffacd0b85a97d-48488deedc7mr9142037f8f.3.1788355028697; 
 Wed, 02 Sep 2026 06:17:08 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:38 +0200
Message-ID: <20260902131640.379588-14-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 13/15] package/clamav: add
 patch for CVE-2026-20346
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
 ...guard-pdf-hex-string-newline-skip-98.patch | 36 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 package/clamav/0012-libclamav-guard-pdf-hex-string-newline-skip-98.patch

diff --git a/package/clamav/0012-libclamav-guard-pdf-hex-string-newline-skip-98.patch b/package/clamav/0012-libclamav-guard-pdf-hex-string-newline-skip-98.patch
new file mode 100644
index 0000000000..41607a82ee
--- /dev/null
+++ b/package/clamav/0012-libclamav-guard-pdf-hex-string-newline-skip-98.patch
@@ -0,0 +1,36 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Tue, 28 Jul 2026 09:05:37 -0400
+Subject: Libclamav: guard PDF hex string newline skip (#98)
+
+The PDF hex-string reader skips newlines immediately after the opening
+angle bracket. A malformed string can consume the remaining bounded input
+before the parser searches for the closing bracket.
+
+Return early when the bounded length is exhausted so the parser does not
+pass an underflowed length to memchr().
+
+Reported-by: Tristan (@TristanInSec)
+
+CLAM-3002
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/354f71e192168b6c966c4d15122b455cbb2d6ecb
+CVE: CVE-2026-20346
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/pdf.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libclamav/pdf.c b/libclamav/pdf.c
+index 51b97a0a17..7769a6a6ec 100644
+--- a/libclamav/pdf.c
++++ b/libclamav/pdf.c
+@@ -2680,6 +2680,8 @@ static char *pdf_readstring(const char *q0, int len, const char *key, unsigned *
+             start = ++q;
+             len -= 1;
+         }
++        if (len <= 0)
++            return NULL;
+         q = memchr(q + 1, '>', len - 1);
+         if (!q)
+             return NULL;
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index a70ac71b02..aa63dbc23b 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -54,6 +54,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20345
 # 0011-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20339
 
+# 0012-libclamav-guard-pdf-hex-string-newline-skip-98.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20346
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

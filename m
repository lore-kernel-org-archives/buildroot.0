Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11318E85371
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 16:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2484B411FD;
	Fri,  3 Apr 2026 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4or8cFhnqp7p; Fri,  3 Apr 2026 16:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8028F411F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775233327;
	bh=zzL3pjW9fRnA0dCN4d+9vbF56jP6d74Sl/HDiiSVge0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IwWPvPGJ3HDHn9lITGa3phs1K4c774RFStxDUaji5Mza6F1BRn01qhDjT1IrC5s6c
	 VG4w7tX/OBZWDmnvxN06pVRRW9WQwuK0c8HBPaWXZgh8S4be18FHzY7MnC/G1XK2qn
	 DRRJLIHPBkFlSxAOOsokr995+l39WNdUEr+GkSStRFP4BCD1sTOSsoLPeIv+DMVQsl
	 sTDenCGNLTOW9z9dtzfYHvHJZfwdbxW+jHkZvmDFBr855cZuSVgmUYM3IVIkWWVKCV
	 uXUHlXR3oFlsaL8t3t70UsBqKHSXF/N1hhuujaKAMfgCX905u4CH982zFeh9l8k4+A
	 a/BeEJplFVGUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8028F411F5;
	Fri,  3 Apr 2026 16:22:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A7B1F3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 16:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB951610DC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 16:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4_m8tsaM_9g for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 16:22:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18133610DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18133610DB
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18133610DB
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 16:22:04 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2a8fba3f769so8217925ad.2
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 09:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775233324; x=1775838124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEaiqPZnP0D3zejc/ms6v7hyghEASxjF8+2/SNguydA=;
 b=R8NSBI3QJgmJROCn8RTxz8tf9R32xmdOU+wSbikZndYK4JOlrghu71LkOuOAcQWni/
 LaF3C0nkZ9J9YqdkhbSzyz7ACUJqcJuWje+fqg9kcd+7CIVPN9YjO+zY1g1VVTC2w6Ca
 52br+B77OVz0a3S0Q0wv22dNi6LutyxGjrrm+Vb9gK7iVjRLJ/fFwTHXUXgJ1LsOBtfl
 910iQ727NUeBFd1nAPn/5PLrHAHefUty/W6ue/f/XAsuwRt3U/znLcorogmPzCo4ARIh
 wqDqAsqSliJ7yJslFqTjFAlPScTffgJ2/2VlTRF7wFbXlFhJt1ASi47kaCmkZV9Pr7J1
 o0KQ==
X-Gm-Message-State: AOJu0YwF9Y9tr7I5BxG22Jf7HdYa03oehZd3gPWlBSQszgawYcLh6Rqq
 slaYX3bXPw9WdiMbKaN3B2EAW/tFpcnmbKbFyeSBC67M47m1scavXDE5SRkXZA==
X-Gm-Gg: AeBDietPSV77WGOSH24BzBdxMS2xFz68kRCUqk1cSfb9JKENFi4EV5xS+lYdylEGzJj
 lzluUqMZqYmhi1vJI5kGUbTktqEj4hNxcq/VJLDPOq6K23qRMh22R1gZfI/ocijl9pCyxi/9JQh
 1VpJl3MJZnV2gH/gl3wEketgck2VXJ0Hn5ioBuEvsaPqOOe5QXmc7QcvEClMOtx/9kejMj1rcrG
 y/OExycVXA6aa+9bRqxMkQLIcoiWAerlUPqzOFUhFQpAfQtK6jXgTGKLYOcJiBOfoa8awNaYrqU
 HnDa4M607FMDIVCHgxJN+X4HIoRmxXGooXQxZt+ft32lJ87YtUB1EvzqCbt/tp2/ITrpMd4CeTs
 RTWQjG1App+hOaZNWhetY3br/U2eNlmCbxhR4pHwsA0D7q8wemiWHdbEB7WPPbtCGn/oz9rYpJd
 YK7IXFmVQlBSsJVZd4P6DxXNQJesRmeiNA/hM=
X-Received: by 2002:a17:903:b07:b0:2ae:4fc8:3f5d with SMTP id
 d9443c01a7336-2b2818a733dmr36769915ad.48.1775233323792; 
 Fri, 03 Apr 2026 09:22:03 -0700 (PDT)
Received: from fedora ([2409:4064:2d9c:554:d9db:ca4d:ea7f:ffa9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749b66aasm63622765ad.68.2026.04.03.09.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 09:22:03 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Ayoub Zaki <ayoub.zaki@embetrix.com>
Date: Fri,  3 Apr 2026 21:51:42 +0530
Message-ID: <20260403162143.16290-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775233324; x=1775838124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PEaiqPZnP0D3zejc/ms6v7hyghEASxjF8+2/SNguydA=;
 b=gPfnNoKL//NoQHZbIAOulfcvzbvWXgGidlefICjDjfLdugqtqL5EaEC3zU5HAxeOO1
 NbL9Y1bPJ8ivZ048NLKa0RSaL7G8k16cymmoyzjZn1GNTV7Q1vKq0woi3Wz2J0T87QTd
 eIOskzep7MtjLYED/j2wiVxD9H4J+XOB3GXpCct8zuzhE9S7E0T1EwVfSz8/7dnasCCh
 D6fJY71F/HUzYanSA20ctz2hNFw8GSiTJA5NxzYf9euX3MrPcHk0CY8on2FKh9PZmo6/
 1ShUPdZU97Q5SYk3v3P9D+PN7J7IejunhN0YjaN9mNWjH4HsfrSFXgC2cS9tpakEtm/H
 EkJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gPfnNoKL
Subject: [Buildroot] [PATCH] package/bmap-writer: bump to version 1.0.4
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

This version includes upstream fixes for static linking issues
related to libarchive. In previous versions, CMake's
FindLibArchive module did not propagate private dependencies,
leading to link-time errors (e.g. missing zlib, bzip2, lz4,
liblzma, zstd) in static build environments such as Buildroot.

The upstream build system has been updated to correctly handle
these dependencies, allowing us to drop the downstream patch.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/bmap-writer/bmap-writer.hash | 2 +-
 package/bmap-writer/bmap-writer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bmap-writer/bmap-writer.hash b/package/bmap-writer/bmap-writer.hash
index 0b0e8de46a..e2936525e8 100644
--- a/package/bmap-writer/bmap-writer.hash
+++ b/package/bmap-writer/bmap-writer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a86ade2c70304574f200c048bd8a728ed27b04b7ece62cf0f696366e37fed6e7  bmap-writer-1.0.2.tar.gz
+sha256  121832c4ab44d30828489a6620c21d0fcc05904bb85cde71e82ea383acc12d1d  bmap-writer-1.0.4.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/bmap-writer/bmap-writer.mk b/package/bmap-writer/bmap-writer.mk
index 19ccd3afbc..e6d85f2279 100644
--- a/package/bmap-writer/bmap-writer.mk
+++ b/package/bmap-writer/bmap-writer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BMAP_WRITER_VERSION = 1.0.2
+BMAP_WRITER_VERSION = 1.0.4
 BMAP_WRITER_SITE = $(call github,embetrix,bmap-writer,$(BMAP_WRITER_VERSION))
 BMAP_WRITER_LICENSE = GPL-3.0
 BMAP_WRITER_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

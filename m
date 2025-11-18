Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C88FCED63D
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 19:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D75BB84542;
	Tue, 18 Nov 2025 19:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wADHj-IDfTy9; Tue, 18 Nov 2025 19:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B54584543
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B54584543;
	Tue, 18 Nov 2025 19:05:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEB6E1BA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 19:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C457A409F7
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 19:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSbttJe7Aw3g for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 19:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA39740177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA39740177
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA39740177
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 19:05:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so39533305e9.3
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 11:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763492726; x=1764097526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WglOvAkSMrA8S2fCxRh3/u263wRkpPaUdn4F3v9pmjo=;
 b=kJte/uXDTvebw2M3G+LDmAfIOQhncx5C9S7gnMYgQmREQWXDMHWgCsVycbjsvWn7JC
 1wd7kpDaxzEJ7pLgpOkjYOvASGhlS6ijT3sxXdiN63kB7P/DdrNieJYfmk4JIsWX2qOS
 8p5ZP1PkeLE1FEwGPwAJPPhZvDppLuAeYmeolB28H7e51v8brnxqBzDW8glnFB6YYad7
 KWnAYCAwOKh8FbdGhvjnkpUIP15+zpm90s6dnq7EurdiQFDsiKKYQm5e5DfNxE7g1xnA
 PEGzX+oFvXuRzr5O5tujd9VvUoZxRns3kqlswGR5lWP41h4ASxeVN+j/2gvzFIDhFdSe
 YqqA==
X-Gm-Message-State: AOJu0YwFMo7NwmxhrCEOOWEp70WZJcmB+LPweHZW43C4n0h9jxo/kVdg
 KVPLzUPaKBZig2Rq00StKrHDNTvSKque+c+61/AmExTMmL6Mk2dak5ZddHKOxA==
X-Gm-Gg: ASbGncsteRUkUG68sxIBjAXeYf9GvGuL1kUHBiXv5BVX53wb+f9kCDqaoRXKk4koRF7
 ry1T3Y3N8imxoGJ/+4ibx96v/8VRtH8fDF7AbbKRQgHmCjjq5ctS21xqEiaCk5WmzfgAY5rvZfy
 2D8LSuhT2XpLdS2aFUV9UZ+8RInOhAtX/O7fqY5btvwLE8vmjmwa49Ix7rZz8aW9uy8bbKOsgeu
 5Pu5hJf8OzQI3OQuw8DfJenbqjCnq+FtRO7qOgIWnA0PGjnzm98hJDeAWUM/YDjfiDztMGu50R1
 3shkEsGu82H4PlCACBnPZQjP7sUilFxO5Pfo6A0ryUwNe9vfxactU84RwR3DgdaMnMPs08qm63E
 BMiDgBJFUlETyfNR6heLTcEflDWLWueDNfra4Qx7HC3aUPAJkZlsnN2sPYlmgZLv2n+UQip2KOp
 7U6hAPqho6befw5XexKpScjbe+u/ME2s1WX59nZadk76xfn0Zdo4EFk6c=
X-Google-Smtp-Source: AGHT+IEXoiPKXlW2rTvpkNJ/syxfu8yFT3vQvGKW62fWrVJkvVVvarNgSNY8ZYqnd7fLXvWNpf0fmg==
X-Received: by 2002:a05:600c:b86:b0:46e:506b:20c5 with SMTP id
 5b1f17b1804b1-4778feaa63bmr154597285e9.26.1763492725565; 
 Tue, 18 Nov 2025 11:05:25 -0800 (PST)
Received: from zgyarmati-t580.. (netacc-gpn-5-84-233.pool.yettel.hu.
 [84.225.84.233]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b0ffd37bsm5696445e9.3.2025.11.18.11.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 11:05:24 -0800 (PST)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 18 Nov 2025 20:05:20 +0100
Message-ID: <20251118190520.1267064-1-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763492726; x=1764097526; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WglOvAkSMrA8S2fCxRh3/u263wRkpPaUdn4F3v9pmjo=;
 b=nAT/9FXa06mc4n2rwgc8/N+h7You8fkpcHw02M1SRiCWbjyrSL4zawW57IpovnOGNO
 rjCvXcy3aiYLXLBa5cgynOCDWSp1QLGAhidHB4KjDKIQlqRAGoReHkfhU/Dy6s2bkIoG
 Kj9hL9nryPf8RfzPyErJapRn+0HNvhrBcbQ/FvEDKFKOTa5chtEbGppKrQfftZWaVp++
 rWdcmQUZVfs4Ao3m4HJUqf8zlqLj/g5QrUCW+lHNeSi4KWsuGnpwlf8I38h2kDKkV0B7
 A3Jsx2NqTv+wuwrliKKqBbs7KrpkJETjNczf8CwSXj13z9K8EBL80iPyQm4ZY7KiQBVE
 jnIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nAT/9FXa
Subject: [Buildroot] [PATCH 1/1] package/quazip: bump version to 1.5
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

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/quazip/quazip.hash | 2 +-
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 1c5c614caf..46346d0124 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  79633fd3a18e2d11a7d5c40c4c79c1786ba0c74b59ad752e8429746fe1781dd6  quazip-1.4.tar.gz
+sha256  405b72b6e76c8987ff41a762523b8f64876ba406d8a831d268ee0b63f1369582  quazip-1.5.tar.gz
 sha256  b455b21b0d31d6e51993f1fb7e0694c75fa0eb0519a9ea62e4815fcf48b140b0  COPYING
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index ac28792f20..06b702e732 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 1.4
+QUAZIP_VERSION = 1.5
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

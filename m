Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7121E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99872410C8;
	Fri, 10 Jan 2025 19:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oegGAkY_KHmi; Fri, 10 Jan 2025 19:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5E0F40E3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5E0F40E3F;
	Fri, 10 Jan 2025 19:54:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9D46942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99DE1409F2
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwEmQb_GJ0Qf for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1710C40903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1710C40903
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1710C40903
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38a8b35e168so1535576f8f.1
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538851; x=1737143651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Owu8ZZjjki8SB4SAsdlBeFfVs2/SQIzyH3iMDxeAx8k=;
 b=HvrEzMqw1rGhVx0vqGzxOdSVm+LTef2MLrIhPvcRoOKE8riVvqdoSSVzyQUo5cG0vY
 4iOgWwAbgY8wjBc9u9H8qN3e8xo7Ijq/zbtXwHGv3NzY2Wky3zJ1/UOgK/OyK5Z+S3yc
 ZQLGhqXlTFu8Ji4SbovA86nrpEVY9FJFcQyrANwF45Ka3czO3+dzZU9PZLvmxGMBbFXk
 MCz+Q+a2BRhvtQJ0bnoeYq1Rw0oEEIQtJjUglEhHr/dJ3L1l0VctKTZMHTrpLghn2b5J
 N+bFXZtWZtvmOAOy8LNH2SLu9qOY4pypIDUcK4XnxK08U8RbzCB6ZaJB5YnIXI/Jyfgc
 DwaQ==
X-Gm-Message-State: AOJu0YxrLDKwPvRtzu9cKvLRhuG0nvXderCNmNz7YZUtbozoXMxL6ebK
 WfklVD+tg6FRYSP/kzrL76KmYXiJUdi8PJrqkHQWCaHj4M4QOgiyPscacYsTvcCGglVw0ZOwgcq
 d
X-Gm-Gg: ASbGncszPy57dDKwk/3wL5P404ONhqeh5nht8EgDDTU+lcxtx9VFLtF6IT5QfQJy6fy
 7uixNkxCrQUTOOVa+07hs1M0VGUI1de2V56mFgLWMdCOEGrGYdepHXVlqkI4pS4Lpnj20yi0ExX
 GYJO1ug0Vf5npnzZTGypWw/zbqdwQsf2pmjC6nEmwsCWDt8h5qIfCxkRRQnAm5n2d4gejRAZHU0
 Zv6cucrzLQ2P2ZGTrVUwgD3ddRZKhIIRGRFmIQCedb/Qoee0XaCGrzA8S9pTIRuVFCRnqq+HyLQ
 3JdbnVUREpCOcoOMAjmjUSoTPSpq76MXLQ2XRh1uWHTFSwSq/9vuaw==
X-Google-Smtp-Source: AGHT+IFDJMVLz7zbOekC5/2XWBQ5tgSbCmjNjPmqJuY6i9FmUBE4xZ9cBkkISi0BVUIshYcDV2vCiw==
X-Received: by 2002:a05:6000:1864:b0:38a:4df5:a08 with SMTP id
 ffacd0b85a97d-38a8b0f3163mr7589595f8f.22.1736538851033; 
 Fri, 10 Jan 2025 11:54:11 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:10 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 10 Jan 2025 20:53:53 +0100
Message-ID: <20250110195359.3358022-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110195359.3358022-1-romain.naour@smile.fr>
References: <20250110195359.3358022-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538851; x=1737143651; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Owu8ZZjjki8SB4SAsdlBeFfVs2/SQIzyH3iMDxeAx8k=;
 b=FBwgDbPlq6olRgxPsGgtvmQ1gXKj3F65znLtqQk1k5aQhkqQTwcifAYoMxCwu39Olv
 UXQLXlWC9P7JFm6ywgXw289lRP1mfbOSrHHHcEvqAdJs/0DofTWRshD4G2PUm5//ySHj
 /ZgHUpqFf9biiyQ48BBKlUDpEamS9rmr5iTV0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=FBwgDbPl
Subject: [Buildroot] [PATCH v2 06/12] arch: disable nios2
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The nios2 architecture was deprecated in gcc-14 and has been removed
in the upcoming gcc-15 [1][2].

Our last and only nios2 defconfig "qemu_nios2_10m50_defconfig" was
removed in 2024.11 due to nios2 removal from Qemu 9.1.0 [3].

This patch only definitively hides the symbol. When all references
to it are removed (to come in followup patches), we'll eventually
remove the symbol altogether.

[1] https://sourceware.org/pipermail/binutils/2024-April/133675.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e876acab6cdd84bb2b32c98fc69fb0ba29c81153
[3] f96b4c176f6e9d6c4374a0d322de672bf44c35bf

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: remove "depends on BR2_BROKEN" to avoid check-symbols warning...
    just remove "Nios II" string

v1:
ignore warning about BR2_BROKEN symbol:
  arch/Config.in:148: BR2_BROKEN referenced but not defined
---
 .defconfig     | 1 -
 arch/Config.in | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/.defconfig b/.defconfig
index 7ab0c3fbf0..d25c62e104 100644
--- a/.defconfig
+++ b/.defconfig
@@ -12,7 +12,6 @@ BR2_i386=y
 # BR2_m68k is not set
 # BR2_mips is not set
 # BR2_mipsel is not set
-# BR2_nios2 is not set
 # BR2_powerpc is not set
 # BR2_sh is not set
 # BR2_sparc is not set
diff --git a/arch/Config.in b/arch/Config.in
index 7da2dc69e4..e7bf0b53cb 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -144,7 +144,7 @@ config BR2_mips64el
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
 config BR2_nios2
-	bool "Nios II"
+	bool
 	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_USE_MMU
 	help
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

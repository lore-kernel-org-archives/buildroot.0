Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C742DC369AB
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 17:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F1E540B72;
	Fri, 11 Apr 2025 17:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eP7fuWO2DIQ3; Fri, 11 Apr 2025 17:49:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B6E04089E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B6E04089E;
	Fri, 11 Apr 2025 17:49:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FC24108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CB0140ADD
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 532cf9Cg1m-A for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 17:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C809040FEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C809040FEA
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C809040FEA
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:49:07 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac25520a289so384961166b.3
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744393745; x=1744998545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MafqvaQp6pvbIma/jkKFP/Jokd3gAOIumVDJ/0TrN1o=;
 b=oB7mjciOIVFcFFEObavMJNjPfUYVEsyXcjAEeYWy9mdaJEH9DzVnDIrF3gt9HrRk3U
 AjJkQ9KRQKMEXNhqNwoDx5/cSiV2AyExo9xrjd3fi/ZiTJLGglJcUwIaqLP9/Rw6bBJc
 DcANkF7XWpCrMJky+akn7+ugUqTQMJdqCmcIaAjsSp6Znx8X41J/9I+hbrXb3Y7NIL3Q
 pMsIRUOLXc4SN/5Vb43jhVIoGQZGFBBAbwo+IiNCiBhGt15y0zyKwiBTvE8MO/ONqwN0
 go9lU5Ho7g9gqR/iRZZx4aFzHhmP0C94y3sp4Eblt5JweWl08zji4+PeuDIz+QSO1x0z
 Ehag==
X-Gm-Message-State: AOJu0YznWZ7Q8t0Hu3SzPylXZtlgi6vRRJWjn5K9xaTbIcka4zH0tOJD
 G0RnjwJtg3XuRkfXLUbREbqTGweiZQEUhe/csdBkJVlcrIIBxNgFmKOSxOQv8nb+ivu9K78Dkeu
 n6CM=
X-Gm-Gg: ASbGncueLF4/FL54RdVNdkYXitwFNXe6Q3n6CkFOdt/tGODc69QLVCC+oZW055UDT/t
 pWilgsgTYM923a7zRPYirWwv0rO43poKMcwO8AJAM91kHefUBjFNvbhAPKrr6LUEboQogtfyuoJ
 apEey5SClDJ49GrMawPTX391DlakHY/LOjz/8ozjb0FQNuXpYgC3Mr5GeBKuyCvJstvcyVkXIPW
 xfWdGNhJgOisamBlRFfIkQkasE58kYlQYqErPx4LJ0MPm9DLY8Ms2H+y0dQ0vb1uIedzItklrdW
 sqfzCDZqEj8RYY0uEWU3z1CHhNwbH1K0+MpHXbaxGm2La7e21XFc7tc=
X-Google-Smtp-Source: AGHT+IGirSgkvwxInu/wzLOM+7Ks6ZBhSAc4lbF8XbBbp8cM4fqfzET8iDCqBIxJ4hiiCxrM6EI8TA==
X-Received: by 2002:a17:907:2ce2:b0:abf:4708:8644 with SMTP id
 a640c23a62f3a-acad3595004mr347504566b.43.1744393744860; 
 Fri, 11 Apr 2025 10:49:04 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4142sm479795766b.101.2025.04.11.10.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 10:49:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Date: Fri, 11 Apr 2025 19:48:47 +0200
Message-Id: <20250411174847.3489092-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744393745; x=1744998545; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MafqvaQp6pvbIma/jkKFP/Jokd3gAOIumVDJ/0TrN1o=;
 b=LgWCFq878jxJ5fgfy84M1WJfQ/xcZTtMYS5GejC6U++qZDYquFHl4BdDiWwXhwpwAQ
 MiKcJu0eRHcM4Tmiay8de5hQhpoMflMxQ/UVbwLNt1C/+Te8tulFCFehLn0B4J597G/U
 SSCm8VjS1H2ToUvE3j6GII/V3x4AtmS6liWLGvXEyvguh8fr+iM/qHzQ1Mfu58APA0DS
 aH965jNCnKxerAUWSgxrAny3A4zsCcKtEpdbtycBa5+di7A5PsNZIHlQPV+DVTY2PL15
 kjfU7O9mP1sguMaoUfztJPbFmZPGsUKjOlHEeHZcYUx/bGitp2u8hOes/QG4e9lboY4x
 i/9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LgWCFq87
Subject: [Buildroot] [PATCH 1/1] package/libarchive: security bump to
 version 3.7.9
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

Fixes the following security issues:

- CVE-2024-57970: libarchive through 3.7.7 has a heap-based buffer
    over-read in header_gnu_longlink in archive_read_support_format_tar.c
    via a TAR archive because it mishandles truncation in the middle of a
    GNU long linkname.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2024-57970
  - https://github.com/libarchive/libarchive/commit/82912103214506316bd9990d73f33d743d55f570

- CVE-2025-1632: This affects the function list of the file bsdunzip.c.
    The manipulation leads to null pointer dereference. It is possible
    to launch the attack on the local host.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-1632
  - https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532

- CVE-2025-25724: list_item_verbose in tar/util.c in libarchive through 3.7.7
    does not check an strftime return value, which can lead to a denial of
    service or unspecified other impact via a crafted TAR archive that is read
    with a verbose value of 2.
    For example, the 100-byte buffer may not be sufficient for a custom locale.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-25724
  - https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532

The patch added in [1] are still needed for this version bump.

For more details on the version bump, see the release notes:
  - https://github.com/libarchive/libarchive/releases/tag/v3.7.8
  - https://github.com/libarchive/libarchive/releases/tag/v3.7.9

[1] 9ac63a3360 package/libarchive: fix uclibc build with libiconv (again)

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index c0b04b0f4b..d132664e17 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  879acd83c3399c7caaee73fe5f7418e06087ab2aaf40af3e99b9e29beb29faee  libarchive-3.7.7.tar.xz
+sha256  ed8b5732e4cd6e30fae909fb945cad8ff9cb7be5c6cdaa3944ec96e4a200c04c  libarchive-3.7.9.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 70123ee2b1..7fec01a040 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.7
+LIBARCHIVE_VERSION = 3.7.9
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

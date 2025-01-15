Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A10C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 08:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58AF1416C9;
	Wed, 15 Jan 2025 08:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFD7ef1id4Ca; Wed, 15 Jan 2025 08:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2021D416C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2021D416C8;
	Wed, 15 Jan 2025 08:06:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7C6494B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8E01413D4
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jia3NUWFRyDA for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 08:06:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C382D41396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C382D41396
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C382D41396
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:06:31 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2f43d17b0e3so11049519a91.0
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 00:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736928391; x=1737533191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fjxsdOMDpcuf/JUmg5iXdGUXXLpu53XsU4Anj7NRwUs=;
 b=dOx8/y2B6wU/m8AlGa0oUFGe/P2vKz6jDZIeeNTpKgAaJHMiKBHrljh+maqauavUgg
 SdZwY+FUOXPIK07oSYCd3l8itU4nBpd2FoUvX7gOrci4kmMdUMxXGC3klR5aUy6oWF86
 Lx++yKajxAAFk0s9Sv4nKBIEi7J8LB9SOYy+LvEBpsTrSIskyP2s+0J0Zxzv42Ten4s/
 xEjWx5pXRlTKzm42gSUxAoQjrPBdTGWrP7T2nAj5RNR3ZDy/K38ip7qja5ptFyVtLxqz
 5zHmw8MTDEp9k3ijujWnw43HtCvDYxnnY6+qAyt2ZlextFJ7zK65z3PdY+ekM++CKI6/
 ZF2w==
X-Gm-Message-State: AOJu0YzVxs3Eq8AP1c+FPpp566+4bM6y6Sfyfp9dl1WqWR1cgsxVWGwk
 3WISOnDt+2hG25o5RX5xWgCj1XIV2BNO6r5bfR3Dw9Ua+4T3d0GgXMDkdAHY
X-Gm-Gg: ASbGncvGVj5ifmhuX3KP0SqSv2RHM2+AiIMuckxjrEyBk1JyhhIF2VqPXD6MeZObpVY
 9i6Y0yubFrrHxGuq4y+XlbS3fzCF6jVqJCjL3rGjD+qs8f+Riq9xnUdNcQ9XYPiJrAi2iUgqVVm
 20xvpe1EMrYSgGQJPFA5HRxNyB/txjZvf8vWdmurQNrfsU8Oo7vdvpMSesTvT/0NF3CTg/Qz/VM
 yFRtaLMmel5ceFhHQHE5J6tmNwW/MSMxrAzXdlakZ1k5h91qEBBIYC3GIOjm8SnsRWpqNboz6bg
 BYvhza7K27XVtZLjfwj1ZYFIED8g30FkRM143yOK
X-Google-Smtp-Source: AGHT+IHMx1HGZqZHrXyLP2D7otC8UlZTzN6HZulxcRFd7iudEQT5wRGxfjEXR4mTwlxG6dHEFROP5w==
X-Received: by 2002:a05:6a00:124a:b0:725:f376:f4ff with SMTP id
 d2e1a72fcca58-72d21f7bc52mr20298390b3a.13.1736928390782; 
 Wed, 15 Jan 2025 00:06:30 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4054896esm8629554b3a.35.2025.01.15.00.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:06:30 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Wed, 15 Jan 2025 00:06:27 -0800
Message-Id: <20250115080627.795685-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736928391; x=1737533191; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fjxsdOMDpcuf/JUmg5iXdGUXXLpu53XsU4Anj7NRwUs=;
 b=lC0MUEXNWEwu62eLOQ0FhmMZ+/bER0DjkV9CGVZTMJsiAnBKD9Ko5Gcd9Qh8wse9Tl
 Fr5ygjFR1RPyh/gOljBPO5kxp9mNy+T1sxzNTQ8vt48BSYQARJEh6dP3cVkkOUXSPSx3
 6Ztaw02qgGlaekTlr6NZPNvmHFI9WNiF1T8yd+tKFBtcEhysvsOQHxs+pOvxsJIA/Bh3
 2JP47ka09kZELkq2k5WbjqezSG2q3E2EQhzU7AOfg87KRl7ej2Z2k0VPsQ8JIJvX6eHo
 cWBJamcqmBKKFiJLsarxS97oRLvHnQ46qLTLj9tPbuQciHU2IFBEKx011iFSnRDWyrug
 Dpgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lC0MUEXN
Subject: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.28
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

Release notes - https://marlam.de/msmtp/news/msmtp-1-8-28/

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index eb80029626..a7cd70364c 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.27.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.28.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  94030580a63a747faa0a3b9b1b264ae355aad33a4d94b832bfeb5b21633c965e  msmtp-1.8.27.tar.xz
+sha256  3a57f155f54e4860f7dd42138d9bea1af615b99dfab5ab4cd728fc8c09a647a4  msmtp-1.8.28.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index f3543bff1b..92fddbe8f3 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.27
+MSMTP_VERSION = 1.8.28
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

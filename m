Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A464DE77188
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 00:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69928406BD;
	Tue,  7 Jan 2025 00:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZleAv7WV-BO; Tue,  7 Jan 2025 00:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 413E7406FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 413E7406FD;
	Tue,  7 Jan 2025 00:28:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59B1CDB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 00:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47AAC6062A
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 00:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00hOhPVN56cN for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 00:28:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E26D608BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E26D608BE
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E26D608BE
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 00:28:04 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2ef72924e53so21771231a91.3
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 16:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736209683; x=1736814483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RoWo1ZczWv3v1aWjGMoLu2xhZMZiEDzQUApBSMeTRMw=;
 b=bsj/Q+rne93N1TlyzxZ/wFRBjEHbx7lW9UryKYUluAMhvwQwyYzf5YNBL00Rl2Fgpj
 g4tVyVcldu27nfQ39kjhO6lIUSVLQ8YMrXrxTcBJ/M4+AkHjJtOqjbGCGZPIkxEc79gE
 cB9LkbVNBFWFeFPhjfIXQ/q4uUHyJAy8yRnRRMIDhljRZPb16gs4dfNWGFwticfMu2ZW
 rcYhG9HthlsxRIShA/Gj7qiElgDWjSgMSKijRyHti5cvkoKoejIj7+SSVl0WqFeWJvD9
 zee+1S0fFJhCXVyfTtNPydIfW9IwoNOCLGiqek5D5Lm0QOHL1OldwwH/SSNqI0BAUIJ9
 816g==
X-Gm-Message-State: AOJu0YwCYQfIXlIurkS8WdZMHMh/eVKq4E4soZjpEFgVcpBccSzicCOK
 zEGGuQDzRgA1BiQgc6tKhlaElj7e1bNRn/otwOSjqT60bl2qz1eRaWQOUg==
X-Gm-Gg: ASbGncsPANIP3QX7Pg7X+G7Sm0avKJEDZuyRPHRu+Y/WFPTz7t0SvYoCdsoT7qCIfm+
 yCcoR03IZUjbGQ73Z+r8ZYQrPjhu8zOgUTlU9ULsTYRe90X2BUpw/UHqq8z/VFcP2h/S/C3RCgA
 vjqCKIq2CbeZXGBWXiTzA0kBqskFRLy28jgXCEB9J/zmVDveYW9fifRyxiKZrSOR0JxKpr2J+F7
 YDULvEp1En3OIW0iMwuQWQx/R3yI1Cx+F3o7+Kq8qUDCLKFZ2lSSFlP2RxXEquQ8RI3vUEQ9cJm
 lNEjbK29AGhY4aiDAUqi8OP+kiMQui7odwAQrby0
X-Google-Smtp-Source: AGHT+IH8cZMS1DlcGfYpOskk7123873WRGKPDogBHECYvplcs1Sx8WUFGAMhA5I6Iri7dMilwQktHA==
X-Received: by 2002:a17:90b:5208:b0:2ee:dcf6:1c8f with SMTP id
 98e67ed59e1d1-2f452e1814bmr94467177a91.16.1736209683274; 
 Mon, 06 Jan 2025 16:28:03 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9d4c73sm290031145ad.121.2025.01.06.16.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 16:28:02 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Richard Braun <rbraun@sceen.net>, Martin Bark <martin@barkynet.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon,  6 Jan 2025 16:27:02 -0800
Message-Id: <20250107002702.191013-2-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107002702.191013-1-nemaakhilesh@gmail.com>
References: <20250107002702.191013-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736209683; x=1736814483; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RoWo1ZczWv3v1aWjGMoLu2xhZMZiEDzQUApBSMeTRMw=;
 b=Tmhr6zZZGBXWPq7r7mb0MBCV2bym4xnrJ+7SR3TTeAs+FMPumWAfbPgBOxVChk/fJX
 u5V47ZiqYXHaBJZAzSyaBozvJr6rn5w2ZLwfXjH4OPN8VGUXfFH7oShvHUXc2Ht476nE
 f/jl03KR1OUU/XRRHYYF5HCqs2ybMb4gCcKPu1FydYEmKRgPdp5tonZc4vURQVPf+bmX
 dxlEAQS4aSADTImMp8jENaJpstS2Nnrw9/j9bNulRTgFlLUBWqi+s5DwgT1j9hZcbUvu
 esf7PoYXZUEJNbkXuyuxzXKZDlbEuwmLuyJlI4yNY5pqaci/mnxqCFxJd6IqcCm/h+JW
 C5ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Tmhr6zZZ
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2024b
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

Release notes:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/

Updated the hash URL.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index d353bc4410..3f84ec4f87 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2024-February/000081.html
-sha512  1f09f1b2327cc9e1afc7e9045e83ee3377918dafe1bee2f282b6991828d03b3c70a4d3a17f9207dfb1361bb25bc214a8922a756e84fa114e9ba476226db57236  tzdata2024a.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/
+sha512  0d86686e215672343debb3471b7e7ccb8a27f063f085c9b532d5e0470377843daa0dfb6aee0db4fb9068dd52810c69aeee914a1a7c7e603fdecda7e855020193  tzdata2024b.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index e367205277..ba53ae7c38 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2024a
+TZDATA_VERSION = 2024b
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

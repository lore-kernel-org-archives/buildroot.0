Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A9BCA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 15:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E10818127C;
	Tue, 19 Aug 2025 15:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF3fki4atFAq; Tue, 19 Aug 2025 15:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22BE481307
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22BE481307;
	Tue, 19 Aug 2025 15:08:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 146F4E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11AE440759
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJTBFYz4kByH for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 15:08:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3781540461
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3781540461
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3781540461
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:08:48 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b001f55so25215035e9.0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755616126; x=1756220926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nfbvIjGYtqOqEIztnJZxBaXyab0PpBg6fQ9zRHmWWio=;
 b=kKGVOx/WjOuFG8dJUUQv6lffLD498SSXzaHa9PHzDAzAroaFZj84O0+3QZX7CJKWcV
 71/Cu5MeGCAZqhBa88u81VINcuLXes3qQfaQyT1Dzqyrc/BpPxvSbVZXemGC3WXViNq6
 BKsJj9YzPOnrgoX51XUf0ibD8n3bje+1bQhxtLtDmoikxCLgCCyi4SvRWaei9L4zzl9i
 i9ICG+ehEV89X61mWMdDMRbDIMcsTWmEtfa+41OI73QAxlx0aAZkcXsXUsWHPG8jBDFc
 mfQvyhnMGxZwKRRZ6qPYIgtkO1YI+BLF58Tv1VR5WQwdT+rDh8oDrV/cRlqua5RpgEUP
 zHyQ==
X-Gm-Message-State: AOJu0YzpmGRFkJkIy/MZ/Li+ieToplbj3NcncWUYzS0mW0LAc5EHunUl
 jQovtgwgtSC3amRKzNEBKfTBwtTBVtNpQTYY4j1BYopFytHjC69ZoaOBsHoWTJxw
X-Gm-Gg: ASbGncviw2DcwtI+wdvoPM61UVOsxNWSClgt7/Ag0fASrw6Ls6qWhWCLDL/QKn9uSGC
 DoRnPErdkgorRn9+idJXjlsIiN3vezTHXlLvhM+BwlDr3vyVu5+xNM54XEnKMx4W7wNGtSMMRNo
 5URMrNbhGmF/ULYW5oMQZP5vZG/RoQWAbNEM0LABf22HiazhnU5P4Sm0m7j2ntwmp7zp4YiAszX
 rtqNXpu/aDuykCI1J2b/yhoPBFC8rpCawAKdJITOXfDlq4rQpmmPGjTV9V17ThlyswMoUrALG8v
 SpmUCSK3oDkK1PYqKOoUkMjjwzDNujxj2qlYprNAfjyLz0cp6rLxIpVCq+Vd5Nqnyx1k3eZ+Ql7
 XeLhIpjVLozVdC1f38AFR7tN6iI1RCLHBkKM4xHPq++uJww==
X-Google-Smtp-Source: AGHT+IGDszHs/gbGoOlfQt7ioGsBiRHF1cthBmnNXg3bONafOkZLoqA71Fz4QvZQmBBPX+ootH7fUQ==
X-Received: by 2002:a05:600c:3b83:b0:459:ea5d:418b with SMTP id
 5b1f17b1804b1-45b43dc4c29mr26875085e9.9.1755616125774; 
 Tue, 19 Aug 2025 08:08:45 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c61a66esm216675995e9.0.2025.08.19.08.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 08:08:45 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Aug 2025 17:08:34 +0200
Message-Id: <20250819150834.1651775-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
References: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755616126; x=1756220926; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfbvIjGYtqOqEIztnJZxBaXyab0PpBg6fQ9zRHmWWio=;
 b=Dd7OqlfRaM7EbCaTUw3AkEN7GRna5aYiMijQ2lQGDwaqs1ZHtdEW4q6M3flJ4xUQ8n
 +Xlxmbd9zIRR4koMp9nuqDF60FKyDLVB2v2w8VXdLEO54t1fLrOm/r+onhbq+jq0mlfw
 Oj7YidLu0GTyp7cDxvYNqFh+r/TeC19nBETWfol4vx2SxxFV22fjzGGAyibMkGiq1x9/
 /X61zkFZ+0TqG8QntCXruOiTJsaQuOMmhGcAAj4+AwLvHoL7PfjGvpRHyIAi0xIsvJX7
 nwyTt3jiE0nJuOkeaJuDkbT5KD1YXTNmwZFQf30OtzmMDi/pAVkxASFBSxu/wx31rrHJ
 193Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Dd7OqlfR
Subject: [Buildroot] [PATCH 5/5] package/cups: bump to version 2.4.12
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

Changelog:
https://github.com/OpenPrinting/cups/releases/tag/v2.4.12

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/cups/cups.hash | 4 ++--
 package/cups/cups.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index f826f96fe7..e363a761eb 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  9a88fe1da3a29a917c3fc67ce6eb3178399d68e1a548c6d86c70d9b13651fd71  cups-2.4.11-source.tar.gz
+sha256  b1dde191a4ae2760c47220c82ca6155a28c382701e6c1a0159d1054990231d59  cups-2.4.12-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
-sha256  5320b6e3c252423e4153eb2dd63e57e3b630afb21139f44e43b02d85fe33e279  NOTICE
+sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 31899114ef..21fe6a7c5e 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.11
+CUPS_VERSION = 2.4.12
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

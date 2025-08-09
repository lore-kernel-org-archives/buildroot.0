Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34066C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 03:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F20B540A14;
	Sat,  9 Aug 2025 03:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axfqvmAuu_7F; Sat,  9 Aug 2025 03:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2597940A8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2597940A8A;
	Sat,  9 Aug 2025 03:38:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67F8231
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59AAA821EF
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GM7rMMuT0XFa for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 03:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::561; helo=mail-pg1-x561.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9732581E33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9732581E33
Received: from mail-pg1-x561.google.com (mail-pg1-x561.google.com
 [IPv6:2607:f8b0:4864:20::561])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9732581E33
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:38:30 +0000 (UTC)
Received: by mail-pg1-x561.google.com with SMTP id
 41be03b00d2f7-b2c4e46a89fso2195512a12.2
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 20:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754710710; x=1755315510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/XLwRRoIx8rLIfmhYZSF7hdgVCIfR5ap5dv0VlbA6wc=;
 b=vvd/MOkrAlNXzInOBLHYDapcOiA3cA4j5Q30HEaVBJWHrImhlpvOqudgtcR/QpslUc
 XC5OO7fD8o4xohAzwpEhhqb1K4mpTqpAwIwql2OGblkcuha1HDzsxOdPlSecCejPhMjJ
 QZFuFbVDKLPe7DqZA8gGtJmnTR1/U82vlXZLtrP3BcBQH6eydftLA0iIXsEcOtlFixGQ
 wXVl57COFPIbTrLYrWqj5QgIisNJHLlK+B9ZcnKcyZwvpgbFb+J21+F78BMLQAfphwfs
 HIw+ONdmaNbUoTBuj0lUmU0CCW2BrFG3Mnz5+ESfih82CxRej+46TFcNmyPEoHNQXNPy
 xYAQ==
X-Gm-Message-State: AOJu0YxqvgJHNvHWKgsSSnWN9QIFqypwLojFiVWkVStW7Psq1Q6gESxr
 iRUpwSrVkQrucZtdA2r6FNEfwmnu2LL/oomoMGzye7o+sXPuixBgi6jOtBuPoak/YpXKWME4IKA
 GeC32suHq8FUDC5xsr16dhQm4z/6fuuRvB992WIFaVuJu
X-Gm-Gg: ASbGnctAGv8nya/MakOKE3A3pCNbSUWlxKdziDmqSjsqOvRWu4gurJuGm5hdNsGmtOd
 MwlKlhCJU4+eztD0uNCSMsWS3tMStYVzDLBkoBMJmyxg4YJJfZBP7CFwDIGHM2SL0WzGFIHNwZT
 lXvSGDVfq2sAtlH9HFH4iaVCFKOOpRM7GVce9JGMGsL1i5TPerxKhSFT3063WtEi6L+dcoNV8IG
 MlTRjTApo/5brdGvsBvpf7kvqtP8VjbbqHjnWocjBjH30X78gmYf5cMCJWTFwaaKXPzKIo5HH3j
 FovU5krmjcpSWvZeaqHX33BtOuqMJ1c+P2Inr+ZvbXyIFO0niW/XA6JfRMRegzAYX0N/SNWvuKU
 QQ2nSXFdzEFLmRKoJurVrNPDR1ErJaORbRBdWKTCzuZo54nf8
X-Google-Smtp-Source: AGHT+IG+Yqqx549MFKVvhRSUQDeiuXtKQqQpSMgRZTiha1N6EURpeiRAeZWKVyObKqouFzbDpOoTlMmtrrE+
X-Received: by 2002:a17:903:440f:b0:242:9bc4:f1c8 with SMTP id
 d9443c01a7336-242c229fe3dmr62902655ad.55.1754710709819; 
 Fri, 08 Aug 2025 20:38:29 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-jkvlon0513w-grc-49-184-144-89-37.dsl.bell.ca. [184.144.89.37])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-241e8976de2sm14581565ad.47.2025.08.08.20.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 20:38:29 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Date: Fri,  8 Aug 2025 23:37:56 -0400
Message-ID: <20250809033757.1197-2-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250809033757.1197-1-git@jdknight.me>
References: <20250809033757.1197-1-git@jdknight.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1754710710; x=1755315510;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/XLwRRoIx8rLIfmhYZSF7hdgVCIfR5ap5dv0VlbA6wc=;
 b=LK4aNLETzB9FWtxoij1QcCimhKBGiVZMiI6GzGXEt1VW5rPItvx8OtYFFqIa5iclkL
 fSDlCUbOegm3+mjR/EkdJT66Iu5JoCvv/80sGqHf3OeVTD8DLhY3Zchdbi/aKh8cvf03
 cXlnxIHAIcTBYBDSdrWBxfopCARG8sHeW1/LFBkyJ1MaUnSWT6WuR9RTUAk3gBpQMD9S
 osDKOwdjwWwxl4nBL8B/Ol+AyybMwdHEShIf88FTNZoiDiPjZi8YwgDwtXm0GjsXhT1v
 6MfCtZtWZTe4bf6jRPZ/1vz60qGB7OLxkYJnaCp6NH9tIt2gRzpx4kGdX0jaFjFMskqe
 jLsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=LK4aNLET
Subject: [Buildroot] [PATCH 2/3] package/libgtk4: remove schema compile hook
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
Cc: James Knight <git@jdknight.me>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

Signed-off-by: James Knight <git@jdknight.me>
---
 package/libgtk4/libgtk4.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index b00a2facad..f63e320629 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -79,12 +79,6 @@ else
 LIBGTK4_CONF_OPTS += -Dbuild-demos=false -Dbuild-examples=false
 endif
 
-define LIBGTK4_COMPILE_GLIB_SCHEMAS
-	$(HOST_DIR)/bin/glib-compile-schemas \
-		$(TARGET_DIR)/usr/share/glib-2.0/schemas
-endef
-LIBGTK4_POST_INSTALL_TARGET_HOOKS += LIBGTK4_COMPILE_GLIB_SCHEMAS
-
 # here, we build a native gtk4-update-icon-cache as host-libgtk4
 
 HOST_LIBGTK4_DEPENDENCIES = \
-- 
2.49.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

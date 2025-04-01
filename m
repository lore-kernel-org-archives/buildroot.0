Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFD0C3600C
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 01:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBEDD40C71;
	Tue,  1 Apr 2025 01:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxGE1KbvlxPJ; Tue,  1 Apr 2025 01:13:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1470D40C75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1470D40C75;
	Tue,  1 Apr 2025 01:13:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC4E1121
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 01:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C389E608E3
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 01:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ea8N6173wDym for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 01:13:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F14D606F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F14D606F3
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F14D606F3
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 01:13:39 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-226185948ffso97246385ad.0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 18:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743470019; x=1744074819;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/71Bd+hnnfcH7WdgeFqyA3wwcneA1OZOpa4Njiuh07U=;
 b=kYoyK4cQ/r5BeWoGX+lvcz+yk3ydgFPtHt26lxtHbAxPRYT0Rrkrh9sXdTHGB89Wn9
 sPQjIuwlhvqaWP9qFsS5Xaf7p99sdLkTpq6MBfYX//i4O+kktQC7VytCiUL3bkmRsNhY
 +EEouNuAtWuRW86nmhMPEDRHkI+htBUj39ZOLTQjsN/ycGqY7jg/Ji+bapgfaBOluI23
 LpTk3jkMZkLAjRGlCrqC992Y/IUjjeb78nhOG7F35swbeWy7w/G07yT5cVGRMa5h9TMc
 cOUM2IosdSb6e2sFnkYRtnrLRoeQ0zZFvARJ+mZ0i4ifzdV3R02jVHKbGzqMWVjgUdmu
 8Ebg==
X-Gm-Message-State: AOJu0YwioIP3A3ElvQJwbgxTWPdzO6XphV7RuCjPlnSzUDbqvT4joGWV
 TJWWgfVX5vYfV1uExmW1yuJ6zZuwjggfDvtSkEHhZhQe6BPF7AGNoO/jpXmOINc=
X-Gm-Gg: ASbGncukgW1B0bLl04Phy+MjmArQ8nAV5xM/X4EzMhLuTgUBeB7Jspr5nuF9icq6SI4
 fIeSIVBdRa/J1WSovyMbqwWbfXiU3YgYJq93eQ5X5yTZuR9SQEQJNqR8F6HAWQBYcQ1wCfna2hQ
 hAOtVZLHQAaGDcOxaxJbU855cYXUrr0/zXM53vb+gjMUrk488c5RqPhWT6zWo543u/PXQKNgqck
 6XZ0BjvN3wuIzDn6G3CV92KE7ROErwRqtWcpHeIsAXYGnF/uTYGfpilVR/gbjhQMOukE8gou19i
 6LK/R4Fn2L6MgdVXiKVE/QPurRjVjKP7/854k+key2hGLCwAqQ8+jv/q2wJS
X-Google-Smtp-Source: AGHT+IEcSlxZsoxdfhSU0CKDWZTxBcdtGKDwZutbH37qGtG7+bhulaeNIRU1YRwDsMfEliSMo645iA==
X-Received: by 2002:a05:6a21:9104:b0:1fe:90c5:7cfb with SMTP id
 adf61e73a8af0-2009f753542mr20784267637.27.1743470018745; 
 Mon, 31 Mar 2025 18:13:38 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af94d063c44sm5256515a12.25.2025.03.31.18.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 18:13:37 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 31 Mar 2025 18:13:16 -0700
MIME-Version: 1.0
Message-Id: <20250331-fix_liburing_arch-v1-1-296318973123@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAKs962cC/x2MWwqAIBAAryL7nWBmYl0lQnpsthAWK0UQ3T3pc
 2BmHkjIhAla8QDjRYn2mKEsBEzrEANKmjODVrpWVVXKhW6/0XgyxeAHnlapjFXOucbU1kDuDsY
 s/c+uf98P9mgU9GMAAAA=
X-Change-ID: 20250331-fix_liburing_arch-046088894564
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=84EZ1N6faRqNpTDBxMHTwdmsRJ6cl7qywx5BeBfOOPk=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/pr211z5OXyktQkzv5Ne/krI9K4vfEml/r1S9F7FcyEH
 vx8fXFWRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABM5bcvI8Ljt1rOyN6VF+bvc
 HyReEQ5x5DL0qtJ66Xj/eRmjySSP3Qz/owOYPh0v0zqS01B8e+qMTqWdfGlPdu6bWtY6b+GSgx/
 3sgIA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743470019; x=1744074819;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/71Bd+hnnfcH7WdgeFqyA3wwcneA1OZOpa4Njiuh07U=;
 b=FoAOmzIh0giojAd1SUxLCkvWlNfqhJsHHtWwICKC3vHldwYU72o7yYdBfRG8I1V9H8
 k26LxNplZJaobw4eLDaEu6yIUHSANFflWIbrDixJtfVdfzzDxr8peH+tOfe9fPq6WNaZ
 AN9WhMZPmuj/BZdr+4HtipBcDSv99OVwkhQWdrkbQkiF8q6yDQleksF7KVs78vdMryOt
 OAbQpv6S+uaOH7ZcuDv4sI54OciNvaL/6+TJjnrWfw+5/cPeLO/fWciQN1Y2bJ4g/0Eh
 665ZEJJhioF1EdskJ3KHsGCATKBanTdnbjXSXHVmhx3DLaOCZiHZw71DJlEN0EhXByuK
 AlUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=FoAOmzIh
Subject: [Buildroot] [PATCH] package/liburing: Configure liburing with
 --use-libc
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

liburing requires libc when building for any architecture that doesn't
have built-in syscall support (that is currently any architecture other
than x86 and aarch64). Configure liburing with --use-libc to allow these
other architectures to compile.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 70e3b5a800f8 ("package/liburing: bump to version 2.5")
---
 package/liburing/liburing.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index fc3993b38cdd32f589a47c16d6963e87c175a7f8..0bdcc79ee85167788c03ecfc4545777c49d37ac9 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -22,7 +22,7 @@ LIBURING_MAKE_OPTS += ENABLE_SHARED=1
 endif
 
 define LIBURING_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure --use-libc)
 endef
 
 define LIBURING_BUILD_CMDS

---
base-commit: 696703dc5ae7c2a5fa637c76190665791869692a
change-id: 20250331-fix_liburing_arch-046088894564
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

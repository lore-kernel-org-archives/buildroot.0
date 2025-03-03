Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87262C282CD
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 14:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D06240D62;
	Mon,  3 Mar 2025 14:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Z4wy7LebI6X; Mon,  3 Mar 2025 14:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D2C64109E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D2C64109E;
	Mon,  3 Mar 2025 14:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EC27C1
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 14:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DD8F40EC2
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 14:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3a7qGUG56hM for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 14:41:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 754EB410A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 754EB410A4
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 754EB410A4
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 14:41:00 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e5491eb379so1955949a12.3
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 06:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741012858; x=1741617658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1eN3ZzHp2Mphz2GZcONKg5sWSaIxmGkiwtijpwsyKLA=;
 b=d4OuTQ2MhAnnqBjTNpGI2tgobti/F12XbTIsYlpRI+vllagbPcYNgC5mHIfbwULmgM
 kfpHrF8dOwEtHUPZ66i6KUNMdwqfhJR0WC88elmJIvSDUBCYEWhUKUhTHrttKvuqm30l
 e5XHHGWENZUNHlEKmtaRVKvkRXKwf6SNpQxU0gbqGs6bV0Thluy1J2nHPshrgLzINh+v
 K85WtMDPKFfdRf5nx8k/QPBtUQGevGFSZP5malaoiQGuPdn8p598HRnIv8viNooFfQUv
 9HGbuXGsm1OX47US3IxNglbhPLYOJGk5WV5P69QiP+uPButWdOisXwE96CMZ2kHfgPw9
 T3sg==
X-Gm-Message-State: AOJu0YzDyWhgsCEz6MdtxcIZXFQLrUyH4GSEA+bCgLXCJbMMw34uC1hh
 q5XIuseTmJ80ilsXTKoiXXzh7Xbga3vq1sEEosQkOi2ymxfDLnDEw0rzvQ==
X-Gm-Gg: ASbGncvCNsILNi4fKytfPYFJnoh/4wawkuu3oODJTWJVLQO1no/D7g8l5C93tXVKdIX
 g7dJ81Mi2XnhlspVI9FDXayq7X0BAo10RqNaoCCph/qtWaZAicxhx2Q0ckfOBuAJ7woisH+TREL
 VRyMcEpUBbYSi9850/pWiEiVvnBmAK1gs2I5AuaiV/vugzigUiqf57hZ2v4HjKV/i7rvQvHZ940
 1lLjGMKpGHkytkoTDYJrHntFdjOG3eswdbCAh5ROnVLOWA0xW+8tE3w/RU7A153XwocedKtRv7D
 pNsKZzE4s10Cw38cbJOyLYxG579rVaKDCC+TK5HNkBrVy1MAhtlj+NA8OYkY7EWAbGKDbtZfStI
 uAd5NeGWAr8H4DAsM4zn2sYal3A==
X-Google-Smtp-Source: AGHT+IHR5LxzmBMqsfNMPIfqRkHFxpV79kPHdZJWFnHbVvK03zQGyQT940CE1Sxv2cdkazvKANkvOg==
X-Received: by 2002:a17:907:3da5:b0:abf:6e3b:4b4 with SMTP id
 a640c23a62f3a-abf6e3b097emr474661466b.22.1741012857466; 
 Mon, 03 Mar 2025 06:40:57 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf772d73f6sm218941766b.113.2025.03.03.06.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 06:40:56 -0800 (PST)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Mon,  3 Mar 2025 15:40:47 +0100
Message-Id: <20250303144047.268530-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1741012858; x=1741617658; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1eN3ZzHp2Mphz2GZcONKg5sWSaIxmGkiwtijpwsyKLA=;
 b=hyLIqPQv3Qbx7xkX+ArthdL/MPkUxNbyh9PMRJq+nTgkB0eYUDeztaO6Uqru26Sjm8
 bamfKcnB9p/pZThvJ/84sgA9dtqOSU4fB4HdJtx4DDIf/iqmhUUXd5+e5/9q7bB45dR9
 ZzxAJ3D2/vOoyGNMVK/u7n6LquHKbAYUjpLnu9ypEuGPWwkuk1BeTlmkpyNw2rtt4xyG
 1NYDn+8cZUzzfutOD0bydzpX5rsKsoeCdGR+bHeUHfWGofp+sh5VA8NEitsMQeYvU6zr
 Uxvz6+DQ5DRAJ4ebLY2CbjLFFFHPfUXVGShDogpGkGRYulrwfVwnqcQPhy+PTlWKWEvU
 BcxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hyLIqPQv
Subject: [Buildroot] [PATCH] package/ncftp: fix incompatible-pointer-types
 error
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

From: Yegor Yefremov <yegorslists@googlemail.com>

Use only stat, fstat, and lstat structures for the correspondent calls
and let the C library macros to pick the right structure and call
depending on the supported file size.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ncftp/0003-fix-stat.patch | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/ncftp/0003-fix-stat.patch

diff --git a/package/ncftp/0003-fix-stat.patch b/package/ncftp/0003-fix-stat.patch
new file mode 100644
index 0000000000..8581cf546b
--- /dev/null
+++ b/package/ncftp/0003-fix-stat.patch
@@ -0,0 +1,27 @@
+Use stat, fstat, and lstat structures and let the C library handle the
+related structures and system calls.
+
+Upstream: N/A, unresponsive contact email address.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+--- a/ncftp/syshdrs.h
++++ b/ncftp/syshdrs.h
+@@ -260,18 +260,6 @@
+ #	define Stat WinStat64
+ #	define Lstat WinStat64
+ #	define Fstat WinFStat64
+-#elif ((defined(HAVE_LONG_LONG)) && (defined(_LARGEFILE64_SOURCE)) && (defined(HAVE_STAT64)) && (defined(HAVE_STRUCT_STAT64)))
+-#	define Stat stat64
+-#	ifdef HAVE_FSTAT64
+-#		define Fstat fstat64
+-#	else
+-#		define Fstat fstat
+-#	endif
+-#	ifdef HAVE_LSTAT64
+-#		define Lstat lstat64
+-#	else
+-#		define Lstat lstat
+-#	endif
+ #else
+ #	define Stat stat
+ #	define Fstat fstat
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7DCC3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 19:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A86CC813BF;
	Mon, 25 Dec 2023 19:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A86CC813BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmbPd6PYFcXK; Mon, 25 Dec 2023 19:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F115581429;
	Mon, 25 Dec 2023 19:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F115581429
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D9901BF28C
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 19:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6695C81394
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 19:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6695C81394
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IOUNnbpRVmn for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 19:39:14 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6136380E6E
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 19:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6136380E6E
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d4d70eca6so29668085e9.3
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 11:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703533152; x=1704137952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ee2uBfXnVAin3GbZIt+UF5sNSwpEs3rS1XipwdJi/gQ=;
 b=fxl1M/9Xa72DVNXnlSEM5kY/FHf6QvF4SMSnNFD5q1WSCTgdXTqjQprJQMeDfkDLl9
 1irK/R0WJ7cwSrstEWiGa9BrgoaMXJOa60Hd+glMVtf+zM118KA2HzKeVr2JF5BVO8WA
 EB/lYaSva098ax02fWrZo0Asd/347zzPDC7Oa6kPEqkiQE7nYtH4Si+iP3ErrxdxnZwU
 2hXZ0dTf45xPPK6AMdmz1odKLzUv+XCtK8UOQabzXHareb6ZbrE1KjvVlHv/LKbOUAYR
 ISRNnWt5Y2Hrd7rf8Wd+c05FQi1GPy+EbjhE+dHcAXdhwvPH/Ce4lq57rZRp8h8aWKyw
 DHIQ==
X-Gm-Message-State: AOJu0Yz9vE4+CYmhHNIi3vecVEwiS1mLyk5D4VDIDHPGTK4dS2Pz+8XO
 p+ULoa0hy9s0B68W4tyJU2LyjwnYjDM=
X-Google-Smtp-Source: AGHT+IHOuTtzw/GC6/8/Z3LiSuaA/JJfhqAsrZGKWOqow4B1MdZAG47J3FlzQjerQykKma6wharfMA==
X-Received: by 2002:a05:600c:4503:b0:40d:3791:5925 with SMTP id
 t3-20020a05600c450300b0040d37915925mr2141724wmo.135.1703533152279; 
 Mon, 25 Dec 2023 11:39:12 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 ay14-20020a05600c1e0e00b0040c6ab53cd2sm18697092wmb.10.2023.12.25.11.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Dec 2023 11:39:12 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Dec 2023 20:39:09 +0100
Message-Id: <20231225193909.88025-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703533152; x=1704137952; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ee2uBfXnVAin3GbZIt+UF5sNSwpEs3rS1XipwdJi/gQ=;
 b=YSx8TwxazlP0t1cGBNljSsOUz3pYz+2LjPSEV7OsZgzhp0QC/AhuysEdlOJGnNJQAL
 2Lv+FJYd2ruhU68+YxULUu7IPVfgQ/FtFewDkIVkdqmnboP3Q1DUEEyR/qVw63fJrPTC
 qykzfVVi3HxIsplpRVT98b2Srit1Ehc5Lpxb0/mMBFS6BW9+01Lnw/JeWlePum5HRve8
 8iHJxpSYr2s9fc4qCP8+izAFcNvN6CMJeuPLsNhwCxmfX/Zym16aklFTFavSA32M38ej
 OeiqOdqG8ZgJQDx5nNVzQOFrpEbvNFDwLbnadjKPMA6jsMoWhHHhjuEN3NFac78G/zrL
 CX+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YSx8Twxa
Subject: [Buildroot] [PATCH] package/xz: bump to version 5.4.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 92bac4046..3d93ad6b5 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://tukaani.org/xz/xz-5.4.4.tar.gz.sig
-sha256  0b6fcde1ac38e90433a2556f500c065950b9bcd2d602006efc334782bdfe6296  xz-5.4.4.tar.bz2
+# https://tukaani.org/xz/xz-5.4.5.tar.bz2.sig
+sha256  8ccf5fff868c006f29522e386fb4c6a1b66463fbca65a4cfc3c4bd596e895e79  xz-5.4.5.tar.bz2
 
 # Hash for license files
 sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 42fee82e8..547959c74 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.4
+XZ_VERSION = 5.4.5
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F73C0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 16:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2197F820B7;
	Fri, 31 Jan 2025 16:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIsASBrSZA3j; Fri, 31 Jan 2025 16:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A99C8213E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A99C8213E;
	Fri, 31 Jan 2025 16:40:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E07316C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E0408210A
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrJ1jfn1_Ry9 for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 16:40:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48AF8820B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AF8820B7
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48AF8820B7
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:40:07 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so337062266b.0
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 08:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738341606; x=1738946406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DyOWf8qmRy7Z5ojvC/v+GkP/Io7DvJAe9w5+nKjuvw0=;
 b=UIbr847lo1UZMHY9VXka4ccWvynDjYB5yD7dR76Oqmy7YaK6DKY/2AuNfoegbUJeBE
 SOBolBqChAkdgcMBjqIcWAK3EtcjlscUYMe7k4rhcxkvQI/ccdvFFe9dSizBiu6zbMAV
 HMqdydFIG2E6B2LsMgHZgJu+HWE3xvzsB52J3w9qllu/3ZRfNi6oQnU6K1oJksxcw0lZ
 mPtndth/MsodnJMnNKKopmpXgGHi3hmi66N7tF+v6CF7pjxoB47g0ADuBeKVntUYwxlc
 DwVeJz2FpOmvwdOwMHvvSkSx4EVmOTkMtXeyRZ460Se5Q5WyehB5kXtGUjl+N24TZgYn
 2GTg==
X-Gm-Message-State: AOJu0YyYWIhfN+pCpzkX3WgqyQPKaXtfSuq1xQrLVglM0a5a9njsCsP7
 xy2zt3OwYSK1j19e470vMdLrKFMTAtMvbRxud3R87GH5i9pVs5pbAkPBdoir
X-Gm-Gg: ASbGncs5HTSABpCl07kIKuZPqvqIUT5A908JjoMX9cm+e5CA9i/tFi+wRcuL1vT8CwG
 CgzfpObD+uy60U2XykAhwtCNfQEIIeunHdhZovZP65C87kFkTXtdeLMcF3z2UkzzPHit8DmFjjG
 yGoFyMMTaqheHf96Brs4zSIcyVXXhIbIsqOs28HY1Ql6pAL/yzqv8ympJ7xN/LeCjXw5NQf2r52
 yMfZ1gC3Rh2SCk/7YbDaFuxtb2Lexrtu3Ysx66Nv0nhwOD7TWUoy8uycFg1Ns6opguri7OB1gxq
 GsLN34cRbsr4+K5BGRApjiuBA+uTosT7nZCKQoNwG0RwkxpKhSCUYqH6t5J1ZnqhZZLCeZ+Xn/2
 INhrgxMG6JSran3+4ERGycldUdMZSvN+wO+G0jXyrhLGTeOYB+2+gNl0=
X-Google-Smtp-Source: AGHT+IHx4YXrfZ847oRdc8yvb3qcYql8aJ3F6ShvPaeDYs3bz+J0q1gWj6gCUXM6NTpSX2Ioz8nDSQ==
X-Received: by 2002:a17:907:7289:b0:ab6:949f:c52f with SMTP id
 a640c23a62f3a-ab6cfd096a5mr1020299066b.28.1738341605402; 
 Fri, 31 Jan 2025 08:40:05 -0800 (PST)
Received: from saeedkazemi-ThinkPad.dynamic.ziggo.nl
 (2001-1c00-0b8e-2100-a983-d10d-b482-34c3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b8e:2100:a983:d10d:b482:34c3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7be3sm319787066b.20.2025.01.31.08.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:40:04 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Fri, 31 Jan 2025 17:40:01 +0100
Message-ID: <20250131164001.2292378-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738341606; x=1738946406; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DyOWf8qmRy7Z5ojvC/v+GkP/Io7DvJAe9w5+nKjuvw0=;
 b=TB+zFs+2s2sj1/SbGtQK5TJEC77hrUqkAIPc0FLO0QRYB2Ev3ywX9T6Mm3Kz2fW8TU
 Vt76ZtAr5aE2CmWZD8si5MzAJcF3yWAU/knGn/r9KgYVfB4Le/zhhe3Bju7z5zZRZmfE
 +qOduke2Ew/7ZmCB/sQhTPlo1U3YKxabUjE4z+Slq3C4mONFExUyoCBbZ0fkU13TSsdw
 8RnJSJigwd4etMKglD9hlg4nvVIsFeXRN0Rqq/M2FRKA/YZdwB+lu+qgbCMsNV7rczeB
 BjNpi9QLX50WjxRWNV18cHIoFZeFFGscXQ1KPThTf9MPQ/1QbS7J+hIbGcjNNlnWl/9X
 BpnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TB+zFs+2
Subject: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.20.19
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
https://github.com/eza-community/eza/releases/tag/v0.20.19

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/eza/eza.hash | 4 ++--
 package/eza/eza.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 408099e231..0cd422ccf0 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  65a0dc76c1976d7af72a628196022de71c787092da5c6d961a3fcee21f5d1d6f  eza-0.18.24-cargo2.tar.gz
-sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
+sha256  685b22eec7ec8c24137b4af5f97ceea7d262e31fee324d5b4ed66fce24c23476  eza-0.20.19-cargo2.tar.gz
+sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index 4d23116504..cd19c4b4d6 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.18.24
+EZA_VERSION = 0.20.19
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
-EZA_LICENSE = MIT
-EZA_LICENSE_FILES = LICENCE
+EZA_LICENSE = EUPL-1.2
+EZA_LICENSE_FILES = LICENSE.txt
 
 $(eval $(cargo-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

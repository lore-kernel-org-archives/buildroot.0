Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1626C61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C368E40550;
	Wed, 26 Aug 2026 12:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jznefc0kCt3; Wed, 26 Aug 2026 12:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747827;
	bh=DwHU0JvTOfASGyHCX+F4NPIEphLsXW2t5dabUolh7tI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EcYijiiPcuIAtXkxuvppSvlh7tAeTvf81Fi5ygFrdou/RQYeWULnFJzOBB2bDfAvC
	 +taOWVF4mngLXhxPfnePSV66RQHZEOT+z+ztuOtiEORILsQmAbCyowxSj46rOn8UvZ
	 pLf6aP8GNhSUhkgz1kLMaGGTFxMw/zXSsrhQSNrH+FQ3eGjbTNhHjQaPKSuQCvGa4V
	 25JXeK3iESS3tYl71ebdbPQZZa8BS0zKl8TGGDjW8qbXOgrm7x5LV5gJ67q4FimCtC
	 6iuMfYl054dvEnPH7pN95n5WEGwYo6q/Vngl8dujMr0zJyAVxdcEcE19cdfj00Y6bU
	 3tSlzsXNZ8WSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA4D74069C;
	Wed, 26 Aug 2026 12:37:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01C0D3AD
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D927080BB8
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GjPVq3J4vpz for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:36:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9C3080BAE
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6a17cb94b26so1587200a12.3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747815; x=1788352615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mliqn+lu8UHVeTVcn9OCH6Tfli6QDJZopQXaSi3zIIo=;
 b=GGq1IYBdCab8el/LGJ2LbxD910ECZvlBWydFucaLrRD49tRrZbgTMKENpHQ+6GSMe+
 /0L/aT9LtSqfjvPPNufGFN9IauXxNsxlkV6FJF6fODIzmLVaUacxQHyqlmgL1TU/kwJ3
 xEiaSQMHq7+5q1WBzXKOyJlrdtpL1C49Lg0IABehk928lupXJMRZjed8Y38Mp5GLkQpc
 CSFB8AhgRsbMPyVIRyHRjDS04lFN2VrlktBh3ejnq3DfY9ipv/qyXkso6qc+roKR7JIx
 YdHh21mgZwAazTRBi4UMLWJfQi1otvgGDyFyZQpXjCVVILuAr1nlIsdwpoZlzng+09WR
 k0yg==
X-Gm-Message-State: AFuF++kgpmxzatjmeUx7XlyWmwX4/Mz45hIsW8eURixMpd9WhoAypzBv
 q3Ew5AQ+eD8EyauHMAbQr+P8rcSd59uHgvKqRM3JOIhmRLlgSgMz8+GW1KzC3cz0c8MCZOTqUN9
 2PSaKbmw=
X-Gm-Gg: AR+sD13GT6TN/o7SnWJjWmdMdaJsILkbWwjWOhyHlZQ5mS25tn6gTNxPLIN21ZKek5H
 HO3pWH1jiOIs85n89Tj8r69cIJUL2Csqj+Q7symm4PsgOqc2Vv+ApULlFNIlJkBV2VkCUYb1h48
 zymISBYJgVVMN7LYuJi6AODuUXO3lA+5LRaG87wjMw+pwPC0w+h4I9dxlp4NsIw7fMPToJp/S0s
 VYLu3zqVLQxl3kmFbowpQwyxB09AONxTuEF/L4Iq/BXjpm8yWVTB2MrdqyKls6c9USlSMNZak8V
 id5mOsZJ+TqJwTfjgcf+KLlXoTxC+NAH167i2SCFzzWzSCldf9Jz5QajOGeRp6+bvAdzhd+Jx+I
 sW0sdRX6k+zyVehKlpm0DItqXNetu6rUNIzoq7KuRxp/IFEhJjXgKS0dS/JrE5zcU8anC5SwwWr
 DmMJb2GJF/IilQbM1JC3Apj6Yh4dWf12gwWIp11pcBaLmfCE2JSsoun81yGBW47XqE4UOlKc7sJ
 zmwCA==
X-Received: by 2002:a05:6402:5415:b0:6a1:fd13:48a2 with SMTP id
 4fb4d7f45d1cf-6a5df64d6a3mr9737594a12.15.1787747814895; 
 Wed, 26 Aug 2026 05:36:54 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:30 +0200
Message-ID: <20260826123637.410258-10-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 09/16] package/clamav: add patch
 for CVE-2026-20215
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...v-fix-7z-substream-count-overflow-53.patch | 40 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 package/clamav/0008-libclamav-fix-7z-substream-count-overflow-53.patch

diff --git a/package/clamav/0008-libclamav-fix-7z-substream-count-overflow-53.patch b/package/clamav/0008-libclamav-fix-7z-substream-count-overflow-53.patch
new file mode 100644
index 0000000000..b8e80bec16
--- /dev/null
+++ b/package/clamav/0008-libclamav-fix-7z-substream-count-overflow-53.patch
@@ -0,0 +1,40 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Thu, 18 Jun 2026 16:44:09 -0400
+Subject: Libclamav: fix 7z substream count overflow (#53)
+
+A malformed 7z archive can force SzReadSubStreamsInfo() to sum
+folder substream counts in a UInt32 accumulator until the total
+wraps. The parser then allocates arrays using the wrapped smaller
+count and later writes past the end of those buffers while filling
+substream size metadata.
+
+Fix the parser by rejecting archives whose total unpack-stream
+count would overflow UInt32 before the count is accumulated. This
+preserves the existing parsing flow while preventing the
+under-allocation that leads to the heap overflow.
+
+Credit: Trail of Bits, in collaboration with Anthropic
+
+CLAM-2967
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/615f5f327861d5be57d7963c103ee1996657e544
+CVE: CVE-2026-20215
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/7z/7zIn.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libclamav/7z/7zIn.c b/libclamav/7z/7zIn.c
+index 13e89bfa13..646c4a1a1c 100644
+--- a/libclamav/7z/7zIn.c
++++ b/libclamav/7z/7zIn.c
+@@ -768,6 +768,8 @@ static SRes SzReadSubStreamsInfo(
+         UInt32 numStreams;
+         RINOK(SzReadNumber32(sd, &numStreams));
+         folders[i].NumUnpackStreams = numStreams;
++        if (*numUnpackStreams > UINT32_MAX - numStreams)
++          return SZ_ERROR_FAIL;
+         *numUnpackStreams += numStreams;
+       }
+       continue;
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 6be8ab1acd..4aa75161a1 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -45,6 +45,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20214
 # 0007-fix-alz-parser-robustness-and-scan-coverage-63.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20243
 
+# 0008-libclamav-fix-7z-substream-count-overflow-53.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20215
+
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

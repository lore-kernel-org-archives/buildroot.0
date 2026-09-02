Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE99C624D3
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CACBF606F1;
	Wed,  2 Sep 2026 13:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcDTHbWV2wW9; Wed,  2 Sep 2026 13:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355037;
	bh=8doR7bpCKMMJoF34ZmqnrrqFuVNyZQMhlfEHunFEklk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eTcsVNeoQgoun+LSxaMNmkKAomYEMvPbZDOux6PkxFvNa4EhbKKFEgQEAdVP6Fl7v
	 hBYrHivM5OHC8Hgeq7nLxMYj5tv4JRi6Yv7o3RoAETSIHm+oy4hwDRYu7lAwcVpwxL
	 AbxJPLWlrIrtjc4h8ZRjdxlJRHfNtrP1gFbhE1+u+eYQyi7iXcE8My6Oix27gAE/Si
	 742lCt680ibVnBvHdrgASbG2pbOElRa7Ry2YqjZFyrjCAIacadEtNtLZlVNh9yXvdY
	 BdD0JVXFdZq/Y3FXpimT1mMEhK43UAnMygW+ZbUIoV6luIMdJYU09+/DBEJQrvIkbd
	 DG0icqCvoPntg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC8EA60726;
	Wed,  2 Sep 2026 13:17:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE612498
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4CDB606F1
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wE0yV7nmMhE3 for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83B6360648
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so8035945e9.2
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355025; x=1788959825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cHkW94qiSIXLH7gi2JKsqX5Isr5Ze11PaEQ2MaYGS9g=;
 b=RGntzzthbMLY30TtMym5lg+HfOn1XkfBEtWWNbhcddIWF7Z8h86Kiny8xWreOr9Mv5
 lLNsSg/m2e4OS1yl7MJPLoG3MOJlaf7mAWud/qTI9Qz+Q9s6nCT8ioqyOFjJQVq9d+sY
 M3CXr2ezRbENL9GOtUfecenWnXcK6aj31TW7fcyiNmixud0OfmTFDtLY5k8Ad840doMY
 jh58ORtg/xn+5gDm2Hek4bovifFGDVRDzeMyDluxA4aBeec9v0iKfaDVnE5ocPbwqcMV
 dHk3cb9Sj39zv1vHpyEQ++Q4i31qK2t5ijetSXwUN3vbFOuUHSH4s8/rfAZVp0evPfhT
 2Tyw==
X-Gm-Message-State: AFuF++mFQ7mhrnGGpUYS5ja62S7S3A/N8A7q7aeEFdEQGFKnviNf1JoU
 x59xVgQeddPnDfzlNlJsvAhE1GdAQgdOLTTy99o/5Qqvrpa8ScmHKzT5EO5M4LUpRV/CDkTNaeg
 9XzVc4AQ=
X-Gm-Gg: AR+sD11w4x9b3L6x3TAeTmMq7VK0P4Tf0HM/f82/B4FWUCz0qApi4z0+g3xrcITe9R/
 351WYLRW06JLC8EIuz93NPHPkXm45Y28AGFTREGPINOENo7U+tNBiKH2lSk5Dd/Gbqrx4yKJ0a7
 Y0zstbc2PK1ptkKBJbmdGjVPV0ICGIKtKhcQmcslcAg2LfQqcJJ7LabsRy1ELEGdTwmHXdmYYjf
 +c69XR6mNKZZ/Z1FlaenP4/6BWXr7SNl+T+M7joh8p/YlbBOm1Gqt0XAzDJSguL2hcnNr1/+I1F
 qfcaZYe7kJPPyD/ik10mGsKO9UAWYVXJgivG21LyunrBfE+tR4QnfjuOSxOIE/YPJwmDc3rOHvL
 dl8Zd1G0mi4CiuGlUivbEBfDT1bnf5zQAslK/mfOhvn9uODjVjsXy9zry+2Y7YF2aspuOBqF0mT
 PDQdq3QpWchpViqJoTJf0cDBa96jf71tcHflvHnY7BxPJ0xZvyPcrV7501BdD4kssMCPiaHUywm
 mJs
X-Received: by 2002:a05:600c:5493:b0:49b:8f18:714a with SMTP id
 5b1f17b1804b1-49ce5828ed1mr85084215e9.12.1788355025141; 
 Wed, 02 Sep 2026 06:17:05 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:33 +0200
Message-ID: <20260902131640.379588-9-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 08/15] package/clamav: add
 patch for CVE-2026-20215
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
 create mode 100644 package/clamav/0007-libclamav-fix-7z-substream-count-overflow-53.patch

diff --git a/package/clamav/0007-libclamav-fix-7z-substream-count-overflow-53.patch b/package/clamav/0007-libclamav-fix-7z-substream-count-overflow-53.patch
new file mode 100644
index 0000000000..b8e80bec16
--- /dev/null
+++ b/package/clamav/0007-libclamav-fix-7z-substream-count-overflow-53.patch
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
index 8e5d9278cc..45588d40ad 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -42,6 +42,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20214
 # 0006-fix-alz-parser-robustness-and-scan-coverage-63.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20243
 
+# 0007-libclamav-fix-7z-substream-count-overflow-53.patch
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

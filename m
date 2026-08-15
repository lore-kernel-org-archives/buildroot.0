Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989DEC5CFDB
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 15:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 432AD40669;
	Sat, 15 Aug 2026 15:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eZ5dG6FPIZU; Sat, 15 Aug 2026 15:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A1A9406E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786808500;
	bh=EerDeAlHM2aQ1wgaff/2blsJOkjJT8Gc9A10DO1wEOA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lBE3dWs5ubDVFt/tsCcn3m/+2FzF4NObrwmYZQthKfc8ldRsR+dtk4AwBk6AiOsmI
	 vC/q7Bii3oqYsJbMCPjacRmQbrl9HSXIyq4PhEVqGP31HbzXxFD3rrH+ue/O95SIE8
	 ErGeTfE7qrC5XDXo2uk48tvu9MrSila6kW/bg78xoN5g4Y+Itsmonaebd1wQ9haoDB
	 FI3/3V5haO7miQ9t751CuEQJGiGNNy2VADS3ANEB9FetILfiYeZq1rloWD9Luk3glz
	 Cw0VyXaJbeakBl9qBMfurH0+1eofP1wEBvn5bIKYshQyTzcBTqSgVyB4XfgQOSYIZz
	 pwBNMf/7z5UYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A1A9406E2;
	Sat, 15 Aug 2026 15:41:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF10B392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4B596065D
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIpsenqi3dHp for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 15:41:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE20060666
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE20060666
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=s6YqMmUV
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE20060666
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:41:37 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ce7d2adef4so33796415ad.3
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 08:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786808497; x=1787413297; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PP9GGfB8GvX6h5Ew8RVo5r9pOt82rdKQtemy1IPL9Uw=;
 b=s6YqMmUVqWlUSFzK/S/k9KW+YYjKLjTBa/QsqKNbJcDeBvWqBFY6qsmeFwS5gwdNVs
 e13vu3eJN9ylkV7hkPavNNbM8mpIv1N1lmpvoPWfX4uPi1UuA5BYeOErqtNRLKziMKNw
 AOAk1/o6LPwMm5rxLbOMyX+RppM/szziSFEceIW1/1QLMLKPHDTjwAGpRivmmDRW0eDV
 Ns4VnYZd01GmMxrrqsj2Q88sDjDE+7H6KmI1iGmIsZtEbsLqnIdVDCmUcr2x5ODJy9MK
 RUXngP2J0Wu67KdHFf9YdcHNfxxUi9Mu0lR/Vr5vtq/gwkHq/BYyExUhKi5sjXoC14ZN
 mrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786808497; x=1787413297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PP9GGfB8GvX6h5Ew8RVo5r9pOt82rdKQtemy1IPL9Uw=;
 b=iQX+N8GhfPuyALlz4YNQ4oEvHJ1I+EtRwRHsFtkeq1jRo1cbmGZiQGHg3A3xegDYsS
 UN/LlR9NKDiUUj6OFiOi5yA5WjCwfg1ywdrQHdulZATrgcHS6NgkVxyaglg+vI1HhFFo
 xNlzMOQY8s14Cqb0ZdJjwyjKJ64VvaDCD+9s5yXsqYAhW3iRD6nqyQk/GWWUGjeY+SPp
 mu9C2Z1no3SJ1Toz6HydmaZAflyJKzTrE4nd6mWVfudtoC4klH3b9pJKG9Y1Qm4YS079
 yJreWEmSo2+6A7OK5jSHKzaLvmrCDACsJwACXe/TSlf2UJiHlH6TN3oHhp39efhsvVoD
 lmrA==
X-Gm-Message-State: AOJu0Yx9PdOQdkexB8gkHBWLfclBgfseYXLY59/we8LbnSqA1vacdCgi
 dYmkYTYymN9FE1Gd9PYldDeNv0SE7Jjo+z5pnYoyTyzM4R16g/BZDn+IprHr6opy
X-Gm-Gg: AR+sD12cA+H8gssRCtwbj4khHccVznNBvbCyinwP1SFgGnXghxjvaBX6QzdTPaHvdmL
 T5wnOsa8qLbpKDqCVen2hpAg+RzpnOWsJfnQVinGeVv4z2gfDDccqYHVI5eGpdUAJfXGM4Ef6y1
 4pQD27aNw8EeowGJU9kjtEy5SxvTo/tawWlDY8j4hF1laz8NnU9dYXrHry6xYywPLiN2TjBioRJ
 DtW/6LaLPNzwJrZDrrBRiwqSaaGLr2gRg5xxcyhz5emkfYY83folejlOk1GtZMWC3gPnKjI9FwI
 0xBbkl7XS0CNASIFrmW17etpHD5His6SSLUP1EQJvoTFhsXg3yrTlxuF1ghjXkERt11LZy908Xx
 dq/54N+lbnpI4dT8Mjqb9fR5NUEipPusb940XDqe/RY11HmFQZg3NCq6oraddGT+rEUQlUdfNJ+
 4Bik3kkR/SnFeBQPJdL2KtMRjh1oEnuvKshmYslgNaLUvG+w3nUlzPMqBb/okGlEcnYVnqevZqL
 aRSFbg=
X-Received: by 2002:a17:903:160c:b0:2bd:c925:3a16 with SMTP id
 d9443c01a7336-2d3b080c2d3mr158357995ad.2.1786808496937; 
 Sat, 15 Aug 2026 08:41:36 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2a09:bac1:36e0:248::10c:61])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-320ea8fe4c2sm15492759eec.29.2026.08.15.08.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 08:41:36 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Sat, 15 Aug 2026 21:11:19 +0530
Message-ID: <20260815154120.22488-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/atop: fix implicit waddwstr declaration
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

atop uses wide-character ncurses functions such as `waddwstr` (e.g., in
drawbar.c). For `<curses.h>` to expose the prototypes for these wide-character
functions, the `_XOPEN_SOURCE_EXTENDED` macro must be defined before the
header is included.
Without these macros defined, the preprocessor skips the function prototypes.

drawbar.c:2336:33: error: implicit declaration of function 'waddwstr'

This commit fixes the build failure by adding `-D_XOPEN_SOURCE_EXTENDED`
and `-DNCURSES_WIDECHAR` to `ATOP_CFLAGS`, ensuring the ncurses headers
correctly expose the required wide-character prototypes.

Fixes :
 - https://autobuild.buildroot.org/results/b91/b91ea0722202de0d1fdeeaeea167fd1b21b6d5d6

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/atop/atop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 677b60ac1b..6b2c114e91 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -11,7 +11,7 @@ ATOP_LICENSE_FILES = COPYING
 ATOP_CPE_ID_VALID = YES
 ATOP_DEPENDENCIES = ncurses zlib libglib2 host-pkgconf
 
-ATOP_CFLAGS = $(TARGET_CFLAGS)
+ATOP_CFLAGS = $(TARGET_CFLAGS) -D_XOPEN_SOURCE_EXTENDED -DNCURSES_WIDECHAR
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 ATOP_CFLAGS += -O0
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

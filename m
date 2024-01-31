Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF66C47DB3
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 21:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5B16614EA;
	Wed, 31 Jan 2024 21:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5B16614EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRmJVHMqxFy5; Wed, 31 Jan 2024 21:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F314614E4;
	Wed, 31 Jan 2024 21:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F314614E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0B4E1BF4DB
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 21:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D68B783AE0
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 21:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D68B783AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xzo7XmyTT3X0 for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 21:19:45 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB02B83A88
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 21:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB02B83A88
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso2556765e9.0
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 13:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706735982; x=1707340782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HRRrTw4rpzOHLb4Hm/f77IYQBuGqyoRbXZ3DLafInlQ=;
 b=EUdpspehGzg/k4wV7cdckpvu/MO5GyzsR09SQ+MH5dvbz2IcnmNAevziSn7GhHgKMh
 wdliYRbgKjUE0tPxkIRgOa4CcWPLUOO/+jcOklSANs+/x3wvwobw7KPCGa/re/dZg7Kx
 GTHMRBuvn3asbgG/SFsRatWzTCeLZ0nmO+eExA+BSeSYzw7X4PMwaxBiIAcip8ozdAcd
 MBbERo6PyDzR2KVmLTKGhbwqmf6otEOg0cqFIL27lK2uDk5luLvNBEzjaEZltV+6DNvm
 4o8L34HZCG80CttzmUgfkaBc5d7JMZ3KBoT/2z4GZa6BKLUJ0e82EsZcGTMXmiBIZxit
 JE0w==
X-Gm-Message-State: AOJu0YxSbd5h83w4PFbpxFiG7uPjQuNFmCnFTWSW+UoebaRUgjC52Tty
 zfLhd9ykN1XRxhTBTE5yvDYu9Vo5p68QrdMXYr29RWfdZxG/VgAJQZaFaqwGWN0=
X-Google-Smtp-Source: AGHT+IFZrB2ZSvzHTTAHehXChP+BZ2tz3VYiP7KKJ6Eq/0sfZ1M7juQlxZXT3DmoQ9g8CIxYbarX3w==
X-Received: by 2002:a5d:4c85:0:b0:33a:e6cf:f568 with SMTP id
 z5-20020a5d4c85000000b0033ae6cff568mr2146469wrs.64.1706735981753; 
 Wed, 31 Jan 2024 13:19:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f15-20020a056000036f00b00337d84efaf7sm14418380wrf.74.2024.01.31.13.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 13:19:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 22:19:39 +0100
Message-ID: <20240131211939.2222338-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706735982; x=1707340782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HRRrTw4rpzOHLb4Hm/f77IYQBuGqyoRbXZ3DLafInlQ=;
 b=Lu7b/KLLh9GtIF6FCmtlvTfos3JGSVm5lXGr4rgDYpxqP3FPsLndpqJPRkKL2w2Q5k
 UJYgH/Wqh98PH1IShDZfG5yMar5EH5kB8F4+mNuR6/ZHemCtCyXBfKMNy6u8DZJR+B7F
 oxICuhxBjV6sVbj2tCCRL2D183YCC0iKyFzWQmEmrKzw34Y0JDwxnl8AnKNogyszk4Zg
 2NLDeWkAPBCn/omOKBgGTXlrQaZR8r7WS1BnuGDQMtn0jX7IIL40Iykv/K5n1sMLcArL
 +5uEtUb4B7osRS/ybVNxff8ucXkAHr3Zw+jNl8ywoNdei7/crT7d6SfoAAlJFsXEyUZW
 vTOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lu7b/KLL
Subject: [Buildroot] [PATCH 1/1] package/cpio: fix tar.bz2 hash
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b0306d94b29d6f5e08735db0448019f9f4e4234b forgot to update
cpio-2.13.tar.bz2 to cpio-2.14.tar.bz2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cpio/cpio.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cpio/cpio.hash b/package/cpio/cpio.hash
index 20fd9392e7..c67fbc1f61 100644
--- a/package/cpio/cpio.hash
+++ b/package/cpio/cpio.hash
@@ -1,6 +1,6 @@
 # From https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00001.html
 sha1  cbac50a61079b6f3bdcf9ffe42171d9257cfe877  cpio-2.14.tar.bz2
 # Locally calculated after checking pgp signature
-sha256  fcdc15d60f7267a6fc7efcd6b9db7b6c8966c4f2fbbb964c24d41336fd3f2c12  cpio-2.13.tar.bz2
+sha256  fcdc15d60f7267a6fc7efcd6b9db7b6c8966c4f2fbbb964c24d41336fd3f2c12  cpio-2.14.tar.bz2
 # Locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

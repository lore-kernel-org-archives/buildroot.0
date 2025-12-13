Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF5CD5B149
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 10:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E1D160747;
	Sat, 13 Dec 2025 10:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fHTvACG8M-n; Sat, 13 Dec 2025 10:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14EC56066A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765620482;
	bh=M4dGLjWV87abaNX/u/2qJAHtPyHnk6XqCerSO/lwWK0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=re+U8x+Qujv0uv9zIUqXcP6YOTnpEO8O4YxmG2tv7kIAsrMOnX16R6+B4LYiT6zSs
	 COUiA5D/I7j819hlRJYFZEbV9bAMxw5l25DfiC51duPbhMsjOzY/10FW6wni5pN07s
	 khoNLnDG9TdJbGxwVV3D3jXhza3ObvNpKOEjDrQoh8yEjq+WHT1WhAwtRdgLqgZPVL
	 XmLbThR6cv3rzHnK+NSAK27tVnJrwupYEIrgl4he4P3RJ+8RS9BM2i/DT6eooSEN2o
	 Ymsly2tR8+ZvGAMPiZjqoOQfpMq33ZVbkNU1ak+gDiDjq7oM/GnuTnQwBUCOMg8rWa
	 fP9oewymPeQ3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14EC56066A;
	Sat, 13 Dec 2025 10:08:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4ED32C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 10:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C65AC60590
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 10:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WaJvC5pOgcE for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 10:07:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B88C560747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B88C560747
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B88C560747
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 10:07:58 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42b47f662a0so1060442f8f.0
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 02:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765620476; x=1766225276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=925k8JMbzIIAYPh/VO9akn28Aj24MFwyWzHq3ypyccs=;
 b=e6BaRB2IDPVJIp4Khe0ZrnC9eueWQu00qWNk8jzTJFOBf7vwMmxqf0zLpZ5FfWd5T8
 z9TSnn1epolf5eLnasp1dApf/MJORTXad2IbFSbDXMVmxqvOddStMBXBPx9NFAl6XyK8
 hKHxOwYoiktT1VRrLwTKYRt9P/jfNhIiWT+1dEVRf8JXn9xqhvOg6oySSAon6XViScoz
 KQS4GM7pHQcpuJYnTw58yWzEtIGAuvW7A/DS3JvVZuzAdTthJY/6p+M1waqlCNPJIk9z
 axMyFIUMUEGhtJq/7SMnALjKoH/SPFRzXLCww8Mo+YJv3luBRANjn9qNa5RIpVW/8LBS
 z0Bg==
X-Gm-Message-State: AOJu0Yzb/E/SYI7cLBcM2/PJo1RFiNf3ihOf2t929/H+UHxfHMSmm8hr
 yIcxOKHRFds6ms/J/fV+otWs2U8Nmun7VNXj4aifLag0JufwhWpBP/FBiZSXym+8HLNXY+/904m
 T+pwaI7k=
X-Gm-Gg: AY/fxX45fgRczWfndwVjrQ7Ce92u5tCDYnuMOUxie35VJTbsEM7YcRwnKUszsvp6D1b
 f/Ug5DjsnGjrBEbeSI33bRO+IE9eIcLFiKdjnq9WZNIdVqOjC6KhGZkgDpj5qTv2Ho+VxSHwsX9
 GSzckJSzo0Iia+FW+5zANwjtUo2ab3mEGZXGCpK1+YUMPgBCmDVrS3US75O6CpWxs9SOUog4qWH
 CdFQLxSPpe4HxOGCohvHWgKiJaawwPZ9IB2Tjw0SHW6ukKepb9iuJMWfRgT1jgbp/h1II5qz2eS
 jbt7AxaWEJtnT6oju24T4xjAA5ygoBTkHlifzOPIqmOJjYBGz4gRF2Xcy8D6OxP3tNy5pn9I/uf
 8Siw2ILbpqauAQU6CJESjiR1obKAHIrguDf9Uqqjok2tvAT40a8h4U/Dh7OHO7QNG8HTYjgeqla
 3v3vCw
X-Google-Smtp-Source: AGHT+IErBdtr1vItcNG8+fMWk+wYdxfnZFHyZovzDRsvI84XNF6njD3liDbY3u0nSyo3sXnAX//UAQ==
X-Received: by 2002:a05:6000:2601:b0:3e7:6424:1b47 with SMTP id
 ffacd0b85a97d-42fb3e45659mr6490421f8f.6.1765620475809; 
 Sat, 13 Dec 2025 02:07:55 -0800 (PST)
Received: from arch ([79.132.236.244]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fbc6e3392sm4790854f8f.13.2025.12.13.02.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 02:07:55 -0800 (PST)
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 13 Dec 2025 11:07:54 +0100
Message-ID: <20251213100754.198163-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1765620476; x=1766225276; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=925k8JMbzIIAYPh/VO9akn28Aj24MFwyWzHq3ypyccs=;
 b=h9MDI4eBNysSIZnsv/8+npOpJyTzqTzs8HkDoXDCgpMiSY5AJziku/KbqPCedryjk7
 8VlaZ6P3yj0zodmUkUo0gE4icKpEKXlnqBFf+0ViyU1poewOzIatrKIfWZyXaqdsKTJx
 vWimGRyq9X/HOiTTDDGbzPrh5norLTbqfE76QBFSCVQCwO7/gXLX2zJgorFtpC7za0W8
 bAVRo6voc/qS8lDddCXoaxg46KNApN0V/wh47ipUlnqJD2k8HRAA502qfjosP/6jPhIm
 yxImTWTq6HGYMYaEojEIok3Cum2Qp7PrgeLGCIuUPO5gU1Fhuv+UmOjMJC1ARazionmN
 /l+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=h9MDI4eB
Subject: [Buildroot] [2025.02.x,
 PATCH] package/sysprof: remove 'debuginfod' config symbol
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] was erroneously picked because it mentioned commit [2], which
is present in the LTS branch.

In fact, the 'debuginfod' option was introduced in the sysprof package in
version 48.0 (see [3] and Buildroot commit [4]), which was not picked in the
LTS branch.

This patch reverts commit [1] and removes the option it introduced, which
does not exist in sysprof 47.2.

[1] 26fd8eb217 package/sysprof: disable debuginfod support
[2] 52c5c6050c package/elfutils: bump to version 0.181
[3] https://gitlab.gnome.org/GNOME/sysprof/-/commit/d2471d4bf571c3a7c8d743a96c9207d748d763e8
[4] e743759a52 package/sysprof: bump to version 48.0

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/152
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sysprof/sysprof.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 4e67061452..7f1ba4c63d 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -12,7 +12,6 @@ SYSPROF_LICENSE = GPL-3.0+
 SYSPROF_LICENSE_FILES = COPYING
 SYSPROF_DEPENDENCIES = elfutils libglib2 libdex libunwind json-glib polkit
 SYSPROF_CONF_OPTS = \
-	-Ddebuginfod=disabled \
 	-Ddevelopment=false \
 	-Dexamples=false \
 	-Dgtk=false \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

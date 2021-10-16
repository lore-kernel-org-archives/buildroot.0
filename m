Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AE3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:43:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE73A600D4
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE73A600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB45383B83;
	Sat, 16 Oct 2021 08:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GOOH9ihYp0nx; Sat, 16 Oct 2021 08:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3576583B7E;
	Sat, 16 Oct 2021 08:43:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 180D51BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0871483B7E
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxSkju6Yu95D for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:43:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 358F483B73
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:43:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r18so30568788wrg.6
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 01:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BFOXsi9hdz49UK3tXdoDf812r46BFlTPvDK8Xfh0ybA=;
 b=Hw0eQ5kh0i8WqNhZwkImpxYSeuCbN2m074EGvCEN10bjrJLEOKLmXX/aXVqgr/ya2M
 R0hbtM2OKk74M4U9Hm1KL+qWqzTfPQ3ttC9M/DNrwEjXNkd7mD03VjQ8FxdEhQTdccmo
 0iLmnMetAfn8FVtWjb7lgWTZu0XDcjpUl+TlbOvO9VNw2v9ecqgEK7Z9F43KYAtx6/zq
 2KgUf9DPY9DggWtqlXAlPInXcbmkBjCGSI4xq559fi7vErB0brY6itxrT1RNZFDED1c3
 z6JIu16dcVYJ9cM1ZyBvzvtMM8yMVs3aZkzxb8gkhlyJm9/m8FxP18MtxN9cd4xp25kV
 zVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BFOXsi9hdz49UK3tXdoDf812r46BFlTPvDK8Xfh0ybA=;
 b=LsgHQ01Vn5X73b/Ftp5yNiiwxl845yLKl0V0AFUTYco6khwR7/efg+PwfV1mhTli9K
 HVeVxzYIesuYZXbv/vhsLucZD3BeagZNNAbhAH0ZjDapyOSMxKreSMS5JbZMCeCWPiEG
 W5o8mLyXvQ4+Hie8uVhOecpBjXFnjVW6PpNxzpChV+rboCCFK8hDk7xquKehH+e/JKtN
 22rcQRT4I0USkzEPyEO+gB9dcDaD7sYMiGXnDNQtFqowPgdiW9ltGjGD1rSkzy6fsdOB
 zX08gpPJ7RsSvJcuhxA71Vc//E4hZV10G8/vQh3rO1TPsySysc4r0gP0DLluT6C8HXzx
 j0+A==
X-Gm-Message-State: AOAM531jaJPhk6y9Q6053x/Eku/YrrYbv+8OPw4zVdLCyteZJ4NnbpBb
 pNldGyc6D7HWhQ3OXhK7A0B+uVJhufA=
X-Google-Smtp-Source: ABdhPJzairgmOruMDnXmYM81/dUhEmq0A72RTvCrab4/yqLINzNa0fY1WkIe2btQRiS1R1amJr5AVw==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr21249137wry.374.1634373814020; 
 Sat, 16 Oct 2021 01:43:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id p3sm12759955wmp.43.2021.10.16.01.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 01:43:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 10:42:23 +0200
Message-Id: <20211016084223.2475372-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wf111: add missing comment about
 kernel dependency
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

Add a comment when kernel is not enabled (missing since the addition of
the package in commit 5b13fc05b37386e64b9f46515b57b5887ee357d9)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wf111/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wf111/Config.in b/package/wf111/Config.in
index 8dd20a7cc5..bb4b1a5d03 100644
--- a/package/wf111/Config.in
+++ b/package/wf111/Config.in
@@ -19,6 +19,10 @@ config BR2_PACKAGE_WF111
 
 	  https://www.silabs.com/wireless/wi-fi/bluegiga-legacy-modules/device.wf111
 
+comment "wf111 needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
+
 comment "wf111 needs a glibc toolchain"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

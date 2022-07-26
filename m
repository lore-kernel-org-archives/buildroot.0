Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A266C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 06:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3771840C87;
	Tue, 26 Jul 2022 06:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3771840C87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQ8Y7CnmFbMC; Tue, 26 Jul 2022 06:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F942408FF;
	Tue, 26 Jul 2022 06:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F942408FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 672E31BF287
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40D0660B2A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40D0660B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbymXioqiViX for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 06:30:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E28660E93
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E28660E93
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 06:30:19 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id g12so12439300pfb.3
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 23:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NXJrlnuMLWCUj8WBOXf6UVpw5P55lvZpEeMq7Bs4E4A=;
 b=ZUQcJ2etCJOeilIgr3upPTGXpIqy6wqHCk50TU+PqhTqVFtYogInvsYKd0FVNmp7vP
 /RddG6mRplnqYHkLlFycV5ekvdrg1kYYClYTHSNdROgenu9Ij+H+fL9EdqJRf2vyaGBE
 xLZL/QgCTaVeZHvFyq+LgUDiYbRihHzsXD9lzaUi6x5hkE6ZTzRRQacb1uNSX7x6YJFO
 +5KVMlIHnAOjInFA8NiJCDANt0PnJiit2p349bTIHJ2DTpfXjpyEkbOCy3tfTLYFStBY
 wA+fbQuu/tvsWEiIVbawLppEqgFLTBj04nGjdb6zlRl0b/ZVgmduFEwHkpy2HesJfYpR
 d2vg==
X-Gm-Message-State: AJIora+4sCmWCi0qXIBqA4cBQert6Cp/O2/mmmWX3C4lucpposN8f/nR
 vvijwmJFiKzBSjSU/GUan4Z3ms+9UrYnFw==
X-Google-Smtp-Source: AGRyM1v8Trr1NH98GYaxtwb2tWN8gLCbj7HYWM2UBjNDxcIYG++OJFimK+mMYRBZ2A2IkrP3H91rEQ==
X-Received: by 2002:a63:7e4c:0:b0:412:f7e:9ab6 with SMTP id
 o12-20020a637e4c000000b004120f7e9ab6mr13833519pgn.494.1658817018070; 
 Mon, 25 Jul 2022 23:30:18 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 f24-20020a17090a639800b001f2ebfdcd3asm792973pjj.54.2022.07.25.23.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 23:30:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 23:30:10 -0700
Message-Id: <20220726063010.60667-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/glibc: Config.in: fix typo
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

compatibiltiy -> compatibility

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 56f7299568..f535f9f6eb 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -49,7 +49,7 @@ config BR2_PACKAGE_GLIBC
 	  https://www.gnu.org/software/libc/
 
 config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
-	bool "Enable compatibiltiy shims to run on older kernels"
+	bool "Enable compatibility shims to run on older kernels"
 	help
 	  Say 'y' here if you plan on running your system on a kernel
 	  older than the version used for the toolchain headers.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

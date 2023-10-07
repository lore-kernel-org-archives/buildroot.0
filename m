Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD86E95A62
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 18:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E533341BB0;
	Sat,  7 Oct 2023 18:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E533341BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTr6bNeexZ7E; Sat,  7 Oct 2023 18:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B788241BB3;
	Sat,  7 Oct 2023 18:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B788241BB3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9B31BF59D
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 18:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4158180B3C
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 18:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4158180B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IA-BrJS2uND5 for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 18:04:44 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9CE3838DE
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 18:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9CE3838DE
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4065f29e933so31028815e9.1
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 11:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696701881; x=1697306681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yERto+pI3+ZP8278EB7XiCSQjJpuQglnhBntHLZ6eDM=;
 b=C8c3Se1WsmlYC7LvQcyisZodCaKQ3jsHkxnRsTvOqQVQF9kC0V+lM/TlTMNSDNyomP
 L01zZjQrZtkJdp9anXO+n39c0C9dApvgHCfIQXYfGiCR3do7y3AuCd2qrd/RgVJzFsTu
 hNKqqpCxaaplMkvTjsyPduJzbSUaHBipml5them90GN/X7RnQofkfJaFvosRm81ypOEL
 NSMgUejoIX2afI1HLAsKLk+ZE6RMEcGtB4q7cTdbjHFs5zYcO53+a6hzLJUU9rFYaOZ2
 t7h+sDoGOQEt/cSomsGpixFVU964yulz/yzawLFPij6mWQ6awRgZAyMGsgFXGaAWA3Hm
 pMaA==
X-Gm-Message-State: AOJu0YxmtNVgKLYo0/FQUcyeQWlY5/Ch8ts9jCahBjlUa6OexVQ64ptn
 8HHrODnbsbi2TAQFdLLX19ZKuygL2QiOICis9PNOTw==
X-Google-Smtp-Source: AGHT+IFxmGiBzZug1nr3UQ3yl+lZudxFrojymqNHEUsSyF+L21804MXRqsIgjiuS28aqi4h4TWvLGw==
X-Received: by 2002:a05:600c:21d1:b0:404:6ed9:98d1 with SMTP id
 x17-20020a05600c21d100b004046ed998d1mr10459594wmj.41.1696701881177; 
 Sat, 07 Oct 2023 11:04:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a1ced0b000000b004051f8d6207sm6742601wmh.6.2023.10.07.11.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 11:04:40 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 20:04:29 +0200
Message-ID: <20231007180430.1069138-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696701881; x=1697306681;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yERto+pI3+ZP8278EB7XiCSQjJpuQglnhBntHLZ6eDM=;
 b=LkkGtDNyMxQg8qSmcVss4ydtfSagY10cpQ89ukWXCd3djwbHXRMf41WZxOdzOHwqkE
 fTzUFJoXP8mma7x1sfxQ3TuaI2Zc8NJ72veSZYFALzyOChiM8oeQ3teGe7sqqIdYbFQV
 ECqqelFWnlADcQGtjpsgABrwDFotAkf6lVfrs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LkkGtDNy
Subject: [Buildroot] [PATCH 1/2] package/refpolicy/Config.in: force merged
 usr when selecting upstream
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Refpolicy contexts expect a merged /usr file system. In fact, there
are no references to /bin, /sbin, /lib, or /lib64 at all. However, if a user
wants to go through the trouble of creating a policy that works with a
non-merged system, they should be free to do so. As such, only select
BR2_ROOTFS_MERGED_USR if using BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/refpolicy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 0e72b895df..f1f3c7e64d 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -36,6 +36,7 @@ choice
 
 config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	bool "Upstream version"
+	select BR2_ROOTFS_MERGED_USR
 	help
 	  Use the refpolicy as provided by Buildroot.
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

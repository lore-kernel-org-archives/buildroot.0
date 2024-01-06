Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3108FC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 15:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C357860BD7;
	Sat,  6 Jan 2024 15:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C357860BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJk6w7-nRyZ9; Sat,  6 Jan 2024 15:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3903F60BA9;
	Sat,  6 Jan 2024 15:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3903F60BA9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16D8E1BF3B8
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 15:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0806420F8
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 15:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0806420F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQcrzt4sM40y for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 15:01:32 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECAD9420DF
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 15:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECAD9420DF
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e3712d259so6195125e9.3
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 07:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704553289; x=1705158089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JwbChtt3YBouvT/a43+KanGreEHPNFP8sJDkHgazk0A=;
 b=O9uPtDSAGebNHVMWVeCEOysvIF1IPpIiV/+2ZhkZEL5rc6mYvCjj05i+Lj+X9DgBhe
 OMiZ1Is7fLn3S1Ucn2Qe0fbL4OD1qXsC5TgLkTpHvPl1b8P8nLUeXAWeELKq87RLFB77
 HQbxEAyspqYBhBxp833ubUIEPtzIgllT949QYQtUzo04UHbBPWcfET1e2zkHD/GCjZED
 XOqKnfuYBK5VLnQERON3OfMO42426jLN+p1k6n+n9TSplKE0EPn0824P7fpwOxTfmYE7
 G+Xh95SEM/9pujWW2a/wyv6bINnE1mN55kVtevUW3ohRG0S51agCLHO7qbh3D2xhL5E9
 UQvA==
X-Gm-Message-State: AOJu0Yy31etMwxkkdlgm8fJIp7VrvCMblz9GFVMxrPhwYKPphs3TS62C
 RjP8Zat5upSu7PJ7Ko8jEKkmjNu1/Vk=
X-Google-Smtp-Source: AGHT+IEgg44BqMoQ2yr7c9c2OcsjTvSakhI909NANDZKZpZbAtNYaTos7qCeg+TxbN4WHqjmUPrb1g==
X-Received: by 2002:a1c:7c16:0:b0:40e:3ae4:84ef with SMTP id
 x22-20020a1c7c16000000b0040e3ae484efmr371783wmc.73.1704553289010; 
 Sat, 06 Jan 2024 07:01:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v1-20020adfe281000000b003365aa39d30sm3525682wri.11.2024.01.06.07.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 07:01:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 16:01:24 +0100
Message-ID: <20240106150124.1931863-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704553289; x=1705158089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JwbChtt3YBouvT/a43+KanGreEHPNFP8sJDkHgazk0A=;
 b=EGgDV1O5RJhA9oTxAoE7TbwOupDG5+vUegZe+84vciYbxWK9rchHhNXZqYLM0cvJm3
 40Z3RTPgTJxT48ERB9mJmcUZhdpCWOCRYuYWXHu5brjGfRZYG++PHKhDMWwM+5UsncyU
 Mb+9njs/7fgD2MSl+peoqCc5Oz2TbgfwypnAV0gkpnOY55TwhBfVZBP89MzKfNdd84Na
 +AJf4oFKdKR5AV7a6SDvZZj85NngoVpxMAcvNmHGEv2Bg7l4RgAWVmi0TrI6MOPWyUZf
 crj8sOgDqWRWUWlT4ceX1HIJGJDLiJNciOuSOqyZiNper95zQ6J6f0rqIzE9bqtyedij
 RGlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EGgDV1O5
Subject: [Buildroot] [RFC 1/1] package/ipmitool: add hash for
 enterprise-numbers.txt
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit e091e31831122b60b084bd755e94df4dfe7188d2,
BR_NO_CHECK_HASH_FOR is not used if BR2_DOWNLOAD_FORCE_CHECK_HASHES is
set and so the following line will have no effect:

BR_NO_CHECK_HASH_FOR += $(notdir $(IPMITOOL_PEN_REG_URI))

As a result, the following failure will be raised:

ERROR: No hash found for enterprise-numbers.txt

To fix it, this patch provides a hash for this file but this is probably
not the correct way to fix this issue as entreprise-numbers.txt could
probably change over time ...

It should also be noted that BR_NO_CHECK_HASH_FOR is also used by
linux-headers, refpolicy, pkg-generic and xenomai. So those packages
could also suffer of the same issue.

Fixes:
 - http://autobuild.buildroot.org/results/c883235f66b80498ae81429093dce494101d98b6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmitool/ipmitool.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index c3b298e3ba..a900f95b14 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  ipmitool-1_8_19.tar.gz
 sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
+sha256  0673723978fff1da7ab981218ce0da8b5070939dc455b8714d2c9cb21c8721e2  enterprise-numbers.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

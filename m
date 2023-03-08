Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55C9C64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 08:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F8AA61131;
	Wed,  8 Mar 2023 08:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F8AA61131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyeEyNHcxDRZ; Wed,  8 Mar 2023 08:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A98BC60C30;
	Wed,  8 Mar 2023 08:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A98BC60C30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6E41BF844
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC4FE81E82
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC4FE81E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0sYBulUmYq9 for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 08:51:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E6F81349
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0E6F81349
 for <buildroot@busybox.net>; Wed,  8 Mar 2023 08:51:08 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t15so14574485wrz.7
 for <buildroot@busybox.net>; Wed, 08 Mar 2023 00:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678265467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qcK8nh1aXesswpoWHYxWS/3EDHwjP/NQ+wkhruvm7C0=;
 b=1C7kuZnNEMrAV+aYiWARd+yCKGDFwHxnDpx9ezXEtxdXK7btjjkhl6O0Jub/oq9l7M
 2hVcoCXSTVv7u5Ro5ptFNGsQwE4+cHStgUgfnKP9IWLpNMg2P79tqli7eny9QsxjfpSC
 /oyNK14yow2W6iRtaSz5MrweHMm9e4IlDXeOGYY6A1bKhFE9tDR0LdJplunLd/QfQAMC
 rkCuRlTmfqzGxmQnKgLPb2of4HK3KzItIlHOkgeAtN8g29Jn7Oj6vF4s+uGJqohW5ZTF
 O1I+qUypHJj8z+P0HAJ/zbQKH5udFbD+HR2OGYA+/X5cfm6u8g+nX6nIEdtIEFtxAJs3
 xH4A==
X-Gm-Message-State: AO0yUKXoLsezuBtxvmOoJlEcBYxauKjBSeWybQq/66jzJs7lc1IEhYDC
 vXhxlXw8y4UmWtWkBVKSonSzKEBe8Z4=
X-Google-Smtp-Source: AK7set9+moOIpPa9Sxe9J0J2iFQ0XQACWCLkDzgSc7p98oDd3nAiUfoGmMXprg78eGm8NXWaPsHxAw==
X-Received: by 2002:adf:dbcb:0:b0:2cb:5b58:766 with SMTP id
 e11-20020adfdbcb000000b002cb5b580766mr11217743wrj.51.1678265466742; 
 Wed, 08 Mar 2023 00:51:06 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d4081000000b002c71a32394dsm14680534wrp.64.2023.03.08.00.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:51:06 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  8 Mar 2023 09:51:03 +0100
Message-Id: <20230308085103.126448-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678265467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qcK8nh1aXesswpoWHYxWS/3EDHwjP/NQ+wkhruvm7C0=;
 b=WLoovUkFVQ0X/9GFXRXeFotib/U81PmlsKMApP9A1yhv8wMXJomACYwrvl7o7F8sUK
 jS9urvDR4DWfi9nn2ywPickqBTH1spcydKi/CY8b1CrbLFyEfIrCjGU2BuAf3beO2BuJ
 RKNx/rWBrD79UxCskvu51aeILPGpxR7fO2zAlTjnq7K12Y3tetXsYYyTV5YkXsJ6mFhn
 vS98aP7JJiIXcjpG+CRHe43HLl/8yxLN0pZPwfgsoTUg9Rkm12UJ3QHk+EbIGpfEDi7b
 44YuxUq1rmVIbjFGandTL9LVs3yOAAGJMm2A+7J7HGMeaJC9s8VoqBFnyF/Sq7eZ34rK
 lGJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WLoovUkF
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.50.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 1dbc5c919..3e609e6e0 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pango/1.50/pango-1.50.12.sha256sum
-sha256  caef96d27bbe792a6be92727c73468d832b13da57c8071ef79b9df69ee058fe3  pango-1.50.12.tar.xz
+# From https://download.gnome.org/sources/pango/1.50/pango-1.50.14.sha256sum
+sha256  1d67f205bfc318c27a29cfdfb6828568df566795df0cb51d2189cde7f2d581e8  pango-1.50.14.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index f19faf050..723e6d228 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).12
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).14
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

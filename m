Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489AFC4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 12:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00D6C60E97
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 12:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00D6C60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0DC160A85;
	Fri, 30 Jul 2021 12:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ej2HTITb2y3D; Fri, 30 Jul 2021 12:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A7826060A;
	Fri, 30 Jul 2021 12:41:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE6101BF3F9
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 12:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB41C82FCB
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 12:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtMEBQ1W7wvB for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 12:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FA6F82EE1
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 12:41:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c16so11126997wrp.13
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 05:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yle83N3iV8JLeL+26phGB9QDdZAkenVleSQubIrvkH8=;
 b=deCaB/2okqTuDV4nI5SDMmIudA1m6gMn3hxfOqKuMGaDtaJ81+dIvCDOaSICbTRB2/
 a4paCG5ZRIo+nSDBjzt9pYMOksEWAhlV0HWf89l+eTam5bqAG7C/HSdHpivqn3Gp/sOF
 S79WHwKcBfZM0IsOfgXjeWdUVC6v+gQTVuHym04xNexiSgEeu6sUU514hWLI87rbq6V/
 iZu7ANVJkfFzcCdukizSWGhIDjICdiyH24rUQmm0ru8b+va6vq3gMrx4DAMz5EcgZ0vu
 7F0MmZipB/yzo8aN/kOC2vJDdIZvxeGORsPC00dpCuFV0cKc5gy/HgbNd+bN4oEPfb4i
 o4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yle83N3iV8JLeL+26phGB9QDdZAkenVleSQubIrvkH8=;
 b=c01r2ilHMyn0jxJz4G7IYwckHB8T25yS1LVJVEe7oz+7z5HS/93JCrNK7evlkOyUM8
 vvhuRA/FPU9SKyFuXaQ/TkzA9CgDEicqOGP5EJPWhzbYbLfP86YWoYTbXrT8prBwKHYJ
 K/qfZ/yx59BKlAw37ZZ6u208dIZJhx52ypVwkQdNE6ZSnaf5/LUNG0VJsGeUo1AqQC0N
 QWCyoC/4RD3DAsC4p5RuR8gt2hDFnP0c0uO90NkSt21PvWR+Wds4qmHTi+hITE45Y6fa
 1L1KvuIjS31C0gOoYfcftn45V2XfPqJGG80S7R2ro4jpZIOQL6EeF2eV+EIvZzu/9Xqx
 dUQQ==
X-Gm-Message-State: AOAM532B54Csayuo0JP8+a818rt2+A7MNqEFG6jCTBxkf3LyxHNKM9Hf
 Ocrlhqxn8O5OffLi9A/wbJxl6UBtAGcGNg==
X-Google-Smtp-Source: ABdhPJz4j3syzDStsGH8dfLZasbOLo0ZorPtbjR2GE7FC+vmzyfwwTUt40AAzfmYscPuwJN266zOUQ==
X-Received: by 2002:a5d:4e8f:: with SMTP id e15mr2837966wru.313.1627648896023; 
 Fri, 30 Jul 2021 05:41:36 -0700 (PDT)
Received: from kali.home (pop.92-184-116-192.mobile.abo.orange.fr.
 [92.184.116.192])
 by smtp.gmail.com with ESMTPSA id r133sm472304wma.18.2021.07.30.05.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 05:41:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 14:41:21 +0200
Message-Id: <20210730124121.3680793-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/xml-security-c: requires DES support in openssl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Enable DES in openssl to fix build failure raised since the addition of
the package in bbda38afbbfa79ff436e1a187bb267b8d9558036

Fixes:
 - http://autobuild.buildroot.org/results/fb9252de77e020182fea7e9011a3e402c49d926b

Tested-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix 2 typos in commit message

 package/xml-security-c/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
index 81d945f23d..17d0ca3aad 100644
--- a/package/xml-security-c/Config.in
+++ b/package/xml-security-c/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_XML_SECURITY_C
 	depends on BR2_INSTALL_LIBSTDCPP # xerces
 	depends on BR2_USE_WCHAR # xerces
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XERCES
 	help
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

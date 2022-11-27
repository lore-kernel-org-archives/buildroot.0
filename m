Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D342C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB2E8410CA;
	Sun, 27 Nov 2022 13:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB2E8410CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nEWorCUPIkm; Sun, 27 Nov 2022 13:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C343E410C2;
	Sun, 27 Nov 2022 13:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C343E410C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECF141BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8B9A8144F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8B9A8144F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bx8hgh503IGQ for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18C368141B
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18C368141B
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:38 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-142306beb9aso10156503fac.11
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkA86t1yd/thDMJiLjMxl3wLuh+GLNYukid4YTHMArk=;
 b=n3grfzVBqjzhxASdMjngFrZF7UxzQLI/xMD/rhQrLw/EkZD0HfcqeKxukfCanlSKqR
 NNyKtJwcEmNbd1usbVPTYxAiMtzmEHlQuS/en7fLDumSeFKcwKAfThK2RFWGEcZXnsF4
 QNnt7QJjdP29Z/JjW82VgHjwS9Svlf/gf+GxQiSWq/js7Jro1gewAWWVl9wxyR+9CUAa
 6AksrPeP2ky/R+oQ+g4F64FT1CGiWT1JGdBbzeU3GQsgAiollw80jaPC9/KKY/Yo517N
 EZBPyYQRteLfxFyQBFLUY319m4AZWBVfZvVR3yKL1AXRAlMDuY6vPv/QBdynDlIsGiip
 fDiA==
X-Gm-Message-State: ANoB5pnBUB2V189UcVDwIjV6YCdEHlnPHhtyDy0E+sxfaxMdSCe4nHIb
 yjCy1ZDzzPA2V09jpkL/4sXCK5j0/GM=
X-Google-Smtp-Source: AA0mqf7OWcdoTGk0vPa92mT5vRep4qq8N70ThKAmuNHUrkEtTilGhggRItdvXmziZN+6c9eVxGW8ww==
X-Received: by 2002:a05:6870:45aa:b0:13b:67fd:ebac with SMTP id
 y42-20020a05687045aa00b0013b67fdebacmr14368134oao.41.1669554517185; 
 Sun, 27 Nov 2022 05:08:37 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:36 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:28 -0300
Message-Id: <20221127130739.1862398-15-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkA86t1yd/thDMJiLjMxl3wLuh+GLNYukid4YTHMArk=;
 b=c1ILs7bkK/Eyyq+sry4FQUkGwqMMuVYTmt0fF+pEBx7pD2l+Dl+pRx8oJAAArXf0vn
 GQTus78PtszXlpMU4sPgR9Lo4nD5Hq57y8dH0b4AuIGLodP6JkCN7fS6tzVRhqoHcXEp
 4xLObuPdQ4IQx5qmG+Va8H+upjdIr/A6sOW/owXNWzw014R6eQkt5CmkvfFaKZztv/9y
 X2g936d1i4qqTqOjj/j2Opx8YSagYzfRbWK7lXI7htg8GuTuaTLaUdFK4DAFsxldnarR
 fLkpzM9WBIy70YHM/kz73abO4AP1hoWmv0nZjN5RRRyAZCsJvUvcXKsb/aYZVI50pvse
 OKqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c1ILs7bk
Subject: [Buildroot] [next 14/25] boot/uboot: remove use of legacy xloader
 symbol
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "070b183d0c boot/xloader: remove package", from release 2018.11,
removed the package, but the symbol is still referenced.

Remove the reference to it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 boot/uboot/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a729280060..b37fd4c7be 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -442,7 +442,6 @@ endif
 
 config BR2_TARGET_UBOOT_SPL
 	bool "Install U-Boot SPL binary image"
-	depends on !BR2_TARGET_XLOADER
 	help
 	  Install the U-Boot SPL binary image to the images
 	  directory.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

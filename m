Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AA0C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 18:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D855960EA8;
	Wed, 21 Feb 2024 18:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1YZn_pxhV89n; Wed, 21 Feb 2024 18:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 041F860EF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 041F860EF1;
	Wed, 21 Feb 2024 18:14:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2641BF3EB
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23D2440553
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdxVUfz4w0jY for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 18:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2000C40532
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2000C40532
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2000C40532
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 18:14:44 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d1094b549cso100204281fa.3
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 10:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708539282; x=1709144082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O6UiqoZ/rS/KDczGf52ht7aE5sSxR1qIxT8QvyvyYV0=;
 b=Z+3X3IvuvpwZ31V9hzLt8TvtCB4+pVDTgzEP+YEyoNCiXmGVius3W8Mz8sXiyzy8Ts
 EjuNV/5wPwAvJuXE1vKS3+his7fDmxS/MbX0bFGTTL1xkXUWWxqhvFqh5OyjSVxAxNge
 yBdPafHiFLJ0Se2ABSsJZx9zqYpXxicmysVDq6wz+W5dtAsZz5KCQdJAsnp5SNS5TakX
 +AcL7b8krd61s4PlNvc5xuosfmGC8ZL8Usi7jzxsOJ0oSiEVpWuGmTJ8oZt7oItw8/FZ
 b3JjYlgZ8PRqe/lWJMIcXcaI1ktY4Altk9N7LPEnWDJ1yrbsPIngWWihPQ/YEEcJnMrT
 Zqzg==
X-Gm-Message-State: AOJu0Ywd8S86NmzorkcSlPUnH/+rfp/QcOvccwTmx6vncF6qEtBK5CjK
 SrReprCx9ybxjmJBI55KEyQnY0m3Kn3o95Y0o/pbqWom2tWJl3faEolmWNyo
X-Google-Smtp-Source: AGHT+IHdh0i91mH3RczSMLH3tSTOJ6nxBXsXRFF+iwTy6+ntrI9ac7YGlV6C6i3iU0K7HyGb2p6cvQ==
X-Received: by 2002:a05:651c:1056:b0:2d2:39b5:6f6 with SMTP id
 x22-20020a05651c105600b002d239b506f6mr6082294ljm.28.1708539281784; 
 Wed, 21 Feb 2024 10:14:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b004126f8c68eesm6285914wmo.3.2024.02.21.10.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 10:14:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 19:14:39 +0100
Message-ID: <20240221181439.1113724-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708539282; x=1709144082; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O6UiqoZ/rS/KDczGf52ht7aE5sSxR1qIxT8QvyvyYV0=;
 b=bar9x/P5kscFCLWY44pzGLHPOLMzYQrO7KLJjNp2EFT09zVmzczmhhiL8qonRDu9rU
 DvzqvwmGhkfA3e5+XXrdAJMKWfMgsckw4YE3beaYEOqU5s76UchAowR0UutLe0QGTySr
 iqnlnhWSv2ZVlsTg52wKp1u/bS08BEt1WCjg34bNa1iEcs1EDUo6kdO6NURFSmixC4lo
 O6tHOPV92SZTmfon/VeJp2vNIuxLeLd2dlhFTcoemWhADxkVYGu62QIKUsN84H8J8vup
 JilPHtsAW/Hjr/TVLSH7SCBr8ND8vAq/FedhZTbzroxntvDbjK9jsDnKikHy+56Ve/KC
 sOGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bar9x/P5
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: disable cargo
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set HAVE_CARGO=0 to avoid the following build failures raised since bump
to version 2.29.0 in commit 68df20336664d4d0b1a9d8d0285d23eba631845a and
https://github.com/ibm-s390-linux/s390-tools/commit/e6add997ebbcd967734391da8a8987c7926e168f:

error: could not compile `pvsecret` (bin "pvsecret") due to previous error

[...]

ERROR: architecture for "/usr/bin/pvsecret" is "AArch64", should be "IBM S/390"

Fixes: 68df20336664d4d0b1a9d8d0285d23eba631845a
 - http://autobuild.buildroot.org/results/22035cb4d8e251f9930a7d529b91b128919252bb
 - http://autobuild.buildroot.org/results/99be6d3b2bab7c952ce02853f54924c5219aecc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/s390-tools/s390-tools.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index bc39a9bd19..04d193a467 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -12,7 +12,8 @@ S390_TOOLS_DEPENDENCIES = zlib
 
 S390_TOOLS_MAKE_OPTS = \
 	ARCH=$(BR2_ARCH) \
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+	HAVE_CARGO=0
 
 ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

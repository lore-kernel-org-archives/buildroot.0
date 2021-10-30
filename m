Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCBCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:57:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB9460ED3
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DB9460ED3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4739C80D39;
	Sat, 30 Oct 2021 21:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vM-szlP-8geT; Sat, 30 Oct 2021 21:57:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1EC980D35;
	Sat, 30 Oct 2021 21:57:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 078CC1BF23C
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB593401DB
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-Kj_Ey5rK89 for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 21:57:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FAD1401D8
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 21:57:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso5201537wmc.2
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 14:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rq5jrdScjZDZEaT6gdahbTySvFPZh8Wn01WHg7jyGOk=;
 b=PkCZLhB8LNbso//4RSfF27U+xwGfSmRnELYVP2VfHzNf3dmTdEp0FCawFFwfuGaGDL
 noBIsx+YFz09xAjS3fYqR7w4HJ1KCuhPh/k5EcEzQI+2TPgeRFqBEyMBQrKwpd733lAp
 IE53U+BrEqizmwyosZp5BVNHEqS4Qj8ZZvR0MRbdytnmqCRS9m9VenwkYz5Olr85EBtZ
 pUK9I41PbwM6UlYyQwF94BH8/yfsZgjPykOQ4GisgEUfSwFGHOeJe1qhOS7Lw3WD7K6m
 hdYdas0YSORmHHwgXXmBUL8AnqqZoR9Opc5GYn8zjfP3fVLNAUXjhpw4OImAHPI2Od0a
 EiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rq5jrdScjZDZEaT6gdahbTySvFPZh8Wn01WHg7jyGOk=;
 b=k9/OMNhlzJu42YFp6x1fQlK6S3jhlELAHkwtgXj7BP0g+2A76zOlWt0Dcdg85YDalJ
 +IkHH04cFSoKlOm7m5m537qrawrBIVjdBpU21cBKvlVjhUb2O5pyDV6U6C6pS0d2CIZF
 0pNJ4Wpxjknnp0RNx21lTNTYvT5QeqD9ovratfPYlthnX5LWQYSUm10y7YQeeLtLdBGz
 BZ58RDuToMkTgHhjex2OsXl9JcpvSCJTKzqIp0wRhEmbO1sXdsfuyf51+ap5ylGmBnut
 1J8yRCjmoGYrYnBGAYfT61IuxLNQKK8zqtzqCcdtCqPeeim6Wa8jAqRKaGxrXhnLDRy9
 Wm/w==
X-Gm-Message-State: AOAM5300QrrOJVCmAu4pBARft9+7MDwZV1jVgf8tJQiLdH2GCwkvJlLf
 qZ76E4IdHEvMakXWmetiSiKxr9SiYV4=
X-Google-Smtp-Source: ABdhPJxIaEc7khHWNdBJydk7bQHA3DFdVEDXf8wynLKDbPsm80h9smEfeqRwBjw2I3i0buNmTmegNA==
X-Received: by 2002:a05:600c:4f04:: with SMTP id
 l4mr28066833wmq.25.1635631018519; 
 Sat, 30 Oct 2021 14:56:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id k15sm9240176wrx.13.2021.10.30.14.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 14:56:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 23:55:21 +0200
Message-Id: <20211030215521.2155435-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/softhsm2: add p11-kit optional
 dependency
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

p11-kit is an optional dependency which is enabled by default since the
addition of the package in commit
53873b6daecd2a97740833cae7c5b4cdb185a6b2 and softhsm2 needs help to
properly install files:

 /usr/bin/install -c -m 644 softhsm2.module '/home/buildroot/autobuild/instance-0/output-1/host/nios2-buildroot-linux-gnu/sysroot/home/buildroot/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/share/p11-kit/modules'

[...]

softhsm2: installs files in /home/buildroot/autobuild/instance-0/output-1/host/nios2-buildroot-linux-gnu/sysroot//home/buildroot/autobuild/instance-0/output-1
package/pkg-generic.mk:330: recipe for target '/home/buildroot/autobuild/instance-0/output-1/build/softhsm2-2.6.1/.stamp_staging_installed' failed

Fixes:
 - http://autobuild.buildroot.org/results/a05bb71cfe016f793c89b2a035835718836039c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/softhsm2/softhsm2.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
index c418e3648e..5e37e42dde 100644
--- a/package/softhsm2/softhsm2.mk
+++ b/package/softhsm2/softhsm2.mk
@@ -12,4 +12,13 @@ SOFTHSM2_LICENSE_FILES = LICENSE
 SOFTHSM2_DEPENDENCIES = openssl
 SOFTHSM2_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_P11_KIT),y)
+SOFTHSM2_CONF_OPTS += \
+	--enable-p11-kit \
+	--with-p11-kit=/usr/share/p11-kit/modules
+SOFTHSM2_DEPENDENCIES += p11-kit
+else
+SOFTHSM2_CONF_OPTS += --disable-p11-kit
+endif
+
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

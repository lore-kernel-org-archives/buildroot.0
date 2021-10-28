Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D97C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 21:37:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C5B610C8
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 21:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37C5B610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED6A68275C;
	Thu, 28 Oct 2021 21:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VmWaDaJnt8fp; Thu, 28 Oct 2021 21:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6870A8272A;
	Thu, 28 Oct 2021 21:37:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 950461BF317
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 21:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 803F26080B
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 21:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yiv7k5TaLF4m for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 21:37:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47706607F9
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 21:37:33 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v17so12539642wrv.9
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 14:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXvtbR6IZwKXHgBxwxPMfoggpAQ/W2JQ9g04pJqw+yI=;
 b=Zer71aUR9po/+jEgJchGQoCJl7Gny8hkABnazPhwJMSqs3YzoQLHDViqWZHT5woioE
 qebX12czxNrUVXafiXtkszl+aCpK+VjnUxyMRP9aPwa7kIseSRRYnk7qO3/DXz67Sywa
 eDwWQNbu2lWkXd/UkkoIP/6p3DTow7dyQaMjpu3Rir8S7vBglJUwDhFLm1OqKzlZxwd0
 tbiVWlnfLEUuY+qurEtFnpSO+u84VP6/aDWpQr/Uj+Wq8Z29CgH9MJ3KcAmLMx6DtDnn
 /jCG4+RXCrQMNEjIA2BnIgGWDKIiFlBEdBz/frNn/Vj7IPkyccdikjTF0uW9nUeVKQAK
 Ju3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXvtbR6IZwKXHgBxwxPMfoggpAQ/W2JQ9g04pJqw+yI=;
 b=hZXysE8uw12kMbqtqQYDshxN3NPzTTSc7Go76skgY/qWGmRpdqb6vKZDZHPcrETRil
 EN+PcN/DdZMUxK67fueiQtFuQZa+7KT8d33aoUDL9+ehVoG8oCCmqK6lnEazSVrISFRN
 GP9uT2uyEhLMPPh33O0Loo9OHw9B5NGHdBdbgORGl+CEY1SGtd/ebRBwYBmuM2h5bOHS
 JjEkNdX7OvYif1XkzCPKpBN9IfN1J3FtzwATtsUHm2IfIU+zX4DnSORAmSxgRrVA9WDa
 X+/DfJDskNjezWBu1dG1B92Ei+whmCv/iH11KGSExJ4iiC/lrX97NZpz1fp3AXDLoSkD
 TzdQ==
X-Gm-Message-State: AOAM531J5e9iolKlxLqNZBj0p63eRf9LLLI8yy3LD1q45aimntt5YMoe
 OHtDj7QN1BQRVPWr8BSQKXAIcVddNYk=
X-Google-Smtp-Source: ABdhPJxSm6RECZk5a421DwzHgMGpwr+MHIcIOi1x4Id+8ergYGBHPW3ZyfopoZWLrdzKkHdYy77jEA==
X-Received: by 2002:a05:6000:1a86:: with SMTP id
 f6mr9053188wry.343.1635457051238; 
 Thu, 28 Oct 2021 14:37:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id f20sm4526225wmq.38.2021.10.28.14.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:37:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 23:35:48 +0200
Message-Id: <20211028213548.1204302-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/exim: bump to version 4.95
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Exim/exim/blob/exim-4.95/doc/doc-txt/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 201f09ebd6..5cbad08a4b 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  051861fc89f06205162f12129fb7ebfe473383bb6194bf8642952bfd50329274  exim-4.94.2.tar.xz
+sha256  cc9cb653fff2ea947c3702680b59c99ac0bd1bbf19976d37e22a463cd804f167  exim-4.95.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  5334c236221ed4e03dbc33e6a79d939b06037fa2f4b71971607a360b67af5c85a89681ee13a5eeaf0184382c55a160cf2e89ed7afb2949f025a54f1e88f9e3fc  exim-4.94.2.tar.xz
+sha512  93d09c20d99f27da5edbe3e6dc7d25aa4548faa2b67ca26f2cc0b4aeaf58398dd468e0263714fcf0df97531f05d16fcd3f1f0e9d0656ead7858a66b248a44a65  exim-4.95.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index e90419a286..b45458b21b 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.94.2
+EXIM_VERSION = 4.95
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

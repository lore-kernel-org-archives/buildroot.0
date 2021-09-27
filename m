Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB1BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:56:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E50D660F70
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E50D660F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B904A80CF9;
	Mon, 27 Sep 2021 09:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQJS4FPJZbJn; Mon, 27 Sep 2021 09:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 251E680D3E;
	Mon, 27 Sep 2021 09:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDB841BF2F1
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD74380D3E
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMTa-f5VSSNi for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 09:56:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB32080CF9
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:56:02 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 lb1-20020a17090b4a4100b001993f863df2so13107206pjb.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 02:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z76S60wj4qpwTdjnVHpYwNPQ6RefgtoWVkUnLqxe5MU=;
 b=J3Vewceu8TwM/bv2vQ2jkt05O3EbQSEYBEQ+LxlL5v9DnNB40xar4nFGn+J22PD24K
 HjsKrPiz0gJFIYF5n1VRJ0NIy6D2mfsfcFsf05wanQtMt8iJ+O7IDsi+Z7aA7l4OIjs/
 z1U7PNyTFd8l8trXMh4fcsrM+lKy2NH/mwcsmosDJkZHVXekWX5ojSMeyHYbI+w6+lIF
 tvZBHaMbgOMQO3es+VxOW1Q55Sh4uNgPpH4OWHWPsZvH5NcovtLGYEbcrLUtxdqcnVmn
 DLfUPdnFRIhWBpn9aKzSkYuQH619TEDnJ3uw+z0JQKRgvjuhQf2GU8o9O/E1MuYuEgr0
 xglQ==
X-Gm-Message-State: AOAM5336IpKvY26dbBmebiK9ZR+GPQRXNdxgE9Upzwmq2VTMq9QK9OWo
 Q7rVhuYXtpW/HT4YpniQFo1XhkiVS9HVKw==
X-Google-Smtp-Source: ABdhPJxlBDHgDCcLzwzYT9Zr/MqbBPBrn/EjSexGQGYmCjmyYJCpbi3M9IQWkynluVSrPvRrkeBszw==
X-Received: by 2002:a17:90b:3b8b:: with SMTP id
 pc11mr19157284pjb.153.1632736561630; 
 Mon, 27 Sep 2021 02:56:01 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id j7sm16528470pfh.168.2021.09.27.02.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 02:56:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 02:55:55 -0700
Message-Id: <20210927095557.360485-1-christian@paral.in>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/containerd: bump version to 1.5.5
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
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index eb0bafff1b..3840d3ea57 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  3bb9f54be022067847f5930d21ebbfe4e7a67f589d78930aa0ac713492c28bcc  containerd-1.4.9.tar.gz
+sha256  3a580cd5f125fd473c10a1ea38178b0f662777144a8cc83d97dba2d2350f2b17  containerd-1.5.5.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index eb5da65433..ea45c61028 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.4.9
+CONTAINERD_VERSION = 1.5.5
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

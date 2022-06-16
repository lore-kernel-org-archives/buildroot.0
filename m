Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFEEC43334
	for <buildroot@archiver.kernel.org>; Thu, 16 Jun 2022 23:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E6176128A;
	Thu, 16 Jun 2022 23:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E6176128A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgKL3eYWNSy4; Thu, 16 Jun 2022 23:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2F761287;
	Thu, 16 Jun 2022 23:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D2F761287
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9D4E1BF2AB
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 23:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0E8F81470
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 23:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E8F81470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8qGNbWKgvUI for <buildroot@lists.busybox.net>;
 Thu, 16 Jun 2022 23:23:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0A388146D
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0A388146D
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 23:23:18 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id k7so2461215plg.7
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 16:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XDE3wZ8IpikkKY35nAp05UF6aWq2rtobvyyRXnh+u04=;
 b=St4QKc50P93o5outlH9I07dJViJogD5ZiqXnsR4wy/SYCOrS9rvr+HdvyZKCQy8+uz
 qHfx7N253R/BH2sII5PVicy7LNgLblQgT9mOxxNJYOI/eKb585u2PcFL1CcMoRgAk/hP
 lcNfuLdvyB00UsldLSemKsgBhGadMuEZ1wHp53GztjBgvaUXz+J/BqZPRVh5KDJMiCTs
 Xii5U/iF1Y2jqjOtAff2sMwOQQsLuEaKG42CrNQmRkvzjg2x0M8MnlDJV1K1aRNbc6h8
 nYaOuia5mGGPMfp0ylbfdIN2U5CeTgYUaSTCxExHJ6chhJe5BXFty7C9Rwdlz8igLvsY
 cD/g==
X-Gm-Message-State: AJIora+KzWvOtISRTfuDH9L8uDc4TgTPR9DF2Guc/XuI7psgcXe1Qvti
 iAozdDUbH2OupwU1a8ANaJJadg==
X-Google-Smtp-Source: AGRyM1sHpUsFeJwYTShmMbQhHtLvKfpFyYT4snDjJG0Z0Ly9eislVEvePPjf8n39zryUBWXVZ44vrw==
X-Received: by 2002:a17:90a:f483:b0:1ea:84a5:222c with SMTP id
 bx3-20020a17090af48300b001ea84a5222cmr7510000pjb.47.1655421797860; 
 Thu, 16 Jun 2022 16:23:17 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 ft18-20020a17090b0f9200b001e325b9a809sm4250615pjb.38.2022.06.16.16.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 16:23:17 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id AE84346A57C0; Thu, 16 Jun 2022 16:23:15 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Thu, 16 Jun 2022 16:23:11 -0700
Message-Id: <20220616232311.2770826-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iptables: add nf_log.h
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

iptables generally bundles the netfilter header files inside its own
tar-ball.

Since iptables 1.8.8, it started to make use of netfilter/nf_log.h, but
didn't include it in the iptables tar-ball. This can lead to build
failures.

Add a patch that rectifies this for iptables 1.8.8.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 .../0001-netfilter-add-nf_log.h.patch         | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/iptables/0001-netfilter-add-nf_log.h.patch

diff --git a/package/iptables/0001-netfilter-add-nf_log.h.patch b/package/iptables/0001-netfilter-add-nf_log.h.patch
new file mode 100644
index 000000000000..c014c45931e9
--- /dev/null
+++ b/package/iptables/0001-netfilter-add-nf_log.h.patch
@@ -0,0 +1,37 @@
+From 15ea3fa147dea25d8cae3c2ac417142f2e0f029e Mon Sep 17 00:00:00 2001
+From: Markus Mayer <mmayer@broadcom.com>
+To: Netfilter Mailing List <netfilter-devel@vger.kernel.org>
+Date: Thu, 16 Jun 2022 15:29:58 -0700
+Subject: [PATCH] netfilter: add nf_log.h
+
+Since libxt_NFLOG is now using the UAPI version of nf_log.h, it should
+be bundled alongside the other netfilter kernel headers.
+
+This copy of nf_log.h was taken from Linux 5.18.
+
+Signed-off-by: Markus Mayer <mmayer@broadcom.com>
+---
+diff --git a/include/linux/netfilter/nf_log.h b/include/linux/netfilter/nf_log.h
+new file mode 100644
+index 000000000000..2ae00932d3d2
+--- /dev/null
++++ b/include/linux/netfilter/nf_log.h
+@@ -0,0 +1,15 @@
++/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
++#ifndef _NETFILTER_NF_LOG_H
++#define _NETFILTER_NF_LOG_H
++
++#define NF_LOG_TCPSEQ		0x01	/* Log TCP sequence numbers */
++#define NF_LOG_TCPOPT		0x02	/* Log TCP options */
++#define NF_LOG_IPOPT		0x04	/* Log IP options */
++#define NF_LOG_UID		0x08	/* Log UID owning local socket */
++#define NF_LOG_NFLOG		0x10	/* Unsupported, don't reuse */
++#define NF_LOG_MACDECODE	0x20	/* Decode MAC header */
++#define NF_LOG_MASK		0x2f
++
++#define NF_LOG_PREFIXLEN	128
++
++#endif /* _NETFILTER_NF_LOG_H */
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

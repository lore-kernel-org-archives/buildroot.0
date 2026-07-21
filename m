Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFA6C44529
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E298360819;
	Tue, 21 Jul 2026 09:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9oU2EDKhFYR; Tue, 21 Jul 2026 09:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D63696082D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784626794;
	bh=jfI2iLpx1aaTMTkErSRyGFQXxDbjKEbDsIzsntPBeb8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ovke4BdjRrkGQ92pKH4gVYL7c2D/TWeN0XfpsxpmdNpunXbKvLjxA6T4NRTlCBKuh
	 QRwS5ceNnSs4EF2MPyIiy/ogemk/5ACD3SXEMd0khaxSL7lPEpyDgRqMUC4T8RXjEG
	 BpWYKKotSzjZ2eRcxpijrx8HEiUTXk0eZI2ErotwKh0S2G4BnRye23cmmC9XoDMrpO
	 m7Ib117iQySxAe6UWgXBd7BcVYiIpkiPLGTshl5LeoevhVcx7DbT++4EhmkEfOE7AJ
	 sX4EwYHiPzmyRo89H5eQCfegUix/rkaPKaKE5evGRTiewFjPgm0vFNMT6WPObk0CJY
	 Jfk4P42FTOPrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D63696082D;
	Tue, 21 Jul 2026 09:39:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D44142A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13EEA80D82
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvdUG_TL8-SW for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:39:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2303D80B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2303D80B5C
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2303D80B5C
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 09:39:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47f7854678bso588374f8f.3
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 02:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784626786; x=1785231586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EBWO89nrsI/fPRW6ICTWZeH8DX5lANtG+iDivNW+IuQ=;
 b=PVVAyfRc3BVgGzvhNr9euO7K1mJZX7qLm3MxBZ36hZnlsgj+iSiKdkPfEy8EGr7hws
 +TeAixk/3QIYv0FF3NFphmrzGiW8+k1IJUnS4xs5Pgv2Q2njr6XhZAI/R+fOa+61PuKN
 QIII9QJ+FuSwnP58aEBPaVLy7BZVwnowqBH7O9dnwXOkxJ7uoC/fNr8U6YKUv07Plu/b
 NWxPSIYSz2CX7CYM1GmYEfw1xNs/p75YzlbyT7BahEEQTTYZ93vF357i19dMqLn7LKK3
 375w2pfMBB8FFxvD5PrXOpFjEWiDmB0uUTPmVHbPQw74qkZkB5S5CNceTizm/MmmNMAv
 DIzg==
X-Gm-Message-State: AOJu0Yx0cTXWsb8pbrLZ9oijEmRvqPnLEDyZu8eYLJUdzqe+o8SW6oxW
 lrrhGRtmpFzq9qXN9DXygj+3Rw6TFDDVNcTBb3Ad4Ef71XyyYMaLanKTWzA21g==
X-Gm-Gg: AfdE7cn9bTgxzsLekZi7Ra9K6rg2R9n8gruvIxnoyIKO2cd+V43lblT+eiHAXKRFV6S
 uxuTXRdt3uR1BSk/m0JgP98uwlwUHvuCkhpk6PR4I2fJX3dsRdcDznRFWOfrwGbeRYGg5zNTJ9q
 flaxyTGlLhhDoPavKUSyvyFFbol0Rh59bRhBKSCF2NuJgnmKn7UBrpO18bIdlnuoNCIdSnViBAm
 R4XvjMn3sPFSuT04NVH8VFepU0Oc9Ctvnwtxvd6obVkF1OUpsmitMOqkskEfCkSQPFgski9ouh4
 wYBRghrnfxwGknpE5wpvAPkxwALst9dP46Ew2yzWpuU41a4rJdZv1fwpC3AscvPHRH5RL0RR3RZ
 +f/vHTu6N9wlS/vX2ZwTdQouA938xA+jQSleauSmh7Gbio3eWGqVwyXxZ++hc6fqP8Yn4vZIpfS
 5F02/IUgkQ/jA1iDzLJIMC+eYfvxDZnmChMw==
X-Received: by 2002:a05:600c:4ed4:b0:493:aa0a:45ad with SMTP id
 5b1f17b1804b1-4954a3ec5f7mr196354415e9.2.1784626785513; 
 Tue, 21 Jul 2026 02:39:45 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956546db7bsm56227655e9.3.2026.07.21.02.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 02:39:45 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 21 Jul 2026 11:39:30 +0200
Message-ID: <20260721093932.282565-7-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721093932.282565-1-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784626786; x=1785231586; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EBWO89nrsI/fPRW6ICTWZeH8DX5lANtG+iDivNW+IuQ=;
 b=huxQNfxs4TTCE8fgK+2msyp6W6WqW59yPz5viQaNRZDP0S3p8Rm4p4S/nSV8mJSSZ3
 Glk6achoSs/10iZQSX/Ns5hyTC/Nr2oWwSJfuvMs9KURLlzMiWqTuGf3hbTEmVWUkzWR
 sKwviwb5tRoWJegOK8m5oe3PlVc7IZ+s4SkrWp+lmWOQNVbFmgOAsEfx0xN3LRD1Br+X
 T3qDPSydsifufq+Dh5kSjNGBJlqda9YHIAACbdtkLmfFYCaA+GIyapTLK+GwSvzkXrm3
 9xUi6/jPKITkkgcgE1VCOaZ+sml4oXUHO2U5bvW6jLFbPsuAXNnEeFjNeJdiXvMmVGhU
 QTpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=huxQNfxs
Subject: [Buildroot] [PATCH v3 6/8] package/hare-ev: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/Config.in            |  1 +
 package/hare-ev/Config.in    |  8 ++++++++
 package/hare-ev/hare-ev.hash |  3 +++
 package/hare-ev/hare-ev.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/hare-ev/Config.in
 create mode 100644 package/hare-ev/hare-ev.hash
 create mode 100644 package/hare-ev/hare-ev.mk

diff --git a/package/Config.in b/package/Config.in
index 630662477..5cdf0c13d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2168,6 +2168,7 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/gumbo-parser/Config.in"
+	source "package/hare-ev/Config.in"
 	source "package/highway/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
diff --git a/package/hare-ev/Config.in b/package/hare-ev/Config.in
new file mode 100644
index 000000000..5a65e1fbc
--- /dev/null
+++ b/package/hare-ev/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HARE_EV
+	bool "hare-ev"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  This package provides an event loop for Hare programs.
+
+	  https://git.sr.ht/~sircmpwn/hare-ev
diff --git a/package/hare-ev/hare-ev.hash b/package/hare-ev/hare-ev.hash
new file mode 100644
index 000000000..beb0c6f4d
--- /dev/null
+++ b/package/hare-ev/hare-ev.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c80dc647f3a227259c05dab3b42b4cdfee44c68acd8e7cf31245807a8fa79188  hare-ev-0.26.0.0-git4.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare-ev/hare-ev.mk b/package/hare-ev/hare-ev.mk
new file mode 100644
index 000000000..0f374f3a3
--- /dev/null
+++ b/package/hare-ev/hare-ev.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hare-ev
+#
+################################################################################
+
+HARE_EV_VERSION = 0.26.0.0
+HARE_EV_SITE_METHOD = git
+HARE_EV_SITE = https://git.sr.ht/~sircmpwn/hare-ev
+HARE_EV_LICENSE = MPL-2.0
+HARE_EV_LICENSE_FILES = COPYING
+HARE_EV_INSTALL_STAGING = YES
+
+$(eval $(hare-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CA9C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8991940555;
	Wed, 26 Aug 2026 12:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ct2hRvrjYQvx; Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747816;
	bh=Qej44cziP6S1XeYrFQynFyZJBQREC39fR3oyuwbUDgc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UKwkmK8LbMfVqIEsqxvMO0RHCwP2pT+1qJm5Q/mFhJFmsrTXZYFlC689MZDbk9CM2
	 SBITJQRfOdJNW3LyrIWkv9/7ogUrbeyp2bB1ASeeNVjWxDJ3OvO1LqIBuWbwqBMAie
	 pTGrMx7LU7KRtTzjMLHR30bsyQn/DRF4/5Hy+ENx4n1dS+goPi+h7M7jymL4wlTziU
	 EKe42G9IuRKvXKHaNOo9kEEvmvU17yrkP0dFWXNNMdpagErnVJERkkEZWt0adnCJr2
	 qtML5mGq7f74pQKuwApuXnsUkxpgyYAGXRqxKe001jSQ3dqgYEZDNDIArzx5AQH6pB
	 kmPaDX4Vb8tLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D5840557;
	Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91A9F396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83EFD40108
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0PeolmYmLPS for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C234400AF
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6a3efa2b38aso1624526a12.2
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747810; x=1788352610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5cofxIyIi+McKKn4AA0kjQGujjT16j8zAlsFMEHXNmY=;
 b=pC1OrK19Wr442A/2vHCse7jKA3PH2lP7omFPkAzCi2dpuOf8G9JynoC3ipJDVoUVMu
 2RAj6B3NGEfn1Ozd8aV1fqcTa4jGIDf2nOILAvoOm26fiT7Tob6MkR+qagk9vxUp2z9A
 qDk5ZNNM27Q2GPrcwNKaO+m1f/sMpRAEfSI43z15L2EQCuJS0FXEYMQO47xjeK6fLfZT
 U//bFctL+BcwUN7/SmiB1T+RZ2/azYlthk6VD8cyVvFk7TFiTnA95vaZZ7by7sYADXMS
 P1QC5jFxkyckx4oz+9PksdVk3hno+K7jlgV49MxF7zlLDBeZqXBQGl5oSXQZ9eQ/ZoFR
 6hGw==
X-Gm-Message-State: AFuF++nl+NqrMBgdV9kfLK2Y2NFORNrCp7nEhSFd1y2d0ATRjelQw5Xx
 66jxF1x4EKAGw3VhrKhdGzjppLb6RWlYN+ITFUuqOvZi/KJJpWcoe1Fo6oWRfKvgcRxdPfDG7LU
 c69WYe+M=
X-Gm-Gg: AR+sD11ePoW39a6xQ8+zYJmZb2pm4RUbGP+a099JbeVLmB/ofqiXk115cqsp4CyqOvO
 YROcTw0JfpSel1OEC39JoKy478yEYD9LH1zmexgjW7x7wO7NuQeXlNLjLxzeDnsvmslSCR/oiEw
 bBnES9WS1c1wEqp4Fn7Fxs0WagMQDwO7l2Am7lchouNUERekOMWInPwEaynApbFfHc7MhGXExZV
 lvq/oBMt5jGVzm7ucaOkU+79YxR8DKZVPnfIsrnDnRspaWpgzoskiM3vBGmzEAUGg+dW+puq0ir
 dyTQfFdIBLFc1o+7GOth/+G9sD/DYRXa9rz46OV0lR++D6BBGYPyrgsObVGvNru1nFwF98BeF3l
 wHgEzhLWR5HgptKuiIVvHH4y9lo7hwDMf1TSff3YxV9jHhiqjjVd6odulu6dlyVS4TvO+xtYSsT
 bfLqWUWzK4MyssokzIcFlOtaV4QacdD/GPLl6GJyb55RsGlOjy8F5AWFd+o4Lrl3FZUYzSckqOo
 AL8
X-Received: by 2002:a05:6402:2742:b0:6a1:4fc7:94b3 with SMTP id
 4fb4d7f45d1cf-6a5df5b04b8mr8319123a12.1.1787747809825; 
 Wed, 26 Aug 2026 05:36:49 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:49 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:22 +0200
Message-ID: <20260826123637.410258-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 01/16] package/clamav: bump to
 v1.4.3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As indicated on ClamAV End of Life policy webpage [1], the 1.0 series is the
previous LTS (and therefore unmaintained). The ClamAV 1.4 series is the current
LTS version, maintained for 3 years.

However, there is a breaking build-system change in ClamAV 1.4.4 [2]:
    "The minimum Rust version for ClamAV 1.4.4 is now 1.87.0."

Unfortunately, Buildroot LTS 2025.02.x is still on Rust v1.82, and therefore
building ClamAV>=1.4.4 fails because of missing features for Rust. Therefore,
update to the latest upstream LTS version that can be built with Buildroot LTS.

[1] https://docs.clamav.net/faq/faq-eol.html
[2] https://github.com/Cisco-Talos/clamav/releases/tag/clamav-1.4.4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/clamav/clamav.hash | 5 +++--
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 5989682671..833c5fbf8b 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,6 @@
-# Locally calculated
-sha256  5d3a20633bd589f612a71905a4fb50c1ee857cfbe6c72644368cac0030a1eeb4  clamav-1.0.9.tar.gz
+# Locally calculated after verifying signature from
+# https://www.clamav.net/downloads/production/clamav-1.4.3.tar.gz.sig
+sha256  d874cabf3d4765b35b518ef535658a1e6ec74802006a1d613f9f124aa1343210  clamav-1.4.3.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 0a88cc1b9f..93ddfaae5b 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.9
+CLAMAV_VERSION = 1.4.3
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

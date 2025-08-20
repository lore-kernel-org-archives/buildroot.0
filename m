Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0BCCA0EDC
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 07:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF11582978;
	Wed, 20 Aug 2025 07:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwQhk-RkTa_8; Wed, 20 Aug 2025 07:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3075382965
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3075382965;
	Wed, 20 Aug 2025 07:11:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 018A07AD
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 07:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0F3C40422
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 07:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6dzTaOZPnRe for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 07:11:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CAAA41257
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CAAA41257
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CAAA41257
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 07:11:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1900647531; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 Aug 2025 07:11:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uocyu-00EXjL-1V;
 Wed, 20 Aug 2025 09:11:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Aug 2025 09:11:22 +0200
Message-Id: <20250820071127.3466191-6-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250820071127.3466191-1-peter@korsgaard.com>
References: <20250820071127.3466191-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ZL7qWwMBc1mhrEGGp2XfIUo+sT1F3VIZdcqlC7Wjq7OiyO4X9vEXwXJcTgFPWTTr6OBniBDicTCoNEfKLaaWnTLOgJpm6XKISgh3sZpvn2G/mT9EWnKz/Mb2Q8XFCF9ExVmqVhkfmdD4Q9UKJ0D4zHjcT6tj+jLCF0sbjoSsqJqpqxeTKI87zVD85qtkQnzdtKvxb5o3TRBBI4nzJi9eGI/5MCAt/Kxj4qvhFew7C3w+npvhkeYofKt5l+xMQIH3L0ELKCYXsOJDSNFXvrDjnza5CYgwbaGZyPsaf6mwRZ1AiYaGF4Lj2E7I8zL7vTNhifZlnXS04jICXzybESJpIA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=aNRjEuVxsifRRFCoI/UJ15Wxm4xBdTbwJuJnktrYRLk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ZL7qWwMB
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 06/11] package/gst1-devtools: bump to version
 1.24.13
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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index fe98dd7631..9009b96935 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.11.tar.xz.sha256sum
-sha256  73990a939c1ea9d9ca199b8cd135dd3a7120b495004aaa79299257d9cd897834  gst-devtools-1.24.11.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.13.tar.xz.sha256sum
+sha256  2485b30dfb94b65e2e4befb0b9367fbecbfcf2102b24fa9138df4403497e7b73  gst-devtools-1.24.13.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index d4877a8afd..d56d99495c 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.24.11
+GST1_DEVTOOLS_VERSION = 1.24.13
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

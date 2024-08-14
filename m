Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11348C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 20:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B75E7608D9;
	Wed, 14 Aug 2024 20:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOtcTcwHfZUA; Wed, 14 Aug 2024 20:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C62EE608DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C62EE608DF;
	Wed, 14 Aug 2024 20:49:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF46A1BF471
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD752608DD
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzjUk8BUIK7H for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 20:49:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.155;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EC1F608D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC1F608D9
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EC1F608D9
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 20:49:54 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 28B79313A6D6
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 22:49:52 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id q88QsB9p5GzH for <buildroot@buildroot.org>;
 Wed, 14 Aug 2024 22:49:47 +0200 (CEST)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
 by mx.kolabnow.com (Postfix) with ESMTPS id EA5F9313A6D5
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 22:49:46 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx011.mykolab.com (Postfix) with ESMTPS id BAF13315B75B
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 22:49:46 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 22:49:11 +0200
Message-Id: <20240814204912.7116-2-zgyarmati@zgyarmati.de>
In-Reply-To: <20240814204912.7116-1-zgyarmati@zgyarmati.de>
References: <20240814204912.7116-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received
 :received:received; s=dkim20240523; t=1723668587; x=1725482988;
 bh=KlB5Bgu0UyMX9I86cCqb1cqMot+wN/XNQ/+mh8I/FhQ=; b=AF+dSdHNuzAQ
 L0GBssWSRBJcdmguQEH9knKYUzlMuggt8vQAflO4KSSC4/W7fcs1BsNFs3HnvYOX
 s0GQ3dkICHt/2ulZ339Lls+E/dN2eHiAN/KQRPYcr3hduy7WRIDuObImiYit6bRG
 HhiTMvJ4mVrHxJjJ+nbuyb3qVUcCkMm3KMF5amlvt73nUFvCo5kfo19NwEy4JscY
 eX76d+ZepEnohorxAnY3k4UkoSOf6AsVcybtw4t0D6Y9pvXWuSg2HfVu2Il3tV3k
 Dx0LQ3wjq83GE7dh2Wgj4ZzuVVj3tfQG70/U4ZvnVa2LrRjVn0mZU3BnmkCu0+9o
 tKCXi9DxDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=AF+dSdHN
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [RFC 1/1] package/libusb: set dependency on
 BR2_ARC_ATOMIC_EXT
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
  - http://autobuild.buildroot.net/results/459401bab825acf764cdbb156d1ce012183e9b94
Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/libusb/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libusb/Config.in b/package/libusb/Config.in
index 5a04ac128b..637a0c7d4d 100644
--- a/package/libusb/Config.in
+++ b/package/libusb/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBUSB
 	bool "libusb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Thread_local
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 	help
 	  Userspace library for accessing USB devices
 
@@ -14,6 +15,7 @@ config BR2_PACKAGE_LIBUSB_EXAMPLES
 
 endif
 
-comment "libusb needs a toolchain w/ threads, gcc >= 4.9"
+comment "libusb needs a toolchain w/ threads, gcc >= 4.9, on ARC the atomic extension"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		(BR2_arc && !BR2_ARC_ATOMIC_EXT)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

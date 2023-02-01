Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6522AC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C35881415;
	Wed,  1 Feb 2023 05:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C35881415
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNc0HGZJgE9Y; Wed,  1 Feb 2023 05:19:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E8A81455;
	Wed,  1 Feb 2023 05:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E8A81455
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 568B41BF95C
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3079560E4B
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3079560E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rArstCk1KEe5 for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4052E60BA8
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4052E60BA8
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:17 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id w13so3389432ilv.3
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lz3TYxb9u9UjRQQR0qq2Rav+bd2b6kz1FoqGs0Td2g=;
 b=gFDiZvqPT0yHPoSNoCZndZe/qT2+sE54RufSGPuuifcxJvf+p4XGtIl9k5V//LcRys
 nzYb58U98w3DelA7X9LovfyfpLTqUNk3wZkA0m+RgFTIAMvVvetvYOvAnGTsrJMt4PF+
 XcqLLVKTIQNm4sgvkXfwqV0ZenMQkFZdYCNvDoMX1M+zS0KrxY4TOrjw1/kGltR3n+dm
 OtfFcETyXrPyLylMGzHRGjwVpDpQwDQ+Z6MgcqPSduSqn1htHgRniu3j6yM61cMnCxFf
 sW/OHD/epwbxdnUNBwGZMgdWoY8w6aXtj2GTRYDo9R/vbh5+Sro51lCp2e8Saqzsg053
 c7EQ==
X-Gm-Message-State: AO0yUKWC4gdChv6WtyrMjXn8PKQDe+I7NfcA6fWDGvS58+O9+FeLPm35
 RShIILcdZqJXXE661hJDDvZIpTULNdUbBw==
X-Google-Smtp-Source: AK7set+2swKZ5o+kNANV9pyM8/J9E/NLqSO6ERxL+1cwUIxb8Tt3smBGIXoePRPCo6DBjhrY8iT4Sw==
X-Received: by 2002:a05:6e02:20c8:b0:311:478:f273 with SMTP id
 8-20020a056e0220c800b003110478f273mr1123859ilq.11.1675228636186; 
 Tue, 31 Jan 2023 21:17:16 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:55 -0700
Message-Id: <20230201051658.383420-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lz3TYxb9u9UjRQQR0qq2Rav+bd2b6kz1FoqGs0Td2g=;
 b=ZLyuZTBzBP7u9cfkIWRht6hnf1f8Xb5goPV/k+6V2UreD/dclNmpIEP04nsjr2UmpJ
 r9ZY+biCLbJxXUvykW0biyazyakCf4i4T+ZaW4aeA2uEuZpz0tw9I5u8ECebaY7ZZ8rZ
 fKK09n9M5vaSxt7jlaX4PpwfXSz62KxzByxH49GwRqAjErjbBYWPtIA9mzGVU5nomN71
 15qIHagxT5BYlJHc/zfSCJIkafEWD3a4qOVDfGFzTlsIvieqzw/HOAPqRI8oAm4XhmA7
 KKSXkhCW/58Hq9rFonp4wroNzSQfeUtff1yy/ENLAOBprJrjAvyrNIG/LhJBIXTsal4A
 a4aA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZLyuZTBz
Subject: [Buildroot] [PATCH 10/13] package/gst1-rtsp-server: bump version to
 1.22.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index b6a31f8796..f37e7bb292 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.4.tar.xz.sha256sum
-sha256  88d9ef634e59aeb8cc183ad5ae444557c5a88dd49d833b9072bc6e1fae6a3d7d  gst-rtsp-server-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.0.tar.xz.sha256sum
+sha256  aea24eeb59ee5fadfac355de2f7cecb51966c3e147e5ad7cfb4c314f1a4086ed  gst-rtsp-server-1.22.0.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 0b18c1fcf8..6b4bd49fde 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.20.4
+GST1_RTSP_SERVER_VERSION = 1.22.0
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

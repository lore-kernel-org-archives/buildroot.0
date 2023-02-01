Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317A9C38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9CB94148F;
	Wed,  1 Feb 2023 05:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9CB94148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wR3UD5MyCnuk; Wed,  1 Feb 2023 05:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B85F74156A;
	Wed,  1 Feb 2023 05:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B85F74156A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC80C1BF95C
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 871C3405AE
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 871C3405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oAtqAdTeYX7x for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA42405BF
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FA42405BF
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:13 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id k13so3887051iob.9
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w7vAyONj3gXKdOcj/LiZs7q61qt0fVUQ8uPq7agYFaQ=;
 b=7JRC62wIVwi6LwmcQXAOCzzwT/ITZuNYrbc22aPw8w+mI/y9DhF1jbGBVUFWxMqrLN
 uuUDEq6c76RnrEN2wOmn783KZJiKr+39djGCUZwPYXDqzKIsM6yyNHD9BwQ4iIrhHNXO
 CvnQ2NF3IZUgQdG4Pzoq9zEsEZnqprG4+OK2zyfcY1NgLFDcT86GwvSxqkjxhVOXtizE
 e0xoq7iFa/TwN/impIM78xdU1BuoDxo73JxemRUWjKI2wO/4X8AMrk37fLW3rc1p0ss2
 7CpDAVEyvYKPUFGId4MzXHVi4+BKqYj3ZWRBcec0Qlgrbwqf5eHlcnCcDvkZWJIidKw6
 e+jw==
X-Gm-Message-State: AO0yUKWMVqNZxkq4Wc6T2RGElRrdaIbniDkD4JgnfISC48+Y3rIyfwWK
 Y7bgLpLx1MFX1R4xrtGZCh/JDGSutqnhMA==
X-Google-Smtp-Source: AK7set8E7SwH2I6mPiOP2vonflqi89hHr+WDhLBqdcfs9YrRDimlkLyr5N14LLnneTZcOQxB3kmraA==
X-Received: by 2002:a5d:8404:0:b0:71e:8a65:cd4b with SMTP id
 i4-20020a5d8404000000b0071e8a65cd4bmr698889ion.19.1675228632513; 
 Tue, 31 Jan 2023 21:17:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:50 -0700
Message-Id: <20230201051658.383420-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w7vAyONj3gXKdOcj/LiZs7q61qt0fVUQ8uPq7agYFaQ=;
 b=mQR2V/TiA7irddQjYe16YpdBqRIq7nmRX+bz54rZU7kxh4MsOW+PqRi/bpXGST4bEH
 kmMa+u6sDz6YM9O7VE6PkgDpiyTb1/aqNa2/l6gefC9A629MuwzpqXKAOFqVO0QATwOO
 /v6oC/zwSvb91awk8fr1zfak2Wcq/hcyjl2LPJtWV2FvoOL8IoTlMguJ2JzRuMrnqXrI
 Ybw7RSyoeH3Vyns4hgVfkLhymx+eYh60X0FUpP9EN/FLIvaXnlCDc314EuYhW3Dme5+p
 xbN70rTsiXmYVx2LD6otYXCn5ZHUPXm9VdZRYPgZI/zKYfzwdcn9vr37fgcms0FvZaiS
 UiNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mQR2V/Ti
Subject: [Buildroot] [PATCH 05/13] package/gst1-plugins-bad: bump version to
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
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index c8789a707d..90b3a18982 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.20.4.tar.xz.sha256sum
-sha256  a1a3f53b3604d9a04fdd0bf9a1a616c3d2dab5320489e9ecee1178e81e33a16a  gst-plugins-bad-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.22.0.tar.xz.sha256sum
+sha256  3c9d9300f5f4fb3e3d36009379d1fb6d9ecd79c1a135df742b8a68417dd663a1  gst-plugins-bad-1.22.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 14710a2501..8f11ce6b37 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.20.4
+GST1_PLUGINS_BAD_VERSION = 1.22.0
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

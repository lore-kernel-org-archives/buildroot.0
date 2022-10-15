Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12305C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1D93408C0;
	Sat, 15 Oct 2022 23:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1D93408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4QVgK5LJWZNh; Sat, 15 Oct 2022 23:07:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7164405E2;
	Sat, 15 Oct 2022 23:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7164405E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 937401BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EC1381911
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EC1381911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Z-VFixYfG2O for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 862C781403
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 862C781403
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:48 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id y17so4230423ilq.8
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zt7Y7SLlO3OK56OMEL8X+lB0k6N16Vaw6qMnntSOvEo=;
 b=7wv80xR4ll3rfVAuYAhHjm87ZpERvXBVKnuuUfcKTpRUgFHixr3iOht5tMaKBph98g
 Ypq4jqyupstfw/pV24zM6fR8p/aagmqqE6d7shPJV8bv+H9s1Sf/mrr2r5ofBBJdIGdv
 tlGkpaqaSTlJR1zODwxB/Hf//j9c5VxuEqV0pcE0yfzeX8RJyoRCTwgt1O/esURi/HDA
 kHM/jboFSDfVYL5cl02vrMDaWlIaJiCrS0KypdVEDTj1b+SIRhaYbdJh+i/mPqdJQq2v
 2gd83KvOQtkjoNSNJgRGErHlCgeCMFN8+tCiKo5L0EuU23JQbZTAoMo9S4uXFd9iCo+8
 wGbw==
X-Gm-Message-State: ACrzQf2chwxBoKsLcziuNoUBoYjFdMeD54sw0JDg1NRbvt1WjfXTUwV/
 gdkh2HFfXtNrEO8RWDQZyh/Xw8UG77If9g==
X-Google-Smtp-Source: AMsMyM4bXoJdvwvRgV3aA77lNo9YTsSfiHMMYRJwoiU7QlxOLpDfApc23VuPT+9+Z4/gl6lhVV2d4Q==
X-Received: by 2002:a05:6e02:18cd:b0:2f9:e186:e673 with SMTP id
 s13-20020a056e0218cd00b002f9e186e673mr2009527ilu.297.1665875147304; 
 Sat, 15 Oct 2022 16:05:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:33 -0600
Message-Id: <20221015230534.4016536-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zt7Y7SLlO3OK56OMEL8X+lB0k6N16Vaw6qMnntSOvEo=;
 b=QLnPFCl3w+k0VtCsgr+IvFEqLRbaM5xTP20kxy8foCrcH/eyIA5aKV5S67OYDJZmsF
 zO5w0F7G6Njfq1hIlxJEpzORWuEAt06dbmEBLR8y17G1b9PUJfpjMT4Qy37ZFLd1/kyy
 j/Ko5okXarp4x7YO0Ah7YNeSeJxxav7jFqGtJt6a8t5bn+mYt8Fg1KjryNIFBOR3JT0W
 2cd4K0Vmxv9da4TzYHI1trVMTVgCYrVpOryzLa47qV1OKlnJ7PnM+KRpotHhhm5EbiuJ
 hc4k5YqZh+6LDl+g2mtrZDWjRXCEOad+CyHwsbdKwR8Bveiw6Ax64q3A9w1AH+JJWwuF
 LiDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QLnPFCl3
Subject: [Buildroot] [PATCH 11/12] package/gst-omx: bump version to 1.20.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 8abf4a27e8..140ad626f7 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.3.tar.xz.sha256sum
-sha256  8db48040bb41f09edf8d17ff6d16c54888d7777ba4501c2c69f0083350ea9a15  gst-omx-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.4.tar.xz.sha256sum
+sha256  70ddd485e2dcab79070164d61ad2ff3a63e15a1d7abf9075d86eb77762b0edfd  gst-omx-1.20.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 085bff87ad..d644c44995 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.20.3
+GST_OMX_VERSION = 1.20.4
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

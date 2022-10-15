Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E84C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36001414CD;
	Sat, 15 Oct 2022 23:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36001414CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dcyGwgyEySQJ; Sat, 15 Oct 2022 23:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E144B410A0;
	Sat, 15 Oct 2022 23:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E144B410A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3C21BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43CE181403
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43CE181403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alDmEffVaqDW for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5569F81911
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5569F81911
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:43 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id l127so6552013iof.12
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UAk6c5ljaOFb7AsqbRLwTceaKUWRzIpulG+xlHzJeOg=;
 b=hsIwBULpNAye2ZFmL2dEH22w0gxjItQ3MHGoZQH1oJGbaUoecY6QOcl641BOVtmCt9
 WTIHIkUZdFFodvCRL6SmvJiPfz0Prc4UwHKk3s2GCw0hSlc5lDO5xy05STJtMsroYeKk
 ybxh9CilkBloNZYI0JgtjL1/RIyJub2vF7XYEZpZ+MWax2tQl3xYpcC80rgBg21V3zwO
 2S1QsG4YC9Kkma7NLbFr0Ahoqisp7ZKFhcFq6ol2Yvc38sfSJi9k8LfHh36YBF2BPJkm
 Ot91lSqwNI3cWPVSqJQAbRx2Xyaaim+qHUpl2fk4D/EkYQfbZduxgd+NKL/0cLYXuvjt
 tX3w==
X-Gm-Message-State: ACrzQf2GtQk3hCIhgesbvIGsW9XBefK7LJW5dXTCnuXpsKlFpmAF3/MP
 2ksWP4l8e7zEEKWK965w1aY8EYbQ5XCO5g==
X-Google-Smtp-Source: AMsMyM6wzupVSBVw5JYGbg3dvYy1h0zOdtIu48LTmkcE6ORzP7C00XAnGo50LwBhvrHx7duTRHW9IA==
X-Received: by 2002:a05:6602:14d5:b0:6bc:ad1b:c991 with SMTP id
 b21-20020a05660214d500b006bcad1bc991mr1860547iow.168.1665875142022; 
 Sat, 15 Oct 2022 16:05:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:27 -0600
Message-Id: <20221015230534.4016536-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAk6c5ljaOFb7AsqbRLwTceaKUWRzIpulG+xlHzJeOg=;
 b=djJrfTedZIEJ4Bn/Ky86bE2dcpg8RRIFtvWFU4nczfjkbCHVJjOHYWkEzThjQtRilJ
 6ohEVnyvLAt9VnI/8T4DtqOf7hPD+g868mwnC2skQFBFkxTumpf7c9jizDTCs6ll5Fky
 5cShv2reQd0u2Us52ou3RACfG0rOO/Zp/eN9eHaIeGcViYDAQO6rPOsQZfVd5qnEeyM8
 C1MMRXEO+CFxyTw9+QDUVtKXuqnxWgdxM5R5i+w9uotQmEx71tXqnCXDYnaqf+p4+cQh
 Hh/2eVvnx9ZJYy5IWVyrOa/Dce7uHU1ODHed2t39HFUwk3qy1cGc1P/h/dHHQzPy76aC
 jHyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=djJrfTed
Subject: [Buildroot] [PATCH 05/12] package/gst1-plugins-ugly: bump version
 to 1.20.4
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
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index ffd060f465..4ec29e6894 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.3.tar.xz.sha256sum
-sha256  8caa20789a09c304b49cf563d33cca9421b1875b84fcc187e4a385fa01d6aefd  gst-plugins-ugly-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.4.tar.xz.sha256sum
+sha256  5c9ec6bab96517e438b3f9bae0ceb84d3436f3da9bbe180cf4d28e32a7251b59  gst-plugins-ugly-1.20.4.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 131163e20a..20382719c3 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.20.3
+GST1_PLUGINS_UGLY_VERSION = 1.20.4
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

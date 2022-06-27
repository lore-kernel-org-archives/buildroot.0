Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17970C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA53D4013F;
	Mon, 27 Jun 2022 05:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA53D4013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBHH4XKKqmd1; Mon, 27 Jun 2022 05:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFB2F4013E;
	Mon, 27 Jun 2022 05:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB2F4013E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9BC1BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3718841767
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3718841767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Db5ViMRra8Ai for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 868394171B
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 868394171B
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:35 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id p14so5316608ile.1
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FfZ6F3AUHl7CtranStunsKxdBUocVoZ5rZLv+WqAvlw=;
 b=mNxtvy9gY/5lNZ2+JSFVJeJhVZ+pFf5Ky0SfcHx563VLwex112z6Ph1GQO6qnFB5To
 iMtq0baZTQ/9eh7Cdid7iII1bCBrh8zU25c3TZS4AoYW72ohgb0FIT3eX6qg8yaGtgQe
 ofNIr/3dMBOBHPppepjX852Ot+XOM66VfaQuUNVI77zSMX86SsBMyT04vNJY3vgLI48W
 s5HpJlpjI+DHwPOhIA2QzURyH10/1qrO2JWguTEcAWN0WBcAPnDxrPc2LOY7CboidxSB
 ddemg0q04Qez/HGEsen0ZVlmUyIvicmP9zTbjPEy/e3NdR+eTadtPqKHZb6z829W4SD1
 5CMA==
X-Gm-Message-State: AJIora++w20aeX9MH0cWHcxkRSFKQ8sW34f+QJaQ/tQOm/LJu+mYhyAb
 bhc7/wWC0pw+315MOWSbbBUYopCFSf4=
X-Google-Smtp-Source: AGRyM1sG93KqrN+Sctw9JiDMsHfuTRGhp1kJPjIiZco9m6qAPRV2J8w3p1h1R1n1q/pMvy00+Z8E4w==
X-Received: by 2002:a05:6e02:12e4:b0:2da:73e6:1d8a with SMTP id
 l4-20020a056e0212e400b002da73e61d8amr5915039iln.276.1656308074536; 
 Sun, 26 Jun 2022 22:34:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:21 -0600
Message-Id: <20220627053422.618280-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FfZ6F3AUHl7CtranStunsKxdBUocVoZ5rZLv+WqAvlw=;
 b=CJMOjmXQBkt3knKr58SlToxiDBphNr8ztLjZim1CEjjhrFRZgHY6QAMUpDYuGSAAuS
 m3VV70bBb5zUScAW6GOWTY/bArJNbo+XgrNVWF1c63mlvHkjhzX330xJB6r8AdtbFqB8
 BSITD6JW/6/hvwySAEYM4XPWFm5/1krVKDxt9RzxADB19h8nRRxXMze7jlyRUoCLJM58
 mfJiXvgK4+VKsmBLEcuU41DlSEfEdWHeZ3/uPRoeruqW9/2lMF72FYe3ch4zqibXwigr
 nXbP69+HLnR1A/uTviERlXEkCpoywiyp9NUaYqL+3NTbdc1O3JtlP5hkrWKzyjOtbYgn
 ZFVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CJMOjmXQ
Subject: [Buildroot] [PATCH 11/12] package/gst-omx: bump version to 1.20.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
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
index 33c20defbc..8abf4a27e8 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.1.tar.xz.sha256sum
-sha256  86b52e30ebd0f59fcb5cf81a163211975f73ef32e5a6782562804646316bcd7c  gst-omx-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.3.tar.xz.sha256sum
+sha256  8db48040bb41f09edf8d17ff6d16c54888d7777ba4501c2c69f0083350ea9a15  gst-omx-1.20.3.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 462c88765b..085bff87ad 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.20.1
+GST_OMX_VERSION = 1.20.3
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

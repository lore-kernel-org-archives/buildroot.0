Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79500C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26E4182F14;
	Mon, 27 Jun 2022 05:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26E4182F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fp00DWxr58Jd; Mon, 27 Jun 2022 05:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3139782EBA;
	Mon, 27 Jun 2022 05:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3139782EBA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34CB91BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1069182EBA
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1069182EBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYCWmsEbH5xP for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0FED82EF1
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0FED82EF1
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:30 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id y18so8484765iof.2
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZByc6eOqMKpiwz7WYB6Ict5+j0cR+gDgzjGB//51zWg=;
 b=Slo35tfirm7E81cEz/IPVTGmL88kJz+m+awpv5YxwWWpR/YKDgfdNBNsn93ZMy3bwq
 wKFOYqBucDZtVzyVwh3DzOUFAV1PGgWAGzAaIhrQeTSJKF2O70quG1JkhOUF4vmwCwjw
 ntVOYAT7HwFAn7e0AMB2I+6bw7f/nJt5CTaWnDP6k5BvKWyDY63CrMWVZ+gebChEEJ7V
 5TlHpNStSf5PGnxB3CfGQtiVHs7b9JVnMH0lzYM+90q1V85v9qzhkNOrzKogVIaDQ/yp
 EaiIH/AM4+GuCgzUDiPeE0s3UT4j/tgmbwEloOqk2d8SfqR9c4kXYvHaDjP77ixvItiW
 lmlw==
X-Gm-Message-State: AJIora/6+TF5YiRF816ZVoqMrdkOFk6Wzxp69SbBJPvXW80GfAWxfNnq
 Zib55EdE6fV5SGQhNdQF8aWojuo8OOQ=
X-Google-Smtp-Source: AGRyM1ux/5Nu/Z7PC538LoLb2iETdc5O9ffD2sPcBGMG+vT3gtggDnvGdDTRqD7HsX7TDyo8Y8AJzQ==
X-Received: by 2002:a02:9f09:0:b0:339:e88d:f9bd with SMTP id
 z9-20020a029f09000000b00339e88df9bdmr7142687jal.298.1656308070457; 
 Sun, 26 Jun 2022 22:34:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:15 -0600
Message-Id: <20220627053422.618280-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZByc6eOqMKpiwz7WYB6Ict5+j0cR+gDgzjGB//51zWg=;
 b=f1cFNU+VRbOWbSKTz0iqHNHGjn5nzSQYVVW+Z/kkrcQXgfkMc/ywj2z7G+q8b9ZmsL
 nQC+/lTdmWy1/UG5yL0j5tQ4wPmNPq8JWZn4MH2lJJPEU3K7rKuythUVbaNAG6bMAk8+
 xjPYk4+WYm/IJYsf13j3m5bypQJ2oMan7OW0a76t/EBbDV7dsZXdKi7MLNCEfslHXnbZ
 +uaXzrIU64FTY4Wsc+JDHCODxp2y4/j+p9emmrbiuQAGV/DG0GbLcGhwQIVtbZF6OCQg
 U76NlUsAFADpykwTIX/uaWnis2ko4rm/qYOF3MdQCtJpZkZWKL0jmi5Bf55OujICO3yn
 faig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f1cFNU+V
Subject: [Buildroot] [PATCH 05/12] package/gst1-plugins-ugly: bump version
 to 1.20.3
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
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index d022ba3180..ffd060f465 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.1.tar.xz.sha256sum
-sha256  42035145e29983308d2828207bb4ef933ed0407bb587fb3a569738c6a57fdb19  gst-plugins-ugly-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.3.tar.xz.sha256sum
+sha256  8caa20789a09c304b49cf563d33cca9421b1875b84fcc187e4a385fa01d6aefd  gst-plugins-ugly-1.20.3.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index be45d183f3..131163e20a 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.20.1
+GST1_PLUGINS_UGLY_VERSION = 1.20.3
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

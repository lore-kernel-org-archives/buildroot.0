Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35245C05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1E9A405C8;
	Wed,  1 Feb 2023 05:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E9A405C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBDeXb5LYczu; Wed,  1 Feb 2023 05:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A8BB405C4;
	Wed,  1 Feb 2023 05:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A8BB405C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2941BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F9EF4109B
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F9EF4109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpbvE_FLbz1h for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F39AA409EB
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F39AA409EB
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:12 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id h18so4700601ilj.6
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHiOqtYl4/BYewwUe19/AmiHC+HgSTerfkoAm9WAqQ8=;
 b=XHkpdSDCwLMNQotZ9z5X1BmKbfWuf2ZtWqjtB1Tk0D1fSOZwccmnPOkgyuESbfV1G8
 xa2ZXASLsunMSmL1b3LAPITj6pJbdtVXcm9Rj3MR3124Qvte3zrdcjytMZzwJxv8XD6w
 Q+LAsmqCKZTsmvOqgD2X9LKZncu8Is2z1q4g+6KIYtNxtA7JkHdP5yc7/MfsIiiQvZP4
 I1LXWrQQJV36/cOT1nJY7LaTTjvroSn30O5iAkvWlOEoqNyZV2PYD/iTqsytHvCp1a7Z
 9Jq72XHzk6j6YDCtM+Ok2BKbLQrwSWr1Idy2PCzgu0ognJWi+fFf2dHpfw62fjsu/T6t
 G0Pw==
X-Gm-Message-State: AO0yUKXfmwgb5f2n53Q06kz6ICdAM9m7jm8sNbwm7LdLoC+dXmvNFj79
 PLs+Ka39fKeTnbNX53Jg50JQnZQQzVNJ5w==
X-Google-Smtp-Source: AK7set8/Neul0bjnL5U2//Ol0C3vcnSVZnTBDr9cTZLCx/pVULYjh83YeUfVA7sMqVJMItZqPTOfyQ==
X-Received: by 2002:a92:ca49:0:b0:310:e9c7:1864 with SMTP id
 q9-20020a92ca49000000b00310e9c71864mr1039504ilo.31.1675228631785; 
 Tue, 31 Jan 2023 21:17:11 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:49 -0700
Message-Id: <20230201051658.383420-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHiOqtYl4/BYewwUe19/AmiHC+HgSTerfkoAm9WAqQ8=;
 b=Al1FILwGEVDFAk9RhvlSxBc3NDgONR/SufRWlaCt1lGr7TksMvX+NUZ/cqXltLBgZt
 1b3cC+DwsKhRNfTkQlSqP+ScrlaW5yuwyq3vP5sZyh5khktHnximKAKU47adbcighONB
 2qP2N2I77egfx0hAlhdgzAhMlo1AviNPFIYYlCoo8QZHCjPEtkm1xuXAn0npMi/q8lpm
 ZJyIL8+tz5DHlkdvD0XbVETnfoIp5z3nLvnwFFRXzGlIwtph6wCMHlwXzv/Ca4x6bYGX
 FmZeUXbZpMEv8eutNAfaYDzBPIsn28ps/ixqwJIxFn/RH1kFE88FY/v4ybCWBNL5ushB
 qOwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Al1FILwG
Subject: [Buildroot] [PATCH 04/13] package/gst1-plugins-good: bump version
 to 1.22.0
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

Add new xingmux config option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 5 +++++
 .../gstreamer1/gst1-plugins-good/gst1-plugins-good.hash   | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 8 +++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 67df206eea..d7ec16e800 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -246,6 +246,11 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPARSE
 	help
 	  Parse a .wav file into raw audio
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_XINGMUX
+	bool "xingmux"
+	help
+	  Add XING tags to mpeg audio files
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
 	bool "y4m"
 	help
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index b30c512878..3e219faad8 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.4.tar.xz.sha256sum
-sha256  b16130fbe632fa8547c2147a0ef575b0140fb521065c5cb121c72ddbd23b64da  gst-plugins-good-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.0.tar.xz.sha256sum
+sha256  582e617271e7f314d1a2211e3e3856ae2e4303c8c0d6114e9c4a5ea5719294b0  gst-plugins-good-1.22.0.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index cc7bab5824..93c2328bda 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.20.4
+GST1_PLUGINS_GOOD_VERSION = 1.22.0
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -324,6 +324,12 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dwavparse=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_XINGMUX),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dxingmux=enabled
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dxingmux=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dy4m=enabled
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

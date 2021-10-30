Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D404BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 11:22:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C17160F93
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 11:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C17160F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE32580DC5;
	Sat, 30 Oct 2021 11:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8LzF1tzhadB; Sat, 30 Oct 2021 11:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A48380DB2;
	Sat, 30 Oct 2021 11:22:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A498B1BF282
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 11:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F9D3400F3
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 11:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CA3zHi_76IME for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 11:22:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA3E440001
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 11:22:17 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id d63so15756487iof.4
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u0CF04s3H0lG2uhYsLgDCSuq9PFtBBc4gphzGLzbz6I=;
 b=HMpSDQWK9BJyyE1+ueRdq7ijjED+FFuVaiVd1pEzC6KgRoE/CMrV15tMadC5XGLadh
 TjPRUaTV/bUavc5vfLt4fCLvaScqqV4JLi72VF+Eil770nPbn+uyXqzxZkGQYM/mFOXm
 7hp/rHerswBodXzMiKhqAy6vxPpjExFo2HM3p8o5exRwrhPS10g2puIPO6hP+/9yemQt
 5ftQw7VfzDkcT+k+Ge2oPQjYIXazjtvmC+lZ2sQqceK/2A+6inxVUDMNHwFL1ioAxcql
 kfAinyZfXnvBovT+0+TjmovxirF168FuqYvXhg3rH2dTzNNzfSEsTROplFkbQ/7w8n66
 af6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u0CF04s3H0lG2uhYsLgDCSuq9PFtBBc4gphzGLzbz6I=;
 b=X5jowctNrAZgaL2BamGg6PA286G06mu7c1zI/iXp1X1BI/J2OQhyCS7ybN+cJh2WMS
 69LTpKy2JMZN/pCHEzf3GFKvz7LV1knXyTIdV0HjTEzPQ9BCv1GpAzSCKV8ujHJKYtab
 7o6ZiJqsA/hYv9qwyfcmlNHbelVrNjMrJ1R1DBhwBef/eROlNeXDN8ZVA5vUgqgXKkhq
 OiOkV2jpKv91vKf7JibDNnEo9No1a8nTFRjzezBFT5gbg6AgMHO4wykXkyDfRTsTgNBY
 Sde1KwjNT2JAFNpEANj96jGVDsmAw111gerA2FVz4jYbDZRqdzlrDGMNd2vvsTSpA9iE
 j25Q==
X-Gm-Message-State: AOAM533nPabCUqNYnEJj6BIRQAQoI+VQVtgifgG4tu1o/06bGVQ9KEgn
 wFF74w3h5sPZpNSAL4RducslyUk3Hk4=
X-Google-Smtp-Source: ABdhPJzbrXNuAZNd0okkA+/VKvbRQpzS+/B0ZtCwNB1DPEwgKM00Xi0FGQHYvi5+RibOw4U7beeCPQ==
X-Received: by 2002:a02:ce8a:: with SMTP id y10mr12181331jaq.101.1635592935416; 
 Sat, 30 Oct 2021 04:22:15 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id z5sm4383495ile.42.2021.10.30.04.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 04:22:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 05:22:11 -0600
Message-Id: <20211030112211.3603190-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad: add
 option to enable uvch264
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
 package/gstreamer1/gst1-plugins-bad/Config.in | 21 +++++++++++++++++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk      |  8 ++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 1204a65681..b5c940553b 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -595,6 +595,27 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SRTP
 	bool "srtp"
 	select BR2_PACKAGE_LIBSRTP
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_UVCH264
+	bool "uvch264"
+	depends on BR2_PACKAGE_HAS_UDEV # libgudev
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgudev, libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_USE_MMU # libgudev
+	depends on BR2_USE_WCHAR # libgudev
+	select BR2_PACKAGE_LIBGUDEV
+	select BR2_PACKAGE_LIBUSB
+	help
+	  UVC compliant H.264 camera source plugin
+
+comment "uvch264 needs udev /dev management"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+comment "uvch264 needs a toolchain w/ threads, wchar, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
 	bool "voaacenc"
 	select BR2_PACKAGE_VO_AACENC
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index d3f089bfed..ac00fd59e1 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -36,7 +36,6 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Davtp=disabled \
 	-Dopensles=disabled \
-	-Duvch264=disabled \
 	-Dmsdk=disabled \
 	-Dvoamrwbenc=disabled \
 	-Dbs2b=disabled \
@@ -722,6 +721,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dsrtp=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_UVCH264),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Duvch264=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += libgudev libusb
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Duvch264=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dvoaacenc=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

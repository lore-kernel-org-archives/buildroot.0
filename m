Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80199C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:33:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245F460C51
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 245F460C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD2AF83852;
	Sat,  7 Aug 2021 20:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4nA9mKOvfBr; Sat,  7 Aug 2021 20:33:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E8DB834CB;
	Sat,  7 Aug 2021 20:33:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1454A1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2A38834CB
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lt-w37zuK2ga for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 20:33:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0834683440
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 20:33:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so11482020wms.2
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 13:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=85j7OBAIYUriB/mSLaJo0+sdY35D+X5v9st62oiwcLU=;
 b=NIuD04XT5Mv0msBVdFFTJXZcfzeh9znrSvpprieH9jha6sD0yX5XRUk3ualjOPykur
 5JtKQXCUp2utK3kT5oQoNavonORS2ms5bg80VhZDBl5OAUqGSRGgGx33T78ADjRwv2Ot
 wGQpVdaXQ8kQ0oauKxsFO6TseFDeZ7xKKo4sszn+qWHk3a3jdDEcDVi7wi2VkAU1fBZI
 bFhovcQsbP7N5mhO71Hcr4222PE6PqiTtNI/HBdkeiYI3Mt8oqQgNiOBtpRB0zleV13t
 /hc3Fcjz7qwTG7HhkgDRnloWa1Eg4QjK2lRrtIyLFLrEct+IYMI/ZoJMadXSOebROJ2T
 tizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=85j7OBAIYUriB/mSLaJo0+sdY35D+X5v9st62oiwcLU=;
 b=IumMr7dUM8M7Q4hjmgZEkjdd0oLVfl6MQfzLW3yPAqfnZQExigF5DkrfTyQEeo7ScT
 L0ObOHiz1b6UynKUuebeh2EZynHX21WS3NJ8SxseZ+6DRZzvIf3Om43/tL03qCMRxf4Q
 TLZ/YWaGrVrtU5kCkGvxblUTukrT44qgguQygjJqjKDT4eATp6bufFfeJMYp0nReOHKA
 8iYQeMIqLZdP8PP5C4DpRZmvo6x49XBZC4fit7GT9+mWjCaV20cWIPU92GUS2FVIZPyQ
 aOGtozZVCa2hNr4QfEKsd44O6FA/OWFMPDAmkXcj55KsRLAv3IKh0JSsFZ7LRQ4YoEut
 836w==
X-Gm-Message-State: AOAM5326VFqQqUiWiGmQuFvhZ42IG16pslxsvkQjmtsvE3DqpMroHYa7
 pghqUuQyXzAuDr+PSfNYQkyuWzepWA9UPA==
X-Google-Smtp-Source: ABdhPJzbExWQBR0ySDYkGb7+51kuMDS0Gvkb/5PqYmfPeQESHOoN8DAQl9hjvdbL9Z1GJbHN+rC9Og==
X-Received: by 2002:a1c:1b55:: with SMTP id b82mr26116059wmb.121.1628368385827; 
 Sat, 07 Aug 2021 13:33:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id 9sm12566063wmf.34.2021.08.07.13.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 13:33:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 22:32:55 +0200
Message-Id: <20210807203255.1963543-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/libvirt: needs xsltproc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

libvirt needs xsltproc since its addition in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

../output-1/build/libvirt-7.4.0/meson.build:807:2: ERROR: Program 'xsltproc' not found

Fixes:
 - http://autobuild.buildroot.org/results/0341be10c4c36f37b5b6486428e55170a42b7692

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add autobuilder link and split dependencies lines

 package/libvirt/libvirt.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index feb2d6aa84..2e9b7db0a5 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -10,8 +10,18 @@ LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
 LIBVIRT_LICENSE = LGPL-2.1+
 LIBVIRT_LICENSE_FILES = COPYING
 LIBVIRT_CPE_ID_VENDOR = redhat
-LIBVIRT_DEPENDENCIES = host-nfs-utils host-pkgconf host-python-docutils \
-	gnutls libglib2 libpciaccess libtirpc libxml2 udev zlib
+LIBVIRT_DEPENDENCIES = \
+	host-libxslt \
+	host-nfs-utils \
+	host-pkgconf \
+	host-python-docutils \
+	gnutls \
+	libglib2 \
+	libpciaccess \
+	libtirpc \
+	libxml2 \
+	udev \
+	zlib
 
 LIBVIRT_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

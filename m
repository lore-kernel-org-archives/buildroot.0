Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594BFC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:23:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D73460F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D73460F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB10760B83;
	Wed,  4 Aug 2021 01:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MAIxJfDRtZDr; Wed,  4 Aug 2021 01:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A7D360B44;
	Wed,  4 Aug 2021 01:23:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C986C1BF3E1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 23:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8A1B40695
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 23:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgh7KjYZ6or7 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 23:21:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F159940683
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 23:21:20 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id a1so328033ioa.12
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 16:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eat425HuEc/oSofnM11hv9blT1ya4CM5S+OzMi7fvIs=;
 b=ttH/UH7ovBQi8Q0Tf9npeVKMv8VREr4ZmspRXK50kcGKrDsLyxbOJ4ZgZMlGujc4+W
 FRgiQeFqZznr88foauwsM0StVB2WJNrbhSI04dcnSYP9h/UEPB5eJ5ifW+DcjZkyVDhX
 ltFDdn1UhgbI7ahdv1zFiSFMp9kdX7XZndZ2+1/0XBwwQEqqTejNgjHjc6+Ma2lDzmuR
 nnBp+vrs1pxHjmEpTz0bF6rlzhuWV14tRIpKUSUJvui4Be9nKHVKHH7PIRPBEbdwG5kn
 1xS7jXwW11DWRkNPCpilDtf7m/5uzIwgpODE56zg7ON/yYetHaZLt4KFqCRzGm3DPKw+
 A7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eat425HuEc/oSofnM11hv9blT1ya4CM5S+OzMi7fvIs=;
 b=IrbAJB/E9CkWPG3pCcUmpkL0la31eEamHj3Cl0GZ9chImQ3U6/qrCzfGcnd6sp0Lmh
 1Wplue3FaRDsk6iNnamDXL8vtXi/9j14qNxca7KhxXgUEEUJMg8+vZNoRQOf/1narv8m
 l1vJWQIONQHlZvZRdyi4t6rQsFdUo0VxOURThurUToREsosLbMalBqBSCelw80x242tr
 PdNGPpXVZl9K8JwMzsFihGahNVWsW0WsvMrfqmJkyPP0kP2dEYg1euWYLhc4feOrPzm7
 jpz7Eli06+Z+D/RBjkbECB2H6Sf5Y3k/w+iI99CtU5//WVuHXN1WxB5KKIeccuE0Nwjz
 li1w==
X-Gm-Message-State: AOAM5304/tFpFym7TRewsHoNuIpNvieEHx2AKGfPK+2p2cKQOdct+6sH
 ik5fZnTmxlV7gJy/IvQWXEEnZIDjgHc=
X-Google-Smtp-Source: ABdhPJy20LNu1LdnN0cY+5qxA+7tZA8ZyDkFxwwyj6s2EKzg7U5OcRA4lbq9pFZ94Bd/5aPv4E+ESg==
X-Received: by 2002:a6b:5c18:: with SMTP id z24mr160981ioh.88.1628032879926;
 Tue, 03 Aug 2021 16:21:19 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id y198sm343453iof.25.2021.08.03.16.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 16:21:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 17:21:09 -0600
Message-Id: <20210803232110.285603-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/desktop-file-utils: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/desktop-file-utils/desktop-file-utils.hash |  3 +++
 package/desktop-file-utils/desktop-file-utils.mk   | 14 ++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/desktop-file-utils/desktop-file-utils.hash
 create mode 100644 package/desktop-file-utils/desktop-file-utils.mk

diff --git a/package/desktop-file-utils/desktop-file-utils.hash b/package/desktop-file-utils/desktop-file-utils.hash
new file mode 100644
index 0000000000..48623831cc
--- /dev/null
+++ b/package/desktop-file-utils/desktop-file-utils.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  b26dbde79ea72c8c84fb7f9d870ffd857381d049a86d25e0038c4cef4c747309  desktop-file-utils-0.26.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/desktop-file-utils/desktop-file-utils.mk b/package/desktop-file-utils/desktop-file-utils.mk
new file mode 100644
index 0000000000..12f000edf2
--- /dev/null
+++ b/package/desktop-file-utils/desktop-file-utils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# desktop-file-utils
+#
+################################################################################
+
+DESKTOP_FILE_UTILS_VERSION = 0.26
+DESKTOP_FILE_UTILS_SOURCE = desktop-file-utils-$(DESKTOP_FILE_UTILS_VERSION).tar.xz
+DESKTOP_FILE_UTILS_SITE = https://www.freedesktop.org/software/desktop-file-utils/releases
+DESKTOP_FILE_UTILS_LICENSE = GPL-2.0+
+DESKTOP_FILE_UTILS_LICENSE_FILES = COPYING
+HOST_DESKTOP_FILE_UTILS_DEPENDENCIES = host-libglib2
+
+$(eval $(host-meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

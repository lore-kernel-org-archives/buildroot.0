Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240A9C4828F
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 18:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD0F85095;
	Fri,  9 Feb 2024 18:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9UlSm2aNFCeF; Fri,  9 Feb 2024 18:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0E8E84FDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0E8E84FDE;
	Fri,  9 Feb 2024 18:48:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75C5D1BF2C9
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 18:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6220D42488
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 18:48:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iE3vbZL2gnDc for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 18:48:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2960642483
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2960642483
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2960642483
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 18:48:32 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7c00cfd7156so48636839f.0
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 10:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707504511; x=1708109311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DbXETnXZiVSDbqpkKDWpPtb8plufakfxHoBXcMCPBoA=;
 b=Y2h4rzp5brAjWgPtP9JljKe/GxjzzmBqLMsxmNzVjm4DJxeIrqFY13Xnqlf9cWE998
 cRn780MwFIZ5wRnFu3EdLDcxB0g7hZ9geD4CIsV2XpcnGFQEPP/F9kb1LrKfDjM+GNvX
 EuwDCIMkkXk8ORcxHSrHG9cN3NfljPTCmUhal3sTB+7gxqojKZaJeiz8+OcHV731qOAM
 ilSHXQNILRgVwU9oKDyb+6jGWygWBjH1p8J5D+CMCz4rDRyTfwzsAKZ8OCpGs65Fibad
 TeVmHq9xIHH28BohOZiqCHectwsB2p5hQebXwJbAWOvCBLtGNdMsyFkgexcfK7zO9rij
 COKw==
X-Gm-Message-State: AOJu0YxhkNNEPykxMY9dppkfwMzTJWb3CLueRXxpno6dSJLquKindhP0
 zJWdUuDCvHPoTo9d5gIuiIO0/XYfx2vdjMrtm/DlqasKkCvLAqG+ck/NuSFAygs=
X-Google-Smtp-Source: AGHT+IFXuZbKpK1F4i5bjn0VUqhQPN7lF2zpScZnvA85dsh9eTUUUe6V+/jbCn3WZLMKYVdLW+VgmQ==
X-Received: by 2002:a92:d581:0:b0:360:642f:322 with SMTP id
 a1-20020a92d581000000b00360642f0322mr107330iln.25.1707504510621; 
 Fri, 09 Feb 2024 10:48:30 -0800 (PST)
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 k23-20020a02ccd7000000b004716652f89asm667jaq.130.2024.02.09.10.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 10:48:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Feb 2024 11:48:14 -0700
Message-Id: <20240209184814.1438551-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707504511; x=1708109311; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DbXETnXZiVSDbqpkKDWpPtb8plufakfxHoBXcMCPBoA=;
 b=LqkBI1wTRa5qesawPyFkj2MbYJ/hcY7RMQTWSSkFqcmNY9O2vxOrxUDBE9eQ4J7n51
 fetn/qeW21UYp+XTOQ/9KqC5jqeGoAmRkwMBfv4q7V/QKkGX8HDEa9xwiQsvlE8iBiZh
 ToZqsIzb7ZY4lWXlzORpncV8NqHonXNV5hOqL8/9Rna+MM1xbENDlD85j3/PR3Oj5zJk
 M+QWNZb0JXdqF4ecZ5baedEumUZAukktNTf+UK1wLyc7Si5L9Ndrv1jcJNyDzAwUsfWC
 66uYgDuS4vKzuA6KOcm0e79N67PMI0FHliISZHeXxnFD9p3cpBmsUzi8XKU+iHvtUNPa
 vQIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LqkBI1wT
Subject: [Buildroot] [PATCH 1/1] package/gst1-python: disable tests
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

We don't need tests enabled which can also cause build issues.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-python/gst1-python.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index f843e37052..501ca5e02b 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -34,6 +34,7 @@ GST1_PYTHON_CONF_ENV += \
 # the correct .so file, and the resulting compiled library has the appropriate
 # path of /usr/lib/python3.$(PYTHON3_VERSION_MAJOR).so
 GST1_PYTHON_CONF_OPTS += \
-	-Dlibpython-dir=/usr/lib/
+	-Dlibpython-dir=/usr/lib/ \
+	-Dtests=disabled
 
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

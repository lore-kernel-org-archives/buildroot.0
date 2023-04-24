Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2CFC77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE56410E8;
	Mon, 24 Apr 2023 20:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE56410E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-dEYSHBEOGE; Mon, 24 Apr 2023 20:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B8BF416B7;
	Mon, 24 Apr 2023 20:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B8BF416B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A65271BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AA7F410E8
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA7F410E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUr2fUqmE4Ki for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B1E9410E7
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B1E9410E7
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:19 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63b57c49c4cso4226803b3a.3
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367918; x=1684959918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GDT0cP1Y5XTzPOLSzWaWuOQpbEpwgxsLULUI0gO0S3w=;
 b=hs3tqPmv/K9tY5P2qGBf8I7MMTPLyQtnH4xQt2ZwwFTqrRNrsXe+f+SLBPCiCUIo8D
 lzg3nPh/gue0aFbrb3DthNkzbIZnVcOhM5vLO5aQnR/qZy+8QrH2pdBOfOCFJ64DcgWM
 nDn/xdT22/D83Lj0BYLokGpY+qLyqIgZf6Urd4i5fwdkk+M+1qFkL5nOLl7wICsxpGGT
 3beNj3/AhFzk5TtDkcYchv1eC3+AKuYcG2KagElAeXB7SVipdPpssW4nl2t8J1iUslbX
 w3416bNdIHAeepp8t0tPyiB+0UoqmPKQfs4ZTjBGPtRi4OB8+7uM/jjiOMtrNx4Tw7JK
 zEzg==
X-Gm-Message-State: AAQBX9d7vTTY0X1yxeIHNi+7uZS945NzsvkYa97J7XYqIAzqeNTFZIEV
 Nydq9nBUHDW5ORUUiI0Rpet0N163lCMigw==
X-Google-Smtp-Source: AKy350boQRDcPbMNMQfE516JhZkUnUGk+coCGheGMtCrM9ef/7DA0gwew1Y6MkOHE0JzxHGSiqYdow==
X-Received: by 2002:a05:6a20:7345:b0:f0:f610:2e0 with SMTP id
 v5-20020a056a20734500b000f0f61002e0mr20432198pzc.1.1682367918333; 
 Mon, 24 Apr 2023 13:25:18 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:17 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:02 -0700
Message-Id: <20230424202514.1546092-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367918; x=1684959918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDT0cP1Y5XTzPOLSzWaWuOQpbEpwgxsLULUI0gO0S3w=;
 b=LXnQFHr84Vtx28P3DdDr+lQyQZdEsRgc0BKf3+h0zkH2KGsVNHaUS00dFFcmFwHO00
 lI5L57Q89oVpuztSTroERrWqH7HsokIKWM/g0W5pPz/js6rDnKaGZhmerqmaHWq8fOcI
 YSO1WVYMLMBla9Yj7Hu6wS7LL7fEt3nD+/e9Ihd5upG2gwOKYAqK+vTQKSnU2qLvgsvy
 f2FnY+cImPUpXhRX92ImBEqxy+OgtkyyFl3LQAdLuBSN1RAQVFACmzxSzM0Krpe7O760
 HnJIl5BpRnUWDUArOyk447M1b2g2nXxFwdT/J+drmFYT1/DB4gTOPI/mvQXwOMXHIdlz
 VaIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LXnQFHr8
Subject: [Buildroot] [PATCH 01/13]
 package/libglib2/0003-disable-building-docs.patch
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If rst2html5 is installed on a host system, meson will attempt to build
html5 documentation from the docs directory, resulting in the following
error:

/usr/local/bin/rst2html5.py
Traceback (most recent call last):
  File "/usr/local/bin/rst2html5.py", line 27, in <module>
    from docutils.core import publish_cmdline, default_description
ModuleNotFoundError: No module named 'docutils'

Since we don't need, nor want to build the documentation, remove the docs
subdirectory from being built entirely.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../libglib2/0003-disable-building-docs.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/libglib2/0003-disable-building-docs.patch

diff --git a/package/libglib2/0003-disable-building-docs.patch b/package/libglib2/0003-disable-building-docs.patch
new file mode 100644
index 0000000000..27a540bf61
--- /dev/null
+++ b/package/libglib2/0003-disable-building-docs.patch
@@ -0,0 +1,38 @@
+From f3b8515471aaa452f06d84da68372fcead8637d2 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 24 Apr 2023 11:52:24 -0700
+Subject: [PATCH 1/1] disable building docs
+
+If rst2html5 is installed on a host system, meson will attempt to build
+html5 documentation from the docs directory, resulting in the following
+error:
+
+/usr/local/bin/rst2html5.py
+Traceback (most recent call last):
+  File "/usr/local/bin/rst2html5.py", line 27, in <module>
+    from docutils.core import publish_cmdline, default_description
+ModuleNotFoundError: No module named 'docutils'
+
+Since we don't need, nor want to build the documentation, remove the docs
+subdirectory from being built entirely.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 0cbc968..28e1147 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2442,7 +2442,6 @@ if get_option('man')
+ endif
+ 
+ gnome = import('gnome')
+-subdir('docs/reference')
+ 
+ summary({
+   'host cpu' : host_machine.cpu_family(),
+-- 
+2.40.0
+
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

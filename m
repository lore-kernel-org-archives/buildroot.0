Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B32C64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 13:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A77D8813E3;
	Sun, 26 Feb 2023 13:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A77D8813E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LEhndPmrQ8eC; Sun, 26 Feb 2023 13:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D700F813DE;
	Sun, 26 Feb 2023 13:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D700F813DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13E571BF361
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA847408F4
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA847408F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pL2yQR4E6Z2w for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 13:39:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46636408EF
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46636408EF
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 13:39:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so5378396wmb.5
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 05:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pBhzquhrULcPwniOnT0bdF9gu88y0kOUQI/JBTHUBJg=;
 b=soNYkb+Yb49jnkQodLquHEEggnHlUsOqnhaEb8orVwAQDbXV6IujBM3rIvqEMtWr0o
 Jt/hhEyIG+VWXMcmeuGJCxYklbD3rgJLU2OJFnR483Ul8zyqE24R3foYYqZz+iNUzCON
 c6TnA9eQNn6L1Od9uhGqFViynYs/Bokq9yLt9fN5RlDJ/gvBrHkrl9FQ0CrNmdHnUxxT
 zHbjpKytq/V7KEIUZV2vFMNjhQauU2ZptTFdXD5iU086xj6UOGYg4aGd45lk4H34+iNi
 d7OhFRCKqO7n1bi7fQwHodqBjHHxOPjS/Tzzcxo1WA6pLGzoxo/bwGYdKlMNXIqiiBSG
 K/XA==
X-Gm-Message-State: AO0yUKUG9ntqzbQB6YOdVWTKbkWuz/u03KSX4rgE23/9CcexwuseUMm2
 j+cxtjttagmkfoLwecJBt8dfo9BAnMQ=
X-Google-Smtp-Source: AK7set/SB7Fqslou+a9xc/BPz2PjpCUQRqp5IM1G0lE3Ixvij6G8AqI5SPALwpw2rgBu/Od/JHi7Vw==
X-Received: by 2002:a05:600c:3b1b:b0:3df:eda1:439c with SMTP id
 m27-20020a05600c3b1b00b003dfeda1439cmr4357698wms.11.1677418788914; 
 Sun, 26 Feb 2023 05:39:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bi22-20020a05600c3d9600b003dc42d48defsm5894980wmb.6.2023.02.26.05.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 05:39:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 14:39:46 +0100
Message-Id: <20230226133946.102275-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pBhzquhrULcPwniOnT0bdF9gu88y0kOUQI/JBTHUBJg=;
 b=pivBrM6GtfVw6S+6FTDi+GluWsHYYYncRqvvPl3Mm3uNNHuMmRI2e2wcx/TrPBtlaC
 dTzYPP/9HYOr/p/zrYEiJR6xD4My0E4d7NbS/ASx4o9A6IKTGmqgnOjcTGD5qnS6WMgu
 8yuwMLoRqENGn0mzNSS9c7HCY7Mq+ZrSdM03+PYmJw9afO5bsP3q9zeNA0iHt8ucuZPM
 AkvJvdkwAzv9dEwm8v9MeQtDH9bz26WcfuL8aKIATo5nAJMGqUfEGKyEHX9P1DG1XidC
 9kL4JmSGOgI5PseRNYwQGcii5wXaEKp6ne98MaBOk9HnbzO8m7/V2aipN/7erG/DcWjn
 x8FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pivBrM6G
Subject: [Buildroot] [PATCH 1/1] package/tiff: fix CVE-2022-48281
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

processCropSelections in tools/tiffcrop.c in LibTIFF through 4.5.0 has a
heap-based buffer overflow (e.g., "WRITE of size 307203") via a crafted
TIFF image.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rect-simple-copy-paste-error-Fix-488.patch | 28 +++++++++++++++++++
 package/tiff/tiff.mk                          |  3 ++
 2 files changed, 31 insertions(+)
 create mode 100644 package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch

diff --git a/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch b/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
new file mode 100644
index 0000000000..73c0d10ffc
--- /dev/null
+++ b/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
@@ -0,0 +1,28 @@
+From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Sat, 21 Jan 2023 15:58:10 +0000
+Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
+
+[Retrieved from:
+https://gitlab.com/libtiff/libtiff/-/commit/97d65859bc29ee334012e9c73022d8a8e55ed586]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/tiffcrop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 14fa18da..7db69883 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -8591,7 +8591,7 @@ static int processCropSelections(struct image_data *image,
+                     cropsize + NUM_BUFF_OVERSIZE_BYTES);
+             else
+             {
+-                prev_cropsize = seg_buffs[0].size;
++                prev_cropsize = seg_buffs[i].size;
+                 if (prev_cropsize < cropsize)
+                 {
+                     next_buff = _TIFFrealloc(
+-- 
+GitLab
+
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index e7de51ea1e..f9754a4b49 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -12,6 +12,9 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
+# 0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
+TIFF_IGNORE_CVES += CVE-2022-48281
+
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15BACDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 21:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ECA360B6C;
	Sun, 22 Oct 2023 21:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ECA360B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVV4mKJ9gIQk; Sun, 22 Oct 2023 21:32:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A20E60B68;
	Sun, 22 Oct 2023 21:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A20E60B68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7FA31BF3C9
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 21:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DBFE81F7D
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 21:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DBFE81F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WeapOovZI9RR for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 21:32:31 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50C5881F7E
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 21:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50C5881F7E
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083f613275so22040525e9.2
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 14:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698010349; x=1698615149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4KVXn/g47p4+RsYdyl4WuUkI+xDb+FA5wjXdGxZNGPA=;
 b=MuumjfPhDK8o/He/uHqZ4Mtkekdsdo6O7Ft1n9p4ZjT+U2UkV0uClWlgKr542goGsb
 hxySs9YjwQqKZK74eG35u/4JOa/B3gqrf9PIXzg2b7L1Q/eUTD3611gb3BXs2crl1TOV
 f9oKOjQKmEKKdoDpaNVOvHVHWCxDyDHJnoqsJf7S90KiykcCuVYsD3ItCT8ogB6xo5V8
 Y7VwOo8g/bxG/NGaDtVjsh0Kkh11CgkLiPYJASm+1rhgOJ9UWNzW+CDjvrMY+BDfAcQo
 KcDPkFh5IeDFq5UPjcPjlejfwfWdPsyNEt8hEM/OVL+Lfh2CLX4UMHQDZRwD64jCsfkY
 L+Ig==
X-Gm-Message-State: AOJu0YxiUjwL2LyXtlXq1bvGCLKB0aymm4Dw+jih5un5VqlT+hqfHCXZ
 FniRgZbXThRkM3VRLQlhqrnDOeV7qEY=
X-Google-Smtp-Source: AGHT+IHqQuJFtld0AYm7A/AVIV0flSrAJu68qwdOJ1xevm1/XScWpJeRkXDOWPELahvZ4wXV4G1umQ==
X-Received: by 2002:a05:600c:1385:b0:3fd:2e89:31bd with SMTP id
 u5-20020a05600c138500b003fd2e8931bdmr5774381wmf.14.1698010348687; 
 Sun, 22 Oct 2023 14:32:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c499100b0040772138bb7sm12487424wmp.2.2023.10.22.14.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Oct 2023 14:32:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 23:32:26 +0200
Message-ID: <20231022213226.101602-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698010349; x=1698615149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4KVXn/g47p4+RsYdyl4WuUkI+xDb+FA5wjXdGxZNGPA=;
 b=PNEb4EPK20oQN/7+xZ7qkFlqbhjVEzLY8cbE/uAJzQE0B9OGlPbAu+MT+DCLd9YKaU
 +lSGApbu/N9cBcvt5fJPO2qBOiZmWbIKhEef1EgSVhlAQzqn5ufuOCTTT/YWsL4Duk6h
 96zBYGnEEKQXYpqn8tz9S6IPzidVu6TpvLFLtPTC5/2XaQ0obpyPdX92+Wos6JFuBRpw
 uNL7vbOaBvrC2No1B4UjXDv5i36/0fzz6D0vsV9kZP5YQSpn+FQ7Mx1XbwIWLgddkK9e
 8bCOgykYb0Lz/sGuVerOS2cvJyqGeLPb87AnyvhzK/trIe25By3YqQnY/siOOIcQ6vDm
 fXRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PNEb4EPK
Subject: [Buildroot] [PATCH 1/1] package/minizip-zlib: fix CVE-2023-45853
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

MiniZip in zlib through 1.3 has an integer overflow and resultant
heap-based buffer overflow in zipOpenNewFileInZip4_64 via a long
filename, comment, or extra field. NOTE: MiniZip is not a supported part
of the zlib product.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lows-of-zip-header-fields-in-minizip.patch | 39 +++++++++++++++++++
 package/minizip-zlib/minizip-zlib.mk          |  2 +
 2 files changed, 41 insertions(+)
 create mode 100644 package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch

diff --git a/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch b/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
new file mode 100644
index 0000000000..f4eacc7fdc
--- /dev/null
+++ b/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
@@ -0,0 +1,39 @@
+From 73331a6a0481067628f065ffe87bb1d8f787d10c Mon Sep 17 00:00:00 2001
+From: Hans Wennborg <hans@chromium.org>
+Date: Fri, 18 Aug 2023 11:05:33 +0200
+Subject: [PATCH] Reject overflows of zip header fields in minizip.
+
+This checks the lengths of the file name, extra field, and comment
+that would be put in the zip headers, and rejects them if they are
+too long. They are each limited to 65535 bytes in length by the zip
+format. This also avoids possible buffer overflows if the provided
+fields are too long.
+
+Upstream: https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ contrib/minizip/zip.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/contrib/minizip/zip.c b/contrib/minizip/zip.c
+index 3d3d4cadd..0446109b2 100644
+--- a/contrib/minizip/zip.c
++++ b/contrib/minizip/zip.c
+@@ -1043,6 +1043,17 @@ extern int ZEXPORT zipOpenNewFileInZip4_64(zipFile file, const char* filename, c
+       return ZIP_PARAMERROR;
+ #endif
+ 
++    // The filename and comment length must fit in 16 bits.
++    if ((filename!=NULL) && (strlen(filename)>0xffff))
++        return ZIP_PARAMERROR;
++    if ((comment!=NULL) && (strlen(comment)>0xffff))
++        return ZIP_PARAMERROR;
++    // The extra field length must fit in 16 bits. If the member also requires
++    // a Zip64 extra block, that will also need to fit within that 16-bit
++    // length, but that will be checked for later.
++    if ((size_extrafield_local>0xffff) || (size_extrafield_global>0xffff))
++        return ZIP_PARAMERROR;
++
+     zi = (zip64_internal*)file;
+ 
+     if (zi->in_opened_file_inzip == 1)
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 259570f75c..81fee3c687 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -16,5 +16,7 @@ MINIZIP_ZLIB_AUTORECONF = YES
 MINIZIP_ZLIB_DEPENDENCIES = zlib
 # demos must be disabled to avoid a conflict with BR2_PACKAGE_MINIZIP_DEMOS
 MINIZIP_ZLIB_CONF_OPTS = --disable-demos
+# 0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
+MINIZIP_ZLIB_IGNORE_CVES += CVE-2023-45853
 
 $(eval $(autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

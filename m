Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54343C4332F
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 21:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAC74405A7;
	Fri,  2 Dec 2022 21:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAC74405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSYjnd_RPEtw; Fri,  2 Dec 2022 21:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13DEF402E0;
	Fri,  2 Dec 2022 21:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13DEF402E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAC831BF25B
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 21:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B626F60B24
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 21:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B626F60B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7XykvGnZg1a for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 21:59:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56B6960A4F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56B6960A4F
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 21:59:13 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 125-20020a1c0283000000b003d076ee89d6so4818728wmc.0
 for <buildroot@buildroot.org>; Fri, 02 Dec 2022 13:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SOsuu7086zpjMn4pI+036uKBTVFzy5aYQ7J0osuVq5s=;
 b=GL632CuNEN1KlOsTTZP0JgtFlD6RdAYcgyKYzmZa35xLWEbeQjwVsTn36TfGgtAZKH
 R9MdHLfPzvgHXeFdXK0f5eokabIGVeH+qXSTGHpRdwZcLmSAjsG/Xm9a95XAE2gu7y9y
 tPh7vPs/Td3XUw4UV5g1cp1NG3L9jAO8I5l3YEP84trnXbaLJMmRCCj8QbICxGwz4Djt
 i3BuR2yxeC7vbYG5Zpgpj3zMlAmA+AKm89Mp5UIh0sKqMtIxB9oGWfG+rcXFD43SrE3q
 RmWHSlszKLIJRssgMBvl/9llZfgORdAM7D+dcskYO4LHz5j7GbXfl9DYlEQUiI05wTNq
 BL6A==
X-Gm-Message-State: ANoB5plCWAHK09XphDqeb9wM4jiIlWUxxdunOv3hhDovJPSxuj5nRnR5
 z8DdMBVMIU6+nz3kmBSxUDBcpbl304M=
X-Google-Smtp-Source: AA0mqf4RGXImRjjyQ/T2EePvoflRfkSRY56lCSTjX41k+iuWQUua9Aa3ucYA5FJ90Oym3r7BL7HZdQ==
X-Received: by 2002:a1c:7504:0:b0:3cf:8ebf:69b with SMTP id
 o4-20020a1c7504000000b003cf8ebf069bmr44725659wmc.86.1670018351144; 
 Fri, 02 Dec 2022 13:59:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b00241cfe6e286sm8162484wrr.98.2022.12.02.13.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 13:59:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Dec 2022 22:59:05 +0100
Message-Id: <20221202215905.7800-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SOsuu7086zpjMn4pI+036uKBTVFzy5aYQ7J0osuVq5s=;
 b=csq+t8QVw7dj+y2TlCWuI5s0eMDAQPG6D5Yn9SQtxL5y2DrdyxagO0NyvinTujb2pu
 pbUcLRgKsGIftBuAIypie6NEP+1V9z6TBLT4CsNtmk2xpPRw0rqpEklJH967NtL1P7E1
 DkIKqUe6uG+voXGZvkpQZPcHGo2LggHRXllEYkP6o5W0QWVCc/9j6btatDhmFzANqsPd
 XWu+FE9RYJ/CiECwq+WB7FX1cQkuI2muOt9XseVYBNd0VB/8l5duCheZIV1/29F6rXfR
 JhAZp22wwKz7pOIKooaz+xeaMqg8Bbk9SZVEqn32FIGmNPSkbtTDSzCb6AKQzMal/kBq
 Ym/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=csq+t8QV
Subject: [Buildroot] [PATCH 1/1] package/libarchive: fix CVE-2022-36227
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In libarchive 3.6.1, the software does not check for an error after
calling calloc function that can return with a NULL pointer if the
function fails, which leads to a resultant NULL pointer dereference.
NOTE: the discoverer cites this CWE-476 remark but third parties dispute
the code-execution impact: "In rare circumstances, when NULL is
equivalent to the 0x0 memory address and privileged code can access it,
then writing or reading memory is possible, which may lead to code
execution."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...chive-Handle-a-calloc-returning-NULL.patch | 38 +++++++++++++++++++
 package/libarchive/libarchive.mk              |  3 ++
 2 files changed, 41 insertions(+)
 create mode 100644 package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch

diff --git a/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch b/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
new file mode 100644
index 0000000000..75ce6112fe
--- /dev/null
+++ b/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
@@ -0,0 +1,38 @@
+From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
+From: obiwac <obiwac@gmail.com>
+Date: Fri, 22 Jul 2022 22:41:10 +0200
+Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)
+
+[Retrieved from:
+https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libarchive/archive_write.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
+index 66592e826..27626b541 100644
+--- a/libarchive/archive_write.c
++++ b/libarchive/archive_write.c
+@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
+ 	struct archive_write_filter *f;
+ 
+ 	f = calloc(1, sizeof(*f));
++
++	if (f == NULL)
++		return (NULL);
++
+ 	f->archive = _a;
+ 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
+ 	if (a->filter_first == NULL)
+@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
+ 	a->client_data = client_data;
+ 
+ 	client_filter = __archive_write_allocate_filter(_a);
++
++	if (client_filter == NULL)
++		return (ARCHIVE_FATAL);
++
+ 	client_filter->open = archive_write_client_open;
+ 	client_filter->write = archive_write_client_write;
+ 	client_filter->close = archive_write_client_close;
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 865f605e2f..649b7dd4dc 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -12,6 +12,9 @@ LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CPE_ID_VENDOR = libarchive
 
+# 0001-libarchive-Handle-a-calloc-returning-NULL.patch
+LIBARCHIVE_IGNORE_CVES += CVE-2022-36227
+
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBARCHIVE_CONF_OPTS += --enable-bsdtar=static
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

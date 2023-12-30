Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71BCC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 15:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44B9640122;
	Sat, 30 Dec 2023 15:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44B9640122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VYQxRNbQ8rIN; Sat, 30 Dec 2023 15:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 122F640143;
	Sat, 30 Dec 2023 15:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 122F640143
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E8DD1BF3D7
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 15:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F7D460E31
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 15:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F7D460E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krSTRFHwTG6d for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 15:26:35 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D07C60DDF
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 15:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D07C60DDF
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3366ddd1eddso7266204f8f.0
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 07:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703949992; x=1704554792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wVoafLJvD5RpHAkfACkq96w8u4BJVtOhSysWh+z4N6I=;
 b=gwwKXZSU7A1cE1cDmbGLQcf/Ew+LiOLNpNdUOEs6CYgy4dS6uRdCWU1H0ixs1ncfeY
 gG/JG/HPBY7wB8dpbs+fQu4iIwndRKKroZ5KxFikMlIsSokBWiLcyx+F/gYVzEm96nO5
 jLYiwBvaMQiNSbj7NVjvLUzv1+pn7vPi4UAnMGQzXKjaHOAPRc/5hJYBRvA4UDqy9jVm
 bq1fyH/I9nrAPbVhD3FEk6g4tbaW2FXoqsBO470Bk52tOkR9NQrjmehk1I3zKyDV1gf0
 8vWSpr4vFuYDL9mkrC7hBqJNzQobSRUtNCQRktlv0ovS6em+kGEkr1IRgYN4zXpf0XE5
 xpHQ==
X-Gm-Message-State: AOJu0YyrWrxZ62LoHHFsw+H27QuhxArM2FjViD2jkTnwF1I1bEIupwQM
 HQU9r70Amh0Haro3SojHKVYV+IL31hk=
X-Google-Smtp-Source: AGHT+IG4+C81UEcX4vzwOd8hXtIDysG0Qr7n4GI9qO1aeNkYQJBsWxk2qxEF71T/6TjC4rak0R/BRQ==
X-Received: by 2002:a05:6000:d:b0:336:878a:5935 with SMTP id
 h13-20020a056000000d00b00336878a5935mr3312413wrx.101.1703949991704; 
 Sat, 30 Dec 2023 07:26:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l15-20020a5d560f000000b0033609584b9dsm21732404wrv.74.2023.12.30.07.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 07:26:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 16:26:27 +0100
Message-ID: <20231230152627.256604-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703949992; x=1704554792; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wVoafLJvD5RpHAkfACkq96w8u4BJVtOhSysWh+z4N6I=;
 b=IAwMHJY8nr1aKXFGp0T/FD4UnLqrrSFuBHjgkZwREWzbEeLPkMcqWzJVnYMTw6T9GA
 fgGgGt8cMVPs9GyXIA2Gt1VOz+aDzq3eVjdTC9hGtPPdiQCJtj0Vl67w9AJqwSut/qK1
 kHsOXCnjDsG2hUDCiYEAqXRIoaTPR05WmkHN8qMnUsEsZFVn1/I5D/MQvDeWiO60hqsa
 5FaJWEe9X7/k3btgQGT/Y/wa7dKM+BNPk+FREbPnxKnvQ2I0L8JCGmsXzRbLqKJnHzD2
 UF6s5dnijl/8klKzoyXO9fU6IdzLm05BtG6lLJ/0twRaqWvi7M97tRsHmffpx5RJFR8k
 aTqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IAwMHJY8
Subject: [Buildroot] [PATCH 1/1] package/audit: bump to version 3.1.2
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

Drop patch (already in version)

https://github.com/linux-audit/audit-userspace/blob/v3.1.2/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ine-__attribute_malloc__-when-needed.patch | 35 -------------------
 package/audit/audit.hash                      |  2 +-
 package/audit/audit.mk                        |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/audit/0001-Define-__attribute_malloc__-when-needed.patch

diff --git a/package/audit/0001-Define-__attribute_malloc__-when-needed.patch b/package/audit/0001-Define-__attribute_malloc__-when-needed.patch
deleted file mode 100644
index 3dd5359bfc..0000000000
--- a/package/audit/0001-Define-__attribute_malloc__-when-needed.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cf93d8579d5cec0b1ba585bd661776f03c2743ba Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Tue, 27 Jun 2023 20:19:13 +0200
-Subject: [PATCH] Define __attribute_malloc__ when needed
-
-attribute_malloc is not available on musl
-
-auparse.h: In function 'auparse_init':
-auparse.h:54:2: error: expected declaration specifiers before '__attribute_malloc__'
-   54 |  __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
-
-Upstream: https://github.com/linux-audit/audit-userspace/pull/311
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- auparse/auparse.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/auparse/auparse.h b/auparse/auparse.h
-index 95cf256d..5cb7402e 100644
---- a/auparse/auparse.h
-+++ b/auparse/auparse.h
-@@ -32,6 +32,9 @@
- # define __attr_dealloc(dealloc, argno)
- # define __attr_dealloc_free
- #endif
-+#ifndef __attribute_malloc__
-+#  define __attribute_malloc__
-+#endif
- 
- #ifdef __cplusplus
- extern "C" {
--- 
-2.39.2
-
diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 310b0a0f6a..5743b3a13a 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  46e46b37623cce09e6ee134e78d668afc34f4e1c870c853ef12e4193078cfe87  audit-3.1.1.tar.gz
+sha256  c0b1792d1f0a88c6f1828710509cbb987059fc68712c97669ca90eae103d287d  audit-3.1.2.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 168bc04ad7..8d54359038 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.1.1
+AUDIT_VERSION = 3.1.2
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

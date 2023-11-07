Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A890C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 17:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C457A6145C;
	Tue,  7 Nov 2023 17:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C457A6145C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQnz-Cw-mEus; Tue,  7 Nov 2023 17:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16FEC61454;
	Tue,  7 Nov 2023 17:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16FEC61454
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BA0E1BF319
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 17:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D926421F1
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 17:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D926421F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKYZlNiMGzex for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 17:46:59 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2535421F0
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 17:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2535421F0
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so44017415e9.1
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 09:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699379216; x=1699984016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d3Hu/InW4npgOlkayK/UkiJqJqq/9oIF5UaN7+NMQ78=;
 b=BfFoztMVM7TQks3OvrXWs/mkMCV0KTWQW0v7vNr1EOzDyE+EAR2re7+SVtTygIuhS5
 5JAoD4mFt3b6U/2XrC8uFGce2mrkkbFyC5zMkj1gidOAe3zNo8Ppd9OvbEkXSHldkTTz
 oRaj3/XE7IPd5Xb+sTvtJ1JFI6y8gxVtUlxx13wLfnikNBr4Ych4gFbkNKYKGCoE9sl3
 ySF7xQ5S0g63DI93r5eKEfwb9HNvD0IcS4J/0dW5nfflzqXIJz/5UGQ2wJETqsw2RvSY
 sq/RsNcgYE7Z9awahUotVm21ucpCCEmGvA1wqja4XzY+ItszfVLbqDmx/UGb37gGs8te
 jcVQ==
X-Gm-Message-State: AOJu0YyTnwpY58eQquJzSN+fdWhOa8JXgSWPr/JC8JQuK0QB7cUJ1nZV
 CKCOOsFlVLvD7mORA7v+5X2oeGxCm9g=
X-Google-Smtp-Source: AGHT+IH27ACXXRZ8p2+NowyZiGAo5PWJp1RW5iYfjntTG14NJp8UUoBkNcl6tw+2NGIFgZKlRZ8NvQ==
X-Received: by 2002:a7b:cc8d:0:b0:405:3e9a:f1e3 with SMTP id
 p13-20020a7bcc8d000000b004053e9af1e3mr3309451wma.11.1699379215707; 
 Tue, 07 Nov 2023 09:46:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c138700b0040836519dd9sm16567669wmf.25.2023.11.07.09.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 09:46:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 18:46:51 +0100
Message-ID: <20231107174651.5995-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699379216; x=1699984016; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d3Hu/InW4npgOlkayK/UkiJqJqq/9oIF5UaN7+NMQ78=;
 b=nTfJ54D0BpYhB9t0d70/M9IFDYbfawQltkH3KbA7w4VQC9PQIOctpzqAzYwHBAS7js
 /NMuSoWCN2VlCAabwBLRAv9lGOYCKRRCHfz2hF49rDF+7ABih8ATeamZObzNf582j2aB
 sDz/Y431TmfAVF1yRoUtCnqYh8Qn9plLxHR+bQCrZXYw+wMbCinL5sUceSITIqj7PW8T
 2x2RlpkhzhGrt6XQfisKn1OFAKwsFWXIK+LtFnOhZnJxzAFfiDoui/uUuYLbZTgksTNy
 +CI8zAZHcZbHVntKWdNrX5Y//eTI+6BzcFk2E+rt28hd6Gl0JcQS8dtT8taKSBnsvZrh
 kyYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nTfJ54D0
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix build with -O0
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

Fix the following build failure with -O0 raised since bump to version
2.39 in commit ad276d94a392fb13244e042851a44269e6254d61 and
https://github.com/util-linux/util-linux/commit/2fa4168c8bc9d5438bc1dfadda293c7c21b6fa59:

libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
libuuid/src/gen_uuid.c:536:33: error: initializer element is not constant
  THREAD_LOCAL int  cache_size = cs_min;
                                 ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7c9b8508345ffaba167c08521fb865d76555be1d
 - http://autobuild.buildroot.org/results/2f80a5cdb523cc3c8c0f3693607a1be036b2ae98

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rc-gen_uuid.c-fix-cs_min-declaration.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch

diff --git a/package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch b/package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch
new file mode 100644
index 0000000000..ebd7d2961f
--- /dev/null
+++ b/package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch
@@ -0,0 +1,70 @@
+From 8f501bc54424b0b3fe2f8acf5079418fd73703c5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 7 Nov 2023 18:43:57 +0100
+Subject: [PATCH] libuuid/src/gen_uuid.c: fix cs_min declaration
+
+Define cs_min through a define and not a const int to avoid the
+following build failure with -O0 raised since version 2.39 and
+https://github.com/util-linux/util-linux/commit/2fa4168c8bc9d5438bc1dfadda293c7c21b6fa59:
+
+libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
+libuuid/src/gen_uuid.c:536:33: error: initializer element is not constant
+  THREAD_LOCAL int  cache_size = cs_min;
+                                 ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2f80a5cdb523cc3c8c0f3693607a1be036b2ae98
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/util-linux/util-linux/pull/2573
+---
+ libuuid/src/gen_uuid.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
+index 619ef0131..a70f5cf12 100644
+--- a/libuuid/src/gen_uuid.c
++++ b/libuuid/src/gen_uuid.c
+@@ -518,6 +518,8 @@ int __uuid_generate_time_cont(uuid_t out, int *num, uint32_t cont_offset)
+ 	return __uuid_generate_time_internal(out, num, cont_offset);
+ }
+ 
++#define CS_MIN (1<<6)
++
+ /*
+  * Generate time-based UUID and store it to @out
+  *
+@@ -529,11 +531,10 @@ int __uuid_generate_time_cont(uuid_t out, int *num, uint32_t cont_offset)
+ static int uuid_generate_time_generic(uuid_t out) {
+ #ifdef HAVE_TLS
+ 	/* thread local cache for uuidd based requests */
+-	const int			cs_min = (1<<6);
+ 	const int			cs_max = (1<<18);
+ 	const int			cs_factor = 2;
+ 	THREAD_LOCAL int		num = 0;
+-	THREAD_LOCAL int		cache_size = cs_min;
++	THREAD_LOCAL int		cache_size = CS_MIN;
+ 	THREAD_LOCAL int		last_used = 0;
+ 	THREAD_LOCAL struct uuid	uu;
+ 	THREAD_LOCAL time_t		last_time = 0;
+@@ -554,7 +555,7 @@ static int uuid_generate_time_generic(uuid_t out) {
+ 		 */
+ 		if ((last_used == cache_size) && (cache_size < cs_max))
+ 			cache_size *= cs_factor;
+-		else if ((last_used < (cache_size / cs_factor)) && (cache_size > cs_min))
++		else if ((last_used < (cache_size / cs_factor)) && (cache_size > CS_MIN))
+ 			cache_size /= cs_factor;
+ 
+ 		num = cache_size;
+@@ -568,7 +569,7 @@ static int uuid_generate_time_generic(uuid_t out) {
+ 		}
+ 		/* request to daemon failed, reset cache */
+ 		num = 0;
+-		cache_size = cs_min;
++		cache_size = CS_MIN;
+ 	}
+ 	if (num > 0) { /* serve uuid from cache */
+ 		uu.time_low++;
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

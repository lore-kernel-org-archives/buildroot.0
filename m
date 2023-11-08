Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46D2C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 847048201F;
	Wed,  8 Nov 2023 21:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 847048201F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrgsOhn8JlYV; Wed,  8 Nov 2023 21:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D008201D;
	Wed,  8 Nov 2023 21:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1D008201D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8DA1BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 458DE8201D
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 458DE8201D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llRe44QOufUU for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:52:13 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 259DF81EC7
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 259DF81EC7
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32db188e254so99441f8f.0
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 13:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699480330; x=1700085130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zm1HTuX9uS6HfpUTpxFJojUizVY4qtR+LPbpLqog4gc=;
 b=GlwGioqkwG5nPx4rRgS/2iRxgfZzOcv9zfoO2tEEaLVCELY0i7B4HRjFgjLGY7hshh
 Ul1YIG3RK8CjMWCx/X5u5EuY6M41TLAM6faC4F54fnrP1cepksMS9OsZl9NqqFKGACUh
 FrrwM+YqUC28a3lnaBwiqI9zLWsXJgJr6gZtFt0rf6xWt+MI4i+iv90f7ZFpHBBi97CO
 dOx5qy4lfkELN9q1iXA1Ac4yieNpNQH5CvVClr+7K8rfJsX8oZPV7jmqZr+cWUXBtre6
 PBWulbl1s/qI4I6ZwVM1RpnnEzHNSl2wKMikrLeFw1DY8MTGTAqB7XVkBvzgOvg7r1wJ
 OZ2Q==
X-Gm-Message-State: AOJu0Yz3rv+JPtHZrooUXEQ9ws5SnPYU7XxFXw6wUsxB7es+XPzBk/UK
 9TMw5cj12DeLR4FONooE1Od17ld5+ZA=
X-Google-Smtp-Source: AGHT+IHlGp2RM8WkhkbY8sXNXRqQy6adY6iT7nHH4gk5Ml86vHBzbXVwOErivd640yAaSTSXGFKOtw==
X-Received: by 2002:a5d:4d46:0:b0:32f:b1d7:560a with SMTP id
 a6-20020a5d4d46000000b0032fb1d7560amr2709966wru.35.1699480330019; 
 Wed, 08 Nov 2023 13:52:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d530e000000b0032daf848f68sm5893573wrv.59.2023.11.08.13.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 13:52:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 22:52:03 +0100
Message-ID: <20231108215203.26206-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699480330; x=1700085130; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zm1HTuX9uS6HfpUTpxFJojUizVY4qtR+LPbpLqog4gc=;
 b=RI+IzB8yWZdPptQstEZi4mUguah87qQdc9ISqlmX3HhfGipiQ0kknGuTQNzkxpidnu
 GpHSM/FLG1mgLRTMKTBdFyewemDSw3lnDInmyPzcX+jSE9Xo0fUMXpZ8hOw3wTrA27w+
 hnfS0jyVJVA4MpWirT5dC+VgRQyaccypxbuLkjGH6m46VvQd0AXbz6oJ6eW3eRjuyORH
 awaMLjbZnDa634kL/A/gWHYEBHRgOMuftG31SpsReMNaajjwcY7IhutPbjknnuH8+KqL
 8N6vs7qTUHT3vevoCqUN5ySFkaPONi7uzq3HSevfB1wf3zYnoQaDomcRvltLhsjKH5iE
 EhZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RI+IzB8y
Subject: [Buildroot] [PATCH 1/1] package/json-c: fix build with gcc 5
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

Fix the following build failure with gcc 5 raised since bump to version
0.17 in commit 725580a26ecbd554567880e95b8533b2c9baa5f9:

/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c: In function 'json_pointer_result_get_recursive':
/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c:193:25: error: 'idx' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    res->index_in_parent = idx;
                         ^

Fixes:
 - http://autobuild.buildroot.org/results/523b35a979d59121fe4e18c38171792b06233940

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-json_pointer.c-initialize-idx.patch  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/json-c/0001-json_pointer.c-initialize-idx.patch

diff --git a/package/json-c/0001-json_pointer.c-initialize-idx.patch b/package/json-c/0001-json_pointer.c-initialize-idx.patch
new file mode 100644
index 0000000000..3dbe0b4067
--- /dev/null
+++ b/package/json-c/0001-json_pointer.c-initialize-idx.patch
@@ -0,0 +1,37 @@
+From 7ff7eab603611c65b3110dcb1b0caf5cc68b07a3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 8 Nov 2023 22:42:48 +0100
+Subject: [PATCH] json_pointer.c: initialize idx
+
+Fix the following build failure with gcc 5:
+
+/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c: In function 'json_pointer_result_get_recursive':
+/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c:193:25: error: 'idx' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+    res->index_in_parent = idx;
+                         ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/523b35a979d59121fe4e18c38171792b06233940/
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/json-c/json-c/pull/839
+---
+ json_pointer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/json_pointer.c b/json_pointer.c
+index 89e9e21..0ac8aaa 100644
+--- a/json_pointer.c
++++ b/json_pointer.c
+@@ -158,7 +158,7 @@ static int json_pointer_result_get_recursive(struct json_object *obj, char *path
+                                              struct json_pointer_get_result *res)
+ {
+ 	struct json_object *parent_obj = obj;
+-	size_t idx;
++	size_t idx = 0;
+ 	char *endp;
+ 	int rc;
+ 
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B6CAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 18:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E70A3414C8;
	Wed, 17 Sep 2025 18:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6ek8QJpTGtO; Wed, 17 Sep 2025 18:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E85B5414C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E85B5414C9;
	Wed, 17 Sep 2025 18:55:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0064199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C65E7616A9
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYRk37gI01Kc for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 18:55:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A837A608C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A837A608C2
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A837A608C2
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:55:09 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b07c2908f3eso20574766b.1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758135307; x=1758740107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X6duQcy6SA2IN+Ruv6lLo9AYPhAga/kTDOHtWJOkLd8=;
 b=iti/FaetLA/bhEs0+Ooe+nWTI0iM5loeDnEIHoqTyVkfH3R/kgL/LUgik9A7I5aQZ0
 F6gGYIvRJkxsdhXFZGjWnYL37NogUCZ+demA4VCq1undVngwJ5NOFvGE3CNYESXURf8Z
 wbPAcMkhA+ZHyxtdAHme8nipdPRn8LI1YDgGL0cxNemv7ZKP70wy1BmMCbdj6PSXfDMg
 hCxssWxj9J5jnrMQeRBv4qw/tMf8K4XdkpTNUsxdbqJxXb/lYvy/v0xZsdKb1hyovjl8
 mS13qSxzMvwyldjbwHB2wEbj21tLsf0+zj3I/cL3ZQTrAy/7em2Xbrjit/w2TPjbipbU
 hILg==
X-Gm-Message-State: AOJu0Yw4FUO6RPg7k/44OZgnKBN6IP9CmpI9zc3ExuChs4eclx4fFx7V
 nNfmWHv36UohZtEidJePhFtexNsux8uWNgMGoZinE4+98G+3szfblNY7tA5gI8e6vz7XuMc05iE
 aQTVVtMQ=
X-Gm-Gg: ASbGncuqaBnoAHg45nfEB2d+1o+qNUFFvYvHBFrQZQKUu3pvEULwzGXgFdBukV1Ek7u
 sJ2cF0O73k7w/jg4Bx494O6Pv3soVP2Kjapdc6jzElgjTaasEOhpcVdcE6XLZt6flCCUIPo+LhH
 HOPr6gLRI/W9WXgBfWWnOAWdNskleEfU2z/JYTZGutwX+ncFBlkWb8ApJu1GUsBObiPq2RvBm98
 aXEKlDKVYXt8+CqBkILK8SPrFn3c1X6qpP23MUBw25sbk5sVq8Y2MYx8gxo+zBsNjDBJ3fm/+5Z
 nW4bxQZxmbrPL0z3Lk8/LXlgHwoM+em28vaqpuieccUVh0LWxekzSbl4nauis+XVWuTGnOSwclX
 9hot2GQ9egLSTXIpSwiZFDULmdbaTsns5CsiBC6eOmNPAQGw=
X-Google-Smtp-Source: AGHT+IHoPPpA8qnwyotvAFQtp2BjItmFhCeM4Mkk5E9FBvyY4YfEKehHTxiQrmCsh36W7bkCEomIxg==
X-Received: by 2002:a17:907:9409:b0:af9:76cd:d836 with SMTP id
 a640c23a62f3a-b1bb50c4095mr370052666b.13.1758135307232; 
 Wed, 17 Sep 2025 11:55:07 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fc5f43884sm28402666b.3.2025.09.17.11.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 11:55:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Michael Vetter <jubalh@iodoru.org>
Date: Wed, 17 Sep 2025 20:54:42 +0200
Message-Id: <20250917185443.2881784-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758135307; x=1758740107; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X6duQcy6SA2IN+Ruv6lLo9AYPhAga/kTDOHtWJOkLd8=;
 b=PHOST0JfKyxTiwitLzZFVN6k/mGbEk0wAOGVwtuBTK+evXGnqhyeq/uMLulU9WMJkT
 mHSzoPIgP/ih0ANoXOB56UPFmZFJgp2wsZbHjKxIYWy7atxCajE3rlBNVA4tzTYe4v7k
 GqHG4vGbWB2EgdiNVGyAhaUyYcJguT20tBsmt8/Cf5CRxmkAjA8zRvelBlBG94kmm9xy
 xMg0doTfBAqeOM3KxEoqoKzNkCkoqJtPYWZ5WkvId1hUWOpccd2ZiJxBhBhj+lLJhce5
 eNnOBYCnt2eSzOgP8d0Koyd/Lwl0esLdqWCXuiJCmt2eXOetECpYR7HXvUoFmlE6WbwS
 08Qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PHOST0Jf
Subject: [Buildroot] [PATCH 1/2] package/jasper: add patch for CVE-2023-51257
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:

- CVE-2023-51257:

An invalid memory write issue in Jasper-Software Jasper v.4.1.1 and
before allows a local attacker to execute arbitrary code.

For more information see:
  - https://nvd.nist.gov//vuln/detail/CVE-2023-51257
  - https://github.com/jasper-software/jasper/commit/aeef5293c978158255ad4f127089644745602f2a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jasper/0001-Fixes-367.patch | 46 +++++++++++++++++++++++++++++
 package/jasper/jasper.mk            |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 package/jasper/0001-Fixes-367.patch

diff --git a/package/jasper/0001-Fixes-367.patch b/package/jasper/0001-Fixes-367.patch
new file mode 100644
index 0000000000..11dfb5672f
--- /dev/null
+++ b/package/jasper/0001-Fixes-367.patch
@@ -0,0 +1,46 @@
+From aeef5293c978158255ad4f127089644745602f2a Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Thu, 14 Dec 2023 19:04:19 -0800
+Subject: [PATCH] Fixes #367.
+
+Fixed an integer-overflow bug in the ICC profile parsing code.
+Added another invalid image to the test set.
+
+CVE: CVE-2023-51257
+Upstream: https://github.com/jasper-software/jasper/commit/aeef5293c978158255ad4f127089644745602f2a
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libjasper/base/jas_icc.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/libjasper/base/jas_icc.c b/src/libjasper/base/jas_icc.c
+index 905b823..2d1e91e 100644
+--- a/src/libjasper/base/jas_icc.c
++++ b/src/libjasper/base/jas_icc.c
+@@ -1295,10 +1295,22 @@ static int jas_icctxt_input(jas_iccattrval_t *attrval, jas_stream_t *in,
+ {
+ 	jas_icctxt_t *txt = &attrval->data.txt;
+ 	txt->string = 0;
+-	if (!(txt->string = jas_malloc(cnt)))
++	/* The string must at least contain a single null character. */
++	if (cnt < 1) {
+ 		goto error;
+-	if (jas_stream_read(in, txt->string, cnt) != cnt)
++	}
++	if (!(txt->string = jas_malloc(cnt))) {
++		goto error;
++	}
++	if (jas_stream_read(in, txt->string, cnt) != cnt) {
+ 		goto error;
++	}
++	/* Ensure that the string is null terminated. */
++	if (txt->string[cnt - 1] != '\0') {
++		goto error;
++	}
++	/* The following line is redundant, unless we do not enforce that
++	  the last character must be null. */
+ 	txt->string[cnt - 1] = '\0';
+ 	if (strlen(txt->string) + 1 != cnt)
+ 		goto error;
+-- 
+2.39.5
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 45b9c49558..dd0badbc8f 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -15,6 +15,9 @@ JASPER_CONF_OPTS = \
 	-DJAS_ENABLE_DOC=OFF \
 	-DJAS_ENABLE_PROGRAMS=OFF
 
+# 0001-Fixes-367.patch
+JASPER_IGNORE_CVES += CVE-2023-51257
+
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

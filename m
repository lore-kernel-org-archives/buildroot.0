Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A51C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 16:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E085F60861;
	Mon, 12 May 2025 16:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XA3OMnh-7yrq; Mon, 12 May 2025 16:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 130B4608F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 130B4608F4;
	Mon, 12 May 2025 16:33:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C562150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 16:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 021AA608F4
 for <buildroot@buildroot.org>; Mon, 12 May 2025 16:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id makr4lcw6VHB for <buildroot@buildroot.org>;
 Mon, 12 May 2025 16:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E87D960861
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E87D960861
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E87D960861
 for <buildroot@buildroot.org>; Mon, 12 May 2025 16:33:00 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso29253255e9.0
 for <buildroot@buildroot.org>; Mon, 12 May 2025 09:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747067578; x=1747672378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YEa03FqY5L3v5k0GSOWtc4NucMujEp7WOMjzZ5gc+h8=;
 b=e28zBJ3hgOJBvW0VYWEPzvTrNZorU+rO4I2SQ2JWBNyilpcW4g5RL7/bEtqnj52EsU
 J7RnvQ28gM6mpfE8ssa0kH7Lfhi4L5LIva/Gy9P0VMOsR3oj/VQQvzBcTLysrFNo23Wb
 Snp32jcyupD67Ci0Eqno41SBFZsSiAvrWpdSdI2SnxttRXHWve2/zbOjaNVCE+YYc3gI
 mOTkiuKaYmoXOm5siGu8KG1msYeQXplM++/2IP2GhTa81LQTv0d/DqddazuCyDVsQeF2
 0uXfuGnH/d50c/U4dwqf9vB5cO89jF+kdMRYMxyBIAwkSFrOwVqxwaGUamqXZ7rNIhsH
 3QRA==
X-Gm-Message-State: AOJu0Yzh9PSCHh77CjBecsTdmhi+dvLNWO3xFj57YQpuS/4JCKfq5Fe8
 iNUWV+Sex4D2U7glx8Zs7O4ajPmiSziA5V78+UYJzWedIh1d2FLxKDF2WX23n3pvS8TRRuR9PeM
 KLn4=
X-Gm-Gg: ASbGnct47CNyuwyfQZ69ufCmT9reDb+ASSCpocfTuQzTC0gWVH3uULp0zJeaJGrtD5+
 6sv85BtguNAe8+js9k5Mdni60/8gM3/ZzujKH8Fqwn6p7BOIf8MLvQJpq4szmkqoM+tOu4MaPim
 SqiXDWI4h7nQ6MS0UrXuKzke7WSefaBLNx9p2tRZoBWPFIh3iXPbc7KFXY/64zuqlUxhhn5jd7J
 GP3XveIZcDMoSyChiSlt9Xw6eqxlZyysQ21LZlcWCA06GxePozAvE9cblZ0fZfS6hBe4k4Mh4os
 /NBNKLNswObuai8r0cCVNf/k94ZHk7qFI+ckBG2XNWruSm1zByKFdLb+yCXZFw+Kb6W/ucOETIl
 CRIdtegIbMSww/4IbDNXDh2tppxjsZAzolK/yrJrK0PsJUlPvGOv0fqDKqQ==
X-Google-Smtp-Source: AGHT+IH0Qf4IJaErIwk/jFFNWSu/Ffg7M0FpLd0glzW5UNuDKZBoQ3o/6ZF9QA/luh/eY07ruUNdLQ==
X-Received: by 2002:a05:600c:3483:b0:43c:f44c:72b7 with SMTP id
 5b1f17b1804b1-442d6d44b23mr118342545e9.14.1747067578611; 
 Mon, 12 May 2025 09:32:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 (p5b26784b.dip0.t-ipconnect.de. [91.38.120.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ea367102sm8041055e9.3.2025.05.12.09.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 09:32:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 12 May 2025 18:32:53 +0200
Message-ID: <20250512163253.1521000-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512163253.1521000-1-dario.binacchi@amarulasolutions.com>
References: <20250512163253.1521000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747067578; x=1747672378;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YEa03FqY5L3v5k0GSOWtc4NucMujEp7WOMjzZ5gc+h8=;
 b=Bnx3w1A2Mt6fQZ367uIThlhl4dqI6ubze1HBlZNK0OtTe3fhP691q2eagqMlqfC4W5
 MsBXObWbKzaet0bkPt9h14KKCJsfZZBNyirgiF1VaQhas/GofGxMz6ECwqV2oJgu9Xgq
 1PmVIkA/l/qFM2xYEzc9aS3LyDhq+lSrhJFZU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Bnx3w1A2
Subject: [Buildroot] [PATCH 2/2] package/connman: fix CVE-2025-32743
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
can be NULL or an empty string when the TC (Truncated) bit is set in
a DNS response. This allows attackers to cause a denial of service
(application crash) or possibly execute arbitrary code, because those
lookup values lead to incorrect length calculations and incorrect
memcpy operations.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...L-empty-lookup-causing-potential-cra.patch | 46 +++++++++++++++++++
 package/connman/connman.mk                    |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch

diff --git a/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch b/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
new file mode 100644
index 000000000000..9c1274e43ce5
--- /dev/null
+++ b/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
@@ -0,0 +1,46 @@
+From d90b911f6760959bdf1393c39fe8d1118315490f Mon Sep 17 00:00:00 2001
+From: Praveen Kumar <praveen.kumar@windriver.com>
+Date: Thu, 24 Apr 2025 11:39:29 +0000
+Subject: [PATCH] dnsproxy: Fix NULL/empty lookup causing potential crash
+
+In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
+can be NULL or an empty string when the TC (Truncated) bit is set in
+a DNS response. This allows attackers to cause a denial of service
+(application crash) or possibly execute arbitrary code, because those
+lookup values lead to incorrect length calculations and incorrect
+memcpy operations.
+
+This patch includes a check to make sure loookup value is valid before
+using it. This helps avoid unexpected value when the input is empty or
+incorrect.
+
+Fixes: CVE-2025-32743
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f
+---
+ src/dnsproxy.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index f28a5d7551a4..7ee26d9ff886 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1685,8 +1685,13 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
+ 				gpointer request, gpointer name)
+ {
+ 	int sk = -1;
++	int err;
+ 	const char *lookup = (const char *)name;
+-	int err = ns_try_resolv_from_cache(req, request, lookup);
++
++	if (!lookup || strlen(lookup) == 0)
++		return -EINVAL;
++
++	err = ns_try_resolv_from_cache(req, request, lookup);
+ 
+ 	if (err > 0)
+ 		/* cache hit */
+-- 
+2.43.0
+
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 2c5be8252c6e..5d515c296319 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -13,6 +13,9 @@ CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CPE_ID_VENDOR = intel
 
+# 0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
+CONNMAN_IGNORE_CVES += CVE-2025-32743
+
 CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

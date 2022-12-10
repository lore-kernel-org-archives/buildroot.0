Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3220C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E43160B3B;
	Sat, 10 Dec 2022 19:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E43160B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KV86jSdVPycl; Sat, 10 Dec 2022 19:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7585260B12;
	Sat, 10 Dec 2022 19:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7585260B12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1CAF1BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A3148195D
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A3148195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXpQi2ZrRG-H for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:30:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97C8C8195C
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97C8C8195C
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:30:26 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id s16so1533121iln.4
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JyqdnlfMU+bZnI4MyB1sZ30ezU3xMkWQKNnKvhJenek=;
 b=WadlXnFdb9wQccCXgG1OvwT2zMOrnfpSsyhyw5fXlRe9QKo2a/APjRC/fAdCXJRIqh
 oScrQu+fR79qd0x9ucVFwffgSNtIYn7Y13FyrIz2+BkGQZoX0k4zcY9wuL5UtGoIh8Mj
 QnmvdrXbPAJnCDB8vOY8ACGutTtPopG6OtrRff26rOwxwq8bgfVWDCoChmNs4D5zjyq1
 wWt3J9cipLOKi75rhIvVbq+wefPKHi6mTYYP6tUVnWo4F9UrR5xmpjKV2oN5kbvH2tZ+
 xW+EAtcBg3fqOIpV9gDQPIHcVIPgHU5hz9CJ4FrbvoDCeoBEYGCSlqApRfy4GIZV99ft
 mgFw==
X-Gm-Message-State: ANoB5pmuM1YjAW0gqN5K5tGveH1lZ+p+Td490YQrAdjajKlUXRJcwkr6
 V+Tf4s3rx2LMmlzZplBoH5h7VAiBhTX2CDpR
X-Google-Smtp-Source: AA0mqf55A9S0cugrllVwe8AonAQ8f/Pf6vGm3XV50BdXuDVOXFJiRHSEySYMXO9P0x7QV8zlVou8QA==
X-Received: by 2002:a92:dc02:0:b0:302:ff81:3ffe with SMTP id
 t2-20020a92dc02000000b00302ff813ffemr5667357iln.8.1670700625549; 
 Sat, 10 Dec 2022 11:30:25 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 l18-20020a922912000000b00300e7a459aasm1549654ilg.38.2022.12.10.11.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:30:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:30:23 -0700
Message-Id: <20221210193023.3132962-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JyqdnlfMU+bZnI4MyB1sZ30ezU3xMkWQKNnKvhJenek=;
 b=AhujJeskKUywhoQ2lLXnIPptiqAP8e/XZEMPDNuIBm+tV9XiAZOP91U+QZnNtjev9Z
 j7qur0cNGrAFkFFG3QKHVNLRoC09dZHKyfgJkMezBk3ikzTXTcbWqRRnzH3Q2OSrEG8L
 kkzpTlPrY9N71YPOpdVd9VdLHTrWDlyxVvVT71r+Fp3sbIBq0FyWXYulq0L3xO84ouKm
 wh0Qo9ouB8x7rUlTWAzKLVTcRGCiuQFUr7j0auTVqVXNP0wvhvpvnBn5Y+pziiMxmWzB
 EDpNDBlNmR1UPDAL3dUQw3iw+EQGnQlxzZpYNphtgt0v0YaTfcN8KCip2n82CCscly/n
 Bsug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AhujJesk
Subject: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to version
 4.21.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 24dbc0f1a1..f1f5fa77cd 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  f6251f2d00aad41b34c1dfa3d752713cb1bb1b7020108168a4deaa206ba8ed42  protobuf-cpp-3.21.8.tar.gz
+sha256  96f0ab99b7414e44e7bf9b218bb59510d61549ca68e648f19e3622f9999bec00  protobuf-cpp-3.21.11.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 88f359f24c..33a7c40f40 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 21.8
+PROTOBUF_VERSION = 21.11
 PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index a12c199663..c2afc3955a 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d81ebc20030fe8d03bceb38f06aba2797c40852e5aab6819481ce808fb305fae  protobuf-python-4.21.8.tar.gz
+sha256  ae4ca6e1da635f31019d8911923163f372d9d333e8857510f513acba33172d0c  protobuf-python-4.21.11.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

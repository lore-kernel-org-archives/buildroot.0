Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5446E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 15:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CC158135A;
	Sun,  1 Oct 2023 15:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CC158135A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id onpA9zK7nW9j; Sun,  1 Oct 2023 15:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D18718135D;
	Sun,  1 Oct 2023 15:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D18718135D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15BDC1BF42E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 15:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F09E260D59
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 15:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F09E260D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLkCPwazd65l for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 15:25:27 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7298160C0A
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 15:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7298160C0A
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-325e9cd483eso1953030f8f.2
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696173925; x=1696778725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=koeoaPFwK5dWSMtJ1XoM4fBgzywo9QM44vGbls9/ICc=;
 b=bm2Rh+YwKvrv9sJwxl1hzbF5Cys/9nO1W6oa8Aex4/mdA+yC+1mxhqZHlU8hutk12Q
 jONk8XlD9oylrpRfPL4WtwJ6Pssuu7o+4ksJS1O/u/ZG875IjIewaS0HyMWl8HRa/KhV
 xdwyDtHFbcf+8olsYaSRr14vgC4ErVeecAJRxDRmC2dxh/YG+Iu5v8lHcT9yN2zK0ch4
 ZB8B6xNOpkLhrM3ltNnCGsocNq8dNtxskqd7QNnxkyuR5E2dqDJ/RrNZlwWzqYkUnUFA
 GgNnepS+1T19zGQCaJTR6mUSAG4yrXBqpWzFODD4a2LeQ86SGLt+kRfHe5gpxLrwH1nr
 Hz1A==
X-Gm-Message-State: AOJu0YzfspLAYnboKsWwQBxsPFWYmVb9ok+Aj96XqG6Ie+J0QaCHMSGh
 xC9gAPkrLL07+vO9PqAGcZW/hVsmGzU=
X-Google-Smtp-Source: AGHT+IEY4G0MA8NPtHFdCI686QGY3UcPiWrVsdMOc7LdFhzpWh4ywR1nYPZMy4kEL9tI4P6VEBM7hw==
X-Received: by 2002:a5d:6749:0:b0:317:c9ad:e96c with SMTP id
 l9-20020a5d6749000000b00317c9ade96cmr6822511wrw.15.1696173924505; 
 Sun, 01 Oct 2023 08:25:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g3-20020a5d5403000000b00325c7295450sm5465810wrv.3.2023.10.01.08.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 08:25:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 17:25:18 +0200
Message-Id: <20231001152518.1065457-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696173925; x=1696778725; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=koeoaPFwK5dWSMtJ1XoM4fBgzywo9QM44vGbls9/ICc=;
 b=S6J+XWHgDx0BMXdWZhDmJuViEdF96VtCjqwD7r+NBSdR8DrXqkW2/jWY6w4H6p/mPi
 gpF4KcSc12t7ckooEpktf73uZPlRUU40i0lBnE/kyTUQbFtQKngst1HQ8oNrrM8z1oiB
 O/bjY5GB2OFqSO/t3ncvIbSRmmqmwmAaX9koU7LwscSBICLczyfBahbMIs6uATJbOAay
 LAkQ2WB9YExbPD5D11VfgAS9IxO2Ui4V1Vm2rxIz4HX3oUPBHX5vxLPXCpON2T5D+XpS
 U0TxZeo4DBjNKSGyCdl/BtPYdvExL7AvAR51p7Uj6HLtBN2ABkAvglvuiYiXU8a8ntRe
 NpqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S6J+XWHg
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: add c-ares optional
 dependency
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
Cc: Denis Bodor <lefinnois@lefinnois.net>, Michael Vetter <jubalh@iodoru.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

c-ares is an optional dependency since version 0.10.0 and
https://github.com/strophe/libstrophe/commit/a13847d9949f05920f94768495872807ae49c773

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libstrophe/libstrophe.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index de9012e67f..ad0860ad30 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -13,6 +13,13 @@ LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
 LIBSTROPHE_INSTALL_STAGING = YES
 LIBSTROPHE_CONF_OPTS = --disable-examples
 
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+LIBSTROPHE_CONF_OPTS += --enable-cares
+LIBSTROPHE_DEPENDENCIES += c-ares
+else
+LIBSTROPHE_CONF_OPTS += --disable-cares
+endif
+
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 LIBSTROPHE_CONF_OPTS += --without-libxml2
 LIBSTROPHE_DEPENDENCIES += expat
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

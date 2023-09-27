Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DD7E82CCD
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 20:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17E0641A26;
	Wed, 27 Sep 2023 20:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17E0641A26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_nz746O59v1; Wed, 27 Sep 2023 20:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7262040518;
	Wed, 27 Sep 2023 20:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7262040518
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C3061BF267
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E70CC4225D
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E70CC4225D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mAi5Aqz1uEb for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 20:07:16 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B87E842255
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87E842255
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-405621baba7so91194475e9.0
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 13:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695845233; x=1696450033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0GNASUTQ9rIIBNNDD4YAoC81jBZeuW/WfYDdxw5x47o=;
 b=cSNdP1v+Svj8082t8XIGaAzqQw9u8o6ZxHmOfMNo4pn0Je9zIoIpcDkoN/Z2g2BSzM
 IjXhz/FE8LPXEe/fHUe6hrQM6kOLxNPZecGoDDRG7y+r+uHIzG3mMotztMxZgCECcEu2
 Jq5P19KCIGYe2cjxTNQidGtA1g+BqYA/Z99brNIh9m0neyM08ijX3ujEmPj8cKA02d7n
 wyE9h5+KHfk+G8oLDoJfCcRbEtuVRjfeIwn3CKiiRQHtZQdz6aVfRbb940wKVU9Uaxc3
 OeM95CeVmNCUP0WCnz3OQFM9gQjXXrRTfJgA8TiyMZlrptg6kk+74Fz6rRXY0HYRm/n4
 pH9g==
X-Gm-Message-State: AOJu0YweuYStlZHbe+9sZZRyP8WVy3CJb1m9DsdNycYGtHwZRoH2lxF+
 uDsv8Eopy9Fnwd7BM11LFntwMSbxK8s=
X-Google-Smtp-Source: AGHT+IGSmZL5fcvIcvz1s1QFbUYcR/oIuxJM94AxL4EUwHep5GYsAukLmV79X/ECCNDxW2eoScjfLw==
X-Received: by 2002:a1c:7715:0:b0:401:dc7c:2494 with SMTP id
 t21-20020a1c7715000000b00401dc7c2494mr3071348wmi.27.1695845232911; 
 Wed, 27 Sep 2023 13:07:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c24-20020a05600c0ad800b0040596352951sm6922473wmr.5.2023.09.27.13.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 13:07:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 22:07:07 +0200
Message-Id: <20230927200708.491826-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695845233; x=1696450033; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0GNASUTQ9rIIBNNDD4YAoC81jBZeuW/WfYDdxw5x47o=;
 b=lO95d+6jx4pCAweC5yfSo1WzXio5UTnEX7xhwjkDmygu9izhYklm/ZBYIBb0ivKx4S
 aPkNNpeP2SIVbMhIFIsJAR0NhZcViNUPLRjEQt4qAoDLPfTUi+Q2Vvi6a/gDJNe4gTSB
 jBiUiXoz+tRjNhvfL2D5rOhwZM7qYUdpjDYDICdrNeqkd29AJJUZt5N+b3EeVs/JEHZa
 UGEXeuBxgLHY98h9uFOTRnRC7Vkn7B/8dhu1aN9XHeUMNkrg9K/vVThG7dTPyWeRjBaP
 lpUY/yEy5/fJqP7azxPo9KXlqjxW4KAm59ENtM/90gmxwurQzcTzRQE718aXI1vq+wKg
 eXdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lO95d+6j
Subject: [Buildroot] [PATCH 1/2] package/libhtp: bump to version 0.5.45
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

https://github.com/OISF/libhtp/blob/0.5.45/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index 8759823e16..c016cb3439 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0afaff837c295c868db8c967b87b1b5e21c0386c15c3b5ead474799724c54ef8  libhtp-0.5.40.tar.gz
+sha256  d4214f94522fa5a1ec1909dbb52831c534788d93bc6b2ca8252de9332b11b606  libhtp-0.5.45.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index bb8aa73b42..8a732d1d5c 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.40
+LIBHTP_VERSION = 0.5.45
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

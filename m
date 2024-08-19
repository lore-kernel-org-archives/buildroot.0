Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0221DC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 08:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1DD860011;
	Mon, 19 Aug 2024 08:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DPX6hZm8hEP; Mon, 19 Aug 2024 08:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E347660093
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E347660093;
	Mon, 19 Aug 2024 08:43:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 978211BF3EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92ED940395
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-OygiE-rZSR for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 08:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94F7740132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94F7740132
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94F7740132
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 08:43:55 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7093472356dso2098353a34.0
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 01:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724057034; x=1724661834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IN6oMkLHTxxZN/PgiCbaq1rpPsIqL7r4wz/Z5tIkHvg=;
 b=jMftDdKDgdAbdwcZ6JDyoYi8CCtDq4DNxfRlmAIclADgoX1RChAczCY7V/KBUry0yE
 fHcRCabl5BBPhqPMrcIm4hrg2x74kGBzbXO/YseBO/DQkKbBY8Sxh3IF1GRdGTuc8xXf
 odBAsJ9mF7AqY1EKqFaEb9rID4LgfUk5QXi/ghRc3Zg7wt9bCFceg/lpoD5mnSu4RDHm
 PEFCOIP+Sv0Eu18XxKgSeBcPUTEUO5vpR92L6QKttUsap8Z1zbKzzie7KYWvu9LnbDCZ
 210/Kyxn09ciWpnTj8G80GOmmNChgfuuzXW3qWbyG/P24Ggapv7Y/OvhFybxOTfQI810
 IjCg==
X-Gm-Message-State: AOJu0Yy2tI3JrL/tdXqs5F30inFE4lwj6xZn3tHJz3G8pWr34QE4YWon
 X0wJ9BYen/CS5bwiJe5JcwZvgdDHW4DhWvlMxu/T6K/uJYgXW9lCuH7VKIZP
X-Google-Smtp-Source: AGHT+IElP2Np/1rCKaGvk4Cc8JaVuGsuy2MMQth4HnyIUTfRL7Fh24/0WHXFcgfyoI86uN2MQkmjyw==
X-Received: by 2002:a05:6830:3c8c:b0:709:419f:2ae7 with SMTP id
 46e09a7af769-70cac8b1dbamr14446707a34.29.1724057034151; 
 Mon, 19 Aug 2024 01:43:54 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-70ca65b8d20sm2090681a34.39.2024.08.19.01.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 01:43:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 02:43:52 -0600
Message-Id: <20240819084352.905082-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724057034; x=1724661834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IN6oMkLHTxxZN/PgiCbaq1rpPsIqL7r4wz/Z5tIkHvg=;
 b=kN8rKXQE1DfnwzIhnVB70SD9f2X7f1wo9klPt7AGkuzamkeGJm7OGrm+nbpOEbjV4q
 td8tyvlkmONtE7TYcbcIa0xWZCUYDmskxQ2YOY70dvi2uf0zq7jKLIb8VY6EEHI5GVkk
 pG4jWnzLlU0Lk6owpxpxwEDIwG0YKAx3zscnHscPOHIwCPhc2sC1MEfJRnLhDt2GFcKc
 dtPZoAK2q+giipi63IKM7TrqXAL40TaruBX93inB4wlo3jQBSFV/Qdudhbw5WKgO6fQh
 wa/A9uKNA/od7ZZnfKmMXcfHZXB82m9uKrvVBZoqF1BdT8hxe7j30He/ovsJx85VrxLJ
 yQqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kN8rKXQE
Subject: [Buildroot] [PATCH v2 1/1] package/flashrom: fix cli with
 BR2_SHARED_LIBS
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Flashrom requires --default-library=both for the cli when building
with BR2_SHARED_LIBS.

As such set --default-library=both instead of disabling it.

The cli was disabled in 8637884057ddc3c1aeb9f0dd285fc6fcf378c26b to
work around a cli build issue which this fixes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add some additional details
---
 package/flashrom/flashrom.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 1e7d332dae..030f6816a0 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -10,6 +10,7 @@ FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 FLASHROM_INSTALL_STAGING = YES
 FLASHROM_CONF_OPTS = \
+	-Dclassic_cli=enabled \
 	-Dclassic_cli_print_wiki=disabled \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
@@ -78,10 +79,8 @@ endif
 
 FLASHROM_CONF_OPTS += -Dprogrammer=$(subst $(space),$(comma),$(strip $(FLASHROM_PROGRAMMERS)))
 
-ifeq ($(BR2_SHARED_LIBS),)
-FLASHROM_CONF_OPTS += -Dclassic_cli=enabled
-else
-FLASHROM_CONF_OPTS += -Dclassic_cli=disabled
+ifeq ($(BR2_SHARED_LIBS),y)
+FLASHROM_CONF_OPTS += --default-library=both
 endif
 
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

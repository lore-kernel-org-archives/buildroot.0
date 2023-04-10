Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED22C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 08:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11FC360FC7;
	Mon, 10 Apr 2023 08:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11FC360FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VwVdGt9U3ft; Mon, 10 Apr 2023 08:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9E56FE8B;
	Mon, 10 Apr 2023 08:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A9E56FE8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 742781C3AF8
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 08:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B34E81F08
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 08:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B34E81F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3wU4RzTQdVRL for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 08:32:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C601F81EF6
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C601F81EF6
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 08:32:59 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id j28so1591543ila.0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 01:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681115578; x=1683707578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8wZ6kCYRSeuMnbCm/82dIuVxvGf9Bba0vkj6hyfUFwk=;
 b=dQ1kSTn1PzBfX9EX2YzDOXLDTE9pWqY/eWsJysW84t959OUVbC7J0VMvxmAIWBuGhd
 Ql4M//i3P/tLowawbk0B9aoTeEpe9JSUzKMUWTFKzd0Qld3VllE8enOp3Lrb+A4sA/Rd
 xP00CGnUm8EJ1wmfbQ+5Gt+9MsmX0nVT/p8LhiT/DMHe+DIlBqXvy7gzYzby6kxtUewK
 pIuyw7IxZb3KEWSZjlPD39b4/p9QLkWNrkXhKzKDzDh+4HCc/LRZoFWfek0LQd4r+/jJ
 WP2rwI2v/E6qslYzgtvAb0B9XDJQ2fbBDlN91PVViW8Fqu0K++2aIk8WzlancTHaTTIK
 diOw==
X-Gm-Message-State: AAQBX9dG6rbPTVeCjx1/NIYE5LmMsjrj8UKxeX36v5THYd4pjcBnjvg2
 1uA01+OCkNcp2i9+zbGnxEnQfJ5CamP2xg==
X-Google-Smtp-Source: AKy350YBf+SLs1f1JriIxr5+b7gRIVQmoIITeCGVVkEchW6J3UvBNOuuhCahEbKFGiIn/qnKodxGnw==
X-Received: by 2002:a92:da4e:0:b0:325:b002:89a4 with SMTP id
 p14-20020a92da4e000000b00325b00289a4mr5699740ilq.22.1681115578476; 
 Mon, 10 Apr 2023 01:32:58 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-106.hlrn.qwest.net.
 [71.33.131.106]) by smtp.gmail.com with ESMTPSA id
 x13-20020a0566380cad00b0040bbf478147sm1214931jad.163.2023.04.10.01.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 01:32:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 02:32:52 -0600
Message-Id: <20230410083252.138426-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681115578; x=1683707578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8wZ6kCYRSeuMnbCm/82dIuVxvGf9Bba0vkj6hyfUFwk=;
 b=idB7t30VkoMAm9C4crkjKAYcg1bIShbih+Bt051Xx3GYEQCZKa8cb2hnruWjy7C1QI
 +Ff/GqHej8ZYn9kP4uIXY4CxunN+KVbCTcpZhpoKt23mB0sv6NA4udP0+SY5zURlEgzE
 FEu0ww9oy8plwA+yBbvgouRowIa6hU83ECrg989EYZ+0mqNpZz9Qh4EyH8byuNvuRBjA
 s09NvtT79C/ZMb05Y8rge1XvIoTJKjafXFYcozVvlv7GwrwbwBd80+lePZG0ATm8GVqH
 WJyYMNUzZpfnEfwIqb/oVdS5qVsgBJ51GfHR08gq+cQLnbNE4yA1f44ntZ34uA+7IYf4
 RHXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=idB7t30V
Subject: [Buildroot] [PATCH v3 1/1] package/pkg-cargo: ensure host/target
 rustflags are properly split
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set HOST_LDFLAGS RUSTFLAGS via the host-config feature, see:
https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#host-config

We have to enable this nightly feature first using:
CARGO_UNSTABLE_HOST_CONFIG="true"

Separately set target RUSTFLAGS for the target triple specific env
variable.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - rebase
Changes v1 -> v2:
  - add RUSTFLAGS to HOST_PKG_CARGO_ENV
---
 package/pkg-cargo.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 5600c8e97e..264bf5a1ae 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -34,7 +34,10 @@ PKG_COMMON_CARGO_ENV = \
 # using nighly features on stable releases, i.e features that are not
 # yet considered stable.
 #
-# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" "enables the nightly
+# CARGO_UNSTABLE_HOST_CONFIG="true" enables the host specific
+# configuration feature
+#
+# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" enables the nightly
 # configuration option target-applies-to-host value to be set
 #
 # CARGO_TARGET_APPLIES_TO_HOST="false" is actually setting the value
@@ -43,9 +46,11 @@ PKG_COMMON_CARGO_ENV = \
 PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV) \
 	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
+	CARGO_UNSTABLE_HOST_CONFIG="true" \
 	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
 	CARGO_TARGET_APPLIES_TO_HOST="false" \
 	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
+	CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
 	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
 
 #
@@ -53,7 +58,8 @@ PKG_CARGO_ENV = \
 # and should be removed when fixed upstream
 #
 ifeq ($(NORMALIZED_ARCH),arm)
-	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
+	PKG_CARGO_ENV += \
+		CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
 endif
 
 HOST_PKG_CARGO_ENV = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

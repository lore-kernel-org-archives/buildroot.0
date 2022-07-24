Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1698C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 21:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BCD683E85;
	Sun, 24 Jul 2022 21:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BCD683E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKDPqTnjKUF8; Sun, 24 Jul 2022 21:47:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1959383E64;
	Sun, 24 Jul 2022 21:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1959383E64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E05A41BF33C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0B2141735
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B2141735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chSSpbkIPJon for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 21:47:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 435D341734
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 435D341734
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 21:47:46 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id z132so7516558iof.0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U03PkZXdme5C6wJ4/UWvdvrL93iNN7jsT4yZ0bblmVg=;
 b=ueTPyrNAzjR88WY6liqslTQXMSlXpY6NTJq0uMZcIRKj2HYshtsEixlnCbtbXwpADV
 V5LL148xcA+S+W0McQVaKfXvsSOm7MkuX1EV+lARHDB2NFYYW6R4xQV8rgLIqgTmEf6b
 DMPLQixJvD1TiZoC8twGQhR2LSKOw6i1lV4kLhWDhwpBUuV0vdM6LckbrYe1G8NxWFtq
 HNdBPyboZrFzZ7gams9Qte7fC+W2ImzzX5yH6lMxlb4kQsh2OCHd93xLdfeQ1OBd9ymo
 vczVybiUO3Q669hLPLb6S8ql4EIDnT6yuHfGiq1OQYDzs/5hL1yLJ1KB4kPfCZmdZ8Af
 r0bQ==
X-Gm-Message-State: AJIora8lRwuLADZgabXe64ywwO4UVQKO1sBg9Al2WxpTW9ZMn2OnKH32
 OVf9ujJXLbUk1HiLWzM4FNovSe/2yDs+Iw==
X-Google-Smtp-Source: AGRyM1uqQaMiRf4o+wKRYB75Vf+XU/+b8xQJ4SWbmX7iyZTX+Onfb9BBysQVlKz3srlkkcNiZT4Ftg==
X-Received: by 2002:a05:6638:1654:b0:341:59e0:9958 with SMTP id
 a20-20020a056638165400b0034159e09958mr3789207jat.224.1658699265171; 
 Sun, 24 Jul 2022 14:47:45 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 z12-20020a92d6cc000000b002dd0bfd2467sm4058008ilp.11.2022.07.24.14.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 14:47:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 15:47:43 -0600
Message-Id: <20220724214743.2324998-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U03PkZXdme5C6wJ4/UWvdvrL93iNN7jsT4yZ0bblmVg=;
 b=PWDvda2eEkuA4Jlf8s7PfxHeoaDmJdYTDOIWdSjyQ5ibpTsl7181ikkjzNSAhdUth9
 wgE+9K2EeM0DHLDZTnEa2NthYGwUfiedPTT5HE30rvH3KOVZ4gE+0hIF7whrkFEKz6rM
 VSrOPzkZS2Ssh4lOv0eCADtVNt8Hks4Ucxh4Fs7IiKy1zaPkroHk1hxunS2XDnoUNbgv
 pr87WVq2d2uyhqX4kHUb1OfezmzmwCBkhtUESK/ina+VPkR0F2F/TNE8fwrIuPJBsayv
 lX6m72/wDRGbBurWtmhbSs/7Kmn87YKaomuwj6Bu3/rtRJ5UMdGKwHwgfywY3TZXpa4H
 hOPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PWDvda2e
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-cargo: ensure host/target
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

Move RUSTFLAGS for host builds to HOST_PKG_CARGO_ENV so that they
are set for host cargo builds which use python infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add RUSTFLAGS to HOST_PKG_CARGO_ENV
---
 package/pkg-cargo.mk | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index f7e3f39503..1c105762f8 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -32,7 +32,10 @@ PKG_COMMON_CARGO_ENV = \
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
@@ -41,9 +44,11 @@ PKG_COMMON_CARGO_ENV = \
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
@@ -51,11 +56,13 @@ PKG_CARGO_ENV = \
 # and should be removed when fixed upstream
 #
 ifeq ($(NORMALIZED_ARCH),arm)
-	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
+	PKG_CARGO_ENV += \
+		CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
 endif
 
 HOST_PKG_CARGO_ENV = \
-	$(PKG_COMMON_CARGO_ENV)
+	$(PKG_COMMON_CARGO_ENV) \
+	RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
 
 ################################################################################
 # inner-cargo-package -- defines how the configuration, compilation and
@@ -128,7 +135,6 @@ else # ifeq ($(4),target)
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
-		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
 		$$(HOST_PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
@@ -169,7 +175,6 @@ ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
-		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
 		$$(HOST_PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D24C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 555D2847E3;
	Sun, 24 Jul 2022 02:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 555D2847E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSh4mx6CWwbC; Sun, 24 Jul 2022 02:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CC66847BC;
	Sun, 24 Jul 2022 02:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CC66847BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D68301BF32D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFB174027F
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB174027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rr17X3kUtzMM for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:01:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A49F640156
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A49F640156
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:01:52 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10d6ddda695so10816500fac.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hX1iHTM82saUMyl+o5aLsYc9rtRkY0iKtCtTbPkO3Ak=;
 b=p8ubRff7gyFY4x0kK80sLsV9yq6zwflHY8RgdRNSrci3pDsV8UpvTvp19ep1danPRt
 6ncdt/mvNFXYwJk3NxypcXJMczcROpRhBlqEL2lLKZHLJPqmhkGKr2AcwTx+OVcpffwf
 00Lll3rL4GCZUNlVyyhg2VYHd5V58HwIVEwwdQcpbgl9kSzGczA4j+MLY8ehTY1XYBBE
 P8wkJ8nsytUDU+ArGIZICgi1mVFON6oDfWzTGfunX4AVES9qjZIlT8GhbtK9yuirBFFn
 GfbBfKjIragUjMDpKG9pS3MWwLyQ/71JPRj7E+xaXgoSD3STVDCxYYN0kAz5reytPWvA
 oRWQ==
X-Gm-Message-State: AJIora9O+rH1/oy2MTC5JkqVsfb6PF3i+EeP0fqu6DccN+HSlgnN0Y3G
 nS3aWpXCc+yZ9TeBE+UVijo9suz8bz8R4g==
X-Google-Smtp-Source: AGRyM1vggC/Z0vae0xpCB2pm+d6F1Q30juhSSV/IBqYetAiyf50OdMuN00WY89s4HbYqIH8LunBTig==
X-Received: by 2002:a05:6870:9590:b0:de:27ca:c60c with SMTP id
 k16-20020a056870959000b000de27cac60cmr11237193oao.108.1658628111292; 
 Sat, 23 Jul 2022 19:01:51 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 o24-20020a056871079800b0010c1abbc18asm4028176oap.46.2022.07.23.19.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:01:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:01:44 -0600
Message-Id: <20220724020144.1012252-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hX1iHTM82saUMyl+o5aLsYc9rtRkY0iKtCtTbPkO3Ak=;
 b=bJygA0uUoUfSsKF9tl7VkJLs3WDWbLGW5srAg/aWuoFH37sfDLouuAkh4R2GOisOwp
 KypHrL0kgWpfKYbBisQWOik8AMe+lQ1CJXz4ySTSANb3AncNK105gI5c6njCcCq4jDG5
 VrNcZ/cPQy1FxDz+DTj1BsWT4Tzka8zbuGgYagx1AnAPmKU7n8BlIj/Bon59fK1xsXn6
 woaNzu1Xyu7036BfBr+pf74x/+KR6D1BHKcybE6uJhSb7b73mPdmQo/IddeIH0IioNIb
 6C/rIEEBSwsX5gleJmnXXQYnWVQ2/gzQjScUWfA47viys18wDUqTliz12f64Gbhn/9il
 CtQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bJygA0uU
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo: ensure host/target
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
 package/pkg-cargo.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index f7e3f39503..439d443b0d 100644
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
@@ -51,7 +56,8 @@ PKG_CARGO_ENV = \
 # and should be removed when fixed upstream
 #
 ifeq ($(NORMALIZED_ARCH),arm)
-	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
+	PKG_CARGO_ENV += \
+		CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
 endif
 
 HOST_PKG_CARGO_ENV = \
@@ -128,7 +134,6 @@ else # ifeq ($(4),target)
 define $(2)_BUILD_CMDS
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

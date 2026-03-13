Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03732107BCC6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 16:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D6EE60BE1;
	Fri, 13 Mar 2026 16:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wln0mD0dwxXA; Fri, 13 Mar 2026 16:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B22160BE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773418748;
	bh=Qj90HzGBmGeKTf9dQJddzgsDj3W6/hbH6SjRRAGFoN4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hGpGijVYXV1U1NLzIW69Z9nrlNRq/AuoXBRu13sIbH4QmyChFIS8fB8b9j9z1Q1TF
	 DBQOtCU+bcNJhdCIzq1uJKdHmkrx+URJdiFsw/wRbv6nUa2WQddFGLD4g8fWfA4Ws3
	 9x9cBqzZHe3gY5I3fw1bufWeGQtW/ZdJ8S5A5UHCn4RADRbH0p8fISa6UxaPv1oMrO
	 I4jmD71llPYMD1LSOdSsKyc8fdfNVvBny7PEjEnr2c2OgX3DaXOZ6oXKh5pUkYw+jI
	 ezEtqQL6LnMIDu6Uc4XkHTSdlXXp9wxcWHyxgycWx+W+pB4fgrjzHUTwrWTYVJ0GVm
	 SmHx8CtzMS0/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B22160BE4;
	Fri, 13 Mar 2026 16:19:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 818C5786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 676AC60BE4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AsBscJcO7Le for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 16:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66DE460BE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66DE460BE1
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66DE460BE1
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:19:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4852ff06541so24775535e9.2
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 09:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773418742; x=1774023542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6AL/kvKO0tWzzOZkJ/sVdtc0ptzIH+60LxKRtCkOMCA=;
 b=YDIJ5cdOvU3HuAiAre7sn2tFoTeTjWuSzP+aZCtpcQ3JUvllu64xgvWuDHwZ9CjDJc
 S8Iz00Fw5c5QoLXOGAWK2kcoccydqNVfEQif9GZ80ED2AqlCxTrLrpYcAzcu2K2d+huX
 EGHSrXcGJ4vknibntPfHGhl/ju17wTVyofUnMNsCjN/ls+KNkMg3IdWqaYA/Fa7cAU8y
 cvWpUes9WlP6VXMQK8e4UTuKwY0KA3AfQ95aR5IVY3+map0GVBUR9/T/uKBIHYHpAhrN
 jUKpLIk87Lgg9F+Bx6XdLB3NovyIczWvqH4YeJNoTIUXfggz9zy9b09d+jVKtX8M2nfi
 vW2A==
X-Gm-Message-State: AOJu0YxFb/MKNGWWcCqHZiWkSMNolQJKU7K5C87AVC/CNR67P9gew4Xt
 mziehtZl3/5GfyuPBaW/PYc2/hDlTPSWh7bwHpedIdsEl1J99YScVGmEstG0QojJWEB+/NVSp3N
 KRYQ5
X-Gm-Gg: ATEYQzzArZwTzwTH3liVpiacQaSmJ2DMG7rz5cAzxjFVWEzKRFEQ6INhb6T9y8oLR6r
 AknpGLAf+OHbqJ+OSgjOlZ3fSHVoR/j8xJC2b3pVbKOsY2PlHtujfyrgR/jm1i8vJuK+crxv9hO
 bDBSuzkIWvQuXxcR2o4LMLti0guiIoz9NYRuZ3V05NpOL5vsZ19x22RQRNa8pSeOEFqe2L1Bceb
 SnEEPTaflbxwPJIoKXRJHAH6a3N2+hjYUCvWzgGee/RtkRVuizysiqMfixlK0gRGaqjNmCy+qLD
 i9W7ugMMh7tBu9B3PU4MpXfHMrOzlaI4L4XE+12V0udRJju7QCjH3A/4sSUQB1DGi0I5HTnFyK/
 3XkovgVfLbTFuoqbkReEf8eanC3QiUxKvMtQNDT0roVIRLMi4coepW9mL4r/aH5IJPTLEA0Ddu4
 8jncUuE9GnsIp6Xkr2lUSDfMaN7YfK3XME9yATtcFapEnOsGAHcwefKIS3bCSOvGO6sUJ5H+EOU
 ih1uxDmLWft2cLyRIQbI6RLqnKjAGWp
X-Received: by 2002:a05:600c:c162:b0:485:3fd1:992c with SMTP id
 5b1f17b1804b1-485566d2fe7mr59333385e9.1.1773418742556; 
 Fri, 13 Mar 2026 09:19:02 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5f6bb4sm215503345e9.4.2026.03.13.09.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:19:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 13 Mar 2026 17:18:20 +0100
Message-ID: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773418742; x=1774023542; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6AL/kvKO0tWzzOZkJ/sVdtc0ptzIH+60LxKRtCkOMCA=;
 b=e01IylbmOHQNZiBdeRpX0srLIG0Yhi8E02KUQpGP6kKXubWtm6oApKPE25MCJmClWQ
 e1GzAekjjE91enLrDfphqB73yxmnlXKnTgSyBxNsb9hH4pszykq2sEUfQ5b+B2clEst4
 QhHkQt5PW11FGBvS8clfOHP8bi5lvu276tH1s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=e01Iylbm
Subject: [Buildroot] [PATCH v2 1/6] package/rust-bin: add
 HOST_RUST_BIN_STD_TARBALLS
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add HOST_RUST_BIN_STD_TARBALLS to separate tarballs and be able to add
other tarballs to extra-downloads.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
If I understood well, Thomas suggested using HOST_RUST_BIN_STD_TARBALLS = instead of +=,
In this case we kept += as a precaution because the assignment is inside a
conditional block. Using += ensures that we are appending to the variable rather
than risk overwriting it.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/rust-bin/rust-bin.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 215bd84ad3..37df1db566 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -16,14 +16,15 @@ HOST_RUST_BIN_PROVIDES = host-rustc
 HOST_RUST_BIN_SOURCE = rust-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 
 ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
-HOST_RUST_BIN_EXTRA_DOWNLOADS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
+HOST_RUST_BIN_STD_TARBALLS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
 endif
 
+HOST_RUST_BIN_EXTRA_DOWNLOADS += $(HOST_RUST_BIN_SOURCE_TARBALL)
 HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUSTC_HOST_NAME)
 
 define HOST_RUST_BIN_LIBSTD_EXTRACT
 	mkdir -p $(@D)/std
-	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
+	$(foreach f,$(HOST_RUST_BIN_STD_TARBALLS), \
 		$(call suitable-extractor,$(f)) $(HOST_RUST_BIN_DL_DIR)/$(f) | \
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
 	)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

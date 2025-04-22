Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C221C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 14:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5906081EC8;
	Tue, 22 Apr 2025 14:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7s-zDo5i2Zi; Tue, 22 Apr 2025 14:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DF7A81ECA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF7A81ECA;
	Tue, 22 Apr 2025 14:56:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F7D068
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75FC46078F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jq5sQaT9-LVz for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 14:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D99460680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D99460680
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D99460680
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:56:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso3065073f8f.1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745333782; x=1745938582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RRbpWtehrnKg4ukn+xKoNjaiBYX0cCHe9i4dyT46J44=;
 b=iGvY01ULJzlCTOgD/KnSbrok6XMavcBRpU+/VKn1QLm8EcfWFze3tgnfWsVHCUkTnB
 7PYA2TSp4DU7Lo9KneEGYXCBcaSKlyqk/Dw6Xa+eznBPfUFEaIgmdPyqx8KhohoYnoWD
 e9zdJZtOYplqD8jCrDta3a7DUAXbL+IQZcUhJAdey7JMW7rQnDDgAFLJVaZd59C9+6Kc
 jr8m9ZXrM60MNt7hMWPg5tOKwE//q1f42lvzburt7rxbkMJaS/j/UaKa1OaZ2aT9rrlk
 jJ+TKGNNQ1dgImU3ilZz66erx5pRYeRPYgZsLpJLpeSmd2UeSvbkyhd9J4od7eJzPrOC
 vG7A==
X-Gm-Message-State: AOJu0YxH+J6B2qeTu9ZNEg6TjZ15gBnEi0IHN/Bvy1xzq9RnXAp/RcAX
 EPd3qfHgygwItrwU6/ivTYeSWV13N9Si9EZ8Hw0pTOqP/NvLT/Ni3gTjLh275TF3FKqVBdMfnF5
 /thE=
X-Gm-Gg: ASbGnct0eKu9TJyeERn1Of/3VH66QDrlS7WzAxfHUo1xAJJ19k/QV380stmF+JNqMph
 4EpIj7BzMtNj2SHOucHyNk8sMDcD9s16ElSAp/ZDLCgK0KhERyCDVEo+pFJeHD2OqoK1ySm4xJc
 MNC975T0EgjN29cAOcgIbuSmTY3g+XghfFIlbws1eNlhXJ1uDGfUiLY3rRsGVQEVfyPtC433X17
 H67XSv7sLJZA/yzUHTebRMmSP707LyBNzPyo2mP0B5/5K1F1ogcu9EHTaeXGuaV3LRI8VVYRJ+7
 Qzvj3TfOt+feVa5Z+UxZMCQSb6A9FKPszfQF6QSUs3g3JCANugFCJYN4qcEbI7J0j3P3s/l4BgM
 oGAIC91ZJeOyWtRYG+wc3vLbVURKA3QoiP30=
X-Google-Smtp-Source: AGHT+IFV9k7hj0gH47dl+V9siri+6kZl2jBzaSyMUvtT5eIB5oxTikNJG3TNshF1nVyRL6t7XOYPRg==
X-Received: by 2002:a5d:47ad:0:b0:38d:de45:bf98 with SMTP id
 ffacd0b85a97d-39efba2e4f3mr13559789f8f.8.1745333782155; 
 Tue, 22 Apr 2025 07:56:22 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5acddfsm177352025e9.15.2025.04.22.07.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 07:56:21 -0700 (PDT)
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Tue, 22 Apr 2025 16:55:53 +0200
Message-ID: <20250422145553.1278313-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422145553.1278313-1-elmehdi.younes@smile.fr>
References: <20250422145553.1278313-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745333782; x=1745938582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RRbpWtehrnKg4ukn+xKoNjaiBYX0cCHe9i4dyT46J44=;
 b=2gSbUaRh+YEai9bv409O6VSCX8WStdEMMOcLs7ofDtwGT+aWMs7UM74Lwlp6+x3sRN
 ANfbQ3FKOMGNLBaS/q07BwwGnkBg0Oi4RqzCGr/tyQS63H6SCe6YZct6926zK80+yhSa
 Bhtvxlo19XnoVdFsCSpTuKWQzaMojhZdidGac=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=2gSbUaRh
Subject: [Buildroot] [PATCH 2/2] package/dust: bump to version 1.1.2
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

Release:
https://github.com/bootandy/dust/releases/tag/v1.1.2

Note: version 0.9.0 of dust fails to build when running
the runtime test on the armv7 architecture due to an
unconditional import of Atomicu64.

	error:

Compiling config-file v0.2.3
error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
 --> src/progress.rs:6:18
  |
6 |         atomic::{AtomicU64, AtomicU8, AtomicUsize, Ordering},
  |                  ^^^^^^^^^
  |                  |
  |                  no `AtomicU64` in `sync::atomic`
  |                  help: a similar name exists in the module: `AtomicU32`

For more information about this error, try `rustc --explain E0432`.
error: could not compile `du-dust` (bin "dust") due to 1 previous error

This issue was discovered while writing a runtime test
for dust. upgrading to version 1.1.2 resolves the issue.

More details available in the following issue:
https://github.com/bootandy/dust/issues/423

For now, we bump to the latest compatible version
which builds and runs correctly. We can't bump to the latest
version 1.2.0 since it requires a cargo version newer than
1.82.0.

	error:
--  The package requires the Cargo feature called `edition2024`, but that feature is not stabilized in this version of Cargo (1.82.0 (8f40fc59f 2024-08-21)).
  Consider trying a newer version of Cargo (this may require the nightly release).

The upgrade to 1.2.0 will be considered once the patch for
Rust 1.86.0 is accepted.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/dust/dust.hash | 2 +-
 package/dust/dust.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index 975ec9664d..be80a84166 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ace29e85647e7079f9eaa066da9b1368c7200233eb0814442499948b5adeb028  dust-0.9.0-cargo2.tar.gz
+sha256  01f4796a27e916e7fab77fbf12685da9fb1422dd3dcfdf736a146ad05ebc3c39  dust-1.1.2-cargo2.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/dust/dust.mk b/package/dust/dust.mk
index c566723c1c..a6b6f43c40 100644
--- a/package/dust/dust.mk
+++ b/package/dust/dust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUST_VERSION = 0.9.0
+DUST_VERSION = 1.1.2
 DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION))
 DUST_LICENSE = APACHE-2.0
 DUST_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

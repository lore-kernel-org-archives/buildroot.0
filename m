Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA10C3601E
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 05:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A60607CC;
	Mon, 14 Apr 2025 05:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9jx-HLEyQLM; Mon, 14 Apr 2025 05:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BA7F60AE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BA7F60AE4;
	Mon, 14 Apr 2025 05:33:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC58250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 05:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D30460B93
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 05:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJDrZlN3nrRA for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 05:33:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D6E760AE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D6E760AE4
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D6E760AE4
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 05:33:11 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so657260466b.0
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 22:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744608789; x=1745213589;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=odZvYpqaCViIDu8snxpvpoQHIHfMUckJoNNrU45Szqw=;
 b=GeTFGZYWr64rpjK2XD9qz15CI2NJ9oVS4dfDCRYTbOF5OW8FQnHsOG7i+eokQnJwip
 D4HssSxVb58ORGUES79sknTbJ8ud+tbSXtFkTZA7Zbp15g9c9Jp9sPUrBf4wzMNsr6R0
 /ejSIDieVHP0lUiYpRQsADmOKlRassJk9hc4ByN7oSXlRjCvAinH2KUggC1O9ZEUqu7W
 u0h8dmgFyr83mLPCR3JAYtQJSShmJQ81zxtnFmGBQsp260UWzwU9C3bNIXUd06YDAh7c
 VjKbjpCcSPgxwOg6XSnZo5zfxN9FiLvX0W2U+PIPFcLv7Gy3DnCKJM2lcRPErUaQwSAv
 lBOA==
X-Gm-Message-State: AOJu0YxtrItvZEyY2eskNgzIECw9n7DPJNET5AmlrS/6dDUrScvDSZta
 kE8uWbjm2PkJtTAOTdTgDWl9HCLC9f/vEBlTe5KXOaG31eVIv8wqtQe8Lg==
X-Gm-Gg: ASbGnctjJDtF0PDiGeAq/OPSPqMh+FA6i14A36dN4bYzyIgN1/hyGNkZOqR9ilpY4sO
 lBhvbPx7WmfJRs83VSnx7C2WOXEDHiy5hd3hFfO169J7Sdnrh8IWbAXFBHuJ388ZabV1E/57Uox
 uZiBkc4oloFgyZEO4pZlCMQlx81YSZX5iXK9Au0GjQeY4VrnsTWuMfz+RnDQ3h1fX4aAL+aWnEl
 2qfG7vC/aDdO7FVkcyTlaWZcDl6Jf77JfVKCmH+/V1b4kTktnKy1dU6KVoR73ywAjAm2pGwmOxD
 tUTKJ2W2vvup8kcPuDP9/1VBXgTRQviBqhZ8Vve6rT/q72zcKsh7zmWT20RsP3DFROP+8gk=
X-Google-Smtp-Source: AGHT+IGLZ95IEkfnCgLI03m01NlT256G+jlSvy9c9RP1770yamC05oqx0MFRWpZOJKAfkIjAZZlsMw==
X-Received: by 2002:a17:907:9715:b0:ac7:c79d:f8ce with SMTP id
 a640c23a62f3a-acad36d7acbmr859226566b.57.1744608789135; 
 Sun, 13 Apr 2025 22:33:09 -0700 (PDT)
Received: from gimli.. (ip-185-104-137-45.ptr.icomera.net. [185.104.137.45])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccd1ebsm855213266b.140.2025.04.13.22.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 22:33:08 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 14 Apr 2025 07:32:58 +0200
Message-ID: <20250414053258.465718-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744608789; x=1745213589; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=odZvYpqaCViIDu8snxpvpoQHIHfMUckJoNNrU45Szqw=;
 b=QvcmibkKsWE3qXjc9Ma68Qml4VxkE7LNfKR+X3yxH8taoo1+1Q/VtWHmU2U68lxfU8
 W2UzXmB+gYbKv3hWnjefagomcfceN75dAFqQBdqriF7aTMuY387r6ip9IMzUDaIHRp88
 5VlaTh6bXmL4MX98Krz7OF8woMaPjodEqUvOIbPSZ7sHTdPeJmXbwEULO8m2c3ztawoh
 L6UhnMLfwL2vJ9yzbSQP73y5HK8E82D+Kbax9m5vFePoVPC7MJxWgsSoVf2Ed9azxx6P
 sXg24jrLLwlQZzmOBjQNs+r1MvPosJGHho0LrcTz6HXWmGnPSFMdC1gng7hJEZVGOpTx
 jbWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QvcmibkK
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.7.2
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

From https://github.com/troglobit/sysklogd/releases/tag/v2.7.2

 - logger: improved error handling for invalid arguments to -p and -o
 - Fix regression in v2.7.1,  allow '.' in tag names, eg. in.tftpd
 - Fix various typos in the documentation

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 4 ++--
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 645bc6a0ae..c74d7f9ba6 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,4 +1,4 @@
-# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.1
-sha256  69944b2227647bf47ee01c9f482d19a79dbf2b53b8ce8ded0486b08db8c68c40  sysklogd-2.7.1.tar.gz
+# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.2
+sha256  bc410ca64551a11fac6518b418fb6b8afbd888a70af2c5eb353334a706727bca  sysklogd-2.7.2.tar.gz
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index a3e27fd17b..baafc38083 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.7.1
+SYSKLOGD_VERSION = 2.7.2
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

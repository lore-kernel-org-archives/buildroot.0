Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535CDC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18809427D3;
	Fri,  7 Jun 2024 17:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlpYFsVn4JWZ; Fri,  7 Jun 2024 17:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 865EC42850
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 865EC42850;
	Fri,  7 Jun 2024 17:06:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2D91BF95D
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 729CF61562
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIJnRciAgd5O for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8FB06152F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8FB06152F
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8FB06152F
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso586371e87.3
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779968; x=1718384768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aW0KPdXqg31QOR1NgVyCotG7b7qyuH9mpNJstlewNSI=;
 b=f8WCG6OrU+0IjT8jvpPlFIPa9eRxOFoxGSE7/stm1MuTWNHHsIkRwToBXjVG8/ofxs
 UlkSLc3Z0CSDxB2KioEDwPSOwxrB2fHPiyqBEHyh8uS6QQ5j8tJjl2kVGUmGscp8HcPt
 gO5uXSfNzLLYjN8nMe1k1RKoOQk9HikRkxwTo74LU7eeuBL9E95LEjYWan9/D5ccsuf3
 uQ2ypOwT5WOpfHbpLhX2dePJ7DH/W31AyfMkeFcUm1FFl3bk67TVLXxqk6w3djVY5pkN
 uA0NXw11Ump+gWOzT18Bxjo/yV95vowW6dVhPnaDv/GSA6n+r5ag2VeeCj1UHX6QM5N3
 ZQxg==
X-Gm-Message-State: AOJu0YwX5jCAF26Fn2MgVUfetwtCyJzoQfd2CSkfcRFmbQkhuKVI3xTd
 7WTj1hZXI1jezQxxqGV8MXJZ/fPkUPF8qIQCTL3+EL6aU3lPSjPGQ9k2tw==
X-Google-Smtp-Source: AGHT+IGqYu4rsv0HzBok5NeIbSPj0WrP064WSiE+Syn4Wbf1cmCJYQV/sjgM9U69VwKM5+0isz3I5Q==
X-Received: by 2002:a05:6512:68a:b0:52a:4217:d6e1 with SMTP id
 2adb3069b0e04-52bb9f5e45amr2897733e87.4.1717779968274; 
 Fri, 07 Jun 2024 10:06:08 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:08 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:54 +0200
Message-ID: <ba9acd94a239b084dcb03ccbd76e0ffd93d06042.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779968; x=1718384768; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aW0KPdXqg31QOR1NgVyCotG7b7qyuH9mpNJstlewNSI=;
 b=NCPfu8N5QALQ7dcjl1AsOdIeox5MpC5K9nVylg7G+1ApF2ogw3amFHPCD0SKpZtdr8
 J1WuARWTI9rT7BAdv7uQHoVdOzx3n6CCNJ9feqwcotcwFXR/D69yoyPiVhrwTZIs2exZ
 zHfCQvrHSg7yG8iKGBd1J99lOrkaNGHrB3FZYsBXQXiYPh69UeHfQM5W1hsDpogC7yYt
 SQvXicWXrPJXGbRciItGiHXeZzxzl+gbrH7lZoq4Tiuk3eoLkuoXSd/jqvTsG4VQe+VF
 JwCRExqxbTxekaQcgRrKckZeT7uWrl2pOFI98pMjzrPOnYWaZGj8vyZbyJNNfh35Q2MU
 vbkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NCPfu8N5
Subject: [Buildroot] [PATCH 13/20 v2] support/download: no longer support
 BR_CARGO_MANIFEST_PATH in cargo post-process
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/cargo-post-process | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index a9fbced466..12198051a4 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -5,7 +5,12 @@ set -e
 # shellcheck source=helpers source-path=SCRIPTDIR
 . "${0%/*}/helpers"
 
-manifest="${BR_CARGO_MANIFEST_PATH-Cargo.toml}"
+if [ "${BR_CARGO_MANIFEST_PATH}" ]; then
+    printf 'Setting BR_CARGO_MANIFEST_PATH is no longer supported; use post-process options.\n' >&2
+    exit 1
+fi
+
+manifest=Cargo.toml
 while getopts "n:o:m:" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E0EC021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 07:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6236C81329;
	Tue, 18 Feb 2025 07:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zm7EsaYPBf6Q; Tue, 18 Feb 2025 07:57:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D66E82168
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D66E82168;
	Tue, 18 Feb 2025 07:57:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C1E8968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EFD360F8F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnqSvJTBJHNX for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 07:57:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29D4B60F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29D4B60F8C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29D4B60F8C
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:41 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4398e839cd4so5819675e9.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 23:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739865459; x=1740470259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nJQlSrfOI42AJCnwCsfFy7cyiD29KlEGmbPNt4ZEhow=;
 b=D8OFLZnT/ulw8hLMV9aTxNfD1BlP/ZkLa/vRIIUc3OfeMwelQVT7HWJocaiHL5jTan
 hdbKiz2EGIMqk3w+jpEL/HmCdSyqxCHicyiBv54ZqCez0o+gYa5HMHGqHUcmeTXzssCE
 V00NATxs13K92cu4dvMBPV/oHQ/kXT6XQZ/TaaxiYTSlul6DjZ1Y8vMbEnDKj5pdP/aW
 DoK4A92+YKXBnFIv8odnOuTNI9L4KaVowUW93G+KrSQMn+tH4iBaaAancIuHwgfCGvlm
 MkNYglkZACfsCLuvcsqueLgZHiHUbPryJbfj7/JglmQVjFWW6rWxR63APH0So/eaWxOT
 8G9g==
X-Gm-Message-State: AOJu0Yz2yvHxb1NVR3S7L/+EAU9TRXX88UeRdwnbe6VUDHmRnzPIlGYF
 G29OucW4rzSeJIYPwNoLT4pqRy9dwVuXxkxlJqFN1ygzp2+n7BqBPiUL9g==
X-Gm-Gg: ASbGnctAl7uiGEOpVpwD8eE9VMjK9aO/NnwFUbbSEep3okTlU8h4kz4tRb6E2OoxTcw
 Q7YcDcevhIC5eNLZxpwYeHxiVfYC3MsiB+KmMG57lJmCxBtzmuhrWq9Vx5UbocSsYyIoamOGnVZ
 PBuB05lTFgXQUzF8HD5Gy2r28C4WmCp1X6c2RbMKfWLjIleWHfhKRM3L3B6IQCTMoKdp8FS4aQG
 EJZgZwm7McuRTHHlLnY2QHcLpOcW7bKFpA3QUeNVfwdjw4g0uJPDrkDIAq9tG1euCCB/RedHtcm
 nSkyKpncLS3j5x8QWNJ3VFy4Mw==
X-Google-Smtp-Source: AGHT+IHmkLyjFKTZ6vGcXx1CPrvVkmHlI90iMbyZFNzafNBtohNmNiYJBIf65O34bdngcbwX7huMXA==
X-Received: by 2002:a05:600c:154e:b0:439:968b:6669 with SMTP id
 5b1f17b1804b1-439968b7397mr5292305e9.1.1739865458732; 
 Mon, 17 Feb 2025 23:57:38 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm173722215e9.36.2025.02.17.23.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 23:57:38 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 08:57:36 +0100
Message-ID: <c9b0f5c65fdced84996503e30eaf7350e0e46566.1739865449.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739865449.git.yann.morin.1998@free.fr>
References: <cover.1739865449.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739865459; x=1740470259; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nJQlSrfOI42AJCnwCsfFy7cyiD29KlEGmbPNt4ZEhow=;
 b=bqYbWXnCP4cyZ22EPcAxksNZ91yNp6ZcS2eWVcebd1UxrXgLoBwRHOaIO27IGM2NJy
 /5rtePhPxMzrv17Hp9s/c6xI7PvHvJ8JI+bKmuUjphtOqqajb+yYZNYhSUG11Hia+C3J
 Zfn0aOaKiGPG2ru4g58HU9D9vqHLbC5q3/mPi5BDEl2aXNE5gudExMl/aPMuTXomfREr
 f5f4lIDu41tUuz5baGspZBeXqErjDpXMuS9LKUUIRsjqViNzloYpgjF5VAw5MkSssIhS
 klZGa8VGBXKGhqIezBXeL46GV6K0XVJNtKcrdLzVcydDsVD1x5lnLUqHkx7VOAe7AfTF
 vmAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bqYbWXnC
Subject: [Buildroot] [PATCH 1/3] utils/brnmake: drop use of unbuffer
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When it was introduced in afdb545b2847 (tools: new tool to filter the
output of make), brmake made use of unbuffer, so as to try and ensure
that no output would get lost between make printing it, and the logger
loop time-stamping it and storing it in the logfile, in case the user
would interrup the build (SIGINT, ^C)

However, unbuffer is missing in our reference build image (we could have
added it, but we missed the occasion to do so every time we updated the
reference build image.

Furthermore, the rationale for using unbuffer, although reasonable, is
not so practical: indeed, when the user hits Crtl-C, this is inherently
asynchronous, and they can't expect everything to be entirely cleanly
terminated, especially buffering. Using unbuffer is thus slightly
superfluous.

Drop use of unbuffer.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/brmake | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/utils/brmake b/utils/brmake
index 4756016a0c..e5437d8f2c 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -5,11 +5,6 @@
 main() {
     local ret start d h m mf
 
-    if ! which unbuffer >/dev/null 2>&1; then
-        printf "you need to install 'unbuffer' (from package expect or expect-dev)\n" >&2
-        exit 1
-    fi
-
     start=${SECONDS}
 
     if [ -n "$BR2_DOCKER" ]; then
@@ -18,7 +13,7 @@ main() {
         docker=()
     fi
 
-    ( exec 2>&1; unbuffer "${docker[@]}" make "${@}"; ) \
+    ( exec 2>&1; "${docker[@]}" make "${@}"; ) \
     > >( while read -r line; do
              printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
          done \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

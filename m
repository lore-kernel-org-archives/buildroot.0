Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27952CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 12:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C6C60BE3;
	Sun, 24 Sep 2023 12:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C6C60BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRa5o6T926-9; Sun, 24 Sep 2023 12:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F030960AC2;
	Sun, 24 Sep 2023 12:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F030960AC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 675D51BF3EC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E12481E41
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E12481E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4AWE-HLuLT2 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 12:23:57 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B70681E33
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 12:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B70681E33
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32179d3c167so4019755f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 05:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695558235; x=1696163035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NUYKt5if09klkENfgLrwETNzVEgzhu1s+AAV7vvbomA=;
 b=Sjlz+JTgyr57UxlQJNxY2wclE8Js8HJhwNjH1jt5r2vBmXdpq8nQM9coc0iGz7n0la
 il3FYvj6gNtfFXD+JD+6uOk6sPHgrARTwFhegBJvKzFLlNuk3RDMCSlQfwNh2RsBsT+Q
 vKCXX/Hqxfv1zdFmFkQKidF5n6BFfvGgmyDdqgAxRZSf9OrASE+EffmH0l2+ehzuTK4z
 /eVKdDe3kmnNXOW1MdUSP1lnPV0RqnFO3PtFMpESkpLNFEGOTH3znkmMb5i6CqkyJOZ6
 VStO0Koi4AYdJrjXz3KLuTsDjsTi5+gQkm+LdQKMa3o+PyjQ4UyzENiqruJ94E4omfbY
 yGTQ==
X-Gm-Message-State: AOJu0YxMuE04gIZhSn0ThBRvqpuhYRNlkLiG/bhaI8t4Yi47HyjZsXk3
 bV3OgvZQfLwLYXL1BKoR9DvUNSMI/Xw=
X-Google-Smtp-Source: AGHT+IHu2fHhjDB2KJ/64Xwxmmz/XT2u50y3dbcrFPETvtRd/ktqzTSenRoqA4YoItC1eC5nHJRTBA==
X-Received: by 2002:adf:ed48:0:b0:31f:afeb:4e7e with SMTP id
 u8-20020adfed48000000b0031fafeb4e7emr4329511wro.37.1695558234758; 
 Sun, 24 Sep 2023 05:23:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c251200b00401e32b25adsm9520444wma.4.2023.09.24.05.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 05:23:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 14:23:51 +0200
Message-Id: <20230924122351.140427-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695558235; x=1696163035; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NUYKt5if09klkENfgLrwETNzVEgzhu1s+AAV7vvbomA=;
 b=bYEF3OYxre1zb7kCRPybtXux9ifhqYgoki+8M4LA4DeCpi9t/GHoeQuSuOAg6JMB45
 5+sMxfNgqw3nhS/5K7DlGhtFKpKSrEArxN8bP5gF8BeJoPj0ip8xATfglyJ8RNWtn7Nd
 oZZUXSRnrnkhEUIiJsipZAEgtxdOr9jSGbQD5/kYTIVu8x6G+Gmae4HIynv3d7+QbKlj
 BX/tYA62oCliNHVpniZK5FcmY5GNFgySV8KR1AvyXp7EEthBwCKFneSWlEkwnSMYe6eT
 vKP+YHserIsoSR83fPbcrKedQsUCcFi3QNu6MlRW1WCTtAlT9lXJ1UOLy+QlP2GCr6lp
 phZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bYEF3OYx
Subject: [Buildroot] [PATCH 1/1] package/pigz: bump to version 2.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of README (update year and version:
https://github.com/madler/pigz/commit/fe4894f57739e3039a2ffc2a2a360d35e19bacbe)

https://zlib.net/pipermail/pigz-announce_zlib.net/2023-August/000018.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pigz/pigz.hash | 4 ++--
 package/pigz/pigz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index 4a149605b3..d09930b62b 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,5 +1,5 @@
 # From http://zlib.net/pigz
-sha256  b4c9e60344a08d5db37ca7ad00a5b2c76ccb9556354b722d56d55ca7e8b1c707  pigz-2.7.tar.gz
+sha256  eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0  pigz-2.8.tar.gz
 
 # Locally calculated
-sha256  67e2b9e30e924724a9d72549a6004ed15a041f51d9ea9ab781e048fa27ae07a2  README
+sha256  328634933a65dbc7f97a0f51df52741dc67f593bbe9eccabc9eedc6934c4983b  README
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index fd48ab463d..e3273c71c1 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGZ_VERSION = 2.7
+PIGZ_VERSION = 2.8
 PIGZ_SITE = http://zlib.net/pigz
 PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

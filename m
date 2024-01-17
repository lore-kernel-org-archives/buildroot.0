Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8701C47DA2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F5134211D;
	Wed, 17 Jan 2024 22:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F5134211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPOoJ6L24_J7; Wed, 17 Jan 2024 22:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDAEE42147;
	Wed, 17 Jan 2024 22:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDAEE42147
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 356451BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E83B4211D
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E83B4211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ax9spUN2PdNb for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:51:05 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0354E42112
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0354E42112
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7ba903342c2so591916039f.3
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531862; x=1706136662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lrnSXZtHh3a4fG1kDG9NE3Y9rkHANAbSpV6UJVL/pks=;
 b=e0zxPXA6s3NEvyjAgbgig9X/VVSifw+1IIhHtEq2rS/Vcakp5ZiS6wmYR4ebj6W6nD
 cv/RsngOTNhziiBIp25PmNLLKNkxvQT3yjCEdDPfPjX0hhydvMva1P5cTHIDzP7K1w0z
 FCqZeo7XsR+uT900JwIM8Kx89xqn0+vJzqWfKSVlsqO5p8X/n1unoDGcoSUuUOKdx0OR
 rogVJkub4T7MQ1VpSZWtAIj0Un4mUh7mc8H+3XZpRW5v81WHEyP5ldEU+7Py6D6m5EXY
 m7T91c8UGnAY2vQcdb7BHCWc8oLwfGAR0StkwBgUFEmLB5JpK1yCMZDkjj+j/rrnt61v
 zV3w==
X-Gm-Message-State: AOJu0YzuFkvDtCtTj/C1YTKjCUYbxEtd24xxuaFwT+m/U0xFv3o3a9Bi
 RI89WXwcaz7MdfOtT7L31bx3UQXG+BLfHfyyEDCXx6j1bl/TsZBHymbL/wR5D3Xs6Dvz+2L4SGj
 L
X-Google-Smtp-Source: AGHT+IGSNlnqQv+3OWyNJIw+SU9F1IETJ4pImkQ+W+BCYvGfoVYIj/MDJCIisATaiD+9K6dbs3gpNg==
X-Received: by 2002:a92:d84e:0:b0:361:953d:42fd with SMTP id
 h14-20020a92d84e000000b00361953d42fdmr27030ilq.92.1705531862632; 
 Wed, 17 Jan 2024 14:51:02 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:51:01 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:44 -0700
Message-ID: <20240117225049.28443-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531862; x=1706136662;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lrnSXZtHh3a4fG1kDG9NE3Y9rkHANAbSpV6UJVL/pks=;
 b=dteAKpOE/NQdBM0Pl6fm435DKc7VIzECiBXP2M7ie3ZKDMZgv5R2IJ4LEGa7qfALMd
 qUAFEvl+qZGIQoGvaZfrFIEoWl2Ltvjq40T6IYOQNwMGCaaomqwAtV/P8eeeqYIJnhAb
 +s+BODXZG4Y97LfLVJvueJXA8x+5YXRy+SPWQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dteAKpOE
Subject: [Buildroot] [PATCH v3 05/10] package/flutter-engine: bump version
 to 3.16.8
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index e972612097..d08274f546 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.16.5
+FLUTTER_ENGINE_VERSION = 3.16.8
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

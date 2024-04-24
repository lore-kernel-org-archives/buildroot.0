Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432AEC07E8E
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 08:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C01D2407DA;
	Wed, 24 Apr 2024 08:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atPAZxfxc_6u; Wed, 24 Apr 2024 08:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC76C4076E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC76C4076E;
	Wed, 24 Apr 2024 08:31:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF451BF47D
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 08:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A1A481F39
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 08:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07DFmc_IcWAL for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 08:31:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F353481F12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F353481F12
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F353481F12
 for <buildroot@busybox.net>; Wed, 24 Apr 2024 08:31:54 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a519e1b0e2dso760314966b.2
 for <buildroot@busybox.net>; Wed, 24 Apr 2024 01:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713947513; x=1714552313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ilM3Onpjq7rEGDBkZPKZWoc5q23IYFtmsb9z3ATzxOM=;
 b=X7RKDcJewOp2ov149+G3UrrvuCxVG6cKkgHJ+y2jbKyZ8hJq5fRaJV4wReiZmiP7NB
 2G2TLNsHOzZFOdkQ3MUtQXjKg8HUcjRruH+Ky1m5aA6W04JwBAYhWW/+DAVCXPTDm9AW
 N2jwJGgObbXGAVHFrMPkRTPIcnB1uZ85vdGhI2FfM/Fieq26pNhZ2h6MFhM4ZmE5Q0zZ
 kv5YQHpfiQuKbLKcoD+uRdpy9aVcpD2xleBlKuBSuBSYeZO+53yP/PDS5fOAZAwJJV61
 wXDXZl8ZGbYro28uLll897pMjH+kC63MZouDkVmfGIPIpodWKFYdKtN8ZxJfiy3d18iY
 OMpA==
X-Gm-Message-State: AOJu0Yw4NuJDPV9G8oaOcAqecMJLWaCvjU35WPANK95FYnfT4UtZboVA
 RK4EYdoJ6x4eXVVhMz/XBkFWlmwijMdOLVbF6nNBExV0BvxsZMSAD5VudGS0G6j7zF/EPIi/WaB
 DtA==
X-Google-Smtp-Source: AGHT+IFIJkSEFT91AzatBo5Olm9JMDbjkjB2y4K3GXLyO59ZH9aHVzarwC5ir/Zi3scnnRFxHHVx8w==
X-Received: by 2002:a17:906:c14c:b0:a58:9a68:6fbc with SMTP id
 dp12-20020a170906c14c00b00a589a686fbcmr464568ejc.46.1713947512720; 
 Wed, 24 Apr 2024 01:31:52 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 lk11-20020a170906cb0b00b00a55b6e7e16fsm3434617ejb.0.2024.04.24.01.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 01:31:52 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Apr 2024 10:31:19 +0200
Message-Id: <20240424083121.2818-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240424083121.2818-1-francois.perrad@gadz.org>
References: <20240424083121.2818-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1713947513; x=1714552313; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilM3Onpjq7rEGDBkZPKZWoc5q23IYFtmsb9z3ATzxOM=;
 b=eAsLJxz7Iw72zB0qUrLSZ2WKZjtpj9pFIKryuAWRBn2U22Zf2m7EQqhTboAIJ58wRf
 gbwzyNP2OXZKOSN2+ItlItvTCnPmsVIU6oKKZWVbfmAgG3FdD85YBTULVYavn1PSAf+6
 lew2oMJ/4wT10f39fFe0tsE/N7uQyeMk+/Eli524YEh5N8H2PbbsOZ6aElKKrSSSyWsZ
 XgxrYktxXaBmCOZVw8/NhDYmwZ7auDDf0+iVwejcaCArOK+EXVd19zWvV8ioz3YUk/QP
 npamUO30bu53dgm6QKY2RzcJsAVq8yo6to2D+D2Wbo4A1MRiRQwaQkSGEt0seNK8aJ9A
 REJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=eAsLJxz7
Subject: [Buildroot] [PATCH 2/4] package/lua-silva: bump to version 0.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPYRIGHT:
    -Copyright (C) 2017-2023 Francois Perrad.
    +Copyright (C) 2017-2024 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-silva/lua-silva.hash | 4 ++--
 package/lua-silva/lua-silva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-silva/lua-silva.hash b/package/lua-silva/lua-silva.hash
index 3ceab6572..aa63d6ef3 100644
--- a/package/lua-silva/lua-silva.hash
+++ b/package/lua-silva/lua-silva.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  fa838ed10b2e2c16f76fff9e47d52cde1f250efd73994865090d85218c2e5368  lua-silva-0.2.0-1.src.rock
-sha256  638206532ac117ec92a04791045e274e6aa55c3d7f408cd2be993a00424c2f96  lua-Silva-0.2.0/COPYRIGHT
+sha256  f06ceb2bfbd73b192459455fb8983c4a4ad6f1b895fe5513651a3308865c389c  lua-silva-0.2.1-1.src.rock
+sha256  e0c12da9671784c2f51e7db81bf98014365da94bfde81de3e88f2addd683c4be  lua-Silva-0.2.1/COPYRIGHT
diff --git a/package/lua-silva/lua-silva.mk b/package/lua-silva/lua-silva.mk
index 809ac3dd2..4cbd53d4c 100644
--- a/package/lua-silva/lua-silva.mk
+++ b/package/lua-silva/lua-silva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_SILVA_VERSION = 0.2.0-1
+LUA_SILVA_VERSION = 0.2.1-1
 LUA_SILVA_NAME_UPSTREAM = lua-Silva
 LUA_SILVA_LICENSE = MIT
 LUA_SILVA_LICENSE_FILES = $(LUA_SILVA_SUBDIR)/COPYRIGHT
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

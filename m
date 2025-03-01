Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6C5C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 15:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B40C60BE7;
	Sat,  1 Mar 2025 15:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nny_h7BQM9ZU; Sat,  1 Mar 2025 15:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1495A607CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1495A607CD;
	Sat,  1 Mar 2025 15:05:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5165181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B97F4408E6
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cwtk5-fDg2ZO for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A726426BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A726426BA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A726426BA
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:47 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-390f69e71c8so602909f8f.0
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 07:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740841545; x=1741446345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tz7jGwe8W4Vzd0bXJuN7Ozou4H0uRv8yz+fXspSdaUI=;
 b=X/WSnREE93/DzAjaeUE2MnM1pLCfzlXB+ufgH5sXcnOjnoTRzhNqudn6C9MfHbiPNR
 JHMeDVfiTBhwlqJJ7sJWIzZXLRcW7KNe88DWomA7eWs9VGvIi3PEIDyvwBZjSZlUeVT/
 rXLhift6S3RoeoCX43kwUK49+EopXJ1UHgny6F9xy3ZW4SjlqcNnXo+p/RzGXsG6C/gw
 IBI7K1McyNFSv+xTjc90Ge6Fn15aQ+r2zst3IHGUn2BCqKwRgMCkgJ6muIzC9MZbTmAj
 wqNms3JeevEslOM1AEY2yJE3pHOxvxuXn939Ee1vqZ7N9Hs9aoFIYv+1kjrPv5TYiILH
 kC1g==
X-Gm-Message-State: AOJu0Yy7Z3Ihqfcu9D/4rF5sPksetKAaZ9St73Ty0Ukg9UWf1Bb8DhhM
 4IERQRTma/98VxZxbzlcM3ip/4ovFFGWEPijItlYK+atbtv+OPg9r7FwCQ==
X-Gm-Gg: ASbGnctJietLdGxhityiITJz+8yNtuFZLaF58g44SHCZzY7MaOEPD7LzBw0vUXcjrjE
 i2e5/EwOxrQfSPkhJRDpYiNTx/8CBaUsfyrcVfZPFCbz4YpE1kR58Bc9ufCoRLF3/iRoiUFs465
 OGco8UxsIa9VR3IFx3GKdSck2k0zukhHO4cqrKss0eofkfHFVuPeYI1QeOjC+JiRSEb+FY68bIi
 tQZNJCWW4UeRKOWTklxBt4NVbaWUG2CXOwSV2+cGAzFLQbNiU1iiOtXhJof53XMaS+9L4hizgVA
 tIExDH6qbrgxEolPD423Vh6DLHL5ZunspQtSib+DAe5S8Q+ez5zVbHE=
X-Google-Smtp-Source: AGHT+IEe84Hr0xSA4ubgogk7fhybUX1/FR2QzesByploQ7Hc69Z+WCm94DRsjqNyyMl3pPvF5lE6sg==
X-Received: by 2002:a5d:64a1:0:b0:38f:3e0a:ca6a with SMTP id
 ffacd0b85a97d-390e164b56dmr9976315f8f.2.1740841545313; 
 Sat, 01 Mar 2025 07:05:45 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm123806065e9.30.2025.03.01.07.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 07:05:45 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sat,  1 Mar 2025 16:05:37 +0100
Message-ID: <57a570cc2ba3d56346a32f2f6a3e4758ca3b2c3a.1740841539.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740841539.git.yann.morin.1998@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740841545; x=1741446345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tz7jGwe8W4Vzd0bXJuN7Ozou4H0uRv8yz+fXspSdaUI=;
 b=LxIhwL5TP6Y9fe4WHodSxbeo22XWcpLHqLElo2UXf3h0/opPlSXxFwUfHXakOkG2T2
 39TD5UcsXd4PvirCwOWGjuVCQKUGn1zLbuC/QBzJ5MPwtlTNakSpUtrjFa7S5jZKB8lz
 CNTZo0dN6Mmly7OgnEM4UqcnriX42zGZQKxm+MElr/sirAkGl3abdv2EssW3l6CwAvlt
 mGy0OpSoI8rmJbBDqr98ohklfuYtPzJo4ArR0tao411D2vL8I8ih68j0J2iiXtoJExEj
 WNgpPL03w36BAan4Y+PuixPrTAd4KVnpkDDyiCKi3hFoS2dkWkQdJSDpbO+tyl96x0yC
 EP6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LxIhwL5T
Subject: [Buildroot] [PATCH 2/9 v3] package/shadow: install to staging for
 subids
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

When the subids feature is enabled, shadow will install a library and a
header:

    $ sort output/build/shadow-4.16.0/.files-list.txt
    [...]
    shadow,./lib/libsubid.la
    shadow,./lib/libsubid.so
    shadow,./lib/libsubid.so.5
    shadow,./lib/libsubid.so.5.0.0
    [...]
    shadow,./usr/include/shadow/subid.h
    [...]

Install to staging in that case.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/shadow/shadow.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index cea984012d..c598ad88fd 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -46,6 +46,7 @@ SHADOW_CONF_OPTS += --disable-account-tools-setuid
 endif
 
 ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
+SHADOW_INSTALL_STAGING = YES
 SHADOW_CONF_OPTS += --enable-subordinate-ids
 define SHADOW_SUBORDINATE_IDS_PERMISSIONS
 	/usr/bin/newuidmap f 4755 0 0 - - - - -
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

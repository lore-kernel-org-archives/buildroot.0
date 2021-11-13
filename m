Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA13C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:30:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBEA61029
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCBEA61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A18A38174C;
	Sat, 13 Nov 2021 13:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kkr7ux2f-IdD; Sat, 13 Nov 2021 13:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D71A80F52;
	Sat, 13 Nov 2021 13:30:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DACFF1BF95C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7ACF404FE
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76V-MaDvbSut for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A2DA404EB
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id n29so20605035wra.11
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zod0mpLvj3QvA3XyxK7OI09m3dfHMoHSeOKpbjVk7mI=;
 b=h9+xbWliKAbeVbXpwMCgs6sYL98K8Ty5iXECSPeJTh1Lr9b+ijdlLJQcsi5ciQIRf0
 GgYj7akf8fN8WM2uDpKYUJh0+GIvLDS7XFDup9f5lU+egodL3bRbLF38AcIagToVs/Wt
 +FLq2ePWaTBS5LGSbmC9LxH8jUfA6YBUz2RP0azaHwgqTH/4TqMbbHDS3psMQ0QLl3Mw
 wLM6KtQ4TJRn9sjwZXFEXSb9r+U2FdS0+OAQB8LWmLBi/MPDV6o9aGEj0LF7JwsZtk8j
 Pj0SMTZhuk7OiY7JYIbv3qg7kzbEpt/3ySRsc2wzz2YiXkbJ6jRbI1ymXkPn40ujHXYG
 J1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zod0mpLvj3QvA3XyxK7OI09m3dfHMoHSeOKpbjVk7mI=;
 b=lzGXChBEYK0QVzUi62bKzEH1kMbqY6WQJ5GF8B1LhrFjfe3M93rwNjdQhy59TZfs2T
 CrKhHZFLfTNxlg9z0NpaE4+p6/uRSPLTfAptBsbIj8Dx9nfA6/mDpkoWazsMm4POqE6w
 0HWfqBz9RJdktSmF4lL3kEO518wR3MKeMa6BCy5tRr6FWsHj+u2Vx6XD/sBZEMGu/zSB
 TYK1PQGZle9OVOpmVkDTmeH2bYTx7HdhEvCnMX5V96/9Edg2t5cdV59SqLXZBOrxic88
 eNmX3V0B+BtNRZVOzKs62C8NqLykaCTAWmRXnFxHkKM6nBrt/tyAQzUD+nPY+YZaMk/m
 1FOw==
X-Gm-Message-State: AOAM5323jl0Z0LomtbHrdVyVYPacG8LCHmK3CnKfMvsfu4lYXW47Zd+f
 35s7wCIsuzjIZEIGXJuyljDOMUgDxM+m/Q==
X-Google-Smtp-Source: ABdhPJzxYgEEVpbRA5jQ5Xvra5bHTbEdlW6LWbJTIjXx8IxJX4QMxM9Jv5vaxAsvYR9vcOEKmT0MMA==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr17763294wrq.71.1636810113539; 
 Sat, 13 Nov 2021 05:28:33 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:33 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:19 +0100
Message-Id: <4cf753e522f89d1f109a3b1cd7742cb4e18aa743.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 08/16 v2] core/show-info: 'name' only applies to
 packages
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 0cfa1659487f (package/pkg-utils.mk: introduce "name" field in
show-info output) did what it said, but did so in the generic show-info
part, thus it was also added to filesystems (rootfs), the other kind of
entity that show-info reports on.

Only packages have a "name"; filesystems do not. Instead, they already
have an 'image_name'.

Move the 'name' field to the package-related part of show-info.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b2f0b8cebf..973eabe437 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -96,7 +96,6 @@ endef
 # $(1): upper-case package or filesystem name
 define json-info
 	"$($(1)_NAME)": {
-		"name": "$($(1)_RAWNAME)",
 		"type": "$($(1)_TYPE)",
 		$(if $(filter rootfs,$($(1)_TYPE)), \
 			$(call _json-info-fs,$(1)), \
@@ -108,6 +107,7 @@ endef
 # _json-info-pkg, _json-info-pkg-details, _json-info-fs: private helpers
 # for json-info, above
 define _json-info-pkg
+	"name": "$($(1)_RAWNAME)",
 	$(if $($(1)_IS_VIRTUAL), \
 		"virtual": true$(comma),
 		"virtual": false$(comma)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

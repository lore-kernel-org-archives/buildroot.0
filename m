Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DCEC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 08:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 792E64046A;
	Sat, 29 Oct 2022 08:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 792E64046A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZseePlsPiw08; Sat, 29 Oct 2022 08:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2AE6401A0;
	Sat, 29 Oct 2022 08:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2AE6401A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA6C91BF348
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C20E981464
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C20E981464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIeYRXllsNBR for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 08:25:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8349C81462
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8349C81462
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 08:25:16 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 5so4412061wmo.1
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 01:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=29msWzWSzqWp9HAcNKGv+VzaH6d8XhP+hzIgKULo1/g=;
 b=V3nmrLfbF1M4fFM7gDzG+YvNnpfvZmMKAL/BOlDcXaNJS/t8pmWSgXIgfE7YL3BRNg
 Cyp7Cp+oxCYPwlqn+p+l6WUEmTKpOqZGNuDIcEVmC30eEbmHpBVL+vE9agfO1HElXiW3
 H5ilxNFzi2/XT3R4BE5IcJUe2kRthuJw9Xb/cDCotxmwQlKlEH7cLaLOHetr/c0pxV0Z
 MbMRtQL+yvEkTbpDEx8IuuzCD2UoiWeZ1BP9/gbHovEQgnT8quMV/ksT/OUDc+oLtFNh
 dBTvFZh9qft1qaR1wOeA4J55w3N17ytzlCs0khbth1eFqvGG9wITwTDaxl9EAHtgjWMB
 RtNg==
X-Gm-Message-State: ACrzQf2giOLzPGcERqbQuuhBia++4jFIl5w1D9H74ExTGWjEm00wy7+X
 aA5NdTHGA0Dr0NPsW43A+cyXVdnxo64=
X-Google-Smtp-Source: AMsMyM4gYckro+lKKjNHOTbN8qCpDfFdKdXSamI47WJMgQbm3DeE3MLIrDXoTuempKCeicIurjb08A==
X-Received: by 2002:a05:600c:4d08:b0:3cf:674a:d3c2 with SMTP id
 u8-20020a05600c4d0800b003cf674ad3c2mr902356wmp.157.1667031914324; 
 Sat, 29 Oct 2022 01:25:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b00236a16c00ffsm908365wri.43.2022.10.29.01.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:25:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 10:25:10 +0200
Message-Id: <20221029082510.61178-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=29msWzWSzqWp9HAcNKGv+VzaH6d8XhP+hzIgKULo1/g=;
 b=Yj3jd/ueUfE00VBsIrIDzFQlDLNxmJ9xtIXnsm2TpvQmu2sWMWhWf+3xESx2RwVK1w
 GHI1S4D3XQ1tL1jzyLaz+ryhuI9mW3uXLNPq8GOmLSXxVYd952AwXdFqtjT39pVQ7lU4
 +MdbVlKQHr7pLbvBUG0v+pw8u/1rAaJhutb8pP2Wer2Cx/OBm/mCDW/aXYXlXnhSGRl4
 ubPH7Hf6r+xD60FTvcwPzVkvswGfHcxupCxR3MSY+1J9ngou8cbZLtcA0k4f059/QBA5
 GamtmizQWV0pEoObyfcs/pcp2p8e6KthUpIY6I703h9sWrzY562cefeccz1jCtfquCbX
 ZYLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Yj3jd/ue
Subject: [Buildroot] [PATCH 1/1] package/pahole: bump to version 1.24
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=v1.24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pahole/pahole.hash | 2 +-
 package/pahole/pahole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
index 8e5560b5e7..5610b252a3 100644
--- a/package/pahole/pahole.hash
+++ b/package/pahole/pahole.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3531396c0568793ef8ca1a2fbb44ef2e1e81bdd55496a4487b83ba4d95df9d99  pahole-73383b3a39afe86b22e098773e47b8546c48a649.tar.gz
+sha256  eeb88a62c3aaa1f4c389117b7e7cc08a49acc8a0e7f165f76dd9c5ab9af2c266  pahole-1.24.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
index 199fa8cc11..82bba2f777 100644
--- a/package/pahole/pahole.mk
+++ b/package/pahole/pahole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHOLE_VERSION = 73383b3a39afe86b22e098773e47b8546c48a649
+PAHOLE_VERSION = 1.24
 PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
 HOST_PAHOLE_DEPENDENCIES = \
 	host-elfutils \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

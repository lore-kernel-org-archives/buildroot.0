Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85549C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 20:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF4664193D;
	Thu,  8 Dec 2022 20:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF4664193D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OzgxOYPW7uY; Thu,  8 Dec 2022 20:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC52D41931;
	Thu,  8 Dec 2022 20:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC52D41931
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91FDA1BF591
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 699AB40465
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 699AB40465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HtsdN5zuJH84 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 20:58:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6545400FE
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6545400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 20:58:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id f18so3166182wrj.5
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 12:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7xKl42ChHoiAbwP/82zqO7dOEYzve38IBSkPSa0cj4E=;
 b=C1tE7BAW0SnCREgzmv1RRSQ9NiTEWMe/LLqfDCBWRsnmet77L/llhhPwnqPOejsIuv
 P15fE83bL0BEKbXLmVB8U/M78Nrpj3aYVej8llHvChXVI7i0vKXqMlVOBwABrrxsAaAL
 PjeekSk+Oc5nvLGuakNOAOy0BYrywgJja0FtvCNTYzDxISmTO9vae5JF9xKBxcppdV8V
 +Q0Xzv2BIlorMfs4hRmh0msDnsS0Fryy1XEFeC/ndKDInf8Xcb6X21Pdqu/ptasSCFdP
 gyokOTW/tHJy4Q1a2l4jyIbUgRyXSOKRhfir6rSaNmrSOdlRWLzdFuyQH5pFU4l0zZBJ
 By9Q==
X-Gm-Message-State: ANoB5pkkxQE6e/rScYYw3P4Uepql8cljSgJGN5cy/R0TsxffX7eGM7+m
 3WGC8nOMi8wvGkoC12CXiqRRFa8NGw8=
X-Google-Smtp-Source: AA0mqf75dobJk3Vb5RmF9xGmLo7/G/1EzKFaB3mq00yupBDhJX0nKtFiW/4s9b2Dx4m0/SwuM9u1cw==
X-Received: by 2002:a5d:470a:0:b0:242:d4f:96c with SMTP id
 y10-20020a5d470a000000b002420d4f096cmr2175213wrq.0.1670533092832; 
 Thu, 08 Dec 2022 12:58:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i2-20020adff302000000b002421a8f4fa6sm22888607wro.92.2022.12.08.12.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:58:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 21:58:07 +0100
Message-Id: <20221208205807.18594-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7xKl42ChHoiAbwP/82zqO7dOEYzve38IBSkPSa0cj4E=;
 b=cIh9o57Evqir8BwRJl0A49dbzU9Wi3opBsGySZl+ByVqWieKd+1ng69tz8GUTxsnnz
 RMk6CObCZxtPzGoqTAhdG/+TfHI+rWh4vRHCtvSQUfowsOsk3rHV7fFtdnTSH/VhsWCV
 cOI16q3j5yn2K5wsE6qIKFW+x1XecpDyhFDdRKAnKEYQ9L/PIW8UZrqs4xnQyT4xuUPh
 DHA1KWpw7st+C/EVBKND1vVYGdyYadV5CmxEDsxkrAHm1pv6hamJdIGYSL2OWReBL9kZ
 kuI6Uu/Iq61khdpvlxm+el9U7dWo7el5oSqHD/SuKs71aqTPFnaB4zvstz7HerkhTByt
 Tk0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cIh9o57E
Subject: [Buildroot] [PATCH 1/1] package/dehydrated: bump to version 0.7.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of LICENSE (update in year:
https://github.com/dehydrated-io/dehydrated/commit/dd0bbd2405ecea4820ad2442120d8dc4a37137b6)

https://github.com/dehydrated-io/dehydrated/releases/tag/v0.7.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dehydrated/dehydrated.hash | 6 +++---
 package/dehydrated/dehydrated.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dehydrated/dehydrated.hash b/package/dehydrated/dehydrated.hash
index 0452645256..711e5a6cea 100644
--- a/package/dehydrated/dehydrated.hash
+++ b/package/dehydrated/dehydrated.hash
@@ -1,6 +1,6 @@
 # Locally computed after verifying
-# https://github.com/dehydrated-io/dehydrated/releases/download/v0.7.0/dehydrated-0.7.0.tar.gz.asc
+# https://github.com/dehydrated-io/dehydrated/releases/download/v0.7.1/dehydrated-0.7.1.tar.gz.asc
 # with key 3C2F2605E078A1E18F4793909C4DBE6CF438F333 from https://keybase.io/lukas2511
-sha256  1c5f12c2e57e64b1762803f82f0f7e767a72e65a6ce68e4d1ec197e61b9dc4f9  dehydrated-0.7.0.tar.gz
+sha256  4d28a0598230b276b316070ce16be7d9ab984f3bdef482acf0bc24fcdcc0d0b0  dehydrated-0.7.1.tar.gz
 # License, locally computed
-sha256  b4583b7dd07e3e2a08906de38e7e329d41f921ed9dcb6310b3886e013a6b8723  LICENSE
+sha256  f25ab9c5f13abf15ab097180423ef6b82a89c552e92d49ae627762ee9c04a3a8  LICENSE
diff --git a/package/dehydrated/dehydrated.mk b/package/dehydrated/dehydrated.mk
index 28fb5a4912..f8909d8abe 100644
--- a/package/dehydrated/dehydrated.mk
+++ b/package/dehydrated/dehydrated.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEHYDRATED_VERSION = 0.7.0
+DEHYDRATED_VERSION = 0.7.1
 DEHYDRATED_SITE = https://github.com/dehydrated-io/dehydrated/releases/download/v$(DEHYDRATED_VERSION)
 
 DEHYDRATED_LICENSE = MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

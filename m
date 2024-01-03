Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCBDC47073
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 17:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D862D828BA;
	Wed,  3 Jan 2024 17:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D862D828BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGjwtyKhwaXb; Wed,  3 Jan 2024 17:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4200C82884;
	Wed,  3 Jan 2024 17:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4200C82884
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFD981BF3A4
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B92C741764
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92C741764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GtB0hjiIw1dn for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 17:41:18 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D33844175D
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 17:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D33844175D
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33687627ad0so9908828f8f.2
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 09:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303675; x=1704908475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R/3HmJSAuYcowIsVRg4Im7x540irtCVlkBlyEwES95I=;
 b=GEOwaoB32RFHfrQ+PBNiL/JLY0UKcwinAvKU/Ndj/F0oKXPaws9Sjl5lgfw51ZbSD0
 Zs298jEvXgo9K/g1OZBRakOVf+8622rerUlzTiGabJuVg6pvF+KbOhnH5sxCv1POHcVR
 8orKZ8ncVFbLpmuWoPzs2Cy7NBGHMaAF9h6uUoz3C5AhL8+6WaDkyyoqWEgY3S6sMwNK
 RrGjdqxtVFjNdMVax8BSnXtbDLSGpJt+wKh6fZdekH58gJMfbhFkQBcU6ABtUhqzS0lq
 B/r2V0ddwQYch0GNiHgRJvauJSFrPDDpZDernGAo17va+78IyOAOiqTNi6ZcmBSDJUU1
 x8Xg==
X-Gm-Message-State: AOJu0Yw480TlFEj0a2s6DvFFLmLB1kcpIewqNNTogEoeAaXs4yKru6Fe
 zJQDNSPEY93ikeDF/zr+7clp75yz42g=
X-Google-Smtp-Source: AGHT+IHwWCXFlR776OMpQFHsiqdGE4VRxH1xGwMvyP3RpQFqd7qDinic4ZX/DY8Tuua7BRSq56FbsA==
X-Received: by 2002:a5d:4f89:0:b0:336:873d:8896 with SMTP id
 d9-20020a5d4f89000000b00336873d8896mr8598770wru.133.1704303675208; 
 Wed, 03 Jan 2024 09:41:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b003373fe3d345sm8003712wrr.65.2024.01.03.09.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:41:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 18:41:10 +0100
Message-ID: <20240103174111.853264-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704303675; x=1704908475; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R/3HmJSAuYcowIsVRg4Im7x540irtCVlkBlyEwES95I=;
 b=enXQjP0SSt8adrS/mayGiVMERx3lMx7v8AMXzGwsJ1OZ6bjiET2VWn5xti4UnYQQ0R
 caPOaS3rgb5U32eI8zmcWgmjsVXpvwCemtEWLToYNN/s7labLn3J4CVNuCN9IiMMJj4J
 8G9UHCGbW1WzDuLUB28u7dUiBCGMowbBbddDKkfAFeR6eAnY02sWU39+FHiyQ4mGNTfd
 5vW0/1gxkDOttXGoA/oonx4EL8qBpUYbSVE8sxMxqK+y98x8kjiEEgXbREOnbYJJIhCr
 XqyKB7CyPgReOsGZyqk+GFIO+bID4nmxlSm1XbBihH6gCgIhy3f0f6NTurEoVWVhC35Y
 yoGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=enXQjP0S
Subject: [Buildroot] [PATCH 1/2] package/valijson: drop unrecognized option
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

Commit d264b6e81e1a03c36df55c66771ed26dd767a522 forgot to drop
valijson_INSTALL_HEADERS option which has been removed with
https://github.com/tristanpenman/valijson/commit/c7d5f2cbec08b0e649fdeee6a99f2f1343baaa75

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/valijson/valijson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 51a9353960..875c913b09 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -11,6 +11,6 @@ VALIJSON_LICENSE_FILES = LICENSE
 VALIJSON_CPE_ID_VENDOR = valijson_project
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
-VALIJSON_CONF_OPTS = -Dvalijson_INSTALL_HEADERS=TRUE -Dvalijson_BUILD_TESTS=FALSE
+VALIJSON_CONF_OPTS = -Dvalijson_BUILD_TESTS=FALSE
 
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

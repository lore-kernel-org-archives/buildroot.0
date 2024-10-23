Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91F0CFA45A
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 17:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8322D6065D;
	Wed, 23 Oct 2024 17:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjRELFegGnHC; Wed, 23 Oct 2024 17:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFEAD606C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFEAD606C2;
	Wed, 23 Oct 2024 17:36:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D20574988
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF5D0606C2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXpYE2NYUAdg for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 17:36:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F26EF6065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F26EF6065D
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F26EF6065D
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:36:38 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-8323b555a6aso413945139f.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 10:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729704998; x=1730309798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CriSrhWK9rTfDSWC+pqvgBTlbEh70c/fZAXYN1tn1s4=;
 b=IQjecFdF6+Ach579Eeuv3tpmAgZ9nvVpuQICWSIicf+4U1WyuddG9grtdyWWoS2c1T
 zO9/HQyhIPe9aDNDXG4jtiVAIWXuw4m7hN7Nq/Zr2x/8+JyacclnYo0CWdpYbuNYx4du
 sbFcdl1dc7EX0kq0UjESVMSR6XvD1sSTZpN4V9o2dhoDjYGn8jt7VQTGNEowEEvSrmI2
 OeMiP564efruHUI6RoDga0YPV1wRfjSCYWUE9n8L378a+4O//0qDAKCNO/BJm4C1gvNL
 oSKEJ8ZmGxFRYyfbjsu8JzhKOrgAlBiP6ZqlFl8hyiIrTVGSwTy5BSd2Dn8CoyUzJ3hQ
 7gvg==
X-Gm-Message-State: AOJu0YxROOwuGpZDgq7lfScwktuWIIkWjbPGvYK0nKZi2B/Ykq3DFSQY
 oxlma59joF8x0x2yvxyaYjspmuh2bxarHzxsypbZyKMzGqFD3x+cX4CDiQ==
X-Google-Smtp-Source: AGHT+IHhfgp7pDZxqqW7S/CvKkiu06Xxy9lINuxwLv39iqNCn9iMt0dKGmLmyIWv6qShixW4IJTUbg==
X-Received: by 2002:a05:6602:14c7:b0:83a:b881:7abe with SMTP id
 ca18e2360f4ac-83af63ebc86mr364044839f.14.1729704997692; 
 Wed, 23 Oct 2024 10:36:37 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a630571sm2212912173.147.2024.10.23.10.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 10:36:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Anisse Astier <anisse@astier.eu>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Date: Wed, 23 Oct 2024 11:36:30 -0600
Message-Id: <20241023173631.3304943-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729704998; x=1730309798; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CriSrhWK9rTfDSWC+pqvgBTlbEh70c/fZAXYN1tn1s4=;
 b=aispmIup+qxepPQjeHBd7VwRj42MPs1BKgyj1MCneHA8oBnmJ0+S5fU8a8GLOdEENJ
 jL+e9GW5S9xKi5B4p5zZ8u1VPb/UQ8Bn+/qFc2AclK8bNTQWCWoLNff/q739S5ipz6rr
 RgyJ5d5V2axQKPLJaXz74kUda0a1AsLcpJNpt3h++WbzG6NnhNfVmHNO8B2iA8s9Hscs
 73HKXOgxqUk3hU6uZcZUQYWGF15NE/FjpJ7DQPC50XVeRmtoMi+j+qRXH8uGjLYdcZvg
 hfeflx9isGK3uEafzURAcLU4xNCiNr6FeRegqTR49zcnCQWOtR5o/r7jRLg98UPl1iSO
 uWmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aispmIup
Subject: [Buildroot] [PATCH 1/2] package/pkg-golang.mk: allow packages to
 override download GOPROXY
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

Some packages like the upcoming netbird package need to set GOPROXY
to get the correct dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-golang.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 8e27602d41..118908a159 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -85,10 +85,12 @@ define $(2)_GEN_GOMOD
 endef
 $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 
+$(2)_DL_GOPROXY ?= direct
+
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY=$$($(2)_DL_GOPROXY) \
 	$$($(2)_GO_ENV)
 
 # Because we append vendored info, we can't rely on the values being empty
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

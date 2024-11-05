Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF14CD31773
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95213405E1;
	Tue,  5 Nov 2024 17:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iEG-1Pgd5Gt; Tue,  5 Nov 2024 17:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72C1A405FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72C1A405FD;
	Tue,  5 Nov 2024 17:59:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D42B1723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEA2040224
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZPWizqqjI3z for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F354440042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F354440042
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F354440042
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:59:45 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-83aad4a05eeso237505839f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730829585; x=1731434385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rk4ecAqg1Ji4QwTK+xzhG4eT10puRmE5I/msoytqytA=;
 b=bUz6P0A5ye55l7wAXgYkdlaRohYaGMt8SM03OZ62jLOpRy7J3Kv+WrKQku4i+em0RW
 3SHjHTM/yRPZLdI9f4xPLHKTDDkryZr07xmrho4Popk1cgmBk62GSgYHdJXUP4aicjkx
 gRoa05S47UL9CzzBR3n2T0ZpXairyWsEyATHcsQww0SKb8cgOx99DEUe2gsPDb5le2mM
 QRN/JDbuQvhss5b6FMlxkC0g+7ZJtBYmRQOZfZha+csYepOOKJY0eUJkLF7vZ/NRoSmf
 DkGMGeffcEQi6qXLrS8bwU4OGQaQs8FDW8pQiBb492o/dSXH4wb++tbWcDJegknpNZPr
 ZWTw==
X-Gm-Message-State: AOJu0YxDwdaEh5VFwy9FyeHBb1J5F+hbtsE82x5DMQf1QQdSGhZEnoEQ
 oUq4+nrOD+dekwFD8BbxGuIyljpvRZY99cS8H8f8VYHdNOSLkev95vbqPQ==
X-Google-Smtp-Source: AGHT+IHSCF64VB6k8KDkCEf6xuswrxwMgbdigms0CLlmXFQINCA2ws/dfqyePNOnJf6luLZLlpAuzA==
X-Received: by 2002:a05:6602:6d10:b0:83a:b98e:9240 with SMTP id
 ca18e2360f4ac-83b5676f807mr2466357239f.10.1730829584699; 
 Tue, 05 Nov 2024 09:59:44 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04887f79sm2476652173.7.2024.11.05.09.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:59:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:59:31 -0700
Message-Id: <20241105175931.1405047-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730829585; x=1731434385; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rk4ecAqg1Ji4QwTK+xzhG4eT10puRmE5I/msoytqytA=;
 b=a74VtXj3tB9wRBENJhQNbiME6gUwvjWRfIz6xr+rPbxOwSqK9hmsgSjpAosyFuBw9w
 SZJCk1dS6aE8syne5bhBASy1KmvGJb5m7lXMZa0EvWU5e4sfm0QFFuyfbknurT2TCnTR
 ut7S1Q4HO+mDIFM/jFcm4fclSx8T9nlrWKpbBzFPTu7BncUlMiw64g1cJ1e9MFNYxreS
 kHeN2xqCK62K/enC4Wxob7MjurDe6oR6GaD6Tr7NksWTzOw13F3rc/2fXC0Bc3USGvZQ
 KQAe/9y30YLViToE64hpvBHXmB69Q5R1JUj1UlnYQ+oTdJYQY4AGLl19wEA1CR/YJ8/4
 OcUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a74VtXj3
Subject: [Buildroot] [PATCH 1/1] package/bmap-tools: use poetry setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bmap-tools/bmap-tools.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index 3455063e21..3c661cb9e2 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -8,9 +8,7 @@ BMAP_TOOLS_VERSION = 3.8.0
 BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
 BMAP_TOOLS_LICENSE = GPL-2.0
 BMAP_TOOLS_LICENSE_FILES = LICENSE
-BMAP_TOOLS_SETUP_TYPE = setuptools
-BMAP_TOOLS_DEPENDENCIES = host-python-poetry-core
-HOST_BMAP_TOOLS_DEPENDENCIES = host-python-poetry-core
+BMAP_TOOLS_SETUP_TYPE = poetry
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

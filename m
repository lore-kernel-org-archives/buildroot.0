Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACC3D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27F06404D7;
	Sun, 28 Dec 2025 21:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQ-iZShxwG6X; Sun, 28 Dec 2025 21:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CD07404DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766957841;
	bh=2/zOZEy14ErQBn7vawXfnzJzxifC5bBocGi4ylCmU84=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/+snu2nt+MO6KZ1Xi0e8DT7Pt4tEo1haN63bwrAndpvK20k+scCV8275SEN2Vzpp
	 XxbStLO0XxMQOmOAp+Sqeu80Pc9MF+IrNBjn8/vc4mbuuCmjan6tm2ioeSL6J/Z4Tl
	 HfJipASm4RJdpQpkgeTu+BQi+CDUu8dqRuIkXRRKfg2RKZnrMr++p8Dbi6jOFu3Y0c
	 pQep/5hMEaEUUw9sDEj+gipmNenUnKxHHnfH4STZh6AtL+c2S34IQBB3+UOCtBkeDk
	 Iukjac6HqEmGTe1jCHNyYb/lJnHdGbEe1cTFTb9H42t4imb1n9IIpXWoIqfOob0fSN
	 wcaEOtYGo4QMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CD07404DC;
	Sun, 28 Dec 2025 21:37:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89DD81E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7014940055
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uK06Q9_82R_c for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91AA8400AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91AA8400AA
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91AA8400AA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:37:17 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-459993ff4fcso1061859b6e.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766957836; x=1767562636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FVODbYz6Fn9WAmfpjOHXYdCXtwTBNCkqbxZH8UbucwU=;
 b=ebecytvCQITAWUwzkxDk4J4ovryBLxsaBje2l5ZS1pIifnduA4OdLPUs8nOCwNGnWf
 HZsECGIxrd+OSLu1wcCmOsvJyONQYNqC3ZaURu0UdaN3jyVbx57PgM+cYZX8OOLUPxOC
 kWEsEEQdpUZ7wCQ3fpu1eJywxDao0H5vfUS9RhCgUt5s+dbpbznbj6IvolLbgCxnz5eb
 K2wjmyGl/D7p7+QUxISs6ij6gyhpb7YfbXlu+qV9j43KD1mlN8inUyMNKLEY0FG15at9
 jxfE6YLh/L4PgyQurBbp3yLPKckXWyARxBH1Zl5kPE72ijDlQWWrRjEAOGCsPqYIeLvF
 sjMQ==
X-Gm-Message-State: AOJu0Yy0n97gZCz3L4+cXc5FExxDGJxbPzTwp/Lqbx6zl5apGdJ4IpbO
 UI3Ltkg9kTzkZF3nkwjNTE5itk42581mQeA9BXROb8ocRRFaaDgFUmRua4CqBvOZktU=
X-Gm-Gg: AY/fxX7ApL632nC8Tt+8SY13CO7/K3EQWtUGMYek/ENPmIqLRjzExvsNzpKD83kfn85
 39y7i88JBv7G+lapc1sq7fPDOlQNNbSQqaZxue7UoAbxnNNzEVyxXzSJgPOGQeYufLuqJB7tEhd
 DfaWUcEJVQfJ2/qXfswG3Xh8S69aZP7BZqT/nohD3avM/a6qWmmTzTHHeBUd5jQnX7qezraA2ru
 DT6+IJ15oxxNZyFCe5Mo+X3urZ+B/F+P4mSdgks9tNZYY/Fsqhnyuhd/PDcv7K2Him4WRymUzzm
 egZ+m8ly97+ssPShzfGi39dR7etb5fbCZRN8jIZmc95eHUjCPMChN/IGw3Jwhj7FToj8frgDUtL
 U8Caq4E6lZjGL/ATiLcnvOaasUl9LRRh2pK/nePUaeQDrdOjtJ0QtgAKDUwBVKnLxbysqV25M/w
 fp1NoRaRCcuWiLyvNlGymyWwj0m/pTHprDUvcQzn1bgSJQMhNMsvAwdLBioZWDUBksEA95D3GLG
 6UofFDkjc019vjy0ykMYRyqHJQWvUPAPHJgMwOUc9O715hIerhgNgM=
X-Google-Smtp-Source: AGHT+IEGDaRVUw0PCwV6ilRaAr+drQhwv8cwkGB5yKT54WluRlyhXl7oj+a7rbJ93PWP8UMExEMIvg==
X-Received: by 2002:a05:6808:5249:b0:44d:8e2c:41c0 with SMTP id
 5614622812f47-457b1fdcbadmr12167745b6e.35.1766957836405; 
 Sun, 28 Dec 2025 13:37:16 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6680358asm20003855a34.30.2025.12.28.13.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 13:37:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 28 Dec 2025 14:37:10 -0700
Message-ID: <20251228213710.2591716-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251228213710.2591716-1-james.hilliard1@gmail.com>
References: <20251228213710.2591716-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766957836; x=1767562636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVODbYz6Fn9WAmfpjOHXYdCXtwTBNCkqbxZH8UbucwU=;
 b=PFCeXNgNVkMUqFJ+QuGC68JCeTwQ6gEbemZsyGQxz0DoVXYmZ8Yf+myHr3RJeb6zOm
 zSouwCzeVyEzjhk0Lo+wy4DhQURbItyPTac9T7nQ0zKVS+37BraaB+6jOO4IJ0EhCuIp
 ZcmjDT3MbedjpMVAn0Zo+5ZN/TBm/Fpx866TytwDjlvPGKdQ0xm2zItD531aZtKTHYu/
 lSaJrEMtWJGtD6DBCprpk5W/pr/4RtLSWrH/JR3eKd9YkquuJ4BzfSzT5PC9dNH3Nh0r
 auYHAppTrQ5m50oBzTLBZRh2iuQkQEOnTmIxIvON4QCpSd4YMj6o4rgQUs8rVWgomNJ3
 /L2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PFCeXNgN
Subject: [Buildroot] [PATCH v6 3/3] package/tailscale: bump to version 1.92.3
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

Fixes:
https://tailscale.com/security-bulletins#ts-2025-008

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v5 -> v6:
  - update tailscale to 1.92.3
Changes v4 -> v5:
  - update tailscale to 1.90.9 fixing security vulnerability
Changes v3 -> v4:
  - update tailscale to 1.90.6
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index e2d600f03e..51f81b65d7 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  tailscale-1.78.1-go2.tar.gz
+sha256  24783770ce8332ea81178c5ae0f1339f0aad80adbaae5a1c53abb3e44fd8b322  tailscale-1.92.3-go2.tar.gz
 sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 86039fd4b1..6bbfa8ac68 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.78.1
+TAILSCALE_VERSION = 1.92.3
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

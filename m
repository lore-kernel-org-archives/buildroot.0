Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D782E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 17:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 909A14037A;
	Mon,  6 Jan 2025 17:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQGi9iVH3xme; Mon,  6 Jan 2025 17:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA53403DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA53403DE;
	Mon,  6 Jan 2025 17:07:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D42EDDB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 17:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4DE2403AA
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 17:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_ElKtJHepcv for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 17:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE20F400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE20F400D2
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE20F400D2
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 17:07:24 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-216426b0865so206426025ad.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 09:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736183244; x=1736788044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=etCLtm4OUWYcYI5YqvYZKxY5iVulWvxa4VQkQ7+Yhyc=;
 b=slwgTJiIte9O0UDCeMibPvh6uX4jVLLNzs6IhvyZLLYjbO4k1+XACMtTO9ZLzSKAmk
 KRa+ME7mzh6IUxAfgpyJ4Jz1ZqWIXbwdkQcvIeaSpfUvBBhhPdNgplCSfhb5DMfXrinx
 KPCrQVttEuBvQTX+BbkFxnH3wtujqVIY1diit+vAs2y0u6I2u26AvqIV6xNi4dhTKz5Z
 3wQOEQDImDDbPyiskVwRgMp+HhPcebhwLmEpb1+EvZcvbk+PgaM0LbCiRL7Pn77BewWh
 U68nOvDgJuObE+Lg6REVmKCAguOKRv1e1EztmFWn53N9I30tKr2h7ZB5+g2SHBMHKc9A
 pCTA==
X-Gm-Message-State: AOJu0Yxusx4vY9VtIF8C92hWHisSgHJPTbSZ2MwuRuipU52u/AgNDoCe
 coDclZcZ7bp4xcsZKiPZ+2T2iQMB32o/OkTfRg7mGYpKenD/9m4I+DJQ+Q==
X-Gm-Gg: ASbGnctd4FF1ORiTXXTm/S3h7LWOJGKTE33Rv73utoEuqzSROhCAp+89b7O2pHTqxrk
 +ylDhj0/8MuCM/ZyA5W/dkRarTUE6hA+aHJhW+lRZZoi8N+MferjArPR73Rge1TSpemBv0+yWqZ
 LDaADgFgMGXyO2tw+kLU3D2LdvbuID6nC7HRLvPLLXPFTPeny9h1+Wh9kUzcYS9gzyyncOq9r/3
 SOXmjyBx3j/bhsW2GguZ9zloFPZSsZSgJ60In0iVPnW6/mTaDtWRh9XfGJ5eSbQdEGGHSlGoqmq
 locYu4H8XCiBfI0wpPS8VvI1brveypqgCGLQFL1z
X-Google-Smtp-Source: AGHT+IGsMAXPKBALsx12vHVauxc/+ifxUeMBzQPD4G5auBomsGddgVxM4U+rGRKxVlCR1OKsPdUlJw==
X-Received: by 2002:a17:902:d2c7:b0:216:5448:22a4 with SMTP id
 d9443c01a7336-219e6e89a6dmr808860435ad.10.1736183243484; 
 Mon, 06 Jan 2025 09:07:23 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f731dsm288425025ad.200.2025.01.06.09.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 09:07:23 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon,  6 Jan 2025 09:07:15 -0800
Message-Id: <20250106170715.176041-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736183244; x=1736788044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=etCLtm4OUWYcYI5YqvYZKxY5iVulWvxa4VQkQ7+Yhyc=;
 b=G5KqUwBwd5jVK2XjdojvRDwyPrcZ0MUPiU4OkQ/cj7l18lnUkZq38R9PbGY9D6uZ5V
 +sKT0IUrMal6u++eFzjRXWCSq5guwZ5xLbgqvTAi5IVXth/iPsiwtCDEUWHZgXYCUZJe
 VNXm01H7cEa2uy7dXUPGa7KWSbC26EaiBooEFldst/fi2btxb64HdFnPTSSdnR0a9DY6
 zauSV8O4nr69cf+7LIWlqWO9LBmkzS4xY+IeMuXP66BK+FDD5K94/4AfarR0+oXGstL7
 fq5gZicHnWPPVG5+cqyBKxp257qWz+OzxqV8AKh1TnE9rmBa1xzfDpg5d1vUoms3zT5O
 c9NA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G5KqUwBw
Subject: [Buildroot] [PATCH 1/1] package/iptables: bump version to 1.8.11
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

Changelog - https://www.netfilter.org/projects/iptables/files/changes-iptables-1.8.11.txt

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/iptables/iptables.hash | 2 +-
 package/iptables/iptables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index be8b0df3d6..727fb709b1 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256  5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c30264f3cc59c9c  iptables-1.8.10.tar.xz
+sha256  d87303d55ef8c92bcad4dd3f978b26d272013642b029425775f5bad1009fe7b2  iptables-1.8.11.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 6712136962..533f56a992 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.8.10
+IPTABLES_VERSION = 1.8.11
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.xz
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

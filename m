Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE1DC54F32
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 12:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B6D740B99;
	Wed, 28 Aug 2024 12:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3436BKRg2xcv; Wed, 28 Aug 2024 12:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDE8040BCC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDE8040BCC;
	Wed, 28 Aug 2024 12:31:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3072E1BF83A
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AE3640B9B
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTL-kW31bag5 for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 12:31:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF6FB400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF6FB400D1
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF6FB400D1
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 12:31:25 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a8713b00219so2963566b.0
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 05:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724848283; x=1725453083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NTx4LVdr0npKoNCTR59aTZhFYCV+NIxrbi544P+so6s=;
 b=pySMjlZvXgWhtlf3aOSY/bD5pBpf4eDnjTzEWnFw6nbO/J8amXfbrO7xTVz08Rr6wM
 4VXUXT2Py94tuqruZeY7Xy7YXx8CZGRunVN/WyUvflT71lZialiXwRll937XIa9ZKewl
 k218Vc2DzFYfYCRGEz7tkAYOkjkaoSbDSVzpk8cwpv7MK0ien46asRreNOjeu8BwMVk9
 YH/kqJQsSJTXtHpuOXqjm3oFcdsr9VJ6c6WobQWHMWqbqs63gEClkRyUdFKXyvJU1Xbz
 wfJROT9lqQBk7AoSl0zIKLk1zWmFtS5qbvtJfY3OFoNWGnawRakcmp+XpJyKk8OAWKiO
 QwrQ==
X-Gm-Message-State: AOJu0Yx7jMvjD9B+FBlTJK2XNFzb3J9bmVsuh+9gNouM9zOpf87xhZoJ
 JWamGafu8b5VJjynVZeOEJjRYrjfHRfH3CHd9ormPMRL8sUfBpMnhC6EtF7owE4EfrByaYVXDjL
 30047zQ==
X-Google-Smtp-Source: AGHT+IET6JXk8t5D2wMJCpfpTatcUIv54+PkBeSz2AIAf+DSagyNijhIwDHNjFzx1acl05y436pnJA==
X-Received: by 2002:a17:907:2d07:b0:a80:91b0:f501 with SMTP id
 a640c23a62f3a-a86a52b5d50mr738257466b.4.1724848282494; 
 Wed, 28 Aug 2024 05:31:22 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a210-041f-3480-f0d0-88f0-0971-2ba5.cable.dynamic.v6.ziggo.nl.
 [2a02:a210:41f:3480:f0d0:88f0:971:2ba5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54a014csm244011066b.90.2024.08.28.05.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 05:31:22 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 14:31:18 +0200
Message-ID: <20240828123118.62315-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828123118.62315-1-adam.duskett@amarulasolutions.com>
References: <20240828123118.62315-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724848283; x=1725453083;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTx4LVdr0npKoNCTR59aTZhFYCV+NIxrbi544P+so6s=;
 b=mknlfohJqQEBGe3J4eiXmwNpNdzC7w+yuXg1wKIibPprLWQriXMmjm7UqxEUsbVxln
 YrSFwMfMAlkG6HuqxeK8CokUTgRcmq1j9yiU1B0Gqry3JMgqXVNkYTyHQqxbVrH5XWBp
 fWR8EI6ZoGVla8twpQH6uJJy+Uk0deJYoKccc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mknlfohJ
Subject: [Buildroot] [PATCH 4/4] package/flutter-packages: bump version to
 b9715b7eac7d97428c4acde94a75dad5a7525668
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index 1fbe601396..439184b889 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  388ec45142ddfab711aa82958c82657b8c2238deb6c131cec94a5a993ba4c760  flutter-packages-8af79fbca12699248e96b50b4705da74396cd6a3.tar.gz
+sha256  41e9093ca51cb11c7eb7237bf17f9f9c0ce263d6d80115a7b63f6d0ae747314e  flutter-packages-b9715b7eac7d97428c4acde94a75dad5a7525668.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 1a1913043b..acbd53c6ab 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 8af79fbca12699248e96b50b4705da74396cd6a3
+FLUTTER_PACKAGES_VERSION = b9715b7eac7d97428c4acde94a75dad5a7525668
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

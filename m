Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45ACC433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:07:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B98B60FE7
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B98B60FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E37C6151C;
	Fri, 12 Nov 2021 19:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YIYSFmYQn68h; Fri, 12 Nov 2021 19:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96DA46154A;
	Fri, 12 Nov 2021 19:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8F891BF31F
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9039826FF
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8P4oLZrnPlE for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 19:07:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9406826E7
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 19:07:02 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u18so17223153wrg.5
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SaMMSg4AhdsIbFxMQIPw7wQWEC5gftLdUdUPNQAnaDI=;
 b=Jiy7zk6ldgs60nXqRNRQZgGVH5Bh2ItG9kBVJHQQ25rrRVsl1LCLRI+gGlswMvUoVR
 QL6qt94bxg88+E1+sY7CiQB4d05/pSFMYG+no5oOwgGbt82wfKb65QVNSZifiERRY3up
 Fq6Cidpo0ZsKnkpuYDMJzv6I72SUvee7KGp0MgAHqqblTWl0CJXBEZb9ajjReuNeRF2o
 5Dt/dPVFOuSONNpsoezXOarOWHsX3T7Y9WSxt9fLSoVIi4H2GWvo1uN3RQXTUfXncMVH
 O3uVFsrZVovvUN6bxxgl8giGNTE/Jw4EDvY/HS1zeL6PBkj9DkfWbVZHOFXGBGzPycS2
 FDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SaMMSg4AhdsIbFxMQIPw7wQWEC5gftLdUdUPNQAnaDI=;
 b=1vR2LPEQY8BLz4X4CnYqUEmEDYOvUtXLbvxPkhJXIE/PfoiJ1qUdms5WzdfJMnHeai
 Mwvqefedy/KhH6nLTSp6WDl6bWn4WCLrU1sWWBS+e2npgGAH2/B13UtaGvj9N+EUb2jD
 smQacFqRF4wkEpF+tICL1LJVq3yS3JEDzhm1BtZNzSyB0uGcD8YJ68LX74ZVLer39mmp
 96YjTndgS/ixnm1llDGWE0TmDNs+GHQjY6JdsXAQpJuUgMjC1ZS7YxkXCg+y3sYaPKcp
 41REpTauOtqv+JY9366y2NiU0N7dzm3gdj52VOMBqJ+TF9eqDwfdaVH8emAvxmqgU88a
 DcAQ==
X-Gm-Message-State: AOAM532hfCnidavj0J8gaflqX6lO5otwXdNhqt68yvm4nWy3A/h2YfA8
 gEC/LvK/bGMdFZXITMuYOcx9LGrgtpY=
X-Google-Smtp-Source: ABdhPJwQUtGGATjgt9lsrpNFUZz3l8AkxN8lWcg/ERvg5buJXaYhmX0/tryrwz4k1vdEqw5L5jvQoA==
X-Received: by 2002:adf:e387:: with SMTP id e7mr21362593wrm.412.1636744019673; 
 Fri, 12 Nov 2021 11:06:59 -0800 (PST)
Received: from atlas.home (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id d15sm9462604wri.50.2021.11.12.11.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 11:06:59 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 20:06:49 +0100
Message-Id: <20211112190650.84234-6-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112190650.84234-1-romain.naour@gmail.com>
References: <20211112190650.84234-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/6] package/luajit: disable 64 bit GC objects
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
Cc: Francois Perrad <fperrad@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Francois Perrad <fperrad@gmail.com>

Luvi uses the cross bytecode generation of host-luajit
the bytecode format has 2 flavors, depending of GC64 option.

Since the commit https://github.com/LuaJIT/LuaJIT/commit/bd00094c3b50e193fb32aad79b7ea8ea6b78ed25
GC64 mode is enable by default on all 64bits platform.

With this patch, luajit and host-luajit are built with the same option,
so the bytecode generated by host-luajit is valid on luajit.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Romain:
  - update commit title
  - add a comment about missing LUAJIT_ENABLE_GC64]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
The luvi test still doesn't works all the time since the output of
"luvi -v" is not reproducible
---
 package/luajit/luajit.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index fbbd8ebc70..89b164c96d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -26,8 +26,10 @@ endif
 # libraries are installed.
 ifeq ($(BR2_ARCH_IS_64),y)
 LUAJIT_HOST_CC = $(HOSTCC)
+# There is no LUAJIT_ENABLE_GC64 option.
 else
 LUAJIT_HOST_CC = $(HOSTCC) -m32
+LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
 endif
 
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

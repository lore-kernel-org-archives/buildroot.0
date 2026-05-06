Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69F2CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F328410BD;
	Wed,  6 May 2026 22:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngNgF7EbWFwa; Wed,  6 May 2026 22:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92F8740B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106876;
	bh=DA/7oPDKka1U+UQ0wFauWiZ9UTMOulr0Q9BbwO7BZz4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fVqge72ZbccxkYmqmrhrpSZqLmvLxpQaQDDUD+2OxJmGFTTxdX8bZjnXKRpG9/rvZ
	 xxQmfyALBVV+baIPARxo+P/ZQQeDe03fQ5DA9EqYyNQZU5uMmqnORpJLs9w/lR1CKe
	 C4+LUpKS0mxct/cNtkDxPZp0fKbGkiP1w4AlFOKu8qT6nk/mfWP3oDU8eswCYL4bcs
	 vKkLpE8RkJAbKRTeFfzKiYtIa1f78PmpoV151z595bRqFpscs2tNda/uMbmKtojn6J
	 NExDps0i64f0TbZBEvOtI7G7SjHdosgweXhBtG+zkxpQPzBr4SGulMlTHrhY4tDLu1
	 UqHK+CQCzKvCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92F8740B70;
	Wed,  6 May 2026 22:34:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF2AA377
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D003960FE2
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FagMKLXXu6-V for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D378960FE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D378960FE4
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D378960FE4
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:29 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7de4be15125so219050a34.0
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106869; x=1778711669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MoyIPSLpCYcsoQhcc7j5OrgDVAhmBHoXz4AHvcy7dtM=;
 b=itVymLIL0tfeHgjOQEdrVmv99tl1RRbKXO5pEuKFQjMutAkRvlsWjiRgJLnnpxc8hW
 5P8bOlxETzMLk1y3AtMW5eBBVf1wAENHxv3JJHvGAo8ljh8kUT4Hc6HEYgCbZyNNc0HJ
 rJsV9OFfODrhSEwhrHCpke097jHLYMztsuJ4QG3rOrO+880QHvHoe3FctgTqUyNKPH4s
 oyF7m2iZ+wEbQLhqw6TSY2s2p7IGlLY2ap2AhMjEhGG/9VrwbKEn5R6F2O8OVhh+dA2J
 aYfH24psQVFAckcuIK/QtoqEP8Vd+VCxKAyu2L2/mEbgRUpBiL5nUOrPdIdTeAb9mIMF
 1abA==
X-Gm-Message-State: AOJu0YzvCU0ehMjyo0LWr1Gaci1MJbrPYsGZELBetFVUoLvkBd2NrLMI
 tIQJlmZ2yWfmT8RwsDw3XYya2m8F2+x8tIaYTrv6Rt6K068fL/AXt1VlwZs+emzf
X-Gm-Gg: AeBDietblP/girc4uTJo9HY/BRiMU/A1jIE/nuJSSzYdh4wt2Choq0vq0D260dIBR22
 leKaSy4WMd5oe7H7RLZLmnPDTQTzMpH3WXrzzTekWG8J0C/DjyG+3tuIFFx21SE6zq9FsW3zLGb
 ij/73ikcktE68lQ9DA9iBU5TIAlkdLHgWLi5QRTjJOEDrqbsu426rPPDCwd+CIuoTnlY3nF6laM
 XHI+hFXpTW4P5aoog5epa154/4ug5oWMXQQ7uP+aTq7J8soDSpY4qeBeF1jKEnLYqHakszl7W8Q
 a7Ly/HNVnsUSZk98LYVfUsb6Iq0XdKooVpu/kifBWHt/xQuMyb42yeP+MaYglT9aqeUaPhwKASu
 L6HGC+q8p7f7z4UzX/4qU4B0QyvmsGHG1SzAiYhyFSILX86yca2F9xFYMYWAbPE/1zTfuUAR3Wz
 SmUr7GfD6gV6qszEb0X8rF0uUKh4n4+vJcGi9ullK8dRNxBjMjz+Ded1njU/ke2J0X6PBrNShXg
 o4JlLZ7oKWwvw2K4RhGOhb4yfz/OVgAeoYeev6WkaaORg2Fy1/XOhXNRifDU+5nlD3VxJkFw+Uc
 8UN0B44=
X-Received: by 2002:a05:6830:6d09:b0:7dc:18e:b5a4 with SMTP id
 46e09a7af769-7e1def3f732mr3057457a34.11.1778106868634; 
 Wed, 06 May 2026 15:34:28 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:39 -0600
Message-ID: <20260506223341.1759760-38-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106869; x=1778711669; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MoyIPSLpCYcsoQhcc7j5OrgDVAhmBHoXz4AHvcy7dtM=;
 b=dHu8Wp5DjMPwtzpXH5fFsXlHc8yGyOQMldMN5HinDOwIlwplfUABfpFl1sA4zLj7TB
 i4o+HfEqUEemaPVHOfLQB6IeVUCAJupxILQwtbhyosvHDYvcO7iQ7Bp9g1TQacZDwqwF
 N2OSb/tsz7oSERCi+BaQ/uyepHf35P6spu8dfG+UL4mGTSZq850OsWoOnidfqUocQPku
 o23pR5jP6cxwY2a8QMcs6yFamQOgdwhOEPtz3vX5bfE25FLGttYNlkXjppUKWBoJqGFh
 vHbTpO7nnUnHQps7zn6m/yn2b0tFHhRe2hLJVc8PmFPiqF6pIZOgMskzM83jOQDzQn7m
 9bWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dHu8Wp5D
Subject: [Buildroot] [PATCH 38/40] package/unscd: preserve /usr/sbin symlink
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
Using install -D for files below $(TARGET_DIR)/usr/sbin can create
the parent directory path and replace that symlink with a real
directory.

With per-package directories, this can later make rsync fail when a
package target directory contains a non-empty usr/sbin directory and
the skeleton provides usr/sbin -> bin.

The skeleton dependency has already created /usr/sbin, either as a
directory or as the merged-bin symlink, so use plain install and let it
follow the existing path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/unscd/unscd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/unscd/unscd.mk b/package/unscd/unscd.mk
index 94b46460f6..00198e56e3 100644
--- a/package/unscd/unscd.mk
+++ b/package/unscd/unscd.mk
@@ -20,7 +20,7 @@ define UNSCD_BUILD_CMDS
 endef
 
 define UNSCD_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 -D $(@D)/nscd $(TARGET_DIR)/usr/sbin/nscd
+	$(INSTALL) -m 755 $(@D)/nscd $(TARGET_DIR)/usr/sbin/nscd
 	$(INSTALL) -m 600 -D package/unscd/nscd.conf $(TARGET_DIR)/etc/nscd.conf
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

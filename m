Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11E0C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC14440A06;
	Sat,  4 May 2024 21:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqULAiDWtI1F; Sat,  4 May 2024 21:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 660E6416BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 660E6416BA;
	Sat,  4 May 2024 21:40:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7749A1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CF4B405DD
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKbi7TTat_-R for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 093034041C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 093034041C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 093034041C
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-418e4cd2196so6247215e9.1
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858827; x=1715463627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rFSoF+fqgToRbzFI5MghnA6iEG3V919RR5QSkG5djdM=;
 b=dRd3F7w38hQLIPRgpxAUNtk1GQhDpzuU8wNSoEaPXjJQRh/1LeF7YDn3udE0xcuw5D
 PqxFK4KaFEQTYM90DhGRGJhbqGZzvmFGxljosttmE+tqlfGvQ1W3zquz/fIdBKttyAwO
 IfO3gRY+Wmp1t19mteWGbhRWcTbJj2wMQL3fzpgmCMX0CyLaM9WcJGilkp9lCzg3Grcp
 pNyeRRcpgR093IQpOMDl3xX3Pwp8MdodA15NwSKyZNiQY7D5FSidw99rFoyLbrMzM1Lg
 DJKVw0gmz2ccYTI202sOma0kYKAF4Mu/wAZj0RFXoppdJM9V/T1KtQuMTPoJHx3v3lHS
 /2TA==
X-Gm-Message-State: AOJu0YwCvvO1jXqHq7sTkIxMhKyslTEWO4kNHcfNcFkb4dtYDYK5Y6RQ
 wPCjrROeDBFORTAQlWhh77piWQtQuYHL1zVBKFqC45ICoDOYC8hZqmhISg==
X-Google-Smtp-Source: AGHT+IFfYX0mSoQEv9aexHVqRJuVTM3+csR1580VRssLvMxUM4aW/VerKfFN5aFODf4hADnrqGnm2w==
X-Received: by 2002:a05:600c:1914:b0:418:f616:f087 with SMTP id
 j20-20020a05600c191400b00418f616f087mr4959848wmq.29.1714858826831; 
 Sat, 04 May 2024 14:40:26 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:26 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:05 +0200
Message-ID: <3bcbe3344a8c92f395c38f3c33606431e0a9f49b.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858827; x=1715463627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFSoF+fqgToRbzFI5MghnA6iEG3V919RR5QSkG5djdM=;
 b=XbMZ4N6gVLDaOQSDuzbb/QDh232fkMDJCfxJszSeO3nvsJiAGczuyagE9ddniAd8Tn
 xkIJN7f9fnEq0Aym9s4I1POnmsBkPOKStNmGjfl/Yfv7DKhNl55tKI7XwDCVysmTi/IR
 5nQ2UcaehcpsHDufMz4k7XYGiBCofsk8PN31IZ6lXt7GlTr+GbuobUIsn2J4nr0h8A3Q
 urJoiAEqrfelXKwPif0pQE2yVmQpBis0G96HNfi2kJ6R4QjUOS+ZQS85OSs7BiH79yFV
 xwutRtE64kFm1uqOE9BAXuOeN3v4MQFNR7CyzF84nYFaHKl25apO//pB/fWRuz+B1VYb
 VnVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XbMZ4N6g
Subject: [Buildroot] [PATCH 04/22 v3] package/luajit: drop useless
 post-extract hook
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
Cc: Francois Perrad <fperrad@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 2.1, LuaJIT follows a rolling-release scheme, which means
that any commit is as good as any other; LuaJIT uses the comitter's UNIX
timestamp as its semver patch level. It uses the git-attribute
export-subst for the .relver file that contains the %ct placeholder for
git-archive to expand it.

In c9dcd9e459d6 (package/luajit: bump to version 41fb94defa8f...), we
switched to such an upstream version. There was some confusion around
the handling of the git-attribute and where/when it is generated, and
the first revision of the patch used the git download method, so had to
use post-extract hooks to do the replacement, but the second iteration
kept retrieving the archive generated by github, which has the
replacement already done, but the post-extract hooks were not dropped
although now useless...

With the current code, it is easy to bump the LuaJit version and forget
to update the timestamp stored in the .relver file, which would override
the value that was generated on the github side.

Since the post-extract hook is useless, drop it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/luajit/luajit.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 06c8993391..693e22630b 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -33,15 +33,6 @@ LUAJIT_HOST_CC = $(HOSTCC) -m32
 LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
 endif
 
-# emulation of git archive with .gitattributes & export-subst
-# Timestamp of the $(LUAJIT_VERSION) commit, obtained in the LuaJit
-# repo, with:   git show -s --format=%ct $(LUAJIT_VERSION)
-define LUAJIT_GEN_RELVER_FILE
-	echo 1693350652 >$(@D)/.relver
-endef
-LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_GEN_RELVER_FILE
-HOST_LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_GEN_RELVER_FILE
-
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
 # build system uses non conventional variable names.
 define LUAJIT_BUILD_CMDS
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

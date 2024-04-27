Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F52FC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C8FB60A4C;
	Sat, 27 Apr 2024 18:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeQtUayeTVAs; Sat, 27 Apr 2024 18:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C43360A5D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C43360A5D;
	Sat, 27 Apr 2024 18:38:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC7B71BF3C1
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5C0282CE5
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bxxyq8LmqnB for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1A5A82CDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1A5A82CDE
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1A5A82CDE
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-347e635b1fcso2393119f8f.1
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243085; x=1714847885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DfPqKGtw0OGMN7OxiUcNJxgSic87h2dePrcaSOQh09I=;
 b=NbEY74cJ3u9E/9KMHbSDMtclYn9MCRFCYxAfhbgeFMsrCRj9gqarUrPlPEj1Y32pl7
 qBpt5npBlrpzYj+xb6WruIIUifmygiwmPJjJ6Z6I8v06JsWDFWo3eulcLrKfeONc34r5
 D+0+CYIXOW6Nk9K5pVH95DbTq9BF+3fYueP5gLXDCv/7WcNrCL0AEgzXF53lRRGhfLMA
 IZyxAE3d2whak5fbJ5zNKNlzghXOfgBvWe1+nfKd1hfEw+b3cC+izvIt95FyHjE0FZJU
 8FQixFoeG55zxpTrgZ4lF+27AFkk6I/q/sESoMvpEf9X6Qa+ui7C973jtEuxM/o7g1/0
 RlzQ==
X-Gm-Message-State: AOJu0YxBknwOSEZiX4fbKdRSewJOMyaxH3lE/MdPV6RzZXrosofIUhfP
 nanLjDpL/lAaQz2EOzECtVa7u5HfHl5ifN6KR2xc21pnX19X/pbLzhN9TQ==
X-Google-Smtp-Source: AGHT+IHrPRyGJAKSHdAoh1vcK/7vKs72RG1yqP9YxlKO3/qvCLYI6W0Dz4Am0gMvq2GyU0Z9bdB1iw==
X-Received: by 2002:adf:ed83:0:b0:345:603f:cd96 with SMTP id
 c3-20020adfed83000000b00345603fcd96mr2205221wro.5.1714243085371; 
 Sat, 27 Apr 2024 11:38:05 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:05 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:37:52 +0200
Message-ID: <80a49a78422f43fb2cefa4aada8bdb641c1871af.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243085; x=1714847885; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DfPqKGtw0OGMN7OxiUcNJxgSic87h2dePrcaSOQh09I=;
 b=fUI81krBMioRiAPu9nvgsmzBJ0btHUhcr1lw0OIPw5kuETLEeKvmMHp1171w+OEdyC
 UjZLH8nUbZmizMh26OIwRAD+OJV3nFn3d6ogeXhs0HLzgRtNSu9rWr/RjqJusNKF0HN5
 Em50zXZ9YOo/hdob7DyuNbrJEMJLyAtfDwP1OBD4olI3ws9TXpPRi3UVeBRsZbcq+4Fv
 0s8KTry+YUEAIlKagBtnGCrkYDHzUBUk2wT5KQtHFxoUarAGv9D/uNwoILyDuL2LqKcf
 czLz7GK4AoW4upWvN9EENxrVRWd8qb1X4aUiE3Im9AZfdxW4IEysWyMFChTK3DEmAkZ3
 lCPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fUI81krB
Subject: [Buildroot] [PATCH 05/15 v2] package/luajit: drop useless
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
export-subst for the .relver file that contains the %ct placeholderfor
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52B3C10F16
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA5360A94;
	Sat, 27 Apr 2024 18:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_usf6W_pDFk; Sat, 27 Apr 2024 18:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17A0760AA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17A0760AA6;
	Sat, 27 Apr 2024 18:39:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1732A1BF86D
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EF336074D
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvyr9-6DSiin for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CBD46080A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CBD46080A
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CBD46080A
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-343c2f5b50fso2063760f8f.2
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243090; x=1714847890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9wVUb8KOWqDkBGXRvJPzk7/qBoi5ST98COyUjOBF3Io=;
 b=fR9cqoC7LThVXPDeocZNVwq8rvD0BVMLTjYPG+WVRvwyKFvKoezasN+dilCgw+2Ft9
 xmgyOX7Gf3OgRXBEIFNhoN6vwzz/qKC6/c9KIOB2Gis6HTD11mLYsrXKQXXctkCNha6a
 Ym2I6e09bl1wF/DeRHFYFgYuxaHDA6hqOVd0Wa5bzd1V+c7Td5NhCtJyszhJI0iaAjBq
 9vygMyB91i2FWTmdQAKQDFHaR4jVsHXWqZfyVs4g0g4oZV24dF79726xmvCOwnJjYuSn
 3rZAOMAD68pkObjdpDUTK/NMm/8n/E3ecVA2Vr6ChQ4sKxBPtXNCpkFrywKMaJQHV8km
 sUOQ==
X-Gm-Message-State: AOJu0YyMhHUUeRHhjaGMuftDGHRLVF8rhVFruGnQ0+ktwJMwR+qYzZi+
 ARQDSdU4lssSivlZkausOtA3pXkgEN0NZGIccVTRWPf0BA5N23Ga0esDjA==
X-Google-Smtp-Source: AGHT+IFwf8F/XPgXAJ1t+SfQwobQJ54llO4+sp/rLq79aaisqghtjO0QbpNAiZQIAszAlbc4dBe1PA==
X-Received: by 2002:a05:6000:b90:b0:343:c6d1:280d with SMTP id
 dl16-20020a0560000b9000b00343c6d1280dmr4038733wrb.21.1714243089626; 
 Sat, 27 Apr 2024 11:38:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:09 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:38:02 +0200
Message-ID: <f49ac93d8992e018c050ac49db162d086ba41ebb.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243090; x=1714847890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9wVUb8KOWqDkBGXRvJPzk7/qBoi5ST98COyUjOBF3Io=;
 b=dHFAWPrd7K1dqCZ4aVcVdJp+brfZ4h8xDgT/RfFqkS5KyJ1w8dtEhyGXmu8r6I6AQ1
 xXLFDH8po5+mfwLnWE/lOYnEhAaZGb8w3ykd/wmPdNZWgQOgeorvtBGb+0ah76TP/CpH
 1i1P3kHruY5utoEJ6K7M8441CGD7+qGe80Kfo49KLSs7/cBgMs9By35nn6jrOhr/WOBI
 nWRUiYexTw0Bqg6xLwksjLGwsjBgTl0YnQ2wF+a4Gskr4/yvrtPdc30SyMHj+EuUqIVv
 igjpBsFMQJpgw7f15snqJ8qEULVIPJVO+n9XVcBUYm3yw8C0HQhc99+9bj9clxgC2q7k
 pd3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dHFAWPrd
Subject: [Buildroot] [PATCH 15/15 v2] docs/manual: document new archive
 version suffix
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/migrating.adoc | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index ed9b61257a..0a4cfdbe49 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -127,7 +127,25 @@ that such patches will most probably not be accepted.
 [[migrating-git-attributes]]
 === Migrating to 2024.05
 
-The git download backend now properly expands the `export-subst`
-https://git-scm.com/docs/gitattributes[git attribute] when generating
-archives; the archive version suffix has been updated, to +-br2+, so the
-hash files must be updated accordingly.
+The download backends have been extended in varios ways:
+* all locally generated tarballs are even mor ereproducible: before
+  2024.05, it was possible that the access mode of files in the archives
+  were not consistent when the download directory has specific ACLs (e.g.
+  with the +default+ extended attributes set); this impacts the archvies
+  generated for git and subversion repositories, as well as those
+  for vendored cargo and go packages
+* the git download backend now properly expands the `export-subst`
+  https://git-scm.com/docs/gitattributes[git attribute] when generating
+  archives.
+
+To acco;odate those changes, the archive suffix has been updated or
+added:
+* fot git: +-git3+
+* for subversion: +-svn4+
+* for cargo (rust) packages: +-cargo1+
+* for go packages: +-go1+
+
+Note that, if two such prefix would apply to a generated archive, like
+for a cargo package downloaded from git, both suffixes need to be added,
+first the one for the download mechanism, then the one for the vendoring,
+e.g.: +libfoo-1.2.3-git3-cargo1.tar.gz+.
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

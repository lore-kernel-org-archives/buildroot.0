Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE34C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1619428A3;
	Fri,  7 Jun 2024 17:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0d2Wnw_Z2xQ; Fri,  7 Jun 2024 17:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73BDE42824
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73BDE42824;
	Fri,  7 Jun 2024 17:06:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E15871BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B51304004A
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGdiMZAjV7xp for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B330840272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B330840272
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B330840272
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-35f0aeff7a8so568845f8f.2
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779969; x=1718384769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UlKapMSqe7mJ+Zngi6GkI2CYhk2hK+lDpJJPdVpmdVI=;
 b=BVnGbatVYRZ+7uS6fj6zElSHvTaYAygyPPDbWDXnQTQnrcJ7J1ev6FtF3KzjB08nJ1
 GdCqxSKTGkltjcoawpaziNDW6lbLgQT+kPRNij6Eo8Oyoxxw73gRVwrzORIV9cEPuKzp
 wsBhclxWoMR4jW5AvZfdc3j8XV3a8zi0UeUCogcgZoY0ASptCn6uhi9hQBzzQPbzHM/v
 4uQqOxbF0YsTQ0Wanzb+E4507MF29kVUq1NFXkAvzEH8nlo82WRhB4RBNkpRmEPuKykg
 8xF3Lrut++IZjUWIOK1zaUfeioI3MZmM+DENd+MjQ/6AS61rJ4O4bxuqi/jDjmfCI9X8
 Rf0Q==
X-Gm-Message-State: AOJu0Yzzk2sXzunw8WOqHaur+ea3bSP4Z4PXwYqzHxjyaJlshNAh5ynL
 F4LqChxLiphRRLBkIYoiteVQjgFY1bge8iTGN1z/3f1SvcxB1KswdH+AWw==
X-Google-Smtp-Source: AGHT+IGu64wmKVi4s7BiiKIseAWIzOQpMaiwLQfVcl2joPAUHvHBHIwRyeWWyabCxYGAiGflF8e/tA==
X-Received: by 2002:a5d:68c1:0:b0:35e:f234:695a with SMTP id
 ffacd0b85a97d-35efedca55cmr2303935f8f.56.1717779968694; 
 Fri, 07 Jun 2024 10:06:08 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:08 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:55 +0200
Message-ID: <c3cab5d7365dfd9153a6b03311bd5f029eea236f.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779969; x=1718384769; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UlKapMSqe7mJ+Zngi6GkI2CYhk2hK+lDpJJPdVpmdVI=;
 b=cafw35rtZ0JPAy2H0LY3bW4eEXXw0thxx84rJ4HIwWMThUR5dQUhZS4UIgqA04F5eH
 3b7Ydyu0BEk+ZzdUpP2lw7jl0EK+G+UhTxX6isDbFxQscjr1PgGfgkPUpjWny2sqpcVQ
 Z2RACoTRwFfwRZS6X3NbE/fGdr20o/H5vy3LaG/QuMtZA3iqB5MW3oR0jLtg9eIXHHia
 OLwl70hDep+2384RZDG0oYf8Sb+ziS5omzv3gVOIkC7UvLBL1onZXNlj6iDie6oaofnU
 wgfdAeH6AdC2KBh39M88tlVQDyt/ftSuCs9nyBoB0OyzZI79+PhxzSDP7BZrcfPnRGFL
 11eA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cafw35rt
Subject: [Buildroot] [PATCH 14/20 v2] docs/manual: rephrase end of vendoring
 section
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

The current phrasing is dubious: the vendoring does not detect any
change in the dependencies; quite the opposite, in fact: once the
archive has been generated locally, no update to the vendored
dependencies is ever done.

Rephrase the end of the section to mention the term "vendoring", and
to drop the dubious claim; retain the off-line build reference, though,
as this is indeed correct.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-cargo.adoc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
index e18fd9ce23..8a2292e7b6 100644
--- a/docs/manual/adding-packages-cargo.adoc
+++ b/docs/manual/adding-packages-cargo.adoc
@@ -93,8 +93,5 @@ repositories, listed in its +Cargo.toml+ file. Buildroot automatically
 takes care of downloading such dependencies as part of the download
 step of packages that use the +cargo-package+ infrastructure. Such
 dependencies are then kept together with the package source code in
-the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
-the package's tarball includes such dependencies.
-
-This mechanism ensures that any change in the dependencies will be
-detected, and allows the build to be performed completely offline.
+the tarball cached in Buildroot's +DL_DIR+. This is referred to as
+_vendoring_. Vendoring allows for a completely off-line build.
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B904E64AAD
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 14:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B8A81E4C;
	Tue,  3 Dec 2024 14:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BpqHDCY26fK; Tue,  3 Dec 2024 14:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D2E081E4D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D2E081E4D;
	Tue,  3 Dec 2024 14:00:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AE612365
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AFC640936
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6-H0UhgP3c8 for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 14:00:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B49F408FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B49F408FE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B49F408FE
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:00:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.11])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 57B84780372;
 Tue,  3 Dec 2024 15:00:44 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Tue,  3 Dec 2024 15:00:17 +0100
Message-ID: <20241203140017.89157-3-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241203140017.89157-1-vjardin@free.fr>
References: <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
 <20241203140017.89157-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733234450;
 bh=PHnh4T3s/6WZscbbqMT8sPtFWYSQmcr/x1X6hXrUjEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sfovQCYhTbKm6QGEsOHRkxat6iSswqXytyC7nL3czmHn6w2tD/d4G7Wqfm0rbtEiX
 RJsqYIMELcLxz5Hejh2nt5jxoFFXFwKGolPpWlyyFiYsXz+XNqinO1/BXJDj6prare
 7kPuKpet5xmaA++mL//4Ni3I3P3ZdyBGbTvq4pEncQ6h7rjry297PomhhNbcUoFsC1
 SlnwETQF0lonKlMZSvXPSiL2XncgdFG5Pq6bGAdRt90kIoySYrF734AIoNncNuUHja
 Q4gjck0+zVj5dWWpVIUrJD1i6nykw4xAG0sLbCf/TZhBcuewVwmQKC8NkAhRUayknj
 Bxixy1pJqiB1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sfovQCYh
Subject: [Buildroot] [PATCH v4 2/2] doc/manual/adding-packages-meson.adoc:
 tags
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

Described the usage of FOO_MESON_INSTALL_TAGS=YES which decreases
the footprint of the target since only the runtime will be installed.
All the other development header files or libraries will be installed
into the staging folder.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Suggested-by: Brandon Maier <brandon.maier@gmail.com>
---
 docs/manual/adding-packages-meson.adoc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-meson.adoc b/docs/manual/adding-packages-meson.adoc
index 01891e03cc..b7c987ddd1 100644
--- a/docs/manual/adding-packages-meson.adoc
+++ b/docs/manual/adding-packages-meson.adoc
@@ -124,6 +124,11 @@ will therefore only use a few of them.
   +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
   +pkg_config_libdir+.
 
+* +FOO_MESON_INSTALL_TAGS+, can be set to +YES+ to enable meson's `--runtime` and
+  `--devel` installation modes for the target and staging folders, respectively.
+  This configuration is necessary to prevent meson from installing development
+  artifacts into the target folder.
+
 * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
   +ninja+, meson companion tool in charge of the build operations. By default,
   empty.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

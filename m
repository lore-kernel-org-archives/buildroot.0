Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638E6D78332
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 15:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CAFD8140A;
	Mon,  2 Dec 2024 15:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqxRYxkVtWqk; Mon,  2 Dec 2024 15:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B08681415
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B08681415;
	Mon,  2 Dec 2024 15:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3F8E1DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D189C407BC
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2I_K6mC0A7DH for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 15:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF659406DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF659406DF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF659406DF
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:49:14 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:2ddd:b692:571f:f1a1])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DDFF913F8C8;
 Mon,  2 Dec 2024 16:49:07 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Mon,  2 Dec 2024 16:46:30 +0100
Message-ID: <20241202154630.76543-3-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241202154630.76543-1-vjardin@free.fr>
References: <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
 <20241202154630.76543-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733154553;
 bh=PHnh4T3s/6WZscbbqMT8sPtFWYSQmcr/x1X6hXrUjEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=COkjNhyS7qypAZp/x/FVT2lxisyv/GMsbI1bRGeRTUJw9yFdzuiha/kPBgB6X07st
 oXJ9R9FAE4QOSInJrb3tUk0hjL89zllZuTmeagcvuHF2yFPP3KQs1HSY8HLGzRNWBR
 lrKx4kDRSvotrJunuYwNTHSDUb5/Bii/3qVUrfgvSQxJedvq74RhvXCwTDEO7Ncq63
 3r2faDb1JPDpVSibaw2WC91cbvaN6gTJ7p1b5j8bcHXQGklgSpplVqirJBtgqIQHuz
 MDbRe26BrF0YuQpoMr+F/ClFypwY9Qp5ZXQiPGXBFFP29p0NJ20EVEJ6sh6/lZLQfk
 9aKSir9Dtdhyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=COkjNhyS
Subject: [Buildroot] [PATCH v3 2/2] doc/manual/adding-packages-meson.adoc:
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

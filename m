Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A0FD66BA5
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 01:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8922C85694;
	Wed, 27 Nov 2024 01:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOya7UM86Tm4; Wed, 27 Nov 2024 01:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE218569B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE218569B;
	Wed, 27 Nov 2024 01:31:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BBBB712
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18A946FB27
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4LHMdokGtJm for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 01:31:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CFF36FB16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CFF36FB16
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CFF36FB16
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:31:44 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:4ced:2fb9:908c:7bdc])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0C0A5B0051E;
 Wed, 27 Nov 2024 02:31:37 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Wed, 27 Nov 2024 02:30:01 +0100
Message-ID: <20241127013001.24122-3-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241127013001.24122-1-vjardin@free.fr>
References: <CADwxmTnvhL1rg7T2k8Ye+wV0gx2oCCjLmnKiCfUQsY7ud9RVPA@mail.gmail.com>
 <20241127013001.24122-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732671102;
 bh=PHnh4T3s/6WZscbbqMT8sPtFWYSQmcr/x1X6hXrUjEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AjZZe+bxP2Lzyi0MP21LZhwsCZCAzKQL7wig1ZDBzhAnkvDcb7YxocB7Ce1/2GSJl
 4Mmwwt6ANDj/Ssbx1mrEvfpUq2wxC6+I1VBMXzzJtJGtvlEUL+/+rIO/mSidNTgTDe
 XOj0vtV8WuSbig+YXIR/5/dkPpEGEepDw5KZyfuQBsdRsu7iEpvn59tqVifmZEzqgW
 ki7Mh9XaHLJrjx+tcSz3BZExy9EcNZb8J7KelDeDrYfhjMTEDN9Ya7k7B0GIwiXMoX
 Qbmci7Ku6e/snPp6EzFQt6lB4ND2PlVqzi186VUpqlX/luPPMWObEVZrk5cCkXtahy
 bZTQKX/8sEbsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AjZZe+bx
Subject: [Buildroot] [PATCH v2 2/2] doc/manual/adding-packages-meson.adoc:
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E589C3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 18:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5FA8610F9;
	Wed,  7 May 2025 18:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EslVhcDSOtY5; Wed,  7 May 2025 18:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0639961196
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0639961196;
	Wed,  7 May 2025 18:53:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2584439
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A895040B96
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yXZWNNRcN2C for <buildroot@buildroot.org>;
 Wed,  7 May 2025 18:53:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5E4340B64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E4340B64
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5E4340B64
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:53:14 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 7A5E8E002BB;
 Wed,  7 May 2025 20:53:12 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Wed,  7 May 2025 20:53:07 +0200
Message-ID: <20250507185311.7581-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1746643992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FDMlV0WSzwEPsIRKjtBsyBUHrCS+28mF6JGw8L+3MmE=;
 b=kYMA86pL5DeCp6Rb5bWnSeAGOZtnkCNNondJMSuCXkUt8kXz12waB7ayMSEsuAM7LbZuRl
 t0DHuv9hai431f9A1BTNWMD9nKFE5P7JOxyklN7GsUOd/7PxSODQoiUiP9UVZHuYZ/Vsyj
 JoUxA63Fem5r0u0ukF0FN9aiPlbmUL4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=kYMA86pL
Subject: [Buildroot] [PATCH 1/1] package/bash: fix build with host GCC 15
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

bash uses K&R function declarations which have been removed in C23.

Since part of the build process (like the mkbuiltins helper) is written
in C, building bash now fails on hosts with GCC 15 (which defaults to
C23).

Since properly fixing this on the source code level is a larger
endeavor, just set the C standard to an old enough version for now.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/bash/bash.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 81f698f166..84f581da79 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -26,6 +26,10 @@ BASH_CONF_ENV += \
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_printf_a_format=yes
 
+ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
+BASH_CONF_ENV += CFLAGS_FOR_BUILD="$(HOST_CFLAGS) -std=gnu17"
+endif
+
 # The static build needs some trickery
 ifeq ($(BR2_STATIC_LIBS),y)
 BASH_CONF_OPTS += --enable-static-link
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

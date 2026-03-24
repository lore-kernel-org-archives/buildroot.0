Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292BDE9A76A
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 11:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC9E8822A9;
	Tue, 24 Mar 2026 11:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RjYNZaW6IPt; Tue, 24 Mar 2026 11:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D799D82289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774350136;
	bh=1J8AEiPRQqt1G6E0U0TGzDp4uMpj/908DUhAL/NInhA=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WHptxlnimrXLrDjwAc1CLSZ/Qms/vJ5Etw2gLDfvwj/b7AApqB/4SJ2yJmcFRWWb1
	 vzKv9TlvGwi+3pNyQAy+Lh1llBD9WRiyFnuFHXzv4cGUZRpoDKdqwIP8q4oMpkkBk1
	 lPEAMDqnUwW27z0Yp1T4E0/8fJDfbrSZR4zj4tamIy4SnHbkEJkrNXTdVRG17rzn0k
	 FERW1CTCAUP+t2ncwusuLSHOoBl3sNy177Z1IPvG2j2IDDAJXkr10kVURgAsVnOvX9
	 7BUTL/YykpkyPNUGNiZDBnTExp/xzlvaIgk9oFrkDjR3gCNIdRXiriMQMCNLoI+c9n
	 NioyrudhWRy9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D799D82289;
	Tue, 24 Mar 2026 11:02:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05BA41D3
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 11:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBEAE401EA
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 11:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQ_dpgnTgTD4 for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 11:02:13 +0000 (UTC)
X-Greylist: delayed 76432 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 24 Mar 2026 11:02:12 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0711400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0711400A2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.16.66.169;
 helo=smtp-42a9.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch
 [84.16.66.169])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0711400A2
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 11:02:12 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fg6Yt4DpmztFJ;
 Tue, 24 Mar 2026 12:02:10 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fg6Yt0fKMzMZb; Tue, 24 Mar 2026 12:02:10 +0100 (CET)
Date: Tue, 24 Mar 2026 12:01:48 +0100
MIME-Version: 1.0
Message-Id: <20260324-qt5-5-15-18-2025-02-x-v1-3-9d25b343a6e3@cherry.de>
References: <20260324-qt5-5-15-18-2025-02-x-v1-0-9d25b343a6e3@cherry.de>
In-Reply-To: <20260324-qt5-5-15-18-2025-02-x-v1-0-9d25b343a6e3@cherry.de>
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774350130;
 bh=/9SguVJMt3/VEyBSaOxh2JbPQIZfcvMlN1LQBdgjFrY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=g/wnSnSyMJtxc98AY9HilfpX4iGO6HGyFg2SxnArcm+kPnVBZx/8taInydr3cRhKy
 O6sH2UD7l347Qi9XeNC10LCpOTyAqyidCpfSSgqcQNOnZcnsVlwVVMIYP4Yqgz7oUX
 b8x7u1mxIP0pr85oGBI7RUkMY7cfqIri8e8ecVK+UPUj54FUPcL5fLi8DAlUN5bhVT
 HIJxRuOhAMoob98pKXVKXlhCbTvp0UM9lIP6HEQs5hepQ38Mb7wF4inagLuHMppYt1
 yXhSqwqsPc8HdYYCi7nLz0o9+iaNEnxwyuKt8T3DI02TfjzmDs1zcCNDEYAh8fXXPP
 Uk3EDrVrqVS0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net
 header.a=rsa-sha256 header.s=20231125 header.b=g/wnSnSy
Subject: [Buildroot] [PATCH 2025.02.x 3/5] package/qt5/qt53d: always disable
 assimp support
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

Neither Buildroot's nor the module from qt53d sources compile, so always
disable assimp support.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/qt5/qt53d/qt53d.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index ae15b58df3..33e93ec5db 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -14,14 +14,10 @@ QT53D_SYNC_QT_HEADERS = YES
 # command line argument separator
 QT53D_CONF_OPTS = --
 
-ifeq ($(BR2_PACKAGE_ASSIMP),y)
-QT53D_DEPENDENCIES += assimp
-QT53D_CONF_OPTS += \
-	-feature-system-assimp
-else
+# Assimp support is broken with both Buildroot assimp and the assimp module in
+# the qt53d sources, therefore disable it for now.
 QT53D_CONF_OPTS += \
 	-no-feature-assimp
-endif
 
 QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

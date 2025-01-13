Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE17C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 21:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7793060AFC;
	Mon, 13 Jan 2025 21:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjKOM79vcF3u; Mon, 13 Jan 2025 21:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86BE160F75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86BE160F75;
	Mon, 13 Jan 2025 21:24:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8EC895D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF8D740921
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGNjL_3uo5MI for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 21:24:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88A5640906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88A5640906
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88A5640906
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:24:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E9F38B00535;
 Mon, 13 Jan 2025 22:24:23 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 13 Jan 2025 22:24:14 +0100
Message-ID: <20250113212414.137066-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736803465;
 bh=fHKVhb0mihQNcVT4AlsNB/qSEH+i4T1ncJn4PJ6I72I=;
 h=From:To:Cc:Subject:Date:From;
 b=sXBeloEpynf7c8zB2KGwk0c/cwWOalLQgF1jfDQikMY7xr6Zrs7Ey1pvabDwBnVpa
 x906/Or+fQLkRcvQ3Su8m/VlaHwInXVmHFVG0PVxyqW62ZLt2it2ZGTpWcmaKtOYRz
 LCk1M3fYrPXkq65iX8uzi9faZpVoD8Sl0Lc4bdFrq3hh6MSshh54Zn3C6cXndFO5CR
 seU4Mx/PWLt9Tod7w+p3GkQr71bPRZTOM+AoW2zjSKmuz9QP8GEeoljbfPlyMUAjl5
 LF7YyAlw1N7dG3HuzKQnNVdGTz6cwIhAYn2CoyP1dCQoLD1Y+pYlpJBdpyNCKhTWXG
 LbqMEDVdvQShQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sXBeloEp
Subject: [Buildroot] [PATCH 1/1] Config.in: introduce the BR2_BROKEN hidden
 symbol
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

Commit [1]
"toolchain/toolchain-external/toolchain-external-synopsys-arc: mark
as broken" disabled BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC by adding a
depends on BR2_BROKEN. This symbol does not exist and generates
check-symbol failures, see [2].

This commit fixes this issue by introducing the BR2_BROKEN hidden symbol
that will be used to track those known to be broken features. This
symbol will help to track features that were broken for too long and
remove them.

Fixes: [2]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/8840476511

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1623395115
---
 Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Config.in b/Config.in
index 247a9e8ef1..28d34c8721 100644
--- a/Config.in
+++ b/Config.in
@@ -6,6 +6,15 @@ config BR2_HAVE_DOT_CONFIG
 	bool
 	default y
 
+# Hidden symbol kept to false, to temporarily mark a configuration
+# known to be broken (by depending on it). Ideally, we don't want to
+# keep broken parts for too long. The intended use of this symbol is
+# to give some time to a developer to fix the feature. Features marked
+# as broken will be removed if they are not fixed in a reasonable
+# amount of time.
+config BR2_BROKEN
+	bool
+
 config BR2_VERSION
 	string
 	option env="BR2_VERSION_FULL"
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

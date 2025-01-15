Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDD9C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 393EC70440;
	Fri, 28 Feb 2025 16:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UD75ue90FibO; Fri, 28 Feb 2025 16:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D8F97043F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D8F97043F;
	Fri, 28 Feb 2025 16:58:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C4B4711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 073A7424CF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ldnDuoOfarM for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60D614257D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60D614257D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5588A87912; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:17:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 489d1f924979f7a94008e887393702e3c3663705
X-Git-Newrev: 2ddc5808cd19f577917566ad83e2a3835d6d43b9
X-Patchwork-Hint: ignore
Message-Id: <20250228163011.5588A87912@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Config.in: introduce the
 BR2_BROKEN hidden symbol
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2ddc5808cd19f577917566ad83e2a3835d6d43b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4659C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 16:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EFCA60F0B;
	Sat,  4 Nov 2023 16:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EFCA60F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXKvGB5yrdBh; Sat,  4 Nov 2023 16:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4113660F92;
	Sat,  4 Nov 2023 16:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4113660F92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50CA91BF2C5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26F6560F97
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26F6560F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqW4axbP37Qv for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 16:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51AB960F93
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 16:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51AB960F93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A6398669B; Sat,  4 Nov 2023 16:55:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 17:49:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a8bc54e09ea816e0231afe13bbec14c2d8baa7d
X-Git-Newrev: 049ea7b389e1f4657aa7683b6a6241e021817b76
X-Patchwork-Hint: ignore
Message-Id: <20231104165516.3A6398669B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo: handle licensing terms
 for host-only packages
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=049ea7b389e1f4657aa7683b6a6241e021817b76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The licensing terms are inherited from the target variant to the host
variant: when the host _LICENSE is empty, then the value of the target
_LICENSE is used.

However, for the cargo infra, we want to append a little blurb about
vendored depndencies. If the package is a host-only, then it would
inherit the target _LICENSE, i.e. the variable without the leading
HOST_. If that is defined, this is inherited in the generic-package part
of the infra, but in the cargo infra, we saw an empty variable, and so
we would not add the vendoring blurb.

We can't move the condition appending that blurb, after we called into
the generic-package infra, otherwise in that case, we'd have the
opposite issue for packages that are both target and host packages,
where the blurb would be duplicated for host packages...

Instead, we workaround the issue by duplicating the heuristic to inherit
the target value, from the generic- into the cargo-package infra.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-cargo.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 7802c3a883..2c277f7079 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -95,6 +95,15 @@ ifneq ($$($(2)_SUBDIR),)
 $(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
 endif
 
+# Because we append vendored info, we can't rely on the values being empty
+# once we eventually get into the generic-package infra. So, we duplicate
+# the heuristics here
+ifndef $(2)_LICENSE
+ ifdef $(3)_LICENSE
+  $(2)_LICENSE = $$($(3)_LICENSE)
+ endif
+endif
+
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE. If the license is unset, it is "unknown"
 # so adding unknowns to some unknown is still some other unkown,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

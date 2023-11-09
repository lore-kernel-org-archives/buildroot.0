Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FA4C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 09:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88B8981E2E;
	Thu,  9 Nov 2023 09:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B8981E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjV9PAXOuphe; Thu,  9 Nov 2023 09:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB8078224B;
	Thu,  9 Nov 2023 09:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8078224B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 361031BF995
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 09:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C90C81E2E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 09:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C90C81E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6pLeTgjxzeJd for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 09:50:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4618E81D5A
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 09:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4618E81D5A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32F6C86DCE; Thu,  9 Nov 2023 09:50:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 10:44:19 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6ebd4438f30ad86a03195aceae43b23a1072a4b3
X-Git-Newrev: 026baf3f25aa5a91ffa7bd36e3688a180ddbdc63
X-Patchwork-Hint: ignore
Message-Id: <20231109095053.32F6C86DCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pkg-golang:
 handle licensing terms for host-only packages
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=026baf3f25aa5a91ffa7bd36e3688a180ddbdc63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The licensing terms are inherited from the target variant to the host
variant: when the host _LICENSE is empty, then the value of the target
_LICENSE is used.

However, for the golang infra, we want to append a little blurb about
vendored depndencies. If the package is a host-only, then it would
inherit the target _LICENSE, i.e. the variable without the leading
HOST_. If that is defined, this is inherited in the generic-package part
of the infra, but in the golang infra, we saw an empty variable, and so
we would not add the vendoring blurb.

We can't move the condition appending that blurb, after we called into
the generic-package infra, otherwise in that case, we'd have the
opposite issue for packages that are both target and host packages,
where the blurb would be duplicated for host packages...

Instead, we workaround the issue by duplicating the heuristic to inherit
the target value, from the generic- into the golang-package infra.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit aa87875b9f22f19bd1ee5f9c6d6a3e9eb49ebc2b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 1fa0b001e0..8e27602d41 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -91,6 +91,15 @@ $(2)_DL_ENV += \
 	GOPROXY=direct \
 	$$($(2)_GO_ENV)
 
+# Because we append vendored info, we can't rely on the values being empty
+# once we eventually get into the generic-package infra. So, we duplicate
+# the heuristics here
+ifndef $(2)_LICENSE
+  ifdef $(3)_LICENSE
+    $(2)_LICENSE = $$($(3)_LICENSE)
+  endif
+endif
+
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE. If the license is unset, it is "unknown"
 # so adding unknowns to some unknown is still some other unkown,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

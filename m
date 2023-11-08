Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E076C0018C
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 09:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A01081F0B;
	Thu,  9 Nov 2023 09:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A01081F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QF9-O2LroWWH; Thu,  9 Nov 2023 09:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E58E81E2E;
	Thu,  9 Nov 2023 09:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E58E81E2E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 204AA1BF40E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 09:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED647612CB
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 09:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED647612CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5MbQ6PuNtBWe for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 09:50:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D3FE6124B
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 09:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D3FE6124B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0277786DCB; Thu,  9 Nov 2023 09:50:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 22:13:01 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b1987536ffb0a44e23426c836aec581c79bd116f
X-Git-Newrev: 610e80a6dfcb6f3f9b62f794f144efe1f94dc3fe
X-Patchwork-Hint: ignore
Message-Id: <20231109095053.0277786DCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pkg-cargo: don't
 expand license info when empty
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

commit: https://git.buildroot.net/buildroot/commit/?id=610e80a6dfcb6f3f9b62f794f144efe1f94dc3fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The cargo infrastructure automatically expands the list of licenses with
a little blurb that the licenses for vendored dependencies might be
missing in the list.

However, when a package does not define a license, the resulting text is
sub-optimal, resulting in a manifest that contains (with a leading
comma, yes):

    , vendored dependencies licenses probably not listed

In that case, pointing out some unkown licensing terms may be part of
unkonwn licensing terms is superfluous.

Instead, just let the legal infra do its job, and report an "unkown"
license altogether.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 0a8bc54e09ea816e0231afe13bbec14c2d8baa7d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cargo.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 264bf5a1ae..7802c3a883 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -96,8 +96,12 @@ $(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
 endif
 
 # Due to vendoring, it is pretty likely that not all licenses are
-# listed in <pkg>_LICENSE.
+# listed in <pkg>_LICENSE. If the license is unset, it is "unknown"
+# so adding unknowns to some unknown is still some other unkown,
+# so don't append the blurb in that case.
+ifneq ($$($(2)_LICENSE),)
 $(2)_LICENSE += , vendored dependencies licenses probably not listed
+endif
 
 # Note: in all the steps below, we "cd" into the build directory to
 # execute the "cargo" tool instead of passing $(@D)/Cargo.toml as the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

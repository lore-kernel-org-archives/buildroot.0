Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E941C4167B
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 09:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CADC482259;
	Thu,  9 Nov 2023 09:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CADC482259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwtL-ldBtNfV; Thu,  9 Nov 2023 09:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BF48224D;
	Thu,  9 Nov 2023 09:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06BF48224D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEA041BF40E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 09:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C52DF6124B
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 09:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C52DF6124B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wkomE22VjCK for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 09:48:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E271612B8
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 09:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E271612B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AA6386DBB; Thu,  9 Nov 2023 09:48:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 10:43:51 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: f03b295d7195c3d4c037bf52fc03fbe7048c8516
X-Git-Newrev: fbadaaf709b7aec08944c74d09a1e39f2ce6093d
X-Patchwork-Hint: ignore
Message-Id: <20231109094817.4AA6386DBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/pkg-golang: don't
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbadaaf709b7aec08944c74d09a1e39f2ce6093d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

The golang infrastructure automatically expands the list of licenses
with a little blurb that the licenses for vendored dependencies might be
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
(cherry picked from commit 01a4614d10b90540bbab76c823d8fb2faea87a27)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 7ba82284f3..1fa0b001e0 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -92,8 +92,12 @@ $(2)_DL_ENV += \
 	$$($(2)_GO_ENV)
 
 # Due to vendoring, it is pretty likely that not all licenses are
-# listed in <pkg>_LICENSE.
+# listed in <pkg>_LICENSE. If the license is unset, it is "unknown"
+# so adding unknowns to some unknown is still some other unkown,
+# so don't append the blurb in that case.
+ifneq ($$($(2)_LICENSE),)
 $(2)_LICENSE += , vendored dependencies licenses probably not listed
+endif
 
 # Build step. Only define it if not already defined by the package .mk
 # file.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2136C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 16:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A74160F1F;
	Sat,  4 Nov 2023 16:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A74160F1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQZqKNErFTPI; Sat,  4 Nov 2023 16:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE9860F9C;
	Sat,  4 Nov 2023 16:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DE9860F9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 179111BF2C5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3804560F1F
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3804560F1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Inmq0efnPUPm for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 16:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72A1160F95
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 16:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72A1160F95
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5153E8669C; Sat,  4 Nov 2023 16:55:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 17:53:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 049ea7b389e1f4657aa7683b6a6241e021817b76
X-Git-Newrev: 01a4614d10b90540bbab76c823d8fb2faea87a27
X-Patchwork-Hint: ignore
Message-Id: <20231104165516.5153E8669C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang: don't expand license
 info when empty
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

commit: https://git.buildroot.net/buildroot/commit/?id=01a4614d10b90540bbab76c823d8fb2faea87a27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

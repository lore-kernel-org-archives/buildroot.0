Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD90C4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 17:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF1B5409A4;
	Sun,  4 Dec 2022 17:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1B5409A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQGPe0yKJsxI; Sun,  4 Dec 2022 17:29:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F65409B4;
	Sun,  4 Dec 2022 17:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2F65409B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FB921BF863
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 17:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE3584089D
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 17:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE3584089D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WeGa2IkcN5lm for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 17:29:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6D7840897
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 17:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D7840897
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1BBC85514; Sun,  4 Dec 2022 17:29:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Dec 2022 18:29:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 17cb635a8a2dde2fbd7b21ba8639862e282027dd
X-Git-Newrev: 9fcf6ea43505918d28e12511c782b74eaba663a0
X-Patchwork-Hint: ignore
Message-Id: <20221204172932.B1BBC85514@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mender-artifact:
 remove unnecessary GO_ENV
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fcf6ea43505918d28e12511c782b74eaba663a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 235636409fdd (package/mender-artifact: do not download modules
during the build process) introduced the use of GOFLAGS="-mod=vendor",
in 2020-08-13, before we had the go download post-process...

... which was introduced with ommit 24ac316ff58e (package/pkg-golang.mk:
implement Go vendoring support), in 2022-01-08, which added $(2)_DL_ENV
which contains $(HOST_GO_COMMON_ENV).

HOST_GO_COMMON_ENV, set in go/go.mk@23,i already contains
GOFLAGS="-mod=vendor".

Signed-off-by: Patrick Gerber <pge@ik.me>
[yann.morin.1998@free.fr: extend commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mender-artifact/mender-artifact.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 1031166f34..6ade624a23 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -86,14 +86,6 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
-# By default, go will attempt to download needed modules before building, which
-# is not desirable. This behavior also causes permission issues when cleaning,
-# as go downloads modules as read-only by default. Because mender-artifact
-# includes the modules in the vendor directory, mod=vendor prevents the package
-# from downloading the go modules during the build process and prevents
-# permission issues when cleaning.
-HOST_MENDER_ARTIFACT_GO_ENV = GOFLAGS="-mod=vendor"
-
 HOST_MENDER_ARTIFACT_LDFLAGS = -X github.com/mendersoftware/mender-artifact/cli.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
 HOST_MENDER_ARTIFACT_BIN_NAME = mender-artifact
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

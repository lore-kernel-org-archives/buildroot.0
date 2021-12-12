Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9B3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3422083F6D;
	Sun, 12 Dec 2021 22:23:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffLX8qsEwtuX; Sun, 12 Dec 2021 22:23:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9445183E9E;
	Sun, 12 Dec 2021 22:23:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 060F81BF97A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBEFD60E83
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qux9I4evP63O for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DDFD60ECB
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 82E00836B9; Sun, 12 Dec 2021 22:18:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:15:47 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 82db9f487f6569e0960df87955e721a9f643ee64
X-Git-Newrev: 2b92adc6d6a3358b4569f1ee198b19b15a6957bb
X-Patchwork-Hint: ignore
Message-Id: <20211212221808.82E00836B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] core/show-info: 'name'
 only applies to packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b92adc6d6a3358b4569f1ee198b19b15a6957bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit 0cfa1659487f (package/pkg-utils.mk: introduce "name" field in
show-info output) did what it said, but did so in the generic show-info
part, thus it was also added to filesystems (rootfs), the other kind of
entity that show-info reports on.

Only packages have a "name"; filesystems do not. Instead, they already
have an 'image_name'.

Move the 'name' field to the package-related part of show-info.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 471ecea5eeb053d7bd956c8ff7605bd015b24b51)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 5f9a5739e4..3d87f4851b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -96,7 +96,6 @@ endef
 # $(1): upper-case package or filesystem name
 define json-info
 	"$($(1)_NAME)": {
-		"name": "$($(1)_RAWNAME)",
 		"type": "$($(1)_TYPE)",
 		$(if $(filter rootfs,$($(1)_TYPE)), \
 			$(call _json-info-fs,$(1)), \
@@ -108,6 +107,7 @@ endef
 # _json-info-pkg, _json-info-pkg-details, _json-info-fs: private helpers
 # for json-info, above
 define _json-info-pkg
+	"name": "$($(1)_RAWNAME)",
 	$(if $($(1)_IS_VIRTUAL), \
 		"virtual": true$(comma),
 		"virtual": false$(comma)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

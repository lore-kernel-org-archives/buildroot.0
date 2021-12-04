Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F041BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 19:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8C46401F4;
	Sat,  4 Dec 2021 19:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wu8chsYqVCgs; Sat,  4 Dec 2021 19:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A407340179;
	Sat,  4 Dec 2021 19:10:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A42C1BF3D0
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 19:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D2444010A
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 19:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwVu7RFejAAI for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 19:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B700C40179
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 19:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CC6A58DAC2; Sat,  4 Dec 2021 19:04:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 20:09:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cba51c7f5af35bf00a09b7035cae525f5791879c
X-Git-Newrev: 471ecea5eeb053d7bd956c8ff7605bd015b24b51
X-Patchwork-Hint: ignore
Message-Id: <20211204190452.CC6A58DAC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] core/show-info: 'name' only applies to
 packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=471ecea5eeb053d7bd956c8ff7605bd015b24b51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b2f0b8cebf..973eabe437 100644
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

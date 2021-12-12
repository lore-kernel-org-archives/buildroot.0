Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA08C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 042C040943;
	Sun, 12 Dec 2021 22:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETJ2vCGKejHX; Sun, 12 Dec 2021 22:27:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0EDC4094F;
	Sun, 12 Dec 2021 22:27:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAF341BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C55804094E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZAJ-r-fEukK for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DABF84063A
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3BD2A83654; Sun, 12 Dec 2021 22:18:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:08:37 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 72f37850f6e1685cb2478371062736d2734e7c2a
X-Git-Newrev: 745a763e433467991bbacc6da07517c292e46442
X-Patchwork-Hint: ignore
Message-Id: <20211212221828.3BD2A83654@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] core/show-info: report
 build_dir relative to CONFIG_DIR
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

commit: https://git.buildroot.net/buildroot/commit/?id=745a763e433467991bbacc6da07517c292e46442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Currently, the build_dir field is reported relative to $(BASE_DIR), to
avoid leaking local paths.

However, BASE_DIR is not a directory that is very convenient: for
in-tree builds, it is $(CONFIG_DIR)/output/, while for out-of-tree
builds, it is $(CONFIG_DIR). This difference is purely an idiosyncracy
of how out-of-tree builds have been implemented in Buildroot, and is
not under the control of the user.

What the user is in control of, however, is where the .config file is
located. This, really, is the directory we should base relative paths
on.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 76c4df324d3eb2af9dde3ffdbb79ee54ffbaa73e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ae3c7f9da9..b2f0b8cebf 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -113,7 +113,7 @@ define _json-info-pkg
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
-	"build_dir": "$(patsubst $(BASE_DIR)/%,%,$($(1)_BUILDDIR))",
+	"build_dir": "$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))",
 	$(if $(filter target,$($(1)_TYPE)), \
 		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
 		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

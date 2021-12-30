Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35105C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4063405CE;
	Thu, 30 Dec 2021 20:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDGiKvE25Cf4; Thu, 30 Dec 2021 20:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1488405C5;
	Thu, 30 Dec 2021 20:42:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 184471BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64FE7405C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rq9WM5eZmqm for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71BFA405C6
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EA78F82A05; Thu, 30 Dec 2021 20:35:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:36:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78afad17bf576dcd469bfb51dcc4f9539612b69b
X-Git-Newrev: eb342619e1fc8aa99c3a8d91c78c81790ff1bafb
X-Patchwork-Hint: ignore
Message-Id: <20211230203553.EA78F82A05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] core/show-info: also export source and
 stamp directories in show-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb342619e1fc8aa99c3a8d91c78c81790ff1bafb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

External tools may need to peek into the source tree (to check what the
list of patches that were applied), or in the stamp directory (to check
and report on the progress of a build)

Currently, both locations are identical, but semantically different
and an internal implementation detail. Exposing both separately will
allow us to change either without breaking users' scripts. Hopefully.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0b0ff77419..38ba5bca93 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -113,6 +113,8 @@ define _json-info-pkg
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
+	"stamp_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
+	"source_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
 	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),
 	$(if $(filter target,$($(1)_TYPE)), \
 		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

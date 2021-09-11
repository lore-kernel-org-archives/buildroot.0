Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708A1C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:56:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4205610A3
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4205610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F9860B6F;
	Sat, 11 Sep 2021 18:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIZDwHLm2LOQ; Sat, 11 Sep 2021 18:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15623608CA;
	Sat, 11 Sep 2021 18:56:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60C541BF958
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FD74401B8
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdUMdeva4tqD for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 18:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC13D400FC
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 18:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4EF4C890FF; Sat, 11 Sep 2021 18:54:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 20:47:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ecd20b16332661f77be030605e38d6d2fa9cd049
X-Git-Newrev: 97ab9ffa735c8e82a6ce05c68dade5bd13713a0e
X-Patchwork-Hint: ignore
Message-Id: <20210911185400.4EF4C890FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/gobject-introspection/g-ir-scanner-qemuwrapper.in: Fix latent bug
 if GIR_EXTRA_LIBS_PATH is empty
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=97ab9ffa735c8e82a6ce05c68dade5bd13713a0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If GIR_EXTRA_LIBS_PATH is empty, the LD_LIBRARY_PATH variable is
":.libs:$(dirname $0)/../lib:$(dirname $0)/../../lib".

As discussed with Yann Morin, add a new variable, "GOI_LIBRARY_PATH" and
prepend ${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:} to the path to fix the
above bug.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gobject-introspection/g-ir-scanner-qemuwrapper.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
index cad7ef875e..c76553515e 100644
--- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
@@ -1,5 +1,7 @@
 #!/usr/bin/env bash
 
+GOI_LIBRARY_PATH="${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:}.libs:$(dirname "$0")/../lib:$(dirname "$0")/../../lib"
+
 # Pass -r to qemu-user as to trick glibc into not errorings out if the host kernel
 # is older than the target kernel.
 # Use a modules directory which does not exist so we don't load random things
@@ -7,7 +9,7 @@
 GIO_MODULE_DIR=$(dirname $0)/../lib/gio/modules-dummy \
 @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
 -L $(dirname $0)/../../ \
--E LD_LIBRARY_PATH=${GIR_EXTRA_LIBS_PATH}:.libs:$(dirname $0)/../lib:$(dirname $0)/../../lib \
+-E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
 "$@"
 
 if [[ $? -ne 0 ]]; then
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

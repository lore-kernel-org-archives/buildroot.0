Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE6AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9D74402D0;
	Thu, 30 Dec 2021 20:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTtDvo9klLTe; Thu, 30 Dec 2021 20:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC355405C2;
	Thu, 30 Dec 2021 20:17:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 936BC1C1135
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8141E60C0F
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HYHRVGmL_Dw4 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:17:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3E58606A0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:17:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1B8CB82945; Thu, 30 Dec 2021 20:11:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:15:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5d2c379ebf552cd7f60b5e2bde10c34b993834c
X-Git-Newrev: eae438fccf32722c6d38b859fdd76739b35e2cb2
X-Patchwork-Hint: ignore
Message-Id: <20211230201108.1B8CB82945@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neard: fix autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=eae438fccf32722c6d38b859fdd76739b35e2cb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.18 in
commit 81d14a86258592b66b3cb170cda554a1eabf2c3f:

aclocal: error: couldn't open directory 'm4': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/f8e26416e38c83e27e7945343f497a6c9310bfcf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/neard/neard.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 1ab3aa353e..51ba52fb90 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -15,6 +15,14 @@ NEARD_AUTORECONF = YES
 NEARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 NEARD_CONF_OPTS = --disable-traces
 
+# Autoreconf is missing the m4/ directory, which might actually be missing
+# iff it was the first argument, but unfortunately we are overriding the
+# first include directory above. Thus we need that hook here.
+define NEARD_CREATE_M4
+	mkdir -p $(@D)/m4
+endef
+NEARD_POST_PATCH_HOOKS += NEARD_CREATE_M4
+
 ifeq ($(BR2_PACKAGE_NEARD_TOOLS),y)
 NEARD_CONF_OPTS += --enable-tools
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

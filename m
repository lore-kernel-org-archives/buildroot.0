Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C60C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 19:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A7941685;
	Thu, 23 Feb 2023 19:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A7941685
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mC0lekGnp5nr; Thu, 23 Feb 2023 19:11:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24A9F41679;
	Thu, 23 Feb 2023 19:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A9F41679
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9E4F1BF97F
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A246540126
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A246540126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWn9I_aUgKew for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 19:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D791D400C8
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 19:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D791D400C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C506F8694D; Thu, 23 Feb 2023 19:09:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 20:08:49 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3f5a9f375ecbe6adf83966e646f460f12ccac54f
X-Git-Newrev: 421f58cfa996a27d85b01775521b3c52125de264
X-Patchwork-Hint: ignore
Message-Id: <20230223190957.C506F8694D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkg-generic.mk:
 only check for virtual package conflicts when building
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

commit: https://git.buildroot.net/buildroot/commit/?id=421f58cfa996a27d85b01775521b3c52125de264
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The configuration checks should only be done when building so that
make allyespackageconfig && make source works.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7231701a290ba447fde9807ba9d260022ddfc8e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a88934b866..6c3b64b4c8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1182,10 +1182,12 @@ ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 # Ensure the calling package is the declared provider for all the virtual
 # packages it claims to be an implementation of.
+ifeq ($(BR_BUILDING),y)
 ifneq ($$($(2)_PROVIDES),)
 $$(foreach pkg,$$($(2)_PROVIDES),\
 	$$(eval $$(call virt-provides-single,$$(pkg),$$(call UPPERCASE,$$(pkg)),$(1))$$(sep)))
 endif
+endif
 
 # Register package as a reverse-dependencies of all its dependencies
 $$(eval $$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

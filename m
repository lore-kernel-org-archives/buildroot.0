Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05637C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A38B881DFB;
	Tue,  7 Feb 2023 13:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A38B881DFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_1suGbtT1uP; Tue,  7 Feb 2023 13:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D926781DF0;
	Tue,  7 Feb 2023 13:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D926781DF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01D571BF376
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFEFA60F58
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFEFA60F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-ZWCvoTjV7s for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E243160F4E
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E243160F4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0949841B7; Tue,  7 Feb 2023 13:52:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 14:52:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 509956da4cdba6a76214322b1ace979bbe6cd6a8
X-Git-Newrev: 7231701a290ba447fde9807ba9d260022ddfc8e4
X-Patchwork-Hint: ignore
Message-Id: <20230207135235.D0949841B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: only check for
 virtual package conflicts when building
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

commit: https://git.buildroot.net/buildroot/commit/?id=7231701a290ba447fde9807ba9d260022ddfc8e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configuration checks should only be done when building so that
make allyespackageconfig && make source works.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2f8ba39edf..5d618c6b39 100644
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

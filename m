Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E90C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 22:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D007F414B6;
	Thu, 10 Aug 2023 22:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D007F414B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvMg-BMfePdT; Thu, 10 Aug 2023 22:09:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DCA940A70;
	Thu, 10 Aug 2023 22:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DCA940A70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8081BF83B
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 123D941DE9
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 123D941DE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEeKnY7MHiNm for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 22:09:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D89B741DDD
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 22:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89B741DDD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4A2A85A78; Thu, 10 Aug 2023 22:09:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 00:08:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 21d5d592a427686b3421d694a50dd96004d23ce8
X-Git-Newrev: 94eb10b937a1d7dd116319a7d352ad99e20b5ea0
X-Patchwork-Hint: ignore
Message-Id: <20230810220925.C4A2A85A78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-generic: add check
 for deprecated _INSTALL_HOST_OPTS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94eb10b937a1d7dd116319a7d352ad99e20b5ea0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit "f6fe8932df pkg-generic: add checks on deprecated variables
FOO_BAR_OPT" introduced checks for deprecated variables, and warns the
user to use _INSTALL_HOST_OPTS instead of _INSTALL_HOST_OPT.

Commit "6a25cec33d package/pkg-cmake.mk: rename _INSTALL_HOST_OPTS ->
_INSTALL_OPTS" removed the usage of _INSTALL_HOST_OPTS but didn't add a
check for the deprecated variable.

Add a warning to change _INSTALL_HOST_OPTS to _INSTALL_OPTS.
And change the warning for _INSTALL_HOST_OPT to also suggest
_INSTALL_OPTS.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 86b9c1f9d3..820d2fd494 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1212,7 +1212,8 @@ $(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
-$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPTS,$(2)_INSTALL_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

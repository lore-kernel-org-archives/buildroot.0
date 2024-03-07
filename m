Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591EBC48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 13:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 221848216D;
	Thu,  7 Mar 2024 13:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AwgR9ZtqtQCC; Thu,  7 Mar 2024 13:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30987821AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30987821AE;
	Thu,  7 Mar 2024 13:11:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C121C1BF5A4
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 13:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB6C241981
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 13:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0TSMUSSzIZ7O for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 13:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00BFC40BB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00BFC40BB2
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 13:11:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDC5F881BB; Thu,  7 Mar 2024 13:11:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Mar 2024 14:05:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8db5c466046dc2f3d9c411e6c9924667dd1a40c
X-Git-Newrev: 6b56e0b4f09b36140e2cb9e41072d5ac6074f375
X-Patchwork-Hint: ignore
Message-Id: <20240307131151.DDC5F881BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: disable -Werror
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
Content-Type: multipart/mixed; boundary="===============1841190870630993377=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1841190870630993377==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6b56e0b4f09b36140e2cb9e41072d5ac6074f375
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror to fix the following build failure with esp-hosted
raised at least since commit a382a7d55432918d2a1e47ae4cbe7ed50fa17a08:

In function ‘destroy_cmd_wq’,
    inlined from ‘esp_commands_teardown’ at /home/autobuild/autobuild/instance-4/output-1/build/esp-hosted-ce3c50a33fa4bc562a1b6cbcee292c1ae0b0a404/esp_hosted_ng/host/esp_cmd.c:1467:2:
./include/linux/workqueue.h:639:9: error: call to ‘__warn_flushing_systemwide_wq’ declared with attribute warning: Please avoid flushing system-wide workqueues. [-Werror=attribute-warning]
  639 |         __warn_flushing_systemwide_wq();                                \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/autobuild/autobuild/instance-4/output-1/build/esp-hosted-ce3c50a33fa4bc562a1b6cbcee292c1ae0b0a404/esp_hosted_ng/host/esp_cmd.c:408:17: note: in expansion of macro ‘flush_scheduled_work’
  408 |                 flush_scheduled_work();
      |                 ^~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/6ac7a4601938d3296ed1657c06f8cdf433757d73
 - http://autobuild.buildroot.org/results/7997cc8a67645a6e1cf4e24d172c6feae459dcfb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 53e2ad6d48..4e12b36c1f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -436,6 +436,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 endef
 

--===============1841190870630993377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1841190870630993377==--

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A025EC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2728B4157D;
	Mon,  5 Dec 2022 12:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2728B4157D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cepPThL-SPFz; Mon,  5 Dec 2022 12:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 178F640A00;
	Mon,  5 Dec 2022 12:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 178F640A00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 119C31BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D7CF408D2
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D7CF408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VbXk8jkO_k0K for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5774D4074E
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5774D4074E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5107D85BA2; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 22:14:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb51a0c9136a8f8fea92c1c60dbf4c0e9203b2a8
X-Git-Newrev: 3d6aa73ada756b8291a16413b36a952a8d93225d
X-Patchwork-Hint: ignore
Message-Id: <20221205112609.5107D85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-modules: enable
 CONFIG_FTRACE in kernel configuration
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
Content-Type: multipart/mixed; boundary="===============0133497487833366920=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0133497487833366920==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3d6aa73ada756b8291a16413b36a952a8d93225d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of lttng-modules will fail if the kernel does not have
CONFIG_TRACEPOINTS enabled. However, CONFIG_TRACEPOINTS is a
prompt-less option, and the most generic option that does enable
CONFIG_TRACEPOINTS is CONFIG_FTRACE.

In addition, CONFIG_FTRACE will also enable CONFIG_STACKTRACE, which
is needed on CPU architectures that don't provide the STACKWALK
mechanism in the kernel, as is the case on ARM 32-bit for example.

Therefore, let's enable CONFIG_FTRACE when building lttng-modules.

Cc: Clément Léger <clement.leger@bootlin.com>
Reported-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-modules/lttng-modules.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index d527bc19ef..97cda53f08 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -14,6 +14,7 @@ LTTNG_MODULES_MODULE_MAKE_OPTS = CONFIG_LTTNG=m CONFIG_LTTNG_CLOCK_PLUGIN_TEST=m
 
 define LTTNG_MODULES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_KPROBES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
 endef
 
 $(eval $(kernel-module))

--===============0133497487833366920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0133497487833366920==--

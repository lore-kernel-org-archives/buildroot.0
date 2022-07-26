Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B179DC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 474838137E;
	Tue, 26 Jul 2022 19:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 474838137E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vO-2_Kpk2FKk; Tue, 26 Jul 2022 19:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63EF281377;
	Tue, 26 Jul 2022 19:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63EF281377
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCE8B1BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E6E9400F3
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E6E9400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFgG_Pdrqrit for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:57:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD0AB40012
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD0AB40012
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6178085F9C; Tue, 26 Jul 2022 19:43:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 21:53:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c47efafc2fd896d5a3b74980f5d9b5793cd4037
X-Git-Newrev: fb51422780bf685303fbf412cc08fe38b16d9ea8
X-Patchwork-Hint: ignore
Message-Id: <20220726194331.6178085F9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in: add new option BR2_ENABLE_LTO
 to globally enable LTO
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb51422780bf685303fbf412cc08fe38b16d9ea8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages have a configure option to enable LTO. Add a global option
to enable/disable this in packages.

Note that we could instead (or in addition) pass -flto directly to the
compiler in the toolchain wrapper, but that has a *much* bigger impact,
so for the time being let's not do that.

No toolchain dependency is added for this, because all toolchains now
support LTO.
- LTO support was merged in GCC years before 4.6 (our minimal version)
  was released.
- Our oldest external toolchain, Sourcery ARM 2014.05, has LTO support.
- For our internal toolchains, it is supposedly regulated by
  BR2_GCC_ENABLE_LTO. However, that option only *enables* it - it
  doesn't disable LTO support when it's not provided. Since LTO support
  defaults to enabled for a long time already in GCC, in practice all
  Buildroot-generated toolchains do support LTO.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Config.in b/Config.in
index af9052d32b..4833379543 100644
--- a/Config.in
+++ b/Config.in
@@ -551,6 +551,25 @@ config BR2_OPTIMIZE_FAST
 
 endchoice
 
+config BR2_ENABLE_LTO
+	bool "build packages with link-time optimisation"
+	help
+	  Enable the link-time optimisation (LTO) option when building
+	  packages. Link-time optimisation re-runs optimisations at
+	  link time, which allows the compiler to do interprocedural
+	  analysis across compilation units and thus come with better
+	  results: smaller size and better performance.
+
+	  Note that this analysis is limited to statically linked
+	  object files and libraries.
+
+	  This option may significantly increase build times,
+	  sometimes 5 times longer, with only limited gains.
+
+	  At this time, this option only enables LTO in packages that
+	  have an explicit configuration option for it. Other packages
+	  always enable LTO, but most packages never enable LTO.
+
 config BR2_GOOGLE_BREAKPAD_ENABLE
 	bool "Enable google-breakpad support"
 	depends on BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

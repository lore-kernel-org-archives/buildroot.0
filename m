Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3356ECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66C65405DC;
	Mon,  5 Sep 2022 20:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66C65405DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hhijsl0SABas; Mon,  5 Sep 2022 20:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D22C4047B;
	Mon,  5 Sep 2022 20:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D22C4047B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE74A1BF337
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 20:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C63B560BDF
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 20:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C63B560BDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scddhog4MbSG for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 20:14:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E53360A88
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 20:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E53360A88
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4476B88259; Mon,  5 Sep 2022 19:59:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Sep 2022 22:11:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7713f6dd98946ffecc11b0a91a444fb639d45d7b
X-Git-Newrev: 286928d9b52ffb9a1f1884a209252f1c5bb0aa1f
X-Patchwork-Hint: ignore
Message-Id: <20220905195916.4476B88259@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: perf: add
 host-python3 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=286928d9b52ffb9a1f1884a209252f1c5bb0aa1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linux kernel commit 00facc760903 ("perf jevents: Switch build to use
jevents.py") switched to auto-generation of arch-specific PMU events
using python script. Now custom PMU events for different platforms of
the selected target architecture are not embedded into perf binary if
an appropriate host python interpreter is not present. In practice it
means that perf is successfully built, but 'perf list pmu' will show
no custom events on a target platform even if those events are supported
and properly defined in tools/perf/pmu-events/arch/<target arch>
directory in the kernel source tree.

Since building host-python3 is not instantaneous, add a config option,
like we have in the kernel for a bunch of host packages, to id=ndicate
that host-python3 is required, and only add the dependency in that case.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[yann.morin.1998@free.fr:
  - add BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
  - extend commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-tools/Config.in             | 7 +++++++
 package/linux-tools/linux-tool-perf.mk.in | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 10b6538a59..253a8593b9 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -92,6 +92,13 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
 	  enables zooming into DSOs and threads as well as other
 	  features.
 
+config BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
+	bool "perf need python3 to build"
+	select BR2_PACKAGE_HOST_PYTHON3
+	help
+	  Starting with linux 6.0, parts of the perf source code
+	  is generated by running a python3 script.
+
 endif
 
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 057c6f80e7..dda63cccec 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -8,6 +8,10 @@ LINUX_TOOLS += perf
 
 PERF_DEPENDENCIES = host-flex host-bison
 
+ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3),y)
+PERF_DEPENDENCIES += host-python3
+endif
+
 ifeq ($(NORMALIZED_ARCH),x86_64)
 PERF_ARCH=x86
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D496C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D089B40C65;
	Sat, 14 May 2022 09:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtCK4Q6xYmaB; Sat, 14 May 2022 09:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6B4940A62;
	Sat, 14 May 2022 09:51:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9CF71BF947
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3696F60F0F
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4gsK5_9MN3l for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78C9260F11
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 26F0C83769; Sat, 14 May 2022 09:39:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:37:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 437d0433d36fd2e81ea9a2fd2d5018bf56e3df8e
X-Git-Newrev: 0502c927f6bacf21dc68a80fe4b967ee14d9bd6c
X-Patchwork-Hint: ignore
Message-Id: <20220514093944.26F0C83769@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pciutils: fix build with older
 binutils
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

commit: https://git.buildroot.net/buildroot/commit/?id=0502c927f6bacf21dc68a80fe4b967ee14d9bd6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to workaround binutils bug gas/23840 in versions older than
2.35. The patch is not upstreamable, but the issue is reported upstream.

  https://lore.kernel.org/linux-pci/87mtfm7v58.fsf@tarshish/

Fixes:
http://autobuild.buildroot.net/results/1c9988105b64594185a4002ca046aec8b87ea141/
http://autobuild.buildroot.net/results/68a2fcc8a4505bb65b7d7c8cb8b3726da1a077fa/
http://autobuild.buildroot.net/results/e4cbdecf352dabdb9589b9a6a9f98d81878c341b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...karound-build-failure-with-older-binutils.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch b/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch
new file mode 100644
index 0000000000..1590bc19c5
--- /dev/null
+++ b/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch
@@ -0,0 +1,57 @@
+From fda20d4bcb91f0f9d0db294b4813264de2d88866 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 12 May 2022 16:16:21 +0300
+Subject: [PATCH] Workaround build failure with older binutils
+
+binutils releases older than 2.35 are affected by bug gas/23840[1] that
+breaks the link of shared library:
+
+cc -O2 -Wall -W -Wno-parentheses -Wstrict-prototypes -Wmissing-prototypes -fPIC -fvisibility=hidden   -c -o filter.o filter.c
+/tmp/ccLtucRG.s: Assembler messages:
+/tmp/ccLtucRG.s:6: Error: multiple versions [`pci_filter_init@@LIBPCI_3.8'|`pci_filter_init@LIBPCI_3.3'] for symbol `pci_filter_init_v38'
+/tmp/ccLtucRG.s:8: Error: multiple versions [`pci_filter_parse_slot@@LIBPCI_3.8'|`pci_filter_parse_slot@LIBPCI_3.3'] for symbol `pci_filter_parse_slot_v38'
+/tmp/ccLtucRG.s:10: Error: multiple versions [`pci_filter_parse_id@@LIBPCI_3.8'|`pci_filter_parse_id@LIBPCI_3.3'] for symbol `pci_filter_parse_id_v38'
+/tmp/ccLtucRG.s:12: Error: multiple versions [`pci_filter_match@@LIBPCI_3.8'|`pci_filter_match@LIBPCI_3.3'] for symbol `pci_filter_match_v38'
+
+The symbol versioning feature has little value in the context of
+Buildroot. As a workaround remove one of each duplicated symbol.
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=23840
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: not upstreamable
+
+Upstream bug report: https://lore.kernel.org/linux-pci/87mtfm7v58.fsf@tarshish/
+---
+ lib/filter.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/lib/filter.c b/lib/filter.c
+index b881b6bc9083..bc34e8c2bab9 100644
+--- a/lib/filter.c
++++ b/lib/filter.c
+@@ -304,20 +304,16 @@ pci_filter_match_v30(struct pci_filter_v30 *f, struct pci_dev *d)
+ 
+ STATIC_ALIAS(void pci_filter_init(struct pci_access *a, struct pci_filter *f), pci_filter_init_v38(a, f));
+ SYMBOL_VERSION(pci_filter_init_v30, pci_filter_init@LIBPCI_3.0);
+-SYMBOL_VERSION(pci_filter_init_v38, pci_filter_init@LIBPCI_3.3);
+ SYMBOL_VERSION(pci_filter_init_v38, pci_filter_init@@LIBPCI_3.8);
+ 
+ STATIC_ALIAS(char *pci_filter_parse_slot(struct pci_filter *f, char *str), pci_filter_parse_slot_v38(f, str));
+ SYMBOL_VERSION(pci_filter_parse_slot_v30, pci_filter_parse_slot@LIBPCI_3.0);
+-SYMBOL_VERSION(pci_filter_parse_slot_v38, pci_filter_parse_slot@LIBPCI_3.3);
+ SYMBOL_VERSION(pci_filter_parse_slot_v38, pci_filter_parse_slot@@LIBPCI_3.8);
+ 
+ STATIC_ALIAS(char *pci_filter_parse_id(struct pci_filter *f, char *str), pci_filter_parse_id_v38(f, str));
+ SYMBOL_VERSION(pci_filter_parse_id_v30, pci_filter_parse_id@LIBPCI_3.0);
+-SYMBOL_VERSION(pci_filter_parse_id_v38, pci_filter_parse_id@LIBPCI_3.3);
+ SYMBOL_VERSION(pci_filter_parse_id_v38, pci_filter_parse_id@@LIBPCI_3.8);
+ 
+ STATIC_ALIAS(int pci_filter_match(struct pci_filter *f, struct pci_dev *d), pci_filter_match_v38(f, d));
+ SYMBOL_VERSION(pci_filter_match_v30, pci_filter_match@LIBPCI_3.0);
+-SYMBOL_VERSION(pci_filter_match_v38, pci_filter_match@LIBPCI_3.3);
+ SYMBOL_VERSION(pci_filter_match_v38, pci_filter_match@@LIBPCI_3.8);
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

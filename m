Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DF6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 13:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 880DB60E13;
	Thu, 12 May 2022 13:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id geMgsDU212z6; Thu, 12 May 2022 13:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75D4160BFF;
	Thu, 12 May 2022 13:43:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22F2A1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 13:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 202F982B1A
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 13:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qv5MXjpZAugC for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 13:43:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2035F82A28
 for <buildroot@busybox.net>; Thu, 12 May 2022 13:43:22 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 69FD7440836;
 Thu, 12 May 2022 16:42:08 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652362928;
 bh=Jd7tcSN6ynAyW5STwQB15fhDaRnWgqPDdXnypUuWcf4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jt2RaoO29oQTb6HPRKFSkjELOi3QyP71nhSO5KiT2PEYKObcFtnJsMU4pFBs0G8H8
 o78rU2CMuiD36drJehJ+shmcLmNN4kV6qhrHp1RerqIHQ+vOllrjGyewXfgASbjvS8
 Qd+IxOBEBQFHqfg7fRvKoWXQMMboOHS7Pt5Lcm7bdV4qDa1S4orReUPZhl+hrEh3B4
 gUxfVXnEne6+OQ1sOv/J/iy8rMngVKaWIT1VhycedchJPlXfTsHDUss1kwS2NXcl/n
 HMc+ygDW+4YMzp8HfoKtv1fVGTU4yIdteV1Q4Y7c4l6Od475eaw9ZFy1wYVxXiaIla
 a0UP5Qj+iDltw==
To: buildroot@busybox.net
Date: Thu, 12 May 2022 16:42:48 +0300
Message-Id: <a46ed2961169b4d53ff995fb6314f5c0a46c0b21.1652362968.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <6588b9e983ce137243bb72afad96bab8a595bf32.1652362968.git.baruch@tkos.co.il>
References: <6588b9e983ce137243bb72afad96bab8a595bf32.1652362968.git.baruch@tkos.co.il>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/pciutils: fix build with older
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch to workaround binutils bug gas/23840 in versions older than
2.35. The patch is not upstreamable, but the issue is reported upstream.

  https://lore.kernel.org/linux-pci/87mtfm7v58.fsf@tarshish/

Fixes:
http://autobuild.buildroot.net/results/1c9988105b64594185a4002ca046aec8b87ea141/
http://autobuild.buildroot.net/results/68a2fcc8a4505bb65b7d7c8cb8b3726da1a077fa/
http://autobuild.buildroot.net/results/e4cbdecf352dabdb9589b9a6a9f98d81878c341b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...nd-build-failure-with-older-binutils.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch

diff --git a/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch b/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch
new file mode 100644
index 000000000000..1590bc19c56f
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

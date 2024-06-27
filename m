Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D728CC2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 14:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E09A60E30;
	Thu, 27 Jun 2024 14:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvmVsxbSBwuz; Thu, 27 Jun 2024 14:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CA9960E3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CA9960E3A;
	Thu, 27 Jun 2024 14:59:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1E431BF20D
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 14:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FDA460E3A
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 14:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHQZOH_MNt2m for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 14:59:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41BC360E30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41BC360E30
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41BC360E30
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 14:59:30 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6A946B004FF;
 Thu, 27 Jun 2024 16:59:25 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 16:59:17 +0200
Message-ID: <20240627145917.190784-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719500367;
 bh=TTCpA4aUg/6Y+4+2TAbpGlTpu0TAkV5RMU9ixPv/KDM=;
 h=From:To:Cc:Subject:Date:From;
 b=SqFOL5svzlORV7WpKod1Hhw+lu7n+BcdvbczeTkFTU/ugPQM1F2hSSZ0ZSJxDcrBr
 2oWoKUz1h5GimIlXlDy6oN1xRSJZFLUWmucRHMYcHQ9qWMsTpzXbhP2XJ2XdsZM3e9
 M5atqrz+0AzwUstLR+//WB7LKFj22deK5/lcXWvonsF5FpvHefRqYw08wAqXROTBfV
 VUf7of9oxOnEIUr15ToeUG/IgOvedagZp8Hgq2H09EjkAULdBGPowFPL0rvrihmdui
 UnZz8Gts3/uaRYGdeb5OQM5UUlqtDInrWZQ3Ih6G065DU0cEBBW1fWES2S+Rk5rP39
 aI1MuEP922kEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SqFOL5sv
Subject: [Buildroot] [PATCH 1/1] package/libgsm: update patches to be
 applied with fuzz 0
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, libgsm fails to build with output:

    Applying 0001-misc-fixes-from-archlinux.patch using patch:
    patching file Makefile
    Hunk #2 FAILED at 96.
    Hunk #7 FAILED at 424.
    2 out of 8 hunks FAILED -- saving rejects to file Makefile.rej

This commit refreshes the package patch on the current package version.

Fixes:
- http://autobuild.buildroot.org/results/b27/b271ade6069fd25c1877e1e74648d92e88c459c4

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...h => 0001-Misc-fixes-from-Archlinux.patch} | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)
 rename package/libgsm/{0001-misc-fixes-from-archlinux.patch => 0001-Misc-fixes-from-Archlinux.patch} (88%)

diff --git a/package/libgsm/0001-misc-fixes-from-archlinux.patch b/package/libgsm/0001-Misc-fixes-from-Archlinux.patch
similarity index 88%
rename from package/libgsm/0001-misc-fixes-from-archlinux.patch
rename to package/libgsm/0001-Misc-fixes-from-Archlinux.patch
index 11c529b5097..6702a920aff 100644
--- a/package/libgsm/0001-misc-fixes-from-archlinux.patch
+++ b/package/libgsm/0001-Misc-fixes-from-Archlinux.patch
@@ -1,4 +1,4 @@
-From e8f43832d401ad1e071e6860b2bf4a1e796d4356 Mon Sep 17 00:00:00 2001
+From ef88ee98855008cd8c8de807a12917a556e2ce7d Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Fri, 28 Jul 2017 08:18:22 -0400
 Subject: [PATCH] Misc fixes from Archlinux
@@ -11,12 +11,15 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Refresh for 1.0.17
 [Fabrice: refresh for 1.0.22]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Julien: regenerate with git format-patch for 1.0.22,
+as Fabrice refresh is incomplete for applying with fuzz 0]
 ---
- Makefile | 84 ++++++++++++++++++++++++++++++++--------------------------------
- 1 file changed, 42 insertions(+), 42 deletions(-)
+ Makefile | 49 ++++++++++++++++++++++++-------------------------
+ 1 file changed, 24 insertions(+), 25 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index d5c0c90..ef61bd5 100644
+index 2ad5e5d..2cb0b06 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -44,7 +44,7 @@ WAV49	= -DWAV49
@@ -36,7 +39,7 @@ index d5c0c90..ef61bd5 100644
 +LN		= ln -s -f
  BASENAME 	= basename
  AR		= ar
- ARFLAGS	= cr
+ ARFLAGS		= cr
 @@ -139,7 +139,7 @@ LFLAGS	= $(LDFLAGS) $(LDINC)
  
  # Targets
@@ -97,16 +100,16 @@ index d5c0c90..ef61bd5 100644
  
  
  # The local bin and lib directories
-@@ -425,7 +425,7 @@ semi-clean:
+@@ -425,7 +424,7 @@ semi-clean:
  			-print | xargs rm $(RMFLAGS)
  
  clean:	semi-clean
 -		-rm $(RMFLAGS) $(LIBGSM) $(ADDTST)/add		\
 +		-rm $(RMFLAGS) $(LIBGSMSO)* $(ADDTST)/add		\
  			$(TOAST) $(TCAT) $(UNTOAST)	\
- 			$(ROOT)/gsm-1.0.tar.Z
+ 			$(ROOT)/gsm-1.0.tar.gz
  
-@@ -473,22 +473,22 @@ $(ADDTST)/add:	$(ADDTST)/add_test.o
+@@ -473,22 +472,22 @@ $(ADDTST)/add:	$(ADDTST)/add_test.o
  $(TST)/test-result:	$(TST)/lin2cod $(TST)/cod2lin $(TOAST) $(TST)/run
  			( cd $(TST); ./run ) 
  
@@ -140,5 +143,5 @@ index d5c0c90..ef61bd5 100644
 -				$(TST)/cod2lin.o $(LIBGSM) $(LDLIB)
 +				$(TST)/cod2lin.o $(LIBGSMSO) $(LDLIB)
 -- 
-2.13.3
+2.45.2
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

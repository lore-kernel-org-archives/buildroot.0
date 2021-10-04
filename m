Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB19C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:16:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7436D61381
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7436D61381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BCF1427A2;
	Mon,  4 Oct 2021 11:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdNU21dZ-47j; Mon,  4 Oct 2021 11:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A171C427BF;
	Mon,  4 Oct 2021 11:16:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D6921BF34A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B30161B5D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSaHPVYXJRBb for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 11:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EBC161B6E
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 11:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1978F8DC74; Mon,  4 Oct 2021 11:12:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 13:08:38 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6fcaf8b45e8341f7cf0f30c520d49cbb86c9e8db
X-Git-Newrev: 9b4544d49d32d424f2760470e2b30e1c6cee2650
X-Patchwork-Hint: ignore
Message-Id: <20211004111234.1978F8DC74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/strongswan: fix
 broken dependency relation
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b4544d49d32d424f2760470e2b30e1c6cee2650
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The AKA backend for 3GPP2 requires libgmp (see
https://wiki.strongswan.org/projects/strongswan/wiki/Autoconf). Since
the AKA backend for 3GPP2 is included by BR2_PACKAGE_STRONGSWAN_EAP,
when selecting a crypto backend different from
BR2_PACKAGE_STRONGSWAN_GMP, there is no guarantee the gmp package is
selected as well. When doing so, make fails since the package is in the
dependency chain but not selected:

  $ make
  Makefile:585: *** gmp is in the dependency chain of strongswan that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
  make: *** [Makefile:23: _all] Error 2

To fix this, select BR2_PACKAGE_GMP when selecting BR2_PACKAGE_STRONGSWAN_EAP.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 363613a698ab1c6bab6b000e964f9c68ba4a552d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 47c7107f59..368cd1ecc0 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -75,6 +75,7 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
 
 config BR2_PACKAGE_STRONGSWAN_EAP
 	bool "Enable EAP protocols"
+	select BR2_PACKAGE_GMP
 	help
 	  Enable various EAP protocols:
 	    - mschapv2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

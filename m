Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF129C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:15:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8004161373
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8004161373
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2E54279E;
	Mon,  4 Oct 2021 11:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8FlWIO80lwG; Mon,  4 Oct 2021 11:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5556427AD;
	Mon,  4 Oct 2021 11:15:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B15631BF34A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A05144052E
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B5SrRGbCt76G for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 11:14:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CFC2405F9
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 11:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1C7308DC45; Mon,  4 Oct 2021 11:12:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 13:08:48 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 895e53923780dbf9f79ddeafbf10997a577bf2bf
X-Git-Newrev: b5f184d898972edfcb1ffdcb2f197c76c33ffaf7
X-Patchwork-Hint: ignore
Message-Id: <20211004111222.1C7308DC45@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/strongswan: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5f184d898972edfcb1ffdcb2f197c76c33ffaf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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

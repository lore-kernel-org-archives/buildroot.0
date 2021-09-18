Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE25C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:11:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF8B61051
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DF8B61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29C4C83F55;
	Sat, 18 Sep 2021 21:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYUXF_KNes2w; Sat, 18 Sep 2021 21:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CA6E83F46;
	Sat, 18 Sep 2021 21:11:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB82B1BF842
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB35783F46
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSAZ2Yq-v1AG for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 21:11:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE0A883F43
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 21:11:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B962B8B707; Sat, 18 Sep 2021 21:09:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 23:06:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: deb6389ea7c47f646eae218c1eac1d015492864f
X-Git-Newrev: 363613a698ab1c6bab6b000e964f9c68ba4a552d
X-Patchwork-Hint: ignore
Message-Id: <20210918210937.B962B8B707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: fix broken dependency
 relation
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=363613a698ab1c6bab6b000e964f9c68ba4a552d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

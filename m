Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5E2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:00:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 116F061166
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 116F061166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFD6F80CC1;
	Tue, 14 Sep 2021 21:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyaagSGqgWXs; Tue, 14 Sep 2021 21:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 281B880C95;
	Tue, 14 Sep 2021 21:00:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0675B1BF39A
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4608402C6
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKgdtFcjRXr8 for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 21:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACA6E402B2
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 21:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631653237;
 bh=tflo/oT2mkbN7an2j808BhIWkq5wqq+MBqd7a61ffvk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=JSdrq9V0HpG4SHAQGjhFJTPZhqFNbKbkg1FuC6Vr3f70srmy3cZ4rpTkXOeGXzuzT
 fBsZNjSzob0jnvv8DLCN7FSun1y+hvtsNOphtfPIEqWEowAPya+Jk50byDJu9qeYaC
 tYxd+n21bXPPj8dkW84b7KBnDGxoQG7sGhw8y5O8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M9Wuq-1mVlJZ2xc4-005bFb; Tue, 14 Sep 2021 23:00:37 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 23:00:34 +0200
Message-Id: <20210914210036.29189-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:h0Z8aVVbm7LkggR27VHV3uHUskXedTj66IjZQjQa7nX3Rl5hFM+
 QbntUdfh0rcd+JqQeuJMB0RwE9Iz1GodYYTBEE0SZXugGRWBSOadPkhNNDxXFBxkaBSJYVh
 /Us98LP6iawSTG2J7VlXEmHmYa73/g/x62F8fBawD/hbYrMxPaO/ifsOoTVKqrZHvWELSAN
 MRK3wIjydFik/fb7ezU6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:acQ1vdPlyvI=:aRwEGoMiuu7Q40WNloArDl
 LleyBocIhJSoEAW3LYKvL7RItO0KU8KUdvifDdbeRXCkY4VVtN+WfqSEd/IGXUK0vL2sUcdN9
 ObGfux3ENEOOFF7RWBalMSCq5+NN0RtxtijYMtrHUtr6YD4VTh8ZmJlWsYB7Vg4RXjf8x8YTL
 CWw9mS3KXBloPBOaC4x1AMOJu4iJQ7WAcUmutjskZDXBZdl4REnDrtWnNl0rqkVRhXpI1dHjN
 /QH1tldh8tEgzEo0JXYcP4JFhrUgQBaGt962FBgzd55VnMSs//WVL04xhGhEbR1ScHz64E1zC
 HlyAv0i4eNBIqMGHXaU+sRIglQ1ddZD43a73hQIcu0Oux1dxKlct/pyov0+8uyuWnzPeFM2w6
 HDJGrgPc9C207jR47DhNCUZeWRklWdU170Vq7tVyEwfecbKvY94mkWwJE1spqULjRT8cCNQ9P
 bowP4y2m4F8zRyUz6aKUrCrmFBa9ofbnyhZce/UGlRhw9DXYTcs6pHEQQ+XmP6ZVm52hVLhS+
 DMXEIb619agLWkkME3S8FYMM1t6TizYY9t66K7VsZlVva+IBxg5lWT+JNV7Qe3VnEs8c4EPA4
 UTfmu/UAdzSZwS6SSwapL6jKRpxLkZ55lnSzg8AxIQwFzgo4QYH84KqKR4GywgAiKnqAWHuhQ
 X7iaghCHgWc46LPDBEIc0n1n6VDrHFjJ3khVUTOe6++5XV+bGqWskjxrEszaPV0QgWxA8AYdu
 w1PqMraXFXbqBNsU4bSVIOtY5ilalbnVYquDYBmH8PKcB33pgHmoUM4SDYHLjh/5LE3ek3smN
 ZHKbc2Enh1L8G4hYK7gyt2X/uXpPb3Px2LOeHmjq9zyu/n1MtVGbMGDkYUSYrD9BtY0BVjW8x
 qzL6G07scUiOiqVuPkHPt+XNDZgC3HX7s5VXeoFAGOPlOsoe/KDWvsLRIbU9QMxLR32jjZQYX
 9C2tUf9Gga63IZdw/RZBcwYQkf0Jl0GlbK9u3kcuTzeyaRTd1WOG/70OPQ3k9Wli+v9ehz7d6
 gYsU4HfV6qH7ovL5KLMDu8TmXAkOAdt91zQqoR3FbiMKm2/X8YKi916eClNY+OYnaLTjG6cXD
 oCvdZo/zdT7B8I=
Subject: [Buildroot] [PATCH v1 1/3] package/ell: bump version to 0.43
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Changelog (since 0.41, from [1]):

  ver 0.43:
    Add support for DHCP Rapid Commit feature.
    Add support for DHCP authoritative mode feature.

  ver 0.42:
    Add support for constant time security functions.
    Add support for manipulating DHCP leases.

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 2ff8889506..316d3fb81d 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  4e8dba6c53cf152dbd0fd1dc3d4c7b04abf79e20a948895f85943e586870505c  ell-0.41.tar.xz
+sha256  b6c75895ad64bf78f5b5c464de871048d02f9403be518084e0d64b58f508c9fc  ell-0.43.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index ec31e68088..261dc1a6db 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.41
+ELL_VERSION = 0.43
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

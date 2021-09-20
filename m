Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CEDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 18:44:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A95861252
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 18:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A95861252
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9EB26062C;
	Mon, 20 Sep 2021 18:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bGbFJxpvXEzt; Mon, 20 Sep 2021 18:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C8C4605EA;
	Mon, 20 Sep 2021 18:44:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 938C31BF23C
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 18:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81BE240398
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 18:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6HZ_2b-O3V2 for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 18:44:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B06D3403BA
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 18:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632163456;
 bh=unFu6ZiJxO4cDlGCRAli2LzEM9N3+0CRhNAdUpjzihw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=G5i4BalCCtPC2OP2txF5xUo6rDjbjuMF/SqAOayHKblZHUrbm6ubiF6UC5ryoMc/G
 BHrWSnTs7517D6w5Q63er+PE4HJFQsv/XeoluYtAZf4te30Cv5sMCFwB2f+EQMUPwN
 fzgvE6bIMfvb2SQIwcNMWs80FGYPoNGiy7yY2Gkk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.129]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MWAOW-1mMIQs1AxG-00XeOL; Mon, 20 Sep 2021 20:44:16 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 20:44:14 +0200
Message-Id: <20210920184415.13599-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:bPeezbQWb9upfMyfhRpFBl6afO7tOFqjK2HEO2UhPQnK3+Es3uT
 rBfdS0f4p6DRWCWsQ+FNk83MMz9hGKse+LmISqGwwBtpIt0dcMw82HX7lBk+dGPr9RiDNQ7
 vS6UFpkAwuYOcs/VpCzcU9OUAlCtPrmom854IkgxnKmD90jCrCTJn8YqCfhm5ZfzztrspCe
 z+hdJqhe9Wf60YT/tVz8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZD2JE0CgnDM=:h9PTYJ3LQeiBxkS5miMjy4
 IVLhq9imleyOtkdV0tiWGmzVeZzb5g+sztcEWAW0Ngazt3ISi9Fjjq+8+IcGVvZLxMxHrNALT
 /j6Cce+buaf6SxIWQGQZsH7Ra4KLL1mjGXDmuBMZarHFGGqacTtjnpWxoSsUGBtA0uLkvH55V
 Ys7xS7gZyIb0glSM1IEGZ/vXmuCMRV04ZUHHrEbmTsJgRlW2z1v++t7wjxh1aDB6suMaAwmt2
 vDT6+i1DnqPwQaIUA+8ThZyAK7H6CZxceh6Bn9MqaohaUIdR+Iww/iY78MHMg+mn4z0BWk59b
 mo11FvOzav/2X9jUtDMpVxCohhMBnLSRrm9nqYXk7lQcrcQxCq5wyJdhRHp2YTzYFkWAs0fEN
 FpuTC5atmtf4xvHGIEGxH/EzOhu8xSMueJPgJ2xOtay15074UucZrZpFRkHM9A392L7nv6nHB
 TKhvfeaA7UtOxvOvZUX2ro/9k2xvYqNNN4D1BoGtnbEqTLCFomlogAT70xKzO6bmHPMsCtRtp
 ChpUDnAHDk3mBSVWr+YMgKrS4H9omDf0Qw+K9X5ne3F9BOHR4Wxngnf5F3xu6nXcC8Z+SHRep
 cDl0wR544AVgtJiLMldeIbGWzKxf0IyHtFCfBpPsTz3mhI0YoSA6fEYDgPBCyD+GqCkUd6DYO
 dScZvYNtGrtze2G0Vzvp/Bed3S8FxbInmhRtU2YZjig7L+dYTggD32mPknV7jYBP49/jvbpUE
 nclsLnCpK2am23GvsUhpgzvDSJu0XnkyEnkeA+tvdrbMaCw4f0mb39tEyRIw+IPUgt2vWrZ7n
 /QwnoG6PCk5J9X3t/OVmeZMFmvvxqRB/n1wGxzeEMRQoCTUl9sOBOEoPtiD7WmQgVqX+P+HNH
 IAY5Fvymz8ny8Wob7e3C2cy+Bb/D91boaAjXb3XRJXphDyTA5AwiXD9dNHFzGxStF8P0sNkIm
 VF4BRfgjPr/cbzqxQtj7jPzaBISw60O6x4Ga1YgRA8r6nAo4SBfj9ufcwf0LE5/cffpH5M428
 cPjEMoGfrR263TTnLCX4YgkW7HmgYQWn1zw2qh6JsJLdzWJlrez+T+jnXnLXoBNEjTLBAkfQx
 EoPGE8YSQfwswc=
Subject: [Buildroot] [PATCH v1 1/2] package/ell: bump version to 0.44
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

- Changelog (since 0.43, from [1]):

  ver 0.44:
    Fix issue with allowing zero byte input for AEAD cipher.
    Fix issue with filling in DNS info in DHCP lease objects.
    Add support neighbor discovery utility helpers.

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 316d3fb81d..84016c0ce0 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  b6c75895ad64bf78f5b5c464de871048d02f9403be518084e0d64b58f508c9fc  ell-0.43.tar.xz
+sha256  41a6f8fa4d285b52cb7a5a87bda3e7370ecaac02d94aaa7ec1a23f0480b8bc3f  ell-0.44.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 261dc1a6db..47137e2530 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.43
+ELL_VERSION = 0.44
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

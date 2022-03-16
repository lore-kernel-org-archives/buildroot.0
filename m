Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B07C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF2F041745;
	Wed, 16 Mar 2022 21:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9J0afGTE1Bw; Wed, 16 Mar 2022 21:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 230DC4171C;
	Wed, 16 Mar 2022 21:36:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C06CC1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A45F360C15
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O41hUdbwnvfe for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C48160BFF
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466575;
 bh=opmRaH54c2+erz8x6iL9k4UtCuwi1ezkZhcFbE7jH7w=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=MrYNo8mc/igu3y6Z/IWyZs/EaZ0fUXvxWKIWHPZ4tJNOsz3v7tOz/AZa6p1+baX4w
 BawxB906Efz1qumtjPCemFwGraaxABzmkQiVllaVPHmtSHFvQHhN8UChZY4Ky9NIVd
 40+8Co3d3nRn3bvOFueM3UNzkurgsBiHZjYRQwXw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MS3ir-1nfHkK17cZ-00TUd7 for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:15 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:03 +0100
Message-Id: <20220316213614.16878-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:7obvfIDKH0bHc23D8vyPunnDw8isjgbShNKGMTU9cCSoGZK5bCr
 +Bup9/nIbWf781hkORqzK/j3Gvug/evhJQ+Nf97wb204YUxO1JE3a6/U5s/8mxh1im2OfV/
 +ayaniF9UVkA2dlLrKUHzI7fN7z/28tL+TvFJvCJtMLRuHQECX9C5KKzKlowicXYafc7cRh
 hzObjQKMXqplp4C+rCR+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PEi4PXaB81I=:BMyuszdqh6F6zqQuu5xGsH
 4jJmoo4lwNMMhoViRIY31XT30+ZJQ/oLGMg3S7iChMq31vOEICfPhVpUoGqR19PGgrPFdSmO0
 PXgIJxwj/yh680ffgYaxfEYJEt+ZuoLZ6o2oHE6seNS79QOkHg1EnHnjD1zPjAK0/iIVKmGHh
 Ij8qXTjoDSUIxtIE7UZ8z8MHEfULXRKMIrzIE8ZqWXF+KzRXZYfGgvItwytBWI/p0MQyx+4B6
 N0R4moE9IT5k8y3VChc5vAHYOLEtr1pLBYrglrY3/NVzMjZSafbsRKOfENPYULdJuEYrUXSYa
 lGa5DwxQh00XIKsMJdJXfsL8+JyHIB0vHZWxn3BnzjzHMs4JgQSyhMK5I/kRn6wtD8i4doS09
 gzVXhDh2IlMFNmKWJEjE9aAjARsVfijvCrTQ1m3W36YSsM+uqXVuVSzOPV7mM1pcGgGt2X733
 DwwGuh+lGczP7ByOjhhMn6s1IMZRkqvdRaF+2kEHiO7cVv2c0vdbvLVr3j7D+pMt5MpuWkBG8
 HcVfM2650wo9AtnNXH73AR168e3OwxSqIwUirndESeEvuz7y1p7wFWvhw1Q106IvWOxAhdEyE
 w9hUegE7bkWI2KvAikqWBtZsrfcECn1fCzO1t6PlNidpGGDdLkaifDzik/ihNRVjFzFpseoDk
 9mTNuh9EZ/+epjHlO9gtUXqpxf4St6Z1jOXkSQZL6xQBjCFKi/9LgA92ychLCi+zDCGf7M+ww
 E71fns1XJ9aE7RAsd11xIdFwFvSbJ/VO2IbI04u1Dog4dU80fkCzliIxF6BywGHV2HMgS9EcR
 6JLqrm9LNeTlMYe7/GqD20zML2186hp0xgAtRcUqCks41gMyX0nNb63ofj6Ck3afN+vgn8dZQ
 It5gGMtHHc3iSFmTIeX3PnVkKM3PpcbSkpBdC37Slw6PcqBMqSBpODmtl9grKvBSuaWN8nqVs
 DDI2EUIaA58u2QKutDqfd+tftsFYGoDtQSCo8S/yg9SJDTxqmx5mC8cZMcU55qThgD8U89kLv
 WN1/b2AlEiNHbfU+iTh3Htz8HjnzrmB05B/yl+zfqXaKQO4fCwX77QPORbYFxGudHAtSX7R9d
 P9QF5SRFQAJRBU=
Subject: [Buildroot] [PATCH v1 01/12] package/gstreamer1: bump version to
 1.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index f4a74a6125..128bb564d4 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.0.tar.xz.sha256sum
-sha256  edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db7  gstreamer-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.1.tar.xz.sha256sum
+sha256  de094a404a3ad8f4977829ea87edf695a4da0b5c8f613ebe54ab414bac89f031  gstreamer-1.20.1.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 86df5d6cf6..995c5b118b 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.20.0
+GSTREAMER1_VERSION = 1.20.1
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

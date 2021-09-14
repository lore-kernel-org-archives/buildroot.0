Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8CCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:02:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECAAC60F58
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECAAC60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97DC240193;
	Tue, 14 Sep 2021 21:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zSPM9yCE_H1; Tue, 14 Sep 2021 21:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8B9D40136;
	Tue, 14 Sep 2021 21:02:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41CBB1BF39A
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30EEC40136
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yFZY0ZC8LJQP for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 21:01:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94FFC4010F
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 21:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631653315;
 bh=78b4pQEJqpK4ArbPkJ/trSt7fNv1o+/HZAZlRLf99ZA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=SIDLKM6GiBKzV7O+RMimOMGCx3+Wu5m2SaEnAvbXAe5dD6IW00D1OjXqUGZmZuBws
 147R05LBX+mu2LUchDIWBF56UF9Vchf9cPkT2XN3u8GHR77K9jXCp9Ep7VIxIVnK+e
 WYJu8PqnzNe5lLC6TQoxHUStbxT9u2tSDiSlkHFU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N0XD2-1mnZDC3qbc-00wTC4; Tue, 14 Sep 2021 23:01:55 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 23:01:54 +0200
Message-Id: <20210914210154.29441-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:CDeIXMzSTUl6QneLZTHxZKy/S08nRRm8cWFklPPwbjE7RcP3idS
 OMuUY+c41La3ZoOyG/7WKtRoETVNWw9aZUsxgGirSe3CR1M3xfc4Eve0P83iAXyuYSfR8WY
 T+V8JYzBaXO8ShaQNuHy+axS1L1UijbGcmCGVyTMJZDtyPK7ExLHbv2SjMJ/LXBwyvdfMNx
 LDxED9CCnfnDYXSkyWVpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ofp/pZAvtzE=:9fzkpXBFRpe7HVK1sndmg9
 kW4LBdv6juEI75hDwZPVxbShfr0M5pRGZ9r0Q13/muU9rWhUBFV2wOrMVDoqITykczCK8ko/k
 jtNPB+9MePENKrVLUNIxJzgt2Gg01KF99Ou8N4ZVQvOWB9/gRLf49ZTTjjlAiwvEZrZDAd833
 jFN02gHNJ5EN53N96z7z71y+Mwk0yhDlxTGV5F++DHkgRUYPEZ66bVpC654fwVDdDU8CCUq/v
 Qlsy14DNLrQzOYaakCUq/aTIyl0wfyrln2mNn8Lhpj9TqXgO2ZlacU1o4NoE3wHMOs8/PL9VJ
 wN6aMJeHSqakevdKYPVr0vSNNfxrGh8ow28XSu7mje+Bv4u9TVWHPUlC7moBJYEwP8J5Jx6Dc
 AWdJZcVJ+67XbDI7mnFLLrzxzK5gIUoElQTU1rTthkyV+mQQIhvWTKzW02bk+aaH/JlaJ/UGx
 fgW6eiDKfLE4uONbfRdvk1eVv0GaweMDQEHb8gyBu8QXfzHoH3g4TP9y2d4oR4oiL/3C5ApJ8
 hcYjinN+ZDRXvUCReM/bSka1bnLTUldW8WMJduyTOOE1aH+aYYxN2wLaNazGx/duhnL8rW+We
 gZ8yw7RUcPLLXHXqhP2lqrlOtnlSpaeSGBpcoOAXFG55Q4hMmw5VEscDRqEBuBZwrVUQQZeh6
 pc/PrTJK2LfQwZsKfTZFxhubTQBWG3LpiweTnnp2M3I0QNYJkwbwVmQNsz4BIAYbsuSwUOMsD
 JFe3Ni+OrbL1HvFudBE1e78lKZUBP2Rqpftil49XCSk5PqJRJwQcO9BdvMwGoAkuxNDdOlbXa
 5UTzA6WJ1HU/AE0xVVl8OWB0CzI+dmI8T8N+gzBkInGclARqZwj6Q8L3LuSwXoAql7UhY8K6A
 L8z8o/JWUHai2l9irNP+Rn2Vj1Kou0o80fVCIahiKZxCZBOvHHukbea9PAImzf+Dr+BdZRkHV
 bgjQ0yCaq+ksFCyusUBrae82S7rMWIlRRYUfG4GPYIWS5q3mUG8+/avxFLBYUC05uka/OhJKr
 nX+CY2YLCyveS2E1kTf3p3S42WYdiZ2LA4UxiRw1C4qK1eX1FLcwtW6xwC/kJwom1mKZThJuM
 YXzp8up/Nz4VwU=
Subject: [Buildroot] [PATCH v1] package/libxkbcommon: bump version to 1.3.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

For details (since 1.1.0) see [1]

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-April/041762.html
[2] https://lists.freedesktop.org/archives/wayland-devel/2021-May/041816.html
[3] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041976.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libxkbcommon/libxkbcommon.hash | 4 ++--
 package/libxkbcommon/libxkbcommon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 40cad4d0b7..c00fffe706 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-March/041747.html
-sha256  412cfcca596f92914ea1a66ad244804d73a5ff20b6d86459951e7ad20576c246  libxkbcommon-1.1.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041976.html
+sha256  b3c710d27a2630054e1e1399c85b7f330ef03359b460f0c1b3b587fd01fe9234  libxkbcommon-1.3.1.tar.xz
 
 # License file:
 sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 8780706c7e..790083614f 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 1.1.0
+LIBXKBCOMMON_VERSION = 1.3.1
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

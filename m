Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EDBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 20:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA838133F;
	Mon, 13 Dec 2021 20:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-tK10a1v-_P; Mon, 13 Dec 2021 20:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 766D68133D;
	Mon, 13 Dec 2021 20:43:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F0BA1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 20:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B16260B3F
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 20:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXkFm52I2Pay for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 20:43:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF985605AE
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 20:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639427876;
 bh=ed2BH9SYunOv7mFu/153n0/W6PE7OzPRShWvjKRkrbc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Js5hs4eCsUa2BKMHqbRqCle9QBzq3Z3gs1A/y3CPmoe7N8c9KR9BhujBpkangK9Cm
 kP1EprjSYGTgZz26iC/7UFORVXMRiFkTQJa0+eeM8LSYcPmAc6j9LL48Un4CQC6YNu
 G4hm7uiZRtK98609Xdv0CPSsn6UUrequjM9LUyMA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.61]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfUe-1mqEEl3qIK-00B4ly; Mon, 13
 Dec 2021 21:37:56 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 21:37:54 +0100
Message-Id: <20211213203754.16739-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Dwk8kjfJIlUsqvuS4GIShbIPKVobhWYPPjZAo8RCgLJqwDw5CDM
 4xMi/IdJCAwbwkcp1/KnLASz95HM5+fh82zW9LTUyAPgxV0VVR5e5WSSqMflHxAEdDSiTVe
 obdHkvWEHCG+bWGNmaZ1qdDZwh42g9v54ZxP7aNZWIwENhs+T67wFvd48+caouryzzdhbxN
 fUeUlqM/UdvMPjjLOY5dw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BS6phosepbk=:G7AxaHPNfY4IdSc4nAs41M
 aIxm3anVvntjJBou9/Z07nstm1suJ5wggid0sKpzXRDCkGhJYATx9PoKSKOGpyDnxVAEjSna7
 Mff0zs0gFiQXexKfEdMP8MPFvuepLZ5rcyiKH/PaJJd7EvK7ITfEoeJTtmsXqS38Y7Meq3fAU
 c5hWj+XoldMG9tZxAIuRAXhjAEp4KwGFj5crO/0h6BAmcRE2//9TDNjXDpDyjZJCcVdzE2o95
 C9Q+3H8KYoxIvtDWYlSJR1slaJIc0ZhLZU4d0iIUAAc/ZwytuuX0wHsvJ5Rsg3V8Laji4RJkQ
 KFTWq7IA6hU/Gm34S7Yja5zdZSzQUhGZYg4HZgdF6+nCyRotJT96es2fdKrtYCjal3HsoLM+w
 0AFMVF8VbfHKmU6Ws78OTJnSucJSqfim6SGzOBRii5AVpbIU8PEMbMBkS/8oC0p25a+cSprAq
 D2YTqyoewIN1A7MgoAQj+0WaC7f2Tcn1t62FzEgts433iy8GWdH8X7l93B/kmzulicwBKIcgv
 ppSRO2iaQXiTYSVUkMDVeFCSF/5g5F7NMdTc2wPYfvV5eGKlHUfttNMmGydtEC+zXNl44iDaS
 Bb47cpx+F6sTS3H0yHJ+VchCylmWIC/iWcv/ge1ijNKp6jPTW1B0QpmF4qIrfgvGuAwvfReKw
 X0MIG5WBkdSJAarPX4RmK8b7VfDs4WMEvBVbFyq5TIJMRxSfZcrin8khXCQPfvLyESv5uIBRz
 0n8t/yuV3BcJIg2Zgcj3HGGv5pNh/Q0kVOmPjYUSqDTB8qsu7KQ79ha9Gps82+mTgiWcrc5LG
 N2xPaSniE6ARg6zfLH1XJJLUIxNz5ELiVUvlvboQaBfRoPGhNc0zc3M1JV7NM2N+Yrcgq2waE
 V0Ege2ojAdEAwm22/AdUD0U/SRzNVNo/n7axOOhaz8gxTxuxuz250EtpKq8FvivvFq5YDVSmg
 pwvK18qVpt6+frZkQSRXkJwe48gVgPjMy0Km15i6XyBXnrwDg6eaHvjJekSMtEDq9xLXnQvK7
 ctd037zmL+4uFbuMkpekRSpyQ7DEZBf2VEWNvK5FaqB93YIgpFf8B9xWdIQhJ+xf7efEUW5ea
 /1ybFnchdElFHk=
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.19.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-December/042068.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 31bf7bcf69..f18a727810 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-October/042003.html
-sha256  0fc39f0af3ee1a77c60c34bc45391a4d0879169f7c0f7bbbeb5eef590b98b883  libinput-1.19.2.tar.xz
-sha512  fc5244dc90ceb710f7b5bb76a3cafc7dd5a8d5fa05c51122412615bfc3a99435d6a1017b79c3ce73561139fc2f5959acaf16cb9500796ea2f3eb6cb95d1a1acb  libinput-1.19.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-December/042068.html
+sha256  3cae78ccde19d7d0f387e58bc734d4d17ab5f6426f54a9e8b728c90b17baa068  libinput-1.19.3.tar.xz
+sha512  f4b776d0da78c687ba21b430a04941ac6b43f68970c82ec9f7360358fdea5ed6a873948ce66a25bcdd64d4b95fa4bf705cc24dbc25c7c0f5fd2d0efbd763f298  libinput-1.19.3.tar.xz
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 055c4fc7a0..2f9c639c22 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.19.2
+LIBINPUT_VERSION = 1.19.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

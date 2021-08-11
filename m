Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AF9C4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 20:26:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76CFB6054F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 20:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76CFB6054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36B21607DB;
	Wed, 11 Aug 2021 20:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cx3pRONIeY_e; Wed, 11 Aug 2021 20:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A260C607E9;
	Wed, 11 Aug 2021 20:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4E61BF470
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 20:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AFE9607D7
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 20:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lldJgxlFtRRx for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 20:25:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 484E460798
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 20:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1628713553;
 bh=P2yP+ESh9HKF0abN+64jk1GHmGBxjFcxYe9Ai/qyZMs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=GEH/dtkYAYUQYj0KJQ/05OOs9ltMzVaBLukSKW+4NB/Uxcq3J44ivFXtqWPGQ4beU
 ecDrlYCh4Y+7ntDd6LG3q26jBuGQWDMWfO3R2Qu+l4TkO7uZPtxupRGWLT8nldd6rd
 KZO7b3fBT3cX+Qq5F42+xWTXl2s7502updzcZKfE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.65]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1nFtMH0V5s-0121Rs; Wed, 11
 Aug 2021 22:25:53 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 11 Aug 2021 22:25:52 +0200
Message-Id: <20210811202552.10671-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:KTRaIXLlIH0GK9a7Dwj4spxzv9Dm9HMtKiPng1GDX7eEolCsIbZ
 aoXeaNkRjj0ff4DDYIDpskk0s8CnlsGSfLegi/fQ593hnCpt39DeKNff6IBV2RM8oSEY8RV
 8W4ayFbarGTTVXOoLQgeMq4wF2zBanqtx9xP2FPHXZJSAdYzXRoi0z75OiQy4I+BtvwCLr9
 eGy9Weh3gUmkw9OpjjSdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ABJnC13qu5o=:iiP2rm9KqQGT77OmyP7ju6
 IkzMaypb6bSQPZxQH39n0cGoF5NsWq1CJ2xuKclVUx5lw/0QjovgxD03e1eU8ivUH5rejjuMo
 YnZLutTgnbUjOi32Ap6LeebXUcYpvIzgVD49/z5aoak3GNlgCh8b7q3BdMcQ45BuC8N+bMQmM
 pEXO8ABYSV7nLdgqjc65FHL0zjUlwymsL/m6EYZ+Hu/TF9+a/gf1ykFC+RP5ZK04gxCqJacM2
 T2o4K8fdfTeyb1peLvP7/1i4GlpCZgmAIUvp3ipPC5CdfSolyam7iBeBnw9VVVhfzV1nraumu
 aWuUpDdegSgW/+qHOD1FttFBsWqdRbDc75wBl2t2cWH80zYrGm19lVAIw4OwwvVacK5taUMkU
 32x7Huk7u7Qtj+izhRHSKTn6xt9cFzBIQsw/wiy3KBGoTD+p67/S/pXgFGzI/uP99dJCqYcs6
 tuiBrPpkDqKEh13ZjOsoELeGeZ1bwKobTQ69DSqscJHQCMTdAi/xNBREUopns0v6Hkz5iAE9w
 4O6HRpUjDyWrYecyLvS3/m/tuZDmYmU+GWhNifrWbyQn7EsYMSMjTPvisgLvP6u+DnGE2lsiY
 KMUqoVlD/XnEuaXNt1F3HWBiGSwYYd4f9FVZxvUl3U53FRSHEo8VT5urNiQikGJ3vPQYclRbw
 t77NI76TfPPyuGL01jZF7+2Nh698X8dDKOyBWpwMYCAhg/5JGQ+DaFvoBwSkc9AgZ9CQ3l0E2
 fmjPM3kRDWSdZp6ZTKDmBReH0x89gOLtKxaw5Nt6HUjlXtZ1k9tG1Y19np8A/1GR3NCm+6aU/
 aUIHOhDmo51/NkddFu88P+g+DeT6k21pwEyMWPty3JdsXt2NzA4aeEb6iaS30kbuEswhbL9QP
 IvmhdXqFm/7AjXBxsEppMQJr8R2eWWvQfCA+Ikh0vtNNhol8lRwDza41Xz5TBKvshmMhwk1c4
 z1E6kT16eSpCbUWPym3V/E896YAca04r7OZi7sHlWh8FwDKVtdO4CujYR2Ak4V/+SupfzT8D3
 QLrZ/FBDxC1MhWLyZWiQKV/Rk92A300tjs3HoLOZmQhwZmHwGTyBmsHnCdfgQ62yvO4Z/U0WN
 Cbx8OX9HnaitgjD6PdOKOFhRqajDzgU2BGfgkgiJ9Jw7Wsy/vj5q7zVDw==
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.18.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-August/041934.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 7958cbac88..8b6a5466ed 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-June/041849.html
-sha256  18c6a286583268d39841348e561fbb4713bde0c643b360f5d8a3f27800afdb9a  libinput-1.18.0.tar.xz
-sha512  9a834f075d7a1f892416bb6b241eb052f749d3aa883c4b39c0f1c9616c115d6b9a541b587508646fddaf0d3fe57af92fe4629b522d1d51196499e7b523e0aa90  libinput-1.18.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-August/041934.html
+sha256  9ca14021fbc2523bc0610582c51f368321592040b6ca63becc2fa1ea11f1a7cb  libinput-1.18.1.tar.xz
+sha512  450e38c0f8245aa0165a8047d25aebee646332f0f2ed442bb2d1bd3e723c2082b6d00d6e3bda308981ece8e29b5cddbd56eab900d2b7497705a45fc27b281828  libinput-1.18.1.tar.xz
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 32b822edb7..844a4ae8ba 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.18.0
+LIBINPUT_VERSION = 1.18.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

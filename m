Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BBCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 10:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EB324091F;
	Sat, 19 Feb 2022 10:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ilFzG6x8znQw; Sat, 19 Feb 2022 10:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85FD140902;
	Sat, 19 Feb 2022 10:24:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 647CA1BF344
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 10:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53B4F607A8
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 10:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7bHROPZK7otG for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 10:24:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11B1C605E3
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645266292;
 bh=mmZ5piSvVB0/n8xhgGZpZGoRk05cJT0HVRx557i0X6M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=MtcRQmgDLOb7yDYHYqKGTmQgfCxyQLD94nEtQU9rlDCP+0ZTOZml6E3+ZsLi4Nior
 cqxI/1faM8LXofOt4kEtc8f/Ce3wGC28Hp06sCJgkkJt+hrfVmi48Ek7AlNXHxFgG4
 gf1Fq++nGZcZ11sH17DUrWpLLptsdTQAZKzN6Mwo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.232]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N7i8Y-1oGxjq1VUw-014o81; Sat, 19 Feb 2022 11:24:52 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 11:24:51 +0100
Message-Id: <20220219102451.25602-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:ls55HMXeK8qssKVDxmQaBupF00a5+5YSs+v+bZGTNWnfAYkmg1K
 rJJmi7TSD5PHoL7BALohEioFbAnv1rBtcZRnmSB+Xf1648Qj28/1YlZ1f6ADSswWcC/ARAx
 r+WseSQyXtfSjf+s6FgwuZuGT7FuWi9qx4HdGo9qsx2mF0/CUZO8IbepckwolMLp+cbONaG
 zmbIx8fZA5JWeYTHqnGfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9WbflRomX4c=:6HI/VRadTkJ1ZpVBTCeO3k
 g2GqYpfcv/XYnA6HaHXL9ECIeuqnY2vGp+9BF7OcXbrIv4SKJk030IZ2d+OuGR+7GnzizPsWc
 bahU41RcjVNnosdRKOi7+Prsaz7gsQIJBDtR94LpS7AwmsHB6y7ZMOfU0wyLQMb2cvukB48ol
 8NO0bmq+SGpWtRXjy0R2LZDQnY/U0zGHaQA1rqgKJVK7XYtocumM9CRKCKJkdnUByPF485jGR
 YVP/hxmZk7/Eesq9q1y2r3cjTUUa+GgBzI43ZgyR7Um7q9TniAMby5SV347LkyeY5l1Gu8run
 I2sqtSxBVvBOgXLw/aCV9GB6FDwwi1GvmPQTgz8sK0bFuehYiBK4qzC5N/pPlwAR778lyug8n
 LyCv/Px+8RZ4yocKouIXJwmLq35dldU8Uu/MlpM+C2qe8l+lqx7RhNz2hwhWnDq11SKKfzKfb
 nOPny10ERUL3YS34fhV/c9ANQa5RVMg7fGscem8Mpy6tD7P7rksa6hAx9f3cpOt3zndBMQIHf
 0yAQHWC+/cT8ALD1Sfe5/G4X6uZD2IqBiuyFk/LidTsFiFb+KTw5RFpSyvlVkM1laiubx1rob
 Vbp6U29ebPOhq1sMWuTjJWPNtUtiJVR41VTJs+30rfBfLR/wPDhWJOqzbbh0FYS8SW7tFBC90
 FR6Q1VD3+AzFOd08Ga+zh+VnLDCQlXRqvjzQgoZNc6W61P7DVB/45sqLLW7wglzMXTzSemVLO
 Z0rDHoMH0CUHyUAl1ZNgh03dcQcaFiwSgamdKqSeROu4Jbe/uOmP0weqDDUu7sWy+uEzOdTNb
 ywqKriJ6x196vB/YtDm7YJtUlvaXl3YSNLlD2zy6lxJJYcsEBBO+mpOoHYqczOHq0+HGXyZ0i
 91uPfufVlX/FtkS3gS4kOFiUeYILMddcxgRd3MnaZ3/KzWVA81On2UJob/G2Cz/gQcm6QtXQg
 QP55Noj+ssuPI4W8VCDRLV6QsI333Qds7/TScseWC7dVnaFiVNNUzH1jkUlk23IGIBbxktJHQ
 Hn+2xYkr9zL8BBuAe3s5b98Jbnx6A7Y+/quGIHf0MQDs+Dj21rKHPoCDdfcms3uMEkMCcauSP
 J3CutT7vhhE/vw=
Subject: [Buildroot] [PATCH v1] package/wireless-regdb: bump version to
 2022.02.18
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
Cc: Dimitrios Siganos <dimitris@siganos.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog (since 2021.08.28, [1]):

  e061299 wireless-regdb: Raise DFS TX power limit to 250 mW (24 dBm) for the US
  2ce78ed wireless-regdb: Update regulatory rules for Croatia (HR) on 6GHz
  0d39f4c wireless-regdb: Update regulatory rules for South Korea (KR)
  acad231 wireless-regdb: Update regulatory rules for France (FR) on 6 and 60 GHz
  ea83a82 wireless-regdb: add support for US S1G channels
  4408149 wireless-regdb: add 802.11ah bands to world regulatory domain
  5f3cadc wireless-regdb: Update regulatory rules for Spain (ES) on 6GHz
  e0ac69b Revert "wireless-regdb: Update regulatory rules for South Korea (KR)"
  40e5e80 wireless-regdb: Update regulatory rules for South Korea (KR)
  e427ff2 wireless-regdb: Update regulatory rules for China (CN)
  0970116 wireless-regdb: Update regulatory rules for the Netherlands (NL) on 6GHz
  4dac44b wireless-regdb: update regulatory database based on preceding changes

[1] https://lore.kernel.org/linux-wireless/YhBCKWNw3IMfGs0L@ubuntu-x1/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index abe8f6b000..91fcb320d2 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  cff370c410d1e6d316ae0a7fa8ac6278fdf1efca5d3d664aca7cfd2aafa54446  wireless-regdb-2021.08.28.tar.xz
+sha256  8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f  wireless-regdb-2022.02.18.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 9e01283c01..35a8c6686d 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2021.08.28
+WIRELESS_REGDB_VERSION = 2022.02.18
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

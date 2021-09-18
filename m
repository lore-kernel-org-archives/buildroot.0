Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C05C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:34:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0342F610CB
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0342F610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A1DE605A5;
	Sat, 18 Sep 2021 20:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3OlOScJTmsC; Sat, 18 Sep 2021 20:34:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 882D0606B9;
	Sat, 18 Sep 2021 20:34:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97A691BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87BFF403EB
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnM8LB3ozmut for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:34:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 104A7403AE
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631997278;
 bh=sGEeRDMsp1IJslD+SMmZj4XLYE3kA5N55EM5hf5BRr8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=JgWkdk6iz0ny2edDqtIqdx+P/Ag+AnZVxfbOW5NC0JX3H16zcFee4cA6L8aCYKwS7
 AkUg88vktaPooNek8WXCvmkfDuhTZHEVXpdWzcxDD1ttrYTAjdrup3Lbw1YwRLehDb
 15hRxORs7Tqz0lGIfX90MJ9pUkWmG7Y9CNH+Rfr4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.115]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M9Wyy-1mV0QL404y-005bPq; Sat, 18 Sep 2021 22:34:38 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 22:34:37 +0200
Message-Id: <20210918203437.6948-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:OWJH5M71ACWnYspQDBpTo9+r2uCv+th3YXZq7i7CV2glqL3ht4u
 3ffSQpWR07sLb9oionFoMkJ+IiP6/+az2+mp2vV1L1q5kU7XeSAaFCcQbBNpLC1QbU0ycyv
 2fWpG2xcKbo2jrPQv9DE1p4tYci8AE4R+4a2PgkqxY7JbL9/MvwphiEcQwNgAYOJ9Q5fTiz
 yKcSMq8++MQ9SB1jf1/TA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OuGR9ptIOt8=:k19iCAd9kjDu82/9+yitWX
 usC8HMJNB4i3VIzSPGpmyErDeDjfoyPrmTT9dyI0ws8L9beeFfUNvV8fhmAociEYhBJiXGEiW
 Y2VGqHMextd2cR7xwngE19cKfr01LGTXd6ZPbUpprK313EVzibUa1PmHCQG5WIZywfiJI8IOW
 9+ameAvOk6npd7ZP5w5Rudtg2ZZdjFoBAuvnV9krjBh4slfrk7nx1sB4X26dzSuK2UUvIkuCX
 wgOI+APIOq2rU6AhUfQznOJ/PHZErD830jhVsxRC2YoWFJTAqrjKUnZtunmeKtzLZFHFBTYHt
 p1m/+vFKE3H+Sv+Zj1faMWGEi9YWNqG6RBC9aH9EyVmE9b5N1dh06tLNnKroYRRIcmH/4oxMz
 1Mx92UxKk3lOsLraUgGrZ/Ivz623R9kc1MtpOFgJ7gATZOk38vOWV1uuBK1my/C1Jlf42L2zR
 Xxy7Ssy4YQFmeh3t/+7CaKimJRwtTL/HLVe+27GOMKRz+BR6ZFHxzSxKS3TYZf7ZbvFdxQslc
 Yr0i73Gb++JRH6r4hA9Vjx6vreP2numt7CpjwTsiWwAh6MKNQ4LhKvZtGe1mpw44FhXxdV9u0
 ML7iWdbqAjGmZFcOGwh/XLHG2CR/vW2d6VdkF9+dWhOLDGo7G21E+zgEAL6WxVochOfFn7hRe
 /z9STvFX5CnB3vPHneKhqyIOEowXfMMBnklAWaijT0tWWSL1Hgwyt96n/4qGLSp3sKS5qvIPY
 OUhyP4grkaSfJaEmM8xjwCEioe2fT8DUxu0yO58lj4+0RIDFgx0fzOGOqBgtPXKoqmIT6IXrQ
 CcRwbuWUcx/15XwaFwPaok108IfM7WOvNHiPv8M5ektgCOux5t1yGXdHyKS28W0QirVigSQKu
 qieVtueHfQA+lIV5DyO0HSHbIELxIrfFo5D84Rj23fv4UEsMofET+3WgdqC6xq2g345swH6m+
 dbqUQsKcWJ3jekZUmuxP8H9DLmLogcnfsuzBF42pxeBREX/2myVVr+UbYw4y+AxaCxkwPBPgy
 zW4Son44g8BBVjXtBgIkVILXxI/yS6hsVXv4ixnfNb9vpGD/W5ikFU1soSqiMYXockIfYzynw
 Qo+8AgJVms7WkE=
Subject: [Buildroot] [PATCH v1] package/libxkbcommon: change
 homepage/download url to https
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

- change homepage url to https (and remove trailing slash)
- change download url to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libxkbcommon/Config.in       | 2 +-
 package/libxkbcommon/libxkbcommon.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
index 4da12897f2..4e73a24abb 100644
--- a/package/libxkbcommon/Config.in
+++ b/package/libxkbcommon/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBXKBCOMMON
 	  processes a reduced subset of keymaps as defined by the XKB
 	  specification.
 
-	  http://xkbcommon.org/
+	  https://xkbcommon.org
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 790083614f..ee2bc1ee99 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXKBCOMMON_VERSION = 1.3.1
-LIBXKBCOMMON_SITE = http://xkbcommon.org/download
+LIBXKBCOMMON_SITE = https://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

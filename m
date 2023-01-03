Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E29C3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 10:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FEA481E6F;
	Tue,  3 Jan 2023 10:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FEA481E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27tOhO3CPNsA; Tue,  3 Jan 2023 10:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF9D81E5B;
	Tue,  3 Jan 2023 10:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BF9D81E5B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D47F11BF34B
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 10:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0721408F8
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 10:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0721408F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCQUMTznPUnp for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 10:35:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6012D40911
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6012D40911
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 10:35:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d4so20979654wrw.6
 for <buildroot@buildroot.org>; Tue, 03 Jan 2023 02:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w255mhlUHFr75iSlzfd0SEqV0VgLAFy56g9PAeUJiKQ=;
 b=dMU+T0165ehT/EUwwC8zHptsQb7fsPJtKbXdJXWxq7aoVeDlYINy+0Ulr4bN3w5Ayq
 S8ibMa/3Ev6Qe9mlGHtMz4z2Dr3QwvFvJjlz9z+jBspRiSe4/qSp/7TnbaOjmjFVtIEP
 pE/LARhGsNZboo5bDoNkOzsSQdfqEtEybjyHnOxjnjczz5jTrwqv0v4OtXMEox+Gi/g7
 1xOQ1NT6xvPJrFKSFvpn1Vxldm8hxJGNJiS3zkaMM6OAZGSML7ntdZBmNZWw8ayXH+8p
 iGEeBtZplGBpQ9UL1voC/YJF1DBulPYMZ8jA7jGoHYwdT9npmiYnKi/byLRxTxZW8mXQ
 ZpRA==
X-Gm-Message-State: AFqh2kpZeUzHbUwX3+RJVxsUiSFaD0kp+20emcO2MN893pgYs8Tc0zcN
 FeWR8Pq2QxBgXO7fMUGq7vZ7Rqb1p1nMwg==
X-Google-Smtp-Source: AMrXdXthYad58XR/tLKD1BU44UDHHCZZI50B7sTvxiSdpwDNeaR9j8flUZczG2+U9xvZqqZX0ZMJPg==
X-Received: by 2002:a5d:534e:0:b0:277:e258:cccd with SMTP id
 t14-20020a5d534e000000b00277e258cccdmr20606493wrv.15.1672742109302; 
 Tue, 03 Jan 2023 02:35:09 -0800 (PST)
Received: from debian.barco.com (d528f5fd6.static.telenet.be. [82.143.95.214])
 by smtp.gmail.com with ESMTPSA id
 o2-20020adfeac2000000b00299b9adc5a2sm5315410wrn.66.2023.01.03.02.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 02:35:08 -0800 (PST)
From: Dennis Van Hoorick <dennis.van.hoorick@gmail.com>
X-Google-Original-From: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 11:34:38 +0100
Message-Id: <20230103103438.1889-2-dennis.vanhoorick@barco.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230103103438.1889-1-dennis.vanhoorick@barco.com>
References: <20230103103438.1889-1-dennis.vanhoorick@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w255mhlUHFr75iSlzfd0SEqV0VgLAFy56g9PAeUJiKQ=;
 b=jtJeuVZRRyDCZZ/FvK2y20yYA3B2Z52j0L/vyKl2SzMGFKZ0NFSIpm95pSv8SS1/na
 flNcjV7wjBQmtGRqgyU9tJPnNEfi+lkojMuYS49llInSMRFgYw05HKay1+5+qpwqa0K4
 mciaNDYgIVKjWH4DplPrdstdXMWDsB925SFZVNSBVpQb/HCtHS7pGMx7BD19LMhQhySi
 QchBIsOknJ+pyCIfVnxLOK9n/LzJK6sC909dfsuU1kxpB0OH1yK5rytTxWKDLW3HNLdW
 0uJkBjauP3H+yanOk1Sle8lusn9JM6O9QsXwMZfawdJ8HtKHF2C8hEBfq1CUHRHI04mt
 qM8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jtJeuVZR
Subject: [Buildroot] [PATCH 2/2] package/ncurses: Switch to git repo with
 snapshots
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
Cc: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switching to Thomas E. Dickey's github (Thomas is the ncurses maintainer, so we can trust him).
This avoids needing to list all incremental patches, and will make future bumping easier.

Signed-off-by: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
---
 package/ncurses/ncurses.hash | 65 +-------------------------------
 package/ncurses/ncurses.mk   | 73 ++++--------------------------------
 2 files changed, 9 insertions(+), 129 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index c72a2abf46..b7a9bbaa53 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,65 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256  97fc51ac2b085d4cde31ef4d2c3122c21abc217e9090a43a30fc5ec21684e059  ncurses-6.3.tar.gz
-sha256  51bad0e386d06d3a26d7f28087b2072658282452f209e7e5eb7722556b042570  ncurses-6.3-20211026.patch.gz
-sha256  4e1b0694a2633cc681987c80091175cb2b17a6c882750a7c6afb0560f5447249  ncurses-6.3-20211030.patch.gz
-sha256  de7e0b2c784342188da48147d3fa661be38d5b5d517bb224423f15893e27334f  ncurses-6.3-20211106.patch.gz
-sha256  df78f157336fce33d96ae1e3c2f7d7b48e9b728409d9a4ab59e77242255b03ab  ncurses-6.3-20211113.patch.gz
-sha256  b7bf59d9a8e243263b05b166c6fe321bfca8e67eb32ebc26a1c813df42d64fee  ncurses-6.3-20211115.patch.gz
-sha256  7cb46c897e2e54d5f085cd9edc8d523c13b8f4a13878dd01ce094ec52bd26aec  ncurses-6.3-20211120.patch.gz
-sha256  ee8cf6ab6db3a01f2533959d14a5e1cc8e1412fbce4b2ab4668c7d1101f71684  ncurses-6.3-20211127.patch.gz
-sha256  9d9055badff9e15fc1fbe4f4b2cce7c76384d446ab857573cbb1d645430d8ac7  ncurses-6.3-20211204.patch.gz
-sha256  6059625cac99819a3580955db377c0820b6be7ae5da4d8a82e9638948a7b0679  ncurses-6.3-20211211.patch.gz
-sha256  acb77a09fe6ab37b96e9f70d9ebfde0aaf7bdee064761c605b47125bd31be2ae  ncurses-6.3-20211219.patch.gz
-sha256  f2786f19c85258da9e9255459480e5ac2efb61b6ea5d0866b9b8507fa8f5b036  ncurses-6.3-20211225.patch.gz
-sha256  ca5736eda90cd7cb597be0fdb0ed10f04deb7304cc7ffb0b166dfa07c39ab1e7  ncurses-6.3-20220101.patch.gz
-sha256  7e43911e6baa4a7cfeaad1880777bda352eb7b22493db5bc9f72a52aec8d6d78  ncurses-6.3-20220115.patch.gz
-sha256  ecfdd8bed6ff3b1fae5050da555c77dd41035c35bebed30162862e343324443e  ncurses-6.3-20220122.patch.gz
-sha256  32ec2da0fe48c353489c4018b38f890a59eafeb37ab24b82e32ba553845438a4  ncurses-6.3-20220129.patch.gz
-sha256  f74b0d1f7f96bf8609c6a62e268019289e4affec9e02f9182ab14817637180e7  ncurses-6.3-20220205.patch.gz
-sha256  6506f709e745375f692d05f53c45b50f1e60d13a3e4346db46d14f69e19adbb1  ncurses-6.3-20220212.patch.gz
-sha256  349433e684e96096cbacaa1014d3ccd285c441d1bd99a721ae0b705b02de4145  ncurses-6.3-20220219.patch.gz
-sha256  2181cf581fcdabb5b534606ab81c4c625bf819f9d351c670972a7f3a85f36197  ncurses-6.3-20220226.patch.gz
-sha256  1acd0f2d18ea7c783286658e550c4f61cbe750a907c9be5fc00e67f2ea8f7eb5  ncurses-6.3-20220305.patch.gz
-sha256  ced13543cc19ee341d82eb7fd501e15a2f3d1bc08fbbeb9de7edbd6422ca4799  ncurses-6.3-20220312.patch.gz
-sha256  450fce90a10b1ab0b20ba5efc222741fe96f8445d1e4528e2a7b7711c26a5254  ncurses-6.3-20220319.patch.gz
-sha256  c97213841e41d33b50a8492ba252dc79a24b38721f7ac0966442b3176f5666c7  ncurses-6.3-20220326.patch.gz
-sha256  4c6253ea2c3cf83fbac2fdb5af56914e6bdc5a7c6e6e7532a4f218b7af6d05eb  ncurses-6.3-20220402.patch.gz
-sha256  5b46bc2bec8f9192c2ed7d25f2080c57b7d7ecbe294d85ab8d3c7d4eb4a678fa  ncurses-6.3-20220409.patch.gz
-sha256  fddd3b7dea2db1dc70adfa46ccb52301c820854821ce35366056e8e8daba8360  ncurses-6.3-20220416.patch.gz
-sha256  1dba62d927affe93face3d55710d8abce7b70a904a0dd0114894efff7ba8ac72  ncurses-6.3-20220423.patch.gz
-sha256  f6289906a3be560da9240e0d4a7a1bbd213dd9316f0b395e6852524491ff6322  ncurses-6.3-20220430.patch.gz
-sha256  a6f631b9b934d0012617c429834b370732084d6f3c1784d11d8f18f26ea9e0d4  ncurses-6.3-20220501.patch.gz
-sha256  79e75286b2a3292058bbe0aa67d8ea49682f7942b108c3ffc725a34765d4fce7  ncurses-6.3-20220507.patch.gz
-sha256  1dda27245cbd6634f89766624dc72c156312bf00635214ea7ac299c9330b18f2  ncurses-6.3-20220514.patch.gz
-sha256  0a251674845e0669e92c8bee6b6e5bb317439f8707f3316424eae590322f87c6  ncurses-6.3-20220521.patch.gz
-sha256  411c4fdfc2ea4f56fdb57ff758a13dffa4b2fff68e71b65cf3248c925f6c30ee  ncurses-6.3-20220529.patch.gz
-sha256  acc315edb22a04f6476d9cd2a43866d478e0f4b2a555f480c92a18983bec5ee7  ncurses-6.3-20220604.patch.gz
-sha256  2dae4db33c73766cd63b2b700e09588750bae44622749ce007404e3e30420ada  ncurses-6.3-20220612.patch.gz
-sha256  1e4b5c3deaab601a9749da591952b66a53d96017967eeec033f3b4d30e12d2de  ncurses-6.3-20220618.patch.gz
-sha256  65379719532023cd77c80a495cf31ff773345173e919ec8eef8b3f9517969626  ncurses-6.3-20220625.patch.gz
-sha256  028864b31ada91862f0d8f4aa016b62bc3fe7e3981d62e81110d5143e26d0e0d  ncurses-6.3-20220703.patch.gz
-sha256  06c2f6d967480d0bcf20f301db26c8e5c90caf6d3adf616bc277e21407e9c955  ncurses-6.3-20220709.patch.gz
-sha256  66aa8564d09fcc7bbd85bbe79685772330633c14d70af2fef00d10491e6b22fb  ncurses-6.3-20220716.patch.gz
-sha256  fffcc8ec0eab3dcbb7b8d8a208d880a15fe128f6f2dbc63a87d5640d8ade95cf  ncurses-6.3-20220724.patch.gz
-sha256  1787619c0b5052121dc5816bdb4cbd9699e1b61ba6c98072a3733b17cc7009f9  ncurses-6.3-20220729.patch.gz
-sha256  d7fb1f2e2246079527351c8b7c8847c28751c6a5bb46740681d4b6ba790b22cc  ncurses-6.3-20220806.patch.gz
-sha256  10a04d3189a34187e691e73435c210af3939025f07ff6c34c1bfc48fda6f5a5d  ncurses-6.3-20220813.patch.gz
-sha256  b9238267413c2fce5bfe4c029f28dbbbef7230cdf47792ecd4070b857fe1a869  ncurses-6.3-20220820.patch.gz
-sha256  7d30766caaac9136ab0ff7164d33761b186b698ec237560cb8fce0eb937f90b8  ncurses-6.3-20220827.patch.gz
-sha256  5f04fd2d954b3461671290c766f784a4151091eb4e9197a7745dcdbb9c030483  ncurses-6.3-20220903.patch.gz
-sha256  b948a0efe45341ccc913cc67231ee1e6bc737f178bcd758ce9f2e856e575071f  ncurses-6.3-20220910.patch.gz
-sha256  f9ad5781a72d669bdd06fe075136cc79e6a570960f6f641a9c486fc102a45c3b  ncurses-6.3-20220917.patch.gz
-sha256  bbb9d5afaec836e66b9f919c97c81c0505fd111b479b59ab6e376822ff6df1d3  ncurses-6.3-20220924.patch.gz
-sha256  7ffeae28a0f8416c6ab088a99807d0d1ee5be821828c288f0a572ea769a8e2e5  ncurses-6.3-20221001.patch.gz
-sha256  204baff40926d29ec30b1def4d4cc5d7ce074918327d8e271a49c960032b5a49  ncurses-6.3-20221008.patch.gz
-sha256  f578dbb3beb1976636c74b33ffe5d300fee5a7653bc4f64bb7870d1b9cf85e7b  ncurses-6.3-20221015.patch.gz
-sha256  b01fc81093a331d5d645dbcbacebf6e5d459430b38cbdae0db053c6e5dff7d7e  ncurses-6.3-20221023.patch.gz
-sha256  e6e819c78c78c3a0355e7da4360d084f5d69871fa556b51322980f22da4edcea  ncurses-6.3-20221029.patch.gz
-sha256  4da9b5bf14a1b7d6d8a4181e79a98b9e5782153bc7db93773ac43e0b758c4da2  ncurses-6.3-20221105.patch.gz
-sha256  b3381da6071bbed04e6ddaabbd5375d280e50af429f94522e32e9d0f22766155  ncurses-6.3-20221112.patch.gz
-sha256  bf30c435283a4483280e0433f6370d9eea1fb704323bd887e540592eb8203e2f  ncurses-6.3-20221119.patch.gz
-sha256  32dc21b671ead8b199d66111ebd3404e8cd5f8c4ca5587cfeb5c6a4913b2d103  ncurses-6.3-20221126.patch.gz
-sha256  8fe3bcacaea784ac7971e102a8eb8ca58c4c2c4c13c1ec33f32334600b9e4f56  ncurses-6.3-20221203.patch.gz
-
+# Locally calculated
+sha256  4057d800ee96623ae70d06b05b2dadb481a80c030e4968aa5d9bcea4439441da  ncurses-v6_3_20221224.tar.gz
 # Locally computed
 sha256  63de87399e9fc8860236082b6b0520e068e9eb1fad0ebd30202aa30bb6f690ac  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 4d93a992e4..0ba98b4d64 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -4,79 +4,20 @@
 #
 ################################################################################
 
-NCURSES_VERSION = 6.3
-NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
+NCURSES_VERSION_MAJOR = 6.3
+NCURSES_SNAPSHOT_DATE = 20221224
+NCURSES_VERSION = v$(subst .,_,$(NCURSES_VERSION_MAJOR))_$(NCURSES_SNAPSHOT_DATE)
+NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,$(NCURSES_VERSION))
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = COPYING
 NCURSES_CPE_ID_VENDOR = gnu
+NCURSES_CPE_ID_VERSION = $(NCURSES_VERSION_MAJOR)
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
-# patch 20220416
+
+# Fixed since snapshot 20220416
 NCURSES_IGNORE_CVES += CVE-2022-29458
-NCURSES_PATCH = \
-	$(addprefix https://invisible-mirror.net/archives/ncurses/$(NCURSES_VERSION)/, \
-		ncurses-6.3-20211026.patch.gz \
-		ncurses-6.3-20211030.patch.gz \
-		ncurses-6.3-20211106.patch.gz \
-		ncurses-6.3-20211113.patch.gz \
-		ncurses-6.3-20211115.patch.gz \
-		ncurses-6.3-20211120.patch.gz \
-		ncurses-6.3-20211127.patch.gz \
-		ncurses-6.3-20211204.patch.gz \
-		ncurses-6.3-20211211.patch.gz \
-		ncurses-6.3-20211219.patch.gz \
-		ncurses-6.3-20211225.patch.gz \
-		ncurses-6.3-20220101.patch.gz \
-		ncurses-6.3-20220115.patch.gz \
-		ncurses-6.3-20220122.patch.gz \
-		ncurses-6.3-20220129.patch.gz \
-		ncurses-6.3-20220205.patch.gz \
-		ncurses-6.3-20220212.patch.gz \
-		ncurses-6.3-20220219.patch.gz \
-		ncurses-6.3-20220226.patch.gz \
-		ncurses-6.3-20220305.patch.gz \
-		ncurses-6.3-20220312.patch.gz \
-		ncurses-6.3-20220319.patch.gz \
-		ncurses-6.3-20220326.patch.gz \
-		ncurses-6.3-20220402.patch.gz \
-		ncurses-6.3-20220409.patch.gz \
-		ncurses-6.3-20220416.patch.gz \
-		ncurses-6.3-20220423.patch.gz \
-		ncurses-6.3-20220430.patch.gz \
-		ncurses-6.3-20220501.patch.gz \
-		ncurses-6.3-20220507.patch.gz \
-		ncurses-6.3-20220514.patch.gz \
-		ncurses-6.3-20220521.patch.gz \
-		ncurses-6.3-20220529.patch.gz \
-		ncurses-6.3-20220604.patch.gz \
-		ncurses-6.3-20220612.patch.gz \
-		ncurses-6.3-20220618.patch.gz \
-		ncurses-6.3-20220625.patch.gz \
-		ncurses-6.3-20220703.patch.gz \
-		ncurses-6.3-20220709.patch.gz \
-		ncurses-6.3-20220716.patch.gz \
-		ncurses-6.3-20220724.patch.gz \
-		ncurses-6.3-20220729.patch.gz \
-		ncurses-6.3-20220806.patch.gz \
-		ncurses-6.3-20220813.patch.gz \
-		ncurses-6.3-20220820.patch.gz \
-		ncurses-6.3-20220827.patch.gz \
-		ncurses-6.3-20220903.patch.gz \
-		ncurses-6.3-20220910.patch.gz \
-		ncurses-6.3-20220917.patch.gz \
-		ncurses-6.3-20220924.patch.gz \
-		ncurses-6.3-20221001.patch.gz \
-		ncurses-6.3-20221008.patch.gz \
-		ncurses-6.3-20221015.patch.gz \
-		ncurses-6.3-20221023.patch.gz \
-		ncurses-6.3-20221029.patch.gz \
-		ncurses-6.3-20221105.patch.gz \
-		ncurses-6.3-20221112.patch.gz \
-		ncurses-6.3-20221119.patch.gz \
-		ncurses-6.3-20221126.patch.gz \
-		ncurses-6.3-20221203.patch.gz \
-	)
 
 NCURSES_CONF_OPTS = \
 	--without-cxx \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

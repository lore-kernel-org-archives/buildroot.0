Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21036C4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 10:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61008418C7;
	Thu, 15 Dec 2022 10:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61008418C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8W1VMi7Y6MU; Thu, 15 Dec 2022 10:06:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0795418D0;
	Thu, 15 Dec 2022 10:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0795418D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94FC41BF360
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 10:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EA4A418D0
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 10:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EA4A418D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RE1ZXuG_293r for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 10:06:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A700A418C7
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A700A418C7
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 10:06:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h10so2501687wrx.3
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 02:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aLbccokYXbHhVgX36aY499+WOcTiOTLTbcFoNgScYMQ=;
 b=UBYCduhc/u65oVbDhA8rdEq8/lC4YlZsk5qhktgO67NBurlhDsJ5BUmaR4RoYk/8BV
 +0zrkaK2oatIsls1wY3klNWK1AIsCIK8mGBjz2Raih/ikTQ683aQWn99H4FPLItadOqP
 daACkzR0i+NDZaD9rxUfXN5hsQPicqJdP7aZSlP8qL+4YMiaLSatDzzuaNwFrRCtGysm
 H8yqDdTWs2TFcGckuxeKFwCAg/Rk+u3XN8SnkMnVYoWlEHyLIWMRDg3eazTnIwLXym8c
 HtgDVfy9EgUmTnwGRhYOtTMx9sVlCXrXAysAJ6wClyw6Svti4aumIMdGXWEVrMb7iATj
 4j8A==
X-Gm-Message-State: ANoB5pkxxAdYfCtQifqaFcD7glTCAISb5fn3lfCNWxD1QdHpIosvWami
 1WX9cEOt2xmINlndYpIbT7tLu2VrFIz7ngPa
X-Google-Smtp-Source: AA0mqf4+mxlEQPVxaapvzccG+lpmIOThM5qIOGitEWgU4k8fHZGJStEy1tgYWedieuD7/zV5jl2+Sw==
X-Received: by 2002:a5d:4045:0:b0:242:1415:ab02 with SMTP id
 w5-20020a5d4045000000b002421415ab02mr15769043wrp.9.1671098801593; 
 Thu, 15 Dec 2022 02:06:41 -0800 (PST)
Received: from debian.barco.com (d528f5fd5.static.telenet.be. [82.143.95.213])
 by smtp.gmail.com with ESMTPSA id
 by10-20020a056000098a00b002368f6b56desm6827388wrb.18.2022.12.15.02.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 02:06:40 -0800 (PST)
From: Dennis Van Hoorick <dennis.van.hoorick@gmail.com>
X-Google-Original-From: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
To: buildroot@buildroot.org
Date: Thu, 15 Dec 2022 11:06:35 +0100
Message-Id: <20221215100636.930-1-dennis.vanhoorick@barco.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aLbccokYXbHhVgX36aY499+WOcTiOTLTbcFoNgScYMQ=;
 b=hTtOLJXEu4fdvSORwB/ascvXDTJ0w7oauMx977vP6/5X7rZ979eTUjYgYSkKHbHAaI
 k+2pVkqeIz5GWIJLI0glWfvrEiOxcajA2Rm6amKnkXYNn56Kx8rHBhjDUDNUV4ymZzrr
 t9ncxvstOZyhUDY3fsyr+IkXkSSqjtSByhsv+WLxtxMQXK0kZmRct1S+67XGBbtRs+ec
 Uw5OX00xbD5MCOXX7P0S+96jm4iCmQ112JmHyxJVSwGQ9UcWNSIKlGesDjSKzXEhGw0w
 UzeZ8AaXocY8neVUjBai3iXMEkAt5sEJAsePtC12z1vdCCazFqszTCLqrbK77LfDEBrt
 wMag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hTtOLJXE
Subject: [Buildroot] [PATCH 1/2] ncurses: bump to 6.3
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

remove 0001-gcc-5.x-MKlib_gen.patch as it has already been applied upstream.

Signed-off-by: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
---
 package/ncurses/0001-gcc-5.x-MKlib_gen.patch |  44 --------
 package/ncurses/ncurses.hash                 |  98 ++++++++++-------
 package/ncurses/ncurses.mk                   | 106 +++++++++++--------
 3 files changed, 123 insertions(+), 125 deletions(-)
 delete mode 100644 package/ncurses/0001-gcc-5.x-MKlib_gen.patch

diff --git a/package/ncurses/0001-gcc-5.x-MKlib_gen.patch b/package/ncurses/0001-gcc-5.x-MKlib_gen.patch
deleted file mode 100644
index 0106e8077f..0000000000
--- a/package/ncurses/0001-gcc-5.x-MKlib_gen.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Fix gcc 5.x build failure
-
-Extracted from upstream commit
-http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commit;h=97bb4678dc03e753290b39bbff30ba2825df9517.
-
-+ modify MKlib_gen.sh to work around change in development version of
-  gcc introduced here:
-  https://gcc.gnu.org/ml/gcc-patches/2014-06/msg02185.html
-  https://gcc.gnu.org/ml/gcc-patches/2014-07/msg00236.html
-  (reports by Marcus Shawcroft, Maohui Lei).
-
-Original author: Thomas E. Dickey <dickey@invisible-island.net>
-Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
-[Adam Duskett: Refresh for 6.1]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
---- a/ncurses/base/MKlib_gen.sh 2015-08-06 20:48:24.000000000 -0400
-+++ b/ncurses/base/MKlib_gen.sh	2017-02-07 10:09:01.293962392 -0500
-@@ -505,11 +505,22 @@
- 	-e 's/gen_$//' \
- 	-e 's/  / /g' >>$TMP
- 
-+cat >$ED1 <<EOF
-+s/  / /g
-+s/^ //
-+s/ $//
-+s/P_NCURSES_BOOL/NCURSES_BOOL/g
-+EOF
-+
-+# A patch discussed here:
-+#       https://gcc.gnu.org/ml/gcc-patches/2014-06/msg02185.html
-+# introduces spurious #line markers.  Work around that by ignoring the system's
-+# attempt to define "bool" and using our own symbol here.
-+sed -e 's/bool/P_NCURSES_BOOL/g' $TMP > $ED2
-+cat $ED2 >$TMP
-+
- $preprocessor $TMP 2>/dev/null \
--| sed \
--	-e 's/  / /g' \
--	-e 's/^ //' \
--	-e 's/_Bool/NCURSES_BOOL/g' \
-+| sed -f $ED1 \
- | $AWK -f $AW2 \
- | sed -f $ED3 \
- | sed \
diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 69115f5caf..1029c1ddcb 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,39 +1,65 @@
 # Locally calculated after checking pgp signature
-sha256  aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17  ncurses-6.1.tar.gz
-sha256  cf9038be62c49a6b5fe93f33b32f983649b2f4c4c31cc99bd18e1e5871c31443  ncurses-6.1-20190609-patch.sh.bz2
-sha256  4b0a4c6abce4543ac4fd4c3389b14825e73b7cddcbb01a687c5dd837f21a3b04  ncurses-6.1-20190615.patch.gz
-sha256  b2302625ec2fa6dce79622670452e56ff6130dc02e655b52177264cfeff84c51  ncurses-6.1-20190623.patch.gz
-sha256  48b004a3e5409a02a5e751f996fe487f5ce45be1fff38572f7cc8167b22179bf  ncurses-6.1-20190630.patch.gz
-sha256  faf849eed92161ac09782badf84a19ad6beae472e87d460905865e08a6ed46e4  ncurses-6.1-20190706.patch.gz
-sha256  62d4954bf818659105aa1c21cc27cb2c133e02bdc7d3f6aa548caae2d1db7440  ncurses-6.1-20190713.patch.gz
-sha256  0c1a54bd5de9c890d1fabcfa92bf5bf46f7eccc54a48051367e82bdb29636450  ncurses-6.1-20190720.patch.gz
-sha256  0bbd08d3bd12686d4427c242d6a8fde2e299698039cd597303af713c5f538f17  ncurses-6.1-20190727.patch.gz
-sha256  40e5f350a921dbd03e3d9ff93bc477ec4f1f65878f307c534882fba3b0b40507  ncurses-6.1-20190728.patch.gz
-sha256  9648104311e209d17db9556d6efc898d5c80ed5fc80e8aa3cd08769544c839b8  ncurses-6.1-20190803.patch.gz
-sha256  fa1f583575717b2538d3a4ea59a67bc17dd07ed46cb99fe2beaf23d1b006e9df  ncurses-6.1-20190810.patch.gz
-sha256  5e9ae4f1b3e2e2d567a01a8fb2c9b7f3804cae97f28cd483d239afee781b8c2b  ncurses-6.1-20190817.patch.gz
-sha256  7592e5e610b3e9eeca78897da2330b7518f00e0a59d20df873c88a9b26bc4da9  ncurses-6.1-20190824.patch.gz
-sha256  1a9800a5ccc4f2cb572b63cdc8f1431642e014a58a30151af73977614d5c4aac  ncurses-6.1-20190831.patch.gz
-sha256  87685a6b90225efcd03375eb11b124fd9e95ee4b0f36bcbc82e56a70cd466b33  ncurses-6.1-20190907.patch.gz
-sha256  4ddebb6e0e5a67028eb3aca2352c9bd48cf122a512719f93e449e00a3c6634f8  ncurses-6.1-20190914.patch.gz
-sha256  4c725fa729d754f4e75af78fda4cf67d60e71c1625b5f4f49b7930c95bb8dd36  ncurses-6.1-20190921.patch.gz
-sha256  a830b879b57906b1e480e4785b32cec05081b7849c06c4b116459c4d343ba21b  ncurses-6.1-20190928.patch.gz
-sha256  d5eae35d920409613f565825e1e215fed89828040aab541328455da38e1a9b7c  ncurses-6.1-20191005.patch.gz
-sha256  136dbd07254810728c1fcb7614b566e7c3cb6af8c0783019bbb6b4b5e3c1e2c6  ncurses-6.1-20191012.patch.gz
-sha256  1d5125b20792e9f534432c3ef2aa68984c713416addeb2c4364c5ae897a3b8b7  ncurses-6.1-20191015.patch.gz
-sha256  a6475c05312ba0b12b72b83529c1d283a14c4470414c505fa45451e35f3ffcf5  ncurses-6.1-20191019.patch.gz
-sha256  f6c7469f33065faf1d04ac9e9bea1a88142b00b82e3db3674cca9ec24920b4af  ncurses-6.1-20191026.patch.gz
-sha256  0d0443937b9c04663de25b405bb95e658e7c87e1dd7a726b3813aa7f9b55f69a  ncurses-6.1-20191102.patch.gz
-sha256  f3b75787918d2f02a2005877e81fdc054c45b8249b43aabb531e3b817bcf7576  ncurses-6.1-20191109.patch.gz
-sha256  801d138b55986719aea7f42dc8c0cb618fa9a6edf92d1789a6ba5d61678f7761  ncurses-6.1-20191116.patch.gz
-sha256  45f447cf2c7a24295c7b9210473e943a238c57ca80581d121c9a1a3aa05332a6  ncurses-6.1-20191123.patch.gz
-sha256  ea758e3b0162348c4d5d6dac56f95809da3b7d0589205661a13430eb93f72f75  ncurses-6.1-20191130.patch.gz
-sha256  16b5a588c56a53c468d2359b21d5d8a007c4ef7696de12c964a1b661ed185f72  ncurses-6.1-20191207.patch.gz
-sha256  8725a2dc8f1cfdab41cb5fe56f930e070f8cdc81a77f303ef2658f65cd0b8edd  ncurses-6.1-20191214.patch.gz
-sha256  7e2a06fb0af6c84269d23ffe06c689bf1a8a57af39369690ee0698778d4b6cda  ncurses-6.1-20191221.patch.gz
-sha256  d052bcdb38f8b45a00c0a3190dec7ac1e72d5682f3a16d8accda239308aad62f  ncurses-6.1-20191228.patch.gz
-sha256  7b6253bae438154a88c7f3e301b872ed7ad71f943c873f4e6c82d8d36a5df72b  ncurses-6.1-20200104.patch.gz
-sha256  e438f28025c7d97c7f8fabf40eeab68bbf8ca871a0ba349e3fdec9165efe85cb  ncurses-6.1-20200111.patch.gz
-sha256  06d002c33f727c4a36a0b502c226ea3c3c5b80770703d2f783fffa6a0db04d92  ncurses-6.1-20200118.patch.gz
+sha256  97fc51ac2b085d4cde31ef4d2c3122c21abc217e9090a43a30fc5ec21684e059  ncurses-6.3.tar.gz
+sha256  51bad0e386d06d3a26d7f28087b2072658282452f209e7e5eb7722556b042570  ncurses-6.3-20211026.patch.gz
+sha256  4e1b0694a2633cc681987c80091175cb2b17a6c882750a7c6afb0560f5447249  ncurses-6.3-20211030.patch.gz
+sha256  de7e0b2c784342188da48147d3fa661be38d5b5d517bb224423f15893e27334f  ncurses-6.3-20211106.patch.gz
+sha256  df78f157336fce33d96ae1e3c2f7d7b48e9b728409d9a4ab59e77242255b03ab  ncurses-6.3-20211113.patch.gz
+sha256  b7bf59d9a8e243263b05b166c6fe321bfca8e67eb32ebc26a1c813df42d64fee  ncurses-6.3-20211115.patch.gz
+sha256  7cb46c897e2e54d5f085cd9edc8d523c13b8f4a13878dd01ce094ec52bd26aec  ncurses-6.3-20211120.patch.gz
+sha256  ee8cf6ab6db3a01f2533959d14a5e1cc8e1412fbce4b2ab4668c7d1101f71684  ncurses-6.3-20211127.patch.gz
+sha256  9d9055badff9e15fc1fbe4f4b2cce7c76384d446ab857573cbb1d645430d8ac7  ncurses-6.3-20211204.patch.gz
+sha256  6059625cac99819a3580955db377c0820b6be7ae5da4d8a82e9638948a7b0679  ncurses-6.3-20211211.patch.gz
+sha256  acb77a09fe6ab37b96e9f70d9ebfde0aaf7bdee064761c605b47125bd31be2ae  ncurses-6.3-20211219.patch.gz
+sha256  f2786f19c85258da9e9255459480e5ac2efb61b6ea5d0866b9b8507fa8f5b036  ncurses-6.3-20211225.patch.gz
+sha256  ca5736eda90cd7cb597be0fdb0ed10f04deb7304cc7ffb0b166dfa07c39ab1e7  ncurses-6.3-20220101.patch.gz
+sha256  7e43911e6baa4a7cfeaad1880777bda352eb7b22493db5bc9f72a52aec8d6d78  ncurses-6.3-20220115.patch.gz
+sha256  ecfdd8bed6ff3b1fae5050da555c77dd41035c35bebed30162862e343324443e  ncurses-6.3-20220122.patch.gz
+sha256  32ec2da0fe48c353489c4018b38f890a59eafeb37ab24b82e32ba553845438a4  ncurses-6.3-20220129.patch.gz
+sha256  f74b0d1f7f96bf8609c6a62e268019289e4affec9e02f9182ab14817637180e7  ncurses-6.3-20220205.patch.gz
+sha256  6506f709e745375f692d05f53c45b50f1e60d13a3e4346db46d14f69e19adbb1  ncurses-6.3-20220212.patch.gz
+sha256  349433e684e96096cbacaa1014d3ccd285c441d1bd99a721ae0b705b02de4145  ncurses-6.3-20220219.patch.gz
+sha256  2181cf581fcdabb5b534606ab81c4c625bf819f9d351c670972a7f3a85f36197  ncurses-6.3-20220226.patch.gz
+sha256  1acd0f2d18ea7c783286658e550c4f61cbe750a907c9be5fc00e67f2ea8f7eb5  ncurses-6.3-20220305.patch.gz
+sha256  ced13543cc19ee341d82eb7fd501e15a2f3d1bc08fbbeb9de7edbd6422ca4799  ncurses-6.3-20220312.patch.gz
+sha256  450fce90a10b1ab0b20ba5efc222741fe96f8445d1e4528e2a7b7711c26a5254  ncurses-6.3-20220319.patch.gz
+sha256  c97213841e41d33b50a8492ba252dc79a24b38721f7ac0966442b3176f5666c7  ncurses-6.3-20220326.patch.gz
+sha256  4c6253ea2c3cf83fbac2fdb5af56914e6bdc5a7c6e6e7532a4f218b7af6d05eb  ncurses-6.3-20220402.patch.gz
+sha256  5b46bc2bec8f9192c2ed7d25f2080c57b7d7ecbe294d85ab8d3c7d4eb4a678fa  ncurses-6.3-20220409.patch.gz
+sha256  fddd3b7dea2db1dc70adfa46ccb52301c820854821ce35366056e8e8daba8360  ncurses-6.3-20220416.patch.gz
+sha256  1dba62d927affe93face3d55710d8abce7b70a904a0dd0114894efff7ba8ac72  ncurses-6.3-20220423.patch.gz
+sha256  f6289906a3be560da9240e0d4a7a1bbd213dd9316f0b395e6852524491ff6322  ncurses-6.3-20220430.patch.gz
+sha256  a6f631b9b934d0012617c429834b370732084d6f3c1784d11d8f18f26ea9e0d4  ncurses-6.3-20220501.patch.gz
+sha256  79e75286b2a3292058bbe0aa67d8ea49682f7942b108c3ffc725a34765d4fce7  ncurses-6.3-20220507.patch.gz
+sha256  1dda27245cbd6634f89766624dc72c156312bf00635214ea7ac299c9330b18f2  ncurses-6.3-20220514.patch.gz
+sha256  0a251674845e0669e92c8bee6b6e5bb317439f8707f3316424eae590322f87c6  ncurses-6.3-20220521.patch.gz
+sha256  411c4fdfc2ea4f56fdb57ff758a13dffa4b2fff68e71b65cf3248c925f6c30ee  ncurses-6.3-20220529.patch.gz
+sha256  acc315edb22a04f6476d9cd2a43866d478e0f4b2a555f480c92a18983bec5ee7  ncurses-6.3-20220604.patch.gz
+sha256  2dae4db33c73766cd63b2b700e09588750bae44622749ce007404e3e30420ada  ncurses-6.3-20220612.patch.gz
+sha256  1e4b5c3deaab601a9749da591952b66a53d96017967eeec033f3b4d30e12d2de  ncurses-6.3-20220618.patch.gz
+sha256  65379719532023cd77c80a495cf31ff773345173e919ec8eef8b3f9517969626  ncurses-6.3-20220625.patch.gz
+sha256  028864b31ada91862f0d8f4aa016b62bc3fe7e3981d62e81110d5143e26d0e0d  ncurses-6.3-20220703.patch.gz
+sha256  06c2f6d967480d0bcf20f301db26c8e5c90caf6d3adf616bc277e21407e9c955  ncurses-6.3-20220709.patch.gz
+sha256  66aa8564d09fcc7bbd85bbe79685772330633c14d70af2fef00d10491e6b22fb  ncurses-6.3-20220716.patch.gz
+sha256  fffcc8ec0eab3dcbb7b8d8a208d880a15fe128f6f2dbc63a87d5640d8ade95cf  ncurses-6.3-20220724.patch.gz
+sha256  1787619c0b5052121dc5816bdb4cbd9699e1b61ba6c98072a3733b17cc7009f9  ncurses-6.3-20220729.patch.gz
+sha256  d7fb1f2e2246079527351c8b7c8847c28751c6a5bb46740681d4b6ba790b22cc  ncurses-6.3-20220806.patch.gz
+sha256  10a04d3189a34187e691e73435c210af3939025f07ff6c34c1bfc48fda6f5a5d  ncurses-6.3-20220813.patch.gz
+sha256  b9238267413c2fce5bfe4c029f28dbbbef7230cdf47792ecd4070b857fe1a869  ncurses-6.3-20220820.patch.gz
+sha256  7d30766caaac9136ab0ff7164d33761b186b698ec237560cb8fce0eb937f90b8  ncurses-6.3-20220827.patch.gz
+sha256  5f04fd2d954b3461671290c766f784a4151091eb4e9197a7745dcdbb9c030483  ncurses-6.3-20220903.patch.gz
+sha256  b948a0efe45341ccc913cc67231ee1e6bc737f178bcd758ce9f2e856e575071f  ncurses-6.3-20220910.patch.gz
+sha256  f9ad5781a72d669bdd06fe075136cc79e6a570960f6f641a9c486fc102a45c3b  ncurses-6.3-20220917.patch.gz
+sha256  bbb9d5afaec836e66b9f919c97c81c0505fd111b479b59ab6e376822ff6df1d3  ncurses-6.3-20220924.patch.gz
+sha256  7ffeae28a0f8416c6ab088a99807d0d1ee5be821828c288f0a572ea769a8e2e5  ncurses-6.3-20221001.patch.gz
+sha256  204baff40926d29ec30b1def4d4cc5d7ce074918327d8e271a49c960032b5a49  ncurses-6.3-20221008.patch.gz
+sha256  f578dbb3beb1976636c74b33ffe5d300fee5a7653bc4f64bb7870d1b9cf85e7b  ncurses-6.3-20221015.patch.gz
+sha256  b01fc81093a331d5d645dbcbacebf6e5d459430b38cbdae0db053c6e5dff7d7e  ncurses-6.3-20221023.patch.gz
+sha256  e6e819c78c78c3a0355e7da4360d084f5d69871fa556b51322980f22da4edcea  ncurses-6.3-20221029.patch.gz
+sha256  4da9b5bf14a1b7d6d8a4181e79a98b9e5782153bc7db93773ac43e0b758c4da2  ncurses-6.3-20221105.patch.gz
+sha256  b3381da6071bbed04e6ddaabbd5375d280e50af429f94522e32e9d0f22766155  ncurses-6.3-20221112.patch.gz
+sha256  bf30c435283a4483280e0433f6370d9eea1fb704323bd887e540592eb8203e2f  ncurses-6.3-20221119.patch.gz
+sha256  32dc21b671ead8b199d66111ebd3404e8cd5f8c4ca5587cfeb5c6a4913b2d103  ncurses-6.3-20221126.patch.gz
+sha256  8fe3bcacaea784ac7971e102a8eb8ca58c4c2c4c13c1ec33f32334600b9e4f56  ncurses-6.3-20221203.patch.gz
+
 # Locally computed
 sha256  4d1fde61868c73776a539366dccf5d5a4857e7fd7299efb1f02e07c2afe9ea87  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 2881ca1308..79593d8084 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -4,62 +4,78 @@
 #
 ################################################################################
 
-NCURSES_VERSION = 6.1
+NCURSES_VERSION = 6.3
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = COPYING
 NCURSES_CPE_ID_VENDOR = gnu
-# Commit 4b21273d71d09 added upstream (security) patches up to 20200118
-NCURSES_IGNORE_CVES += CVE-2018-10754
-NCURSES_IGNORE_CVES += CVE-2018-19211
-NCURSES_IGNORE_CVES += CVE-2018-19217
-NCURSES_IGNORE_CVES += CVE-2019-17594
-NCURSES_IGNORE_CVES += CVE-2019-17595
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
 NCURSES_PATCH = \
 	$(addprefix https://invisible-mirror.net/archives/ncurses/$(NCURSES_VERSION)/, \
-		ncurses-6.1-20190609-patch.sh.bz2 \
-		ncurses-6.1-20190615.patch.gz \
-		ncurses-6.1-20190623.patch.gz \
-		ncurses-6.1-20190630.patch.gz \
-		ncurses-6.1-20190706.patch.gz \
-		ncurses-6.1-20190713.patch.gz \
-		ncurses-6.1-20190720.patch.gz \
-		ncurses-6.1-20190727.patch.gz \
-		ncurses-6.1-20190728.patch.gz \
-		ncurses-6.1-20190803.patch.gz \
-		ncurses-6.1-20190810.patch.gz \
-		ncurses-6.1-20190817.patch.gz \
-		ncurses-6.1-20190824.patch.gz \
-		ncurses-6.1-20190831.patch.gz \
-		ncurses-6.1-20190907.patch.gz \
-		ncurses-6.1-20190914.patch.gz \
-		ncurses-6.1-20190921.patch.gz \
-		ncurses-6.1-20190928.patch.gz \
-		ncurses-6.1-20191005.patch.gz \
-		ncurses-6.1-20191012.patch.gz \
-		ncurses-6.1-20191015.patch.gz \
-		ncurses-6.1-20191019.patch.gz \
-		ncurses-6.1-20191026.patch.gz \
-		ncurses-6.1-20191102.patch.gz \
-		ncurses-6.1-20191109.patch.gz \
-		ncurses-6.1-20191116.patch.gz \
-		ncurses-6.1-20191123.patch.gz \
-		ncurses-6.1-20191130.patch.gz \
-		ncurses-6.1-20191207.patch.gz \
-		ncurses-6.1-20191214.patch.gz \
-		ncurses-6.1-20191221.patch.gz \
-		ncurses-6.1-20191228.patch.gz \
-		ncurses-6.1-20200104.patch.gz \
-		ncurses-6.1-20200111.patch.gz \
-		ncurses-6.1-20200118.patch.gz \
+		ncurses-6.3-20211026.patch.gz \
+		ncurses-6.3-20211030.patch.gz \
+		ncurses-6.3-20211106.patch.gz \
+		ncurses-6.3-20211113.patch.gz \
+		ncurses-6.3-20211115.patch.gz \
+		ncurses-6.3-20211120.patch.gz \
+		ncurses-6.3-20211127.patch.gz \
+		ncurses-6.3-20211204.patch.gz \
+		ncurses-6.3-20211211.patch.gz \
+		ncurses-6.3-20211219.patch.gz \
+		ncurses-6.3-20211225.patch.gz \
+		ncurses-6.3-20220101.patch.gz \
+		ncurses-6.3-20220115.patch.gz \
+		ncurses-6.3-20220122.patch.gz \
+		ncurses-6.3-20220129.patch.gz \
+		ncurses-6.3-20220205.patch.gz \
+		ncurses-6.3-20220212.patch.gz \
+		ncurses-6.3-20220219.patch.gz \
+		ncurses-6.3-20220226.patch.gz \
+		ncurses-6.3-20220305.patch.gz \
+		ncurses-6.3-20220312.patch.gz \
+		ncurses-6.3-20220319.patch.gz \
+		ncurses-6.3-20220326.patch.gz \
+		ncurses-6.3-20220402.patch.gz \
+		ncurses-6.3-20220409.patch.gz \
+		ncurses-6.3-20220416.patch.gz \
+		ncurses-6.3-20220423.patch.gz \
+		ncurses-6.3-20220430.patch.gz \
+		ncurses-6.3-20220501.patch.gz \
+		ncurses-6.3-20220507.patch.gz \
+		ncurses-6.3-20220514.patch.gz \
+		ncurses-6.3-20220521.patch.gz \
+		ncurses-6.3-20220529.patch.gz \
+		ncurses-6.3-20220604.patch.gz \
+		ncurses-6.3-20220612.patch.gz \
+		ncurses-6.3-20220618.patch.gz \
+		ncurses-6.3-20220625.patch.gz \
+		ncurses-6.3-20220703.patch.gz \
+		ncurses-6.3-20220709.patch.gz \
+		ncurses-6.3-20220716.patch.gz \
+		ncurses-6.3-20220724.patch.gz \
+		ncurses-6.3-20220729.patch.gz \
+		ncurses-6.3-20220806.patch.gz \
+		ncurses-6.3-20220813.patch.gz \
+		ncurses-6.3-20220820.patch.gz \
+		ncurses-6.3-20220827.patch.gz \
+		ncurses-6.3-20220903.patch.gz \
+		ncurses-6.3-20220910.patch.gz \
+		ncurses-6.3-20220917.patch.gz \
+		ncurses-6.3-20220924.patch.gz \
+		ncurses-6.3-20221001.patch.gz \
+		ncurses-6.3-20221008.patch.gz \
+		ncurses-6.3-20221015.patch.gz \
+		ncurses-6.3-20221023.patch.gz \
+		ncurses-6.3-20221029.patch.gz \
+		ncurses-6.3-20221105.patch.gz \
+		ncurses-6.3-20221112.patch.gz \
+		ncurses-6.3-20221119.patch.gz \
+		ncurses-6.3-20221126.patch.gz \
+		ncurses-6.3-20221203.patch.gz \
 	)
 
-# ncurses-6.1-20191012.patch.gz
-NCURSES_IGNORE_CVES += CVE-2019-17594 CVE-2019-17595
-
 NCURSES_CONF_OPTS = \
 	--without-cxx \
 	--without-cxx-binding \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

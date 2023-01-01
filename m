Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8990DC3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38FAE405C1;
	Sun,  1 Jan 2023 23:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38FAE405C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0XR-Rc3O11kF; Sun,  1 Jan 2023 23:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AC64404C0;
	Sun,  1 Jan 2023 23:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AC64404C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A06B41BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8985A402F5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8985A402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwZFN4OQo9ho for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A53D54018F
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A53D54018F
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:17 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id j130so18187347oif.4
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/gT81Tz88mh/wX4GFlhTr/UK5cI5hpuw78PE0OBKg9g=;
 b=4iPg8UK654i2Ra/I9F/eY4Hv2jM262vgclLpCl1MMEjA11nkHb5EeQbfs/mt/gdr2g
 gVb2J1dE2jmoc3p2fav7taJD+lUxRKs7zccB/LaN3qff539ClUksv3Wrt5j8PzRsdWp/
 cVWqblvbNr/iJZya0nlChWtd3kfTIbP01hVL/H6Fv9YYTUDjbBVjwymPpLfLNLOtU0eK
 w5un7Jmewf8GDfrFBFMFKGEW3BFx5t9xJTp+cwzP1wkop7/WofqcQSxL8hMH8PcmBK5K
 3S9161ophjaE1DffDQnY4pyogZEUkocW+mnz9VHIBCfCLV59LP+MGUQceCuo+fDZXVmD
 +5hQ==
X-Gm-Message-State: AFqh2kpKqzr8V8UMFeZ23KhufvB1HVmDs4oRmfkcRZ0/cdi9ac/14UDI
 et//VCYtxlagYAke8UTAt8vm3+GByIY=
X-Google-Smtp-Source: AMrXdXsVrQn+PEpknl/7JDslLavkmLJ8He1n37pL5ZHlLHW37B4i7pAgU3nxsxuBNUnIZnAQAMG9Vg==
X-Received: by 2002:a05:6808:1b0e:b0:360:febd:ed44 with SMTP id
 bx14-20020a0568081b0e00b00360febded44mr23197475oib.51.1672616356719; 
 Sun, 01 Jan 2023 15:39:16 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:15 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:30 -0300
Message-Id: <20230101233653.487175-7-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/gT81Tz88mh/wX4GFlhTr/UK5cI5hpuw78PE0OBKg9g=;
 b=gTkrDf8lYRPTkq4GcYyuM2bVqfzTmLyQ6xaTQZ5Es3R7jYs/b1lwfktdchxZ920jKn
 EdX+MvLk8kBnPj65U15hqrUJBn+x8WIdwiC9ZEB1ecjuHz6+d5xhetodLBsOl1wKqgkY
 kMkJl+fVno+oAtY9JacNf/vHCVyA0hIl2l5M/5CRlFd1aY4iRVdWZWpYHbDv+Xer3qZu
 8fTyiXASPpqTpnmHD7Hu49oF4VS8oWLTCDbQJN9ZLeKL/wd2DXggB1h1TeluOd8ouYMD
 nsa+rty4a5xgL1Eus7K+iF818yaai5mkSNtV1SH8+Awet+6kdMfo0Zz8mo6U9h/LRrnA
 JZJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gTkrDf8l
Subject: [Buildroot] [PATCH 06/29] package/i2pd: really install
 configuration files
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While applying [1] the commit "fffbd2c9f7 i2pd: new package"
unintentionally removed completely the post-install hooks, so
I2PD_INSTALL_CONFIGURATION_FILES is declared but never called.

Fix the install of configuration files by adding the defined symbol to
the post-install hooks.

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20180327212401.5173-1-fontaine.fabrice@gmail.com/

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Tested using this minimal config:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_PACKAGE_I2PD=y

|--- output.before/build/packages-file-list.txt.sorted
|+++ output.after/build/packages-file-list.txt.sorted
|@@ -15486,0 +15487,2 @@
|+i2pd,./etc/i2pd/i2pd.conf
|+i2pd,./etc/i2pd/tunnels.conf
|@@ -15491,0 +15494,19 @@
|+i2pd,./var/lib/i2pd/certificates/family/gostcoin.crt
|+i2pd,./var/lib/i2pd/certificates/family/i2pd-dev.crt
|+i2pd,./var/lib/i2pd/certificates/family/i2p-dev.crt
|+i2pd,./var/lib/i2pd/certificates/family/mca2-i2p.crt
|+i2pd,./var/lib/i2pd/certificates/family/stormycloud.crt
|+i2pd,./var/lib/i2pd/certificates/family/volatile.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/acetone_at_mail.i2p.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/creativecowpat_at_mail.i2p.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/echelon3_at_mail.i2p.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/hankhill19580_at_gmail.com.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/hiduser0_at_mail.i2p.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/hottuna_at_mail.i2p.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/i2p-reseed_at_mk16.de.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/igor_at_novg.net.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/lazygravy_at_mail.i2p.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/orignal_at_mail.i2p.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/r4sas-reseed_at_mail.i2p.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/rambler_at_mail.i2p.crt
|+i2pd,./var/lib/i2pd/certificates/reseed/reseed_at_diva.exchange.crt
---
 package/i2pd/i2pd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index b99212be47..ad268a235c 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -44,6 +44,7 @@ define I2PD_INSTALL_CONFIGURATION_FILES
 	mkdir -p $(TARGET_DIR)/var/lib/i2pd
 	cp -a $(@D)/contrib/certificates $(TARGET_DIR)/var/lib/i2pd
 endef
+I2PD_POST_INSTALL_TARGET_HOOKS += I2PD_INSTALL_CONFIGURATION_FILES
 
 define I2PD_USERS
 	i2pd -1 i2pd -1 * /var/lib/i2pd - - I2P Daemon
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

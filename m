Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9172C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 346E2820EA;
	Thu,  8 Dec 2022 21:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346E2820EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3HaZUV34h01b; Thu,  8 Dec 2022 21:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 227F5820E4;
	Thu,  8 Dec 2022 21:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 227F5820E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CD831BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23C2F400FE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23C2F400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBnGMTLHPooh for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:10:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2158C400E7
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2158C400E7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:10:34 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id x22so6928299ejs.11
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:10:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:to:subject:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nMHl1TstwPdxOrGza22sN41CVNXFzdufNO6J33G12Tg=;
 b=XrU3PVM8Oa2W+SDjQya5OJMY9Q5GvXWnYS95bDVg+DN5vunnjO5lyfOmObIybuEf/I
 BSTJqWZcg9sYUrRL/zxLdb2PlycZwnIYEuCEyvyhMdkk6x2AibpcjblW7XVtYv85pSPd
 TWTG0pnElAlAJYnZLWQm6XcUncokUynrETAuIEEDdhOZpQyV7wf0whuADpIuuKywETz1
 nPLYHg/kKvMWVyTPAYI07KVSjyZ0JjoX8wepSpIv6jVyHue1SDBu3wgOP2OWPHtJbKxy
 N90mzbyp9F4EQR4W1Pp1+doIy+XTEiIbRsl3lqSOXghOgQy5qPjwOrP9x0mP59YYQno0
 LnxA==
X-Gm-Message-State: ANoB5pmnOsAsBf/b41Ki0Yib2ogz6k9fuZgsDjNG+EwMwQpJJlr4iVPG
 /aU2WrClKhlPEg0wYYmc2OyQTTVq3oV8x1MFhPA=
X-Google-Smtp-Source: AA0mqf5ykXzSE7QcVYo4BJxpV0ukLPpsLD7/hoIIb3rerpHVqUZSglxgcF6Zk5y0ef3iDsYm9evFqw==
X-Received: by 2002:a17:907:d110:b0:7b2:8432:770d with SMTP id
 uy16-20020a170907d11000b007b28432770dmr2767712ejc.7.1670533833353; 
 Thu, 08 Dec 2022 13:10:33 -0800 (PST)
Received: from [10.0.0.222] (5.186.52.63.static.fibianet.dk. [5.186.52.63])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a170906a10100b0078d3f96d293sm3378436ejy.30.2022.12.08.13.10.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:10:32 -0800 (PST)
Date: Thu, 08 Dec 2022 22:10:25 +0100
From: Stephan Henningsen <stephan@asklandd.dk>
To: buildroot@buildroot.org
Message-Id: <D5CLMR.W52FYUR7ME313@asklandd.dk>
X-Mailer: geary/43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asklandd-dk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:to:subject:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nMHl1TstwPdxOrGza22sN41CVNXFzdufNO6J33G12Tg=;
 b=mPy+w+hyqzZJ52zD2cTzpiV0u40L2jN1wpVSU5JymokGmsxrbZcZnqLiPUzUMlR6OU
 anz3n+xBtMy2w0InE8ukgudB8tjnFQhZmMITBZitMLHiUrjDgzXs4CD+z0+8AA9vcySD
 w8cxzZjzZpMUXTABm8d2mZmygatkjIB6g2wLvz7VS5H6xylc778+Ij4LFB7+U7ErvCVd
 0pZT6O/M3GEBB6IASAQVaK7PQZ32SBE+R0FM/EJC77W5PPqcj0mURcugtfuJreUBNeix
 UolGhyEA2bOEXMC9zkmLEBeMY2OqjQORykYCmQPejo5DKGZTQ2uwLvuU3xM9oGZ4/e9Z
 Z+Fg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=asklandd-dk.20210112.gappssmtp.com
 header.i=@asklandd-dk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=mPy+w+hy
Subject: [Buildroot] linux-firmware-bump-to-20221109.patch
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

linux-firmware.mk: bump to release 20221109
linux-firmware.hash: add hash of bumped tarball, remove hash of deleted 
files

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>

diff -purN linux-firmware.orig/linux-firmware.hash 
linux-firmware/linux-firmware.hash
--- linux-firmware.orig/linux-firmware.hash 2022-12-08 
21:35:15.051696882 +0100
+++ linux-firmware/linux-firmware.hash 2022-12-01 00:17:16.257440762 
+0100
@@ -1,5 +1,5 @@
 # From 
https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256 
e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5 
linux-firmware-20221012.tar.xz
+sha256 
c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701 
linux-firmware-20221109.tar.xz

 # Hash for license files
 sha256 
8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 
LICENCE.Abilis
@@ -14,11 +14,9 @@ sha256 a5777f9e80aca0603b0648454de99616
 sha256 
ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f 
LICENCE.cypress
 sha256 
60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83 
LICENCE.fw_sst_0f28
 sha256 
5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4 
LICENCE.ibt_firmware
-sha256 
8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c 
LICENSE.ice_enhanced
 sha256 
0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d 
LICENCE.it913x
 sha256 
16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5 
LICENCE.iwlwifi_firmware
 sha256 
0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3 
LICENCE.microchip
-sha256 
59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4 
LICENCE.moxa
 sha256 
2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4d25c 
LICENCE.qat_firmware
 sha256 
4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822 
LICENCE.qla2xxx
 sha256 
d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd 
LICENCE.ralink-firmware.txt
@@ -35,6 +33,7 @@ sha256 8542aeabf2761935122d693561e16766
 sha256 
be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc 
LICENSE.qcom
 sha256 
fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f 
LICENSE.radeon
 sha256 
2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9 
LICENSE.sdma_firmware
-sha256 
6857749e23d6a2853e5d33f6d6012a60d5baa2b4d51b5f8c6799d00d68733841 WHENCE
+sha256 
75afdb5d45a21ff95ff7aa82d67bc42a83830f2def98ea937c01d6e7603d76f9 WHENCE
 sha256 
fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a 
qcom/NOTICE.txt
 sha256 
bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604 
LICENCE.e100
+
diff -purN linux-firmware.orig/linux-firmware.mk 
linux-firmware/linux-firmware.mk
--- linux-firmware.orig/linux-firmware.mk 2022-12-08 21:35:15.051696882 
+0100
+++ linux-firmware/linux-firmware.mk 2022-12-08 21:38:27.868382561 +0100
@@ -4,7 +4,7 @@
 #
 
################################################################################

-LINUX_FIRMWARE_VERSION = 20221012
+LINUX_FIRMWARE_VERSION = 20221109
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

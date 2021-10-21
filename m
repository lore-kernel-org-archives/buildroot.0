Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28B6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 21:20:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B98DA6121F
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 21:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B98DA6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8491D606A3;
	Thu, 21 Oct 2021 21:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFUOVTpgyXlx; Thu, 21 Oct 2021 21:20:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7E3A60685;
	Thu, 21 Oct 2021 21:20:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 243D71BF4E6
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 21:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14D5583BC3
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 21:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDIU8K37xYsh for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 21:20:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3588383BB2
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 21:20:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k7so1492227wrd.13
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 14:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ADuCA1AqIZaNiYvD92+0GMc+6D2SaJBAlRg1kLiC5M0=;
 b=C3fY3xeOCMWK2fPEDP3n7HutNH3sLmACL5sedHqJxRdoW6IWwnqeTfgqtl8f1eFi00
 Q1ZkaoKv/mgPs4bpPqYqfEys4heyIfULhaohE4fPgoA2gl+LuMbe32ARcxZxo19T21NM
 SXYyN6p1CuHglDeu4e7nAtRJ0V9nKkk/ZT+n1jPb0Fs5v1sJ/QxQLnRgcDGPVFbyrf8K
 gaVfxfDh3x+fKvaEnqk1VE9DHggpaId2xQu/zBs/NYZsK9MUF1G2hPF6alfi3O9NaPS0
 8gWW1m2/9Q+dMVJ4VOYDRVM/TsitbWsPW5XkEkVIfSxQjXZzHyoTcxJIBRkjlX42MV8f
 Cd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ADuCA1AqIZaNiYvD92+0GMc+6D2SaJBAlRg1kLiC5M0=;
 b=Y1JOVr0A8CPFtyPb/oGmV/t0R9LjLjFbnAcwlbjzzgl4x7kJ74JDWnpTYErzFlrWYZ
 R00CzAya51NsqNV5FtKjIiitDJy58VVEToOgYOtnFeUjnJCRZJyAUbn5Ut7EHzVgAFJt
 p9BS7VpRK3VRfZ+CHaD6ffpWjX3hgJ0mZ7U3RjTXFOP+ORs/vaN0azK8w466riMG3eO8
 yLcymV5VoekzsddKha5iRhU/cg1P0ic2fkSl6aFzH5kFGbpane7s/Gj3frX1l2CY78tS
 KaThWckANXWtgKv+eXa8hzXJikDB21dQzvPnULF7pijLXDmndWsRdMB+YuQat7GZ7JoM
 7Fuw==
X-Gm-Message-State: AOAM531cxmPoPj3a4iN3oHbBicsxKqEeieZ4u0Fly5lvgGs5X2lMdbZH
 bkNRRJ462bTp5j5Dg6ER9gLg9HXRP6M=
X-Google-Smtp-Source: ABdhPJwc9LI/8gvR4GsHFOWrFV7vhP6k1TKd812s+nc56oNd3X7NGzy1rNMc4nZPOB6Y2UM+rExhIw==
X-Received: by 2002:a5d:508b:: with SMTP id a11mr10686212wrt.417.1634851213272; 
 Thu, 21 Oct 2021 14:20:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id n66sm6084177wmn.2.2021.10.21.14.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:20:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 23:18:50 +0200
Message-Id: <20211021211850.149120-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/firmware-utils: requires DES
 support in openssl
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 21d2a0c2ecfdddb250007ce75d1839ba81278e5b:

/home/giuliobenetti/autobuild/run/instance-0/output-1/build/firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4/src/mkhilinkfw.c:54:8: error: unknown type name 'DES_key_schedule'
   54 | static DES_key_schedule schedule;
      |        ^~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/0563b24ccb7dd242998e1b59b217405c6340e276

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/firmware-utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/firmware-utils/Config.in b/package/firmware-utils/Config.in
index 9e47263d73..501b89b453 100644
--- a/package/firmware-utils/Config.in
+++ b/package/firmware-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FIRMWARE_UTILS
 	bool "firmware-utils"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  Firmware utils are tools that can be used for managing
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD324C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 06:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23C3A61228;
	Fri, 14 Oct 2022 06:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23C3A61228
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id auWWKw2zq12d; Fri, 14 Oct 2022 06:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B47661223;
	Fri, 14 Oct 2022 06:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B47661223
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E5B21BF20D
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDAF083DEF
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDAF083DEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ODUvy3V7ch8 for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 06:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1BC5832DB
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1BC5832DB
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 06:59:05 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r14so5606486edc.7
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 23:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qCeOWq5r2geWN6hyfQga5Hko6PRVZ8LRc7KA1hEeKnw=;
 b=taLpTuAjEqowdxLue/V+1+XrHvWnUPNFVDfLShvarDCLzXXLzz+RiveBvIY7dC35Cc
 n4UDKmczVcOAIGEvXMeVVD6BmC9EOHEDpIBuekQYc3lCc/RQcuHF5pFCsmHKd7VwLlv/
 W5ucHhxANSQEQM6rh2IqB17PThhYaqQh/XJ5XldAsGGISVADAh3yyuPfKS1LwKGq2JT0
 IhodsQPLI0n0BmyVo2Pj1DDg+celjFBtN1kh8srCYpWxgK0SSBKBzNf6QT0AFXcUW9CM
 m2gkV0zOgHrn3rzJO8II6bwUyIi6sVpBAEbv1+xq0qeJEA+qzHQKeAstsyDjtDtSmo3V
 qujA==
X-Gm-Message-State: ACrzQf2b/F5LVoLFx1iavVRSFwFrrVUqV6c3eiha9wAwzCRNig4GZ7Wc
 3MN0u53/bR5vFqLEoEYIps+wrkJYclZrmg==
X-Google-Smtp-Source: AMsMyM4DhZ4S3RMSS2fCxNZu/nIIVlnImLRUOABN393Rfc4GZTxQKFQcY4uBJTdPbEiDnsUspG78uw==
X-Received: by 2002:a05:6402:414d:b0:451:73f0:e113 with SMTP id
 x13-20020a056402414d00b0045173f0e113mr3062033eda.207.1665730743833; 
 Thu, 13 Oct 2022 23:59:03 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 u13-20020aa7d54d000000b00458478a4295sm1285550edr.9.2022.10.13.23.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 23:59:03 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 08:58:55 +0200
Message-Id: <20221014065900.3311604-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qCeOWq5r2geWN6hyfQga5Hko6PRVZ8LRc7KA1hEeKnw=;
 b=Ra0L922q0v8QNo93MCdFzop4XT7YxxZLJqmCKK8xtrom4pRXjxZSu4rfra3AoE+a0W
 VRe2Xky38c9V4JVwwR2lwCn4SvW0iyOPJE9jLLSLDimkqimmbFrEeVoekhLcaZRCzS99
 mm58iEfyz3bIvwYOjygdJc1I99YN+06ulKi4o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ra0L922q
Subject: [Buildroot] [PATCH v2 0/5] Lichee RV and Lichee RV dock support
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to support bluetooth on the dock, I had to fully enable the
CONFIG_EXTRA_FIRMWARE mechanism: indeed the bluetooth driver requires a
firmware which is not available at the moment of loading if not embedded
in the kernel image.

I choose to install the extra firmware files in staging, so there is no
need to clean the target filesystem for those files after building the
kernel.
 
The macro KCONFIG_APPEND_OPT was needed so each one of the packages
willing to have a firmware embedded can simply have a

$(call KCONFIG_APPEND_OPT,CONFIG_EXTRA_FIRMWARE,firmware.bin)

Changelog:
v2:
* Renamed the configs from lichee_rv_* to sipeed_lichee_rv_*
* Moved the boards directories intoboard/sipeed
* Added bluetooth support for lichee_rv_dock
* Updated the opensbi, uboot, linux version to the same as nezha


Angelo Compagnucci (5):
  linux: enable CONFIG_EXTRA_FIRMWARE_DIR
  package/pkg-utils: add KCONFIG_APPEND_OPT
  ackage/rtl8723ds-bt: new package
  configs/lichee_rv: new defconfig
  configs/lichee_rv_dock: new defconfig

 board/sipeed/lichee_rv/genimage.cfg           | 37 +++++++++++++
 ...t-building-u-boot.toc1-for-lichee-rv.patch | 54 +++++++++++++++++++
 board/sipeed/lichee_rv/readme.txt             | 26 +++++++++
 board/sipeed/lichee_rv_dock/genimage.cfg      | 37 +++++++++++++
 .../overlay/etc/network/interfaces            |  7 +++
 .../overlay/etc/wpa_supplicant.conf           |  8 +++
 ...t-building-u-boot.toc1-for-lichee-rv.patch | 54 +++++++++++++++++++
 ...-d1-lichee-rv-dock-add-bluetooth-bin.patch | 33 ++++++++++++
 board/sipeed/lichee_rv_dock/readme.txt        | 45 ++++++++++++++++
 configs/sipeed_lichee_rv_defconfig            | 34 ++++++++++++
 configs/sipeed_lichee_rv_dock_defconfig       | 40 ++++++++++++++
 linux/linux.mk                                |  6 ++-
 package/Config.in                             |  1 +
 package/pkg-utils.mk                          | 10 ++++
 package/rtl8723ds-bt/Config.in                |  6 +++
 package/rtl8723ds-bt/rtl8723ds-bt.hash        |  2 +
 package/rtl8723ds-bt/rtl8723ds-bt.mk          | 28 ++++++++++
 17 files changed, 427 insertions(+), 1 deletion(-)
 create mode 100644 board/sipeed/lichee_rv/genimage.cfg
 create mode 100644 board/sipeed/lichee_rv/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
 create mode 100644 board/sipeed/lichee_rv/readme.txt
 create mode 100644 board/sipeed/lichee_rv_dock/genimage.cfg
 create mode 100644 board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
 create mode 100644 board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
 create mode 100644 board/sipeed/lichee_rv_dock/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-lichee-rv.patch
 create mode 100644 board/sipeed/lichee_rv_dock/patches/uboot/0002-RISCV-dts-sun20i-d1-lichee-rv-dock-add-bluetooth-bin.patch
 create mode 100644 board/sipeed/lichee_rv_dock/readme.txt
 create mode 100644 configs/sipeed_lichee_rv_defconfig
 create mode 100644 configs/sipeed_lichee_rv_dock_defconfig
 create mode 100644 package/rtl8723ds-bt/Config.in
 create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.hash
 create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

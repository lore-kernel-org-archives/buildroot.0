Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B433FC55184
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 03:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B537606FF;
	Tue,  4 Aug 2026 03:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAEbzYYNo0c6; Tue,  4 Aug 2026 03:24:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE88B606F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785813898;
	bh=VJgUsO+AtqjKp9Lvsm/jJR+NdXyuDv69jUi3JV0t9f4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZwXYqlmQCgv1tOzwERBBa7RY46T2KFesQ88l4hfygFAhmNMmG6QXjKdS/cdHmhRa7
	 mjtxZuoot9my2OkKqGs5zfAeMswfUbiZ1dfgZj+RhAxaNkXfKdRaSdYE2kE0Kaa8k6
	 a3mz9AwllnbuJNsTvDDa0oYCmPTaH9OHov1Qsjc/1Cm066WEF8GfuhOj1ROJN7PwcJ
	 K6X3zLj6ry7rPCZ05shryWL62RClk1nmMjJlgYt4SzDZbvzgK1m0u/zYUjnTAJh4Ql
	 LUDCCgcoUhWgK3uTwmcZmJV0ClDbCXM5IjJuNZSCF/ZbP/gqUbHeN1w8COWE6Fv2YM
	 eJHTBnhB706Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE88B606F6;
	Tue,  4 Aug 2026 03:24:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83E9626C
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 03:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 697F3405DF
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 03:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISo9_eyaC9Oc for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 03:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED90B405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED90B405A1
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED90B405A1
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 03:24:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso17827085e9.1
 for <buildroot@buildroot.org>; Mon, 03 Aug 2026 20:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785813894; x=1786418694;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NWPO96DTZPmYxIv3w1/IIGMLQqTf1eAEF9pOrsu0Ioo=;
 b=J/KsKsA6pkMiFzGqt0FGWOidLVfM9vtuWKMH2ChqbvIe5E/bXO/T0Je4yWXm1RPsY4
 Q3Ra8l04UFU58Gfwwya5ERJW0ldvTNW5M513B/f1GV1Pg1Ia04xkVCvNBK3aYiRACOIo
 OoTllq9oj100nPGsXPNTVSXLD48fNefYqSii1/OOSp8mAbjaBxg6t6u60LKqE91dIk/w
 0LvEkeDjT48UwXZZctPjmeK+viZBsJRrIWt8qYMG4wIB1CJrqWPaL9dzhvgZeuWJG+WN
 RTMJ3djJmYYzypER/nJd/XL5ki2ts2MyKz9sNJ16P63Oh+1TXxRMxa8mNsFZBCtL5ryX
 t0YA==
X-Gm-Message-State: AOJu0YzYMwc7S81DJ0tg+pxTMSB3qV51oV0gb4KIWeQEdm2Pj5Ss6Z1N
 tkZnRwQtg4Q2wqCnTmGjyAO388GNMXdCLHLuFshX6Kvp7dzTW+6FYVfMUPKSThxY
X-Gm-Gg: AR+sD12I4O+o2J758qp8j8+xNmMHRV3vchSNZAGAOVL9LoSJZyE6Q5JkGjbdP4YG/ii
 xaEWS5+Rf1Z/rIRGSp0rEibtdCVDvWfg9J9QapNWeVT4qdvyTOMweGzemHmxxzj7mwrNTsUQ7yR
 drsZTS3tR2ETgv7hW9peHNjAYxl2I8YK8gVg53Hbo0Ow0He6Mfo2YhnyttQ0danCLylI3eMyNPG
 xiY5JSJaqowUnDUoRY71bSU0uKZhXpYQKF2oePp5Bwgt8J6O6jc4hqR3SOeOuYqMWlSkFnyzCFZ
 Rpt1q5/gA5IWdg1U5LUQRPYA5MMxqIrX5gaNpJnc88U0dQdSjKT0TUABBgampgNWhbyEq9i56c1
 W/ypx4PwoWFu17mRxUlZ7ckDA/Bg8m1NTpFtfQWxUsCsPBmo9wuGt+/4BTxszrrv4BLg+EpX6nP
 XRliCqz50m9ry2nxC9VyQpUszz64Rny+0vqrj2HkirbG9vFofYORK0WAbtbNly0RM=
X-Received: by 2002:a05:600c:4504:b0:493:c194:4e7a with SMTP id
 5b1f17b1804b1-4980c66c9a8mr268179925e9.3.1785813893657; 
 Mon, 03 Aug 2026 20:24:53 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b85be7sm353153085e9.2.2026.08.03.20.24.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 20:24:53 -0700 (PDT)
Message-ID: <6a715b85.d419c4af.21dba5.d77b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 04 Aug 2026 03:24:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785813894; x=1786418694; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NWPO96DTZPmYxIv3w1/IIGMLQqTf1eAEF9pOrsu0Ioo=;
 b=IhMHwRmCGsbeURdpnZ3YuZARi/gy9i75Rk7ojhkg4sT0AXs61NbWy/Qe9JAWh1zkga
 TKx0dhoWK5ulruYnT2XjB67/3bGzyGsbIc1XxLXlAvgd/4fGjqxxQwoKHUXKuXYloFXU
 HBorbkbT3g2u/TU75viU7xtRkq18i9QQj5iARpv0IZyLLfTOUpgIv+/ZkwKP13dHCQfi
 0XPtRImg8DYqxREQJsSeZc0Ld3sE6BQC68XxobuXv1k3uKjMgwqIVpqxoHmzUYYGaWC9
 BfoYl43byVodtLcCz3f1j2gxOIQYAZM6A/x4LlL/R+hZONgur13DDDi9TPYlNpy7n6UI
 pxPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=IhMHwRmC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-03
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-08-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  2  |  0  |  3  |
  2026.02.x  |  1  |  4  |  0  |  5  |
    master   | 23  | 51  |  0  | 74  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 3 
                   atop-2.13.0 | 2 
                flannel-0.26.0 | 2 
glibc-2.43-45-gdae425b55420... | 2 
  gobject-introspection-1.84.0 | 2 
                host-wine-11.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
             alsa-lib-1.2.16.1 | 1 
                    attr-2.6.0 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2026.6.1 | 1 
                coreutils-9.10 | 1 
                     cpio-2.15 | 1 
           crucible-2025.05.28 | 1 
                  delve-1.22.1 | 1 
               freeipmi-1.6.18 | 1 
            gdk-pixbuf-2.42.12 | 1 
               gocryptfs-2.3.2 | 1 
                    grub2-2.14 | 1 
host-am335x-pru-package-5f3... | 1 
              host-rust-1.97.1 | 1 
              jpeg-turbo-3.2.0 | 1 
                     kbd-2.9.0 | 1 
                 lcdproc-0.5.9 | 1 
               libepoxy-1.5.10 | 1 
           libmicrohttpd-1.0.9 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260529 | 1 
                    musl-1.2.6 | 1 
                  netcat-0.7.1 | 1 
                    olsr-0.9.8 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.42.2 | 1 
                     php-8.5.9 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                 rtptools-1.22 | 1 
                      sed-4.10 | 1 
                  stunnel-5.78 | 1 
                    szip-2.1.1 | 1 
               tcf-agent-1.8.0 | 1 
                 uclibc-1.0.58 | 1 
uclibc-ng-test-132c6134d691... | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/a1a0f17d170a482a67d280bd0e5a759fbd004d3a |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/76144af102db5dc5c6e47ea667ec427e86c85d22 |     
microblazeel |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/8196dbb3467c01a205cf242e83472043e68b75ce |     
    i586     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/18802b366a20c223ec712e77987419fd44e3df7a |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/add5b56e00cbb29ad6afb89579059c8084b9fe8e | ORPH
   x86_64    |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/6c77eadc3becff3b60a365337edc376acc1e75ae |     
  riscv64    |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/4fcc1e0716e029ddc11680c9e134271acf7d02d5 | ORPH
    i686     |           cpio-2.15            | NOK | https://autobuild.buildroot.org/results/f4fc05f5ff0c8149b8177787376e7f1b64085ef3 | ORPH
    i686     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/ce639372c58cf835a660d265d061f20dac163abb |     
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/69122f0c7c271b4f0cd68c6e3cd25cb8a3b1a70b |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/48d2ab3a14d2bab8bcc5bef6994f0706b0ad89b5 |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/ad409771fccc94baa9db8a2503096441812537ee |     
    i686     |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/3cc3c06fd4c60e4c17f8eca2a130354163786d35 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/064e22ba404fd1a48aa51252ca0c222f2e84e00d | ORPH
    mips     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/3e2f1d06e400146a69a2314f51c5717929599064 |     
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/ee501862f35a368f8fec058fd3d43f5557399d81 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2e42f00b4a1ab1a1a10b229fbfcc122d2a24a63f | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f4cd6ce17f4e0ce5370583b2e38ea5287ca4dd31 | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/f7157a37ebe2b7a5fd7da7369309aaf31d37ead9 |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/80d6c9b3129893d9d366740187efcc02593d3a5e |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/37f76d7ca703e36dbb715253d8734ae78cb325b8 |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/2eac841e2fe5e3e1354d216a601742a78d8bb8d4 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/4210c0d4bc823a13779a465f8d5858d110ab86f7 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/95372c4fa1788c048caebd627b1104b462405d9b |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/2e3a01da3de0d39d46716cc4ba0f44770608322b |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/3d06f921053bc9fe265d08acbb3db383e98769c1 | ORPH
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/9210308328bea003e51c1a78d31942592a78d1a6 | ORPH
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/a19a1d5c498fbbbe4c639ed0ab2fbe7bd5922a57 |     
    i686     |      libmicrohttpd-1.0.9       | NOK | https://autobuild.buildroot.org/results/ff605341a8cd40f1297bee128c701a71c641bfa5 |     
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/1e4ca04df6c6cbb84f1a1056cc71f465eb5e48aa | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/bdc12b509b0662a33763b26bc199b627e7d777b6 |     
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/3f6f026099b15ce1729748b3767ae62a5eb17ea8 |     
    i586     |          netcat-0.7.1          | NOK | https://autobuild.buildroot.org/results/480e8c3b2ae2b0f44467f85da0e95bd44407d7c9 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/c9914f5cdd597cfe8e150de5b593f198c8920b48 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/906d5d5766bb3e30bb0eaf4ccb5b00015fa1a9cb | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7b654edffaa7c040f834652dfb96927ae1dc7f87 |     
    i686     |           php-8.5.9            | NOK | https://autobuild.buildroot.org/results/45c9271bf504c8f241544806ad52b82d6efb711a |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/50b4addfbf25eaafc458aa9b7535253d174c2667 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/3242ca4f524ca742f5f0d867470e44a163534e72 | ORPH
    i586     |            sed-4.10            | NOK | https://autobuild.buildroot.org/results/4681c7f0abf3d622595cb31056b11be4710522b6 | ORPH
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/35380d34df7f2cbea9383e9933576881d9aa502d |     
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/4ad0cd2ea9397cf61518628e8e4ae131818e91cf |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e3abcf9ca0710b029efa935cbcbae6205f7cb83b |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/3126dbd9a43c1ae507c3e246be0cabddc9937089 |     
  riscv64    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/49c6f65fd27ae16ca185551154baf12e1bfcf610 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/68630cd8bc5bd372e44d35ff3b0b6e8123fed31c | ORPH
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/93b3552bca73c0b3f9bd70ae487646c97417a96d | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8a30e850857a04dc45011032f9a63ed23088e145 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c63dac5bab9a99dc72cd31c251e7a46b81af0dad |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e1bfb1673d7343a14cb810300832bea2597e848d |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/3ff5b2755ca77f6c34df67bbb47840910961a020 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                easydbus-0.1.0 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
                   linux-tools | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/d777323586450423354214f93818d65b7a2cbd78 |     
    i686     | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/c62fcbcb01ced74d714ad4ae9f8a1857d0df4604 |     
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7c125a6bf5a26e427a328d636a4591bde9180619 | ORPH
    i586     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/41bd4911be93e290fd1bc26144315b0c86745419 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   perl-5.40.4 | 1 
      softether-4.30-9700-beta | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/c95d45625d558b7d2d61a0f5ac7527637e813fd3 |     
    i686     |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/0118d260caaa47f7bb25c35bacd712afa34b87f3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

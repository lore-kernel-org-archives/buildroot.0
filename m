Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD04DCFD36C
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 04:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3326340B25;
	Tue, 25 Nov 2025 04:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aqFwqWXXwmG; Tue, 25 Nov 2025 04:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A3940AFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A3940AFB;
	Tue, 25 Nov 2025 04:20:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88612359
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 04:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EAF4815CF
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 04:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eryMdrkj9gwT for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 04:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3C408156B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3C408156B
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3C408156B
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 04:20:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779a637712so30401275e9.1
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764044434; x=1764649234;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEPH67+rFBqQKWhm72+Bd8MPOsJPJfV8GwVuBpxwQTE=;
 b=jd1L9vu8vTfEql/Sbfs1CGuNwpGdIcCfGVhjlAr8G1fb1dNeb/OH4f+w55Groui5pi
 yWBGyJVyulJ6Fi1EUndI29SPlNgbH68mDpgq6HuXjZDDbHC/LyZXZJmsTrYJvexXQ7ck
 +GSEjWrZEk8UeDgU26WR6i3Jol61v8biMRgcv0vpoTZiSpZoAnL7cmtP8r/IlRO0UZN8
 visWxIRnZI8hqTqndNv3FlT9PTkf2JH0fYWNbMAKSZB5/tJZ/rmDY1zZDRYQbhDY3amr
 KekfMOiFK1DOteLFr7+uQw1BL4IgkqFMdaALFMHuHJBvP64CFF2yAaT6nbT67Upgy0S8
 1AIg==
X-Gm-Message-State: AOJu0YyvqV97km2BaXT09R1Qiy9zuKfNIA43jFqqQ46p24K5KZKZSdjo
 uG0Ifmnpfvs89xxiWD6iqiIoMML1IWRcnJSne6oFBEmYYhuZQSaeiwrMsTdtmA==
X-Gm-Gg: ASbGncuKTmzTERSF1PyBgCb1r3S+8fyKFYosWks0PkoQY31R+a08qwVP2Df8faVHJql
 ZzDeb6bSKJfpLm5RnPQe2vTOwr4oUxaifB5d8P+hU/S1JWshkVe78rTLxWB7Trb4GrfF/xNT989
 n5a4eY+ceTvF91AIQQnrrYx0GjXvQYqhK/rrhdu9Sn4ZrxKq8BQzLn2NzgXxnNAwwxL+3vzeUyw
 V3LKKlVRyyN0YEu2o+/35M+47Co85QW1Yc/C428VfFz5eVUXQ3X9/6hrYHTmWXnzndoSQ4YTUcI
 ZttymhEgnJ37b79Kkbfkm7W3y5Ip9ddQ7Tp77ez4jDu1CEH1sOXSwmgkJqih36ow1GrDQOVkXU7
 58V2zzU+n0ntpqUz2d2sclhY8cFuAYh6MnWyvapRDu+L4Y1ubxacRdimlszziUt1WOxUWgu29XJ
 K0ncd6IwfLMmnzPDvD1g==
X-Google-Smtp-Source: AGHT+IFpFhyMiwDY+oNLHXt3Tj7turaV0OLItrsbHE79T4YYn2UP0+h5M1XuxQOEOOdZqBlh1cKDvw==
X-Received: by 2002:a05:600c:1c88:b0:477:9cdb:e337 with SMTP id
 5b1f17b1804b1-477c0165badmr163084945e9.7.1764044433467; 
 Mon, 24 Nov 2025 20:20:33 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479040ac7e8sm9405985e9.1.2025.11.24.20.20.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 20:20:33 -0800 (PST)
Message-ID: <69252e91.050a0220.3d9c1f.77e0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 25 Nov 2025 04:20:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764044434; x=1764649234; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OEPH67+rFBqQKWhm72+Bd8MPOsJPJfV8GwVuBpxwQTE=;
 b=UV2VnPzjlyVvR1AZvc+x+P+U4R9Ktlnje7TjImPM45AwXLZef/JP0y2c7Brpt9qvx+
 rnpsoSh4K0K1IymImpiKBrMPN0K90AFFycz+UKPrjIrgCqzlEFJOmdf8IyOG7jraZ4j7
 qhGsOJW4+XmENRsXWsYUWdKkSXPmtTvMSUnELj8ScV7bky1RAIK4ZKQVLY0+vpS8f0Qd
 SL8U/4aVxFRFju+94lC0XEMjoElRhtHjveJfdhAdthXgL9U4fgsQxDqLFDGoOt80N+0s
 nNE9+6yzwk89qWYy4Ba9k9XwLlMsfml8ofBwQxUCT78y0eyyVzONiaFKyxQsuuk1W8A2
 3Cpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UV2VnPzj
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-24
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

Autobuild statistics for 2025-11-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 10  |  0  | 19  |
  2025.05.x  |  4  |  3  |  0  |  7  |
  2025.08.x  |  3  |  4  |  0  |  7  |
    master   | 37  | 78  |  0  | 115 |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 8 
                       unknown | 5 
                   libcap-2.77 | 4 
glibc-2.42-3-gbc13db7393773... | 3 
                  linux-6.17.8 | 3 
                  brotli-1.2.0 | 2 
                   cvs-1.12.13 | 2 
          esp-hosted-1.0.4.0.0 | 2 
                      fio-3.41 | 2 
               libconfig-1.8.1 | 2 
     libphidget-2.1.9.20190409 | 2 
                netdata-1.37.1 | 2 
                   perl-5.40.2 | 2 
                python3-3.13.9 | 2 
             util-linux-2.41.1 | 2 
                 babeld-1.13.1 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.4 | 1 
                 cdrkit-1.1.11 | 1 
              containerd-2.0.2 | 1 
                   dante-1.4.4 | 1 
                   dav1d-1.5.2 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202508 | 1 
                espflash-4.0.1 | 1 
                    gcr-3.40.0 | 1 
           ghostscript-10.06.0 | 1 
            host-gnutls-3.8.11 | 1 
              host-guile-3.0.9 | 1 
           libmicrohttpd-1.0.2 | 1 
              libopenssl-3.6.0 | 1 
                  libva-2.22.0 | 1 
            libxkbcommon-1.9.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                lmbench-3.0-a9 | 1 
                    lz4-1.10.0 | 1 
                memtest86-7.20 | 1 
              netavark-v1.17.0 | 1 
             ntfs-3g-2022.10.3 | 1 
                openocd-0.12.0 | 1 
      passt-2025_06_11.0293c6f | 1 
     s6-portable-utils-2.3.0.4 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             stress-ng-0.19.06 | 1 
               syslog-ng-4.8.3 | 1 
                systemd-257.10 | 1 
               trousers-0.3.15 | 1 
              udpcast-20230924 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/01c4f8f3fd1789773424a529305efa61942b7bcb |     
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/6c63b97692480b0e322b3d285a6b0c335fb6c153 | ORPH
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/e69eac23a0b20e98e159a9a905bae8f10e42227b |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/29e642865ced625e4f9250a8ae0658b334ba50d1 |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/0e962c66e1e96b5899e87c13ace824379adc09f9 |     
   arceb     |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/3b291dee9975e7a23c7497e39dccbbe16e593a0f |     
  riscv64    |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/65a5f92483986e7e1174c208c95cd58d769b5e4a |     
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1885f35da1b5e40aac5ce3b2ef05b55b03a74dca | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d75417372a9d90fa970373e085df81abbbbe17ff | ORPH
  powerpc    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/4bb8ea568e1fef3b4073058d5d2582596bcea661 | ORPH
   arceb     |          dav1d-1.5.2           | NOK | https://autobuild.buildroot.org/results/d5902785aa2b62ff2aefc039ab2ea9f21226160b |     
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/4309ce744e379c248517e0b0b19410e032f442dc | ORPH
    i586     |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/c2c8647f14d3a28243f8a780c84befa088603300 |     
    or1k     |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/a8f830cb84754ab9cf68ab4745ea3d5050611e1e |     
   x86_64    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/941d4d961094d5a3ab7f7e87adf4b8ffc5de79ea |     
    arm      |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/275a28c18e9efd874174317f75373dc89f5b5ab1 |     
    mips     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/3272cd73144152a6e5fc7b7649b6ccbe187283be |     
    m68k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e8fccc217fb4b779811d2232a26c6600c7610354 |     
    m68k     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/93cdeb7218cc07df0f273ec69299c328b74adfcf | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/ae92bcadebf5823589fe235a80ce1f20651b88a5 |     
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/b6595b6c7eed0e164bc0693f78d61411c9216cbc |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/68682592209961eaa53f18bd8e58afd790f6f08b |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/daefeea426ac92015e9a0b2cbaf7fc19ed39b5ba |     
   sh4eb     |       host-gnutls-3.8.11       | NOK | https://autobuild.buildroot.org/results/79a8404c8fd10e8642601bebeb7b47b7ffcdc103 | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/162749c5bfe401e961a0d0020c1540bd1e46dc76 |     
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/3f811977840737988fdaa27b4b1d6ef2102c8818 | ORPH
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/af3ab102a9616d785594169b13f31cd07fc6a41e | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/3352923e40a99e2295ff5e5d7df4d8f8abbb405f | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/5300dc4d1776159c95859d5bc003b7cbf4f30ea5 | ORPH
    or1k     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/2f356cc47aa2199c3e48071529a109e10cda8684 | ORPH
   mipsel    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d42b08f7dc4ea149a8d58ff328e3c3518aa8e256 | ORPH
 powerpc64   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/ed6495d26ca650aad2dc1578af1ebed855b116b1 | ORPH
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/49d52f56143a8ab5f60124529bcc7a899a1d7d2d | ORPH
   armeb     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/cced9579f79952ca3c509fece6be235c12ce5f06 |     
    or1k     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/f9d571d48c8ef454abdce31e98dcda86530b1d5b |     
    i686     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/e9cd8f01fb68bf7f0c98683a35d710240b297f18 |     
   mipsel    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/c2ffa90f516d491c0e7cb2006801b52797de4a78 |     
    m68k     |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/c0d69231a801373642c47ab8ab45a39cc98c13ef |     
powerpc64le  |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/89b15ed871a7d8e2a789d1d9a1bab11b7f50274b |     
    arm      |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/25f688beb98e5835fe85d78c7b13eef78b9911eb |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/9da8dc524013ad1d7e5e790541bbc45fe66c989a | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/18f61d8a3f07baf012b69df5837ec4725c0f603a |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5b05644e9e96704a779bc805aa409e21f8a8e7ee |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/aecf81297e6789cc227a1a9625d5ecc6545360da |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/e8dcb9879df1b717052c3b2932079c814a73aad4 |     
   arceb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/34a4e873c492da686912b797bd96170e88b02def | ORPH
  powerpc    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/e74620d4f03f876cbd8ee5f56b5611d0496aea41 | ORPH
    arm      |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/e06336e2df76c2f78a48163bd4b934cd2aa6b242 | ORPH
   mipsel    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/e7d6c631ec7c3ad074f8473116ffa14d98eaa7a6 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7f930d4bf60cbf2506580a75416a11734b69a0fc | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/189219853fbe1b7daf0aaad29279858c6e60507b | ORPH
   mips64    |           lz4-1.10.0           | NOK | https://autobuild.buildroot.org/results/bab39f94149348a0f19c72270f1078f93fa101d0 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/d629ccc3db7c75cfe5e7f9479bdae067268b7abc |     
  aarch64    |        netavark-v1.17.0        | NOK | https://autobuild.buildroot.org/results/eefab607dc0442ad0ddaa020aaac40a700ae6390 | ORPH
 aarch64_be  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/7f76b6ede27b86514fc10d214f1956802f0f0921 |     
   mips64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/27adb088020c70f07856934b369782d26b9a090a |     
powerpc64le  |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/1a923ad44de2330214ba39685bb07301d5c82774 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/f587e994245068f377160b2ccfe38c006cb574f4 | ORPH
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9e5747c09927ea133616edd0d43249ff1ea01c8b | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/178d89f6b264f0f663f0b443da58b40c73a24d02 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8a7e45281e715c631ccad8a14f8844c4564492ee |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/56f7a7d429086be1df45de1b82fa79f00ac883e4 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/e8312b5864968d2fbe3f885d011d77c226fb657b |     
microblazeel |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/56a4730658df9f76eb8aaa54b4714444b6bcaeb6 |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/5df30ac7a310952dd84fcbf326df7cc9121378ed |     
   xtensa    |       stress-ng-0.19.06        | NOK | https://autobuild.buildroot.org/results/44dd43a016dc4e8ab928154b7273267e492e664d |     
 aarch64_be  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/9fce868fe5be5e08a83637cc841d1fedcb8fcc49 |     
  aarch64    |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/8ff77e79cc7373f452c25212c7e2058368cdd05f |     
    sh4a     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/734d6f3c261d30972c9b6133473d0c0733884d2f |     
    arc      |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/b620c7a703833762acf66d87f6f35d7ea34d174f | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/652e324e8375469662586f7548f3a251be10ad0d |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0c13f52ebcea7b054a16b6cc41b6c40dc981bb91 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/ed2b4fae9575cc8afac91516676bb80b5b6b3581 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/db0bb0edecb375f6e1f165e9928fa00db3aa2b89 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5d5c9e7c366a40b23c3683be8e5a3e4f6d97fcf5 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/e0d161bdc23f611725fa61441d42dee84f291e5b | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/b766087fb123f535128f414b3f27f8d3e1dc38a6 | ORPH
   xtensa    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/a5df0a90750199bababe872298d513c23a57b9ca |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                    mpir-3.0.0 | 2 
docker-credential-acr-env-0... | 1 
                  libenca-1.19 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/97267c0ed8766c231c8bd94d4918f2e8326b9d17 | ORPH
  powerpc    |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/ec104f20da6178ad8dd3ae128aa7f0ca5dd1724f | ORPH
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/68f165437379b297fb619222e90f58700dd1120e |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1e64beef831d2d5ce920203d1294bec5b39c309e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
             fluent-bit-3.2.10 | 1 
                libglvnd-1.4.0 | 1 
                  libsepol-3.7 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-6.12.58 | 1 
               procps-ng-4.0.5 | 1 
                 s6-rc-0.5.4.3 | 1 
            swupdate-2024.12.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/0369a85b640a6b24024642a87acb09e33148f357 |     
   armeb     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/81a2acb3243f3373a57272efb4481677360049b2 |     
   sh4eb     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/cdaf79df1fc5d3956cb72678aaf3f62a87cd28ac | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/8c784cab28cd3ec31028ce075e15f6ead5b66fa2 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e23e3a1ee00f86156145296d6439172dc60b09c0 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/97355000e2d0edb64890078c61e791e7088c7a98 | ORPH
    mips     |         linux-6.12.58          | NOK | https://autobuild.buildroot.org/results/5a6af820c880cc946059f4ea13d433ba3c1a3337 | ORPH
 microblaze  |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/f60941368fa0a298bec90bd8c9e94da480713df8 | ORPH
 aarch64_be  |         s6-rc-0.5.4.3          | NOK | https://autobuild.buildroot.org/results/fa2210955ec67510ee89f05776716980bb9bfdff |     
    or1k     |       swupdate-2024.12.1       | NOK | https://autobuild.buildroot.org/results/8640e0adaed4ec512c62dab73d2b3bb299cb7e9a |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 1 
            igd2-for-linux-2.2 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/48120f591f5cfcd3632bb5a4829f6a71ca265900 | ORPH
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/8b2d0a19b021ea93321e94ff705bee93397c0b67 |     
    arc      |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/6dfd50848904fa79600b95c1e7d49beda1f027ea |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

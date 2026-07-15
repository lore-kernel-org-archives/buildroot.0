Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0303C4450A
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 03:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A2A40704;
	Wed, 15 Jul 2026 03:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Zq1pvtZOLux; Wed, 15 Jul 2026 03:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD2D9406B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784085746;
	bh=ksupHQtKScmSL5ped+3p+SB+KKgQ8hB4nZnoIJss8Ro=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MkKz7IHcBfw4ykufbbLRIIca51CJNKbPxUoYVh9uiWIitoR+0y4ubaSEGwTLbEFh2
	 LNvHiXZOjql9/CsEhCcN7S2V+EUyIBo2H0io6FHSstOCY2MdRkrkvRcFbKmSlobj8t
	 uKeemp+b1BXVEDRgg9AfCLnDfGqn6gyDbOs5FRG8VrTVXcsLvWUh5UUTP88lXfGdBA
	 VeV38PKLvUiEOGh/xZQ+iwNgWb1LmRncnfwViNUaXdZnEykjIU+r5l5BfM7QU4PHlA
	 +owECvtK/FByjmLAjQdD4Gi9VHt59IR2WF52fC2N2eDkddc/8Yii+h3j6vYK4Vezru
	 MjArZ3V+/Dhzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2D9406B3;
	Wed, 15 Jul 2026 03:22:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 917DE150
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 03:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7723E60601
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 03:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhO3yS2VKSTe for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 03:22:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C471605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C471605ED
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C471605ED
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 03:22:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-493bfe9f886so26526675e9.0
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 20:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784085742; x=1784690542;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jVJ+abxuNU89dK/UEfygDLEYFnk/12wYxokhI2QAVWw=;
 b=dARKCtTFVuBOtdFOCCU4agsYZRfkYQtIUj2roZNRcb4nA7pDjbnOuj/uc4RyukS7P7
 26HlXO4FgZU93DwxWtftBnPc4tIbOPTsaT0+RArKtml6JtZy5jLeAtXbq2wKaej3aEVw
 dxFUNfT0aoLBN9Jtoib3yeb04RB2co5IV5nU4EVtYNkfPHQgKgCEoyKCSbK0U3RMPP4a
 N6BwvclHs9l6sGElrz0tLRwvgy5ozomcYEeWrrO/u2XA+MibbzzcqgVagP+6kPNopt/a
 gSfgCqdhtmTP0Pu16x3Q3KttQWG3bp7t/pRb9XlFjuojaKJht17Wma6qU3CFATUbyiVQ
 ybbA==
X-Gm-Message-State: AOJu0YwTkCIifnRyaFp7vgqdfrAwHnIA10LDz9zAw2uPKbADdyYsZ6rs
 RtXfdHcIAZrtPL9vKMLlAKLYrpY/of2HgLpJrZff04/IA3c/NmFBddPCEmc99mk8
X-Gm-Gg: AfdE7cmAiUlr6PqcfCr8QGORVfd/STSdvxh7kLXyg7xDaW7BACQkwxFhvLznmM+XiIX
 rJS6jG6ryVUTeRE4ykDChTWCQHedJcDGKfs3WgPSP0Z+C9jo1MTr8zPwlieOK/OrQZSZMFZvwc9
 cAbdinP/3FW6AjCuN3pOGZZv2nkXf0Wm+R2vJuE7FPNwQ+2806dhMOYdfVKqan7aRlTiDkIrpdy
 n8PXPZZTC2pMqnMukwORFmsVVSFFcjTGQTdxuv4T953J89YEyBZgh/Qy/c7krZmCaBngGWnCAAv
 /tAQNef2Nh5/NdnnJgDiTUTSR43j5cNTNXrQx6raiTdrFuaucM2KDL0TO//qvEdyj8/0A5JMD6U
 ibu9Q22MIppPGbwwbWTP3YzUrgJp/4wVRJxyKbdCdg7AXv9nBd+yNxV1NaXjmWoQ3gBQGVkmJ7i
 wy6d/BiruNIUo1yP0379M57NKMcQ==
X-Received: by 2002:a05:600c:1e0f:b0:493:b03c:5650 with SMTP id
 5b1f17b1804b1-4953c280b8amr9242205e9.19.1784085741592; 
 Tue, 14 Jul 2026 20:22:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49508724786sm124358175e9.3.2026.07.14.20.22.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 20:22:21 -0700 (PDT)
Message-ID: <6a56fced.b2006eb7.16e2a4.3946@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 15 Jul 2026 03:22:21 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784085742; x=1784690542; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jVJ+abxuNU89dK/UEfygDLEYFnk/12wYxokhI2QAVWw=;
 b=PeI7pNQslnqE3+ZkzbLtOBg1Y/Q0I3IzFPaI5KJCEDaeZXF4/vG/Y3dWBAvQo1QrUq
 /Clzx/YrA7PGcPblXTVILxRsEogEbPufE3mGYOxmJ2H24aWyzGTjf/3TPsrcGYSlsVGc
 ikDE0yDuAYROCEgLI/uChOQCoglwDPt+PCEOOf0V6qea+GeyfRsU/y5QQkGrcEjFKVuK
 TrZo9mJ96Gj7NrT15NyzeC9CvLwmWhsrMHX9J7A8IjX+ehNeNQmiTzcjmIlfsBkis1mi
 wD3ikdRZEeD4Arp/s6MzPsB2TKWDHMoPbi4hHBXSL4jFiXnnLRDqYdwugLD6tSu7qqcM
 cILQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PeI7pNQs
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-14
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

Autobuild statistics for 2026-07-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  7  |  0  |  9  |
  2026.02.x  |  1  |  1  |  0  |  2  |
  2026.05.x  |  1  |  2  |  0  |  3  |
    master   | 18  | 59  |  0  | 77  |

Classification of failures by reason for master
-----------------------------------------------

   host-bootgen-xilinx_v2026.1 | 9 
                    attr-2.6.0 | 3 
              host-guile-3.0.9 | 3 
                   perl-5.42.2 | 3 
            18xx-ti-utils-R8.8 | 2 
             cni-plugins-1.7.1 | 2 
             dahdi-linux-3.3.0 | 2 
              host-pahole-1.31 | 2 
uhttpd-15346de8d3ba42200249... | 2 
amazon-ecr-credential-helpe... | 1 
                   bash-5.2.37 | 1 
                   bird-2.15.1 | 1 
                  broot-1.57.0 | 1 
                   dante-1.4.4 | 1 
      docker-cli-buildx-0.25.0 | 1 
        edk2-edk2-stable202602 | 1 
                    frr-10.5.4 | 1 
          host-libtasn1-4.21.0 | 1 
            host-libtool-2.5.4 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
              jpeg-turbo-3.2.0 | 1 
               libepoxy-1.5.10 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libmpeg2-0.5.1 | 1 
              libopenssl-3.6.3 | 1 
              libsodium-1.0.22 | 1 
     linux-5.10.254-cip72-rt32 | 1 
               linux-pam-1.7.2 | 1 
                    ncmpc-0.52 | 1 
   openvmtools-11.3.5-18557794 | 1 
               pcsc-lite-2.1.0 | 1 
                     php-8.5.8 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
         s6-linux-init-1.1.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
     sound-theme-borealis-0.9a | 1 
                  sysprof-49.0 | 1 
                 systemd-258.7 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/f306867ad33a75444a24b877296d1856732fad53 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/82b979debef58c7238d6823dd0dd2ef120240529 |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/652f025bf18165fa19ac3aab6633eeb7ce68a840 | ORPH
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/d4b801a26dc467711929d678e0c108be8c79aded |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/0c82a7b5d0d1f774bdf12068c53cc74c4dc83f61 |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/fc693425bbc6df73dacfb2220ea08820d273422c |     
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/302efc8335377accea0622ef539175318629ad2b | ORPH
    i586     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/59c237ed2585cc0906789578844fac04182544f6 |     
    i586     |          broot-1.57.0          | NOK | https://autobuild.buildroot.org/results/717b3e81a3f0925f10bb2f462e388947675242e6 |     
  aarch64    |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/65152c0f31813777139814dc730e6ac6a8fd789a |     
    i686     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/7b9d4a2285ee83490fd065f8efeda45fbdfd6dc5 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bd12bccda7329978284e24126120ccc354993c5f | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/44abf718c15b10e140239b37de6f080baf6f7813 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b68fc6249364de285d8cffbb5a634b2f446d8167 | ORPH
    arm      |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/356a3d2e318d70ca0fecd0e94a1f74b6dedc971f | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/0bc22af0e57d30481e1d8c516efb7acf766889f5 |     
    i586     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/f0e89f76c66d59122b565def057e09ac56466e1c |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/c0876f91fd22dd1f561d79caab0efa4e8cae888c |     
  riscv64    |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/05eb5ac0a7949ceb88966dd1bd6e605e305ec4a6 |     
  aarch64    |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/d3c0c904032c8a59f32b512e7e462dcfda4ef94f |     
powerpc64le  |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/d7dc289b810634e355eecced37bc42f88bf9c573 |     
  aarch64    |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/81e45d9e9b93bc4e6f7e97919bbb0570c1a13392 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/5b49d43d1df1485f86114c9ea664ec40f154cf39 |     
    i586     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/59b1d12dcf9a7ba51ba19f1e5ae9c9a83dad8a3f |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/c6161bbbe3d9ae10036f0d6dfdc891d470b63598 |     
    i686     |  host-bootgen-xilinx_v2026.1   | NOK | https://autobuild.buildroot.org/results/91aa3c572bca5ef3d97c324309b779f18ed4f916 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/5d8926d8752074aff8f2bc56400fbdb2745febc9 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/e2f529338292832ad38ef21e8234e1738fbfa701 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/885ed6a6eb889a3cefa692388f40bdc6edb2b4d8 |     
    arm      |      host-libtasn1-4.21.0      | NOK | https://autobuild.buildroot.org/results/4fc319cf986b69dc72859d4355b0f53f244a777c | ORPH
  riscv64    |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/eafa5dea2df14c4cef5f50466f93a4b2a95ba7fd | ORPH
  aarch64    |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/ba79fb9d08b2c6ec573b79fdbb6b4880bf603a57 |     
    i686     |        host-pahole-1.31        | NOK | https://autobuild.buildroot.org/results/885b53eb20b70cff967789e4c4e733df5404a718 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/8e92165b722830c5488fe6d161d15504db55c8ae |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f026d02ff210a0af5f548caf8799de727ab8ea6a |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/487ebaa4dab1955eca8f34c821cc1c964d8af4c7 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/5acfcc6ed60ff5bea3c16e35862adc2ee647bf66 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/d7e048bbb790e15e60f6ad7967788906b4ff7584 |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/dbcc721fdcd4999175a9296cb92a64294d38fa8c | ORPH
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/3aa37bc8fffb6baa5ece92613ccb73d1e7a6ae3b | ORPH
  mips64el   |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/2f0b340105bd25d205418553e1ddbaaba2435970 |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/fb39ac1ad379d5351e846f0887dc59cc1946f3db | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/0b2998765a3c9e34ddf600307c19b3f895754cc1 | ORPH
  aarch64    |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/161435b8a0a55f4c39684bfbcc70242b48655918 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/f4921c425903cb1420557cb3deefd8f245ed6c1c |     
  riscv64    |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/0126e3681c97b42e3e54bb1cc129c1e5f01fda10 | ORPH
    arm      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/93594fc071fd896a5a8bf0f479d7d99739b0ce22 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4cfb51f525dff16c2aa1c117275e0a9b6c64968b |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/747d5d021e9f80a27052828b366fe670e60528bd |     
microblazeel |           php-8.5.8            | NOK | https://autobuild.buildroot.org/results/0995452946c6f63b26bfa9b9b655b35df05ba6ac |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/d30d6ef0e3773d6a2aaf662f22ad846f6de412f7 |     
    i686     |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/0be319b0d8d6164728ebc798087750f31b0199f2 |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/54606ec70e5102bd65b5f12e5189510325318c47 |     
    i686     |   sound-theme-borealis-0.9a    | NOK | https://autobuild.buildroot.org/results/65757064c937fe7edee0e25a67ddf29d5744cff9 |     
    i686     |          sysprof-49.0          | NOK | https://autobuild.buildroot.org/results/bff31a97088545d4a37460845b1ef04c05747297 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/145e0c54baed2e52436b8f7fdd4f91000e64b8d4 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/075ac906c6a37e667b1baf42d043e231cfe17cb9 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/bd0c75269b3ad8948e5cb6e75d2158877df72d8b | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f9b01e6b88a00b7f6e6596e6d8c393cedddde911 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   guile-3.0.9 | 1 
       host-nodejs-src-22.22.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/eeb40d33fb7fc12b3364921414c3d2100722338c |     
    i686     |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/2c4dc08bc2210eb4aa85dafd6936b23a4e83daa5 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f006045d333716afabd7094f860cded8664653ab |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    fcft-3.1.8 | 2 
                     gzip-1.13 | 1 
                  iodine-0.8.0 | 1 
        ltp-testsuite-20250130 | 1 
package/linux-headers/linux... | 1 
                    sslh-2.0.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/c384e613d4fa56a2a834d93cb487e45b15e48f56 | ORPH
powerpc64le  |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/e80e6e13aef780a2115485cf0b98ff08927ce406 | ORPH
    i686     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/46b3908faefc05f19ab004158dac1c2e8fd1890e | ORPH
    i686     |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/eb021f5c82ccf314d860992f9071064af6d9037d | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/753c62c66627bfe1ca21cd9c85ecb3806d9d2c1f |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/79cb5ae740f86711fc8e25662a7f08eeaf84d268 |     
   arceb     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/563ceba85ff62a58e40b67e785e58cf28e3e4b17 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

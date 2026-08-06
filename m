Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D470C55ABA
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 03:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD80180D91;
	Thu,  6 Aug 2026 03:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_QPnt_rm0mN; Thu,  6 Aug 2026 03:27:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4238880D98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785986869;
	bh=cSuljoN4f/s7tUVo13X08lGwoshTz0uVwav97SZWQsk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=on0fzwLf7F7MsTTgMtpu5j2LRaArpdmrPaQFsuvqWCuK18bn2MecRlfV1LyUNsXim
	 yYAYq0uyMluDiaqS1RFMQwtsQi/pJ2an9m0gLWRJJO3vJEgMcdE1+yVVTon3URSiw/
	 6+IMDAS3apzqGFXhaf1OmcE9IoGo67dXM3rY7AvrnoqKe7OWW3cXqjWfOSll8xW/fR
	 qIPb2WfdQIkJeoe7lzdit4/KSsGNfjy/WNZP9JqKl4iX/Ed1sGOJlxt0WFWJr8Dr7p
	 v8hyOEvtG2t+MAVVEH2OZF3k+LQEmRP60uOMJ3UVf6c6Tj+hQHJubTCuGELskP6n+7
	 gytVEoeFDI6Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4238880D98;
	Thu,  6 Aug 2026 03:27:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40C5B3F9
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 03:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 325C9405DC
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 03:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAfDhn1gAMGV for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 03:27:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B24A8405C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B24A8405C5
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B24A8405C5
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 03:27:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so1226906f8f.3
 for <buildroot@buildroot.org>; Wed, 05 Aug 2026 20:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785986864; x=1786591664;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=XIwuXgJ6//ErwoU2WNHWasyUKYpUiEXcczqH78Hk/D4=;
 b=AUbVhzc9C25ZBGZE3VtadOMJxwuMhB6J4H7zx93NZpERayRMeAYnt9CCu/cyKG4U02
 BHCJhrfPSNKoQTdHO43f0r6FHh0pyj/+wk6FwGVAbqhavpyV3hDQeLGSOH85yp/zdBTO
 BG6UmlQ1Sjp7NmjoTGcKjacq2lZRcXr1BU5jNbwqnbegjYYWPZGw5GsMCLzlIgIT+TZI
 mr+vXpUKX8RdQJbgxD+4RXCUVsRGJv4wVDSOQFh+0zn60hTWN9CA3CN2Kznz24DBoI7p
 fzreMcR4ilgCzefEga02hNC92fs4jl2Fo4DOT+FIwGKRniky5OouzzB8yZaxrbgRw9PK
 3e8Q==
X-Gm-Message-State: AOJu0YwFJkemT1OToyZCSD3pQ3KWqR5/EseRTLKcmNLlQu30c95zy/QJ
 jy+y3u5s3nCLkHFTb2DTPBFvm60om3DIaeDP6+QVeGcd3YcwnT74p6Cy8VEM7QNJ
X-Gm-Gg: AR+sD12axNpvGToViVymUsUpfXFPeFkl7xqLZgLJOGLxuuFl+MCtmYb5ameph3xmTNT
 Bvc1IXy6Lp1AaMgBg2A3lPiO3IFWXbCGec3yiOhwBgkXj3WIlJQA5BT8LMLr8f147ICm35am1wG
 lZBlI9XC/23JbDktE0HiT8Z88k3L1dCcQGb2SZfE3gXH2Xq7fZ8+BeESNlPV9eRmbWWhVwwTPGD
 kSYYrdVWOKIJQnlmRNgnef8L0MH/qrkNTO/5AkM4UvqUOCu2QwWruCGFWGNmAJgtu6sjp0C1cZI
 XzEqE5T7doFQoE0oHhGuPhOb6MK1L3NAlvlg4sVBoKoQ74cmbPNV9zG/e1FML/y5K8hm/zUhH1Z
 56HpxHBZgDE9BEHAvNUIRuPHB5hbkJxxyd78hW/PBF975gFeL4rYUjs52xeWVSLw4d9noavYxWo
 2vkGxDH+WgEHlyMf33QthPgWe52yITumHMhReWIdnEWNsi0YumITLJ4y6voiAEwtE=
X-Received: by 2002:adf:e9cf:0:b0:47f:8ac0:ccb4 with SMTP id
 ffacd0b85a97d-47fec4f01d7mr16323286f8f.10.1785986864178; 
 Wed, 05 Aug 2026 20:27:44 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff7b250e5sm2521161f8f.27.2026.08.05.20.27.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 20:27:43 -0700 (PDT)
Message-ID: <6a73ff2f.b251136a.3b3ec3.92c3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 06 Aug 2026 03:27:43 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785986864; x=1786591664; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XIwuXgJ6//ErwoU2WNHWasyUKYpUiEXcczqH78Hk/D4=;
 b=tEwpxf38K7/dxblAg/LuvbMB4p9M21EXgugGn281b25EQdkjWwCxlN2VAWndffU8O5
 XNBvsWXDak+McSvebsOcyyadnTnMw8sWQ5sCBdQFEBd5fEvo0WQin0HRuP6H1CyKs+S/
 6Msn5rYtvadLPGPKMvRQC4QYW3K8zh3VLUfVcc7MqGO7+wj5PsoHbKTR3VguxyCPBfnz
 PLvhIw884gtcw7a0yLe0Z2Dfd6FrncbdhGyU7jxr723P+2qPrnRYACUMfb+OSxooE2ft
 3sdTlY4me5SrYp43McpvMW6EfpfhAcGHrpgqquMuGE90d3DU8MAtLcfguRyhJrxDT+ww
 z+Bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=tEwpxf38
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-05
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

Autobuild statistics for 2026-08-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  6  |  0  |  7  |
  2026.02.x  |  1  |  2  |  0  |  3  |
  2026.05.x  |  0  |  1  |  0  |  1  |
    master   | 19  | 56  |  0  | 75  |

Classification of failures by reason for master
-----------------------------------------------

                host-gmp-6.3.0 | 3 
               linux-pam-1.7.2 | 3 
                       unknown | 3 
 host-binutils-bare-metal-2.47 | 2 
                 host-gdb-17.1 | 2 
             host-guile-3.0.11 | 2 
        ltp-testsuite-20260529 | 2 
                    olsr-0.9.8 | 2 
               pcsc-lite-2.1.0 | 2 
                   perl-5.42.3 | 2 
             alsa-lib-1.2.16.1 | 1 
amazon-ecr-credential-helpe... | 1 
               binutils-2.45.1 | 1 
                coreutils-9.10 | 1 
             dahdi-linux-3.3.0 | 1 
      docker-cli-buildx-0.25.0 | 1 
                      fio-3.42 | 1 
        ghostscript-fonts-8.11 | 1 
          host-binutils-2.45.1 | 1 
               host-parted-3.6 | 1 
          host-tipidee-0.0.5.1 | 1 
                host-wine-11.0 | 1 
               libecoli-0.11.3 | 1 
                 libpjsip-2.17 | 1 
               libtheora-1.2.0 | 1 
                   linux-tools | 1 
               madplay-0.15.2b | 1 
                 mtools-4.0.48 | 1 
                netdata-1.37.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/mender-update-modul... | 1 
                  prboom-2.5.0 | 1 
                 rtl_433-25.02 | 1 
           sane-backends-1.4.0 | 1 
                  stunnel-5.78 | 1 
                    szip-2.1.1 | 1 
             tpm-tools-1.3.9.1 | 1 
                 uclibc-1.0.58 | 1 
uhttpd-15346de8d3ba42200249... | 1 
               valgrind-3.26.0 | 1 
                wtfutil-0.47.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/759dc9245f53332100632d13df0d59ceefa9f169 |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/9a21ed3d040ee123eb5a7611776f830e43aa19a2 |     
    i686     |        binutils-2.45.1         | NOK | https://autobuild.buildroot.org/results/2a24e22ed2a4356648ad473baaee932d511790d8 |     
    i686     |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/3cfb301985d8af16c66a1624b8695177376dfcc9 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/298fc627356fe83a58d4ad927deab01620a67c29 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/6b759d9b7ece5fb178d713b54eb7ea6bd99e6c5d | ORPH
powerpc64le  |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/3b7c0768245849646f15af3a8ffb2fc6beba62d3 |     
    i686     |     ghostscript-fonts-8.11     | NOK | https://autobuild.buildroot.org/results/d35fe3b904782f67dd32202a2bfd44a86a1afe1f | ORPH
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/2803cc725f82d8aa1207c219fb9058114d4e3b28 |     
    i686     | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/b6693295474d713aa5494a6413a90301a59b5ef6 |     
    i686     | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/7a43561a80420586858259de39313eb5139efc6c |     
    i686     |         host-gdb-17.1          | NOK | https://autobuild.buildroot.org/results/92859dd62318461f719297d24a693b5872b0559b | ORPH
    i686     |         host-gdb-17.1          | NOK | https://autobuild.buildroot.org/results/05b034e15311c8f47f8524ed07781491bb446d13 | ORPH
    hppa     |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/f533f337a01fe99f18901d411203ed5b24106824 | ORPH
  mips64el   |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/baa350f166b16b620868a3fefa4ba3cf74d406f2 | ORPH
    i686     |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/56fe84c0f6a05caf367e04dde7b4a0858af6678f | ORPH
    i686     |       host-guile-3.0.11        | NOK | https://autobuild.buildroot.org/results/a676bcd6045e06162086fa6bbcdb2f5541f3cac3 |     
    i686     |       host-guile-3.0.11        | NOK | https://autobuild.buildroot.org/results/cd1dbdde72e43c8187c6fa23b315bc531363afeb |     
    i686     |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/4b905ac6b46501bba9660f3701c7b468ea3ef6c2 |     
    i686     |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/7e17505e7ee999366464adf1e419e9da76e95fd2 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/0561f31e4de80b580f1d363190b13a6ac12a3edb |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/40de9f15c25237d8d4da54dc8fec534f6a6a26f3 |     
    i686     |         libpjsip-2.17          | NOK | https://autobuild.buildroot.org/results/c979c78c7ee596d52f6ba924afba6079f1cf2a39 |     
  riscv64    |        libtheora-1.2.0         | NOK | https://autobuild.buildroot.org/results/976bfa80e1acb565969cf2b1a738cef5a8867a49 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/676ba43db4ab882859850c7828d25186988f1859 | ORPH
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/fe34deebfa90b7aad0689851cbe4801487743126 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/163426a87d6fa12d34cd7a6f8bc22b02ffdbd535 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a1efd5a41aad004043ceba3f859c76d877f31d5a | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/e15d10db154eeecd9d0142c0cf7156b48cb6a802 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/edcfb4677ecf5f5e03d3aa65612955317c21c001 |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/6994466255b2cb4f6f9b6adb63f08ba5557b2f0f | ORPH
    i686     |         mtools-4.0.48          | NOK | https://autobuild.buildroot.org/results/63d92e42899d43a89de718d3d313b678ec0f2f39 | ORPH
    i686     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/f5d28e09c39ca4f14dfb247a8db05492ab98c0a7 |     
  riscv64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/abfa583442e4b8cbf4b62aa196be7692978ba95e |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/4717e591f50c32483b4202daa23c0f2a1e96ba28 | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/fe88349f64e58d9072317cd87848c02b4c8504cd | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/639f86d7b62333a7d21fcc8c1d2290695708d7da |     
powerpc64le  | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/5afb0ab3362cb67014f470dd976449b756224566 |     
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/11e21433ad0536c5921810e6221f904ae999b375 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/904bcec7c5c86392c928c8539264f8827c4a0375 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/d51a5eb175621cdd4a20e4e2c32ccabf1e5ea93e |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/45baf11530dca0d2e1b14bd7090a04be923c4eb0 |     
   x86_64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/2f09edb857dd982b2086d1337987ca7496d817a3 | ORPH
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/616c6af6b2d0c9c0b8e90ee95bcd99874ed6dafc |     
    i686     |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/e8c734555d01facf6c1ce5bc127f8a3c24350c1a |     
    i586     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/231208923af72a2edac036761fc56719640c236d |     
  mips64el   |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/c9a7933a3c18f8b99c02915e73371fad3c45aeac |     
  mips64el   |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/10cbb6af615693be903979e7eac4489adc47d6fb |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/6d22d82bcb833d6aa8a0777d56025327ea9f4c36 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/9b16b32ce032f54a085455be54aa2c0cc05fa086 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e12adf16a29fc305c6e3787fd8cbce1f4465f9f4 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/f390d2f6a4d8cc9920834095199ed428769a1566 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a8def553a2810f8227e7d30f99a33568685d6448 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/9cabafd2676f9843f4c2545fc0bf89691557a54c | ORPH
    i686     |         wtfutil-0.47.1         | NOK | https://autobuild.buildroot.org/results/b18abca36888d393b3ebbda15f5163c36bd632ab | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/54f34f8c055de6504e968125a0bb07cd8dae0d7a |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/d2f31519daa88131daaecb23f75bd05d0283e8da |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
              host-rust-1.88.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/700f49f0759e70a605a8c66bb1dd82c6f1a90af8 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/84e0bf20c8b165932fdf44190f0a4a4774a7a9ff |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

cpuinfo-8a1772a0c5c447df2d1... | 1 
             dahdi-linux-3.3.0 | 1 
                 gerbera-2.4.1 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
             netsniff-ng-0.6.8 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/1e6ebcf92aa94398b38907bbbebbc6847b3e8856 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a46876de6753baac516610b6896880c97f500a9e | ORPH
   x86_64    |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/86dd91dbedadefeeed2d82ab717cece94a667b1f |     
    i586     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/14b74e1e99add567adbb297a988e29525217956f |     
    i686     |       netsniff-ng-0.6.8        | NOK | https://autobuild.buildroot.org/results/3d3e959f650f1e85161b77921226bf4607d4a4f5 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/515202c88c470686d3c72d3a56245dca66b1f9c2 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

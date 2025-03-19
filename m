Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB6CC35FF1
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 04:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81F1B403A3;
	Wed, 19 Mar 2025 04:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eCAQM0FkF8X; Wed, 19 Mar 2025 04:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0941140871
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0941140871;
	Wed, 19 Mar 2025 04:14:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AF901A7
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 04:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19308401FE
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 04:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeG2iZ5NqDIV for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 04:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15693401DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15693401DF
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15693401DF
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 04:14:37 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab771575040so61205666b.1
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 21:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742357676; x=1742962476;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WAgUYMjVggMdRiZWSVUGeYscKZbFJ376bIGBcZVGOxY=;
 b=lIzuPVjm1pkN8/VK7IWayg/NPLjoPdq8NBQy+XDNK802ERq61XLYjoQtngSXH8BEEE
 9Qljwzaf1x6pkA9Jj5FG1IAc1CsGtG0NeLYS9anp5E2hKPmHz2Mp25gaMsbhrlSBC8FP
 3X+fc2NVR1D59NuCpJHeETI+mPqXabz2+rdsUv4eqD2ZXhb577iPFIrdY6yGm0QIfVuE
 T4yJPP6OGTtACtb02PpUjgL0j4RKzvp1rXdCqmtKwwGTJnT4SFLtxt7A6Qy5yNGhcfF5
 iHlJpaRt40rcOObJ4hPOTnLIQxVm3yJLV+nNRaDAnhF/Ip7FDGPEBWhL+tfUoY0ihnwH
 /xtA==
X-Gm-Message-State: AOJu0YyA7TcVSJ8vgUWKEoUlQnfeuNHNB5jojrTAjyk7AMdKkdmJ35c4
 /2rtkHQBgU2vGBri19j8yLSpe0Ggebdut7YFm/vWxOJfGIlaNvucRXUV9w==
X-Gm-Gg: ASbGncsL8dj1qtZZe0PcZkQB/WlR166yiREY156keKF2WFv4Dpv3YR2lCN4lCTDfJrk
 2fALvWCxMb+lqC7S+yD69+4L2xdyPQ/DxjxfrnrrrodLjEO2aiDSZ2yl6pPBah4RqUTzOFEI5Ml
 CzMfH2/0nG5VdpqoQEFAcUsQBYLskxtjHocWNMnBIZARALimiyxZyuuZesBsWT39mLCAwWkP7c/
 nOgJCOuV+eN5mZNPu9d5v+Bt0w6AloUhCLyZld8OsYV6sm7/d4X68cwmOI8HXfRq+NPHlA6QDML
 IYw5L0FsNuQXwvgU+0+pQX+o5fG3sXraem9H3zQ2FJi2Trz9ora9ot3JemQ=
X-Google-Smtp-Source: AGHT+IHimbtC4jPmQU6/yEVU5Rjl8FHTDQpusXXSz/8Vd+4GAxXqLzGNZJYZ6x84B+3fdCQGPItcmg==
X-Received: by 2002:a17:907:a58c:b0:ac3:8aa6:c7da with SMTP id
 a640c23a62f3a-ac3b6b1372amr116877466b.7.1742357675720; 
 Tue, 18 Mar 2025 21:14:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3149cffdasm937267466b.117.2025.03.18.21.14.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 21:14:35 -0700 (PDT)
Message-ID: <67da44ab.170a0220.13486e.0649@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 19 Mar 2025 04:14:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742357676; x=1742962476; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WAgUYMjVggMdRiZWSVUGeYscKZbFJ376bIGBcZVGOxY=;
 b=Blx0wCuOsu+4tVHwl3czBRA0kcl9Jnm7fYeWDY6K7/pXK/SzzU/4RKbP/mRu4U5Psc
 H/zlNveqU+6YK4AUW0ZjFUJFNYbkyX9X7Wtpewqsu8dWHeitY63dqhOqEd8hg8Bn4wd8
 6aHMcKbCWWz9na99a9qjP/SXBgOModrOLPL0MgDzIoPaY6cEncABF8+kkcKggylOQwBH
 vk9patV1U7cgou8wJuPpj46aF5B23/hnvoYYvilGeX7etMOnNfeX7UFSIKgSdgseXRLW
 xYGoal1TyKFcrGWsJ7s+9vsf3v7Bjpmyanosfc7IokgbHAL6LcmkPpy80/lsbywpr+pG
 wC5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Blx0wCuO
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-18
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

Autobuild statistics for 2025-03-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  3  |  0  |  8  |
  2024.11.x  |  3  |  2  |  0  |  5  |
    master   | 16  | 49  |  0  | 65  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 2 
                 linux-6.12.19 | 2 
                   linux-tools | 2 
                    mpv-0.35.1 | 2 
                   perl-5.40.1 | 2 
          aardvark-dns-v1.14.0 | 1 
                    bat-0.24.0 | 1 
                   bullet-3.25 | 1 
                 c-ares-1.34.2 | 1 
           crucible-2023.11.02 | 1 
                cryptopp-8.9.0 | 1 
                  dpdk-24.11.1 | 1 
                   duma-2.5.21 | 1 
        edk2-edk2-stable202411 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
                  gnupg-1.4.23 | 1 
  gobject-introspection-1.82.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-mender-artifact-4.0.0 | 1 
    host-python-greenlet-3.1.1 | 1 
     host-python-maturin-1.8.2 | 1 
              host-rust-1.82.0 | 1 
                  iozone-3.506 | 1 
                libdrm-2.4.124 | 1 
                  libnss-3.108 | 1 
           libzenoh-pico-1.2.1 | 1 
                  linux-6.13.7 | 1 
             lirc-tools-0.10.2 | 1 
       matchbox-keyboard-0.1.1 | 1 
                memtest86-7.20 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                pipewire-1.2.7 | 1 
               procps-ng-4.0.5 | 1 
        s6-linux-utils-2.6.2.0 | 1 
          sphinxbase-5prealpha | 1 
                 systemd-256.7 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
              udpcast-20230924 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/3f59db686b8edf116a2a6b212760087b50c69414 | ORPH
 powerpc64   |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/e0cc3d05d133efefcf56b61887d38d3ae1decdc9 |     
    arm      |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/12a6f6737cd52f1f3f811dc4958aaccbc242571b |     
 aarch64_be  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/795a48b7c6d002ee0af6f5e869f75c22963c79db | ORPH
   x86_64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/c712d9a0a3746bb074800223866eb2b0360a65cc |     
 aarch64_be  |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/b73d58c03cf6648d0bd16bf8bc8b19902ad99b5c |     
   x86_64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/2db7e3fdbee5a04b075817fd3c2ba22724de5852 |     
   mips64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/3a86754f50bf0310cf148c9770c45eebfbf31e0c | ORPH
    i686     |     edk2-edk2-stable202411     | NOK | https://autobuild.buildroot.org/results/cba6037d35ff6d2b56f4acb4757e609392598f82 |     
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4f2cb769045aeb8d614910ad757d164b42644a3a | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6da1984ee3c682dd85af2608316da88fc9842d89 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/c1d3050b0456d4b29b5e9a5eea7128129d28ccd7 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/bbcdc0a23445ae2a2b46841b0240b30cd870da0a | ORPH
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/079c42e4ce53d6f6c7ce75b508c995dc3f23996f |     
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/a5349c5e277e4af9592f6fa45e92b7737a1a8ba5 | ORPH
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/380639ab50437f1d212b906f7427c6ff59fa6844 | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/24346cf123038260c3d7482fa95458228e91c4c4 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/8fcda8f8181bee6c1f46dad89c54febdecda7fba |     
    m68k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/5131089351b0473da11038ce92a1668906a9d553 |     
   x86_64    |   host-python-maturin-1.8.2    | NOK | https://autobuild.buildroot.org/results/f39928228163c201d3defb611a4ea28ff9bed803 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/4164022e2a559cfe8da11cc520cb38658f07adfd |     
    m68k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/ad363db326b216f64fd71d143943ef7f97b6a24e |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/c9808d5eeab47bd3b1c2add78f3b82559b1764df |     
    m68k     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/e088c08c0d65118d9acd99857a1c12e4930cfc8e |     
 powerpc64   |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/f6858593f5b9727b01098594b566e48919a6d610 |     
   sh4aeb    |         linux-6.12.19          | NOK | https://autobuild.buildroot.org/results/cebd64e238f092a9959db0bbe5221a7aefa2270b | ORPH
   x86_64    |         linux-6.12.19          | NOK | https://autobuild.buildroot.org/results/5c6387db1205b44de06cc3fc96a366f3b184a920 | ORPH
    or1k     |          linux-6.13.7          | NOK | https://autobuild.buildroot.org/results/09e749b89b159da1ce7d1d55e734f6e95b56b0d7 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/25825db11fe0084ff0f446dd8ea3786bd07fa645 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/caa98011394985ca0b9e87de0723c93681376874 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/6619227010becf03e29c9349dd176252251d264d | ORPH
microblazeel |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/02173aaf9f5c89f611bf5dec1f74ae95d2cef9c3 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/52e7789646b476913054eb47e8f1aa6f7be4f008 |     
  powerpc    |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/c2f36801414572796c0db1511565b36534e7efcc |     
microblazeel |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/175307d9cef92d4dbdb89c721e9a2b9de3309fa7 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2dc455a92604c700dbe40c9f48d89e2287181b89 |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c43c9937768ba5f9fe29565a266491faa7a30b9f |     
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/d81ba774695cb64842e8c88da6bce13d94690280 | ORPH
    arc      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/642bb7f1cf8141c04ba44ad4f5a25446e7d51b23 |     
   arceb     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/f95d3e117d7bfa68bc6d9da182d5291e3bbdc335 |     
 microblaze  |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/2952deabe27a8e261aacd3cebd7e80bb75174538 |     
   armeb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/ff41790e5233b86d9f31193b9a46b68fb0a8dde2 | ORPH
  powerpc    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/bd9a786c261800461e445049806a39a7f79adc44 |     
   s390x     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/8625f0a8a2f40ba0ebd4202c0fb14518cb3a0bb9 |     
    i686     |         systemd-256.7          | NOK | https://autobuild.buildroot.org/results/af169e522b4e6c62d2f7cd05b4ef6f4bfc01d829 |     
   armeb     | ti-sgx-km-cf7f48cb30abfd5df... | NOK | https://autobuild.buildroot.org/results/32fa030509ff63d602493efc60a2c6000c4a4d7b |     
    or1k     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/6f82b757818eea2b07959f2249407c9f35150130 | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/0be80c0ecd761872d16ffc8a328453414a727269 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1fddd2950ad475f0dbc471692f2a9bd888be5c4c | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
               host-go-1.22.12 | 1 
           udpxy-1.0.23-9-prod | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/cfca8150654412615f934f339403a18efed471a6 | ORPH
   mips64    |        host-go-1.22.12         | NOK | https://autobuild.buildroot.org/results/56e4876136b201f50f60a52c2e2ac9e75262f936 |     
    m68k     |      udpxy-1.0.23-9-prod       | NOK | https://autobuild.buildroot.org/results/dea2573c91a434a6929fece7cee8c7199fda3784 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 1 
         python-remi-2022.7.27 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/795342e0b81d7961614a112d96a360f6df3af10b |     
powerpc64le  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/961a279f28bba8c7c06de90caec3a903c8db49a5 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

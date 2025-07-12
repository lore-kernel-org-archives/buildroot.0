Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8306C83F1A
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 03:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49D0F81459;
	Sat, 12 Jul 2025 03:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVM9xHNpcKVg; Sat, 12 Jul 2025 03:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 255F383AB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 255F383AB9;
	Sat, 12 Jul 2025 03:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8962119
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 03:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B99B983AB9
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 03:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RoAwJBgqROC for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 03:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2EDBC81459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EDBC81459
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EDBC81459
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 03:14:53 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-607ec30df2bso5277955a12.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 20:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752290091; x=1752894891;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3QTwMGXdqVcB8jIB5Iw/6cajzbyZ+tG93opz6WZwxsA=;
 b=tvgbM9fAFI/DkzYRzyNoWvKEdT4gsqO185UVv8HzBObpwRofnxU/4aEtnZ3HUvqgec
 25YfRab5l8HUtPFuZYqj4P1YoBKJ6in5Obj29JFHZq6Ada1sIfMfCR1sD+QoNa8USDF/
 zlvf9whWRav3uVf/KV+Oc+yA0ZFfV+R9E8HHZWZ9bY+jJEGQKyXeyZ675bRbRXOekv9t
 nsoj5N87ezIOPqZkJRSYy0CYorMPaPYDVAGuCYXUd/ltqWtwbyd/4yVb20nbCXWGXYbx
 Ud8bIEZATa6zns06j/LsJpHyx5bjAAv3Xh/Mls0VVzrcgz+2UN4H8G33T6DrRmKN7/wv
 38jw==
X-Gm-Message-State: AOJu0YyWpWBrNghcVkWlYo8qPChLP6rbA6WB2vHu/4MPpgRjjqyhJeUi
 HSB05M9q6H8yMDW54qkN/X02/dCRFi74ssTL170bwqwBP3jdROZWT0bdOCfUxw==
X-Gm-Gg: ASbGncshLgB37K3oRLz/UlMTDCbDyio1CeN0lmWAo5m/NonMkbLeTuPxbbL14AEgfUC
 eHea2Fs2/kMqR7ScmHIGQWEaW5EAlEiBMZIlz6FwxQ807SEs0UBQuI1imY+EE+pR3SbvAG3Wp4L
 MoiFyUi52UCK790DoDnqfFiM8KBh/Rh0leysplQQ2MKIWE+EQu4PHbfJLaAy97wX/PdiWwGU3T9
 PMFb2HdSHHVzKtmq7uyh2kA3niCxwHFQVs22/eZkWG/tCMAhExmRDZcPVe8l7vwRYsqSbS8XwtQ
 S6B3qGmkimvG3BPLf9UEVjGUDcinjqDulgzUjYiJQG3lioKscJzUtJvypEoEkSpV1jyA9PtGcQQ
 G2BIgq3WAeAXsqS6ZNTjhzmMdSA==
X-Google-Smtp-Source: AGHT+IE3526G5RDWA9Rtvn1pStJG0dFYyoPgE/Qg5q4OQzjGwh2uMeJVowwniARWvynEyIvYnKOlGw==
X-Received: by 2002:a17:907:60d1:b0:ae3:7113:d6ac with SMTP id
 a640c23a62f3a-ae6fc10f1f8mr598067466b.58.1752290090893; 
 Fri, 11 Jul 2025 20:14:50 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82e9341sm404956166b.177.2025.07.11.20.14.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 20:14:50 -0700 (PDT)
Message-ID: <6871d32a.170a0220.339cf8.aef3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 12 Jul 2025 03:14:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752290091; x=1752894891; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3QTwMGXdqVcB8jIB5Iw/6cajzbyZ+tG93opz6WZwxsA=;
 b=Bs3HU9NVoGebbAH/3BH1uxrXCE9conTtbB2I/5R2/zpTk3nkG1Rjay0FAihQEgfWo5
 ZHiyuvp97GklBkvNWl9nIuSD5HX2KF8s7KglEiLM+fxlgsKwJQYIZg2pUb2Exqz+huUx
 GCZYXyHvrDiFtBxmdAe3ki5jir1FOS0zdZaptMO2aQzhy/LN1ddVuX2VBU9WbqDl2Cii
 /PLSp1CWFK8xKME1YPKGsO6TqKZgbsLLaAd9zh1coCleAH1HOq6YeokBwxchd5lXElNo
 yGTLYZvZnbzBMKJ6HWsek4ifa24rCGTg48LyLdmj+aSfN5a00s2uWp394pBGnjEKwhIW
 11Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Bs3HU9NV
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-11
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

Autobuild statistics for 2025-07-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  6  |  0  | 10  |
  2025.05.x  |  2  |  1  |  0  |  3  |
    master   |  7  | 30  |  0  | 37  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
                   avrdude-8.0 | 2 
              host-rust-1.86.0 | 2 
             libargtable2-2.13 | 2 
                     criu-3.19 | 1 
                     dtach-0.9 | 1 
            gdk-pixbuf-2.42.12 | 1 
host-binutils-arc-2023.09-r... | 1 
       host-gcc-initial-14.3.0 | 1 
            host-thrift-0.14.1 | 1 
                  iozone-3.506 | 1 
                       jose-14 | 1 
libdbi-drivers-0bfae6c43134... | 1 
        liblog4c-localtime-1.0 | 1 
            libmemcached-1.1.4 | 1 
                  linux-6.15.5 | 1 
                 netsnmp-5.9.4 | 1 
                  ntp-4.2.8p18 | 1 
                     nvme-1.12 | 1 
                   perl-5.40.2 | 1 
                python3-3.13.5 | 1 
                    sslh-2.0.1 | 1 
        vulkan-headers-1.4.317 | 1 
                 watchdog-5.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6de32f50d6536e9cbd40a0817e8d232aaf33b465 |     
  aarch64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/f5dde42e39afff5fe11cfb9e0f7a9f18db4d9ab8 |     
  aarch64    |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/b2b624f72ea7305eb864d359d3bbb3db46bd87aa |     
   arceb     |           dtach-0.9            | NOK | https://autobuild.buildroot.org/results/a91b9d63276984039f830f1be7cb308f42770e21 |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/28d5b5d22d71f9200021edf10f590ba6a69d08d0 | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/73d2eb34294e5eb6937ca9d60efa56a568a3acab |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/436028d0681b9e80b2117e43f8499980b1164e3a |     
  sparc64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/5eca5cb0eaf4f9bf3692824773e38507b6ba2d80 |     
    arm      |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/8a39e75bef883b1a6459363bf0b83043c84b96aa |     
    m68k     |       host-thrift-0.14.1       | NOK | https://autobuild.buildroot.org/results/dffd4b8551ddb42f4a5269ab29f7b22903320af2 | ORPH
loongarch64  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/459d88c92889d5bac931d1a3abc2a31434cba2c9 |     
    m68k     |            jose-14             | NOK | https://autobuild.buildroot.org/results/19df51c2d022530fd9e349c5feec10315e4cf2d9 |     
 powerpc64   |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/dc71068d8a339b87c8b2fa81f4a16853da598f69 | ORPH
loongarch64  |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/ced881397df5fb975d6d919fc06c924383e840dd | ORPH
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/58761b4357ed4b559ecc49e57cbdc59cc774f1fc |     
   s390x     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/c03f896488964959b38760b5deea972b34a72ed7 |     
    arm      |       libmemcached-1.1.4       | NOK | https://autobuild.buildroot.org/results/ca91a0ed2162661de0f857a14bc9194363bd5f2b | ORPH
  powerpc    |          linux-6.15.5          | NOK | https://autobuild.buildroot.org/results/a827f680f8927f0b9306f9a62d47c7915e3681d7 | ORPH
    arm      |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/5f5cd2d4c8599a5ca1f1f3db1f5ab8690812c2aa | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/98a6fcdf16a02a3ad5e7a3b2db62eba1f522b71c |     
   sparc     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/718cb3d64e7df91a4cddaafd1002cb4ac8549696 | ORPH
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d4889256e2a8ff77069beaf34485a6f3d6617b2c |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/595c1c9fb2c45f19397efdebee6e0c5dd542655d |     
   s390x     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/f33a7f245873400de5b02630382b402ebf25c482 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/b07d5e32e8dae801b55c9219a5d1d3ba41cddd9f |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/9792b0dfa54f1083cb3fcd9114c46910eb8cc7b5 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/04fa1970b98485b4d543db9c19a77681925a124a |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/5e9c803e5013a2c8da5a6bd484762f9348dcc0c2 |     
 microblaze  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/29a49925e485c57d4ea83232f25f4da02c0c59a5 | ORPH
   x86_64    |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/cc2549ecdb527a94f7185be451f901bebffa4c7a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    bat-0.25.0 | 1 
                    bmx7-7.1.1 | 1 
        host-berkeleydb-5.3.28 | 1 
                 linux-6.12.34 | 1 
               openblas-0.3.29 | 1 
                 sudo-1.9.17p1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/6247ee3c0796950eade6f53f27bd07d6041df44d |     
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f9ab71309c772d9c9322db4591fbf99e9929427b | ORPH
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/d34312118df89c88342cf9f962d5fb1f1d11878f | ORPH
   armeb     |         linux-6.12.34          | NOK | https://autobuild.buildroot.org/results/0345f272e14e9f07ceb2e5d3b85ac00e4d088050 | ORPH
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/211524cfca4ce9f2834033010545fb113ac73b92 |     
    mips     |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/260a8e8da6e459b7c723fbeaeb23fb1fcf0db155 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                pipewire-1.2.7 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/295bcfdd1146074f7de91fff01aef574094aa22a |     


Gitlab CI results for 2025-07-11
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711309 | ORPH 
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711310 |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711317 |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711321 |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711329 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711337 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711385 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711387 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711389 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711402 |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711406 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711416 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711423 |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711429 |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711470 |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711480 |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711488 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711491 |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711498 |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711506 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711533 | ORPH 
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711550 |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711555 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711561 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711563 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711564 |      
                        coolpi_4b | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711565 | ORPH 
                      cubieboard1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711566 |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711567 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711570 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711571 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711575 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711577 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711580 |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711598 |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711613 |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711645 |      
                       imx8mm-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711646 | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711661 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711684 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711688 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711690 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711693 |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711713 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711727 |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711740 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711750 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711754 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711767 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711772 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711774 |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711783 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711863 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711880 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711885 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711886 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/10629711892 |      
               sipeed_licheepi_4a | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643494625 |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643494782 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643494916 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643494955 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643494989 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643495035 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643495084 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643495150 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643495246 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643495320 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643495372 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643495755 |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643495781 |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643496421 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643496813 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643496904 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643497167 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643499459 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643499561 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10643499736 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

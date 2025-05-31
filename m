Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2355C5AD49
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 03:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5083341C73;
	Sat, 31 May 2025 03:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeYtmDpFi3lg; Sat, 31 May 2025 03:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 268FE41C7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 268FE41C7B;
	Sat, 31 May 2025 03:15:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9C06235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 03:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C697B6075A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 03:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgeBxQwCd543 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 03:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E44160746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E44160746
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E44160746
 for <buildroot@buildroot.org>; Sat, 31 May 2025 03:15:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a3771c0f8cso1627010f8f.3
 for <buildroot@buildroot.org>; Fri, 30 May 2025 20:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748661310; x=1749266110;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ai40RgrQSgjWW9+Sz1zq02Xn6IoUA5ZVd+ZpN2/tAIo=;
 b=bZWhswGpxyZd8aF/OqTZqu06Ttzfp8QseuQr7RypJ9sgs19XKtDNjBqiK4+U9/BzgK
 GrQKJefsnn7tGfSR3iBhJadSDvhThDQbTahxD0Z5o20Z2ABsuk3WGf/VT/PwC34B9wZ+
 sItNIPBzASGWPdBsIxpL4ENoy/3YtH+IQ0oKM5gfJ4jYUYiOlEmqiy6d7aE6V4jndIHN
 H179+lx64aJjoojk8xuS0KvGVdTPXY5Knq0ckTyTKyWSsD9bq/ztGHASZmeEBNGyIAoz
 Z3BDFz0ZZpx1Xqenoaiw70xWQ7+cOcus3jySmTWXy4ulav+h9fOWVKEEoemprJ/AsH70
 Io7Q==
X-Gm-Message-State: AOJu0YwXod4uXtK9gR0sBh4GAMmkUHKqHNMcYY7dRjxQDySAjOrXy7Zx
 ABzWFh/wCv4Zz0Um4VZj5d3sXY1ln2Pl/J9GLpffZe2eHhGfT37XCpqQisFc4w==
X-Gm-Gg: ASbGncsA+FrEw2Wzrbcw2wBUGUwut7ah7dlk7LNmsAyI0H1xlM+gHSWSi2AzAybjri2
 no0GBAoSPpocm8gNJ+u6AtuSLDW1814h71Wljan7eZGdo1aGb0HigMbsWe22ksYjNuE9aGMfLnV
 3vnZzxclrB2cscneajlrkbN2slsgUoqwfAYTbNhVbol8v8A/5tDL59+5cxidofBNvrTrhDqj7HN
 PBu0jplREoVF4vcJieF3NBvC186OCxUD7TbhRr2GAA+BPiVtJrLkRxFhMwPgu4qls/T7O1ZmM3R
 hPLMquFOqvnvfwy0qkNwRASBG/0AJlvOLM95XS3lnbY1QjCcV55t3fs=
X-Google-Smtp-Source: AGHT+IEOjFYic560Alidlc7eUqC0HP5bTuVZf3epvDsLVGcIOSMsZHcMTQ0B78nvAqWNF7eCsk4Ahw==
X-Received: by 2002:a05:6000:288b:b0:3a4:e5bc:9892 with SMTP id
 ffacd0b85a97d-3a4f89a892bmr3705332f8f.21.1748661310001; 
 Fri, 30 May 2025 20:15:10 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45048816a08sm81650455e9.0.2025.05.30.20.15.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 20:15:09 -0700 (PDT)
Message-ID: <683a743d.050a0220.31b97.ab19@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 31 May 2025 03:15:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748661310; x=1749266110; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ai40RgrQSgjWW9+Sz1zq02Xn6IoUA5ZVd+ZpN2/tAIo=;
 b=XMJqrizrOTn99IWyjMVbGIsHHktWD1L11NsVsXysCv58x1DA40H2AydoGxEvJJHRm8
 nX+aAqvm5lt3oPhXD3Tj4Ao4vkDJjQko6Yi8wURRm6uJFRyMYmm2csd8MtrpWXtCioX8
 zAcoLoRYnPDmqlUoFfJa9Lz0Ns/qsXW+2iR2yLE6zle58+b/uw2OMgvO2Wzd0NAleMsj
 bXjp0Xd+VyvSgDcnstnDzgtvFnt6DFA5vWLjtd0ifrPyY8ksMeUmQHfqQJwVpP/8orK/
 pMe3zFhfmUm4nAxuakEYhJRBlcWKEuhvi/8KLg3Gt0TaEIt1qokjxmjAq7SdW4sZpV6V
 4VwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XMJqrizr
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-30
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

Autobuild statistics for 2025-05-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  5  |  0  | 12  |
    master   | 15  | 29  |  0  | 44  |
     next    |  0  |  4  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

               bctoolbox-4.4.8 | 2 
                    bmx7-7.1.1 | 2 
              libselinux-3.8.1 | 2 
                  linux-6.14.8 | 2 
      passt-2025_02_17.a1e48a0 | 2 
                   perl-5.40.2 | 2 
                       unknown | 2 
amazon-ecr-credential-helpe... | 1 
               asterisk-22.3.0 | 1 
                   avrdude-8.0 | 1 
                 c-icap-0.5.10 | 1 
                 glibmm-2.76.0 | 1 
          host-oniguruma-6.9.9 | 1 
              host-rust-1.86.0 | 1 
               host-yasm-1.3.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                libsepol-3.8.1 | 1 
               libsigrok-0.5.2 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
libuci-f3fc0b76040685829191... | 1 
           oath-toolkit-2.6.12 | 1 
                openssh-10.0p1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/4845349ffe0709fe124dabeaf0ac1e8f8398385d | ORPH
   mips64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/c61e553520fa0967fab6c05d29f3368c5e133290 |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/bb4614de1cc9c01ae62b10321413141817cb5109 |     
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6abe916c9b30d5531226bc57f8229b758b996fa6 | ORPH
    sh4      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e358c66d37a54449ba146a26d1b82538bca6b003 | ORPH
    sh4a     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e9fb276f1e6106d9ff10dba7bd85f51a8a600c1c | ORPH
   arceb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c9ba86b1e67c3fe8204b718eb7e2c20fadeb6273 | ORPH
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/090b8adc5cea8662fcefb5e4b3a09a2f2b12bbbf | ORPH
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/4b69792aaddef207e652e61a0abb7fb30d43ada5 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e5d548a8734746638b248d75499573d17fc805e8 |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/423249ed791561e979853187c09863983671b1c1 |     
  powerpc    |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/d25d95d3be41d48c65cf796a9c1690277b613e0f | ORPH
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/7ec91918b6910634295b6c196c2d6f31b1bccf5a | ORPH
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ec96687d0abd6f927d655a949609d75a08dc8c14 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6921dd2fc514be0a5a80e93eed33e206e8441a68 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/043da44ad39336801cdeec13bfdbeea8e7f2c90c |     
  sparc64    |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/583545f2c8280ee8e0ae46049b49fc910c083ba0 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/18773f47769dc0a0b5fc135fbb75ac23171fc933 | ORPH
   arceb     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/0784bc2f731c3d44486f30f333e2ef4cf392708c |     
   sh4aeb    |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/0a58551d84faee5086f7f8852a647170c48681fc | ORPH
   s390x     |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/c222aea35039900e3b42eb26e6f9e95bae38d4e1 | ORPH
 aarch64_be  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/f43584469ec98dbd3f27312c30c00df004e3e155 |     
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/34907a7e3d988113ab4afbe921513aedfaf6e7a7 | ORPH
   sh4eb     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/aa48f73d6e4693565d18848ebfa8fad50423c687 | ORPH
    arc      |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/7eb06f39c347de3b0635cc650936a9902e3e2fe9 | ORPH
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/15c23e33eaeed0bf3b6c014c174424b580996e41 |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/08edc5ab136b68965d3c3e11c308fa724295558b |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/241ae9a751c12fe60e75e92b10e7fe3292262f6f |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/05151c65d94952258700198722d44a3c461be730 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-mender-artifact-4.0.0 | 1 
          host-oniguruma-6.9.9 | 1 
             libargtable2-2.13 | 1 
                openvpn-2.6.14 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/626cb613e1381193ed58534d9f99f6a7973e9ac3 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/2d275094d9df10db80a535c94d79ba39ed58ff58 |     
  riscv64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/81ea060184234b2acaf020e37a73f101f70ba073 | ORPH
   sparc     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/dc7753346aea51e1f69d72fd94d982dcdb8631d8 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/cefeec23caef512d7c3aa64f5ee5666ba06481bc |     


Classification of failures by reason for next
---------------------------------------------

                   avrdude-8.0 | 1 
               host-yasm-1.3.0 | 1 
             libargtable2-2.13 | 1 
                     unzip-6.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b7974d4592014a57904b00c7c3843a44961c7bbe |     
   xtensa    |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/c7365214fdeebacdd68c31f9e4bc2739643bac25 | ORPH
   armeb     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/60a27cc7f5a8356759acf3936dad38522013cff0 | ORPH
   x86_64    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/b6540808b5c3a478a1defd56fefe27d044290785 |     


Gitlab CI results for 2025-05-30
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852703 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852707 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852729 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852732 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852734 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852737 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852766 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852790 | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852805 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852809 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852814 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852817 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852821 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852823 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852824 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852826 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852828 |      
                        imx93-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852890 | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852895 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852949 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852968 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852972 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852991 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191852995 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191853082 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191853096 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191853102 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10191853103 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202640115 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202640209 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202640318 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202640449 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202640587 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202640617 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202640663 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202640762 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202640949 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202641325 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202641493 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202648945 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202649524 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10202650766 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

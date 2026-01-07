Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6EDCF6BE4
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 06:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B822A60739;
	Wed,  7 Jan 2026 06:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfSDH6jIznCl; Wed,  7 Jan 2026 06:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2014E60740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767767261;
	bh=CMtE19ZMSeYxind1wXWiT56JfPe2O+JsWcAAGXYVSB8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hT9cs8dT3Q/3kGtFd1nD3CIwl1TIRiL1e5P0UKkBw9gC6fJT5akvXSCPL8U2RCqLP
	 uN5XFRLqp29PM/GrSHA/2LQgkgt2X0rSdkabxPYgXlvkcRxkkK4SIgGurZ7kKBK7f/
	 tNuNybC8u3Qye51BWqcgAzCc03dsZz88UQdJMsWQoL9EnG0t59mc4wyN4O0U6KtF3l
	 qp/B/aWE0leOYvwoI+qRMZD4K/ULTI/mOr8+WRwaa8AKPGLEcoGldxDAkm9o77lft4
	 HgkwV2rOYwHvrYKn3xkOk122Nxr168SbznkuOlb9rTNA0dO/OiO8gd7xrFZCvPG3Lv
	 R4+43G7eF40ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2014E60740;
	Wed,  7 Jan 2026 06:27:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39C3870B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 06:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BBF140165
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 06:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQlODGjqQ5PP for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 06:27:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 256FB40052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 256FB40052
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 256FB40052
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 06:27:36 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b79ea617f55so353157166b.3
 for <buildroot@buildroot.org>; Tue, 06 Jan 2026 22:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767767255; x=1768372055;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F+bwdj3I9rC4HebITu/OwNmfBqwYMLciPIJqkZS+HrY=;
 b=AtBC1sSqmhjHNEBvD7OjzOvTc52oaedhVy77QZog91BvxbbilPqvLfsCuTwzmSDOR8
 uyGjgckM2i4Mr46ueQrK9/hyvc1LMJehZe1YPH0gHV91098iAE9PeySuNOFbTxLmchCN
 1RioaHkQmu7dC1+6wBY3OE2z3eE2FTaGCSFr6GKN/XA4JVcJMOd7nhDFIz53OoerFdDi
 /tmVrWzJiSoPHJsEwLln39fivxSG8jis4rCHwP1hpwFvb/dZ38mozTpLDkHooQtxSCG/
 6xEOf9pMd0B2CF6xAbV0nutjUtYGqcRcjPKGQmWstAeEhu4qQQYF0ViwG3Z8dTOpb5dq
 lLig==
X-Gm-Message-State: AOJu0YzWYLGIJrSLcuzvK++7wAx13Hyk0celSNYNwNaKivjGeETJhpnx
 lhz44GglQdq068MYtb/CZ2lQsj8Xy6hLZPtd070MyWxDVyWAnvEVmMqFIDSVuQ==
X-Gm-Gg: AY/fxX7jrR4tNMelC2AdPWJ4am1jlUGYWvovL0clvLGaIeVY5vo3Gvs1Nuy1D29KspG
 aDzxZ9aCkUQIHiwhbg3k8MT+sZVfdXJJg8bYHsefK3WYkx5FRD9nBvktNYqO8a3BjU8Z3O57GFo
 re9uYqY0hNSlB25Nrr2EzgLd5D+aiOMR3QXrkTuxEHShDTtQ7DzcfEVJ+8M3/yfRvG3UJlR2OGP
 5Ul2vwvS86YqVu9KXr3MG11Sb2w1W3Kkak1P/5YmjnZcneMXSkxQQ81fhasVZjm6k0QmzspXzR4
 2QFrpr0kNbGoigU8k6UJ3zg5vOTBFKa2eBItj5LJB1U0soAiNjuvQL+P0lJbyq6GAkRNZxgvY1Q
 hnBTpdL6f2jM54WJIMkEQDfpgYJ0+PCb5aum1VVLyVHDLvQpKeRS3OH5grIq8bWx5nac+lEdOR7
 NO/JuKojUq12Si4RMdDEy7tPHUx44R
X-Google-Smtp-Source: AGHT+IGs9o7J9ilo4FWdgyl76c0C3YOFl1ZtSqu4uB4qvp+8F5CcYtAQLIUDtfeIydc6PyffInTjMg==
X-Received: by 2002:a05:600c:529a:b0:477:429b:3b93 with SMTP id
 5b1f17b1804b1-47d84b32f87mr10196355e9.18.1767759848023; 
 Tue, 06 Jan 2026 20:24:08 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6ef885sm74903415e9.9.2026.01.06.20.24.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 20:24:07 -0800 (PST)
Message-ID: <695ddfe7.050a0220.332508.5da6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 07 Jan 2026 04:24:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767767255; x=1768372055; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=F+bwdj3I9rC4HebITu/OwNmfBqwYMLciPIJqkZS+HrY=;
 b=euIIJ4JuM6jWQcGvtPKxh+/ZPRAeQ7FwEqw9rFrGietkuFipVmG9t2Pjh7rDArBPHn
 PEaBhfEZz/Z1uSV0dtpmokSA2qircXHnO2pSgUYa+VtLOiicmUFVKxhMj6XlQdaKixZN
 xQpomNDbeturVQxCLzGvYDnemSQJ/VvW/7OBLQgkdmDNDQZKmRuxtDiz/7rCMyl6CEOa
 DDecd1tZ5JKAKNynkSeyjCPTYRts+srO85r6IkykrNUS3NbYsAQwm9lnqPJnlWULnWOa
 szvCCsz+dzXQSDfVHZrcbxJXHR2EYeFLx94X7xoaci5QQDUL9aCEEOJ30IraAQi3I/0d
 hgrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=euIIJ4Ju
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-06
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

Autobuild statistics for 2026-01-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 18  | 37  |  0  | 55  |
  2025.11.x  |  5  | 15  |  0  | 20  |
    master   | 42  | 108 |  1  | 151 |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 6 
     libphidget-2.1.9.20190409 | 6 
                       cfm-0.3 | 5 
                   cvs-1.12.13 | 5 
                openobex-1.7.2 | 5 
                       unknown | 5 
firmware-utils-c42a3bc53da8... | 3 
          sane-airscan-0.99.33 | 3 
               asterisk-22.5.2 | 2 
                  brotli-1.2.0 | 2 
                  cairo-1.18.4 | 2 
                  iozone-3.508 | 2 
             libgphoto2-2.5.33 | 2 
              libopenssl-3.6.0 | 2 
                libselinux-3.9 | 2 
               linux-pam-1.6.1 | 2 
                netdata-1.37.1 | 2 
                openssh-10.2p1 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
ustream-ssl-5a81c108d20e247... | 2 
                 aichat-0.30.0 | 1 
                   atop-2.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             berkeleydb-5.3.28 | 1 
                    brltty-6.8 | 1 
                  broot-1.54.0 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                 dc3dd-7.2.641 | 1 
                    dpdk-25.11 | 1 
                      ell-0.79 | 1 
                     fd-10.3.0 | 1 
              fftw-quad-3.3.10 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-14.2 | 1 
            host-go-src-1.25.5 | 1 
            igd2-for-linux-2.2 | 1 
               iproute2-6.17.0 | 1 
                 jasper-2.0.33 | 1 
                jemalloc-5.3.0 | 1 
                  kexec-2.0.32 | 1 
                 lcdproc-0.5.9 | 1 
              libcamera-v0.6.0 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.86.2 | 1 
                    libopenssl | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.18.2 | 1 
                 lockdev-1.0.3 | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
                    mpir-3.0.0 | 1 
             ntfs-3g-2022.10.3 | 1 
                    olsr-0.9.8 | 1 
                parprouted-0.7 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.42.0 | 1 
                pipewire-1.2.8 | 1 
                safeclib-3.7.1 | 1 
                  sdl2-2.32.10 | 1 
uefisettings-149bc92970949d... | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/d32a2c3112070cfb43cd041651fdd03198b9c36e |     
powerpc64le  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/ccd38601d0103c8c8a70f618594ba6169007d557 |     
microblazeel |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/6373d47df73eacf4e2b6d017ecb16f5350588c23 |     
    arc      |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/049cb351c3bc3b150679e47fe1fc8e953a5c11f5 |     
   mipsel    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/f2f5c9cc2d26d0ded4f19bb886c5c5463eb7496a |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/9348b5c878bd0c02c65572e7bc4951adb4aa617b | ORPH
microblazeel |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/d6412709c648a642495aa5722d2dab3e710a5d10 |     
  powerpc    |          broot-1.54.0          | NOK | https://autobuild.buildroot.org/results/e2daac2247e171227d50d322a9d01feefaa384bd |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/0cc7bb5a65fb807f19dcf83e7002181c1a85f0ea |     
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/2e27897d81bb3881bf9051f03eea9a3b601a87da |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/af6a35b39b27a7a5ae114b35fb7a045705adb82a |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4f548296206541d48a136342bf869c29358968f7 |     
loongarch64  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/97c3b3e1e014b250dee7fb0a3167cca35644fe6c |     
   mips64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a51ed6e0c4742b227040c26b4fd203ddc03794b5 |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6679ed6747de3e856a73c458607fa90262ae0068 |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/36d476804512d68e867afba1b6add4c96b208ab8 |     
  sparc64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/f529e90f6b7a6e603f211dc7e3792d0deabb1bf4 |     
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b6535656c10108f42c804dfea612ef283af795a1 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1ca2500f82674bbc24b854cb34a6976e07835992 | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/98bb153364aa3fd0eaed4f24d9a3bf44ba395d62 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7af5aed3c22b161f99204d8738483a563d515bba | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8bf727b7ccb0bf124993b9ff20aebc8ace4c857f | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2213045d7986ffb19a5880125bac63f0f3b94cba | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/19c12a0e70f2de21d507e6a2075f75958bbf412b | ORPH
   mips64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/efbc8f0ba740806bfa3f73744de7556b1f3412ce |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/d1cfdd44d9b72dd1510fcd8bb3fc155b01f3fcbb |     
    arm      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/b98191857b8d841d36ff0f3eae3bb13df52ddd6e |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/eb4cdc1ce967f186e2c504b601260157e562f283 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/47a51c9d2713c23315fb4ea9aa5ea39b2fd3b51c |     
  aarch64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/66f88c692396ab5d9cb717145252a015b71a4bee |     
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/e5391ded7c03be04367a6ca99e26bf68097e61d9 | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/fce9b19a5c42816d97dc3437997da520ef7e9740 |     
  riscv64    |            ell-0.79            | NOK | https://autobuild.buildroot.org/results/03690fa454ffb1c4c79b182cc3a165555e2c59eb | ORPH
   armeb     |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/a8f30e3ff5437f8dbb5e117553f1d3b01c8ccde4 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/312f930f9385ed6b23330647b7e1f5cf9f5802d1 | ORPH
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/dd57bba83569aada4172a07f365c29b809405420 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/2324f6525104e7ce3371164befe2860fdc58cb01 |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/da32561173808ec33e5af642c4e5da13c4556c80 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/ae9279815963b780b844916941b6a0f0b572f265 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/622b715d623441c0be2f1092494b4308b3f1de45 | ORPH
  riscv64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/384ced511f44341d6a437ead6a6b1deb30757f26 | ORPH
    arm      |       host-go-src-1.25.5       | NOK | https://autobuild.buildroot.org/results/89b8e2c8429af30373c50c3f8f9e012c3cae3bc3 |     
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7074ff553a583079be686f5490e7b477f7542f7a |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c2bccacf03d5aa8181fa62acf93588f0755e7245 |     
    arm      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/d5b8e2e21d24320febcb4703a95cb2ed6293c70e |     
    or1k     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/4fa5b22f46356a2c794e861e8d0d9200bd5e9edc |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/538d8afff928873b84aaeb7ebd6a8e2023f04e2a |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/7ba13a024a97393de81493eea3f56cd20b4702e6 |     
  riscv32    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/62ae9673767cb4158fe9d0dc1736a81516d2508c |     
loongarch64  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/70db06f0d134fca594efd6d521a69039d63a8f78 | ORPH
  sparc64    |        libcamera-v0.6.0        | NOK | https://autobuild.buildroot.org/results/4451f5eed0dbad53ec3fd7ce298415e202190e52 |     
   mipsel    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/984dad0d90743dc257f423e975bff6a2ae6a7def |     
    m68k     |        libglib2-2.86.2         | NOK | https://autobuild.buildroot.org/results/15f7a72fa166b9c351c83b9b9db7f783035b434e |     
    arm      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/90b393b329eaf0a48e49bcaf2db98c5a87b4d48a |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/682b02157f3b0877de78da04077bcc29c07daf5e |     
  mips64el   |           libopenssl           | TIM | https://autobuild.buildroot.org/results/84dc643420100828a174843db3444f19458e43b8 |     
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/c0e9581ad2763d2ad9089ae240d002b9bf88d649 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/254d8ae1acb43937b849097bc68b61b00649de61 | ORPH
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4818744fb7dc58a0d71d460c6c0c74d30dad313d |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6b31e5506cc38d4cd71b6783cf4fc80896219746 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8c88446ceb66f7ab4268742097fdb42ca364fa22 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/bd75d936bf3649e84b2e9206d4828b51050f971f |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3af8973ab5a4ef5a49586797b295b5be9adf548d |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/08f3e6188feb89aea13cb4df8449ae510b74b0d7 |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/787b5c2e1a066d1741141b670bc87c366c094cca |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6ab39d6dcb91e7f26e346ee3d2a3c6c43ff175b3 |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/36da73e6de5600e06fe50b030c27a7afb8f9c0a7 |     
   sh4aeb    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/441118177e7bd22ee74b6793a90da0ac049337e6 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4825c91a9c71d9041fbfb52d530685b5fe6ef8e0 | ORPH
loongarch64  |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/d350f09f06d43246284b4c0112544d79a9b0f083 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7b2f42759ce0eb35dd1721820d51d46823196433 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/3fdc15032c10672deaa0e8b9e3f9cb75819fd688 | ORPH
  aarch64    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/9fa9323bac3ee1720396bb34fefb3017125e5a85 | ORPH
  sparc64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/6b60e393b86ee02fabee389defc293a6b48b0c67 |     
   armeb     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/5a8d0c0b2dac09c2839fa8cae680c7572d101ca6 | ORPH
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4be200205171a89656aebf4ab3a439070e56524c |     
   sh4aeb    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/32a36433c6b5b0b8f9174ed8eceebaa1cff9c553 |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/05449d13a7acb34479aecfb960cd2f0135b0ce6d |     
microblazeel |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/8021a8a1ad7bc2a353455a9fdce951ec013117fa | ORPH
    i586     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/a26e74b766c9a39f41293d3c8901b420d0eaf462 | ORPH
loongarch64  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/db4380f0e26751db0e8918157fc5881da7842539 | ORPH
   mipsel    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/fa66f2b156b992360a5e084c276711acf6ba2daa | ORPH
   s390x     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/2045306ecc37074d75b11dc667781270eb1f0f17 | ORPH
 aarch64_be  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/9f904dbdc80b1dc02533016d31147c49cea4be18 | ORPH
powerpc64le  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/50ab1bf8e886de5231ac4fbd9cc4315d50acb036 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/eb67a598a9f4d4175d45db87416adb55b3673f01 | ORPH
microblazeel |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/519756d6b173868fda3b98d0e4f198bea230a6f4 | ORPH
 microblaze  |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/320bf20c189ac556801b026504f4e1102e42da5f | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/14e78590b991c7d70d786c5c1f31072006ee6a61 |     
powerpc64le  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/27d96a69d9c52c04cddf8fc5572b8ca913ba249d |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/1b2b8d1a34b566f5df077c5018668d62512ff62e |     
   x86_64    |         safeclib-3.7.1         | NOK | https://autobuild.buildroot.org/results/af65e6386439098ddf706ca43e99320cf5e9fd80 |     
    m68k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/d4b71dba04d2a7cb3d0a7081fa915df79b2039cc |     
 aarch64_be  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/31909eeeec187b67539a6110f74d0c11d5fe3441 |     
   sh4aeb    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/53b1f110172b293712d2ada698eaccd7ddc0a579 |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/8e0678c72a07876cc582704dca7765e332a19850 |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/1d827bf0fbd487ec270f7f088640fb1882318a21 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/b2c1419442dadb754264f181700d2e950080a213 |     
  sparc64    | uefisettings-149bc92970949d... | NOK | https://autobuild.buildroot.org/results/0e121b9e7c3018e011e5ade7e9cbffe1d7b7a0c1 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/085ebd531f1eff71eac67f70f68bd0c28d7e4635 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/dd06e72f5c8200bcf6b4efdcaa2de51be51d4c63 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/2088689973e5f28af3f3a6ad7e191c7db9f57ce8 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/2172c8185b7fd2cbd6bed5465d66737740a2a86d |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/de52338c4244504bbc2c475d3f5d709d50f9b1ea |     
   mips64    | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/e770f48b0c9c9520b239e0086f2f8d2abba06206 | ORPH
 powerpc64   | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/44639173c2f99a7f719c6125e1394287d07ecfe6 | ORPH
  powerpc    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/fa628ca8fb2590d64be8a9ff2e31793d382f2ae3 | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/17c88282c32f2edfa0991e0e10cb45013c947be9 | ORPH
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/4f2ef4fa404a4ab391f786543fb5ed34a30c86ae | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

               libconfig-1.8.1 | 2 
                   perl-5.40.3 | 2 
            18xx-ti-utils-R8.8 | 1 
             berkeleydb-5.3.28 | 1 
                 dc3dd-7.2.641 | 1 
               graphene-1.10.8 | 1 
             libstrophe-0.13.1 | 1 
                   linux-tools | 1 
                memtest86-7.20 | 1 
                 nethogs-0.8.8 | 1 
pthreadpool-560c60d342a7607... | 1 
toolchain-external-bootlin-... | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/4bfd27ad5c82a40e4f9ed50bd4475db29a898afd |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/f357b11d262683db8d61afaff82115291c9751b3 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/246f3bf07a07b44d949226c549b778bea54b19b8 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/6f2571808faa5a4d48aa6227eb0dba01e75cafa3 |     
  mips64el   |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/91fe0b0ee8dfeaf12196270747459c2f0ee01e6c |     
    arm      |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/0d72c81c8635b47948835e9d39f23f99d7cd200b |     
    arc      |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/825f5469cf78d102aa33f4ef3ddf85663bfa78a2 |     
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7db171407c817fbe8108efb568f6527c396c5146 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/ae3d0832fb2becf9e36242e85d64082d08e159cf |     
    or1k     |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/ab28199bcf49a288292116479887c99cfd9d5abf |     
  mips64el   |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/82b0e6be827cb917cd57c82f1335c43a87988ccd |     
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/0be08a3780c7c9d31f3e736dc350100f9798ee82 |     
  riscv32    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/ddbb5e67cfd89b5f8fec6b7e789b20c721484314 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/756a05c7c3723975a26b5665892f8d92788b448d | ORPH
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/ab596951396dc259718caabf68f35665dd910979 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libxslt-1.1.45 | 12
                       unknown | 4 
           host-libxslt-1.1.45 | 3 
toolchain-external-bootlin-... | 2 
                  assimp-6.0.2 | 1 
                   cvs-1.12.13 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
                 libmbus-0.8.0 | 1 
                  libnss-3.108 | 1 
              libzenoh-c-1.2.1 | 1 
                netdata-1.37.1 | 1 
                  ntp-4.2.8p18 | 1 
                   perl-5.40.3 | 1 
               pulseaudio-17.0 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
               valgrind-3.24.0 | 1 
                  vim-9.1.1684 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          assimp-6.0.2          | NOK | https://autobuild.buildroot.org/results/69343febc13dffbe8af8cd666f3a71ef5731b371 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/021c74248a544cf9e4986f4ea226e58b3d5bf504 | ORPH
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/456e140f9e4f48060a9b6d7d3063610f374fb214 | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/988ba579a47cc9842206f4ed73198a85bc8930fc |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/9d1fa4cea8ced57b936c872b193c2b263789f9be |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/be623f932072af89c1f8a5821ada183ed7e864b8 |     
    i686     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f6810d4b278dde73e3f0faf8373e2e18389dd709 |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/89d22a3cf8e89059de1c87080d477491f64c1c51 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d3bbdfc9656091eae8abcae0e6216f0c2ab54510 |     
    arc      |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/f0e1408fe71f3946941a41dc92ee64374d31672e | ORPH
   s390x     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/d9dc3e1a6c645323e023ff02e38cb74e42575f53 |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/7f1864d69afa4f561ee5b2119d31e2f2f60001ef |     
   arceb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/38183caad078e59b57eb2e4a08394856110c6180 |     
    i686     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/2035886fd7a2116ade00e20d7df5e30e0a45e603 |     
  powerpc    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/fda9a7cdb8ce31c90d2280668759ab85e8470af7 |     
powerpc64le  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/b60f72f0dc29ffb0f24436ba7640e56539c97430 |     
   mipsel    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/d6a5a2cfb13bb53a1d35337f64f9a42b19db688d |     
   arceb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/85a67dbe7ebafe230595c524f66fb511e3b6017f |     
   armeb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/984fb9681f3c3da27c666ed8c0418c26cf682a45 |     
microblazeel |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/74b95ace9a93fb6eb8fada59650aaf1c884c2579 |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/1d66e98a1b268028306d1fe19bbe521dbbea7f0e |     
   mipsel    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/11fb8a27e155500097846777b0a7208b068b45bd |     
    sh4a     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/88f98d7d6940f0971bbcb7487175917ba00d5674 |     
   x86_64    |        libzenoh-c-1.2.1        | NOK | https://autobuild.buildroot.org/results/c9937d079e7b4e26bc9563fb19062ac0ca91df91 |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/ce0b0ee8110729da00e47996ad3609bc89217f98 |     
   s390x     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e74cb7c9c6410bcd337c1d2f56908a7be5d85139 |     
    mips     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/c46f8e77f1e1a17d50bc66b959cc30362c706bc2 |     
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/63300e6fb816c1dd9d3ca0bcf275641cbf57da86 | ORPH
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/0ff1b94a403ce502982c6915ea303a0fd7c94ac9 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/4f09b720977360b79aa7ae626ccae1fbf9096869 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/232263f6b7e31a1292439e1e691c2c67f92cafc4 | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/9960e001dc21278e354b74f21bc3c207f8cfbaa6 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b5ef2c404b55b511d79747e67cfb7341bd247034 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/84c478c4b7f81ded9f02c3878356d2dd82a544c8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ddebf39f27a00ac821845453641ebfdb7ba64c91 |     
  powerpc    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/69ecd6fd1931dfb3ea0c5ed1dab5f08c8ed04804 | ORPH
 aarch64_be  |          vim-9.1.1684          | NOK | https://autobuild.buildroot.org/results/2605281a7072cfe3da2849037030938ff24e147c |     


Gitlab CI results for 2026-01-06
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/12612035379 |      
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/12612033753 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12599342490 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

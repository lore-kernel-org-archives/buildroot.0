Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A93E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 04:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D1D1405C6;
	Sun,  8 Dec 2024 04:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULVzmBujkfi1; Sun,  8 Dec 2024 04:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76B6140491
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76B6140491;
	Sun,  8 Dec 2024 04:19:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF216F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 04:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06CA4408FC
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 04:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoSqgPWOEH3B for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 04:19:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F69040141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F69040141
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F69040141
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 04:19:21 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3d2a30afcso2370574a12.3
 for <buildroot@buildroot.org>; Sat, 07 Dec 2024 20:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733631560; x=1734236360;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hDnGeMsEk9zWo8NlXlSt4OcRkd7pQYFk/g9Viys64QM=;
 b=LR607YbovJ/DOiiCw6UlCQI7Qfry0zgqgCwrEVUDX2eDqBP3ITQyyjYSm+js6VJdYO
 /b2ywa3PkAwCt1+AlqiQ5Fl+Ktl0TloDWIHdjQac4DAl8h2nzESOnYmkXG+jzMX87xmq
 orKw7eO15dRPJd91RWeNzAt3/8xntPhLHVDn66/KrCxSnHWlQIaEd9mA12gra5YV5dHu
 sfV8fDQjDWOf/ABXH4sPyaRt8rKINHa8dBc0t//N4wDZS5itKu0fxj/JZNwfB07JXI/3
 lFr/i7oCrAVByi2RtfQEID7ga8HLlmb4lQBR74tEMU/7bBtFCU4FXsVWAXAKU5TI+EYb
 IzXQ==
X-Gm-Message-State: AOJu0Yzx+17HmIDJ8vViZW028uo2drecbGGpXkTvDvIt+o+XYtqj38NM
 rgYPwHcHIuLb2ZisLd7ULsqEEXzoTbZroDEGhFrzMAelKnd0Acc1uRfpkg==
X-Gm-Gg: ASbGnctoxT5Y0S9s9fB0OIGfYho/rrBHxhD+0eFKcUAuQ1XSy6uJzVG6BiV/84Y9+Tu
 lpuEw1KRP1uAXljduyqW+xIWC+LG8soj9hJzh8Z6u0ZTAlegtsm4CqLnRoCv5OyAANZDd5vr4j/
 jymL4YHHD8fhigbG0u0tDc6XBr4EUx5stYoxEaS5orKKx7orTNC8Lhw0FWk7KcbIAkFcH6p+Edo
 ExzQG+mMwywONTCp/fvq5lzrg+LysjmEnxkk6AGMFJsHsKI7pwNeQ==
X-Google-Smtp-Source: AGHT+IHLdTINy3qobB+yDxGTK6Va/V8sqz+Laj8GFEr+MYW2ZAnLy1UuOOAmNNsu5nO11kwdO2fQ2A==
X-Received: by 2002:a05:6402:4313:b0:5d0:ceec:dee1 with SMTP id
 4fb4d7f45d1cf-5d3be680049mr9040678a12.13.1733631559562; 
 Sat, 07 Dec 2024 20:19:19 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d149a489b9sm4224835a12.19.2024.12.07.20.19.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 20:19:19 -0800 (PST)
Message-ID: <67551e47.a70a0220.1e95f8.102e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 08 Dec 2024 04:19:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733631560; x=1734236360; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hDnGeMsEk9zWo8NlXlSt4OcRkd7pQYFk/g9Viys64QM=;
 b=RaJK1AUQhq5y62cnnzuTowuFoOczvoTJ1bwUh3xfXvWSyZNnkEnJLzDEiryXXOw7Yk
 3twQKzlavTR3cMVW7oPjHptfnUhBk7Pjcq3+FS895oqVvnfYyxRbwRygi/myP5L4/Pz1
 kfohBKe+C7gGSermWulnqNg3RgQr/dLQ/oG1kits77oFIsKCwRmL1KSDDTI8UWKSTKSv
 0lDa3Wl7y6WmR+bxVMiduGi7KItsDwxXxRlt4nCkM/Li6GACujjsHOamMiMc0X5hEd7o
 oWwjPZespWXvxhLyMmQMYHcr+tCrq8wdvaD1i9EY43PyQnw0xlUCT/XBqia0io27ekpt
 T4yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RaJK1AUQ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-07
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

Autobuild statistics for 2024-12-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  1  |  0  |  2  |
  2024.08.x  |  2  |  0  |  0  |  2  |
    master   |  3  | 56  |  0  | 59  |
     next    |  1  |  3  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 2 
                  gnutls-3.8.7 | 2 
  gobject-introspection-1.76.1 | 2 
         host-libxcrypt-4.4.36 | 2 
          linux-5.10.162-cip24 | 2 
                 linux-6.11.10 | 2 
               mariadb-10.11.6 | 2 
                  ntp-4.2.8p18 | 2 
           oath-toolkit-2.6.12 | 2 
               valgrind-3.23.0 | 2 
                 agentpp-4.6.1 | 1 
                  bcusdk-0.0.5 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.15.1 | 1 
                 c-ares-1.34.2 | 1 
                  curlpp-0.8.1 | 1 
              fluent-bit-3.1.3 | 1 
            freeswitch-1.10.12 | 1 
                  giblib-1.2.4 | 1 
          host-binutils-2.43.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
 ibm-sw-tpm2-rev183-2024-03-27 | 1 
           libfreeimage-3.18.0 | 1 
                  libsepol-3.7 | 1 
                  libva-2.22.0 | 1 
                libxml2-2.13.4 | 1 
           libzenoh-pico-1.0.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
             matchbox-lib-1.12 | 1 
                 mesa3d-24.0.9 | 1 
              mosquitto-2.0.20 | 1 
                  nginx-1.26.2 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.28 | 1 
                 openssh-9.9p1 | 1 
                   pcre2-10.43 | 1 
               pcsc-lite-2.1.0 | 1 
                 rtptools-1.22 | 1 
                 siproxd-0.8.3 | 1 
                   swipl-9.2.8 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 
           v4l2loopback-0.13.2 | 1 
                  zoxide-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/23060cd9b882b214ff5471efb142adf954b551e7 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f46c00f3f5cbecd8c0af8f1bde96b4445f1bbabe |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/ceffb33b6f647bc31587346af4cfce275daa6db2 |     
 powerpc64   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1116d1511b568695274f997fcfa9b3109e2c9947 |     
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/4dd990b9de065f4253db9343e324039f28de17cd | ORPH
   arceb     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/93128b4e971a1ced277a8663510e76d3b32a5508 |     
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/25637f35a47c53755c19b8cd6018c0a728acf53e | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e1821a969b962ee0543ea9376f958339a92f0f81 | ORPH
    sh4      |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/a0dbd941f898994e201819bf6142694157b7505a |     
powerpc64le  |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/a5c708b4f9ce9e622f42562ec83ff855e5522dc1 |     
   nios2     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/1f964140d50c60b90b917320186b9320e75cd7d5 |     
microblazeel |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/7cbe811a7f888da441ee14d816347e883008e46d | ORPH
 powerpc64   |          gnutls-3.8.7          | NOK | https://autobuild.buildroot.org/results/c22e2fb055750c76a100fc17b155cd40cf453547 | ORPH
    sh4      |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b13ec83d38bffb0bf881383086bdf76a69e29b6d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/cc1d52d3e50a503f21b895286f1aed34d29fcb09 | ORPH
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aa04bd62b7c6368156f292df2b4d7f0c037ff8eb |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/a91b6e7e766e774eb86338528d288e9fa4bb0bfd | ORPH
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/b9710eb2fad595ed791a77051650ca434621ba50 |     
  powerpc    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/81e88c1d501ca5f125cd46a7cc76dbd0004d46e4 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0cb6abbb4bdb44464b64e9e27766992ee2993f9a |     
    m68k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/18a4cc2f8db509a59a43e407508be7c4a671b63c |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/f92af33bf4577533df70be94dbcddc3cee42f5d3 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/8e32b31ab3dfd84f3c032750f79fa6fb1a716653 |     
    arc      |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2264b0093bb6bf9bf7e27c9e79a395566aa10988 |     
   mips64    |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/5eae38e0fc6961c67456a8821455eb679b458936 |     
  sparc64    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/7da3e03c97d61dd335602e143ca2d587b8edafc4 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f2235e0148e95c930a8faa152e47e563119323cc | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/7b75cacf5bf9e3b50f8cb37d5e780d5d4ac8a0c6 | ORPH
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4e2f437f6641c21c5d4abdb41c91f24d265ee3a3 | ORPH
   sh4aeb    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/70ef7887a3290b8c76a64c80bf000de99a0bc226 | ORPH
powerpc64le  |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/66748e2306841de72d04dabb6077436f52dbdf92 | ORPH
 aarch64_be  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/884fb15f0d940d9afd14b8347619da2c1e64cbc7 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/ac24dce62e28d85dd88fdbe87fedcb9ffff4d15a | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/cae2cfb1f52cfaba333536b50398026704ae9639 | ORPH
  riscv32    |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/02b1bfa6eba75dcc72fe543714388f195342b278 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/6429aaa5a4a219f0d0291879c4deff68ccf160ca |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/bcafaf5211902feb2bfc6bfe3b3fc509404bb45e |     
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/fb706a199a521db77653698db3faae819a1094fb | ORPH
   sh4aeb    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a842ba29cee070291269aa9e34433a53e7337ee1 |     
  riscv32    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d2e6409a50fb457dda29fff9db7e652d5f4a4df7 |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/cbc0f74c9b9410647f1143cb8b033552d8d9f41c |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/659629c36aa233a3e278856eddb072d10e75eab6 |     
  sparc64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/2ba6736e5c0947d80e5d7c820b422a8343ad15ed | ORPH
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/2382e8907a47f0d386b2b6923285ca1cceb2f8d8 |     
 powerpc64   |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/8b374ffc3df4ff9a71f8fdb1ffb55f57c9e48254 | ORPH
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/d424c283997053835d000222c8e1bf110ae2df83 | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/b83e782f8915a2d0e7ada1405db840965d3f163b | ORPH
    mips     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/3f848cb835afea7dabdd99808719169d69d7b076 | ORPH
    or1k     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/c9dbaa5edd92a4b6c2709d949f88bafee8aaadb7 |     
 powerpc64   |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/f598d1571c52aa6943f4f72affe272a3a3fb39a0 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/84715f0cb9b76df49d09e47a14863dbd3860b112 |     
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4017918b7c8bb9e240c0a3841a8f75c1afd4a033 | ORPH
    sh4      |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/229fdefad30b70885999e913746cf61268f0ee06 |     
   mipsel    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/7df45e5743334edfa4ae4073399ce4ecd487c491 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/1334c695d0cadd32ba1cbd8b3e810c8aa086da29 | ORPH
 powerpc64   |          zoxide-0.9.4          | NOK | https://autobuild.buildroot.org/results/79b01e3292c06716bfb6604d833026184044fbe8 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                libressl-3.8.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/1a4da599dec3beed7f99502ca05fbed9eddd9530 | ORPH


Classification of failures by reason for next
---------------------------------------------

                   cvs-1.12.13 | 1 
                     daq-2.0.7 | 1 
                  linux-6.11.7 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ffd030309c12994996efa6617497ea7ee9b4f170 | ORPH
    mips     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/fb6f9c138608e58126e9197171ad8eeca4d08d3d |     
   s390x     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/d7e9d323b66dcbb384243fb1753d7152ce5d15d9 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D72FC3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 21:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C741C6082B;
	Thu, 10 Apr 2025 21:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfaFJygusHPO; Thu, 10 Apr 2025 21:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8564960A51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8564960A51;
	Thu, 10 Apr 2025 21:12:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FC32108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 21:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10DDF610F3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 21:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OO0VgOhniPsC for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 21:12:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B180E608F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B180E608F3
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B180E608F3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 21:12:25 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5ed1ac116e3so2109958a12.3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 14:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744319544; x=1744924344;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Ybj+BdpHtLI8nc+tU0wrgFpdfUIj9/Cbw5WIuJXb2g=;
 b=fkK1QTCmQEh9NKD67B6Nf3Biv6g/o8yD7M/b1YkW6vani8akSZGTL5Yw2fs56YLI9Q
 /HSWiKmvznWe+mJrCZGcZyePsNIWcNEC1BrMYGFcw79/G5VtM6rFoF2QpUOgDzBGOAIC
 rhlF23c9N2SLG/9XQCokv9nfJxYN18Q39iFoV/Ov9p1LdogTb/VltNBSSQEZZR0/Cv4D
 IdIMT175Ch6h5wnVhq1xjhx2RFZ9tbSLeJLwvxcKumR4gtUnUtP0GSJLJ3LHotuevAIF
 T1JdasKtpvrR6EAsGynCAsqjLoS+xUJaUlJ1sLs3DtS+5C8ERwdJVyoQolrOgnyFotDl
 GO2Q==
X-Gm-Message-State: AOJu0YxozIt4mhhhPyesH2DQFTQwJPWE2aALwYpk8lzFky74niGSZJ9e
 YtJKfbS4axXZfuvWX2Zrfdq5QPPPm80ArLpV/QzUtmY0PU+53oTe0N1RBQ==
X-Gm-Gg: ASbGncuCG8pMzlCWA88coGAE2gZYByL49+2TEBP5QE47ad58SKt/eUUetX1lzTDPDqG
 EdXcuuPg8/1X0bq1e3nLy7zlHgxauUeO89ZPGwrwXhpJQSxOXS4ap78GJEUUxsPZEjLbkrZ6A6U
 an4WWvPxXuVisBd/OQp5uEIvHX01N2O18SxeYEOdV2KlSnzZMIYEb9aGiTUnKwkei+0XlAennuT
 GSgHCKKcxDaLdVd5Hf2pvWZa58HvCLGfhFQq1dWd5njkaT/gPag91ttDgEChRXChHGoBdCuil3+
 Xi/ggXWJrwGHOgVLnzaJ5gVN6+9GynWkqGwip4L/vPXP
X-Google-Smtp-Source: AGHT+IF/5kqoM3PRHTCxQ/hv2UR4pO+Gyip9VdKa6Lgu/aKVyx450f/3NTreaux9ZQxmlKipH3u2PQ==
X-Received: by 2002:a17:906:f594:b0:ac2:88d5:770b with SMTP id
 a640c23a62f3a-acad34c3471mr16595666b.25.1744319543394; 
 Thu, 10 Apr 2025 14:12:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1be98d4sm333600766b.59.2025.04.10.14.12.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 14:12:23 -0700 (PDT)
Message-ID: <67f83437.170a0220.2fa37a.b6ae@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 10 Apr 2025 21:12:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744319544; x=1744924344; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2Ybj+BdpHtLI8nc+tU0wrgFpdfUIj9/Cbw5WIuJXb2g=;
 b=l+0AJXpisusoO6tbciKQWZNUEB+TKXELIETM5BrMo84SPmbyQTyL47iCiTAmNKwUJj
 agSArJ2c6EwmnMrbUUWRtHyTLIa0aGQZVCFi0TxCpx9nIlIprRp4Ur/dOYTN/o1dbanz
 rEbBuDnCohyc/xu0PySHnQBJRI5Zd7DBrhfvVXDhmHFWPhPrISJWZMpErcLRUyJ2lfCh
 8eZrvWAWOGQV0jy0sF0WpaP2Xodjkbk11XC0R7bhR0pyJkOplPPjNOCLnEZ2pM0Rpqx8
 hazR6Suj27D058rexacm/S85qe0m0RXLlhH3eLYLq6b2SRJ1e1rNqi3HKW5UFg97R1I9
 0WEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l+0AJXpi
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-09
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

Autobuild statistics for 2025-04-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  1  |  0  |  9  |
  2024.11.x  |  5  |  4  |  0  |  9  |
    master   | 11  | 51  |  0  | 62  |

Classification of failures by reason for master
-----------------------------------------------

                  ffmpeg-6.1.2 | 3 
                  linux-6.13.8 | 3 
      passt-2025_02_17.a1e48a0 | 3 
           at-spi2-core-2.50.0 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
                 host-gdb-14.2 | 2 
                libesmtp-1.1.0 | 2 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 2 
          aardvark-dns-v1.14.0 | 1 
                    azmq-1.0.3 | 1 
             batman-adv-2024.4 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
             bluez5_utils-5.79 | 1 
                elfutils-0.192 | 1 
              fftw-quad-3.3.10 | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
                 glibmm-2.76.0 | 1 
               harfbuzz-10.4.0 | 1 
                 hddtemp-0.4.3 | 1 
host-heimdal-f4faaeaba371ff... | 1 
       host-nodejs-src-22.13.1 | 1 
              host-rust-1.82.0 | 1 
             libapparmor-3.1.7 | 1 
               libfuse3-3.17.1 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.2.1 | 1 
              luabitop-1.0.2-1 | 1 
                 openssh-9.9p2 | 1 
                pipewire-1.2.7 | 1 
pthreadpool-560c60d342a7607... | 1 
               pulseaudio-17.0 | 1 
                python3-3.13.2 | 1 
                ramspeed-2.6.0 | 1 
rtl8723ds-52e593e8c889b68ba... | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                    uftp-5.0.3 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/9e602f86f4fa2996de53f0eec31b62c061918184 | ORPH
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/7f5ff7756c24d3192bb72001a3b8926957338347 |     
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/a73749c3e72edd572fd025c7c537f85ab7dfe50a |     
    m68k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/9c0a9dc78c7d1df17d83815467fae45426962e42 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/76239dfbf02fd0093425379e3aead3578ca41041 |     
   armeb     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/6d18b8d055b0b09307f76d16370ac66e0be8be11 |     
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/f8eb9d86eefbca2c9973300ce0f824148e5a2283 |     
   s390x     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/1ef1613cf2463edb709d28a89452f156b60b24b6 |     
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a2f17178b4e2f21d2b63494a219000338fd68382 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/963d5857bcb0270547f667fe1ddf4034b6f5fbfc |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/86a4d3ff86214937f883d66a8d84c1f50a57f1bf |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e8099c6aa59016a0540dea78e873aff04cf95496 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/d5b1865ad28485b89c358debf22d2d2eda64c2f1 | ORPH
  sparc64    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | https://autobuild.buildroot.org/results/b6ee59ff6ae20ed071df3bea484c359892f03749 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/e82465b62aa63a829077171eecc1a5a282347f89 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/9edba8aa4aad89872824133b592cac43591feabe |     
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/4cc860241fc5bcf7b0c7ef151fc0cdfff6249c68 |     
  riscv32    |        harfbuzz-10.4.0         | NOK | https://autobuild.buildroot.org/results/1918b8d06ffb59bef44224c27a9f860ae7bc472d |     
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/dfd461f33b3794fca094981f20159fc24421bf37 |     
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/caa55e0d13d27b7e78b650f8640a155226a5e75f | ORPH
    sh4a     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/51dbbfe9abb0901bfd183a9e5a708f7b2432e211 | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/367758a52c4c5dd7e8e1f61637ae25e3f1b1a651 | ORPH
  sparc64    |    host-nodejs-src-22.13.1     | NOK | https://autobuild.buildroot.org/results/a856e8d9b9292d177aebc0dee7d7a732c996b381 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/68fd8db85998679f0f483577f4ea8c0c5e0af1d6 |     
    m68k     |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/fe6ca51806f609129d0165e043861b1e2b549ada |     
   x86_64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/11220ba871c845de4e230620ba8c9cc8d03c0512 | ORPH
   sh4aeb    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/4718a4d29612931d995e7c4c8759b00bc0c92fe9 | ORPH
   xtensa    |        libfuse3-3.17.1         | NOK | https://autobuild.buildroot.org/results/8f413e5b73bbb11618556c2bb6c78f242853ee8b |     
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/0ecb350991a6706e72f8c80fb659b5e1017800c6 | ORPH
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/d7ead652c99ef24297b4dbd328d78ef1ea26e9aa |     
  powerpc    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/6c9dbb713bbe6dc8d3041a6d155746e5e6380ae8 |     
   mips64    |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/214dc7d36b7b82ec9f2513b532fd015e8df57835 | ORPH
powerpc64le  |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/03a10b76540df8163fc909f019d1cab44da86cba | ORPH
    sh4a     |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/3af8ff1fa347988729fef68df585d3efc65d02c6 | ORPH
 powerpc64   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/4a64b66b54530770828f91d1927b52813be7bb02 |     
   mips64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/b5219ac03de65c449f1d527f0cad4ace449034df |     
   mipsel    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/707cc077aeebfcf3a176cf2f99502fa6f2af25b8 |     
   mipsel    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/405adb680716f7ab02bcf085784cda5c13dd4887 | ORPH
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/b473e8931ccac91a347ffa6e509151d91bb0ff96 | ORPH
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/28e7cf20a727fd67d0a6ec1dd348f9ce35510108 | ORPH
    sh4      |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/a37e60f97be1b255778c60f1d0b163b507fba88a | ORPH
    arc      |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/e40fe4ebabea22e9e9bcd345c634d34a867792d8 |     
    arm      | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/0a10ffcc3e33df2e054e2fdafeeacadc52974ad7 |     
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/446ab3f1f7c7ff7a9c18f150662887466bf671a6 | ORPH
    sh4a     |         python3-3.13.2         | NOK | https://autobuild.buildroot.org/results/3d2fc029a4e839f8449f0c2c308384a940c6c46b |     
 powerpc64   |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/2d55da40bb91a2ecf12583aea242912348809d95 | ORPH
 powerpc64   | rtl8723ds-52e593e8c889b68ba... | NOK | https://autobuild.buildroot.org/results/940e7f95fff017b8c7cffb778911ae0386980fa3 |     
   sh4eb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/d75f23410204112e35721d0b085e171744148fd3 | ORPH
   armeb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/dda81c11f2dd7e6c5c89cdc61866dc12622ac071 |     
  sparc64    |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/486c673275e893f3fe41cef553c440223c856240 | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/6cbee59492198bdfb621585121de51c4fad192b9 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                gnu-efi-3.0.17 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         gnu-efi-3.0.17         | NOK | https://autobuild.buildroot.org/results/3bc995aebe581eb02a63dc7a8ef2ca1b110ec932 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

             armadillo-9.900.2 | 1 
                   ltris-1.3.2 | 1 
               openblas-0.3.28 | 1 
                   perl-5.40.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       armadillo-9.900.2        | NOK | https://autobuild.buildroot.org/results/3d0961062a537cdc7995d71ceeae2cf4e5a1b2b7 |     
  mips64el   |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/66a33362d7f597a55d5529998b58f14966fb7dfe |     
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/5e3b2b5bb886bb1ee386ddd60929fb241aa3ad6a |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/10a152dd8780f3f1f6c1fb95758cd6fb3992633b |     


Gitlab CI results for 2025-04-09
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637627137  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637627136  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637627135  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637627122  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637627109  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637627026  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626930  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626921  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626841  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626837  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626820  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626685  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626555  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626542  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626366  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626353  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626198  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626186  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626183  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626163  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626103  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626098  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626094  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626079  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626073  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626069  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626065  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626062  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626055  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626045  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626036  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626029  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626023  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626020  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626014  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626006  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637626002  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637625983  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637625800  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637625790  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637625780  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637625762  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9637625705  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64102C28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 04:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1992408D2;
	Sun, 23 Mar 2025 04:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maNIWBh5DRPo; Sun, 23 Mar 2025 04:14:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D3CC408D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D3CC408D3;
	Sun, 23 Mar 2025 04:14:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 88E595E
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 04:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AABB60A50
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 04:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJjX_ZbfXOnb for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 04:14:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A4DF60639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A4DF60639
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A4DF60639
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 04:14:55 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so617381166b.0
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 21:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742703293; x=1743308093;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eb6/VurBpcTsupBaA9LKFXHWWg5PQE0aFEoRjGELkFM=;
 b=g70YfO/Mt0fNg7IE1L/jxpPWRfFWRQuBwUJbBnjW+H7QPrq/BlzbOXEXN9zRbBZMge
 YgfbQZf1BXwvD65WML6styKn7Fber7ZAuOMZ0yVBzzGm4HSa+ONc5Vdf+A8Jn2fdmzbk
 dFvOCasW/cMpLI8k3f7+joEiZJiK9bTTLbkOZ5fpnNnJg2mH8QHPq7tn03QMKt6lWLAX
 Rj4vEhFPljTv8yagXgGHR6dVCr0kdnhcDR8/jyFkh0FQLe1z/YvE12H1yB1J1BbXbKNV
 ybINgMpSK3UVk97MWClH83u3/A1vqb+Lg+4gq6hfSCU7U4MJKdl0T248Rkiz1vu/A3Rd
 oe3Q==
X-Gm-Message-State: AOJu0YzYJkaZNO80UwnX14oA/o3CqW3Ja1OCktpBdWee6+tQBgfaRhBL
 A6/nVjRCEnaz1uY8OSgVlUEWCHM8Pc0FOobBDiYPy4JBJ5tW6BpN0PncAQ==
X-Gm-Gg: ASbGncsepIlwwYVhlTjhlYPVuqYhqjzghGewLh2PBVuhGl2y1KlLK0OqPd5yNtKEATu
 AVEOULTkmhB56SVcCjmTvY2lMqA12510QZ/D0/0I4LfSkH4tePxrrYkS+p8o+iSYdSzeB175kXy
 I3+VylFjzbkcqmP0naCg39LZSDCc7SqNk5EkJqLrEHpUZmsNAVJuKDJCnawLv6/vw+45f5MXp4l
 cUgjufbCUomp29+kuTLdbFcvoWHoUCacBdAut3Yw8cnZUnhW0ClAap62Ji7R8p2LtJkqAYoE+a9
 YTvOZqsgGGKXS3oV2uMmpcVNIWEQu89heFLvQqmWBAB3ULJY
X-Google-Smtp-Source: AGHT+IESOIsF8XWrICYoG36Fti5Q2kLg92UNDQXDQLFhimtMXzrzHO9Sa2d6+gjAMgcOqCdBn3ac0w==
X-Received: by 2002:a17:907:7e8e:b0:ac2:1f58:4e3b with SMTP id
 a640c23a62f3a-ac3f042fc56mr501624166b.25.1742703292783; 
 Sat, 22 Mar 2025 21:14:52 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef86a13bsm453140066b.23.2025.03.22.21.14.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Mar 2025 21:14:52 -0700 (PDT)
Message-ID: <67df8abc.170a0220.1c28d.e299@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 23 Mar 2025 04:14:52 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742703293; x=1743308093; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eb6/VurBpcTsupBaA9LKFXHWWg5PQE0aFEoRjGELkFM=;
 b=RnfV0kmJXLoSpkxbJcPzcHTsKkPd0D4P+inAd/xMenwfrQrIskeZHuwhKE11Aoxmn7
 w0TPcoczQ0W9xTHrayaOSUBWKXvdxNWDRVtstyzoKtzkhilELqwUJvPjSapmGMQ3V8Ds
 hr5bn5M9D0R5aJb9iG+Ic766CATAOy+6T0oFoEotTysWPqSMBoLMfcqP6dDuM9VoDPkA
 dtx89Znz9htJSPyNcX0MN2OR2GAcneQxYbh+iJV3osqGBK3uMO93pyjREQJIIjbBgIa9
 le8BiUad/CdiBMIRc859cAZJUkkNsGfaFGHPsVD7Yf4wWZSnY7X9FAcdSEJCaFc8PMHJ
 j1OA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RnfV0kmJ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-22
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

Autobuild statistics for 2025-03-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  2  |  0  |  5  |
  2024.11.x  |  5  |  5  |  0  | 10  |
    master   | 10  | 64  |  1  | 75  |

Classification of failures by reason for master
-----------------------------------------------

               cracklib-2.9.11 | 7 
                 openssh-9.9p2 | 4 
           at-spi2-core-2.50.0 | 3 
             bluez5_utils-5.79 | 3 
                elfutils-0.192 | 3 
esp-hosted-927a34f99724bb74... | 2 
                  ffmpeg-6.1.2 | 2 
                 host-gdb-14.2 | 2 
              host-rust-1.82.0 | 2 
                   perl-5.40.1 | 2 
               pulseaudio-17.0 | 2 
          aardvark-dns-v1.14.0 | 1 
                    azmq-1.0.3 | 1 
             berkeleydb-5.3.28 | 1 
               catatonit-0.2.1 | 1 
               collectd-5.12.0 | 1 
                   cvs-1.12.13 | 1 
                   duma-2.5.21 | 1 
              fftw-quad-3.3.10 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
    host-python-greenlet-3.1.1 | 1 
     host-python-maturin-1.8.3 | 1 
                  jack2-1.9.22 | 1 
                 lapack-3.12.1 | 1 
                  libbpf-1.5.0 | 1 
                 libcddb-1.3.2 | 1 
               libgtk2-2.24.33 | 1 
        liblog4c-localtime-1.0 | 1 
                libsoup3-3.6.1 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250130 | 1 
              mosquitto-2.0.20 | 1 
                    mpv-0.35.1 | 1 
                    nodejs-src | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
         python-remi-2022.7.27 | 1 
                python3-3.13.2 | 1 
           sane-backends-1.1.1 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/e02e4c561b00f451fb5825a731e237e5a6f7c2fd | ORPH
    arm      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/eeb619a563de2379895bddba25352afe98f68c23 |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1d5803f883d26a15dbf9d69a54b4be476ea56781 |     
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/38a8d2884886a07e159d108f39c599166a3602c6 |     
 aarch64_be  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/54455192369c459841dd1aedb3b28706fb05060a |     
   arceb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/9ec8b5cc5773699bc36fb47117f98cf0d9822339 | ORPH
    or1k     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/0328f8ccd0f268182ba87afbdd9ed8bc12923b69 |     
  powerpc    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/7d8315736cb0f4fda43786fac9f8f31af445cc51 |     
    i586     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/fc14c7402dbc999cdf1016ad9f02415d04651f58 |     
  riscv32    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/1af277706bf4289b651883cb443ae90eaec8aa09 |     
 aarch64_be  |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/03a6e717c41d1c45cf8a46b5eeb5f8ac06fd9edc | ORPH
 microblaze  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/385f3099b62ed1fd2a64107d1f58526c95d33349 |     
   arceb     |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/208dcbff06c8ba16801fc686c45c98e186818b96 |     
 microblaze  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/8c86b36f4354c4dad6a200db5988d769f5d0af31 |     
   s390x     |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/406ea2b4d0def17986ae3bd7dd77e0c820848ef9 |     
    or1k     |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/d29b9f0dd141eaaed1b2f6ce9dda13023d0b9839 |     
   mipsel    |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/9e24d82a030542735f35f708e8f6dd15931d3468 |     
   mips64    |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/f68653d6acf77302cceb0ece948f8f735786432f |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/539d668843390cbb3ac3fd416d1fe90502dee685 | ORPH
  mips64el   |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/2465c0ce5cf70a8f6138d36b079765d4b8fc8c82 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e6774329b965b09f442b25b909e14fb05cd3f9cb | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ea8420af263776ced3d66e62b692a0b8fafcedf5 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cfc83376dc134b820baa3d84b7adc24c9b576c9a | ORPH
    arc      | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/e6c2021659aec1f2d649323f71f9aa4e2213f058 |     
   mipsel    | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/3ce9f2803f0bb60bc8420ffff598e292d1db0e09 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/df4ca0840d0a7064d28ae32f9213082cdefdf06e |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0885ad434ea4bf43ca99354071e24192ff61356f |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/85aa759e25b46f69bcd9bf5bf7bdbd1771fd9185 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/e90eedf460f69db23477ca72b7d3d35ae32b517c |     
  riscv64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/37ffe6870b7b079b7a2e2a940fb596617e0bdfa7 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8478933bcdd835648cb42f734e1e048126b451f1 | ORPH
  riscv64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/991811eeb1e49e65dbae3432431c24d6a9d05c0d |     
powerpc64le  |   host-python-maturin-1.8.3    | NOK | https://autobuild.buildroot.org/results/48e2c03aa47af069ea5b179596981c174129b76e |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0d122515a1804460bb4e62b0878d8dcb103f5147 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e1f420bbc2b38c0067ba7b0768c130ac4fbf8d64 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/382c1458b948b0834cb95ccd9fe54de870060ae1 |     
   xtensa    |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/55e82531b9634f202752392ec6952313441dc594 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/07b1cdcd5345c980b942d10a872fa3a22f9049d4 |     
   s390x     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/1670214c16b6867ba0e072596ed422ef7e46b59c |     
 aarch64_be  |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/955cd562f5106b600971e60bb9d52cd2999f5f9c |     
   x86_64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/b789dc729909914125f5b5d7f616c954e709a5c4 |     
   mips64    |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/518c22fbe6390ae307cbb45a81975a29e85e2b21 |     
   arceb     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/064924f1f0862e4597e4074c72dc1fa88b10ab18 |     
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/de985ea2d4aba74589bed77a3e60382ff88ba64e | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/ee4e640621f9783e53e81c2fe37a7d246b521b6f | ORPH
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/0bf7924117420c33b2c5706bfd643a62a1696000 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/a9b27260e0b2ef2a522550be714226d092afc255 |     
microblazeel |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/31483884512fd0fb3f00ae49a6fc999e228dc420 |     
   x86_64    |           nodejs-src           | TIM | https://autobuild.buildroot.org/results/1b47b50e1f7a4d0792885cbd71adaeea99dcb383 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c1c2f81245c7124d1dcfe4ad01d59072d5ae092f |     
 powerpc64   |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/bd06b85270029938e7a671cf065a3905ab04f1f3 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/1a0d4acd14d7a424a5c781bc79fba8dd1e2a3bbf | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/19a10590d490dc6e35609468e876869afdf2a13c | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/29bac7c61288ed17a0082c97cc5b221f2fa2d7f0 | ORPH
    arm      |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/451fe50129b776f5ced83a5f0185fa4abfd5ee60 | ORPH
   x86_64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/dd999ee738ca8d16f1b53a292f9470a13703fdb1 |     
powerpc64le  |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/64c873d8b44da043331414d4fcc2e74133f86510 |     
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c03bd1a777e623bbd8e18284d5e312110fd0e369 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/abfcaee8e85498bf7ef4bafe171402c0bae45723 | ORPH
 powerpc64   |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/a34f75090eb0bc0242ff5eaea59c311e6040a2e2 |     
   armeb     |         python3-3.13.2         | NOK | https://autobuild.buildroot.org/results/13a8a4e5114561d7bc83305b6040a7920130c700 |     
    sh4      |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/7b3024c90238ac4489796a0cca3dbeedc97085ea |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/73424b23f7bbcc76b0c83ba7b3cbd8f30894fcca |     
  riscv32    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d7060e78f744adec060de2d4e9ef981839ed0a97 | ORPH
  riscv32    |          xvisor-0.3.2          | NOK | https://autobuild.buildroot.org/results/cb0af51f7b7f1b07a03d160e23ccc6b75899a643 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           crucible-2023.11.02 | 1 
        host-python-lxml-5.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/c6f21e3f22e27012947450aca24e012317ef83a1 |     
microblazeel |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/90ec0827108c2287469a9db19571f5da2f8e5225 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
            freeswitch-1.10.12 | 1 
            host-binutils-2.42 | 1 
             libargtable2-2.13 | 1 
        python-m2crypto-0.43.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bd9c9338a0513e08fe85395b57b5086b40c91198 | ORPH
   nios2     |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/7eef69e6587783307cd9231abdc4a2fee60c075f |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/94bc1d89a91a72d783672143b4ab47e1ec97ad95 |     
   nios2     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/9293d3af7554da3c264aad367df12f84407b2edb | ORPH
microblazeel |     python-m2crypto-0.43.0     | NOK | https://autobuild.buildroot.org/results/e5f3977fbb2208d978cddae8c76ada70284907d1 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

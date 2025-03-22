Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5662C35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 04:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B86608B8;
	Sat, 22 Mar 2025 04:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKNbwlig56Aw; Sat, 22 Mar 2025 04:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DC2460901
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DC2460901;
	Sat, 22 Mar 2025 04:14:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A544D1A0
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 04:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9367B4016F
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 04:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWqTzLv53jGE for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 04:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAEE9400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAEE9400E0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAEE9400E0
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 04:14:30 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso582000766b.3
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 21:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742616869; x=1743221669;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2UGmElUYiRCq1LTfRVGX7IDDq9QchS6gpZD/TBfNZRs=;
 b=mJ0Au5MVDrFYmLgdAm+i6T0ZDwcwM7jm2nxYJDLK2jxVEex2iyDbJsIPEOzVyb0po+
 Ggo82itny4H/dpElcUgb1iMhYUjFGwXrGlvfXcZyf7Lx4ZqQKEEm6D4njESPSybkMx2t
 jU9u3ftP/26U8P+MYQFvIYRr3xvAjyu5l4fFEgYMpZSE0gXLz5qC8MBeBr3ytTuL/pW4
 MEsTiF8RrHi4ro8g5d1UzfP67ia/XIV5YP2q4yvI0iRqQAc0I1CnS031Zg4hkHt1CFng
 0f28CC+iV5xxoKYXCqEk3mECyCB0v75DkW5tp4c22wTaVzwAHclJ5hJv6uO2QL91IQL2
 4WxA==
X-Gm-Message-State: AOJu0YxR6xKYgj7rUX5G4t8TGoHE3pDJLG/N+DcYUYYUsSIcerHazFU4
 L9KEdTdF4cgrI6Q69zvTSD5BtfUmiZT4mxUOjna3Kv3eBcSKdipQAYTNPQ==
X-Gm-Gg: ASbGncvyk/qZFYBJADueMQazqxcckq6NCWpQQ7C4bZKe3ELi1/TgwA5RacDyVRHGN1A
 UDmleiyxEP7dnnPuRbr+ZChAJgPP/dHfTykj1qgf9ti7+AWl0on3LniriLuFnRyeXXyHeV4SgPa
 M38HD/N1AqYToctKG7++4Xr+N8T4oKNkTC7RIuX8IGJexJaw2u4PsSg3vaa7EUJjNOLUTitpf3l
 GslJcN6YNuyuzMNY0u8YKqV30MbvcfSZllFQOremYLvrpPDNY9V/PqJwpIZ8gMZv0v0IB4l45SF
 GKTFKvO+KEVi/F38e0CO45ln0hALYOFq/LiMht+djxXHSwDq
X-Google-Smtp-Source: AGHT+IHNPOVev39XDbTOiYlSMaYhyPruLI6UxxFAyMOvbZx6NpzW7DyqgMjRRpaHZ9hsO1zwEYCdpA==
X-Received: by 2002:a17:907:2ce6:b0:ac3:3fe4:3378 with SMTP id
 a640c23a62f3a-ac3f2100e84mr577807966b.12.1742616868306; 
 Fri, 21 Mar 2025 21:14:28 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef868769sm264983066b.14.2025.03.21.21.14.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 21:14:27 -0700 (PDT)
Message-ID: <67de3923.170a0220.2817d5.9927@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 22 Mar 2025 04:14:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742616869; x=1743221669; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2UGmElUYiRCq1LTfRVGX7IDDq9QchS6gpZD/TBfNZRs=;
 b=LtefpkXzpa1Q+NLIRSqz/4MkTSUss5AlJ9H98YMiNdrZbMTRmR98HGl64JQUIQwFKW
 qMzcOEcHOCfiOios7Q4HZCSaYpate71njIzQaN1Fb63lxiNUjf1T9OsNLa3iWU3riYYl
 VBclOhZzPretYFLsUtv8MfzB9ioVckxI+sSdVvcfuIUOmk3YvVuoxfbej+y+bSTOvSvB
 ecyD/yriG/EQpB+4CvSbVmNdv8Co1Q4Fflm3B1G2inMgsGctzdMm3dpLqRd1+zWmaHjQ
 uY/6PK4kqbufgzHgWMBAXnZAwvzfBW/S26lsCv8PXudkkeVlCR2I4HofBbR2l4fkQ8El
 f8Ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LtefpkXz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-21
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

Autobuild statistics for 2025-03-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  2  |  0  |  4  |
  2024.11.x  |  3  |  1  |  0  |  4  |
    master   |  9  | 65  |  0  | 74  |

Classification of failures by reason for master
-----------------------------------------------

               cracklib-2.9.11 | 4 
               graphene-1.10.8 | 3 
    host-python-greenlet-3.1.1 | 3 
esp-hosted-927a34f99724bb74... | 2 
                  ffmpeg-6.1.2 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
  gobject-introspection-1.82.0 | 2 
           libzenoh-pico-1.2.1 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.13.7 | 2 
               mariadb-10.11.6 | 2 
               openblas-0.3.29 | 2 
        s6-linux-utils-2.6.2.0 | 2 
                       unknown | 2 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                    bat-0.24.0 | 1 
                  bitcoin-28.0 | 1 
             bmap-writer-1.0.2 | 1 
                 c-ares-1.34.2 | 1 
               catatonit-0.2.1 | 1 
               collectd-5.12.0 | 1 
                     daq-2.0.7 | 1 
                   duma-2.5.21 | 1 
              e2fsprogs-1.47.2 | 1 
                elfutils-0.192 | 1 
                 host-gdb-14.2 | 1 
    host-mender-artifact-4.0.0 | 1 
               libcap-ng-0.8.5 | 1 
                libdrm-2.4.124 | 1 
                  libnss-3.109 | 1 
                  libsepol-3.7 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
mali-driver-d40c57d81c9cf4b... | 1 
                   ncftp-3.2.7 | 1 
                 openssh-9.9p2 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.1 | 1 
               procps-ng-4.0.5 | 1 
pthreadpool-560c60d342a7607... | 1 
             python-webpy-0.62 | 1 
                python3-3.13.2 | 1 
              skalibs-2.14.2.0 | 1 
                   thttpd-2.29 | 1 
           uboot-tools-2021.07 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/cfdc4681202fc8011b83fbc17276fde4ea7f0409 |     
    m68k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/f9ce351fece4c26e23b2ba1167bf8cbe23be0b58 |     
  powerpc    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/e8eecf7aadc0557ebac48c97927fc75b7f70fcf1 |     
   s390x     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/59e8cb670926efc1b4cb3ece7bd44c6e9b505139 |     
  aarch64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/6e799a054660bb4f65bb9fd2a29fc326d532fbfb |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/e65c50f395e603c5c38a871edb4ed617e452ae13 | ORPH
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/a80536311124453e578fdd42f187ac16f2f8368e |     
microblazeel |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/8bd380cb3476a2717a3784a16d926bbe028643d7 | ORPH
  riscv32    |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/e406855951700d69a468b08375542c7cfea956e6 |     
    mips     |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/0dea285a1dc7e2d513f8c5cd1fe2a7b46cd82a8d |     
   s390x     |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/d4fcc41dd1abbf9a44747445c7d338e7a41fa62a |     
   mips64    |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/989a38922665a4259725d50b5121fa1b99066151 |     
    or1k     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/fe9d5eb60fe64592f68ae6ab1b7748bbbe0f5dd4 |     
   mips64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/100bb37b90a8d80ffd6f9baae1ea350eb82ea317 | ORPH
  powerpc    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/f6d1e653da7a892e30ce7ed7f25999e3c3082955 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/998054084993c38bba4a8c73f21226e24d68df8e | ORPH
  sparc64    | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/68ce3721475d259a0db42b7ab84ef08ed7fba00c |     
  sparc64    | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/466aa423bc1d5509b0c695df6d233d559a160f4e |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/161565d19aa9a4f7ff20355a68a8036f86600bfc |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/5ee84bba6f486a6e2883117ec1d21178be42399c |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/40d0b94e0e58d29024dbdde1ff21369bd967c94f |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/1c2bbe47d7b6a27ab33f88779ea7f9f49f95a281 |     
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e092764d0832f40bab43c5637e65c9916851d9d4 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/74dd820b4dc6ab90030fdb057acdba8468913dcd | ORPH
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/1675371dd9200cf5d8982dde5eb0eb80556d5196 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/49ebe2b7d83626842613e2903255ef1c352b74c5 |     
   armeb     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9def1c609bb8e06607c8ea51e6b329a3112fbfab |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/850714c9a501e72a001677e4271e510c413265c8 | ORPH
  riscv64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/21602b560c8bcca0f6995132591f5fbc5f507b54 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/23405d4db41fa6f187825d7305effb682a9cec38 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/f2ea8cae6f788def538a74312b976adc076708e2 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/fe0172180b38f1bab7c931d0b4b2ad1a9043254a |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/3b0116183cc07ff87def079eddca5d45dd95cec5 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/d196361ec9bb956208a9ef0ffac31fee5f6e3627 |     
   armeb     |          libnss-3.109          | NOK | https://autobuild.buildroot.org/results/002d1c671ab532485624b4eb3dbd147a22bf1154 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/f29641c82550b8d38d5c113d9bd31c92125c502d |     
    arc      |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/ec97c0a87bccaec4797b255aba23e59cfcb801a2 |     
 aarch64_be  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/956bd4cf08ea4965fe89070ae25e14cd6c25ff05 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5a1b175e8dd7a3447bcb17d244281a57fe48530e | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/10f88979e9fe725dfa0c867a0a5ad57b7b2b1236 | ORPH
  aarch64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/fbd55f61e681905929f76db120bdf2260717bda0 | ORPH
    m68k     |          linux-6.13.7          | NOK | https://autobuild.buildroot.org/results/5627aacf71318ca6f549bac841f4295c14454738 | ORPH
   armeb     |          linux-6.13.7          | NOK | https://autobuild.buildroot.org/results/6add340075fc5c649cdb4dfe90233b05ffa048c0 | ORPH
   arceb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/17b794c8ae7feb6dd822210e22d46ddc6464d921 | ORPH
    arm      | mali-driver-d40c57d81c9cf4b... | NOK | https://autobuild.buildroot.org/results/e71a5b46affe5948c16a0c83534d8f56f69b6e91 |     
    m68k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/1dd04e6621ac4a52e63059f6459599e28192057a | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/4ca9c9b62d72cca49f936f62e18cf9d939d2fda0 | ORPH
   armeb     |          ncftp-3.2.7           | NOK | https://autobuild.buildroot.org/results/60c3dbe02af354ff9820258ffd00eec088114d69 |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/7b1533a33b0797f695e9e8ea130784406c658806 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/646701e0a3f30a057205c8904088e7e37be1b674 |     
    mips     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/3e64b440e191a584866acebd0ceb055278b62c68 | ORPH
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/cb3be809e9ac12f00a849e0025502bda153a86ae | ORPH
   mipsel    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/4931f7b149a6d690870036820865bdcf3677d74e |     
 aarch64_be  |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/af2a45fc323dae73709fe9d26ae249c2ac0ed52f | ORPH
  riscv32    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/81cf7f5617136cc10478f5a3f49ce2d41d599da7 |     
 microblaze  |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/d38a68360936f0804562c4d4821527d217f2f5a7 |     
   armeb     |         python3-3.13.2         | NOK | https://autobuild.buildroot.org/results/26b752738022e8b46e810a08e28d687120e5c4e3 |     
   xtensa    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/61857107233ab642ccc8e6aaafd28e667a8d5fce |     
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/b99189db96b21eb06b2ea9418bc62529c8853234 |     
    or1k     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/23c9aecc1ed11820145a2c143fe092ffa76f29b6 |     
   x86_64    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/3d6bf14a40045321d97a9561623857657dde8462 | ORPH
  sparc64    |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/69cf3c4439e5d8656fb4498dbe871c3ba7189e3a | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a4c58d1a724cfea6e717f49d506c419e99f4c0c4 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/63091bdb6cb52bc93ba4122d43176c6d8c82fefb |     
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/13257b0dde9128c5916437f5f387c83d3d40ea39 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               host-go-1.22.12 | 1 
      host-riscv-isa-sim-1.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        host-go-1.22.12         | NOK | https://autobuild.buildroot.org/results/0b24123fdbe9dbe30109ff734ceaa38171b812b4 |     
   s390x     |    host-riscv-isa-sim-1.1.0    | NOK | https://autobuild.buildroot.org/results/30c3b286e5c4abeebbb91a71226a3f265ce83c6a |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                 xenomai-3.2.5 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/3bf20982f2a0ce42c858da8d42a4411638e1136e |     


Gitlab CI results for 2025-03-21
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998164  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998212  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998217  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998225  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998240  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998358  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998498  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998540  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998549  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998558  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998567  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998631  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998640  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998654  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998674  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998703  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998829  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998836  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998846  | ORPH 
           friendlyarm_nanopi_r3s | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464998916  | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464999139  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464999657  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464999769  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464999791  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464999910  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9464999926  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9465000224  |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9465000228  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9465000252  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477664021  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477665021  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477668561  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477669634  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477670176  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477670390  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477670641  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477671305  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477671831  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477672018  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477672118  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477674195  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477686893  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477686966  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9477687339  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

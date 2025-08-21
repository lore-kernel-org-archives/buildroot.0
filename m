Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8643CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 03:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6173F4167F;
	Thu, 21 Aug 2025 03:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxxLxP42UV_9; Thu, 21 Aug 2025 03:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 997AB4168A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 997AB4168A;
	Thu, 21 Aug 2025 03:18:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53DA67AD
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 03:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB4464167F
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 03:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3jPoi7K0KIA for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 03:18:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DF044168D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF044168D
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DF044168D
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 03:18:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61a1c6a5338so870610a12.1
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 20:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755746319; x=1756351119;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pOn07l7yW1NFyWKiRpS6Du+Oh8PsUnmRi/d1lvKwchc=;
 b=CDFekrlp4Kntd3HlwnBOeSs+CcKSR0dNcj0VoJnCD0NO0wXPJorCA4o/4UdHPai/3Q
 PYB2IZA7gHw1jjchpiV/U/LGdnWJ2yAuNQ9ANreg5GmIkpK5vqZcDDUBaOreR3IEDW2t
 Uf9sCTNkv9dG1Z0s3fml+PI8K2MPbrYrOWXoQ5MHCIWawrEh2FAOiSFeZcoO4FEuDfyI
 6LAaZAIM7LCnvmF55e0/iT+eaTAPc0naCaaRpgZwu5U3i0ycr10yxcNGoQMwSy1LuFv6
 BGUSZNoq1k3cYJ6+sJX69LkMnfkiDry7vQh3Wzz6h1dU6UFzkUTI35TB7eGM2LHaKpNh
 SwHA==
X-Gm-Message-State: AOJu0YyR8sEoOy2cVJzBlEfYPBieQHC8xUpaRJJA3z1KQOFXRTnwvIEB
 8tThCuqvffIYD0aXu1xQOxTxaZYSFkH47+aozPWms/maeOUuAJslnYwZlMkBQg==
X-Gm-Gg: ASbGncvtdcX2kcucROW7zw2yvox0RBrTUpdy1bQq7Lw//n0Pumvxu9j+tA0fXjPeQK/
 G56U/WDN6obAOFFLu9Pd6Lh4POg2YeFBSdagYFcBV13na1oj7ZJTizyl9563dBDt83+0kj90UeG
 yGYAWitm+3zHAMmNm21KbxZr46xNto0OSAwDPn8d+H37FJMH0uriVZ4LRRQURxkUpWTagnWSvyh
 Plxy16EFV76QF73oS0DOWHc7Sw7uTXzbg3ju0YD/+6Zy+SFJtpjaivhoBZCHf0glJ24VUAz/Mzp
 4hwnT2vRgKRHJIMC4z6i1vI5jiq7QQlgrlwxx65n7iWNzcX+g+noe1a1XblL1iAji/44kLBU+DT
 JzaO16w+IT3C8jn+5otA5srTQEjKhBA==
X-Google-Smtp-Source: AGHT+IGTwCMwZZGpg6M+fzFsuNTnr61O9EfoBPyYn8el/B5FRbhU1fS+g6JFilDN5YGh1Z1gvDJPaw==
X-Received: by 2002:a50:999b:0:b0:61a:9385:c77d with SMTP id
 4fb4d7f45d1cf-61bf8747badmr454435a12.38.1755746318872; 
 Wed, 20 Aug 2025 20:18:38 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a757a48e2sm4276020a12.40.2025.08.20.20.18.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:18:38 -0700 (PDT)
Message-ID: <68a6900e.500a0220.8718c.ff30@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 21 Aug 2025 03:18:38 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755746319; x=1756351119; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pOn07l7yW1NFyWKiRpS6Du+Oh8PsUnmRi/d1lvKwchc=;
 b=fTwwe1Py9KkHw70nFGuDNy9WGfd+ZuoOAVTRfaJTPfvLAZ3vrdyAb7wJcCpv9m1aDQ
 6ROIUphaxa0d88jJXgGJIvwgizljDtAfm9vgAJhcZm1r/jsx2GakwPjGNakDMxXH/kB/
 lxNaxfa8zNMRBDjEblj5dc73FWAJPwmJTWt/rIAM0hFdT4R5rrNhPkkmqJa5XfGqA/rs
 qfFaBwq9RKeFkizwxPVzLTF4JCSeZe4s4r1abQaKJugE76lv5CpM6Wva+7Nxlofgj67E
 1z1/UefnKQ+sp9W7cV1AkroUyjc/ILiQcMTzuruTULjkMZ6WfB6xw2dTeacU8WZHp/51
 s9WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fTwwe1Py
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-20
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

Autobuild statistics for 2025-08-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  2  |  0  |  7  |
  2025.05.x  |  0  |  3  |  0  |  3  |
    master   | 34  | 120 |  0  | 154 |
     next    |  0  | 16  |  0  | 16  |

Classification of failures by reason for master
-----------------------------------------------

libsvgtiny-ea9d99fc8b231c22... | 7 
host-binutils-arc-2024.12-r... | 6 
                  libsvg-0.1.4 | 5 
             berkeleydb-5.3.28 | 4 
                 host-gdb-14.2 | 4 
        liblog4c-localtime-1.0 | 4 
              libselinux-3.8.1 | 4 
            netstat-nat-1.4.10 | 4 
brcm-patchram-plus-15bd6638... | 3 
  gobject-introspection-1.84.0 | 3 
libdbi-drivers-0bfae6c43134... | 3 
                memtest86-7.20 | 3 
                       unknown | 3 
                 host-gdb-15.2 | 2 
libesmtp-v1.1.0-14-g335ee8d... | 2 
             libgphoto2-2.5.27 | 2 
                  libite-2.6.1 | 2 
                libshout-2.4.6 | 2 
                    linux-6.16 | 2 
                   perl-5.40.2 | 2 
                 agentpp-4.6.1 | 1 
amazon-ecr-credential-helpe... | 1 
                 apache-2.4.65 | 1 
           at-spi2-core-2.50.0 | 1 
                   atop-2.11.0 | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                     crun-1.22 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
             drbd-utils-9.21.4 | 1 
                     dtach-0.9 | 1 
                  dump1090-9.0 | 1 
                elfutils-0.193 | 1 
              fluent-bit-4.0.3 | 1 
                     gdbm-1.24 | 1 
                    gpm-1.20.7 | 1 
          host-binutils-2.43.1 | 1 
          host-gcc-final-8.4.0 | 1 
              host-guile-3.0.9 | 1 
     host-python-maturin-1.9.1 | 1 
              host-rust-1.88.0 | 1 
              host-swipl-9.2.8 | 1 
      host-uboot-tools-2021.07 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.506 | 1 
                lesstif-0.95.2 | 1 
      libabseil-cpp-20250127.0 | 1 
                 libbson-1.9.5 | 1 
               libglib2-2.84.3 | 1 
                 libiconv-1.15 | 1 
                  libjwt-3.2.0 | 1 
                liboauth-1.0.3 | 1 
                 libssh-0.11.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        linux-headers-5.15.189 | 1 
                  linuxptp-4.4 | 1 
                 logsurfer-1.8 | 1 
                    mpir-3.0.0 | 1 
odhcp6c-53f07e90b7f1da69771... | 1 
                openssh-10.0p1 | 1 
                pipewire-1.2.8 | 1 
                     pound-4.8 | 1 
             python-webpy-0.62 | 1 
            python-yarl-1.18.3 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
                 siproxd-0.8.3 | 1 
                    sslh-2.0.1 | 1 
                   thttpd-2.29 | 1 
              udpcast-20230924 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/2f931f4a6e7723941b857fcb3e50655c21091954 |     
  aarch64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/4bc53ff10d3190d81dec408929b3192d9d6a94e4 | ORPH
loongarch64  |         apache-2.4.65          | NOK | https://autobuild.buildroot.org/results/c75843cce4bc754c9c06e25d7a0b9f84bb651f84 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/04b4bbdc6572c293f9a5eaad218a950c2556e61e |     
   arceb     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/1ab8744a95750ed31a04a3008849ffb6f1ee8c67 |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/9227e76f5611107a70b04a2ebe46d78619738ced | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/6a078439a1db155c5ced24f0d277346e7664cce5 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/7fa320f3f9bfa2c062782598863cf7d34a7a9d4c | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c0e6fbe92327dbf493e49b4af60cda79802e8fef | ORPH
loongarch64  | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/9bba7e73d30629653f44ed09f50e599e72ec55ec |     
   sparc     | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/829383407166f09788ade976e5d757566bccb0ad |     
loongarch64  | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/082a99ac543755c5de3c205cb2f84371943d31ed |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/cb8f3e3d00e99938d8544473f7bb81f9853cbbca |     
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ece80085031dc841e9db26b2bef7c9c2638a7dc4 | ORPH
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/c890b38be8faea5072eb4503b254939c5f8c07cf | ORPH
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/702f2a8efd9413ac351e44727c9438439e0201ac |     
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f23ac8622fa0356a14a3d987ad65350a8f8ad9ea | ORPH
 powerpc64   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/20790ad71392dc18fa06acf7079be9e727f8d357 | ORPH
   s390x     |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/e03378bc7357f0c2ec9608f9e462b3be6335dcb0 |     
    mips     |           dtach-0.9            | NOK | https://autobuild.buildroot.org/results/a7798daced19a2cd9106955a84504b5bd199c47b |     
   sparc     |          dump1090-9.0          | NOK | https://autobuild.buildroot.org/results/dbf55d0fd8d779f408e7ccca4c2a9083e7a11f6a |     
  mips64el   |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/d85bca5ba8f8d3b1712aaa5d31324f6860a0b21f | ORPH
loongarch64  |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/58b25d62cfadc6c7d55bce77337717bf91c6b199 |     
    arc      |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/e1f812dfd2f89c0f5d39b7ec0486b45f4442c4c6 | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0120d787dedce54e057bf4486f89818ca4f74923 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/17f9e0fb7766470616426d79cabd90ce19dc5bff | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/86a9d81e8055c1772b5e747319bc1e2b1cb4abb6 | ORPH
    mips     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/3af9495aeedb9e53bd75ebf9bc550c6895b12685 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e0dcc01f17b5cffc4a04a5045cc9252846487850 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/eb6f0199babca23ce01e73ecd7d6dd0223dbeb3e |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/a0635a56129678dd2387f60c274aeeee651f4301 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/baf582f117906ea0b792d074d3d0a0057223565d |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/1dac861e7f1890d294f3dd68f1b34d2e77371cfe |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/c484db20af6927678226423909e2678b25d9cf46 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/4e379bd01cd1eced81c111a991352a6319c60fa5 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | https://autobuild.buildroot.org/results/457049e49d42ab5b1cbb585c54ee28b9339b4671 |     
    arm      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a8e43b19cd0f63458c87e2fc29041ecd1c3dc029 | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/23d4eeaa96d129640dce68ec84a52181c5eaa196 | ORPH
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/387b6b61cda849574eb0698bcd75ea30e56b4820 | ORPH
   sh4aeb    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/fe917dd3fb59aeec3ae141abab03cfb3d6ce6018 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/93022c6808b1aaf4887f7bc82ce41d71b3346e5a | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6b49b43646955ad8c8de972fa1cd4d725d78700e | ORPH
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/11c9c9c11d48442b7aad73ac856b2a0ffe967123 |     
 powerpc64   |   host-python-maturin-1.9.1    | NOK | https://autobuild.buildroot.org/results/ac7286b1bf0964b3d0aaefd7addd659b9c82b34c |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/e7980040f82bc828926b0b8b4f8e92809dd283a6 |     
powerpc64le  |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/7b490c4b1129d9ba9ad1f6123d31206e8a586579 |     
loongarch64  |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/a3560352bc638a79b12980fd1984fd66eb865de4 | ORPH
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/481c2db21958e26be609ef722353b07549c12f71 |     
    arc      |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/6a48020a8c254d6cf33ba01894573f057de2b93b |     
   armeb     |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/e4799b999a322993e190539a694599380908525c | ORPH
    mips     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/0f83a8af02a95ca7b0fb6d5037b39ce69e6f89e0 |     
    mips     |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/e85dcafdd2417687783a4929f06282a6806bf708 |     
microblazeel | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/bfb86fb22821624ff092764109d3a8debb5eea49 |     
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e0ba1809d5af57e72e8a3de5ae4b852a5d9bcd52 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/2ddc4b5b3d488169c11b142431f100afa1b2062a |     
   mipsel    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/dc7c66cf980ca0e595871dfdde8cd3f52d905dbe | ORPH
  aarch64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/e55cf22392a8d570a68c9e0874c5a917fff94e17 | ORPH
   mipsel    |        libglib2-2.84.3         | NOK | https://autobuild.buildroot.org/results/55ba148e1b7f54393b3c26f66b3de4a4042b0a60 |     
   armeb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/253da039e73503ad14bd171799d1a84bc8e033c0 | ORPH
    sh4      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/065b0d3447cda465217f46fd8df02f85ce312c70 | ORPH
  powerpc    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/26274eaa19cd04733abe59e77ebe30315cd095ed | ORPH
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/6163c16db797298fc6ec3bc0ac0075b28310cbe8 |     
  riscv32    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/bf080c933164ac356eecc9c0ba12cafed6c0cde7 |     
   mips64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/291d76d64cd2c19b112a250128b75ad831be154b |     
  sparc64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/c52cc0aa53d7280ba43f5e0c7045d53f03e39a5b |     
    sh4a     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/645783168441a5e607e8f00da8b18d37c0549bc0 |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/77bdd78457275c7f9d369570d356b5c83581f489 |     
   s390x     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/5ba30a369c360d032d28a2a49fc2ba0c61c33fda |     
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/e972bc79be3b8e4e4d46b9a27b00af037d513610 | ORPH
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0120cbe7de49d413c03a70a64b8f2f5f33d8e668 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fe2fbf23ff4d03a6b375366c6a8fb9351bcee9d5 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9f626c1e9c8cdafbdef00d88bcd82a8fbca38203 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/029d9fc7de43dc0587760873d1ff2d182a7b26c1 |     
  mips64el   |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/98e1b022b1c2d4123b2cb9ea852db4e5c198aaa5 | ORPH
   mips64    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/3e568e12072335b620fd46711b0b98afd2d7eab1 | ORPH
   mips64    |         libssh-0.11.2          | NOK | https://autobuild.buildroot.org/results/b1fd68844789bb2d84a245e73b08e9f72900ac66 | ORPH
   s390x     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/f94a2c4f818d097532f3ae27d66ef9bcee984633 |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/872c33d2b1e63a452f0968402103c8014c0e2580 |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/cdfd3ebb9f05eaa2f14b1d57e6db56b0c7b454a2 |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/5ec6c5ca91f489dff00a4db74b369029a53955a0 |     
    mips     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/3ef3443cf60435135550d6ddd2246ff025d1e6df |     
 microblaze  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e3102d8201b859a9f9de3d42ea66af66c476f236 | ORPH
   xtensa    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/7297242437b717650a70c62d5503c61bb62d8d5d | ORPH
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/a00acc899b93d196a67fff81f323f5ee9dfe73fa | ORPH
    sh4a     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c002a57195ca3e21e6299c58d66f8e32fbf50a95 | ORPH
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/d6d690c098e450d2714c295d37a3fada71a26331 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/9e439910f30ed4eaaa8b71a238be01190b4d958b | ORPH
   sh4aeb    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/8920de17df1443a273d98316580a71f14836516a | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f285d32f221f0706434a923f513b0d84fd08f2dc | ORPH
 microblaze  |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/b684d0b37e5187aa9b31693356f8515857d19f7a | ORPH
loongarch64  |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/0a95b7b65f3e39580a6602ad3b4c27a371464461 | ORPH
loongarch64  |     linux-headers-5.15.189     | NOK | https://autobuild.buildroot.org/results/9fc28e14d6bbaad0542c76a7e327ecab227317ea | ORPH
  mips64el   |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/1d9855f5d1d446af144e32147a00cc405d2fe1d4 |     
   s390x     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/78eecfcaa46f4dda1a8d5fcc05d046437b1c9688 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/92c71db1ab2038ee41e4af97264a5d0cb3e6a6bc |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/d9d76a1e2dae99d8bce8df77d79a381ac3d180b1 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/ea56a0c364761b367994741a7e0c1c222093afbc |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/acd087ea1fcbef09c51fb3b8aa9b7414beca4544 |     
   mipsel    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/b13f19a506bd261a5de416a1e1be629b6af125fc | ORPH
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/b60c75209f735946df1a0ce295f6878f0ea583c1 | ORPH
   xtensa    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/b437491074ef571ad23bf22c1cc4d809f4b9c19c | ORPH
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/95fe02d9c06c0888fa45df41b46db0aee531313e | ORPH
    m68k     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/dff46800c92cea4484dff129bddd977c08037b32 |     
   armeb     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/3f89f00407c0ee78960c81f10fc43c61ec837ed1 | ORPH
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8864535efecf5ea62dfddb0b729687667ad99463 |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9e4f45f8bc875d6219ea1619e379489c41343fa1 |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/f649156e3d9d654afc36a48e72044ba15fd8dc77 |     
   sh4aeb    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/2d34e9da7009255a74f4075eaf896e46ead12a28 | ORPH
    or1k     |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/294d87678a7b6e21532f11844ae12b9a6f2d7e23 |     
    arm      |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/c406cabe17c78171c6c74f0c865b6aa2fb661589 |     
   arceb     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/4ba42d402a98b96769f8fd6243cb1173fef116fa |     
   mipsel    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/7ae5956ebe59327c2672c67938d04a5a5815118e |     
    arc      |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/92033b70ed1df1740afe5aa52adb6c446bc1e631 |     
 powerpc64   |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/3c096d7b879e18dabf84baea8dae74550f6ac0a9 | ORPH
    arc      |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/1e12d4a47b7cb96bd27c5e92550eba324d5d90f8 | ORPH
microblazeel |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/e940d96f9c4ffceb3ec64f5c7de9164064f79d72 | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/1f47fa22b322d734c7242c7cdb7a2966caa9ef53 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/8900e17aaf77a6c4a63560ee280d9a3d0a19ab97 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/e3151bbaae8a9437dc1908a260efefbe4ae75977 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/9a197aeb2ebde98bbae1875eff7448145f15fb73 | ORPH


Classification of failures by reason for next
---------------------------------------------

                   bash-5.2.37 | 2 
          chocolate-doom-3.0.1 | 1 
               dvbsnoop-1.4.50 | 1 
                 expect-5.45.4 | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.88.0 | 1 
            igd2-for-linux-2.2 | 1 
                libglvnd-1.4.0 | 1 
             libgphoto2-2.5.27 | 1 
                liboauth-1.0.3 | 1 
                  prboom-2.5.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
            python-yarl-1.18.3 | 1 
                python3-3.13.5 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e22721b6c50d42fcfba9d88660b541cff933630f | ORPH
    mips     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/6de3e106d062252574ed31835acace62045797e2 | ORPH
   s390x     |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/1f6dc3ab1a1792ae6797f225dbd7640bae8a638a |     
    m68k     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/30e3e8aef0948989ff0b80d8e8e4847b4112e0a8 |     
    mips     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/cffbf9715483b08d5a9098d2c2cc86e449d4c307 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0dc5948cce1ace0777e2f9462cd046d4aee0aa85 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1d7813e421e2e6613821d26b545da5a4bd2525ce | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/a385cdc9f2a6dd5831bf5bf5ed8ae2eeacdc2cf3 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f9c2968c00849eac428e49e4e7a3b59379eb7fed |     
 microblaze  |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/e0c58a7aa3304775d1bd657c7024aec7512a75a8 | ORPH
   mipsel    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/bb78eddbe43d816bf026b91fbae566eb426ec653 | ORPH
 microblaze  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/637e2b3806248a69e534413f90961c8180fba589 | ORPH
   armeb     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/1af48ffc7162c14d48e5778798b09dcaeee99827 | ORPH
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/aa1e026b81c0803f94b8065115a1ca4140deb004 |     
   s390x     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/7dea36a6ae2882c0679ccbbef0cece9a10f0fd68 |     
  sparc64    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/c25f2d2a97d1083121c5bce8ae36efde9e25570e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                   perl-5.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e6f00bcebbf9ce7751a70f08ba23104a4ccad6bd | ORPH
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/160a272f1fe1d7c42a50213565ca72e403d0156d |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 1 
             libgphoto2-2.5.27 | 1 
                openssh-10.0p1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f5108ac37aebaf2832ed07e2d09ba8e81638f678 | ORPH
  powerpc    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/51c9e0a9f1e3e48199cfeed831023d7117dd77a6 | ORPH
    mips     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/49eced9a10d2fc9739148813863d1591fd78198a | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

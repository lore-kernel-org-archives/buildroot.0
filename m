Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3412C83F22
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 03:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A82E084013;
	Fri, 18 Jul 2025 03:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pEHYh2P8mF3; Fri, 18 Jul 2025 03:14:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0210484004
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0210484004;
	Fri, 18 Jul 2025 03:14:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54B42DA
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 03:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4678A41243
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 03:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JCLieoIOwnH for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 03:14:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5BBDA41715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BBDA41715
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BBDA41715
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 03:14:09 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae0de0c03e9so245264666b.2
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752808447; x=1753413247;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ctStR+hJukVWFFjFcx28+ku6N2GML4tXSkPHKkZZQyw=;
 b=rLNJht/mmFU8QD3lmjNQRitgx+bp/Z6MfBeT0IUva7/L9/5Q+1R1L72DoptKPWJhcI
 XTd9vwbdBRQkCEJKj63DhHZ++ftLVJR9NNnPpaW0nKM8pfIqRf2WjzxpMHYLZSpV2Vkw
 qMbvk3q8nB/RtupfLzsQhlVHjF0GzPgMDU0tIaCDW2kwGA9A+/vo6vTpjXgjnun4fAwt
 jDrI4EvYJ25HBccAulrqKHs00WItSikWYjMpMvsDenVbuSLZ3DFTOWDENp3ey17qf9iz
 jb5FgKSis4d5OTE1xLMHhg6LFpMOs7/mnOCy04BVhpj6UGbVpD+iDDNvaqZaBvBXaVvI
 d2cg==
X-Gm-Message-State: AOJu0Yw1kd+cxhJpaB3XdayXpwaTA7Ya5GMtAmzpsezdQcZW8PBdXT1l
 VO+ElUzBfFhH9+rWQTso8Gw2n+mKDYFjPwEgYXTdx49LC1cbDaJX9wr2ry5dCA==
X-Gm-Gg: ASbGncvSZYU+swTfcEys/YnaL2dEJn+EaDNe06Oo605afJbcSqOMPYVO21KcMj4xWyW
 TkRWje7dN07SWOVBaQDIjIgX7rgTyh21wT4IhuqDF1wC6rnJ1ecTMqC53s0DnxXfZJfjNr2GBMc
 J8zkkusdfhmm7jGnYBlEIpSANbRlVqAhAfxxsrS7lfklPrdwGG0J+KR1d1q3vAjs7KATp8CrqXW
 b3QmqeW+Mu8Wl4m6L23sxATcWoJbhib9+IFb7VIvNMXv4yjL6Ly6IEJIBRUQvhmon4tpWJ78I6z
 qmj6d00a+/mrUsiSKJTrIr3xhXsbUtUmg1l8Vgchykvqm1TVgmjxRvl3MxNUA8lb8jFSj4iaHD2
 et6EcrdlF6sKRyK9W5QlYkrA2Ew==
X-Google-Smtp-Source: AGHT+IE73rffMrLZgmGKmretSrG2jKr166o+Kz6Hrv1OuVgBZL9dbBKp6vqaEgtKbR9FU1iCrEcKiQ==
X-Received: by 2002:a17:906:4fc3:b0:ae3:f174:4484 with SMTP id
 a640c23a62f3a-ae9c9b104e5mr904205766b.46.1752808446830; 
 Thu, 17 Jul 2025 20:14:06 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c79e16esm41300166b.15.2025.07.17.20.14.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 20:14:06 -0700 (PDT)
Message-ID: <6879bbfe.170a0220.15a8d9.0d4f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 18 Jul 2025 03:14:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752808447; x=1753413247; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ctStR+hJukVWFFjFcx28+ku6N2GML4tXSkPHKkZZQyw=;
 b=bmgCTz7AKPEJG5NyVKj1sTMTkvXCOVPy7MQJxsC0DGXZzEPoU9aXJR3Nun/3PSdu7n
 XCTlJTvzf4mIM5z7gvLkfzAmDdjn0hjGabU25nMXq93L7uiTdj42E7K0X8SwZhOwzp8e
 oTf3Aw7It6xG884oMg1MNuYcUJMKikLTOPg3EsPgrTzZN8ohmx3HdSmi5v7dBsww5o+B
 YSnSBUIx0gjU5iBZd35n+OdFmUB0YHxhcAJLBH6STGHYn2xfE76zqSjd7LIxVR7y1QIj
 3gOHOmtYRlR6dQ49uVy5LkdzbmV1k4ZIt+5wPG6X40BGQEeBlo6Fj24F1tFAmJe5YUYT
 Cw5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bmgCTz7A
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-17
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

Autobuild statistics for 2025-07-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  5  |  0  |  7  |
  2025.05.x  |  4  |  9  |  0  | 13  |
    master   | 15  | 139 |  0  | 154 |

Classification of failures by reason for master
-----------------------------------------------

        host-berkeleydb-5.3.28 | 7 
host-binutils-arc-2023.09-r... | 5 
libdbi-drivers-0bfae6c43134... | 5 
                   bash-5.2.37 | 4 
                 libcddb-1.3.2 | 4 
              libselinux-3.8.1 | 4 
                 logsurfer-1.8 | 4 
                   nanocom-1.0 | 4 
                  libjwt-3.2.0 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
                       unknown | 3 
brcm-patchram-plus-15bd6638... | 2 
glibc-2.41-5-gcb7f206537240... | 2 
         host-gcc-final-14.3.0 | 2 
       host-gcc-initial-14.3.0 | 2 
                 host-gdb-15.2 | 2 
        liblog4c-localtime-1.0 | 2 
                liboauth-1.0.3 | 2 
     libphidget-2.1.9.20190409 | 2 
                  linux-6.15.6 | 2 
                    mpir-3.0.0 | 2 
                  ntp-4.2.8p18 | 2 
                openocd-0.12.0 | 2 
                   s6-2.13.1.0 | 2 
                    sslh-2.0.1 | 2 
                   atop-2.11.0 | 1 
        b43-firmware-5.100.138 | 1 
                    bat-0.25.0 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.4 | 1 
                 coreutils-9.5 | 1 
                   cvs-1.12.13 | 1 
docker-credential-acr-env-0... | 1 
                    ficl-4.1.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
                flashrom-1.5.1 | 1 
              fluent-bit-4.0.3 | 1 
                    gcr-3.40.0 | 1 
                     gdbm-1.24 | 1 
                    git-2.50.1 | 1 
  gobject-introspection-1.84.0 | 1 
                    gpm-1.20.7 | 1 
               graphene-1.10.8 | 1 
            host-binutils-2.42 | 1 
       host-gcc-initial-15.1.0 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
          host-tipidee-0.0.5.1 | 1 
               host-vde2-2.3.3 | 1 
      input-event-daemon-0.1.3 | 1 
              lbreakout2-2.6.5 | 1 
                  ledmon-1.0.0 | 1 
      libabseil-cpp-20250127.0 | 1 
                libdnet-1.18.0 | 1 
                 libmbus-0.8.0 | 1 
                libnss-3.113.1 | 1 
                libressl-3.9.2 | 1 
               libsigrok-0.5.2 | 1 
                libsoup3-3.6.5 | 1 
           libzenoh-pico-1.2.1 | 1 
        linux-headers-5.15.187 | 1 
                   linux-tools | 1 
              mariadb-10.11.11 | 1 
             matchbox-lib-1.12 | 1 
               mongrel2-1.13.0 | 1 
            netstat-nat-1.4.10 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
                pipewire-1.2.7 | 1 
                     pound-4.8 | 1 
                  prboom-2.5.0 | 1 
procrank_linux-21c30ab4514a... | 1 
             python-webpy-0.62 | 1 
       riemann-c-client-1.10.5 | 1 
                s6-dns-2.4.0.0 | 1 
         s6-linux-init-1.1.2.1 | 1 
     s6-portable-utils-2.3.0.4 | 1 
          sane-airscan-0.99.33 | 1 
                   sdl2-2.32.8 | 1 
                setserial-2.17 | 1 
                 siproxd-0.8.3 | 1 
              skalibs-2.14.3.0 | 1 
                     unzip-6.0 | 1 
             util-linux-2.41.1 | 1 
        vulkan-headers-1.4.317 | 1 
              xlib_libXt-1.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/b18e084f4f6fc7bba691e2576c98e9349d56a02d |     
   s390x     |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/fd69635a38143e20c010656811c1c5232ac6256a |     
 powerpc64   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/042359a8de026421ae298a8cfa3589a9f6b19483 | ORPH
   sparc     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/2e38e9ba222c0645cdaf8b42248f282c07ddac09 | ORPH
   mips64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/666974c184d42f00ef1ff49633dae441f76af372 | ORPH
    arm      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/4502d539fc9bd37450f95a19c7f7fdf4375f577b | ORPH
  aarch64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/4ea65dc489c42e4d5fc77fe92ad834f2d317d712 |     
   sparc     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/3537d8bc0c8fe87785d6739d4ce9d4c9e6af833f |     
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c4be64c7016bc643d49d2d4e3a4b21539da20445 | ORPH
   mips64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/661d85813fae528affac02412f49cccbc8fd2233 |     
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d72c238dc066a54bf4682a75e05c4f17c1c66679 | ORPH
   armeb     | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/07e11bd44248d091f16b03869997b7374ab7b44e |     
   mips64    | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/013bb2948564975f4e6357bce09f1fdf9cdcb9d7 |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a3975a986e79589fa3819808e43e8306b09767b3 |     
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/310e399839f437455cf6f42c0a3fb6e7e56df6a8 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6f884df22e75fb6c0b5da43a66538143f81140e1 | ORPH
    arm      | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/4bd8b1159d8df5bb0e88944541478b8259e6ca5a | ORPH
  riscv64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/75b1ca9ca2b14f02ccc97c9d19422d67203f4af7 |     
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/1a691c831ce78f4836a8a8319638797dd4e076c3 |     
    m68k     |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/e92df7c399de67e24cbc8331273fdc5820978c92 |     
   armeb     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/f39e39cd2767bd4c525a7f673ef4eec19c58c3a2 |     
   s390x     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/02fb2ef1ff47e797a66332a1499fadee45ad85b3 | ORPH
   mips64    |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/d3a1961d02d327f218f7e49bee534ef32ec153e6 | ORPH
   s390x     |           git-2.50.1           | NOK | https://autobuild.buildroot.org/results/ad01eba3bff0618141e659671e32340c2eeee64a |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/e391a69b39145faf51dfe1a65e82c655ca86aabf |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/a053f7876d146f7671093bf98de4c032f35311e2 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5757f46fbec0918deb164ea82390604827d6996d | ORPH
   sh4aeb    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/03825bda4fc67e86be30de066ad3005342723005 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/c45721ece764e898f0b9d612b13d742aeb470e82 |     
   mipsel    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/ad54f14ed7798f4ee8da2ac0203bb0bb0482ed5f | ORPH
    mips     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/bdb62a99ae35a720debe9e06d684e2303236e49a | ORPH
  powerpc    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/cac993b7e4767460fc6af869164152915b2ec611 | ORPH
    mips     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/39e3134fbdadecab2f5b1b0f6f0877ef93511dde | ORPH
  mips64el   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/d36bad472988d36f8f33071496973f93ff320976 | ORPH
   armeb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/84b0b229e74c7538cb1a2ca80d1d2e6420de119f | ORPH
  mips64el   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/27f303db442c985a2602b43ddb0cdd4c2df1ea2c | ORPH
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/89d79a8e8363087ffb2ca05f039105f988e8f39f |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/de44c970a3587e323399b39cb1591de573fd78f6 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c958549a4989223c69806232fe2a0251c1fc1584 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/728196ba34856b704cab75f6e46b9cff3edb735d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/72ab79552c53a4713a8490432d786ff4fcfd5f40 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4428ba8a871a4b64f8b4d82cdd084c512cc39bfc |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/b353056b423f9dc3fc762f14aa9dd08445073a6d |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/93d10d04c0c88bf3ebbcb415999e0c00987a4e02 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/400f07dde1b9b78336f0351c5d508fedf44f7ca9 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/3ac092d2577e1936c3c19a24fcbcbcdddb9b0533 |     
   armeb     |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/2e8f69bcc1e24936bac583e0be438b17e02d52ee |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c5fabbeb93c36a985cc5ff77d2fa2c65983b2a99 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/78eb3d2f294fdd2141fc579febf0f569011a2b51 | ORPH
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/62d9df8434027e2eddff4986423954d8bb8ad7b3 | ORPH
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/4101505da4dd97048cbf3e69e7422be320479780 |     
    arm      |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/7bd512a7f50340769e1fd0b1349d47d1c5b56d0f |     
  riscv32    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/551ce4c9e6197b6dca8249c4636b1b5d20632c9c | ORPH
   s390x     |    input-event-daemon-0.1.3    | NOK | https://autobuild.buildroot.org/results/3637309ccd04202d01072c91fbafabb410612691 | ORPH
 aarch64_be  |        lbreakout2-2.6.5        | NOK | https://autobuild.buildroot.org/results/3b53d9b876f47db2291f851e7c25a340d4392c3e |     
   s390x     |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/04d1b8991750906a4e97bb0fb702b399e9c61adf |     
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/41c74893b7807cec1dfd89ec8a8d06df178439d9 |     
loongarch64  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/ded452731ee9bd5a15d2c2345f207c0bdc75b828 |     
 powerpc64   |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/24a20fd5191c8d0da20156e0bea21c1ea8ad6d5d |     
   s390x     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/2f9518fe38c4ff9b9e95c87dc3af67e8f4e910e6 |     
   x86_64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/6c095bc25317d71b78cd58f7b6a5601cba08d05b |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8344cd3b0865dcb68872dd68fc70fab8bdd3b8eb |     
   sparc     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5bc31b05eb5247fed7315d6228cf5611de351287 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a3ffe79c10e0003c8cdecb57b562400e0dc08dc0 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/41d16d5b32fa74f5a0138c198ac86924a835db4f |     
   sparc     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/3d178e6be19317ff5e1b36199d8c9e2d6840fa9d |     
    mips     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/7472be7e11925e913d58bfd6dee0e4de79c3d7fd | ORPH
   arceb     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/fc48a0fd7e36233cc8a197f01a56167ee2ce1fd4 |     
  riscv32    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/819c5c8ad74582054df464e836ac2ae5f13e4e50 |     
   xtensa    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/ffcab27e834516ff8becdfedf19e7dcbe0ac47cd |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/f9856925dd7c1165e1dad054f795ad3eed46ae9a |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/dcae59aaa017ff5d0071b60cc985b4a70303db4f |     
   armeb     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/cddf99fbc46ef56fc42305baf6000e5f7324effa | ORPH
    mips     |         libnss-3.113.1         | NOK | https://autobuild.buildroot.org/results/01c462aec0c0c415b632e37541f25a088df7aea6 |     
 powerpc64   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/f359bc5ed8b6b7a7c77d2e0cd4ebb334fe646126 | ORPH
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/60649dd973724438581df2fd2d24be36bb5e9876 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3d4dbb6ef4e64e932dfebe79dfb8415b1dc9bfea |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/dba3d153de84b8577cc1b0429c5690ee806a1220 |     
 aarch64_be  |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/cafd1837408260009d36a6b3f5c3e372fd04dea7 | ORPH
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1210a0d5311ee3d2e310cc501de8778ef23b190f |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ae4a6b4515872d75c9f3bc4dc7354d1964261bd7 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e2fd5475ec5caa5ed567d8203b494a0f79dd5e72 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f6afe28793d91bf0eb52061f30bca18aaa289976 |     
  mips64el   |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/8c1b282d87027258f4c18daec80bd7295fbbfd82 | ORPH
   s390x     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/cc3372cdad821b3943c376705b4ae58b8d27d669 |     
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/efc594239492d4a65f58d7c728db9fcfb4eaeef9 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/427c6e7efc4021340c829b980442d9708f388511 | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e1a95ea05717cf6011349bfbaf0bdce37ff4dbf5 | ORPH
   arceb     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/b2a39860b028d526a40df46bb927cf6c6b0765e9 |     
    i686     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/7b4be56f94b52e868d19827406b92fc31b09ba98 | ORPH
   xtensa    |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/d26c722a23c5315da6bcd6850074c4adf1c8636d | ORPH
loongarch64  |     linux-headers-5.15.187     | NOK | https://autobuild.buildroot.org/results/a0db5dace0915b1752393d1f971eb403b281286d | ORPH
  riscv32    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/ba397f765e8726915850438375699a9c5a218305 | ORPH
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/fffb20341cc190f65e378b0f1f63c18c10ecf951 |     
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ff570ccf9fc091a41dc61cfc73a85fb9efbeb869 |     
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a895e8147585f0b479cde2fd12b52e38dccbacbf |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/7d3b298e67edc3c8bce119c6dfabf6bb7712ccb3 |     
powerpc64le  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/5f1ae352a97b1fcdbdf2602b329185150282c04c | ORPH
 microblaze  |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/042f2b5b6fd01bd92adf9d80336dbc27e38e7835 | ORPH
 microblaze  |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/47f9712645e424b379e98a66c1c0acd16d019010 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/74b27802f4e886d7afe30f0aec37e96fec8b8871 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7f0cf0b82e6949efee275f414205c3f3701d477a |     
   mipsel    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/50386adfc8b2bd3ed23392547f3f5fb8ae2c099d |     
  sparc64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/05c60e2f75e9f1214e3b290be7a5ed4eb565c3b0 |     
 aarch64_be  |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/b23c48a26123004914d21f83142041df8e3615bc |     
  aarch64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/bd44bdc3e66458d9126a32eac64d586abee22250 |     
   sparc     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d383db760e9b60f3cfdba814f13f7260d4a8bed1 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/47254690af2a86ff17f8b9a5cf31a7c70368179d |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/98e2ba0fce5da7dec42deec9edcf3a2ac7c29450 |     
 powerpc64   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/c29b695ae20d4350d583956430b656949bf609c2 | ORPH
    arc      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/40a15a1361c7db957c3e221805c10f6c9811ab0b | ORPH
   armeb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/783579a2b3c694400fc6f36195b79f91a016d01f | ORPH
   mipsel    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/20d04584d825ac3c6b1d795fb851cde5eef46a9d | ORPH
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/52ac1034b697be4d4577be756e9411ed49b482f5 |     
 microblaze  |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/acf02edaaea21705430658fc349b2d1a3b5ec47d |     
   arceb     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/063c83ef9dbfcb2c21955c4958acb97e852f391b | ORPH
   sh4eb     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/e7d558b491daf06f3e3f20f73de513f9e4f6d9a7 | ORPH
   sparc     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/826dd60358d21ff353562009a145f99d8d4f49e2 | ORPH
microblazeel |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/fa0a3c0da3ef929833e7504a8125908028e2842e |     
microblazeel |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/611d81b345fea3678b848f1f2a204930991086e9 | ORPH
powerpc64le  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/1d13f4544fc8f92a1491293f935b3a4f520d92d6 |     
   s390x     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/ba26d107f1b3aba43c5ad65eb8aa03601c71491d |     
  aarch64    |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/b3f708a8927e12aa8db2ed30cd9d7d11efdee50d |     
  sparc64    |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/7c7479c7f2892900038c3c4b77a5952b19f8737c |     
    i586     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/e4de53373fe0b3629bb3075efebb4c1d5d0094ca |     
 microblaze  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/3218b0085f4911fd49ab4c4763af584978322174 |     
  powerpc    |          sdl2-2.32.8           | NOK | https://autobuild.buildroot.org/results/05272d298f3a1dbf1557e8fc1fcc7a82f2e34421 |     
   mipsel    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/df14f55e7cd3781394b1fec5f874e8efa144d086 | ORPH
 aarch64_be  |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/b97df0e66d6885967132d03d6f4173652f4bc71e |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/9535b52f228c787c2c08314802e7b2e32649587f |     
   sparc     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/d7d547ac822eb34906f22a26e67a520e8d9a7fe6 | ORPH
   x86_64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/a634f09ab6f4ac74a2eadcd5509ea81c5d389eb1 | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/8a2c762695e0879f38be79de2db6f745b9ea517e |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/641c5eb21570423260f335bae641c78bbe8c0196 |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/654ec55d7659d46e468a63b9a2225ad95eed59ab |     
   x86_64    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/ffd6aa6b4696dca319eee35e413b9f02a7aff288 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/8dc6d24a4a1cdf1e6c98bb922b1e286b8eed4334 | ORPH
 powerpc64   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/5111902d277bad4581203d75439c78968affc24b | ORPH
 powerpc64   |        xlib_libXt-1.3.0        | NOK | https://autobuild.buildroot.org/results/fffab5411b80290655e99ea82f0f92afd4084041 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

libdbi-drivers-0bfae6c43134... | 1 
                liboauth-1.0.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9d9855b881147c4e99ccfcbc4f4193ac024795b1 |     
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/f033ed91c911573fc1cb94b315b7aaa126835ab1 | ORPH
 aarch64_be  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/5cd3483752cd2cabae6e70d0d1bb83101af618d9 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/69dc71067fa8904d2efb0d57caa01b5753dc4f5c |     
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/1f625cae6ef430de785419344b2665cdd0d5e094 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

host-binutils-arc-2023.09-r... | 2 
               bctoolbox-4.4.8 | 1 
  gobject-introspection-1.82.0 | 1 
                 host-gdb-14.2 | 1 
          host-oniguruma-6.9.9 | 1 
               libsigrok-0.5.2 | 1 
                 netsnmp-5.9.4 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3fa9c43e56ee87be6be26021620aa932eb5cfcd8 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/17264679452459b54805610bfaaef28107516ad2 | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c85b0a0824485d79159abf78106df19a929d6c2f |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/052d28e583e24872da39ac46198ab24e55d1ad08 |     
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ff3aaf9ca499f4876b326ccfa8ad788a5bfb64ef | ORPH
  mips64el   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/366c6cc9ad934b1675ba8a5bc9451930de25e357 |     
microblazeel |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/3f82ac300c5d0f8a2674a32c5b9651083fcabae8 | ORPH
 aarch64_be  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/fc37417bdc894a8fa95cfb8360e54eca921acc80 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/14360ff1d22d9818f42b0ab0515e729ec1b0902a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B41C83F34
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 03:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17600817FD;
	Sun, 20 Jul 2025 03:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUCHnZ76bRwS; Sun, 20 Jul 2025 03:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BF4081770
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF4081770;
	Sun, 20 Jul 2025 03:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30FBA1F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 03:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE6C41DD2
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 03:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBQXAHjsr9o5 for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 03:14:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CF9841DA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF9841DA8
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CF9841DA8
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 03:14:10 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-60c6fea6742so7027341a12.1
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 20:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752981248; x=1753586048;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1+VduFIy3bfvUB8AzjEyKdSwRxvkpQ8zxhLzsxpgQWo=;
 b=R3SVXHm++2EYw6M6gX1iN1by6X+GwdCZ1q7iVhfm1qVFV46Iwwcn3kF+3MKLTH/1/S
 SIcAjnJ7P9bpRc8uorcwn7CcxzUiijXHg8damXpTByChMGCJLJzQRyAQuSv05ZDYu3cu
 q7UmtZ8mrb30Dx9z/8Cc8Rk6yW8y2mvAPUayRIz2NlediURqyXzzryxxGFk8IFKba1x6
 2XlU5XxSjok3EYIDCAeSYhYIqR9a2oWLJmzaePO6619LVYwa4EXcvGbukhpeeRuWYDIE
 MjLN6RcvEBKYw+7xd74lcfVIzLfML0A3eXjSPRAz660KCB1To2Mz4v+RyYTjSjU9dVXh
 B5Vw==
X-Gm-Message-State: AOJu0Yz9SEyHfpkIQ4u6OVR9Ad62C1/0mnaqZn161ehJPqRgxVALqR7n
 z2M6sAg+mKWD2ZdqwJFA8+Pro0mIZ1TwqxsQBacE1K0BbdTesV8VfvcpUND9xQ==
X-Gm-Gg: ASbGncsjgE3TOsJfq9IYohXYLpeN0i2CqmfBxOsj57zQDSXS8w0fNCSlntzxT0Ewb7S
 VAD347z15WyPhYJorUHJ3g5NTXoTsP7L+MQ7oMw6JHCsWUL4JwhVhXEo5PJA25FkvuADb1wGb0O
 YiS5hCQ7lukBALfumPCejPa2r1lrex4yY6m/RgZ3J2wQ+sG24zauFKYkdqYNAhnpA1PS/SehEOy
 fxdMbJqC+AwBiOpz3TaIeqeevVpHzr4pWOu1Fkv5VHNXlo4wVu1yoTndISCdIkV3X0K27Y/SMq0
 8ao5pvvZIJ2/sPDd3VZ1QeGysZyEO7EO7FJNqKe9S8ORI0lftLxeV8KlOaswKHOZY136RjW596F
 IhqZwdnCj0jnkyNkf1Zp4FylpWw==
X-Google-Smtp-Source: AGHT+IFuh8eigkK+SH92em+e4D7PLXW4gSH51OIN48DALXEIMlbybKBBTd3W0ND0Fvx/waH4iBESfA==
X-Received: by 2002:a17:907:9406:b0:ae6:ae75:4ff6 with SMTP id
 a640c23a62f3a-aec6a66c837mr654595866b.52.1752981247946; 
 Sat, 19 Jul 2025 20:14:07 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7d55c1sm412566566b.41.2025.07.19.20.14.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 20:14:07 -0700 (PDT)
Message-ID: <687c5eff.170a0220.1139ca.9525@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 20 Jul 2025 03:14:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752981248; x=1753586048; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1+VduFIy3bfvUB8AzjEyKdSwRxvkpQ8zxhLzsxpgQWo=;
 b=hHOnCw2YDNPEVhkwtuTV35ROgsHfbli2M70XnCSikIeprIRQIXrkVDCc4ofONnmKVm
 jYB8FzGlUp0Rhygv9aE8/IYECz0KduPXFVNJwN9xKoU1gVqI4bjAeofP5WTREStLOcm1
 pi3FzbnK9iMJlWB0/UXZiKkwWkVUUDMFJU1Ifx3pt9SETBzk2i1f66QXwZ1Ic8lH2+8u
 mXNconBRosCzlvgQt/9b+zQMK05+siayUAJps49PtapG3KS3Ni65eDaFuNpV7V60gZ4I
 KazIFKoFsXSHiPr8CHfHsubcyKe/OyN0EPBVX/fM8Twb3791bQPKoqUIB5L5EQ+jRFym
 3+pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hHOnCw2Y
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-19
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

Autobuild statistics for 2025-07-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  7  |  0  | 11  |
  2025.05.x  |  3  |  7  |  0  | 10  |
    master   | 26  | 119 |  0  | 145 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.37 | 5 
                   cvs-1.12.13 | 4 
        liblog4c-localtime-1.0 | 4 
libsvgtiny-ea9d99fc8b231c22... | 4 
                       unknown | 4 
               bctoolbox-4.4.8 | 3 
  gobject-introspection-1.84.0 | 3 
                    gpm-1.20.7 | 3 
        host-berkeleydb-5.3.28 | 3 
host-binutils-arc-2023.09-r... | 3 
         host-gcc-final-14.3.0 | 3 
       host-gcc-initial-14.3.0 | 3 
                 libmbus-0.8.0 | 3 
              libselinux-3.8.1 | 3 
                    mpir-3.0.0 | 3 
          aardvark-dns-v1.15.0 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
              host-guile-3.0.9 | 2 
                 libcddb-1.3.2 | 2 
libdbi-drivers-0bfae6c43134... | 2 
              libopenssl-3.5.1 | 2 
                libsepol-3.8.1 | 2 
                  libsvg-0.1.4 | 2 
            netstat-nat-1.4.10 | 2 
                openssh-10.0p1 | 2 
                openswan-3.0.0 | 2 
                setserial-2.17 | 2 
               asterisk-22.3.0 | 1 
                   atop-2.11.0 | 1 
                   avrdude-8.0 | 1 
             batman-adv-2024.4 | 1 
                     bc-1.07.1 | 1 
             berkeleydb-5.3.28 | 1 
                 coreutils-9.5 | 1 
             dahdi-linux-3.3.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
            ecryptfs-utils-111 | 1 
             erofs-utils-1.8.5 | 1 
                 expect-5.45.4 | 1 
                    fcft-3.1.8 | 1 
                    ficl-4.1.0 | 1 
flashbench-2e30b1968a661474... | 1 
              fluent-bit-4.0.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
host-am335x-pru-package-5f3... | 1 
          host-binutils-2.43.1 | 1 
               host-gawk-5.3.1 | 1 
       host-gcc-initial-13.4.0 | 1 
                 host-gdb-15.2 | 1 
                host-m4-1.4.20 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-rust-1.86.0 | 1 
                  iozone-3.506 | 1 
                  janet-1.35.2 | 1 
                 libbson-1.9.5 | 1 
                 libgee-0.20.6 | 1 
                libglvnd-1.4.0 | 1 
                  libjwt-3.2.0 | 1 
                liboauth-1.0.3 | 1 
                 libspdm-3.5.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
         linux-headers-5.4.295 | 1 
                 logsurfer-1.8 | 1 
               lrzsz-0.12.21rc | 1 
        ltp-testsuite-20250530 | 1 
       python-dbus-fast-2.44.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 siproxd-0.8.3 | 1 
       sp-oops-extract-0.0.7-1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/bd6e70d0a490bf5a1a83f927b2cce554559ef09d | ORPH
    arm      |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/80239cb3b304da150f4c060b001193ce890ce176 | ORPH
 aarch64_be  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/7f8575bac162c9fc4d8c9286360b3bbec7850ffa |     
 powerpc64   |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/440273ff358e45092e337f22a629c86a0f4db289 |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6c0f40c75378f7a403909ada5d1815599eb441ff |     
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e30b621f4feafb6a5395d5c870c513699201ae55 | ORPH
powerpc64le  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/1caae34d024628d64f5d6dc499e2e0356ee6f6b0 | ORPH
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/f433ceb926916ec98c19053d6b61290846c3e8a3 | ORPH
powerpc64le  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/44d930173d8556da747d2cade5c5686f84a1441e | ORPH
    mips     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/fa1ddc6cb13b6e550e1e2f91c44fe25bb5be7383 | ORPH
    mips     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/1174d970dbdb93be35de2a445cc531a901889cd6 |     
   sh4eb     |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/271699f6107392da23df7df6e473591f7f2f9b34 | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0b95e1b1a10d57879dd6ed6e0609960dd1d39db6 | ORPH
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9f1f9dd56a63755851f1a794a9dd6a7dbbaeaa73 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2b59ca6362026fbd312f2856a39a1a2105c82e5a | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/e871527229257d39b4758a1135debca14728d605 | ORPH
  mips64el   |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/07032b3c6c46176828de1b1ba8ce94b2f301bed8 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/56af31317db9248f4dc949189f0484cb19c4e371 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bbf389ba8e407c01d276b67fb71b2a855c07530c | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b64ef8139b0ac2b4a0f5762451ff0429edec4ef9 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7360b52999a8d5dc66a3d74c194f0d96c469e37f | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/cbe36474e1ab6348388daac7fc13c050f02a17e9 | ORPH
  mips64el   | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/459e73d40577dde7a857f4b55622b28d1f1e610d | ORPH
   mipsel    |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/6e1e23ec4f63095b7c74d59bb390263dacfe829d |     
   xtensa    |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/fc93c3037534f18efba3587ca11328945649a289 |     
    m68k     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/ca45669063471b3480980ec0f1e12d9cc5d764c4 | ORPH
 powerpc64   |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/4ba92a5d59a583f2923b3ac1fcf05d855dba9c2b |     
    arm      |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/b49262da869406567c96caba69e18cae9b635716 |     
 aarch64_be  | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/ed7090a493447c6fd8c3b1707d688137d55756b1 | ORPH
    or1k     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/ba7f216491d4260392dfd1ab141ec63c932a32c0 |     
   sh4aeb    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b520e83c2edd5d57cd83fee66fd88e8c874894bd | ORPH
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/6c8b2e68505bb092ac7de77f5f477220eedcee81 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/4cf1ca51b64192d08fde80e59464f5fce60887a8 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/10b62341004f1331f4f73a40ee2d94f8c067962b | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/75c9f6c0bdd3fe50d4827f7e938830468134957f | ORPH
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0383f0af19c7b53c292fc2ad526f51d855590520 | ORPH
  powerpc    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/5d691a96077dea5e9e8e37d277a4db85e3440620 |     
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/b42bbaaaf310e89129d19a92b20f3bbff23c90bf |     
  powerpc    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/43075ff8144f3950b1711e7ff4f0b4918b793008 |     
    arm      |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/0d24d19986831519499992f43c2dc4e3836be3c7 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f59d11216f3967d0d469146ea17539c7aadcb4cc |     
   xtensa    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/952e1daf008e915193dcce9240e899807b94ac28 | ORPH
powerpc64le  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/7edccec8ad0eb2faa6d077de45855a818a0a40dd | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/9aa32dff27ff8a186226105a298a941f2227bba5 | ORPH
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9828ffb2c43f2734c0a94c05f0b4f7b27dec7e9a |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/827d5d20f710279818dfe65dcf6263e6d70c7350 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/32d8bdd4a21cf8bfa981880e55083b0b0f545432 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/286e876b0955d82959ca61132a5081fce3bf4d71 |     
   mipsel    |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/00dde0e4794750cb4954647e19690eaa28884379 | ORPH
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/e401c203e5f3a49994b362878a3b0f9731bfb4f2 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/3afd1deb12ad9d5087d35305864cb9cdf4200d01 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/7232846da54d6997b87bbe58b5c61da892a8ed34 |     
loongarch64  |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/18b7555b360f8fcaf9c522f00e58af2ce30e8b56 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/5380e0e110edf242af3b085c08e84273f4fb5438 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/ea33fbed85052f33cc2c62e6c89f929efcd93c8b |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/1e87fe50fb33b96d1917feb19e96c1110b76ffd1 |     
   x86_64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6164b7311f5c6d034ec3c84140535b49cc5fb44a | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/a1ffdc716e6be016be8b7deba45abbd5ff2cd663 |     
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3969972ba310fd55e6e1958197047923935a7a51 |     
    mips     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/bfd47586d024f4ad23b936a981e2374b75c862f4 | ORPH
  riscv64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/f6faf8195dfa396750e04795b4556c0f99a52944 |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/d5513c6e4dcf4badf627a083fc62d4776da58e5e |     
  aarch64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/6e9bd82b54919523607bc8890594cdca7bbb13ba |     
powerpc64le  |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/6f5a1d5cb71d61514903a60f26a8fceff74aa841 |     
   mipsel    |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/da3c8753eb431c5c7bfd180e2d1e38f51e4e18d5 |     
   mips64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/778caa36e7d026ce0b50acf955b2ab865dcd737f |     
powerpc64le  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/6539f742bb22ecb0132e75fd8662c11fe77140a3 |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/802d4e8b3cb364d8a5452ceee015b07d06ddf0b7 |     
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/480ddd6e01242a8522435ab3ce1c4cdd955b6df2 |     
  powerpc    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/f371270aecd3d22892b44d0280704e4e4ecb4fa6 |     
 microblaze  |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/1f644a5df00800b06a2ba3206806f122187247d9 | ORPH
    mips     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/2a95a4313367f82a02754bb242166d511d360e44 |     
    arc      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/8f5b8f571e65b8dcc93447a9238016d53c51967f |     
  mips64el   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/70456c3502ca0dce4f895027cb679fc48a998eac |     
  riscv32    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/04f03fefc6ff005afc1098f77bc1d495ec5dca18 |     
    i586     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/0abf335fa2bf2257ce5c36a0b6c28b55d0b0416d |     
   sh4aeb    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/53871c9ac3f3ecd1bfa99e7aa6e7497bb73e826c | ORPH
  sparc64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/9c275fba791b5c53c703acbd319ac1b43c106616 | ORPH
   armeb     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/fd8f356755444ce91237b1ce34f021902e0dd9f8 | ORPH
  powerpc    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/6375fa34a6222cfc9b113a744dc49a4f5374a077 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/48a3b48041514744698af8ca367cdc0ac6f711d6 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/4b3e99144b8c784d0fedb3a60f904eaabbc829d0 | ORPH
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d627853e6a9f7812fb3ceb813197670fc6560dce |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0cc86def0eee2df97e574cbdac0323ae6b74e806 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/06764351c248705c2693c98db3c899347afdd92d |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/2875c24e49f6c3f93ab17c832264b877d38be607 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/cea15efdf6c88e5a53353411191e79ed0d8c90f4 |     
    i686     |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/c140ddf0bd5322005f27c324a7967a581eb5e993 |     
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/279f37e37a0bfcfe3c9e1f24c71460835fb90dd0 |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/60383fc39290173258caea983513539c0ff42901 |     
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/32eb19d24bcf02a0eed7927703e38e3965675600 | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/ef9dceb0b0450f449d06b70bc0c7595493eb6ee9 | ORPH
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/843fe0cca30793ddcf454fe87e0232b1fbffb2af | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/3c63ecd6fd90a0f72e01be83d7765fc6bafb9785 | ORPH
   arceb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/7024aec9b9c26851bf1052fa28c755ab1f8274af | ORPH
loongarch64  |     linux-headers-5.4.295      | NOK | https://autobuild.buildroot.org/results/51a827d5c45a3b8e216f8f7d5984c1bdd55ea382 | ORPH
   xtensa    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/035288653d87d9055df070d24e749ef603483449 |     
    or1k     |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/5c81c067b58ae52ef5b83f33cde1927261671f75 | ORPH
 microblaze  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/856365f467efc449faee1951250e63d8d4442bbc |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d07768ee0335b37e875b6f1b5ef5c4595639e150 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0eef233bfcb4c472504034a4d8ad2b1e0f812f40 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a15e15d99e91588d411bde4a04d8e26af3d06960 |     
  mips64el   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/8fb52aedd2e49a8b187ee88179cb72781426d2aa | ORPH
 aarch64_be  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/273fc0c6f8b9c1d1dfa1266722cc6454cfba272f | ORPH
  sparc64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/5de1352b67d35e5e7f951fa8ff65412ec171b021 | ORPH
   sh4eb     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/b05a44067a9995817b2dd2f21015942c2a5c0689 | ORPH
    sh4a     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/f7eec9059b57c0f10f17ec4a5ddeca92ef1f404c | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/d55eb237d6f10c6177fed65a1f51074c2c718c3b | ORPH
   mipsel    |    python-dbus-fast-2.44.1     | NOK | https://autobuild.buildroot.org/results/46879b4f1c9e53d1415335a730cd8a97c4a4cdb4 |     
  sparc64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/30ad3aeb4d7d0c00baa00310bbd4de87892b2ead |     
   armeb     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/68657e65b212730c2d53ace7df49a0a8517ffc8f | ORPH
    arm      |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/2f98ebefc309fce42d437c87c9965fb13098a819 | ORPH
    or1k     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/e9536f313cdda374d56029241aa23442fc12b5e4 |     
 microblaze  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/5b6d35ed620fae93599452abacdfaca8277c7630 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/ed99652ffc04e1e37c506c5269e70ce5d7455f62 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/635316956748e6cbf5c2a8c07f0840f68bbda7d0 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/af070e3d95eb9d6e20f86d85bcd9b5116f5f4dae |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/e38663903c1f0fe455f7d1bb202c81878fc8d8f0 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/fdc12d0e4b7eb8418336f809e894e4869de8945c |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 3 
                 logsurfer-1.8 | 1 
           oath-toolkit-2.6.12 | 1 
                openntpd-6.8p1 | 1 
                 protobuf-29.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ed906670ab7b901d95289b388262d9eded8b2c18 |     
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/948a75edfda6e4aa82bd412a7065bdcc6cf97955 |     
 aarch64_be  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/75f66a4013743cec115e33ca7733c0dca4d44dba | ORPH
    m68k     |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/f3e37dee58ebecf3805413c045ff3b63bcb49d32 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/0b1982ceaf61a7cbb35d9cb6d8ea8adef44abe72 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/bb5c3c4e3c5171619babb89f7613e91472b002bb |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/b9dfd00297792f6ae46a9e69ad0f7265e9ca2b71 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   avrdude-8.0 | 1 
 docker-credential-gcr-v2.1.26 | 1 
                 libspdm-3.5.0 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
     linux-5.10.162-cip24-rt10 | 1 
                openssh-10.0p1 | 1 
                pipewire-1.2.7 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/dca732397c187cecb25f9b624d1863b732d30b67 |     
   x86_64    | docker-credential-gcr-v2.1.26  | NOK | https://autobuild.buildroot.org/results/af05803b1e6ef9f8583da05cccfb43583630f189 | ORPH
 aarch64_be  |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/38c694d103209cc889aef24be1b1efc4974c26e9 |     
 aarch64_be  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/703eb95d3adaea83db4aa530fb31ce39013f4d74 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a6707d8463e2e7dc876710b6df1e00017cc6fc28 | ORPH
   armeb     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/b995a29ac306fb2f2e84b12159c89633e08840ca | ORPH
    mips     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/9bb105aad49d6f85da9e1a4c48ec131d464cb46d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

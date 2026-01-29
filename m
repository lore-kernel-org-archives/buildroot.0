Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2661DD358C3
	for <buildroot@archiver.kernel.org>; Thu, 29 Jan 2026 06:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D1C40A83;
	Thu, 29 Jan 2026 06:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CS9XQHWnnoAO; Thu, 29 Jan 2026 06:18:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C1E140B09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769667511;
	bh=amjZI7FMH9bNhk37HeMPO7h3JXDDa1XE7jGhgrI29r8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q5TIGRoWtlZylloluqpD3GMtIr2QDIvh5iQvnf8K8xsYisdWc3gxka1dJGycDWVS2
	 Bd6xwHPcxlV1vskMK1PPRU8dNpxgUJ06JDvcr4+R11fYpdVeXFlXaHej3R/n+6FLBa
	 Go+sJaaPvUbbhEbwG+xmvXlVELZThDRE1GrcG/Hadwb4DAiHFBrwOy089PSLJM8ual
	 Be+/qn0vassVXhWDplEOv2785FJY4geyZtVf0qLXgP0FQZ8mFMhhPOGO/G8JRXP36M
	 kOSspV6U5rF3ZFaTwLVPAnkU427uIbqLsKtSsQwaOmiTCdMlhoUt30G8ZgU4762Y8H
	 wW2UIFbM1QO4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C1E140B09;
	Thu, 29 Jan 2026 06:18:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A9B71AD
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 06:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0683C6083A
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 06:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2a-Uq0tJEnJ for <buildroot@buildroot.org>;
 Thu, 29 Jan 2026 06:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 833BB60816
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 833BB60816
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 833BB60816
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 06:18:28 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-59b7c2614f7so539649e87.3
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 22:18:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769667506; x=1770272306;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jo1avCkc4i4RNoAWwb3fv31Hh+P9B1pmOhEdEl5GYNU=;
 b=knLeAZx8yZkcc0RxQiH2N91Q9S3G0lsibwHiaJt8DfnShw+Bb6+uq2CCknNpPsaC+A
 rcTt/4MgdZ7FSlKXMhCTxRX4APcEukD/GqmY5bCy9INLI40ZjpGEbdLTJ1EZ50oMI8cn
 8hWV6rP8kx6HvYtwCuv+poNkPkV+IVMZMOQoTG8TZZxP+yGMd04D22IWRxSxV2nJUPYz
 9qluDfcFVf6//nzu4etS2qLc01W5MItQ44NODSX19SpScnfxDJxhp8Oln7z/xGgtfTPN
 /73ETrHbGAJg/DA2Sxc35jej73PbLxqbVhedy8/pJvH3C943aZjMhNi4SlrwRCgL9fS+
 JPaQ==
X-Gm-Message-State: AOJu0YwvjxPp9k5ux6T0Oxvpv/BZ4oJBntWF9KBa9+TYWvJz+kFEnrGO
 AT+2zrythMjNpYSIwk2GL9NyrgewZ+t1EQxYMXxeD73QFG5Z1VBrH9eOGM6s7Q==
X-Gm-Gg: AZuq6aLBlCUnmsktZTBwB7lcsSPpMmdIwsCsQK7zq4WGtD5x5MOha/MQXQdnBGA6lME
 GngGMssYc2pwZuez1ZAa1jgobYR2thoXo4G31rt7iLkzGXW3MUvuHKQfjGqj4UIeEImPD/6MQW4
 6FgShMZStV7+9dLuv8g74m+Hn8+f0/39bNGIQLqHOLetaOmoAWohgVUeAJO+CbpfZ7N6cBOGrQR
 LID1nEccHHsIf75X7Pe7w72aHsV74FFeG7MQvigcvgCSFhzm0e9I6YH/ObwE0udfQY7/7Xb8lnc
 oXtXAL+5utJ0EiZs5lUD1RjZhtwBXzhZG5lsVLS6o9jY7uJ58gfjwAdUbLu2taovsaVIW/LTAgw
 V7fCV7l3lubdHB2TMpp76yZRo3wvaOwMCzLljiz7OrYfQtjv7arj9aJWsyXxKVPrtJx0g82xi0m
 WnFpZ/kfMXJhCJZZFK6w==
X-Received: by 2002:a5d:588f:0:b0:42f:bbc6:edaf with SMTP id
 ffacd0b85a97d-435dd0baf9fmr10214135f8f.37.1769660290945; 
 Wed, 28 Jan 2026 20:18:10 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4762sm11117125f8f.6.2026.01.28.20.18.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 20:18:10 -0800 (PST)
Message-ID: <697adf82.df0a0220.2be596.b23c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 29 Jan 2026 04:18:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769667506; x=1770272306; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jo1avCkc4i4RNoAWwb3fv31Hh+P9B1pmOhEdEl5GYNU=;
 b=ipJhSLD5zj2eFNCNa7dFo7sE5IUytO31QwSRJ+OVSPErV7TyoQfV+xTikY6Zt6aMJo
 J7AhTNq6K0pqIdD22IWTqtsgTpGEjMJZJUWUho9YczXIYeAVwYIEqvzgz+x1ZQbAVxIO
 UuWgDNAimG5eSrL11z/rSimOF/Rcqg4ijiJ5do2QuhvUpzfX1+IrEqVEo8r+QEjzxjl6
 NgEXzq8Kwh2Ph+cUVWDwwGaG7pIk2zoHCssYtpbf1jq39EfKS+iyjSvdJll8HiZDefut
 Ajr8Tep70ngf4AFnRPHz3D82GWObz7kf/+ClolqMNx39UyrZz2z8qJaRgb21Jm0zjpgx
 pQRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ipJhSLD5
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-28
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

Autobuild statistics for 2026-01-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 12  |  0  | 15  |
  2025.11.x  |  1  |  3  |  0  |  4  |
    master   | 22  | 62  |  0  | 84  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
                   dash-0.5.13 | 4 
                 jasper-2.0.33 | 3 
                 c-icap-0.5.10 | 2 
             dahdi-linux-3.3.0 | 2 
                  kexec-2.0.32 | 2 
              libopenssl-3.6.0 | 2 
                netdata-1.37.1 | 2 
                openobex-1.7.2 | 2 
                   perl-5.42.0 | 2 
                 aichat-0.30.0 | 1 
amazon-ecr-credential-helpe... | 1 
                 apache-2.4.66 | 1 
             berkeleydb-5.3.28 | 1 
                busybox-1.37.0 | 1 
                    dpdk-25.11 | 1 
              e2fsprogs-1.47.3 | 1 
        edk2-edk2-stable202508 | 1 
firmware-utils-c42a3bc53da8... | 1 
             fontconfig-2.17.1 | 1 
  gobject-introspection-1.84.0 | 1 
                   guile-3.0.9 | 1 
              host-bison-3.8.2 | 1 
                 host-gdb-14.2 | 1 
    host-mender-artifact-4.2.0 | 1 
                  hostapd-2.11 | 1 
                  hwloc-2.12.2 | 1 
                  iozone-3.508 | 1 
                  janet-1.40.1 | 1 
                 libbsd-0.12.2 | 1 
     libphidget-2.1.9.20190409 | 1 
          linux-5.10.246-cip66 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
                  linuxptp-4.4 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
                    mpir-3.0.0 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                openssh-10.2p1 | 1 
             parsec-tool-0.7.0 | 1 
           python-bcrypt-5.0.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                systemd-257.10 | 1 
           uboot-tools-2025.10 | 1 
uclibc-ng-test-132c6134d691... | 1 
             util-linux-2.41.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/e83f2c03b33900cf7854dfe346fc6595e00adb87 |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/e28a57128d5b467b15551c3d1cb33332307d33a6 | ORPH
loongarch64  |         apache-2.4.66          | NOK | https://autobuild.buildroot.org/results/517b3da394c5fa9e0344ded96a8887c9dd2f6c93 |     
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/bda9f904eeb5a4263a89c72b928daff33192c22e | ORPH
loongarch64  |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/2a9b0885d69da2a40c63417d043a7dfc2ceac98f | ORPH
    or1k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/5976f98da1833476156a3e772ca5c741a788f417 | ORPH
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/109dda6ed223b9ab7c106c25bd6030c0cf0efaaa | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4c5dbcaada92b5e798be6af0fac99d3948d06414 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b87d21d25a02b3091aafc9f2b2eb36935ca3885d | ORPH
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/01d57769d8cd4f272274fd79c1e8681fd6ced919 |     
   x86_64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f10920fedaac9d2cad39e6894244ba2dce7c5e90 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/d692148efec02a46e391afcf67002ac3573347d9 |     
  mips64el   |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/a9d994aaaada8536ba81b5d9f42b8473cbba14b6 |     
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/cf24a0ac0e19869a72e0dc55df15dbae7b7ca460 |     
 microblaze  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/ff76b3d9f600d301e6644dba8470813464b9031a | ORPH
    i686     |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/6a38f561c89d0bb6d02f49d0f4440496e7439b68 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/8c7ad52f619662295e76251f39e23d0a0a2a02ab |     
  powerpc    |       fontconfig-2.17.1        | NOK | https://autobuild.buildroot.org/results/0ba71fb864d0ba2795eefc8216e16592446e4d4b | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d8242103cfadc21b24731dfff16873fe535d713f | ORPH
  sparc64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/53b18536da5d355914620c296f22e9c006b327b9 |     
   sh4aeb    |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/775edfbfed1fed5379bb21d39eca4c22599f687c | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/17410b5bb17398f9c966771c66cebd7ac285ce36 | ORPH
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/3f2c309199d01e65b464304bd42a25334c70b652 |     
loongarch64  |          hostapd-2.11          | NOK | https://autobuild.buildroot.org/results/4294e468441fa4221503fd0ccfea056c6a3a1f71 |     
   x86_64    |          hwloc-2.12.2          | NOK | https://autobuild.buildroot.org/results/4556766fc7f8770857f6dbc808c08bf4e6cfe3f1 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/535d2e42e20df3e69e484239ea26f75f730bb0bd |     
   xtensa    |          janet-1.40.1          | NOK | https://autobuild.buildroot.org/results/bb7d703e540b239de76149c87c2383854511a524 |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/04864c14480a83b2fbf22f060da8cdeb68f95a02 |     
powerpc64le  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/a4ca87d2e27246be2a867acc9167a938532b886d |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/391a5f289520078ed626b10d935a51702fbc1461 |     
  riscv32    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/2df73697757a7d011a927a27facf617d51a82fb4 |     
  riscv32    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/732c595d4ba31d75cd084220d1af6081491d46da |     
    arm      |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/384022450a09b7d731e3817c812e30e15187344b | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/0d77fd3a2e7edb5dbdbb5b91fc2d0578ff2a964c | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/616c38608e35216de0d8221016d6df5c8cd0cd64 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d37f7aa7cafb40a6fe9e0b97aa9c0e777161aacd |     
   sparc     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/3b180ffae99750742a9e842446ff6e1b91064d62 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d02fce9b43cc2dd2b7ce8d005e4bf31c1482872b | ORPH
   xtensa    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/691dd4b86d592db4b209fe29f83b0b9adda8da4f | ORPH
 aarch64_be  |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/c2d7f705f933dca20ddbfa6490a3db939e14c602 |     
  aarch64    |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/910e7f192cf4fa8a63c1fd651c7f9f76f7f2f017 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a5dc6e860be2306552a3f366770446f127b4bb3a |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/ae968bbc5740e3a99cd81d1bdd5b46b017b8c5ac |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/288f17e961af98283c9bca7c3640daa6cf22f2df |     
    or1k     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/96dfb62bb61680e97ddcb9920f7d79ccbb9b2f43 |     
  sparc64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/37450144222992fa6435fef26d7d98055f549b29 | ORPH
 microblaze  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/d2c02e076c72efc8d42eccdfc58912c71b60482f | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/1a3b0754f03c44261b5f1d4ebad41fdc5b3c9353 | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/a7435ac82751f3f3d3a1b3f201f4dbebf72ef755 |     
  powerpc    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/b50e1d11be22dc39cf7ffcc7ec7d37bd47cb1fc5 |     
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/90057af04079087680426e176de3191024cb9b43 |     
    i686     |      python-bcrypt-5.0.0       | NOK | https://autobuild.buildroot.org/results/11b10ad228a7dfc47d6ab15d2171681aef8b2b10 |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f9d0c92b2436a0d7dacd116d102f6c7e43c2316c |     
   s390x     |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/d773ee46c37ca76649b8b4a4a4031c7c6ccdb0f4 |     
 microblaze  |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/cebaec157e2bffcf0bd35e1b4cc8c167b76c1415 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/8ff1d7d26131e6648839842c7ab6f0afc3232fe1 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e6845f35ceff9037530023b95ee0cfff4e008ba9 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/85dbd66dad9db360dd77322dc7661c24e813cbf5 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/3a594998ce833dfdabdf386820d35b07a27d3e53 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9794430f054f1c4a2caa88c7ead369e2b9d9e32c |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/e097ee5b11d3584558b0926afc9256929eb070c9 |     
  aarch64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/e07e3bb992c15cec6e04c6ac527940e9b7cecc04 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
                  iozone-3.508 | 1 
                  jack2-1.9.22 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/cd6c0debd70ffac57c5a8f1791a950710087d764 | ORPH
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/4af2312dec3871bcbdb7df4d219145767759c0a5 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/c4174179267208a3a28be316164d8404fd27b27b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 2 
              libsodium-1.0.18 | 2 
android-tools-4.2.2+git2013... | 1 
                    brltty-6.6 | 1 
                    fcft-3.1.8 | 1 
            igd2-for-linux-2.2 | 1 
                netdata-1.37.1 | 1 
           oath-toolkit-2.6.12 | 1 
                   perl-5.40.3 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/05cb54da0d8077751cb6afca17860590f23bc2c9 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/8fd257d66b3395552021af55d04fca1250502955 |     
    mips     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/afe45a87cf66696074adf2077081f1b59e466092 | ORPH
    arc      |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/6630874aed45a050563739bb92319766f8575f23 |     
  riscv64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/3e364f7173a8aaae9eb9c432ea59d393014a4a60 |     
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/d86c60c36b1c49931d440a9fc9ca93dc87f13b06 |     
   mips64    |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/dc965f677c5262a9d1722844db083c6a4fd535f8 |     
    or1k     |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/62a22f0b1b871f1cf43e8cf8b988c26ab148121f |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/7ad087b6a97d1791a39b4d1f91d2fb791f3a77c4 |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/7b17e6e37161fd6b9ff1ba8f5897480314c3018d |     
  mips64el   |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/00b7a89cd1cc82c61d60105e8b1756b0f8af6899 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/860ec7e3f7709f68f99c8287b8b57c61b54fbaef |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

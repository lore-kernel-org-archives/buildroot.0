Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2673EE57D3
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 06:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E07140653;
	Wed, 31 Dec 2025 06:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PV5LyEJkBEvy; Wed, 31 Dec 2025 06:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5B63405FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767161120;
	bh=E5bfgCDn+q8JyqfBtJfY60DF0D7n2Iuwl1jwsAphjaU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RW7VkahC23WXXfh6MqnpE2XYrIfq8kru7q+2GY0+o6Ay6I/7sXb1eoS+sa/5ZCpxE
	 9w3GIKC2oy5a+mNAfvumlMG5OYDhS9eInlvdZ/u/IpBe/IYBGklBmAgQkPl82sxHZt
	 hO3fQ2yZmNjItnO9ZMIeS2/+ge3rwVdXVpBOrZ3uM35uOzCTF5WEzXGA80ohFmJUBR
	 PB+HW5d2gZAv17lnkhddgDs49jPZHf6ee/ziDN/IRxe1PGkNCc0thkoB++q3HifBJg
	 hzFb/OE64j9zxX5r+D1yR6fqfHeMc0HwwcuoUKORQOWnWsbjsG4C5s5FjfUmLgvJzd
	 j8Mm1b6U8oAwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5B63405FA;
	Wed, 31 Dec 2025 06:05:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59357177
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 06:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5588460885
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 06:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ytMtAjaCB7y for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 06:05:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1248F60868
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1248F60868
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1248F60868
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 06:05:15 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5957d7e0bf3so10237650e87.0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767161113; x=1767765913;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=97MERE3EF8DI+I5sHNuMS79HGFzbQ9koY+NWDyHVBF4=;
 b=lL0b4tZnhNGSTidLdyExKb/icZB5s1H+Sl38d9JZ3JOJriALl1RrvLJ9sFbYxFGy0F
 /ZUxAkWYVcbo6qJXVnxVg7kmoHbEECYLpajtKDBBomSWxKTWFPupXQ7KyPzDCG+LterD
 S5wm2L8iWDYI1vOOmWRCgvTyi5vrn1gnyOV9fadjV2FsG1RG1krbj4MEm93W1T8e5htU
 PtmlA9HtvWH8RgFbxp2tICmnLwxxf3T9dDgvudSGyWEXw1O2FercS+sKAOgzggGQLnZY
 HGAMhnPqghdaZIgsNHPvchIegQ7DD3snWoWuKEbMzD9UM/m6qiQQkFbWbq7LoMDQx8J+
 PSrQ==
X-Gm-Message-State: AOJu0Yz7qUaqD+VPX3VdlAY0vZFaRKahot0A1Z2qqjCNA69FuUO7fKRp
 ayM9BbaxlhytwFAM9beBetd15w4WZe4DZZMYqbwP0oAOi85ikS4OMTiAqPzhAA==
X-Gm-Gg: AY/fxX7YqE5Nun77F+KMxM2I6Y9jIva481MOm/B6WmSAFqDyiE5FCyU5+JfsNu0svlG
 Ur3IIsGYrQaN6mgkAyxdzCrj3+zmySjoEGfHCVxrfWxhweFK8RWNfwaqwll++f8nBYHCOOd/thK
 ve3KiUephgjJVMuAZydsSkC+Rz1Au+RVZLlhvvozKppX2aqs8VlVfK1BB1U17Lp5bZMPjhqLwc4
 epk3mg+k/T/6Z3DuhV3kFs4kl63S0Y7fjhs7EyZPCP+U/AWdACVBDc6z49MZAcXdUu+4FSZgzmD
 y1u3AHP2bI5Fv/488AxMxqs5d7Y4O1t4xFKfR0bU+w9FKusUj7u8ZDoU4gx8U/HrxWtsXkgn476
 kLOAdSC7/RFhsskoOJ4ewQbXHyg6v9poPIUDX4mcFnWk6U4j7wtcXKBQitvCPbwjtG7rmD7lllx
 qVc9yX4MslLzpgU1foUg==
X-Google-Smtp-Source: AGHT+IFzdHxQO4QxO6VtuZKun5cpDJtaklKuQc8xmcP8KWvxoY0trVlz+qRwffqMAj+GaM46yCtAXQ==
X-Received: by 2002:a05:600c:a30f:b0:47d:52ef:c572 with SMTP id
 5b1f17b1804b1-47d52efc7bdmr120780775e9.1.1767155123868; 
 Tue, 30 Dec 2025 20:25:23 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa08d9sm72309085f8f.30.2025.12.30.20.25.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 20:25:23 -0800 (PST)
Message-ID: <6954a5b3.df0a0220.2c395a.254e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 31 Dec 2025 04:25:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767161113; x=1767765913; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=97MERE3EF8DI+I5sHNuMS79HGFzbQ9koY+NWDyHVBF4=;
 b=cZ7hjb77xYl3w9AyIQ2TVkIAlggdbLHznf9pcRMcKNTE/K5/e2LF4bfA7f6CnMqXF2
 ODnwIxCeiwRfdIwA+lGDJ83cvkcEGHNDAnfrY/Mi0AbKdJOVKjV2LI/MBxbeBHS4B/AR
 1CV305jABLEpU6gKlbEdSBgwnoF7QPDUXygaRMX+gEz6Wdg5hlYlu/aRSWYyv6CR7R1j
 are2Iju9YEwiHBWHlSL4xYHAJY5KyJ17aq5T8WsAI/bLOZ0qzi2RPdkTtRWJuwVYtHPF
 zsq+9mRRgtvSQ6AwinfG4llLDKflDMsv+PyZU5K1KtEJFlLM5kmj1l/aZlTu+TQ/MxZD
 Nb9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cZ7hjb77
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-30
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

Autobuild statistics for 2025-12-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 12  | 42  |  0  | 54  |
  2025.11.x  |  6  | 11  |  0  | 17  |
    master   | 50  | 130 |  1  | 181 |

Classification of failures by reason for master
-----------------------------------------------

                       cfm-0.3 | 9 
                 jasper-2.0.33 | 8 
                   dash-0.5.13 | 7 
                       unknown | 6 
ustream-ssl-5a81c108d20e247... | 5 
             dahdi-linux-3.3.0 | 4 
  gobject-introspection-1.84.0 | 4 
                    mpir-3.0.0 | 4 
              host-rust-1.88.0 | 3 
                 libiqrf-0.1.2 | 3 
                netdata-1.37.1 | 3 
                openobex-1.7.2 | 3 
             berkeleydb-5.3.28 | 2 
                   cvs-1.12.13 | 2 
              e2fsprogs-1.47.3 | 2 
                 host-gdb-14.2 | 2 
    host-mender-artifact-4.2.0 | 2 
                     kbd-2.9.0 | 2 
                  libcgi-1.3.0 | 2 
                  libsvg-0.1.4 | 2 
               linux-pam-1.6.1 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             batman-adv-2025.4 | 1 
                    brltty-6.8 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                   dante-1.4.4 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
                 dmidecode-3.7 | 1 
        edk2-edk2-stable202508 | 1 
                      fio-3.41 | 1 
firmware-utils-c42a3bc53da8... | 1 
               freetype-2.14.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
    host-python-maturin-1.10.2 | 1 
               host-runc-1.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.508 | 1 
               iproute2-6.17.0 | 1 
libcorrect-f5a28c74fba7a997... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
             libgphoto2-2.5.33 | 1 
                   libks-2.0.5 | 1 
              libopenssl-3.6.0 | 1 
                libressl-3.9.2 | 1 
                libselinux-3.9 | 1 
                 libuwsc-3.3.5 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.18.2 | 1 
                  linuxptp-4.4 | 1 
                   lzlib-0.4.3 | 1 
                    mcelog-194 | 1 
                     mdadm-4.3 | 1 
                moarvm-2024.12 | 1 
             ntfs-3g-2022.10.3 | 1 
                 openmpi-4.1.8 | 1 
                openntpd-6.8p1 | 1 
                openssh-10.2p1 | 1 
                   perl-5.42.0 | 1 
               pulseaudio-17.0 | 1 
            resiprocate-1.13.2 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
                 rtl_433-25.02 | 1 
                        samba4 | 1 
          sane-airscan-0.99.33 | 1 
       sp-oops-extract-0.0.7-1 | 1 
             stress-ng-0.19.06 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
        wireless_tools-30.pre9 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/63d4b9297db42bd94f163ca87639a64a10ccb4aa | ORPH
   x86_64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/6180024fca29da0fc95ab4e0f61b7a72104d83c0 |     
    or1k     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/4e7ee9890d0b3c5a83037291faa2441cdaa6f9a8 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/a6740d17c5198515f1a59d31992cbe4916d857ee | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/f5c8ef2e0a94b5db0367a24109082c924dc9f900 | ORPH
microblazeel |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/beee2493cb0fa4fded73df5490cb2efc089be25b |     
   sh4eb     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e7b6a8c3b87b763f4be43de6712ee6d83953832d | ORPH
  aarch64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/b324badc20548a14618110ceb105db98cd8752ad |     
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/9486a9ceb6e31ee6b523e081653b6756a74e17ec | ORPH
    arm      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/9fa3054c0bc27e6d445092cd9c84d257ce6a313a |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/5f349e8fce3dd1bdfcc1a16bab18996c754a16c2 |     
    sh4      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/4bb0ecb70e75f792f131e61bbea24ce4754b726e |     
    m68k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/c8000fc8e0fb93b4a33cd4dcd92a1d528101bf4e |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a9646cb4947e1993648bbd5620b8298200e84498 |     
   sh4eb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/124a3220cd4621438bf9b363ae2766ac154c30c7 |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6e5e499fe42af0c6111b9f921cde0a05e7fe451a |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/e05a8f2a0b546e0f83b91c5d981c75a016513e8f |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/9f2285f4fad403ce4b445c17eff9d7e841c88871 |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e060dc6360b1c3cd5a34f41fbc2d5b22b6ad3bba | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a980d5b9df8ef7f8a8e38f9590c5a71abcd9b8d1 | ORPH
  riscv32    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0c2896b3870e460b653f0bda3e8fc09a72640902 | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/85701d43c76af1794c9d7f39984cfe9d26b95034 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fde1f5657714860325c3b7132fba6a73e1e42fc0 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1a6b93ebd05f1f9e0995b2a8a16e132cba477144 | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c934ba28743bea7e75df11f602943c2dbeceeccd | ORPH
    i686     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/4658a230859c74323678442a0b7e4c20611182e5 |     
    m68k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/041d5eb084c8f9990a44d76f530586e2c5d01bdd |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/53a4690bb2d70ad776a09ca043c4aeffaf94bf15 |     
    i686     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/67146b0331b34cde3f2c98514dc0978b2a8c4c1f |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/b4ec714aada9c60297d25de238bf886a9f1f0977 |     
   sh4eb     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/8cb3e74956b2e223a87244ee1930cd8ea6f35a09 |     
   mips64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/8102923ef66ee4b3163ce2eee67bfbc08e6307e3 |     
   mipsel    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/ce3f94621d40563921a80bf32a05d2e361f907ff | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2bf62bc9584fcee2f7a15be7e1bbaea1ff78f6d8 | ORPH
   x86_64    |         dmidecode-3.7          | NOK | https://autobuild.buildroot.org/results/264ede481c4b89abaaac568eda0aa28e6621faed |     
  aarch64    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/4447c6e8851e27aa92d7ca95b385558e26053adb | ORPH
loongarch64  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/3561f422698a412181c3e60d988cf8e80f8d9fd4 | ORPH
    i686     |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/74f7f51f8db7e25078a132a562ff033f9dfa0aa1 |     
  powerpc    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/61245428903c53695b8fc5406de255a24aff618f |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/4a193145023592ef6856eab8db49d94691115ef2 |     
  aarch64    |        freetype-2.14.1         | NOK | https://autobuild.buildroot.org/results/77d2b6e816ce5b906104efbee465a492bba6f677 |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b4df10c1dc19084f142aaae2bac818319ef8b0a2 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/2932a366a2b04bdcb4c972cbd07c08dac3eac354 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d2dec39fa74b38c6cdaed6f7c37c1821c740c419 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/368daafff13722f88443bfbc13eb35300d240ffe | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/57e19a03ae55817b039188e021fd978355d5c095 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4f9fcc1b2c9670bbafc6b24ecf755d9e4a474f47 | ORPH
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/01c3d0a3d91cb4ccf1abc76e06ffd6eecfe2da1d | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/5d3b44ef1a94b384999d73303602c6201827a580 | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/89bd66ebbed3f8820b1fad228bda04f066d98a34 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/e6e1b36520d773323388aef085811db6c08181bd |     
  aarch64    |   host-python-maturin-1.10.2   | NOK | https://autobuild.buildroot.org/results/756e97f01110beade0bf12cb2e424775d4341a60 |     
loongarch64  |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/925b246d08e98d1633f916fb676866c9e49226c7 |     
  aarch64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/dc8377554a962024ac3c96d719467c62035cd047 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/88c10011ad258a957277433ab4ae6ece8327291f |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/c914a490b3c04c244e780f1b5e7c1ecf9317d9fc |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b06e8a1b8375604d7115dc8a2c6673102b8f3fb0 | ORPH
  powerpc    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c0a5b97e6c17ee3d227d98248ca23e8839937487 |     
  aarch64    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/d0c3c3b17751870ac98001eacb4bb75f02ed56df |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/494644e9d3c066a4888caeefc03e463933af9b91 |     
  mips64el   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/5c7c4cb12befa261c810555ab89d265311d9c83a |     
  riscv32    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/afa799a60dab8b6f5c4672c066a66a828f2203b1 |     
  powerpc    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/9801925f4bd6f38dc6163546628d386c7cf21120 |     
    or1k     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/05e436460cf4ddb8ecc3b0214f258922400ea0dc |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/5fe961ae7daa20b9e760fc04a7aaa1b1db9d42ad |     
    arm      |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/de9f856d6a59ea264731486e898d16fd61cd4704 |     
 microblaze  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/dfff4dc35a3b9fbb973d80cc75a696e414f0df91 |     
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/159d8df93c45779c634ee85d89eaae6bd5a8c167 | ORPH
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/72be88910aae3a829e8167fce3c0455e070b66a3 | ORPH
 aarch64_be  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/b34d2fc2b817a0a2065984ed9c4a1fcfa88e7fd0 |     
  powerpc    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/1e16ee858b8004d6a7e774ed552ae74e8460a5c3 |     
   s390x     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/048578ef2373e4ab64233d2c3e4cdbcc65c80bff |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/cc518b6791e457ea893b252120e9b2b93dc030fd |     
   xtensa    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/b3a8c8623c49d23f81d9e7f941200d9c58a13ed3 |     
 aarch64_be  |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/cbe76b65f96058ad3f107bdeb6611a08aeeec1bc |     
powerpc64le  |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/e0901b2adafbcdd707c58fdd8ff67f01536e1adc |     
   mips64    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/63eed58c01c818872cd03f534ed1ac3ad15c2320 |     
 aarch64_be  |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/2b75f1ead8c87c0296363057a14b77393cf2ac5b | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/33b3e7e0620ca6f60f7e28f69ca456980d5e8f25 | ORPH
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/77200e40cab6631ee0af006a32577edb42ab2a0a | ORPH
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a20a822da4cd9846553333901bb0e7bfc15d2821 |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c4b79f086f560e5b494934c5c7b3b909d8e2f246 |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/5a170b61c45bcddec57c136ac1937f0be74245e5 |     
  powerpc    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/94a215f746e56f7c45bdbf8b14899a06e9995a05 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/587ebc24b37f83032c79039df1770dcb42b0ff2e | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e0e5a879159aea926d630e329c2952934517a3e1 | ORPH
  powerpc    |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/e45b12ab1e1426696058c354f6923ade79d4352b | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c84c2a4b894d6cc47c699fa955debb4c8a4abee0 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c7c4920126960809bf4881ae643b0892519051cc | ORPH
 aarch64_be  |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/21d2772e6567b545694efc7d553ae7f6a9515b62 |     
    sh4a     |          lzlib-0.4.3           | NOK | https://autobuild.buildroot.org/results/942c4d9f8e42914d10f3b590c21a7f27c60e039b |     
   x86_64    |           mcelog-194           | NOK | https://autobuild.buildroot.org/results/5d97d3d5e19d3b0824343f13f9c13b1de61c25c2 |     
  powerpc    |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/cee5a5ba5bf289a0d1874c93560fc8cde86dbb31 | ORPH
    mips     |         moarvm-2024.12         | NOK | https://autobuild.buildroot.org/results/65a5b1127a22edd05c42163b819c96db85343466 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c3d9829805b6148beda5a9c35bf3b34ba1f8558e |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d491a42179a5164e592f6fed044e2e563aadb187 |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1e7daac5f100709bd1b463237b34fe78fc3ca19b |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/dad975a126b4c3f86585bf03b948fadc8282e1f0 |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/b3cd3c70b286054786481ef7e6ffc99289898d8d |     
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/37741d32e0da7fdc069b2aada45e70fafc0eeadc |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/5d014c690f2c5a57776e0df734abf0cc9e7844b0 |     
   s390x     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/ba34741d7359fe8ee1d5d08239704b258408e6fe | ORPH
 microblaze  |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/f9e532afd3976722a4b5ba5b5f43fea1053ad37d |     
 aarch64_be  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/b445caa5cae1e024e5533f40a71d26e8b60559fb | ORPH
  aarch64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/5c88c66b64a703e4a91f7836d05ec69c0292bbb3 | ORPH
   s390x     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/ff34d90c1eefb44d4aef9b7ead289e0b39865658 | ORPH
    or1k     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/1013333614d24214706085d1b19cb2396f9c8d34 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/fd5cd682c92436b80a15036db7a8381957cc671d | ORPH
loongarch64  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/17244ad85f0d7f502f4b85a88c5a231a94b9c22e |     
    arc      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d9e551b83e04be5d13a2006ead1e49940a236b1a | ORPH
   sparc     |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/0d66279c378d21a14d10b7cafaebbeceda3fd12b | ORPH
 aarch64_be  | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/bc61c5908556616fe70da52e84cdd0ef9bcd962e |     
   armeb     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/ffdd6963f6fd03e96d3483810514fa20779c4fc9 |     
 powerpc64   |             samba4             | TIM | https://autobuild.buildroot.org/results/20fed27bf288f4be1e5a3f82c74690d3509d3157 |     
    or1k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/ee64dad50bf194d51b313cda7bc173444c0c8439 |     
microblazeel |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/27fdda5b96e9ffd0a1438b6bc520e30d9f788358 |     
 aarch64_be  |       stress-ng-0.19.06        | NOK | https://autobuild.buildroot.org/results/857cd53983c0ef46928fbda7a24a60cd2432ce39 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/70b28e353e353bc4a510c597c47499da04907612 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/298a6cdbf3c454ff7a6257bdabdef752aad698ce |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/4d5c60a20309cab7a41f603d079931a8fa85152b |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1b2d09fa7769f3f9af1efe81605648c729278ff4 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/2adcd78ba6f003895b591927a27fa606f97e0639 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/78f0d8695be2fa85395eb7c2b22513f65e39b088 |     
loongarch64  | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/42b61c2b15de86d5a5bddf70465e3495632dbac1 | ORPH
microblazeel | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/42b3f81d433f90e1a1731010713bc917b423207b | ORPH
  mips64el   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/5fab10690b2889604a8948d62c27fedcf29ee654 | ORPH
   s390x     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/f2ff9be1aec683269ca10ae19b3cef7c4e073bce | ORPH
   xtensa    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ea8fe6b3f5b10bb97f374cb96243599e5c549791 | ORPH
powerpc64le  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/4fa895ada9a4a23d2d94599fc5e93a6057fab6b2 | ORPH
   s390x     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/aba46798d17720d656e0dcc70c05a5699385ea65 |     
    arc      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/89a7d956142d42ec421d078c56fd05d135e99cbc |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                  clamav-1.5.1 | 1 
            cppcms-2.0.0-beta2 | 1 
                   cvs-1.12.13 | 1 
          esp-hosted-1.0.4.0.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
              host-rust-1.88.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
          pkcs11-helper-1.30.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.3 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          clamav-1.5.1          | NOK | https://autobuild.buildroot.org/results/7e88cba9974f6f5acd125b69b95b7269d8128886 |     
   armeb     |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/e2c0888b56313c2cdc4fc927ec887ce526e8e875 | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/554f4d22b0b0170300aa2625fbd3a9dffe15d592 | ORPH
 powerpc64   |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/a543bddd22373da44b0ed3360def81ce19d7e7f9 |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/d276b9356fa7408e37cd7653c1324e655165398d |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/c3cf600c7e798f6c4b6a0af6f85e1c15c86b0473 |     
loongarch64  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/e26fcbda138d7d5cc08eef0fc882108d6b468705 |     
  mips64el   |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/56f90eb8588c7f757111006a56a9e8ccd0cec5f7 | ORPH
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/bb08b6c4894a7963847e5fa6d837b7c66415cdc1 |     
  mips64el   |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/177a3fe98798c3f3237340a715e0aa91c2d909ba |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2bfdc72047bbbbb8e42efb2b5afb6d462de5e175 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 13
                libxslt-1.1.45 | 4 
host-go-bootstrap-stage3-1.... | 3 
                       unknown | 3 
                    mpir-3.0.0 | 2 
                    brltty-6.6 | 1 
               dvdrw-tools-7.1 | 1 
edid-decode-6f117a8f8c0e76e... | 1 
            gdk-pixbuf-2.42.12 | 1 
gemmlowp-16e8662c34917be006... | 1 
  gobject-introspection-1.82.0 | 1 
               graphene-1.10.8 | 1 
               harfbuzz-10.3.0 | 1 
              host-rust-1.82.0 | 1 
libuci-f3fc0b76040685829191... | 1 
              libunistring-1.3 | 1 
          linux-5.10.162-cip24 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
              mariadb-10.11.15 | 1 
                   perl-5.40.3 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/d18942bbaa71619a4ed880a3071fabf3b29ddc09 |     
    i686     |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/671acecc0b9d8a1221fa78e4ccf6c2e943c09df7 |     
 microblaze  | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/7eb68bea3f75b0cfad12d966a8f2f05fdc4cb27d | ORPH
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/835c31a5a8c5a7a030c51b728d3769cb3f547db0 | ORPH
  riscv64    | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/69bec613f0f74f34e0997a74aaf3900df0c976d5 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/018ff304aec687a648a15294a8e8b3717d40dcca | ORPH
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/1c6cf61543b24ac52b6ddee9d6bfa4f23f5e81bb |     
    or1k     |        harfbuzz-10.3.0         | NOK | https://autobuild.buildroot.org/results/2b0788c845feabdddc1a45577956f673e231dc90 |     
 microblaze  | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/85a8729801a97974d91dc3c4d8f387454e689cf4 |     
   armeb     | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/11b043fea42d70c507571d8d7b21c8f4f8a620e6 |     
    sh4      | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/01192738d4947025dd01a06a845458ed5d1ee550 |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/038b967ca0e7556a9553aafea539ca35813ad566 |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/9badd25cd26d4d713163a1f814786edb2e19bab7 |     
  sparc64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/5b7d9b75add8bca5d0c1b0571d6d15d365c5a1fb |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/92c912a904479ce6ec71da06acc92a7682710d78 |     
  sparc64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/619e613ba71058c9ba7e8e1d73bf85d88072bd2e |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/22c36f4b0ec5d34f12958e0587a0eee92b7f67f4 |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f1c88ce787be448f4eace7d0426e0c90188a6a68 |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/b84bcd8d87dae48827369e2199fc50e4f6222caf |     
    sh4      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/000a93e498e264f9c4a097f4f0d2c2cf5b3aa7e0 |     
   armeb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/07453aa528cedf9439ae6f168ef0371ef333829c |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/491154358f188a9024a4fe61c1722ede45cf567e |     
    arc      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/26098c3d2129b0e7b4f1481de768df6685b396fb |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/2e4bbc1f232ded6facf99210d3b75e1ebb5d07c7 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/cf217dcd208571378c99deed8abe2dc67abe68c2 |     
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/29c63d693cd3df565f0d6acf82c73eb25affa568 |     
  sparc64    |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/81cb283edb8002e21fe2c4f5d7795e8b03dfea26 |     
    m68k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/4766a91d173fad4414b8f92f1b217b7a17198eb0 |     
   sparc     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/57ef1723dcc2bb94c257a2a173213b1c167b83d7 |     
   mipsel    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/74e3ca714f65f4f7dc78c270b0d28253d88cdf62 |     
microblazeel |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/b34d1229b5c85fc11c713f34ec4f230a3562600b |     
 microblaze  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/03acc76319bc9cc5408f591edf5feee648d0dd2d | ORPH
   arceb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/d8f99213b61ad615e54676c4ef08a1b4f64a32b4 |     
    m68k     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ea2796a448437a928f1183163b07fe06bc4fb6b9 |     
microblazeel |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/4bc2f90ea373d4c610c26f51eb2beb71fd6b9bd9 | ORPH
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e1134ab185bcd5c88d7ba7c7adceefc9878fed3c |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d57043b98b0c6c8eaff83d3e22c60303b40c3823 |     
  mips64el   |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/c6258412551a6fe026cfd18aa6bac81096f5ca39 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4c3bb2bfe38c9ba54301e9e6cf3172a8000df307 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a387ffa2a1e0c251c5787f4a7e544077171fa04c |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/fb504ecc26858d74404c95563d7327be5c66f276 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/1146197413127149b9ed92ac6809bfc1e2a3a0a8 |     


Gitlab CI results for 2025-12-30
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/12564342318 |      
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/12555445954 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/12555445931 |      
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/12555445857 | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12555445782 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

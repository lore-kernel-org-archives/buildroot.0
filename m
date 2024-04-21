Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8F1C4345F
	for <buildroot@archiver.kernel.org>; Sun, 21 Apr 2024 03:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5267281BF5;
	Sun, 21 Apr 2024 03:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InXy-TN_8Zid; Sun, 21 Apr 2024 03:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA3981C0A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA3981C0A;
	Sun, 21 Apr 2024 03:54:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4CA61BF2C7
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 03:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98779605FF
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 03:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xO7ZgzNLYi_e for <buildroot@lists.busybox.net>;
 Sun, 21 Apr 2024 03:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D0D0605DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D0D0605DC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D0D0605DC
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 03:54:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95B711C0008
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 03:54:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 21 Apr 2024 03:54:47 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1713671687; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=swvjmJSYJEwoM0BZTMlswU6B+ldjt+BZ51zgSqpd7qc=;
 b=O63ZGToQvqhHFvUICyESGoeg8v8q1dx/DoVpfLjEGZPJgKY6CNJuKk/8Pgl3KkMCjdQi7M
 DjHR13Q1BzPmPyRn7jvKMljB1Y+pP1DTQzGLgkoZcwGZe+C2hy4lWQWFRjbLJWTHfMgHa2
 UeIy2zrooGvIQAdrafkuxfMiNP2SVlIKh5r2q1H4xhRzI8FThmYvjMjhNqFtPNp54ooBIK
 buB4d9dULvFhqT0Z09IWdYNfdTZRgKs7ec4ZepCBLwlQUvzIMbFw5CIo0HTC5cbEZR6eFp
 py40RABzwDSAeV1UdshjZtHYAFjKyBFLLnCgkRQVBHJ7x25onsFWl1ICGofRkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O63ZGToQ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>
Message-ID: <20240421035447.D0UGLvU-0EtG3AfqyeS6N8mVJtoBhIaU6IxQvR2QxaI@z>

Hello,

Autobuild statistics for 2024-04-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  8  |  0  | 15  |
    master   | 70  | 86  |  1  | 157 |

Classification of failures by reason for master
-----------------------------------------------

                     mdadm-4.3 | 7 
host-heimdal-f4faaeaba371ff... | 6 
               apcupsd-3.14.14 | 4 
                fail2ban-1.0.2 | 4 
          libcamera-apps-1.2.1 | 4 
           dmraid-1.0.0.rc16-3 | 3 
                gnu-efi-3.0.18 | 3 
   host-flutter-sdk-bin-3.19.5 | 3 
                   linux-6.8.1 | 3 
                 openssh-9.7p1 | 3 
                       unknown | 3 
check-11970a7e112dfe243a2e6... | 2 
                 coreutils-9.3 | 2 
        host-sentry-cli-2.20.3 | 2 
             util-linux-2.39.3 | 2 
                xenomai-3.0.10 | 2 
                    bat-0.24.0 | 1 
                   bullet-3.25 | 1 
                     criu-3.19 | 1 
                 dc3dd-7.2.641 | 1 
             docker-cli-26.0.0 | 1 
                     dtc-1.7.0 | 1 
                   duma-2.5.21 | 1 
                elfutils-0.189 | 1 
                    fcft-3.1.6 | 1 
            gdk-pixbuf-2.42.10 | 1 
                 glibmm-2.76.0 | 1 
         gobject-introspection | 1 
                host-go-1.22.2 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.74.1 | 1 
igh-ethercat-f5dc109176400f... | 1 
               ipmitool-1_8_19 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
              libarchive-3.7.2 | 1 
                libressl-3.8.4 | 1 
                  libsepol-3.5 | 1 
     linux-5.10.162-cip24-rt10 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
          moby-buildkit-0.11.6 | 1 
                    ncmpc-0.49 | 1 
                openocd-0.12.0 | 1 
               poppler-22.12.0 | 1 
                privoxy-3.0.34 | 1 
                    proj-9.3.0 | 1 
         python-remi-2022.7.27 | 1 
rtl8188eu-306f3e62cf7cddf8c... | 1 
               valgrind-3.22.0 | 1 
                 wavemon-0.9.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cbb0f7effb9c85b03fbf69b4c5d43930fedf04cb |     
 powerpc64   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cf541de9ed1331181a77c5d7cbb1b7fc019bb178 |     
 aarch64_be  |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d390eacf6412151aba185ff851c04ec792781ad5 |     
   xtensa    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c1a590b77e22b02a5f6b46437d13c8c966620388 |     
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/212df5fc85a1aa1806d61db3577abc600ce7d898 |     
  mips64el   |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/8cc36d475bd7f118e50d9af5d7e17666aa5f3372 |     
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/972e0b4a4cecfb9346d9be0a5fe904e09b5978b6 | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1460643044f6218c9a0b8e6ee5bca0d48b297c7d | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b5f71acc01e2508c3a7ccb4edd210fe34ced3839 | ORPH
   sh4eb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/754a790165de2de2d3e15d1b3659b6da0fc401b9 | ORPH
powerpc64le  |           criu-3.19            | NOK | http://autobuild.buildroot.net/results/6df834a28a783b4a14d78f739671b17f608a11e7 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/5636a4429125bf5f6635af1184116c5feb6eab18 | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/f74c5cd7e285734a5dec9f2f117eebd215b76811 | ORPH
   xtensa    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/1e2fc361e4cdab26b0ff140c9516d4df6bc1c125 | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/e8a451e5619f4327cefe4f8fc8de429b022f581d | ORPH
  riscv64    |       docker-cli-26.0.0        | NOK | http://autobuild.buildroot.net/results/6b85fb0384ec4da619650c0a490f00e2c1d4b5ec |     
    arm      |           dtc-1.7.0            | NOK | http://autobuild.buildroot.net/results/20485a9eb9869a2d6f102c1ea1031c47f09ba1ee |     
   xtensa    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/ac6dd3d2fa1cc267eda92de9a17db1a0f2082886 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4bd6d1cc2d55c7a062591c51e310e9b815236f42 | ORPH
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9ccdb57232daaa292de28bea0fe7c37b89b3d47d |     
    sh4      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ade750e7cfa47aabf18028be3124b4547ad7d3e9 |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/a6e7ed082b1d21d119c49a709fbc105d3685d00f |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c31fc818ccd772d031b6ff0adf5fcf16b7f14b4f |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/1e4ede00198b1af28f9c986d95e070d6999c3218 |     
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/bfcf22200d838c9ace4ed2b0cececfaed84e7466 | ORPH
    or1k     |         glibmm-2.76.0          | NOK | http://autobuild.buildroot.net/results/591dddfeab087a13efbdc1cd0c1d09feefc01965 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/466c73466775d03b1efb9444865b16f5126ab810 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4aabb103623c7ed819e750e9df2f4cce637cad77 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/91facf665a3353de8434fa0a2c6e51ec8f0578e8 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/345b80bc12183302dc2d58182524373e7a1a02b7 |     
    arm      |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/b5e4e031bc693f18b9acb309cce5111747a9c11a |     
    arm      |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/a44cb65451dd8ef71aff305f867e033c532e7720 |     
    arm      |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/132feb4605699e7f923e3dce839b3279830dddfd |     
  mips64el   |         host-go-1.22.2         | NOK | http://autobuild.buildroot.net/results/19b4287580823111c12c1355488347017a848e3b |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/9e6ee7537e620ccf3c9b5c9de41971ca6f1c54bc | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/9f0ddbbf9711e88cf2a0d678a29cdca4b3cf02e1 | ORPH
   xtensa    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1be2c1f7d2b38127033e67fc7249cd36f78dad9b | ORPH
   xtensa    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a499be511466d45f6e53db960767551c803ed91d | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/76c4ff35fc9e1d5c71346d8337bf52314b9b2a5d | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/157e42968fb0bb9dab9186721e557e41fde6f066 | ORPH
    arm      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b3ddfca65bb5993e2a668883812f6dbd5e7d4b4b |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/7cc317bb5a4c5c37d655d774407fab652a3cff87 |     
   x86_64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/6e0548170837ba4dc1d5da6d1b09aaf3bf71971b |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/84bae92e2932a72e0562e3da0fe2263dccdeed00 |     
   mipsel    | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/6ea4f6628de300a02c5cea605fa23804276b916d |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/43ddbf697a7851cf5f189a7a5fa02bfe92f15579 |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | http://autobuild.buildroot.net/results/2a7554cd5b6df6fcd5ef0f3e61d519889f585fe0 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/3c6eb05da5ae6088cc9d0d97030fe6f167365255 | ORPH
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/4072015ef865519dfee534a4afa8ac228509b58a |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b4e8f2cd28582fd465edba2d3f3f1bb634a5b69d |     
   mips64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/aaa1f1dc6bbbaf2c95a27161f6e83f47bc809149 |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/733518c5b4fc47aeffde3041079afd766bdab428 |     
  riscv64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/5b7027dd5b70f5425377eee3c177c32fd8b49c57 |     
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ac4d7384df13f44761e3e19ec28e41bfc5cf59bf | ORPH
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/74dae50b758d55dafacb542dd948f4d129209f6f |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/5c11f99337c317338be63f254da84905f9a43e3e | ORPH
   mipsel    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/563ff5d9af9da92f629161b74c694616bdfc9129 | ORPH
 powerpc64   |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/c9cba0dc5f1ede7d607d5da46805e3b65380b4aa | ORPH
  sparc64    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/67728aa21e41509a6a48f1f67caa7819d3a34ec0 | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/4c1b470a6e017055d7a10378fae7d59ed6768a4f | ORPH
   armeb     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/14fd6fd186e28201e2af8b2c04299f51f6377a3e | ORPH
   sparc     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/e42471de4f8313745e1e1347958df9985aeb22b1 | ORPH
   x86_64    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/8aa7cb3c12f4fa31cc8b2ecd2408f5f6fe50641b | ORPH
   xtensa    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/225135d0413711097548758d3f27bb142d9cd26d | ORPH
  aarch64    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/58646ebd7a0dff5ef88b692fb4bc7be10a55484c | ORPH
  powerpc    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/e3a7606fbe2940954d4fe78bbdb5dee17f8d7126 | ORPH
   xtensa    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/dd9ccf03c3948f30583effaa419620e8db5a1379 | ORPH
  riscv64    |      moby-buildkit-0.11.6      | NOK | http://autobuild.buildroot.net/results/6faae87ef397cc4b7caf2964996bdec5a893d7ce |     
   x86_64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/df201c9616aae2197d3556fa767465c320d96e71 |     
    arc      |         openocd-0.12.0         | NOK | http://autobuild.buildroot.net/results/edcdd3f34523eeb2ed2c1b22ac0a08fcc9b8cd2f | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/a60030bd4a598da33f1cad852f4f60d1871a041b | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/e36482fcc1cac6f025697a9c1cc17b7758a84247 | ORPH
 powerpc64   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/31c792e5f91a4b816fcd1f4f5ca2ac3fcdeb91c9 | ORPH
   xtensa    |        poppler-22.12.0         | NOK | http://autobuild.buildroot.net/results/6c622ffad5efaf1aa456feb0de94687acbbdcfd6 |     
   x86_64    |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/0bdb29ebe4a78bf569488ad427222ef528cfef47 |     
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/b9406d8703da7f0a83c1ac00c99dd0da92ae1741 |     
   mips64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/2bd9edc168880df69c731ff10df92377114e7042 |     
   armeb     | rtl8188eu-306f3e62cf7cddf8c... | NOK | http://autobuild.buildroot.net/results/36c30d1037e20edc7f2a36aec2b02060244d2a6c |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/9d5bd6d009dbc08aba780b9524abcfb111712ad5 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/6476b975fea22f66d3af7cd21456312de481a532 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf616aaebf0e198e540adb274972aa6fb015f844 |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/e713ee7cbdd07af87d9c3c6e3535f432041c5efc | ORPH
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/14fed2584f3b451053f11c8428a7e819293f84ea | ORPH
   mips64    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/7317837ad19f0eaf1cb1859697746e4721ff7da9 | ORPH
   nios2     |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/8e4ee17b2402bf485ebc54ad008caed0beaa3a0c | ORPH
    sh4      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/65e85bddfb361377c01a9cd050c25ef06ee74e95 |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/caff833860306bcc09c5e4e04324a067173f3a29 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

   host-flutter-sdk-bin-3.16.8 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                libressl-3.8.2 | 1 
                  linux-6.6.22 | 1 
                    ncmpc-0.49 | 1 
                    proj-9.3.0 | 1 
           python-numpy-1.25.0 | 1 
                 wavemon-0.9.5 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/3693f896c0e3464e4cf353ee9cc0d50ada145ed9 |     
   xtensa    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b095ede3d0fcf82295b347445b88972d97239c99 | ORPH
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/bc890d8d71c4e1751fdda5d305be33afd44e5a8b | ORPH
    mips     |          linux-6.6.22          | NOK | http://autobuild.buildroot.net/results/46e22ef12000a2abdbc5d9b7479bb39758c394bb | ORPH
  sparc64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/8fba76b2c7d8228ca6d4aed43932ebd4433afaa9 |     
    m68k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/d09887c1e34b857543c88584b9cc7c33c54310ec |     
  aarch64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/6edb913f26a72db6e47988006190a292486b1a25 |     
   nios2     |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/0bbfc927eee976383b879ef13bf079432501814e | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

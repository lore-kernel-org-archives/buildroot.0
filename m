Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969D5C83F25
	for <buildroot@archiver.kernel.org>; Wed, 23 Jul 2025 03:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A53F60E9A;
	Wed, 23 Jul 2025 03:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6ECz8pYbsQM; Wed, 23 Jul 2025 03:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96C7A60E4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96C7A60E4F;
	Wed, 23 Jul 2025 03:17:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFD9ECD
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 03:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D615D40EC9
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 03:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0jTMgnG3gLz for <buildroot@buildroot.org>;
 Wed, 23 Jul 2025 03:17:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E094740EC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E094740EC3
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E094740EC3
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 03:17:12 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-60c6fea6742so12686057a12.1
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 20:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753240631; x=1753845431;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nS0CaLdRDFHe5M+o7MxIsp3alKVYALydBpogl2PuXQE=;
 b=r5mFu7rvlx0XOrSL9BZykbaVau1NlYeR6cuvBe9SG29MJBIAXQcfbcATGrce18t2cG
 nUXiJcnb6fKu6iYX0mrzkmM+C2O7U+b1nRVQJ4CNBPC7nrl2f90dcXEdgs1hl7w/4JCA
 +O10guoqkED5NG8SnME9dpi1+Hde1SJiaMet1q8s2ljqErVfAp4xCQKBxL6Zdr713jeO
 12fdQrRcmjAkoaZicbMYxGJnIBS0E1jm9YhkoGb3U7zRlhNIIYrq+uFKz5GopCJNV95H
 lE9xld3tUnbzMQggDkNY0cvqPZaLslhuYlg5MQjyqXnUnw9LrNDLcHdwgiQEPcJc1m/8
 xmfg==
X-Gm-Message-State: AOJu0YyniwDUisdHXJmJqiV4vfg5C1VbtWF+ON8dmL0mK2orQD7PdP17
 IvFvW4LYV09mB/+8HPujgWKSFF79J9ZX9+kFbJbfUIGCbAgIgaaYzi+CP4r9Hw==
X-Gm-Gg: ASbGncvcCzLuw/ScUqdqzkaZ1KwmZQYYR96yn8yu5iu81hcWKUqMFNpTCrSLY2D9+lL
 hCvIV0BXpk8PvpIWxjUjDHoCovYCTTNlpCF0EzztMjVn47+zqP6ys3w1EdCcmXyWgQ5AidEGCmD
 NrDyXb3tNO/zblSrm9SE/KuRGXCjTOzKXhOeFVJriu+D6S9tHzaaDhbAhkieslqwJ1CNZfdUtJ3
 q7ZBCOLy4PAUJ4DcTeEN2Si8hcuvOrATbDvUjjlxPOx2szLYlHdakjnvFGHvoTX+PB7O7dJ4bqT
 GaQeXkYs9+fNsytaue3ohDpypcEXgVVRyeWvYiIYdjn18yOmdLTBXkBn274INaW/5ONKWHDH/EY
 T7Gzy7Xoa28HufnCS0sT04goBtg==
X-Google-Smtp-Source: AGHT+IHzFKPiaOSrl7FXzfJUVyT3FdLLM2fbHUibww//PlTUIgOazaln1sOUC0T3hDtfUn3nIMtZ1Q==
X-Received: by 2002:a50:d511:0:b0:608:f493:871e with SMTP id
 4fb4d7f45d1cf-6149b42f7e4mr801193a12.14.1753240629944; 
 Tue, 22 Jul 2025 20:17:09 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c90a7083sm7870922a12.61.2025.07.22.20.17.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 20:17:09 -0700 (PDT)
Message-ID: <68805435.500a0220.2196f4.31c2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 23 Jul 2025 03:17:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753240631; x=1753845431; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nS0CaLdRDFHe5M+o7MxIsp3alKVYALydBpogl2PuXQE=;
 b=UgCyavLScbSc1XJAdlHJ/yizLZNewwzumSC+l+Mt55B23l54ijDeItxAsrVNzdWKlC
 FGdgzd943ssoAPO0GHBFdjET/VXp6p4H20NrSTbJq7RsdjZloR997raZwBorC4aOZgwW
 OokLMtWeI5KZj/2w8GD1vmWTBHzGN5fB+oBsCYIfDYGKCAOLMv41G9Gz/uv14bjg7fkK
 fJjuJ8PycFQ9uX8z2G0QXieoKeIMRRAOB8BXIDJSmDHShbNZk9kARVX9Jz6m4VlENQd4
 uBAPCONGPTGUhOefoRZ+rag/PUlrZr/Y/238hIQwjZnkhT35tcxdYMWEfcIctXTUvteO
 5H2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UgCyavLS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-22
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

Autobuild statistics for 2025-07-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  6  |  0  |  9  |
  2025.05.x  |  2  |  6  |  0  |  8  |
    master   | 23  | 392 |  1  | 416 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 37
              libselinux-3.8.1 | 22
                  cjson-1.7.18 | 15
host-binutils-arc-2023.09-r... | 14
                    yajl-2.1.0 | 13
             batman-adv-2024.4 | 11
                    gpm-1.20.7 | 11
        host-berkeleydb-5.3.28 | 10
               bctoolbox-4.4.8 | 9 
                   bash-5.2.37 | 8 
                 libsoxr-0.1.3 | 8 
                   avrdude-8.0 | 7 
       host-gcc-initial-14.3.0 | 7 
                 apitrace-10.0 | 6 
                   cvs-1.12.13 | 6 
host-am335x-pru-package-5f3... | 6 
                 host-gdb-14.2 | 6 
                liboauth-1.0.3 | 6 
              libopenssl-3.5.1 | 6 
                       cfm-0.3 | 5 
                    ficl-4.1.0 | 5 
         host-mariadb-10.11.11 | 5 
               host-vde2-2.3.3 | 5 
     linux-5.10.162-cip24-rt10 | 5 
                 openal-1.22.0 | 5 
          aardvark-dns-v1.15.0 | 4 
             berkeleydb-5.3.28 | 4 
libdbi-drivers-0bfae6c43134... | 4 
        liblog4c-localtime-1.0 | 4 
                libsepol-3.8.1 | 4 
                   perl-5.40.2 | 4 
                       unknown | 4 
                    azmq-1.0.3 | 3 
                     crun-1.22 | 3 
             dahdi-linux-3.3.0 | 3 
  gobject-introspection-1.84.0 | 3 
       host-gcc-initial-15.1.0 | 3 
              host-json-c-0.18 | 3 
                  linux-6.15.6 | 3 
                 netsnmp-5.9.4 | 3 
        b43-firmware-5.100.138 | 2 
           host-doxygen-1.8.18 | 2 
         host-gcc-final-14.3.0 | 2 
                       jose-14 | 2 
libdill-32d0e8b733416208e04... | 2 
                 libmbus-0.8.0 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
          linux-5.10.162-cip24 | 2 
            netstat-nat-1.4.10 | 2 
                openocd-0.12.0 | 2 
               procps-ng-4.0.5 | 2 
               pulseaudio-17.0 | 2 
            python-yarl-1.18.3 | 2 
                s6-dns-2.4.0.0 | 2 
       sp-oops-extract-0.0.7-1 | 2 
                sysklogd-2.7.2 | 2 
              tinyssh-20240101 | 2 
             util-linux-2.41.1 | 2 
        vulkan-headers-1.4.317 | 2 
                    wipe-2.3.1 | 2 
               acpica-20241212 | 1 
amazon-ecr-credential-helpe... | 1 
               asterisk-22.3.0 | 1 
                   atop-2.11.0 | 1 
   azure-iot-sdk-c-LTS_03_2025 | 1 
          cloudflared-2025.1.0 | 1 
             cni-plugins-1.7.1 | 1 
                 coreutils-9.5 | 1 
           crucible-2023.11.02 | 1 
          cryptodev-linux-1.13 | 1 
                   dillo-3.0.5 | 1 
               ebtables-2.0.11 | 1 
            ecryptfs-utils-111 | 1 
                     gdbm-1.24 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
              graphite2-1.3.14 | 1 
            host-binutils-2.42 | 1 
          host-binutils-2.43.1 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.1.0 | 1 
       host-nodejs-src-22.15.1 | 1 
              host-rust-1.86.0 | 1 
            igh-ethercat-1.6.3 | 1 
                  iozone-3.506 | 1 
                  jack2-1.9.22 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
             libgphoto2-2.5.27 | 1 
                libkrb5-1.21.3 | 1 
                libosip2-5.3.1 | 1 
                       libsrtp | 1 
libubox-3868f47c8f6c6570e62... | 1 
               libucontext-1.2 | 1 
linux-headers-5.10.162-cip2... | 1 
               linux-pam-1.6.1 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250530 | 1 
                  mbpfan-2.4.0 | 1 
                    mpir-3.0.0 | 1 
                    musl-1.2.5 | 1 
                   nanocom-1.0 | 1 
                openswan-3.0.0 | 1 
                p11-kit-0.25.5 | 1 
      passt-2025_06_11.0293c6f | 1 
                   patch-2.7.6 | 1 
                   pcre2-10.45 | 1 
                pipewire-1.2.7 | 1 
                 pixman-0.44.2 | 1 
                  prboom-2.5.0 | 1 
                python3-3.13.5 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                setserial-2.17 | 1 
                    sslh-2.0.1 | 1 
                   thttpd-2.29 | 1 
toolchain-external-bootlin-... | 1 
                tpm2-tss-3.2.2 | 1 
               valgrind-3.25.1 | 1 
                    webp-1.5.0 | 1 
        wireless_tools-30.pre9 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/8b3f17b2d1c8d4cb435e9edd6935cf1cd25f77f2 | ORPH
   armeb     |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/94d36e5c78173f1120093d563f924338938003b4 | ORPH
  aarch64    |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/4810b2558683d7b1367f77138183231188255a34 | ORPH
   x86_64    |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/d9a5281ee6bf61df9f4aba5284bf0a2b840f9d14 | ORPH
powerpc64le  |        acpica-20241212         | NOK | https://autobuild.buildroot.org/results/4b1fa39542157825a00abea9fd238a02f0485e52 | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a249d49019cdb4a66aabf24e18995b45bfc2bc52 | ORPH
  mips64el   |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/0bf34d9a67109181a404a7b36f21b441625f1753 |     
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/e4f3a01a58d97cae0d70efc042a45990cc9d052f |     
   mips64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/f8a9f02b4f0519eb727930e704556a011271b854 |     
   sparc     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/8b720fd67cfc503650cd68766335f2c621477057 |     
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/b77d01517bbd9dbcf5827a60c4207f3b69dcbf20 |     
 aarch64_be  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/474272fc1aa8bc51cdf7cf3a5571a3b53df7b0a9 |     
 microblaze  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/d2a53fbb8602c42a70475dd322c106998889701c |     
   sparc     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/bfa2d55f25a51a285b0384a6e1d9ef9e84dffad5 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/140fbac1961da5e00095a6910848e9578d77f581 |     
    or1k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4fc6d7bb5cfe7edb00d1bee31befe0d30692e7df |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/d95a5b7381641aadc5eeaebfdd754f2fb4881afa |     
  powerpc    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4d248d437522fa05d2b8429e7c43865232803888 |     
    arc      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/5e990ee5a894890c99c90b14ef8121c3a8f224b6 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e22cb1bd2adbdc165f45ecdd275a5940dd1d0385 |     
    m68k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/d0c6b59f92394d8d6f59a8da03f410549a3f9976 |     
   x86_64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/36a2d9d28cc390ee028199526adb95afaebfdf6c |     
   sh4aeb    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/f5ceb3d64f4a258eb379bb77b62a8356dd583057 |     
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/4deb80954cc4d53f06e51c2bcd6896b3e48802e9 |     
 microblaze  |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/433e4c7ec382a713f84d0523cab71c3fbbde1a7b |     
    arm      |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/64289fcbfc9cc7e277ca749cde0375b4005f942e |     
   mips64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/685a4999cc04f3b82ed94a7d32d148153ddccb7b |     
 powerpc64   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/34749ff104d121e299f34e6045735b8d201c9273 | ORPH
   mips64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/3cd077e2d2506c855a12f3f1482174f3ab73ee08 | ORPH
  aarch64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/65f12172575606fb3e21eaf278e23a6ecb352658 | ORPH
   x86_64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/5174ec39cf1d25714bda02eabc03045b99b6de8a | ORPH
   armeb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/be615ad3f9ae08b838b31d54895675f83bf12f3c | ORPH
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e1c129e15f92b3328be7e5321bd306e586783964 | ORPH
   arceb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/3b91ab71d50f40b3250767f2360d5501c0cbae38 | ORPH
    i586     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b1a130f547acc22bba08d3239926a2604937c66f | ORPH
 powerpc64   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/f5547def2dbff110de1eb4fcbee9ac8214afc757 |     
 aarch64_be  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/77a62570ae5bc6b464330fc30dd444fa70d552ba |     
   mips64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/75037dcceb095f3eabf1b0011a8c7e9da2e71c72 |     
   x86_64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/8a9d29df310e47268431096d16f79a3496b708c5 |     
    mips     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/1333b36309b66b8923fc06b31306c830387e2c81 |     
loongarch64  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/27cf5467a87c7b325ff9b0444b9c49cb75d55750 |     
 microblaze  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/4ac1e013ad54377ebee82347aaa140043d88683c |     
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/5a93bf1502b247d23fa9d909f198b3a0d8759e6e |     
  sparc64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/232103f2bbdfc0ccb3b6888f3ab4ad7038943fea |     
   mips64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/3fd864adc55042de2c32ed4b79805e06f1cfc0f2 |     
 powerpc64   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/c18faa6ed19aae08a64409b3f4f9069d5603d33a |     
   arceb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9c66d7c62fb41454aec8494bb71efab438c6bd46 | ORPH
    arc      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f8be8e3f294ed748b2872789ceaf62f804c08c68 | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a65981c6c66e6ba7321f082445ebaef9256a3064 | ORPH
    arm      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/31f59c1257153c4014b464d19fe39ac0fda57051 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2f689ac0eceb46ffe6cad58a9d7c11d350835c67 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b40fbd097cd7fcb65af49ba219cc180dee43c783 | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f0f1bbdf8e438ca7ba216b82647b0aad04b0f8bd | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/22c5cd0798a687c0bd85c7560f71677766a093c9 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7a1ead536cfca0f03b9db8099eec08924a51f9b2 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/729baa6c12ab64af5b8096dc737603421461764f | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/7051e0bfd19ce02de7a931fc7211ef727fede96a | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/7dc24f8994eb678492c89cac8f7a830e064cae36 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/f0d126a8c5230f8aad6e6370c21a53dd44c5639e | ORPH
    m68k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/11c8e52d9a17dc8c2caae31a8317e507beab3e85 |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/123119e610ac37dad84899d4202d701eaf010ac6 |     
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/7112cc44756fe443a7a6ad0feaa7ab9fdb7cd707 |     
    mips     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/4dbf34bcd9fc2d0716c2de3596d3596e5d627710 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/5a954e6295d1c819ab8c028a542e3b36b2e79b54 |     
    m68k     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/fb3fb3735d0148999e000db44c529fb8024a24d5 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/46ccbf42ab2aa67e6de1d54533d714cf80cea8f4 |     
   mips64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/2a71ec335b19bf8d4e2abeb4d2c8ea22de50810c |     
   sparc     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/f971d0886446e26d33d5e156544163c43ea9afc5 |     
 microblaze  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e0b071f15a9224fb623008a566e5b191dd3870c5 |     
   sparc     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/64f4b93db19f5187ad1a30e5fe88f5ac8bcab494 |     
  mips64el   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/306f47538e0c96871bde616ccac00f7d4943b24a |     
   sh4eb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/16c6ac46d76595c7f6de654c4adf66cda49ad1b4 |     
    mips     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/a809f106013055c65eb772f0714884babeae00d4 |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/518d42e9c5de9bd75e93af9a979064ada2555a28 |     
   armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/c0cf6a87fd9b109a7fb6d3526a2ee53c0ae6848d |     
   armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/5c295abec5efaa48fbffc0cf4a46f1289fe2c3ed |     
  riscv32    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/52f26779775ed1ca5b50ad734df19d3c62510b7b |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/1baf71d30125751d31017ddec8a4b05bd8cd4f39 |     
  mips64el   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/181e03cf0e7b5c2186c0ec57138f3862b86ddb1e |     
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/9d033401e4f60f50c4108304d2ada3b1ea12ebae |     
   s390x     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/38da33713f8f764250768b07c823bac5488581dd |     
  powerpc    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/082c44b7c9548e822ba690febcd4d3d58d8ab25a | ORPH
    arm      |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/d69c58f78323ff7e8b477182c7746b330f3287c8 |     
   arceb     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/bf4d76f26c1f3f07439b9bac3d4267bb1e525492 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/46a4192146805d157aaf2c083f7933f2fc81138a |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/75915eb9afca9795cfbec7dd02fc6b749e760082 |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/d87fbc299036e00ef738d71b1d6acc9394d8c811 | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a62637391a467d0993defd8afaac564c228f6c9c | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fce4dcd73bdecd86c2f39e5f1b5d05eef8596ba0 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6ffe6b488e28adb7ec9eb90edf358ffa08a13122 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f869351c345244dda8a14d67a9a79b3ac16e0484 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3d00b8a8e3bcda1807f1ae727713a6249e5e234e | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ae1ca87cfc1bbaaa9f5ce378856f8644cf425b28 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/035ead368b3fea2f158b5651838617daaafe48a7 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/78d7de418e6d3919975cce814691bd2aab79135f | ORPH
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/076c65bdf146e63950900c755c5d8d2fc994e9a1 | ORPH
 aarch64_be  |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/b16cf8d1272ccbf0617c9dd606d2ab752e835018 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/8f89edb8dee32b89d9957a825961347938b7a347 |     
 aarch64_be  |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/0665a45305115b9c766180b42147dfd917811748 |     
   armeb     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/1a89c3c3060c9d43de6bdbb23840cc387bf9f2f9 |     
microblazeel |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/8cabdcf86d23cfdde2b4f1bc478d71c0c221f846 |     
    arm      |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/6abfa26fb2c045ee84024c618e458240ca064271 |     
   s390x     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/46e471d6313c8195fe72990983c6d677aca7b14b |     
 microblaze  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/7850eda4037bcecdce8264fc0b40f2f823c76200 |     
  powerpc    |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/a65096cf3c0833f5e0060c3e712c4000e59f71c0 | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e6f184d5ef381c83e5d40bdffe49163d069f0b93 | ORPH
 aarch64_be  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/b1fbbe95161ee05ef464f398fdda7f46bb77e93e | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/3f144f796bad80e8c2dcc89dd1bbe20b1dd91c13 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/23e040d78cdf471229c1cada38c7a967d0484e15 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a46d5a931e869feae5bfbc1865e2d610f4d08cd6 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/80649a9deb1fd7f1710d1b817944cb7fcdb5d272 | ORPH
    i686     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/062953718e87e6f7b366786b28e5843155d3881d |     
   armeb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/eaeffc065a83c42f745ee326a20f4a6e50de609e |     
    or1k     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/e5f6f8ca4d8ca3e17c6f9c70376db8605ae3fc52 |     
   mips64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/1f0a0b2dec57b360c25253fd446d661de6f3108e |     
    sh4a     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/f637e7d68d58fe597cff51aa48d7bd572cd91040 |     
   x86_64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/3eb8e6c55fcfc9abe02b0e301bb7381d61ffb293 |     
    sh4      |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/94eddf2e382d26af283c56d0881d0a836c494e2e |     
powerpc64le  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/accd9e0d6494a5bda5c0675eefa313f99d5b781f |     
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/eb2ad9426a5bfc12dd0215027b0d539d8bac5d2e |     
   x86_64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/2ef7c6cc614cb2260857b41ab9f2c7988b6d096c |     
  riscv64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/d2cf54e752c0b4a3ddc5b8e9023ce8aa53723920 |     
microblazeel |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/87b31e03fa36885116f24914075075ce35c4f1fa | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/814f1ed0c81a3c3143deb19ef49f39866507a163 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/efdb0ed5593a9c3834edd709e8c35d3068ba64ee |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4a8142ca350b4e0d9a98bd297f8c183a8ca1780f |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/349a8092ed67daffa6d18512caf9e8affc6f3192 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a5adfc3d8f96a67516ab78772ce1105a54c75fcc |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/7a4478fe2a9a612392d6cc338e155232925cefcd |     
 aarch64_be  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/6fd2c2ba3dfc92cec15ca2b14efa58c49b73e4e4 | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/ee5ff804ca337c80d044b0867a5aefdab2fcea62 | ORPH
    sh4a     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/4bab507e12e78a1f37a3709f84d0a3174cef4dcc | ORPH
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/2470f6df7227fd8fe3278589a5b0c5ffb3fa58fb | ORPH
   mipsel    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/82ddc6821022f89cc9782ca518ebc9fb72158f4e | ORPH
    mips     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/f8e744707ec1d112086e5b13b3a4b03ad03d1cf6 | ORPH
    sh4a     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/bf2b8eed019fb22b18c99b6eb0d6515f685ef2e5 | ORPH
microblazeel |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/57b92d61b274c975b5c7de46fb154cdf5da6bebd | ORPH
 powerpc64   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/aba350937f6d97275948f0e2fd7f0e4e75e9ac5f | ORPH
   mipsel    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/6c555605dab50b7f299223e2cb58470348820f5e | ORPH
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/55d9f74a8a0f054e8d9613370a944e5d573421e2 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e60059aead28fd183db7cf8e75db135c98a2d656 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ca93a0565392a9eb7b8774b3f22383620f959532 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/59b28145552f3df88abed5b12504a6812f6bb467 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/deda8de7a05d32e309cedfbcf3c3ac89f9a2125b |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/649e4448283f5f290e163d0d239cb75fb7226034 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/cb9b8796513f7afb24cb912b05db8bb29d249544 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/208f4b52c145ce69f58119a7a0a5cc2a3c44ce2a |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4adf372a8808e02a3f500dcbf0e4f720a4e6a110 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/38fe01d9defc22b5d9aa704596a883fdda2abe02 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6445068a9ba3192a2d381168cf8961c0be7a9cb0 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2010230a2530cd952dbcdb1cedcf429ed23e33bf |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d6facf828947d7d79d5df926462d91f040347f41 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/89b1eda804479c9bcaab047a77663a15778ff05c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/966fa6d9dbd5c661c321ff767b7fc2789d6181a8 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/393cb7792f0ad589495b470619fe467e18145946 |     
microblazeel |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/b36402a46477287b2e4bc606aae568592b6abfed | ORPH
 aarch64_be  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/c47ca8dbe6604666c8c95225e821fd36193261a0 | ORPH
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/f9fb90c492f4644751cdcba2f38a64ccb80d83b5 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/3eb59f978457ef407135194ff3e03b601fe42c2f |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/b4123a9013ab03c7cf17dacb8766691f9a17bd1f |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/e40bc5ecb1e9b28a6513a1a5f05e8d9027276ff1 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/d4ce8842abd6a62dd7ad25f984ead79cba0fe235 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/2babd9014f2a3be2fd03ee61d2e7c55610c4cf07 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/f2d521be302781d6a14520603d2558856f758182 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/db5793e5059e50f4ea690e1284d8a194ea18faf5 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/23502d8494b16722b612e225b12f8bbaf4ba3d45 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/70176f886c9c5af72ea54778bc027766385da148 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/1cac62965ff6dc1e53d329e335dfaa5e63e6b8e2 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/fb8968455a3df8cbc2b97ca2b22b965eb06205d7 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/909000b053b545107c5647081aff36b00a725d7c | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7271bb9f0f7186422ad4c3c4071901b8ea44331c | ORPH
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9d3efbbd93586c4a9cb049de0c0734dbec1f2377 | ORPH
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a14ee7c3bc0a9440ba657b32e43bbaf560ec99d2 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/95ba5d4a4f298358c0cc1548d6f629aa9e53da72 | ORPH
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/d4aee1d4c9dfce330ffffdae67333b37c9ef575a | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ad4be8d60e4ec5d493f711fc10f1bac1d68168a7 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/11077a7ef86a5c83a9e10b1718607b8af25a9dfe | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d39a130d20f0af33cde5bcf5eed9a9ab7dd7206d | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ca9920ca3adf600248b4523c030776cec9bec33f | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5ea6fbc3a5ab4be0592a4a31386d996a01fed46f | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/14a2b30b3cd791c9f1bf9c1ddb5df9128b42a82b | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fc5b34face69acbc55992c4c1a2694fcdc76d9e9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7bf66db242eda371b203107100bd7d587c35b317 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8b0570df77b5aed62fae3872e8b17a69842ea22f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ccc0ad669d8213f33b18b1c4477d73c8b1635903 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8ecee6503d6dd43085ad5aa5cc5bb3da5eb4beb6 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/77cc30791468d231e53d081df3548842227e9738 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f5d1b0449e734b6a88184e8afb1332f60b9c71a9 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/60724b19d94a32f2f00b11507cb9bc323e63e142 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7f6503686ffbfb3806edb9f48cd7b5b0eee5fe4 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/12455cd3af08bf870e215a1909f5fef16378a41e | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7c4bece5a9996b322c9f96b3467e05f2d857c6c6 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/13336e02d291d51e4b1101aa6ddeae783486e479 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3bbddcdbe676a19216e924e52e69849753ffe942 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8e6afe1769f947a788936ee09fcb91bf91e48033 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2a7909ecf4366c2cbe8fa2a7e70e36acb0ae9438 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5123191ef343e4e6a7fd9f4328dc330709a23554 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/80dffc88a56d1ff395d45fbcd5ec0e011af60d8e | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/08405c26dbe4fb8eecf9468ebd0639b7007980e6 | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/406b7444966236245bb389ceafab0eb037b9765d | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0f8f433b825b2c8640d67fc925a30689e41c5f63 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c58ba9ece3ebdf25bb469922c1f3e8d4e057c7c7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eb8cae32ecad562b679acdeb3cf7b9a3da319b27 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/65d4de455ede2d6db0b2081554ca4fb60badbc24 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/42ce54937691c97529f1385fd133524b6fc4fdeb | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ba286627f7064a589d7a7b12bb4fd6d1fca9b8ef | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f931e281e1c26789170c55301a6b6b3187ebe9bc | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0170a8d0e5b71aa76e8d5494c5590bf5de9c5ff0 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2a3b0f02d7e163063610612f5ff0fb6f2a62e91f | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a98c070bb77dc69c5fb401757667bb5efe014a47 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9b56ee8d3ea99aed5bb3fc8e3655fe7ec45a6510 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d1b923ee516b82e60e6959ace03d7c84ddbb2e4f | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/64087a09bf9a4c440186e0c3c24e6830d0f530fa | ORPH
    i686     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/da070b759eb6a159cad8d9d3073905d09654fe81 |     
   arceb     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/85c33f508d6d1f44fee40fdd7a918a7159696a0a |     
   armeb     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/343a8169e1526bf4f9ca4002088d14671ae50e7a |     
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/82ad5fe01674b51ff2d703a46e38568dd1da3cff | ORPH
  mips64el   |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/e73fc46137120df8e00b4d3bea419d0bd6c1ffbc | ORPH
    mips     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/e06e7f626ac736b0e41c27476bcc98b1b3376db9 | ORPH
    mips     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/93b84e395270092b79696d1b427a002d88a87920 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/cfde8a6dcd42eec7fc57347b10812e8cb6a522b6 | ORPH
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/d23b561f1c6e85f7125416a966e7657b5e0142af |     
 powerpc64   |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/51fa04d0139a7ab982ed6137c247ca116f7264ab |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/2c3764c58e3d4dd6570d0d008d627c364fc90695 |     
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/a77e17e9ba8d94bfc1a910550d5d2c1d8ff51992 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e0931617fe453e9af88bdf0f31678496303c78fc | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5a97674bfed59dc35d66d881cce6914803a63625 | ORPH
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ce591e4b47d04a16da57624ca02ef2f7d0a523f3 | ORPH
   sh4aeb    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/b0a6a474b56a38be00eb199b09c93fac6364db8e | ORPH
 aarch64_be  |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/7f4b3e632a5de67dec2624a2097045ec4d767246 |     
    arm      |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/1ce1a3af8d4d9ad343b27972f1ec70f73fe6bcd4 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/fd34835c71434d17e6517b0f965efe74f7381053 |     
    arc      |            jose-14             | NOK | https://autobuild.buildroot.org/results/a340d17d269b26d7e2f1bbd219079fe2606c7680 |     
   sparc     |            jose-14             | NOK | https://autobuild.buildroot.org/results/d1662ebcca9595db3515c24311b01b2cde3283a0 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e0fac32279b4772083857a91d501ad6e12d93d36 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5800d9133105019e373fd635b0af745a2a7bf395 |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/367d6e7e00a900365c1e817d2d166b800237b2d1 |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c741e694dac32f9ab7f470fd43bd3d8de43b1e63 |     
   arceb     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/27cd7dc6d7a4e2d020eb4195ce36aaed7993b25e |     
   mipsel    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/06d210ea45af1c44a78d591bfe4a965100f82536 |     
   x86_64    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/0a393f8ea02eae8717e6344ac4ecf01315a20b0a |     
    m68k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/6cb5a5d8cb06aa2a8a4e8da903af1d7ce9e41efb | ORPH
   mips64    |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/ac2943ffbb95ed9f7f8c191cd8c02965f5420f7f |     
loongarch64  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/270a62d939f79cebd7250409e97919ed4d8ae89f |     
   s390x     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/97f4e4f5000ab27bd21554c6f94562676dd1e677 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/705954f55bfea78d15ce7b094b8de067816b423f |     
   mipsel    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/12bfd9d8f3b6db7233d1bf38a64ac4dce9e21779 |     
   sparc     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/c700645eb6294e25a2b8724a19051374021f7df4 | ORPH
 aarch64_be  |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/1a25118dc74506bf56060bbd2d216fc03a80fd2c | ORPH
   mipsel    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/fcbe5619960b459a323ee8ffed8061856d19307f | ORPH
   mips64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/bcd0fb9d53e5bb02e7cfdf3fbe9438b241d6672e | ORPH
   mipsel    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/e4459f809dfe33aec07329cea30a10a5d30ded9e | ORPH
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/64d9373f96083ade7ee3d59f0542424394bff1fd | ORPH
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/04a085f0a01ce4559c21f871bef7d7e5cdac0729 | ORPH
 powerpc64   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/a69dc08a9deff6e49c2bc8dc17ba4ac150707bbf | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/5b8bbf0fc3de33fcadef0678783fffdaf60883d4 | ORPH
    arc      |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/63ea71bacafe50b5ffe94be5b22b5bd550e9879b | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/393e75999eaea73e56f3b7dce9764823bc058c69 | ORPH
    mips     |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/9aaa99deae8d041192058c23ba3bbda8e2c6657f | ORPH
powerpc64le  |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/43489689d5ac13cfd6db976fd192f82be4da8acb | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/36156d567ff030a9e969566ea4d6c8917ccb8e74 | ORPH
microblazeel |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/8af4d93eaef85be1e799896f3210bfee6675db60 |     
    sh4a     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a71a3ca3d1b52af12ce6af1b24e98ab2e05d5ea5 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/05b1ce549282ce0040e69c2bdfc1560f37e5344c |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cfa57a02db710d9737c0db581a53c8b639e9d270 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7e0952d326c1ba6c98a1bb9be4e52e1e0725c752 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a2bec63b6a216e3b4a4f79e7ed3ed52c39f8b7cd |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7a4dfa2c7e27ecefa6f6788459c78203588019e9 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a3a9d514c4c1ec6460fc3f1d59f3531891b35e03 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/dc79ca6b19ec523c88863123302da3b092c9bd01 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7dbf48d9edaa5c59f180be932c02e9a2cb4a963a |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/928175b82a55eef67c8b970cf920332ab6dbf923 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/caa8d30ac2c75c55f40a28a42bb4b92b5cf063f7 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8e2295da565acefd9f08d1a2b7b634090ee61250 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3f9d515ee382467e8f517a84baad3d8c0db4170d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9cc96cac615b1bcec2f4f33eb791a3ed5187c1c0 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8c6cd96fa0c24f5324a3848ae5ea6c35bfafb568 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c5292ea3f0021b9fa0ebaac30c6ce21ecb43a59b |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/aff53a1c3d4acec3c368afe499288a3188d0fe60 |     
    sh4      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/63688953c572e9a41595844bbbbd63b9de1a7a98 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8ce56648c564a34cccb2b34e2de47cf9f4fa66b4 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/eb31c74f45885d1b8020bf5821e284cdbab75052 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5e278e843c5fe6fd398b84eb869decc932f76be2 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a631c482e708cddbd6bac3b67d2b7207c6fc77b6 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/d1d29e692c8a167e428b134e1b39c874b7982607 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/3ea6fe01d9540158d3085483616484e63d5ec8ee |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/0a4fec36a4b1ea23702430d28f388a673e3edc93 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/1ecbf8b183d828d6dac9a41f2b9989ef4a52d8d5 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/bf2e235f2534f8fc3d3dce99fd452d83cb6e42a8 |     
powerpc64le  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/27b91f384a23563c3b24b62b432ce9455fff6dce |     
  mips64el   |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/040ff88f9363893570169aab32c67f6b83ee15a5 |     
 microblaze  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/f41ff9782ea5c66779e0c67298d2837866d6e55c |     
 aarch64_be  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/1dfca8ae5761e48c07986ba227b9627196049672 |     
  mips64el   |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/5076e29fcab270fca7e443246dab6687700ec43f |     
   s390x     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/7f4d677c54892c29b53e5b92600ed8bafc051bf2 |     
    arm      |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/23d381797902ba7c9c936df9afd50e84e699634d |     
    or1k     |            libsrtp             | TIM | https://autobuild.buildroot.org/results/e77d7baf2f9d4bd4246121e9f8b99dbab76c6336 |     
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/b4e65cd58106c56172d6ff04939a29070d21a567 | ORPH
    i686     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/3e05ed442b9d48cd0bd35a69e34e8088bcd1f7ce | ORPH
microblazeel | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/8b2d48a10102aa930a408f8bb71db09635371d95 |     
   sh4eb     |        libucontext-1.2         | NOK | https://autobuild.buildroot.org/results/075883ce1bdcf3f75c20b0eab2c76d1daa9e5022 |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e2a599c45aa053abe90c8617350ca52dc43b8629 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/16f19c927d008c3d92d4fd4d039263896596995b | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e21c70ac16d967478b8cfe5af73d9cb8ef8bf742 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a53d9757a8b7f920f6a8a4a45c5151e3593215ff | ORPH
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8fdd9f2a2635e84b90a01e900649ab00c1ef67bc | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/443bcf5e89f59c30413e5dfca0565570ddcf5140 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c8df3215d561e4de72f95659501574675dc2c1b6 | ORPH
    m68k     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/73053934823e840ec0f9753ea85f88b22c93001b | ORPH
    i686     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/4740cd9d5eb882cb141cb77768e879446a402f3f | ORPH
    m68k     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/f1cc3348a8cc08ed608ca730bb7dd9ec070dcc71 | ORPH
loongarch64  | linux-headers-5.10.162-cip2... | NOK | https://autobuild.buildroot.org/results/31b79704dcde220faa8fc3ba7e7bf0f085de97c4 | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/04b1f609c6ee7a59aa0245552b43fb16d3611a6f | ORPH
    sh4a     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/d168c5721668221a582258c3464e3d75e6ad1556 |     
microblazeel |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/1bd0b65d56210d8fe37ad110ef1d548c42cf5afb |     
    arc      |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/15c36a6880c3d401d383c71fb4910f5fdeb76105 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d5530fefea1f09c0513957689ae2cfb74ac9ad27 |     
loongarch64  |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/e3f1355bd640e5f1f9ef6a038d1f6cde118e54f4 |     
powerpc64le  |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/3030f442fda00243fd6a734afb4379585ea379b3 |     
microblazeel |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/6f4b3e038447f1fe33e713135025cff72810f976 | ORPH
   s390x     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/380123e8cee67b01a308b5e2f4a37afc4302b77c | ORPH
   mipsel    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/b090e0f2bf6d5a0b88da6b587e832ff824a91895 | ORPH
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a9c1874a9f7cbb0be66088d13da5c6350f402737 | ORPH
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/dafb052a845ccd160bdefe655b0c202264357633 | ORPH
    sh4      |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/c14b363a491a730affb396433423eb1e9c84570c | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/badc9b9b81f884668d05f4de2a2dacd85fb9db3a | ORPH
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/8a47e9de1ecef45d8ac7253b79edbbd4bbc23b6a | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/81528194b9f5fb10f9a107535131cb3382294191 | ORPH
  sparc64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/a1e69d674adc53e70b9a06f796b3b258ceb93d7f | ORPH
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/878d4cd83104dd088a2960a06840693bc4151ad1 | ORPH
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/4f5bb2483e36e3c5cc8dac42f297e2a420dbd75a | ORPH
   mipsel    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/b97c92948f2030a608cc319a601235761a55741c | ORPH
  sparc64    |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/e092b355e8c5ad52377cc30db5c7b2e461c5ffab | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/b3aebd5ca4dab892e85afe1acc70f538fcdf90c9 | ORPH
 aarch64_be  |          patch-2.7.6           | NOK | https://autobuild.buildroot.org/results/231dccd85af3ef66a0c105d462ee465b9947001e | ORPH
   mipsel    |          pcre2-10.45           | NOK | https://autobuild.buildroot.org/results/fc5eae43c7ce5655c6059df3ec423a0713380aff | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9c195b8cf70b8b05b475bc25d14a1ccca72c18a5 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d16b2261e9211d179673f477ebf4caa6120307dc |     
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c538200138c44a3f4763e4901d3396e138ea34c5 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/20be51d9540ae5a01de117e8a3f316b525e16494 |     
    or1k     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/50467c8a50f1616ea30893ba3173ad7a8be43267 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/340d9c4c519d129dde0e235f39bb10f148b25a9b | ORPH
    m68k     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/f8cd7b2c26c290bd45107cd325491a42376f2766 | ORPH
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/c74784cdc7c2cfa2052ce8c66664ae1a7282f7ac | ORPH
    m68k     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/768bbf56d728a8d2efef9d49f187abb811f5cddf | ORPH
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/61e5717a0b52049d936c3018403949b61d9853e9 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7a0cdfd3b01a4eed67a3ab6c71399ad7aee7421a | ORPH
 microblaze  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/2dd22482fa4930c119f930d2556b3d8afda9a4eb |     
   x86_64    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/f3d4cad78a3590065d4dadc0a6341463b6ac61e5 |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/2adf131d0e6eeec8af6333ec6b050ddaf968a385 |     
microblazeel |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/94f37e31d25d9545127e7b2c527303d23c7b1214 | ORPH
  mips64el   |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/6e5050a5b50ce29d5d509a32dc45084ff65308d7 |     
  mips64el   |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/d505aa639c48223df23613556d6309b4c7eaee29 |     
  mips64el   |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/9ee6dabfd2bd8be24d6cefd7bcfd92fd260b1d2a |     
 microblaze  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/66a1e8c47a178775855757f097cf01b5bd6807b3 |     
  powerpc    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/67514800d9f50066911ce74d559f712b02d20c36 | ORPH
   s390x     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/cf014499b2a51e9e8ae10b34252a926647b9992b |     
 microblaze  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/787a3eb02affbd04165fedd619cec2efe97f6372 |     
  aarch64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/078a8451c789a34d493f0688bab22b3550d3f4a5 | ORPH
   arceb     |         sysklogd-2.7.2         | NOK | https://autobuild.buildroot.org/results/057d16c7c83e66c62034191d977aa5a4a19003f0 |     
  mips64el   |         sysklogd-2.7.2         | NOK | https://autobuild.buildroot.org/results/d4fe63c4fd83421c9abafe8be7a9e66400701db2 |     
   mips64    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/dd64e21ad54a3abf28b5ea04559f8a02bcdd9fdf | ORPH
    or1k     |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/2e3d3499d8067536986142a6fa6b3ed5b973e279 |     
   sparc     |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/612ae2c80e7e60fd5900971983044fca5ea1d2cf |     
    arc      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/2b4b6cba48631e671d61c03b14325b0a916128e9 | ORPH
   x86_64    |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/5eb872a2b6f5ccee68f529569107b9f42b9199b3 | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/7f2cc3d42a51aa21be49ba3b2490b6d36f433ee1 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5b337599715996c4f382213105d206598f36d153 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/549acf18989ca3536b321064bf4464cc072349bb |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/a477e9ff6cf2e9bd31d4c8085d7ce409481d9037 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/9d41b33505fac8b9ab88cac20d2668c2f426ef0e | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/41b7c36ccedd6b54c56464f11fecf277816bd5f5 | ORPH
   mipsel    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/96dd58f4d5470faf1b1448d469a274f3aab08251 | ORPH
 microblaze  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/5e769946053782f17daa86da92dd2873d4c8660b | ORPH
 powerpc64   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/d12a5cde05a9287ccdb9c05e4874b96083a64ca2 | ORPH
  aarch64    |           webp-1.5.0           | NOK | https://autobuild.buildroot.org/results/e8f76e447c32a02f3c11611b1bf893cac97ee36a |     
   sh4eb     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/b0650aa0d6b371cd2bc3100a66765d37575504c7 | ORPH
  riscv64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/b2379548ee8dc820ba1ebda04541b769ee5adcfe | ORPH
 aarch64_be  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/9e84973ace3bade66792d6ed8e4444305d4e58de |     
   armeb     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/cd2e1c3161a8b2aa112d2591d58189e3c9f91517 |     
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/bfa15eeb3728de1ff830ffb4948ec39acfdc7e68 | ORPH
   sh4eb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/84bcc314c693521653ac5d23f63a0c09bbe95bd8 | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/cf516443661105fb25291bb090d9e46065d28783 | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/d787181a9e0d367e10ac5c4185c72b95432b8ee0 | ORPH
   sparc     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/ce9b56406717c59e7fb49489d5000e1d4cada8b2 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/cf5084978e061dcf40628d865e925aaabb7770cd | ORPH
   mips64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/777b7464b37e8ff23b1aaa6a441ac1ad5187087c | ORPH
microblazeel |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/e98cd47dea130899930bbc2ae02114e97c69d871 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/7f2c206f03272bfddb9d0a3a9dd62c302eb76a62 | ORPH
    arm      |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/840b56e236725af2cb9d9b59c8ccb771e0eca79a | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/6a7ebeefaf6ccc6c4bbc44a09835fdb100037d40 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/824f109aa183bc0a37ed8951afad763318f16a04 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/ef826549f37b7017862d08c61ec316adedd7988f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   eza-0.20.19 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.82.0 | 1 
          libcamera-apps-1.5.0 | 1 
                pipewire-1.2.7 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/3274aa69304e287efe1becf7994dcd19383c683b |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4e98c79bd8cf4c07e852890b5fc2f4f473f4eed8 | ORPH
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/5f260d2d02032e73cab9860917c9082fcfd5f609 |     
   sparc     |      libcamera-apps-1.5.0      | NOK | https://autobuild.buildroot.org/results/d765edb804b5166a830a32e07a66485cc20351dc |     
microblazeel |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/5bdc8d90d9febcfdbc651e363bb00e149d55ccdd |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/2367786f2390dca118bf2eb3e21700064797d040 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   avrdude-8.0 | 1 
                  boost-1.83.0 | 1 
             dahdi-linux-3.3.0 | 1 
                   dav1d-1.5.0 | 1 
               host-vde2-2.3.3 | 1 
        liblog4c-localtime-1.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/a7853c308f1b03b97a0f154c18f069b68192bd65 |     
    sh4      |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/1bab307831a7a01dcc39e10abc6c8c4eb2646f8f |     
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/467be4257e2c7067dd176f672f3d2c1db9e95823 | ORPH
   arceb     |          dav1d-1.5.0           | NOK | https://autobuild.buildroot.org/results/b074e7df4f949be24ee36c5c504aee4f34223c6e |     
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/9239c6ba51a933b24808d820c37ef56a7793cd27 | ORPH
  powerpc    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/8dd276ed8e524ed38d80c508580c69f2e1cf195f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

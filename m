Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C7BC3ABB2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 03:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27EC661483;
	Tue, 17 Sep 2024 03:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJUijG9O5ROZ; Tue, 17 Sep 2024 03:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91B2861485
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91B2861485;
	Tue, 17 Sep 2024 03:17:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 171DD1BF33F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 03:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFDE661485
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 03:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTFUC31avnf6 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 03:17:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E693561483
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E693561483
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E693561483
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 03:17:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso824867266b.0
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 20:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726543056; x=1727147856;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1oa2qwzsmgEQbINMYRlm5coPfemEWbecxwYit5jhu9M=;
 b=Fi7AMau+fepZB5Qe1Law4feErft/DCcEMySgIp6UXVgfxaKpY79jUZulLZHQXESrqI
 3A8TrYQhnfoFun+Xl7sJkcFC/5t29lu3kkeAiPqAt2JYwXidnophJo74/r3XmTzkgc/V
 sQ3/zvuWi40AqJVm3LlMHbshh/GWikacHeAmbF2aRcCH1umKm+ZYRZe1otrz/4wgMRMX
 FWnf7v/m9gS3QKFTV9tzo3EjIpG3B0kfZs0VJ5t52ycXnYw4nFMiXaPFZv0JDliwKjVM
 NsPDhCFb/z5fXsNZlgYDJ5SDyqQSEcfMR3Jfl6ojftKsccuSATMroQo5MkKEvVISLfrq
 GMRw==
X-Gm-Message-State: AOJu0YzEUxdBIBGpKorFvzB0L27/Fm6R9mwOrbb+dyZ6i/sUGjJoqLI6
 E4PD35/cj/pXWbvuORtHBt7klD5iTTlb6/QrAf/rhsi52u3mVcOP2HN7ng==
X-Google-Smtp-Source: AGHT+IEbamaYQ9WR28HVzaWUxmhZ5uM7XOwRY7Ek0JvDYt7jvkeXlNB/LAumaag7LOBX4ydMOo9U/Q==
X-Received: by 2002:a17:907:c88d:b0:a80:f358:5d55 with SMTP id
 a640c23a62f3a-a90295a6a7cmr1773435066b.33.1726543055273; 
 Mon, 16 Sep 2024 20:17:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f42a6sm388026966b.70.2024.09.16.20.17.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 20:17:35 -0700 (PDT)
Message-ID: <66e8f4cf.170a0220.c6655.ba32@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 17 Sep 2024 03:17:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726543056; x=1727147856; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1oa2qwzsmgEQbINMYRlm5coPfemEWbecxwYit5jhu9M=;
 b=aWCO6GoJp4nWqxMj7u0U7tFK5XS8j6yAARqrsHvOdZ2kxMX52IR8WyfnrgGlopPSgY
 hIMVSee5k/Z6D/FBU/MsWY6H/Vjocn40v/5xlK4dIEnUqjiyofnaEOOvqZmmwFr2mD4/
 Oejj5kirQMa/SspSSMBCnas+UBbXkOR8P5G6nqK6qHpG9yccvxiygCTOhuWy9pHOF8BO
 iXD90a6JWOTSTOK+k0GrOCGlEpfoqNDOmIe+6QxcfjONg3pFCMhlFSyK3Gcs+CNS5Giq
 fJDMrH8b0NPvLCJ2h5zxGewovTgHZNum7OxiSxPiHqPaW6ZVi6//R8YUVsXyMOeWtEHH
 uTxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aWCO6GoJ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2024-09-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 16  | 14  |  1  | 31  |
  2024.05.x  | 15  |  9  |  1  | 25  |
  2024.08.x  |  5  |  6  |  0  | 11  |
    master   | 17  | 188 |  7  | 212 |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.77 | 31
                  linux-6.10.9 | 14
          cryptodev-linux-1.13 | 7 
         gobject-introspection | 7 
              host-rust-1.80.1 | 7 
                       unknown | 7 
                  bind-9.18.28 | 6 
               linux-pam-1.6.1 | 6 
                 gnuplot-6.0.1 | 5 
           host-librsvg-2.50.9 | 5 
     linux-5.10.162-cip24-rt10 | 5 
               procps-ng-4.0.4 | 5 
           at-spi2-core-2.50.0 | 4 
                    bsdiff-4.3 | 4 
                  ffmpeg-6.1.2 | 4 
  gobject-introspection-1.76.1 | 4 
          linux-5.10.162-cip24 | 4 
            gettext-gnu-0.22.4 | 3 
           host-doxygen-1.8.18 | 3 
              libopenssl-3.3.2 | 3 
android-tools-4.2.2+git2013... | 2 
                 apache-2.4.62 | 2 
                   duma-2.5.21 | 2 
        edk2-edk2-stable202308 | 2 
                   eza-0.18.22 | 2 
                     file-5.45 | 2 
glibc-2.40-18-g564178076272... | 2 
         host-libxcrypt-4.4.36 | 2 
                libdrm-2.4.123 | 2 
                 openssh-9.8p1 | 2 
                   pcre2-10.43 | 2 
                 pixman-0.42.2 | 2 
      python-autocommand-2.2.2 | 2 
        s6-linux-utils-2.6.2.0 | 2 
                    azmq-1.0.3 | 1 
             batman-adv-2024.2 | 1 
                   bird-2.15.1 | 1 
                 coreutils-9.5 | 1 
                elfutils-0.189 | 1 
              fluent-bit-3.1.3 | 1 
                   foot-1.16.2 | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
            gdk-pixbuf-2.42.10 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
                host-go-1.22.7 | 1 
            igd2-for-linux-2.2 | 1 
                      iwd-2.20 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
             libblockdev-3.2.0 | 1 
        liblog4c-localtime-1.0 | 1 
                liboauth-1.0.3 | 1 
                  libsepol-3.6 | 1 
                  libva-2.22.0 | 1 
            linux-fusion-9.0.3 | 1 
             lirc-tools-0.10.2 | 1 
                 mdevd-0.1.6.4 | 1 
                memtest86-6.20 | 1 
                    mpv-0.35.1 | 1 
                nushell-0.96.1 | 1 
               openldap-2.5.18 | 1 
            paho-mqtt-c-1.3.13 | 1 
                    polkit-123 | 1 
    python-cryptography-43.0.1 | 1 
                python3-3.12.5 | 1 
                  quagga-1.2.4 | 1 
                tpm2-tss-3.2.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/91eed84648d28feb0ed46af241835d4a4ff62d31 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/b81810d40991dda70e0c04adc18280b521cd44c9 |     
   arceb     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/22c5b04d8803714088c429eeee2f6c8f348e8cc3 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/285777d1caa82fd1f390458c7cbf3a13c947e84e |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/56d29ab38aae0217270ab547ea687d4e6f834368 |     
   arceb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f751a76e93201b95c8ca3e20a429029ea6edc3e1 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/ff71aedf2ae8ee5b7f205ec55c64326ddb3689fa |     
   arceb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b794468e53e435b46bc0e55f8a7fb21906245c9d |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/5141c66fee334dd56bc98e0e1f2a5c2d1ee6ed17 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/68919d621a9b2b441f752f573d1a3f86f6cc3720 |     
 microblaze  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/8713acc718da6bf77af396b136f0f18fcbdebde2 | ORPH
   nios2     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/e616f7d4cf6a9538a0725969c1b55621b5815d9d | ORPH
    i686     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/15ea22027c22c6a2e1f094911bc2cbcd8460b467 | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/daa57b1314e16c913b1fbbf4b7835e2416852d5d | ORPH
    mips     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/fe5cf9053b05e10784b43c22519b6a9ce15ec5e8 | ORPH
   x86_64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/b553898381ff0fdf5dd705fbb11b469b7564c6e6 | ORPH
   mipsel    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/e692b5461feb8de5c3b4624911c368f03a9602d5 |     
  sparc64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/a97db457dd42c4a9cdf5a25dcd53e2f7a1f4ffea |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/ce6c0c339c8eace4dc4992d0c881b9e84fde5853 |     
  sparc64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c6a50f63644d0d1f535a2595c98cd657fdc5039b |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d27b3fcc398f7e8079ce29feebf6c0d61b268eaf |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/f304bd968fded2e6f8fe0896cbe16c25ebc63f20 |     
 powerpc64   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/78c3f1f14fbab858392f89ecf507da18d4bf5d0a |     
  sparc64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/1349a209389c7decc657e22fb356341299a4c4e0 |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/e7208a3c82d30ae0c49053e19db61ac00855e48c |     
  powerpc    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/01671ec3fee74d0d27ac0125efa0eccf040f7866 |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/3d5c79adcab95011b8ebbc5ec0f0d34f94f2b8e4 |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/b855b7c90c43e09e14cdff5ae51fc99accab4e34 |     
    arc      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2f0a24e44a774ecd7c45d4c769d9204ccd04683a |     
microblazeel |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d514d23734bde3b6da017a23104bb2e02cac4873 |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/641baf10b78185dfae1f4ebefa9ba320c33e75b7 |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c2c2bf22ebaf92beabb25418085ae32dd0f1a228 |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/5c66dbdb960c927dce528a2af4b847d3977f577d |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/3489501315f9bd83304ff84bf2c93eea8d50b1e7 |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/cfb30eeca01d64db74d25ed1d951851247ee4d51 |     
    mips     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/a13f9b4e969c4fcf9f9d9f31a09f72e4da4f4053 |     
   mipsel    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/776a44cb36c32d7881d9c2fac8572d5f93931c00 |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/5f0c69b1c907be3f2b9b275a8ba00c025f1f7f5d |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/7f7ec25b2971425235c617a90f3ecb7f26271c9d |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/e81e0336098ebf1de63e51b39b9b4bb300afe601 |     
 microblaze  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d9322c4646387db613ab06449680e6e7de1a6dd4 |     
    sh4      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/bedbaec32c755ae087bd1c42d082c3e3853674c6 |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/f34e2cb0d6087ca8a1ee7bb9247db740a9f72ac1 |     
    arc      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/32376744674050de3ce993ac5e818ae12d8a46bc |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/78c6a58719cc5017bb7dd2901774dea652c4d37a |     
   mipsel    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/600677e5b01ffc093b7b2910ec1afafaa319c93d |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c1bda5e396d1338d1868b0fe8ede618e787f1c45 |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/1eef3f8d422daf7007a5768ac2e6949c39a6df72 |     
   xtensa    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/3cc9b51c4f1731dd94831348bd9ef15688a7284f | ORPH
    or1k     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/6452756745f23e7e527045b7339ab7f5f4e1cfaa | ORPH
   s390x     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/17247f746d71be5a264b3ffd20dfe97a4adf873a | ORPH
   armeb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/38902f4bc270cee745190c895064beb12b36b789 | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/c7ff82298c0ae17d6104b14f6606112fa571f120 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/fafe6736824a03c3079810b733934a731a1469cd | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/261921afbe31cdc11da1e614c4312568042ad13f | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/f7326312c944cbe78485646062309fff587fcdbc | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/7d1876e2eb704d9b6322e7b13bb3e1b55891bc59 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/860b014ece33497c35e1ef8452f387ac88a6c80c | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/969ab5d7ab5a6a045306530e1e6c73f73b8d6671 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/5131068873f2fd7c25d73b8ae875b3317cc69f20 | ORPH
 powerpc64   |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/2405d9f9966a153fbe5d5d937b25e43dc6785fdc | ORPH
   s390x     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/caad5f5b10cb160ce0602df443e7225f894a6238 | ORPH
  riscv64    |     edk2-edk2-stable202308     | NOK | https://autobuild.buildroot.org/results/09c3eda2c4a4955a628737df3b395a1dea3648f7 |     
   x86_64    |     edk2-edk2-stable202308     | NOK | https://autobuild.buildroot.org/results/32efc5bceb9603c5de29f2ae48c51c47a3d114fa |     
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e508dac891b2ec3b980637c9dfa68a328d401d0b | ORPH
  aarch64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/180e9f2007840267ef4b7c06b69e8f572e9d7ef7 |     
   x86_64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/6a9457fc1883b236bb45e29d065aa356a23232f7 |     
  mips64el   |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/469c178bfd8ef235c89b6e416fb11d161f2d4d5c |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/389f6a4571fa408d6f729f73b7bd15ee3d2f343d |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/87e52a3160660157210d5bc4db31ad0b6c437960 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/11cdf19974164871e6e8df2994d361dbe04bca85 |     
   armeb     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/affaf1f2c653a647275deb6bcd37b1be131dfbbf | ORPH
   armeb     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/c02c4b5fdca029fbd8eb3617f1e82fa7a20cd711 | ORPH
   mipsel    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/50e8702ee01d92841492fb5690bc8a4dab2408ea |     
   armeb     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/63b46b5c6de9235dab7c907827f36d25724a3a35 |     
  sparc64    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | https://autobuild.buildroot.org/results/d4d2b65a46eeeb7a3b80623945744195d8af9a8c |     
   s390x     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/1c1a8ec05060f55a3fe94ce73ce2d043ae0ad01a | ORPH
   armeb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/34899618c204a7ddcf4c172e164ee33a39f8473c | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ea9a4bf74a0037da6f90a9bc3c3ec1f2f43141ac | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/49e279098e287994bf7464db9fdd1c515249faea | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/e87e62e34bf86cd69a1373b49d0531e6d054993c |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/53d5fb7a885468468785943f07584066a99046b3 |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/bc86eba46625d06decc19234575144fa7a1758e8 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/260c2f6ce299584f237d6ebf4d5b0ae88d92f7a8 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/19b91b26aef8a8007cb8e3d0568124a71f7843b8 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/232042ac2ab81dad3c77b05db1b4a2d86bf01cc4 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/64df9181528e7e4c7dd3d7d11fc3d938cc119255 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/42fbe8425d2b026c1403abfcb5270cd8e8cc1d27 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/d0f16a68511bff9802e28841f24b0cfb44a9cc3c |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/39675b70b332dff2ef9e4df2170a7e0959a04c8a |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/b6704ea0315259141f4893b856ac4ab7c091b5a2 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/a587be089fa23123980bf72b1234d49ea4854094 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/bb6713c69b6236cc1de354e1b77173463fc9ddda |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c48ab73dd20cc25be8d490eb6c0c978c98e427f6 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/befc8db0460b1d39336bbd6379ee808ce254e0b5 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/fe0c3e7119e29b98f36f030cf5ef1547fc358d5b | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b3a9485f42e31869cadf6b3f59becf52b0937a00 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/78f98aa9e5e51a6e0b2f13d068e2326e38ee215b | ORPH
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2c6bca60a75c003129818d07f494fb1b4197f1a9 |     
 powerpc64   | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/ac4bf4149abfc4029be9b752b8ed16bfad7d5ce6 |     
  riscv64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/ce53657d147f6013fdeb667ff4b739f928f25730 | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/536ec4fc5712c4db1a2bf13c9c125ea907654e49 | ORPH
    i686     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/b2097459b97a16d7a29ea4d9037be62c2802e439 | ORPH
  sparc64    |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/c292a81a3e9dc236dd4193d0b9874fa3002b42b7 |     
  powerpc    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/6ec6631c36234e98db7670b3aa738aaffb35d729 |     
   s390x     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/359de32e0e61e2b9e7a7028eaa1d946b9de3e467 |     
powerpc64le  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/a477587bbfd6bd690a0e0795caf5d372a0cb50db |     
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/889d4d4f7e817c884da7837d0bc5951500da13bb |     
microblazeel |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/b10d78a6bcdb1f285283d43fc46de484b1b4eb7d |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/3e93d85cb3a7ee801ac911cd783c285be0ce9963 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/3237d8c5241997ca7578fb4669838dafa37d9478 |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/d4ea32b51133c3386e833d26286c17c007272c22 |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/3e2b7c3abb8baff4268b30dc0f38863822942544 |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/3c308af2c2077c4193e07c71ab27e80afe5be6b1 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/4609e3ec17209606eb1e5a5d18e1b16f7d1425f5 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/890233bace1d10fc36e972fa57e1016d97f6087f |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/2fd3f0791d89d961fcfcb781bd0b4f680a6dc50c |     
  aarch64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/adb0e6eb6a33362384ede5785192a72f6a7c99c7 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/8fcaf695a60bf360a39ee0e2a5fda07de82ff585 |     
    i686     |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/a9df7b8ceb17e4f68312f0be6d171972e5475bc4 | ORPH
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/9ff9d70d6bda4f588ea827115ef43358bb10948d | ORPH
    m68k     |       libblockdev-3.2.0        | NOK | https://autobuild.buildroot.org/results/d37be983f0fc0e6348cb60a77a309c0282545b57 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/cc1a198973eacdb000c19041e9017a1b8ca0ad64 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/1749478efa9d2f82744315a77f4fd576d742d59a |     
 aarch64_be  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/864358cc594f26c973e73a8a6f7522b768f3adc2 |     
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/559225a86654adf3e3fc4f36af6961cede134d30 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/702a60806e499b125de5f321e7969d53e745003f | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/42d3df66ea3c3a79933b755ad7317bf3373ca983 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/14c280899b05466ea9ece250d85655073e929791 | ORPH
  riscv64    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/6c43c539b01d71d9d39f7aed59139729e5089cbd |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/633473ea7360755da29cef59d5e1e7ddb550f6c4 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1065ad556ec96969386ec26f09a9897eada50608 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f609dbeb7abc3a4ecff3bd7af479b435475223e1 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/eba16b6eab59ec60a1aeb1308b92a394a9ba83e2 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bf3b8870c230deef5fc36ead87e99ac6f8898045 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f5aa76627f2e83b34baca9665d6e1e9fdb19aaa4 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6a27a577cd9ac688021cbee18374fb9864570346 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/7d843295b0bd49f7c50407fd66b663be109a42c9 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/15992462ec101884fca2cda579ddddb0cd4fb55d | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3b834f8402a74683d816a4fc9790cd8ce64d5f28 | ORPH
   arceb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/934c74ecf5df1db1f2c83a03a6bb4869dcea4974 | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/16e65c862f6ef29c1ba9fb78bd2eaba1403ed810 | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/42277a739234808e1ce925b466d464abf3c6e732 | ORPH
    i686     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/359ab0138aefabc46659b6934b328047acc4760b | ORPH
    m68k     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/23121f1c52804972c8e6adda3c45c4c9e658855c | ORPH
   armeb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/e3c867a80405c67eef72c9d91003e0674aea0f63 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/37fa6a72a07d43e32b946306dc1bb067f83b6313 | ORPH
powerpc64le  |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/4ecf708f8a3eaa4f816b051c18627511c842e70a | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/9aabe995768dcc91c72338192f3878dade91fc61 | ORPH
   mipsel    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/1b04bf039de4c3c84155d04df4c51be5a507df30 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/3c84c45c84bf6bab9fbf783c4ab645995f422996 | ORPH
    or1k     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/47b5aac25e22f56e8942183a5ba15fba1c31c827 | ORPH
   xtensa    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/2a88bfaa982db09cacc78734efdbad84232b6f2e | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/8510920146cd7145063ae240108eb3c079048bb2 | ORPH
 aarch64_be  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/c706eb10db79a01cff3eeb4a875a345114b8584f | ORPH
  mips64el   |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/fc841b7e4098e611c7bdeec9a4003a74c3ab6b95 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/eaf0c82355891a5ec5def0ec11d4aeaf68df4321 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6dcac473e3e90d6b7777eb8bec79394c4c3579c2 | ORPH
   x86_64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/1873c239f859fceeababe13d0b3972af46b10171 | ORPH
    mips     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b7a05cbe3455ccd18c321f5652cb7492da2f6233 | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c3e4d3902c85785b9fcf835c5e8aaa3411c513d7 | ORPH
 powerpc64   |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/0949efa931ad9782c9f9e34f4969c51f2472f319 | ORPH
   xtensa    |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/a565339aa032098b1c2dc137f103167bb37c2547 |     
    i486     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/a424a7bce10095b4ac8b95cca0b27e3da252bbb8 |     
 aarch64_be  |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/08ad24000c51adfbe888be44c414ac82d2f74e6b |     
   armeb     |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/99344e05dcd2e7fbaf26a20cbd724a6c7dde08f2 | ORPH
microblazeel |        openldap-2.5.18         | NOK | https://autobuild.buildroot.org/results/22bdaf4d62d5d3f70f79a7985cf510f6ccf8e98a |     
   s390x     |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/122dbc9ed6cf6fb07d7e0a22a44a7e4b14e80e5c | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/0d9f16a74acd316dbcd674be4745762cf62d01e0 | ORPH
    i686     |       paho-mqtt-c-1.3.13       | NOK | https://autobuild.buildroot.org/results/957373855e74ce107c7c3f71d80c00f59dea8f65 |     
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/af0dc514f23db835a46a7a9177c8e5ceaf533088 | ORPH
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/f03a54136afb05f432bff3c785035c019f814f90 | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/0aa99e90d28be1e819e1e2f5d7ba72012e4c6c07 | ORPH
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/1c03e0feb62f45bbab9f6c045fdb059917cf1946 | ORPH
   nios2     |           polkit-123           | NOK | https://autobuild.buildroot.org/results/c33bdedefbeedf13f825db20d6d3d9a4af8629f5 |     
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0f7054402aa0bea5bd6f36138bb2c01031ca1cf5 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/aed1ff1ffed3a1658c066f1b659a3d528718f87e | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b34f39f83d5b7042daad21a991ef8b67cee19fe7 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f35bb7c87301e9af0a94f19f6d6665bf1f023d76 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/dabfc36a4c8ed648207acde7a5504655c0ebcd70 | ORPH
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/ee4f07b9136cab2b3984ead5c5eda24ed492a00c |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/e5e368a2ad51bff76f97efeaad4486ab7ddb076e |     
    arm      |   python-cryptography-43.0.1   | NOK | https://autobuild.buildroot.org/results/a087c27dbc92c643f607ca9c66977156778ff1a0 |     
   arceb     |         python3-3.12.5         | NOK | https://autobuild.buildroot.org/results/765ffdd39b510bf18d69f33b83d7e79fd87457d5 |     
powerpc64le  |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/552dd4db38c82dfb837c4ab9c6fd33e41b2b7053 | ORPH
   s390x     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/e0683034eb9d24bad610f86a605624d5c43b2841 |     
 powerpc64   |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/77f5e7daf6772705585d07f028a5ebf8e5a1d429 |     
    arm      |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/79b222d17240c407c33abc56fc621ef144a41ebb | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/2ac58d81cb07b03256881ff6427c6d8f552c2e3c |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/65f8ca1b17c0b1db6b5711f52d2f8474f19d03b7 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/fd823fd5fb5ce95f1400ebf312846953283dff4c |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/8d224dcee868c45f5865b3d0c46bd3908c3261d3 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/ba5478478dde0c575d9c7a52a1f882095f27eaf3 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/9d5bdd60fdda28f08ff7ac0a9ab30cc25dba8f51 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/d4b247bc8f687bd2a9305cfa1e0c5d353fc49198 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                  linux-6.6.44 | 2 
                elfutils-0.189 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
               host-go-1.21.13 | 1 
           host-systemd-254.13 | 1 
               ipmitool-1_8_19 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 openssh-9.7p1 | 1 
               owl-linux-1.0.7 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4533b0dec498fa2cffddcc29156108cd8245bd90 |     
    arm      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f4816b28d5bc749bb3157b8fdc35a55b7f12971a |     
   arceb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e8782865eed070752c8c2fe8ee7016fa0b2a31c2 | ORPH
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/4e92725a4f5800f68654edc6c29f467077e830d9 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/61385df397e1ebee00b3514d594e064d8fa13acd | ORPH
  mips64el   |        host-go-1.21.13         | NOK | https://autobuild.buildroot.org/results/e1379a7930e4022157a1a69685088e9548aac022 |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/b0f7d6d11a0d1e8e3e6a4d1fa42bf4f7bc5abf48 | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/02891875dbf285fabd1e681a6a92c2d9cb5f8538 | ORPH
  riscv64    |      host-systemd-254.13       | NOK | https://autobuild.buildroot.org/results/d1b38842ea3325bc5169d1af2baba1748a04dc9e |     
    arm      |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/3bf61c237e37f0395e24cef0185bcc050099ca39 |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/38a12619434cf029a3a748db33a4efdfc58bf4f5 | ORPH
  mips64el   |          linux-6.6.44          | NOK | https://autobuild.buildroot.org/results/c8b72d42d01822549df31b2611fc3b8d360e661b | ORPH
   mipsel    |          linux-6.6.44          | NOK | https://autobuild.buildroot.org/results/0412b21eb531a8cd8fe8cb22c06132c4f25b942b | ORPH
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/c014b84f2ca5d647bfec90c82845e8844f4706d5 | ORPH
   armeb     |        owl-linux-1.0.7         | NOK | https://autobuild.buildroot.org/results/6457c7228db097bf90620b291356c21a7208b95e |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                host-go-1.22.5 | 2 
           crucible-2023.11.02 | 1 
                dovecot-2.3.21 | 1 
                  ffmpeg-6.1.2 | 1 
                     file-5.45 | 1 
firmware-utils-86739f2b3ae9... | 1 
glibc-2.39-74-g198632a05f6c... | 1 
         gobject-introspection | 1 
      host-riscv-isa-sim-1.1.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/64bfc573120e32ac849878958f6ba7ff02145531 |     
    sh4a     |         dovecot-2.3.21         | NOK | https://autobuild.buildroot.org/results/c3a71330c128c5409791f897ea4c22f20171ba1b |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d71ae936cf15530f4ead18db479dc95dd20788b0 |     
    arm      |           file-5.45            | NOK | https://autobuild.buildroot.org/results/4bff64c93c57d2a540c4055306ae2ff448c36e4e | ORPH
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/c49d337013e35d1ba6990c7606446cc73a18026d |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/a4c0dd3559ed0d93d928465363f74917114cde56 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f1aac1f4dee866913846c024037c725d4ad5cf7e |     
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/86d64d86e1ef5b0da0e208d335352af9efedfaa0 |     
  mips64el   |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/e8046c9f6f8c72f0ac9816872beffe83baf1c060 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | https://autobuild.buildroot.org/results/434b9fae332374f7d36efcbdfe19d1c29d376fe7 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                 gnuplot-6.0.1 | 1 
            host-ccache-4.10.1 | 1 
     host-moby-buildkit-0.11.6 | 1 
                   ltris-1.3.2 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/6ceb664f980d91ad35dac48d30b49d414558238b |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/69245e320c51a4d6e0629aabc452f2bf5af159b1 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/bbb972f67be90ac0455a0f66dd4734db15fcb1e4 |     
    mips     |       host-ccache-4.10.1       | NOK | https://autobuild.buildroot.org/results/9c118c3692867a1160803baa7e2ada71b4673d7b | ORPH
   s390x     |   host-moby-buildkit-0.11.6    | NOK | https://autobuild.buildroot.org/results/cb122c34be647d889a422c8849a2ada1074a6ef3 |     
    sh4      |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/a9d20a8d7ebea35f0ad2ed5d4922dfda74ecff38 |     


Gitlab CI results for 2024-09-16
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917061  | ORPH 
             TestDos2Unix | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917504  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917516  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828918755  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828918756  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917525  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917540  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917555  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917585  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917372  | ORPH 
...emSystemdRoFullFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917374  | ORPH 
...SystemdRoFullOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917377  | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917380  | ORPH 
...yfsVarBackingMountUnit | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917383  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917388  | ORPH 
...mdRoIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917390  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917396  | ORPH 
...nDbusbrokerDbusFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917400  | ORPH 
...busbrokerDbusOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917405  | ORPH 
...pdownDbusbrokerFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917408  | ORPH 
...ownDbusbrokerOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917410  | ORPH 
...stemdRoIfupdownFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917412  | ORPH 
...emdRoIfupdownOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917414  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917419  | ORPH 
...stemdRoNetworkdFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917422  | ORPH 
...emdRoNetworkdOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917425  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917429  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917432  | ORPH 
...mdRwIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917434  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917436  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917439  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917795  | ORPH 
                 TestNmap | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917897  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917926  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917934  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917991  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828918146  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828918093  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828918104  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828918180  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828918207  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828917175  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828918245  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7828918307  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

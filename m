Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E726CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 04:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6BBF84093;
	Thu, 27 Nov 2025 04:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIo3oWh0Hl7Z; Thu, 27 Nov 2025 04:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D40984096
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D40984096;
	Thu, 27 Nov 2025 04:21:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69ED3967
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 04:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50C4540275
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 04:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfNIXvExBoCh for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 04:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A78C040255
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A78C040255
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A78C040255
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 04:21:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-429c7869704so397448f8f.2
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 20:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764217262; x=1764822062;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lm4tAJ2Gfkuse44lCNn3lo+6iGJusG0W5OS5xms+9Bk=;
 b=i1fqiVHbT5OFLTo89bQoj1MXFZdweeEv/TFP9JVCV/egdM1d1Eq9esZbBvD8ofMyQa
 ZnQFxXKzX+s2N3ocY2M/19CLIp32mYfDAXmHIObSHAC4cE+nd1jBF82rVUIoFGQH4hEI
 MzelqcurXu7dHEz+1z8OfwWF0apQPKeEEQl5LFvu9JNab2QRtHPKTdr5h5QKOgXZWuqE
 NMhse5n6KCuAau4ZMdzPROGcfABfVHazwshHfjY80sC5J+Z9PcQrC1sTJVnwX+Pfm3lT
 46g/PSPp2ZHTvhxez19no3WDOsJ0V/SoRekaWidmaeCSm43N2pU6Hv8u1xFtDxp5sOtx
 vWPQ==
X-Gm-Message-State: AOJu0Yy2+vZZLhkKk6hL5d1SiLHVXAbFZFmfjWGCS7zr3aX44kmZk75u
 g5rLsJNp3zDmxM/1oPQYFj6mjz530qQfYq2GT49yLqjqRqW5uekEDV+wMX1+RQ==
X-Gm-Gg: ASbGncvCUPvo5MoOhbH3zpY6OiMA3HLBca5mBGwKPn4dcfZgEi3rAzlozNjFoBQLA/n
 /GTTwvFKBkWfxyWJ5H985/NteDQssWr9yvffuXGwnhyrGPOr5W229FRjwjGX87T+eU2LxsYV6r9
 TKOZcVPB0DBKEn26e8g9yeqyl2/7QO6dcZoebBSNUsSA8WxF4zH60PmKL1gVyBwmN33uxZJe8jN
 9gMyVtmbQVLsen1sw64mRZf8opnKlUq30fMG47WG5PTBzecF9Xjis9AxCKrHu5n/O+EaC6pZj0y
 7L8Ch22+yl4D1xNswDDUqLX87yZFrH107Et+5ZlLB6RNL2BQB2taVtFoheyqp+AeYczNmFaB2ZD
 bXRqcjhnd8KjMDkX85guRqCORy79tk9FOUPPXrhapcFg+7X+8AXM57N3/1DxfzoKkBeNzDGdCyK
 eIXE07F/7fwtfarkeJUw==
X-Google-Smtp-Source: AGHT+IEPuIS0cPHOb9eh0PDHn8GSzZTYU3LZKv2uTuJMVHnNJOYwzElQTS45TKDRIPqg02BXqaW9PQ==
X-Received: by 2002:a05:6000:3106:b0:429:c709:7b58 with SMTP id
 ffacd0b85a97d-42e0f358b03mr9852023f8f.50.1764217262189; 
 Wed, 26 Nov 2025 20:21:02 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a6fesm992218f8f.20.2025.11.26.20.21.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 20:21:01 -0800 (PST)
Message-ID: <6927d1ad.5d0a0220.2bf627.1b1f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 27 Nov 2025 04:21:01 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764217262; x=1764822062; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lm4tAJ2Gfkuse44lCNn3lo+6iGJusG0W5OS5xms+9Bk=;
 b=C5CL6111fp61iPOW0q3cIpw0EotMs4iWHUgQ5iwp8gwX8pNZiCseHWiQsJoBpJB32s
 xs8ZXITlzsM1holdC3LPGRv9F+I9YgLSTq5ABTWACdbSdTIqUcWtRlKTy97hBAUfk7eV
 B85l/rJljDN1tUNXGy8oYDmncvRd70Ee10HrE2PuIU0fVtgsRcqdOBGuDpgknor1MnLd
 wiNiWlVv+tHqEe/liHYB11In7rezLrXniTRp57uIPzKz0ew3Si7DsddrPF7Y29ClRSyM
 LW69waPi57YVPfjPlLLWOCwmu9buwWk+01IsJihO7atJDtjqdDVWxcYCgSZDaf576Iva
 /+Hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=C5CL6111
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-26
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

Autobuild statistics for 2025-11-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  7  |  0  | 15  |
  2025.05.x  |  3  |  3  |  0  |  6  |
  2025.08.x  |  1  |  6  |  0  |  7  |
    master   | 39  | 74  |  1  | 114 |

Classification of failures by reason for master
-----------------------------------------------

         linux-headers-6.6.117 | 6 
                     kbd-2.9.0 | 5 
                       unknown | 5 
  gobject-introspection-1.84.0 | 3 
                  libsvg-0.1.4 | 3 
             libgphoto2-2.5.33 | 2 
                  linux-6.17.9 | 2 
                memtest86-7.20 | 2 
                    mpir-3.0.0 | 2 
                     unzip-6.0 | 2 
             berkeleydb-5.3.28 | 1 
                    brltty-6.8 | 1 
                 c-icap-0.5.10 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
                      fio-3.41 | 1 
                    frr-10.4.1 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
      gst1-plugins-bad-1.24.13 | 1 
                heirloom-mailx | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.2.0 | 1 
                  iozone-3.508 | 1 
                jemalloc-5.3.0 | 1 
                 lcdproc-0.5.9 | 1 
                   libcap-2.77 | 1 
                  libite-2.6.1 | 1 
                  libnids-1.26 | 1 
              libopenssl-3.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                libselinux-3.9 | 1 
        ltp-testsuite-20250530 | 1 
             ntfs-3g-2022.10.3 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.40.2 | 1 
        perl-xml-libxml-2.0134 | 1 
                 pixman-0.44.2 | 1 
                     popt-1.19 | 1 
          powerpc-utils-1.3.11 | 1 
                python3-3.13.9 | 1 
rtl8822cs-0ef9ddd619d2a386d... | 1 
                    sdl-1.2.15 | 1 
          sphinxbase-5prealpha | 1 
             strongswan-5.9.14 | 1 
               syslog-ng-4.8.3 | 1 
                tpm2-tss-4.1.3 | 1 
               valgrind-3.26.0 | 1 
                 xenomai-3.2.5 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/76ceec9beafc89c844422468ebc36105ba044286 | ORPH
microblazeel |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/b86b5c44654dc2a6699c4ae1326c0b5c74065a4e |     
 aarch64_be  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/09c1919d89974a6cffc63fc8d75c2476e7fd36a1 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5152a199bcaae9332e4afc024ced21d8c7e995cf | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7b46cf55fd771e8f53cf9f453c71f43417659a30 | ORPH
    m68k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/7beebfbbb9ec2a5a655de334b7d59ff3e9b642bf | ORPH
   mips64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/8cb26cd6ee878c6ba6a9a09fa00fa1bfe38fc1d1 |     
   arceb     |           frr-10.4.1           | NOK | https://autobuild.buildroot.org/results/230aa9130d196881385f5f9e498665d59e550be9 |     
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/07a002173dcb898c64beb2ea1c8ecfbb296a4356 |     
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/23a2d91191e36422cced9c2bd963f223e92dccfd | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a620f5984e524924597248466f84de0b988a0865 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0abe998c9a3a38bba2f82130661200e52db2b9ce | ORPH
    or1k     |    gst1-plugins-bad-1.24.13    | NOK | https://autobuild.buildroot.org/results/17e3dac016a08da8db58d735d0f2d3acc259f81f | ORPH
   armeb     |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/d859b56b501472250c87d2d6c9c8c4afc14f42f9 |     
    sh4      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/64623c3f4feba39252132e742ec80f9d8e2a2e68 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4f2df527ce205e41d8527e57f0746f230da1d3fc | ORPH
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/8d4aca8ce4b01f08bb022393449def21cd7c305e |     
   mips64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7b8105dc1e79aa2afc8d2e85bb3c8d52c4831fa7 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/378fcf7d9dc172e3f3bb52f37ec02c3ff49d95f9 |     
    mips     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d84b235779b632990cc7787ef9f770d096f6ea22 | ORPH
 microblaze  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/bc3874ade9c6246ea5f2c817f117391e23f6a705 | ORPH
   s390x     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/783a8c13291040327e8ddc12c40c97caac99024e | ORPH
   arceb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/2f4712a4f7a95c1ab8bb462d4e055b59f8dae405 | ORPH
  mips64el   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/f90a74cba7eb32c75e5663ddc09f92ba4ecad5c8 | ORPH
  powerpc    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/a7bdb01a943998bae610ee222df84dddbaf5b11e | ORPH
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/e73f3ec00e50b4ce94e3de194890ebe78cd97126 |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/bea543c2fc8fcafc7d2ce37051c30e33e95cfcf5 |     
  powerpc    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/b3a432a96f64257c8d6988dd37345f91611c1f86 |     
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/3d318337c533312afff88a24a4a7845f0179d8f8 |     
loongarch64  |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/f22c8954894ab9ca57df07571726140c5bf3499a |     
   arceb     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/1fa64ac4479e3cd62426a3b919cfbb8f5fb00a58 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/843794912a721ab7556a4d91661e64ea9729bb3e |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/135cfe07d149a6a2ae782bb2d8ee8a802e51e490 |     
    arm      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c959ad0e46b7673a590eec69a5e8a8bb1b1d9adf |     
    or1k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/a176be50e9ccd5d86bdeffea3bd2ddaeb6f36ecc |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e148450e53a6e0f9fbb9508ba16b7679ff3711f2 |     
loongarch64  |          linux-6.17.9          | NOK | https://autobuild.buildroot.org/results/cbe257dae0045aa47427065fe9d10eaed5610dab | ORPH
   x86_64    |          linux-6.17.9          | NOK | https://autobuild.buildroot.org/results/296bf338f8e10193a9baec8daaba5f1ee780e19a | ORPH
 powerpc64   |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/5aa65e053b827e4d5c21d4cc06f439f1dd093053 | ORPH
  mips64el   |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/37913949e7d93551e0f346c2f0bdbada64cf1860 | ORPH
   x86_64    |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/c18d871215461bb76ffaf645f545df48643c39d8 | ORPH
    i486     |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/1eef27e5f59415c2aa965d4127958be35f599dd9 | ORPH
   xtensa    |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/070997c7c2d97c7277320921b7658ebae6016865 | ORPH
   mips64    |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/dfea31433f470939a926d276c51331440216d33e | ORPH
    arm      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/62118ff7cf6cae2f696f1393645dc633d2409ff5 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/135f24f4f56455f5eefaa40fce5100ee3e943b6d |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/dbe06100250da4451b31fd0498c25838c0e96a2e |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6afa0b551cac742f54d0c897c1945761055451ef |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6e166de1a162bc7dffd5fe7d8653ae03b392c5b2 |     
    arm      |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/15be2c3d645064a397f5b7e7f9d7786325dd423e | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/06b036b016290bb80d4e9c82359ac79cf537eaa8 | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/82219d9224c438eca8108133eac7bef38950e61b | ORPH
powerpc64le  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/444400138cd8db4a0b5b708c8fe111c6ac1d11bd | ORPH
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7d1b285e858e8b418b9511bac23f5aabe9b8eb50 |     
microblazeel |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/ef7b3439d28e4eab715010fa8c483805040ebdc5 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/270306b9bcb072eab9892909f1ac7871e81dd80c | ORPH
loongarch64  |           popt-1.19            | NOK | https://autobuild.buildroot.org/results/40caf78c94243a8bb8712a86fe6b3f70abacb904 | ORPH
 powerpc64   |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/407a9dadc4f6125ba089662695966a76718cecde | ORPH
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/3469bc22226d3504fc94a10da6cd61672a298f9f |     
   sparc     | rtl8822cs-0ef9ddd619d2a386d... | NOK | https://autobuild.buildroot.org/results/ef161583720ade2b996bda23795a7a55cf703782 |     
   sh4eb     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/ddd438102a91f2cebe648763f2b9da248a7c6ef9 | ORPH
    arc      |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/79a88aedb20131b8a2371af3e1ab2b50f5c9bf78 |     
    sh4      |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/a0cac9ae21d0d5456f62edb2bb4ac387a128699c |     
powerpc64le  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/83aa821dfb01370f827d2ed63c1e99c6891c2fca |     
    mips     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/7576632fab98321aef72fa3fb3df71ff88d1479e | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/5cf1b79cfd46ea948238978e5fc0765e25556b60 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/e5614ee93f12d0e57548dcf3620ef90b816da1eb |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/664fdca053a830c793880ee1f6a957d28118cbb6 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/a54d68dfbb840bfd6f1c373e83f1f935c1c72b68 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/c9092664c154e883bd518e9168cabba06a7d5416 |     
   xtensa    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/da6c14d6e04a2a929393f3c9434a84868d49e6b2 |     
    arm      |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/d1b58abbc1442804bfbd851e3f1fb3458c4f6a01 |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/17dcfcc239e38bfdb0315698f4efe061c51652b0 | ORPH
   x86_64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/665862237f6baf219dc7d4fbc49034839af3d0d9 |     
  powerpc    |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/aa372b81628b103a7d56cd9aae986d9c7fc40f9d |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               asterisk-22.3.0 | 1 
                 c-icap-0.5.10 | 1 
                enscript-1.6.6 | 1 
                 host-gdb-15.2 | 1 
               libconfig-1.8.1 | 1 
                    mpir-3.0.0 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/17b26cef3fa0561fee3f2f547794d1bc802dc924 |     
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/541b95e75ae9936706e7170226872653b32e7e15 | ORPH
    or1k     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/3ec4e3c2bdcf9e38bc2c1b46a4bd4db87ba945cd | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/31012fad9ce8c07c24ae9ea7417dffb9932c0e5f | ORPH
   mipsel    |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/b21561a37673c60fcf5b7216e6ca6f3fe2bdeaea |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/11fa1a698d4919fd7cf2fd18e0d65f181746a900 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             docker-cli-27.5.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
    host-mender-artifact-4.0.0 | 1 
          host-tipidee-0.0.5.0 | 1 
                netdata-1.37.1 | 1 
package/wine/wine.mk:347: w... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       docker-cli-27.5.1        | NOK | https://autobuild.buildroot.org/results/0b2121aff40206d43caa33f512f082fb9ebcfbba |     
   arceb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ddccb5f483adedf6406e7f9fdc2474aa9b6006b8 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/54b1bb61c2a11ec2375105385a02adb84f5b2e6e |     
powerpc64le  |      host-tipidee-0.0.5.0      | NOK | https://autobuild.buildroot.org/results/cce1ba418fca23519a3eb49fb4e37655c8918792 |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/3b37283dbc51dea4a727b5ca14393507fc738191 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/27c44cd8a1eec55fd9219b5e99eea94d97539ba1 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/a08e7ad1570c1f44c1949ada1452312137ffa989 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                  ffmpeg-6.1.3 | 2 
            gdk-pixbuf-2.42.12 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/a683159f8f40974c971c918428d76b49324652d3 |     
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/369326b13b5df5ef529124725ed8b4a76a3cdc36 |     
 aarch64_be  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b42cb86491e29154da0970b43cd5b7bed8751521 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4CECCD19F
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 03:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED3136069E;
	Tue, 21 Oct 2025 03:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T54OjojqHxGx; Tue, 21 Oct 2025 03:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEB1D606B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB1D606B8;
	Tue, 21 Oct 2025 03:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1A7A43F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 03:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 886CC403E0
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 03:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVzVZ-ND1LBc for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 03:24:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD742403DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD742403DD
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD742403DD
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 03:24:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso18057075e9.1
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761017066; x=1761621866;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2z45Mcc2v7/ej8Mt/1H/AGOG9TohZTrB6f0d4i3iXkk=;
 b=q3iwdD9Xq04+FHTZJAE6pAuNK88qF5aFSVRt3W5H+XZzRks8wSTncFSDUiB11jSAfh
 SRKCF6Yh91dhghBH7vGPVFORH19r7IszM6p+GHZRv58Kz3/vuSu49b6AN7VC2CMRLvoW
 rK4gC+5W/2eMaoLBCJam1rEBdqDtTQkpjpYPFWl/neopKDw8bKSElHDND3Be3YJYkQA9
 GNogETi3gkuti4IzZIFxwMIRrBSLWIZiZjm7u/wMiFaQf0oz+2CmkeEVIsUFNpBGs/Ip
 JSHyzoQ/wOwtudVZJSRWjL82OIC9ZKvi65FTxy5qPcfQdzS5Fm9j3NggeqZ8V+Uc26qW
 r+dQ==
X-Gm-Message-State: AOJu0YxTTBLeqDGjI6RrqkVNAXLAVx/SIkOYadgPTh8i6zkJQN/rr+gM
 Ho54z2l7QUsJDFn9KFNNsBq46UxeAD0zQ99Ibht1BoZHk8oTNi5+owzMccktYQ==
X-Gm-Gg: ASbGnctaza5ihmg9qHqJ91RxlDulEP4a2s0AgMzUlukmahFjjfcQ92VT9NNtYbIK32V
 A2puqjRqHnv6WJ0yaNW0OoHTrdZVKq7/WPoKhqxC4MFiKrsqzbH+ubYUy0FctC/AUpc31SzHc7c
 sUofboHEZVwzFNUzeM+/xSU7uYaz/Rw/UOxO4CSvbmIR6QrVgEPPzpWRFp/OwxVyRhntxATXs/u
 ey75CAOKt1b+ahMKpU4FPoAOlTtsUpK26H5XRFV9b0I2DRGoXbGEizrTiuCsf7igQttPurWFI5d
 EfDcZv9ee6vYrzwaNBYjWjDUKI36eWhV4Ao8KzZMWfkxuE5e5I4GBJMAZW/145IjfWUimHHET9C
 tlY3rWrqfikQRF4bruAEVaAqWYbtoRCKjviVCbe655LAEdNmBpGlUhQ/ypGsCb0S+3U0Q4UldD9
 IqcN3I2JNfGV2M/g7hMw==
X-Google-Smtp-Source: AGHT+IEloxvk39Ey/Sv/BQMJ/CObRTa6tWg+PDMIYM3JFD9kxOK63gQwq/L+oYSINKmroZD3gFMngQ==
X-Received: by 2002:a05:600c:8b6d:b0:471:3b5:aeac with SMTP id
 5b1f17b1804b1-4711789eb59mr108379645e9.15.1761017065589; 
 Mon, 20 Oct 2025 20:24:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3f5esm17944245f8f.20.2025.10.20.20.24.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 20:24:25 -0700 (PDT)
Message-ID: <68f6fce9.df0a0220.2f7e6d.a8ea@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 21 Oct 2025 03:24:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761017066; x=1761621866; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2z45Mcc2v7/ej8Mt/1H/AGOG9TohZTrB6f0d4i3iXkk=;
 b=a2UNF/SVMQ6TWyFVs6bZ7xkdNiLbVFnrkWtQ6xv8lYlblSXeY0uIuidCnx4Q872Wfy
 SjZRJDDn8OizNZ5FeXbUB6k69UhoF85J6bgkHxuxX+jHaBVXZHX4yqNDhVMvH04593wq
 jV/fhgfs3uRd61AlYsDtx6/RgO7T5nD/GOzqE9vU1p5BN3I9Gkp/hwMj7T/j7UYTamrf
 6stVus007fnMEWswh+PMpxG3Jnmkmm6BDEbvMJsltbm4TnKyNLqMapral5B+8ypvGM4W
 T1WSa6CL957F/vy4bkcS8jgFxSGfPrIn6Ty1OMtnEoG/yYL7kbcKUdsm8TXzIu95YkLt
 Fxvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a2UNF/SV
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-20
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

Autobuild statistics for 2025-10-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  5  |  0  |  9  |
  2025.05.x  |  2  |  0  |  0  |  2  |
  2025.08.x  |  3  |  2  |  0  |  5  |
    master   | 30  | 83  |  2  | 115 |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 6 
             dahdi-linux-3.3.0 | 4 
                python3-3.13.9 | 4 
                   cvs-1.12.13 | 3 
           host-openocd-0.12.0 | 3 
             libgphoto2-2.5.27 | 3 
                openocd-0.12.0 | 3 
                   perl-5.40.2 | 3 
              dovecot-2.3.21.1 | 2 
            gdk-pixbuf-2.42.12 | 2 
              host-guile-3.0.9 | 2 
              irqbalance-1.9.4 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                  libjwt-3.2.0 | 2 
                 linux-headers | 2 
                    mpir-3.0.0 | 2 
                       unknown | 2 
               asterisk-22.3.0 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
                    brltty-6.6 | 1 
          cloudflared-2025.8.1 | 1 
        edk2-edk2-stable202505 | 1 
                enscript-1.6.6 | 1 
                 expect-5.45.4 | 1 
                      fio-3.41 | 1 
firmware-utils-86739f2b3ae9... | 1 
               freeipmi-1.6.16 | 1 
                      gd-2.3.3 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-rust-1.88.0 | 1 
                 inadyn-2.12.0 | 1 
                  iozone-3.508 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libglvnd-1.4.0 | 1 
              libopenssl-3.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.17.4 | 1 
                 lockdev-1.0.3 | 1 
                 netsnmp-5.9.4 | 1 
                     nvme-2.15 | 1 
           oath-toolkit-2.6.12 | 1 
                openntpd-6.8p1 | 1 
               pcsc-lite-2.1.0 | 1 
               pulseaudio-17.0 | 1 
             strongswan-5.9.14 | 1 
              udpcast-20230924 | 1 
             util-linux-2.41.1 | 1 
                  vsftpd-3.0.5 | 1 
                  xerces-3.2.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/03ccbae868bf5e6448bf58d1c46a461a62b45053 |     
   x86_64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/8bf9d558f0e01da211ed85660da8e3782957ca37 |     
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a94c4525191722438376ea8d0e3b94fbf23305dd | ORPH
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/e9d7f42b3a76505fcb73f003fbdb9b46cbac5089 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/910b674064cc42c54a65dc37580f55384cf25a8f |     
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9868a7f5c57df402d0ebc80cbcabb920779409e6 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e4b276a46d37d3725cdfd63571704e3d3d3da28f | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/27f61a33e6b8bf4391c4ffc46ad61c47d55aeb06 | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5913ed06b406779759029d063e538c31902fffaa | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/013325c00b9466580716d00654dcd71082d9ebf7 | ORPH
  riscv32    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6ee4d21199c9d5a862cd8723d8086d5bd33fea9e | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ae6c88d4462687c97757130843ae7cda3120200c | ORPH
    i686     |        dovecot-2.3.21.1        | NOK | https://autobuild.buildroot.org/results/94fc2de03b5d6afd32c457be7faf0ac06cc37212 |     
  sparc64    |        dovecot-2.3.21.1        | NOK | https://autobuild.buildroot.org/results/974c6d200b693cca123ec7bd34efae185bf925f9 |     
    i686     |     edk2-edk2-stable202505     | NOK | https://autobuild.buildroot.org/results/f9f3e5a51492772a4ee4f4bb9f9714a013861409 |     
microblazeel |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/73ba0ef8cf7f8af54f2a4443ff2619ce44151ea5 | ORPH
   arceb     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/a3feaf98e21bde5007084a9a913d56b8d4935abe | ORPH
    or1k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/78664a3bba38d88e8a2f1bfa16be771b62c6b959 |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/98d5a5ec26de2209e6c488637d489c4b6a1a371f |     
 microblaze  |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/de1e84ac788c0e73c1abe430ac6c40aff13fd838 |     
   mips64    |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/5c8302695fba621db0f6136526c07a08de820a86 | ORPH
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f47112920c5a6468cf463d62355efc645babbc37 | ORPH
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1de27ab6f3d246b3b56bbff32cfecd5c295f1d72 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/c87716a6afe239d03086547417fa09ce3d5819c6 |     
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2e900859f28bd6b9a1c07df561c05a5a1be30a23 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/e699470fe67d5e487091ae2e6b56ac387097e936 | ORPH
   sparc     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/d2fbd093fcb073acadcdf74a36a43baa7d4beb24 |     
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2853318a9bc05f95cdc2d7548212a19c246bfc0f |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/416bfa45c4768526b071718693ca948ce30ef337 |     
  mips64el   |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/29f98040030469adacd383262fd1f5cbb0d24eb2 | ORPH
    mips     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/4ee001dc2d74e7952f3148300492bfa2dee19ef3 | ORPH
 powerpc64   |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/35a233897dd75ca49b9f186bf25b6455f860e166 | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/ce150dd571d018e9262b99b24cff78de898efb91 |     
 aarch64_be  |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/a779426d457c8c9c7067e1b3d8d04a32e853b3e6 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1be8fff0884cf5c5c14542626fa2a65c4d7d78bb |     
powerpc64le  |        irqbalance-1.9.4        | NOK | https://autobuild.buildroot.org/results/da7e663b5d9d1f61dbcc782f74cd831b8f4bcd78 |     
   s390x     |        irqbalance-1.9.4        | NOK | https://autobuild.buildroot.org/results/67af4b2d562b078d115ff27601925794f3761bbb |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/54342818573f743da734b2ee1f3283c68f99f711 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e9448b541e59594dec62e1648113337d733abb3d |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fb4de1275b92dd36c3255d36b32c42fbc579cea7 |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/afb2a98c8c6356e786f7a85cc134989917a0f3b7 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/03ea276fdca48e02ab8eede882cfa2c70299df4f |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c3bb81523e432fb2ad263236458a8cb608abfdc5 |     
   xtensa    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/70a31dc281ee6076f3c039f896e3e227afc9bd42 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/8a21b5f63587358852b99d00fe2ba27a9da8d37b |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/9a0c674d40d6632ecc6d60e81f193ce459daf851 |     
    arm      |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/9930a256c7a3197fd0506ee6d989dda1e90efbe6 | ORPH
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/f4c79c0f04a302d4e25693c82340ef2a9485fefa | ORPH
  powerpc    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/f17fd898553140bd545d0085ccd297bcdb9f63ba | ORPH
    or1k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/8a5dae1af69f25fe9b1be42d7cea1ff9092eec43 | ORPH
  riscv64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/eabef3f65fdf5a612ac7d7cf510aa8d9ae5354dc |     
  aarch64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/07cbf4629e09af2d4a634717be02291ddf9db1cb |     
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/e2505486df605e5a2be7ee5166ab46c78d423e43 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d7d976564cc55e745157d3f5e8f6354f393de88c |     
 microblaze  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/6bad9c0387c59d8953ec267dba0115a021a52553 |     
  riscv64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/31c3abdb23bfe16e248e094e9b0feafbbb0d6a94 | ORPH
powerpc64le  |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/ed40dfb32d64c27613fb83f189d9451f239b3513 | ORPH
   sparc     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/e4d362b987dd8eb5031ebd25a15dc2ab55956843 |     
  riscv32    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/dbbf7f05e0931441157f12baf8a6fee359c0fb24 |     
 aarch64_be  |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/06c7c0c4143994d22ac883b16eec0f9ae2add23a | ORPH
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8b9b5d7a36912a04e2c8543b402958b11d8fcdd8 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/131ae28554104f2b758ed46dc44be34ecadf8a33 |     
   s390x     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/b506a66b98fd65c3159add3e9a7af77d7fbda5f4 | ORPH
    arm      |           nvme-2.15            | NOK | https://autobuild.buildroot.org/results/71d1706fbe7eed374bc1a9484979bc98efa8c882 | ORPH
  aarch64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/7eb65afd38500eb54b911aff51a1ec2265c203ed |     
   s390x     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/8a0ac9cb0bf86e430b6a51c1280a84567d46ca05 | ORPH
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/434f93465dff31568feba521ee96cc7ef59dff8a | ORPH
  mips64el   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/a4bb7466f81139923419b2a2dde5e78f244f4f36 | ORPH
  mips64el   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/7c860f306d16b7e3ca907d4756b575aaf51997aa | ORPH
   arceb     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/5a43f93c8e4eaf556cf8a9b4a7e1f9fa4ccfc37a | ORPH
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/08aa9ccc2cd4fe81fe10f65b7f96b7d7e7cb422b |     
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e165697d1070405ba8975ca035504ea5ec239d49 |     
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a1bed0bcfb2c2ab054dfe029ddc6e4aa53766970 |     
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/269e43548b2213f7db14cc67351dbf176d7f92a9 | ORPH
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/746288dc643f1d24a6b1fd55acf26b20c6c88453 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/1f01a6d9c27d6de1976a0cd65a8c8e820441b172 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/8bf8478f711fb040a08703ec520ef692ea671e1b |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/98699da0eaeadd01ab0612c2e7571e550ad9e11e |     
 powerpc64   |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/d8e075a630c4b76463fad07b923500319ae166bb |     
    sh4      |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/499759f8fc36b9729d603e3bb7d7e7f5b3183439 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/9deb381b82f3ca9c520e2d7dce3df7ad58dff416 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d2caf98ccc878e191a94c1fec773c539cf3b249d |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/63f6ad3d878a816fcefbb1dd4ee612d4b0def1d3 | ORPH
    arc      |          vsftpd-3.0.5          | NOK | https://autobuild.buildroot.org/results/751a20bedb933ed4feae670cfc2d20aef9070aed | ORPH
microblazeel |          xerces-3.2.4          | NOK | https://autobuild.buildroot.org/results/2f8e462f0b676b1a9c71f8730f7f36ad293d84a3 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

          cloudflared-2025.1.0 | 1 
                  ledmon-1.0.0 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/35a9329b54cd15764b655bf9591510632e7cc0cd |     
  powerpc    |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/70ccce09b01ff4054f1ece98dde73f7f72dcfec2 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   crun-1.18.2 | 1 
                    mpir-3.0.0 | 1 
                openswan-3.0.0 | 1 
          python-tinyrpc-1.1.7 | 1 
                   s6-2.13.0.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/e06692d610807e9b64163d5a4da6221a9c9ad429 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1f449069f2f409aa7721ebf9c2e62aa6f61c1d09 |     
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/80af85075b2e1e8bbf1886eaefa39a783888bc35 | ORPH
   x86_64    |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/c090a79a2c5bc8485664c43666a0b91247b396b8 |     
  powerpc    |          s6-2.13.0.0           | NOK | https://autobuild.buildroot.org/results/c31694430790ebd16980bf879d0f3263663b9f56 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

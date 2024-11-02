Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2BAE677E0
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 04:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3653760D7B;
	Sat,  2 Nov 2024 04:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSF6dLpDwHzr; Sat,  2 Nov 2024 04:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE74760D80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE74760D80;
	Sat,  2 Nov 2024 04:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABC42112A
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 04:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B69281ECA
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 04:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmlVxRqaeYKt for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 04:18:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 140D281EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 140D281EAD
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 140D281EAD
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 04:18:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a2209bd7fso415276166b.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 21:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730521083; x=1731125883;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NiiNGeYizfy07CCR9TgnQd44fcmA2RGiOZOSzJBlvYU=;
 b=u0Iez+l9xzYbSqV9iRL/43d+3kskHjads5M3BihGgg10mlx+4MHzoYc0lj662x2IgS
 CuSvpScn8QdOik9XUOerWn6EjDj8hSH47EZIOUiWN/zt/xkHAWQiw3C9LxDb6myLQOdN
 7k61ozOcEIproY8ERI+9S7I0lortUhc8mfgx+DVSc3pZBMrjatlD2Ci+qs5xlHJmOOfl
 aUFV+GmzMR5LmO3hqvT9N3Jzu9TCLiBCh2i8gC3zdbdJof8rXem8mjT4AkQmFQHK7kIh
 8vmds915ngTnauOJo4JXclU6Vlwy6oMARwUR2iVCrgtjFZeCmvx7e7OkGx5+mxs3i8yL
 Z1pw==
X-Gm-Message-State: AOJu0YzrdAMlhptqI6LPfONjwo2NI0l3SvEvVcAPR5PKn3MCwgU1mC8M
 UtmhE4C8Hl5/7xTm77m/K+3Pz7pb2wB1bUHv9IQveBQeP+vaxln7a/AP0Q==
X-Google-Smtp-Source: AGHT+IFu/WG4yjXRrhFl7XqIRyY3R7+OOnJ9kBMcHOZU4gZMcyQJUorhvssY9aUf29doWdWrhsGDyg==
X-Received: by 2002:a17:907:6eac:b0:a9a:7f91:8c76 with SMTP id
 a640c23a62f3a-a9de5a3e0ebmr2709523666b.0.1730521082288; 
 Fri, 01 Nov 2024 21:18:02 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e5667d1aesm263424966b.196.2024.11.01.21.18.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 21:18:02 -0700 (PDT)
Message-ID: <6725a7fa.170a0220.1f04bd.8097@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 02 Nov 2024 04:18:01 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730521083; x=1731125883; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NiiNGeYizfy07CCR9TgnQd44fcmA2RGiOZOSzJBlvYU=;
 b=nkbqVocJ709cCtq+ZwGTyfAXxbmSzU2wdrXjeI8+gvapgWHVWNhksJ3uVJRQR4+wR+
 4uH2FAQppWCmJZzG1VuMlnLBB4qiSGWv3A03UMTI5NKRUEaGs/cUeGtCG8p5b5ex2btW
 cAUQrpoGCRdGPb9f6pMw1uKIegIkqqYmwEkpH5+w9H9kLH+CCchcRwiDJwqNCQKGNhlP
 ZuVRuEWddZ/LsqnnNrjALCaFPXMBAXEQ8PP//JXovEdTzFDSSTAaGFCDWsgv3bQI92uz
 B4EvGSuj8nDxwv3CHbK7u1jSyxkN+fW3dHu2Nb9gqtIHiQI5qIm+VRZYRPnmkdNXkaGw
 9OEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nkbqVocJ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-01
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

Autobuild statistics for 2024-11-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  7  |  0  |  8  |
  2024.05.x  | 14  | 31  |  1  | 46  |
  2024.08.x  |  3  |  4  |  0  |  7  |
    master   |  9  | 66  |  2  | 77  |

Classification of failures by reason for master
-----------------------------------------------

           host-doxygen-1.8.18 | 5 
              host-rust-1.82.0 | 5 
 ibm-sw-tpm2-rev183-2024-03-27 | 4 
                  linux-6.11.5 | 4 
                       unknown | 4 
             dahdi-linux-3.3.0 | 3 
             util-linux-2.40.2 | 3 
          cryptodev-linux-1.13 | 2 
         gobject-introspection | 2 
  gobject-introspection-1.76.1 | 2 
         host-libxcrypt-4.4.36 | 2 
    host-python-greenlet-3.1.1 | 2 
           libzenoh-pico-1.0.0 | 2 
               linux-pam-1.6.1 | 2 
                    brltty-6.6 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                  curlpp-0.8.1 | 1 
        edk2-edk2-stable202308 | 1 
                elfutils-0.189 | 1 
                 enchant-2.3.3 | 1 
                   eza-0.18.22 | 1 
                  ffmpeg-6.1.2 | 1 
            host-binutils-2.42 | 1 
host-binutils-bare-metal-2.... | 1 
                host-go-1.23.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                 libpng-1.6.44 | 1 
               libunwind-1.8.1 | 1 
                libxml2-2.13.4 | 1 
           mediastreamer-4.4.8 | 1 
              mosquitto-2.0.20 | 1 
                    mpir-3.0.0 | 1 
                  ntp-4.2.8p18 | 1 
             open62541-v1.3.12 | 1 
                 openssh-9.9p1 | 1 
                 pixman-0.42.2 | 1 
               pulseaudio-17.0 | 1 
      python-autocommand-2.2.2 | 1 
         python-remi-2022.7.27 | 1 
            quickjs-2024-01-13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/99d1637b2f679168a6150d7c9ffd3f56b6334fd9 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/01297f68da98be989efad628d457bf13ff950f05 |     
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/0757371b0e3ad0a01adb7ab4b959d388ec204cdd | ORPH
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/a8e9a02e838812801e6c62d63d17dd910ea22177 | ORPH
  mips64el   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/4306c9f47f2de9c5db77a64ac2fe2f4c0650e4b6 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1e98ca23ddb6f0f87b2e1d2468c813de68c9a0cd |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/31a5a0f63cb8b80e0c47ec8f1f06a8416f8e1e19 |     
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/61095f4dd4e7622fc2dc8626741693dc8865eb94 |     
    i686     |     edk2-edk2-stable202308     | NOK | https://autobuild.buildroot.org/results/86f01722d151df529d8af2a64980b0a356dcc148 |     
  mips64el   |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/9d6f0d5ac9f68c7af000b78499b236a7a07d5184 | ORPH
   nios2     |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/ea0349d26faca6277f6219dfd226a21df5c2bbb9 |     
   x86_64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/32deac22c32a1f4146588e0aa508563f78320b9f |     
   s390x     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/944dcea97e2783680bc16478221fb9db5f8dc09d |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/a24c17bb18847c706d2b63f82be7611d22c07dec |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/7548363587819895fff6fa5cb0e736a41f7fab4e |     
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b6744fca1b8bcb52bd120a00fc081fc1de02ca66 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b63cec9ac934b8e66e121556a06472fa048db8a5 | ORPH
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9945168a7d4170d42c409f30a98cfba7f1030be8 |     
   mips64    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/136f81d8fe54b3fb7d95c0528e43f05cde6f7831 |     
powerpc64le  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/c6825755cae595d5ecf2a2aa329c9429c338ebd1 | ORPH
  powerpc    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/923c3479fed1d6158ac8de7762905c76de84a248 | ORPH
   mipsel    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/c357d30245b2c298f199eaec7736234936e7aea1 | ORPH
    or1k     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/253ca0bc95b07ea42495cefbb71007ef691c1234 | ORPH
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/d05662ee7f82f964eb2cd4e86c642d765572de1d | ORPH
  sparc64    |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/e528389d1e846c1ee8ec3695507776c1b330dc58 |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/f9854d9ae95c2f5cc15dc3fab7c4c661ca39ce1b | ORPH
   mips64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/78e5eb676461653d638bc4e13b480dcb5e237ba1 |     
    arc      |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/fb382da3966e1f4747b6e94a8a7c8d53493157dd |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0fe6a9625f22d2502286335aee442374e7527287 |     
    or1k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7af96c1ee6638e8d1cdbfdd7e37ffb04ac9c44e2 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/30ef2a87912b638c75ad9371ea3bb6f5004b4797 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/3c949bd4d897cebe04d21230033fbbc7ca4b7532 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/224838b9e0d0c73151bf2fbc2221296809f8f924 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c6705795254ff38faa94451d0635ebc63624f0f3 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e07eee2ae5bf87fa99df55e2b24e5d212d697213 |     
  powerpc    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e01739a01b00fe6e3d74d75975d035b37ed73ea7 |     
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/738c45c441c63619e6ef828546342a96ba944e47 |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/bda998e001a92a87b00dd72981f29877c8bd86a3 |     
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/dfca07f3520bc50c9969bf392258fec6dd66301c |     
    arm      |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/c67e3101005ef7b4d0eaf6eb8a93f22446643dbd |     
  powerpc    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/caef34cd6d7a45b257e341c96535b46c0205b583 | ORPH
   xtensa    |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/6f3df966eae5188a8bee7ba0885cd81485153ac9 |     
    arc      |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/e5ebd68e84bed41a2356f95d7c4c0007a980a075 |     
   sparc     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/7b7f764ae02797424f5226e5db1c33238d3e2428 |     
   nios2     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/8b4eec0793ad56394c0040515e9ab6bd64f8d75d | ORPH
  powerpc    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/2db8b4f7dfc917bea60d3f97625755be3c4fe9a2 | ORPH
   x86_64    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/e65078a7303f6411ffbf3f2a3b19c8218de3e064 | ORPH
    mips     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/c4dafc2fd2583db583b52977ee97ff6ef8536c21 | ORPH
  mips64el   |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/47da33e0abce078aa8efab4af2994bec7c4e5318 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/26eeadbb50e0a672af9729c9d6a7619689e0bffb | ORPH
   x86_64    |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/5624757a0e2336b807380f4bced9231e623111e7 | ORPH
  riscv32    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/248877b14843d5d7d1a8cb08ae484d50ab671375 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e793cf8a49876e6511985205c5474a184b7768b8 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d127fbc33b98af49bee4112156f585a6ee13e2ac |     
   nios2     |       open62541-v1.3.12        | NOK | https://autobuild.buildroot.org/results/3c6c1946ec5352304a4d7c11e2cbe20502167e39 | ORPH
  mips64el   |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/b89b8aba6989d931483620be04ec5ca1845e01be | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/ed7108560b7d20fe840bd579595bf1cafe141105 | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ea5809e0baad08a621c7999c0fbfd5bf3278d901 | ORPH
  aarch64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/f9155f5988c2c7a7ffdd48219499f57210434eff |     
    sh4a     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/8d7088223cf4f56b817a8ee48bdcee5f52524c38 |     
    or1k     |       quickjs-2024-01-13       | NOK | https://autobuild.buildroot.org/results/0d9782e9e03a31e80fa88e8cfb28aced828ef3c7 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/fad29283ce3067d227284550ef8b36f4e7787789 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/15be4f5113126231c8bdee2a590a6e966d408041 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/3d4bc77d73be844b92e1366d7a65f4f1eb9b16a2 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/96a6a90f0330400ce9eafb2950bd3fa7e72bf481 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/de16f3cfe744b0152906b47c5f6350279ab39b88 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/46b22765ba014569e3dfedc113723e6226afdb8b | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/200b1ac7ed5a637c6d0eae949b46259d443b324f | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
                  iozone-3.493 | 2 
           babeld-babeld-1.9.2 | 1 
                  curlpp-0.8.1 | 1 
host-prelink-cross-a853a5d7... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/3ebda45aee42c65aee9471bc561ce6e45f334644 |     
 microblaze  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/ea1f9a7c4ab84d68525d63e10cd1fd1a32a9f2c5 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/7f0bf2c0b39038cafe3f5ac3fa59e5d35f596d53 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9f6de90dff2d4c02c01271b20f62d4ffa9662ee3 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/16ce4522336808e5966189376252773843d3f9d1 | ORPH
 microblaze  |          iozone-3.493          | NOK | https://autobuild.buildroot.org/results/18eafe907fab398cbd22eb2cc7167e6192cd5bd6 |     
    mips     |          iozone-3.493          | NOK | https://autobuild.buildroot.org/results/27e523bbae714abdb7927b96bc78a85cc5e9802d |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 2 
glibc-2.39-74-g198632a05f6c... | 2 
                gnu-efi-3.0.18 | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
                beecrypt-4.2.1 | 1 
  binutils-arc-2023.09-release | 1 
              cache-calibrator | 1 
             containerd-1.7.18 | 1 
           ghostscript-10.03.1 | 1 
             gnuradio-3.10.7.0 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.74.1 | 1 
                libesmtp-1.1.0 | 1 
                  libffi-3.4.6 | 1 
        libzenoh-pico-0.11.0.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.8.12 | 1 
                  mbpfan-2.4.0 | 1 
           mediastreamer-4.4.8 | 1 
                mongodb-4.2.18 | 1 
                  nginx-1.26.1 | 1 
                 openssh-9.7p1 | 1 
               procps-ng-4.0.4 | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/467c4c1c64ab27956bfd5eb00f29f8dc4fd2dae5 |     
    sh4a     |         beecrypt-4.2.1         | NOK | https://autobuild.buildroot.org/results/11ccf27465ca42ce7117f887945f8d900338b6dc |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/f0be8e88a9742b57aa0ef47f30d29889c04b6f5a |     
 powerpc64   |        cache-calibrator        | NOK | https://autobuild.buildroot.org/results/a33b40cb9f316d0d6bf4aff4f7b6d5dc1a52f6c4 |     
    arm      |       containerd-1.7.18        | NOK | https://autobuild.buildroot.org/results/e8727c3ada1dc9a2ff6d3ed7170c12e9fd7a2d20 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e9501cf13f660a2b405688e03130bc76eea46d7b |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/754b6347195def0872fd83522faa53d1a9c7b4b8 |     
    arm      |      ghostscript-10.03.1       | NOK | https://autobuild.buildroot.org/results/98880cbf4195941f4c68333bfdb5cb16d751a646 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/562f7d35b4d9efa5c7f9e0c370efb088baff23dd |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/f26491811555e67f27c14111964f20831bff3a4a |     
    arm      |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/e89171608edb367006d08d28a1f7ae852121df64 |     
   armeb     |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/1078007414a95ff87878c21de6c9a9711ade073e |     
  mips64el   |       gnuradio-3.10.7.0        | NOK | https://autobuild.buildroot.org/results/fed5c65ddbad559c805650789205ccd445cffcc7 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/0792de295c4d8de0ed75721438139e963a87285c |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/21e2d25c8e9e998d9b398c49c1dd3d0e0f28896b | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/12ad614052e2f5c6440e1a618313c1e0f43cab14 | ORPH
   armeb     |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/48ebc2bb615bc9c3c82c3577d1f005b4f9af2404 |     
    mips     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/8effb3aaf7e6ea441ce4abee42dce118a7c7f6ae | ORPH
    or1k     |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/c286d4bc9be6e425fa6a10d14262fe69dff587b2 |     
microblazeel |     libzenoh-pico-0.11.0.1     | NOK | https://autobuild.buildroot.org/results/631aa14463e652a735dda6b869361ebd70bf9f37 |     
   sh4eb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4912b97c583eabcff4843e75a317a37f8460f83c | ORPH
   nios2     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/a10419862b110c0c13caf7246936cd4a6775a4b3 | ORPH
microblazeel |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/e80b01b6ab126c81b03b4c21d6c81a2cb9622889 |     
 aarch64_be  |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/a2bd2dfe658975ba7d802ed6801f228de62fd61e | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | https://autobuild.buildroot.org/results/62b4ef9d5f29b65b39f5b232724a637f8032c3e9 |     
   sparc     |          nginx-1.26.1          | NOK | https://autobuild.buildroot.org/results/47d7cfee9eb04e91e2c76338304dc5f9bf6c62c1 | ORPH
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/5e736504334ccda94419b90d43415c146424a0fe | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d6fde45a263c4127552d741f419b4fd0ed72e2a5 | ORPH
  aarch64    |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/872a8c379dc3f3fa29ce22b02bf3da0ebe811f09 |     
   nios2     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/e15958d30fb45517b8d858486e88ea82238f943a |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/4dc3a27f128e7ca53cc816e17fbf99cb6f8907cb |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/21c4f14fade48a74853e487c7a79a93c9c7da06f |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                      fd-9.0.0 | 1 
 host-softether-4.30-9700-beta | 1 
                latencytop-0.5 | 1 
               libglib2-2.76.1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |            fd-9.0.0            | NOK | https://autobuild.buildroot.org/results/b6fd31cfd71906dc3a349887b83d3039a392740d |     
   nios2     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/959ef78b947f48942ab587ebe74de7f5e982737a | ORPH
    i686     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/9d3d0d7a154785b6e9ee414c17af28d2fe06fb69 | ORPH
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/08e2d2f22e358709cffc2701875d344a799aa927 |     


Gitlab CI results for 2024-11-01
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992244  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992746  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992310  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992311  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992759  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992760  | ORPH 
...ch64beMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992765  | ORPH 
...linAarch64beMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992766  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992778  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992779  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992784  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992785  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992790  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992792  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992797  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992798  | ORPH 
...k68xxxMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992805  | ORPH 
...linM68k68xxxMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992806  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992813  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992814  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992819  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992820  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992825  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992826  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992831  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992832  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992837  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992838  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992843  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992844  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992849  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992850  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992855  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992856  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992861  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992862  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992869  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992870  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992875  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992876  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992883  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992884  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992887  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992888  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992891  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992892  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992895  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992896  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992901  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992902  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992907  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992908  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992914  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992915  | ORPH 
...90xz13MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992920  | ORPH 
...tlinS390xz13MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992921  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992925  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992926  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992931  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992932  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992939  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992940  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992945  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992946  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992952  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992953  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992958  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992959  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992969  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992971  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992981  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992982  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992988  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8232177065  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992748  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992751  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992267  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992269  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992335  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992337  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992338  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992571  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992596  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8251197617  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992642  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992675  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992687  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992271  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992274  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8232367821  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992276  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992278  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992257  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992259  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992740  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

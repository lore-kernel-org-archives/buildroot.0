Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928BAC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 03:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F82F6F53A;
	Thu,  7 Aug 2025 03:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HL-p7NMkLUse; Thu,  7 Aug 2025 03:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2EB96F541
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2EB96F541;
	Thu,  7 Aug 2025 03:15:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AD0DD84
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 03:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 173A64291B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 03:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bl9DAwKmZfmf for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 03:15:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6476D42910
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6476D42910
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6476D42910
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 03:15:10 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-af95b919093so77711066b.2
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 20:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754536508; x=1755141308;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yTlOnNn3WP2rHzOS3Bx4qjH+8QtDg4K05FnvRqI1wJA=;
 b=glzBiAWuYsdeSOlZRG2qnBfD/kraCUx0rGnb9MYwZiDDQ48MC1mmGSPHrwJvG9XCy+
 9OCZ5hi/ZZRGBLXaZYyzCAhKDh2wQ9qfCZjsjwQqJ39P8yj1ruBNW/rX/E0TC/U+viVb
 bBKz7oCXB3cekmdIcxZvELdBBFkfu3eikdHgE2iGEmujw6fhj0AIc3MsBoLOveuV0poS
 5IqQlzXBaEAmU8Z6Ux+1xtNEYg1M3D5tjuREmbm1thiteVj82LmbaRdPZT8x7htqiJEb
 bcyCTHNsLtnauclW7b/7ZCxFdJUJ+2/zx4AwKg+t8ZznW+WnMEpjSUqAbja3A1qrqJeZ
 fB/Q==
X-Gm-Message-State: AOJu0YxS8Ax/gNKeqBqSo6UTTAzxYVL+DAs4GjdEShL1kZAQWi04JWVF
 +x5K9bBeFcSyqaeiux/UYWVnWrSYUZU6azgygX9JmkOxnvr8qi25PrypDSnvSQ==
X-Gm-Gg: ASbGnctvK+OubJka12F4gliCfHRqKBzvWMdFzGeC0bxgiMIUwAwlZpaB1g2bartvXa1
 ShTp10uo0pC8R5m3Qcbqi14q43ruhvnVbFWjzNUDgx56qihFeStgIFhAloSYPEVkQwG4tJ+xzbj
 EFSK0YsmqwuFziwq+uHQB1fD3j8fPOhoHbbita7ZomuUsbGKqi9rl59SH4Re4Gl6+Kj3VOkOwDi
 HCeGn9UQ3995NtMwZGIdAJ5mvQued3TVDDZn407vekl5lamJvrNbWZAYgOjA+WSmZHfzGMJCKtA
 pjxqlbeRzqNvRH+MJxHHGFQU6amYJeujogzym5rTP4fy6QkqPezn13mdOjo+SPUsM8BZkxvZ05w
 sGld1GR7fUJmRMAJgv/LPRZEOUA==
X-Google-Smtp-Source: AGHT+IGMxNuU3MT3SnmZl8sVoWfiDmun+f548AfYFYVyiz4SCjrBbsceUpi1CwU2RB3Bv8H7r2b0dg==
X-Received: by 2002:a17:907:1c0c:b0:af9:61b1:e180 with SMTP id
 a640c23a62f3a-af99042fb75mr526433866b.41.1754536508110; 
 Wed, 06 Aug 2025 20:15:08 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91b36e91dsm1182630166b.69.2025.08.06.20.15.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 20:15:07 -0700 (PDT)
Message-ID: <68941a3b.170a0220.56fee.6faa@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 07 Aug 2025 03:15:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754536508; x=1755141308; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yTlOnNn3WP2rHzOS3Bx4qjH+8QtDg4K05FnvRqI1wJA=;
 b=Syah4HxcnQCTIkex3W7C4vbRtTKjvlHOzc1ql6AX1CuUYciBwoxOwVP9q5mjVCQqj8
 /rv/oCZ146/ge5G3Eljpcigbu8XNvsUz1xSMaFEv1D8poMx7EUPq4wZduBT3UNjjv0pB
 T7gtYZTOw1RiBjBW+ni8AfN8cTXYXblRFzmLrNIgNSt/n2SkOHDKbIMAnx0Zcxn+Z/u7
 ZQwSeH1Bn0furfzpW5kDPN9sLIskpPOtOlnOkzAFLfrripa0C4j9FoPW4Gkp72WLy2RY
 COXDXiHUP3PGCVCLhEJbwgbCZm8KBBbt530g2nsq/Tx4572gtk8cFxtaEkeJnUx6DyfU
 mDFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Syah4Hxc
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-06
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

Autobuild statistics for 2025-08-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  8  |  0  | 13  |
  2025.05.x  |  6  |  4  |  0  | 10  |
    master   | 19  | 130 |  2  | 151 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
        liblog4c-localtime-1.0 | 6 
         linux-headers-6.1.147 | 5 
                   cvs-1.12.13 | 4 
libdbi-drivers-0bfae6c43134... | 4 
                  libsvg-0.1.4 | 4 
libsvgtiny-ea9d99fc8b231c22... | 4 
                   nanocom-1.0 | 4 
                   bash-5.2.37 | 3 
host-binutils-arc-2023.09-r... | 3 
                 host-gdb-14.2 | 3 
                 logsurfer-1.8 | 3 
            netstat-nat-1.4.10 | 3 
                   perl-5.40.2 | 3 
               bctoolbox-4.4.8 | 2 
  gobject-introspection-1.84.0 | 2 
       host-gcc-initial-14.3.0 | 2 
             libgphoto2-2.5.27 | 2 
                liboauth-1.0.3 | 2 
     libphidget-2.1.9.20190409 | 2 
              libselinux-3.8.1 | 2 
          linux-5.10.162-cip24 | 2 
                    linux-6.16 | 2 
                 linux-headers | 2 
        linux-headers-5.10.240 | 2 
            python-yarl-1.18.3 | 2 
                setserial-2.17 | 2 
        vulkan-headers-1.4.317 | 2 
               alsa-lib-1.2.14 | 1 
               asterisk-22.3.0 | 1 
                   avrdude-8.0 | 1 
                  bcusdk-0.0.5 | 1 
                   botan-3.5.0 | 1 
                 c-icap-0.5.10 | 1 
             dahdi-linux-3.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                     dtach-0.9 | 1 
               dvbsnoop-1.4.50 | 1 
                     ed-1.20.2 | 1 
                 erlang-26.0.2 | 1 
                     fd-10.2.0 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
               graphene-1.10.8 | 1 
host-am335x-pru-package-5f3... | 1 
            host-binutils-2.42 | 1 
         host-gcc-final-14.3.0 | 1 
       host-gcc-initial-15.1.0 | 1 
                 host-gdb-15.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
              hyperfine-1.19.0 | 1 
            igd2-for-linux-2.2 | 1 
                    kmon-1.7.1 | 1 
                  libbpf-1.5.0 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                  libjwt-3.2.0 | 1 
                  libnss-3.114 | 1 
              libopenssl-3.5.1 | 1 
               libsigrok-0.5.2 | 1 
        linux-headers-5.15.189 | 1 
        ltp-testsuite-20250530 | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
                p11-kit-0.25.5 | 1 
      passt-2025_06_11.0293c6f | 1 
                  prboom-2.5.0 | 1 
                python3-3.13.5 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
                s6-dns-2.4.0.0 | 1 
                    sdl-1.2.15 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               syslog-ng-4.8.1 | 1 
              tinyssh-20240101 | 1 
                   trinity-1.9 | 1 
             ufs-utils-7.14.12 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        alsa-lib-1.2.14         | NOK | https://autobuild.buildroot.org/results/c40d4b55da3e3af2c578cba7ed67e8b7d716d535 |     
   sparc     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/abdffe6f750ffa65c0b253faffdf2ebd244f6a93 |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/1dad91e8dd046b01c374f498c8b5444abcd8d7fc |     
   mips64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/d0d6843a449d702062770b5d40722e72db53b3c2 | ORPH
    sh4      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/77ce97dab26baab27ff1195f78dddf700cc44aae | ORPH
  mips64el   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/7717cb4e8dbee2a6bddaeadfdf23b7ab755f148b | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0132c2654ffd0934fe55567d971e4fa1c19aaa42 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f505087045a22c11cf8333254fc01cb088128ea4 | ORPH
    arm      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1394d6fff06e410783e180e8021b0b346342a61c |     
   mips64    |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/861246ca89b6ad5778f32cf62b815f7acb63101f | ORPH
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/33ed2b9097d3925033220e4fc5a839ec46a1c4cf | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ccd10e5f0631830995760aea85023629d0c4c7d4 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/38c8661f7e34750cf5ce92db42974ebfd0817450 | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/047fca1c671c9dca7a2d27ecb76ca4e173fe3ab7 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/78af52a4c99020b073270ebdcee7c1b46368b12d | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e79a9a158206f4cc4f0c78f5a8b122747d880e15 | ORPH
  sparc64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/22db8762a7e11d8e2380b6ec12d391a86ad6e0e8 | ORPH
   mipsel    |           dtach-0.9            | NOK | https://autobuild.buildroot.org/results/7b1e7e4a1c640481d600a28141a7fb008311bef6 |     
  riscv64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/2b6aa8a03a2a44068c8f385ee4d39fe1c877bbe5 |     
    m68k     |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/e14b554e18d24e9358e018f93278ae5a7a87db03 | ORPH
  powerpc    |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/645636142f12a79a328ce5520e7e3418f6a68c12 |     
  aarch64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/d2a92024ec5ba50c8d3eeceb6275051a88e94225 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/33503838b1c642feeacdaba8b4df99f4ecca643f |     
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e0e30870ec8b0ba139c5ae1db43fd5957989d0b7 | ORPH
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/31a6c3ea6685e587f68704318762d19ca88cfa20 | ORPH
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/749633eba876077a7958a01945cd71e10e290a7f |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/d868c86c09d3cc9658d3932dff918859941382f5 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/90a15c033ccf9ff029f8dad2f78d19410db5565e |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/bad38ace4c530ddf9c87c533f5fb6942cf7679a3 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/485edbc5de040073f0187946c8e553f878b0a46f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/814502e16afe45963d299d0d6e20bb5a9fc8a00d |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/f2572a1e9ce6a986403e2c8d8e393659d81d7b9f |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/246931d4012eef20668a4e85ae671a174980ecaf |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/f39f9873a1c4118b809f4d7208d942726f0b9c3f |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/903fbb6a81a44258b3f75149103f95c5a8041d64 |     
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/10c67fad6af9931d4444ee7f296c8b5f92afbf06 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/0a4d0a3ff724aa2ae287613ec09e61e98c7278f8 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2c815bafc1b58506b5ad8833ba40d7861d16f5f7 | ORPH
   s390x     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/24c4cb63c71425fbbe54a7c1adca8f7f01d89c98 | ORPH
  aarch64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/11ee00bb02e3fa082afcc1e5e33a9ca24984e77d |     
  aarch64    |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/9d7845bbb3077abc8aae0faf7cb3b636dc556339 | ORPH
  powerpc    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/19384eb30d6d2166c5a485bfd1923b207d9de02c |     
  powerpc    |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/b5c992016fb97d7b9ee087e97f8a73f98568e737 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/344593f168d5411451925487b450734a9e1598d6 |     
    or1k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8cb268a4818d11b261954ad041a3f124480499c9 |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/59a483aaaa098c2475794e75f8525f078d9b8470 |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/b7d2de75e210865fcbf87568185b308006e4aed2 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/80e431d177a9e09e381abc9dbf5b14069a7f06a3 |     
   arceb     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/96792b7c130450c2a2a8c6826a6648e5be0f7406 |     
    sh4a     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/ce3eb3013615e6aea02ce8fd209d6fdd55056297 | ORPH
   mipsel    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/b0484676d563207c7f95b51451993071f5ca54ed | ORPH
   x86_64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/2bd5094d3783a603ed7f9f085c634851c67fca3d |     
    i586     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/5f8cebf4599eeff6c583ce53f3f0a3fa1a105dc8 |     
  mips64el   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/956d30b1f1904efecc4834da798b247cb4f1ee63 |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/3f190bd2f995d80e0cf768bb77013503e6299a93 |     
   sparc     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/b41cf3179723a2955bd5cb4079c643c34b63714c |     
   xtensa    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9aa5a89f3de275da428ceca45f3f07de5fd8ba10 |     
loongarch64  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/08b0b8d17e514ed28b3a52a0277c244688d06971 |     
powerpc64le  |          libnss-3.114          | NOK | https://autobuild.buildroot.org/results/7d9f0c0507c198369b2cf3869179006676bb67a8 |     
   mipsel    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/a1f2675f35ee01089ff28622afbc119a54b88650 | ORPH
  aarch64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/97bbee7249345c6de72b7aeb3670844a587afc6b | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/fb3abf44831e9d7fe8d5935598fb228fb9ff368f | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/ff7c6a9cc2be2e8b64aae554a6c6aa930ed2f4da |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0a2e45a363d5110a9f451361519e049f44c3508b |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2ef0aaba75110bf3899df65724cc8f9c6e92bbdf |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4c657e0a841c7cf02bd15a45663e8034e72774b6 |     
 microblaze  |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/986f1914d8ee4a7c7dc6ca8b4ec1550befefca69 | ORPH
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/7e2e79c1c0ff8f5d46e6f8a644406e29e6b767cd |     
  riscv64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/f0c05fce55a3089f3abc9c94c06c7b4c194fb23a |     
   mipsel    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c101a7a3889278b1f9013221ffb61e8037f4991e |     
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/0be37d11bc916e905a88dc0c5408149aab6c0ff7 |     
    or1k     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/5446daacf8b2482813539f58861d0ba519ff8954 | ORPH
  riscv32    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/5ad02d540f889795ceab2d9b2ee31e76014c1dc9 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/64be211d9b0d63baa8a0a59cf77403008910c6e3 | ORPH
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e05b36e37577bdeb63cc87dc6681cbe7e0bce7d9 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/da826afd717890ef5adb9632b16abaa6b2def458 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a8cc346b6739b1e9a8d05aac35bde68c6e302af5 | ORPH
   s390x     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/e1ff72f0608cf4fe66f58a3ba9a66638f8a08c61 | ORPH
    mips     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/5ee9a7b3e5decdbbc0f588f250cf788245b22b01 | ORPH
  powerpc    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/007275785778dfe69dfd8f99c413fb7047e9c7c0 |     
 aarch64_be  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/17bb20dc7391c9e12f3dcc9a3e6e52df4beac98d |     
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/daaf658b944b16709c42c4748299e665eba4a574 | ORPH
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/31d53504709ea21285bc4961d62ecfbafce06ec2 | ORPH
loongarch64  |     linux-headers-5.15.189     | NOK | https://autobuild.buildroot.org/results/6b8ebbc195ce1447f40b546db3f85668c146d8ee | ORPH
 powerpc64   |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/483536978b7c3031970350f66bc19c92a14ee723 | ORPH
   arceb     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/e3d882488f86c6ca4850f115c0849b285a53acef | ORPH
loongarch64  |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/5c4dc70c5bb52bd9abfcd1c3f3527be11c828c72 | ORPH
   armeb     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/0c4d4efe4a7e85e4b6087cf492a00803d03ef6a9 | ORPH
  aarch64    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/ff46e80d8db54f7dcc71ec2fd7717d7a53c2acfa | ORPH
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a1b9e503b5a7caa2177ccff9ff95110b43b53450 |     
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/27e15de03c3c2a6009636a00d199dfa338e51606 |     
    sh4      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/44dea8b87f014bfd68b1882cc5d75a0f31f7f64a |     
 microblaze  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/f4894049db080082f319f1e66a6e04f8e07d6811 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/19b4fbe7e64aaeee49ca14720e11b4c732e5b668 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f49f9ba33f8e170b1ee99d0242f6b3b9df435495 |     
   s390x     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/77acc76c350f9da937857ac56fee13cb65152246 |     
    i586     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/0846de2c5aea031b616ee1bb9c28d84bada36f17 |     
  mips64el   |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/f8fc81c2d23387b269b4403ee594d2cbdf97a93e |     
    arm      |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/b83c4663227fef94de2d27053c6d7cbb7c2c42b2 |     
    mips     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5590c6562cedfe87b75af92acfd51bacb76e797f | ORPH
loongarch64  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/c231a00c5917fc8c8e78bbada238ddafcd58768b | ORPH
  powerpc    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5e0a66cad2217ceaa587f16471652952f9a5ca16 | ORPH
  sparc64    |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/e8e6c0ca5f502c6fb24fb13bd4f95c8825f144fb | ORPH
   mipsel    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/73928ce85621f83bf9e3c6970214ddf5ef143717 | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/1f5109eb8a143110e3316e61417e0ba6477111da |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2305610ddf466637d7b0c106e85b02d52c1d39ae |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/52db7c38062c3658f61207f25466e53a39fa25f9 |     
    or1k     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/3d654a61ab9a26fa3467ea22b45798d5a33f0874 | ORPH
   s390x     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/771423bfcae9a7ab3b66ce3ead0e4478e2e1edf0 |     
  mips64el   |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/1798ab6dd7430614cfe5dcd7a9eee7304a90836b |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/214377f693a22d666956c4d08ee3aea90147d9c6 |     
  aarch64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/71f812838a257ce55ed4c08d0487160953bd40ee | ORPH
    mips     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/0f249205f9950e8fcffcdeefd8b9a7999896ab95 |     
  mips64el   |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/21190532a4a960f417925c946baaa68ab297b55a |     
   armeb     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/87199fc8522afa8f17b44ee361d2a27f7b9f6029 | ORPH
    arm      |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/8d887362e24c285ee90eff2315a36229c881cd0d | ORPH
  riscv64    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/9f27ebe8a0da2ef8c063c7981fff5850c17ed276 | ORPH
   sh4aeb    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/797b8d8fed4ca5f57eac97cac14fa049b571fa14 |     
microblazeel |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/86dce989381ade53887b37145b4a58d0c3f5b781 |     
   mipsel    |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/1ea5c6c07a4bd89aabf6a5b655776a417d6c5630 |     
   armeb     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/cb8c9d50cafc6237b367085f55211a47b2e79ff7 | ORPH
  riscv64    |       ufs-utils-7.14.12        | NOK | https://autobuild.buildroot.org/results/a097e48314be2f522238880e9ab4529cebeff47b |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8cdad04f22e1ed82a8f53fcf63e878e4daac9fd6 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/eef1168ab02e48d1297511fb62bd4b4cffcc69ee |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/2f2c95e858e27b7598f5fbc91cc9779aba4893d0 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/f6efe929f5ea7d48db21a76831a91dc805f3683a |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a72ce2391a4ab8c88f6d05ac8d014476a2ab442a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a31f33b956e4c02da826e3387f2e7fc84d4675a5 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/34702e8c653b800279b2db66429c627af82b734b |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/8211d9cca556beff4828e16c7a0e7386ff447086 | ORPH
   arceb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/9ff724c3b550912ffaa97aa0979a27b9cb27243b | ORPH
   arceb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/07f2c0a327bcbac950763b0a891b62af4c5494af | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
                   luvi-2.14.0 | 1 
              mariadb-10.11.11 | 1 
                  ntp-4.2.8p18 | 1 
                   perl-5.40.2 | 1 
                    proj-9.5.1 | 1 
rtl8189fs-94cc959d56c1425fb... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          luvi-2.14.0           | NOK | https://autobuild.buildroot.org/results/4705e8fb953610ed0e609bef926ad37ebcbcf2de | ORPH
  sparc64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/c3024c9cd2c2a48d4ddcab41034f6308b14adacd | ORPH
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1e18de992824562c2450e0c770bdf77220627233 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/604db6fd4a1af2daa3929dfa50d403e1721dd480 |     
    or1k     |           proj-9.5.1           | NOK | https://autobuild.buildroot.org/results/5fd97fe69317a80f607d0aaf8bf93732283a7ce6 |     
  powerpc    | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/7e8b44f08a83c298de428b25ae5f9cea69336692 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/5eb9ec4271489ce7faeafd9f3a574022288a425f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/32471143451d3fe62013cd31208091e4485c7e20 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
          host-oniguruma-6.9.9 | 1 
rtl8723bu-af3a408d6399655b0... | 1 
squeezelite-71c012ad9ba102f... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/313cc4ec6b25a59a23093f01636d0c6d43d12430 | ORPH
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/8463a47c050801396963f1b8c9428f0010b47cfa |     
   armeb     | rtl8723bu-af3a408d6399655b0... | NOK | https://autobuild.buildroot.org/results/9441a99679b4daf36ac9fbe69bcdf2117266618d |     
  mips64el   | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/1808ac2bad74da2415d21a1de48f2a1c1753f998 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

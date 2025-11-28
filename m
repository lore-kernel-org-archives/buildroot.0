Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91620CFD376
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 04:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0282E80E5E;
	Fri, 28 Nov 2025 04:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKSg5gC1EsvT; Fri, 28 Nov 2025 04:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39FD81991
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B39FD81991;
	Fri, 28 Nov 2025 04:20:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD8EF967
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 04:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FBAA614BF
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 04:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZCpowhCQusi for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 04:20:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4718061252
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4718061252
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4718061252
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 04:20:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso11675735e9.3
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764303623; x=1764908423;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rW09IEYeCn2SqqN+BCJcOYDC2vnNw11XnWL4V/GHa9o=;
 b=wN0Sq9PYwNTGXRKPRnpq5G+wWWwTdXLGtgm4MW4Z8qthO7bapa829e9BOdf8+5582b
 6UizrLQeaCYFA4tOUavkgv8ENQGuUymIJU1zSXH5Tn0XO44FYt+Gf4PPQB2Lfb1EC6Kt
 xhuu0yHUZyCYnAGFV5ik6khqs2XPpkUf11CpoKrtQC3qRwUzbH+YeVBxt0LUJadX/Aek
 kd+StKGQrZsEaUz5ksnuL7x2b6YWCP1CNDCSnVoXMCCvp0+vrq3ZdaC+U6fBFcmLKFUm
 hQLQe+37xr8Ce3PfW5sh7qqRU1fPIElBlyisyjNNWxmq9AptKVHuVga1O2AbYjgMMWaR
 nUzg==
X-Gm-Message-State: AOJu0YyCCnWmXGGwFxUDaTtBOLMFF4LYsVddq8w1v8aw2gkJhUQPvvhq
 Jny+NEB3Qgt6iAlzNeiHk9NnRW0ZO+H1Bt8f9Hv/3MySXoW78+/TQRjJ1qDVOw==
X-Gm-Gg: ASbGnctMHHKfGGXMqkOxJ+2k6ASiWWQE/DyGrm0+1SrDPXbhnY/r42ihrg/l4+YthXB
 5b3roCznFtGkBmTZEcEGRehkPwJB/YZIhCeVlTZBvL/Uwh3bSRRozKPUm/LlTSd+V8LlSXjzR7d
 PjOL3ZQNH3f0vidX37oM6hOT1vSP4MjTLKgU/uh7Y1Kqj8g8b9Mx2F8smnR0fIOfmmq3puz4qJt
 dOTro7z3GWdIKbEk1R7oZZVTa43N1pl8k7yvx85fEW5w1wLks6q5zOZ6oGaPNL5Zz1b2lw7Y57V
 lNq0M+u2149RQoLskaTKFWwofYwnf3BYcyxYJhriyYoLY4Ibqq52n0l1eS0ER1Zf2T7SnsLZ8WD
 oPeNpb1kylVGPE/Gpe9hQuDxtaVsbwukaCy2JfMqf7E5NwofUbZH/i8m5syYZTejeQkCU1e0jDq
 VryFqsttRzM3vb80v+Kw==
X-Google-Smtp-Source: AGHT+IFY3SrtO7WmZXTStV8wyh8TYMTc06+T+E6W/aHVzJGdvKu4RJwzwf82S3gwX19eXmpm8COg3w==
X-Received: by 2002:a05:600c:1f85:b0:477:9c73:267f with SMTP id
 5b1f17b1804b1-477c01ff629mr225424795e9.33.1764303622896; 
 Thu, 27 Nov 2025 20:20:22 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790addeeaasm127396715e9.7.2025.11.27.20.20.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 20:20:22 -0800 (PST)
Message-ID: <69292306.050a0220.b2b18.5c2d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 28 Nov 2025 04:20:22 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764303623; x=1764908423; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rW09IEYeCn2SqqN+BCJcOYDC2vnNw11XnWL4V/GHa9o=;
 b=e2ToNyQSSIeuBr9OyJBcKbMmWsgTF2WfFgDAWIx97xvBCFI24in9usbIB5tiwPeko1
 St/Wcq6G5gJpgegpu0zVrqCFDDTUqxd4q1ScY9lYwu1RFi9A53UB8Qofc8GZ4/zp9KGz
 R4/c5NxiwP/CejeAXEllLLJ+jcaWKuvortS6yRmSPPcSU1kJVv+1WOnGRN79CAWAbcM/
 XiH9DNyNesDTAGsRW/2cKc2/u9PNWkfSR2zQEE3yI4bfiYveeb232c6HuphBUcWVRvGJ
 NdnUeQy6ncIjyJ7vwOa+UnYWaT13sdBb/e2rZ7dfeLwadkfABSdeiZRIydBcH14vfIE+
 ANLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=e2ToNyQS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-27
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

Autobuild statistics for 2025-11-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  8  |  0  | 10  |
  2025.05.x  |  1  |  6  |  0  |  7  |
  2025.08.x  |  1  |  5  |  0  |  6  |
    master   | 39  | 71  |  0  | 110 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 3 
                     kbd-2.9.0 | 3 
                   libcap-2.77 | 3 
              libopenssl-3.6.0 | 3 
                   perl-5.40.2 | 3 
             berkeleydb-5.3.28 | 2 
          esp-hosted-1.0.4.0.0 | 2 
  gobject-introspection-1.84.0 | 2 
             libgphoto2-2.5.33 | 2 
                  libsepol-3.9 | 2 
                  libsvg-0.1.4 | 2 
          linux-5.10.162-cip24 | 2 
         linux-headers-6.6.117 | 2 
                openswan-3.0.0 | 2 
                       unknown | 2 
             util-linux-2.41.1 | 2 
             dahdi-linux-3.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              e2fsprogs-1.47.3 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.88.0 | 1 
              hyperfine-1.19.0 | 1 
                      icu-77-1 | 1 
           imagemagick-7.1.2-8 | 1 
                  ledmon-1.1.0 | 1 
             libargtable2-2.13 | 1 
                libdrm-2.4.129 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
           libfreeimage-3.18.0 | 1 
            libmemcached-1.1.4 | 1 
     libphidget-2.1.9.20190409 | 1 
             libstrophe-0.13.1 | 1 
                  liburing-2.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20250530 | 1 
            lttng-tools-2.13.8 | 1 
                    mpir-3.0.0 | 1 
           oath-toolkit-2.6.12 | 1 
                openntpd-6.8p1 | 1 
python-remi-2022.7.27-37-g1... | 1 
                setserial-2.17 | 1 
                  snort-2.9.20 | 1 
      softether-4.30-9700-beta | 1 
                   swipl-9.2.8 | 1 
               syslog-ng-4.8.3 | 1 
                     tmux-3.5a | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c351b9f85bb0ceb36d38c7779a48cd53f9f9dbb6 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/296472ef23bcb3dc20cc66ab40e07a2536e51fd0 | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2ca14686102f462b126505f2b1d5de79a959258f | ORPH
   sh4eb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0c5185a6d3fe5c530ac76b70c19fecf1e01206cf | ORPH
    sh4a     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3bbb943e31d4287b50e38dad602e04a5a0815310 | ORPH
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a0e69751c2465c3ce1378ce7404f0f7b36f71231 | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/514432a7ef561abcda8db8a98281e96899532f61 | ORPH
powerpc64le  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/833730dcb108ac17017cf48266b95bbe0cc29e83 | ORPH
   xtensa    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/3ab7a201156b749438d683d40abc52ec5f169d65 |     
    or1k     |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/c2fd4dd7c4a3fe76633636535e87d3e3d50f86ba |     
   x86_64    | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/4dfc58679c2448daccd110d246b6477cfaff9634 |     
    i686     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/02a33f41c0a4bca1d95f19c3384130977f91f1ed | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/2625b20007ae2215fe50056d4f31691176a85861 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4cea01ffd1eddd0e197849429970fa3e81bc2f79 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/851c6b2b07b321085632fdd2824586a86f69af01 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/6082c9bf0122ed2ee797907057e7e344c2b5f57b |     
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/d491a20cbbbee520a7f9226bd2e3107ff57cdefc | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/849cf03a386c27aca0f05f517789030bafcbe4de |     
  sparc64    |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/8e672e04235d3fc4e5f4ae71569da51620fc04ef | ORPH
loongarch64  |            icu-77-1            | NOK | https://autobuild.buildroot.org/results/905c4a337fb0760ee6b1cb2d4bbce08b7fc7c57e | ORPH
   arceb     |      imagemagick-7.1.2-8       | NOK | https://autobuild.buildroot.org/results/e9ac665fd9e27648adb86decfd4b91f720b8e25e | ORPH
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/28fcc494f7080083d8ea9663c92ba90ea3935a9b | ORPH
   mipsel    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/e38c6e4bbfd3bc9f535389e3c147fc05d56aa6bc | ORPH
   x86_64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/6d8d1162d1b5909f6af293d2ef08984bf946b511 | ORPH
powerpc64le  |          ledmon-1.1.0          | NOK | https://autobuild.buildroot.org/results/942cb2dcd061b8620211b63d4be34dc414251b62 |     
microblazeel |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/e6c039cb92fecbd93a91d2d1dab68e803875e62c | ORPH
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/b6f445bc5a7ee0555402d0041c8d31d69e8a9c9d |     
microblazeel |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/7d4819c066c6cd5521cb8dace138925d28344580 |     
 aarch64_be  |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/b2f075ca902aa3d71c81ddd5580260e1fb953e66 |     
   sparc     |         libdrm-2.4.129         | NOK | https://autobuild.buildroot.org/results/c94bfceb406a66e390fbb121d834976a613ab94f |     
    arm      | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/6c70c02aadca299d9e703d67c88f824b620afb4d | ORPH
    or1k     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/102bda0a261dc5ef6d272b94685fed5dd6f93364 |     
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/adcaaf465d5be3c87a221415b77d2a27426df40d |     
    mips     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/29e172c7fad9e2d11d48621dbe7941f4035f4e0d |     
    i686     |       libmemcached-1.1.4       | NOK | https://autobuild.buildroot.org/results/288334c10a364a91eb82e4ec86c5c5e945db16e5 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/66c5ec67345307657063ab74dee07328a0f6b222 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/83101b1fea8a7fc33e3e51de987dc4e2f8042fbe | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/976e92ec2f7ade254c946331cf6555946a45c059 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/92f7c77cb41ea4c9d8e74846be5c041515a88065 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/41fbe2edec93fa4d39f414672fd857352704b4a5 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/43f55c15a1a664bf08f91e6cb17d0114f4956901 |     
 microblaze  |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/6e176c77a6cb7508b0502c77d78df78ae4602ef9 |     
    or1k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/838c7309568ddbc40d12953c01909e2da30d7517 |     
    mips     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e84c0f072efcd65221f1a049bdad571c36edde21 |     
loongarch64  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/2e1d61d48609178a6205159a8a336d697fcc22de |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9b092c51271fdd5be475b4620795f4ec18c630a9 | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9e0c6efd067d022691a6dfe3b95cd96426a8d762 | ORPH
microblazeel |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/7598b59db758e1e4d666397507e742bb2f7f6062 | ORPH
 powerpc64   |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/069c7eeff92d7eb55d50de703ec102fd2edae035 | ORPH
  mips64el   |     linux-headers-6.6.117      | NOK | https://autobuild.buildroot.org/results/d1051ddd9011e8f98055a44ac9536634892ed179 | ORPH
 microblaze  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/e157bfad12e8923f0c7472d83050a471bacd3348 |     
powerpc64le  |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/d0e74cc3bb91f8eca514240edf950ad2a1ab5056 |     
    i586     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b70d499d253809800449d815cbbc089eaf5663ab |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/182ce69b7baaf68316ad52b55e3e6f4d4ca66e92 |     
   s390x     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/274b434da77a943d848d545ae88162edc197b89c | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/3594736b28a67c1ffa77acb46c9b640063305bb6 | ORPH
   arceb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/190f6f76c41c184e9450d52d7be67c67a3980aa7 | ORPH
    sh4a     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/78efa99e1c864bc20970b3ce495cceb1f981ff36 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e4473130ce3d1da041bea348be9caf0c9f50c2cc |     
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/66067cc0a972b900cb0be4c345f929e98663cab6 |     
 aarch64_be  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/21b2ca18b89695e2f34f227b7105a6e904f4904e |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/1acebd7e2aeecbd5723f5c3b22f94176e98bbc42 | ORPH
  aarch64    |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/2fbc51445564a48f4fd7c7d150018cfe006a8aa2 |     
microblazeel |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/34b7d522516edfa4e6c28149c1346189cbb7ba16 | ORPH
    i686     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/1586997a84236b678249ac45b83b4e330e727f39 |     
 aarch64_be  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/22b95ab6971430b52628a2071e53a3a4a1e77549 |     
    sh4      |           tmux-3.5a            | NOK | https://autobuild.buildroot.org/results/6510cfb16d0c3f3772918cd3bde0542d0b59a230 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/86ba1403ceb0e3b1c7eb7600c13b674dafc06954 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/eedac1e8a5a6686f77af31eb5ac13158b52d23a6 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/05942baf45ea8a773fe83e1986bc7602c8d5a7ee | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/c3d098dd485bf52b3599e03d22da7b2cd7fb053a | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                  ffmpeg-6.1.3 | 1 
               host-ola-0.10.9 | 1 
            makedumpfile-1.7.5 | 1 
      passt-2025_06_11.0293c6f | 1 
             util-linux-2.41.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/f70351816eedf97adcf0c528ae8574a334844077 |     
 aarch64_be  |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/5e97463e11773a246f60641858ba60053f60df2f |     
  sparc64    |       makedumpfile-1.7.5       | NOK | https://autobuild.buildroot.org/results/471ba5b457980b97c83b0cfe95ac12969916e466 |     
   x86_64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/bce9d74eb0dd556e1f2263ff6718c0c26669a4d0 | ORPH
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/dd36971c3996fe88e60ce0ee969714ecbea7cfaf | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  iozone-3.508 | 2 
               bctoolbox-4.4.8 | 1 
 host-softether-4.30-9700-beta | 1 
              host-swipl-9.2.8 | 1 
                netdata-1.37.1 | 1 
                   perl-5.40.2 | 1 
               syslog-ng-4.8.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8069f14c5d8492458173e6bdd2fcd52fe93a6693 |     
    i586     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/d3b78ffdd145e66dab2177a4721b82e53f0c547f | ORPH
   s390x     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/7c6cfb29fb041dc5bed3e875da712033010ca256 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/a070f05cda1d247ee3b82edac14ee100bedbbfe4 |     
   mips64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f7dafb484c2b36d0fdf9fe540e2c16b5013088df |     
   mips64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/9171051e5c49672243d3690e8453135d0bdc5c5c |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c1da60acf672a072d4f1eb36813aea4bde222d63 |     
   s390x     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/87b074b155071dc7a26d9b7ce963a798e144eceb |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               freeipmi-1.6.14 | 1 
               host-ola-0.10.9 | 1 
                libcurl-8.16.0 | 1 
               libvorbis-1.3.7 | 1 
                       unknown | 1 
               valgrind-3.25.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/28c7431d0d4e0e82b754477e2ff2604b5a899a83 |     
    m68k     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/a0fce0b22d1665c3123a5671a624f00b25839d01 |     
 microblaze  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/9b3dc18eafc9572042a2fc1cdc32e6c7a54d08a8 |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/b3b2110a3422f2a67b835dbc6f6aca3d417d7c5b |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a12a466e9ad4401ca9e9a7925fb144e3d9b12a9a |     
   mips64    |        valgrind-3.25.0         | NOK | https://autobuild.buildroot.org/results/98aca38da415a98cc85301983c22eee8ba65f83f | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

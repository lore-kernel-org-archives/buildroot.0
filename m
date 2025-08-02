Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC0BC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  2 Aug 2025 03:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB9F983F75;
	Sat,  2 Aug 2025 03:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhvUxLwyp8Wu; Sat,  2 Aug 2025 03:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75AB683EBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AB683EBB;
	Sat,  2 Aug 2025 03:14:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32B1E93A
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 03:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E59D4006B
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 03:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGx-92ULnpAR for <buildroot@buildroot.org>;
 Sat,  2 Aug 2025 03:14:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF15E400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF15E400D3
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF15E400D3
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 03:14:33 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6157ed5dc51so4522775a12.1
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 20:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754104471; x=1754709271;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=brvKyBodWHaz51QOTtfO7pSOW82xzT2SFCHwPfPT1qM=;
 b=wkYkjZTN3do9QTE1gsCMaN07VHolNTcWDBqZLIx9WcUDOtYR+MYHHuz5Jbs8XJ3vDb
 RV6OtlqMUUAC1lPFWa+h1nCzdZjcdcch5O47Jl0m9zPXrr4tBKKRxoq9KqUBuWpwRwKZ
 uGuPrGixhuHBIuye+klZLLseZoTwVA0GCN6cMLhoS9N94fN9HFW2zQ3CPq55VG7Drdre
 UZymBS3JmXuqBbwO+RhhTUo2XMsGU8a/gOw7QL9OZmo5lve7kp3++iXJszDorkGi/1KP
 WhyIHHX/ZANYzLHsdSlvKRsELHQHnisrNa0zkqpnSt03dzbF7nVaVEebBLOQrPEYdPNA
 0GGg==
X-Gm-Message-State: AOJu0Yz8AY/iRnhOfVN3HWoEMwYICho+dTmqG5ONQk26g0VWQHkd+dQv
 k0e58KCWFPKRJLHMbSI/KOg8LuvXbNUcOAJYBo0nK+vxwbWJ6tuYt8uPv71Y0g==
X-Gm-Gg: ASbGncsNipPMOXppR13QArYbaFrrgUN4LrFGayGYfFhmrJmhJHnHhRiO8hBwTKKjs72
 lX0xlQ9NSRY5Dre4jAMrKZKHxN6DOk/QFwIOyxkSmQ/+eVGb23myF+D2YwGSb1RJJoD9WUiOyum
 lbpY5l/X9izIpoqUR+zByoc0g1OjDSTCXeqsY04D8nIEF6bjAem6bhJLRdIQK8sbqxrtZD0nY+R
 Bzh5au4SMTg8Jq8n1TDE2FFVHqLsrORS82PR6UBuSpuOrfrwHhBDPHaH3o2tIyyXhKDz14kQf80
 n2fcpwasdGZflWp1rwoV44gLVoIsJfyV77ncAR7DzvOZ+sDVu6CFbX77ox0zpS16UjhqXBRV0IE
 MjxpapeY2Td1/TPtm1cfiTp5p6w==
X-Google-Smtp-Source: AGHT+IHwLF49iCU/uSqfCF3sky9RL7ueGl2/eDUBXvuTYgPhZ7T+hftY6/TBzGC1t7GtbmHN+Syn9A==
X-Received: by 2002:a05:6402:274e:b0:615:db4:74dd with SMTP id
 4fb4d7f45d1cf-615e6ed217dmr1488900a12.13.1754104470141; 
 Fri, 01 Aug 2025 20:14:30 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8efffa5sm3537983a12.12.2025.08.01.20.14.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 20:14:29 -0700 (PDT)
Message-ID: <688d8295.500a0220.39e2dc.05f7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 02 Aug 2025 03:14:29 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754104471; x=1754709271; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=brvKyBodWHaz51QOTtfO7pSOW82xzT2SFCHwPfPT1qM=;
 b=KNFw7p/J0vts7Feole1zRgYS6xCdtR5fNVOWASJT7QsdzWFRlttpHjU5M5XRpvTGzk
 ZWNObHrJoHI/+MhG5obQZ5vnxjkg4YOyTSsmSaIz+1Sc10jH+jqcTCMn7YzI5jEfd6Vi
 R9N2Z/rWOlnuJXkfUr0R/32qqbN1TLDCAQ1SEQn74E6MV9VHe+RXnd7igD5itiphJbO1
 qmu4G5jC0upC3DCrhmwMR68J+aZEiZZXlrEH5IMWz6xpMXv0bxsJGBfDWWN1ijKCTbOk
 cbZugWE9paP9s4tglS2vgESjdXrBuTbz7AnnjA9zPzs0Zw8SdCHyeV0grsLG5gQkXd2e
 0mmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KNFw7p/J
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-01
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

Autobuild statistics for 2025-08-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  3  |  0  |  4  |
  2025.05.x  |  2  |  8  |  0  | 10  |
    master   | 33  | 138 |  0  | 171 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-14.3.0 | 5 
                 host-gdb-14.2 | 5 
libdbi-drivers-0bfae6c43134... | 5 
        liblog4c-localtime-1.0 | 5 
libsvgtiny-ea9d99fc8b231c22... | 5 
                       unknown | 5 
                   bash-5.2.37 | 4 
host-binutils-arc-2023.09-r... | 4 
       host-gcc-initial-14.3.0 | 4 
                liboauth-1.0.3 | 4 
              libselinux-3.8.1 | 3 
            netstat-nat-1.4.10 | 3 
               asterisk-22.3.0 | 2 
               bctoolbox-4.4.8 | 2 
                   cvs-1.12.13 | 2 
  ffmpeg-n6.1.2-27-ge16ff06adb | 2 
              fluent-bit-4.0.3 | 2 
            gdk-pixbuf-2.42.12 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-15.2 | 2 
    host-llvm-libunwind-20.1.8 | 2 
                  iozone-3.506 | 2 
                libkrb5-1.21.3 | 2 
                  libsvg-0.1.4 | 2 
          linux-5.10.162-cip24 | 2 
                 logsurfer-1.8 | 2 
              mariadb-10.11.11 | 2 
                   nanocom-1.0 | 2 
                openssh-10.0p1 | 2 
                   perl-5.40.2 | 2 
                setserial-2.17 | 2 
                apr-util-1.6.3 | 1 
                     bc-1.07.1 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                  brotli-1.1.0 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
                     crun-1.22 | 1 
                enscript-1.6.6 | 1 
                 expect-5.45.4 | 1 
               freeipmi-1.6.14 | 1 
            gettext-gnu-0.22.4 | 1 
                    gpm-1.20.7 | 1 
host-am335x-pru-package-5f3... | 1 
  host-gdb-arc-2023.09-release | 1 
              host-guile-3.0.9 | 1 
               host-runc-1.3.0 | 1 
               host-vde2-2.3.3 | 1 
            igd2-for-linux-2.2 | 1 
                       jose-14 | 1 
                 libbson-1.9.5 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                 libgee-0.20.6 | 1 
             libgphoto2-2.5.27 | 1 
              libopenssl-3.5.1 | 1 
     libphidget-2.1.9.20190409 | 1 
               libxmlrpc-r3176 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    linux-6.16 | 1 
linux-headers-5.10.162-cip2... | 1 
                   linux-tools | 1 
              luabitop-1.0.2-1 | 1 
                  mbpfan-2.4.0 | 1 
                    mpir-3.0.0 | 1 
                    ngrep-1.47 | 1 
                openvpn-2.6.14 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.7 | 1 
             python-webpy-0.62 | 1 
            python-yarl-1.18.3 | 1 
                python3-3.13.5 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 samba4-4.22.3 | 1 
                    sslh-2.0.1 | 1 
               tcf-agent-1.8.0 | 1 
              tinyssh-20240101 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/bbdd140ce6981baac14b90d4feb07215f912081c |     
microblazeel |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/3b4a438251b44ee0ce1ed508e2813c63d85df531 |     
microblazeel |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/30c748de58b4363e951dfff900c15dd01fb160bb |     
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b80c23c3752b7117029abea244aaedb36a429c99 | ORPH
  mips64el   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/feb864c42910da47f9e944b43ab7e2f478a2e785 | ORPH
   mips64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/d531a78bcc4b1f33d22dd7707444394a0a56dfe9 | ORPH
   xtensa    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/134966ae2556deff6b34638c1723d08295a07fbc | ORPH
    or1k     |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/f891329561ef518dd0fc168fb996ccf9a26891fd | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7b7e7e58d7d628064d3e02176f4bba4e2cdbc419 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2766cb36ab9045976f4d134a4a1025313a9d738e | ORPH
    mips     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/760dea795f47d6262372f191e4d6fb76832edabc |     
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/86622064a7c2cf0bc0d1a0ef47019f80f07521d2 | ORPH
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/4e0d9c91c39416f249d4f61fce76e37ac101e735 |     
    sh4a     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/35bf7c71b8d46e8c51d765218cf82e001948a3f4 | ORPH
    or1k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/7e8894a392b44a15e40e39b2e95fe5c1b80bbd25 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/577df1bae1b93bd85b168183e8981577ac324974 |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ffe742f8aac82c0d30ebbfc092e8285337c40a1d | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/10b421063b4450910e03e36f88f2cce6008dbf63 | ORPH
  mips64el   |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/0f5eb5224ac3a43a458d9cfe16817e34144cc9a9 | ORPH
    arm      |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/eef2e014c6d5c8b4afa412aac3b9f928bd41c0cc | ORPH
   arceb     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/a1bd2d0223459e3cf402dc1050b78d06c4199494 |     
    i686     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/82b8ef5114dc951ae583d284c7ce6c444603825f |     
    m68k     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/a7eb5203f6cb20f172e66b02420da5327b63f5b2 |     
   x86_64    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/a25c6fe9f65280dc35444fafcfa8fc02ab842b07 |     
   mipsel    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/30820b448375a129acccd67e79648e310f405581 |     
   sh4aeb    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a2029af08856a991e9cf7b84b334d1e6a605b0ed | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/2537f24f1cd74a6ef3c79178a39f59b0b6e8d23c | ORPH
  aarch64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/4c9044b2b273db464002caae56215dea2d840387 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9f1028ab1979b3604adb26602031afce1900e7df | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/75b1dd47e59b9c46118abbc600f0db7fe30257c9 | ORPH
   armeb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/96f5fb4e9ef182ae157053373c4f2018ae9b8e03 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f96ea9f7f31a2e20a27eedba00bd6a3675381149 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4a9d83673c32888276c6e035f93a88fb11d15e94 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/98db17a413a0d80939e193450591541dd0a06e5e |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b0dfa8721c65ac83e5ad210c7c0280d1725fd0bc |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/eb3c13e9ce3eb95f792f96624652da9cb5c163be |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/a461d43467c1f4cc05527a09ff48b1f21b6853bc |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/3e9811cee0913d9ee89f096376da79ab58df7eb2 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/5896e0b713c6269f31346ee66df6cf74b7c92e8a |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/4764942261aca2104aeef11b9edaa97ae4ed743f |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/f272768bbc4ad282e2f2f30ed793b15354ac9181 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/1ef3644ecf688872eb8ecc2874443157d0aa04dd |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/6eca79969c5fb8e2e02b70762286c451b6aedd70 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/6d6168dff8a264a4eae88e6baec7dd3cb62c5ed1 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/da1098f79f9bbb334527fc6aafdc195326ef4487 |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/01f219619b2feeec55b75e60e3ee5cc06e94bf19 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c0f80f4c4675349bf8544526b8b18e9a8ca4a9d0 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2d67718a43d807a8800a2d03f22ea87e3b6d067c | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/80349ffc516fcacd19624a1915281d715f741d6e | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7c4f9fdb4252ae8f6c441a3e6b10f88c7314cd79 | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/cebd0354403ad39b1dbfbd9a4b0ec0b97cf14857 | ORPH
   s390x     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/b3cb6260a0371be282108309e4a10f6e7d248b29 | ORPH
   arceb     |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/af4aaf8a5b3222e79c2d0b3f27e25651fad7e9d8 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/bdac47f87409502b94408fdcc04df2faefafc0bb |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/40c4e6144b21449b1b610bd0e9d201014a89907e |     
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/7317bf5b6883163122bdb5a2c508089f6b0aaef6 |     
powerpc64le  |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/67e18aca2205bcd3f1deefbfc2a905a6cdf6c8db |     
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/b3340c8cc20ab2bb9a29e007d8906b46cefcf999 | ORPH
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f24120d43108fd6cda4ea60d67c1af387d82a073 |     
   x86_64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/93a3cf68f04495f577257ee9dfc40f8fc8ad3f49 |     
    or1k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/acc81398e179e928d552ee08d1b623f90b887ae3 |     
  aarch64    |            jose-14             | NOK | https://autobuild.buildroot.org/results/e77919f80a5052b050ed196e290eb9437ec52ca0 |     
    arc      |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/25307c2fdf8713ab5160f18228844f475e17019c |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8fee26aa8beebefaf5e1513f232ca98ce72cf734 |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c673024dbbc6fe4436f00986cdb1b93dd9de104c |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5c96db2ac54302ef1b32541ab778d55733117a74 |     
    i586     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/28682ed2c0726cf1bd7ffa53726701da8d41e9a6 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5a69393da5aded224bfdcf3b4157ca690ea5289d |     
    or1k     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/544f6f91b6741317818e4e82ee2470fbd444731a | ORPH
   armeb     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/d40c7cc0bdf8481f59445ae5ae7f7bc23217edb8 |     
  riscv32    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/620313d426109b10a5a79d1c8150445473730dd1 | ORPH
   mipsel    |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/19186809c65347ac158205b963cb266639f28d01 |     
   mipsel    |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/00681c9f66c8c7dcd1d53b7508ae71ee2e51948d |     
   mips64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/f3b2b37795073970e994f66aeb6051398579fd86 |     
  mips64el   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9006635de4527eead07340ea379ae647c99562d4 |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/673be8b516681d644e061eacbfb9840ac53f2101 |     
   mips64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/52a54d3dac709195ec8be93d1715cc0ddd20435f |     
    arm      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e692a49f380d79e8f8da3cc81544b8f57db55c0c |     
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/c9bbd6999cbb149704b08d28f06a4545479ed6fc | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/14cb4155ca56927e79f11ccc71df5d27bf3ab7d8 | ORPH
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/3200e53fb68e2bbfd65e0d16943ead49c7bade06 | ORPH
   sh4eb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/f708d20699470a2473c1801c0b3992ff6308ea5e | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/c0408116d9fac5aa2573f38e09b9599b25b3183a | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/11a6639b1eed386266d3f1b039289a30b21bffdc |     
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3fcc05d4c58817d707fc5850b948c8d80fe6d823 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/094fe365d9fb30cdccf40def8e2dab221a96c58c |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/756fd32bc94a8e115dfa466d2098d708916d8404 |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/02f72830183e4fc38930537cc39e280522356a10 |     
  riscv64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/a57601338bce57f3145c298f8cce9c5cc46ec7c1 |     
    or1k     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c8a9712bd8f32ca5d8bebb5ae509684be334c095 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/bfc3b663cbeaf3260ed150928e7b8f2b5bba2da8 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/913edf1658757a3d292c59ed5459eaae87fdd1a4 | ORPH
   sh4aeb    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/1952ddc7a1fef7b50ab21e0cd930fad4e69bffc5 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/946dc6206cdbd420ca412818568c39eb12439029 | ORPH
  aarch64    |        libxmlrpc-r3176         | NOK | https://autobuild.buildroot.org/results/1a7ec28119cef0e1b11557ec06bfcb7deb1efa48 |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/feb4dfb5be707a2afc6867903b08ca50269c07c7 | ORPH
 microblaze  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8adf1511d1f27c49a08424fc355291806efbe270 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5ab48299516e231323867a4100210d54f8974cd8 | ORPH
  powerpc    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/c4b4621c743c5ffb9cb334595d6c5b0e7e8cf98a | ORPH
loongarch64  | linux-headers-5.10.162-cip2... | NOK | https://autobuild.buildroot.org/results/9b720f94e4a2bb6a905ae1c08373c37ecb8b3b80 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/86c9d8360e85eb12c1eac4be7244afaf13fec80a | ORPH
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/539632f3bdecf6c6cbd2c8f7bd46aee873ea2968 |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/dd5014e4be34a55c76c7438dfc6ff396e705a08d |     
   sparc     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/ac107dd2aed650aaaa6455af5b565210e81f654c |     
  aarch64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/8c5f89f475ec243622b81d4422f2f45e4ceefb12 | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/cec2c60671b399e912ee06a830b703d98267c161 | ORPH
   xtensa    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/ba4d33d29456c21a0e02bf395430d26f67bc9cd6 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/dcfe0a9d3c5ecfb810aec0728dd5fade9cacc655 |     
   x86_64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/968b91c85ae1058019b1b386203097a5dde3b7ce |     
   mipsel    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/c82a7e131a87140ecbaf69820786894132e0f5d8 |     
   arceb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/0d4f93f1dc32b8dfdc459e2fa156414fc458015d | ORPH
  riscv32    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/fbe207173d264a9a49bfac796f09f020ae56366a | ORPH
   armeb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/09a86506a91f84e4a378c9c4bfb67f74c00716c3 | ORPH
    m68k     |           ngrep-1.47           | NOK | https://autobuild.buildroot.org/results/20b924c5c96b3f43e381d87e59fb160ba8d3dcd0 |     
    arm      |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/7ad19921e77f1ff0c6f33cda4cdb15c29344bcfb | ORPH
   sh4aeb    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/51932c6dd60befa4736e688873fadf8bf9af8317 | ORPH
 microblaze  |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/8c3b3d8edfbad49dbc12f276c01964d9bff2b95d |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/bd40605435f928a5d806aaa2cc3970dc7a45d9f4 |     
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/59839ec6db5737db007de3c3c73f2700eca6b9d6 | ORPH
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a02b12d0855224db82381a4230545664459eab7f |     
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/65059b9fc024a5fe31abbbcb3307a6167163680b |     
 aarch64_be  |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/ff553012260f17c996a21b1b10abe6399337444d |     
microblazeel |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/5832246804cf9e6df92cf4c5c5c3edc5188c6039 |     
   s390x     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/5cdd564b3ef5c20c8e98edbf897ae273e863a876 |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/e8a8b8a69651a269b6c8fa04600aeb84b1818a71 |     
   mips64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/738aa24cfef4840112ad38d5d6125e15af82fbd1 | ORPH
   xtensa    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/ef1176848759066229463b8cbf0f148beeb93ce3 |     
microblazeel |         samba4-4.22.3          | NOK | https://autobuild.buildroot.org/results/dddd177f09f693edd337897b854a9687ee5a6df0 |     
    mips     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/66e4d02263771ea39333d851ed2b141adfb8f822 | ORPH
   s390x     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/0f2a1fb9fe47dd3138d80cde3e1363deecd3b96d | ORPH
   sh4eb     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/3d7c47b61dffeeb5395e3eb5c2dfa7ef44abce4b | ORPH
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d06e225613e969525b94cb91173d6eb465cbb24a |     
   x86_64    |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/94e2b79050df5a764b92a904f657e6ed4de7e223 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/f8f0de25337fca4a434041487f2d52b45614367b |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/6572df633c3a65e88c23901a5bcd1d36930705be |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/acd783512ddd1311ec38b1e927bbb1296de10164 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/b8326b4c4589a2d939ff926442a7b426675a344c |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/9372d348578830d2d683165f6f0d8d1956671696 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-rust-1.82.0 | 1 
           oath-toolkit-2.6.12 | 1 
                   perl-5.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/543a968c554b412d59f4ddec577120943fd21fe4 |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/702c7dbc8a3605c28bf80439e8dfd193043c5104 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d4d8933f999abdc8ca03b9e694ba9ea772c111d3 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

firmware-utils-86739f2b3ae9... | 1 
glibc-2.41-5-gcb7f206537240... | 1 
              lua-utf8-0.1.5-2 | 1 
              mariadb-10.11.11 | 1 
                 netsnmp-5.9.4 | 1 
                   perl-5.40.2 | 1 
              skalibs-2.14.3.0 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/ad4852a12d8f3219233c3927693717a9ec54636c |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/9ec8dede01696e398b338669c0d61490b5410e1e |     
   x86_64    |        lua-utf8-0.1.5-2        | NOK | https://autobuild.buildroot.org/results/c86db2e1e6f77e5c007766c82322d4fb9e0bc960 |     
microblazeel |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/8cb12dbb6bdd177525f3833c248e469b8315d01c | ORPH
   mipsel    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/f1c69ccd839fb150477ceb9ad711961eac7c0648 | ORPH
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9b14ae58b57d59b6de7a204c9a30be0299edcdbc |     
    mips     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/c4b6a3dd745f87ac4740887a390b296e4280f0cc |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/41c32b40fc7cd3c4110af0916905d49d7f0a4e64 |     


Gitlab CI results for 2025-08-01
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326446 |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326499 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326508 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326560 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326568 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326573 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326581 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326591 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326606 |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326611 |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326622 |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326631 |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326642 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326648 |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326655 |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326662 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326678 | ORPH 
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326686 |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326695 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326697 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326701 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326703 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326713 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326717 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326721 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326725 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326726 |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326799 |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326902 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326926 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326931 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326937 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326942 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865326990 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865327017 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10865327024 |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879814258 |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879814219 |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879814346 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879815805 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879816381 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879816665 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879825365 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879827917 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879828641 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879828827 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879829578 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879832047 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879832342 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879832491 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879832596 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879832902 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879833024 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879833548 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879833745 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879833917 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879835514 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879836225 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879845373 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879845735 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879846177 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879855044 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879856366 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10879856897 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

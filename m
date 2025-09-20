Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D1DCAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 03:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97A261524;
	Sat, 20 Sep 2025 03:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QV-77ZvKmKT; Sat, 20 Sep 2025 03:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 926C661525
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 926C661525;
	Sat, 20 Sep 2025 03:20:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23D47D7F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 03:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 872A161520
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 03:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMnCXYLsFy3e for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 03:20:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C107961522
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C107961522
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C107961522
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 03:20:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee1317b1f7so1351223f8f.2
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 20:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758338450; x=1758943250;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=taLqSMT9V3V5cdPITos3CVztcVqVpyhswSvy/wKOgLc=;
 b=ox4zh97k/fEvhMC4YfKTiWpcPGwAAEAKlDMNt4uUwOEM2Mxsc2GXsE/rZnIoeURwQY
 f2Qqd4o18QmD8Uj0FV3a0N6pMCCkhnACBgYDDt/yVmU4B+OO8nbIjEUPFzwHrmyrUgBw
 StcAcF2CRQjEhD7p/a8P/BJ9UJpouYZYWq9e68p+0rhmE4vAviuiwEFWEogTQtHpA5wK
 O9hGZeDMAKRvODx/r3i6nmyalkpe8xROOIR8y3lUuBMIRzVrFwXcOT1zolQdAADxAAYq
 N3jncIJ7s5neLbqd2OaOfbVjistv1HSaMvU4vHfCmffp9Eg9LtLOGjyudGu9xHTdyOEZ
 tZ+A==
X-Gm-Message-State: AOJu0YyouZpNFcO+vNbokE7BYcvSjYMWjRqCvim61H4PZAbBN8avwvYi
 3gw1tBpXulkPesbxQNSoTRtEIQx7dAt19USr+cbJS6b81faPbZBYEX4fF0DCVw==
X-Gm-Gg: ASbGnctqex0xyjYQrRm1NHk1RkwbRttyzX+4LFK3clDM3T84wsgPCYw8IjFSPQSKKs2
 PZ33TpCI6VhmqVENsDLMmAETpRDoOPAqgpvwNMZSvIpM8sX691Tia7ncCGol7+6A/XUFCpd5gsq
 tByLDa2cTi1mfLNPwOYm0VXm7dGmELddFqAdhVADHvjvvsdc+itTqrKfn/OfExa4NAgyR1wFedd
 XGobvjY89+l/Z9oNtI8QtXJ7dJvkELqXMSyvN2vFt849uotkY0jp3NspVF4HFNXsCwFC4WaRZ0/
 6V2FqDZpGeOSBA/yDc9EZLX5dYRCqAl63vq6w501JBsl+7L4nZ24BX82HW95mXT+ML8TSAT5VFp
 4gHU+PAZr44mpn6tOvLY11MhHMg==
X-Google-Smtp-Source: AGHT+IHj9QXd8BBYzxhjWyXbuvqn3FHzGkAYi6YX4VGHWuOCzVl0GA85otTifYOW8AhQ4ElD8yr4OA==
X-Received: by 2002:a05:6000:23c8:b0:3f2:41c4:c7d5 with SMTP id
 ffacd0b85a97d-3f241c4c889mr1607809f8f.36.1758338450273; 
 Fri, 19 Sep 2025 20:20:50 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbd61adsm10058540f8f.44.2025.09.19.20.20.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 20:20:50 -0700 (PDT)
Message-ID: <68ce1d92.df0a0220.2d2bc5.11f3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 20 Sep 2025 03:20:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758338450; x=1758943250; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=taLqSMT9V3V5cdPITos3CVztcVqVpyhswSvy/wKOgLc=;
 b=m8TFqciyr+EpwrkQ9Z7ULdYI+qFcxE1ltTTa9D4PRlP/xYdAdeH06kJ6O+VEAAka4l
 /2x8DvPv/xBEWdjmcTZ0sT3pN38hvP3lCWcsZfbjrIRGCP7zaZfkg0POnMoYkLlsB2AY
 Ig+oTTi0PKv1xaluFC3wyaFYrWF8qaHUCp7K8y8GsfgCr3mM9MXpnlO+mcl+9h7mgV6n
 EeA8/Lm054qJHyKh2nH4OEVRjEu8NaH4WRIeW84WY7ObMm4DKafrO7nFsLz5E8+N08RY
 kTveo5uawglYefcxnTEwVcQBvv3JBLNcPVCTEaNwpdnJ+CWoZ8Lp6O7fX6zlC7fjOe3e
 evgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m8TFqciy
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-19
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

Autobuild statistics for 2025-09-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 11  |  0  | 18  |
  2025.05.x  |  3  |  2  |  0  |  5  |
  2025.08.x  |  4  |  4  |  0  |  8  |
    master   | 45  | 81  |  0  | 126 |

Classification of failures by reason for master
-----------------------------------------------

                   perl-5.40.2 | 5 
                   cvs-1.12.13 | 4 
libdbi-drivers-0bfae6c43134... | 4 
                 logsurfer-1.8 | 4 
               bctoolbox-4.4.8 | 3 
                  linux-6.16.7 | 3 
                    mpir-3.0.0 | 3 
                       unknown | 3 
          aardvark-dns-v1.16.0 | 2 
                   foot-1.16.2 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
              host-guile-3.0.9 | 2 
              libopenssl-3.5.2 | 2 
     linux-5.10.162-cip24-rt10 | 2 
        vulkan-headers-1.4.317 | 2 
                apr-util-1.6.3 | 1 
             berkeleydb-5.3.28 | 1 
                 coreutils-9.5 | 1 
                     crun-1.22 | 1 
             docker-cli-28.3.2 | 1 
               dvbsnoop-1.4.50 | 1 
                espflash-4.0.1 | 1 
               freeipmi-1.6.14 | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-15.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
      host-uboot-tools-2021.07 | 1 
                 inadyn-2.12.0 | 1 
                    kmon-1.7.1 | 1 
                  libbpf-1.5.0 | 1 
               libcodec2-1.2.0 | 1 
                libcurl-8.16.0 | 1 
                 libgee-0.20.6 | 1 
       libpagekite-0.91.201110 | 1 
                libroxml-3.0.2 | 1 
                  libsvg-0.1.4 | 1 
                  libva-2.22.0 | 1 
                lmbench-3.0-a9 | 1 
        ltp-testsuite-20250530 | 1 
                 mdevd-0.1.6.5 | 1 
                 netsnmp-5.9.4 | 1 
                     nvme-1.12 | 1 
           oath-toolkit-2.6.12 | 1 
              openconnect-9.12 | 1 
                   openrc-0.56 | 1 
                openssh-10.0p1 | 1 
                     pound-4.8 | 1 
               pulseaudio-17.0 | 1 
                python3-3.13.7 | 1 
                 systemd-257.7 | 1 
                      time-1.9 | 1 
               valgrind-3.25.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/9bfdd076d4674481665676b3668882468a144609 | ORPH
powerpc64le  |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/e70b35226c68b139d0821c02787ac60f65d830c7 | ORPH
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/8826696d037a4d848fbe3f13396d8e84638c2248 |     
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/79c07897955414886365e39b7cdf6fc658bb8389 | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e53002d52af9c4fde64122e703ccd7604a2994cf | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a947d78336b74a674cc525e754498ca9e25fa4e7 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b45c509737927dc905b7965a13fe6337542d93fa | ORPH
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/23b652be8a7f00643cabaff471ceda68776cbfed | ORPH
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/e01971a53206cf28eeb8180aa49a6901526a5b72 |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/21ea328113d1128df4d9a32510466459a683ee0f | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/38ed8e2f109c25361ffdab04e5420806f5b76988 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/baf9c9d4529df4191a21037d528a19bf124d9873 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/05b1a48233072fbda09984248fcc8caefd4b7e1c | ORPH
    i686     |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/a3027ea95932f94313ac0e7b5ec41bb7866a043d |     
   armeb     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/1f809b7d4d3e02b14efe3af29aa6f10d19a958f8 |     
   s390x     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/999ad3ce6ce16f6f331d39237e559f600022ffc9 |     
    mips     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/0c463348b40b200596d8e8f3363e96b3fc73db34 |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/8a1853ce7037b4fd7c591af62324d80d89496c13 |     
   xtensa    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/e026ba04b9af7959d6ac6e247be0b8841ffa0878 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/114cd11dd6751948def98b4d2f0ad995c0a76f03 |     
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/08a6a52bfc9c9f6a40971c04439eb4fa71dea052 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bd06258df796d0b9ea282a96852ffbdf3961ce50 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/1d1dfee30fd02bd630f637532f8ce4517d3fc0ff | ORPH
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/ba85f58b3919e4c1b11cbfd5d091f73f2efb0064 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/298809928fff50ce4154da7b0feee3b8da389d03 |     
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/bf47285cdf5df634c9da53d1a2cb38f35d8aebf0 |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/ba321c0eb3cd9c8defd068067fd4e657a5c34297 |     
loongarch64  |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/d0eeed90d556190959462bfe372087795b54f375 | ORPH
   mips64    |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/e86e190905bc822004d08b27407cf9aa612d7a03 |     
 powerpc64   |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/9dca66fa042bd1a6b7a4ee5513d8c6359b1f6112 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/e180d21d26d5f0de7e612d431feeae8d264adc99 |     
  powerpc    |        libcodec2-1.2.0         | NOK | https://autobuild.buildroot.org/results/c6a0905503070dd618760d13c53363b580d3b18f |     
powerpc64le  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/bbc95850ab455283783ab7555ad906d805716511 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/30778eb941c9650d2a46c4f251655cce066cd427 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/50c890f6336153b37e13e697f4892ce0404fa14e |     
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ca81174d874c182e6232f33db893ebe9a4b5dbd5 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5a2f661ea96be00bc1b77e245761363d45d960c7 |     
    arm      |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/2b711158ddec4d04f3a4f40fbf239cd6f1631040 |     
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/c500c851fd6e34e2f525332968456ece5ca55a49 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/01349badf55ca5e339390872e734a24c34793523 | ORPH
   arceb     |    libpagekite-0.91.201110     | NOK | https://autobuild.buildroot.org/results/b22b46ee4b44e019089ac47d9b0c5608015c02e4 |     
  aarch64    |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/371b8672222f24edf875c3a517a0806d8d7a4dc4 |     
   xtensa    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/38d3bbca08124246ae7e8cb8675bff764e144f98 |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/683a833fc146a72b1f96cf992ffac98c33623b9b |     
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/35488e57b6c3fe8269bb5c2701a41c8efe89cc36 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/7a2b552270d4c2e806fea00c54f0e7a1704f1bfa | ORPH
 microblaze  |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/91f38617ab2fafad531550554433ee24ed802609 | ORPH
 microblaze  |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/8c1dfe914387cd88e50e554b37b4ae0c2ce9d742 | ORPH
   mips64    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/f3d072f67d31a13a996b36842a0c88dc2ff8a1a1 | ORPH
powerpc64le  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/327b5edcbc0945f5094b0f2b7f7ef1477366cc37 | ORPH
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9e6edbe18c030a7e8a2c19212344d17adaf3c915 |     
    i586     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/7f772c9c7696f8b479481127eee01d72597f781e |     
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e64c24bd6cfd52945b7ec1312489bd62fe37f7ae |     
   mips64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e5467c5c39642c8a2c4a899e5660ef5a4f28f686 |     
   mips64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/d3683c50613e106725a528dfae88cae63ac15cf8 |     
  sparc64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/648914c6524e332a9ca94fd8e6d703f60b424661 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ca65050c379fcf1666c07298e7237a308d54c158 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f342137f4f4831b0e9878b6f8afb1b8d678ff8b8 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2c474ac4660ec0fd9db1372f2653ff242c861cf7 |     
  aarch64    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/1a21204e10c8ca703b4c1fac17255f536371ef76 | ORPH
   s390x     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/2741c512296fe4eebed598eb6589ec6454868b62 | ORPH
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/30c4668709803ef3c98bb2f9064933905c0e8361 |     
  powerpc    |        openconnect-9.12        | NOK | https://autobuild.buildroot.org/results/9bbfaeb9180d6fa2716a1f716cac36a33afc570e |     
    mips     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/4536b0ba3fa1fe1f66a9480145f075b5de7c2c83 |     
   mips64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/10246c6651aa08510abaa4e9e4f1d80b01dfd509 | ORPH
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a328ab8bc2af5f54e828b1ce61875898653c62bb |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/4bfd726f2a3e036c8a52fca73b97705772fe4a2f |     
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5f5e094320102d01ef0c68c0e4a99f025c2955d9 |     
    i686     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2d8a151868758284cc9ce4454d4f27eedf69a61b |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2ec779295cb6823dde36387034ffb458ecc31170 |     
   mipsel    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/dc39fee4f17208c725b74afb63dda57eabb5b698 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5d2715188e45b75b6e3c5c89e58d2937bbaf9d22 | ORPH
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/b8a1060ecbef5cec92705d85a5e61a01616a8de1 |     
   mipsel    |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/bcfff314adc5b6da53f2e2b65f35e0d3ef5e971a |     
loongarch64  |            time-1.9            | NOK | https://autobuild.buildroot.org/results/daaec4d1345d884fad3ce617da93c1b3fc22abf9 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/91092a8f1a5f4e9908860cfd99f1d170fb01d9a0 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/71eca8fda3d9b3b4b678a8b72d6a6521b3c0c4f8 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/d010ec2075a99fdb841e9e067cd6a118cf1a6729 |     
  powerpc    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/73871f39b4c31ab294b2f9fd191cc84c41dd48fd | ORPH
 aarch64_be  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/d13f5698d8efc32668b8e88f6ee5fdfe8e9fbb6a | ORPH
 aarch64_be  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/a05e44c3b2c9d5ec2daade387522117733c5b7f9 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                  brotli-1.1.0 | 1 
               libcgroup-2.0.3 | 1 
                 logsurfer-1.8 | 1 
                openvpn-2.6.14 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/0d582cd47d4ec664a5ba960bbd6d0e7c51760bc8 |     
   armeb     |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/27b31c1006413e5d7540cf45ec2f431acafbcca5 |     
    mips     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/2ecfc313020b34eea66eb6578da9bfe31a610d80 |     
   sh4aeb    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/911643f7f78c14e84b46f46d2905ee478b2811ca |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                    brltty-6.6 | 1 
             cni-plugins-1.3.0 | 1 
                  ffmpeg-6.1.3 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
host-binutils-arc-2023.09-r... | 1 
                 linux-6.12.47 | 1 
        ltp-testsuite-20250130 | 1 
               openblas-0.3.30 | 1 
       python-flask-cors-6.0.1 | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a018d063a8de09cb8babf361266ef938a935f313 | ORPH
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/4d2d3aef3ef45faed6d23da8fc463fb919b78ff0 |     
   x86_64    |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/e821b63bf63a9e11d0b2ea1e985287c7e67a9e46 |     
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/bf0a64115cf09d14ab876ee97b4258232eb3556e |     
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/c85d7327cdfae64bd66c290fc9d2caa6c30b2ffb |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4b3ddcf83700e97c2d03e2ab4411b1f7935fd49b |     
   x86_64    |         linux-6.12.47          | NOK | https://autobuild.buildroot.org/results/908972e7a45394c9fbbb293e9294eba9a9302371 | ORPH
   sh4eb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/3807c198a0402a8d8d202b5993a0c56067867b27 |     
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/5a2cdd96564cb3a27672527de15a86545d78dba7 |     
  mips64el   |    python-flask-cors-6.0.1     | NOK | https://autobuild.buildroot.org/results/441ef36ed095e9f7c2d4296849fbfa18a820418b |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/78ea432deb676c49918620388bba058c76c49bec |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              libselinux-3.8.1 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/873a3ff93635d74b6d7710c0714ef2650038e5e8 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bfa095f4c8bc3cf1fc1fa030d0849d747cebccdb |     


Gitlab CI results for 2025-09-19
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506472 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506493 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506539 |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506600 |      
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506762 |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506814 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506889 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506967 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506986 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11410326973 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

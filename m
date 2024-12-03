Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02EEE6C5FB
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 04:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 242DB60609;
	Tue,  3 Dec 2024 04:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHCN-ZC03Hmf; Tue,  3 Dec 2024 04:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 804776061B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 804776061B;
	Tue,  3 Dec 2024 04:18:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 542F41531
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 04:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 400E54064B
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 04:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0VTwVaNM9IS for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 04:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2849A40647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2849A40647
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2849A40647
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 04:18:10 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53de579f775so7022139e87.2
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 20:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733199488; x=1733804288;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KXi7M6Eq4TiwJbm8Wiq0hEJRssJci4BZk0o8x7YHyFA=;
 b=c85e9VTd2iAUmnpPgbfRXSEZIk0WhaIit9D/xDl2fdcE1uWgbjl9ty9zgmSOuIgjci
 zoLcbnDSFt+UMlrtPCfPBfNmQ6siAbg/Wsl2eFynDau2mrk1pfeRBk980/YLbO7Px8nV
 wU7MrJxNyARvvQ2p8G63+WIY9aVyf0995fv7fjAJ9Dnv+xm/GWOMnxj3nWJwZOIY7Ovg
 6hSLU/bAO2xKprBgwyCdlO9YIaX0YQqo+hYtBkhfRaBfrrrP/BLkm4bbre18yaRsO12p
 TY60/NJAzzNk+R8h+/iJysbrgfIRw/lNKcy4MBViUfwcn9qCb1zYc7cfKOkdsXhwQj+i
 YQ3Q==
X-Gm-Message-State: AOJu0YwnxwzlQPoueRu3CDA3WbiQxdmB8PsjAS3BqALSEaoAs34oYSuc
 nRHaE66OHWrJKHvUcvhXqLCT68sSYNN08njb6NdOVSPfnrK/jnuNkcQI7g==
X-Gm-Gg: ASbGncvFNgaUnxdTeFApcTyzHxSuhNUQDlPjD8JYBrd75HGlGw13353nb49+wsG7XDd
 nLM916AfTEN/wBQu7Pp+b9cZcFqSwkDMEkSz/1Lpba+RrPUZ2Kmdnaz1Q6h5Fzj3p1mxAoyp3fG
 Fg2D7D+IWkoDxnPswOl8B/53bOLVYnZvmRvRW7+ipxOIokNBy9TCTgOpgL2/Brj/9SEQ1FHA0J/
 jrfyw5tzHVDydYPEsfAFQibRBgLTVxLxCPPhTvGPkl1oijMAHMBhQ==
X-Google-Smtp-Source: AGHT+IGe2aF3WfA3PB3PdOyMuLDlsTJmQYHDq/DJ7X89ViSEXpiGgR96DmHVmHB44G9zBCLKUyFssg==
X-Received: by 2002:a05:6512:3d06:b0:53d:e981:f01c with SMTP id
 2adb3069b0e04-53e12a38bafmr866267e87.51.1733199487591; 
 Mon, 02 Dec 2024 20:18:07 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599953d53sm572606366b.181.2024.12.02.20.18.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 20:18:07 -0800 (PST)
Message-ID: <674e867f.170a0220.299b56.8c11@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 03 Dec 2024 04:18:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733199488; x=1733804288; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KXi7M6Eq4TiwJbm8Wiq0hEJRssJci4BZk0o8x7YHyFA=;
 b=AxyyARFNLGPeiCzrhqT2qZBybyl9xVLEnNs6vOOjIQ5gdcVqBIdSV9stXoFS6ScpNS
 RHnhNhfPkteOfniPtaWVAHi/86PGzX4J4LynQXRuU8FQYSRPzpYiyYdgB4Y9m3+nIq/D
 cwv+TlyxN8U4adURTl+kjm3i9ww+PpQiY21FbT6ty2lRooxljiCIPc+516+8s7p71KpI
 2+XDbdG8nRosvd0KiceG6L/30snPSOrtOEZj5YUCK0o9mN7IkGbXuFVVAgDfbYw0Oq0t
 OqfxFQw/rZIHLx7nyha/cXN2wop0puv8xNTG9lsbf1Qf/8PkwPgvG8u5uUUQg4AbHM1D
 rETg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AxyyARFN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-02
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

Autobuild statistics for 2024-12-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  2  |  0  |  4  |
  2024.08.x  |  2  |  3  |  0  |  5  |
    master   | 11  | 63  |  1  | 75  |
     next    |  4  |  3  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

 ibm-sw-tpm2-rev183-2024-03-27 | 5 
                lmbench-3.0-a9 | 5 
                 linux-6.11.10 | 3 
                       unknown | 3 
             util-linux-2.40.2 | 3 
android-tools-4.2.2+git2013... | 2 
             dahdi-linux-3.3.0 | 2 
                elfutils-0.189 | 2 
           libzenoh-pico-1.0.2 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               procps-ng-4.0.4 | 2 
               valgrind-3.23.0 | 2 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
                  bcusdk-0.0.5 | 1 
                   bullet-3.25 | 1 
      docker-cli-buildx-0.16.1 | 1 
                   eza-0.18.22 | 1 
              fluent-bit-3.1.3 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
                   grpc-1.51.1 | 1 
          host-binutils-2.43.1 | 1 
         host-libxcrypt-4.4.36 | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
                  jack2-1.9.22 | 1 
                latencytop-0.5 | 1 
                libdrm-2.4.123 | 1 
                  libsepol-3.7 | 1 
                libxml2-2.13.4 | 1 
            linux-fusion-9.0.3 | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
            netstat-nat-1.4.10 | 1 
                   perl-5.40.0 | 1 
               pulseaudio-17.0 | 1 
                 rtptools-1.22 | 1 
                sysklogd-2.6.2 | 1 
                  whois-5.5.14 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/df12be0cbe5a1f73d30ba612c3c3da963db64e0d | ORPH
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/a7b81aa3892a91f2c53a3f852b239f4402ecae80 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/5fa888b41d3f59e179c6cfe3c64c6e4dac23ed25 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/8528ff876e695f79bdfe64f5330d9d51eeef66cb |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/707514208a9468a764bfc4213665afa1e3d96074 |     
 microblaze  |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/0c9cfd5ca96c5a61000713a28898d98782d2794a |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9f5a018d40dc71504b8478747610ce7f6d3d0471 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c2e0e594264d5335e5bdb4dcfaa7b8f2641c0269 |     
   x86_64    |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/1163b5eb40ebc116adfec07922e184d734579363 | ORPH
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/6b0365cb7168248a7bf34759c2749a1c5bfdc225 | ORPH
   x86_64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e05b616b12ff50bb9d277eff10c3b48732ca360c | ORPH
 powerpc64   |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/081a4fb6ae0b4f5ee14385c560ab6444565e8d42 |     
    arm      |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/04aa3cf6b1ce4fd580fdf7b4cc2ecda5044e2731 |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/727040f1fea39af4d445567bdde946730e16760d |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/82fe34ccce9f06e1f6fe3e71afcb22b25cc1185b |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/37791cec9fcd9f4bbca6e14aada5d47cac6189ce | ORPH
 aarch64_be  |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/2e61c535c9c418cea1dd480563a563caf28e12b5 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ba728e8cf5d4b4ed0a936a36ff53d21db9b8443e |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/f8dd6e0f6abe3d98d9d125ac8083faf0ee64b7e7 |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/48a854cf4c4be5c6c7162451c0f4ffc0a2f87f50 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/482cae394d7f0e1684d2d49823c1c9ab6e11c06b |     
   arceb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/7c2ce9a52c7529846e31fa07627751d707b735a2 |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/f842cec71d7d64be1e072efcf13cbc74a26d23c9 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/d4a582024ba4b199c8da53a53ac579a9a198d66b |     
  riscv32    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/4f3401ec31bebc6ba0c90b3e316bf8b4f0df5f62 |     
 powerpc64   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/3bc4526f59e285c1f406e2bd57d9bef566734921 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/3c8b158a0b58af4aaf51e6e46c7a174050e2671c |     
   mips64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/d44fbae2ad6d87aad0acb56939e170d715ba27ac | ORPH
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/d5b32a690aaeeba0ea4d308064cbed32c7d4a693 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/3081d9aab6ba9f1d2df32f544a857adf08d84b65 |     
    arc      |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/978b97c1fe6fae7925c3358ab7472f872176149d |     
  powerpc    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/9155def01090fcda177ece386262c509c59be517 |     
  sparc64    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/34fb9944dec755b66d474faa1a0c568e0aa58ce0 |     
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c8324b303b8e1486abe5fb9b0761dad4c837cb39 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3af696c1e2f277a100d08371fc2ad750f41e1fe5 | ORPH
   nios2     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/2bfbdf7affdb419b2231cf3de11900682dd45fa8 | ORPH
    arm      |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/7fe65886d5d5a8b33e1ff77b30f345732e5f2101 | ORPH
    m68k     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/45a50b6e5f88bbdce9c7220ea3481b84b846db0a | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/56c9611cebc1fb659291703de6e986efcd5d418e | ORPH
    or1k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/d3634b0644a0ed3785fbd4ab6dd1b51ec47414f1 | ORPH
 microblaze  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/df3a57678d1db6637d1aa42e7d2297364f59a1cf | ORPH
   sh4eb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9856f40a5d10db292925282abfcca697423b558a | ORPH
    arm      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/65a39512942e088590a5856dd5c091c5afeef48e | ORPH
    arm      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/1b4e8b565f40bae044cc196d290ad5f5afd7fce7 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/563de98d517bf6ceefcbdab4f1fd6d0bddcb4015 | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/766ddd891a124cc02c92df2a7985ae1630f8dc11 |     
    arm      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/fa3de508ec87bbcf361f2d8fd96f00b9031985c3 | ORPH
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f616e6d1f624de4fbf41004154b1f3923ab16a2a |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bac1a4a6e2f03468d7fea6332523f56a3dbe9ed4 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/01a019d7dd0421887dc3a0c3570da6a96edc0295 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/60276ff86bf0f9a8a34a5f02be149053ae42eb19 | ORPH
  sparc64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/4df85474183d9180e077f671e2b783f671b5ef8c | ORPH
   armeb     |         sysklogd-2.6.2         | NOK | https://autobuild.buildroot.org/results/655eda474cec1991b8c3230455bc052f9a7cb297 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/c1b53cccfb1305bb884079008a3fb62c21df3709 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/69b991efe8693f6eb4dee4df16866480e3837769 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/8991287c06980817df3a12df988d6f25b729762b |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6d57e8c43fa639712ed613bd6f324e0a20cc3457 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/354697d83a95ae50cfc4bece24d16952bba2d31d | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2503eb6f8cc22a6e09b37e372a76b78e44bdda25 | ORPH
   mipsel    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/b18a94bf6a111d8ac5224643c699706a40d9af2b | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/d5dd7e3c700c7808429d177d0c49494d3e224420 | ORPH
powerpc64le  |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/1b35b40a7616b14e220bfc594d4252cd82d4b481 |     
microblazeel |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/c1ca637125103d48013d3cc51d8dc3e6a86a4796 |     
  powerpc    |         zlib-ng-2.1.6          | NOK | https://autobuild.buildroot.org/results/3e03627527911187c20e5daaedb6fd114906fb9d | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

glibc-2.38-81-gc8cb4d2b86ec... | 1 
               libglib2-2.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | glibc-2.38-81-gc8cb4d2b86ec... | NOK | https://autobuild.buildroot.org/results/6e3ed377a87ea90d2d9b7c8229e276f7dd5ac271 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/f1faae051eaf9e873bf603246b8f42c0e28fc1fe |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                     daq-2.0.7 | 1 
              fluent-bit-3.1.3 | 1 
                 linux-6.10.14 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/94a76abb6770513ea288dc56b0480bf8f555ca76 |     
   nios2     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/57b5280fd1f1d350d8e0d133b93e59a2949f8443 |     
    i686     |         linux-6.10.14          | NOK | https://autobuild.buildroot.org/results/b1724f7bc9b7091fe5de261d737677f77f7c4ee4 | ORPH


Classification of failures by reason for next
---------------------------------------------

              fluent-bit-3.1.3 | 1 
                  linuxptp-4.2 | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/bce79e8e9afcef2a26df16d305108063d6e51af7 |     
  riscv32    |          linuxptp-4.2          | NOK | https://autobuild.buildroot.org/results/dedd9255b202fc9962fbd4df342200ca83658fd6 |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a927f231a16d4007f207d0d2b286fe5b4f53dfc7 |     


Gitlab CI results for 2024-12-02
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514188920  | ORPH 
             TestDos2Unix | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189127  | ORPH 
                TestErofs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189033  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514191112  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514191115  | ORPH 
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189258  | ORPH 
              TestNumaCtl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189280  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189313  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189317  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189410  | ORPH 
          TestPythonPyQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189399  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514188957  | ORPH 
              TestRtTests | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189435  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189438  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189468  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

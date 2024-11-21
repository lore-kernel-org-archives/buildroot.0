Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C4BD75BB2
	for <buildroot@archiver.kernel.org>; Thu, 21 Nov 2024 04:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B37E84381;
	Thu, 21 Nov 2024 04:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKYetGbP7tMG; Thu, 21 Nov 2024 04:18:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBBD084396
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBBD084396;
	Thu, 21 Nov 2024 04:18:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EAF31B69
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 04:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAB2A84435
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 04:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gDR5N79BlTP for <buildroot@buildroot.org>;
 Thu, 21 Nov 2024 04:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7914584380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7914584380
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7914584380
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 04:18:09 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa4cb5fcc06so89234566b.0
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732162687; x=1732767487;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gLZX9L6QK65lrMYAHNgQKtSY4+0+q4+NEUFO+eyB9oM=;
 b=RZr5QxSh50n2ITVcx2qsbHg1eZAp/jovHBHQ/q8SGM7Uq7t6hDFQ3J1KCocrP+uSqk
 I1jPzzhZ4G6Ija2CeT2QnNhQ1drYEA36ckAXSMKDbK1adf/DOlMS5i7Nug5JuRhjLJQi
 4cyhJpA4ZNScJr37wJdK7BUcRD/y90ocQPI5i00a6WDan3JEyJo3hsxZVHQZsaUDeyom
 DokKcjlMPjrbLNeFhi6z3pJoyfhlakvWu0OtKuH1BLl29LoJhni7y8tAv7b2LiHEc5vd
 KJB9Jd23twCK7KuZvygmLd5XI8q2VjVCwxfSnSZz/LKPhoST4JSW47Jr9m7SjTVDHsAB
 saGg==
X-Gm-Message-State: AOJu0YyKJU13RCtq3tA5UqqXcCqbuU9BMZK5GHQQIngp7LfZcAYw9UIF
 E+KWHIilBFQsvFbCE63vQgl9ZabQb1y1cgCzEmPU9ji++f2VtZCuvPmtNw==
X-Gm-Gg: ASbGnctNnKmd3MgtIOfFg72ZkJ31a0wbEPGdzhioj6YHJNQiSqNx1ngRkClOFUAEWTh
 3C8F80wa5ZEe+5stxmN9rPiiZdCo5HjWgJTvf5+KtyFUoNJEu1w4OVlUQEbwA8mOGjeZry03W8Q
 SJhKRW4qfrMeQfAYcgZxNCLdTSvgvIXYCnD7cYZjXkQQI4EfUkjIScXdLmK/95DZv2Iwl9I6Mng
 qvahwRfRJaAFAL52i0wzBKY7ofGJypP5QzsMNLkCRNTQ8i5/AUx2w==
X-Google-Smtp-Source: AGHT+IHuFqR/9MM1qXpc+nOAbjah8nKedyqK1FfCK5GZQUR9rOsnHk9Cz/LC0ZsIcUE+1dFtRP7mKQ==
X-Received: by 2002:a17:907:7283:b0:a9a:161:8da4 with SMTP id
 a640c23a62f3a-aa4dd749f02mr552406766b.55.1732162687214; 
 Wed, 20 Nov 2024 20:18:07 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f437f86bsm31321366b.182.2024.11.20.20.18.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 20:18:06 -0800 (PST)
Message-ID: <673eb47e.170a0220.28871b.1128@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 21 Nov 2024 04:18:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732162687; x=1732767487; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gLZX9L6QK65lrMYAHNgQKtSY4+0+q4+NEUFO+eyB9oM=;
 b=FZY6yjmBI6Fra6Wwx/kTdQkjG01EPHDOTmO9YhgUNITskBB/mJkTMECi+OPAkmiA3W
 LAHZ1kVSfeko9hK1SXVqfgK4VEu1XjXYREWrMvMTZ2T+Zj4hEiAguXyTvftr1LJ6wm/U
 P1cCK7Sy0viMYzBio4hRyJs/Ipp0C0uyu2Wu4DuVjENPa005me7bhK5qcydBWuOgJ+6y
 VYHYP3N1rUX3UypDuIrabM2tw9Ap7Lc/v3Sd3+w324O1SUGUAVPjmZjGhYN2ptjU6xT1
 VUPy7eGPHtYiM6IHihrOlSZRD8B5vKCaYOsozLEiy8eW67sabDcVK3K5i409sYhOVqFd
 pAIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FZY6yjmB
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-20
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

Autobuild statistics for 2024-11-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  4  |  0  |  7  |
  2024.08.x  |  5  |  2  |  0  |  7  |
    master   |  4  | 54  |  2  | 60  |
     next    |  2  |  5  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

 ibm-sw-tpm2-rev183-2024-03-27 | 5 
             util-linux-2.40.2 | 5 
                lmbench-3.0-a9 | 4 
                  linux-6.11.7 | 3 
         gobject-introspection | 2 
           host-doxygen-1.8.18 | 2 
              host-rust-1.82.0 | 2 
           libzenoh-pico-1.0.2 | 2 
                  ntp-4.2.8p18 | 2 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2023.09-release | 1 
                 c-icap-0.5.10 | 1 
                 coreutils-9.5 | 1 
                   crun-1.18.2 | 1 
             dahdi-linux-3.3.0 | 1 
                  ffmpeg-6.1.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
        gmrender-resurrect-0.1 | 1 
                   gvfs-1.48.1 | 1 
            host-binutils-2.42 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              libopenssl-3.4.0 | 1 
               libunwind-1.8.1 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
       matchbox-keyboard-0.1.1 | 1 
                   mimic-1.1.0 | 1 
              mosquitto-2.0.20 | 1 
                   perl-5.40.0 | 1 
                    pppd-2.5.1 | 1 
               procps-ng-4.0.4 | 1 
           python-daemon-3.0.1 | 1 
                  quagga-1.2.4 | 1 
                 rtptools-1.22 | 1 
             strongswan-5.9.14 | 1 
           v4l2loopback-0.13.2 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c34a6ef813bc55fad3e0288df25a9dfd96848dce | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/ad609c480e3551b7ec8553f65455f43168d228d1 |     
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/b05ec09fd82893e757cf5adfa20000457a8f5841 | ORPH
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/e873568f22e422c2962790ff6c3ed1d8e8b90456 | ORPH
    arc      |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/a21a68c2c522a3a0518dab52383c796b442fa25f |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/244b976434a06fd48f85a6b0b355c91671625506 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/c476d86edb0c43f36e9db90ef8e00a080ec7d42f |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/2308f2a0e93f3aeeeb7c7b7b0d904546bce568b9 | ORPH
    i686     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/9e681c34c486c4fe2e3fdaa394a3455fa8daeffe |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/03cf8e9ebc1f8c114f5a4c55f136e2dd2f2a8474 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/611cf6e284a44296d05b06250d98134fb9744957 |     
   nios2     |          gvfs-1.48.1           | NOK | https://autobuild.buildroot.org/results/7f38a9add4232b05997e51c9becf054aae310acb | ORPH
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/69bc26b2c8f0927ae5a3530f72c17d789d57ca2c |     
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2baccb0bcf4b4a8810099c68cb2c5f8011fccfb2 | ORPH
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/e826442e52955140eb4d7a51dd8ad07ef8c5c373 | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/15938e54cbea56b03d50def66e8a18c52ac2a409 | ORPH
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/40d8911c854ffdd66990b7199604ec49b12c2195 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b510088091fb88508192866c61dc8b89d920ac1b |     
powerpc64le  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/d112456a13ae7cddb8340afaf2101b8e64cf5f96 |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/ea04c2fd4977dad12499067e31193aa8d7c146c6 |     
  powerpc    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/f03097c26d2f9b09b5e8940533441a34e13a7965 |     
    arm      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/d1084dbaf038d52453921c467e3ae38d4513a6e8 |     
   mipsel    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/1c041e03e072cb7ed0ccec721615151ad0753ad5 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/e7ac1dd19094c1fd225d0df04a3f861dc771d468 | ORPH
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/64fe912afc8ba71c65ba56a1c96a7df4f8b17071 | ORPH
  riscv32    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/df8df4a6f85e84a843c3d2c7ea3d07f17f029c68 |     
   x86_64    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/b6f57dbf161ec671262428e2be7201ff33433768 |     
    arc      |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/56a4ddccde9b9d9ae418f5d4c1c43f09a422f3e4 | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/6396f23a49d697f7668c1ceaf55cecaf19ee8a43 | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/621f66e9959c6a9b0bfd00d1e4af1abab4d44245 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/0f66ee6a8e67f9a7750e5c5e3634daf8004ee9bf | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/e911f4dae90a31a68b41f55940a9f98cbe063ea7 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b64f3a539b867883b08bfb6092549383a35aa763 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/d6d2bf4222e2bc1353e976a1e5ab0bef3f064ecb | ORPH
  aarch64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/6f7bb7e278d3c53324f3d304875d5379c85e9a54 | ORPH
   nios2     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/8fd1bf99f1c1866809f3968f3f6edfd1131255fd | ORPH
    i586     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/c9beab9e8fc56f0234745dc8ba69247a8273f3ed | ORPH
 microblaze  |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/b9217939f0ccea1b4fa98396c9fe5654960a70d4 |     
powerpc64le  |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/785b0f297fda42a9976cad68c0cd7398f8abdc7b |     
 microblaze  |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/e12708aaaed823610720ffbffbeda46fb4f3cfb6 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9bd84720841d7da3ba85a3eeaf96c825a091053d |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6c685d5999f38cbc7e7f623d3448ec7a13bba020 |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/01c918bf9eeeeb6b6cd978d1254819c4af8b4adb |     
   xtensa    |           pppd-2.5.1           | NOK | https://autobuild.buildroot.org/results/a42aa20976ece2ba9cde92b444fe72ec803b0ea8 |     
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9e74094c6f85a25d80e991e8eeff496ad74b4748 | ORPH
 aarch64_be  |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/3eb1133a82fceb58ec4773090438b7aa6ec2b7f7 |     
   arceb     |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/0f4a6f9200d6ef7810c37fad78b0f30913effe51 | ORPH
   s390x     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/11b5493982748025d3248c3ab1dd80eaa26ae491 | ORPH
    arc      |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/fc7669f5444b64b50cb91c40d50e8de43a2010fa |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/79b2b82b53061f6066253d3f1ab43265298c127d | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4ba7076676bb94fc8b31079f1794f4d435851702 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1b00bdfc9b7c2fe6f339ae0f94da19c57c0fb8c6 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e7f6c0d2b48704183490e54570ffac4d41822153 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3364df8c5738e1be98e7e68bc1640e6025eb7c84 | ORPH
 powerpc64   |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/fa9eca102b12b1ad0417b5cc6815ed71c672e531 |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/7aa4ca4f1ada9f733eeb6a04121620066e18d129 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                host-go-1.22.7 | 1 
host-prelink-cross-a853a5d7... | 1 
 host-softether-4.30-9700-beta | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/9e35823ae09b8886c0fa193e903feb7bc69509a9 |     
  mips64el   |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/df4d068e6938d4e2cb833fb061df2de56dcf42e0 |     
  riscv64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/5d05e0a826001dc577ef47f0128b0cab233b9645 | ORPH
   nios2     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/5e8f7bcc082d5ff5b37fa66379e1ac22c4bc6501 | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  libva-2.22.0 | 1 
                memtest86-6.20 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/d39a56d377c9b537fd64f087a1a389816da50c21 |     
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/dc489ac7a0d03217e6fe4cbf144369e8629df17b |     


Classification of failures by reason for next
---------------------------------------------

 ibm-sw-tpm2-rev183-2024-03-27 | 2 
                lmbench-3.0-a9 | 1 
                   perl-5.40.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c59a598999b66146c4a85e8ca3ada3b846d7a87f |     
    or1k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/a04e297b0a603c46d32fa423498f200324b21a34 |     
  sparc64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/98aa153230003d48cfbeb084596d92ba38128318 | ORPH
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/08d0e2fb736ae64fa25a4e790b22fffffe4c9777 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/5b4c272a03f1bec0167374c2cbcea17da3693423 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

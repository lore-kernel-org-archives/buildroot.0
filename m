Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD296C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 04:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A20882002;
	Sat, 22 Feb 2025 04:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJVkUeFDxsoa; Sat, 22 Feb 2025 04:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA72082013
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA72082013;
	Sat, 22 Feb 2025 04:15:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E51B4D92
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 04:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C898940D3D
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 04:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOTxGsdY1kuw for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 04:15:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AEB6240D34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEB6240D34
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEB6240D34
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 04:15:26 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abb97e15bcbso432449066b.0
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 20:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740197724; x=1740802524;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l8ne9L7W02XvYmyqUxnkvXBaREMa6AvNm7TzS+y/8A0=;
 b=wrCPDRwi10SF6nG2dQQNpVgBfpEMW59k16HV3AwMDm3sajd2BJkXDEqtGORVPsMpeo
 5avoHy6sf5YYvm+DgROrGUCVCvVycuDQ8XNlE0SSBfLNp44SGa33eAmBgZa1m8/oKQNn
 ju+tGtXhzdc2IhjoouPaYCzfdgO1gJC8Oh2z489Z1xfKBm+P3nCJ3nJ52vqvq8hLL8r7
 jElBT37SAYqOfyz0+7Lgq3bbPcPD28qKvkuwSQZ236HV0w2rvUnPPP1BlvFrDXeMTOF1
 Blt6fBIzHYSdL8+kn7c+PSojOjpEper39FM/gGMQPBAbNt4dMGEryRnbVKPq6ld7Itlf
 gkrg==
X-Gm-Message-State: AOJu0Yw8I5Jdt4p9EejNclBjK1Z48QVgVfKMJtczP6tiw0YSjgyjmvl7
 ImZiOZIXNkIcCe1Rbv74pSFdy9NIfZThmY+Li4Yg51QGFAwEuL6x3bMLlg==
X-Gm-Gg: ASbGncvlONuOWm0q262110CrotoZJdyPbU+rPx90MCzFjTLuNHT2IfQBXGC2OJaUoxZ
 iskgxCTUX5j6As695ftIx2ffrnOEJw+GGG9Q+YBhUrodBV0FvMdSKoFYu1rEpj96c4jFIx6JqL0
 aBOfIXWTUg3qe5rnnLhVKBxvelCELThcHiqRAsPA5p7ZBYnfKgrWYbvccchHpZOcgdUtCT5HGif
 Y3Umjb+/vEC7YcS9tbCejZU2GoKhZ7b3iVNUXBF1VnJXAa0Jca7GvFo33Gkx3gUOhVZZJ8ZhTne
 Ry0tw7KNUajnoeWDhbKMLsQb+BR34g==
X-Google-Smtp-Source: AGHT+IF66g67x5CV6oQAFZCbhw+vmhA6ztrwHAxwlxWcPi0OqGpucYmRp7ZUb7r1EIUKPMi3K4b6MA==
X-Received: by 2002:a17:907:7851:b0:ab7:c43f:8382 with SMTP id
 a640c23a62f3a-abc09afa7e0mr589346066b.31.1740197724327; 
 Fri, 21 Feb 2025 20:15:24 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53231fe0sm1758380566b.4.2025.02.21.20.15.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 20:15:24 -0800 (PST)
Message-ID: <67b94f5c.170a0220.245112.cb11@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 22 Feb 2025 04:15:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740197724; x=1740802524; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=l8ne9L7W02XvYmyqUxnkvXBaREMa6AvNm7TzS+y/8A0=;
 b=QXtlQjFE5rMHXZaffkyn1wGGzW4lpSsClLNtchc9iGQ4PrxWGqfrbP1N074DY/2q3s
 nZcOALdI4Ftdi/ZjKvnOVtqaAqZbNf/qeMUvBWNhzwjJ4LTZMhgmyk1v9Rf561LmUpLE
 MBRMFlGWkg3n2Rtw+GOCx0auFvEOO9kQibBBIfRJb4Vzl+nkaR/6uM9eLLj3UFRBN716
 S2HC7AtPmIHx11npHjE8gSE3KFJHfNpkW1nylBI5gWLajTINXKX8WAIkCQov3jAAJ27E
 iqxfmG3DBwPQ19rlSm5R6Jm8Yr/0mkUaqd1uuAfAQMl0ycyMd97orsGbHtcUOlfJ4mqG
 TA1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QXtlQjFE
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-21
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

Autobuild statistics for 2025-02-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  4  |  0  | 12  |
  2024.11.x  |  2  |  2  |  0  |  4  |
    master   |  9  | 59  |  0  | 68  |

Classification of failures by reason for master
-----------------------------------------------

           at-spi2-core-2.50.0 | 2 
     bandwidthd-2.0.1-auto-r11 | 2 
                elfutils-0.192 | 2 
    host-python-greenlet-3.1.1 | 2 
              host-rust-1.82.0 | 2 
          linux-5.10.162-cip24 | 2 
                    mpir-3.0.0 | 2 
                 openssh-9.9p2 | 2 
               postgresql-17.3 | 2 
                 agentpp-4.6.1 | 1 
                    azmq-1.0.3 | 1 
                   bullet-3.25 | 1 
                   ccrypt-1.11 | 1 
                 coreutils-9.5 | 1 
                     daq-2.0.7 | 1 
             docker-cli-27.5.1 | 1 
                     exim-4.98 | 1 
              fftw-quad-3.3.10 | 1 
             fontconfig-2.16.0 | 1 
                freerdp-2.11.7 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
  gobject-introspection-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                 ibrdtnd-1.0.1 | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
           janus-gateway-1.1.2 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  libbpf-1.5.0 | 1 
                 libcdio-2.2.0 | 1 
                libdrm-2.4.124 | 1 
                libsoup3-3.6.1 | 1 
                 linux-6.12.15 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250130 | 1 
              luabitop-1.0.2-1 | 1 
             matchbox-lib-1.12 | 1 
                  musepack-475 | 1 
                  ntp-4.2.8p18 | 1 
                opencv3-3.4.19 | 1 
                   pcre2-10.44 | 1 
                   perl-5.40.1 | 1 
               pulseaudio-17.0 | 1 
         python-pycairo-1.27.0 | 1 
                   rnnoise-0.2 | 1 
                   thttpd-2.29 | 1 
           uboot-tools-2021.07 | 1 
                       unknown | 1 
           v4l2loopback-0.13.2 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/34fe234b12d4067488437bc7ff5dc24b58c70ced |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/ee86af13d39fa76bb25eb596db5e95800ca05905 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/2e7ca883dc308d1f4d4da5de6bcd2566ee3a5d0a |     
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/0548bc495122e908291fe01baf5ba6dc322b070c |     
   arceb     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/b9550c30fd74c96835bcdd953bbcbf9fe947bf98 |     
    mips     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/0d7c77942c8384696ad138cd3c317a0652852f32 |     
   mips64    |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/fd598fad0683587936685a3eb1f67c8e0ea92880 |     
   armeb     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/e97994b194869cb3bbae3be1bb505e1b19ff2e1d | ORPH
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/05a7065cda5d05d6a2ff474e776b6210e8ede8bf | ORPH
   sparc     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/9fa73fb1d22e2c4c8d839d6175a99793dfae7c1e |     
   x86_64    |       docker-cli-27.5.1        | NOK | https://autobuild.buildroot.org/results/4bba4d2d46faa8764951dc50c931b62c0e51997f |     
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/aa7d9a1002d2c322a45a47a59e0324138e235106 | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/61823964e5cec7bac84de1167aa1d698433b1735 | ORPH
   s390x     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/b289140ad9b271b893bdbc0b83137be844146e7f |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/2ecd9a97c3ab3f86347f2fdee4cedc30b223238f | ORPH
   mips64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/c0d5db63795d1a498d7eda4aea90b9325e5ab562 | ORPH
powerpc64le  |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/01f99e329bc9a42957a3f4a7d75a05fee2b81342 | ORPH
   s390x     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/b4ed9a8e117d00ff53cc1d90c693d7f02521ef89 |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/caf0a307b51dd646e3a60229dd4af4015e8e6029 | ORPH
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/199b2b8d5bf662e4dd9ad9c4c1d60cb31dcafb21 |     
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/cc77d7f998d259259f3238cc9930d03bf41f10bd |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/198293da517436e5e316beb2eb52aab0f7712e53 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/67838d9c2efdee3ca43ffcd229874b9b1598359d |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/22cc776209ac00edd14e9ddfa966558ea98de960 | ORPH
   arceb     |         ibrdtnd-1.0.1          | NOK | https://autobuild.buildroot.org/results/bdbdd7370ffc61c392dc5a9658d0ef0dc17cbcae | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/167c66818cfc3314a086dbbc8227acbba84f4617 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/e1e598068c31c1785cb98b3f48e15a89c95dbe24 |     
   mipsel    |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/9bd370466d306c3be4f39d9d6d0ac4571a1480cd |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/5434a09777abee83a472cbf2d737b354ac4eb5fb | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/5b72c5dbeabce5d15fce1cdd0ee70fa9b1547a8a |     
   s390x     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/ab3699ce2e87268fe4a656d9ee61fe6bd637f119 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/62c9a6478e37b2622694dd7a63f75f7e82759966 |     
microblazeel |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/3c76f5cec7647f722e5060b90213fdc61182f7b6 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6aa8917db037c4ebfb966d5a1165e9b7dc902dd6 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/fa7d9ec4c9c9b669db282e9c639c62c96f1f0975 | ORPH
   mipsel    |         linux-6.12.15          | NOK | https://autobuild.buildroot.org/results/3efc2e3cbe15fb526557f2af9ccc52a3cd3db529 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8967db21dd97c259245ac393fe398d9e244cf170 | ORPH
   xtensa    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/2f3b960e623fd9f37b693d73ee02399d955dcafa |     
  sparc64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/a91b2c3014028e69e073e138718301b2317d609b |     
    i686     |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/951a2c45cde3b3981d66a9f4dd66acfa8930f680 | ORPH
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/168910c0051db0e0cb17c6ebc4e4280185ce7311 |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0621287cc4563d30003b3d48aaf74d5da8724165 |     
   s390x     |          musepack-475          | NOK | https://autobuild.buildroot.org/results/42779f18eb95203b0d3be626197077db927f7990 | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/fd1f244dc9dea0665d2296435eced39fb2e71a25 |     
   s390x     |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/be7fa4e50dc1f62506d01679c571893f26e176a6 | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/b2073a4c02a01abf9f73ee52ca6ed6806ac8c05b | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/a08c2786f56004a59f1180d1c00763522ddb7232 | ORPH
    mips     |          pcre2-10.44           | NOK | https://autobuild.buildroot.org/results/d0630db3cab240a7c2e05c9ecc3979ba68f9848f | ORPH
   xtensa    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/3f1b74948fc4bc841fda5645ae719ad05f0e294c |     
   armeb     |        postgresql-17.3         | NOK | https://autobuild.buildroot.org/results/4e56d09b2a5380a3bd3ef68045e73b32e3c77960 |     
   sh4eb     |        postgresql-17.3         | NOK | https://autobuild.buildroot.org/results/aed5d987be2b2a78c89e0eda40868acdc14c4638 |     
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f9efbf28003e60cd43bc0c8756e032af1e135a7b | ORPH
    mips     |     python-pycairo-1.27.0      | NOK | https://autobuild.buildroot.org/results/71b05b6832f2a272edc0408d8681ee07826febc9 |     
   armeb     |          rnnoise-0.2           | NOK | https://autobuild.buildroot.org/results/3e954cf8e4365d81e58949df50db7e82bf0d0ebf |     
  sparc64    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/ea8652d766fc39a953eb25449f5256868dc53dd3 | ORPH
    i486     |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/85fc4a654dd9e4dc41f1c34cf3352b93b8e672de | ORPH
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/5178689de0cf4213a9eab68322e5006788361a3a |     
  sparc64    |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/237b587441adaf91a6c8e0db34dc3b2c26d4147d |     
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/f2024c67f3af844d1e1190681ae5e458c8c85be9 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
               host-go-1.22.12 | 1 
          linux-5.10.162-cip24 | 1 
package/postgresql/postgres... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ef284039412401aaa46e0c3ad47d388665b68824 |     
   mips64    |        host-go-1.22.12         | NOK | https://autobuild.buildroot.org/results/8f67a1c96ebb2509827d6b542356515c177f6a6a |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0f768c98489c72b13a2891ccf46d34b7cf190aa9 | ORPH
    mips     | package/postgresql/postgres... | NOK | https://autobuild.buildroot.org/results/5bf0e061c28afc095ddb0bf360ededb66b681e3b |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                 coreutils-9.5 | 1 
  gobject-introspection-1.76.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/5a5aadc14fa2920fd42fa8495c58c4aa76d298ee | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ca66250eaf89539d22827b492f5359e4824438d2 | ORPH


Gitlab CI results for 2025-02-21
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597046  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597107  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597108  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597110  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597113  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597167  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597190  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597217  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597229  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597248  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597261  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597284  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597290  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597292  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597296  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597300  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597392  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597393  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597397  | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597475  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597550  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597551  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597554  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597585  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597599  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597658  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189597680  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598609  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598659  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598678  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598681  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598689  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598712  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598719  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598722  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598725  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598732  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598739  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598747  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598753  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598759  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9189598789  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9202659894  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9202660654  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9202663465  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

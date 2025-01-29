Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE36C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 04:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12794407DA;
	Wed, 29 Jan 2025 04:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dHyD7Kf1ghL; Wed, 29 Jan 2025 04:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43282406C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43282406C4;
	Wed, 29 Jan 2025 04:14:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 310EF942
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 04:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F4D36070B
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 04:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wY5SgQ2iMIrm for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 04:14:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97C63606A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C63606A8
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97C63606A8
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 04:14:51 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ab2c9b8aecaso1148990666b.0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 20:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738124089; x=1738728889;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ocJr1jLHY3NVVe/6coc94SHwCWe81RWPKgw/tIvSJmc=;
 b=elaDHpwjlY4fPdAbEFshb7l34xH/zNuBnT7p7Lb1/V3NugzTxDCyZ405k9H49Otwiu
 1t96cDa4kD+cB/squ3ZEo+tJkmo8IFyORw9/mVqF0xrWX6QjOIdYCKYjHLMT4kEewUWg
 qP5ifLtgxnH5mLSPE7cMGcac7NX5LHh9Ggm1ofDGJEZZdoFl9h4XNRohOko0zkymduVU
 w2FlJulSBFGASUr6xOPBmuOHzLCQboaP6o8UnHq+rDLm6KTDiYUz7zfx/tCVASxPPqwe
 WyJJR++FdlCcaGwt+YlsxqmGYA+MlMIg3qMOyp7sZXavsa1eKEsWQ2RQGUR+VTkkshZ3
 vAqw==
X-Gm-Message-State: AOJu0Yyir5zCFKXfooFqYgE5O9DUDUrfpMtw2yyEUl7M4Ujdas/Rwky+
 jx79u7zy0IbCXXJXC3YQUMNhqSrGqnIjGriVZSg/kXGc/V+QKmrcq2oPLA==
X-Gm-Gg: ASbGncsjqU8N4iyIxc8sFfc1mxXLcbXtvvC24dpWlb7jexQOZa98xv5IwLt+TFKzguw
 gHMl8efs/nNyz6L5r145EI5zpH9uiTI5QkWWgezJY6G8LlaLfO/VAsYAjJ6OvugLx09V3wKBe9v
 KkVkyxw0yyk2mJumQKMW4OUupuY9/NWZ92EAv5rjWuUe3pDJ6cI6Ze8aijhTX7cIz/EbHxhdYI7
 dm0Bb6fI2J70QtJDo/vf5sHDUOHt/81Ro3TY8nV25dRm+RYYgjxTOWm6/x4Rjl9BIe3Tz/wsarp
 Gi4VFPZG3+HEE/pey6w=
X-Google-Smtp-Source: AGHT+IE/KoG5nrjhqOx3AnsbzR7geQh7GWbS35IC3FD9RaikGccirFWplZhVyBHJWkLsA/Y7L1td4g==
X-Received: by 2002:a17:907:3e1a:b0:ab2:d96d:6364 with SMTP id
 a640c23a62f3a-ab6cfceaaa0mr144590166b.18.1738124089433; 
 Tue, 28 Jan 2025 20:14:49 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e126eesm910706266b.14.2025.01.28.20.14.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 20:14:49 -0800 (PST)
Message-ID: <6799ab39.170a0220.298c77.bf67@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 29 Jan 2025 04:14:48 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738124089; x=1738728889; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ocJr1jLHY3NVVe/6coc94SHwCWe81RWPKgw/tIvSJmc=;
 b=Sw/+jdO9+Wvvy7/QYsCfpw9vng0my/fvMbi1ZeVp3QUWaCL9OF9CVaCWVa9km9sybh
 diseZ3Ua01nod2jH9n71+y73HmmRwW6GpdZWRCiyMKtslsMOoO1dDMxsBOkynXPjqCfg
 OhNuBqj5DN2VkqW2znV2PL2MesR6GPdkTdSYnBuGYQb1/BKnnMAtuRbtvTIc6QiMDNpj
 rw4XRWVbPv0fvgvZvhHM+pmg9IJSSD2i45+QJAilQi1Unj/n9p0lfXNMhkoGb6WQRnIB
 UjhOJzi9+zECZ40XCWDU0qmHU/i2BgIFfbZFwXfhlukiHEzfxwHBBJsV8o0QqWqxfo2U
 UBmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Sw/+jdO9
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-28
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

Autobuild statistics for 2025-01-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  3  |  0  |  5  |
  2024.11.x  |  3  |  3  |  0  |  6  |
    master   |  7  | 52  |  0  | 59  |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.79 | 2 
              host-rust-1.82.0 | 2 
          linux-5.10.162-cip24 | 2 
                memtest86-6.20 | 2 
          sphinxbase-5prealpha | 2 
                       unknown | 2 
                  assimp-5.3.1 | 1 
                    azmq-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
                    brltty-6.6 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
           crucible-2023.11.02 | 1 
                   dante-1.4.3 | 1 
                   dillo-3.0.5 | 1 
                  ffmpeg-6.1.2 | 1 
             fontconfig-2.16.0 | 1 
                   foot-1.16.2 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
            gdk-pixbuf-2.42.12 | 1 
                   grpc-1.51.1 | 1 
   host-mender-artifact-3.11.2 | 1 
    host-python-greenlet-3.1.1 | 1 
 host-softether-4.30-9700-beta | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  libnss-3.107 | 1 
              libopenssl-3.4.0 | 1 
              libunistring-1.3 | 1 
                  libva-2.22.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
              luabitop-1.0.2-1 | 1 
                  lvm2-2.03.27 | 1 
mali-driver-d40c57d81c9cf4b... | 1 
            netstat-nat-1.4.10 | 1 
                  ntp-4.2.8p18 | 1 
                nushell-0.96.1 | 1 
           oath-toolkit-2.6.12 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.40.0 | 1 
         python-pycairo-1.27.0 | 1 
         python-remi-2022.7.27 | 1 
rtl8189fs-9a82349c2c40515f9... | 1 
                   swipl-9.2.8 | 1 
                tpm2-tss-3.2.2 | 1 
             util-linux-2.40.2 | 1 
           v4l2loopback-0.13.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/96370340ce41386d9e1bee6ddeccb6a2c154c2a8 | ORPH
  mips64el   |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/a64f6498758920e4ce28be54d8ba4da2b34f27dd |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/64ece0b0e366629861e38fa909c17acf40e6cb84 |     
    i686     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/7cbf9c49c16c6505128cf2b496f8185a7ebedada |     
 powerpc64   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/40d3cdb74d6d6bfe9dce603dd17f665fc4078e90 |     
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/82d1b2bf78ff519b1b6ad89f085d9b98bdb2d0ef |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/2772fc9b0e3e2c8350f3a1bdf8a99f972b2f9ae8 | ORPH
   x86_64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/6cf4422855ff2b39b7f65248acc5ce147d7b5ed7 |     
    m68k     |          dante-1.4.3           | NOK | https://autobuild.buildroot.org/results/0eaddb8839f188b62529ee7d3edacb6a64ce19b9 | ORPH
  mips64el   |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/42c23eb4ebb8fb19a749af3ece983e76877b08c9 | ORPH
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/97e55f27c7c1536a90fedbbd8c485a16ba68556c |     
    arm      |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/1bace66708e4ffbf65862469b25bd2c215f3e7da | ORPH
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/6e22f8cf524c251c15eb036184991d49d6f81340 |     
  sparc64    | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/00dbf17782495d43f4b33e8e80b3eef20704be09 |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/c38d4c3536351bdde09bacc49d8548eaeafbf37f | ORPH
    m68k     |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/10cfd2a70bb5bfd1bc8440067a62f7113ecce689 |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/211a084839e9c9423b2459885304275f79b69738 |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b55982554d422e6d3306a237422a7fa6c5533e98 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/dc1bd34b798ac368614e6c4145b9d331d9ff8aaa |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/918173e9f52b396b7c50caa24523f7d947009f73 |     
 powerpc64   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/316edc5a7d444c2a63607a8a4127f600c2fb575f | ORPH
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/d1f7273d092fea23aee54b3d4d3042c8254d7b51 | ORPH
   s390x     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/451c9542aee9a80c147890d505b768bdd778150e |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/634ef676b64f2dce2c07667a6f26c66a960d1d88 | ORPH
    i686     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/e3301529d7f0343feaa998d38f7bb89d22d63811 |     
    arc      |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/e2443f9e643b3d00d93e2266c4fb06ef53402b75 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/247733301b57e4023e8648fc5a70631091ed5c58 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/35c6f4db1269f55786ebf1a5edfef74a38419913 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/538a26a4db10e56e1ac93a58581393f46b6c59db | ORPH
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/20a7362375bd818ff02719f7ffa10d38aa956d4d | ORPH
    sh4a     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/ca0aa3da76d0d1a2613ba916a9a0734e66bd81ef |     
 aarch64_be  |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/1a2498a0d4b0fdb4a4e0964b47c67499349c0185 | ORPH
    arm      | mali-driver-d40c57d81c9cf4b... | NOK | https://autobuild.buildroot.org/results/d4adab21b74ebdb816e606f916e33a036982f245 |     
    i586     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/50e209bb6834a5ee812b270ec3958969ce6e40c0 |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/0fe30771a4374ab0f484758c1b003df28302a497 |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/b533514a282a0c63548b536a37e7a88e73a842c5 | ORPH
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/78b0803093ce8171e665f5bbf7b95ee16200d933 |     
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/2d65f762a9a9466dcce96ef844b2e874eb4062ae | ORPH
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/bfbf5116ba91107b6514b802aebf2546116f2392 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/adeba09871928f880517180c3704761e172a27c1 |     
   mipsel    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/4da6a8c7f39198d82d836c1f08df69656ae7769a |     
 powerpc64   |     python-pycairo-1.27.0      | NOK | https://autobuild.buildroot.org/results/cbc384677974690f35a65119621a3400058e5ab5 |     
  sparc64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/a244c9e099c58f99545bea663292897fc3c3f8a3 |     
 powerpc64   | rtl8189fs-9a82349c2c40515f9... | NOK | https://autobuild.buildroot.org/results/36bf662732aa866114f41bd363d6dd00556c0f96 |     
   mips64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/54f5d5b1d99652a3a914e40ad78ad71e29fe38ae |     
    or1k     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/d57170b07fbc95feec03f7d3912bd6db7d6a2cfe |     
  sparc64    |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/8a637fffc73290381441e5a62fc3e0388891afad |     
    m68k     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/d7b4d310018d7aa2a4186b7df4a9ad897693c663 | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/e789a06d291b8909f8f078a8ebbc31e66bfad889 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/a534643970317eb9636e58ea873b0037aa109143 |     
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/897a58970ee08b62b9c6ceab5d4c5adaca5583a9 | ORPH
  riscv32    |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/89a82ccd723c73734a31ae22f651747a9f99ae74 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                cryptopp-8.9.0 | 1 
                flannel-0.24.2 | 1 
                  scrypt-1.3.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/7ede7ac34f2dab291993dcb97b02c40c80d64672 |     
    i686     |         flannel-0.24.2         | NOK | https://autobuild.buildroot.org/results/88dd82e157f324237ab66d353b0809cd45afebca |     
 aarch64_be  |          scrypt-1.3.2          | NOK | https://autobuild.buildroot.org/results/d491f83f6a97f28a01511f31b5a0cd46584d1b46 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                 linux-6.11.11 | 1 
  python-pypika-tortoise-0.2.1 | 1 
                 systemd-256.7 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/e454f96206952d8bd878804e673d2a8b7f91c80e | ORPH
 powerpc64   |  python-pypika-tortoise-0.2.1  | NOK | https://autobuild.buildroot.org/results/6aadb80069641bc58114fcb5f8082229ed1251cc |     
   nios2     |         systemd-256.7          | NOK | https://autobuild.buildroot.org/results/44a333bc31fbf8e61eee171fc8e1792a6af300d4 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EDFC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 03:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7622061078;
	Thu,  3 Jul 2025 03:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zq07NyxFJkDF; Thu,  3 Jul 2025 03:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7024D60F45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7024D60F45;
	Thu,  3 Jul 2025 03:27:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73A55193
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 03:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5985D4059C
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 03:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-zcnRH13eSn for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 03:27:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1689B40029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1689B40029
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1689B40029
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 03:27:36 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ae0b6532345so93717066b.1
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 20:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751513255; x=1752118055;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xR0S7YMYGi4PxT4/jlYVwzRueitFHKmb6vjNEzWz41k=;
 b=mDK8pjGsm3g1HNHvSKPj8gI9QusU3pd3gTztUSUfWx6B212x15hOGY7Yzxhs3Sx4hs
 pvXzBz7Lar+eW3Z6kVEkBUYDt8G16uxnPBtwZLVzYBE76GDcxtI4FsEYQIDdLawURzjl
 YgLLoCd0aGJGxzQJf/eZnMwZ+TiiEXsc0Bhr2fvPumt9M85BZvog49ZQ9MByt1Px1NUx
 +c7WEOF6kvEsK34MjSHfLgzu2jigX/ewqgQAPUPYoE1l+QwrVqNRwhv4CUeJ2jz21+oh
 ac9vZ19Cht76RO2dosAqgY25QHkg4D8ny/i+dY9RprWqSnvt5Zqz7xKnsF//qBjCBtUY
 2d1Q==
X-Gm-Message-State: AOJu0Yx0zNDyzXsZD2G33MM/51mUt3ac2ZVL3oZKUUnw/vzIT4reV8Ls
 gOn+Rb/T8auBup2AfcOQNRmVGB9ixFVpdTDRBt5lLlvhgFKr07gr/saho8EdTA==
X-Gm-Gg: ASbGncsFORUojcDkzmiSipaydMrqZOUa1CvmIPjNXpdXFv+inRMv0fFiHXXAuFyAyIA
 3tfOAG09XjK6+mMgcQgyAvyyqxGPR+kBDWwiy7eIWIEMahcCLrfHH8h7iHvKK1/i2A8Ccqo1Iz/
 Y8G1cLtUcz0g+gChj92Hb5Cc1uz84bAPlOsmNbfB524CDrS324G+AxfX5UhuNvQQJlXOV+ZYw8e
 n512NzINWA7GnBS5Agss3FhYrJUSm934Amo2ckN0cxkWbm6XBIEelfHdlE1lCYKcLN7jxOGkuIc
 EFOke1J36IHeOXnT4e6BxAa8mphSEwsvPJbbeTg3nSRS30j9AJQvOOBA/mjX8/KAng==
X-Google-Smtp-Source: AGHT+IH9ubNrTqV1F1fKxqh7ciBlc6dqTs2+unNkfcWFR45NZUvmnZuHcHbX49E9yF5RcEwbehu4+A==
X-Received: by 2002:a17:907:1c97:b0:ae3:c777:6e5e with SMTP id
 a640c23a62f3a-ae3dd25aca9mr102034166b.19.1751513254644; 
 Wed, 02 Jul 2025 20:27:34 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353659678sm1189328966b.38.2025.07.02.20.27.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 20:27:34 -0700 (PDT)
Message-ID: <6865f8a6.170a0220.347d30.cec8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 03 Jul 2025 03:27:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751513255; x=1752118055; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xR0S7YMYGi4PxT4/jlYVwzRueitFHKmb6vjNEzWz41k=;
 b=N9ONqiDUSNfSnaReLhA2VGyhBJI1pNz6OteK3tUMABbnDvbbw45b+8f25U63dvUooB
 vTNXRwICWmLkOuJpuHU0m/EpFFICsC2KZaGr9aKGzd23qedlt0v4aCXnlZMVKh/Ibj7Y
 ZQUigcKkBY6Uvg1k3xmbwhQQ284BPEFHkAPpxDhRJka5LL42yr1yUhBesxh0tGeiqn+A
 /kEG99ftPjdhayVBRcN5MPF1M/DD459xmz0xhNRGH1m+BRyUTVLWov17sf2SklR2oGiG
 fL5MCW21MrZ0DpBIR2j2BmHWPdBSX6hHdmf7eQqDVz8atr9+Pz/tSDdnbKqteMPTUqPD
 QOaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N9ONqiDU
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-02
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

Autobuild statistics for 2025-07-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  6  |  0  |  7  |
  2025.05.x  |  3  |  5  |  0  |  8  |
    master   |  7  | 39  |  0  | 46  |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.37 | 4 
                   cvs-1.12.13 | 3 
                       unknown | 3 
                    bmx7-7.1.1 | 2 
libdbi-drivers-0bfae6c43134... | 2 
              libopenssl-3.5.0 | 2 
                   s6-2.13.1.0 | 2 
           at-spi2-core-2.50.0 | 1 
               bctoolbox-4.4.8 | 1 
                  cairo-1.18.4 | 1 
                  cpulimit-0.2 | 1 
                  dpdk-24.11.1 | 1 
                    fcft-3.1.8 | 1 
firmware-utils-86739f2b3ae9... | 1 
              host-rust-1.86.0 | 1 
        liblog4c-localtime-1.0 | 1 
               libsigrok-0.5.2 | 1 
                  libva-2.22.0 | 1 
                   linux-tools | 1 
                 logsurfer-1.8 | 1 
                     nut-2.8.3 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.2 | 1 
            python-tornado-6.5 | 1 
          sane-airscan-0.99.33 | 1 
              tinyssh-20240101 | 1 
        util-linux-libs-2.40.2 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/0a5bc91ee9b9fa0094b25095fdaa24f3e76b6a32 |     
    m68k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/975e219dbb945bc7027b34b6d7869ecd9f3bbe7c | ORPH
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/d78b0f3bf2d84e1ee02ce0eebc45083b3121ca47 | ORPH
powerpc64le  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/ac3af50250f673a76cef1d9a10376a6080a08ed5 | ORPH
   armeb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/f0f859adc1fa5dc748ab8cc15440e3b0ea5d8c43 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7f023e3e2f81c317f6f00fe080ba155451fa6fc8 | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5d61b2d4b8b5e54aad923bac8895fb67f90d40ee | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d804ad7d37489c8d71b44e41bd0f0a26e0b5a308 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/c1d96d76954da54331152e828c266641ccd415ac |     
    mips     |          cpulimit-0.2          | NOK | https://autobuild.buildroot.org/results/5308cb8239f31ef39e5c67d65ff1d69cdec1cedc |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/101feae3383682b98e41f8cf20a9a254cd460542 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/01dd400c67442fade615f06b724caa63ec04a858 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f2ac45c37399ec4f52d9e921d336fea874e5aaea | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/70e601403b6740149edbdd9fed2a7f2b0aaf1552 |     
  mips64el   |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/4939f43cb9e716042e664b30b60ac4c65ea60f7a |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/696113337c227355d891a6c1bd4e170151918824 |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/f7b439407b3222851ae8ab8db20057416678b127 |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5158c47f2e2f72257654eb83802cbc5539480055 |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/404b789908a13addf5b9935ffc59f3311e13baa8 |     
   x86_64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/553d7faea15fd0c59e7fc7773db3b5d7ed5344a8 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/8d6d68901a0200e0a80a25ee15c7890c6ef2182e | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/987450242f320a50f9a622a925bcfeab230292f2 | ORPH
 microblaze  |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/0659acfb11e36dbf65a9dffcc7a955b0a018bb21 | ORPH
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/18b551ae20a2f2f40c1fb003bb701f53f5daec45 |     
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8fda01fb22da75c4c756096b9245d67a3fdede94 | ORPH
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/df2380da0046a49bf78d1c8ffea6f38a9b16e2b3 |     
   armeb     |           nut-2.8.3            | NOK | https://autobuild.buildroot.org/results/87f5a42784e2613d9349519e4ee0f71de8240f79 |     
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/8aa28f6e9a9bf93f3d6f8615c2d484aec0f9f92c | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d15b5f3c01ddddc0a735d464a68c69137620f3c3 |     
 microblaze  |       python-tornado-6.5       | NOK | https://autobuild.buildroot.org/results/63e5d521ab376dd69e52ec0b18074ae675735024 |     
 powerpc64   |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/4e50c95aa8839a01411136c0a4c7017924716a13 |     
    or1k     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/5a9dc595da596ac6e5d3f195a91b5226af9a65f9 |     
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/e920a2f18a79af8c619bdc966d21587399640d78 |     
    or1k     |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/1e9eb63f7132317cb1dbc928a723579864232f8b |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8645d8b57badc96466c691e0fe64c18aa31db3d2 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/ceb77cf1b8da19d43b495e099dcfb3fb05af1849 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/c62e461ad43828fc5db57cd601aab61226d27998 |     
   mips64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/3586f691b2d52660b0c43532952bceb44439e226 | ORPH
   mips64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/f4e0f3b39fa3b384b0dcc0b4ce670743cd8c7c88 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
               graphene-1.10.8 | 1 
            host-libp11-0.4.12 | 1 
                  libnss-3.108 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                nushell-0.96.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0c31b3141ffacf292ad193a0c21de845eb413c32 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/98341de39a08954219e007dd527cdaadd59af387 |     
 aarch64_be  |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/da71db9b04f181b9d2e72df73ac8541709f5a1d4 | ORPH
   s390x     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/f0b72ff8b4e0f6ba0f96521da4dff1d4b4420af4 |     
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c4784e41431a0e36334a9af83e335f0459e38516 | ORPH
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/046ea186edbb82a10ecdb134582059d2936a0159 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              libselinux-3.8.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                setserial-2.17 | 1 
                tpm2-tss-3.2.2 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8300765b2b7ce17fc6542ab99345a4f9b175d9b9 |     
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/aeeb2aca9c50d10cf07ef66bb1c2c6a21e95e084 | ORPH
   sparc     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/c9a1a3fefbc7c9ee49eed76acd472ae6d16353eb | ORPH
   x86_64    |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/3cf4e7073d94a9530279c694ae3a446c6d8b353d | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/88cb10f8915e2cc16465fd67339ccb9f0048e91f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

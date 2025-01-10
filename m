Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F952E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 04:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64000810D1;
	Fri, 10 Jan 2025 04:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TK5ubp5hyyHY; Fri, 10 Jan 2025 04:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E78718117E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E78718117E;
	Fri, 10 Jan 2025 04:14:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9776942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 04:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA078406C8
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 04:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNmjCwgAv_fI for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 04:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7F9F40391
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F9F40391
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7F9F40391
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 04:14:35 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d41848901bso3012979a12.0
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 20:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736482473; x=1737087273;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cjtz7l7j7GbvIumZUt07KI25Bs1Q8YcZyCJMMYlg1Bw=;
 b=QXqFvrb03g60b3DqAdBS/e4ckFaUcb3MVacsrnlIP7Vwwy6jZkqLpAt7eCdH4zf3WY
 lqoaRjY4vRUT+1Bc1D2pDVROQ9sZKIE1QTZwVCzskVtr+/otLMNbiRrkC0esdAo16WGy
 wiSKnpNkA7cdkd52QYGidrFievQwclrAiVaNE24CGKE9rn9J6jVQmsSI8ARSj+sdTehZ
 UYn2QgE05Z4xd/6kLXHAQ5aJLWX5e9ljrfn2zbCfy6d8Uz8bfFpxYd02JpsYkQIVtdE/
 LelQMTKgXlKHdw5tnEKOTVpnSo1ZnyXRHdXp+bqA8MlVnOHdiZfeeHBF+SF9k+dCEK/U
 EScg==
X-Gm-Message-State: AOJu0YzmUpv2qm2bkwn/z4bdUi6clU5yBOUC2ibBnQT5H3V4PTDiJUE9
 3sUMHfDi2z/tHiX95QDDNQY2hnhVqgc97leHjfUXWuGrB0y8SlC3aEgCyg==
X-Gm-Gg: ASbGncsAkeNadp0qv2rmUm2iA4FVJwUwYpNNL5ugPJWxwNkWoWo+P35ZdxPfWUpmhCn
 0rxgw26WDNQi2x48F0BRZLDLvD+qB//3+BOKXoOQrknU3eDfCyDMbbANpun917hyQCFUdpuJ2WC
 jqi5FnFXziiMVQwO8fGT+85EvHr29JF8Tz7PCVX3SLuCi4mT3MHsa04FeIZaaGi9DHL3T1Wdowp
 hE5rVchskWrkm85iNNwB3UdPQOgX0PMUtA08G9t6wttuzS/mP3tJAdE8CO1
X-Google-Smtp-Source: AGHT+IHe0fHrBWJk0G5mKmc35vEvTo0enEr78YUyBzqfMtJbMAHrpEIlAvxELkNLAn/AjYsqwc9ovw==
X-Received: by 2002:a05:6402:280a:b0:5d3:cd9a:d05e with SMTP id
 4fb4d7f45d1cf-5d986209283mr4948758a12.9.1736482473373; 
 Thu, 09 Jan 2025 20:14:33 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d98fe8f68csm1224620a12.0.2025.01.09.20.14.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 20:14:33 -0800 (PST)
Message-ID: <67809ea9.500a0220.38279f.53f9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 10 Jan 2025 04:14:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736482473; x=1737087273; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Cjtz7l7j7GbvIumZUt07KI25Bs1Q8YcZyCJMMYlg1Bw=;
 b=BPnvJzxB7c3BQ7VJW/SAa231A9OhbePuLVXKqHjJ0yK1M+nD8OkdeXhmjnsEZ4DkVI
 gFlhPrk+OZp3tTIGeFZ63+kmr9EMzR0VMMLrsewfSX9Th7JeILe8G8R96UEIljIX0Tfu
 wLIVNK5tppmBIeYe6M6CV33vkR+1kRK38GY8FOQ2DdG1GYOpvp5pVFiru87rM3t91PWM
 /ISdShObByd4m+XEwp0d41JMw4+v+ep3/PqcMe/ZJUdEVz+7AJAgyv7GqPckUBzINCgs
 1S3BLZaK3lZikGkKwQzPkUwYrnxLFOl5dGyOqogrdHlfL4NDSVTr7b5RgVuFSu2PODLe
 dG8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BPnvJzxB
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-09
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

Autobuild statistics for 2025-01-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  6  |  0  |  8  |
  2024.11.x  |  3  |  2  |  0  |  5  |
    master   |  8  | 63  |  0  | 71  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 4 
                  linux-6.12.7 | 4 
  gobject-introspection-1.76.1 | 3 
                  msmtp-1.8.27 | 3 
                       unknown | 3 
cegui-00b4e1fe174da53b7ed72... | 2 
                elfutils-0.189 | 2 
              fluent-bit-3.2.2 | 2 
            host-binutils-2.42 | 2 
       matchbox-keyboard-0.1.1 | 2 
          sphinxbase-5prealpha | 2 
                 xenomai-3.2.5 | 2 
                  bcusdk-0.0.5 | 1 
                  boinc-7.20.2 | 1 
                    brltty-6.6 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202411 | 1 
                  evilwm-1.4.3 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
   host-mender-artifact-3.11.2 | 1 
              host-rust-1.82.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
                    kmon-1.6.5 | 1 
             libargtable2-2.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                  libnss-3.107 | 1 
                  libsepol-3.7 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
        ltp-testsuite-20240930 | 1 
          obsidian-cursors-1.0 | 1 
                 openssh-9.9p1 | 1 
                pipewire-1.2.2 | 1 
               postgresql-17.2 | 1 
               pulseaudio-17.0 | 1 
                  ramsmp-3.5.0 | 1 
                ramspeed-2.6.0 | 1 
                 samba4-4.20.6 | 1 
              sdl2_mixer-2.6.3 | 1 
              tinyssh-20240101 | 1 
             util-linux-2.40.2 | 1 
               valgrind-3.23.0 | 1 
               w_scan-20170107 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ffc5eb4430ceef422a2fdf44b2890d093eb6e933 |     
    mips     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/c78c24f46bda2aefd137a2f758d9c3e34526f98d |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/3e0a3dfd8c7bbc51f8243de15662bd413051b701 |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/498175f2345977bb9aa2e60d7ec5920e10dd8d3e | ORPH
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/ade5559f2f5a6430f09adbf67f26f97034061d26 | ORPH
 aarch64_be  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/50e73643f0ee56946c9d635abd952926a6e6b362 | ORPH
   x86_64    |     edk2-edk2-stable202411     | NOK | https://autobuild.buildroot.org/results/f45e71a5c1dc5580e8b4b51bee60449f1259817d |     
    m68k     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/fcc0c4d75d32bb86c662e8caea4605028d4072ab | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/d73267fe674d822dfb62d946aedaf25c34c171ad | ORPH
    or1k     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/ac27db53fd30b31659d8701c6e5447d06bfaea1e |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/cc400b578180d4d7b13fd19fd93f70302ca5a590 | ORPH
   mipsel    |        fluent-bit-3.2.2        | NOK | https://autobuild.buildroot.org/results/8a7f6c81cc1c56de984442595b0d51c5855b9d5f |     
   arceb     |        fluent-bit-3.2.2        | NOK | https://autobuild.buildroot.org/results/62e3767555e145fd3f9673cb451deb8c981ce712 |     
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/8b93b6474731404f5c2b4cac8612565138bec7ae |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/23014cf421d9b31434984f204b46376654cc5bf9 | ORPH
    sh4a     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/21e56596a96cbc1c97d5683e9a8ceee0d9a1d9a0 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e8f967a24fa814f47adf6884cdcb26cc150482f9 | ORPH
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6c1555cfd0ff0664d434057b3054cd98d345d5ca |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/76ad6e58d50ca21977c1c9a6f070d363ee242ef6 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/45032240ada942b3988c16b29ede7f08bc184c60 |     
    i686     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/73a0f5a43c03059f7524bc7aac2531cd7115e825 |     
  aarch64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/37056fa3a4600a45d66167652970c48a02101548 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/13e98beb668b3e4c0a1f068c70c96636172995b9 |     
    or1k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e2f12c7b44a4675e658999286038e171df7b7ffb |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/24667c666e8d864b6ba7a2e35d15bff5b1c0edc5 |     
microblazeel | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/d11095f686f4984280cdcc9b9a753407ae94efc7 |     
 powerpc64   |           kmon-1.6.5           | NOK | https://autobuild.buildroot.org/results/d1e779d34422c1a5bb83fc65e31f3d187d3266db |     
   nios2     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/b16fca299df71874d17f44310c35e20012a8a63a | ORPH
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8d1f7e9d4d5f67d466b68e8f6d78ffe5973a7aa8 |     
powerpc64le  |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/80a66c03dcde6c84f6d4ef9a45a0b6de7a863cb8 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/99ec82743467b869f56a511f69408d1c59c8c55d |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1daf32e3d55be82d4809e87e618008fc6e8fe3e5 | ORPH
  powerpc    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/62284f5577286f2a92a8d2103aef0486770f88f8 | ORPH
   sh4aeb    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/c19950de2ac6e90646f19e9d92055bad5e3ff386 | ORPH
  mips64el   |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/a6130268f76ea2d68b23fdc03567a04a9a9c534d | ORPH
    i586     |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/f8eab7763fec7dad517f748212175f1296880150 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/88272ad03b09669ba61968bb791abebe769f953b | ORPH
    arc      |     ltp-testsuite-20240930     | NOK | https://autobuild.buildroot.org/results/687ce54ae400d82a6ec49e8ecf157ecc6609d10a |     
   s390x     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/d82bb97e679aa625adcd5e5deb63061cf9d163f1 | ORPH
 powerpc64   |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/7b418ef418236c24713b26b9ef7be51708f0f8d3 | ORPH
    mips     |          msmtp-1.8.27          | NOK | https://autobuild.buildroot.org/results/0fbaa13c3d27d5475319f83ec882f1f172416cf7 |     
 aarch64_be  |          msmtp-1.8.27          | NOK | https://autobuild.buildroot.org/results/1e6edc6d93f8fc1b0ddbe04e87aa4cf1107d2a23 |     
    mips     |          msmtp-1.8.27          | NOK | https://autobuild.buildroot.org/results/bfe3e5237089bd276878fffcc4f546fd5b03912c |     
    or1k     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/9c80bcac6aa65bcd652ba80b1241b5e39a2d4f5c | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/f0acdfb9fd7f86ff4ef7703a272571ac2e907fe5 | ORPH
 microblaze  |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/bd4a2aba659d51f3123b8e38dd084fb89afaebaa |     
    or1k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/c70f566652a25236a07e7fed4f03acdd4a257a4e |     
   sh4aeb    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b10db629b72072b58c2dccfa9e19e9c48ee4932d | ORPH
   mipsel    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/8e5a7780bd3d3fc442b04f39d0d5c1293ed8659e |     
   armeb     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/0d6f0affe74070da96c10be86570eae3c2883aa2 | ORPH
 microblaze  |         samba4-4.20.6          | NOK | https://autobuild.buildroot.org/results/37892c48f6ba7384ee285061e51266580d9087ca |     
    arm      |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/da95e060825558dd61e79e44517182d9265b0b3c | ORPH
   mipsel    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/1b1e83a960fdafb9062abdc8c87daaf12b7165d8 |     
  aarch64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/df1753dfc34d4d8a569ad21a355bb201828f58a4 |     
    m68k     |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/d701a29143cca4950feb2741edf65b70087bf182 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/341fdac68325ddcc264060074d0c5873a6c2e3bf |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/519cc206ae0503d689d65d50c9b7e2171e9e0fa6 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fb53ad0b27b54f874cce7726f66c6b7ce2f9e95a |     
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9c2c6aa80581d2c40d4f5d9ed23d80c611bc2016 | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/c6f7bf5c8134c1532514323cad593b11bbc12e59 | ORPH
   sh4aeb    |        w_scan-20170107         | NOK | https://autobuild.buildroot.org/results/d9de031df42c7a602485a33045bbe80cef89bc8c | ORPH
   mipsel    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/806c8b01d2f758db711cd49ce9b98c8f97ef4515 |     
   armeb     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/cb02102cdba2e8b2ef871534ac9da178cac5d133 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-prelink-cross-a853a5d7... | 2 
                  linux-6.6.68 | 2 
                   duma-2.5.21 | 1 
  gobject-introspection-1.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/b4782dbe1e9a92a7fdbb3ddd606089f3cbdfb188 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a9dac98f376a43123cacedd3bd3c0097b0944872 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/d80e705717fb9130190b1a34bb77a30a6788b9d5 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/a737819d8dcf99761b57ffa4d300f28b110e6bc6 | ORPH
  sparc64    |          linux-6.6.68          | NOK | https://autobuild.buildroot.org/results/45a280ddd43021d3c6b11382cae36fcb16f03896 | ORPH
   x86_64    |          linux-6.6.68          | NOK | https://autobuild.buildroot.org/results/954c0f0b49cfab92c67ecbfa0d8ccd50b6f4ea57 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                freerdp-2.11.7 | 1 
          perl-net-ssleay-1.94 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/f9a6f23c52d079ad42af38cd09169732bfe46b11 | ORPH
   s390x     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/8f1be827a939935187b2eded901663169efd672e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

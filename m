Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA82D3B9BE
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 04:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8ED64EBB9;
	Wed, 27 Nov 2024 04:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUiAdAS6rZ3h; Wed, 27 Nov 2024 04:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C22E4EBAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C22E4EBAE;
	Wed, 27 Nov 2024 04:17:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F7D51DA8
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 04:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2800940647
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 04:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7n_v4b48W3n for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 04:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5B4E4043E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5B4E4043E
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5B4E4043E
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 04:17:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5cf7aa91733so3507563a12.2
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732681069; x=1733285869;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZgARJV8HZnrCtynYl8lwgpsD62J+gMpOfYXr47+3fXs=;
 b=jXE/c/Nnyx0jRqicYxr4b2oLriR3mM+OgX920gy4uA0S83UB3eoKrJtVn1R5ePdDik
 fvP9I4ZEuK8Z0w+av2bSW8CzaIN9ACqlG7fqYXMAniK7niRjROrSHIRWKbIrJO3PDZz3
 jtdNIIGiRWwKmWuAPBDCYCqF28hQ7/+Epv5BDNgAwPsdvE4Ey3ip+mAf3OxTnfzfceRe
 ruXdmrJpmfy1HTYJ7RnwqrGeG1P8bOObl+Ostnz81zpZ/OPsAhwDoD1pBGU+Ddd+9BbL
 5aX8bu78aMgm+Ph1TB5ghxk6Bqc/hUqswF5guyeJjJtGoQ1+7Gf5DqPigw2OBXigrF67
 52iA==
X-Gm-Message-State: AOJu0Yx7vDxACMt0DcVA9RpTVzGicg0AeegiEIEtki+D8A3jCHcOiuHm
 aQ/FMv/xGnc942Z/wRml9zgfk/gZMajw8v4Mc4SMLzBFlZIdoInPP8JYTg==
X-Gm-Gg: ASbGncshC2FewEJQdA/9741UQzGkwKkid6ZSLEwSluFlFeIu6zsuO2kq2IHapTC8nI2
 y4uBFOouwKIA6/qjIcvChfm4gHmlqowNvvj9oZnj00xsm+EmN1OvvM89ZdKkh+7YNomK23jEV8Z
 5x/nAH69ws9xL9y/I/8JglZKceFoK2jMmt44LJVjoTJBIhfJAC5eDG9DFKkto3ipvGZnQg15bk0
 +zRajd4F1vdcsEaxfIQ5whfNtylnwufVUrJ/kvk7qlfkqtHPQLQXg==
X-Google-Smtp-Source: AGHT+IGaSTo96QjMEY41Ar+gZFkJXW9rhkXL19bAkehI3/KSnZtqGCAy08TYZkcguwflaiMFn9Zwmw==
X-Received: by 2002:a05:6402:51d4:b0:5ce:de19:472a with SMTP id
 4fb4d7f45d1cf-5d080be4926mr1642625a12.16.1732681069240; 
 Tue, 26 Nov 2024 20:17:49 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3c0376sm5650490a12.46.2024.11.26.20.17.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 20:17:49 -0800 (PST)
Message-ID: <67469d6d.a70a0220.341cd8.4381@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 27 Nov 2024 04:17:48 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732681069; x=1733285869; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZgARJV8HZnrCtynYl8lwgpsD62J+gMpOfYXr47+3fXs=;
 b=czN6JfVAR+vFy+Lij3hphxh6nN6OnMLHfsjpARp0JIhGFWDFNrdW0432zhKSM0tjMB
 rQOmUOosk9ArpSErRjP7gyDC2KiNb1XYKpcHy3JB+S4kNZ+oFU+a13OwgQAhzR0S9JdT
 wJ7ujRrfsnK+ZpSB2kCL4DK+dwgNnCSXrXfRv/n+qaN3QNW2eTgdGjuqKJASZ4bsRRRY
 AG+9wC6bh4DyUp7zqd9hnay7h2xrGNKETFbX3PlRLDhhZqgI4Of+OdyMbso3bcPLecyw
 8MtVz/5uPSUpHDscS/espz/UJjsXmZWpJLYSThj8mVbulFi8vp0fIA7zXcAiKJchV2P6
 1sgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=czN6JfVA
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-26
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

Autobuild statistics for 2024-11-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  3  |  0  |  5  |
  2024.08.x  |  3  |  0  |  0  |  3  |
    master   | 14  | 76  |  1  | 91  |
     next    |  0  |  3  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 6 
 ibm-sw-tpm2-rev183-2024-03-27 | 4 
                 linux-6.11.10 | 4 
             util-linux-2.40.2 | 4 
                lmbench-3.0-a9 | 3 
android-tools-4.2.2+git2013... | 2 
                 coreutils-9.5 | 2 
                   cvs-1.12.13 | 2 
                   foot-1.16.2 | 2 
            host-binutils-2.42 | 2 
           libzenoh-pico-1.0.2 | 2 
          linux-5.10.162-cip24 | 2 
                   mimic-1.1.0 | 2 
               procps-ng-4.0.4 | 2 
                       unknown | 2 
               valgrind-3.23.0 | 2 
           at-spi2-core-2.50.0 | 1 
                   bird-2.15.1 | 1 
                  bitcoin-28.0 | 1 
                  brotli-1.1.0 | 1 
                 c-icap-0.5.10 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                   crun-1.18.2 | 1 
                cryptopp-8.9.0 | 1 
                  curlpp-0.8.1 | 1 
                elfutils-0.189 | 1 
                    flac-1.4.3 | 1 
              fluent-bit-3.1.3 | 1 
                gnu-efi-3.0.18 | 1 
  gobject-introspection-1.76.1 | 1 
                 hiawatha-11.2 | 1 
         host-libxcrypt-4.4.36 | 1 
    host-python-greenlet-3.1.1 | 1 
                  host-qt6base | 1 
                latencytop-0.5 | 1 
                 libgee-0.20.6 | 1 
               libglib2-2.76.1 | 1 
            live555-2021.05.03 | 1 
                    mpir-3.0.0 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
                 openssh-9.9p1 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.40.0 | 1 
                 pixman-0.42.2 | 1 
      python-autocommand-2.2.2 | 1 
           python-numpy-1.25.0 | 1 
        util-linux-libs-2.40.2 | 1 
                 weston-14.0.0 | 1 
                    yajl-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/6aceca4676b0bfd7480167973b30adc7368e2f46 |     
    m68k     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/be0dc61370d517b82a80cbe53d746ca81d3011a8 |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/232831e8f5de9dfa3051fe4db1c4d2f081b11dad |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/807d7455b180db6c937628731eab4404f46b5db9 |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/45e55bedd64fbecadd0130646a7095d48cda17cd |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/083e322808c08b4638dd2341d8235a9e6f4d143c |     
 aarch64_be  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/4985fba1f05f181f41e00c5bf91b6e3c4570225a | ORPH
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/aface368acf941db25b5216137909cbce6d2b701 |     
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/656c1013a652863e5b2e820d7ee2a83c8b03e7a6 | ORPH
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/a8f65d8420375fdb0001627f37734613974eca18 | ORPH
  powerpc    |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/4ee971d2275ed072cb1b9ae5cc99dc689101659e |     
 aarch64_be  |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/1a3921e17637b333ec28021a94d371419ad61300 |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/38338230ea914dbd21027a20d4e8cad20229ecea |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/53e5c3ddc22eb8e117c5c990bfd6b31af3629a53 | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b07015baaf244e3abb724e9eace41a5afd65cb81 | ORPH
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/eb56e6aab5eadbadf80692108c017616bab0fd24 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4f492e45001d4189cd08345bff393e0c903e8b2a |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c15d105a6a83da6b320c45c7328666e1e98e3a87 |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d52664bdd4ad76cdbcc396457d9039320d5983b7 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6f52dea57c1c76d6054680dc502d986410ecc2df |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6e7e312b6d0230932bec36d78b3f1edf2d4c1fb3 |     
 microblaze  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/ab0c6da46b06dba6974bae967be82498842ee6bd | ORPH
    sh4a     |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/2fada43557674c37b7e44c68f027e9a7bfa9368d |     
    arm      |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/d111ccad2b5a832ee7c2adb1135e856f5b86f117 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/3385603ea0f5058481e6038d597a1e5f0d1086e7 |     
   sh4eb     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2a2a2f3c6e8cd8b775ad2f1bb78770c187825906 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/5af28ce97f2d8c6595ca1dc34b7074db5819b527 |     
    sh4      |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9646ad4bae02dabb4ddc9385ad30c43ce3657b11 | ORPH
    arc      |         hiawatha-11.2          | NOK | https://autobuild.buildroot.org/results/016e9814adb619c47816a47cca19819cf696a7cd |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1efe53a613e4fe4b374a2719bd4f34d0b32193d2 |     
  riscv64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6e758bab31f746d69ccbd492bf3a98bc4e0de127 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/5c7a8df1cafd93ccaf1b35e3a69a4f551b4cf1ac |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/40029078ae0bfea90ffc20f53e4f4fa3e7d2607f |     
    mips     |          host-qt6base          | TIM | https://autobuild.buildroot.org/results/f72b996dca0a095dca1b21e57524e4be603e3ffb |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/30626843ef9e16a05aa78345e61640154b874c6d |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/5d459e28443eb1a91597e5204273db50c1abba44 |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/6ae4eff1e240eb9a3dfe749fc33f62aad0a384a9 |     
   arceb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/dc4ad32d1a308d69c8c776062cf5289119d962e4 |     
    i686     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/c5ac4678bf388acf2b48a15c97749286f7751bef | ORPH
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/5e375c28c7b0bbaafb905364724b4b86c135b597 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/6960440d581292e0bdb8275cb531f0d41fbe66b8 |     
    arm      |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/4a2e5bd8bb5cf425430d985ed0ebdacf583a2351 |     
    arm      |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/7c051b9e52eb89f3f843eb703067db6ef277886d |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6232740455cc99dad8683b25f34807f6759d6583 | ORPH
    sh4a     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/03bccfc9b285a8728fff8318b21606c5a3062f24 | ORPH
    m68k     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/dbc06a19c89fc51d3db84c02efb409c5362cceb7 | ORPH
    arm      |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/de0325b07b75f2ec9939f8d2e95335ec1c6623fd | ORPH
    m68k     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/e29464b223370fefeb92964ea33831366c9de911 | ORPH
    i686     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/32e7b3fd7c007d95a8aab216c3ef8c153da1c2a3 | ORPH
 powerpc64   |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/f16f8acb5a79b75a8447e65839771cef4dce06ac | ORPH
    or1k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/6ece2c8de73dea7c3c8345f0ec4386f9fc83a035 | ORPH
    arm      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/232762284504b83a8776cd59a12c903ba484599c | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/8f6059c25756085968a09f871134276319a82d71 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/241e2f2a0791e8753b511a2845630cca6c1c5975 |     
 powerpc64   |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/feeed29591f7e76680142fd9787c13d6dd02cd2a |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/669390315e7febeaa5345603f00e326f6493b63a |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8e7738ed9df731c5cf5b51d6befaad5977182372 |     
   mipsel    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/918eb73eaa619b3aa2551cd8a21857ccd5fe6b8e |     
 powerpc64   |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/5729c1ea89f3524a763541c5ab5262977043314c | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/7275a2c692d8c63b158b4fc2d878d9fddfbc706d | ORPH
   x86_64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/93bdff3f10bfe6ef459d6c1ca829d31b666dde47 |     
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/7a0e4556bc8ef74912a240aefab3eeec72f202b3 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a80d6f96171323aed3c90f6feeccbe53d1c8a12f | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7485ec6745e903d6fd700edb61d00ce58a1750ea | ORPH
microblazeel |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/e57795cb7cbe3ca2e347a84bd377b12a60bf2faf |     
 powerpc64   |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/1a5fec0f90240a92d75a36130b875dcd9a42132e |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c8f9e4a21868a1997b9003a9703541a4f17360ea |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/22757f37e9893cbe8fd5b26d0366a5ca4867ad67 |     
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/98ffdf31dff3f7aa015d65905d92a11b1a987dfa | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/83381a6b991419ccddd69816fc891308dec080dc | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6606273797423f28fc6025c27cf8990d951d8f38 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a508840ac5f6e59240c3653a2b5dd37a2b9bda5a | ORPH
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/11b69c87f89dbc13d3c0b10ca674ac7f6c1a7e48 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/ed06b9afcd7c6a9da808e3bc70dac4d9f1924f5c | ORPH
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/7b34275ca8c204ff5615e3a3b82a02015aae4cf1 | ORPH
   s390x     |         weston-14.0.0          | NOK | https://autobuild.buildroot.org/results/8c27463705dff7a8bedfdee8bf770af308ee3e79 |     
  sparc64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/a54be41c3328037bb45b3372ebc3083bb689fddb | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
glibc-2.38-81-gc8cb4d2b86ec... | 1 
           host-systemd-254.13 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/2eb5ea0ddff93782657ca92af7828491a5a5a2ca |     
powerpc64le  | glibc-2.38-81-gc8cb4d2b86ec... | NOK | https://autobuild.buildroot.org/results/f92deb192fc5e2c4a103837710ddb69cbfdbd8e2 |     
  riscv64    |      host-systemd-254.13       | NOK | https://autobuild.buildroot.org/results/fc8b9ab98d9c94e04ba3ebdc5d2a961124bbedc1 |     


Classification of failures by reason for next
---------------------------------------------

   openvmtools-11.3.5-18557794 | 1 
      python-autocommand-2.2.2 | 1 
    python-cryptography-43.0.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/6f18725f0ba363606fd2dd6254802fcde1186c11 |     
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/623c949d84eba3a538855310cf9219cf4926f575 |     
   armeb     |   python-cryptography-43.0.3   | NOK | https://autobuild.buildroot.org/results/e1a93e8f47aecf82242e959e7e28f143ff0f0b57 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

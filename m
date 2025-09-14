Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51FECAC58E
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 03:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F1040BF4;
	Sun, 14 Sep 2025 03:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I20Q6mk04deu; Sun, 14 Sep 2025 03:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E696640C0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E696640C0E;
	Sun, 14 Sep 2025 03:22:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50CCA12D
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 03:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42DC740C0E
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 03:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjieyeBPI8xN for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 03:22:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7C6140BF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C6140BF4
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7C6140BF4
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 03:22:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45dfb8e986aso31961845e9.0
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 20:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757820142; x=1758424942;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WLLfN3c8uBe5hD8VPC/9mfIOS7eX94FGbDI6EUoIfGY=;
 b=bOEbsx2/uWeNEWFq94tgiSNJzEuuZDllWdCMS8mD7kZ75Z5CT+UNnwDLkShdzztkjw
 EFW/7zEX3/CLmfgg3dhL9+jYxfUtN9FgQcTpDDHOiTgREgCj9WNUCGfzb7Sd57+aL7aM
 ENOLUHJdAXsVa4xjR0kx6HqkEYN2V5NTpShBIJFMfUHtoRdo6X53+W+qtmPs0RXgUbA2
 1kJkt3oVTn6eRbXUKFNvOVRpO/HOA8/c+5WRIxZnwQJFbIqu3T/uIy+pCiUQ4fte8HbP
 Gl/JR62cqbebo+BkYecbsU+LOqIMqdZRdiRnV0XbdyowW6niZFL3uLQ0U5kLlTCED7Qs
 NziA==
X-Gm-Message-State: AOJu0YxUrcVdAGiq9xhjA/1bCNe+zdx/uSAfkjNj79IIXQUIBVAyVv2S
 HwuvsientXPBCde8hlKM1eCKwcKY7/CCR6Y8UFbrTuD4bPieDw5qcrwLzUC7UQ==
X-Gm-Gg: ASbGnctFCiVg7S3MvMN8ZssvJHr054E7crtfLqFP0C1JbmBTRle8S7TLarLyGT3Kv8V
 g+oVC9629Q6ajL4FdfCK3WxQYFMQrcrleqr02IWNV7VnBu1kSs0hoSO1PrI8T/8bJIMCP80rQaM
 G9XZ9u8+ij8p3OfQ1Ic1sUMEqVoMW8ezLIr8BM7gGcz6QfDGfQWGN89f2zvX1pGmiioddUqV9nG
 Tn3cbDbUJdXso51Zj5pal20V1QeVIrtOfBzqPtdQ2JknXwBJuKa1gqXqa/urkvP36UFIEZ3qKNu
 /X6fSkwlDM0D5xfRVmLqdZkF1Ie+UYrjCYHtTDATas3thdUUlo/57de4IHw9MarkZpsd200tO40
 CZWnoIeljLZacW/vt5QekYtkXXJXAwQ==
X-Google-Smtp-Source: AGHT+IFt6dSTjtbTp6ff5bEBHaK4RqBDu9KxaLaoHCg9grQCfOnA4p2vBJFCsYCTnp6hUMkmbpvFwA==
X-Received: by 2002:a05:6000:26cc:b0:3ce:f9b7:4db with SMTP id
 ffacd0b85a97d-3e765792bb7mr6946802f8f.24.1757820141444; 
 Sat, 13 Sep 2025 20:22:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f2a13bdefsm21521175e9.14.2025.09.13.20.22.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 20:22:21 -0700 (PDT)
Message-ID: <68c634ed.050a0220.14870a.718e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 14 Sep 2025 03:22:21 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757820142; x=1758424942; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WLLfN3c8uBe5hD8VPC/9mfIOS7eX94FGbDI6EUoIfGY=;
 b=awYh14yxwG43x29xWAUhGDQBDxXaVpDsU9fK3uWlZ7/qJoK4X7lL+URP+1zfQYwkjM
 EVtegBqK5ShOJBtlgM/6aiNvkD53CBi0GIYr7qo2bd+CYVkJJLPuBBCk0744yNJ5jP/u
 biKjLe4+Z/AJsjhTFMQOmgnB15tIifEneFpaWQRzMW/CtG5kA9GL1Ffz6I9m5KlwFCo/
 1AZ5mwl8ahXzZlzjed3OQiBG6V0u3zHdhnE5Q40owotrURbiQQwrGX+kVh3/XNifTPu7
 S2FT890Z6zZI6DmWREXilWPrhC9QWKJMYgseVbcIQYt0DH9Wl/O8yA3v7+OrO4r82Ran
 M6ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=awYh14yx
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-13
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

Autobuild statistics for 2025-09-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  7  |  0  | 13  |
  2025.05.x  |  5  |  4  |  0  |  9  |
  2025.08.x  |  2  |  2  |  0  |  4  |
    master   | 41  | 66  |  0  | 107 |

Classification of failures by reason for master
-----------------------------------------------

                 logsurfer-1.8 | 6 
                libcurl-8.16.0 | 5 
                python3-3.13.7 | 3 
                 c-icap-0.5.10 | 2 
                  cairo-1.18.4 | 2 
  gobject-introspection-1.84.0 | 2 
                  iozone-3.508 | 2 
libdbi-drivers-0bfae6c43134... | 2 
                 libgee-0.20.6 | 2 
             python-webpy-0.62 | 2 
       sp-oops-extract-0.0.7-1 | 2 
               valgrind-3.25.1 | 2 
          aardvark-dns-v1.16.0 | 1 
amazon-ecr-credential-helpe... | 1 
                   atop-2.11.0 | 1 
             berkeleydb-5.3.28 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
               dvdrw-tools-7.1 | 1 
        edk2-edk2-stable202505 | 1 
                  ffmpeg-6.1.3 | 1 
              fluent-bit-4.0.3 | 1 
               freeipmi-1.6.14 | 1 
                    gawk-5.3.1 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-swipl-9.2.8 | 1 
           imagemagick-7.1.2-3 | 1 
libdill-32d0e8b733416208e04... | 1 
              libopenssl-3.5.2 | 1 
              libselinux-3.8.1 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.16.7 | 1 
               linux-pam-1.6.1 | 1 
                 lockdev-1.0.3 | 1 
              lua-utf8-0.1.6-1 | 1 
      passt-2025_06_11.0293c6f | 1 
rtl8723bu-523cb38e4c62bb181... | 1 
rtl8822cs-0986d5734e7630efe... | 1 
                 siproxd-0.8.3 | 1 
              udpcast-20230924 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/7743e91885fa6ef7a968ec1d2440cb34cbc7a365 | ORPH
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/ed8a4961a93878e1a828273eff55c75017b3a378 | ORPH
    or1k     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/00b42bb31cb668f41b31e85353b63f2c77e1209f |     
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/58b7bbca29ec8e681e15530f9121b0f53faa0453 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/fb2f5f878d9bdad66d37e4209a86fe3602980bbb | ORPH
    arc      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/bbb47c1caa309dc7b42955e7032cf56d3eebeb96 | ORPH
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/30788b6103890c5e255fe4bc3ab9e7203aefb6db |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/00427744f6d42a0e1727f23e281f1108821fee4a |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3b1ac1f62f569e54fbd7637f2eba0f070aa6c31f | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/14f9298f35589b6930fc6ad8adeace65833a06b1 | ORPH
powerpc64le  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/7928f174c56fc213caf00f4bf368915330dde6eb | ORPH
 microblaze  |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/29fbe8683b684564f537fa8a436898ff456f0ebb |     
   x86_64    |     edk2-edk2-stable202505     | NOK | https://autobuild.buildroot.org/results/96bd95f7c992dfa17600c7e9dc87c37b1545d3f3 |     
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/7ac4555c1e92738ecb92e46486af35cea58b2d38 |     
   sh4eb     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/552957993c05019e06f846d54b6b726131c754e1 |     
    m68k     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/01d9b3784d018afd141447cd57c7b16e5bf67b2e |     
   mips64    |           gawk-5.3.1           | NOK | https://autobuild.buildroot.org/results/c229f3bc194a2659aa4520881a0eb656f393a73b | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/83b34552da84d26d9d8715231798d2f8751af85d | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9541ca965831bc283ee875ca892997c43ea3cbca | ORPH
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/cd3ff9d4c1704c77cd943a77ebf7113bcba10699 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/c2384599cd6a6e6454f4533eb2daff08e3762ca6 |     
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/6c9386e35d0c28b84b337e45f10305dcf0b92e37 |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/ce490f3552d55c1217978cb82c581f7a30d9489a |     
   s390x     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/69bac191ea93f1e4eafc8100a80cd879d22a1463 |     
    arc      |      imagemagick-7.1.2-3       | NOK | https://autobuild.buildroot.org/results/be9e36445aaa840e8d431b31a11524a8785f29b4 | ORPH
   mips64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/8f9a5ba35eb0fa824b312efe87063a9022e9b4e7 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f465d6ab805cc52a0344679b31a0a93fad03a077 |     
    mips     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/868a06b1788129f5d73bf90e8b34f01ad6680ef9 |     
powerpc64le  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/3b0b3992feb5ab2880f6c003ca581f5a88b0382e |     
   x86_64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/4146aa757488df972a5c399468257a771d883e1b |     
  aarch64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/1603a3abb4a979ead2c23ee95963427e69a793e3 |     
   sh4eb     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/07e689e130076bd7ccb6b3612a5dc84fa1bf3ba1 |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7f7bf3a96580c4b5702f114fd2299c6d472ac929 |     
   arceb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/22723f3c889cc0ccf2c404e82ecb4bd3395368b6 |     
    arc      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/1d73305566c6b1caf8fc7bdecc7db0982cafc88d |     
    arm      |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/d2e5635507113aeba9bde723ca3038234aa44aed |     
   armeb     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a33b322dadd356e66133295a279f9c891a557d92 |     
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/7fc8197e0d508cb6daa0a9245a62e46b0177ee24 | ORPH
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9d5671ecb9e696d7afcd942a0efcabb6b7c8a415 |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/dafcdf19ddfad4cfa17957c69632e23346d4ba8d |     
    or1k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/48364f956fadb3c07327901c75bdbfd08e8b93cd | ORPH
 powerpc64   |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/bcda8fd472a7623f7d63ce0bf86f5a8892712c49 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/aa22e3dc7bca2f52a311e89849a51c630516c212 | ORPH
  aarch64    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/f40b52c9241c6d0832d0740eecd16968ee84c1b3 | ORPH
loongarch64  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/fad66d2aaf3a4aa8c01bc55317c83b1d34913273 |     
    arc      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/27f0ef457ef95bd32164d3875655a8fba5ba4056 |     
loongarch64  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9aabcf3fcf0654534dd8e0e30bced2749495c30b |     
   xtensa    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/8a0ca112980c8675513f66e93bb08275a2a3937c |     
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/76faea87325d31def7bd3dc58b99663f2c7ed921 |     
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/52321412f209e9ed07d03e38f7770a73ef001fa5 |     
  mips64el   |        lua-utf8-0.1.6-1        | NOK | https://autobuild.buildroot.org/results/3bffe55275a9434682af1bf3390d0830a4859c5c |     
   sh4aeb    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/787b6f76d3f3451bbb47f0ff64f1b1c3c8800def | ORPH
   s390x     |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/5a4b27dab6474fc54fa15f68cd16113b4b3a2efc |     
   sh4eb     |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/3a1f1e3834ee2f863e6914acfc9f667b672e6522 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/c88b7465ab3b5923343962b79dc15e85989f172d |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/7717f3b0931909cb5d9bb6440017773501c444f2 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/4901479336383418a63b0d2cfb5be5996456c784 |     
 powerpc64   | rtl8723bu-523cb38e4c62bb181... | NOK | https://autobuild.buildroot.org/results/aa0c7813a87c84ea092a3b2d2937a63fd953357f |     
    m68k     | rtl8822cs-0986d5734e7630efe... | NOK | https://autobuild.buildroot.org/results/809790fc95b3dfdb4455af36ea47fea4e0f77422 |     
   armeb     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/231145d908e075a6a3aa81d2d1913787def49423 |     
  powerpc    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/22ac8a7568da24502607b79d1084060dc66f04ed |     
   s390x     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/7ce4d1a2d5ac4a0745d7b9d81e5ab080e276f049 |     
    m68k     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/f2f79b43a7a2e46ade43899a0abad273c74f9d90 | ORPH
   mips64    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/dc1902f48ef3956c825663a651fa5d67d7bbd62d | ORPH
   mips64    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/178a7e1133bc6f69e522da349d751478627b971d | ORPH
  powerpc    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/bfd40293196d173d50c4c993c1949c33548d0dfd | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                    dust-1.1.2 | 1 
              libselinux-3.8.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/32d715729b35c15f8bbe445c8b4b4ae630110e2e | ORPH
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/91e4700168c0cbe8a50b588524e89198c20c81ab |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                     criu-3.19 | 1 
                 expect-5.45.4 | 1 
                   perl-5.40.2 | 1 
       python-flask-cors-6.0.1 | 1 
         python-pycairo-1.27.0 | 1 
          python-tinyrpc-1.1.7 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/003ff6f83cb036a2d97536803f293558010f109c | ORPH
powerpc64le  |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/19134d30ff9e3d370c8dc3be14ab9d1f54352d10 |     
   arceb     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/e7998c25130618958a9c97ef8f34b39b64d53e94 | ORPH
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ba2db7171aa661ca4a6e483ed38caadf9718e2fc |     
microblazeel |    python-flask-cors-6.0.1     | NOK | https://autobuild.buildroot.org/results/eeadcb2e416cddaa5d059b31ea5dcc9f766a3cff |     
  mips64el   |     python-pycairo-1.27.0      | NOK | https://autobuild.buildroot.org/results/6a2504915dde9199ef9e6180422ec8ae8feac53c |     
 aarch64_be  |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/1334fc3551452a39dc802b5b60400a0b7f7a9943 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              host-rust-1.86.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
          sane-airscan-0.99.33 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/6ffc7b4ef22c436907ff7065e33d2636e7e9be9b |     
   arceb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/d47c01dbd4985ef31a146d5c0d52c05b8981fdb5 |     
 aarch64_be  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/7e312f13c70087afc0ea5d5a876819b18ae5ebd0 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/3b4b25597f287f57b2bed0a025784aae2b61b904 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

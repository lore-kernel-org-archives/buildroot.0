Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF1BCAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 03:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08C940645;
	Sun, 28 Sep 2025 03:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpGH-Dn4VtMd; Sun, 28 Sep 2025 03:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF5540649
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF5540649;
	Sun, 28 Sep 2025 03:19:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9288229
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 03:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB37E80D8D
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 03:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhC4dIslv4Gf for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 03:19:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 203C480D89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 203C480D89
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 203C480D89
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 03:19:46 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so24619835e9.1
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 20:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759029585; x=1759634385;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4EF2CtQ2sVM01J0cvBMEo7F+8geBWvT513DfWRkl8VI=;
 b=K8ordVGgvqGk9/beFeWLbLPIt4yhehksufVdZPFi1lUDLIcY5LbLEe+M7FhvfMEIQx
 +NdNkAIxGpY2PpUB8fULwUIc0uvSg+ZFr4nrD8tULWokf9orKAw0M0ZgwUJtf22DAVBB
 br/HB119+w55ViGlykwzdIDUPGr3gpHorIvyHBiLU7KKJgJ2hcFZdU8/nNosBbAuefFD
 8FLPrprLCX3NF0hRXSZ7sugedDOtx505KsBIhVKD3EPNFfa5TznLA4XVrxtMGgXtgvre
 uZhWTPSvRNLy6mGFS9Mlh8gA2+wXHvCkcqS1hvURvqq7c8Ua1NXmCF6hZDas49qJsFua
 ssaA==
X-Gm-Message-State: AOJu0YyanCxUV/ax7RjN96BzMs72jylEBK08k3ltm1CxrC6BcDRKHvzf
 tWMoPVTVbMLJfZ37m6V4a6m8kKbz0b3jorUMFwp5Pmvdga4Bp5D/DqW72zlHAw==
X-Gm-Gg: ASbGncuwJfF7E6D2bYNUzhFosttzrVeeiLVhWVJn9PYVM8R1jYOP7/kvSjIKN5+gqOh
 Qw79/TXhWyiluWalhkXWhIeAW9qAgVl/z1/E/OsqNFDY8nQQXBkDKG3DQvHllK7oSqKQMa5pzo/
 GdFO8/CcnI49lI+2OfEbkAddTFRojgW67sPRVDd2SVkC/sufEa1hUir1Xe9c/HQJWSfzupvV42E
 cnzFqih/4Sot7YlT9GKJGX0Eabc6LboBXlR8+rV1u65KJ0wVUZhYkbeb2YdNybhaZUUbKmxktQW
 9SAgAw5T79FxGJRN+CfLDFdpncAuChDDbnON3eJF565hYEbAsNT6wH1+oWjL4a+XNfpffJY/54J
 /t9NlqRDvi7aUsAoaQnK9yyxbbrYbYDExvqKuaYRn
X-Google-Smtp-Source: AGHT+IGx49MW21HoxqPNIJeoh6MbqvUa5TAfwDearhjjq03NQdoF/9uEzgtVUyLKiAmD2YOzt0SQ3Q==
X-Received: by 2002:a05:600c:8b26:b0:46e:4f25:aace with SMTP id
 5b1f17b1804b1-46e4f25ae07mr3226635e9.6.1759029584677; 
 Sat, 27 Sep 2025 20:19:44 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb71esm12781850f8f.1.2025.09.27.20.19.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 20:19:44 -0700 (PDT)
Message-ID: <68d8a950.050a0220.12cf25.0625@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 28 Sep 2025 03:19:44 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759029585; x=1759634385; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4EF2CtQ2sVM01J0cvBMEo7F+8geBWvT513DfWRkl8VI=;
 b=aX4F0dhSGesjdL80XO/fF2mLH891owogzgNg6JXyZ/uWAA4MkWInmFuvzVafo9fAnv
 hs+NlpR7SEASY28wu/VtzESMYUr+XZv1+FIUd0NACqIouTbEosb3bHIRhrYUQ5D8HCmB
 +RrcXN3JeT5l/400S6Twgj/Y2osLJu06cRtnOnnBrL0SIgSF8s+hdUCMFbOg+alT7EbH
 dRzAv0Ztn8K6yb1u4k93UvqW03fXI6KReiiPnW7WKUnjIZRnjG1ai4OqW341s3jn0Zoy
 n3/RVrzcladhlhDQ43lVIKzXtoePW11jtMubC4j1LDsMj7B0rnOzUCksM6V5Ec5nDCCq
 VZ8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aX4F0dhS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-27
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

Autobuild statistics for 2025-09-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 11  |  0  | 19  |
  2025.05.x  |  2  |  5  |  0  |  7  |
  2025.08.x  |  1  |  3  |  0  |  4  |
    master   | 26  | 76  |  0  | 102 |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 8 
        vulkan-headers-1.4.317 | 5 
                   cvs-1.12.13 | 4 
                    mpir-3.0.0 | 3 
               bctoolbox-4.4.8 | 2 
                   foot-1.16.2 | 2 
           ghostscript-10.05.1 | 2 
                libcurl-8.16.0 | 2 
          linux-5.10.162-cip24 | 2 
                 logsurfer-1.8 | 2 
procrank_linux-21c30ab4514a... | 2 
                s6-dns-2.4.0.0 | 2 
                       unknown | 2 
          aardvark-dns-v1.16.0 | 1 
                apr-util-1.6.3 | 1 
                   bird-2.15.1 | 1 
                  cairo-1.18.4 | 1 
                     crun-1.22 | 1 
               ebtables-2.0.11 | 1 
                enscript-1.6.6 | 1 
                 expect-5.45.4 | 1 
firmware-utils-86739f2b3ae9... | 1 
               freeipmi-1.6.14 | 1 
                   fwupd-2.0.4 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
    host-llvm-libunwind-20.1.8 | 1 
               host-runc-1.3.0 | 1 
              host-rust-1.88.0 | 1 
            igd2-for-linux-2.2 | 1 
             igt-gpu-tools-2.1 | 1 
                 inadyn-2.12.0 | 1 
                  iozone-3.508 | 1 
               libglib2-2.84.3 | 1 
                  libjwt-3.2.0 | 1 
              libmhash-0.9.9.9 | 1 
           libmicrohttpd-1.0.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.16.7 | 1 
                lmbench-3.0-a9 | 1 
                 lockdev-1.0.3 | 1 
        ltp-testsuite-20250530 | 1 
              netavark-v1.16.1 | 1 
                 netsnmp-5.9.4 | 1 
                   perl-5.40.2 | 1 
                python3-3.13.7 | 1 
                    sdl-1.2.15 | 1 
                     shim-16.0 | 1 
             strongswan-5.9.14 | 1 
              udpcast-20230924 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/203c31338d2fd81225165e6f64618d1c4410b757 | ORPH
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/40a4dd43b7f8d570ef7704084bebde857715ab0c |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1390ec2846960615f4b8b8f0a617fa480f0c6f23 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/46ec9e2eb7b4136057519e8ab1f418347da82992 | ORPH
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/29d0b859b581a9e749686bc7eb6f0f867e93f448 |     
  riscv32    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/9484232b6392796bb44a23d0b4f77d60153f20ed |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/963ff0f0d20be37e0d1d1bd777b184539e0c8f5a |     
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ab171e4ed0e47a0275ec04aea7fedb92c7c232de | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/94e6aaf74033b8afda0eb384885ed3a3e0e545e8 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/816c00f2176431324801ee3ce6a3207e5e0375cf | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bc32601f396968b7f67bd3a4d7513e0505ab4a88 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/04160783f02a3b456e6c4829d3c7dadeaf7bf7bb |     
   armeb     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/4385b89faba8478f5117d4615e57b9fb66a429a3 | ORPH
   sh4aeb    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/e93017be23b4d8f34d6c1fa3157f5c149e75715d | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/836f938327da184cb4af91f09f9303817e95da8e |     
    sh4      |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/11cbf93727b35a7c42a4a3a1c91894e6dcf0726e | ORPH
  powerpc    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5f84d7ac988601f5ffbe9279ee467305a5b9bab7 | ORPH
   arceb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/d8109b3c2160e6675c78440f033bc606033d7271 |     
  mips64el   |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/c8c36929651b6e47738f58c5c80658d494f8ac69 |     
   xtensa    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/2165eb2eae01e01baee5da33fac6e14a5d81d7d9 |     
   x86_64    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/63924a152765d171c55b02d76ba8083e33137c5f |     
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/2b6d9c3f486f6fa33afcc2717f4457c50d99cb22 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d62fb4784dc49f1710d393054b2113b0019b751d | ORPH
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/da26669335184fa03dc9ffc56dbf93d5094a7cb2 |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/3ec12b67f3bdcb1fd95eda21c0a8766ed5e79db0 |     
    mips     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/a058f58a675165d8fb9d64c339dd81da0b4dd5aa |     
  aarch64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/45e0034a50e06bcbe1482ce57ef0a89fd44e4498 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/5eb4cd4899d08b8fa9bdd23a63048213e9110790 |     
    or1k     |       igt-gpu-tools-2.1        | NOK | https://autobuild.buildroot.org/results/330a729a8f71b248dfcbdc6947475001007170b8 |     
  powerpc    |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/1f85c7e000b3ace44a16b93a06bbe079e5bb7213 |     
    mips     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/3fc7429f7b7f3273589ecb73beeadad92e747133 |     
    or1k     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/ca50694b51822edcf2dcb6278af8073bcc896060 |     
   armeb     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/5a2be8c7a8c5bb633df1a88e48911efef579b17b |     
microblazeel | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e153e4fd83682486b5e7aebd73351549191783d3 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7015ac37610b3666ec6ea258d5e2821ce86ed075 |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d225df225f85e8acd8addaad95d1110be4792fe5 |     
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4ea17de3ee6a2521783ce00173d38f54bb851c9a |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/92312cc030effc0a63ea347e3f8b278f21f17e8f |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/6760faaea45958e7e17d1eda725bad4e67d507d6 |     
   sh4eb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/30c809133d6ce0cc306a01c7650e139946d0b066 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fbaffebcd1fac7c96b10572133e39419c942e1db |     
   arceb     |        libglib2-2.84.3         | NOK | https://autobuild.buildroot.org/results/3cb362a91fee14cae71d31afd9212a8046b67de1 |     
   sparc     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/be44988ae476ef2171d286c6e293aac550c4b3d5 |     
   mipsel    |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/c6b38b8cbd88b2dc4c82bf8545624ffc98575035 | ORPH
  powerpc    |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/b71a39fc91e531feae2b6ce223923a33a28298a4 |     
    sh4      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/7a841372558af36ee172d67d3b9c619eafd00aa4 | ORPH
    or1k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/23144a8108c5837e3a9cf26ad6ac73fa16dc740f | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/32e476b04e6c96979c1ad62264eb8b5dd2b16747 | ORPH
  mips64el   |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/6e8d07e68c5271e942c8116ccc3baa58f1751ab6 | ORPH
powerpc64le  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/affd7e0039d41117d4fc97a3423fbf0bdd2a5323 | ORPH
loongarch64  |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/f5f4c5a982d39ca0e3d4cbc4651bb86a806f1966 | ORPH
  aarch64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/219e981d0c89cf105d3bcbc0754ff9b7116e77a1 |     
   mips64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/f7aa55639a83d33b9c47a5d02bf564d40fa70053 |     
 aarch64_be  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/813493d61d5c8083548d1990944598d1e5533900 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fc011cf47c86bd173dc830e3899b5de43f7a3abb |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a436114cdbd1046b7da8593495f4cee581bbba79 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d35a4122728513ef02d946710c6b94160903ca0e |     
 powerpc64   |        netavark-v1.16.1        | NOK | https://autobuild.buildroot.org/results/29c1e31135c86318680edbc20a5961f620e598b7 | ORPH
    arm      |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/079bed9ca9000c8895d2a07a500fa37013da7162 | ORPH
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/cf0433407d89829fc9948bfb5c972e8b6f680d74 |     
   xtensa    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/f052774ea530204ecd95e54fd5fd18c8019f9ac7 | ORPH
   sparc     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/33c08ad298fa673cd095f4c8cb19d681eb8aafb5 | ORPH
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/ae46d2b2b32b5bb5066a2d9f02c5f9539774504a |     
 aarch64_be  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/7a8acd57e69e1b3395857a570d32972e9e2b69ae |     
 powerpc64   |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/0716fecc91b08f150f355b5b2cdcc5dead60ce04 |     
    mips     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/c9077f8180eed1b182c2d87e13dbebad4717d711 | ORPH
   x86_64    |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/faef7ceb79e89d50fffd17afc55367a189630bdb |     
   mips64    |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/f11e1e48942acf9bc2ca0f2c91dfdf00a62c2768 |     
 microblaze  |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/fc4759dd73bb5f60244ce66745c0f407754e6ab4 | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/0528fde934457d75ff64b5ea872f023f61ef8a46 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/90c9de21e50fca6c40a4a5cf4e6a82f57aad4edf |     
   armeb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/087891628f864517f49bd6a087012e32d0b7933e | ORPH
    or1k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/a29965018e825d6e622c31ff6ca26f9997e32320 | ORPH
    arm      |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/10f63398940d52be9a8ee306daf4203ceca25eb8 | ORPH
   armeb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/7a7caee8237e5f5dc541801ac8909328b393dd35 | ORPH
   arceb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/82a83b59bf1270671693b7c54f2cc7d0a3bb9c72 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

              libgcrypt-1.11.1 | 1 
              libselinux-3.8.1 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/21f1d00b3cb58035a64b790ef65858b925668e50 | ORPH
  aarch64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0887b7387a03e117c00ea02468bc9365c5912eb8 |     
    i686     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/ecd452fcd67c98119f03c174588dca3f790b874e | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    azmq-1.0.3 | 1 
               bctoolbox-4.4.8 | 1 
           crucible-2023.11.02 | 1 
                   cvs-1.12.13 | 1 
                     fd-10.2.0 | 1 
  gobject-introspection-1.82.0 | 1 
                 host-gdb-14.2 | 1 
      libabseil-cpp-20250127.0 | 1 
                 linux-6.12.48 | 1 
                nushell-0.96.1 | 1 
          python-tinyrpc-1.1.7 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/efc7bb6da97ee63115a81338958b5ccc7f0dd20b |     
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/523afc7429a7cb6f9fea3be81a2c7c2f8e27bd0e | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/b610288293df6e684d77926c2fc15e48216165fd |     
   sh4aeb    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c3830ad9bd701d10930798319291f694c178eb77 | ORPH
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/12c55eaa419a1ef543d19b70c96d8d277eba1e87 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d0cb9a9edc235698a31006bb085d79a5712e3f41 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/30c8a263d7ca14ab92d8d252caeb30d73b4600ca | ORPH
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/c8dbfac8cc8729529fb942168e28b10b738139a8 |     
    arm      |         linux-6.12.48          | NOK | https://autobuild.buildroot.org/results/72d723b41987a7a267cb9950b267be6987a4cedf | ORPH
   s390x     |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/4be2efd38f6364d1fd83ea0fb8e7fe90e33e427d | ORPH
  sparc64    |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/7fe8676bf054fd92737da58e6b10043b5c86158a |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              host-rust-1.86.0 | 1 
                libcurl-8.16.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-6.14.11 | 1 
                lmbench-3.0-a9 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/863b387516f8adb06e5d7208da5468eab78f1944 |     
  aarch64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/2b63273b880310ef9dcf39fb4396c095d9984688 |     
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a5b05cf00943b4fae4ba49532f3721186c996472 | ORPH
 powerpc64   |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/006d4015372b1fc36de5213d3ab71dfd4fe8f478 | ORPH
   armeb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/16140af6a67a2adc887b407c829ad6235e322183 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

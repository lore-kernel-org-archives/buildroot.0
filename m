Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A397D6D25E
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 04:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7BB6424A0;
	Thu, 28 Nov 2024 04:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksrspS9c0Abo; Thu, 28 Nov 2024 04:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E006442496
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E006442496;
	Thu, 28 Nov 2024 04:18:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04A7A1167
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 04:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6336608A4
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 04:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfzioif7zH8e for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 04:18:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E72060891
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E72060891
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E72060891
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 04:18:12 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4349f160d62so3138865e9.2
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 20:18:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732767491; x=1733372291;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=snOxhMwwmGXgcPQDv3WTDi8SPbCP9acBMVbWNj8jXOs=;
 b=R5cBTNT2gCsf2xiQLrEoh40leUGUG8QfyEWvgaYGKfTyb7x+ZXheX/g6xqLnvaXxfz
 MRwfW6ECpKnl+gm5Hz03WlD5gkxYlPjZA1mH1nCysJYB40e4YqGMpP2JL4dLryX54IJX
 qAKH1pRb9VT7mxMfsZAZI7SR9VfdMW4hXNhtjoGadznaAIRP+lBpS60PzlW/QlUdLY1D
 yRz2zAE13F71tJbNcRPPGZKBzFTHLKbrDCLLXWnu954/Zjdq8DynzTcrZVg9ryD5i2Iv
 GSk6xO4SSiwVVzfmSaXoWNR3dvCtYQKo/DBvaChl0T3GVMAi+UXA9Ea7GQwAz60VwOnX
 Un7g==
X-Gm-Message-State: AOJu0YyVzBIk3DV8VZoIBsQ2IZeX6iKkPnhNYI2YZuC94NGUuLArmSRk
 I7R1qFuq+31n2Tvx3aDwr2PNQo/WhlADwobufmZKWJHCXiCJA8NowqQPwg==
X-Gm-Gg: ASbGncvZr7CUx41MsHiNnZeDk927N/8k/3wdoxrm9du7G6Q1vCMRF8k9ocDw1mr+9YU
 8vY78ZRbpdUjvyCIUTdIa5+hSQnwpo91CGPyI91yaBUChi7Pd1h1akyVDC8VRQcrNknZeLHG5Jx
 1X5jQDMD5cRZ2R9PjyKjBApVmINVexA3d7xWYXMmn5m4GNJKgmNUmNUAtxs9FM6LleEwazgR789
 idPO9u3j8XscwdfNkDqeRjsVaN9ZcZs+kyivRzJYuTfGRw7VsVZcQ==
X-Google-Smtp-Source: AGHT+IHLJ+MuNyccwLBnWKf35e7tztlxzpHpKu5Nffv6AWArZRFaykHXTo2+wo/s+628QwT1+yrocA==
X-Received: by 2002:a05:6000:2cd:b0:382:4485:2db2 with SMTP id
 ffacd0b85a97d-385c6eb8d9emr4926875f8f.1.1732767490574; 
 Wed, 27 Nov 2024 20:18:10 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097eb1d74sm299947a12.75.2024.11.27.20.18.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 20:18:10 -0800 (PST)
Message-ID: <6747ef02.050a0220.33335c.0eca@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 28 Nov 2024 04:18:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732767491; x=1733372291; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=snOxhMwwmGXgcPQDv3WTDi8SPbCP9acBMVbWNj8jXOs=;
 b=MhOCuH0OY3VoIyWNsS2Hk8zugRxVryegVj2BiiY5lEt+7yMDW7dbZzuBgW9+7yDAOG
 H6kKqZls1KRn2vOC4L4mUp/7EyNFWoDOZuEXP9ABikLieETrPlN/qSmrvXpJ1glelSsX
 EGN/p5YE0iiKvTjxKrTwrE0ZkXOkT5adgLLRg2dAI99ktodsPjay1VCu9RRhUGqw6ViA
 INSJJuAKyQQyrWsxvEjEd8xvIiQlu2h4yUt/tmQAaENRC2nPUb85gyy99ATLtOQwhBg3
 GnuWVzaJXYF4K7X45BQpnMOifySeGnjDiWl48TIbEtIB2QK2dbzJiymQj4bssnjsFkOB
 FNnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MhOCuH0O
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-27
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

Autobuild statistics for 2024-11-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  4  |  0  |  6  |
  2024.08.x  |  4  |  0  |  1  |  5  |
    master   | 13  | 74  |  2  | 89  |
     next    |  0  |  3  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 6 
                lmbench-3.0-a9 | 6 
              host-rust-1.82.0 | 5 
 ibm-sw-tpm2-rev183-2024-03-27 | 4 
                 linux-6.11.10 | 4 
             util-linux-2.40.2 | 4 
           at-spi2-core-2.50.0 | 3 
                   perl-5.40.0 | 3 
                  ffmpeg-6.1.2 | 2 
              fluent-bit-3.1.3 | 2 
                  giblib-1.2.4 | 2 
         gobject-introspection | 2 
  gobject-introspection-1.76.1 | 2 
             libargtable2-2.13 | 2 
                   bird-2.15.1 | 1 
                    brltty-6.6 | 1 
                  curlpp-0.8.1 | 1 
                   cvs-1.12.13 | 1 
                   foot-1.16.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
glibc-2.40-18-g564178076272... | 1 
                   grpc-1.51.1 | 1 
            host-binutils-2.42 | 1 
host-binutils-bare-metal-2.... | 1 
    host-python-greenlet-3.1.1 | 1 
                    ipset-7.16 | 1 
                latencytop-0.5 | 1 
                libdrm-2.4.123 | 1 
        liblog4c-localtime-1.0 | 1 
              libunistring-1.3 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
              luabitop-1.0.2-1 | 1 
                 mesa3d-24.0.9 | 1 
                    mpir-3.0.0 | 1 
          obsidian-cursors-1.0 | 1 
                 openssh-9.9p1 | 1 
               pulseaudio-17.0 | 1 
             subversion-1.14.3 | 1 
                 wolfssl-5.7.2 | 1 
                    yajl-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/63badb0a71bd6106467956a9c82823b61deeff8f |     
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f02ed6c2f1c1f2254caec1c970ac11b8cc3e6333 |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/04a91fdae561b9c85b403547836662226508fcbd |     
   arceb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5684c3458d86733438014b7ea99eb8fe6e83678c |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/ef704878dfa2e7193e6c03f37116f6de7fb8bd9e |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/c108ec79311f845c12ec4508551566c0294b111f |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6d5dca37938c9df5df89ff7d86fbdad1e01d1c12 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ce3ab3ba6f484a1ea4c65a7fe28b4b11fa057b44 |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e5ef062a09542d441378e215c124afb42e4952e8 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/456c853d52c94b9a0af96c4d3aa8b2c441d582bf |     
    sh4      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d9ff37ea5b2867ed7dff210ce5ebc80dd5e91148 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8ca8c13b03b3a7a79674e3e52fd8f474f0c9b88a |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/17a28bf8137a6b789a69e5696618ae971f55dbd2 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a35e21e55b5e4368b16fc2a1d4995528ab3ae468 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8e70d43fd804ed4590e53f89184ebaf9f84f1995 |     
   nios2     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/68d4aa86ac2eba0506b9bdf4da0647c3506989fe |     
    mips     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/5bd16cd1bdee36b5867e556806746d026ecd806b |     
   armeb     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2f71820bb375af2becfda563a476a16873b85f31 |     
microblazeel | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/b356967e9f60646f214c56603881551c55d04eba |     
 microblaze  |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/01d082f7227d3c0e690fad9c769b574aa067950c |     
  mips64el   |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/c114855a3da84f5a774bad65f83688ede18924ab |     
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/21d0f8cf8ff3cd727dccf804f80318e601b3a5c1 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/3101c636f319c40ff3809b0ab83e6ee9363860bc |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f4453c3938d72407c48ba9554d220bfd08e376bb |     
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4c2c1614ea3e8342ddc8f71e5d8ae19bfd362ae6 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6e639706dcbd5e157e99d9bf54bbfed15602324f | ORPH
 powerpc64   |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/a6a0679e237c36f93f67ed0cf42299bd38f51537 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/91b5e894df39456d5cd881874660dd3ceaeee975 |     
    sh4      | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/0055f945b1b01dc11d753b8b93cbc2ce654c2e5b |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/86c6963d2d7cf0bd421445e03459ed6e2d774b66 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ed1b76b7c515195b53cb0aa9cee8321cb2c7ec2f |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/40220b7220006714ecd1acd29d63431f833de61f |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/17947325ce96272e18447815ad0a409d9d625005 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/f0eb7d2733cb26bc17ecdb70538003f32e6eb6e8 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/af0990a35856cb107c1a46920b351ef7c34c34c4 |     
   sh4aeb    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/eb9c58c0e737a798bb11cc5f67e6b9fb50685327 |     
   armeb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/cdee839287cd1425a5495cb81b6f2fef0eaa3ab0 |     
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/4322e8df2832108c6cabdb520bba2a1d28074e90 |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/4f9fa6b167a2d58527838f6730c18c4b3562f426 |     
  powerpc    |           ipset-7.16           | NOK | https://autobuild.buildroot.org/results/5c7aa82fa7dd2794272caf358ac0f41d8033ac82 |     
   s390x     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/6041c307ad50c359c11636b504be0f5b71bbc511 | ORPH
   mipsel    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/66a6e885684c7895193fecd2aaa8f9b3d38d9836 | ORPH
   nios2     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/a4f092d4073cb9be992bc9a96875fb30e805803d | ORPH
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/8620ad05dcd43e92216d1e4374da58d8c8185dfa |     
    or1k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/8e3e35c77fef92788e41036902d4aa6a40661027 |     
microblazeel |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/03546bdeb0637cded464b3567f6bdc5acfefee4e |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bfca8f2383bba71a758dc1294226f623d49d944b | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/63862c37d49e7aa2b0146214fe0730440525c3ab | ORPH
    mips     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/fdcdcfc4b1ebdbbe171aceafb97fbee7d3d63883 | ORPH
    arc      |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/1d03b56f4af0819bf2782bf9e228a2739c4cb56f | ORPH
  powerpc    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/1c1423406f1a151801865ca62d0454d43f6afc1d | ORPH
   nios2     |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/5cb2d41cd9edb37cdb89d19e6ed650f106be83b4 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/ed1e3b2b85321e3389b1911d17c61fe202bbe4af | ORPH
   arceb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/5a61101f31752ea00656a6cf6062b73b4d88d0bc | ORPH
microblazeel |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/0e164a5af2121e655c8586037291aad2f0917a33 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/0b81527e8c064df2f987776b9fcd1ea3b2153ca8 | ORPH
 microblaze  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/cdf2b03928729820d83ee1af3e444743cc005e2a | ORPH
  powerpc    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/956a601163d2819aa3d71c74a9d4d07fe23da34e | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/e1644791e07f165d4b32c82db79975749c2924c3 | ORPH
   x86_64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/892720166c0d8fde71cd3be4a1e07506eaf22d67 | ORPH
  mips64el   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/bd75141f8e693d89ed686c3fa421ba859c897396 |     
  mips64el   |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/c51ccb755fbbd01c4e0f211b707e574136bfa8ce |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/489fa845f4f7f80da01c7d1be034e26c2eb9c354 |     
powerpc64le  |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/4b1d217744aafaccceb9103c4e804d3d1f97eacd | ORPH
   armeb     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/2df1b0c1873183ffbff3cb32bd94afcb535a192a | ORPH
    arm      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9cd001722c5203784b6a09a6e4471230d05727bd |     
    arm      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/54e7f023280f13a1a1c7a18f33a7f2dfc68b4102 |     
    m68k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/20a8cbc5833379195dc846486cc963154be78388 |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0484ab71b19300825a9ea5ccb3de5868c993ebf6 | ORPH
powerpc64le  |       subversion-1.14.3        | NOK | https://autobuild.buildroot.org/results/5492fc86e88fae21d233f4c799f94ea0f89a1a7b | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6073950011cc0370e133dc7d681783ee11e71c16 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1d042671d732868f4476c2016a4970efccbf8b81 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/23a87a25880537ef0cd2ab83b413a0eac144d0d6 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8fbb7e2cd153b212d873a1d62edd0ae50c9714bb | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/07dda44517faad988736ebadec2117f46f0ad019 |     
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/51938786b10e316f69a1359a38df1b645c8cc09d | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
              host-rust-1.74.1 | 1 
           host-systemd-254.13 | 1 
   python-pydantic-core-2.14.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5fd3eb424c725a2012a39776e23fc748b606fb7d | ORPH
   mipsel    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/bda9a990e97e03831b1e9156977a66c6515bad5b |     
 aarch64_be  |      host-systemd-254.13       | NOK | https://autobuild.buildroot.org/results/9f99a97df2efd5e4ae4ad5cc5882607f0c8766bc |     
   x86_64    |  python-pydantic-core-2.14.6   | NOK | https://autobuild.buildroot.org/results/91d1b448e3030a8a838618744d8d02f77e09a358 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

         gobject-introspection | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2feca894a6c61138f0aed78653271f4fe1b85bef |     


Classification of failures by reason for next
---------------------------------------------

             gstreamer1-1.22.9 | 1 
                   libks-2.0.5 | 1 
                lmbench-3.0-a9 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/e7cc306a29cff56801398c680ca365ff0b03e5af | ORPH
   s390x     |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/448e12007aa51f6514d43a4a5568e1a25b394d10 | ORPH
   armeb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/2f8d6714179693b453969643db8e598f5c440f8c | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

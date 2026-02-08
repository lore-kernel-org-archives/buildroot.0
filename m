Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B64EF06E3
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 05:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60826409D7;
	Sun,  8 Feb 2026 05:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Ow8gqdkBVTe; Sun,  8 Feb 2026 05:53:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C305409E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770530003;
	bh=TOD/FqvrRpLvGmn/gQzJAaH4G8GLO+HuIWYhP27SDWg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=scsB5OKVwgIoz0hpzFTAkJKnrYiWPisgBOSheHo74VioBA1AGWW4C2b520WbNXwAo
	 swMCcEsZk6KBDNEXKFEAmMLa4RYdVp0B9G4mzYGFlCjHT+tOnSZZo2vB4oFadqn0Kg
	 c3YSgMz3UmVM2b7Bdubpbf632WP6Cg0OJTTdA79Ntfk5wP8t7/17qCPzWlZ7M7tl4L
	 NLZeUhlKBMDeREjYWSo+kCeCuO6G0I/qHnWg6lpLBvmtWHTB8VvTH1OY4ZVrzvlc9I
	 e4UDfoPjMjJoBrxhHts8r9o0oQLtyk9b23N81L6o6oxqQSLeG07g1BJ5fQ7EEZIqEA
	 LovcUdAQDEVBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C305409E9;
	Sun,  8 Feb 2026 05:53:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36137219
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 05:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1754340078
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 05:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwLrUhVqnc_x for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 05:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FBD14004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FBD14004E
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FBD14004E
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 05:53:20 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-38316445a67so16608951fa.3
 for <buildroot@buildroot.org>; Sat, 07 Feb 2026 21:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770529998; x=1771134798;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HeEedN+RiV8x6AGEsW+fhIF7RZBY1mjI6aw2vAqTUDE=;
 b=kZRw4u3BCc2bPvXaqO4PO3E5CUcUDcEMLF7CTaYWsMcOYtSZvLn/iamDd6ZtsHAGQc
 y9prO9dYB5lMeW1OPstd1plLkYEEUEutRNd/rJVJdnk1P3pok1j+BHtoSlMHq9xVEplX
 Iw1gwJKaDOjp5UyTRKxRQmHm6I6PMYX2u48cYrEOuD3yEMlusSsdYWtQ4f2OUwb178Qx
 qxKlPApiWFYnHA+YDH3R84sWwWYd0laZ92tl2vibM6vUSH6oPVk66eGgbb51csQKp6Jh
 1TT1D1nuRpJsNSCxZeHQbZUXSGOKJHB2Eb2BQfGWILJIQvmUcR7725YqXTyD8ZzArNzS
 UmuA==
X-Gm-Message-State: AOJu0Yw9VIUCYqWqfpY9tY4yLChzfovRwGwdR0qy4O0DqmPxkwzWSy8T
 2DCgZq3C8MzM/UcIl9Yb3N4oEka/2I8qn0tstx5s3SWxTa8D3Rgy+SGb4PO6vw==
X-Gm-Gg: AZuq6aKQlEWxx4dsV7M6hRVTTsfKpAHefQO2VubSv1BYL6iQoaeBY0Yxv5xgFprpLTH
 wzot//U8l+Qwe/M1mGpMhSJvwz+iq7Na2beOBcV59U9i95cbsEkQxWtSuO4igORYwWryqILgcvq
 4IND1Af/tU0ZlR47oMR59UnvPEvE3GdFlA9/alhlniqBzCntWZTx/0XI4kw/KrCODe5YJEvFgJJ
 qkJfGwff/tLTwtezN9UXUbI+hyfcx706MTiXfi9ZvhYJtltz2PEtsaKiDibjmv2hFsyxrqP4Ffe
 z/I4pTvHalPbkeJZ2Sd5zB6GkeH8L/NBDUFHhfgr7LSx81eW/o/5xKewH3IaBaNovDgg6JWzdl6
 jNVgveVQaKuRlMOJzh9NQxB3+ifbmAGnT07u8RmqbN58tiWgxdG7mtidW/jWdpF5MIsu+yf1GdD
 Jr5rLnRfKXVIiHvXjuGQ==
X-Received: by 2002:a05:600c:81ca:b0:47e:e78a:c832 with SMTP id
 5b1f17b1804b1-4832022f6d2mr105814685e9.37.1770524392977; 
 Sat, 07 Feb 2026 20:19:52 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376b62b835sm1299992f8f.12.2026.02.07.20.19.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 20:19:52 -0800 (PST)
Message-ID: <69880ee8.5d0a0220.2f09b7.7d0a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 08 Feb 2026 04:19:52 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770529998; x=1771134798; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HeEedN+RiV8x6AGEsW+fhIF7RZBY1mjI6aw2vAqTUDE=;
 b=iY4GVxD1jwcJpmCRQJFmvvtFnErjcf/O2OfYvSkT4U0g4+/ySdkTcbsFfqzRqxu48D
 l43WSK4eL2DCf4Mq6FnMIV7PlPAvRUPSiUqzpKVvZoXf4XBM/p0K62CvULZETahUw9rX
 DtdCdL61MxOLO8so5m/3e1YArh3iKD8wK2G6RDlzSZoiztsCbgeRqubsWXNdvfGeXRmg
 jSEtZnfCvTYtwtIED5XddNyUW1K9YaARUgtAJw99arNf/VVQB0/hBfdP2d71DovKjYP0
 fh1ml7fQULSA9aX4EgcZusuoibcMVA5O5Km8qB0G78cEFouwqyWo76DaqRyzZnUq5jLU
 Q9IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iY4GVxD1
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-07
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

Autobuild statistics for 2026-02-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 11  |  0  | 15  |
  2025.11.x  |  1  |  4  |  0  |  5  |
    master   | 47  | 52  |  1  | 100 |

Classification of failures by reason for master
-----------------------------------------------

     libphidget-2.1.9.20190409 | 4 
                       unknown | 4 
ustream-ssl-5a81c108d20e247... | 3 
            gdk-pixbuf-2.42.12 | 2 
               iproute2-6.17.0 | 2 
              libopenssl-3.6.1 | 2 
                   perl-5.42.0 | 2 
         s6-linux-init-1.1.2.1 | 2 
cegui-e7a03afc70c6182a091ff... | 1 
          cloudflared-2025.8.1 | 1 
             dahdi-linux-3.3.0 | 1 
            erofs-utils-1.8.10 | 1 
               freeipmi-1.6.16 | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
               host-runc-1.3.0 | 1 
            igd2-for-linux-2.2 | 1 
             igt-gpu-tools-2.3 | 1 
                     kbd-2.9.0 | 1 
             libapparmor-4.1.1 | 1 
              libsodium-1.0.20 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.246-cip66 | 1 
                  linux-6.18.9 | 1 
                linux-firmware | 1 
                   linux-tools | 1 
                       mrp-1.2 | 1 
           oath-toolkit-2.6.13 | 1 
               openblas-0.3.30 | 1 
                openocd-0.12.0 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
             parsec-tool-0.7.0 | 1 
                pipewire-1.2.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
        s6-linux-utils-2.6.2.1 | 1 
               tipidee-0.0.5.1 | 1 
             util-linux-2.41.3 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/82bdf4902d169aa2f52f0d6decb243d5c942b678 | ORPH
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/8dde08c8578a7cf8d59948b0fb65f722ff14cdf5 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/150bdd3a9219e94b758f143c4ddf95789a0bd1c9 | ORPH
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/debd71755093022cabd6940b8f4a7500a37f4c1d |     
   mipsel    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/22c4682e3abb4874ccb71fd0e3c1bc33cec0af13 |     
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7191caa66e0bd0aa93c69513d4ee50e8d5cd3d63 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e9f33e11e708811f6ee717770760788178afa5da | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/18f39e0c452c9280b5ce458ad333c54f0bcb7cf8 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/bbb939022880085024d6c5ff46ff261098897dab | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/379d4e5a7ad88a91133e62c200519e7b2455a002 | ORPH
loongarch64  |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/3e794362198194ff19ef16b6e1f920a12f18d53d |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/913787c9742423879a8de3069063d654633d12f5 |     
loongarch64  |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/e275471811e43e3803c4cde5a1aa95346e06f2d3 |     
 aarch64_be  |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/961bf478ce9cade03fcbfb257d457022d4e62c64 |     
   sparc     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/fd0c680fd288e37eb7d25c2543c92bbbde69c621 |     
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/41844464f98a8d7a21c90fe63716fb50792927ad | ORPH
  aarch64    |       libapparmor-4.1.1        | NOK | https://autobuild.buildroot.org/results/fc3cc9857517b1523715d244ca96c5f5f0525ffc |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/dd73859d56269dfb256fba6b5c41f7a501776b8e | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/30db45a394aa10a53e571a207151aa4c7527fd6a | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e1b7295467b2d5be8f08ef23dcc84bf6a5ffc97f |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/49346456ac20f109e12d62caca4e628611cf46e8 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1536e0b536b9609211184d1c0ec795978b37d351 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e555fc3fec7a7dab9e1215b36801268ffc19c7f9 |     
  mips64el   |        libsodium-1.0.20        | NOK | https://autobuild.buildroot.org/results/211afebedab586bbdf46bbd0dc8103c224eed296 |     
   s390x     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/fe5354a2628cb2bde92de28700b0d279272d97dd |     
    mips     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/6875ba20fe0f130ec469dbe15412197d76859924 | ORPH
   x86_64    |          linux-6.18.9          | NOK | https://autobuild.buildroot.org/results/65554c8b06e36ff95371d7a15ffbf937fa0fd153 | ORPH
 powerpc64   |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/64cb53cac464924a7cf41ae2d6d3da38821edc21 |     
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/afac1fcd7adb025f73216829e04e4fd67054aea9 | ORPH
  aarch64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/185615356a2beb6b3f9ed07d0e095193d9b6f84b |     
   armeb     |      oath-toolkit-2.6.13       | NOK | https://autobuild.buildroot.org/results/87e0819b480b33d404ce0807bfea0da90f63ee6c |     
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/bb46cbf50f9318c317689ae391886c5beecb470e |     
microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/00daf6640b022dc7547fc7a7a50857e952cbf4a6 | ORPH
  powerpc    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/17ed988c19cda040112b1c81c812c1467856dca4 | ORPH
 microblaze  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/149d1a1c109727388f2e7b53ac5ffc9c0cc5c298 | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/46459feffaa8ea54252ed4a6f31893c67af109ca |     
   xtensa    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/76d95f67f8b42342f2f1d3946328c40f14fa2852 |     
    or1k     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/96d642f917d77b3a70ef46d2e44dad1cf9265eb5 |     
    m68k     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/46d1a038ff4de29a20de0b513247913f195a09ab |     
    hppa     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/eece332204f752b02c3e4415b3c223a40c62c59a |     
   x86_64    |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/7937e3c45edaeed9134e0bd291e93368a01aaf30 |     
powerpc64le  |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/c5f7e6e31e9caa8ba11c3e3e4b81d416e6742877 |     
   armeb     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/1e858f56d84a27d71225950e0efeedb03d90b167 |     
    m68k     |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/8ace1f8993f96711e6973ec80ace602322f53c3d |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/86e3e5304579a5bf02c340dbaaf47bb8cd9e14e0 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/5c50053c60e3c65f719916e25b30a6fdd0f56258 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/9a5bfce1ca6827d2ab9d1020a610025abd1b0860 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0a4e3cfa58cfa95a782e3e66fe2a76ec4a497591 |     
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d3bbc8043d60ec2ac777feacbdab2a99e1ab5dca | ORPH
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/5280518d51b398b224182118eb0c71008d2fd228 | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/688523af5e9bba071ec929cab269f3b2ba764c2e | ORPH
 aarch64_be  |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/61a8330494cf4b8938dd0446afee55aacfc287f9 |     
  aarch64    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/9d3c07427e50364f71d4ad7b2f4312cf60204401 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                 c-icap-0.5.10 | 1 
             libgphoto2-2.5.33 | 1 
        ltp-testsuite-20250530 | 1 
       matchbox-keyboard-0.1.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/a388d981afcc4b240a4f1e2218830901759bbcb9 | ORPH
    or1k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/72777b427ddfc6a84d4af964584dbbe9109e63f7 |     
microblazeel |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/aca7a3c20695d6ec4f338ff4c7f3d185ffd352cf |     
    i686     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/244f01cf874bd9f1d54269d3e032a894821f3b09 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 2 
                   perl-5.40.3 | 2 
               asterisk-22.5.2 | 1 
              e2fsprogs-1.47.2 | 1 
                host-gzip-1.13 | 1 
           host-libselinux-3.7 | 1 
                  iozone-3.508 | 1 
                  pdmenu-1.3.6 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/6a7d4134de9e76c5bb1e9a4c436255a8feb05208 |     
   arceb     |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/c1c2ebef11545d56fc72a08b06851063dbb62708 | ORPH
 aarch64_be  |         host-gzip-1.13         | NOK | https://autobuild.buildroot.org/results/6e1351f4257ec5dfbe5a4e8f9df3924de191a382 | ORPH
   mips64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/09abbf28168eebcce3f346341a6c1bdc13f31ca8 |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2a3c688c04fd7939c5cdad068c3852b0c2ad31c2 |     
  sparc64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/06854beaf880378da1b9ef75123de76465e5950f |     
  mips64el   |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/f211372880c171285eaf7a2a54b6bc478b7aa6ae |     
  mips64el   |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/d64d6ca4912249fbecb45f4e773fd7b79ef61574 |     
    m68k     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/de1119d073af2e6eda84eb6f05dca95855edb1f6 |     
    mips     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/25f95a50c6c6940ed3bdeec9bf03caed948d2dd6 |     
    arm      |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/9549db02e002b5279efed47302b09cf191dd26b2 | ORPH


Gitlab CI results for 2026-02-07
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815386 |      
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815390 |      
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815398 |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815405 |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815409 |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815411 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815439 |      
                     arm_fvp_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815449 |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815476 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815480 |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815483 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815486 |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815508 |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815511 |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815515 |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815521 |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815552 |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815588 |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815601 |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815803 |      
                  imx8mn-ddr4-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815835 | ORPH 
               iot-gate-imx8_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815869 |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13009712416 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13009713516 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13009713738 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13009713977 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13009714162 |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13009717774 |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/13009720434 |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/13009720750 |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/13009721110 |      
                   rockpro64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/13024885937 |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/13024886904 |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/13024887777 |      
                   stm32mp135f_dk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13024901832 | ORPH 
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13024904146 | ORPH 
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13024904401 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

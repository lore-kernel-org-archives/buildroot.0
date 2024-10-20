Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22209D3C931
	for <buildroot@archiver.kernel.org>; Sun, 20 Oct 2024 03:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F86160706;
	Sun, 20 Oct 2024 03:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOfoiaKTwjVJ; Sun, 20 Oct 2024 03:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF573606AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF573606AF;
	Sun, 20 Oct 2024 03:18:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CE101183
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 03:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6562D80D0F
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 03:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9x2UHI0rn72 for <buildroot@buildroot.org>;
 Sun, 20 Oct 2024 03:18:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6538280D02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6538280D02
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6538280D02
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 03:18:24 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c95a962c2bso4056856a12.2
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729394302; x=1729999102;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i1NSquF98CzKIzsAg4aYF3l2XPjuj+lp/gAp94wwTXM=;
 b=lXtnWs5Mj55w5eq9qy8Vbs/9Tbf2iKE9jxkVlK4f6H//mzDEN6cSjxDEZmOPzhd+vt
 FeBCCIvbDb8hqUkA/h9WiynJHxIihlWFrfc3BmHguUy5y4IbpjlZ1HqiP/zvbM5YUk8n
 23bs02XlI6Gi92Swl0hSU4i+Rsov7jOrTa/mYBoJLjqfae3y7xZ0BqU6Khb/hgRKZi7X
 KC6pE5WJwRbJBU9bysU+xwG8KPJkRpLRwjIPI9v2NbDY/wCPj7tj9/pGPPMZTBFfuAfL
 7yelNcpMRdXEF4bAfytp8iP07rKj+spc1pqlQbLucBvzyHmjP9NDwEqeGvT1yDj9Hf4F
 6sAA==
X-Gm-Message-State: AOJu0YwPl8SJwBds7bDXAdU0QrmAx5ZtloMvAO+Il9MdBlPkCkesD3vK
 8pxkPpYHLq0GxM5fXz6BElnm75laR04hAfDciMc6XkdMyTs/6Ewfu8hOu0jx
X-Google-Smtp-Source: AGHT+IGizqkcyOpk6SzYW6tdBpz9c9hxIW1YIXzpo4VLUjdz5Xpa/T9NOOAq7EvuysIzsFk0xi9S5g==
X-Received: by 2002:a17:907:94d2:b0:a9a:29a7:9636 with SMTP id
 a640c23a62f3a-a9a69ba6d1fmr763869166b.31.1729394301707; 
 Sat, 19 Oct 2024 20:18:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d62efsm43368066b.44.2024.10.19.20.18.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 20:18:21 -0700 (PDT)
Message-ID: <6714767d.170a0220.2b7ad9.12b9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 20 Oct 2024 03:18:21 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729394302; x=1729999102; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=i1NSquF98CzKIzsAg4aYF3l2XPjuj+lp/gAp94wwTXM=;
 b=koilQMvNpdHJv6/RvmBfGgPrgB60q8dO7ySX4YTymHDVOu+NeCZ8pJxvBQqhmsruAl
 hOwjc9f2Hk6UYVCuPUgid9IfiaLu95zdi27hpOEW0/DeeG1FmIRX1BfltW2yxyh4tYQ8
 RYyZj+kZ1T3LbqNpInbDtQpo+mzIw15wVVWtF2WiIOPSqtXpMyn82F8PbtU9TYGNniD2
 8ENiRmUytYGl6B+f2sSAWHgO4yHF7URWlOU0p2w8PRUD4pdQR1UrGRhGUEwbyvpB3q8X
 nPrWJYG7f1Ba5GHFJUePRmHZVjBM2rMi5Tdxf/OKpwIk/G8dJucVHbzTi+VkKRRHvdcz
 FPag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=koilQMvN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-19
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

Autobuild statistics for 2024-10-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  5  |  0  |  9  |
  2024.05.x  | 21  | 28  |  0  | 49  |
  2024.08.x  |  4  |  6  |  0  | 10  |
    master   |  9  | 65  |  1  | 75  |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-8.10.1 | 7 
               procps-ng-4.0.4 | 7 
                  bind-9.18.28 | 4 
                 gnuplot-6.0.1 | 4 
android-tools-4.2.2+git2013... | 3 
    host-python-greenlet-3.1.1 | 3 
          linux-5.10.162-cip24 | 3 
               graphene-1.10.8 | 2 
                host-go-1.22.8 | 2 
           host-librsvg-2.50.9 | 2 
           musl-compat-headers | 2 
                 apache-2.4.62 | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    brltty-6.6 | 1 
                  curlpp-0.8.1 | 1 
                  evilwm-1.4.3 | 1 
              fftw-quad-3.3.10 | 1 
              fluent-bit-3.1.3 | 1 
                 fwupd-efi-1.6 | 1 
                    git-2.47.0 | 1 
         gobject-introspection | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.80.1 | 1 
httping-0e26c53d5fe504eb720... | 1 
                libdrm-2.4.123 | 1 
                 libv4l-1.28.1 | 1 
                libxml2-2.13.3 | 1 
                 linux-6.10.10 | 1 
               linux-pam-1.6.1 | 1 
                  ntp-4.2.8p18 | 1 
                 openssh-9.8p1 | 1 
               pulseaudio-17.0 | 1 
      python-autocommand-2.2.2 | 1 
                     rauc-1.12 | 1 
                     shim-15.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/9a0b7615a2bcf1e4963df024b3feea05a0cd3f21 |     
   sparc     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/27c986720bc874fd9cf02d8c3a682b5334061366 |     
 aarch64_be  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f740c74ffdb2090e8c7c8ae5599796ae24bb6fd5 |     
    i686     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/b6f1860d83c665b60a9853761a77fe7dc879275a |     
   sh4aeb    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/0f6dd295b9ce9798da82ba854eef69171cb6c95e | ORPH
   mips64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/dc58d55236253d0d2839149ad8718cfc6a3ca645 |     
  powerpc    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/9cd02ae5ad5d97e961876451e5f52ece49c119b5 | ORPH
    i686     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/767b8d3a0e28f7a89789e7e2c18430661a098a36 | ORPH
    mips     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/5f16aaf6cdb6b7f3b4141881e58bfc7622733bd9 | ORPH
  sparc64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/75658daec1e1db120f531667ac937bd563a288f7 | ORPH
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/a6203aa716990f33c8914ea399470ea40af15970 |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/3c790f8bf7ef3b242528461f07dae7e63153a661 |     
   x86_64    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/86d7ef98232af618112e3849e5c7efc799a8f34e |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/11d8d34588cadd6f7194ea1f4a041271dff442d6 | ORPH
microblazeel |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/c45a725f7d958cf66c8d0b172d07e3efd1701087 |     
   x86_64    |         fwupd-efi-1.6          | NOK | https://autobuild.buildroot.org/results/cfcdec111776fa14a48dee51b66ae5e43bf7e596 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/fcba894a09f0b330e479cebafac5453264308f5e |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/fab0c102a7d760c94e9913c5108444f35ac74c7a |     
    mips     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/91c067271dc1330b99bb2bfa8af9e5bc6f67f8e2 |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/12e81a372c6d4cd5ceea8805f339e2d094b0bdbe |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/cbe55664b00e49596192ea24903049305a92141a |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/b24ac2f4932ead435e763bfb906ea070bec1f550 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/0a700e473e7f30f83967997405c0fc41e2d57839 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7e4adcae77409625ef79d2b3d7a70a48a107fa36 |     
    or1k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9ee9a43414f92d6dbce3b2a1371dac0e213cdf73 |     
    arm      | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/91d93855b0fb6a9a2a7bca63c8cbd0e623a0f0eb |     
 aarch64_be  |         host-go-1.22.8         | NOK | https://autobuild.buildroot.org/results/664b19d988b42f43a5a1084886a5c80c81956330 |     
  riscv32    |         host-go-1.22.8         | NOK | https://autobuild.buildroot.org/results/f3b12bfd840a437087da4a308a1f9bf3e2a46c42 |     
powerpc64le  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/552468c182153bc9b063b31edabefacc2bf62a8f |     
    i686     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/3bf7b7dc9bfd4fe34ae53a9fac509789a3453ed2 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d880f8b2d48b12e09c21bd08089c2f418528b72b |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/f45d3939eb32280211e2190192886f1bd2ab4058 |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/cba47e54436c92f7c76d8dcbbda42d1842b5ba01 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/fddc123f024afa5a23c3e10b3162bcd365778a7a |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/941dc5f0553cfb33576aba1e01d51e8f41d179c0 |     
   nios2     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/eae684ed9bb8ca50992e8b0d6961fe75374c4bd7 |     
   arceb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/4938c3a0f7091bd70476560675777a16145a5ab2 |     
 microblaze  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/cfecb1e5ec6029b9877dff7e1557db2bbad2a1e4 |     
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3dd62633a4e29b308b99954ea671b02a9083539e |     
   sh4aeb    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3f1aca468f243bcfa91ebc748fc4733e548b031b |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1ad2513654fcb02b85de0addc29a9c5749bc579d |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ef5d79380f38234bfdfa8f727cc9f3fbaa62d969 |     
   xtensa    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/9896c81f6d90d8fb0b4671cd62fe1ec575ea7169 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/a8533cca3829ecc8ee08220299f50909c7ae8e73 |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/e6f95957a2e04799c5d78c63e85316710f961efa |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/b297aa8d4059a269d1b190c442feae8d0f8166cf |     
 aarch64_be  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/150dcfe31938a1d5cc14bd66a36925a22c78e757 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6f9981bea94ed2334272bd7a582db88985a3d7ea | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4b19416301d6cf667bdb0a82851ef79bb4c96a38 | ORPH
   arceb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/ca05dd15a60895f796c3ac92d06675b3180b9643 | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/990dfa11d8a1b47b5dbab8dc3a99f072aa78e26c | ORPH
   s390x     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/c395220dd3de4c493dd5be0c9576bca9755a9661 |     
powerpc64le  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/8eb35641f6728b4033fa4fdce0630ac77507dcf0 |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5908322d365d51302ed7173637c1e7a74ef3c1fb |     
  mips64el   |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/9a65784a59055655749300aa3b46be92f83cc2f7 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/00ec9678b2f40c3309bdbbd16c1bb2b7e04dc013 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/813afc6ea5825b79ad25fb3b56a4acbc3ff55f90 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/21b82c99f90ebc660068d05f234ec4d0c37b8eb8 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9963a1f9d38d8de92e2ae76c07c5dda3d2ebbc36 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e29a0122ff5e30a1b43aba6196e3086103b46f59 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/09e0588fa46c0833c979cc203fcdbfec852574f4 | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/255f9636aad9232fdaa3bb167ace6a02a56ada03 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a592a0500bfd5ddd7a6394d7bd5f29d0d47a10e6 | ORPH
   mipsel    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/bd1affc6985707c38e02e99f1683ddd9594a222a |     
  mips64el   |           rauc-1.12            | NOK | https://autobuild.buildroot.org/results/795de0925b8d796e5fd14449983a1147e0750489 |     
    arm      |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/d69e97833b7f231157570bc00d10364c79ff1feb |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-prelink-cross-a853a5d7... | 1 
                libcurl-8.10.1 | 1 
                libressl-3.8.4 | 1 
                  linux-6.6.51 | 1 
               mariadb-10.11.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/255e7ea4aefadc35e501456d67819f7e273babc2 | ORPH
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/29ab21563ebcaf1e997a945c6f7babfa2be07b9e |     
  mips64el   |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/c523f1939ca6468668334d6a4436444a46872583 | ORPH
   mipsel    |          linux-6.6.51          | NOK | https://autobuild.buildroot.org/results/461df5955fcaed5ba19dae9b24a55fe174ccef85 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/6eeb69b86712663087d6e3432f8add5672a9b447 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 2 
                       unknown | 2 
             batman-adv-2023.1 | 1 
                  bitcoin-26.2 | 1 
                     crun-1.12 | 1 
                   foot-1.16.2 | 1 
                     frr-8.5.4 | 1 
              fstrcmp-0.7.D001 | 1 
            gdk-pixbuf-2.42.10 | 1 
  gobject-introspection-1.76.1 | 1 
host-go-bootstrap-stage3-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.74.1 | 1 
          libcamera-apps-1.2.1 | 1 
                libmad-0.15.1b | 1 
                libressl-3.8.4 | 1 
                   lsuio-0.2.0 | 1 
                  ntp-4.2.8p18 | 1 
               procps-ng-4.0.4 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
                rocksdb-6.20.3 | 1 
                  screen-4.9.1 | 1 
              skalibs-2.12.0.1 | 1 
                 uclibc-1.0.48 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       batman-adv-2023.1        | NOK | https://autobuild.buildroot.org/results/0adfee78a2ce3b7bcfdc2a8ebce3f831a3b023cd |     
    m68k     |          bitcoin-26.2          | NOK | https://autobuild.buildroot.org/results/9485d4b20914169116114a09128e40f043ba9b6e |     
  powerpc    |           crun-1.12            | NOK | https://autobuild.buildroot.org/results/3eeef92ba8bebfec58040c8e0cf0ee67850c277e |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9a64ed13b6d34280494ae8e4083974c11f1c9258 |     
  aarch64    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0657e03cf6b8c2a1d5a7d29b87d5e483b950c755 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/849319fa2caea2e27caffd6a8632c69baacff8ca |     
    arc      |           frr-8.5.4            | NOK | https://autobuild.buildroot.org/results/ea5b7ca0304bc13210c7969a46619c7c57ec03a3 |     
    mips     |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/d0ace386b0f35cbd15e0f53f8ea360935e6b0715 |     
powerpc64le  |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/5c5549168e5c6c04d260cf66a44fabeeb4643689 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/cf1c5ddb676f96175330d73267159df470da8c9e | ORPH
    arm      | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/f1800046e4b4690cd4ace97b5f0c96f0a6079ba9 |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/e35b11fb6281440cdb8f638f757522d1aab450d8 | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/6ab25fa55551db4aa015287c7534ccf4d9e50de4 |     
    or1k     |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/1b4d7345825f2ea5b7511c412b6279546d452f29 |     
    arm      |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/488d6b69a91fcf8be6ab1436a5fd318bb7cbd5cd | ORPH
  powerpc    |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/00f98d13359892afb0af476912afb1af5c9f125f | ORPH
    m68k     |          lsuio-0.2.0           | NOK | https://autobuild.buildroot.org/results/2d8731e7e90f0c1d6b0e69283420b068978d6866 | ORPH
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7be485269dd7ffcb2b3af38342e2a11d2bd02b22 |     
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/53436648799d846288c68d8bae251202acd0dbf4 | ORPH
  riscv32    |      python-grpcio-1.60.0      | NOK | https://autobuild.buildroot.org/results/f8c6934788143d5212e019faab4baf6cde08ac71 |     
    m68k     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/5928e57d7d30f6367ca8366543e803298e6ae351 |     
    i686     |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/efa855f7a6ea021a1132ab253e3dfd45364d060f |     
   sparc     |          screen-4.9.1          | NOK | https://autobuild.buildroot.org/results/5351554e48740a325627bc609109000f23349e0f | ORPH
   sparc     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/9e6710512b48214eec129589af3aed21cdbcc3b0 |     
   sh4eb     |         uclibc-1.0.48          | NOK | https://autobuild.buildroot.org/results/2efb35e35b390d5d009fdacb8910c52bd42fed1f |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/ba3f0cab16193c67b2c3578ff4e2dd334205fa74 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b5990549065d39445308cbe5632c700089048cda |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/dec51d8a7f331acab212f1550e31f30c1dc820bc |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

             containerd-1.7.20 | 1 
                elfutils-0.189 | 1 
               ipmitool-1_8_19 | 1 
                libcurl-8.10.1 | 1 
          perl-net-ssleay-1.94 | 1 
      python-autocommand-2.2.2 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       containerd-1.7.20        | NOK | https://autobuild.buildroot.org/results/5601ffc1f4fc010f3e3463645053a27ccc572552 |     
   sh4aeb    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/6718ec70d83e6089ab4935dca68942e5e22b7266 | ORPH
    i686     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/4d48fabb14d83c539135c53fda7ef7bc9864723e |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/9dadfa8b369c91b8e416abf57164460238943ab3 |     
    arc      |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/3c356365643fc7a0cf128c8a306f0acde45726f3 |     
   sh4aeb    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/532bd0831b8fe9c53f87bfe397437861409869c1 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

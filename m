Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D055E6748D
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 05:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B054A60693;
	Mon, 22 Dec 2025 05:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4q0jYMHr1Hx; Mon, 22 Dec 2025 05:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC9746071C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766382193;
	bh=U+2lP2PwA0492Qpf6VcEXJPCpEwdZPcLECbKjf6KlYg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HCY9FSFaersbsMznAq2t/c67a4xTqZ3JUcjfVEXyNrYdOA9ASAWYkF+M5jF+OsMmB
	 3u4H6ZaF9wYTZkOh8Y/Lj8uQsY7h5hfI+socpwfXe94ixKeLls5jagA+MhZbUvEOUt
	 TY3KChcwvAWmC97NQQG3FQKNKgpb//mohhvoVUxpVjm03o/Q9tE2dMIPYlz7RKiFXh
	 mAKTQ7jbsS79G2oY8PwiUdaAcgNwQ0T4mH0WZzZfd9aaMZg4VLmGKrMZNurMdDhT00
	 Lus0PFLO2yMcWqq/6xeyb0CX9a7PCmiZxA5v1KHHMwhMPruErLlbzvwly5oX2T5oTe
	 GYgxz2rsRztOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC9746071C;
	Mon, 22 Dec 2025 05:43:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE860195
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 05:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFEEC40790
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 05:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkLpMHngCigU for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 05:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 490F54078D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 490F54078D
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 490F54078D
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 05:43:07 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-64d0d41404cso2158454a12.0
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 21:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766382185; x=1766986985;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hi/E1Q5mww3BwSWhxst5re2UydaXYOhshlHz7gz/CvU=;
 b=GCRu1qcnqprMHr3rA5x746NhaZoKZHJEz3VLIFchLRoe+jR6BpR285Yf8IgoYJuMuC
 I7N2jqioKEYtGaG0x9NZaRgvEV/HNQv0VUELvu9gXmCVK60EbJ14ERSMkiI/zK6P+qlt
 3yn4HNExANZm6TBzBmXBeCb8WEZWFyZ5oNJ8hFMO9jq3o5zIsLVfjgMgMJHFvqfq5MJj
 Zte6y8OMHpVi+rrNqmHfIEwehqlb2TrFPOsknmuKhXVk+c5ZwLBnOo0Ong0GRSfTlfYX
 k2PRnFospThFN/tVSTRLAErBK2HH191xpdkU7Rzvg7TRu8+iuS7nvA1lDaZXtVQZiQE3
 ihgA==
X-Gm-Message-State: AOJu0YwdfbxiI9c/S6Ykl5WoRP7acWj060GwR/61l1vo4OGeMAm68rvK
 VRtcQsOoZCR0TvAzprVr6rACktn9ddGQ8XinDzpRKqzgCw/xLCQT+2uyS3W3WA==
X-Gm-Gg: AY/fxX6D386J0AhfP2+PGl4lA8mRbyZY2O07dXUf+Qcv3yeeGy6SNrkDeh1YmwBK47L
 Moe8MTy7FHDFwB4jJwxslmfdaZqzwLgcgjqFjzFZLUiCkdn/V5A27UGdnYxIPDKxbgAbu3U/kQR
 YceljL75UOP/SArOMKqvOYHsmU/y/xK4POax7SoFhRDY1ZANZ0apbHMBusr0OYmJngRwuyFNxwq
 gXEL2ymSr449RHQH/bcr3ISuJGixjYJwPROOb3fawV0B87a5L1avyTsBN7IepYh4pHh10GEaJa0
 Uni2lzkGw6QudchjsQmr+dAaynrCjm+ZoseC9h6GHfRim7TKHPMpdL4EYyFwE6e2pWEpYfosjEh
 G2ABTgYwTQjhRjpP8DVJqSkmQbi/B2i3tW+VZA1dlxwubMzy/rKbBja902q8dbFhzWqAEFT3Fpw
 enmT9djtpLG2pTkdOaHQ==
X-Google-Smtp-Source: AGHT+IGDscykxFMIOMJ9TlYWTLX1m7kSFCEh7HNa73jr7wwzZhr6JVamzRAWzg4XBwosZC3KSx40gw==
X-Received: by 2002:a05:600c:1ca4:b0:477:952d:fc00 with SMTP id
 5b1f17b1804b1-47d1953da4dmr96819085e9.12.1766377152672; 
 Sun, 21 Dec 2025 20:19:12 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be273e4d5sm226324305e9.6.2025.12.21.20.19.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Dec 2025 20:19:12 -0800 (PST)
Message-ID: <6948c6c0.050a0220.1bdf0a.4eb3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 22 Dec 2025 04:19:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766382185; x=1766986985; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Hi/E1Q5mww3BwSWhxst5re2UydaXYOhshlHz7gz/CvU=;
 b=iusXNqOlfRl8hpxT0J14My5bSLzndGQuNLz8iOdfxIl8tUzW30B8p4VyuPPq7BAZEA
 +Q9NI08cnsN18yNybTcMuUIOE3XyYJbCAjc9v2vSFGbn5pA7kSMqz+97KGKfyTn/sbmg
 HX+hXz6GQYLNsyMSi9ONRf0gNc7NEOeVkg1nt+D8273K4h24dxzZNSH3paGvXDr2xoiS
 NcptEGwWN1JgLBe62Cwt++KC3Njf2v2lnh9GPXk7mTl14gxyHGgan+VGgmOiPKaHBZDF
 BJO8LvirFRVLwDd7MU+bUnohA3RHdZQygjNIPEk+QyjhqfphTAcWQS7xTWZXEXSDnLAE
 ph8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iusXNqOl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-21
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

Autobuild statistics for 2025-12-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 26  | 77  |  0  | 103 |
  2025.11.x  | 12  | 34  |  0  | 46  |
    master   | 66  | 268 |  0  | 334 |

Classification of failures by reason for master
-----------------------------------------------

                libselinux-3.9 | 38
           host-libselinux-3.9 | 28
                       unknown | 15
                 jasper-2.0.33 | 12
                libcuefile-475 | 9 
                       cfm-0.3 | 8 
     libphidget-2.1.9.20190409 | 6 
                  libcgi-1.3.0 | 5 
                 libiqrf-0.1.2 | 5 
odhcp6c-53f07e90b7f1da69771... | 5 
                   cvs-1.12.13 | 4 
              host-rust-1.88.0 | 4 
libcorrect-f5a28c74fba7a997... | 4 
                 libuwsc-3.3.5 | 4 
                openobex-1.7.2 | 4 
             berkeleydb-5.3.28 | 3 
           dmraid-1.0.0.rc16-3 | 3 
                      fio-3.41 | 3 
               iproute2-6.17.0 | 3 
          linux-5.10.162-cip24 | 3 
linux-serial-test-bf865c37c... | 3 
                   lsof-4.99.4 | 3 
neon-2-sse-097a5ecacd527d5b... | 3 
                openssh-10.2p1 | 3 
                   perl-5.42.0 | 3 
uhttpd-15346de8d3ba42200249... | 3 
            18xx-ti-utils-R8.8 | 2 
alure-14beed2a86d5a36030e90... | 2 
               asterisk-22.5.2 | 2 
                  brotli-1.2.0 | 2 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
host-am335x-pru-package-5f3... | 2 
                 host-gdb-15.2 | 2 
            igd2-for-linux-2.2 | 2 
                     kbd-2.9.0 | 2 
             libgphoto2-2.5.33 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
                    mpir-3.0.0 | 2 
                    rtty-8.1.2 | 2 
ustream-ssl-68d09243b6fd447... | 2 
             util-linux-2.41.2 | 2 
                 apache-2.4.66 | 1 
               arp-scan-1.10.0 | 1 
                   bird-2.15.1 | 1 
                   ccrypt-1.11 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
              containerd-2.0.2 | 1 
                 dc3dd-7.2.641 | 1 
                  dpdk-24.11.3 | 1 
              dropbear-2025.89 | 1 
              fftw-quad-3.3.10 | 1 
              gcc-final-14.3.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
gli-779b99ac6656e4d30c3b24e... | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-14.2 | 1 
            host-libksba-1.6.7 | 1 
    host-mender-artifact-4.2.0 | 1 
    host-python-maturin-1.10.2 | 1 
               host-runc-1.3.0 | 1 
                  janet-1.39.1 | 1 
      libabseil-cpp-20250127.0 | 1 
                  libbpf-1.6.2 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libjcat-0.2.3 | 1 
                  libsvg-0.1.4 | 1 
               libunwind-1.8.1 | 1 
                  linux-6.18.2 | 1 
               linux-pam-1.6.1 | 1 
        ltp-testsuite-20250530 | 1 
        ltp-testsuite-20250930 | 1 
              mariadb-10.11.15 | 1 
                opencv3-3.4.20 | 1 
      passt-2025_06_11.0293c6f | 1 
                petitboot-1.15 | 1 
           python-bcrypt-5.0.0 | 1 
               python3-3.13.11 | 1 
                 rpcbind-1.2.8 | 1 
                 rtptools-1.22 | 1 
               soapy-sdr-0.8.1 | 1 
      softether-4.30-9700-beta | 1 
       sp-oops-extract-0.0.7-1 | 1 
             strongswan-5.9.14 | 1 
               tcf-agent-1.8.0 | 1 
                tinifier-4.1.0 | 1 
                   trinity-1.9 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.26.0 | 1 
                 xinetd-2.3.15 | 1 
                       zsh-5.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/c0a3c1ab4a2c1146800ddf280b80d567166003d0 |     
    arc      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/287a2c5389c5f8191ba8a730f9573e38041fc522 |     
powerpc64le  | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/66805eb4df6f8d5eb21307e5996b2dff992f2f32 |     
microblazeel | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/f381d145fc3a31326d0e4b988d85e8f3be9352f5 |     
loongarch64  |         apache-2.4.66          | NOK | https://autobuild.buildroot.org/results/cc04d21b78eb912c25e8d2f5ab2702dcef3ff8e6 |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/a2d5138a8932707201e000d12a63ac2bfd533541 |     
    i686     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/fd565b7cda39ae7e8a10d988e92be63b4f90ae74 |     
    i686     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/4cfd2dac60b56ceb6b3792459fd6b689e6e99c14 |     
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c4bdba47a6d62745e2e08fa8773a118a700511f4 | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/48ea58c25d29af0785fbf7e23caf52bb3ca6ce8a | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/6a7fb94549bce5ab4d3b3ff3d9e0cea70b7a78e4 | ORPH
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1488c1b7316521abaeb50226d0b5a52a8365365b |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/b47b1ca82a1bcf88ae8bea583067d0f2b9c70d96 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/13d34213a498163f011926095c28f06b097e2d69 |     
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/51230ad7bde8d8add618c2f1449ab887d0cbe2d5 | ORPH
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/8b9a01d61bc79f2610a19b8a64b4a33b6d626b46 | ORPH
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/1dc8b23a8387c9364a01798080147dee63a96378 |     
   sh4aeb    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/ea548a5b472be2e41d93876eaf9aa97a8bcf777d |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a3d647594489d5fe7668fa916919b5dd295d813e |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/4167be4056b236e2562a81a6ca5e852ebf486232 |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/572572a80acdf39db0fe744a8ebd650ccf959db1 |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/427f0f7f8e89e31546ca1b2f712aebd9eb7609bb |     
  powerpc    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/793e438c6f5907a2171b39e03da46ef5fd092764 |     
    arm      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6714453256bed21ebe68db5cc80d70004c27df03 |     
    arm      |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/e3e7805928c00808fd8c984a75adc4178e1349ec |     
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f19cdb6023e44a31873fe17084e455637ed342bf | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/903ad293643bdbf722fb33c9c3a14312d945fb69 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0f79e2ec6804ab66bbab298e2508c2b62134501f | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/83a2fbe6edaf735ec195b0750379f01e658650c9 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8157f3d87c6906e7e936a2e437335ab445b2e7a7 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4bd3fb090f3e75117e2c4a4cdc8ebff80fd8e8a8 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/44e601f272e7067926bef7dc50bae44510820ff5 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f6e43bb293c075c031aacc2ca8bc546697ccfebf | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/865997db5cfdddc8367dad28aba825e2010ab3fa | ORPH
    i686     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/dc32ae348c9b7560d4703ff15329005df5097187 | ORPH
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/3e58fd76c89bffdf0f8e9131e899f0dc3cab2d72 | ORPH
    arm      |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/9ad9436762f3682c5bdb3395aa8aae6bf50ab212 | ORPH
   x86_64    |          dpdk-24.11.3          | NOK | https://autobuild.buildroot.org/results/238c6626c9e8a829ae29a5396693183214bd7f57 |     
 powerpc64   |        dropbear-2025.89        | NOK | https://autobuild.buildroot.org/results/32b39f10b0a5172ea6e6252ca3b9adc056086650 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/8074cc661ac7e35287b61c6c58d7db93491fdb27 | ORPH
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/f70ed9a901ef9bd2696f26b28985403be8f4c905 |     
    or1k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/5dc5d37c053873f087542c5ba6a368dd0b928c21 |     
 microblaze  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/71987502900589e232846d79222ed90be46cf389 |     
  powerpc    |        gcc-final-14.3.0        | NOK | https://autobuild.buildroot.org/results/f167d186631cd3ce753155599ef3c87b122ba7ef |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/db669ef53898b208a5452d2a470bc8aa83437930 | ORPH
   x86_64    | gli-779b99ac6656e4d30c3b24e... | NOK | https://autobuild.buildroot.org/results/aa8b92749205ce0e38f8d3e7994a4cbc8d2c2aae | ORPH
   mips64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/b221272ab979f479f7dde6a34c43d43a13ac0d0c |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b8b1c2b9dd2e121c2a7b601416003cdd7afb6d5b | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/2d7b61eb82a218986358dd08ad92c611d998a838 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/d8c5f22baef2c038168640e8e7194eadf41eb689 |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/241ae7304fdab632d9d1a565a3cc4de6f4f32682 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9479e27ebb9916dec6f0940833ca512ef23ab66a | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4c7d746841e8e7ba6a9a1c2113c882d793ae284a | ORPH
  sparc64    |       host-libksba-1.6.7       | NOK | https://autobuild.buildroot.org/results/1e904ffeaf0d9d53ad30ce734730a211b57fe690 | ORPH
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/527dd467ac3ad3f717603d2049c788b36305ca77 |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/76822107ca675d67cc659837907567438c1a56a2 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/8d26fe50075a8b189d5131784613cf629684ef6c |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/f9cfef0999d74e587666ea6d8aa0ae54ba401316 |     
  aarch64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/ba223c4ae06f008df19ae496520f9ae1e7c1e662 |     
  riscv64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/5a8e310b1e83963af517f66e70437884afc01d8a |     
powerpc64le  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/dfedea79e4fa40e8afe2776f526e3c24f816fcb2 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/968b98cf8847679e12aec0fec6080e8d6273c314 |     
    sh4      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/2d42c051e6c2059bbcb757f5552794570bf4043e |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/c1e72485d5d1d3f8e6185e999d79338dd049ccfa |     
   x86_64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/43867f2a280fb643c7918539055da1756f8febe2 |     
loongarch64  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/d5b3e762964af40dc1aa4b275ee297582210093c |     
loongarch64  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/c822cc1544abf6bdea2d0cc4cb89e13ceef907aa |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/002f4b992a3e4a103f626e0f87dccea6492ad50c |     
    arm      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/2ef6e73cc160ed561710ebe80aea518aacfbae43 |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/d26ec0e51605fb2655694f16f05b0f3cb33c7a46 |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/302a2acc254de1c844ff505922ae7cf48d19c2de |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a341960e417d874e95cbe361bbd5095f7c92d3de |     
   sh4eb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0c5a60d78d72f450b9de8475e7b4ec2c21e9d341 |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/3b80b93037ea37f3fa5de9232161687e2c6048af |     
   xtensa    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/fa79637f0ddfe745352fef16e3a750d87a37cc57 |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/3cc76ffcee3cd0545909afec8afbcf2979c0cb0a |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/9bc0d1db56f447b363ef77842e22d11d874fde5c |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/28bb84b8ebbce2c37397db88e9d10e4d42270c28 |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/5c462465cb1c44db00696d4fc8f45c8388fb66af |     
    i586     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/37018a961aa92ee0988642a39fa9963a56ef734c |     
 aarch64_be  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/131bba0fc8f801a43e92c797bc29b3541f396456 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/2cc85794907ad394a2a0de8439774a8639547786 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/52e7f050f359063628260c1ed45edc97c68f7574 |     
  powerpc    |   host-python-maturin-1.10.2   | NOK | https://autobuild.buildroot.org/results/2affcb618bcad6b26814a4ecb26bdbef787f3a32 |     
 aarch64_be  |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/0338a4011276c86ae44963375f07962a22f8a711 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/dc7ab7a8bcfcba69d0c45f216cf3c3ab1297bb5e |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/a7fad0b62ba3c82b0fc448140bd83ba913c56ee2 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/f6cced3388c7c6b73cdd1a191bd45e8c2b6147ce |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/1cb223b843af3f1eb6d4406085fe79de1d52ca7d |     
    m68k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/00b607deca888b3dc9e84615f7fc7ef5e4aa24f9 |     
   sparc     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/ad0b19c25d3e9d2cba9f75d9fa69c85b5e1dafe5 |     
  powerpc    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/bb8b0c3819401a3206731979e4a121b4eec4d4ee |     
   xtensa    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/8077df35e3f19dee184db67b8085992717ef0518 |     
 microblaze  |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/fec2ab7c82e98867f5392eeefe8db8a2ccff2ba8 |     
   xtensa    |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/5af2b6ddd883b5206e8de354e478ba3831195819 |     
   xtensa    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/844520717e2faae200ffed1723e7916d71bede75 |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/9dff9136243295ab97662b46d644955a89dd982a |     
   sh4aeb    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/55c684df92f5979967eecd5afe6b1df22176490b |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/c44ec4a9db2d52078f5677351d42edf77528f4a4 |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/12ae0ebacaca6801f6f5b066c6ccdc527c7f918d |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/3cd9bea2422d57aa2e4e6a1071826eea90fa23b8 |     
 aarch64_be  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/cb02b49ccd1916b65c439d3bda74f6bf258d63fe |     
  mips64el   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/4299b331e0ba9590e93d0bc317999429cf47ba56 |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/0fb161b3463a2722ab47caa447327051fd7eda40 |     
   xtensa    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/adde117fb9da54664d956532f2452e3563be9cc5 |     
 aarch64_be  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/bc4a5a095003a1369bd2ac8fc13a770a9b5672fc |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/6e04333fdf7cb0cde9eeec10b435d1a17b2ff46c |     
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/fd4636d6ae332d2d349f8ba01ead108d89430d32 | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/6f8eb920960d0eea8c740649216d4de62d762fd2 | ORPH
    arm      |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/df7dc7c71b0c8d75cd7adf67aaddf8ebeba9090c |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/a08f389e8cb192932f25240f647c558853a0f1b0 |     
  aarch64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/bac9793c2b7ade70cbbb154aa4bd9da9a5bfbd40 | ORPH
   mips64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/9faa5b5d89acca9734d55574ec2b699c0f217961 | ORPH
   mips64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/391770bef502d9d14e28a9a82e2bfd9c847bb66f | ORPH
powerpc64le  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/3d897958a2f8bbe8b2f6ba3529388398f88296d8 | ORPH
   xtensa    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/0537ce230abe9a0c949016b28f0afa571bec81ab | ORPH
  mips64el   | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/b977dceaba5428dd58d0ecc308445bcb7cd0a1d3 |     
powerpc64le  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/2e9639f4ca047b0578b00e65fe3aaf27443ad109 |     
   s390x     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/fe61da2d203a1e0bbd445e214d7e16fabafeb02c |     
    sh4a     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/3c44dd8f6686da3b1d04039293481dcb64b08b05 |     
    sh4a     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/edda4bfa2c0f7e9f9f7c0010dd9abbeae86f1f92 | ORPH
   mipsel    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/a8426e57301c54ab8ad5affe42645a0924df53df | ORPH
  sparc64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/16d1ea82a65c384c85b707e1cbb65bdac4eb7a43 | ORPH
   sparc     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/0f8949ae18e95ed9c29bacdd4c1819928a9eb720 | ORPH
   s390x     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/76cf80a8609f5365b413b741626d6d9dd5db793f | ORPH
  sparc64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/ae5249723583e83ec800331852f4840cea8a271c | ORPH
 powerpc64   |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/6c2cc7046c399e4768d0c008c0a051fcb58c6df2 | ORPH
 microblaze  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/0072d4861f0fc962e8ab421d55f0857f36d820ff | ORPH
loongarch64  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/ec8590c4a4cb0d4c42a45a3d24bf555524c11bd3 | ORPH
  riscv32    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/9edd3e7060bdffa845d6eaf69eb3c81706ad4539 |     
    arm      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/2ba434d70829d80fa4adbd195e10a49473210e99 |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/886d0428ddb06739ac0f9542565c89fff734f41c |     
    arc      |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/376364b408eef3d99e574ec892e089cd1afbde90 | ORPH
    arm      |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/c9b43024ada9c90fdac56c96f991797b795c004e | ORPH
    m68k     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/e842cd8ab7d6d8b014e7fb70e444c530867bb2aa | ORPH
   sh4aeb    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/25b6ea34eed0afb8a4f0ca964634026a3c5c59ec | ORPH
  mips64el   |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/69cd8c93ea87eaba909a904315e029fa50ef4cdd | ORPH
 aarch64_be  |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/39f7664685b30db0efed4502d1b9a5028f808144 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/09084506ded1eff0b5d48f408722b1726a0907cc |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/171b01682e221970c458356e0e95ce5300d54555 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6ef6ffe823a4460982ed4630db285a5e92082c2c |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0527d87886bfc315bf62289f627a25ad5f335b66 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b422254db54b71c4f8c9ca3425770b55b078c3c6 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f2b56340eadc02187a04ff69db2fa534884b66d6 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c3886fa1b8d61172f7914f4d7e618e7d20d32bc1 |     
    sh4a     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6f7cbe88532fc1666f5a1c38b3a37e210f80a29f |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/9120d99e69a86253f6c23e858d47f6d77bd9dcec |     
    arm      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/ba132712d0a6de7fab26d024acbdeb44b446233e |     
    mips     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/953b8c6d7da0f150ec56760c4a3191e630c01381 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f9719ac2ee6164e27b9283800c3dc0605c81a2e5 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/3a199d2aeda63f7c480c93b59be196b285a2267c |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a9bc288de3abefaa11f10d8ea93f425eff26ac71 |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/3cf37a459c449988126a6a30505120f59f309004 |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/bdd22b5c81a5f92291a200ed370897b5e1889347 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0183837d9e2f5621044a6d378d2ca52a7e06bf90 |     
   mipsel    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/ee29ce289b6f26e282e45ef5662e1ec8c00c497d |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/d22a19abecc9b039c599035b1b60ba49feb6ed74 |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/8966b852e313d2d8559eafdf31003886f0c03c56 |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f7018c60b186f10a351fc254eed430acad618823 |     
    arm      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f82976f068f282db99a59219120c8a1bd7a32f42 |     
    arm      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/526dfa66d358ba813d7e644095206d3d964c0203 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/23a8f5ce22e6adf767638549f4d08a48f307c5e1 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/be3e313896c3a8555b4eaf9a97635e20150ca30a |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/4c6c91fcf90e3ef8392946c3958c43773f99f2a8 |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/063653fd1e684f94c761042af3ca56d314dbae1e |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/55b6f329245d3fcc1402089d5a5e687b76e44a44 |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/09c1a0375bd9da3c5defbc0ec0ff288d437f8dc3 |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/df9252c98866c52f82ac832be78eb35dbb39c4ba |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/47db52464942dcc55e8319064a1f24b0af1b2495 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c38f3b2765966467e83fb595765ff2996725143b |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/3f65755f642a82ed0e69d1c97c0f3520d411d287 |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/4b758441fd08cbeac6756375c94395eb917ab7f0 |     
  powerpc    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/80d9ad83f7ff931267ad2a77ca58a5803bef57d8 |     
    arm      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6ecf196789662249242f8a990e50dd40e911fc66 |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/448313a1e83e768c67f95f698ff79190760a1378 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0cb39d56140bb0e3c043864de18039ce37712fdf |     
    arm      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/ce9584f5a92322f9b799cc00b80f15b0c1719dfc |     
  powerpc    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/05c1da325abfb75146187fd10a4cdb0966c44a36 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/12195f3481a8f7ee34d286647e919f4149585eb8 |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a7891ae5857edae6325372de68de05950d44f977 |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/5b9c9d2ec830a21bbede6b9262631c70ab70c0dd |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a0177d9abf498b819e3040db4d211345ef19e94f |     
 microblaze  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/8663823f0863644d7b01095585ec3110e35ec83d |     
    arm      |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/cf3a26b8e0604a9ab75e8cf5ae5a3398538cea4a | ORPH
   armeb     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/d1cff04a4c41ccd2de9ee3868bad95cdac3c77fe |     
  mips64el   |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/094d72c74cdbe2fec51a389c05d085582946894a |     
microblazeel |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/9f4075d88faaa6607092a66178dc8b94856da4f0 |     
   armeb     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/af16a94d1c621a29db67bd2da6d25c5fada1bc2f |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/640a2a7dd2ad883d1a104b362daa97df2c807398 | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/33d34f049a37949da0da53bf4ff140e72d50445d | ORPH
    or1k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/fffbecebe9b86b5c04e9ee385e1439d568eb3c15 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a9c877a1fdcfaf7b4c08b2a6ae0b671bc87d77eb | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/da3e470c02dbf0c338d5de22d093a2e9f79eb4d9 | ORPH
    sh4a     |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/5f8e84af21f198ecd8d1eff6790807b305b9aee5 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b126682923456e00721d243d6ef74e5d8613d020 | ORPH
   x86_64    | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/6dfe99ce88281d59dd637fb139c463ac0e713cf3 |     
microblazeel | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/7fb8b18be349975c3bbae3a1024ff35e0c85c2ee |     
    sh4      | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/9641ca79129389cc45c8defe76676e4e804c1c0f |     
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/68ccf81cfecf12db427de472d92ea462963a4501 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9badedefb678f9bb8bb1c634bcaaeb279d14a2b0 | ORPH
   armeb     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/4b6edf53527f77494cd1665eb29e0dca2a801938 | ORPH
    mips     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/89131f2cdc6dcd996ed89354199eb4c6f7a46c17 | ORPH
    mips     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/9ef12a262e8ae94236d689015c70c4e0be6f47ca | ORPH
loongarch64  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/80aa39e9dff4e8a1df439136adc63bebc23dd3c8 |     
microblazeel |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/701e45d6536cbaa88b250a3ac38575d2b923c810 |     
   sparc     |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/c155c19b588a4060903f9317622278791b60fc0c | ORPH
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/23da26d35ac7d1c1889b3a1cd80b2373f9971ee3 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9fa70977bec0bf637c457a3107177f111fcf37c2 |     
loongarch64  | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/bd9d0e009a463372a256680cf494330f91436409 |     
loongarch64  | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/a5f5b0472cbb3aac138aaed8eb9e7e15247d65d3 |     
    mips     | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/e1562c4bd1e8e6cde434332835740cd866bfa650 |     
   s390x     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/9e88622cee0b51fb71c76b5bbbf7d8ac0681c8d3 |     
   mips64    | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/be7eeec180675492b4139cbd6847d8c7e6c71414 |     
    i686     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/2f3281cc1d57ad044dc39cef52b65875779acfff |     
   mipsel    | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/565c058789bca96a69adfec49df4b1dff1d0ca51 |     
    arm      | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/1fbf4a28c4032e6f0f09309cf02a945d5698786a |     
   mips64    |         opencv3-3.4.20         | NOK | https://autobuild.buildroot.org/results/b540ea6ec16a26a28c8d94fd982ebd116bc46535 | ORPH
  sparc64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/51072e242da87ee4402f2eac1f15a2ef34247bce | ORPH
   armeb     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/d5c31d74aeb5bfa393fe94f6f0129fd9aa577326 | ORPH
powerpc64le  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/d8c33d5e18ad7a85c4f1d4cc35282c702a1b0b27 | ORPH
    sh4      |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/bfaa5195ce1a727388801dcca19a66b0c5ad6c8b | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/12f14866eebd7a7ee6dc532622d8e26bb487568c | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/4c9f6d97267fb2b8e59457e73726eff4dd9c3778 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/23466ee971022baa90c99fa3415d451dc6a8c90a | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7bf0fbe9ad2f2306098dea6e193d7f2ca21ec74a | ORPH
 aarch64_be  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/09574979fc0887c2b066d4c5e5086840f5405245 |     
microblazeel |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/1b7f1659ca3dff6d5672ff98723b3badcf5ef0db |     
   mips64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/04ce520133081ddce1baa2d872634f21e183e3db |     
    arm      |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/a3104dc4f382b6c2f025914bfaa273aa8696c127 |     
   s390x     |      python-bcrypt-5.0.0       | NOK | https://autobuild.buildroot.org/results/2e43b580a41bc57271755fd27de8e59f9255cc37 |     
    sh4a     |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/c8d1d09140cb93b942efd3cbf44c3d9f92977458 |     
    or1k     |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/b8d8195154cd1b61bb6f2ee87abda299a1341230 |     
    or1k     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/d97947901c7566ad195796a9f454347c0ff4fa40 | ORPH
loongarch64  |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/c5da6814ba50f0d95d70bfebc6306053eee89b53 |     
loongarch64  |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/3b8d4e268ac605495356c3b834c405ea1cad993f |     
  aarch64    |        soapy-sdr-0.8.1         | NOK | https://autobuild.buildroot.org/results/763d87aa102bf20c693dd60a24f9f683655b3a25 | ORPH
    mips     |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/f1e92644e937d7d02730a0166acec3e86a89233a | ORPH
    m68k     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/6ee8007436da8bf9fd62e88a1f485b73210318d3 |     
    or1k     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/a3e40414f960312c05d460512bc7837809be5b9f |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/54ec8dbe9437ab5d8f3760cbc44690e394bf52e4 |     
    i686     |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/2e146a8cb5c893a886876d9aee1af4551029ff98 |     
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/5c087229989b505a0d1ce49121b9f8e0f550b711 | ORPH
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f4bb76d638fcc25bad28060f5062adf25aeffa33 | ORPH
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/26ae8b22342cee67a0080c1cc42bf3dd0471f39e | ORPH
    sh4      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f4ca1749f1eb6bc30645b7c9b06524a23890d783 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/72724f5960979ed7711d314f967f054376aaca5d |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/e2219976e0c04c55b5912b1a7e4a02331c6c9796 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0ea97d1d4758d06463b039bef62ae47ccaeec748 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/29c51e9375413caf77a698bb1d6705ce609ecd07 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/56c48eff3aa116fd4262fd6b25b4b116e6183812 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/3af5d9e3fcbcc83966723a6c1fb8c6d8a1a932a8 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/1cae4470fd202ae7d6f379649b9c1e435867ecd1 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/e44a213d133aabe6d37e79fb6410ff6f631d6240 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c6c5a039a453160c3248a84efb55796595bc3b1a |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/e4a3ec40905300fc30581da912692e50f564034d |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/4845b769db09ee29bb2c778863155b464f0abb91 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7ec178f89e47a4af6c4adf41c3f96214cdbb5768 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/424a669a9460c095096795023479f68ec0a35aba |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/5634a88b0436805bd077bc9fa92eef1ed9248db6 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/7c78ef7c3c34edfaa47d28cec2b8c95f16bd4238 |     
   mips64    | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/35c2ff3fbaddb3449d77f01b071f632270a55cbf | ORPH
loongarch64  | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/770f4aca8dbb2edd29127c106a23afd5a7ae6d9c | ORPH
   mipsel    | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/830d63c1a4c7918c47f2684d4a63e35ea1af2b6f | ORPH
  riscv32    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/fe064a1fad13b8e51985052ece6087feb355e42c | ORPH
  riscv64    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/4e37d7bb40980ec5a84eba2a7f9dc0168c02bbd6 | ORPH
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/a22fd44161a6e0203aa8e8de63d58948f50bc44b | ORPH
    arc      |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/ccdbc294e08d6603b93475547545be0bec37eabb |     
 aarch64_be  |            zsh-5.9             | NOK | https://autobuild.buildroot.org/results/4a82b7b99d337a50dd9d486c0fbde15789df6858 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

libdill-32d0e8b733416208e04... | 4 
                   perl-5.40.3 | 3 
glibc-2.42-3-gbc13db7393773... | 2 
                 c-icap-0.5.10 | 1 
                   cvs-1.12.13 | 1 
freerdp-2.11.7-18-g0ee17e2f... | 1 
            gdk-pixbuf-2.42.12 | 1 
             gtkiostream-1.8.0 | 1 
                haveged-1.9.19 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-16.3 | 1 
                 inadyn-2.12.0 | 1 
              json-glib-1.10.8 | 1 
                libgeos-3.14.0 | 1 
                libselinux-3.9 | 1 
                  libsvg-0.1.4 | 1 
        ltp-testsuite-20250530 | 1 
              mariadb-10.11.15 | 1 
                netdata-1.37.1 | 1 
           oath-toolkit-2.6.12 | 1 
      passt-2025_06_11.0293c6f | 1 
        s6-linux-utils-2.6.2.1 | 1 
          sane-airscan-0.99.33 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                   trinity-1.9 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.2.4 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/402994b8b5b77624f5c450ef4f9824d6c7512907 | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f4a375086a1e00766f57a800b5f387bf42d4bcae | ORPH
    or1k     | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/7331623010638b604863136f38c81c657f075ab1 | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5941c0c9f7fbfaefda1c2017b7497a47da8b2de0 | ORPH
   mips64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/35f09c487d4fc014283f6d6b46e08f4121f65858 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/0a64c570fe4aa71eae5f210a6ee5e9704e915073 |     
   mipsel    |       gtkiostream-1.8.0        | NOK | https://autobuild.buildroot.org/results/a19f44e9e97cef6eb8854c8839cae2a5a9261a76 |     
 aarch64_be  |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/bd70d425be490819316cca5c51f46042712a07a0 |     
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2acd743b5360930ff36542609132ed25de622795 | ORPH
  riscv64    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/8d6325b9e7b3a1babeeaeed3619866a715c196f4 | ORPH
  aarch64    |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/43c60eee7525f8e952433dfbdab07a9cbc2f934c |     
    or1k     |        json-glib-1.10.8        | NOK | https://autobuild.buildroot.org/results/8ca66e5c00e19bdd702d289bd9eea8d37fd84529 | ORPH
   sparc     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/05c6a3f5a9290f1e5e4f62fea13a0f4cb1278c04 |     
loongarch64  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/27c2ea30605f8bd91d48df19b5733d8bce38afcc |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/7877bc7c5c5f1342d7de14a91f2fb2f846a46ce0 |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9fd966e64803c5a2455a9c928451d6cddb8e706a |     
    or1k     |         libgeos-3.14.0         | NOK | https://autobuild.buildroot.org/results/df018175d01bedc226aa2cf44071659f71ef46ad |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/86d8f7637e7c22ffdfc4048f29b2d4ff40c17644 |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/ca42f3fcce94ad95de8d6b55ae452d684db55934 |     
loongarch64  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/87bc01a2294a8027fd1bc94cdd1631be4e01447b |     
   sparc     |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/21f80bff40574864f873f2cfb26ca23e1d700bfe | ORPH
    arm      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/44607d401b8c75a41139e9642726df1aeca0b3a8 |     
    arc      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/a07116f478354197b972d4aad2b8891328f3dd9d |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/356740aaa9b75762983eff4cd5f6707f8888692c | ORPH
    mips     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/43eca1c95f39ebcab987729c6aa132e27379731f |     
    mips     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/a73580fde0f24504fc79f54e65c27c230fd92ede |     
 aarch64_be  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/27b608f92c4e74a5bf8389baba6ecffc038bc620 |     
   sparc     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/40e1d9fc1d160e6df066feb9fc3053dc4472879b |     
 aarch64_be  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/473a5968fed677ce429158b1d6080e931266983e |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/7f463c4806b15a4e4373f622fa19eb54ca04e9a0 |     
   x86_64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/fad4a2f4ccddf9d1325b5029c1a24682cd707b6b | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fe6a8d2c3bcfd7a168b7a829ede4919ae9de631f |     
 aarch64_be  |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/9061a358d5b37d7674fe5498686cecefda6cf51e |     
  powerpc    |         zlib-ng-2.2.4          | NOK | https://autobuild.buildroot.org/results/63a8375c916250da9d8c31c71f4701cdf42be29c | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 27
                libxslt-1.1.45 | 12
  gobject-introspection-1.82.0 | 3 
                       unknown | 3 
                   perl-5.40.3 | 2 
                   trinity-1.9 | 2 
                  clamav-1.0.9 | 1 
                  cmake-3.31.9 | 1 
                     criu-3.19 | 1 
                   cvs-1.12.13 | 1 
               dvdrw-tools-7.1 | 1 
                   exim-4.98.2 | 1 
               freetype-2.13.3 | 1 
           ghostscript-10.06.0 | 1 
               graphene-1.10.8 | 1 
host-go-bootstrap-stage2-1.... | 1 
    host-mender-artifact-4.0.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
      libabseil-cpp-20250127.0 | 1 
             libgphoto2-2.5.27 | 1 
                  libsepol-3.7 | 1 
                  libsvg-0.1.4 | 1 
               libucontext-1.2 | 1 
                  liburing-2.6 | 1 
                 linux-6.12.61 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
                    mpir-3.0.0 | 1 
           oath-toolkit-2.6.12 | 1 
                   pcre2-10.46 | 1 
                pipewire-1.2.8 | 1 
               procps-ng-4.0.5 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          clamav-1.0.9          | NOK | https://autobuild.buildroot.org/results/32d2ea53feef5af6b21e5662308771f306f6ddd9 |     
   armeb     |          cmake-3.31.9          | NOK | https://autobuild.buildroot.org/results/0fa958e4c9b54bf38b5d9366230b172371735fd3 |     
powerpc64le  |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/9f93096012279ed6b4d3cec82b91dccdd471fca8 |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a8b45b1b46ba3acbccac4ceba0b926aa5d2c7194 | ORPH
  sparc64    |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/6312c72619b6b9a0718ac6706001e7723f7b8da7 |     
 aarch64_be  |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/6edc8ba7387f6a0e9c68d42046d44b7b01311328 |     
   x86_64    |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/9b81b30b4778428b6d3cd74ada59770441badb2e |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/449e5a3c317f6ff78a572c8f1f2dea9cf1d2dc53 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/158340546be9c4481fa9bc23e13e3e52184fa69a | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/78d0f86de2faf0290399a9e89d940c6249f9234f | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/cedcbde51ec1a1efddb843e93dd46dc848038b1d | ORPH
    arm      |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/0c3e98f690a81a1ccb9bf52913f5c90aa1c5fe33 |     
  riscv64    | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/bdc5e0b81cebd76a1a6620261dd9c169434a612b |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/92c1a3161d7c905865a59eab6ca02bbef58c9c9a |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/455045829fa01019c33bca4c9b8adb453593e7d6 |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/bfc9c83a6cfbf708b5bcb057feff084aa8d9b954 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/bdf44e02a223de6b14dbe2946f6685e9cb70ae9a |     
    i686     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/aabf0275faf7d055877751dc7f551437d0c56607 |     
    m68k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a8e1f45e71773eb06901f45578b29a75a7c7f483 |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e749b213717b73a9e0b232c7d39f625e1865b9a5 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/54e7872befbf2cc7972edef362d419aa6f86a68e |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/72028b79aaa376779b84a8624cd18109d967b8be |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f32180cd025b1b1f48c13a5ff28fdc85213b4a08 |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/21af732e354c77c749e3f6f0523860cae51c1197 |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/15b3ff5d6aca2b240f7757897e390d089d3650b9 |     
  powerpc    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/85e3b86596b4ac12c835468ccf0899ae67cbb2d7 |     
  sparc64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/432aeeed258cd9848caa5449e95e7b4738c1a6ac |     
    sh4      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/43636fa28ec2eeb02c294091208441e062db365c |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/3503c01115aefeb04377d8a631b2d374939a290c |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/6957392d03ea84235cd6212479dfa400b2127316 |     
    m68k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/586959f120ba7f8a58f8588051bdc980bf060e18 |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f49c101fb3e10812e9b3736209fb88acc084cba3 |     
    sh4      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/66088001a6308ce95e595c775b0e85b42f36b3b5 |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/bb6a465f091d757b102d867ebaa673d380f4b699 |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/cbed19fb95c1f07defcad867f11fdd1bf9dd7cbe |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/ccb37a878d8c20b47f1c344f1478f5edb3d3ba19 |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/42029979eeae053aaec82853b9e50ff01367040d |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/da693126a894dea5a5de47d228e9a72a616e813d |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/4d9ef369dda1ee712ceaac1061aace635e6e2ed3 |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8fa77ddabe265dbdd1eb784ce7effd088014d085 |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/287817c9cd4ac8b828ddd0949ce21c71cea17951 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/8db21ddcfb062b6973022783c866dc624719cbf0 | ORPH
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/505cf76c610b954339eb5b39e1e751507ce7f5f6 |     
microblazeel |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/be9bfd5fb6e6559aea241fd7497600bfed84418f |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/2f1c74419c8686525b7a83566d1a46fd609bd43e |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/6c43ff9890f0a33939b697562829beb728ceae3d |     
    sh4a     |        libucontext-1.2         | NOK | https://autobuild.buildroot.org/results/9b0a1ace0b3b1d59a93cb954c82501aaee7b6b3c |     
    or1k     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/d5265c174942bab89d0ea481e7a91984983cb645 |     
microblazeel |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/e3b73462b5d9f87d259e48c213ea23bc30b7d866 |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/8370a299685b3f89af4efafb04270d8d032b0a9b |     
   sparc     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/b3e8f678d1432a976c0434512f367cdd98edf942 |     
  riscv64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/259058b05a6f798346b59e5f95d83f7bc42da805 |     
 powerpc64   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/0a1b1348a31a936534d64645f6f0f903f651a2b4 |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/68489a94be42990672e17b9a581946e463a42b1c |     
microblazeel |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/6c9a8446318a677b3ddc3ce88f3e6821cf1d2176 |     
    mips     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/80874fc0931c2aded8e7d3dc2633ff825e1953cb |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/19041533ca879aa1597020d874c1ec2c68343ed4 |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/ad4faa0f443532065427ebe134dbb2aa9a2ed7a6 |     
 powerpc64   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/08149b5ce1448efd4de8bda6e27a0c3caa6d9cd8 |     
    or1k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/775a0e4e6b8103a766de76756443f607f95755b6 |     
   armeb     |         linux-6.12.61          | NOK | https://autobuild.buildroot.org/results/7c25c67ac86089e1581de59ef743e6ff2e665823 | ORPH
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/5c85e925d514ad0b2d9d9e873659ce1c4694e100 |     
   s390x     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a45448ccfe21b3ea9e1f80592e349852116b843e |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5c7363db1d4c709dd0d99261b69910fd0dcb02fb |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/8a597193c6efe53e265a97b3547e9d7df886af70 |     
    mips     |          pcre2-10.46           | NOK | https://autobuild.buildroot.org/results/0b39b6f30d1de41cfa1ef60bff3c88b6df10a142 | ORPH
    or1k     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/007b2e37980cd4e60ecb6a2ae1039ee29babd4fd |     
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/5d147800495e99a4e5efc80b2b7ddda0a0453725 |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/8e2bcf718dd7470e1c1f9d07c4a9bb5b00d807bd |     
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/30dac34cf59f29d34282c465b951aa6ed30e5e25 | ORPH
   mips64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/00135bdf94e78e1b10bb7da60fec6db7d5a31abb |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/97e8b5d8f77f7277dca398955bb0a49bddde9ef7 |     
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/c994454e37fbbd07460b92ca7fffc2bd808c28f1 | ORPH
    i686     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/44965efaa240d05e3580e4431cf1c214464d90cd | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/84d786dec7f06f749dfa03d25742b9e66a31e94d |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/082a4342032e089216d15f062a38874bfc09bb92 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/24abba6dc11a09c21b055913f37ead109827c8de |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.5        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/000018 | 20250807     | 20251212     | ORPH
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 49.0         |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2025.5       | ORPH
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/000038 | 1.2.14       | 1.2.15.1     |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/000037 | 1.2.14       | 1.2.15.1     |     
  amazon-ecr-credential-helper |  DISTRO  | https://release-monitoring.org/project/359761 | v0.10.1      | 0.11.0       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/226905 | 4.2.2+git... | 35.0.2       |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 4.1.2        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                     armadillo |  DISTRO  | https://release-monitoring.org/project/007006 | 15.2.2       | 15.2.3       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.5.2       | 23.1.0       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.5        | 4.1.2        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/000142 | 2023.02.20   | 2024.10.16   | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.18.1       | ORPH
                       avocado |  DISTRO  | https://release-monitoring.org/project/013385 | 98.0         | 112.0        | ORPH
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/007137 | 2.0.6        | 2.1.2        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.37       | 5.3          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.17.0       | ORPH
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.26.0       | 0.26.1       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2025.5       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2025.4       | 2025.5       |     
                   bats-assert |  DISTRO  | https://release-monitoring.org/project/372274 | 2.2.0        | 2.2.4        |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/010587 | 1.12.0       | 1.13.0       |     
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.15      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.41      | 9.20.17      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.44         | 2.45.1       |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.1.5        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/013618 | 30.0         | 30.1         |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/021662 | 1.5          | 1.6          |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.85         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.85         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 7.20.2       | 8.2.8        |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.90.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/021578 | 4.3.1        | 5.3.8        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.10.0       | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.5.0       | 7.6.0        |     
                         broot |  DISTRO  | https://release-monitoring.org/project/141357 | 1.53.0       | 1.54.0       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 6.17.1       | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/006428 | 0.8.0        | 0.13.0       | ORPH
                        c-ares |  DISTRO  | https://release-monitoring.org/project/005840 | 1.34.5       | 1.34.6       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.10       | 0.6.4        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/021326 | 0.5.5        | 0.5.7        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/021328 | 2.4.3        | 2.5.0        |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.3.0        |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.7.0        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/085785 | 3.9.1        | 4.5.1        | ORPH
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.8.1     | 2025.11.1    |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/011779 | 2.0.0        | 2.0.1        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.1       | ORPH
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.9.2        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.1.13       |     
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.2        | 2.2.1        |     
       containers-image-config |  DISTRO  | https://release-monitoring.org/project/378977 | v5.35.0      | 5.36.2       | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.8          | 9.9          | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.27.0       | 0.28.0       |     
                          criu |  DISTRO  | https://release-monitoring.org/project/000366 | 3.19         | 4.2          |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.24         | 1.25.1       |     
                          cups |  DISTRO  | https://release-monitoring.org/project/000380 | 2.4.14       | 2.4.16       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                  cutekeyboard |  DISTRO  | https://release-monitoring.org/project/369643 | 1.4.0        | 1.5.0        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 3.5.0        | 5.0.1        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.23       |     
                          dash |  DISTRO  | https://release-monitoring.org/project/000394 | 0.5.12       | 0.5.13.1     | ORPH
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/007487 | 1.7.0        | 1.7.2        | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/005356 | 1.14.10      | 1.16.2       | ORPH
                   dbus-broker |  DISTRO  | https://release-monitoring.org/project/271475 | 36           | 37           |     
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.5.2        | 2.6.0        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                      ddrescue |  DISTRO  | https://release-monitoring.org/project/000410 | 1.28         | 1.29.1       | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.26.0       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/011429 | 10.2.4       | 10.3.0       |     
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0         |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 28.3.2       | 29.1.3       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.25.0       | 0.30.1       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.38.2       | 5.0.1        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 28.3.2       | 29.1.3       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2025.2       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/007454 | 3.3.1        | 3.4.0        |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.2        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.2        |     
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 24.11.3      | 25.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 059          | 109          |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/021344 | 1.5.4        | 1.5.5        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                       dtbocfg |  DISTRO  | https://release-monitoring.org/project/235269 | 0.1.0        | 0.1.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 9.0          | 10.2         |     
                       dvblast |  DISTRO  | https://release-monitoring.org/project/015751 | 3.4          | 3.5          |     
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.9.0        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.5        |     
                           efl |  DISTRO  | https://release-monitoring.org/project/006128 | 1.26.3       | 1.28.1       |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/000666 | 3.4.0        | 5.0.1        | ORPH
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 25.10        |     
                           ell |  DISTRO  | https://release-monitoring.org/project/017781 | 0.79         | 0.81         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.14       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.2.5.15    | 28.3         |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.26       |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/016913 | 1.11.10      | 1.11.12      |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.29       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.33       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.19       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.9.5        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.59       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.33       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.25       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.28       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.22       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.15       |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 4.0.1        | 4.3.0        |     
                        evilwm |  DISTRO  | https://release-monitoring.org/project/374436 | 1.4.3        | 1.5          |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.9.7.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.9        | 1.3.1        |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.23.3       | 0.23.4       |     
                        fbterm |  DISTRO  | https://release-monitoring.org/project/008331 | 1.7.0        | 1.8          | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/000790 | 3.10.3       | 3.11.2       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 6.1.3        | 8.0.1        |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.4.0        | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.27.4       |     
                      flashrom |  DISTRO  | https://release-monitoring.org/project/010202 | 1.5.1        | 1.6.0        |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/016642 | 25.2.10      | 25.12.19     |     
                          flot |  DISTRO  | https://release-monitoring.org/project/007184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.4        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 4.2.0        | 4.2.1        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.7        | 2.5.1        |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 7.1.0        | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.24.0       | 1.25.0       | ORPH
                         forge |  DISTRO  | https://release-monitoring.org/project/291766 | 1.3.1        | 1.3.3        |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.2.0        | 1.3.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.16         |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/017383 | 25.09.00     | 25.11.00     | ORPH
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.15.0       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.0.19       |     
                     fwupd-efi |  DISTRO  | https://release-monitoring.org/project/326081 | 1.7          | 1.8          |     
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.11.4       | 3.12.1       |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.12      | 2.44.4       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 3.0.1        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 2.6.1        | 3.0.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 0.26         | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/008735 | 2.2.2        | 2.3.0        |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/017093 | 0.7.0        | 0.8.0        | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 18.7.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.86.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.1        | 1.0.2        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/001202 | 4.0.0        | 4.0.4        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/001216 | 6.0.3        | 6.0.4        |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/001223 | 1.84.0       | 1.86.0       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.6.1        |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/006846 | 3.26.1       | 3.27.1       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.7.0        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.45       | 1.3.46       |     
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.13.0       | 0.14.3       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.66.1       | 1.76.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 49.1         |     
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.13      | 1.27.50      | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/021847 | v1.1.8       | 1.1.10       | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.13      | 1.26.9       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.13      | 1.26.9       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.13      | 1.26.9       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.13      | 1.26.9       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.13      | 1.27.50      | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.13      | 1.26.9       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.13      | 1.26.9       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.9.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.13      | 1.26.9       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.13      | 1.26.9       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.13      | 1.26.9       | ORPH
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.11       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.57.2       | 1.58.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.22       | 3.3.1        |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.25.8       | ORPH
                     hyperfine |  DISTRO  | https://release-monitoring.org/project/018526 | 1.19.0       | 1.20.0       | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                 igt-gpu-tools |  GUESS   | https://release-monitoring.org/project/323454 | 2.2          | 2.3          |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.2-8      | 7.1.2-11     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.7.3        | 1.12.5       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.25.9.0     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/020342 | 22.8.2       | 22.9.0       |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.1        | ORPH
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/001392 | 6.17.0       | 6.18.0       |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/001402 | 1.9.4        | 1.9.5        |     
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.39.1       | 1.40.1       |     
                       jansson |  DISTRO  | https://release-monitoring.org/project/001417 | 2.14         | 2.14.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.1.2        | 1.3.3        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/001421 | 2.0.33       | 4.2.8        |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 3.1.2        | 3.1.3        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/013910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/021681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/059395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/021815 | 1.13.1       | 1.14.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/021816 | 1.10.4       | 1.14.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/021817 | 1.19.5       | 1.21.0       | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.4        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.21.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.21.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.21.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.21.0       |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/001517 | 33           | 34.2         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.6        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.2        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/021863 | 3.91         | 3.93         | ORPH
                          lftp |  DISTRO  | https://release-monitoring.org/project/001555 | 4.9.2        | 4.9.3        |     
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20250127.0   | 20250814.1   |     
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 4.1.2        |     
                 libatomic_ops |  DISTRO  | https://release-monitoring.org/project/001561 | 7.8.4        | 7.10.0       | ORPH
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/007869 | 2.11         | 2.12         | ORPH
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.2.4        | 0.2.5        | ORPH
                      libecoli |  DISTRO  | https://release-monitoring.org/project/375859 | 0.8.0        | 0.10.1       |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.5       | 1.13.6       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                        libffi |  DISTRO  | https://release-monitoring.org/project/001611 | 3.4.8        | 3.5.2        |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/000861 | 3.18.0       | 3.18.1       |     
                       libgeos |  DISTRO  | https://release-monitoring.org/project/013493 | 3.14.0       | 3.14.1       |     
                       libglew |  DISTRO  | https://release-monitoring.org/project/007878 | 2.2.0        | 2.3.0        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.86.2       | 2.86.3       |     
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.23.2       | 2.0.1        | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.2.2        | ORPH
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/018397 | 20210624     | 20250815     |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.51       | 0.5.52       |     
                     libid3tag |  DISTRO  | https://release-monitoring.org/project/021478 | 0.15.1b      | 0.16.3       | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.3       | ORPH
                        libite |  DISTRO  | https://release-monitoring.org/project/017367 | 2.6.1        | 2.6.2        |     
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.3        | 0.2.5        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.8        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.49         | 249          |     
                    liblogging |  DISTRO  | https://release-monitoring.org/project/001654 | 1.0.6        | 1.0.8        |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.12.2       |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.13.6       | 0.13.10      |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/013148 | 1.9.6        | 1.9.7        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.11alpha    | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 3.7.10       | 4.1.2        |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.0        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/007325 | 5.0.3        | 6.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.3.0        | 1.3.1        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.23       |     
                         libnl |  DISTRO  | https://release-monitoring.org/project/001684 | 3.11.0       | 3.12.0       | ORPH
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 4.2.2        | 6.2.3        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.4        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2025.7       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/001699 | 0.4.12       | 0.4.16       | ORPH
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/021366 | 0.91.201110  | 0.91.251215  |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.2.0        | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/015701 | 2.15.1       | 2.16         |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.4.0        | 2.7.0        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.10.1       | 7.10.4       |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                         libqb |  DISTRO  | https://release-monitoring.org/project/009399 | 2.0.8        | 2.0.9        |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/001713 | 1.11.0       | 1.12.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.2.1        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.61.3       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.6        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.8.0        |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.8.0        | 3.8.1        |     
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/015633 | 0.13.1       | 0.14.0       |     
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/001733 | 2.4.2        | 2.4.3        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.4        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.13.8       | 0.16.5       | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.19       | 2.0.11       |     
                   libubootenv |  DISTRO  | https://release-monitoring.org/project/020618 | 0.3.6        | 0.3.7        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.3        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.3.3        | 1.5          |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/001748 | 1.8.1        | 1.8.3        | ORPH
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 0.21.0       | 1.0.3        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.14.0       | 0.15.5       |     
                  liburiparser |  DISTRO  | https://release-monitoring.org/project/010160 | 0.9.9        | 1.0.0        |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/009998 | 1.28.1       | 1.32.0       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.17.2       | 8.18.0       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 11.10.0      |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.15.0       | 2023.4.0     |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/011181 | 4.4.1        | 4.5.2        |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/001767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.9.2        | 1.13         |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.19       | 0.3.24       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.4.0        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 3.13.6       | 4.2.2        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.7.1        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.7.1        |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/010649 | 1.10.1       | 1.11.4       | ORPH
                       libzlib |  DISTRO  | https://release-monitoring.org/project/005303 | 1.3.1        | 1.3.1.2      | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.26.2       |     
                        linknx |  DISTRO  | https://release-monitoring.org/project/021373 | 0.0.1.38     | 0.0.1.39     | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20251011     | 20251125     |     
                     linux-pam |  DISTRO  | https://release-monitoring.org/project/012244 | 1.6.1        | 1.7.1        | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2025.10.13   | 2025.11.06   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cpp |  DISTRO  | https://release-monitoring.org/project/021499 | 1.1.4        | 1.1.5        |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.3.1        | 1.6.0        |     
                          lpac |  DISTRO  | https://release-monitoring.org/project/371628 | 2.2.1        | 2.3.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/001844 | 4.99.4       | 4.99.5       | ORPH
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.13.1       | 2.14.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.13.10      | 2.14.3       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.13.8       | 2.14.0       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.4.8        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.1        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.43.0-0     | 1.51.0-1     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.38      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 5.0.3        | 6.0.5        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/145824 | 9.22         | 25.01        | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.15     | 12.2.1       | ORPH
                  matchbox-lib |  DISTRO  | https://release-monitoring.org/project/021187 | 1.12         | 1.14         | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.29       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 3.6.5        | 4.0.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20251025     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 194          | 208          |     
                         mdadm |  DISTRO  | https://release-monitoring.org/project/001958 | 4.3          | 4.4          | ORPH
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.7.0      |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.29       | 1.6.40       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/001966 | 7.20         | 8.00         |     
                    menu-cache |  DISTRO  | https://release-monitoring.org/project/001968 | 1.1.0        | 1.1.1        | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2025.07      |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.2       | 1.27.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.14.0       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.10       |     
                  minizip-zlib |  DISTRO  | https://release-monitoring.org/project/005303 | 1.3.1        | 1.3.1.2      |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2025.12      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/010267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.26.3       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.12       | 3.0.14       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/005483 | 5.34.3       | 5.35.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 4.0.0        | 4.0.1        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/002019 | 4.1.1        | 4.2.2        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/012413 | 1.33.3       | 1.33.4       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.35.1       | 0.41.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 3.3.0        | 7.0.0        |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/002026 | 2.2.1        | 2.3.0        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.48       | 4.0.49       | ORPH
                           mtr |  DISTRO  | https://release-monitoring.org/project/002029 | 0.95         | 0.96         | ORPH
                      multicat |  DISTRO  | https://release-monitoring.org/project/021734 | 2.3          | 2.4          | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.13.0       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.27.0       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.2.13       | 2.2.16       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.45         | 1.46         |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/002048 | 2.16.03      | 3.01         | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.9.2        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.5-20250720 | 6.5-20251220 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/007604 | 0.33.0       | 0.36.0       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.2.0        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.19       | 4.3.2        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.17.0      | 1.17.1       | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.37.1       | 2.8.4        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.12       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.4.5        | 2.7.0        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/002062 | 5.9.4        | 5.9.5        | ORPH
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         |     
               network-manager |  DISTRO  | https://release-monitoring.org/project/021197 | 1.52.1       | 1.54.3       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/069977 | 1.12.0       | 1.12.4       |     
                          newt |  DISTRO  | https://release-monitoring.org/project/015129 | 0.52.23      | 0.52.25      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.6        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.6        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.64.0       | 1.68.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.26.3       | 1.29.4       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                         ngrep |  DISTRO  | https://release-monitoring.org/project/002084 | 1.47         | 1.48.3       |     
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.15.1      | 25.2.1       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.15.1      | 25.2.1       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.0.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.108.0      | 0.109.1      | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 590.48.01    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 580.95.05    | 590.48.01    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 2.15         | 2.16         | ORPH
                  oath-toolkit |  DISTRO  | https://release-monitoring.org/project/002515 | 2.6.12       | 2.6.13       |     
                         oatpp |  DISTRO  | https://release-monitoring.org/project/370050 | 1.3.0        | 1.3.1        |     
                        octave |  DISTRO  | https://release-monitoring.org/project/002528 | 10.2.0       | 10.3.0       |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.18         | 2.19         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v1.12.12     | 14.4.1       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.3        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.4.14       | ORPH
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.6.1        | 1.7.1        |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/006615 | 3.4.20       | 4.12.0       | ORPH
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 1.0.0        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                    openlayers |  DISTRO  | https://release-monitoring.org/project/006847 | 10.5.0       | 10.7.0       |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/002551 | 2.5.19       | 2.6.10       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.8        | 5.0.9        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.63         |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.17.3       | ORPH
                        opensc |  DISTRO  | https://release-monitoring.org/project/002559 | 0.26.0       | 0.26.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 13.0.5       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.9.0        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/011081 | 1.5.2        | 1.6          |     
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/002575 | 2.0.1        | 2.2.0        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/002582 | 0.25.5       | 0.25.10      | ORPH
                         p7zip |  DISTRO  | https://release-monitoring.org/project/002583 | 17.05        | 17.06        |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.5.3        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.28         | 1.31         |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.10       | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.4.0        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.07         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.21         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.37         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.95         | 6.98         |     
            perl-datetime-tiny |  DISTRO  | https://release-monitoring.org/project/002802 | 1.07         | 1.08         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.013        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.647        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/002835 | 0.84         | 0.85         |     
            perl-exporter-tiny |  DISTRO  | https://release-monitoring.org/project/011846 | 1.006002     | 1.006003     |     
    perl-extutils-installpaths |  DISTRO  | https://release-monitoring.org/project/011849 | 0.014        | 0.015        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.83         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/002977 | 7.00         | 7.01         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.44        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.095        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.77         | 6.81         |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.051        | 0.052        |     
           perl-module-runtime |  DISTRO  | https://release-monitoring.org/project/003111 | 0.016        | 0.018        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.38         | 9.42         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20240924     | 20250602     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.50         | 1.53         |     
                 perl-net-http |  DISTRO  | https://release-monitoring.org/project/003152 | 6.23         | 6.24         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/003163 | 0.72         | 0.74         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/011962 | 0.146        | 0.150        |     
                perl-sub-quote |  DISTRO  | https://release-monitoring.org/project/012678 | 2.006008     | 2.006009     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/014406 | 2.006000     | 2.008006     |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/003485 | 5.32         | 5.34         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0210       |     
                           php |  DISTRO  | https://release-monitoring.org/project/003627 | 8.4.16       | 8.5.1        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.27       | 5.1.28       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/017401 | 3.8.0        | 3.8.1        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.4.7        | 3.5.0        |     
                        physfs |  DISTRO  | https://release-monitoring.org/project/003631 | 3.0.2        | 3.2.0        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 1.5.1        | 2.2.0        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 1.1.2        | 2.2.0-a4     |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/003643 | 1.3.1        | 1.3.2        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.2.8        | 1.4.9        |     
        pipewire-media-session |  DISTRO  | https://release-monitoring.org/project/236416 | 0.4.2        | 0.4.3        | ORPH
                 pkcs11-helper |  DISTRO  | https://release-monitoring.org/project/091990 | 1.30.0       | 1.31.0       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.5.1        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.7.0       | 5.7.1        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 126          | 127          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 25.10.0      | 25.12.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.6.0        | 3.6.1        |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.17         | 4.19         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.13       | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/021570 | 9.7.0        | 9.7.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.2       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 33.2         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/003721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.15         |     
                         putty |  DISTRO  | https://release-monitoring.org/project/005749 | 0.81         | 0.83         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.9.0        | 1.10.3       | ORPH
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/034074 | 3.1.15       | 3.1.16       |     
            python-apscheduler |  DISTRO  | https://release-monitoring.org/project/005641 | 3.11.1       | 3.11.2       |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.21.1       | 2.22.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/007015 | 25.11.1      | 25.12.2      |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.16.0       | 2.17.0       |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/011101 | 0.13.2       | 0.13.4       |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/021936 | 4.2.1        | 4.3.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.2        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 45.0.7       | 46.0.3       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.1.3        | 3.2.3        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/005621 | 2.9.0        | 2.9.0.post0  |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/003828 | 5.2.8        | 6.0          |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.0       | 0.19.1       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.11.2       | 4.12.3       |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/047977 | 0.126.0      | 0.127.0      |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 6.0.1        | 6.0.2        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 25.9.23      | 25.12.19     |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/006459 | 3.1.44       | 3.1.45       |     
                  python-gnupg |  DISTRO  | https://release-monitoring.org/project/015157 | 0.5.4        | 0.5.5        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.54.2       | 3.54.5       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.70.0       | 1.76.0       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.70.0       | 1.76.0       |     
              python-hatchling |  DISTRO  | https://release-monitoring.org/project/185085 | 1.27.0       | 1.28.0       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/019799 | 4.14.0       | 4.15.0       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.3-1      |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/011475 | 1.0.1        | 1.2.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 8.31.0       | 9.8.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/051611 | 1.5          | 1.7.0        |     
     python-jaraco-collections |  DISTRO  | https://release-monitoring.org/project/058530 | 5.1.0        | 5.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/020165 | 4.1.0        | 4.4.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/003901 | 25.6.0       | 25.7.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/016910 | 1.4.8        | 1.4.9        |     
                   python-lark |  DISTRO  | https://release-monitoring.org/project/140595 | 1.3.0        | 1.3.1        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.2.0        | 3.3.1        |     
                python-logbook |  DISTRO  | https://release-monitoring.org/project/020016 | 1.8.0        | 1.9.2        |     
              python-modbus-tk |  DISTRO  | https://release-monitoring.org/project/022813 | 1.1.4        | 1.1.5        |     
                   python-mpd2 |  DISTRO  | https://release-monitoring.org/project/019721 | 3.1.1        | 3.1.2        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 1.25.0       | 2.4.0        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 1.05a1       |     
                   python-path |  DISTRO  | https://release-monitoring.org/project/006110 | 17.1.0       | 17.1.1       |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/003960 | 7.0.1        | 7.0.3        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 11.3.0       | 12.0.0       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/020203 | 3.2.0        | 3.2.1        |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.26.1       | 1.27.0       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 33.2         |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/003979 | 2.9.10       | 2.9.11       |     
                 python-pyalsa |  DISTRO  | https://release-monitoring.org/project/003767 | 1.2.12       | 1.2.14       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/013384 | 2.13.6       | 3.0.1        |     
                python-pycares |  DISTRO  | https://release-monitoring.org/project/019900 | 4.11.0       | 5.0.0        |     
               python-pylibfdt |  DISTRO  | https://release-monitoring.org/project/269896 | 1.7.2        | 1.7.2.post1  |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.26.7       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/015558 | 3.12.0       | 3.13.0       |     
        python-pypika-tortoise |  DISTRO  | https://release-monitoring.org/project/181934 | 0.6.2        | 0.6.3        |     
                  python-pypng |  DISTRO  | https://release-monitoring.org/project/006706 | 0.20220715.0 | 0.20250521.0 |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.5.9        | 1.6.2        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.16       | 7.1.22       |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 1.0.0        | 1.3.0        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 27.1.0       |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/081160 | 1.7.0        | 2.0.13       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.13.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.3        |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/066067 | 0.18.16      | 0.18.17      |     
       python-ruamel-yaml-clib |  DISTRO  | https://release-monitoring.org/project/131030 | 0.2.14       | 0.2.15       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.11.4       | 1.16.3       |     
                  python-sdbus |  DISTRO  | https://release-monitoring.org/project/146451 | 0.14.1.post0 | 0.14.2       |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/004020 | 3.3.3        | 3.5.0        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.35.0       | 4.39.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.47.0       | 2.48.0       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.15.1       |     
                 python-smbus2 |  DISTRO  | https://release-monitoring.org/project/253288 | 0.5.0        | 0.6.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.2        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.12.1       | 5.15.1       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.8          | 2.8.1        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/004034 | 2.0.44       | 2.0.45       |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/004038 | 0.5.4        | 0.5.5        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.8.0        | 5.8.1        |     
                  python-tftpy |  DISTRO  | https://release-monitoring.org/project/209210 | 0.8.5        | 0.8.6        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/007498 | 6.5.2        | 6.5.4        |     
           python-tortoise-orm |  DISTRO  | https://release-monitoring.org/project/033168 | 0.25.1       | 0.25.2       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/007202 | 23.1.1       | 25.12.2      |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/028526 | 0.38.0       | 0.40.0       |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/020617 | v3.0.11      | 3.1.1        |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/011428 | 0.45.1       | 0.46.1       |     
                   python-xlrd |  DISTRO  | https://release-monitoring.org/project/015107 | 2.0.1        | 2.0.2        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.22.0       | 1.23.0       |     
            python-zc-lockfile |  DISTRO  | https://release-monitoring.org/project/004100 | 3.0.post1    | 4.0          |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.148.0      | 1.0.0        |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/066674 | 23.1.1       | 25.12.3      |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/013254 | 3.13.11      | 3.14.2       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 10.1.0       | 10.1.3       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.0        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 12.2.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.35.0       | 0.40.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.10.1       |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.10.1       |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.10.1       |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.10.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.10.1       |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.10.1       |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.10.1       |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.9.1        | 6.10.1       |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.10.1       |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.10.1       |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.10.1       |     
                         quota |  DISTRO  | https://release-monitoring.org/project/004145 | 4.10         | 4.11         |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.6.5        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.15.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 60.0         | 61.0         |     
               redis-plus-plus |  DISTRO  | https://release-monitoring.org/project/368624 | 1.3.12       | 1.3.15       | ORPH
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/021389 | 1.10.5       | 2.0.1        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/015461 | 14.1.1       | 15.1.0       |     
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.48         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 10.7.5       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2510.0     | 8.2512.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/059450 | 2.8          | 2.9          |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 25.02        | 25.12        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.9.8        | 0.16.5       | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 8.1.2        | 9.0.4        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 3.4.6        | 3.4.8        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.3.0        | 1.4.0        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/007635 | 1.88.0       | 1.92.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/007635 | 1.88.0       | 1.92.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/017910 | 0.72.0       | 0.72.1       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 45.0         |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.40.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.13.2.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.1.3.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.3.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.7.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.5.6.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.7.1        | 08032024     |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.33      | 0.99.36      |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.4.0        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.10.1       |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.4        | 3.2.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 2.8.1        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.4        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 3.0.1        |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.12.2       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.6        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.6       |     
                       setools |  DISTRO  | https://release-monitoring.org/project/008951 | 4.5.1        | 4.6.0        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
                   shellinabox |  DISTRO  | https://release-monitoring.org/project/009501 | 2.20         | 2.21         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.14.4.0     |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/009216 | 1.20.0       | 1.21.0       |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.8.2        | 1.8.3        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snooze |  DISTRO  | https://release-monitoring.org/project/376662 | 0.5          | 0.5.1        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.1.40.0     | 3.10.0.0     |     
                         socat |  DISTRO  | https://release-monitoring.org/project/004848 | 1.8.0.3      | 1.8.1.0      |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.20      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.12.0       |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/004879 | 4.6.1        | 4.7.4        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/004880 | 6.14         | 7.3          | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.18       |     
                         sshfs |  DISTRO  | https://release-monitoring.org/project/011058 | 3.7.3        | 3.7.5        | ORPH
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.3.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.23.3       | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 5.9.14       | 6.0.4        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.71         | 5.76         |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 25.12        |     
                  supertuxkart |  DISTRO  | https://release-monitoring.org/project/004912 | 1.4          | 1.5          |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/016289 | 4.2.5        | 4.3.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 6.0.20       | 8.0.2        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.4.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 9.2.9        | 10.0.0       |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/015714 | 2025.05      | 2025.12      |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.41.3       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/004930 | 4.8.3        | 4.10.2       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 3.7.11       | 4.2.10       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.9       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 257.10       | 259          |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.14         | 3.15         | ORPH
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.92.3       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2022.3.0     |     
                       tbtools |  DISTRO  | https://release-monitoring.org/project/372327 | 0.6.0        | 0.7.0        |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.9.0        |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.3        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.8.1        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.20.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/004954 | 5.5.0        | 5.5.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.15.10      |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/005581 | 0.14.1       | 0.22.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.23.1       | 2.24.0       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.1.1        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20250501     |     
                           tio |  DISTRO  | https://release-monitoring.org/project/020587 | 3.5          | 3.9          |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.6.0      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.3        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.3.1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/004980 | 3.5a         | 3.6a         | ORPH
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/018777 | 1.9.1        | 1.9.2        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.18.1       | ORPH
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 6.2.12       | 7.2.3        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.5.12       | 1.9.8        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.91.0       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.0.2        |     
           usb_modeswitch_data |  DISTRO  | https://release-monitoring.org/project/005060 | 20191128     | 20251207     | ORPH
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.10.0       | 2.11.2       | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.2       | 2.41.3       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.2       | 2.41.3       | ORPH
                           uuu |  DISTRO  | https://release-monitoring.org/project/259328 | 1.5.239      | 1.5.243      |     
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.0.6        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.7.7        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.1989     | 9.1.2006     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 10.0.2       |     
                           vlc |  DISTRO  | https://release-monitoring.org/project/006504 | 3.0.21       | 3.0.23-1     |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.82.2       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/089353 | 3.5.16       | 3.5.26       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.5.1        | 4.6.4        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.4.317      | 1.4.337      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.4.317      | 1.4.337      | ORPH
                    vulkan-sdk |  DISTRO  | https://release-monitoring.org/project/370476 | 1.4.313.0    | 1.4.335.0    | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.4.317      | 1.4.337      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/005116 | 2.1.6        | 2.1.9        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.6        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.8.1        | ORPH
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.45         | 1.47         | ORPH
                 wayland-utils |  DISTRO  | https://release-monitoring.org/project/129361 | 1.2.0        | 1.3.0        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.50.1       | 2.51.4       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/001761 | 1.5.0        | 1.6.0        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 10.0         | 10.20        |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.10       | 0.5.12       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.4.9        | 4.6.2        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/018357 | 0.19.0       | 0.19.2       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.10.0       |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/017547 | 1.16.0       | 1.16.1       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.48.3       | 2.50.4       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.48.0       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.27       | 1.4.30       |     
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/015053 | 1.0.6        | 1.0.7        | ORPH
                 xapp_bdftopcf |  DISTRO  | https://release-monitoring.org/project/015054 | 1.1.1        | 1.1.2        | ORPH
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/021723 | 1.2.2        | 1.2.4        | ORPH
                xapp_fslsfonts |  DISTRO  | https://release-monitoring.org/project/017157 | 1.0.6        | 1.0.7        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20250912     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.2        | 1.2.3        | ORPH
                   xapp_oclock |  DISTRO  | https://release-monitoring.org/project/015042 | 1.0.5        | 1.0.6        | ORPH
                  xapp_sessreg |  DISTRO  | https://release-monitoring.org/project/015040 | 1.1.3        | 1.1.4        | ORPH
                 xapp_showfont |  DISTRO  | https://release-monitoring.org/project/012316 | 1.0.6        | 1.0.7        | ORPH
                  xapp_smproxy |  DISTRO  | https://release-monitoring.org/project/015039 | 1.0.7        | 1.0.8        | ORPH
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/015038 | 1.0.12       | 1.0.13.1     | ORPH
                  xapp_viewres |  DISTRO  | https://release-monitoring.org/project/017162 | 1.0.7        | 1.0.8        | ORPH
                  xapp_x11perf |  DISTRO  | https://release-monitoring.org/project/015035 | 1.6.2        | 1.7.0        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/005253 | 1.1.2        | 1.1.4        | ORPH
               xapp_xbacklight |  DISTRO  | https://release-monitoring.org/project/005161 | 1.2.3        | 1.2.4        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.4        | 1.0.5        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.4        | 1.1.5        | ORPH
                   xapp_xcmsdb |  DISTRO  | https://release-monitoring.org/project/015031 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xcompmgr |  DISTRO  | https://release-monitoring.org/project/005174 | 1.1.9        | 1.1.10       | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.0.8        | 1.1.0        |     
               xapp_xcursorgen |  DISTRO  | https://release-monitoring.org/project/021210 | 1.0.8        | 1.0.9        | ORPH
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/021262 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xdpyinfo |  DISTRO  | https://release-monitoring.org/project/015028 | 1.3.4        | 1.4.0        | ORPH
                 xapp_xdriinfo |  DISTRO  | https://release-monitoring.org/project/015027 | 1.0.7        | 1.0.8        | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/015025 | 1.2.0        | 1.3.1        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.0        | 1.1.1        | ORPH
                      xapp_xfs |  DISTRO  | https://release-monitoring.org/project/005256 | 1.2.1        | 1.2.2        | ORPH
                  xapp_xfsinfo |  DISTRO  | https://release-monitoring.org/project/017158 | 1.0.7        | 1.0.8        | ORPH
                   xapp_xgamma |  DISTRO  | https://release-monitoring.org/project/015022 | 1.0.7        | 1.0.8        | ORPH
                      xapp_xgc |  DISTRO  | https://release-monitoring.org/project/021720 | 1.0.6        | 1.0.7        | ORPH
                    xapp_xhost |  DISTRO  | https://release-monitoring.org/project/015021 | 1.0.9        | 1.0.10       | ORPH
                    xapp_xinit |  DISTRO  | https://release-monitoring.org/project/005258 | 1.4.2        | 1.4.4        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/015018 | 1.4.6        | 1.5.0        | ORPH
                   xapp_xkbevd |  DISTRO  | https://release-monitoring.org/project/015017 | 1.1.5        | 1.1.6        | ORPH
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/017159 | 1.0.6        | 1.0.7        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.1.4        | 1.2.0        | ORPH
                    xapp_xlogo |  DISTRO  | https://release-monitoring.org/project/014991 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xmag |  DISTRO  | https://release-monitoring.org/project/014963 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/014962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/014961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/021718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/018845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/014958 | 1.2.6        | 1.2.8        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.2        | 1.5.3        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/005259 | 1.0.5        | 1.0.6        | ORPH
                     xapp_xwud |  DISTRO  | https://release-monitoring.org/project/014948 | 1.0.6        | 1.0.7        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/013646 | 1.15.2       | 1.17.0       | ORPH
               xcb-util-cursor |  DISTRO  | https://release-monitoring.org/project/005166 | 0.1.4        | 0.1.6        | ORPH
                       xdotool |  DISTRO  | https://release-monitoring.org/project/008648 | 3.20211022.1 | 4.20251130.1 | ORPH
      xdriver_xf86-input-evdev |  DISTRO  | https://release-monitoring.org/project/005217 | 2.10.6       | 2.11.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/005782 | 1.3.0        | 1.5.0        | ORPH
      xdriver_xf86-input-mouse |  DISTRO  | https://release-monitoring.org/project/015901 | 1.9.5        | 2.0.0        | ORPH
  xdriver_xf86-input-synaptics |  DISTRO  | https://release-monitoring.org/project/005239 | 1.9.2        | 1.10.0       | ORPH
     xdriver_xf86-video-amdgpu |  DISTRO  | https://release-monitoring.org/project/015900 | 23.0.0       | 25.0.0       | ORPH
        xdriver_xf86-video-ast |  DISTRO  | https://release-monitoring.org/project/017163 | 1.1.6        | 1.2.1        | ORPH
      xdriver_xf86-video-fbdev |  DISTRO  | https://release-monitoring.org/project/005218 | 0.5.0        | 0.5.1        | ORPH
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/005219 | 2.11.21      | 2.18.2       | ORPH
     xdriver_xf86-video-mach64 |  DISTRO  | https://release-monitoring.org/project/005225 | 6.9.7        | 6.10.0       | ORPH
        xdriver_xf86-video-mga |  DISTRO  | https://release-monitoring.org/project/005226 | 2.0.1        | 2.1.0        | ORPH
    xdriver_xf86-video-nouveau |  DISTRO  | https://release-monitoring.org/project/005229 | 1.0.17       | 1.0.18       | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.22       | 2.1.23       | ORPH
       xdriver_xf86-video-r128 |  DISTRO  | https://release-monitoring.org/project/005232 | 6.12.1       | 6.13.0       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/005235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/005236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.21.0       |     
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/015051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/017200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.11.0       | 6.17.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/006382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.46         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.18       | 1.3.19       | ORPH
                    xlib_libFS |  DISTRO  | https://release-monitoring.org/project/001618 | 1.0.9        | 1.0.10       | ORPH
                   xlib_libICE |  DISTRO  | https://release-monitoring.org/project/001638 | 1.1.1        | 1.1.2        | ORPH
                    xlib_libSM |  DISTRO  | https://release-monitoring.org/project/001726 | 1.2.4        | 1.2.6        | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.7        | 1.8.12       | ORPH
            xlib_libXScrnSaver |  DISTRO  | https://release-monitoring.org/project/001791 | 1.2.4        | 1.2.5        | ORPH
                   xlib_libXau |  DISTRO  | https://release-monitoring.org/project/001765 | 1.0.11       | 1.0.12       | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/001766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/001770 | 1.2.1        | 1.2.3        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/001772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.5        | 1.3.6        | ORPH
                xlib_libXfixes |  DISTRO  | https://release-monitoring.org/project/001775 | 6.0.1        | 6.0.2        | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/017165 | 2.0.6        | 2.0.7        | ORPH
                   xlib_libXft |  DISTRO  | https://release-monitoring.org/project/001777 | 2.3.8        | 2.3.9        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.1        | 1.8.2        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.1.4        | 1.2.1        | ORPH
              xlib_libXpresent |  DISTRO  | https://release-monitoring.org/project/017166 | 1.0.1        | 1.0.2        |     
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.3        | 1.5.4        | ORPH
               xlib_libXrender |  DISTRO  | https://release-monitoring.org/project/001789 | 0.9.11       | 0.9.12       | ORPH
                  xlib_libXres |  DISTRO  | https://release-monitoring.org/project/001790 | 1.2.2        | 1.2.3        | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.4        | 1.2.5        | ORPH
                    xlib_libXv |  DISTRO  | https://release-monitoring.org/project/001795 | 1.0.12       | 1.0.13       | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.5        | 1.1.6        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.7        | 1.1.8        | ORPH
                  xlib_libxcvt |  DISTRO  | https://release-monitoring.org/project/235147 | 0.1.2        | 0.1.3        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.2        | 1.1.3        | ORPH
                xml-security-c |  DISTRO  | https://release-monitoring.org/project/005197 | 2.0.4        | 3.0.0        | ORPH
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/017190 | 2024.1       | 2025.1       | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.12         | 6.13         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/005250 | 21.1.20      | 21.1.21      | ORPH
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.30         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 401          | 406          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/015037 | 1.20.0       | 1.20.2       | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/005277 | 5.8.1        | 5.8.2        | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 0.40.0       | 14.2         |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.15.2       | 4.15.4       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.13       | 7.4.6        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.3        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 8.0.4        |     
                       zlib-ng |  DISTRO  | https://release-monitoring.org/project/115592 | 2.2.4        | 2.3.2        | ORPH
                       zziplib |  DISTRO  | https://release-monitoring.org/project/013802 | 0.13.74      | 0.13.80      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
                      binutils | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-11413   | https://security-tracker.debian.org/tracker/CVE-2025-11413  
           binutils-bare-metal | CVE-2025-11494   | https://security-tracker.debian.org/tracker/CVE-2025-11494  
           binutils-bare-metal | CVE-2025-11412   | https://security-tracker.debian.org/tracker/CVE-2025-11412  
           binutils-bare-metal | CVE-2025-11495   | https://security-tracker.debian.org/tracker/CVE-2025-11495  
           binutils-bare-metal | CVE-2025-11414   | https://security-tracker.debian.org/tracker/CVE-2025-11414  
           binutils-bare-metal | CVE-2025-11081   | https://security-tracker.debian.org/tracker/CVE-2025-11081  
           binutils-bare-metal | CVE-2025-11083   | https://security-tracker.debian.org/tracker/CVE-2025-11083  
           binutils-bare-metal | CVE-2025-11082   | https://security-tracker.debian.org/tracker/CVE-2025-11082  
           binutils-bare-metal | CVE-2025-11840   | https://security-tracker.debian.org/tracker/CVE-2025-11840  
           binutils-bare-metal | CVE-2025-11839   | https://security-tracker.debian.org/tracker/CVE-2025-11839  
           binutils-bare-metal | CVE-2025-7545    | https://security-tracker.debian.org/tracker/CVE-2025-7545   
           binutils-bare-metal | CVE-2025-7546    | https://security-tracker.debian.org/tracker/CVE-2025-7546   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2024-50382   | https://security-tracker.debian.org/tracker/CVE-2024-50382  
                         botan | CVE-2024-50383   | https://security-tracker.debian.org/tracker/CVE-2024-50383  
                       busybox | CVE-2025-46394   | https://security-tracker.debian.org/tracker/CVE-2025-46394  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                    containerd | CVE-2024-40635   | https://security-tracker.debian.org/tracker/CVE-2024-40635  
                    containerd | CVE-2025-47291   | https://security-tracker.debian.org/tracker/CVE-2025-47291  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2025-61915   | https://security-tracker.debian.org/tracker/CVE-2025-61915  
                          cups | CVE-2025-58436   | https://security-tracker.debian.org/tracker/CVE-2025-58436  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-9173    | https://security-tracker.debian.org/tracker/CVE-2025-9173   
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         expat | CVE-2025-66382   | https://security-tracker.debian.org/tracker/CVE-2025-66382  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                         forge | CVE-2025-66030   | https://security-tracker.debian.org/tracker/CVE-2025-66030  
                         forge | CVE-2025-66031   | https://security-tracker.debian.org/tracker/CVE-2025-66031  
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                        go-bin | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                        go-src | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                       haproxy | CVE-2025-11230   | https://security-tracker.debian.org/tracker/CVE-2025-11230  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                        jasper | CVE-2025-8836    | https://security-tracker.debian.org/tracker/CVE-2025-8836   
                        jasper | CVE-2025-8837    | https://security-tracker.debian.org/tracker/CVE-2025-8837   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                       libcoap | CVE-2025-59391   | https://security-tracker.debian.org/tracker/CVE-2025-59391  
                       libcoap | CVE-2025-65496   | https://security-tracker.debian.org/tracker/CVE-2025-65496  
                       libcoap | CVE-2025-65495   | https://security-tracker.debian.org/tracker/CVE-2025-65495  
                       libcoap | CVE-2025-65494   | https://security-tracker.debian.org/tracker/CVE-2025-65494  
                       libcoap | CVE-2025-65493   | https://security-tracker.debian.org/tracker/CVE-2025-65493  
                       libcoap | CVE-2025-65497   | https://security-tracker.debian.org/tracker/CVE-2025-65497  
                       libcoap | CVE-2025-65498   | https://security-tracker.debian.org/tracker/CVE-2025-65498  
                       libcoap | CVE-2025-65499   | https://security-tracker.debian.org/tracker/CVE-2025-65499  
                       libcoap | CVE-2025-65501   | https://security-tracker.debian.org/tracker/CVE-2025-65501  
                       libcoap | CVE-2025-65500   | https://security-tracker.debian.org/tracker/CVE-2025-65500  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2025-65803   | https://security-tracker.debian.org/tracker/CVE-2025-65803  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       log4cxx | CVE-2025-54812   | https://security-tracker.debian.org/tracker/CVE-2025-54812  
                       log4cxx | CVE-2025-54813   | https://security-tracker.debian.org/tracker/CVE-2025-54813  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                 python-django | CVE-2025-64460   | https://security-tracker.debian.org/tracker/CVE-2025-64460  
                 python-django | CVE-2025-13372   | https://security-tracker.debian.org/tracker/CVE-2025-13372  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2025-45768   | https://security-tracker.debian.org/tracker/CVE-2025-45768  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       quickjs | CVE-2025-62491   | https://security-tracker.debian.org/tracker/CVE-2025-62491  
                       quickjs | CVE-2025-62494   | https://security-tracker.debian.org/tracker/CVE-2025-62494  
                       quickjs | CVE-2025-62492   | https://security-tracker.debian.org/tracker/CVE-2025-62492  
                       quickjs | CVE-2025-62495   | https://security-tracker.debian.org/tracker/CVE-2025-62495  
                       quickjs | CVE-2025-62490   | https://security-tracker.debian.org/tracker/CVE-2025-62490  
                       quickjs | CVE-2025-62496   | https://security-tracker.debian.org/tracker/CVE-2025-62496  
                       quickjs | CVE-2025-62493   | https://security-tracker.debian.org/tracker/CVE-2025-62493  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                          runc | CVE-2025-31133   | https://security-tracker.debian.org/tracker/CVE-2025-31133  
                          runc | CVE-2025-52881   | https://security-tracker.debian.org/tracker/CVE-2025-52881  
                          runc | CVE-2025-52565   | https://security-tracker.debian.org/tracker/CVE-2025-52565  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         squid | CVE-2025-62168   | https://security-tracker.debian.org/tracker/CVE-2025-62168  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                     wireshark | CVE-2025-13946   | https://security-tracker.debian.org/tracker/CVE-2025-13946  
                     wireshark | CVE-2025-11626   | https://security-tracker.debian.org/tracker/CVE-2025-11626  
                     wireshark | CVE-2025-13499   | https://security-tracker.debian.org/tracker/CVE-2025-13499  
                       wolfssl | CVE-2025-7394    | https://security-tracker.debian.org/tracker/CVE-2025-7394   
                     wpewebkit | CVE-2025-43343   | https://security-tracker.debian.org/tracker/CVE-2025-43343  
                     wpewebkit | CVE-2025-43342   | https://security-tracker.debian.org/tracker/CVE-2025-43342  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2025.11.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-11413   | https://security-tracker.debian.org/tracker/CVE-2025-11413  
           binutils-bare-metal | CVE-2025-11494   | https://security-tracker.debian.org/tracker/CVE-2025-11494  
           binutils-bare-metal | CVE-2025-11412   | https://security-tracker.debian.org/tracker/CVE-2025-11412  
           binutils-bare-metal | CVE-2025-11495   | https://security-tracker.debian.org/tracker/CVE-2025-11495  
           binutils-bare-metal | CVE-2025-11414   | https://security-tracker.debian.org/tracker/CVE-2025-11414  
           binutils-bare-metal | CVE-2025-11081   | https://security-tracker.debian.org/tracker/CVE-2025-11081  
           binutils-bare-metal | CVE-2025-11083   | https://security-tracker.debian.org/tracker/CVE-2025-11083  
           binutils-bare-metal | CVE-2025-11082   | https://security-tracker.debian.org/tracker/CVE-2025-11082  
           binutils-bare-metal | CVE-2025-11840   | https://security-tracker.debian.org/tracker/CVE-2025-11840  
           binutils-bare-metal | CVE-2025-11839   | https://security-tracker.debian.org/tracker/CVE-2025-11839  
           binutils-bare-metal | CVE-2025-7545    | https://security-tracker.debian.org/tracker/CVE-2025-7545   
           binutils-bare-metal | CVE-2025-7546    | https://security-tracker.debian.org/tracker/CVE-2025-7546   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2024-50382   | https://security-tracker.debian.org/tracker/CVE-2024-50382  
                         botan | CVE-2024-50383   | https://security-tracker.debian.org/tracker/CVE-2024-50383  
                       busybox | CVE-2025-46394   | https://security-tracker.debian.org/tracker/CVE-2025-46394  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                    containerd | CVE-2024-40635   | https://security-tracker.debian.org/tracker/CVE-2024-40635  
                    containerd | CVE-2025-47291   | https://security-tracker.debian.org/tracker/CVE-2025-47291  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2025-61915   | https://security-tracker.debian.org/tracker/CVE-2025-61915  
                          cups | CVE-2025-58436   | https://security-tracker.debian.org/tracker/CVE-2025-58436  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-9173    | https://security-tracker.debian.org/tracker/CVE-2025-9173   
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         expat | CVE-2025-66382   | https://security-tracker.debian.org/tracker/CVE-2025-66382  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                         forge | CVE-2025-66030   | https://security-tracker.debian.org/tracker/CVE-2025-66030  
                         forge | CVE-2025-66031   | https://security-tracker.debian.org/tracker/CVE-2025-66031  
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                        go-bin | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                        go-src | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                       haproxy | CVE-2025-11230   | https://security-tracker.debian.org/tracker/CVE-2025-11230  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                        jasper | CVE-2025-8836    | https://security-tracker.debian.org/tracker/CVE-2025-8836   
                        jasper | CVE-2025-8837    | https://security-tracker.debian.org/tracker/CVE-2025-8837   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                       libcoap | CVE-2025-59391   | https://security-tracker.debian.org/tracker/CVE-2025-59391  
                       libcoap | CVE-2025-65496   | https://security-tracker.debian.org/tracker/CVE-2025-65496  
                       libcoap | CVE-2025-65495   | https://security-tracker.debian.org/tracker/CVE-2025-65495  
                       libcoap | CVE-2025-65494   | https://security-tracker.debian.org/tracker/CVE-2025-65494  
                       libcoap | CVE-2025-65493   | https://security-tracker.debian.org/tracker/CVE-2025-65493  
                       libcoap | CVE-2025-65497   | https://security-tracker.debian.org/tracker/CVE-2025-65497  
                       libcoap | CVE-2025-65498   | https://security-tracker.debian.org/tracker/CVE-2025-65498  
                       libcoap | CVE-2025-65499   | https://security-tracker.debian.org/tracker/CVE-2025-65499  
                       libcoap | CVE-2025-65501   | https://security-tracker.debian.org/tracker/CVE-2025-65501  
                       libcoap | CVE-2025-65500   | https://security-tracker.debian.org/tracker/CVE-2025-65500  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2025-65803   | https://security-tracker.debian.org/tracker/CVE-2025-65803  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       log4cxx | CVE-2025-54812   | https://security-tracker.debian.org/tracker/CVE-2025-54812  
                       log4cxx | CVE-2025-54813   | https://security-tracker.debian.org/tracker/CVE-2025-54813  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                 python-django | CVE-2025-64460   | https://security-tracker.debian.org/tracker/CVE-2025-64460  
                 python-django | CVE-2025-13372   | https://security-tracker.debian.org/tracker/CVE-2025-13372  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2025-45768   | https://security-tracker.debian.org/tracker/CVE-2025-45768  
               python-werkzeug | CVE-2025-66221   | https://security-tracker.debian.org/tracker/CVE-2025-66221  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       qt6base | CVE-2025-5683    | https://security-tracker.debian.org/tracker/CVE-2025-5683   
                       quickjs | CVE-2025-62491   | https://security-tracker.debian.org/tracker/CVE-2025-62491  
                       quickjs | CVE-2025-62494   | https://security-tracker.debian.org/tracker/CVE-2025-62494  
                       quickjs | CVE-2025-62492   | https://security-tracker.debian.org/tracker/CVE-2025-62492  
                       quickjs | CVE-2025-62495   | https://security-tracker.debian.org/tracker/CVE-2025-62495  
                       quickjs | CVE-2025-62490   | https://security-tracker.debian.org/tracker/CVE-2025-62490  
                       quickjs | CVE-2025-62496   | https://security-tracker.debian.org/tracker/CVE-2025-62496  
                       quickjs | CVE-2025-62493   | https://security-tracker.debian.org/tracker/CVE-2025-62493  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                          runc | CVE-2025-31133   | https://security-tracker.debian.org/tracker/CVE-2025-31133  
                          runc | CVE-2025-52881   | https://security-tracker.debian.org/tracker/CVE-2025-52881  
                          runc | CVE-2025-52565   | https://security-tracker.debian.org/tracker/CVE-2025-52565  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         squid | CVE-2025-62168   | https://security-tracker.debian.org/tracker/CVE-2025-62168  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                     wireshark | CVE-2025-13946   | https://security-tracker.debian.org/tracker/CVE-2025-13946  
                     wireshark | CVE-2025-11626   | https://security-tracker.debian.org/tracker/CVE-2025-11626  
                     wireshark | CVE-2025-13499   | https://security-tracker.debian.org/tracker/CVE-2025-13499  
                       wolfssl | CVE-2025-7394    | https://security-tracker.debian.org/tracker/CVE-2025-7394   
                     wpewebkit | CVE-2025-43343   | https://security-tracker.debian.org/tracker/CVE-2025-43343  
                     wpewebkit | CVE-2025-43342   | https://security-tracker.debian.org/tracker/CVE-2025-43342  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
           binutils-bare-metal | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2025-54605   | https://security-tracker.debian.org/tracker/CVE-2025-54605  
                       bitcoin | CVE-2025-54604   | https://security-tracker.debian.org/tracker/CVE-2025-54604  
                         botan | CVE-2024-50382   | https://security-tracker.debian.org/tracker/CVE-2024-50382  
                         botan | CVE-2024-50383   | https://security-tracker.debian.org/tracker/CVE-2024-50383  
                      bpftrace | CVE-2024-2313    | https://security-tracker.debian.org/tracker/CVE-2024-2313   
                       busybox | CVE-2025-46394   | https://security-tracker.debian.org/tracker/CVE-2025-46394  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                    containerd | CVE-2024-40635   | https://security-tracker.debian.org/tracker/CVE-2024-40635  
                    containerd | CVE-2025-47291   | https://security-tracker.debian.org/tracker/CVE-2025-47291  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                   cpp-httplib | CVE-2025-53628   | https://security-tracker.debian.org/tracker/CVE-2025-53628  
                   cpp-httplib | CVE-2025-53629   | https://security-tracker.debian.org/tracker/CVE-2025-53629  
                   cpp-httplib | CVE-2025-66577   | https://security-tracker.debian.org/tracker/CVE-2025-66577  
                   cpp-httplib | CVE-2025-66570   | https://security-tracker.debian.org/tracker/CVE-2025-66570  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2025-61915   | https://security-tracker.debian.org/tracker/CVE-2025-61915  
                          cups | CVE-2025-58436   | https://security-tracker.debian.org/tracker/CVE-2025-58436  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-9173    | https://security-tracker.debian.org/tracker/CVE-2025-9173   
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         expat | CVE-2025-66382   | https://security-tracker.debian.org/tracker/CVE-2025-66382  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                         forge | CVE-2025-66030   | https://security-tracker.debian.org/tracker/CVE-2025-66030  
                         forge | CVE-2025-66031   | https://security-tracker.debian.org/tracker/CVE-2025-66031  
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                        go-bin | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                        go-bin | CVE-2025-61727   | https://security-tracker.debian.org/tracker/CVE-2025-61727  
                        go-bin | CVE-2025-61729   | https://security-tracker.debian.org/tracker/CVE-2025-61729  
                        go-src | CVE-2024-3566    | https://security-tracker.debian.org/tracker/CVE-2024-3566   
                        go-src | CVE-2025-61727   | https://security-tracker.debian.org/tracker/CVE-2025-61727  
                        go-src | CVE-2025-61729   | https://security-tracker.debian.org/tracker/CVE-2025-61729  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                       haproxy | CVE-2025-11230   | https://security-tracker.debian.org/tracker/CVE-2025-11230  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                        jasper | CVE-2025-8836    | https://security-tracker.debian.org/tracker/CVE-2025-8836   
                        jasper | CVE-2025-8837    | https://security-tracker.debian.org/tracker/CVE-2025-8837   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libbson | CVE-2024-6381    | https://security-tracker.debian.org/tracker/CVE-2024-6381   
                       libbson | CVE-2025-0755    | https://security-tracker.debian.org/tracker/CVE-2025-0755   
                       libcoap | CVE-2025-59391   | https://security-tracker.debian.org/tracker/CVE-2025-59391  
                       libcoap | CVE-2025-65496   | https://security-tracker.debian.org/tracker/CVE-2025-65496  
                       libcoap | CVE-2025-65495   | https://security-tracker.debian.org/tracker/CVE-2025-65495  
                       libcoap | CVE-2025-65494   | https://security-tracker.debian.org/tracker/CVE-2025-65494  
                       libcoap | CVE-2025-65493   | https://security-tracker.debian.org/tracker/CVE-2025-65493  
                       libcoap | CVE-2025-65497   | https://security-tracker.debian.org/tracker/CVE-2025-65497  
                       libcoap | CVE-2025-65498   | https://security-tracker.debian.org/tracker/CVE-2025-65498  
                       libcoap | CVE-2025-65499   | https://security-tracker.debian.org/tracker/CVE-2025-65499  
                       libcoap | CVE-2025-65501   | https://security-tracker.debian.org/tracker/CVE-2025-65501  
                       libcoap | CVE-2025-65500   | https://security-tracker.debian.org/tracker/CVE-2025-65500  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2025-65803   | https://security-tracker.debian.org/tracker/CVE-2025-65803  
                      libglib2 | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                       log4cxx | CVE-2025-54812   | https://security-tracker.debian.org/tracker/CVE-2025-54812  
                       log4cxx | CVE-2025-54813   | https://security-tracker.debian.org/tracker/CVE-2025-54813  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                 python-django | CVE-2025-64460   | https://security-tracker.debian.org/tracker/CVE-2025-64460  
                 python-django | CVE-2025-13372   | https://security-tracker.debian.org/tracker/CVE-2025-13372  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2025-45768   | https://security-tracker.debian.org/tracker/CVE-2025-45768  
               python-werkzeug | CVE-2025-66221   | https://security-tracker.debian.org/tracker/CVE-2025-66221  
                       python3 | CVE-2025-12084   | https://security-tracker.debian.org/tracker/CVE-2025-12084  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2025-54566   | https://security-tracker.debian.org/tracker/CVE-2025-54566  
                          qemu | CVE-2025-54567   | https://security-tracker.debian.org/tracker/CVE-2025-54567  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       qt6base | CVE-2025-5683    | https://security-tracker.debian.org/tracker/CVE-2025-5683   
                       quickjs | CVE-2025-62491   | https://security-tracker.debian.org/tracker/CVE-2025-62491  
                       quickjs | CVE-2025-62494   | https://security-tracker.debian.org/tracker/CVE-2025-62494  
                       quickjs | CVE-2025-62492   | https://security-tracker.debian.org/tracker/CVE-2025-62492  
                       quickjs | CVE-2025-62495   | https://security-tracker.debian.org/tracker/CVE-2025-62495  
                       quickjs | CVE-2025-62490   | https://security-tracker.debian.org/tracker/CVE-2025-62490  
                       quickjs | CVE-2025-62496   | https://security-tracker.debian.org/tracker/CVE-2025-62496  
                       quickjs | CVE-2025-62493   | https://security-tracker.debian.org/tracker/CVE-2025-62493  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                          runc | CVE-2025-31133   | https://security-tracker.debian.org/tracker/CVE-2025-31133  
                          runc | CVE-2025-52881   | https://security-tracker.debian.org/tracker/CVE-2025-52881  
                          runc | CVE-2025-52565   | https://security-tracker.debian.org/tracker/CVE-2025-52565  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         squid | CVE-2025-62168   | https://security-tracker.debian.org/tracker/CVE-2025-62168  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                   uboot-tools | CVE-2024-57259   | https://security-tracker.debian.org/tracker/CVE-2024-57259  
                   uboot-tools | CVE-2024-57254   | https://security-tracker.debian.org/tracker/CVE-2024-57254  
                   uboot-tools | CVE-2024-57257   | https://security-tracker.debian.org/tracker/CVE-2024-57257  
                   uboot-tools | CVE-2024-57258   | https://security-tracker.debian.org/tracker/CVE-2024-57258  
                   uboot-tools | CVE-2024-57255   | https://security-tracker.debian.org/tracker/CVE-2024-57255  
                   uboot-tools | CVE-2024-57256   | https://security-tracker.debian.org/tracker/CVE-2024-57256  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                     webkitgtk | CVE-2025-43343   | https://security-tracker.debian.org/tracker/CVE-2025-43343  
                     webkitgtk | CVE-2025-43342   | https://security-tracker.debian.org/tracker/CVE-2025-43342  
                     wireshark | CVE-2025-11626   | https://security-tracker.debian.org/tracker/CVE-2025-11626  
                       wolfssl | CVE-2025-7394    | https://security-tracker.debian.org/tracker/CVE-2025-7394   
                     wpewebkit | CVE-2025-43343   | https://security-tracker.debian.org/tracker/CVE-2025-43343  
                     wpewebkit | CVE-2025-43342   | https://security-tracker.debian.org/tracker/CVE-2025-43342  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

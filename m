Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ED1C55171
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 03:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E98C4076F;
	Sat,  1 Aug 2026 03:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mY7DITQOrK0t; Sat,  1 Aug 2026 03:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 022CF40711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785554969;
	bh=7IwH1aWTjKPi1yaE4g/CmPa8wx6lXOs6Ch397tQ1B30=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QTE1mkKKYMe3X3IPG0ui3dmBZcJryz0TMFhe2+0+I9Y05/eVFt3tBPXDzY4GcgPDc
	 N6PqIMUqG/DEE0ztqVmhkT6TM+AmhcYzuDRN2uwp7aEJmdTGTCiTVqE8+kr3njhP6y
	 I4rnem4snk51ZFwJIKHRUrIezL4ARZlSGQIDX0y5wfdxSnDmk1wYBjjLEaNfw1Jbbg
	 0jFXjw28wRPoVr0Y6nB9SMBizFegvF1uKGfNStJ+VMa2uWRSG6mt0DV5bmSBWKtOHn
	 gxZQ4pX0RNLosyAqjB5l0RR3E/Wmjc3b+9kC1BABT96Y7uBA0pP9zkgKoJH8GWg5Zi
	 m4Ji8MxFLtOjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 022CF40711;
	Sat,  1 Aug 2026 03:29:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A1DC1389
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 03:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 301B560688
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 03:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7WbKcLrtzUd for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 03:29:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3FD96062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3FD96062D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3FD96062D
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 03:29:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso2438145e9.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 20:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785554964; x=1786159764;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=0s/7v0DDCjj9dGH1Qwy/L9nJnzHH5PcYViKo/3gN8Us=;
 b=i/tlvJXjkMrWrzmAvNuCag7iCcdJiLHUTvP/NCtuZxbI8bOrjL294gMMPPoAMSqetq
 Me3DgMHw00Dbl4l4pzxcnvle4GcnJQv2uG1+mZA7i4dx0oxLXZcB5CdckS0mIZcmVS2i
 UTLfBpyXgacsmLxINAxrQW1IXRgm52+wjOGDTAxZSq+cubQu9QmsnSmlnqUGpDa6j+/Q
 AISLsVzS2OKtnPFyvjHvcyV298k++le1WDW6g+noel5ytYb4tY4BuY8rs/vc6w1lP5xm
 uE7+ElV6MED2lyurXJN3BomjCn7Vug3/o3oUxdl6TjDtCvL9LB+nLfBf131K+00sgl5e
 RQMQ==
X-Gm-Message-State: AOJu0YzzTIyj0Sbz/ZiKGEDRKC6hnj6XQThuB1C1eY1zPvnSLyi9h/e3
 rqtuUa7s00LIhArjmtTyeHzIAXWfOPZJ8DUb8+rS9WpJ/dLn1f3jg+0H37LfZPBF
X-Gm-Gg: AR+sD10jB+CtzPSpStaRsTnnbsW5K+E9gGVIU5sWjDptfj76fpe+8JMFCC8eaUSJ390
 PhHSqr88pXoxWRneR6EdCw2b3xnRs01X454Hr4UQVq9nCIAcMHWdWcTzv475YOqLANWPaJQIIhc
 eXWlPdKTldLMorVdpuj/9IGRRlb6toi/5rQ6CUPZY6qFijIsYpbd1+JOl7XzHLhXI57pZO5Qx3C
 5DUSyVMRag4nZa6yqowq16L00pbEBlxcA5fgJzrFYhKARW6daHFaAeG4XO2ka8FHbjzIrFjnCKz
 tCFwXk/sHDSdpD5g0JfKmUYtop0e3CHB3Mv8PgfLkQOzalJ9GmeB3uYAe0kS+3qV4JoI/LfEZTC
 wbIF4h2kJ0Oa03iITB55u6efp9xzR8pzlk6ydNKoBcAjBprZ9oCGM+815voJG73B5bgcgcQImfN
 2It48sx/Lzi36CRCs8NAIv8I/MRbIPalrb3T157bBvN3NHqpxlUCe6brZ4SQ/oxCM=
X-Received: by 2002:a05:600c:6989:b0:495:6338:1453 with SMTP id
 5b1f17b1804b1-4980c680bd5mr12308665e9.16.1785554963478; 
 Fri, 31 Jul 2026 20:29:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458ea4asm11394120f8f.31.2026.07.31.20.29.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 20:29:22 -0700 (PDT)
Message-ID: <6a6d6812.9325fd96.1aea41.f017@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 01 Aug 2026 03:29:22 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785554964; x=1786159764; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0s/7v0DDCjj9dGH1Qwy/L9nJnzHH5PcYViKo/3gN8Us=;
 b=otQZPaOtVPvRXW+3XEhZooRSijHubtBeGD91kZNtucxXoH24Ppla6tTtp+JroON81P
 EJQ7uvzxZUxV80TWWbB+ZcJbQl4omHls8UD1kMYbjJ30vED07iKtLOW0ybjmKrcgNs2T
 ZhYwsoBYgZH08/CPohkEtcUY5GgZ6uqYxzwz+fInxd1xCFqQ4SS0YQCsDvEpQ9Bwvnxr
 ushKrEX3kVcq6zjmTDyVRlqXehjg0cqvGCEDYkFjD4BoLAHgohTPlpqBFLzcw2fjLpA0
 BmMooB5fqotPbxWaPUxQDjcmn4bzI9GPinm9P+D2pioT4GYXZXIq/3Cc9pjUyjOEkStp
 QT8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=otQZPaOt
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-31
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

Autobuild statistics for 2026-07-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
  2026.02.x  |  0  |  3  |  0  |  3  |
    master   | 20  | 53  |  0  | 73  |

Classification of failures by reason for master
-----------------------------------------------

              jpeg-turbo-3.2.0 | 3 
      libabseil-cpp-20260107.1 | 3 
uhttpd-15346de8d3ba42200249... | 3 
                    attr-2.6.0 | 2 
        edk2-edk2-stable202602 | 2 
            gdk-pixbuf-2.42.12 | 2 
                host-m4-1.4.21 | 2 
            igd2-for-linux-2.2 | 2 
                    which-2.23 | 2 
             alsa-lib-1.2.16.1 | 1 
             dahdi-linux-3.3.0 | 1 
      docker-cli-buildx-0.25.0 | 1 
              fftw-quad-3.3.10 | 1 
  gobject-introspection-1.84.0 | 1 
                  guile-3.0.11 | 1 
                 host-gdb-14.2 | 1 
          host-tipidee-0.0.5.1 | 1 
               libepoxy-1.5.10 | 1 
             libpciaccess-0.19 | 1 
   libtorrent-rasterbar-1.2.20 | 1 
               libxmlrpc-r3341 | 1 
               lightning-2.2.3 | 1 
               linux-pam-1.7.2 | 1 
               madplay-0.15.2b | 1 
                  netcat-0.7.1 | 1 
                      nmon-16p | 1 
               nushell-0.108.0 | 1 
           oath-toolkit-2.6.14 | 1 
                openssh-10.4p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.2 | 1 
                  readline-8.3 | 1 
rtl8821cu-7f63a9da2e8ed8340... | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
               tipidee-0.0.5.1 | 1 
toolchain-external-bootlin-... | 1 
           uboot-tools-2026.04 | 1 
                       unknown | 1 
               valgrind-3.26.0 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/aabc0bba7689c80c5ac65e85f5abd4b76fb5cb92 |     
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/e90338a26ad277d97f4b5bf320805ac3785a1d3b |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/f52067059018e34cb1167dd6325a933f63963c57 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0dae98d36f05a37045ec4e2ee500299b1427beaa | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/ab1d1a5d5b13cccc0ce4f9d3a7a420a3f2530f54 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/af1191bb7faabf24c7528f3f7c97a84831d3ce95 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/a5e8ea0d5ceff1725d7a4acc2fb3e19afe40ff8e |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/fbae09966c86f33340e726366b4a3d0967e94d8d | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/49c5e229dc4425179e7169a84fe5ae838ae77109 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f91106d8849d4f4ffd6e637507f27700571679f8 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6001e536f52c5564bbc60a10b1dfe752f7f300fb | ORPH
    i686     |          guile-3.0.11          | NOK | https://autobuild.buildroot.org/results/6fe3c4784584143082a243cf797ead6f61d26ab0 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6519b0336828fa29a04cc139eaeedbd846f6f0d9 | ORPH
    i686     |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/472be80288f870d388052c92e734d993eaaa7e4f | ORPH
    i686     |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/8c7c529f9d7f9bfd94dbc9a487725c44cfee899c | ORPH
    i686     |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/e61d9d2e5e2d4418af51fbff42b4f35d3584340a |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f00414a60eea7d46cd4cdc3a777cb8ea9ca42bc4 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/789a4c12a429b8e3b8025fee8f6b9f184cd21acc |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/3e173873359bc1f77c2fa4ee339b988c63f1e708 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/86d13e8271144c9c855588fedf3689fa312a669f |     
   x86_64    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/b6dd91193882f2d24c62f3e2ef1da01dd1579a5b |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/c54e1664d98e368e9ff50d665b75c795ce690443 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/c0e52c7f19c8db375ea1a6331204c51031f9d63b |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/a9e322f1841dfed9df2f4975b4fd3281920dd52c |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/0c51d29eaef935bdc28ed6f01f075ba77e5a9d97 |     
    arc      |       libpciaccess-0.19        | NOK | https://autobuild.buildroot.org/results/231228959915f302e09df4354f93ba797924f6d6 |     
  aarch64    |  libtorrent-rasterbar-1.2.20   | NOK | https://autobuild.buildroot.org/results/96aeb03ebe7bc7255a4dbbaf19008ed4ec341f14 |     
  aarch64    |        libxmlrpc-r3341         | NOK | https://autobuild.buildroot.org/results/7896f6f858b0e75016e7f3350d08c82e5813d544 |     
    i686     |        lightning-2.2.3         | NOK | https://autobuild.buildroot.org/results/a04c2efa9e5bbfb120056d8cb1fa760f2da91971 |     
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/51e5448740ba7e451b8c02b9b37ec09ad6b52c6b | ORPH
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/3c823e5496d32e60edb659b4fcb419530cfd9a59 | ORPH
    i686     |          netcat-0.7.1          | NOK | https://autobuild.buildroot.org/results/1ce1b78d4fbfc70424834a7c7f12271f7d0f479a | ORPH
powerpc64le  |            nmon-16p            | NOK | https://autobuild.buildroot.org/results/7cfbe3ebbc485ee7a4717857acd27f3bd8d77c89 | ORPH
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/4df807dc8c61e607cf6864b99736d167b23615a2 | ORPH
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/6b9e72bcf4b9cefcebc8eaa2192de8ca7501bbba |     
   mips64    |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/50e0eab6429042402dec72e2e36ac96e709132b5 | ORPH
   x86_64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6a0cdbeff2d69adeafda386db9fb2fe609ce8d47 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c6683ba80296331d184f2112a5447f5e825efeeb |     
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/5ea6d2bbc885bdab0ab3033f40664affb88d2c30 | ORPH
    i686     | rtl8821cu-7f63a9da2e8ed8340... | NOK | https://autobuild.buildroot.org/results/c302fe668251efc78106d48c63ed65fff126660e |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/78f2bbfbede2c846dcb9005411af78ea842c837d |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/b5db12b1aba3abf340b071bc0c6884b26f30cf5a |     
    i686     |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/2ce6103ddb0b1804db6306ef7cfcde9b2c7c7dc1 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/fc3c3050042e424eec96818e8e0ade3c33cf4c62 | ORPH
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/93f79be14ae8dd13f796047615ac55483f898924 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/0cdad9e82f517f8150d01eb1b103561ae60ed94a | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/cf006bf8e88f6cdd9fa16741201b197b109d6336 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/381f6e55f654bb54597949dc8a069c96c98f82a3 | ORPH
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/06ed68798c443b3ac30dd6721d6597333ba20d47 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/6037ef2d9c2b8090b6f37cb31b97206c8d1a16a6 | ORPH
    mips     |           which-2.23           | NOK | https://autobuild.buildroot.org/results/c89b8f5902b0199353b7b46469f4382c5eec20e3 | ORPH
    i686     |           which-2.23           | NOK | https://autobuild.buildroot.org/results/210ac65efea3b3290e23309094f5360e89b26e35 | ORPH
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/0d034702cecddf7b4e7bdc337162e4d52e101bd3 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 aichat-0.30.0 | 1 
             alsa-lib-1.2.15.3 | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/90b726d0f72c2eb7677368ae1ddf1be493717628 |     
    i686     |       alsa-lib-1.2.15.3        | NOK | https://autobuild.buildroot.org/results/02a23a0190e2e0e1375e5639c90a327557cb2c15 |     
    i686     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/2fd41bf9defb4cb311ce6d27fd43a8ee484973de |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             fluent-bit-3.2.10 | 1 
                    gcr-3.40.0 | 1 
                     gpsd-3.25 | 1 
                 libpng-1.6.58 | 1 
                memtest86-7.20 | 1 
            minizip-zlib-1.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/8147567992d4890aaea80cccf0bd6d0c0a994755 |     
    i686     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/2f7e4bdccdcc01efde2e6a4cd7cf2dd410f514d1 | ORPH
    i686     |           gpsd-3.25            | NOK | https://autobuild.buildroot.org/results/45c98e9dc7f78a99e8ac079212a62d9afb509658 |     
  riscv64    |         libpng-1.6.58          | NOK | https://autobuild.buildroot.org/results/ba105a136fc839c67f874b36976fc84cd4a09f8b |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/b0b859fae4f4ad2ae34cdb5d1943d540264af1eb |     
  mips64el   |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/345d6e80b9f225dfbe48e7a5ef4f25d08f090104 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

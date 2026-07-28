Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBF6C531F9
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 03:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF794069C;
	Tue, 28 Jul 2026 03:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioIbcWJ1_aWE; Tue, 28 Jul 2026 03:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5839B407D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785209206;
	bh=w0rTW5G1ynaGsPKsfNAUAncRxsIC+k5PQBs5pcLMPxs=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L4WoLxp5JiFtJ9zTYiOzBfTX1aL+piwhYN4TRrRmkE3I05tbUb8YAnXmb/uRkSB9o
	 GBdmdi32Ty+kzcobzFIC+xRbepD0byoBFw8Mjl68Q4vXTLcaADJyelMrD7cYDAfdgF
	 YPfzkTTn++jQxqbvbfTxFu0GD44Ru/VVcIyVq4xioc2fZ5ZgXjweMAXkOmd0QsSLyC
	 rcQWsSltMiMJEDsqwph9RoWenzjfi7SI6PuS6qgbZkY8DCd6cB/pW8CmvZ8RFvGYzi
	 UYDCFsH9PXLPYzrmRwtWmwMqvy3Wv/aEuHx9aqktEZEML1Mz52Omoghif9bqxou2Ta
	 vxXNvKmjxc0uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5839B407D0;
	Tue, 28 Jul 2026 03:26:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7B5C3B0
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 03:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDF0640760
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 03:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_txV7yZkHr3 for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 03:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0411E4069C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0411E4069C
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0411E4069C
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 03:26:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso2423200f8f.0
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 20:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785209200; x=1785814000;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QRmVFbapy6fKzdVioAu1vHpGbSzvWl0+mhak6fLkg3M=;
 b=kHXEjOaFYhJ9gtMx9r4GoR14Ifsc0txYiiwQXpEJCH9avhpsOFzDA8CfzpQ/WxipYy
 0cwzxYlB0kNrybK9ARutkh2VIMa9qV5OJBifsXjp+bNAID6KDq5vEfEaRus4wGzkFZGi
 Cz+n2OzDCAdvtRmkV1uF9vI0vCsAYaAHAqJ6+B7HqGITbiumG7VoJI3J6Gg88WeKQ88G
 V8VVe1b+R+cbF1JSNpujKLm5TAZOuoa5AmHL1v9+83y5412CrjidMnhXdCC0XsPIvax+
 APe14JpboeTSfaNpACNKKbFG+89xc4eWpyZzbPG0/XEi88xvmvtb0ETzVuFltHIdDObZ
 vQmA==
X-Gm-Message-State: AOJu0YxEwwkcgM5kkXaGGjt5kCq/pdelGJupCTMaps02HNe3x2dXr4aB
 q45IsvxqvC9g9H2jOMyv//uf4UkaI+rYMbWIZ33+C8iIfOobLm7e+YR03FfuNKOe
X-Gm-Gg: AR+sD139DTAa+oa561FkT1xmkEmarcv4/xRgYDXQEUeNSsezplMVAu67kMTslxkddm6
 qMt8GcOGZQ0/42/uhnDNm2L1G3pGDf7Ni3FNl/lBADpaeDhCrRWHouIOO9gWu/hbBrReAOtAdTf
 JGQ4tqEy5HgWj+jQ0cfbI9lvnDcBnpZJ8jdGqLBVlRJr5M9M8xvopm3eoaipwHn1E94M8KTTG5i
 kTwZP78uy/9T9WKmLVIKUYfw8XOY28/LNnKGQjVqE+zTRbez0KlTWRGDyNYieza43uziRreS+sr
 39lUWPXj4VME5FiHaltooGJA0/KE3Znb8WR9DgqeMyT1c+dQIvHWg0utokfMFI3/hUa2l03jOVZ
 3R8QDQjedRpBaS07cNjmZ1QT5RjgS8sJBSyyizGvgqAMymNXoOeED93q3/L0N7kth+7BMoQBSnm
 WQtp532279iv6cBzg=
X-Received: by 2002:a05:6000:2583:b0:47f:8fb6:c32e with SMTP id
 ffacd0b85a97d-47fb1edc07cmr443040f8f.46.1785209200376; 
 Mon, 27 Jul 2026 20:26:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a596sm53114545f8f.4.2026.07.27.20.26.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 20:26:39 -0700 (PDT)
Message-ID: <6a68216f.c9089686.982bb.2b30@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 28 Jul 2026 03:26:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785209200; x=1785814000; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QRmVFbapy6fKzdVioAu1vHpGbSzvWl0+mhak6fLkg3M=;
 b=nxts0ikaF7M2U415rMN63iU/oQD7iaxk6MILCskzZpDY+LSI2dw0ncK2pnZT/QDJqi
 6STRJTfYWjBwDYOCT0DFQyzvQRoa0lD4q3g75l6qcsnSR4m5+dGuzErXjr+wuLf/a+u6
 Rz+3XEkzs5lnaLr2D244o4wEursq1wACdwtK33Ken/YXlCiJijPfspPeK5PvqvbB+MSb
 9z90BpvA8FAKbS+wfjYMdwzK0s1FfvKyFtWZy16d5oYvra8ss/zZQHcE+NaFzW8RQqJA
 RJPt2KfJCUhgK6sGgpAQ1sP/9yxXK+3y8mSW/FPeeUIriAaZrdNaGa+RJEHajta7iEl/
 cCag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nxts0ika
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-27
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

Autobuild statistics for 2026-07-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  4  |  0  |  7  |
  2026.02.x  |  0  |  1  |  0  |  1  |
  2026.05.x  |  0  |  3  |  0  |  3  |
    master   | 44  | 118 |  3  | 165 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 12
               host-dracut-111 | 6 
               linux-pam-1.7.2 | 4 
                       unknown | 4 
             dahdi-linux-3.3.0 | 3 
host-gcc-initial-arc-2024.1... | 3 
                     host-rust | 3 
                  iozone-3.508 | 3 
              jpeg-turbo-3.2.0 | 3 
      libabseil-cpp-20260107.1 | 3 
                   perl-5.42.2 | 3 
      docker-cli-buildx-0.25.0 | 2 
                  dpdk-25.11.2 | 2 
        edk2-edk2-stable202602 | 2 
glibc-2.43-45-gdae425b55420... | 2 
            host-go-src-1.26.5 | 2 
host-google-breakpad-f49c2f... | 2 
          host-xfsprogs-6.19.0 | 2 
                  ifplugd-0.28 | 2 
     linux-5.10.254-cip72-rt32 | 2 
                    olsr-0.9.8 | 2 
uhttpd-15346de8d3ba42200249... | 2 
             alsa-lib-1.2.16.1 | 1 
               binutils-2.46.1 | 1 
                  broot-1.58.0 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2026.6.1 | 1 
           crucible-2025.05.28 | 1 
                   dante-1.4.4 | 1 
                  davfs2-1.7.3 | 1 
                  delve-1.22.1 | 1 
                diffutils-3.12 | 1 
                 empty-0.6.23d | 1 
              erlang-26.2.5.15 | 1 
                    fcft-3.3.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
                    grub2-2.14 | 1 
               harfbuzz-14.2.1 | 1 
                 hidapi-0.15.0 | 1 
            host-autoconf-2.73 | 1 
          host-binutils-2.45.1 | 1 
    host-mender-artifact-4.2.0 | 1 
                host-odb-2.4.0 | 1 
                      icu-78.2 | 1 
            igd2-for-linux-2.2 | 1 
                 imlib2-1.12.5 | 1 
                  iodine-0.8.0 | 1 
                     kbd-2.9.0 | 1 
              lbreakout2-2.6.5 | 1 
               libcgicc-3.2.20 | 1 
               libepoxy-1.5.10 | 1 
                   linux-7.1.5 | 1 
                  linuxptp-4.4 | 1 
        ltp-testsuite-20260529 | 1 
                    lua-ev-1.5 | 1 
          lua-lunix-20220331-1 | 1 
              mariadb-10.11.18 | 1 
                  ntp-4.2.8p18 | 1 
                 octave-11.1.0 | 1 
             openjdk-21.0.10+7 | 1 
                openocd-0.12.0 | 1 
                openssh-10.4p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
               pamtester-0.1.2 | 1 
               pcsc-lite-2.1.0 | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
        s6-linux-utils-2.6.2.1 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 sudo-1.9.17p2 | 1 
               tcf-agent-1.8.0 | 1 
                    tcl-8.6.15 | 1 
                 watchdog-5.16 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/913b2eb85e2b82a97759dd9cca956da93694c05e |     
    i686     |        binutils-2.46.1         | NOK | https://autobuild.buildroot.org/results/af29fdc4e6202c743b9ddc6e7d45e5adb39dcccf |     
    i586     |          broot-1.58.0          | NOK | https://autobuild.buildroot.org/results/eae248ca659b74f669431999f42a9011ce44f09c |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/d1712f7db5f81bd4f3288dd9a98bdaf50a3e2375 | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/68e25585e010bbc3f058ce572444ad979c64d8fb |     
    i686     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/aef35d200e0d488d9b8b61476c2322018639f23a |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f26fabe3224d5f8160139515e6e1280d9e403c71 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b364b39d1f6180415e4aa8e1d6fb55264475180a | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a11e3d51e7d38f54b33454aa26e120a9efeac5d0 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/87a0edd09ecbb0582e490d9df85b009e987f0165 | ORPH
  aarch64    |          davfs2-1.7.3          | NOK | https://autobuild.buildroot.org/results/a65b7fd72e249d9c84907dbb4b9afb7d33cf6dc5 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/429195cbd2a5531310097a58d112fb1128415280 |     
    i586     |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/470bd6dde5fdd659c6f427958c3784d55dbe6530 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/780a8c16f2481e76e61756e3db9e6640f47a60b5 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/cb05127461ca65697fe4b36c71b31487eb380c7d | ORPH
   x86_64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/1c2465477ec628a2492a2d515da20c1fa7cbb5e8 |     
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/ceab5431187c165257dfd3eabdc1cf20e6cd7a80 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d1448b1d2e4f3f35e10983d9db576cb187fdade9 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/709598eba53ec727c2fe7f9c7b5014df47b2847b |     
powerpc64le  |         empty-0.6.23d          | NOK | https://autobuild.buildroot.org/results/d57e99d92d6081a2dc516213858f75cfd6890c5c |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/870fcbde72f1340ae729e346d30bafe1beb260be |     
   x86_64    |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/1300ae651a5fa3ac1597c1d91f6441defffa92c7 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/63f27bd9f7827245a7d5ac9ad90773d2c6bde01c | ORPH
    hppa     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/6a977a503ec3d9a203850806a51ca620bc2043c6 |     
   mipsel    | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/0ce8fddd06a8491c09cd4b5ef69886a7287504dd |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1e9a0271ad0d53fe2c163078ff0ef4fcd966c976 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/8860f8ec82a1795fd226448853d8ce36b4277117 |     
powerpc64le  |        harfbuzz-14.2.1         | NOK | https://autobuild.buildroot.org/results/386aa5e2a773e4d1519de0c2bef353cb25fe083b |     
    i686     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/6ce5bcdb3110d979cd7b961e8843c249a0341938 | ORPH
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/1fc094584a48fc6e6617c0d67d3a1ef6b8482fdd | ORPH
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/2530894489deb7f6360ccd8c51c9b92e780934e0 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/5eb93e10de72788efa17f2bec9e9930b808be573 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/2d954e8e897cc4bf1662ed04398f7ec21380ae34 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/eeba0fd63055bf18bd884d8b293ecfd60c871d86 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/c3280039de2079987bbaaaa6fdb97a2824a57f1c |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/2e8eedc1f9ecad8752d15267ce96b3a607fc2bd3 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/a61a132c6972b709abb833e26854bbddacd3ca95 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/c2262c6775f0b62a17a1181d1782ad954d3a4ae2 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/70e1d413a5aa3f6d6f438ce48654b2c7df02bbbb |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/79ae6b67a29f1be2080ad4510d392c10799f888c |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/dce8b5bdfee2445090e793d1f06dbe78e1a03288 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/6b6a27bc47bed83598d4033c6400179ba2703fab |     
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ef6d7883f4d342238e83d5a77420a9ae0d32cc83 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/67a55ac67aa0b3eaca23f824d6022f0c885fe55b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/43797261149ea4c4d19198af9b424ed5beccfd31 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/23bb43d089d4aa49542cc6c1dee63085b81023ad | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3d322e7207d1d0e53ad1605333cfea56ad4eec42 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1a954a91dd6051bd5454b903d251f45f65562e5c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/af3021539ea935eba5abc7752ed7d7e268823949 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/59703ae31054ee516ded8273f09ed42d43da1cf5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2c941944d755a4e651a7eb466c66d987ff8b94a7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0462364ca9345020bcd58ff0443d15cf97209a04 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/122698d6a69f1168062877b9e3180446f522ec18 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cb3b9cca9bd522b019c722ec43a191d1f41dc5d1 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/70191369346928b2ca64268560442c146e75292d |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/7de590951c99d1c29ee2b0ad5c202a3f0f36e2e7 |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/d17398cfe1ffb15e50f1d336092d389fcdd6954b |     
  riscv32    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7634d86ed2fc7a278d224112a0c8ba3888d2e177 | ORPH
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/35b2f3141a5eef7849d6370797ae9a594a34ed0d |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/de69d76698ac0e217b2071d7ab9903694aaadd74 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/85d1b387eb172017f4ccea22c88c2a7556e1165b |     
    i586     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/d191c1242a059902dae8b80b9c08985f0229e050 | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/7696ec951ab77cea4c41aef75e05e94f52104dae | ORPH
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/c2226565352e92feb15b5f8b4316f936cd0abff0 | ORPH
    arm      |          ifplugd-0.28          | NOK | https://autobuild.buildroot.org/results/83edb347967981c72808f25abaa1285dc79bd1e8 | ORPH
    arm      |          ifplugd-0.28          | NOK | https://autobuild.buildroot.org/results/efbbbc966bb09cbf3e784b9d7e6c783f42b07850 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a3d71c58677d2ecfa4f737ac5c45c7013d47b857 |     
    i686     |         imlib2-1.12.5          | NOK | https://autobuild.buildroot.org/results/c97ed5833461861f8a1a1a53aaddb82d25c0566a |     
    i686     |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/25db41f302b4e59ad6978f06e2ae381ba5cdca7b | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/6f6548e3f1e7b137f80e61c6163c476784ee5dd3 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/839f8b98bc6c45c87af2c20ba9a596cef20eb328 |     
    i586     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/95f7a7b605390e11b2791ff8ca26995549f4229f |     
    arm      |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/9dfff1d8c53eaba78463c2a863ed612e79024a2e |     
  mips64el   |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/a27647126b5b825edd6c45023c35aa930cc4e99f |     
powerpc64le  |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/d362c5b34e5f93b1c850d840304b682f531c72bf |     
  mips64el   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/63385c633265aec09de3200c5b2fff0103e93f87 | ORPH
    i686     |        lbreakout2-2.6.5        | NOK | https://autobuild.buildroot.org/results/8c1a9edda667be3ab80e68eeab07d341d65d5940 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/bc238c2eddaef7fa7e50de259c3173467fd16cc8 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/c95b9e0247ee236b4aa6c0efb9809234ba3ee018 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/28134b9c504df15712ec96ba42d6a755c16d6636 |     
   x86_64    |        libcgicc-3.2.20         | NOK | https://autobuild.buildroot.org/results/be064725d6c7cf115bea24fbb66ddcc2f2935493 |     
   x86_64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/0194c06768cfbbbe269b9b6753078c5e76c32916 |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/83e5b5592d333106d07c318bcb6b28b622c4667b | ORPH
powerpc64le  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/bba435b2683630ef92cd10bbfd7d6e6e1fa7acb7 | ORPH
    arm      |          linux-7.1.5           | NOK | https://autobuild.buildroot.org/results/8dfc4816738eb30ccbdaa648e21609f74fa76137 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/038bf069aa7d232280160d8be2475987312e2be9 | ORPH
  powerpc    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8486fc4a7f854868a75c912298d5f0d555664905 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/91fce8d322c895b6909d74450bcc6bb6d32eac45 | ORPH
   armeb     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/85d08b15406dbda8ef2a63401ce798a8d8b3b087 | ORPH
    i686     |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/dcf3f5785a1844381fd35510f8862348b95430c6 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/a73ba5da997ceb7a6a8721240d0163165609e73b |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/90c1ed951c764291aa5bd3aa46e8f3031b0f564c |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/2cd14a8ab9db787ef5ebbcb9eeab099ddeff105c |     
    i586     |        mariadb-10.11.18        | NOK | https://autobuild.buildroot.org/results/133aa23f9a3c1244c427d00861bb9cdc4e1e79e0 | ORPH
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/481f29062cba3d4c5fca9070e45e91c70d4cf48e |     
    i686     |         octave-11.1.0          | NOK | https://autobuild.buildroot.org/results/0b276577b3810cb8b9a4c43a1bb8cc7b5897dcd2 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/4a1d63f1b8e8064c7fac10405cef3577e350d995 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/bbcde6178d1e5045e0025748a52f0546961299ca | ORPH
    i686     |       openjdk-21.0.10+7        | NOK | https://autobuild.buildroot.org/results/262e096b7a726bac1dbd125ddbce67a0bc4b9160 |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/a59fd8f25a105710c0fb77ce24a0fc55cd9ce5b0 | ORPH
  mips64el   |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/b978e2123d3e5af68122b0d1cffdaaee01c62b94 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ecd9881e7d963827ef1656ceefec3651f2ce33c0 |     
    arm      |        pamtester-0.1.2         | NOK | https://autobuild.buildroot.org/results/93d39a0770cd110296ab6ff0c33c09f14394e39c | ORPH
  mips64el   |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/6a857d72436939a21dfd463c83f1ae3178c9442b | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/6617a7b1d2ee34ee625d6b5136992cc9401dc3a7 |     
    arm      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/fb5176218d05ea9aa3de08adfedeefd4d7624e0f |     
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2ee1da127d71a04e95d7c15236827a44e5db631c |     
    i686     | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/ec7ed5c1e41c75bb374b738fb1e9dd16cbb417e6 |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/a106ed6a9f59841ce1bc2d5c2685d6e53fadf610 |     
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/30f79964f0ace2d5043d27958bfb7ede12ccbc53 |     
   mips64    |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/7243875e2fe35562eba4d3559b6cf134dcc35878 | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/cc16d5cebbc75a6984dd16b3dc25bdf6582729c0 |     
    i686     |           tcl-8.6.15           | NOK | https://autobuild.buildroot.org/results/579ad4020392e6cebc8d46f159b01b1129d30686 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f592883fa71833520eb5f773c95154546c0e0e19 | ORPH
  aarch64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/d875744eef5d9d10109f5a61e8b8d3a81323ebff | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/5e89bce011955b40ded80bed461583bce13116f7 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c093d4a551948e91c172bd1ec9137252fbfdc877 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/421174aefbdcd296b3425406b546d08495dae7cb |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/feafead17cc63f3b1f46edd0c1882a5aa2e6e050 |     
powerpc64le  |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/44f0f47bb2fce4b7c041599fd5633e6c74e7d19b |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/88324657036ce9b11ca4f43fbde7b3aa4b18d222 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
                easydbus-0.1.0 | 1 
                   exim-4.99.4 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1f7d254f77b07fbc6df90bb13440c213ea8ba17f | ORPH
powerpc64le  |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/f5606d00f8876e098f72c284c72f6894db96daef |     
    arm      |          exim-4.99.4           | NOK | https://autobuild.buildroot.org/results/dbc236413030f26fae574f6e86ea24ca70175c09 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                  delve-1.22.1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/ba8cf7ea38024f5dcf98db6cccc9ca2fbd767dd9 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            ecryptfs-utils-111 | 1 
                memtest86-7.20 | 1 
                       unknown | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/61322763357d058988a996c0782c26cfcbc93368 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/78ef25743e55e5fd6d07290006d83ee0aee97805 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/11dc9f9cee676069e33e568f5d765d3a4eb2ac2c |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/d15e0034649205ed6dfca73521384e855aba0533 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

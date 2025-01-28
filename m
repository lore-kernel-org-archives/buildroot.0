Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D362FC0218D
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 04:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96586817AF;
	Tue, 28 Jan 2025 04:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tl9rAXEc_0Va; Tue, 28 Jan 2025 04:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B58A681E53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58A681E53;
	Tue, 28 Jan 2025 04:14:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 968A294A
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 04:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84DA940FA3
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 04:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWagXkeecTKB for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 04:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C95140126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C95140126
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C95140126
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 04:14:29 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so7552864a12.1
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738037667; x=1738642467;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ii+P6tKo+PdYzTv6NfHLK7C1pZ6KK63gY1lDIFaUaRQ=;
 b=kxdRIlQzJbY+fYjPd9UxlsoUEtHCTRxrqJursUVJdE8jpBfY8efBYwh2vSM7WyGqZO
 iuE5Sn9xlR7AmgE1vhVJrVQZB47tMmC+edMgCP58vvfeX1XjCOSQm0aD+D01UnVXhFJT
 vhKYWIXT4HEjwzHWYU3dBCs7zfBT7vmI8JhyDAwWA1mmEzrY+Kcmr/N/L3Y89IGFmLro
 JIuGGOwvCCTrmtvs9rdN21Gt3MSnpTvbeL4sKoRSNvaNuYP4GCoOR5i7q5w1MJd1+kNg
 JFqQoNfl+h8JBY7R6mpzcItsISbC7jKhUV+hZK1+gfjPUZvPxZwiyJ1qv86liH1ksxUS
 CcyA==
X-Gm-Message-State: AOJu0Yx6CpxHHWNozbXHbIvJs2v515eVMnTzkEvmzOHAlbrr/gtXxNJs
 U2Z1uQc62cnK9r4ErLeNLquUYTLA9xak+CbcNZjW4rbSiiiTeXIxPlKPgw==
X-Gm-Gg: ASbGnct7t7VWljVV/YzpCHXHtjf1xSq9qjVsXEGOlSJ+7D5c1Rw2Szt6IeFSFcGndTR
 iOzoEyaS0B6gJIomqvEEAWl59FZNY+AVuWkd+ruS7dZRC0lGpTPVWAS1KQYaVYcZW95kXSoSDnV
 AuGF6wwA4rKmnnL1gG76/ZAJTL9Qa2DteM2OFwYAv/Nduu4y92J/loeNaBZCZjAWpQf78F1zamA
 1fBZB2G8xXBrOOF1NDYmoG2A6ZEZH5ksNZPK541c0nFYv+N3Xft3MESbFj7KT8y1Ts7QEC4HkQU
 wsXsVZ/7SowyMEllGJY=
X-Google-Smtp-Source: AGHT+IGaKwo+XQJXvHSwMfRuGb/KfsR1zOKt14fI75Ce1I+ZExuPjsVu4CNHEhDq3wnR2GGwEGBeBw==
X-Received: by 2002:a05:6402:3587:b0:5dc:100c:1560 with SMTP id
 4fb4d7f45d1cf-5dc100c1768mr49353047a12.18.1738037667135; 
 Mon, 27 Jan 2025 20:14:27 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e63284sm705392466b.56.2025.01.27.20.14.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 20:14:26 -0800 (PST)
Message-ID: <679859a2.170a0220.4fd14.67e4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 28 Jan 2025 04:14:26 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738037667; x=1738642467; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ii+P6tKo+PdYzTv6NfHLK7C1pZ6KK63gY1lDIFaUaRQ=;
 b=KkSwT0eaq4NIu1x5PI827+2pXzG+NcD3JGzmXjmfNbxAzlhLN4gynUz710PwOpfUQA
 9YLKpLUjYAjpQrnQKoCPG8Rt9yekKVrJK9E8Egxt4Y+Mjrz4ECFa1AOhhvPzRC6pLKdK
 yuEwBoXHQcT1jkJrqxVocCVG0p0jHxUA5Q0WtgGtZOSLcXaOrhsjGoS4r8LMrn8L3Ct8
 aCodvHiyR4AFgo4aJhveq7t9+VvGs6/oBw88xOkidj39sVGDVHOz1l7AdD+6WuqePgQN
 w69rtCddod3PfMnuLWrYw89Ke5p1gyYYFyehQTbMEdVbYe0x7jKLqBdZHvlvmlle/g5G
 7mFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KkSwT0ea
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-27
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

Autobuild statistics for 2025-01-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  2  |  0  |  6  |
  2024.11.x  |  0  |  3  |  0  |  3  |
    master   | 13  | 50  |  0  | 63  |

Classification of failures by reason for master
-----------------------------------------------

             fontconfig-2.16.0 | 5 
                 linux-6.12.11 | 3 
       freeradius-server-3.2.6 | 2 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.82.0 | 2 
           libzenoh-pico-1.1.0 | 2 
           oath-toolkit-2.6.12 | 2 
                 agentpp-4.6.1 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                  bcusdk-0.0.5 | 1 
                 c-ares-1.34.2 | 1 
                  ffmpeg-6.1.2 | 1 
                   foot-1.16.2 | 1 
            freeswitch-1.10.12 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gstreamer1-1.22.12 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                libesmtp-1.1.0 | 1 
                liboauth-1.0.3 | 1 
               linknx-0.0.1.38 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
             lirc-tools-0.10.2 | 1 
                lmbench-3.0-a9 | 1 
        ltp-testsuite-20240930 | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
              mosquitto-2.0.20 | 1 
                  motion-4.7.0 | 1 
                 openssh-9.9p1 | 1 
                    php-8.3.16 | 1 
               pulseaudio-17.0 | 1 
         python-remi-2022.7.27 | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/5874f46cb84f69f769c6833d11aecacaf2d2b6ec |     
    mips     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/541ddca24be3ebd515207fe1e9012ba891eba00f |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5945b038feb5af1d852ee61bd477eb72092c2a89 |     
    m68k     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/e17270bde306d125072556cc1c2abdc2ecbd8406 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b175a2127f8269e4a90917e0eb316d04f93a3593 |     
  sparc64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/48fd0df6caacc95333508fe48daeca10c3e82fef | ORPH
    mips     |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/cc38846fdf63954422ec08d3ae57f2f09ebbf8c8 | ORPH
powerpc64le  |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/6aef28611ad05d8db65105ab150ae980bc6bff4e | ORPH
    arm      |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/e948e7e17e1697a31f2808a3d8f5204ae1bbb61f | ORPH
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/a16dfeb22275cdcb8e488651562c350b35a3982c | ORPH
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/bd5897c7121eec160874155b3fd7f886265f10e9 |     
    or1k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/bed5de8099ffe964684ea988597ba3a72b152ae0 |     
microblazeel |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/5ede172c8d359fdfa698967a1c3038d3974af700 |     
  sparc64    |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/d4e999c99a464c7634f807145727f9927164fdee |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5d1628bbfe92dbad704e119ae707a30708c78440 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/7b62fef932913055c197276730a9d2ff0a66cbb3 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/19e96bf46575d74d57fed67d7957ec299db868e1 | ORPH
 powerpc64   |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/727f60d6abe72ce4bef54b8a86863f325d7ee32f | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/44e3babf33ef955d13f77edd3afbd1a8e2e89b8f | ORPH
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/4e411e1ecf2b734da66c50ca93d439804845de46 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d5cb57cd90a341007591a1aabd2608c48b2ad03e |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/974a641f20d98b46adb36982744a0d0d2d73cc44 |     
   armeb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/3107546431b38a973f8baadd51b36d064ef67e99 | ORPH
    i686     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/6f95e8efdf3c963a135feb72a89123c14555912d |     
   armeb     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/ae109f1062219c2ce95d6aed1999c645abddbcdb | ORPH
   mips64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/c99215233fc7357f6be7e79eceafc5f14a54f35c | ORPH
  mips64el   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/eaea452541bbcc280f4d227203f3fe4e418727c5 | ORPH
 aarch64_be  |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/799d6246af7550e920a35230d33811d15a4050d0 |     
    mips     |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/aeff03f3849a672f69f729b8ec0526717b670a3b |     
  sparc64    |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/7164709c21dfc348bf6ee0246aa15cfb9b26ef62 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bfa96703e7a5a368662da6905a819946175e0f23 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a6b2f5b1542e4102b0d54294e3ce087aa5e5bdaf | ORPH
  sparc64    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/0e97f935ac0d3fe1035bf30086c8f960ec28a8ba | ORPH
   x86_64    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/a693e33a33e01e1203ae897f43b1688fea9118c4 | ORPH
    mips     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/cc71cf0a9f004f35dad150cbf594ce83fea11424 | ORPH
 powerpc64   |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/bec504bcf347c04b017c39e09a5ee90ec70acbf6 | ORPH
    mips     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/d91786970980ac882014ce4fd1dd9774a3acbab9 | ORPH
   x86_64    |     ltp-testsuite-20240930     | NOK | https://autobuild.buildroot.org/results/d67f83d6fdd267232156003d8c56de5a5ccf3c91 |     
   armeb     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/92e7d1b2609419afcab9f5cc5e1655e3618398dc | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/70507a0a4e5df8bff89064c18ec70a798a283dd5 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/3fb62447b1ad8a31931cd66cd42d4e0fbaeed4b3 |     
    arc      |          motion-4.7.0          | NOK | https://autobuild.buildroot.org/results/6f9d6a742dffbd949abcc4d231d1500f144e9fba |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/7565ab3882e626ece5c7e7657dd80139133222b0 |     
    arm      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/52e4e2b73a7ea8fbf7a9dd54856ab848f04874c3 |     
  mips64el   |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/8901e3c41fa181dbc4af4213da0eab6d30ccf384 | ORPH
    sh4      |           php-8.3.16           | NOK | https://autobuild.buildroot.org/results/232755de3dd61ea3c259a78340fcec9d76688494 |     
   arceb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b75df527a75b0200804827cd0b68d1dde2ff9f9d | ORPH
powerpc64le  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/adf09ec4e22c1ef0a203ed11f763540a34e6579d |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2af5628dc69f0b2caed94852652c9fd39f190b1a | ORPH
    arm      |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/0b7cc451c0d283291c9dee7ef0853faa929296f2 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-prelink-cross-a853a5d7... | 1 
                   httping-2.5 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/a2bbb77e50eaf195f5bb7b0b9dfb518e91382f1b |     
powerpc64le  |          httping-2.5           | NOK | https://autobuild.buildroot.org/results/92862d7c6df865dc702d4213943e11f33bd4eb68 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

esp-hosted-91b093365cc58214... | 1 
                 logsurfer-1.8 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | esp-hosted-91b093365cc58214... | NOK | https://autobuild.buildroot.org/results/e5cedead5fb76b147fc1368278264f2a82346545 |     
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/2671a12fafc1088ed2419904e737b20fdf2d4103 |     
  riscv32    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/886169ac81755f735a34f3b823f5def19e50eace | ORPH


Gitlab CI results for 2025-01-27
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290054  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290186  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291491  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291683  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291684  | ORPH 
                TestGoBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290501  | ORPH 
             TestGoSource | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290504  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290657  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290807  | ORPH 
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290869  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290872  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290944  | ORPH 
       TestPythonPy3Evdev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290947  | ORPH 
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290950  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290956  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291103  | ORPH 
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291112  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954290099  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291261  | ORPH 
                  TestXen | https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291268  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

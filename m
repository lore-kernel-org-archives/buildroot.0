Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E021510BA422
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 04:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A516782391;
	Fri, 27 Mar 2026 04:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fmXMKAt9q_p; Fri, 27 Mar 2026 04:27:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF49982538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774585655;
	bh=Qoxf73buMRVq8VWJh/FTKw93XoTUrPj7ZCMolDRyilU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TwXjUy9P79qx8DO7LU6iUGOAhUOpfpoKDy5R3gSr2P6nqxvYZ2SlMQkHqnIg5HNrb
	 HepucqdTArNEINPg2MLW/clpiKcFAnFZc4KwlpSLtxDTD/HVnrZVaSm0uYReSScSs3
	 Dqd2EhS5yR7MiqObIxATq701MRxeiA6vWBGEnBGJPHnQMrRTgIVpDcK590C6mzf67a
	 WchnHGQUJkFunuPVsrd2Am9ilFJPfZeK4Yz3UE2V0HRnfRWgHjSPmGw/IlVyo7myKQ
	 Ob635vwPmq7euRC2wI3ZQHmLlRKSNiwgr1slOA30Lv7NICPhnMsrNLm3ecXxPPpSoC
	 3zGbmX5ZRgEjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF49982538;
	Fri, 27 Mar 2026 04:27:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80B09249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 04:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E6BC40A62
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 04:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TrbSCrxFkir for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 04:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB8E540126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8E540126
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB8E540126
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 04:27:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43b40fb7f95so1446206f8f.3
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774585649; x=1775190449;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZFrCxg1AMezlBAJPaGSuQirFuvYRJTuqnoUW1tv3J6g=;
 b=X7qoI0RQN4OPoyZ0s8CMwCd9T/36VjUDsp0lWQJPLTbfyf9MpLdim/jwEcDb4PkJ/X
 zxSvqbjKUwrRDwpbTTB72GwJA1DkzwpXjRAlMtT5kLzjUnwB3z4szF2lyzMlksOZA8IS
 tJ6ePn1t3iEK5q616pyRcxGPLG19Q+lDAjyBIJxTyI/QcmsrEEPpwS+9Rf0PYaQSa9sU
 EKfCZi89rX7XK608GsOhCgY6F2TcFComnoUqCZ9UbPH6ZIdZ3TTqnt1sQ1pIf5+Bktex
 uDDeXcDKseY6TlWI0fVZuyvxr4jgBswL0KilL3dabOnp4DNJ7c3XtEwiMiED5rR2U0Fa
 0M/w==
X-Gm-Message-State: AOJu0Yx3Hw9IV8XM08y5+DddUg6LHfELU47o/LndWitX48VC74JT5myE
 48lS3ihvO00LxIzU1ETAaU/fS6Nnrt6WEG/AiK/PWY2umq5YGoaBmOHIFX6MoW4I
X-Gm-Gg: ATEYQzzIXh4ZSKrPwOekdJcxigCB0g4Iag9rDRIpq1Wx97RHQ9+306JoR5s+/aGqOGG
 bQE322U/oMRyaXwAchoSjS7lEnrSlfpeS2HxSATunqPFvSshW7OUY6yZFhgXVncdySgGKpE9bs9
 0bhhH82MJFlegvlpsfyLny5rSrnkeMOhA2URXmO7pX0CIWxRQC0djPW7ayBQDQAGJSZCJN8wVB+
 KjKQd6DhqbdhkESgG+rGemFR65Zjk6fu9GbaDggwM16gGMThPbCUVnzSrE5s0rynMdv1YSDskVg
 0bc1dQIU3JHIiLWjtVZAsVV5Fa9ujElZ6WQn72E6nmVcdNwOGUrffCuYeIej9J8uNGbGMJ93sW1
 o5I3iOsqx8bx2arYPnzUGxyLJq1wW9OB8QCDh9MN168XYyIDto4MorBuapcEJfEeb7DzETtboj+
 SfIY5FG5LDFwmLseNmpFjd/AI7Lg==
X-Received: by 2002:a05:6000:1a8a:b0:439:f5ba:8c2e with SMTP id
 ffacd0b85a97d-43b9e9ea08fmr1187571f8f.18.1774585648399; 
 Thu, 26 Mar 2026 21:27:28 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919dfb54sm12465081f8f.31.2026.03.26.21.27.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 21:27:28 -0700 (PDT)
Message-ID: <69c60730.5d0a0220.15fc5b.5d5f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 27 Mar 2026 04:27:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774585649; x=1775190449; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZFrCxg1AMezlBAJPaGSuQirFuvYRJTuqnoUW1tv3J6g=;
 b=g0j3Qg8RUCHl3YzUycQLOV93HizQHlLPKa3WFXfMKSpwK3F/Odr/QS+Qem56oTAEEt
 71AyKoQakWeLyuj9YbR+CavpAzSAHdpdabJc/Riwyv6FwYbBzesn/yVfktmxuBRHe277
 yG1H7Me9EIquECMUSdcpqlRq0gH2YDShid7x5c1HlOZvsb7J62nijKLYWZ+Zi83ZLmce
 dMuu1fqMtCx6cYAquzCzHm5wps28n/Y2sFOqrgPMIR8pvCUO9SylcifXIuVE5IAkgpGZ
 kqU45axw7hirqb0ZuQoakHL1Vg6Y9dl7fo07pEkBONlmCjrNZfaGfN97S5uxkGJydIL7
 ANjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=g0j3Qg8R
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-26
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

Autobuild statistics for 2026-03-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  | 30  |  0  | 40  |
  2025.11.x  |  4  | 17  |  0  | 21  |
    master   | 43  | 113 |  3  | 159 |

Classification of failures by reason for master
-----------------------------------------------

                   perl-5.42.0 | 7 
glibc-2.43-10-gc3ceb93dc4f6... | 6 
                       unknown | 6 
  gobject-introspection-1.84.0 | 5 
                  libnfs-6.0.2 | 5 
host-gobject-introspection-... | 4 
          host-mosquitto-2.1.2 | 4 
                flashrom-1.7.0 | 3 
odhcp6c-f19dd37fb467c9cf10c... | 3 
                haveged-1.9.19 | 2 
              host-guile-3.0.9 | 2 
                host-odb-2.4.0 | 2 
              host-pahole-1.28 | 2 
              host-rust-1.88.0 | 2 
                  libnss-3.122 | 2 
                 libzlib-1.3.2 | 2 
                 linux-headers | 2 
                 mdevd-0.1.6.5 | 2 
               openblas-0.3.31 | 2 
              skalibs-2.14.3.0 | 2 
uclibc-ng-test-132c6134d691... | 2 
ustream-ssl-5a81c108d20e247... | 2 
             batman-adv-2025.4 | 1 
                bpftool-v7.5.0 | 1 
               bpftrace-0.24.2 | 1 
                  cairo-1.18.4 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
             cni-plugins-1.7.1 | 1 
             dahdi-linux-3.3.0 | 1 
              dropbear-2025.89 | 1 
                  ffmpeg-6.1.4 | 1 
                    gawk-5.4.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 highway-1.3.0 | 1 
host-am335x-pru-package-5f3... | 1 
           host-libtpms-0.10.2 | 1 
            host-protobuf-34.0 | 1 
          host-xfsprogs-6.18.0 | 1 
                   i2pd-2.59.0 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
leafnode2-9543ffaf82406f943... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                libgsasl-2.2.2 | 1 
           libmicrohttpd-1.0.2 | 1 
                  libsepol-3.9 | 1 
                linux-firmware | 1 
        ltp-testsuite-20250930 | 1 
                  luvi-v2.15.0 | 1 
                       mrp-1.2 | 1 
                       nnn-5.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.14 | 1 
                    olsr-0.9.8 | 1 
                opencv4-4.13.0 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
            optee-client-4.9.0 | 1 
                pipewire-1.2.8 | 1 
          pkcs11-helper-1.30.0 | 1 
           python-html5lib-1.1 | 1 
          python-protobuf-34.0 | 1 
                s6-dns-2.4.0.0 | 1 
         s6-networking-2.7.0.4 | 1 
                 s6-rc-0.5.5.0 | 1 
             util-linux-2.41.3 | 1 
               valgrind-3.26.0 | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/aca945f80ea4684f0e06da261e6117b869500b74 |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/21b317489e91439f3b0ed8cfc86534bdb493831f |     
   x86_64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/3b80d3ee447610d25c6ef0540aef870029cd41d2 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/1621d8f30bcb5c9ee9414d8bc8892be58f14c9da |     
   x86_64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/24a3aaadf98c2db2cf4002e1833a1457304ea81e | ORPH
  riscv64    |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/422383ddb9b0faf46a681a80cce6d4bc6508ddf7 |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a7ab7049e4b1de616bd2cadc5942e79eba641a17 | ORPH
    m68k     |        dropbear-2025.89        | NOK | https://autobuild.buildroot.org/results/c53793366489ce6edcfa1a086313a5089c40c820 |     
   s390x     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/3189cc2fe1174ee40857af0bc4274d07bbfffbae |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/de0e42559c4b3afcb4736f8f16c0cacd89bf0671 |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/4f3d933293d852de0e33e3a5e482d7abc0b4a931 |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/234063be25cce0d666eb5c8afb33ebdc961d6c81 |     
   armeb     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/dabf692808526c6625d2615a9616e9ebe7db4ef5 | ORPH
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7aeb013b3f5e29cdce86c005086f2b6304398c0d | ORPH
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/030579f8b90e4cf28942ac50810d1aff4aa15757 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/1062e0ec5438f531829d5e47b4325ecece016638 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/ff43eec8a91944712cd77a81d92c22f00b1f02fe |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/6669e2dd952fa2c22f17805720c869df15015145 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/3ca9b3ed60f5c792eaa779acbd33329e59a76d1d |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/11fc6c4d633985d7f1dd5ba866e77111db75d500 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7caae686883daaf83068c0ce90f648d0a185261a | ORPH
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1af625b3e6ba89825e1a588920a42ff9483f1caa | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0ec0ccf296aa74772cec6787c3ed1b07853a9dfd | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/832e94bfa716c27e717aa94f08b1f150cf4128e0 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7da9d9e11c35d188c8cf5257dccd4b3167004198 | ORPH
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/41e7892eb119ddb8b4112143655cfa8f983ad5a9 |     
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/59f7356842cfb536f82e85172ec02d2d36b22c38 |     
  aarch64    |         highway-1.3.0          | NOK | https://autobuild.buildroot.org/results/2d1d18a65efc8c3831ebfeeb33a5b7992a701914 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/bda2e8c4747e27a8470b366bb5c589fa6c42e5e1 |     
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7e13408dbb8900e116e7435a8aeacd4d1464f634 | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cc61fd29bd19bb87310d87ccfd83aec42adf19cf | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/14ea5dafd62babccd1bb22ffdcda3ced9c433827 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5d151806963cf9a46c4ba3d60d2934bbfe5ba7bc | ORPH
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/6e3a96225bde6afb75de912918757fb50ae83139 |     
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9db19cd1adfc071927c31c7e0a25ca9fe6efca72 |     
   mips64    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/4c1e394abb91b8ec112be05778372e648e489a83 |     
 powerpc64   |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/7d99825aa5509f251ef668a052124159fac53a3e |     
  mips64el   |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/684c7d987dfc047ead22f3dc2d539c5b0abbb0e7 |     
  aarch64    |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/7a0575306bb1969918b6dbe51ca08891ae18f39d |     
   s390x     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/18a4bccbacf97f945e48d39943000492e22e9dab |     
   mipsel    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d1c409f2ce0dee7d92e47781f9c35623eeb27c67 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/702877cc51a873c77dafd49ad2a6ee8d51d5eac2 | ORPH
   sh4aeb    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/e5826e67dedaf58baf34d5ee0a2baad016b7db8f |     
   s390x     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/1beefa56a5e9d89089b0cb3c85f37d6a7a7b4c1e |     
  aarch64    |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/6e7424dd09eda6faa95ec781e331a46408cefad9 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/7fa66ab6c6e217e64d4bed370149e0eacbd5e989 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/6a0391ddfa42fc01616a86e8bbd6598ca2aec46f |     
   sh4eb     |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/7c84f9c369026699a80541d455fcb81f369a2f20 | ORPH
   sh4eb     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/dc52e9710e933bf044d03ce1aa9b50d93bca55d1 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f10d57b2861cdb49d4f95c44f435e4b50666fdb8 |     
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/cfe7f71b87f2806813d677dbdf8b735c2a68267b | ORPH
    sh4a     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/167533a2a03153b5dbd268d7a59795d63380370d |     
microblazeel | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/48c52fee2d12b2aa775b45943127d5d21d669551 | ORPH
microblazeel |         libgsasl-2.2.2         | NOK | https://autobuild.buildroot.org/results/a9694d18a11e75359a0f7fc5157ca0afbc3a0e2c | ORPH
   x86_64    |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/b385c017e6e8919197ad6a45b86884b830f6328e |     
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/c0819507188fbd13f435fb7d009e07df02a841fe | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/dc92e381c3efb0f24ae4d957e7c04988a304af75 | ORPH
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/53edd2c3b63b306081e6670baac1b39aa02e7639 | ORPH
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/e9770a0c707d4a73dae90a231bb96b6d7a592f3b | ORPH
    mips     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/0b2e2b632f2c4e5fd121818e4f592b273444fa20 | ORPH
   armeb     |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/5e57eaab0ea7326c7469628f769537d521c3bb6f |     
 powerpc64   |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/5fc293749d186e3e7bf04ec36571b16b3c78c189 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/e37c6a90f8d6475d32ff4a090c14a8ba07f68a97 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/1b8ae951e8dea3c48c3a1e21bb98035561979e56 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/b8b1f3605cf720f4f0cf634009a352f33b123b5f | ORPH
    sh4a     |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/2214e7edf946849e69c3cf356d15b2817f7288f9 |     
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f5f9ae3a32f6d4d9f325e5ad25a59732118f5806 |     
   mipsel    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/225d557d9da9a7af786ce18f4cd8f107ebef3463 |     
powerpc64le  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/d93edf5a080d3f5988b9ed7c0211d27fcccb5488 |     
  aarch64    |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/f4320c0e672defdfa045a007ff8967adeb83fcfb | ORPH
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/d1b7bb5bdea1c944302822e08eb17fd5b1377897 |     
   armeb     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/b106496706a43fcb8f8957319dc98313af0c0c9b |     
    arm      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/28fcaa113cc5171098a43e593aec657b59c04a34 |     
   x86_64    |            nnn-5.1             | NOK | https://autobuild.buildroot.org/results/87205cb6574904f84cfb86d57e46862e8720e693 |     
powerpc64le  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/aa6e8c63c536d9e3721fc11b374e4077817f5443 |     
    m68k     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/784a6a29201cee343c49bc41a26a035e71ee3ac9 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/3a84d54a7c3af21c507d61d2920ce6b600596135 |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/faf277ee0f8746c27f8684b2f31e08c3a0a6e5b6 |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/7a7292a3c9b6e171ff560c6c323e11ba8ccae0d7 |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/8e6a38f8b5127cedee890258b616806636ce864c | ORPH
  mips64el   |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/ffd58ce74052c0ad8be15888123a63aa26d7b86c |     
   mips64    |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/c4f3540d22b7c67dea642fb712783c83205ff3b6 |     
powerpc64le  |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/56214286671e55585cb8c5e916b6e9f2f11fe17f |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/c9fdf00a772e0077052189a3d86e2668ebe06bea | ORPH
 powerpc64   |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/da99299f9631741c8dde44dae1767cb619eb0dfc | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/0233de9191c36a8c7f68e99096a989974024b3ec |     
   sparc     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/333a63fa2fe8728df2a62f054e87539efe9477fb |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/15e521f1a74fcf3884447a47c267df0db60e7d2c |     
   s390x     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/39b1b174c99262d1f31cb4bd8fa56da47c5a6d39 |     
   s390x     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/82198cdf2a69ced861ffcc7957c665fab02ea1c9 |     
   s390x     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/bc7d6c70417e312d6a5a6a83f9983acef2dc56a3 |     
powerpc64le  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/cc54a8dbc34ae109b08b7f6c3393955353b57e2f |     
    m68k     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/7a1bcb9471ca6081e38f3fc2422a5868c31d06a5 |     
   sh4eb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/971fdd9405fec753213430b95a8e45f16b16695f |     
    or1k     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/9c0a0c2bb4ee7fcce3e3b9bf85e5d0a7245d8651 |     
 aarch64_be  |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/033719ad3366d1925c0366999deb04c0db9cd93a | ORPH
  mips64el   |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/a46e3db8c2298ad4e503d5d4b44c9c0a93819258 |     
   mipsel    |      python-protobuf-34.0      | NOK | https://autobuild.buildroot.org/results/f824d32ce043c5da1ee74c02ed672e344f4e0b11 |     
 microblaze  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/ac7f9ee888898dcca05eae36e5b0123cc60b5ba1 |     
 aarch64_be  |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/310e48e14df27a43413e61f0eae2f8cea7036dc6 |     
 microblaze  |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/a93dff7554990ba2c95df2599ecdf009dee9d127 |     
loongarch64  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/189e1f074d4ce9732e0b79466cc30729782d752a |     
   mips64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/34769bf75a2f681bac9aa0581953cb28d0cce7c4 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/01836b192a4381ea7ce34f2ca06658547f49e25c |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/3c735cd001698d142bf99a89d63f2256e569dd37 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/e46d6b58c276cf908930fdb3158eca9a6eb1ee7d |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d47c5901bfa37886ba48ea142118ca7396acf0f7 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/b4eb3dbada295455174078216adcba6066a4fa7d |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/97516ad368fd7f06bb775ec5f2d28dc0e8eb0c1d |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/75ecb1deb595d467d1e998142b812a66a56f2639 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/084c6be56b48168d28fe15ef678baaa57dbba20b |     
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/e3f67e390a3ba727410a948c1955bd021e2a1d41 | ORPH
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d3e7cd33860d8c1517685fe0190efdaadcee534c | ORPH
  sparc64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/309c33992101776cbea9b6a04b18dd4727eca730 |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/21bd659836ecea05a85f78e19d02d29806e58a57 | ORPH
    arm      |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/1b458c264d995d0f305c4f28373da00c895a3ba2 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

host-gobject-introspection-... | 2 
leafnode2-9543ffaf82406f943... | 2 
package/linux-headers/linux... | 2 
           dmraid-1.0.0.rc16-3 | 1 
 host-softether-4.30-9700-beta | 1 
host-vboot-utils-4b12d392e5... | 1 
                libgsasl-2.2.2 | 1 
                 linux-6.18.12 | 1 
                  mender-3.5.3 | 1 
                openocd-0.12.0 | 1 
             pptp-linux-1.10.0 | 1 
              tailscale-1.78.1 | 1 
toolchain-external-bootlin-... | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/f7bf94d257c87070e6552b4be4e202ba85633ffd |     
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bca321db0916018b02891533a094edded4a82460 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/08e8c04cda52b29d5284373d2aa356f29ee17ae7 | ORPH
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/e649ab531b4639098d4658d8f21ed2d557dd9c26 |     
 aarch64_be  | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/8c8bde508869b7ddf0682e4818bab693db3939fb |     
powerpc64le  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/cf308f11b8802bec623d06a81181e903a370c166 |     
  sparc64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/6b9f929307e2d0adc4f890cf87aab06e72047bee |     
   x86_64    |         libgsasl-2.2.2         | NOK | https://autobuild.buildroot.org/results/05a6ee558aa4bc41e184c8ee2b98be05b461e6ed | ORPH
loongarch64  |         linux-6.18.12          | NOK | https://autobuild.buildroot.org/results/1bc2a013b008f25727da36e5791665094cfcc294 | ORPH
    i686     |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/b82292174a42b1b45840aeb90c91ab80ce86401c |     
   arceb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/4fefe11900c84d324326ab682b02b317727c7bb8 | ORPH
   xtensa    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ae98a63eb16fd733746b3ac906b648a66cd4d15e |     
    m68k     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/a4d3a5f02ce569dd86987463b54ffc0d2d917a7d |     
microblazeel |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/bf057f484bf1837e7424e48a42479873d784e857 | ORPH
   s390x     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/6a1692c22dbdc88138b41b6dc2bdc59d3c0ddce9 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/92fb8774bf1a530d38aa5f99725a6de084c0f626 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1c6cc2e284fd084ab9ca6e92fd6615b882a1624d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-odb-2.4.0 | 3 
                       unknown | 3 
          host-faketime-0.9.10 | 2 
                libcurl-8.19.0 | 2 
                 libmbus-0.9.0 | 2 
           at-spi2-core-2.50.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                     ed-1.20.2 | 1 
                    fcft-3.1.8 | 1 
                    ficl-4.1.0 | 1 
                      gdb-15.2 | 1 
            host-binutils-2.42 | 1 
host-binutils-arc-2023.09-r... | 1 
              host-pahole-1.27 | 1 
        host-python-lxml-5.3.0 | 1 
              host-rust-1.82.0 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
               libgtk2-2.24.33 | 1 
              libopenssl-3.4.4 | 1 
              mariadb-10.11.15 | 1 
                memtest86-7.20 | 1 
                   perl-5.40.3 | 1 
                pipewire-1.2.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/0ab59fb7841f0b8c326080f53ddd9aa97b817a88 |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/8cf1e79b4c62fb817e0e05584c4f3f2b8a8b48dd | ORPH
    arm      |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/8946faa21dacac749e17b3095b01188e58a4d042 | ORPH
  aarch64    |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/5af79d7b97eeb296e942ecee77d7778c9486ab23 | ORPH
    or1k     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/b25428c3703d8ae3daddb6e7036a351464b1c8ed |     
   sparc     |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/9b421947772bb74fd1fb3baaa1c8b5786007d4b9 | ORPH
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/235020a7e3e03b2c24df2d95e3a63b3b7a38b255 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/03db95b3e584340892b3062210e3ad0db39d7091 |     
   sh4aeb    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/a45fcc64a3caafd1c6ce943530d2c91c39ced4e0 | ORPH
   arceb     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/788561b881358a4ef8e655c4e1f6f50cde87ae87 | ORPH
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c44729d906316edd79a1a37886ea46e54d7e2920 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/265581f29d03f219564bd19f6b74ac72ba553079 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7b224104b9b5a0715188af4c52bad88ff22e1bb0 | ORPH
microblazeel |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/453a6ef78b8d88de6bad3ee8a5fa3195754b7cb2 |     
   mips64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/d9b3f37d4d0e1aec7e177ebbaccf8daa4558a0fe |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0a7fb5af10d0cc65c259f165b5042db883f39057 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/af7ea3b1e3fe9c8c8985f67aed14b1a2c63896d6 |     
 microblaze  |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/23f7ad5e9a94bbd1d72f90a2b85b28b827ff0ef1 |     
   mipsel    |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/2290fa620980bbb35728425dcd82b0a69c13548c |     
    or1k     |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/f31adb32bfb311febddebfe21d5c1884622e4c45 |     
   s390x     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/c678ed4219c23a86e71ad0f0a20ccd6781b5b4de | ORPH
  sparc64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/99f99786437170b4f2176d22f9d84c06ffbee278 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/9bf9f4a67b6b4249ee9125449e1d623cf68bd143 | ORPH
    or1k     |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/d9899fc919a5fb299f3e7f140ccac24739de394f | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/6a97e8c5ae88bae0661eee338fe003b775e84b82 |     
microblazeel |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/a377cd0ad5079fb524bd1dfe3ffb8a8968b9611d |     
    mips     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/486e163ec7d08e1f6bc96fd68519d887829adc6a |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/b6e9ad9c452850f0cb489a02d7515397196a573f |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/76dd65012c68c4b00f653d1027ac79de0a542475 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5013fddebb6b6bbccf6707db9a51b5648f5d082a |     


Gitlab CI results for 2026-03-26
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634482266 | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634481633 |      
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634481466 | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634481318 | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634481250 | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634481209 | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634481142 | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634480952 | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634480826 | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634480617 | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634480350 | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634480262 | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634480101 | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479853 | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479546 | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479470 | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479372 | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479272 | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479229 | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479217 | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479192 | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479110 | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479095 | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479060 | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634479028 | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634478938 | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634478831 | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634478708 | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634478329 | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634478230 | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634478098 | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634477930 | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634477019 | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634476434 | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634475984 | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634475483 | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634475306 | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634475187 | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634475076 | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634474909 | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634474551 | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634474225 | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634473718 | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634473479 | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634473305 | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634473178 | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634473057 | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472985 | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472919 | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472887 | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472834 | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472769 | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472744 | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472726 | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472647 | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472589 | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472506 | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472483 | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472425 | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472333 | ORPH 
...tlinS390xz13MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472209 | ORPH 
...90xz13MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472121 | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634472068 | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471972 | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471948 | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471893 | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471861 | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471809 | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471744 | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471734 | ORPH 
...cv32ilp32dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471700 | ORPH 
...p32dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471636 | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471506 | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471487 | ORPH 
...scv32ilp32dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471434 | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634471306 | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634470170 | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634470110 | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634470047 | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634469985 | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634469946 | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634469874 | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634469844 | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634469767 | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634469616 | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13634469541 | ORPH 
...onPy3SdbusModemmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/13615922958 | ORPH 
    TestHostPythonPyfatfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13615920640 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/13615919321 |      
         TestHostPythonFs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13615917595 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/13615912800 |      
           TestPodmanTini | https://gitlab.com/buildroot.org/buildroot/-/jobs/13615912313 | ORPH 
  TestPodmanSlirpNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13615912270 | ORPH 
  TestPodmanSlirpIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598976286 | ORPH 
       TestPodmanNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598976283 | ORPH 
       TestPodmanIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598976282 | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598976233 | ORPH 
            TestJailhouse | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598976033 |      
                 TestFlac | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598975995 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598975994 | ORPH 
              TestBitcoin | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598975957 |      
                  TestBcc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598975955 |      
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598975948 | ORPH 
                  TestXfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13598975884 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

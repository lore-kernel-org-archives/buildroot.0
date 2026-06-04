Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A21CD6E4A
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 03:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCE9442B54;
	Thu,  4 Jun 2026 03:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id os1astgaWM9f; Thu,  4 Jun 2026 03:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88DF842B8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780543337;
	bh=A3K0OGPk98N24Jou5ZulJqL1m5UOLroZWzzuTJ4AHgE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MUkhCDpI92Q7IvZQ6/a15lZuhNPRtaqyJ9CBbqtYz1r664MJAOvmoZVO14apjx+Hi
	 fe4pNj8osqU8DnWgvmsKE8XFTwai00aypYWOUlWETU+5pKsjibDi7/xvRUjnqnhJpc
	 RLTqjjxqXCISkBaANikM12j5rnrwbX9gq/DK3kEC/lteprc6BpTggtzr3isl8JSe0J
	 vtOJIzS8yTPEsaSl2BnrS0V6j+F6+hgYLsiXkwL3/gAkKXBPAsMjaY22ki9eglcYR1
	 hiv9tHaa4DBQfVAlFoyOdGh5qBP5Z4JgCCaSpMxRvF+wP4Os9kYYG47bbooFnRazQj
	 0tDTZMmvrZpnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88DF842B8A;
	Thu,  4 Jun 2026 03:22:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23563DE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 03:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 090AA42B8A
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 03:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkELxv1lEAcs for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 03:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32AAF42B54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32AAF42B54
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32AAF42B54
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 03:22:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4903997fcb5so1456135e9.2
 for <buildroot@buildroot.org>; Wed, 03 Jun 2026 20:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780543332; x=1781148132;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RcQ1xW+mb1+GxxHbD6qn0WI1Cg6ghgdYUi+AGRbjiFE=;
 b=s2adN01bCrNHyCAxy4jTwxpSXdIf1NKTeeL6cB0gHCj90o1euk7QPBpxXn/gZHjhhx
 JfCu8nRX1GZPN1x6wb+bShx8vY5AmZtmBnhC8O39ge6KF98P6cVXs4+FHSqlGGnqojQP
 OkhHiLFwjHncVrMW9gKJH41mmmrX1552rxLKGp9vvAbT9Yt47yeOVaO8Vyrh/yKUWF1t
 Q6KGZ6DK6iuUCPRAh9mE49MsTw/YWhp6tXXeDrNIxe2P6v80vI4S/Uo3B+ddOOsX8fLH
 C7IJoocvMIQV3zqUjjAx0XWMqM57B+Lm+Ldq46uMKT3EIJW7Ei5/kWdV/4n+Gl3bkS/E
 fnzg==
X-Gm-Message-State: AOJu0Ywt7l77Xp2UdiQnoVB64OtXroAqw5gHe1W1PDfZbdSrBYMVc/jD
 aPBmk0Kww29CWHu4LW2HUw0O0yfkUEGKXWnZB1EBcn90HYPMS7da8zzm/vRf6bMx
X-Gm-Gg: Acq92OH6/t1Aqoz6P5C5fc8Mw3sNCT0bsOm1f3ta8Fvr1gx60bGUsva7hl1WJz5pFPZ
 pTv79sUTsGWI8fE0Sqi5dW9sV6/8grLGbAhI/PewWOwD/gj8/wqDLUXsmeSku0U5FOoRJYPE7fg
 pH0ghc96s6aY+ataslzEAPof5c0pLMgqXPPBKLfADPXzpTdyE+QAur+xuPmu5ptCDopJ+4NQhGy
 Mk+dS556LCDZ2YvuNoUf0uaRFesjZ4auymmvZf4fGOEwiT7P2qFFlY3ZILDBjPIuswDfC6a5BT7
 B8BgZPaGxMFEqAAor48boC1FfmTFtV4AAheIse+GBc83E64P7RPGjXspgW83Djemvl2Zd8dlQqV
 ngykHr0hFIkuHYkkiRftVK7tneqB68fRIZtc5wNaJ/hVHfggaE2uTBlUgc8lwH4rQHAAH6je/EN
 Ez54OAhEzBz7WofOQcU4ehauNmhYkTHjl9tffH+aPlsoN2cO8=
X-Received: by 2002:a05:600c:350c:b0:48f:e230:c3fb with SMTP id
 5b1f17b1804b1-490b5e95f97mr98355205e9.33.1780543331490; 
 Wed, 03 Jun 2026 20:22:11 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bda4fd52sm22880135e9.0.2026.06.03.20.22.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 20:22:11 -0700 (PDT)
Message-ID: <6a20ef63.5dfca4bd.ce6a0.8588@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 04 Jun 2026 03:22:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780543332; x=1781148132; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RcQ1xW+mb1+GxxHbD6qn0WI1Cg6ghgdYUi+AGRbjiFE=;
 b=fhS2oKQZ/06c1JhQNGAJleibnC3BIE2eKFWQr+ouW/rt52nHiNK5npAAxou1cMlP3V
 +mbSztttjb7GqtGD0lwkVybVzyginXBwuWcuHuOtvA59cXoMafooogQWR3TdWYpVsMbL
 QBDDssnZHnY2PUXScyi8VIxZ6PNwgAL6UeSp8NDLrOFs4dG0Vlm6cyLVS1ERGZqkix91
 pVpFvBp1wmZHc5OLSt9x+EgdX2axtj1+hz79xFxEtlXqxohDt6ew0v2iHFUIWUAiIp9X
 5k4HcCHCVqzOASmWIDtGZ00rAfGbVruUh0/YLUt+WxL88v+p6ywqYALDwRnlJGkyMurU
 O9Wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fhS2oKQZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-03
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

Autobuild statistics for 2026-06-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 15  | 25  |  0  | 40  |
  2026.02.x  |  4  | 11  |  0  | 15  |
    master   | 50  | 84  |  0  | 134 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
  gobject-introspection-1.84.0 | 4 
               linux-pam-1.7.2 | 4 
                  linux-7.0.11 | 3 
                openssh-10.3p1 | 3 
uhttpd-15346de8d3ba42200249... | 3 
            host-go-src-1.26.3 | 2 
              host-guile-3.0.9 | 2 
              host-rust-1.96.0 | 2 
          host-xfsprogs-6.19.0 | 2 
                  libks-2.0.11 | 2 
                   linux-tools | 2 
                  stunnel-5.78 | 2 
                 sudo-1.9.17p2 | 2 
           alsa-utils-1.2.15.2 | 1 
              containerd-2.0.7 | 1 
                   dante-1.4.4 | 1 
                  delve-1.22.1 | 1 
  distribution-registry-v3.0.0 | 1 
         docker-compose-2.38.2 | 1 
docker-credential-acr-env-0... | 1 
                  ffmpeg-6.1.5 | 1 
              fluent-bit-4.2.0 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gnupg2-2.5.20 | 1 
                   gvfs-1.57.2 | 1 
               host-dracut-110 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
      host-policycoreutils-3.9 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
      libabseil-cpp-20260107.1 | 1 
                    libev-4.33 | 1 
libfutils-c326ce0cc2a735438... | 1 
          linux-5.10.254-cip72 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                    lua-ev-1.5 | 1 
                  mender-3.5.3 | 1 
            minizip-zlib-1.3.1 | 1 
                    olsr-0.9.8 | 1 
                openocd-0.12.0 | 1 
                   perl-5.42.2 | 1 
               pulseaudio-17.0 | 1 
       python-autobahn-25.12.2 | 1 
           python-zlmdb-23.1.1 | 1 
          qt6declarative-6.9.1 | 1 
         s6-linux-init-1.1.2.1 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                     shim-16.1 | 1 
       sp-oops-extract-0.0.7-1 | 1 
             superiotool-24.05 | 1 
               tcf-agent-1.8.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
             util-linux-2.41.4 | 1 
               valgrind-3.26.0 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/9c28463fc6af41840cb4b78d8a3aff5f17181050 |     
powerpc64le  |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/05dcb4ce8241c6641916f9ffcf88f2f6fee6a5e2 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2d1ae717fa1420848050a4e718cbee9173390346 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/3b331beeb47134b4449b4ad9530e1bd92823874e |     
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/d60f58444193945fd08daf1e12f9cc71ccd53e00 | ORPH
   s390x     |     docker-compose-2.38.2      | NOK | https://autobuild.buildroot.org/results/61da25764102f1b6233ab3ea8ea1cfcba5e96068 |     
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/f43523f7abedab75dbe75f7fdd13920e6f239e41 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/9ec081dfe055b229f4f368b9628f9d7cf0af7c36 |     
   armeb     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/94084a61cf4912a22d3338430ec08debdf94a14e |     
   armeb     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/6d980e98b74c6f337e277a2366bc5a94d6b914fc |     
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4edcd7d6e81665325b83da5362de64568a4103bb | ORPH
  aarch64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/02ace3f0436e51b60480394f11e4a1b0a413a3a6 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/621745a3b04177b9a6f7b7d253209998e70930d2 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/74be93580cf223c9b1ba345572004b092bec9e84 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e5e44c8c97fbf2410121aa28b404d7cfc70e8ede | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c8d39be4b455c4c06a4839a84ba27b4922522c3b | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/0c028faab5e77843a256ba7dc76e34bbea416df5 | ORPH
    hppa     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/e03c1c00f269c8e014f4ebdbaaca9f6f65da9dd2 |     
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f6c40c52b4d74d616d471e5dab491b416244f9b6 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/93012aa461b62b5ab05bc912d295708c3815610d | ORPH
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/e17e0dcd36d56fe1fb83d2d413188f5a93fcab6e |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/b6eb267394c886ef38d41fe51314919ba7e7bbe6 |     
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/07ece7f624975323e8c136397e63b90b8807c080 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/4dd7d1b8a0ad4c00d87a7b602b163e1d0e87669b |     
powerpc64le  |    host-policycoreutils-3.9    | NOK | https://autobuild.buildroot.org/results/e52e872f022778c91db392e5a3833d634ae0e659 | ORPH
   armeb     |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/f448ef8bf36f28c08faecd7ba5d7fc1101448103 |     
   armeb     |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/a0f8ffb6a61d4b10f709afbcb882a9367f57e22d |     
microblazeel |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/b31654b9d124780188018853b46f19520bab8bc4 | ORPH
   armeb     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/be9226e9ee2fdb9a50258654ac05771bdff13e9e | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/a7241947be5d5b4b22d49cb190e261d6cda6319d |     
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/47cf4c803e46d492ced53d271b72c7366d4f0821 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/dee6cfbb1a8f5c43816225b508e589253c4f16fc |     
  mips64el   |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/6a5ebbc7b913a5467e3f48ab04777dc5a363942a | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/668761fdd3eece13b23666524592fe59928e355f |     
    i686     |          libks-2.0.11          | NOK | https://autobuild.buildroot.org/results/77dccb10ca1e422b8d8817a654fe5618ce5b2650 | ORPH
    i686     |          libks-2.0.11          | NOK | https://autobuild.buildroot.org/results/b0a055b327af14e594530c054b95cace5fac6fed | ORPH
powerpc64le  |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/a6905866b7d87620763d35070c3ce91c4698d502 | ORPH
    hppa     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/b8f78be340a982a2fda3c0d890aad7197b63399d | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/7a5e0017196a13fe403e10ddaf1823a707bcfc15 | ORPH
   armeb     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/fa1fc1940c51764e4cabc1f350b711fa45795662 | ORPH
    m68k     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/229b6057dfaf5f85d46505f61500883499136c7b | ORPH
 aarch64_be  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c7afae0bfd19e8cc8dff0656a3fdbe4e40c3645b | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/9ff39ce0d7f29fee9a393d20681bc543bebd1333 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4667542c68d8e84cddbfbb83b6561345ddaf4724 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e999a291ef88735ed2ba5481cc6eac946b467d98 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/dd01e58a558af714ed81dcb7a5519ca8c8124172 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/957108230ff047bfa089d8658c6e85f47559411a | ORPH
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/b00b03346912e54802c224b48cecf5e2dc21ede0 |     
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/08063c57c4584c8382d4f9028ad0a043eecbd476 |     
   mips64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/3d3ba10800f85a09b455ab211f6097b7e8aabbe3 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/2823518ec786a9ecf7e3663c4c857a0a6bd1e782 | ORPH
powerpc64le  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/93d7d3e7a92e47e9fd3959e030eb208b26961510 | ORPH
    i686     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/1ce293c6d1507bd9140b82478748e27d1daa78f6 | ORPH
  powerpc    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/8c7eaf9d0495b0b4853c1a4c9e6251c63f2e5616 | ORPH
  mips64el   |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/b1603ebf5e4900d91c1cc281fea8a3ee57448a84 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/6fdb112acbad9dc03ab34b3c9f7973a26b8bbc88 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/3d0766fc74fba7612a23fbf8d791d19659d26877 | ORPH
    i686     |    python-autobahn-25.12.2     | NOK | https://autobuild.buildroot.org/results/47ee787cd7168a0a4320c70920dbc1dd81479757 |     
    i686     |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/850e7e643568222b15cf4ffadcfcc30bd66a9ade |     
powerpc64le  |      qt6declarative-6.9.1      | NOK | https://autobuild.buildroot.org/results/8870274278c7ddc5bf7ff1b10d6ca94539fdd2f5 |     
 powerpc64   |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/add260865915dc62974328665b5cdb5dbbb91f83 |     
  sparc64    |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/0bd7752566d1118ba190a4e4afad2742c8f8b3da |     
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/a0cd06cb3b6ebc5e73e2f69f000fe69001df52ee |     
microblazeel |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/43d138582330322bead009e69e1097df7f9f4f2e |     
    m68k     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/ac8b1f2a955698e812fa7f766da8bc49516f447b |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/ca4bad00888870ebbe9f8d38d39180b5131c210f |     
  powerpc    |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/2790a32ac3353cbfe1eddbf5437c74611bf6ebef | ORPH
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/5408b7c1d329bdb569427f4c4404dead5d218977 | ORPH
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/b5480b669aba8f4993d8efbd278bf1e94e3593ef |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/16c73d0fd5216c7103a737d16325429cffb548d0 |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/f46c1554aa0ee818828776f94328bc98d7f6487f |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/0e4d910a2d496c2661878fe856d31a55cc29050f | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/ad7023cd7bca3479b97ac75420ea8b1003d9e01a | ORPH
   armeb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/758a9edd3541a87a89f554fc41d4b0eb174867b6 | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3342cc0afa731feecf36e670959877f563c370d7 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/bb7e530884392c2c9953ec86c500bdf62026f26f |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d882b44172a0150d813101e965829a82c0d023e9 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/33b42991dc2e48f2864a62f90ee4e8fccfa93b61 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7562e0395d76aca0f55980e6cc1353d981ee5dd3 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/56a092a0f69a1864acde15f4172af3dff980702c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/17ea3324f1a7eaeb193f9bd5dcc63a593d6ec6b8 |     
    i686     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/520138828a70aa81455555d8956ec6dd1bd6ff5d |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/5cd9e997ce001d554ee0c993d021aabc88c5c06a | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/d5a726a42384442b3fd2f4e36ce3d8ebe2287b35 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

         host-gcc-final-13.4.0 | 1 
                 lcdproc-0.5.9 | 1 
              libmodbus-3.1.11 | 1 
                memtest86-7.20 | 1 
                  mender-3.5.3 | 1 
                       mrp-1.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 sudo-1.9.17p2 | 1 
                 systemd-258.7 | 1 
                       unknown | 1 
             util-linux-2.41.4 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/11bf962abcd9b42807343689d345df23f0d8ecaf |     
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/0f6752732c027b7a0dcf3213733cc0ab5d3cac9c | ORPH
    i686     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/dac81f83127a5c951caaef64088f0f1e3ed25a3e |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/2d6a12333330b93234714ddf30d7959e6f14e7f9 |     
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/93769c543d7cd59519439288e7b5a27cb4503563 |     
    i686     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/d32135c1b1a1f136911bf1041ff630b81d265500 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/32694ffc5e02c4d0e53bf9d83e1660b8db9c3129 |     
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/3ec3127392e49a0bf5037dfafcf11d53fa91e521 | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/daa44cf4d1ce21bd9bc07e7bc26954aa1b5895b0 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/ef4623298e54fff3e204b7a45129158b86b4e212 |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/d757da12b22d1dbf30b01676db12265772d2b04b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              libmodbus-3.1.11 | 3 
        ltp-testsuite-20250130 | 2 
                memtest86-7.20 | 2 
package/linux-headers/linux... | 2 
                   exim-4.99.2 | 1 
                  ffmpeg-6.1.5 | 1 
                 fwts-25.03.00 | 1 
            gdk-pixbuf-2.42.12 | 1 
       host-gcc-initial-13.4.0 | 1 
            host-go-src-1.26.3 | 1 
               host-ola-0.10.9 | 1 
        host-python-lxml-5.3.0 | 1 
     kvm-unit-tests-2024-01-08 | 1 
         libhdhomerun-20210624 | 1 
           libmicrohttpd-1.0.5 | 1 
           libzenoh-pico-1.2.1 | 1 
                     pound-4.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
       sp-oops-extract-0.0.7-1 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/e82575acf9e95359677176de138a76d9df9f290e |     
   arceb     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/58922b10adb4f6b9da9a5783bec406bb99750125 |     
    i686     |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/e55d45121f34dda6e4a873d7bec35eebf145cbd7 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6bcd1548281bcda5095df40eff0b2b7971b91bf6 | ORPH
    arm      |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/bec5b31af23d5dbfbf2c5e731b2a7bf23c83798e |     
    i586     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/5a0c0a3399f33f5c1f2819c2dd6b085e2337d55e |     
    i686     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/bbce437673131396b4e997388f17df5a41d385fb |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c59f2f87ce62bf9b6065f864f9531d0632561fad |     
    i686     |   kvm-unit-tests-2024-01-08    | NOK | https://autobuild.buildroot.org/results/ce5ae41f613e91f995ab4a4cbddb213ae3101e2c |     
    i686     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/cc23a48d3e6c9dd574b75c2b97886be88cd21a31 |     
    i686     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/6b325233dad198992d7a789ee4608a9d5c59c378 |     
    i686     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/c1504e202e337685c84f6cd23c7793d9430dfad4 |     
  aarch64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/ec515e9e6e208f497d1b1bb5ec5e302f48253b60 |     
    i586     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/ce5b1142cebac5808ad57378c17651d3298b7eab |     
    i686     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/91b342ef8510041b83d1a23f4420789025e8fdc1 |     
  aarch64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a420acca9bf3d4af5822bafc4468134d8d489f74 |     
  aarch64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/7d9f12c98c25bffa3b7dd9219891157dd18828ea |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/242258c17cb15c95ba8c27786afff2f9d76c72d1 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/af8fb309a5c50d682594e666172e999dcda36c94 |     
    i586     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/8f48425d21249f855aa4df5bc39f71c9eccfd68e |     
  riscv64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/0aa0b91c3ebe11fa904d821ceee86c0db4f7f796 |     
    i686     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/a8e5fbe2f97ef402c9c758a10e33fdcf637bba97 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/42ba59e378564bdde51abb6585464595590eb511 |     
  aarch64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/b2ae05a133413bb7da20673405e58bb069d6a237 |     
    i586     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/3a3c2b26ef15009d69553a642f71bd8630bc4002 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

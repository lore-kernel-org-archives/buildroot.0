Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA975CD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 03:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B77CF8150B;
	Tue, 12 May 2026 03:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNHERu6_yG7l; Tue, 12 May 2026 03:23:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47988814DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778556223;
	bh=Wh3Q8wHXxJRTWfWO9w9f6lZhoQNuAuzXCsBmSxtf/mU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kXbAtYVX2iaNMujxvoUJhMOd4K+tVDLdo38wk1rSRfvTyrw7An4hoCy+QmoiIFPGm
	 becNj5XUAVorUnghFdtlyvKSPk1p48n2m53pIqnRq1oBTJkNMnGdKi9pyxUYhqCBD4
	 238l4SAjxW6v7yi01nmkGEcK0DWeOv61zZRQv+EkVBcwnqyjLUf1yOVnakoUafRSl9
	 uqdVq2t25z7j8CJAZqyxPoLIiC0GFBGiTb/HeXt/5e4GxWFqB44C8MaDbiR3HdJYRd
	 rYvFolHOrokqDvfUfkco99QceDq0B8mZ8a30m6Pr1WpCR5aL6+Ahyu4L1PNgD4axtT
	 yrkbljPHFiH+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47988814DE;
	Tue, 12 May 2026 03:23:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79E58128
 for <buildroot@buildroot.org>; Tue, 12 May 2026 03:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FB4F40C86
 for <buildroot@buildroot.org>; Tue, 12 May 2026 03:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOTYvBVBaoGr for <buildroot@buildroot.org>;
 Tue, 12 May 2026 03:23:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 665FA406FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 665FA406FE
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 665FA406FE
 for <buildroot@buildroot.org>; Tue, 12 May 2026 03:23:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so14872155e9.1
 for <buildroot@buildroot.org>; Mon, 11 May 2026 20:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778556217; x=1779161017;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=haCGOGUuRTROej95HlyhkhUqvT2DaEBVVtIPXMyfu/k=;
 b=brlyDQFEsNcx3HnUO4v954Bey0JXHL6LkqqxV7wy+ST4QwJRLdhBhGl5CmeI6WS4Oj
 C23QNMbCKlWp4x/HKudqKr/qjmIn5Kysga4grVpisLzMc4RAGNyzLY6Jg2DskoApAlEL
 Qmi/e+v6fY/71cDZmYXKBxcF0XOjTKd+1rx4/uQNCzcp69/OT8l7FaWZ+X6vO3b4jpwS
 gEmB63rDwjWJ3vrA5MnfLNipyw+ur4HCHLVbkvmlUx4VE2CvbyzRoSxtPyPryeLmWeTs
 tjBbX8jvB0K5KXeqWUCn2DZRvfebtUYhpgpYznwY2hwqgcT43YtXS3jy8gq+cyqQX9Xg
 P01Q==
X-Gm-Message-State: AOJu0Yxr6F/WPTnHWh5/djoqXkXJbX2gqgdPUP5Ogky7DBBjtzOuCNnb
 QDVlnKJcw6dvVUB9ajUady2MZLWMOlWxi8npC8BJ8x3vL9XdmCXtn1nNulB+Mj2A
X-Gm-Gg: Acq92OGp/DPEavrX80kl4nU8og3AvBYKJmZerbDU9+YPvIAxA/s8zqHebckzY/MCQrC
 O0xj/F6WToIwcF1bInddlSW2ljPiMWdYcNnO9LAZfOHXtvQJZB/+xukCAWmqvIJVVX9XehFZft0
 ClCDfBxczq1OXnw9wzkgEdexI2bGssYkXmw6ywMvElJ7Tu0vf58M9MjFlu1eYqYnvBavjniUYCv
 nO+OVIMceSid892p3tV/7SMIr+gvCQFkrDP0hZMvhqw3Jy9lFF0PYt6Wq0lk6yhy/1bxMd6FdkA
 Jze1Hcl9z5Lq+dOV6o0n36ODHPL1vMtQPowT36fVArlxbOoZ6gLmqxTkGruwQKqrK1GxGefyl9y
 HNygVEuIxanYwVw3iIOgOEjc+WT1kc32sev4iigoSMXtI4UU3Z5C7rnM9MxNpjl6RryRdVU7ACQ
 9DRYGQn1SX+bRqlB+9wGRIEMmzQ6FnZw==
X-Received: by 2002:a05:600c:46d2:b0:485:364e:9328 with SMTP id
 5b1f17b1804b1-48e51f32aebmr383129505e9.16.1778556216572; 
 Mon, 11 May 2026 20:23:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f41b0b1sm12495365e9.8.2026.05.11.20.23.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 20:23:36 -0700 (PDT)
Message-ID: <6a029d38.1e1038c1.24c04.11cb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 12 May 2026 03:23:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778556217; x=1779161017; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=haCGOGUuRTROej95HlyhkhUqvT2DaEBVVtIPXMyfu/k=;
 b=ZzjWth5kqJ4eI6ISv432H7hRl1e27Aq1MB3MsinbwPJ7LTi8yZ+a87h1YXp+e2ueuy
 FrTIQqo4OWhjtFc1S+yagbRgwJIX8KMTqw/gwylyhef8PjMIuN7WiZ7et8Vhqa7/NlsW
 KQa9nPYw7N7AvTLAysEWJeOFujXY5x27jwtTtb9Yt0Dt8kstB10yH6e6EZj8VNCkX9Qd
 KefvHFsl+cWqQpfpjL7ZwuSTRSw9GDVjLWs3Bhc5X2cf4pdvL1b2MUTJq1GYjXSMzFPV
 7Emp/zhtZshcBBqiRKxbIGPxsJAW9/nN1lhcQHWphkJp3zMKpCxB2pePHbR0OOsl8xFp
 ci9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZzjWth5k
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-11
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

Autobuild statistics for 2026-05-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 40  |  0  | 44  |
  2026.02.x  |  4  |  3  |  0  |  7  |
    master   | 61  | 105 |  0  | 166 |

Classification of failures by reason for master
-----------------------------------------------

odhcp6c-f19dd37fb467c9cf10c... | 5 
             dahdi-linux-3.3.0 | 4 
                       unknown | 4 
        util-linux-libs-2.41.4 | 4 
            igd2-for-linux-2.2 | 3 
                   perl-5.42.2 | 3 
      shadowsocks-libev-v3.3.6 | 3 
ustream-ssl-5a81c108d20e247... | 3 
             util-linux-2.41.4 | 3 
glibc-2.43-27-g4070d808bea1... | 2 
  gobject-introspection-1.84.0 | 2 
              host-rust-1.95.0 | 2 
           libmicrohttpd-1.0.5 | 2 
                libnss-3.123.1 | 2 
              libopenssl-3.6.2 | 2 
               linux-pam-1.7.2 | 2 
            lua-sdl2-2.0.5-6.0 | 2 
                 mdevd-0.1.6.5 | 2 
                       mrp-1.2 | 2 
phidgetwebservice-2.1.9.201... | 2 
           uboot-tools-2026.04 | 2 
                apr-util-1.6.3 | 1 
               bpftrace-0.24.2 | 1 
                  cairo-1.18.4 | 1 
              containerd-2.0.7 | 1 
                   dante-1.4.4 | 1 
              dropbear-2026.90 | 1 
                   duma-2.5.21 | 1 
                   expat-2.8.0 | 1 
                     fd-10.3.0 | 1 
                  ffmpeg-6.1.5 | 1 
firmware-utils-c42a3bc53da8... | 1 
               graphene-1.10.8 | 1 
            gstreamer1-1.24.13 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
      host-uboot-tools-2026.04 | 1 
                   libcap-2.78 | 1 
             libgphoto2-2.5.33 | 1 
                  libnfs-6.0.2 | 1 
                libressl-3.9.2 | 1 
           libsoundtouch-2.4.1 | 1 
                 libzlib-1.3.2 | 1 
               lightning-2.2.3 | 1 
          linux-5.10.254-cip72 | 1 
          lttng-modules-2.14.3 | 1 
              luabitop-1.0.2-1 | 1 
            minizip-zlib-1.3.1 | 1 
                  nginx-1.28.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                    olsr-0.9.8 | 1 
              openconnect-9.12 | 1 
          openfpgaloader-1.1.1 | 1 
             parsec-tool-0.7.0 | 1 
                   pcre2-10.47 | 1 
                      poke-3.0 | 1 
                    polkit-126 | 1 
               pulseaudio-17.0 | 1 
           python-html5lib-1.1 | 1 
            python-numpy-2.4.0 | 1 
                    ruby-4.0.3 | 1 
         s6-linux-init-1.1.2.1 | 1 
                  sdl2-2.32.10 | 1 
                 sqlite-3.53.1 | 1 
                  stunnel-5.78 | 1 
                suricata-8.0.4 | 1 
              syslog-ng-4.11.0 | 1 
               tipidee-0.0.5.1 | 1 
uhttpd-15346de8d3ba42200249... | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/7f5cafb0582673ec3b3e00ec4ac9e4dcd1b230a8 |     
  aarch64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/f390b710faade76433202139a9408cf17f8bd803 |     
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e0a8b3496291436d621c2bd24f6f5b0c24f58ca9 |     
  aarch64    |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/d49076eeeda72e4032a915dcabf426ba697cc376 |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/754e0401248eaa29990f3feb7064fb3b82d5b075 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/85f07d661d8cc2c809c7ec5c1e23031e3877dafc | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/df964602b1ec94f490bdf3f042b91b93ebb70959 | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c22f2d9f974f109557ca44b89533e6d22f5dd882 | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/43dc3bc9d20cbbb1e2a2b71090782fc87bb55a78 | ORPH
  riscv64    |        dropbear-2026.90        | NOK | https://autobuild.buildroot.org/results/6372e58671d3719b127dcb69642420a07f441790 |     
  powerpc    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/1604d905ab39be9f15b884b1fcf6d7959c68fef5 | ORPH
powerpc64le  |          expat-2.8.0           | NOK | https://autobuild.buildroot.org/results/c0e33ad845e76685ec091dbe8662577685cf4b2a |     
   x86_64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/4b67f25e30d56093bd86a7660b645e6ea0da0632 |     
    m68k     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/003f2ff1aa5e02eb2dd3af38c5210ca4af6347e5 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/3555dee0cbec986374f0ef36e1ebae2653c6a38b |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/9577d321b05ecb14e87e84aceee0cd6bb1bf5781 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/5003eaba9ae65def3435ef503cdec30301efab03 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1dc05b996d607740572288dc205976782c8f9dad | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ad1646008978beb50dbccf67d3457d228cce0d1d | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/2463ffabcd4b657b72459303142a121082b9ffec | ORPH
    or1k     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/af25e7538d866e050cf3071732c804ad463fd60f | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/d629ba92d2335612b82f314ff4a99fc9da770419 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/2b30be520edbb08c5fccabde200398caabca8b0f |     
   armeb     |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/76ab072b8531297027b35178d8a2666d5154c09f |     
  aarch64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/4646703fd4d988fb4695dadfc334c64f681207e8 |     
loongarch64  |    host-uboot-tools-2026.04    | NOK | https://autobuild.buildroot.org/results/3ccecc0525685f9df122b1b266f02f6b788956c0 | ORPH
  powerpc    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/c3cd4690d4c82d8479289633c9cf1be3ab6dd881 |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2ecea84ead106c129733e8661c7b8ab8124590cc |     
    m68k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7fbc3ebd7ec9b67655359d7330e7d0e054271396 |     
    arc      |          libcap-2.78           | NOK | https://autobuild.buildroot.org/results/b2430d3aeaa10d51ae7ef088b44972fbd312717b |     
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/4326a74fd3c245a2b2b6966bb24ae151ebbc644a |     
   mips64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/3cb6d10d0da902095bca7fecc2de2d7277978b85 |     
    m68k     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/4a01596f02f3ee03c129da262ab01795ef7a1058 |     
   sh4aeb    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/092ec4c61fdbd65d110c2c0d651a47010516fa23 | ORPH
 aarch64_be  |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/9344848909fef2761f5af9ee1247024f4dd5700f |     
 powerpc64   |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/149b39e3c6ed61fd9f126691b281e1228ad2f4a0 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/c077f49395caab428a6b1a9af967a69ce293692b | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/32cea8ea4368446a1fc74f6360b82aa54043ebcb | ORPH
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/53a8cccc4c5874fdcf5a10378483f7ddaaaff04e | ORPH
  aarch64    |      libsoundtouch-2.4.1       | NOK | https://autobuild.buildroot.org/results/f343fbdeb61e25da2661ccffcb633415064406fc |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/7642a21e5b27ae7a0fe5bf543741d65bca7bdd5e | ORPH
  powerpc    |        lightning-2.2.3         | NOK | https://autobuild.buildroot.org/results/1b9842f48bdbc55e721d9fbd6d1b911b67ed43d0 |     
  aarch64    |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/80854097cbd5292297e6bf55e457d17cde10421a | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/6c5cd17961050756cfb6bf3a4ade74a59e10af95 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/ddec9bc39fb526d6cb07c0d3ab3bfbade048dcb2 | ORPH
  riscv64    |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/69a58a1d122580ab62227287f44ff681963d45d8 |     
  powerpc    |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/a9ebc96f378d87c8b229bc9e18e0a9e62a7d4933 |     
   s390x     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/649dd4c4768f5ef4bb721ee789663169ed76021f |     
 aarch64_be  |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/7d2bf9baa77af1bc0ad8ad3b47233d5553609d9c |     
  powerpc    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/5274fc47c2b99f581889a30f6d627d73436ef86b |     
   sh4aeb    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/87a91c71b774d3e403fd68147c3ff9df8803a76a |     
    i586     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/f33944d56b67d2616f29c851bc8c5337095a5492 |     
   mipsel    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/c1ea9d0a39dc02e268e6a2817f9d2d5e94f2a46a |     
    sh4a     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/147beafaaddc2c1436b580420fd49dd80407e61f |     
   sparc     |          nginx-1.28.3          | NOK | https://autobuild.buildroot.org/results/68214c0ae9a90b7dcb1d70bc4388c505ff17b603 | ORPH
 powerpc64   |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/bc02e7bd2b44e0e854c63fff63fce5feed49ae5b |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0d1ee4803c0c9b18de08deb5ad93b7ac270c6345 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ecc85a9b87737cdcd3d1854a3bdb4dd97e28516a |     
  mips64el   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/39fc729ec520c1c147f56aa3260dc0e1cd930298 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/9d3480d84d0310134479384cf0e87f19bd2cb585 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/506be383f0c5930036e5e84462d571a2325e4071 |     
 aarch64_be  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/597b60c8e806ff6adc9275aa845c21883d4ec745 | ORPH
  aarch64    |        openconnect-9.12        | NOK | https://autobuild.buildroot.org/results/6db77598e5125f7a9aeabaf9718721a1753e0f65 |     
    m68k     |      openfpgaloader-1.1.1      | NOK | https://autobuild.buildroot.org/results/a68e394d8986eb8af82fd6ad22ca8cb3f36dd7d8 |     
  powerpc    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/de09b2021f3bbccc70c5e4755cc3424508bcd176 |     
   mipsel    |          pcre2-10.47           | NOK | https://autobuild.buildroot.org/results/91dc9e4a9248b5a74cd8706291c11b5208e77c1d | ORPH
    m68k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/449a77e6561f32f54c4a98f1698184d09a87e8d2 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ad6d376ca358f06bf0455fb89a2d4970eedfae8f |     
  powerpc    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f1fda7d98040b8901ee23edc9b844d44f29f59eb |     
 microblaze  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/95836eb09fa8d26e47e44ce401e9f4af3a670059 |     
   x86_64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/4db956bbb72a6612df83e532d510d90a9e136f4e |     
  sparc64    |            poke-3.0            | NOK | https://autobuild.buildroot.org/results/6c978bd4e721e4e4193bda14b6a19fbee8a0b11f | ORPH
loongarch64  |           polkit-126           | NOK | https://autobuild.buildroot.org/results/4cb0812d58b65fac3746fa5ccd6e64588f0949cb |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5f6162b47c034b4e4489dd61e7d1fa9411c951c9 | ORPH
  sparc64    |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/994ce8ace0b6704404c3b3df4538f38334c16593 |     
    hppa     |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/2bb62d90d1ac7fdf69b3fdbd803d8915aa3f3ff9 |     
   mipsel    |           ruby-4.0.3           | NOK | https://autobuild.buildroot.org/results/68b47a9a0c575c576b31bb35ce4a084bd768e130 |     
 aarch64_be  |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/406e9993a3e983787547700faa1b555d3f37bfdf |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/5ebf739246ab54914e120444cfef0c2b2524cfdf |     
 microblaze  |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/736e8ec790c7a6676801b1cf7d980f6c9cce04f6 | ORPH
   s390x     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/be04294c4f14c3eb19dd33a9614c0df1738d0d3c | ORPH
 powerpc64   |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/43f196630ff480a35ab25f1786bbe1f90d7e3305 | ORPH
    m68k     |         sqlite-3.53.1          | NOK | https://autobuild.buildroot.org/results/fc08c86da492ce75d98fa08df8e353d5ad9e1dcd |     
microblazeel |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/6675e57007a8fed3d147e469b5ada4d3a7b515ec |     
  sparc64    |         suricata-8.0.4         | NOK | https://autobuild.buildroot.org/results/bedc9b975e37b421db15cdda1843b407ceca6327 |     
   sh4aeb    |        syslog-ng-4.11.0        | NOK | https://autobuild.buildroot.org/results/9f8b8f514f27134294ef07ad93ebf457fed7ca13 |     
  mips64el   |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/05a0369315c6331598c25d2fe17e646a2586a4e2 |     
 powerpc64   |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/86e907afba3567a61929584378bffa728300c739 | ORPH
powerpc64le  |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/9c5d8b4dd91dcd9b99aca0d9316874624858a34e | ORPH
    mips     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a5d7a39adfdc3e342141813181316a0214065c1a | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4d811fc873a754b4f7eeca751ff95851abb70594 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/03ae7ac9a0296c6d81e4a493357ca5ab295164a8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/524db08d2775ac36ad7e3ba6fac60b0a539caa12 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/469435d2af3f5098f3e0ef5a7d18e30261eecaf3 |     
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/b69ef5ea00b686119f1518592c4643ca5f9abca8 | ORPH
    hppa     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ec304249736140248f29f0ac4cd3a7e91b9542d8 | ORPH
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/318723bb990e7dd1476f42f4ac44fe1ac3b31fc9 | ORPH
    i686     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/610192133955936dcfa0a294e5fc8fe682cb1b1a |     
loongarch64  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/7d12f0fce1c681c329c5e508747cad02faa30346 |     
  aarch64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/ab40db607965359918eb06164ee61962bc6e011d |     
powerpc64le  |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/5b7c9a9d18000c213297a5b86fb9ea9411e81bb2 |     
   mips64    |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/c44566394470fe6e39a728d43e3516f5c1b7901b |     
   armeb     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/0bfc8dae9202ac446ddd9fb122632c93bb6dbb85 |     
   armeb     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/7c7dd418f159a92c2ae0aefbf95a8f8d4f27ed0e |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/c7b284f4a07be44eff48cd6fd8bfa0786adc494e | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

             bmap-writer-1.0.2 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                   perl-5.42.2 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/8e6dcbc109ff83f67430bc2a636f4a67cdaec978 |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/efec89cb6e9b199d9bf8ee66f3e496a4a33b273a |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5cd3ec995509e0849741653cdd25d5213bbc2f28 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-util-linux-2.40.2 | 23
             util-linux-2.40.2 | 4 
package/linux-headers/linux... | 2 
                       unknown | 2 
               asterisk-22.8.2 | 1 
              e2fsprogs-1.47.2 | 1 
         host-btrfs-progs-6.10 | 1 
           host-go-src-1.23.12 | 1 
          host-libglib2-2.82.5 | 1 
                libressl-3.9.2 | 1 
                   perl-5.40.4 | 1 
               pulseaudio-17.0 | 1 
                systemd-256.17 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/db347ec90b4deb25ae48cc11595afd0d8226daef |     
 microblaze  |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/06901a4f2e9d1f2dac0cccc73a6332fe3bc07620 | ORPH
   s390x     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/f953e64051313890dbeef38addc45a4c25f93a24 | ORPH
    m68k     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/5ff13f3d6c8970471bfe3650b0e767596c132c2a |     
    mips     |      host-libglib2-2.82.5      | NOK | https://autobuild.buildroot.org/results/518a3185b2019f8592bed1e19b45f6fad89f8bd9 |     
  aarch64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/948fc5e585b05d261e543157974d8a0471f70af4 |     
  sparc64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/61f19adf25899ca75a44c30f39aac5fb8f4d98db |     
    i686     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/591dac2bcf3ec6e2c0caa5f019f7acd9c3c5ed12 |     
    arm      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/50f71f7b48eec4649a0c3632b05ee01360ef898d |     
    i686     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/1c089ac2b1945d74dad72b7b721b4f6b1605e333 |     
    i686     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/896cbde4a5b5fa0dab6a5be62b1f71d7964f55ec |     
powerpc64le  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/b2c069cef3681938db3da3a2ba24bccd3ed50e93 |     
   sh4eb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/648b0eb06cb6bf324780ab622c35efd2a4fcde69 |     
 aarch64_be  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/14cdac277509af928623a9635635193d0c0ce1c0 |     
  riscv32    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/8bc32c0978beac36277f58828341b0aea52194c9 |     
  mips64el   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ca49b713017a0bf56059c75cd3debe94e4d9bdc8 |     
   xtensa    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/757e0f0b51ea799d7ee9bab549abbec57268b79d |     
   sh4aeb    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/8a24d72a46688937840028f04e600269b7bfee9e |     
  sparc64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/2c3d725158d82906cf6fcb1899b0e7c55d574ee9 |     
   arceb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/49fbc179607d828e45fef3c94520a19b80456f53 |     
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/4a91aed3664934b912fab1ba07615436ead60f5a |     
   sh4eb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e5734816cf5797a056eb7844314863e10a58b4c3 |     
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/a91075a00dacd1fbbd41b758b7fe6f622fbe2167 |     
powerpc64le  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/345c103f8d430f2f8af65625b3072de8ae1442cb |     
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/269cca1c2075aafe35ad330fc948ab88d3fc2b67 |     
  powerpc    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/545086d1253a379992f1f4fb9ba4e25f5ea9eb60 |     
  sparc64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/71813fe2cd01fec1e13799811bad4a46f6244267 |     
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ab82d10ab936258081cac993004369f24db40f83 |     
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/af0fdfe537e857bd61ac212b184803908476a6fa | ORPH
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/f706e7460dff8420e68b9aefadfeae067a3977b3 |     
  mips64el   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/c02cd4ed400aed50ab79bbdb5fc25c9e27f07502 |     
    or1k     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/624c268c532a96475f3555af776155d81b75a930 |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/82e1d791e61bb74bc09da080d5b8f30868129dfc | ORPH
    mips     |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/433506a1c03e5039160ebde6f42b18bd82eee2cc |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d847b8131cb8975c73c6cf63569211ef9d3e55e7 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/80d800a94271346d452196f6fb2fe99ce1ad2e80 |     
microblazeel |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/49b4180901b8aa4e7d797069c224c6a56b33d895 |     
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8983c560e9f3a0c0ccb51436ed7d04fa031423e1 |     
    i686     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/90491186b1a7d5daa18988c04d52b9d0d42e304b |     
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9f409bf91dbe561262387216ef9fa357bf3166c2 |     


Gitlab CI results for 2026-05-11
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956357 | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956356 |      
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956355 | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956354 | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956353 | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956352 | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956351 | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956350 | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956349 | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956348 | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956347 | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956346 | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956345 | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956344 | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956343 | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956342 | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956341 | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956340 | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956339 | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956338 | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956337 | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956336 | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956335 | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956334 | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956333 | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956332 | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956331 | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956330 | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956329 | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956328 | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956327 | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956326 | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956325 | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956324 | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956323 | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956322 | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956321 | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956320 | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956319 | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956318 | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956317 | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956316 | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956315 | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956314 | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956313 | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956312 | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956311 | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956310 | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956309 | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956308 | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956307 | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956306 | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956305 | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956304 | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956303 | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956302 | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956301 | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956300 | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956299 | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956298 | ORPH 
...tlinS390xz13MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956297 | ORPH 
...90xz13MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956296 | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956295 | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956294 | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956293 | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956292 | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956290 | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956288 | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956286 | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956285 | ORPH 
...cv32ilp32dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956284 | ORPH 
...p32dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956283 | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956282 | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956280 | ORPH 
...scv32ilp32dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956279 | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956278 | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956277 | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956276 | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956275 | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956274 | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956273 | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956272 | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956271 | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956270 | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956269 | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956268 | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956267 | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956266 | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956265 | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956264 | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956263 | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956262 | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956261 | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956260 | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956259 | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956258 | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956257 | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956256 | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956255 | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956254 | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956253 | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956252 | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956251 | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956250 | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956249 | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956248 | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956247 | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956246 | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956245 | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956244 | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956243 | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956242 | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956241 | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956240 | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956239 | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956238 | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956237 | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956236 | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956235 | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956234 | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956233 | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956232 | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956231 | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956230 | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956229 | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956228 | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956227 | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956226 | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956225 | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956224 | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956223 | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956222 | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956221 | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956220 | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956219 | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956218 | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956217 | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956216 | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956215 | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956214 | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956213 | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956212 | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956211 | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956210 | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956209 | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956208 | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956207 | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956206 | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956205 | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956204 | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956203 | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956202 | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956201 | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956200 | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956199 | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956198 | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956197 | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956196 | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956195 | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956194 | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956193 | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956192 | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956191 | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956190 | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956189 | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956188 | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956187 | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956186 | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956185 | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956184 | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956183 | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956182 | ORPH 
...linM68k68xxxMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956181 | ORPH 
...k68xxxMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956180 | ORPH 
...inM68k68xxxGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956179 | ORPH 
...68xxxGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956178 | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956177 | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956176 | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956175 | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956174 | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956173 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956172 | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956171 | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956170 | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956169 | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956168 | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956167 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956166 | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956165 | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956164 | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956163 | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956162 | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956161 | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956160 | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956159 | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956158 | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956157 | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956156 | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956155 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956154 | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956153 | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956152 | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956151 | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956150 | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956149 | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956148 | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956147 | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956146 | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956145 | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956144 | ORPH 
...linAarch64beMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956143 | ORPH 
...ch64beMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956142 | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956141 | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956140 | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956139 | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956138 | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956137 | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956136 | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956135 | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956134 | ORPH 
...xternalToolchainArmArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956133 |      
...lToolchainArmAarch64Be | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956132 |      
...nalToolchainArmAarch64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956131 |      
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956130 | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956129 | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956128 | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956127 | ORPH 
...xternalToolchainArmGnu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956126 | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956125 | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956124 | ORPH 
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956123 | ORPH 
                 TestZstd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956122 |      
                  TestZip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956121 |      
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956120 |      
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956119 |      
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956118 |      
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956117 |      
               TestZchunk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956116 |      
                 TestZbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956115 |      
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956114 |      
                   TestXz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956113 |      
               TestXxHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956112 |      
               TestXvisor | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956111 |      
             TestXfsProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956110 |      
             TestXenArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956109 |      
           TestXenAarch64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956108 |      
                 TestWine | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956107 |      
                TestWhich | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956106 |      
                 TestWget | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956105 |      
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956104 |      
          TestVorbisTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956103 |      
             TestUsbUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956102 |      
                TestUsbIp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956101 |      
              TestUnbound | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956100 |      
           TestUbootTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956099 | ORPH 
       TestHostUbootTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956098 | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956097 | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956096 | ORPH 
                 TestTree | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956005 |      
             TestTraceCmd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956004 |      
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956003 | ORPH 
                  TestTio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956002 |      
         TestTesseractOcr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956001 |      
              TestTcpdump | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297956000 |      
                  TestTcl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955999 |      
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955998 | ORPH 
                TestSWIPL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955997 |      
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955996 | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955995 |      
               TestStrace | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955994 |      
               TestSQLite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955993 |      
                  TestSox | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955992 |      
                TestSoCat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955991 |      
         TestHostSnagboot | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955990 |      
               TestSkopeo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955989 | ORPH 
                  TestSed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955988 |      
               TestScreen | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955987 |      
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955986 | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955985 | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955984 | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955983 | ORPH 
        TestRustVendoring | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955982 | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955981 | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955980 | ORPH 
                 TestRuby | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955979 |      
              TestRtTests | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955978 |      
              TestRRDTool | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955977 |      
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955976 | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955975 | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955974 |      
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955973 |      
            TestRasdaemon | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955972 |      
            TestQuazipQt6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955971 |      
            TestQuazipQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955970 |      
       TestPythonYamllint | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955969 |      
     TestHostPythonXmodem | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955968 |      
  TestPythonPy3Whitenoise | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955967 |      
       TestPythonWaitress | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955966 |      
     TestPythonPy3Varlink | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955965 |      
      TestPythonPy3Uvloop | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955964 | ORPH 
     TestPythonPy3Urllib3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955963 |      
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955962 |      
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955961 | ORPH 
     TestPythonPy3TZLocal | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955960 | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955959 | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955958 | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955957 | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955956 | ORPH 
    TestPythonTransitions | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955955 | ORPH 
          TestPythonTftpy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955954 |      
      TestHostPythonTftpy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955953 |      
       TestPythonPy3SymPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955952 |      
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955951 |      
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955950 | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955949 | ORPH 
     TestHostPythonSerial | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955948 |      
       TestPythonPy3Segno | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955947 |      
TestPythonPy3SdbusSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955946 | ORPH 
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955945 |      
...onPy3SdbusModemmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955944 | ORPH 
       TestPythonPy3Sdbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955943 |      
            TestPythonSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955942 | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955941 |      
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955940 |      
  TestPythonPy3RuamelYaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955939 | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955938 |      
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955937 |      
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955936 | ORPH 
    TestPythonPy3Requests | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955935 |      
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955934 | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955933 | ORPH 
      TestHostPythonPyusb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955932 |      
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955931 |      
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955930 |      
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955929 |      
       TestPythonPyroute2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955928 |      
          TestPythonPyQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955927 |      
      TestPythonPy3Pyproj | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955926 |      
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955925 | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955924 | ORPH 
     TestPythonPy3PyMuPDF | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955923 |      
    TestHostPythonPyfatfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955922 |      
...honPy3PydanticSettings | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955921 | ORPH 
    TestPythonPy3Pydantic | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955920 | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955919 |      
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955918 |      
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955917 | ORPH 
       TestPythonPathSpec | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955916 | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955915 | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955914 | ORPH 
...onPy3NetworkmanagerGoi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955913 |      
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955912 |      
     TestPythonPy3MsgPack | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955911 | ORPH 
      TestPythonPy3MpMath | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955910 |      
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955909 |      
...PythonPy3Minimalmodbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955908 | ORPH 
    TestPythonPy3MidiUtil | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955907 |      
         TestPythonMemray | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955906 | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955905 |      
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955904 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955903 |      
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955902 |      
          TestPythonPy3Jc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955901 | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955900 | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955899 | ORPH 
         TestPythonHwdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955898 |      
...PythonPy3HumanFriendly | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955897 | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955896 |      
            TestPythonHid | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955895 |      
   TestPythonPy3Gymnasium | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955894 |      
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955893 | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955892 | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955891 |      
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955890 | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955889 |      
         TestHostPythonFs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955888 |      
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955887 |      
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955886 |      
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955885 | ORPH 
...Py3FaramaNotifications | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955884 |      
       TestPythonPy3Evdev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955883 | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955882 |      
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955881 |      
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955880 |      
   TestPythonPy3DiskCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955879 | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955878 |      
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955877 |      
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955876 | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955875 | ORPH 
   TestHostPythonCrccheck | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955874 |      
         TestPythonPy3Crc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955873 | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955872 |      
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955871 | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955870 | ORPH 
 TestPythonPy3Cloudpickle | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955869 |      
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955868 | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955867 | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955866 |      
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955865 | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955864 | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955863 | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955862 | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955861 | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955860 | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955859 |      
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955858 | ORPH 
  TestPythonPy3Asn1Crypto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955857 |      
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955856 | ORPH 
 TestPythonPy3Apscheduler | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955855 | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955854 | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955853 | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955852 | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955851 | ORPH 
                   TestPv | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955850 |      
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955849 | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955848 | ORPH 
                 TestProj | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955847 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955846 |      
           TestPostgreSQL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955845 |      
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955844 | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955843 | ORPH 
           TestPodmanTini | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955842 | ORPH 
  TestPodmanSlirpNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955841 | ORPH 
  TestPodmanSlirpIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955840 | ORPH 
       TestPodmanNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955839 | ORPH 
       TestPodmanIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955838 | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955837 |      
                 TestPigz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955836 |      
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955835 |      
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955834 |      
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955833 |      
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955832 |      
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955831 |      
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955830 | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955829 | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955828 | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955827 | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955826 | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955825 | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955824 | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955823 |      
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955822 | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955821 | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955820 | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955819 | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955818 | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955817 |      
             TestPCIUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955816 |      
                TestPatch | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955815 |      
               TestParted | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955814 |      
            TestOpusTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955813 |      
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955812 | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955811 |      
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955810 |      
              TestOpenOCD | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955809 |      
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955808 | ORPH 
             TestOpenBLAS | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955807 |      
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955806 |      
          TestOathToolKit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955805 |      
              TestNumaCtl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955804 |      
                   TestNu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955803 | ORPH 
                  TestNtp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955802 |      
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955801 |      
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955800 |      
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955799 |      
                 TestNmap | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955798 |      
                TestNgrep | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955797 |      
     TestNginxModsecurity | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955796 |      
         TestNftablesInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955795 |      
             TestNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955794 |      
              TestNetSNMP | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955793 |      
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955792 |      
               TestNetCat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955791 |      
                TestNdctl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955790 |      
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955789 |      
                  TestMtr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955788 |      
               TestMtools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955787 |      
                  TestMtd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955786 | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955785 |      
            TestMosquitto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955784 |      
          TestMicroPython | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955783 |      
        TestMesa3DRusticl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955782 |      
        TestMenderSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955781 | ORPH 
             TestMenderRW | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955780 | ORPH 
             TestMenderRO | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955779 | ORPH 
            TestMemcached | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955778 |      
                TestMdadm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955777 |      
                 TestMawk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955776 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955775 |      
                 TestMake | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955774 |      
                 TestLzop | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955773 |      
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955772 | ORPH 
                 TestLzip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955771 |      
                  TestLz4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955770 |      
                TestLynis | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955769 |      
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955768 |      
                 TestLvm2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955767 |      
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955766 | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955765 |      
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955764 |      
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955763 |      
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955762 |      
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955761 |      
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955760 |      
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955759 |      
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955758 |      
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955757 |      
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955756 |      
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955755 |      
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955754 |      
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955753 |      
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955752 |      
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955751 |      
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955750 |      
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955749 |      
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955748 |      
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955747 |      
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955746 |      
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955745 |      
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955744 |      
   TestLuajitLuaperiphery | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955743 |      
      TestLuaLuaperiphery | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955742 |      
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955741 |      
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955740 |      
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955739 |      
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955738 |      
   TestLuajitLrexlibPCRE2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955737 |      
      TestLuaLrexlibPCRE2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955736 |      
      TestLuaLightningmdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955735 |      
             TestLuaLgdbm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955734 |      
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955733 |      
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955732 |      
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955731 |      
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955730 |      
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955729 |      
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955728 |      
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955727 |      
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955726 |      
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955725 |      
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955724 |      
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955723 |      
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955722 |      
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955721 |      
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955720 |      
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955719 |      
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955718 |      
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955717 |      
               TestLtrace | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955716 |      
         TestLtpTestsuite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955715 |      
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955714 | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955713 | ORPH 
                 TestLsof | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955712 |      
                TestLrzsz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955711 |      
                TestLrzip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955710 |      
            TestJailhouse | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955689 |      
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955617 | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955601 | ORPH 
...yfsVarBackingMountUnit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955588 | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955587 | ORPH 
...SystemdRoFullOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955586 | ORPH 
...emSystemdRoFullFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955585 | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955584 | ORPH 
                  TestXfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955574 |      
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/14297955524 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

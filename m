Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8DFD711CA
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 04:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE6B3412FD;
	Fri, 19 Dec 2025 04:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_8WyAMOGw85; Fri, 19 Dec 2025 04:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F58412DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766117921;
	bh=RLPlJ11kDChATErtwzQoRMvkJkRVGS6QV/TblN/D9O8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dw+gc7B/Br1qhAop0pPuu0sGTkqoFt6kT+M7aSAFEixXR+rCluc8YCNReK9k0ZHsc
	 F6x/dnuxriOaQjIqt+0tgrpc7BxVwXplgpy1EUduLDCvZz1ZgMxUp5HZaXymVm+MOp
	 AT87Kag+gbB28IXNcRNHdr+04St9ejwhXTd3gi+V0yu9MjAOfQxuhjgjMi3Xa3WuKB
	 ooOM09yKYfy8jXGtmBhBl9gbsi5LF3bfxHjO6ddfDqjhaI6jDnuxm3muI6ivfdz8v5
	 Z9vdeZvJQsuOQ3YaA6aweAeLIQYWuXeRrh/8QsyFRhV8I7bh89Bi0w+ohyXCzcY6Ir
	 y/g2WnH/lBQuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94F58412DC;
	Fri, 19 Dec 2025 04:18:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96DC71A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 04:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 896AE412DC
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 04:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHsWl3Y5dWuP for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 04:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1DF8412DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1DF8412DA
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1DF8412DA
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 04:18:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so7669225e9.2
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766117915; x=1766722715;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5hYT2lgl5+9n0uPwN/Kx0FIueEXlSMC0l3TKK/4cP0A=;
 b=HvDzP7nZryJC+GsCQSnxHlWlb85Vw+Sm3ER9KoQvP4/81VfZPj8Vu5VaPdGudb7E+M
 cLJo+qGL6WqKtNT/S2P89vp32Hg1uLZcLoCZjhBuXZ21ztDEdic+uuuLa5KF7lG5S/qK
 1pSYjM/Und7No9yU1oSeIGsRCliEYPNo5sc064Z9p26xbwINB2uAvpxrtGNE/70Qblmc
 ea6hvqqYJebngvj2gNE1umEEGA6lnLT9R3HzG/cn6eTgvSwtzk11B5DHQF9lFtUk3QDn
 bMyFieughGVoGyI83IqccBuOs6+DoJyqGwsX5BfqJU4dyVzKPW6f8C+40+V9szsxc2H9
 ZMYQ==
X-Gm-Message-State: AOJu0YyMdyukFuSARq1fy44+9fy7O43UZnp2JflOvoi8viLkUJWPnWPA
 ZmxL8mBFVT4YN8x0yLwMjxMr0KQieV9bucw/+W1qJq74Dt7SGRp5DkpShQBAKA==
X-Gm-Gg: AY/fxX4lEf6jnuUnG/F3BBv2ov4r/qpsJ6+nwMTSaBKFez3h/OtidAl3WcnVBDHIcAd
 ehbSoDZBtmanset/PITcmf8SKShGmoI/tbLikzrQdCmAcWiw1SXrrzhzktqGxBSPS0ayZyU0Jop
 cDwEEIbK8S4glwPOOzdhYz57yQ9qTDu+KgNW617Ym/Qki3ujCFtP0yygDl38pAhSBNDG2vgdJPa
 XUJe3Jq9Skx0aoBCLt1oLPIzNxQPUiF+PfV/0duevP2KKv/Lxw3EW77ZmcDaBH0qWxgs62o1P0v
 gx9alJc3/mU+DuGYQYnRWSAmqXJuMWKditAWCwS+6ZcCpX7nWm6U8DgY8fiHjvOjzUWLDRufYAS
 tVrVXgEWJngczcTU0xFEr2hX0g79q6CUNnnEk+4N1RDAadXj71828jkTb4K7lJh6B7L8avJsE+T
 oEpFU7cei+Qg0w6y4fpg==
X-Google-Smtp-Source: AGHT+IHvV+sE1obCGVya+UfX74cLAsdBMG2cHbHwyNbkYtkByErh1zmuG80bszXP0XhsK4744IIpUA==
X-Received: by 2002:a05:600c:1c29:b0:46e:37a7:48d1 with SMTP id
 5b1f17b1804b1-47d1959d4bamr11233485e9.34.1766117914973; 
 Thu, 18 Dec 2025 20:18:34 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be273f147sm76044155e9.7.2025.12.18.20.18.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 20:18:34 -0800 (PST)
Message-ID: <6944d21a.050a0220.31c58d.9b76@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 19 Dec 2025 04:18:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766117915; x=1766722715; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5hYT2lgl5+9n0uPwN/Kx0FIueEXlSMC0l3TKK/4cP0A=;
 b=F1mSnfMLBsJ+NZozu1NHIsZwYM2ZgqcnWuFEeaL47fl0068OSXEHU0a7hPX4LSCI5O
 Zsfu5SFNcgS1lM4W7j9DnVRRPiwZ2jo9kSeWQ/BJdWHMiuS4L0+yeSUlZhg8x9ybijJm
 iLh4PInEmEjSuYBkD1iW6Er2r1iWe6aAlibInKDVlJ/OCCUuhUG6KXRol7QKDDwSqPZ6
 ayQb7/uhSLiAeLYfuFxYfXvhQlt2vcri9+oqKrXh7p6xsufK/2DIg+9idfhivx9Q4XmK
 BBACMij0Gf0ly0NcwExiQMZoME05pXoxJ1ZLGlRzWvAyoRwPX3AIGvyzgT2BXDWzsKmn
 B2LA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F1mSnfML
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-18
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

Autobuild statistics for 2025-12-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 46  | 57  |  0  | 103 |
  2025.11.x  | 13  | 32  |  0  | 45  |
    master   | 58  | 233 |  0  | 291 |

Classification of failures by reason for master
-----------------------------------------------

                libselinux-3.9 | 23
           host-libselinux-3.9 | 17
                       unknown | 13
                libcuefile-475 | 9 
                       cfm-0.3 | 8 
                 jasper-2.0.33 | 6 
                 libuwsc-3.3.5 | 6 
              host-json-c-0.18 | 5 
                  libcgi-1.3.0 | 5 
linux-serial-test-bf865c37c... | 5 
                    mpir-3.0.0 | 5 
             dahdi-linux-3.3.0 | 4 
libcorrect-f5a28c74fba7a997... | 4 
               linux-pam-1.6.1 | 4 
odhcp6c-53f07e90b7f1da69771... | 4 
                 host-gdb-14.2 | 3 
     libphidget-2.1.9.20190409 | 3 
                  libsvg-0.1.4 | 3 
                  linux-6.18.1 | 3 
                   nanomsg-1.2 | 3 
               asterisk-22.5.2 | 2 
             berkeleydb-5.3.28 | 2 
                  brotli-1.2.0 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
                 dc3dd-7.2.641 | 2 
                      fio-3.41 | 2 
  gobject-introspection-1.84.0 | 2 
            igd2-for-linux-2.2 | 2 
                     kbd-2.9.0 | 2 
                 libbsd-0.12.2 | 2 
libfutils-c326ce0cc2a735438... | 2 
             libgphoto2-2.5.33 | 2 
                 libiqrf-0.1.2 | 2 
              libopenssl-3.6.0 | 2 
            lua-sdl2-2.0.5-6.0 | 2 
                openobex-1.7.2 | 2 
                openssh-10.2p1 | 2 
                   perl-5.40.3 | 2 
               python3-3.13.11 | 2 
                    rtty-8.1.2 | 2 
                systemd-257.10 | 2 
           uboot-tools-2025.10 | 2 
             util-linux-2.41.2 | 2 
               zziplib-0.13.74 | 2 
            18xx-ti-utils-R8.8 | 1 
          aardvark-dns-v1.17.0 | 1 
alure-14beed2a86d5a36030e90... | 1 
             bmap-writer-1.0.2 | 1 
                   botan-3.5.0 | 1 
                    brltty-6.8 | 1 
                   cvs-1.12.13 | 1 
             docker-cli-28.3.2 | 1 
              e2fsprogs-1.47.3 | 1 
                  ffmpeg-6.1.3 | 1 
flashbench-2e30b1968a661474... | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
                 host-gdb-15.2 | 1 
              host-rust-1.88.0 | 1 
                  iozone-3.508 | 1 
                  janet-1.39.1 | 1 
                    kmon-1.7.1 | 1 
              lbase64-20120820 | 1 
                libcurl-8.17.0 | 1 
                  libenca-1.19 | 1 
                 libgit2-1.9.2 | 1 
               libglib2-2.86.1 | 1 
                libnss-3.119.1 | 1 
                  libsepol-3.9 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
                   lsof-4.99.4 | 1 
        ltp-testsuite-20250530 | 1 
                    make-4.4.1 | 1 
neon-2-sse-097a5ecacd527d5b... | 1 
                netdata-1.37.1 | 1 
                 nettle-3.10.2 | 1 
               nfs-utils-2.8.4 | 1 
           oath-toolkit-2.6.12 | 1 
                opencv3-3.4.20 | 1 
                openswan-3.0.0 | 1 
          perl-net-ssleay-1.94 | 1 
    python-flatbuffers-25.9.23 | 1 
python-remi-2022.7.27-37-g1... | 1 
                   qemu-10.1.0 | 1 
            qpid-proton-0.35.0 | 1 
            resiprocate-1.12.0 | 1 
                 rtl_433-25.02 | 1 
       sp-oops-extract-0.0.7-1 | 1 
          sphinxbase-5prealpha | 1 
               syslog-ng-4.8.3 | 1 
               trousers-0.3.15 | 1 
uclibc-ng-test-132c6134d691... | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-68d09243b6fd447... | 1 
                       zsh-5.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/0430d41312b1acf283747ef4ffedf03859608737 |     
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/1e1f10c0e7329a4eea02b7021addb77bd7ee6d79 | ORPH
    i686     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/5beca3e7034f44dbbbab300f6e847cff597182c2 |     
 microblaze  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/e4a9d69612489c663fb9100918756f197f83caf7 |     
  sparc64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/4a618c2113dbdaa75096ef4e445c6c9f73170b03 |     
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/dc08c692883e01f72fab8bf8129f75e8fe4138b4 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/97149773f5d01eae7badac25d4a919f89a4a25bb | ORPH
   sh4aeb    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/8af473a56d1f92dacc5ae9f9154e333ef8229263 |     
   sparc     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/175b63f0aeb92894c1b42018ade8f5c9a876859f | ORPH
microblazeel |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/2e266cf6425f2db56e2386952a00fec771c06d2a |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/f40893bd4c460316e759ab1c95c9bfd7453a6460 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/f2a6da553ab4cc3847340c14a455293f35b526c7 |     
 microblaze  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/a9d993a8cfe7e77ca6452c5ba72a96e0155e803b | ORPH
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/0fb6137d215b8c78a2ac75433e7c84506be7498c | ORPH
  powerpc    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/745a4f780543ca6c1d55b6c225ec415ed7af1fc7 |     
    mips     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/bf11e57cb00bff3c20b037e9616634d6f03410c7 |     
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6ff83fecaf099a36fab161121b25a03d65933544 |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/fcebb8c5ba61d3d76e7c4c474140ed88a5052669 |     
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/57f85e7cd19e670f89b22242c85ff6d84a6e5c4f |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/24e47f35e06ff2162b6286b1fc28ca9dcb0a3c49 |     
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/07dc72f239febd8c47bae260612e0fca12fe1cac |     
   mipsel    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/96f6fbf66e85c102ba763747dcc951ff5d7073ed |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/df7c9d4039957e35e2c88bdeb85913f950a71950 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e86f2ba4460b9984c2421f0326721c268c95dc9d | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3456a66c07f0de6fbadefd3ce8e9ef069d24d845 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/923d977a739a5cc08be2c24a23106eceed1c071b | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0a9b8b1340cf7cc6a3953194a97d557eb1ebc50c | ORPH
    i686     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/bb39130669e59fe104db98792543a7b3ea7e0594 | ORPH
    m68k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/916eac00fc9f751a14bb028012507edde36fe6dd | ORPH
  riscv64    |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/2f1975ffdda93632e6d3d66aae1c5b97723eee52 |     
   armeb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/fb081abe78949375da58bc7eb9e5ceaa61305d17 | ORPH
   sh4aeb    |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/7a38795ced3a3a9ad37e6b69cc7ae39ed7b4d3d3 |     
 microblaze  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/04c6b40569d2947fc29427065ce7d9797c0b4d21 |     
powerpc64le  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/6b222b77e8b2b867560afe2d9c39262c881f6874 |     
    arc      | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/919fc1892d9d5a18fcb9020d47486c1168abe2c6 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/aab49dd0a31b070506e822143521cded7499411f | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/2f7ee391e2475239511f36993b2d79c4056c7bfb |     
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/81bbdf5491100a4a1cb5a8305fa55ad12d294dfe | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5fbd7f7da88bd7674525e5b4a6a764c96bfc7474 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/d5591eca0507278f62a5a9c8ed2087a23b222cdd | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f634d9d76d64d1e98b42f1d49c581b573a430c70 | ORPH
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/618f2f0e6d9e1447f1e4e9b9a3718cfc5d5ac17e | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/469edcb6557fa14cc4814b77a5b9702ad378415b | ORPH
 microblaze  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/ff0c75e744e6001db73ce2010a5f2b64ff63bc2a |     
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/a14f2d1144d3c8e36db866273f3e1acd7fbf2b49 |     
 microblaze  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/1c77b790c01ba9a0b6c3d4ff50e2d4969d1930f7 |     
  sparc64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/c0fd0ef926fbd6592196a2e7613ad1b414e58ff6 |     
   mips64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/130ca0c22e61637d7e20057db2542a17685b2f00 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a10da241f896d82e89a11c1fd4bf3e1677eb124e |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/645eeee1dc23620794fde80e38e5a872b9f0c9c7 |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a58870bdbb3d5d21dadcd8e5e40b0c86c9e426a4 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/9dc67935bcdca8edc32849c190d35d25740c5136 |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/5918b309a8e87c9fff9e5cf3522c21c2a05eaa73 |     
    arc      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/09cd19e439e3750c01a808bd602a968dce8f67ee |     
loongarch64  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/946e5ae9605c3e3da7b7270d682fded8f371f27c |     
   x86_64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/35cd436263b800663d5e9f885f4ff558b031ea87 |     
 aarch64_be  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/68c39a38d284e446ee9e89a6b7341682183629b3 |     
    arm      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/860d98b036cf5aa05f0b3c4d4c33450b024562ca |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/e243284a91f63e8a11bd836d4c0f89422a3c2324 |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/f4fa101b59e5a316ea1674eac7582a2648129547 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/d713013a465b253b24ab3baa7fc9672fb736d9fc |     
 aarch64_be  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/b4a874979a534664f46ab8a498bea0ac2c956632 |     
  riscv64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/3413da615faccf016796771705d18bce04764f6d |     
   x86_64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/f6a7090b5ed6c444461bbd4c5488388eb8c7c2a3 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/501961f765706d4ded5fd9cd2e21a0df914f8eb3 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/0bbc85161d3709703c23f34934abf4b51e4389d3 |     
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/84318459dee2212825ed1d8ac138c7c0adbba6ea |     
 microblaze  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/cefddf6a1428646321dd26710b4f3c1583ec0918 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/43424e419a44b3ba3f1a9541e8ddfc9d8d121e27 |     
   xtensa    |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/fde854fb361ba1740bfd253a335b542985cf6c6f |     
  riscv32    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/8e60dbb10ca27d58f3e477de706fcc0d5d7d2844 |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/1cf958c73c532f5fb95259465737d4c0241f5664 |     
  riscv32    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/4f7b44bc820c35ab4830f0597698b6c6c2de5077 |     
    or1k     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/2d0358a75cc9ef32cf62cfc58c54c5ba2a75db28 |     
   sh4eb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/eea3ae6cc6a97c75a2839e3d2bc70102294285e1 |     
loongarch64  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/a23930bc58b302e4ef725420a2844529662b54ed |     
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/5f32b681cf9dac5456525df648d9641dbbf64ad1 | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/09ed25492540670a31fb9e1709adcfe4fe0c21d2 | ORPH
 powerpc64   |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/9e2acdcf775e92201e3d55639209e752caf149ba |     
    or1k     |        lbase64-20120820        | NOK | https://autobuild.buildroot.org/results/e057748c83fbe88f589ef9e7c94e33ae4d3eeff7 |     
   sparc     |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/0f14844add7d8c1fbe96c32be8cdd82251a6e613 | ORPH
   sparc     |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/ea50a5a4b135f2146a9a7e2485c6ee89903ddd99 | ORPH
   armeb     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/dd6cc5d580cde243afca22c8dedee7ea47ad2820 | ORPH
  powerpc    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/8167239b016ec72fd25d6630fcf18d36d1395452 | ORPH
   mips64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/a3c65d71ce32c45252ab5c3570f2adea523a9cd5 | ORPH
    mips     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/61bc0e7a83d8c59eb7f31950cfcf9811cf728ed5 | ORPH
   mips64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/cb50c9d06b00df85cecb78049ae75dbb772ee3a1 | ORPH
   s390x     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/663cba7a8f375569437dc3fb758712e7f0b422b8 |     
  powerpc    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/3e426beb873249586dc67053a287f07bbb29caaf |     
  aarch64    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/46f1327b1a30546891aa3316e2b94b8b328b1fad |     
  powerpc    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/4e594840329b1cc1059ac54dc09d9beeee717340 |     
  aarch64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/252636b26dc50d763c8671629b3659157ac951e4 | ORPH
powerpc64le  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/35486083026efd207fe8c121257638a0dfd84c06 | ORPH
powerpc64le  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/03b045bb58f22d7463e77afedd089b3e1dc2fc42 | ORPH
    arc      |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/09a47faa1ca06069455a20c0961676301c9aec76 | ORPH
  riscv64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/0f559433cbab9681e97e87429e83ecc6f3232f11 | ORPH
    m68k     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/bf1ad8dbe87e4dd5405567c3019c929c70b4ffeb | ORPH
   armeb     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/716580f4872d44759a545ac6b2312cc573ede48b | ORPH
 powerpc64   |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/7d2ebdf3cc1a4eae0349af33680a36dec319120a | ORPH
  mips64el   |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/e555f6a9f612522b1cdb82090594de727be90211 | ORPH
    arc      |         libcurl-8.17.0         | NOK | https://autobuild.buildroot.org/results/0b6fed99bd2aab36b77cb7bdbfe2d3957e27389e |     
 microblaze  |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/87720745a060c5bf55d0e1f5ed716f5ba785cdef | ORPH
    or1k     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/9cb5105885bbc8311ffc7394a29d47e41173aa73 |     
    m68k     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/8e2bf63901a34941e7061967331c55236f646cff |     
    arc      |         libgit2-1.9.2          | NOK | https://autobuild.buildroot.org/results/7b4ba7848d61c424875ec955360beac79b4ffb65 |     
    m68k     |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/f14ee918c5c578f2cfeb893675db40973ab71ec9 |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/7adccb141a2bda15f6348793f912958bdf825b85 |     
    arc      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/5cf9691f073f06dc7d71a696511a531fa477239e |     
   sparc     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/872924b548db1844910c004e91acead47a25c3fd | ORPH
    mips     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/5a2b362786343e427b58795cfe80e6bb3ae4347d | ORPH
 microblaze  |         libnss-3.119.1         | NOK | https://autobuild.buildroot.org/results/b9ed96fc8a0239bdc97dd0c5753d37ac45c23230 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/d332e3c60a05d20eb81b93ec8eaac3a67d3fb422 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/1b09f0e1f0c5d929087c41d218c85ff22c856469 | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e1c169422e3825cd2d2a528a04b1e769580eff89 |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/28f0b2107a1f397dfd3d80445e23b37c73af3145 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/758c9d92f60ead633b52667bbe5c8f4fefbfc4ad |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/7e606335821483cdafba61f9323e5eb8bfbe16c4 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/8ddfb8c9e2b199f7e60569be20208438ab826cb5 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/aed66c185f2219f3fb964694290b61dab0a4a8fa |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c0dcd2ca6014cda452104434ab7bff5b0b554cd0 |     
  powerpc    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1ad6addf8795e720030891afbada49973207cfa7 |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/7016caf29b96d89d88c0e048daeb0e041ff3282b |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/fa653e12b55f3a701a70f5a88c5c93d053183cef |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/db58f52385b6222ce11e5538e6a6f1dce3608778 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/d9cf6e8d9de201ea8a763eb0bc04cacdb0b6dfb7 |     
   sparc     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a4f2f271e1416600a27e5c0d635ce2f8f67fe093 |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/58b4d2ef7ae8fdc4591bfaf97810444905725e2c |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1fedf42812d434497aeae5a9473e36b275d6c0a5 |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/15cfaf2ac1468c56bf0e82fb298a112473c05bfd |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/9beeebde796283dbf98b3497cbf881861c4bfd00 |     
   mipsel    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2f5dd730b62c75b936784dec42d77e0ea9682257 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/da63ee371686f8d7de07540dca0f996fd8fb06f0 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/eba17d405f553c69f7e475af4da6943c7b278a8e |     
    sh4      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/303458569570b5040a6d33332f1fecab2f70d90e |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f378f72e80f9b18d6c3d281ebf2fba9ea7fb3f20 |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/235a3a919c3059255f6e49c6ea826d90d559fd73 |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/cdae809d63a3ccaf6bf03e01489b429d05831f7c |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/56d9823068f359f0a83217c64ceddcaf9e00648b |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/24b3855c4c3d55a7908e6c1d8a5fff4b2072c889 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/3497ea6b1f099f8e8cc23cfc21acde3322c0dc85 |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e9c8d038ed6f977e32e3a498df00623590f29f48 |     
   sh4aeb    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/567f857a54f385233011916a3d41242de08d34af |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/55c4c5a96c320cd6e5ec7d6e9adf8bb02b90aa99 |     
 aarch64_be  |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/81b0a571a83ed546f89ac340444753e40334f844 |     
  mips64el   |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/f601ddb843792f518b7007fc2bab21713f3a4df3 |     
loongarch64  |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/969cde419303e982c2c121815f712ea80f85ae34 |     
    arc      |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/c680794511f908ad61e4e01a254eddab40c5e27d |     
   xtensa    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/d58778775549b048bef5149c2dd797af451d6d5d |     
    i686     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/37a802bb4a5311d436bd9e747ed522c470b379c9 |     
    or1k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d472a221b3c0054a14a713d5c357d2822bba7e47 | ORPH
  powerpc    |          linux-6.18.1          | NOK | https://autobuild.buildroot.org/results/2538c299e0787f3d893bfc19b42672f076faa2e0 | ORPH
    i586     |          linux-6.18.1          | NOK | https://autobuild.buildroot.org/results/3d1e0bf98f931671bcb81bcf681bb25910319b23 | ORPH
   sh4aeb    |          linux-6.18.1          | NOK | https://autobuild.buildroot.org/results/f6ae37c9ac9571b56473130df03f8a6ac61c37d3 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/27d633f6a90101026f19c3a0884d91b2b9c073e8 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5872376494614b6f57c31c7a1b67acfe1ff12794 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/1d975b94d7666150d1587edb7645d8287dd40b7d | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/db9c187e2df25af99172595588f7bef4a6db212b | ORPH
    mips     | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/2ce573dd27efc416c2db8b38f05e07334cd489f5 |     
   x86_64    | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/26159d62af45a037e088e59804033f355c652f75 |     
loongarch64  | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/e521189cd6f7356433f901650af4c84defeb96c5 |     
microblazeel | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/512b152cb7c985755aa93b8b82745bec8654bead |     
   mips64    | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/98f8423b4f0a4904c617855df568ee1b1fb93971 |     
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/25738950c8204d0876bb437aac5e74c660e768cf | ORPH
   sparc     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/7054252976db82beacd88ca1d4103d0fe87df166 | ORPH
 powerpc64   |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/966766ebbf5716edd86339e6b687819d6cd0f8e6 |     
    or1k     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/6bd17f680e0dbbe1cfe09ac908c34addd9ae839d |     
  sparc64    |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/d60815282e8b02250a0b2331b2389e66f570a850 |     
   mipsel    |           make-4.4.1           | NOK | https://autobuild.buildroot.org/results/5b6dec131fe2db2ca508257032a8498479be6c49 | ORPH
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0ab4604a2fbb57febd40726f28cb391a65532de3 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/72b0c64f159a6e361c32fbf2980bdf04be71c236 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3b238e428caee373995abea8b2f8cd7d946a25ab |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5f1cef514836c8a4738c62991eefe510faba9101 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/20040104f58df242ed4451446948cad0c26a6c39 |     
loongarch64  |          nanomsg-1.2           | NOK | https://autobuild.buildroot.org/results/5f1f16289e6deb1c03dbaa42ce63f40a5d7fd22c |     
    sh4a     |          nanomsg-1.2           | NOK | https://autobuild.buildroot.org/results/0a51416d69bdce914cee93e3f753af236f1f74a3 |     
   s390x     |          nanomsg-1.2           | NOK | https://autobuild.buildroot.org/results/4d135ce077281557c412f6074a98bf67f5bacaa8 |     
powerpc64le  | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/b375d23babbeaabec31f39cce108745c45399336 |     
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/84cb070d4e400fb9c5009b864fd16abb589a512c |     
loongarch64  |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/7946505592ccd623afc50a16520b5601e0da5626 | ORPH
   sparc     |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/19f80291605dab82b4bc0d2f780ba874f5a74e2e |     
    arm      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/41a7577dc33882060a62932b7af7227df9ff18b9 |     
   s390x     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/4f3b3afdf8510e929e4da76fabe2cd38abda4f6c |     
   s390x     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/c47850c5bf7a5e7e1520cc632d6a1b54b8f6a099 |     
loongarch64  | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/95f49eb049afbaffbfa50c0223c13c28d617ecc7 |     
microblazeel | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/c4ef84cdeca078139c35fa126f8718f1c3181ec0 |     
microblazeel |         opencv3-3.4.20         | NOK | https://autobuild.buildroot.org/results/3bfd4990f728a9c980fa88147b8976d6663888ed | ORPH
    or1k     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/e5376ca77f0df4df50335e8a74c91f14985f9a80 | ORPH
    i686     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/21b32c2bb39229b09f14ac146c8e61b1e440c29a | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/92b0392371b6ecd8532ccab6f1cef68d7b056fa8 | ORPH
   mipsel    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b005820100f5371eec39060b0393014157c1ed91 | ORPH
 aarch64_be  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/da601dc5cbd510e504efb368544319d5ede902b9 | ORPH
    arc      |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/b4b39407d699410c1ada4a2306029c27c6823123 |     
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/624b34cbbe46c43b0af3d498a821f83648f8fee9 |     
    mips     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/0fefd816a8aa99567ede8a19c1e02cc74d9db0f0 |     
powerpc64le  |   python-flatbuffers-25.9.23   | NOK | https://autobuild.buildroot.org/results/213b70baa40e6c1085d57261acde4d84b1e3b239 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/dc7a09d1bbe350c35cdf84565ef74b06f4691211 |     
    sh4a     |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/bd81536783ddb9d176f815a19a9c58febe59da7f |     
   sh4eb     |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/d60bb06f3134599d5b544d8665106f7ee2f362bd |     
    mips     |          qemu-10.1.0           | NOK | https://autobuild.buildroot.org/results/b37275d45ade5a7658144f1df865a8c6922a7a4c |     
   x86_64    |       qpid-proton-0.35.0       | NOK | https://autobuild.buildroot.org/results/a2dbbecac651349ffde7014bb81c71791791b1b7 |     
    i686     |       resiprocate-1.12.0       | NOK | https://autobuild.buildroot.org/results/02e4f06f30b914372a7aa08176311f8622bf4e4d | ORPH
  mips64el   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/e1a573760c2236bd61f595823c64e2322056b017 |     
loongarch64  |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/6138ec4f1be13fad00eb7a5a757996504dcc4bdc |     
   sh4aeb    |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/c2482a6bfff6003059440d24e5da577720d46d7a |     
microblazeel |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/639efac14633ac4eef9d1dd925813974b3aadd8d |     
  aarch64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/ea37358d4905e7fe7073b4886bd5479d30cd28c2 |     
   mipsel    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/aaac9c6e8729a8662491f10bc1afac8c2a147ea1 |     
   x86_64    |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/846571c6f19db697f5528b749be64f4f5350d8c7 |     
  aarch64    |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/02fb5cb89f34ef6ec5ba8390783cc325fdea7e56 |     
    or1k     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/7bdb1252fa00b20f3568b6a3b47a91eebb779bad |     
 aarch64_be  |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/cb96e28e0e4a91a42c85c8eafa29fb73175f76c9 | ORPH
   mipsel    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/2806c8f0d133d2071ee20b1679057f43c8b57cfd | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/eff48482a525db6e5979652b22e74574cfb4ad5e |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/895573da913129c63a752568953e8e04b3b2ce67 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/972f1583cf3fbd5c0cc582232e80efd5bc2a2a11 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/904b357a5b59497513cea9fe0f9694d487e4afb8 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/c9960196511bd754cee8aaea3064feb3e435a737 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1f88755339140f3fda7c294d826a9554df8f318a |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/b54359510507e7f5d2931a89c21cb31c7875a53d |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/5e5e78ecccbe6ac7bdbf328337d9dfa16c664d41 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6a6c1a30bbb33f90d038b1646b061d0ad827628d |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/25eae34c3788ced31b4207c7ce8de3be9e01b3ec |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3b80bec314324f17d752712738b579489e2b1bb0 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/2ee283c3d080337ed1bb922dfa9e573c92db66fc |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/a19ed8d6a6b85ff36c7942fb611c1e8651bcbb3f |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/adee01186c2098b32fdb7abeab6af6049715d4db |     
   sparc     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/e8eb07ff6d6d173e46b8581b49d2ba09238ea6ad | ORPH
   x86_64    | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/18230c5aa29e246c12bd780d7ee4562e836eee7b | ORPH
  riscv32    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/e31ba324619d94f847ba93515132991fc14bb969 | ORPH
powerpc64le  |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/a1a521e47724f45a916069a9f5d3c9f7c50fee00 | ORPH
    arc      |            zsh-5.9             | NOK | https://autobuild.buildroot.org/results/9dc0e25d44be508853a68942c661e11ca003d95d |     
 aarch64_be  |        zziplib-0.13.74         | NOK | https://autobuild.buildroot.org/results/1b688810007b3a3fb87fedecb9683dd595435eef |     
  aarch64    |        zziplib-0.13.74         | NOK | https://autobuild.buildroot.org/results/d0c45a011bb64a421f29e01b2aa18c2a35e68ac3 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

firmware-utils-86739f2b3ae9... | 2 
                openssh-10.2p1 | 2 
                       unknown | 2 
          aardvark-dns-v1.17.0 | 1 
             berkeleydb-5.3.28 | 1 
                  brotli-1.2.0 | 1 
                   cvs-1.12.13 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              e2fsprogs-1.47.3 | 1 
                     exim-4.99 | 1 
                  ffmpeg-6.1.3 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
                 gnuplot-6.0.3 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libjcat-0.2.3 | 1 
                libmpeg2-0.5.1 | 1 
                    linux-6.18 | 1 
               linux-pam-1.6.1 | 1 
              luabitop-1.0.2-1 | 1 
                openntpd-6.8p1 | 1 
                openswan-3.0.0 | 1 
                parprouted-0.7 | 1 
                   perl-5.40.2 | 1 
                   perl-5.40.3 | 1 
                 rpcbind-1.2.8 | 1 
rtl8723ds-546ffb2cb735e0c33... | 1 
          sane-airscan-0.99.33 | 1 
             strongswan-5.9.14 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/b261f38df7fa2a8a97fda3cdae2bbc89538b5469 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c18e062e1b913c439272bcb5c076b05c142b35e1 | ORPH
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/28fb0d12a5ca1dbdd0dc241ab0b6dac3f8fae571 |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/da4d2fcbc9cdb3234ce8ddc27e939324e4431e95 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/265f702966b894d7a34088ff653a0ae3c14249cd | ORPH
   x86_64    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/a36d6a949f6bf695a5c7c2c8929a2838ea81d88d | ORPH
powerpc64le  |           exim-4.99            | NOK | https://autobuild.buildroot.org/results/51c0f1f4674ce2aa1a78f2acb613a0afaa573961 |     
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/c89ded9945730e67294d8f8fcf5b67bfcc86f9de |     
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/f5a50cd59220aaf170ad16ad4bb0ce83d98e919d |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/21e9547b803e94ec887932654d341b8482c35c13 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/24b6254b98b264c2b41807ca01236609d0d85b6e |     
    i586     |         gnuplot-6.0.3          | NOK | https://autobuild.buildroot.org/results/f27748028c12cfdef410f0976a5d21c309113568 |     
  riscv32    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b7681d7c43c6d2994435417b750b95b0e2f2213b |     
    m68k     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/5667c036ab41a6fadb71ab866a25d093c7ca1645 |     
    i586     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/800726c31b2ec8e236660e7557119d4a44dda5a8 | ORPH
loongarch64  |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/0895841c7fe687eed63a7da86aa79bc55763ce80 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5562c7fa94eb9d0f545ecf33ce67e3729e492719 | ORPH
 powerpc64   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/7b2489be6259da411110877e69a4c1eee2f7f3f5 |     
   x86_64    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/12d5942380d434dcf4ff091ef1203bb8422f8458 | ORPH
  powerpc    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/8c73307d4a7977ee001dcb6ddeba19c5b30ba9d7 | ORPH
    arm      |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/776f101142e8b7f8b4466d6fa79406df30f0d8a1 | ORPH
   arceb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/b88ee4ffb110998a8c889bfe37c1ddce3b62ab9e | ORPH
    m68k     |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/7ae4b974a5d7f820a832b5cbb21c980a22c31906 | ORPH
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e5a25cb960721033b642512478317a2b0e52c266 |     
  aarch64    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/9d43b3fb8770ee5cc00c5602d4e84c286400c4a1 |     
   xtensa    |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/f9ad5c0f60cdaeab132e3ca99956878b61579d17 |     
 powerpc64   | rtl8723ds-546ffb2cb735e0c33... | NOK | https://autobuild.buildroot.org/results/0787274001c8993bcd05543cb49a68bfbef37fcd |     
 microblaze  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/88baca2fb38b30aeb3def6bcb51cbdabf18cb1d9 |     
microblazeel |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/5ad67d14957b4ede7a4ad2ad8d024c3421cb4436 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/6e0f0337580ee5dc05fa97995008846236cf8018 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/7303afc7db7e19b7f1e0e8a2e3d2adbb0b417148 |     
 aarch64_be  |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/2ab695123370ddf2478927f4b6775fa1871c8c04 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 6 
                libxslt-1.1.45 | 5 
                       unknown | 5 
                netdata-1.37.1 | 4 
                 linux-6.12.61 | 3 
                   cvs-1.12.13 | 2 
               dvdrw-tools-7.1 | 2 
        ltp-testsuite-20250130 | 2 
               acpica-20241212 | 1 
                    azmq-1.0.3 | 1 
  binutils-arc-2023.09-release | 1 
                  cairo-1.18.4 | 1 
                   exim-4.98.2 | 1 
           host-go-src-1.23.12 | 1 
    host-mender-artifact-4.0.0 | 1 
                libdrm-2.4.124 | 1 
                 libgee-0.20.6 | 1 
                libglvnd-1.4.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsepol-3.7 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                  liburing-2.6 | 1 
                  libva-2.22.0 | 1 
            libxkbcommon-1.9.2 | 1 
                 logsurfer-1.8 | 1 
                   ltris-1.3.2 | 1 
                    mpir-3.0.0 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.3 | 1 
          perl-net-ssleay-1.94 | 1 
                pipewire-1.2.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 sudo-1.9.17p1 | 1 
             superiotool-24.05 | 1 
               valgrind-3.24.0 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20241212         | NOK | https://autobuild.buildroot.org/results/fa8a03a1d2443f661d259451ecda7b15bab3963f | ORPH
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/fbe84f38444cff731d1e04be406cca1bd95a5708 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/09b99b73e00217aacd67be85186d1fe5c0abab7c |     
  riscv32    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/c3689610e7dc9f2bc81f7bb5d14fe4471add4b62 |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/29223267c291ef444cdf529eda9024ed12d3b984 | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/80dbc60952f261a23ddec7d7c8f9f998663a0935 | ORPH
    i686     |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/2fb33a78e6ff330bac0927868d82ac13761a7484 |     
   sparc     |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/e628c53630ab3913a7540342dc043ea99e7736a3 |     
  powerpc    |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/fb6069a723a92373162e75913e76f3c024ec56b2 |     
   s390x     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/74d4f2d894a3b064a5022146ed043dee70adb06a |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/81d00a65ddbad39da515ab303ec15c77faea3a53 |     
   armeb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/bc1fc79520c1228d46e60b62a074f7b5d898b613 |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f3503e0e1374d36bc1a53875b16d8a3cf9eaeebb |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/418daedf370649c15e5722c866bddd1aa9375efb |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/86eb4c91e5da8d6e1c8ea2a03f4d0fac77b301e0 |     
  sparc64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/0dcbcff81d2b01deb92a14cc9c156f53d908e39e |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/8cabb893137aaebf2acb10fa1b6c946c618a6896 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/34bbce5476f60c39c3eda01ffe6b602d8f042e99 |     
   sh4eb     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/18d97ee329cbbf5d1eb3385d98ba1cb196fda3b1 |     
    or1k     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/d5238dda388561b8467c461edc25d001a241e91d | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a1003f79a409ede2035d0454454d2ba1470c9e45 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/5b78e812cd765287f3bdd5edac0dd7a07f82c3e8 |     
 aarch64_be  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/eb8d22ee966bcce4e4eb7d66806c46087ca67b8d |     
  sparc64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/3ed4ad52afb637eee8cbcbc9f92e1f0ef2962c4d |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/0ac81bdea98ab7fccc60704ca908427b8f869a13 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/eeb2a3063363002444341f4da3ad2f76ef62215b |     
    mips     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/64a79ad434d813a4af39ea9212746eb5ec1adbf8 |     
   mipsel    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/f574b9afecbd9796e4580605ce1f93602a7b77a2 |     
    m68k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/19f4ca39f0df0e785a72f6627d552f23fdb80057 |     
powerpc64le  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/34f7328a00c718547dfdec5e2a51b9dea0cc1220 |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/3df6b3334d3c322d0a5edeeb8768cbfe875da424 |     
   armeb     |         linux-6.12.61          | NOK | https://autobuild.buildroot.org/results/995a27f4e07dbc9e6c976b558d42966a46627a19 | ORPH
  powerpc    |         linux-6.12.61          | NOK | https://autobuild.buildroot.org/results/9caa2aa2232c0247a70928d75278be9572c89188 | ORPH
microblazeel |         linux-6.12.61          | NOK | https://autobuild.buildroot.org/results/b3a2725854d2d1c3930ad4885cb31c52f6abc928 | ORPH
    or1k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/151a68fe5467165bb8992db7fd35397c2edeff18 |     
microblazeel |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a280c194b5249591d594896510dcf37bb6d11df6 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/3b10fd772c054baf04186f6c9fa0fa29f8606c0e |     
   xtensa    |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/5c008cd11fc83727b73ddb337e3a0ca0cf95a8eb |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b183f835bf8e87855f53e396fbfa34bf7c3d50bd |     
 aarch64_be  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/c3174d8673b55fb062fad060bb7e0264b28c50e4 |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/47016b7bf89549fe1bf0d635e8a21a461a778ab1 |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/9b77a3afaa5f8fd3cb99eb131dcc7920df5a5d92 |     
   mips64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/f106f21114727cb140235e29a273380f53de6083 |     
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/0c10855e7a9db4bd0ecaca13172c339c24030802 | ORPH
 microblaze  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/6338a7463c6dae10469569119fa3d4330cee3607 |     
   mipsel    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/bfa7e22506cbe04cf8c60618a12e6cdd37bc353d |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/2ab90ea73f1d3dbf2feffa37c9283e1154ec2593 |     
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/b9fb309d22aceb7d1614e26396576bd61531bdf5 |     
    arc      |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/ce7f68e906cbc434ea98a1bc382d6ffdb6499e39 | ORPH
   x86_64    |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/c99a170fd3330e4223e98dd113229a03d8278a05 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/d1b8a8e85f3dca87924774e01103f20588e11a75 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/c3435851611db1998a786125cf15a08f4b31ff13 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/996e7620866d2881c2bb76243b391eaaa70bb50d |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/34d851fe29f464b1ccda1113544577fcfe08bdc3 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/b1a29572fd94ff25d3528579811758ec2eec6877 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/220fe06b94f34d69ab71302e5373eb087af81ffd | ORPH
    mips     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/00b682dc654efaf3b07e4b6f6fb319a21dbbe4ff |     


Gitlab CI results for 2025-12-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/12470510031 | ORPH 
                 TestRuby | https://gitlab.com/buildroot.org/buildroot/-/jobs/12470334615 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/12470287701 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12433201077 | ORPH 
              TestBitcoin | https://gitlab.com/buildroot.org/buildroot/-/jobs/12433201039 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

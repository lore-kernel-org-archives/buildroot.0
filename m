Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDB1CA0FFE
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 03:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B501F40B3A;
	Sun, 31 Aug 2025 03:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2LwE7T81SIa; Sun, 31 Aug 2025 03:23:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5121F40B8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5121F40B8C;
	Sun, 31 Aug 2025 03:23:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E0CEFA
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 03:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 648C160796
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 03:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcZzF2iiTmcI for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 03:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B083460C10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B083460C10
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B083460C10
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 03:22:57 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aff0365277aso285810566b.1
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 20:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756610575; x=1757215375;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jztiOjpuhkTFeZHSHSmQI79S9cS78fSZV/gUzFVy3OM=;
 b=TPGvEdml/OkwRE8ucSbBPGYNzk11F/cCmUR/I0YVoBd12hIGn08TgzCRd3/Jpgy7yD
 XldPK4rCeYyJEwRviXgc6ZIsolfhkVvqaT+b42+ui/OTOREG6iYh01uHlSWTkfAIiRw5
 mZ1XtL4qGiVrikv0I2Dz4LxVFp+hvy7OSZUQIP7jCS1DshXeEkNs9koVaC1MAjNyuf55
 7XAKTicFc7krruBdJ4XfHrSOyxFSBtF9V4O2KbnmBCD+xo8aUWFi59mO7Kd8HMdLkMuU
 9+EaYPAlwwE8GJrynLAhwgXNVof0XowA9GK8b4idW9MyrRJrVC6WfN11SDi3Pqw+URtC
 tOMQ==
X-Gm-Message-State: AOJu0Yyh38m8aHT/uHyr8XMArev2K1Cfoqqz6NAIrl9vnkSlYwEp7L+K
 KPlmuQQ5k64bJvHSIz2CwcBvSksY43YJen3XV1X9FaJUWicNbquGFQFxLqKG8g==
X-Gm-Gg: ASbGncsA/tolPLwReWZSXt1Y5Q5m+MFc86Mnd1vndpPFovrtWKDUq/WxgNbbvVKu8Yx
 j6aT+yWvtC4usm1+XWuuuBL2iBhqeO5vNr4tV4T7urK/gWbmHNOv8nD1lmYI4KAfjpPjdxgGjx5
 +YC5TbuBKlc+xFK6KrKghvr1G4M1wIjXZoPi5i8dXS4alXdQt2vqgc3C++WhPLnAplebLs1T92t
 YF52dmAClxJpiJV82Bx4UYQr5txmjjqyPEwqMWjN6mL3EXqXmMY2Au9qe1LrqkgL97b45HwWWD9
 0tKbMwe7m8mxc7n3SAu4AgWtvmjw8ouTzQRmSAUZQjD1ZKet9uOeeOFPWuxLBtVlTTM4rFrRDKV
 /Lh3nXpjhpdOxlQY97uvbzRkl1a58ShzhKhUz2KhA
X-Google-Smtp-Source: AGHT+IE/bsLTlS7wr6GVAZs6YP4urb9Jv9T2DF4h+lF4iHiDr90kJNgBCgAYcOCHMgSRp1greh2lDA==
X-Received: by 2002:a17:907:3d92:b0:afe:ee36:2eb8 with SMTP id
 a640c23a62f3a-b01081807a8mr386012466b.8.1756610575099; 
 Sat, 30 Aug 2025 20:22:55 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0419d76921sm78520166b.15.2025.08.30.20.22.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 20:22:54 -0700 (PDT)
Message-ID: <68b3c00e.170a0220.2f9395.1a91@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 31 Aug 2025 03:22:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756610575; x=1757215375; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jztiOjpuhkTFeZHSHSmQI79S9cS78fSZV/gUzFVy3OM=;
 b=cqxCLaOoN/do1JXcTyotZvGgbJZ0uH5qu1g8cdboRd4wn95N9SyzYYyLgoO8+Bxc07
 gURZS5UzPg6Bp/Lzpb2uy4j6DbYn2QwFNwe7zVeTNlCeW84fpiwmezdYDXBdXM0VWLTL
 o4s8szNUSfItEMrjKurnRY0IH7n+2UZjb8jHQ7xS5LsO+Fm9Ur9u/+/dI1WJTkvlQz03
 oYpVifz9GJ6vSTEKcvExXGoa10tWYkFgP2e6/kjeUPvmpFltaq9aDLsX54Hqtr73Zuha
 9OnzNEvtuCsR9cSIkyWTuYr8JHrbdzcCtyFWzZu6w0uKyWWlrjuTIkUnY+WQlW0JuMh0
 GY8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cqxCLaOo
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-30
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

Autobuild statistics for 2025-08-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  2  |  0  |  3  |
    master   | 15  | 76  |  0  | 91  |
     next    |  0  |  1  |  0  |  1  |

Classification of failures by reason for master
-----------------------------------------------

               bctoolbox-4.4.8 | 3 
brcm-patchram-plus-15bd6638... | 3 
             dahdi-linux-3.3.0 | 3 
  gobject-introspection-1.84.0 | 3 
                 host-gdb-15.2 | 3 
                 logsurfer-1.8 | 3 
        vulkan-headers-1.4.317 | 3 
                   atop-2.11.0 | 2 
                   cvs-1.12.13 | 2 
             libgphoto2-2.5.27 | 2 
                  linux-6.16.4 | 2 
            netstat-nat-1.4.10 | 2 
                openvpn-2.6.14 | 2 
                    sslh-2.0.1 | 2 
                       unknown | 2 
                 babeld-1.13.1 | 1 
                  boinc-7.20.2 | 1 
                  cairo-1.18.4 | 1 
          chocolate-doom-3.0.1 | 1 
               dvbsnoop-1.4.50 | 1 
                enscript-1.6.6 | 1 
firmware-utils-86739f2b3ae9... | 1 
               freeipmi-1.6.14 | 1 
                    gawk-5.3.1 | 1 
           ghostscript-10.05.1 | 1 
               graphene-1.10.8 | 1 
                   gvfs-1.57.2 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
     host-python-maturin-1.9.1 | 1 
               host-runc-1.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
                 libgee-0.20.6 | 1 
              libmhash-0.9.9.9 | 1 
              libopenssl-3.5.2 | 1 
     libphidget-2.1.9.20190409 | 1 
                libsepol-3.8.1 | 1 
                libshout-2.4.6 | 1 
                libsolv-0.7.30 | 1 
                    mpir-3.0.0 | 1 
                nushell-0.96.1 | 1 
                     nut-2.8.3 | 1 
                     nvme-1.12 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.30 | 1 
                openssh-10.0p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
procrank_linux-21c30ab4514a... | 1 
                   qemu-10.0.0 | 1 
         s6-networking-2.7.0.4 | 1 
               syslog-ng-4.8.1 | 1 
             util-linux-2.41.1 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/b8dd18414873062325a82cd7e375de962ebd4e6b |     
   s390x     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/2808fad337f274c36c97fb8b1bcabdcbb49353bf |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/44f96be71dcf8d8f7ffaee69e61b91d1b25830cd |     
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/63719dbdeab419a42b45748529aea24629c420a4 | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e3f423875d28c1c0cebdccf6fbd54fd6d8d11f7a | ORPH
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/369434589ae84f99e1b71ddfe236808c61fd7539 | ORPH
 microblaze  |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/06da1d8f300132e8a98d39fd506d43823338c77c |     
 powerpc64   | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/44ff5e72856b59f494ebf2691a0acdcf9cee3490 |     
   s390x     | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/8e89f33049eea0b9f0c055e8aef89e9e8d20b9b5 |     
    mips     | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/5b4295bcff2a4147b4c056e7d4ff81f11be48542 |     
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e35c311c799a0e9579c8439263a7f25b92e4507f |     
powerpc64le  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/bac60426526967cb0770f5ccecbf2545301c0c09 |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a48a4c8153ad9e6c9fe1dd4a4bf0b50c0f82f73d | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4eb1cab857cc608b09fa379d76da856e73b0afdc | ORPH
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/03f50f4d24fac8ec705e431cd388302113a40f8a | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e912bac1d3a1a1ab587a163ea799b642711dbc38 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b0293da53ad51f37e603372897399c15c5ba9c96 | ORPH
  sparc64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/64c61363f501c2e15f96563f68109fc5ca8ddbc5 |     
   sparc     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/80febbabe9022b787e1d15862e31263d8efef563 | ORPH
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/d081e688463a809081e51709c5392db0dfd8a5b8 |     
    arc      |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/42a9a4a7c3ef86dbd64a198573004a897f56a83c |     
  riscv64    |           gawk-5.3.1           | NOK | https://autobuild.buildroot.org/results/5613b827e4dccc070e156df251876aedc0d1166f | ORPH
    i686     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/6ac230ad1bf0d124a2b3b94f0d7ce16680fed00b |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5a30660ac17c0d58fbf8add4ae8ff7a5f10ea72b | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e9e43a55cec8ef4b46bb9d4738761e1824d4941a | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bf3e1281bb53e09753949e43fff2705e71b25ce0 | ORPH
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/f0a7ef9300c3ed52325cd7a9dfa7bb60391ef483 |     
  mips64el   |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/73b2e0493202b97a5f15049e1f603d6b05f879ab | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/cb1535b25f67730b183ac6048a9aa022f428b092 |     
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6d59030aab85dd1900963f92217bf599be8119e4 | ORPH
  riscv64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/e05a7142a13353ae02acde6dfa58cf106b7375a8 | ORPH
   sparc     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/7158d3ec365a4a548d7c9aa4370389ababafd4f0 | ORPH
   x86_64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a95ff8028452df966fe71a5008039eb2338655e1 | ORPH
   s390x     |   host-python-maturin-1.9.1    | NOK | https://autobuild.buildroot.org/results/6cae1dd065e1b42f336c8a040b5be7f8626e6723 |     
   sparc     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/19299cf160d645ce0d1fc4f8e83d42d39798547f |     
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/eab894b97bdcede2ce8917e46b53f46deebf9aca | ORPH
 microblaze  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/705de047d7ea6b450ddc467be745d70f678f58c1 |     
   sparc     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/f32baae5a250f52192eb62c1d5b876e4726be75b | ORPH
    arc      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/eaa9968416bd95e90291f01f223385c2e6747d67 | ORPH
    arm      |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/7a6a1ae026e6640af02eb94dc8d778e20ebe1854 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/c9d3f81f00a4fe64a5b49eccefc1b72621297f4b | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/16af749fc37b2d000f1072b7c0bd6c6a8941ec86 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/c36798ae9b2cda49864c27d60affb48bc17b3aa0 |     
  riscv32    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/cac995b8ff67ac2a7679ef3de0fa5d0c4a52e0a9 | ORPH
powerpc64le  |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/857dc6e2444a59d42e283a9971811af08acf950b |     
    m68k     |          linux-6.16.4          | NOK | https://autobuild.buildroot.org/results/68cd24be306e980d820ef50256e1d1b324953966 | ORPH
    i586     |          linux-6.16.4          | NOK | https://autobuild.buildroot.org/results/558b382b50191d3e1c25d80b5cfff0b190997940 | ORPH
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/00872aedfa317247937ea75796f39df1e56f17f1 |     
   sh4eb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9a58b9610888f73902f8492bbf5a3aa328b10f72 |     
    m68k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/be3d94505aa337102ea01a044f3c4e018998e71c |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/20c9ab505260b5c9a29ac1c953d23b189bd88152 |     
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/e94f8164c54b1970da0fb10408527d52760c8c3e | ORPH
    sh4a     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d08adba9ab601939a4d9e83b12ee58b519fdcfa8 | ORPH
 powerpc64   |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/7e2bb3a1cc2d28966ad86033e1899d2acf8d0ab3 | ORPH
   sparc     |           nut-2.8.3            | NOK | https://autobuild.buildroot.org/results/4571e831810e1fc89870adce86b69303e9b377cf |     
microblazeel |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/ff086a6bd75e12288c26b23f8f15a344a0e9f8d5 | ORPH
 powerpc64   |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/31eb734705e425963da8a83774560a75ad37e0ce | ORPH
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/491cb6e3080d97e66305a93ebb1c36bb0ec4d5ad |     
   mips64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/a828da1bbeb79a165ec4ba3b1d10786dc327d153 | ORPH
   sh4aeb    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/f6fe7985923f797eae776303625f5c411c8958b0 |     
    i686     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/a209e69eadc574cb8b4076da8f5285761f94c644 |     
  aarch64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/96b3e7655a41302dd38b4553058a43c562774c48 | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c893474b4ee55c8b9573c5d0f6c26d741cf2ca92 |     
   sparc     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/a29c740b35e5d6370a8b51b1e71de27ba39e84a6 | ORPH
powerpc64le  |          qemu-10.0.0           | NOK | https://autobuild.buildroot.org/results/06be435331eb2aa62a612fde4c18b77ec155aa95 |     
   armeb     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/b6118d8dd9e1b6b1a1fa6ebc4194a83c4d43528f |     
    arc      |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/4285b23a07bcff128c1e9ab4ac722c18fc8d9bd0 | ORPH
 powerpc64   |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/1c438feb5f8d6e36e5f0cd732465f5bbbcb1634d | ORPH
   s390x     |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/513f6bc414470e1cf0e961144e87252355c2ec6e |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/eb227e56362adab5272c90f1f68dfca0f59f5ef5 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/e4df6e2dfa21db825fdffa3dd142f0846708551e |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/639a4b751969cff3477a9545fcb7f2c949ef4e1e | ORPH
    m68k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/7dcec80501c8484e5c3c303da6df5cf5e28f1744 | ORPH
loongarch64  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/e7ec0007e31825ba403b21d137648fc7c60fa42e | ORPH
  mips64el   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/4f0428eb0c047973ff2a5a6514cddaccd3cefe8c | ORPH
  riscv64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/49e59104d9a9b96148ba23e873276758681e3e48 | ORPH


Classification of failures by reason for next
---------------------------------------------

                    mpir-3.0.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fddf9466794bd807af14c274770f64b591585a4f |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

libuci-f3fc0b76040685829191... | 1 
         lttng-modules-2.13.10 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/d9dd46f5d4168fab12dcfa2bc6cedbcdb17aa46e |     
microblazeel |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/2ce284b490032ef65e4b311cff487e8704cd8fba |     


Gitlab CI results for 2025-08-30
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167596 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167601 | ORPH 
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167606 | ORPH 
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167610 | ORPH 
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167647 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167667 | ORPH 
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167679 |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167692 | ORPH 
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167709 | ORPH 
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167725 | ORPH 
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167726 | ORPH 
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167734 | ORPH 
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167743 | ORPH 
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167751 | ORPH 
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167815 | ORPH 
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167990 | ORPH 
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161168030 | ORPH 
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161168036 | ORPH 
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161168060 | ORPH 
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161168068 | ORPH 
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161168070 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161168293 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161168324 | ORPH 
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161168335 | ORPH 
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161168339 | ORPH 
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11161168350 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/11176730287 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11176731689 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11176731797 | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11176733707 | ORPH 
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11176733776 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11176733894 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

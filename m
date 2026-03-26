Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E9C109E547
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 04:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC6D60A9B;
	Thu, 26 Mar 2026 04:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydGjG3r1H_w8; Thu, 26 Mar 2026 04:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B79DF608C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774499060;
	bh=zWMulPNytkBEV1MK/5eerIVBcezil7//ero+MBrIFm4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BWYk3gRXUqG0peyWN7iG3hFn6QwlWsjxmd/InW/+29Dmg5j5WUwGQ1FFEZsHFxrkP
	 P/qszaYzRun2XCddSzWSTQkdN353gWAMVbHIAGbIWiHL8+tMj7lf1eMyt8xgq2a7eK
	 Iew3dfd9TxlncruqyyUXRgc7oKHoXr7lM3Ae8z/2/+Dj+3izX/z6mgQsmvXhTX4tQ7
	 jQcQT+tRd7ulH9GcAfCNMzQZWuSx5rkQHHh+Cm1KYZs2I1uzy1pciSzaAeu3i/7gXL
	 SKXaANPqn/XYQjnnWyajl1wVCLBt6LW96AebkE9PiWL+1Vmr3KTDxvupgKwUFpPhz0
	 HdJAbjvEiLVLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B79DF608C7;
	Thu, 26 Mar 2026 04:24:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB81353
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 04:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73D3D40B59
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 04:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6R_JGsPNPj5s for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 04:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28F5340B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28F5340B58
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28F5340B58
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 04:24:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so4316815e9.0
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 21:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774499055; x=1775103855;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1vWdjEVTXeF+E3L85PFjFxdUvLA7fydsniwbLiwrto=;
 b=Y+5WVOSsNwQmynmQF24gTRxEFqyah1WPLktWrewVo3BTEYb6TUsAfw0zkaGXq5NQtg
 4+fmjSGkAh67wxSpt4DWDk8/nBSsJvmA1OtAfrS8BxzxDi/xXhlMECeVD7t+HZiHxyrM
 SULaXIeAx8EfvmKxsv1Q9/Zb7EyKymWpixUh3yeCsWNI9GvW+3YaMagQCbXgnUdD8QR1
 cap619MgVlBfjcNtsuNQlXf7q9cyy31bkQycFJxm1B22lX0ciVFfa7lp+aAr0B1DS/za
 T8a1pP2WjyAJ4E2D2vhyRryeZ7iYG2FXDDZ2fmqTGZTCfMVyMdoMwkIswmGy6GvqwI5s
 22Ig==
X-Gm-Message-State: AOJu0Yy/Pe2bT9ljTsDqnL2BkHFe6Z4bXcte8H25Krsa4SybpTDnXpdU
 MsSToxuH6q5kJdaVni67YQYANuODDx/4YycUoZXmze6tGcP70ugecOoSaXn2MQwr
X-Gm-Gg: ATEYQzz/MqNwLJsuuh3SVMPgSauF2WB7Nix4lGiaxAfcAjXdtUjL73YpCdkGGmHt1lY
 lfEM8DAbz+RXK8OL3d8P6ti+Cd/poqb+6QCH1idRYb8o3c3CE7K/4Encq++zl7PaS+Q0zMGLDoV
 qAGTMzRjlbiB+L4OVZM0sneYOFX5mP5PU/NS8A58WxANK/6blWbQWYE5vkCGeyGDYROmxcjX95S
 AfWPf70TIJKyZknQyfmyruzsAtn7QHEo+SB1ryE0wBeuExPdiJu75oTko3YHvIseJlTOWDmkY6U
 tQnejG0ELZor66nXVE2sGZqDCPjUXRC9flSu2TwXi1WKDBGNsfn5jXmaX8hJPmBTXtuUcvHVXzX
 5G2vaX+559Ka7yZYh8kAn7+Ldwv/sWfsluUwqhhIod1aqax2i4CMuBrLicrkGvh0KKlWBaGaiAL
 wn6S773rXP5HMmANjaEQ4Z09vrkA==
X-Received: by 2002:a05:600c:4685:b0:485:2ce2:4c87 with SMTP id
 5b1f17b1804b1-48715fc3562mr93336805e9.4.1774499054584; 
 Wed, 25 Mar 2026 21:24:14 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919e708asm4333513f8f.36.2026.03.25.21.24.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 21:24:14 -0700 (PDT)
Message-ID: <69c4b4ee.df0a0220.21d845.6b88@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 26 Mar 2026 04:24:14 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774499055; x=1775103855; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=b1vWdjEVTXeF+E3L85PFjFxdUvLA7fydsniwbLiwrto=;
 b=lfPtX7KsQg0Sv3DfH5wO9/Tt4WhgMmtTuIo1YIfb08yON4fs3FMaxLoycfNb/BRb3Z
 QPHsXN2VG5q8RW8h7LpqU4rGlJurD67xgbeD3ch8SVuaJVNvy3geXTwwDzDTAlmpD6NF
 CQVMGqVk/TOinLJcNAkHBj6+DGibTOkDN5j2cjloyWLm4B8eWnJyRn+NFW3JPuLQSiJi
 086u3PdpLB5uKH2W7A5Qo+9fpUpOdHwyD8j+6uj2OCkuyC+1+HWQjvmIQ4ok8DDe8qAY
 42HYlElQ/WV5Odh2bK9aL6mSUDtP8VFYZo9GqRcKqL0CNA6uDYpxGY4tMentabCaVec9
 HUgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lfPtX7Ks
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-25
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

Autobuild statistics for 2026-03-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 37  |  0  | 54  |
  2025.11.x  |  5  | 16  |  0  | 21  |
    master   | 57  | 157 |  1  | 215 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 7 
                       unknown | 6 
  gobject-introspection-1.84.0 | 5 
                flashrom-1.7.0 | 4 
glibc-2.43-10-gc3ceb93dc4f6... | 4 
                 libmbus-0.9.0 | 4 
              libopenssl-3.6.1 | 4 
     libphidget-2.1.9.20190409 | 4 
        ltp-testsuite-20250930 | 4 
                 mdevd-0.1.6.5 | 4 
odhcp6c-f19dd37fb467c9cf10c... | 4 
                openssh-10.2p1 | 4 
                 c-icap-0.5.10 | 3 
cegui-e7a03afc70c6182a091ff... | 3 
              host-guile-3.0.9 | 3 
                  libnss-3.121 | 3 
               openblas-0.3.31 | 3 
                openswan-3.0.0 | 3 
python-remi-2022.7.27-37-g1... | 3 
amazon-ecr-credential-helpe... | 2 
firmware-utils-c42a3bc53da8... | 2 
                 lcdproc-0.5.9 | 2 
libdill-32d0e8b733416208e04... | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
libfutils-c326ce0cc2a735438... | 2 
             libgphoto2-2.5.33 | 2 
          linux-5.10.246-cip66 | 2 
                       mrp-1.2 | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.42.0 | 2 
                 sqlite-3.51.3 | 2 
               trousers-0.3.15 | 2 
uhttpd-15346de8d3ba42200249... | 2 
ustream-ssl-5a81c108d20e247... | 2 
             alsa-lib-1.2.15.3 | 1 
                 babeld-1.13.1 | 1 
                bpftool-v7.5.0 | 1 
                  cairo-1.18.4 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
 docker-credential-gcr-v2.1.30 | 1 
              e2fsprogs-1.47.4 | 1 
                easydbus-0.1.0 | 1 
                    ficl-4.1.0 | 1 
               freeipmi-1.6.16 | 1 
                    frr-10.5.3 | 1 
                  giflib-5.2.2 | 1 
    host-mender-artifact-4.2.0 | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.28 | 1 
host-vboot-utils-4b12d392e5... | 1 
                   i2pd-2.59.0 | 1 
            igh-ethercat-1.6.8 | 1 
leafnode2-9543ffaf82406f943... | 1 
      libabseil-cpp-20260107.1 | 1 
                  libenca-1.19 | 1 
                libglvnd-1.7.0 | 1 
                libmpeg2-0.5.1 | 1 
                  libnfs-6.0.2 | 1 
              libostree-2023.8 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.23.0 | 1 
               libvorbis-1.3.7 | 1 
            libxkbcommon-1.9.2 | 1 
libyuv-4825d9b29eea4dac2460... | 1 
                 linux-headers | 1 
                   linux-tools | 1 
                  ltrace-0.8.1 | 1 
                     mdadm-4.3 | 1 
            minizip-zlib-1.3.1 | 1 
                 nethogs-0.8.8 | 1 
             ntfs-3g-2022.10.3 | 1 
               nushell-0.108.0 | 1 
           oath-toolkit-2.6.14 | 1 
                     php-8.5.4 | 1 
                      poke-3.0 | 1 
             pptp-linux-1.10.0 | 1 
           python-html5lib-1.1 | 1 
            python-iwlib-1.7.0 | 1 
                s6-dns-2.4.0.0 | 1 
                 s6-rc-0.5.5.0 | 1 
       shadowsocks-libev-3.3.5 | 1 
             util-linux-2.41.3 | 1 
               valgrind-3.26.0 | 1 
                 vmtouch-1.3.1 | 1 
            vorbis-tools-1.4.3 | 1 
                 zlib-ng-2.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.15.3        | NOK | https://autobuild.buildroot.org/results/440ad70d9529623edd55b376c35d28effafeaca9 |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c198624c94b7b352084e35bdee1a90c20c553e3d | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a75749c462606080989f846a4ec07e65b7adfebd | ORPH
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/4d8c48610676e92fe72baca8f345f46348acd9c3 |     
   armeb     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/d5b4181719dacf09a0bdd176fcbd4eab8de928d8 |     
   x86_64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/08391a1f1dcb12b08ad9c8cc599f3930a852c617 | ORPH
    or1k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/ae019bb9c325c445db74081f5c453fbadd1047e5 | ORPH
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/76460153b29bf940efd4bfcf75c288d889c7f98c | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/fbbbb88b3713a2998d9595aabca603c7765c3901 |     
   armeb     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/8c8b76e51707440ea1a77a8e96533a53643a37db | ORPH
  sparc64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/555ccc616a70586ce289f3d8a83ac5a17e33a0bf | ORPH
   mips64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/f013687ff5aad156b98ebac5f34af8f6cf04961c | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0736b87e8153a3038c259d652c60b2ffc9860f5a | ORPH
   xtensa    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/69106d21b50703809dfb9ceb16d44cdb319d3388 | ORPH
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/bfeb445f47eebf3eed2463b0ecce6a529f4d3858 | ORPH
   sparc     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/efc9becb5ccd4b17faec5d8e3be54afb9f2ca893 | ORPH
    sh4a     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/ac15083506c97c3b5ce2c9b46acfa2ac9b7b5e19 |     
   s390x     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/7847477ec70d08288d90ded743a926ce6627c70d |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/229937cf3b31c37c77203c8d012efdbabd2291f9 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/739d64e972d50773765de9ded51aae25b1d73e0f |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/153db274acce020f410bece50aac4a646802ff9c |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/b06f7527f94071461fea4f4b7e8f340b6d975ecb |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/1e9581eabfcae4d6f39909fea776197f47eb45ad |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/d0d512a93d3f7a0041b3e47808924a373fb65b8f |     
microblazeel |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/919c549ddd7ee84975d0e62673bbc472d71923d2 |     
    arc      |           frr-10.5.3           | NOK | https://autobuild.buildroot.org/results/7ea7c4f4b07a6681efa2ec7a0b3f1e624f0dbc1c |     
   s390x     |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/f3fab9329744064d48a321db41bd728766e02395 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/cf219a7aca2d04827ad613984cdff6ef330b75a4 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/3b3abc321201c470c9b114bb68c068e1d11ffa51 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/6b404b4bcf6f940c6eb693c97c02e005b355e8d8 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/a91ce00f3f3bc7b5ef1f1a0e20331eccfa61b25f |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2d9c55b0ba5e59ea4ce78668064127f89c262ce1 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a433452c0fb6e8fbc5989dfc80d7001b83edbe72 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/fec22a47b785e353cda2558b76138a1c123ff07c | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/401b9e9e17ff2d8d39d51d126c846bce0ec13f2d | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9198b1bbfd8ce8bca0008d6a6ec0dee1e8308f82 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/abcc55fc9c3b888852c64bcaf272801752ac7347 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1b53303c3880ec2003141e714024e13cf9d2eb3b | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6ac07394b9408cccee3eea5ee919053ab1eec4b7 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/547985e78a7d894a050f484b6638216aef52a9d4 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5bbc508ca574d0482948f70416e2b6218ec7fec6 | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/be27b7656df4d28e1c8b5bfb68bf862ae422d961 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/94f24e699c660162e07d9462dafe31df4ca958ac | ORPH
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9268f1634b6b10f61beb1262788ceb6d1e01c71c |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/cc7e328eab0f725b6ac559fb9e5cfc2fd18bd604 |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/03e6a6d54e6657707da310d7774f13eb4016a089 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/58b85bdf449c26c9bf80986d780247136d8f9fd2 |     
  riscv64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c4328737c9ba0600ddeec9fa73f3ad59ec105b20 | ORPH
  sparc64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/dfb7c7526f176aac148c65f2fce5da553f6bf5d7 |     
  aarch64    | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/d64d3ed3920e90ccd6c9c3c485a57336b5533edf |     
microblazeel |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/051344836f7db9ff57f5e04ba4731bb8f5cd2c0a |     
   mipsel    |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/0fb4bc4ec5309bbf443bd8f2ccabbb336912e3dc |     
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/f86685e786c21661ac0deae42b1d48972d9f1f3f | ORPH
microblazeel |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/53760f906d980a115267d0923684ae58deb75813 | ORPH
 powerpc64   | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/5d6dbbc605d03b56f29eb11e2cad31b3770ad9f0 |     
  mips64el   |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/2d2953113439880b9907322464f3d0d0b88c6d37 |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/6587b091e8de103348436e96052d7606d6bb08f8 |     
  mips64el   | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/6d7658771ec9dea6d3345db248e0b72584bc6831 |     
powerpc64le  |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/62770514a2d663f401d0c351e71b2f18f22b56b5 | ORPH
  riscv64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/46456d1b0fdc3a61eced7aeab9dec66e2376f319 |     
   xtensa    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/97dfeaec7a69f94efd5139cb4cd60af862d30394 |     
   x86_64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/f25a8a62b032c1cc9e03dd45d47e32f0f3ff359e |     
 microblaze  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/19cde534c9303e2c8becc298c556d896971f4f71 |     
   mipsel    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/e1d96b2315eff04358764bd93b6cdbb182fc0d75 | ORPH
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/0943f9eecf197a3ed06e678c7fb9c77a947db686 |     
    i686     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/20ebf129f11fd6933bf21465c7bfa3e53878d33c |     
   mips64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/3578251e1afb31bee875e6b46a3e277b5aca4d2a | ORPH
   armeb     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/4c0e101058429283713eecb829dd7ef72bb03cfd | ORPH
   sh4eb     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/ae09a0474ff52e1d864f6073122336ca4a0c9dee | ORPH
   mipsel    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/31f189f3692da74caa5f239426dba8f5a34be647 | ORPH
 microblaze  |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/21dba252aac792946766e7f025b98633000b80a3 | ORPH
    or1k     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/563c39ac85392f8b08571a1e397e07d91df8ac79 | ORPH
 powerpc64   |          libnss-3.121          | NOK | https://autobuild.buildroot.org/results/809992e9a28fbfeb2a4930d73d7dc7dd757c4fb7 |     
   sh4eb     |          libnss-3.121          | NOK | https://autobuild.buildroot.org/results/4836ebaab19ba03e0409318212312a099192c316 |     
   x86_64    |          libnss-3.121          | NOK | https://autobuild.buildroot.org/results/6f13d2fc755faa36ebbf2a870570a20e53eb9a2e |     
  mips64el   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/4902cf52088fc649a1ee5ac263fea2e354c3d722 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/34220ef92bad56a0a066780e8c4430998c2b1941 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/fbf8632d29e1bb94a678aa1208bb19d06b516fc6 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/485d34b98df8bcc564c1ac15759ca5bb90c551ce | ORPH
  sparc64    |        libostree-2023.8        | NOK | https://autobuild.buildroot.org/results/41b72efb120c7ab6d576b0dd462fbd6654633991 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/af4ab60049a07cad51dc9a08544cec5f1df0e10a |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3e3494a765dd9a8f12adc64c12983d311e7f4b5f |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/86575cf8168262534a300eec5174bda16a9af616 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/166a23e3bb7733b0b1194fa92fdc6a275ed8ab69 |     
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/79b6f7103839b2db04c56ce585112ef5791805f4 | ORPH
  aarch64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/391c5abc492c2eed7c464cc6469766e39197e150 |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/465710625be290990dd3c97b3aab407c6e79850b |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/2ce000da681db644b05d82bd8ede3563575ab692 |     
 aarch64_be  | libyuv-4825d9b29eea4dac2460... | NOK | https://autobuild.buildroot.org/results/26d1e1b8b51aea20690a6de50df0cd88a7419065 |     
  mips64el   |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/0b81114c02fb59dae9f6dea38d49f6686a960ef6 | ORPH
   sh4aeb    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/e89b011550680b93932f6319f1f21a79e76483ba | ORPH
  riscv64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/dd6481851efc34eca2a170057302e1003ee31e2c |     
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b3db01396f70a1baa6a3b63b78cd9c804ba6dba3 | ORPH
    or1k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/99b017666df54075e26c2adc0b710a690fbb79c2 |     
    sh4      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/a9dfa99174461bd4095ea0457deb3ecf25ea61ce |     
   mipsel    |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/2f40175ab3d298b9a71046d359bd376acdba511e |     
    sh4      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/ff95b79e322d60f9c9a9bcc05f784831783037df |     
    arm      |          ltrace-0.8.1          | NOK | https://autobuild.buildroot.org/results/babf11fa5d172d4519b322e2e7112292e3402829 | ORPH
loongarch64  |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/5bdca77dba059a694c207c6b4759fd4f34cb6e16 | ORPH
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/6566f2f8f09e5ed6a827d7cb6c5bbf957d84feb4 |     
    i686     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/cd8aeb489d802edf0bacc2d25358bc4b648d0fa1 |     
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/2b1727ee7ac76496c7fbe128ff1f90b457048926 |     
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/32d371958d0aaba9e7982a1009da039e3932c52a |     
   x86_64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/8be4e5cace4ad2181915563e65b5d95713bff363 |     
    i686     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/aa680de53954b9c8880a5194985d3f9401277d09 |     
   mips64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/1fea1961020f54c1627684d06ce22b2771e7aa86 |     
   mips64    |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/c99d1576f854d55d82548c16ce3bee69ce1414f8 |     
   x86_64    |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/44ef3942a769b68f1a6db6c79944aa219fbc39f7 | ORPH
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/c56c3d8c0b856bbf97c4525eb014ae5e8b505a4c | ORPH
    mips     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/42d5ead3ffa04165919987d42dcb65f38cfa6bcf |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/48204c00c5a48aeb8c35064f56032d93b23cb190 |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/3b645e958e1ea022acd4d65a863a839ae9725774 |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/631b3e776dc215e42bc2c9a213214ddc2b1c8f77 |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/492915ff6812b2d996d9a5dcb51d27670c1ab8ae |     
   mips64    |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/67c08bead07caa145c6088c7019e44c6a3472813 |     
  mips64el   |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/2e69c2ed136a11315968bfbbe03db458c25d23e3 |     
   mips64    |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/15e8f66223bde0e0d55e66eba5207a2890d6f09b |     
    mips     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/522b05da7d71cb8cde0baeb31408e8549d76516b | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/a1ba8f7c342c83199ced01a53dd3f2916a44fcb9 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/5b325d0b45ef4987458940f25d066cd525a3afbb | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/42b99e99d8686d502512aabce3f1c6173489df65 | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/783b0d146231594c4bd4848199d4b4c58f460633 | ORPH
   sh4eb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/1a53a8831b1c3762625bafe8ff323b10352e9040 | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/4517f09c48eb97fc19a113e5721c44eb77288699 | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6fad0476eadf75884710dbd0b1c50092f558188d | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/2972d4c7b3c772960c1216f2466a8ed8f195a734 | ORPH
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/818753040b4f41ee25202f60746b4b835e98a922 |     
 microblaze  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/38a6bffcadb7f2bf185bbacbfd7e921a090c8d3e |     
 microblaze  |           php-8.5.4            | NOK | https://autobuild.buildroot.org/results/cff4fe108157b428e426eeae985452e5e93a8846 |     
    arm      |            poke-3.0            | NOK | https://autobuild.buildroot.org/results/0f22665068bab74e6a13c6f8f060494f24501f09 | ORPH
    mips     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/e42ae1316c99753810738c3f9819fe1e3b0c009e | ORPH
   s390x     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/2784714ac8dec0b3b2152d031cd70f4d73700503 |     
 microblaze  |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/f527f5bc3543217405e778d48c73cc1f4926dc71 |     
 aarch64_be  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/bae32eca8f2d46424f4e4eb918bbc1ac81959e83 |     
   s390x     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/49d3ec279509140b343cc20f814d7a5ca6f3643c |     
    sh4      | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/4c3fb8f42fd7d1b5c0b09dd3c176c1a0591244bf |     
    mips     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/3515406bcd5ce68ac16e9c77032ac7ca937c9e28 |     
microblazeel |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/ccd9a102dac29ba163a330f6828c5c32006e20f6 |     
loongarch64  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/70ae9ca732f95df66afcb2968ad74ffb01b9aa35 | ORPH
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/5093ea061121105c6cba01ba98c02c73261a305c |     
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/02c0b5a147894efce6d97ab86cb2d62cab8a5d52 |     
   xtensa    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/eb104ada37873f8c4dc93005d0e148e16217c381 |     
 microblaze  |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/9b4ef72d68fd25d20e04c54b2755b916dd245649 |     
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c18b1a4c6ba9b1c27c1940193235d64bd02b93f0 | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/79ab7ef1e8499c7c48f329a5dafa9d2e029917da | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/26e912a6fd6ee04a341ce414af625e9c17683867 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/be6455784bc5112b29fb8c946964cb18ae153c5f |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5c74ea288f59d1319e8ca8cfd96c3fd2b099c363 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/f768599df52abb18b3d4ff4c9f4f8b51a7e1c928 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/22a0a04a5e9cf747a637c3b7960f8272e437de7b |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/d6fd9ad38e1b367eaed8383b299ca7fca0560cbb |     
  mips64el   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/3f061dc0a7b5b674edb21dd3a2aebca18914364b | ORPH
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/5bd2dba16561cc5eef87d9a6e2afe13062055e1e | ORPH
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/ffdfbe28edc4e022bf63878510b385f0e81d2b34 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/aa3554c923103361d784d437c488c9d653695930 | ORPH
   armeb     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/d60b3920446f91c2f75801df6206b2b40a9000d0 |     
   mips64    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/2890360911d4a7bc8e364d8aee407248d9363449 | ORPH
  powerpc    |         zlib-ng-2.3.3          | NOK | https://autobuild.buildroot.org/results/91b55086e55f99ae3f1e258d4271432ed3260ae4 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

leafnode2-9543ffaf82406f943... | 2 
               aircrack-ng-1.7 | 1 
                   ccrypt-1.11 | 1 
firmware-utils-86739f2b3ae9... | 1 
                    flac-1.5.0 | 1 
            host-binutils-2.42 | 1 
            host-coreutils-9.8 | 1 
                 host-gdb-14.2 | 1 
host-gobject-introspection-... | 1 
              host-pahole-1.28 | 1 
host-vboot-utils-4b12d392e5... | 1 
      libabseil-cpp-20250127.0 | 1 
      passt-2025_06_11.0293c6f | 1 
          refpolicy-2.20250923 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        aircrack-ng-1.7         | NOK | https://autobuild.buildroot.org/results/d90629962a97f4fe020e16c4d6dff10429f655c7 |     
  powerpc    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/76db29576bbddf91a1f42a0908cc6b4315183433 | ORPH
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/77283389019da72a2ba38227f3ad3b1e852c1cb1 |     
   sh4aeb    |           flac-1.5.0           | NOK | https://autobuild.buildroot.org/results/06d1020eab6ab5606a225603043ca5f9fdb32099 |     
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b76ab1afa95f4e7944e113ce8de11bba858fc50f |     
 powerpc64   |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/e895f94d6b7fe7a817d2d71f64db6fe369aeb97c | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/15d5c1e545164249bf4cb509e35fccde6c468f4e | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/23f05a8aa51474bcea7fd66acc2130ad7859f52b | ORPH
   arceb     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/66a04545ef7acd9b1a2db8ad5d3f4f51193100c9 |     
  sparc64    | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/b5e6e7de94c83b9a698142c68b326b96b18c6f57 |     
    mips     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/1218dcf53889d4f0c8d5321255c1c74de3d23992 |     
loongarch64  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/12898937b5915187be38ca6a6b2304f3f5d50e21 |     
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/f3c9018aca52471e8140485664f40c9833d2dbca |     
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/a4e7d22b8e17ffa624db76958057989254efef10 | ORPH
  aarch64    |      refpolicy-2.20250923      | NOK | https://autobuild.buildroot.org/results/59ea2e29ec67bf954f9df3f27290cd373a9045b4 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/5bad4d1e2f71de05abaa3b36808aaf9384e7b513 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-faketime-0.9.10 | 5 
        host-python-lxml-5.3.0 | 3 
                   perl-5.40.3 | 3 
                       unknown | 3 
                bpftool-v7.1.0 | 2 
                 libmbus-0.9.0 | 2 
             pptp-linux-1.10.0 | 2 
python-remi-2022.7.27-37-g1... | 2 
                   dante-1.4.4 | 1 
                  ffmpeg-6.1.3 | 1 
              fmlib-LSDK-21.08 | 1 
                  giflib-5.2.2 | 1 
  gobject-introspection-1.82.0 | 1 
           host-libtpms-0.10.2 | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.27 | 1 
                  libbpf-1.5.0 | 1 
                libcurl-8.19.0 | 1 
        ltp-testsuite-20250130 | 1 
            lttng-tools-2.13.8 | 1 
                pipewire-1.2.8 | 1 
              tailscale-1.78.1 | 1 
              wireshark-4.2.13 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/ceb780afc49c16ad32692c7b03f0d083afc31bf8 |     
  riscv64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/1bb758c38c58c09d772cdee4cf7998bb5444a73c |     
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ddbc938588ac9a45da048ab4e7629937bd6eb2c1 | ORPH
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/83917d2dace05ef9a11715078c6106d427be7cbc |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/79e9519adb8a703e5e1f2fe6584e93522f28592a | ORPH
powerpc64le  |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/7eddb1dc762b2b034e20056d3cf573d701244107 |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e3e8130dab3afc95e5a2e9309104c70c50c0a8ee | ORPH
  powerpc    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/f179565e84c39c4e24c613667c261db5f7458399 | ORPH
  aarch64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/321b18e214349561d3ce31f9c2b82696a461f9e5 | ORPH
    or1k     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/b58951e289cabfd108a36d678e8935e9c7603057 | ORPH
  aarch64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/34269689ce8123b842ac0c5a6c8fa54a9552517e | ORPH
  riscv32    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/18c7cfffe3063772e43d203ad78c53c2286ea914 | ORPH
  powerpc    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/1cbf0648794373e3a9823251bb0c0b6cfb6e9a62 |     
   sparc     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/edbacafd991a469348bf06192f5f34e4127baa1b | ORPH
  aarch64    |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/4f94fc1ba88ad3df55ee2fcdeb615dc1d8f698af |     
   xtensa    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/a1b7893a757cd761a552dd1280dd19e77f7d4cf1 |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c39867c067f7d19e6651323739390af473496d1d |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b5f958b20d7267e8d5ee480f76943ca1e1bdeaf0 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/7f9f99506173eec357aba1e7a1ce2236a24df45a |     
  mips64el   |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/57216eaf8b8982aaed489fe1d33d8ce8ca8c5373 |     
    i686     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/23f193abc93bc1f3f59ae3ffc03bceb25a99466c | ORPH
   s390x     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/cc5f38aabb36d0920dfee6a299c6df3b4a0c3811 | ORPH
    arc      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/0f8a99ffac041fa1f90454e926178992e97575e6 |     
  sparc64    |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/06d682012acabdfbfe93eee77a1694a748559e5b |     
    mips     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/8b1e203beefd4f8ed94d94723851c902d59dd042 |     
    arc      |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/68f5a590cff2d06110a965ff4ab73a07e4aa41ca |     
 aarch64_be  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/0c50a0c0aed35e86c8b6c68c5b49447a52b97005 |     
   arceb     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/11638eb442676b69b6e16ac947c92bbe94d9c217 |     
   sparc     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/e4a5e14f59cea48f3c1fd7dd8de234c0da5cae9d | ORPH
  powerpc    |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/e8520c23f365f5fc0722ef9442a2472ee1564029 | ORPH
   mips64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/9eb491a0a4d815e2b1a7a3e713c357a0eb957e6c |     
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/0004793838c452ca05824e4cc2522d75d2ce20b4 |     
    arm      |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/6c78fb5377db1ac03799002eac9b8c5d4181381c |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/d954a5ffd118418e2b3196c2e9c36721b49758ee |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3cf75d186b77407a8ef5cba424d32dd12abc1127 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3a718f613e088890c784dd44b761f70fc1103e9b |     
    mips     |        wireshark-4.2.13        | NOK | https://autobuild.buildroot.org/results/6462476a2996951694289b95c953fcadc66a62dc | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B9DFCD0A1
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 04:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86E4C41307;
	Wed, 18 Mar 2026 04:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xm2eq58O1iuY; Wed, 18 Mar 2026 04:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93F1041089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773807942;
	bh=hFueQLA5BpLboBFod5zS+ltN0rZnfjAL+AdASPbNXOE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sH3clstSbqSDxPVpVahFSj9UiCbZzsRpyuJ8rh8ldbC0T9GkKt36StBw8m2h8SR5K
	 Z4AbKexX7xMP1cgB2Hc8+iwkSvZutEpCNuNSbFXOiEud8ALjxkq2D38ZTmHFqkuBDK
	 +R9KCA+QfhATN+cUjVgOnCxXP9nRRxDFB1giPjjdBrGtn1FH2QUkHKacaYNtPXmdP9
	 APGTXVJKLZfV57xIGp1pOwvDj7IlJzpeeRp9w0MKRg+57YNBrAwiDMjatyS8TaeCL4
	 XJq3f/juEBHX7s/H28T0sOI79Pfdp/myL+dsQeMtvcs7H7RclLp2pDFFiLu2reBGe2
	 IAGGT2ww/q3bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F1041089;
	Wed, 18 Mar 2026 04:25:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 711A4D3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 04:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 627614013D
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 04:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id napKEDTIP5xO for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 04:25:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 222D04013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 222D04013B
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 222D04013B
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 04:25:38 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4852f8ac7e9so75670595e9.1
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773807937; x=1774412737;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VuG09Da08t6bzNWqwzcPUA6ve1aa2jQwqmvtPRs/81o=;
 b=bVvoHFKWfxa/6dSn2OL88ir3pO22BPAtKjvBOuO7wUepeq5fHAEgALYbIbBlZDUwR4
 xB0/TyEuuMpLDdzFjksHXH0oXJOpIj76PtQZMXF+eqEWpy2j2S2840EMQvT+XNu3ppA6
 yrkP88OqHp+QwPfFWiSyoDy+QvQHhYpSrq5xwFlQtoo6umzbSn5/O1v6/4z8rLioKLs6
 x0l1tI/WyaIz3CDRA7BZoliUaObeT0duBnRfkY2NfSqoUNUjivJC/SiMrpdyhcLqKvan
 I5a1hkZfqfRlBfrQWrotrSM2V8B4a5tMdhbV/0dLfqtR4u5jfe9RwuxbJGCbMROErTI/
 O5ew==
X-Gm-Message-State: AOJu0Yxm6pRY/H+fK61zFrTnom+5ahIAdAGsLsx3LvTOoCncn+iH2l4B
 ITuj6kKIrTXzRH944RbpHKgYFgP36H3fhTybfhquDiwG7C/VC064P3jrkWblECVf
X-Gm-Gg: ATEYQzyXP1t49LM4J0MqZqCv6rS3Cg0vw/mMbR3Ms519J4uODll30+aFOjQO3ABHXfz
 tsGYiXo3U6s8QV+Vpd/8+0aBtqkuNc6cu9nL116fybhsPi4TG4aYuQQALgXarmISHhDyHdFjCf3
 BWwiuQ0LmXCLuKQ9sYQ2ayrcsWPtfxxm52dkTQ5PRKPUgDogzMxolz1QFV/FX93UkDI/M+wV0Cz
 RkJTnMYmMGNhxhiITKHG/DW3UXwK0apCN2nzVy3fCFpl4JScREuqoAZFIKHoyuyNaNolmks5bhQ
 bDUHf8nUA0IkMLxiCwqebxtBnNjE3jOc8BTwj84/R6ATXINB+pXL3qG7sQpU/VCOAV/mV/nT7RS
 Iry26ItzcW0CgBor0qU9XIp7ZLqkx1SeAKEXUTsCzc+QVQIKzLBEQSjKxQ9nFznXgrnI6lk+Iuv
 TdX82MjzdIqL71Y+ZL/B4vO6XPCA==
X-Received: by 2002:a05:600c:a4b:b0:483:8062:b43 with SMTP id
 5b1f17b1804b1-486f446af0bmr28752375e9.19.1773807936325; 
 Tue, 17 Mar 2026 21:25:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f442d5d0sm32276835e9.9.2026.03.17.21.25.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 21:25:36 -0700 (PDT)
Message-ID: <69ba2940.050a0220.f9008.2f22@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 18 Mar 2026 04:25:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773807937; x=1774412737; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VuG09Da08t6bzNWqwzcPUA6ve1aa2jQwqmvtPRs/81o=;
 b=FYeeHasOT5vKKj0pCc8Ig/+p4oVVicQBipvJeVHXw9PGyOvYdH5w87CJIcXx4EVe7B
 9g/RawLP0h+hN/BPRGfcqjBOAsGEo138FOApgthHIYvNZwEW3RFEYQDBeIJ6V2rkwjcJ
 If4HS4SMIc1Q5524J5O1iOFimYTD1RClF+DRDVWqS846czNXbL56c+QnBxa1PGmXZFSZ
 HG6BHMPTSeefnXhDglYbbQ6q7MH2qI2vBFBgVI4E+u99FUVEyJF85sy2UvQJN5VqVlHD
 LgAYzjcUE1EPmQwROWgBykQFJ7y+2ohWdDo1y0g4kO1Qb+3ekIOhWL7nA0Q6X9w9z9AB
 5mHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FYeeHasO
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-17
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

Autobuild statistics for 2026-03-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 47  |  0  | 64  |
  2025.11.x  |  3  | 22  |  0  | 25  |
    master   | 62  | 156 |  2  | 220 |

Classification of failures by reason for master
-----------------------------------------------

                  libnfs-6.0.2 | 11
                       unknown | 10
                  cairo-1.18.4 | 5 
                flashrom-1.7.0 | 5 
host-gobject-introspection-... | 5 
                   perl-5.42.0 | 5 
          host-mosquitto-2.1.2 | 4 
                 mdevd-0.1.6.5 | 4 
odhcp6c-f19dd37fb467c9cf10c... | 4 
glibc-2.43-10-gc3ceb93dc4f6... | 3 
  gobject-introspection-1.84.0 | 3 
              host-pahole-1.28 | 3 
                 libmbus-0.9.0 | 3 
     libphidget-2.1.9.20190409 | 3 
                       mrp-1.2 | 3 
       shadowsocks-libev-3.3.5 | 3 
               graphene-1.10.8 | 2 
              host-guile-3.0.9 | 2 
            host-protobuf-34.0 | 2 
            igd2-for-linux-2.2 | 2 
               iproute2-6.17.0 | 2 
kismet-52bcb902e36b2df1562c... | 2 
                libcurl-8.19.0 | 2 
libfutils-c326ce0cc2a735438... | 2 
              libopenssl-3.6.1 | 2 
     linux-5.10.246-cip66-rt29 | 2 
                 linux-headers | 2 
               openblas-0.3.31 | 2 
                openntpd-6.8p1 | 2 
               tipidee-0.0.5.1 | 2 
uclibc-ng-test-132c6134d691... | 2 
uhttpd-15346de8d3ba42200249... | 2 
android-tools-4.2.2+git2013... | 1 
             bubblewrap-0.11.0 | 1 
                 c-icap-0.5.10 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
                coreutils-9.10 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                     crun-1.24 | 1 
             dahdi-linux-3.3.0 | 1 
                diffutils-3.12 | 1 
                easydbus-0.1.0 | 1 
                   exim-4.99.1 | 1 
                    gawk-5.4.0 | 1 
           ghostscript-10.06.0 | 1 
                   guile-3.0.9 | 1 
               harfbuzz-13.1.1 | 1 
            host-gnutls-3.8.12 | 1 
                host-odb-2.4.0 | 1 
              host-rust-1.88.0 | 1 
      host-uboot-tools-2025.10 | 1 
host-vboot-utils-4b12d392e5... | 1 
                   i2pd-2.59.0 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
                  kexec-2.0.32 | 1 
                 lcdproc-0.5.9 | 1 
leafnode2-9543ffaf82406f943... | 1 
      libabseil-cpp-20260107.1 | 1 
              libcamera-v0.7.0 | 1 
                libdrm-2.4.131 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
              libsodium-1.0.20 | 1 
               libtheora-1.2.0 | 1 
                 libzlib-1.3.2 | 1 
          linux-5.10.246-cip66 | 1 
                  linux-6.19.8 | 1 
        ltp-testsuite-20250930 | 1 
           lttng-libust-2.14.0 | 1 
                    olsr-0.9.8 | 1 
                openssh-10.2p1 | 1 
            optee-client-4.9.0 | 1 
                     php-8.5.4 | 1 
               postgresql-18.3 | 1 
pthreadpool-560c60d342a7607... | 1 
               pulseaudio-17.0 | 1 
           python-html5lib-1.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 rtl_433-25.02 | 1 
             sigsum-go-v0.13.1 | 1 
              skalibs-2.14.3.0 | 1 
                 systemd-258.4 | 1 
ustream-ssl-5a81c108d20e247... | 1 
  wireguard-tools-1.0.20250521 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/5d8a4c07628f8441432f701e1cb304d50d79463a |     
    arc      |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/45da897f9fe0a8025a37473e99cbf13f19eebea4 |     
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/eb082c1fe467885ce4855edc3e82e66c0d16c074 | ORPH
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/5e0145035b1809f673195d47f5f07f5cde844e6d |     
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/9d94c98b4626f6c04893073add36bdae921651ca |     
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/0c224038509617ddc300cc11e90d9c4eb024a9ab |     
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/07f8eaea3a5f3e4901e35c61c14b44f3ef8a4185 |     
  riscv32    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/fbd93942483711148bb281c08a0e20cf09353c33 |     
microblazeel | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/789b22ac97ab87bc6384dccb8c337eec52d18d81 | ORPH
   sh4aeb    |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/132b9c662afb0b10767a562673dcc023f889cd8b | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/6734acf5184c270cb2f054a8ef832da64a4e876b |     
  mips64el   |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/136682a8dcfcdf0b8b53e8ec3288b1a9d258f323 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b0a22435d809e037f4de6f6389f9ccba6e1dc0de | ORPH
 aarch64_be  |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/e0372afdd890142edd3effebecb334540e66b34a | ORPH
 microblaze  |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/1495d049a2b17525ab00c8a94f6fdfe82c7bb993 |     
    arm      |          exim-4.99.1           | NOK | https://autobuild.buildroot.org/results/3e00036162d29512dd1a8b3413dfde1ad526413d |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/522a83d4dfd6173c769227442a851f2726231846 |     
    m68k     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/b26c1c0767ef15a469bd0dfc0f990fe243b83b8b |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/c1b86baaa02042a8aa0f566fff7a7b6b346b2548 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/678d5a02b1c4fa35a8529a985873f75243e7c1f4 |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/1ba52b65ad162f51e7fdf9ca8f719361a2e06e1b |     
   sparc     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/1f3e30faa896db0526f861d3ad6d09643eb9b75b | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/6db8a6990589a4082b98b1d613c4f01aab09a16a |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/9d8b706ed7537d70cbb92d54e4b6c7e5cddbf2d2 |     
    mips     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/eb37226e6b74b9b1e9ebd7ab990ddcf3bdd72ade |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/6aba0e3ea29ee336de924d8a0c4622d8c9de00c1 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/801daa979b2a92e765a33c4b5048a0ba4455c878 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bb63b2065c51e5592c8e6deed1bb47299225e788 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/34fb55adbaa055264e7743d071dda2c0a80417e8 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/1abece5c9c3a7efad4e38928511caacccc62bf1c | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/e9ca36f3e1fdcba674da269b35a4eba1b41b2ddf | ORPH
powerpc64le  |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/bda21026e09b24b6bde030768fdcee0ebf79d549 |     
   sh4aeb    |        harfbuzz-13.1.1         | NOK | https://autobuild.buildroot.org/results/96f0527de9f266f36db1896900b9b7e565cc93b9 |     
  sparc64    |       host-gnutls-3.8.12       | NOK | https://autobuild.buildroot.org/results/77be7f33d6eac590a28d07beacddf8342056a435 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f838ce9b491d598b72267b4b127a9a17a3e3c022 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/10c890d771651048aa2d51418323d30aa31b1616 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e21694a9963b61de7cd38b87e4a8cfca1ceb3317 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d2a3c3089b6f15d1ec88e7c8a4ed38a986e0314a | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ae07823f26f359529966f49565a10fabb6cfe87a | ORPH
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/baad5e4963b08dd1d3adf8ad1d2dc5bc6b415898 |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/d6324bbbc0065f2bb5c63eee7e1d39afca21a41d |     
powerpc64le  |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/3573d027762f50fd9936029b6e4ebb8bded9aa84 |     
  sparc64    |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/048938268ce6d954154af0448e2b2b0fbd6ab213 |     
 powerpc64   |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/ea01f4b89cf98c8b17ade028213c8549fbbf9309 |     
    arc      |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/73835c5b55105cfa2445143634094566dadb4ec3 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/5ce42b1d852a0b53db1ad664c410ce8d5333fbdd | ORPH
 powerpc64   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ab2c086908cdda49626d2d011079ab1761ab6853 |     
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/f3487dae388857a07dcb8a46718ca271acaf3103 |     
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/cfe206e945f90cccef55f43e03646dbdc5b482e4 |     
    mips     |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/33f6cfd37cb48c15a53b3e7123d5ce8388a0f2ab |     
    or1k     |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/fd6f3ae2b22d12e44c24dbdfa73762e43ea23791 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/f1aad435eedb923dabba1f686118982ae50e51ba |     
    hppa     |    host-uboot-tools-2025.10    | NOK | https://autobuild.buildroot.org/results/07d4b56ccdb5f67c5b1c3c71650cbcb31ed9e842 | ORPH
   s390x     | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/14e3190fbe92ef104573a7605438860466b17c7c |     
 aarch64_be  |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/408bd7dddd0531f86dde5e9646e7ed866d8a8ff2 |     
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0164612bf6bb6ade0bdd042a6d9169c86afa0ff5 |     
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/6786452ab8cd3df8ecc68cfa0313cccdd2896e7e |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/a5e8bf1267322cfcd25c4332e007c9609319ec2d |     
  powerpc    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/c8ff0eb510d95b28749a4efa15c449f5ac116652 |     
    i586     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/a8cd50c7452660d3dc8c4d5a1991f1dbae56d21b |     
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/34b0ee99ba178b752b8a27f47d7f5f666a87fde2 | ORPH
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/d3f51f25fd397f03ded2d077197adeddbfd41a0d |     
  sparc64    | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/be95922fbaa5631c3c503a2164f5cac7d03d9ff5 | ORPH
  aarch64    | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/2f86f8de45ac92bac8925feb35a60ea8cd24efc8 | ORPH
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/fda36b633eea7c192c2f02fdd401116d231912ee | ORPH
microblazeel | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/80aca1011873d67866b7f7aad4abe19a3624457b |     
   mips64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/27cfd84108a164598085d2ea25afa986a0d38d98 |     
   sparc     |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/f4951ed3d7707a906c085f39ba29099e5c792bdb |     
   mips64    |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/b2f30344802a28af4a825afaf31857fe959cd13c |     
    arc      |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/022f287387efeba2b96b37f3b6271d471c9a1144 |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/379908b96a35a3b36d2b036835759cd18e4c9c13 |     
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/d39f38026ac4e81afe1f36b8782eabbc2d8d402b | ORPH
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/04c1b3ac0596789fca34856f8c4502ed445f66f6 |     
 aarch64_be  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/4d235c26b9c0448bae78601c217fad45df92ac2b |     
loongarch64  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/22d9d178dc9bb07dd3986913b50245f770b91839 | ORPH
microblazeel |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/a228156da249f9e0070a804f7024521d9424f30c | ORPH
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/3b12bcffed8d4d8d162fe971e005278f81af7f86 | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/d762f7c3fd4858794aef69ab6ff12ef2ba9cfa2c | ORPH
   xtensa    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/7207e0b504fba74b9f38f14b195f60c3557737cb | ORPH
    sh4      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/0209eddd58a072dba472fd052347bfd763ff0182 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/fface595e7724ee525b14feeeeedb2890f340282 | ORPH
    sh4a     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/39fc66a3011868c8a055a8499c2fc0b83174514c | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/dd634eb56524d2571216e30d305783c7fd4cda05 | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/de4623712f3ff7b58f2b8ad2b6f98698801a26f7 | ORPH
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/ab018295a8fe1e3b3ff7c49d8f071f1cbe68c96c | ORPH
   armeb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/cc6078f88892dc7fc306c926940e1eaf62d25686 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/8ec0ecd7917c0cd6bc8113bfe99ff62aa4c6bb2f | ORPH
   sh4eb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/d094cb3dd06335cce69d7f7212fab6901debef47 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/39ae147b3a500572afa5784e67b4842f4aa1bf00 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/a325c80cee21d0f2598daba54b4249f3a5fc24b6 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6007dd5c7f468fce74ba7b16242199040cf2c1a2 |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/ee1480921885432f5b7670bed8f673cd4228fb1e |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6d13232ae6f3e392c5bfc85bb11b0df61a9f2d36 |     
  mips64el   |        libsodium-1.0.20        | NOK | https://autobuild.buildroot.org/results/0ada8fa1d0827ed76f3f7d9d1489c4b42485483f |     
  riscv64    |        libtheora-1.2.0         | NOK | https://autobuild.buildroot.org/results/55c744ff5b7824a1ba8b7e5b0cff2fffcfdf410c | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f416cb036474b49f9920539d1d30f2899b1227e8 | ORPH
    mips     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/5ab612a2d4ea66703c98e2c3484edd53180bf10a | ORPH
    mips     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/c1ebf5a3554be8effaebcefd1b591f991323ec8c | ORPH
   mipsel    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/295b78116e5442a00144f7778935304eee11387a | ORPH
loongarch64  |          linux-6.19.8          | NOK | https://autobuild.buildroot.org/results/e4c8120991f767f0930b112d6f59dba2ab3c671c | ORPH
    i686     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/c4d76630f8954291da2b95b258966a2ff22412a8 |     
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f63b68442cd4a707fe1c772adf7f87cca203c4a3 |     
    or1k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/43f9a98759b1d8123110e0a2b042056a50791c9c |     
  mips64el   |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/82850d574ddd2e8f7b4be88a10bb01ca4cd0db54 |     
powerpc64le  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/5541a95fa154387cb906142fe5551382584f9b71 |     
loongarch64  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/ce685f3b1669b04ac052f4a0e39556bc1dcbbf88 |     
   mips64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/93fbce3fa0cf79c1cb4c8b9f8246a5ee639648cf |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/702f2a145d85d04c74a8101f6df7f4712e729214 |     
powerpc64le  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/3e2e5cbce3e7516319539ad1b7838dff01c1cb8e |     
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/9b29aec7cee1942e6e6c03131ded266c4486ae73 |     
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/c332085a6748eb4b4299fed683398d1370bff5bc |     
    or1k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/560ab03be7f152621a4f15799df8d4a69ff83d62 |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d6f38a922d1c4da620d98016ac23d7e4e5cca955 |     
    hppa     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/dc3483ac49a3b8077e3bed0ad1e8eeffcd640590 |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/be10539b8138e05d3f959ce21d86b87611c42566 |     
    arc      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/e8dce0bea57a038ef7b1356d6be5b322de9cbe35 | ORPH
 aarch64_be  |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/f795872af8b3f34fd19e8fa6668cf596b06143ed |     
   mips64    |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/52138dabed514ba2350bbb7057acce500cd87934 |     
   mipsel    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/9643076b46957d4dc239538f641ec3659ab8298b | ORPH
    arm      |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/bfde4725ebf073ab8a7e38bc4c86065bdf9d6078 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/487a9cfcad50b690c22129552b2da1973a3a7875 | ORPH
   s390x     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/a75ba52134eba261f3b8a7e43ce2a4cccb666047 |     
    mips     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e05c3e8a3ad266561fe6cd0001eb1930c69709ee |     
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/976b3df7e5de3bd81b4e6eb312d04118fdf71ad9 |     
 aarch64_be  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/487a135514556b6238784ff93b48dd2df6601e08 |     
loongarch64  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/a446bb9134c02494af86d300af63fee214f1b5eb |     
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/5ff0cef43ea661d021d9ff79910ce5703ccc3497 |     
microblazeel |           php-8.5.4            | NOK | https://autobuild.buildroot.org/results/df4a83260e6725f9a0c2a2894048d5feb3b37767 |     
    m68k     |        postgresql-18.3         | NOK | https://autobuild.buildroot.org/results/389f6ee7ca3b37c33ceafe375a82a3923a47ccde |     
  riscv32    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/8faebaf87ba3e8a58ddc5627237dbba7c105782b |     
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/af1cbea7f883508db5168cf3c15cd6b339d9dbc5 | ORPH
  mips64el   |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/9d1fd910419117cfc3936d8c17e75cd98cb65a75 |     
   mipsel    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c985d40413602ad54d9f75fd9d6ae3bc11362b4f |     
   mipsel    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/5bbaaf94edb98e9393e9fd05159cb259bea0c3c4 |     
 powerpc64   |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/94d80db97825365692aaf1fe01faf3172f546f4b | ORPH
powerpc64le  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/042a4f7bb5062259f23237f6aaedc3b758ff0691 | ORPH
  sparc64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/3c5e89ab2b44d57b3762b452871d61754e32bb30 | ORPH
   s390x     |       sigsum-go-v0.13.1        | NOK | https://autobuild.buildroot.org/results/e4b89232f6198ff20f64a9388c3d4d8803b282bd |     
  sparc64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/00e578a672a3e547fa0b832c8b34c01e125bbb84 |     
   mipsel    |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/0f6e260708fabfda879bc8735c690f9db2803690 |     
  sparc64    |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/38c45de9b8ec03133b8f372ae771ea1125cd1268 |     
  aarch64    |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/da590e54e1761e28a16dbd76d4557d8835d01420 |     
   mips64    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/39105ce2b72a222d8419623240c9241ac6635b4e |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/34c645119633e8d5d51f148037e35a9f6ebad49c |     
    hppa     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/70a5fd1ae8eaee30fee19d9db9db07d4b6103f4a | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/680858c2298841d803dd16fe9711f63a858ba39a | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/00eeb527cedfe942331e460bf59ad88ec713f804 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/aac16c50ad78a22da8cfecec8a7d86645e902591 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/33d82c9f9ec063e5fad70a223851d0d4ebbf45eb |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/035426bfd2d9b5f6b936275c4d977eb58aa6369b |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/164066d07a385917e6cef2275c5d25a20693d8b8 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/cded0f7a93be854daecd0d332887eca218536975 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/22c18a0d0a05fa8f255a69fc11d571a0978284e3 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/eac9b11f767c808153e290c67ba6f749871ec2cc |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/860ab385fb9b61ac1b854cb9f5968b485ec5746c |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/63ec95cfbc1abbe284dec9b088337f00c2320ebd |     
  mips64el   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/6ae3af7a66a49a57ab7a5a73710cfda9433f1239 | ORPH
  mips64el   |  wireguard-tools-1.0.20250521  | NOK | https://autobuild.buildroot.org/results/85d059e7f6b25f8dc5bc0cc9c4cc283951cb9ecd |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

           host-libtpms-0.10.2 | 2 
       host-libunistring-1.4.1 | 2 
              libopenssl-3.6.1 | 2 
                openssh-10.2p1 | 2 
                host-odb-2.4.0 | 1 
            igh-ethercat-1.6.3 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
             libgphoto2-2.5.33 | 1 
                 libmbus-0.9.0 | 1 
     libphidget-2.1.9.20190409 | 1 
     linux-5.10.246-cip66-rt29 | 1 
               linux-pam-1.6.1 | 1 
        ltp-testsuite-20250530 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.3 | 1 
        s6-linux-utils-2.6.2.1 | 1 
uclibc-ng-test-132c6134d691... | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/15a3bcb0387822b845bcb4f5343527d4d9ef2244 |     
  sparc64    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/bccea26fb9937c76f88e9f91445bc99fb6e432a4 |     
    arc      |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/10052da2834d1386f6fe19c9577f09d492c79440 |     
  aarch64    |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/7172c0ae06764f784bb52b7f16cbd175b132d885 |     
   sparc     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/278e79d9f0e42d6a8c62dd24d3b61e04ed0cadd4 | ORPH
powerpc64le  |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/6103011f76aa74b3e85d58c226e9dd09076b12ee |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/f6c56b1ce6dee6d73f389c2ec4d4e1532e0df7f3 |     
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/de27c3a266b7beef4cfac39ef10b11db67b25ba0 |     
   arceb     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/a4d8e125bb56c25a31143a520a0ecfa0eeda83c8 | ORPH
   arceb     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/88bf493d5729188fd0e39e820dfc1a6a5d019ac2 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/73308d83a75a41c665ecaabbf663455ec9f2df21 | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/75829ea8ee09ba4c248e8387aef0a2936153dda2 |     
    i586     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/a3889043f2855652a6c4c5fbe55c2b38e7845f7b | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8f6c9750f5aec486e7c068cd0b99863b8746a5ff | ORPH
   sh4eb     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/073268b683dd0a4315bafb52538481433c306701 |     
 powerpc64   |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/4a460e4728f799478edb4745e53f1f92aa9534a9 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b2c666bd2671dd2c8c04a690900fcd5b3b0f8db8 | ORPH
    arc      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/78150e0413d310583142c9ad5ce07e4832962bf4 |     
   sh4eb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/32c3e73319da10dbc8959ea2a50637f0069abc79 |     
   xtensa    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/85ce799be26cd4263d0fa8a2e80254239abf2243 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/03d07c84a9cfd7f46d6c7471e3ab129fb2c9b24e |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/d5c5fe729ef3aee6f67694e2ec9f905f63f7333e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-faketime-0.9.10 | 5 
        host-python-lxml-5.3.0 | 4 
                host-odb-2.4.0 | 2 
              host-pahole-1.27 | 2 
                 libmbus-0.9.0 | 2 
        ltp-testsuite-20250130 | 2 
                   perl-5.40.3 | 2 
               asterisk-22.5.2 | 1 
                  brotli-1.1.0 | 1 
          cloudflared-2025.1.0 | 1 
                   dante-1.4.4 | 1 
               freeipmi-1.6.14 | 1 
                     gdbm-1.24 | 1 
           ghostscript-10.06.0 | 1 
               graphene-1.10.8 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-16.3 | 1 
host-go-bootstrap-stage2-1.... | 1 
           host-go-src-1.23.12 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.508 | 1 
               libgtk2-2.24.33 | 1 
         libhdhomerun-20210624 | 1 
                   libks-2.0.5 | 1 
                  libsepol-3.7 | 1 
                 libzlib-1.3.2 | 1 
                   linux-tools | 1 
                 logsurfer-1.8 | 1 
                memtest86-7.20 | 1 
package/linux-headers/linux... | 1 
uclibc-ng-test-132c6134d691... | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/30e415c120da0562555cd02a7e56eb913bef38e4 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/aae9d284fee36e76334a922a635be836628a4c64 |     
   s390x     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/dfd381ff283c535873c08a1e1aa979dda017ad58 |     
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e58089dfaae31730fa559195a10e2749d7f1acf7 | ORPH
 microblaze  |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/97c9112d11230fa68b45fe07012690ad96e25daa |     
    or1k     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/006acfd36eeda89705a1498e6eeea6a9c27acb22 | ORPH
   sparc     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/6a6b01e1b44e4f046787539e8365e5b58136224f |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/b92de7194145325e1d6500b4542c5895ee5be29c | ORPH
    or1k     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/7706efa71387d1ffac7ac0c7418373e67fc94d29 | ORPH
   xtensa    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/c4170632c12f3f5b6bb8022582c0b8b9b05e94d5 | ORPH
    or1k     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/3ac9272f16582d4c05956a25ee6e7bc54c67a7f9 | ORPH
    i686     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/4c008756c1e21e6d765db524c33ac234c16a2188 | ORPH
   mipsel    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/32fc2f4c558d73af57f2f2c9f45ecf1f0ce8b474 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/5a0f18c7c8b6ceb564855708caafbb26a5e2027f | ORPH
    m68k     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/442ee486646b71888777884059e9b8a130c9e58b | ORPH
   armeb     | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/f6c69d88539c0d839068126d8d61e3efe0d967aa |     
    i686     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/21f8a26fa91ea5b5196fa908f65fbb10d2cfe2cd |     
    i686     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/9600764402a0af1540927f6c0b359ed64c9a5d60 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/5e8245284ea73546b9978532155e97888f1092a6 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6a9ad5995c30575c2e572eadd0aa51221c532b48 | ORPH
  riscv64    |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/406b01f1019f7cbcd9423965deac90d4476cdaa5 |     
  sparc64    |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/cba8837bfe144dfca05ed70df78d997c7e46f29b |     
 aarch64_be  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/83264f47879f6f189c71c399ae645f26c3a5ad54 |     
 aarch64_be  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/ff3529b9328698c6035b7348c61a9431b26ba013 |     
   sh4aeb    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/f4f889240e95a1dc47c93f3b94a3304e43790c67 |     
    m68k     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/d9d3eafb9c244d55726acb3476fc3958809e3afd |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/dc34841992921521fad695ecb1c2b237c6047c4e |     
   mips64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a1891ddfd94d1e2731f48e57e776ee631ee6a6e3 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/85698649484f45e692ce491b8d7ae197e23cd023 |     
powerpc64le  |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/edc68e93a1b4e2c284db024385f9749e04dfae73 |     
  sparc64    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/1199b9bbe1f2f0d7e8f485653262832c033dfa8e |     
 microblaze  |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/bbf3014ae99c5f27e879e279f9697238846c6dc0 | ORPH
    mips     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/e7633cd2b11fb60e595a9b2f314bba1d58001d6a | ORPH
   sparc     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/4741d372bb0754b8b761222f5ae2bf6ff4face06 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/468e6efe417d5c607f1719c4583f44d1cafb45a9 |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/87cec7e3f29b06e48818ecfa82ee206468932544 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/50afca4cecd1736af92da2eaf7316f9a4d3d208b | ORPH
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/bf2af9bf09ade4f792d818f40888723457ba5491 |     
    mips     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/1cb809dda4c07653a34873d06543a69f16ee9bbf |     
microblazeel |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/1a0bfd35d756ce3b108b048bcb6097c9d09ea873 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/1199c8d19c8393ba1410f7e74d7a53f17c501c76 |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/2bc9ce6476a83883c2733cd7a43b1bba75203bf6 |     
microblazeel |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/9cd780607e3df1f52c55c43aba3d7f13129fb34e |     
   xtensa    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/6827096d755a93d2c37950f5ab84db16f6865b34 |     
   mipsel    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/83b5b7dbfefcbaccff1570f6d99b14eacf652454 |     
    or1k     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/cf177763c5b208f08610771e1bcc5d5d040057e8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7ac98fae662488e1285e5617db217961a2cdd2b2 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

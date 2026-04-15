Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B77F531FC
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 03:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA3B96F665;
	Wed, 15 Apr 2026 03:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlgvVgyz9xQX; Wed, 15 Apr 2026 03:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49AF16F667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776223707;
	bh=UrRR2SCdOP3E0BoQTU6of3sRl/emsw+HZM6A0mzEDug=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VXMZSqcxEjxPYew0IAd49t4f/hA60n4Ortw2od0PGUPa3690yVJJV68r2xeCIrM9w
	 TeBM0hK/AqLRuKVmglh+STDSTv2vLkN4+SszaX5L3jQvyPoIiqvJXWFaXzjXEr8pw2
	 Ws7gSbcxyCAt5pXC2PcBz3RmE0GeuTTGB9xmD5lpcOMQOCKt9HjhgOYkL620HyLTpQ
	 GoxE95276fIXVLewfSCPBSA8DVIqmk/D24xxi5GoGtJQpSg0u2U5GUNqjA9lBNiBKz
	 +grg4znH74wyUw/bjDvDhQQkhzSWD16rFHF0yqi+CB04rNK6D17CEOJ+nZl85y5UAZ
	 d6TD0r2hN37QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49AF16F667;
	Wed, 15 Apr 2026 03:28:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80608237
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 03:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7672742606
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 03:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXBkBctHRhFr for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 03:28:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E485540146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E485540146
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E485540146
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 03:28:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43cfe71e5d3so4793331f8f.0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776223702; x=1776828502;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pq5+Bu/KeP8dnlOJVIytDzJ3u261E07ls6dV3ypNdcU=;
 b=ZwdvDJJtokMuNMQiIqtx0v8G6/BbPQ+NhBZgmACBcQ9jPYnFBLLMiTXGqxU+xkwiGn
 yzf3FkpCbbuvsUyOBghzPhYVXgNF01QtmekEOEH2Y/y3WHFCIv1J8LDP0cWB4E5lHyok
 8CFZNjY/iXELIgrtNqH4loK4mloZ7It2Kw/k4aWIFCasRuw0tKL2K//ydiYY7OKHfLPb
 AJO59D3WIPkneXhoUqxkTUkTvu0j/8sKmvpWxEPGP9q6SYD3qKOc/3i8IBr9mCtDrFhC
 Wwe9nm51teMTgYut2UI3XmtSjJn89yPpk6u5Ll9navW/9G3dRHBfITqpR1pP/g3VfEEM
 +DUQ==
X-Gm-Message-State: AOJu0YyluV/zn69vcCMS2bo6GcTewLgGs5DR1mqVbemtJsI+nbzqZNCO
 qlopuElppebjK1T1G4s4RYY9+iBumhEGtnJpMMnAVGfpTRD6bU27Vi7IxDMAZ5A8
X-Gm-Gg: AeBDievwZtvXkMBTTD8DWw4efHf2aY041qIdiIClPorR4Y7XPiCIryYsxtW2jP2tmY4
 oscRjMb1APQaBGwfWZpEKVyXhZBrFRaDCXUogirxw7l7EL9bTmyc9A9U83/AHNtrIiHoXQYsido
 hqnEBQbpSytmOca1Zdvvt1j2oHTAMUEH+2Pd6SKzS1mrPtTh3HlS9Qa2ASYuWKDjJ7dKmcaHNSN
 /xdbqysLO8tOYW4Gg3aMnTOljd8RBz45adpHp+F9w8Qowy07jgHJL23Rh6ByNzH0qDwYDnH6uT6
 HTKpRRz9QAlCfS70gQMWA6U8vkh4/qr9krc47CH9nrWpLwcnghuagiy+M6ADNZ7+W37SH2Ko0HA
 dVqGIQvl+MYE9AKmco2MdITcQH21Xab9vnjFnpGII0AeOQHYE97OcgDfaC3wLMVALDsLAV1vAse
 FbyOkDcfhz9Khmtzpv+P/gmu63YGaliNUVcr3BJpU0
X-Received: by 2002:a5d:5d0b:0:b0:439:b55d:b0e5 with SMTP id
 ffacd0b85a97d-43d642a7a61mr30165636f8f.28.1776223701293; 
 Tue, 14 Apr 2026 20:28:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead33d65asm1401886f8f.4.2026.04.14.20.28.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 20:28:21 -0700 (PDT)
Message-ID: <69df05d5.df0a0220.ac62c.478d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 15 Apr 2026 03:28:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776223702; x=1776828502; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pq5+Bu/KeP8dnlOJVIytDzJ3u261E07ls6dV3ypNdcU=;
 b=U3fVRbTnidB5WSwyRyV1RxzCbeE9gLFx0Pu2B3yaoRiOXTeW2/iLc4YzRxHnVFlXIp
 eL+UtF6L3kTCUG63Klg+Rg+wk8V3nyXP0Ka/jJdXHw4KSiafokoYH5OHv5J2dW10/1wd
 UUEc0kxgMyfaEtYaPzjwlMQ/olDuxXmanOosmLGtxkjdqDq7M1lQCT683NSu3Zwbui+u
 vTxKhM0ZqgTsQdufmfgoyPUTR/SB9wpeBL4+jVV1lvbfNEazIEz0TGdJSV+olj8GOkRJ
 K7t01HdeInOEfhgVpB5zzMgtl++sma28U81+nuqv4qWNYvZVUgBFB885AHJRSfIjoSt+
 Ettw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=U3fVRbTn
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-14
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

Autobuild statistics for 2026-04-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  7  |  0  | 10  |
  2025.11.x  |  1  |  4  |  0  |  5  |
    master   | 32  | 58  |  0  | 90  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.84.0 | 5 
                       unknown | 5 
odhcp6c-f19dd37fb467c9cf10c... | 4 
             dahdi-linux-3.3.0 | 2 
        edk2-edk2-stable202602 | 2 
                flashrom-1.7.0 | 2 
glibc-2.43-17-gdd9945c0ba40... | 2 
              host-guile-3.0.9 | 2 
                  libnfs-6.0.2 | 2 
                openssh-10.3p1 | 2 
          cloudflared-2025.8.1 | 1 
   dovecot-pigeonhole-0.5.21.1 | 1 
                   gvfs-1.57.2 | 1 
          host-gcc-final-8.4.0 | 1 
                 host-gdb-15.2 | 1 
            igh-ethercat-1.6.8 | 1 
                 imlib2-1.12.5 | 1 
                  libbpf-1.6.2 | 1 
                libcurl-8.19.0 | 1 
             libgphoto2-2.5.33 | 1 
           libmicrohttpd-1.0.3 | 1 
                  libnss-3.122 | 1 
                libressl-3.9.2 | 1 
               libtalloc-2.4.4 | 1 
                 libzip-1.11.4 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260130 | 1 
            minizip-zlib-1.3.1 | 1 
                  nginx-1.28.1 | 1 
           oath-toolkit-2.6.14 | 1 
                 openmpi-4.1.8 | 1 
                openocd-0.12.0 | 1 
            optee-client-4.9.0 | 1 
phidgetwebservice-2.1.9.201... | 1 
                     php-8.5.5 | 1 
                 s6-rc-0.5.5.0 | 1 
       shadowsocks-libev-3.3.5 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/f703fb5a01992c33f0131a1a562bddbe5ff0f033 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/36d4dc2292d940dc91c5916d030f1aa25c0f4c32 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bd7ec69998cfe1c05a53722c9eebe5ad55e47e4b | ORPH
loongarch64  |  dovecot-pigeonhole-0.5.21.1   | NOK | https://autobuild.buildroot.org/results/447ae5cf51b1c5cdeb43217db84ec4aed4b81e9e |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ec7dfbfec14e8e6aad792d3dc65eb9abedd5c815 |     
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ef2b10ebc26134a40753297f9606766ef518d3dd |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/7bc3997e55f76112206a70e498179cb2883f942a |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/d6e193dc1b99c2fcbc6c61de80bd1e4a67cd366b |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/dec2b411e922cf15e2d03847269e491de37876f1 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/b430711f51225f469c5e8d9e74fd7a750368fdbd |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6bb05cf598e86ba3299d366e16dab88be3f5518c | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1a3d5963c4463610a5ab1e63d82f38f2ace404cc | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f7de48215a2129afc40e8c391e91e5083ea15429 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/379d994db013a0ff847130ad9970f5a5ef3f0901 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/227fc8b7137732c697db8f0a0e653a2e2a0589af | ORPH
 powerpc64   |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/3f7b58b5ba04aab7735e60756addfc5bd5f35132 | ORPH
  powerpc    |      host-gcc-final-8.4.0      | NOK | https://autobuild.buildroot.org/results/c9ba185ffe39a0d468b28c0d338dc38f0670c2aa |     
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6734b9337f15ef3e22da19144dbacbe429ac8f85 | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3e594710a4626059d14ee5e6e7367a46d45e27a4 |     
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b0367b13e3e0371a20afe5854f361b1e4bbf268f |     
 microblaze  |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/060f35c5af1f8321f8fa66192c18330b02aa6d4f |     
   xtensa    |         imlib2-1.12.5          | NOK | https://autobuild.buildroot.org/results/cf46f9ec566bb4aeb9b845d070369ceb2276a03e |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/3bce73efec73eb6b8222bd84ad1cffc9246ec0e2 |     
  mips64el   |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/6c658b0e5ce7ab4be27a05a49dd065c6f85e9729 |     
    sh4      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/e09f225a5c7fab6e40f36b96163dabf11986e348 |     
  riscv64    |      libmicrohttpd-1.0.3       | NOK | https://autobuild.buildroot.org/results/94c2e100c3b044a482cd383d3751224c5c8a8028 |     
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/9f6955d92b977e6d814dcb6244d6e549bbd63a69 | ORPH
   armeb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/21277fc35add11c51b184b4b6a3deba72126a59a | ORPH
 powerpc64   |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/3bc7a9725e3f53fd89f21fb50ff63457bdf53652 |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/28f4f95e166eee44b3d70b4fc19ed96181423d13 | ORPH
   sh4aeb    |        libtalloc-2.4.4         | NOK | https://autobuild.buildroot.org/results/5d7f9ca9482c0a5fd76cab4dd83d46dda142c028 |     
    arc      |         libzip-1.11.4          | NOK | https://autobuild.buildroot.org/results/63a89487e6eec9ba653c87b153d164bf58c76b77 | ORPH
microblazeel |          linux-tools           | NOK | https://autobuild.buildroot.org/results/51956e5547cbbe18f98ae037cfc9fedf8c307f2f | ORPH
   sh4eb     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/8210718d2be1734d57eb6fe46e74ef5edc1d3cf5 |     
    arc      |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/a58672240a8eb78403f4d88e6b8e7faa8c76fec3 |     
   sparc     |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/56dd46d65d3dfef9d529d532320dbe5f7f391a13 | ORPH
  sparc64    |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/3157c49bb4ac2354b153c41a58f0fffccf6c94dd |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/b5769ed5588e026675bc6b6afb36c7b057f2f94a |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/a1361e8c1628be302890da7747ceb6861470296b |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/352e349ad3f75a8d71e9a57705f6fceedfa3dbc1 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ab39cae868e047c9a7772491bd0208677276eacb |     
microblazeel |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/93e274c17c32786bd7e9a586151f3c8f1f97ab6f |     
  riscv32    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/d4e09db93e4bd0efe02e3e263c8f45b49d56abdd | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/dbc6d4868dc601d9b75e8c57afa31d910901dded | ORPH
    mips     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/fdb58b1e5fe759d9ec8411f7422ac5e06576bc06 | ORPH
    arm      |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/50b774d2c0b9c914f888f7a8c98bbbd69c8eae67 |     
  powerpc    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/68c4ebd16fba705ede88b624793c37edfc67c910 |     
   sh4aeb    |           php-8.5.5            | NOK | https://autobuild.buildroot.org/results/1306a343a32ada03e78a3ffc9e34230701204efd |     
   s390x     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/6305301b614eeedf60946267515510a95363d36b |     
powerpc64le  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/f916886eda5a3c9faf1421ec53eb3e77178cf5f9 | ORPH
 microblaze  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f6ae545d7da13025a3ee629db747d98afc514819 | ORPH
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/072ea3d8da99a6b3a9cf96f34552dac46b2b88bc |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/09dda596d38a7e33389bed3b3055dd20e4511be4 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/aa4acc701096a8f9d21b8dda44668c3ddc1b662a |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/354d065f2cc5783cc876eda6f0694951748a7d42 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/90f9d3c0c5045e5fafaa506d692f689143246c94 |     
  mips64el   |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/715a1c0ae0fb8a9b6f0d5871fe25ba3cfa16cfb2 | ORPH
  powerpc    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/881a38506c82e6fb197465cf4447f9e9c0ee31e2 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                  brotli-1.2.0 | 1 
             dahdi-linux-3.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
                libmpeg2-0.5.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/bbeacf9b2f653cef4255489b11eb55e8e6e82a00 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/981647d51c0907566d4b1e1c624b7b0f44e68920 | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/1af6480100f4751e4f3f94ac9017b32e78a54272 |     
  aarch64    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/8a520288dbd9355f223bd4a2945c19ffcef6d9be | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  cairo-1.18.4 | 1 
                   dante-1.4.4 | 1 
                   foot-1.16.2 | 1 
                 gerbera-2.4.1 | 1 
                 openssh-9.9p2 | 1 
package/wine/wine.mk:347: w... | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/175831f0313bb7f9b7abc736acb109d206059224 |     
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/39030cf9f57f222b3799bc401210633dc87e29be | ORPH
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/49ec9bb1011eb11a5996cc01ecbbdbd22444cd6c | ORPH
 aarch64_be  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/6a5f6e92a688392595ac33f6458f8e54ab6de0d3 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/f0fee428cef154df3bb19ab39a31ebde84b64fdf | ORPH
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/748ffa5f6714e28e797fe46c441aca2b22120002 |     
   s390x     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/0d4f0c1f3f45f237e94f61d7c270cb66ed70910e |     


Gitlab CI results for 2026-04-14
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...68xxxGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904089421 | ORPH 
...onPy3SdbusModemmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904075359 | ORPH 
    TestHostPythonPyfatfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904073477 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904071794 |      
         TestHostPythonFs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904070479 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066491 |      
           TestPodmanTini | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066346 | ORPH 
  TestPodmanSlirpNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066230 | ORPH 
  TestPodmanSlirpIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066169 | ORPH 
       TestPodmanNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066084 | ORPH 
       TestPodmanIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13904065988 | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13885992028 | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13885992020 |      
        TestMesa3DRusticl | https://gitlab.com/buildroot.org/buildroot/-/jobs/13885991999 |      
            TestJailhouse | https://gitlab.com/buildroot.org/buildroot/-/jobs/13885991893 |      
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/13885991791 | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/13885991726 | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/13885991722 | ORPH 
                  TestXfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13885991703 |      
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13885991666 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A76F99C86
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 03:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B4540580;
	Sun, 19 Apr 2026 03:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0Mcfw7YaUuF; Sun, 19 Apr 2026 03:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 051C94058B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776569121;
	bh=co6QhNCF8nVF+FX7Rc1xc9YGwHAMVs7L9/0uqzxCDFo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TlLbb5MCTTfHTDyEJPQLFUeZ8cmnvaSDGDWIcBuZVx0+I3CT+QHDigj9DrxK/RxPP
	 Ci8BP6mG6QU7ep8Sp3eqfi9qb/u3CxizfxepharhPC2Kk/ttO6/DOizVAtr9j2kXL6
	 70n/pgiGzHKURnRe0AmyGIHBGFkim8D7pOio03PzkTLyCE/uECSCQdx+nOymb4R6kK
	 RnhmFm1//vvRGrHEF74luM++Kghu7vHk8hcvwm9D5HitJ4BIzz2MJBRQyuEF+AOB3p
	 oxOHN72/HwKuD/E1Kom26BvSTEK0212X4dcLKx3/zP4JJZld6QKXfnRkCD1DqFdazS
	 KxP7zUj4qli3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051C94058B;
	Sun, 19 Apr 2026 03:25:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44C18259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 03:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 352C2813AC
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 03:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NO9YhXYgmMnh for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 03:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C29280DE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C29280DE0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C29280DE0
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 03:25:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488b0046078so18241955e9.1
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 20:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776569115; x=1777173915;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9yZm9YACTqmL5wCDVUuyyw0zr63hAG8VxZxt7NnOx4=;
 b=AXq1+YJ6uvGtEMXETpSoxRmbY6S5CJw5ql9dE89fbPhVM7kWuTK6DH95ZfWFz7gT6v
 wx0FxfxFnSZBFUiOO85dKvs2AuVlAdc+UAJl6ZKgBy3w7tq/ZmZsAJ9ElxcRZAPTRTL7
 +CK2yWRqFjRIZ44U+PeO1ov4Xhss8aEI0tpYu8RoxYviPB+b/TwQERJapusq6jh72nWz
 U8/9NrtO+9NgQJQITbbtTC/SqD9J67D67TRdYlR7owjn/f6BNy1yBYcsoTTygQRG8Tf0
 +cESPv0gTuNMxUlYWkaGQRpDViP8bDZI0a3ZxwDBXsR5T/1x7eAD+RJuUTtmt/b6qwRN
 xtlQ==
X-Gm-Message-State: AOJu0Yyv6VENltoJ3ypeAWbLIYTbhesxKpnFwTcht2Lxp+tQ8CwQ/JPo
 +tpraEB7YiW6TSGiZNMYsy335IqCx7YKV6cMyP378Njh3jZnlTWrE1nhH1IostEp
X-Gm-Gg: AeBDies8B0ln594xaCOu0xZFxMWznoCNUbKivqawDssFNwH19CpKniPjRln0mfOjwUU
 gEggEcAe71+vIW4D7WLanZv4iYC42YjC5pUi13gp0NnpiXdE+B30bRrrVVJ/oMQ3HyRas/gzrRl
 83eQ2eZaNhc/2Z3JQOCFOAUhAWkSd1qCtv3z6y/rorEL0wEfOx/imDWtWToUdCJ5eM9UH8ZG4CE
 n6nXmz7t+nZenCUh/76q9IXP9t2bTmI3mBfMAxmHk5LVjqwgkjoQDZJC1VrLcFlinFa4pQ1J2M+
 9v2H4omiLZgHSdkc2hyWD4l4eHjOJr4cQF8/wLwKBLOv9eIw1PrL2Sqp6qUAGUyptTOjU+VirbS
 4LT7c8Y6o5N5JekUhPRKNeS3iDXbHDZ4yQBi18PY1MoVOzuVvXZu4moBd+41DNT8aZQ5LjmPph0
 BMS/PIcSzY/vX+EMZxl21nQQSIog1t/27yMabDEcQvYIZ95kE9lW4=
X-Received: by 2002:a5d:5889:0:b0:43c:f8b4:e58 with SMTP id
 ffacd0b85a97d-43fe3e0c7ebmr13384101f8f.41.1776569114940; 
 Sat, 18 Apr 2026 20:25:14 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4dc26a3sm19637878f8f.15.2026.04.18.20.25.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 20:25:14 -0700 (PDT)
Message-ID: <69e44b1a.5d0a0220.3108f9.bbd5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 19 Apr 2026 03:25:14 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776569115; x=1777173915; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=N9yZm9YACTqmL5wCDVUuyyw0zr63hAG8VxZxt7NnOx4=;
 b=M1JkFyoE+J5a7089WA0NIJeb/5pyT9+HNysPGolpVMLtFATUYvf3nmr1MVighCLmvw
 ZQh6Imvtqwz2rq+yTPnVh/Azk5kaqbJj/8jFewo2fbPFD+qSdqNnFsUVfqWuvUHHhnYW
 sg5TzKQJ3gTO3MLN/Ceqkh+okD6Ub/boAvcIwavVj+X+MyX2hz5v4HnrafSixGR6oc8W
 WR2UQfesQ2f64cO6pANpyu9/OjlHzwAtWDvbE6JrDYQ6EIfCMWRBGiUs1PhX5TKwfATi
 P8I8Zn73vVgwL4QX7aKwbfHlWkuFDMvbGDEZkOwsDS1FbZI+RQ1FgxaM7R+SJNE4hpUh
 6yRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=M1JkFyoE
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-18
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

Autobuild statistics for 2026-04-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 13  |  7  |  0  | 20  |
  2025.11.x  |  0  |  4  |  0  |  4  |
    master   | 40  | 72  |  4  | 116 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 9 
odhcp6c-f19dd37fb467c9cf10c... | 4 
              libopenssl-3.6.2 | 3 
                   linux-tools | 3 
                       mrp-1.2 | 3 
                   dante-1.4.4 | 2 
             libgphoto2-2.5.33 | 2 
                 libzlib-1.3.2 | 2 
                 linux-headers | 2 
                    lua-ev-1.5 | 2 
ustream-ssl-5a81c108d20e247... | 2 
             util-linux-2.41.3 | 2 
           at-spi2-core-2.58.2 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                   bird-2.15.1 | 1 
             dahdi-linux-3.3.0 | 1 
                enscript-1.6.6 | 1 
              erlang-26.2.5.15 | 1 
                flashrom-1.7.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.43-17-gdd9945c0ba40... | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.94.1 | 1 
          host-rust-bin-1.94.1 | 1 
                   i2pd-2.59.0 | 1 
                  kexec-2.0.32 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                       libcurl | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                  libnfs-6.0.2 | 1 
             libopenaptx-0.2.1 | 1 
           libvncserver-0.9.15 | 1 
                linux-firmware | 1 
            lua-sdl2-2.0.5-6.0 | 1 
            minizip-zlib-1.3.1 | 1 
                     mtd-2.3.1 | 1 
           oath-toolkit-2.6.14 | 1 
                openntpd-6.8p1 | 1 
                openscap-1.4.3 | 1 
            optee-client-4.9.0 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.42.2 | 1 
                     php-8.5.5 | 1 
                pipewire-1.2.8 | 1 
          powerpc-utils-1.3.11 | 1 
           python-html5lib-1.1 | 1 
              python-xlib-0.33 | 1 
                suricata-8.0.4 | 1 
                tinifier-4.1.0 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.01 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/bb1175a3dc91dd27d56e9521ef54ade77829be4f |     
microblazeel | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/c42332437aa6f4703e3659f8f2687f1469c52f19 |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/0eee9eefddba9c33c34ccfd4065059b20682e7e1 |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/af93c26954fe30dc3e07052893274c3dc480f8a7 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/d22b465dabb7e4083f8009db61e5d1b509fd93c7 | ORPH
 aarch64_be  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/70709b16acbdabbd55f4f153aa556c18abcd345f | ORPH
microblazeel |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/ffa54256ba23c820cb57d091d02428378caa155f | ORPH
    i486     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/d366f4ff0f2e8a6c24ff7718b66b7b617b148487 |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/40927886b0d3d308d247e2bc5b38eb31055f948f |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/c97c0ff024cb239fead6d5a5532b03de0b7986df | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/e7f3ec27e719da708eba0722e946de26ec2d144e |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/0a319bba2c28941d776c69f090a2627facc6324c |     
   armeb     |        host-rust-1.94.1        | NOK | https://autobuild.buildroot.org/results/b585dbd9c3ac6f6915a403afb2b2eb1cf3a8432f |     
 powerpc64   |      host-rust-bin-1.94.1      | NOK | https://autobuild.buildroot.org/results/2163f07ff8d42cd1f749a89f197e76a6de76220c |     
    or1k     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/a195e21c9716f0d99a2442514b9d050373f2afb6 |     
  riscv32    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/ae218df6c01889640ffc63e119d322305c443bfe |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/897bfb05f9dccebfe8048913ee9a2b074a33ad50 | ORPH
  mips64el   |            libcurl             | TIM | https://autobuild.buildroot.org/results/11d8ac3e569387e9151ff23411f784a7dbbfe74b |     
    i686     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/c22cce2defb68d8fd3144cef0e7c313f768bcfa7 |     
  mips64el   |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/f11b0d7f0aa4839bb67563360300ee936a7c3882 |     
    or1k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/dfb56d1614b430c5b5290f244bbd034d78308dd9 |     
   armeb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/0f6fd27186475e78be39270ed140b27c71ee91ba | ORPH
   sparc     |       libopenaptx-0.2.1        | NOK | https://autobuild.buildroot.org/results/da7afedd6acdd3a6ba5bcd48e405223576b0e18d |     
   mips64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/6eabddde12a439e940f549220b2d5e1dc131d01b | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/248abd9d75cf74b10b9b1f55d00719db6763f728 | ORPH
    arc      |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/fc7362883cdd6cacf205048f28016d4f86fe5d87 | ORPH
    hppa     |      libvncserver-0.9.15       | NOK | https://autobuild.buildroot.org/results/cde0c0320b13039a89c2418bffeef25655288420 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f1b376a941c924365a494238320aeb0d6e060948 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f7012cc46710901c54a3330cb66316fbda1d9e4d | ORPH
   armeb     |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/472c8fa1450eb9a9716aa6c035a79b5a578894ff |     
    mips     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/e47c44dd447f3583287ac0d2edc853545dd4ac0e |     
 aarch64_be  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/ed86a804daff05f83ff92695acbddc6b487d98d5 |     
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/fc4723e6f70421159abce3a92cd570251681ff3a | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/ee647efa9e5126dad4d798e48a062d33ad7eaa59 | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/542761d7e191cf3537ee045f1bcdec19f1316271 | ORPH
   mips64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/c4d5debf859f39349086dab20e51a234dfbf41a5 |     
 microblaze  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/29ef5c170ec39be92cf9cb69fa1aeb70460866be |     
   x86_64    |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/20110d054a30dc34f0ea0ab1cd166e76d8833a01 |     
    arm      |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/715ca08f722983676383146523a0c51ac644b512 |     
    arm      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/054501130639e90b8526353a5c525514e0f0e795 |     
    arc      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/b708b6b2db51e487be6f44a37b6b13430d89e072 |     
   mipsel    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/8442d7afb9191128b00dec6d14e94ea5aa2fe71e |     
   sparc     |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/cf8aea591c94c78b693c2815cce9be01b07a1aca |     
    or1k     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/dddd9938c319cb79e9b912bdfa128eb9d85663cd |     
    i686     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/9e9ec7ad43a4066ad2955fd18021cb9f69a2a38b |     
    arm      | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/099acd456f5b08c30a20fd4e3163a5d0184eeca8 |     
    i686     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/6016f8e91246cac91a8315d151b0c3d5db538431 |     
   xtensa    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/93a00f21880360a615b9fdb4185296bb6a886d4d |     
   mips64    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/d63799ac1e35bfe742c847dcdf5ec94f6f20cd7e | ORPH
    m68k     |         openscap-1.4.3         | NOK | https://autobuild.buildroot.org/results/7f1b74b04246ce0c8282a00533d04e054e81a1f7 |     
 aarch64_be  |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/607910cb42d3fd0559aa139fb980b562860ac474 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/e23c0113c057543e8675e93c65fea9d620c87d17 |     
   mips64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4857eeedcbf8bd16af61f0ece631c63a8b1555b4 |     
microblazeel |           php-8.5.5            | NOK | https://autobuild.buildroot.org/results/db75e2f523da6c634ca497f8179a3e101fea2d1c |     
 aarch64_be  |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/347985221d698540a5f3defda86882282d13d1eb |     
powerpc64le  |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/b45358d3f590cc1a45454ec781e1679f67505a90 | ORPH
   sparc     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/f7de64dc054ab0150f19862882a129d509091c3c |     
powerpc64le  |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/d0f21a40f78ec40c24f2443f9a5fd38cfd5d42cf |     
  sparc64    |         suricata-8.0.4         | NOK | https://autobuild.buildroot.org/results/93de864bf2a7ad9b18ffc06288b78ae265afc14e |     
    i686     |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/fc36569d0a9a0f92b36a98a84d8a27a890140484 |     
   s390x     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/3f7cf309dd95712c0b77f9ede31b551b692de36c | ORPH
  mips64el   |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/055a5594a37f21c31da26207219e9b4f0c812c9d | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/edcfd895ea1e4b934c74d28e7da8fd1960f9f07d |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/1a842b81a38f9439a126101b0b74b9ef4bc65998 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3001c2547b77cada7bf436828329bd44f761d7bc |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/b559c579a31211a1afbf08c8880029a37df6c6f2 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/7563c1660873419619ac3f62ae1a0ba0b9afce19 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/d9ba47ae413db7a729c23369439e0c2fb529b906 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/f161c93643717aaa94164ce112a74e902fc9eba4 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/22ca4eed3ee80d6b7b3019731591ed9ecd699a05 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/882427015d5af99bd9aac7d394d9e15c2a3c26e6 |     
    arm      | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/41b719bbecf13c0d29ff4bfd33b1593ea720556d | ORPH
   mips64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/0333845691ab5677dbaf070f7fb5af761902a3b0 | ORPH
  powerpc    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/550709fd6467683fea0420c6c881d535a2baeece |     
 microblaze  |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/758c519e44fb50cebaaeb5621eaecbbd7ed9d4dc |     
   mipsel    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/87ee235b51fdd970b44931542b0f20b713129d5e |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                 c-icap-0.5.10 | 1 
                  ethtool-6.15 | 1 
     libphidget-2.1.9.20190409 | 1 
package/linux-headers/linux... | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/3b31be9a8b825b1251a44b32ff98d64550245405 | ORPH
   sh4aeb    |          ethtool-6.15          | NOK | https://autobuild.buildroot.org/results/a76348fb323be3be511624d387e554991d8b5e6e |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6c8f45559a106392ed71e4c832064c5b6db61618 |     
   x86_64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ec8f3a57db3416560094a7729b63c867c35811ee |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               graphene-1.10.8 | 1 
        host-python-lxml-5.3.0 | 1 
              libopenssl-3.5.6 | 1 
libuci-f3fc0b76040685829191... | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
                 samba4-4.21.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/5d52fa1a6db9b7a40ee8606f51fcb4b559adf7e5 | ORPH
   arceb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/660bd8037a5567f8390fe60884a0652b13872bff |     
  riscv64    |        libopenssl-3.5.6        | NOK | https://autobuild.buildroot.org/results/bb127e0f9f36413bbd137fcabf424ca94f7ffa1f | ORPH
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/aad18e7a8dbd108f15a020f60b1eed0cc692c4bc |     
    sh4      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/19f99d74e62a99c518be848e7e1f900d36fba80a |     
   mipsel    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/24f9c69a7fa28d7f02b05473afe7c87e3927c752 |     
 microblaze  |         samba4-4.21.9          | NOK | https://autobuild.buildroot.org/results/a98b1f97f0cd848a09c90effe5c34697c62fcb35 |     


Gitlab CI results for 2026-04-18
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876899 |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876900 |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876901 |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876902 |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876905 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876907 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876915 |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876917 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876918 |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876919 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876920 |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876932 |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876936 |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876938 |      
                        coolpi_4b | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876948 | ORPH 
                engicam_px30_core | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876951 |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876979 |      
                 hifive_unmatched | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876980 | ORPH 
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13941876982 |      
                       imx8mm-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961980095 | ORPH 
                  imx8mn-ddr4-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961979687 | ORPH 
                       imx8mp-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961980490 | ORPH 
                        imx93-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961980733 | ORPH 
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961980978 |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961981277 |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961984291 |      
                  orangepi_5_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961987179 |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961987053 |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961987189 |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961987574 |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961987899 |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961987477 |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961988103 |      
                  orangepi_zero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961988191 |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961988047 |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961988672 |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961988351 |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961988608 |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961988880 |      
            polyhex_debix_model_a | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961989111 | ORPH 
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961986361 |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979791377 |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979791519 |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979791439 |      
               sipeed_licheepi_4a | https://gitlab.com/buildroot.org/buildroot/-/jobs/13961986989 |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979791571 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979791667 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979791895 |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979793407 |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979793348 |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979793470 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979793602 | ORPH 
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979792058 |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979794049 |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979793168 |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979794189 |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979794209 |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979794281 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979794311 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979794344 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13979794622 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A11E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 06:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DAF7406F2;
	Sun, 28 Dec 2025 06:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0WvNj1v26Yq; Sun, 28 Dec 2025 06:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08CB3406E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766902036;
	bh=plFJecyhlmligLNC/UM5BE9F3kueFmfO9v0YLLZ+eoY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cZvXcuNkbXfTW5BRPUB/jdeM+btTAKHFELNgqMzEpSMzSTh6ajcvtbHIgK5kUfizL
	 oYJCqlXwO3vrDmSYdm1gka1A0p2QoDKpJlhRMYthAfFRrewWxryOMrQHffox8o5Egn
	 2mWNiGAZ3v0yZxAFmji3HbQj3PFkmSNyvOJFnRNd7IiP8rMnhWaY4F7JhPQePHzWrV
	 LBHUq4Pd7a0CvT/P2MErXKlxzb7Zrb5L2ZIbGwYQmbGY5fF+MrSie4Yx/4Og7gNsuv
	 rD2yDB39F6W5m50a+BGuRRGEWuMK0F21ZzrhkSgQAYT0SFn4J3mOhSvzqLc9Ax4wA9
	 Ez9oD7Dh570/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08CB3406E6;
	Sun, 28 Dec 2025 06:07:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E62791E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 06:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D85E980D20
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 06:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0DTw0fs6fGg for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 06:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C04B280CF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04B280CF3
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C04B280CF3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 06:07:11 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64b9dfc146fso10194443a12.0
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766902029; x=1767506829;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pwroqb4Otxdu+G214mqbT7XNeTIq0ElYDllhjXHdGhk=;
 b=pbap6ELYd0z6rK3PA2KbYmFwkq9HiI8voKTu4H/u2qseK6uuUQjSp/87rUuVIdKOP2
 y8OIcUxMAVp3ujVBbwrJN2bq36w/WpusbHVIuwBXf+ZdsFGQaxTDuFIxTuY0g7VCoqCB
 b/pt5GAZev+Adw12hzaZtozdl+VdnyCYM1VGlWT5mCja1LEWi7Qj2Dv1GrldpyknJxo6
 hsdD+CPaFXZ3MJypqhFbrEBy0WPTpDq3NuT204Xv3ym8LebpE+10aKSGzCptqVya8O4I
 J7hSi/12RBMxSobVfT7OfmzP7bPEfpeUqF8A2Bj+uIFEbnOjZY66ncy0lrxLSHhZ+Rpk
 90Nw==
X-Gm-Message-State: AOJu0YzklNlIk/1YtixM5e64iKBfDZxFXxNlo0blCteS4tX3LAQQ9WNQ
 pFccNMrCiJNi71VAYS4zUF8gihZSDiAJd9Lnhl9K0vFkCNq8j1YS1UYMfnN0ag==
X-Gm-Gg: AY/fxX77gc2xQUcCYxVy1h7Qp/0Pov9RfMPJdOxxRkOy3fUYA3No9Nny2cdnVb2yFoU
 XPezsMhG/DxOTut3FTerK/7871byaaXpWmutkM1ZA5Aar3hECHtCZJouj4i5McKWOe8G8/hu4pk
 BtzTVOVqPXWgASOALoyDIKir33h4fU5H0uWRblDXWlif3zT9IpvcGB5NJBiJRbxLeATY4kOUa+3
 Kz7otjXTMgs4dnmugqDgkVEnq8XgAWQF4ASgF0JBJehKu3LrNKCots+bGSKkaSs5dUrOskqLYI1
 PIoUponmj4gdfOLSQuf7p9sV+8FMtr9epv8cpR7w3Yt6x+T0fxv7gkb3tqKJuKVmY4fZXFFiBn6
 jdlgq2eHQwPHQ7pTmXZq7a4//awTRnDKytshsquqL3wa6ur/mQ38Q5fN6wynTjuh0JkMUF6KOaC
 ZRsei0too+2CBl3AqXiA==
X-Google-Smtp-Source: AGHT+IFc/sRgZb03R8Kbr3pHfnrsS96lA5vZ/u1SJwy0jh/JHNr2+bbZ9gnzyzWHD82U7WF+N0Jz9Q==
X-Received: by 2002:a5d:64e9:0:b0:431:382:f141 with SMTP id
 ffacd0b85a97d-4324e3f5da3mr40172212f8f.12.1766895468649; 
 Sat, 27 Dec 2025 20:17:48 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea82feasm54993092f8f.24.2025.12.27.20.17.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 20:17:48 -0800 (PST)
Message-ID: <6950af6c.5d0a0220.11900.7223@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 28 Dec 2025 04:17:48 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766902029; x=1767506829; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Pwroqb4Otxdu+G214mqbT7XNeTIq0ElYDllhjXHdGhk=;
 b=YH1EnsZ6mpMRCbDZ+pMelL9TpY97zvn0T6fZDvo0L9lToh2tdHKtkBsyXIo+XMM0lb
 bKksMvrzrih1WJ8Vl8VvLUB7Po15say7hurQkdKLb0Hxfqw38HyuasBqwkJXx84Aj7fc
 2A4SSY9X36av2RhMmOxjK/eGH0f9uKo/hjILy7u3Q3dpflNuDA8U7Wbw7BkDSn2Zk4Di
 MBD69cfHyQFvUgcAj9soM4/lt0353nSeEHw2ym10O+dcnOQzWcAHTt9XvnAZPsMek1Rz
 aafLKhag8tIF94NyYyA2PFi0LPs3U671G9VmTi2Xguvt2Dw3BeCqhsTE67sv25SMTynT
 c+Ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YH1EnsZ6
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-27
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

Autobuild statistics for 2025-12-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 16  | 31  |  0  | 47  |
  2025.11.x  |  9  | 23  |  0  | 32  |
    master   | 65  | 133 |  0  | 198 |

Classification of failures by reason for master
-----------------------------------------------

                libselinux-3.9 | 9 
                       cfm-0.3 | 7 
                  libcgi-1.3.0 | 6 
                       unknown | 6 
                   dash-0.5.13 | 5 
           host-libselinux-3.9 | 5 
                 jasper-2.0.33 | 5 
                 libuwsc-3.3.5 | 5 
                openobex-1.7.2 | 5 
                   cvs-1.12.13 | 4 
           ghostscript-10.06.0 | 3 
                  libsvg-0.1.4 | 3 
                netdata-1.37.1 | 3 
alure-14beed2a86d5a36030e90... | 2 
             berkeleydb-5.3.28 | 2 
dbus-triggerd-ba3dbec805cb7... | 2 
                 lensfun-0.3.4 | 2 
libcorrect-f5a28c74fba7a997... | 2 
              libopenssl-3.6.0 | 2 
                   lsof-4.99.4 | 2 
                    mpir-3.0.0 | 2 
odhcp6c-53f07e90b7f1da69771... | 2 
ustream-ssl-5a81c108d20e247... | 2 
amazon-ecr-credential-helpe... | 1 
                apr-util-1.6.3 | 1 
                   atop-2.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  cairo-1.18.4 | 1 
          cloudflared-2025.8.1 | 1 
            cppcms-2.0.0-beta2 | 1 
             dahdi-linux-3.3.0 | 1 
                enscript-1.6.6 | 1 
                    eza-0.23.3 | 1 
                    fcft-3.3.2 | 1 
                      fio-3.41 | 1 
            gdk-pixbuf-2.42.12 | 1 
gli-779b99ac6656e4d30c3b24e... | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
               harfbuzz-12.2.0 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
            libargon2-20190702 | 1 
               libbluray-1.4.0 | 1 
                libcuefile-475 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                 libiqrf-0.1.2 | 1 
                libnss-3.119.1 | 1 
     libphidget-2.1.9.20190409 | 1 
                   lzlib-0.4.3 | 1 
                 mbedtls-3.6.5 | 1 
                     mtd-2.2.1 | 1 
               nfs-utils-2.8.4 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               openblas-0.3.30 | 1 
                openntpd-6.8p1 | 1 
                   perl-5.42.0 | 1 
           python-brotli-1.2.0 | 1 
    python-flatbuffers-25.9.23 | 1 
          python-grpcio-1.70.0 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
                 rtptools-1.22 | 1 
          sane-airscan-0.99.33 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2025.10 | 1 
uhttpd-15346de8d3ba42200249... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/7877048586006fd8a294f4a8e0158e9ef3df58b3 |     
    mips     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/77767d00711851cb5b374ccf772984d5620cd210 |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/cbcb7e5855a2c4e5f8e4e498c0f946a9d3da8dfa | ORPH
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/6ec510a79cdc2e52bab888ccbd39643d2740e3ea |     
   xtensa    |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/74ee3b989f9e13ed8c5033859ed871f4edcfb9ce |     
  aarch64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/e31a3e993d23518cd0479d9fa1bb98e8e3e786cf |     
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/de586a67b6f999944763e9953ed0abb8ef259f14 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/eaf340ab644cc2bc9d6cc712330ca7027fde6de2 | ORPH
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/f25592722af3f144c83101b66aed113af9a53bae |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/af96259918c1105dc74adf4bf9aea0bfa18d2f7b |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/014ef32c36a45cd8abee86e2dbaab2aa3328a32c |     
    mips     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/52903092b2bff7767181fb1a54a0b9daa8873d8f |     
  sparc64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/7e6889cf07e73b173d4b4256a5549220ada3ee3b |     
   mips64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b31713ac8d3618758322d1fc6ffe00603c024d76 |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/75a58bb1f609305557eaa7b10c23f21487b617a1 |     
  aarch64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/fd0d412d374605b9f1e6a28bec55973286ff8d65 |     
    arm      |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/50ba6febed819569cd820cbf062d636d4d44eb38 |     
   s390x     |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/876e7d581f2eb070ce18cbf00e0f13bf4ea62865 | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bb7a3985ff897f4fc2192656ea115f51718082d0 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5beded13a4eae547ef8e4456558d20a162fe6f64 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7147ce35a0bfd43beb17d90bdde97a5930f794f0 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/86892ee6545baff93b22b0b3d917321e5f40f441 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d150d81742d976dff96952fb6aedcfbbf3321857 | ORPH
    m68k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/3984c203678336a76f3fb0aad9b7fc285054eeec |     
   mips64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/8308bc77865328ae3b8d97638765ffab0e655e5c |     
  aarch64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/4f8a49a06e3de5cf1a943d1d836f31de24536c04 |     
    mips     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/4bc35147c010d75ec4929029e6fe7adc6811d6e7 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/c9cd4c0d9f82064d5acd307a6db7f62b9d3075fc |     
  powerpc    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/3611e423e881d6bc43a97f5a7c5d474ee6814c8d | ORPH
    sh4a     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/6ccad230862e4cb9c9df73df21a6e04264866542 | ORPH
    or1k     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/113d723d5b772bd95cb568da4370c42cf8bf00ac | ORPH
   armeb     |           eza-0.23.3           | NOK | https://autobuild.buildroot.org/results/602e045aaa2cb3fc9280b71a9913c87475a4f5a8 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/d0ecde571a2e725af72068ccd129d4763c2c05ca | ORPH
    sh4a     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/3d9940e310496eb07834fb41f9329e22efbec71a |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/88243f8abcd11ee5212d80142f8e476e18a2d414 | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/bbc873b7777a0e6339c4a1b2e412547f12390c0b |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/ca8aeabfc6f3e4fa72fc4a363b602b6ca9f9d852 |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/616e830f8be5024168dae95a53dff17dbc5114e2 |     
    or1k     | gli-779b99ac6656e4d30c3b24e... | NOK | https://autobuild.buildroot.org/results/87639ca58cadf20b1133c27c8dd6ddd7bf2efe48 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/917edde6053644cec98dfa2495dc8ef8f3a61375 | ORPH
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/93a7099a9a88d1d91e5fcb23f2360001b198f8bb |     
    or1k     |        harfbuzz-12.2.0         | NOK | https://autobuild.buildroot.org/results/3d4e909b07b717a49e97a2452578bd3870a5bb48 |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/64e23a473c6ee2b3d4965a4cd8c9aed818f5ce87 | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/0f1bacca83fc1e6c653b5450682a5b5e603aadb6 | ORPH
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b5f25f1ce08f889589840e992ea881a6408621bc |     
    arm      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/e5c001d76ddc32a16dbd316e5be04f2359080093 |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/bb0f0e6eff398318f4377b928f7509c61b5af7cc |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/85f3f78718f9d67b543d3fcc051494ee91ad785d |     
powerpc64le  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/6457d06e42107417720de7a53fbef3dfc7b491ff |     
   xtensa    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/b8ef85c8b0446aa0443c5ef7c4d58e1c3ca5bd79 |     
   x86_64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/7c480ab4496a7870cffaed4d1e531770c4b01622 |     
    mips     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/a09ce310d499cbbffb8cd05dac210d01c848b5ed |     
    arm      |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/a1fd0492e4ed0dc32b5d4f6bd5372d47bc71ac3a |     
   xtensa    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/c38975ed75ed4f9d0dd54d15f5979fb226d0c526 |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/539759f0bdf237b939848e040fa5485a9931be7c |     
  sparc64    |         lensfun-0.3.4          | NOK | https://autobuild.buildroot.org/results/a8243b06efb409002835108d75aac566be2fbb37 |     
  aarch64    |         lensfun-0.3.4          | NOK | https://autobuild.buildroot.org/results/dced550d78ca4365c6b334d442a4995d6b8dec46 |     
loongarch64  |       libargon2-20190702       | NOK | https://autobuild.buildroot.org/results/c0f1d8b0aad7e6d95dcaec8115aef84527c3c912 |     
  aarch64    |        libbluray-1.4.0         | NOK | https://autobuild.buildroot.org/results/c89ab9064d0ce6416aad3e587059b85b0d819e9d |     
    mips     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/af14277538349c1d88e0546caf1eff7bdab40f8d | ORPH
   sparc     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/2b66156c80dc71481a419851b07345b8568d8ff8 | ORPH
  powerpc    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/fcc839793fcfa51135d328f70bae0cffc585b444 | ORPH
  mips64el   |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/380c4f975404c75115700a42249d36cca3ffb43e | ORPH
 microblaze  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/6e9aaa1d1f15da5286bd2f9d2a5a59ef92ab0f54 | ORPH
   armeb     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/eeb9d418e6b4bc76bc0ba35b7cec33159a5fd688 | ORPH
    m68k     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/5886fb8dadc3b96806718b14dac878502528471a |     
 aarch64_be  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/e32025eec27d56f637993614b64ffd8da98a09bc |     
powerpc64le  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/e69e12c74e896714bb819154241f9fa71ecdd65a | ORPH
    arm      | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/d2bc9307b5f2346029b842caf31735bd7c08d134 | ORPH
microblazeel |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/63a66e792a22286315fc12f0ecdc55df4a1eb5a1 | ORPH
   s390x     |         libnss-3.119.1         | NOK | https://autobuild.buildroot.org/results/ad40536728303c56d1d0968e38ac36da12cca416 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/8aff34c8bb8c168245fccb600fc44b67a125c1bb | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/a952221150775ae75deeb48776905ef99982103b | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/394dc32f9581b9a0c25c0e8bcfd38834be9f7760 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f9613dc78a7fb18018232ef137d96830c4b7e31d |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b3ae67d6e1da3b2ccb9f786e3670a76308559762 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/5cfa94b989dcb008698e0ad554ccebde8b68d526 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6162a6a66a40ba22d0742a5dfae3218359ab7439 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/8efa3f5feb281eded01c67a31d2c0b8f67727374 |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a5c746240b9cd63704c2f419dde06b076bae3956 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c0e8d2a0253b1b40d63079a6b5426abb46e8f2a6 |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/dc5c8ac65593c799df6b276eb75b3841475b9b95 |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/047065cef56fb90627b978ccd64c63cf1007466b |     
    sh4a     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/895fdba2f3fcaa42aa93946f2532351d39b16647 |     
    arc      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/60f4a607b4d1143f2e453cb1b4aaf1690f46b9c9 |     
  riscv32    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/7947993b4918962fbcd8545f1ebf4901a0e34493 |     
   sparc     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/2fc2201c1f60ce136719d34feba6aae042eda697 |     
    i686     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/a60cdcb9960669bab5af9c6923652fdf50dccd9c |     
microblazeel |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/6a5d0b05de6baabb563e00265adb7b9c0d2c5f02 |     
  sparc64    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/699ece1a12ac839314a9571a9a2b8f480000aa23 |     
    or1k     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/64245641ab739109d42e239191fb015e79b018f4 |     
  aarch64    |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/1bb1fa39f789c159433f6ea4c28e72f03c0009bf | ORPH
    m68k     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/d56cb3cce4ec5c4d599cf9598d23b8426624057f | ORPH
   s390x     |          lzlib-0.4.3           | NOK | https://autobuild.buildroot.org/results/a363df560c4d832d6e1d0a9fdec52886a2171767 |     
 aarch64_be  |         mbedtls-3.6.5          | NOK | https://autobuild.buildroot.org/results/1833e823b541d5165d6ef8dd60a2e4a4af9cc530 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f1ea8861cb3b7672c4aa58b1eb7a89a464971ac9 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/059c145ffc8aba710426aca6a2606c0c28b9907f |     
   mips64    |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/f0323e8e6ec5b3833aadbb04a6ffe255c9936bd5 |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/f56a48000b21d11314a5e2365d90164f86e024bb |     
    sh4a     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/b89fb80252e3a779493935d1cbbd7a9a55fdda1c |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/7b617c9c555f81eeec35b42b94eda5fcea56afd0 |     
    arc      |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/272975292ca844588bcf8a3ac2b26d514f4723aa |     
  sparc64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/3f254de709d50835dd9e3e9fc048ef073b456b89 |     
 powerpc64   | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/aa58fe56631212d446a1a79e169363d66eb88983 |     
    i686     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/f85643209ccdb0c3f9fd0f5ab9c954aa4ab125f4 |     
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/8002f323c54144e1cbb5a9f37e45c7f61c66f42e |     
  powerpc    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/426bba80aab0ef1ceab691510ade65dda2fd9b7f | ORPH
microblazeel |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/a6e5a4df3395fee5f259b3502fa9834478865eaa | ORPH
loongarch64  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/94960517cb8e105d47ce386c1b1f9002643ea63a | ORPH
 microblaze  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/aa163b8b4f2e977fd8fe37d88cdcd54e58ea2520 | ORPH
   s390x     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/8cbd2372257b8b761b9790b2af4af8bb97ac7f96 | ORPH
  mips64el   |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/d9c58a9d2892ca228b5052def83e42224ff2a54c | ORPH
 microblaze  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/bb4586402eb36517661021bae8cea3bf3842f404 |     
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/c9c5e92ea927ef17c5fdf48c4cfa5824e1d98d14 |     
 powerpc64   |   python-flatbuffers-25.9.23   | NOK | https://autobuild.buildroot.org/results/c77bd5fa4cc2bd616b5cb3d954c609ff0d0c2c6e |     
 aarch64_be  |      python-grpcio-1.70.0      | NOK | https://autobuild.buildroot.org/results/f24e1a9847b630bb471defb65e8f4f0314f58d64 |     
 powerpc64   | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/cc2ecc49a9879ba16400eb8c767373974a070266 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/13649109c910f3a278baf63fbe99df1041907ede | ORPH
    mips     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/a55e1181a1ced575a9e39768e0f640fe2f91564e |     
    mips     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/be6404f943b3f9779337b86ed67146ab7af7e93a |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4452648062a5b97eb01920fbc2a8a9c3ab681761 |     
   armeb     |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/ff06dee2d39851c126f6e5a3d93f67fa1d3346a3 | ORPH
   x86_64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/dd66e6dcf3d5d00a23bfafa3daa6b6f25cb45346 | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/63e972a0b24073231ee6b425478d82b59f72367c |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/67abce2e5a386a9238f5d015128942e0633bb24c |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/0886fc8200fce83c6c1dc46e2c6044a1be829cee |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/5bd83b8786d1b15afff37f926f882a86dc3ec448 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/cf9ab90964e8b10ed6a8272868f40508e244e354 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/3a8e91858722fc39cfaa11289e57fcc95157f385 |     
 aarch64_be  | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/241fc1733bbf8bb00dc51e5daa4990e786ef86fb | ORPH
powerpc64le  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/0f9fe7232bf8de9f238f9f45def2e338ba0e97f0 | ORPH
powerpc64le  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/77f2760bdc182aad91fb344570e39da4641f4c7f | ORPH
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/55905b79eb5cda4f8ca37fede48cf58f67387dc4 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                openswan-3.0.0 | 2 
                       unknown | 2 
                 apitrace-13.0 | 1 
               asterisk-22.5.2 | 1 
                    brltty-6.8 | 1 
                  brotli-1.2.0 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
               freeipmi-1.6.16 | 1 
            igd2-for-linux-2.2 | 1 
                 inadyn-2.12.0 | 1 
               iproute2-6.17.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
              libopenssl-3.6.0 | 1 
                libselinux-3.9 | 1 
               libunwind-1.8.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               pulseaudio-17.0 | 1 
                speechd-0.11.5 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/9c621e768295951c866d5551e567f8445b4f99d4 |     
  sparc64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/b95fd22e4ada58ecc490f6f08ce33a2dd5f665cf |     
    mips     |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/ba8f19a3bd043b9120507c63fdf8691774887dd8 |     
   arceb     |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/626b7e48c3f32babbb3b50de45e03ae92b44297f |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2b297dbc07d2f0de852e1fe2e6ae46d3e7d1f9d8 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f5551737adbf7b98fe482d900b5cfed60cababf0 | ORPH
    arc      |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/6f4e4e2629ac352aefa3c46b8a1f74c6657d8daf | ORPH
 microblaze  |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/90c5bdbfc72a421e0a8cfde5038194ad56ba2f01 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a31b512b08f614e1475b9af0f820d8cb146cb000 |     
 microblaze  |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/0a8b3bca8c8625162e28819750ef3ff3266a3124 |     
   arceb     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/3d56dddfb636edc93295d811b6993c9930124e1d |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/569e76ac1067cb3c6357ce2b8a0cd983d9c21986 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/dcda1384ed88a5634ac921dc06a6b302ff060eef | ORPH
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/dba388418dc3d92f3aa06505ad0bdd727194e3a3 |     
   mipsel    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/c37c5423fc6d84dfe2a24e1c28e48160ffab053f | ORPH
 powerpc64   |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/5495e38e0d948bc3fb4ed2335658fb7dbbd8e1b5 |     
   arceb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/0f53415ecff4d568049031f1e197e404b212a90e | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/de8cd4c1defc6a5119483adb3224f7fefd239981 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/842cf55cd537e46b40ea3567271e0865e5f8691c | ORPH
 microblaze  |         speechd-0.11.5         | NOK | https://autobuild.buildroot.org/results/96ca86b9d6db94a006166c9e0b6e648fcd56a0b1 |     
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/5e8eb90e27aeaa975f85cdaf9872c2a42cf92c1d |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/b9763b043c2f02ae634b351e9600b1ec37f61bfb |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/3a8b317f421a74be04b0b64b4a3695da32f61b7d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libxslt-1.1.45 | 13
           host-libxslt-1.1.45 | 5 
                       unknown | 3 
           host-go-src-1.23.12 | 2 
                  ffmpeg-6.1.3 | 1 
                  iozone-3.508 | 1 
                 libpng-1.6.53 | 1 
          linux-5.10.162-cip24 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
                   perl-5.40.3 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/2fc1aa9414b5ee8476fba9297cde7eae1d923858 |     
   x86_64    |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/899d354ef53e7bc2984efe431207a0776cbb0a9d |     
powerpc64le  |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/86420c87b985279a9304c41821e8df20e68e7ff2 |     
   mips64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d497405f167e4ae649372dbfed97a6fc9e54ba12 |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/47129e7d30543aeab6b0dd7d0da7cf694329da6e |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/72d0ed7e6ffad99e026e690a8c04b80e4a78788a |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/2b86b5478c87fc01d3c8d6146d128e429de1d3d4 |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d63c510599f62ead35d06dcef9eae6de27c56b2e |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0682e9256e381f19e2645e8df78d3cc3f489af7c |     
  riscv64    |         libpng-1.6.53          | NOK | https://autobuild.buildroot.org/results/c8ccf91b40984129d4afcdf5e2ff8be923ae244b |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/4931a588cf5e69a9bb8e9943ab703315ff4ba453 |     
   x86_64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/120740ca1414c79a5d4b6c7b4be167a90928bea1 |     
    arc      |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/19dcf5086a4d8135cac417f02a4adb8a0091f410 |     
  powerpc    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/35d57eefeebfffbcaa1170ff8bbda0c4ae0a6d1c |     
   xtensa    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/dcb89474f71321e8d24277bf68741d7152ab8167 |     
   sparc     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/7fe6ea53ef5ae2aec3f18007b83329492ac5467e |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/854ef92236c8986a4dc0d3bef895fed3045c0cbe |     
  powerpc    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/e0242a104a74f3c92d8d5629747a18f6b6ac2a18 |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/2c0d8c57d5d9ab7ab8b08a0227adc8a47bb29055 |     
    arm      |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/180a14f6f94a5f0a6e2a629d1ca1f66fe88f7fc5 |     
  riscv64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/e19adc06b2fd4eaf89f3576f718e7795ed3c4ca0 |     
 powerpc64   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/a887ef5c8eb6b01b18ed8e891fa9ec42c6b58f45 |     
   sparc     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/ae74764c4491c0ab8dc9608af792fb43f3ad46ac |     
microblazeel |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/43ef7b3c7d7cf85e801adf61052b3f1ca5a27a69 | ORPH
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/1c3a2ffd970c9bd0f551eb0f6a8e4fc5fbf834d5 |     
    m68k     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/afe85cf963b46aad4a5f30c0e39cc0f35757bd9a |     
 aarch64_be  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/0534fa89901d9f926ffce868d4c5c9485eb969ee |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4ff98e3fde88fcb200be42cf47e0080a03da493e |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/deafe5add9f0ace2041ff5f444ced5123e58f3c7 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/ec5375d8f0ae23b6199449a89b9aec667e898ffd |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/33b17295d055f046282c2ed142569a28ede27f5b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

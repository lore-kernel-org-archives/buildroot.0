Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3649C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 03:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7040960653;
	Wed, 13 Aug 2025 03:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCIsXe5aZxJn; Wed, 13 Aug 2025 03:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 902D36065A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 902D36065A;
	Wed, 13 Aug 2025 03:16:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11DD8938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 03:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC32C8355C
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 03:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDofNYQW5qlF for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 03:16:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0648C83388
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0648C83388
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0648C83388
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 03:16:22 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so11434961a12.2
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 20:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755054981; x=1755659781;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Di9QGf0fuEksmNaV8VUZXmr42GdwEbW6u40vRMZNlkc=;
 b=Db75kYKTtHRLp+a4B1Ojn2Ntl5jILgJuw3w/6xIr8wuynPlQWc0kwN6DkdKO4gFRF7
 URGd7aHwM+soomDhsv6KJU6SUvEYshcIoCb2HUM/NK/7uFs1svihC/VlLgMe4v+d1sYH
 dBWzcm0eDKrCP+epj+wMb8HP7hJ0EBXh4E+7P0/rvC7lO86DGiee2RnGz6yhePIsTPRB
 iuCSYy1343t0W9FVAPlO+XFAPre9XTzfAs5QDvgaA6I+XDPb2RMZLqI88OapM2d4j1/p
 sK/IOTeqQ81PuVAJbP+e0TpgJ2NMSBhjJhHMhD2lIiBvaNnn6KGHda+JCWVTRnyzRLJa
 Qlhw==
X-Gm-Message-State: AOJu0YzeKPniLvdY1P26unMbapmv23mD7rGETXwt9/d7a6qG/E0WgSyx
 pRMriDwbGBJh3urbpN31fbVtqhIr8Cpu/yegV5npUXmygQXPjlE0007ac8bF5w==
X-Gm-Gg: ASbGnct+ivQCftKnRZwreYzqHkzi5Sm2EO4mqnMPUoM/c69PlqGO0UpgmXY9Q9SqA/R
 TWhE9V5kw99Ef0xor91KIUrB8zllBpFYk98n3zKnsyvhsOnUwsOvZlBQeoO+AmxVmVZuQZFQ4dZ
 j6Hz5FEsxTL8kQf+GLyVq/ZJk33C3Orwv88QR8vFIsA2wB/KKFrKvXiVcun7kFkWCxnYRjDRf9A
 1S2plDiGCDK/OKfqGD8KzyQcszuWowuVLUeOoSy4ewyk+/kluzZ0WmX8VdIsybgLfEFXdmWvcVb
 vpLcmduMuGua5CZaawfD5Wnkmw+8ZXJDEMWdOKBeNluESt7/PsY5owSCas8w2ho87ClX2bvPhUO
 6bG4zomziA1beWeAnAfuwat+uauu8DDIyMPr9
X-Google-Smtp-Source: AGHT+IFczjEqFcggCP90xh8d9FRHH9J/9bMSk1aNjHRKcOTCYdZA+nY7IYVo5+UEw6HcRDT5wvbsMw==
X-Received: by 2002:a17:907:3e1d:b0:af9:67ef:96d5 with SMTP id
 a640c23a62f3a-afca4ec4353mr139348366b.52.1755054980687; 
 Tue, 12 Aug 2025 20:16:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0761f2sm2325854366b.11.2025.08.12.20.16.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 20:16:20 -0700 (PDT)
Message-ID: <689c0384.170a0220.16aaf8.880e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 13 Aug 2025 03:16:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755054981; x=1755659781; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Di9QGf0fuEksmNaV8VUZXmr42GdwEbW6u40vRMZNlkc=;
 b=lDbxHeoDIOR8ZRSS/u3z35y46TNKWkDY2FRMIkSULISgxQ8LX0lDIWpAIv6k0UeQT2
 jzh65y9CV8oUTxIvi4lc02vtpwvcwO2ZzsmC583c/leSTKTmEhWZnHAByJHyRhh33jJU
 YGlqqLz07e07raz28sqkvEYDDNKue3+JLiK8cZiWm8mVgOFt9GYWpqi77oCO8koFwRjl
 9BJEg0S4aPfDzS9iMhalp/NUf9KO3HqEO6iOdlHdvIPaeXxXsw/5hlM7tlNnyO4fvsS/
 P6B/j/iU4MiwKG9ikDeyQ7ehbYmANWzRHZ362zm2mjB6moM3KHYlCufiIlV3DTLswp+T
 lA+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lDbxHeoD
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-12
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

Autobuild statistics for 2025-08-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  8  |  0  | 10  |
  2025.05.x  |  2  |  4  |  0  |  6  |
    master   | 23  | 122 |  2  | 147 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 9 
               bctoolbox-4.4.8 | 4 
host-binutils-arc-2024.12-r... | 4 
                 host-gdb-14.2 | 4 
                       unknown | 4 
                   bash-5.2.37 | 3 
  gobject-introspection-1.84.0 | 3 
        liblog4c-localtime-1.0 | 3 
                liboauth-1.0.3 | 3 
                   avrdude-8.0 | 2 
              fluent-bit-4.0.3 | 2 
            gdk-pixbuf-2.42.12 | 2 
                    gpm-1.20.7 | 2 
                 host-gdb-15.2 | 2 
                 libgee-0.20.6 | 2 
     libphidget-2.1.9.20190409 | 2 
                libsolv-0.7.30 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
                    linux-6.16 | 2 
                 linux-headers | 2 
      passt-2025_06_11.0293c6f | 2 
                  prboom-2.5.0 | 2 
                 siproxd-0.8.3 | 2 
        vulkan-headers-1.4.317 | 2 
                 apitrace-10.0 | 1 
             batman-adv-2024.4 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
                  cairo-1.18.4 | 1 
          chocolate-doom-3.0.1 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.3 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
           dmraid-1.0.0.rc16-3 | 1 
docker-credential-acr-env-0... | 1 
               ebtables-2.0.11 | 1 
                    fcft-3.1.8 | 1 
fmlib-lf-6.12.3-1.0.0-3-g7a... | 1 
                    gawk-5.3.1 | 1 
                     gdbm-1.24 | 1 
                  gensio-2.5.5 | 1 
               graphene-1.10.8 | 1 
host-gdb-arc-2024.12-releas... | 1 
              host-guile-3.0.9 | 1 
               host-vde2-2.3.3 | 1 
                  iozone-3.506 | 1 
                    kmon-1.7.1 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
               libcap-ng-0.8.5 | 1 
libdbi-drivers-0bfae6c43134... | 1 
libdill-32d0e8b733416208e04... | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                   libks-2.0.5 | 1 
                libmpeg2-0.5.1 | 1 
              libopenssl-3.5.2 | 1 
                libshout-2.4.6 | 1 
           libsoundtouch-2.3.3 | 1 
             libstrophe-0.13.1 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        linux-headers-5.10.240 | 1 
        ltp-testsuite-20250530 | 1 
                  mbpfan-2.4.0 | 1 
            netstat-nat-1.4.10 | 1 
                openssh-10.0p1 | 1 
                p11-kit-0.25.5 | 1 
                   perl-5.40.2 | 1 
            python-yarl-1.18.3 | 1 
                 s6-rc-0.5.5.0 | 1 
                safeclib-3.7.1 | 1 
                    sdl-1.2.15 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
          sphinxbase-5prealpha | 1 
                    sslh-2.0.1 | 1 
              tinyssh-20240101 | 1 
                 weston-14.0.1 | 1 
                    wipe-2.3.1 | 1 
                wlroots-0.18.2 | 1 
                 wolfssl-5.7.2 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/dc4d015dd76361363d28bb8915c46eabf3b5379d |     
    mips     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4ac4e6b473cf13817b6de43a3e370ad7d60120e3 |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/f0c63d3772d0d71a636986dc382b91819d330878 |     
   sh4eb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b176716155d4d220f6315be7501375bf16329db8 | ORPH
 powerpc64   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/2607b8b758458a4386e9d76d3ae9fcb01282fca3 | ORPH
   armeb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/2b60bba3611703d8b4ca15e0487744c37c7cb7b3 | ORPH
   xtensa    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/04161171f1ff3eb4d4ee8abb3f59dd2ea4c4a22c |     
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/01f5ed990ca209602b8bc417301543a7f333e3e6 | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/033fb4e889ac53fa4afc87ab7b4b6aabbc7b9ff9 | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/36249d64d516518f635f2a08d89c39f5b92f345d | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f2fc9bb9ddfa1d4c856f853183af4f46402ed48a | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/72cd2648657c80d4ca994448e7bc61ad36e2f57e | ORPH
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/e614d1466f36447d092d6acecbd137e8e9edba3a |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/f1ae2d11c1fcfda3f241168d9960843b77fd7bd8 |     
microblazeel |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/f5699ab6e36961a05894806f9a0333405bfdddcf |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ae914a1438c0929677b4542b877cb31b2f287df5 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a7232a80d9901681804b93870d970163c2183daa | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/943ff10ebe9190f0efef3954c5fbcbe19426fd51 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0f18e749abf57c7235bacb2222294dc635199e39 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1fa7ecea3f0dede137e03232bb40b5b65dfdff5e | ORPH
    i486     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4bbb1650a259e80ab366c261098c2f095cbeb0cb | ORPH
    i586     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9948ff04dcbbf8a6cf742853e9c4d11a7cf42299 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6a77ce103a91408854f9446e4310b4d9acb97175 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fada97f2ddcb1455c2fb1e44508332e7ea14ff4c | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e5a38d91870c34d0dc8bf51f5f38f197ed186394 | ORPH
    or1k     |          dante-1.4.3           | NOK | https://autobuild.buildroot.org/results/179d5c085bace070f978995c4392895b45fca092 | ORPH
loongarch64  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/d396bbd32e733d76542759db0b86902e3477f596 | ORPH
   s390x     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/4f8ee27ba538453c65bf3fa9829dadecac84aaca | ORPH
  riscv64    | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/def4a5c51278ed81124ff9472694d33b4a1158f1 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/c8b18fbba2ccd9be4caa2a26afe695f217a655f4 |     
microblazeel |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/2fc5cc4938f9a20d45a2639273b966b3942a2a70 |     
    or1k     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/cc1835d907cdc3fcc1e92fdba3f5412546025fcf |     
microblazeel |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/b4953097591f11c7ab227330c07077e2af428f32 |     
  aarch64    | fmlib-lf-6.12.3-1.0.0-3-g7a... | NOK | https://autobuild.buildroot.org/results/9bafadaf8eb2c6c2a491ab05e2b5ec8c2740bd6a | ORPH
    or1k     |           gawk-5.3.1           | NOK | https://autobuild.buildroot.org/results/2fc5a49fa7f8b08d6f0be833b3732d181e1bb8bf | ORPH
  mips64el   |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/53e3bc33f3b65a9d3db08e5d6de180c01344f237 | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9298115117896e4badf9bc959c3f3a0c3cbf28ca | ORPH
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/24b36413c778531a889a5483894418845039574e | ORPH
   arceb     |          gensio-2.5.5          | NOK | https://autobuild.buildroot.org/results/786eb16742abadecea61452a35a6bed453a4946a |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/70a25d111d8dd42c2e78b997d3762da93c8544a2 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e9b815ccc788b7dc053be5957eb380e6b6eb204a | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7fd20a615e8fe8ceb5fdeca0750cccdf0c30d36b | ORPH
 microblaze  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/acb252c5367f8cdf1fb12cff975301f0f488ab42 |     
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/c6e9ce327c4848aa9cbf127b4232ba48cfe9f54e |     
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/619bf7ca4c3136c35c3f2a764e27ef58adff30ec |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/e0c43c33016d186531b8939a2e29f1a9da56f9f3 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/0046c547288c52a067a252bf18f72f162d926bd9 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/7270b2cfb7476aae0c69372150adab6beab6bd78 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/d3522c811149671e404c8280f79844359d9832e3 |     
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4be473fb94944203067dee4e9d58035e0b3bdea1 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ac678233e9955ea23f75864297462bc4b960acd7 | ORPH
loongarch64  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/82d3959934a8148c6d31225207858cf9ef231029 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f8070c38ce398783ee8c87a36ed624b560d586da | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/34b915ec33acb1e67a2036ecf181501988ded5cf | ORPH
 powerpc64   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/250d09c944b92b871963eb9be7cf9fae85fd3da0 | ORPH
   arceb     | host-gdb-arc-2024.12-releas... | NOK | https://autobuild.buildroot.org/results/4a03a26656e5759cd3f224934c42a690fb390c7e | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0b191e07ef0720d671d497649f1897fbc8c4456d |     
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5d0ddffbc156cd6965c1a9aba20e803e7874536a | ORPH
    mips     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/4c68d22df1fc32d1400e99a2ed842373fc3162a2 |     
    arm      |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/3cd6312d0922a62496b56fab3991559bc88f839a |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/9c7e40021912c3c698249c9512e944fab3495726 | ORPH
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/6f828f10b2ddcfe2ec2ae0c1a7944c21ccb274fc |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/87d24e8f8ec5e70e03f023d8a7e5e9d30fb5c5bf |     
    sh4      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/e8cb4567fc6f2eb2d709a349c82b858cb71a3d6b |     
  riscv64    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/f56a3727e0da24a0f1edaa17bc9fc9240dfee928 |     
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/8fe29ea856982c2e34ec311cceb2f1e0ccbf1014 |     
   sparc     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/8fa52d5364f51bff40e8eafac27fa13c2dbe4ce3 |     
 microblaze  |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/6556b7c8d4a583ee5379cc9dddaaceb3228e75e9 | ORPH
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/973c84ad8f7566cc8fa388577c0c843196572619 |     
loongarch64  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/5edcb5ab91758a4db4d1e66fb0b400de5cd59f90 |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/b1e8004e226af86f427075ca837b885c1fd6cafc |     
 aarch64_be  |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/039148cecdc7c98bb697f69555766e8063ca85b1 | ORPH
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/2d13a5040b173d65578d75781304393772636c5e | ORPH
  aarch64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/98304a75b2035367ddb9eb81c229ef3c6ce50011 | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/4e50974aa05ddea0f92b619126471bd4108ebdb0 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/b956b609d6bccb67a3a8271e49917c06ac0b9080 | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/19b99a483bb1562d7910409ebccae0ef08667c83 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a5a7aec976c80e2b58563f8e9b58e4fb06b11c3b |     
powerpc64le  |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/bd17baeb3d41c3c88249864c8d40df399e6d0125 | ORPH
  mips64el   |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/4baaa1981eadad84c4783974bdd3f1b3f26e72ae |     
   s390x     |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/01fb29de648b2e6443a4d048915bebcba7746205 |     
 aarch64_be  |      libsoundtouch-2.3.3       | NOK | https://autobuild.buildroot.org/results/17041974e15db189b76f1f844b4ca63d43aa9d44 |     
    mips     |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/418140b102919d8bc60bd25341e29f35e914f22d |     
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/8c9c334c3eca34014136b64a4cf087105fcc346d |     
    sh4a     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/46b887ee90a14ef3eb0adf248736d713594e691e | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/87fc6c9a9c1bbdc6361da9a4700dea1787929eb4 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a9442543206735e5b48efefc85858e250c54d31e | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/deac2a234408c77340a49c8b059a957f0d176ba8 | ORPH
   sh4aeb    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/96e952e5e7b244584c8d5f2b2301a641880a82af | ORPH
  sparc64    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/f56c872cc121559e14334b090313f054afc9d01b | ORPH
    m68k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/b751a3f82331bbbd0495c2f82d8b4d944e505fbe |     
   sh4aeb    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/7418c76ebbc753c3eed2d5617c08fd62d7f82934 |     
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/686894fc2a04318739114cf25840c12b6e6176cb | ORPH
   x86_64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/c3e144521105c9ba2a6aa9961669b78fb99161b3 |     
  powerpc    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/8821d6dc6b678bdfb0df3b79a28a2d40f89633ee |     
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/af62532e4f4f975b7566ab37037b2b8a4cd850a2 | ORPH
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/bdff7b3c1050a9b16f0721e03c534c04284d7150 | ORPH
   x86_64    |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/9c902ac275fb3f2ce3b35aa26d72ee918584ee45 | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/26f6b3d17485092fdab0e562c0d0b361e835010e | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/bb5053d4f4be93e9aa062e23c2a12c65bbb2d0b2 | ORPH
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/6a65d030113d1e62026c644f6ba2dd51f9088d01 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/1eb95da007bcb6454ec09b1e2a68a651a0ff1330 | ORPH
  sparc64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/854de15bbfda88ec47df800b0e8878bf10421ec0 | ORPH
    mips     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/0dc69a45ccc7007e0904393f0697da4b2345aa71 |     
    sh4      |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/a6fdd824ce2ebf75378f9e739406bbb998267f6c |     
   x86_64    |         safeclib-3.7.1         | NOK | https://autobuild.buildroot.org/results/2efc285d2a1f2031ed59c0025a95381c4a52605f |     
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/caa398598c129fda44bb988a73e7047590d78f46 | ORPH
  sparc64    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/5b14c9e0749785503c4cab15547fe01cfd889810 |     
   sparc     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/1db350664085a90be9e9e3d8dfbe6a9d865c068c |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/7b22164a7a5de0162de0274b8af2c16488dcf527 |     
   sparc     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/67a55b9c25e6a5bbb4dbd271e7b376323862b50a |     
 aarch64_be  |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/c3b5db0440a4968ef576b8d434cf0eac9c12b282 | ORPH
 aarch64_be  |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/0e019c1eed75d0de939d37ccac98208854ded585 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/7af043d5ca3b58d31426adb1ae0ed07121aff8de |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/6363b2062c40522b9646ac0c7a62be7ecce680f6 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/f209b30e057e654e82abf2d51911372458a954aa |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/66aa70e501464c0bc1c9c4348599ffa1cdec8113 |     
  mips64el   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/71dc05070d998f704f7a393f7be3b71104c7384b | ORPH
  riscv64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/338098f67593ea85cd9fbf2368b10bf2747f9e85 | ORPH
 aarch64_be  |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/353e39902616bdbce40ac667e98cbaf51079f69e |     
 powerpc64   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/1bbc531dcfac3393297f848e491edcb0c0dfb205 | ORPH
  aarch64    |         wlroots-0.18.2         | NOK | https://autobuild.buildroot.org/results/e774b5e6bf1eb6e102de5aa79fc568edb0024a2e |     
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/a67e1376387dc6785170ef63126bc7e603afcb75 |     
 powerpc64   |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/3986ad491816ae51374ff45730675e329788f4f9 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        python-propcache-0.2.1 | 2 
                  bcusdk-0.0.5 | 1 
                espflash-3.2.0 | 1 
              fftw-quad-3.3.10 | 1 
                       jose-14 | 1 
               libunwind-1.8.1 | 1 
                  prboom-2.5.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/483fc4584815507c3798eb972e22e51f70f52c23 |     
   armeb     |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/40b718009a709261ea0123af1dbac746c2e8d638 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/1ac3be1ea538530767931ca000a621ce841eeb91 | ORPH
   sparc     |            jose-14             | NOK | https://autobuild.buildroot.org/results/492bd1773d679bc96c05603bb0bfe1d5d6644e77 |     
  powerpc    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/526d69a932490495125e7fcdd77343e6437ec712 | ORPH
  sparc64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/88846e3cb267b04da58bc17d92fd5dd385b65b5d | ORPH
powerpc64le  |     python-propcache-0.2.1     | NOK | https://autobuild.buildroot.org/results/c189b8a0cfde20773438b4cc5245143111d67098 |     
 microblaze  |     python-propcache-0.2.1     | NOK | https://autobuild.buildroot.org/results/07d2a7fdcdb6dba470b0760e1a96f57169876fa7 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                  dpdk-24.11.1 | 1 
                      fio-3.38 | 1 
        python-propcache-0.2.1 | 1 
              tinyssh-20240101 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/1d261958edb7acab403b6edab275a320197902ca |     
   sh4eb     |            fio-3.38            | NOK | https://autobuild.buildroot.org/results/102abec6c7cc15d40da1d72457f23254a357507f |     
  aarch64    |     python-propcache-0.2.1     | NOK | https://autobuild.buildroot.org/results/0d2a1bdd9bb2ee59dc02cd4a2612ca2e7538aa69 |     
   sparc     |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/e4563317371c90669f6417ee3d1c48a41cb59cb2 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

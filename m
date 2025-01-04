Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9940E77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 04:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 362F281128;
	Sat,  4 Jan 2025 04:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7EQI-WyPMZm; Sat,  4 Jan 2025 04:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C403A8112C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C403A8112C;
	Sat,  4 Jan 2025 04:14:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D96FF27
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 04:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ABA54064E
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 04:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhgKUGeOvw16 for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 04:14:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EDD640680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EDD640680
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EDD640680
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 04:14:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so1316661866b.1
 for <buildroot@buildroot.org>; Fri, 03 Jan 2025 20:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735964055; x=1736568855;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9AjO6KBbVjwOpXNS9Af+1hJS3LRRDhEGe3GIAP5WenA=;
 b=mCZhj0Y4LvvGURigFQirr4cxN32iPSgJ9GG9mnP6e167tboVGbOJItZwWhi5O/Abxc
 1KMwaRbcOpjBqFPocOd36uZKKtGbF8b5pJjOl0IaMClWT717aAUVP7VB+4wiobPBK7Cc
 iNe9BOtqSHUC0LMcd5R5BHPox/XI6X51yrtmaXwVzkYsG0BCooJwHJ8UDHhB9B/dSHfw
 LKsdtJ+ND0+9ZVj+RpPov7psJzSpwGMEr/nGXpylFC0bDaEh0KM5g/ElSE1TQ/MKyYx0
 wXbNkH3bDhOkrgZNYQZE9sutu4j9gFmwQKkYaHFZ2Kqp/0iE+7mgK5s2ymoKIn4S6+zR
 DIhg==
X-Gm-Message-State: AOJu0YyITMMCv7f1YeZ9vSxRgLytzAD0yrY3jJ3KVYwAU14GdTBO7OXq
 rpyiF2JGfaq3Ga+WfHL4rgGcbWlwUMN970EvNLi+BjtKc7jMk0NI3J3Q5w==
X-Gm-Gg: ASbGncudWwV31Eds+9za5degfxwMdEPc408S4WF3JIWapz1niFT5FCHDXg4gIkOkOS1
 leEZQHutehw1j5CW9xDxMQly72IgUB0jrTChrilGpFP7YF5dMPL2aYzUIHiwRHDF5my7kL5SnLo
 EQDEAiZWIF5miTTPN5zpz1RZ+SfGS8klzaUegZDfpuWcDvMDaaviWq90WWs8J1quP8jqamfVZ6s
 zSdKa1b2OaH47U1+6uci2Y3Tj+WMXePRzSlidjlakSSfSEsztTjaAoxTWxz
X-Google-Smtp-Source: AGHT+IH/dBV88p8laRGxANx6r3HR9yl8qOCtSauOtwWxuUaSzJuPswhsQrA5RT5faWIozv8e29bB8g==
X-Received: by 2002:a05:6402:40c9:b0:5d1:1064:326a with SMTP id
 4fb4d7f45d1cf-5d81ddbf672mr116190292a12.15.1735964055046; 
 Fri, 03 Jan 2025 20:14:15 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806fed4d5sm20824836a12.65.2025.01.03.20.14.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 20:14:14 -0800 (PST)
Message-ID: <6778b596.500a0220.cd533.0429@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 04 Jan 2025 04:14:14 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735964055; x=1736568855; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=9AjO6KBbVjwOpXNS9Af+1hJS3LRRDhEGe3GIAP5WenA=;
 b=WLROOMjmOAKDFM82LCsf/Qv+XyOWEk/CwKS6QJ8ZhsjgmvvLcC0ZMi2s6YJH/QIx74
 rhgvm9UPdh7jMoYWi22NAPlYISsvkLo0ba7MayAu6b9F3Bp21RN9mWb5vPbxM3e/MsF0
 PApvZrQob71mZLha8orv4U3GUWO+AU1ybP3C2oIJIdK1d1U1phLVwUa5LZpAO9ogIMew
 A8FyVrdWYoMxLrBMH43LShBJm6e+KhLHwXzU3flP63ly/gB/9saDgoQACf9bXu42TksS
 YABdKUQkwXHDIR8md8do5ZJd7HIU0KYbrzZXnw2sDGyMcq3nqzrDVrC3tQbdfrDYmFLF
 OaCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WLROOMjm
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-03
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

Autobuild statistics for 2025-01-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  8  |  0  | 11  |
  2024.11.x  |  2  |  2  |  0  |  4  |
    master   | 19  | 60  |  0  | 79  |

Classification of failures by reason for master
-----------------------------------------------

               host-php-8.3.15 | 10
  gobject-introspection-1.76.1 | 3 
          cryptodev-linux-1.13 | 2 
            host-binutils-2.42 | 2 
               linux-pam-1.6.1 | 2 
                  ntp-4.2.8p18 | 2 
                 pixman-0.42.2 | 2 
               pulseaudio-17.0 | 2 
                ramspeed-2.6.0 | 2 
                       unknown | 2 
                 wolfssl-5.7.2 | 2 
                    bat-0.24.0 | 1 
                  clamav-1.0.7 | 1 
             dahdi-linux-3.3.0 | 1 
                    dust-0.9.0 | 1 
                   foot-1.16.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/romfs/romfs.mk:32: /work... | 1 
                   grpc-1.51.1 | 1 
            gstreamer1-1.22.12 | 1 
                 hddtemp-0.4.3 | 1 
 host-softether-4.30-9700-beta | 1 
                  jack2-1.9.22 | 1 
           janus-gateway-1.1.2 | 1 
                libdrm-2.4.124 | 1 
                  libsvg-0.1.4 | 1 
              libtracefs-1.8.1 | 1 
          linux-5.10.162-cip24 | 1 
            live555-2021.05.03 | 1 
              luabitop-1.0.2-1 | 1 
               mariadb-10.11.6 | 1 
       matchbox-keyboard-0.1.1 | 1 
                   mimic-1.1.0 | 1 
              mosquitto-2.0.20 | 1 
                    mpir-3.0.0 | 1 
           oath-toolkit-2.6.12 | 1 
                 opensc-0.26.0 | 1 
          perl-net-ssleay-1.94 | 1 
                  ramsmp-3.5.0 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/14efee7d6619331893c19a85e4cd0856090d2895 |     
   armeb     |          clamav-1.0.7          | NOK | https://autobuild.buildroot.org/results/96bd9d0f70d06ac0e99444f0ae444885f07ddebd |     
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/70ed3af9dcf8f8aa768acaea9dbae470188cf892 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/c26abec4e24d06557079654b12825efb2211996f | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3ede5d66e66eba92e6fe241c839a2b97069e873c | ORPH
   armeb     |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/55dfc00326b505f858aa005a54feab83b1c6cbdd | ORPH
   mipsel    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/411ed1de4aeae5cdc3de138b2d0068d11094aa72 |     
  powerpc    | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/1c777c88f88bc23bc37926b9ebd240035e738b04 |     
    arc      | fs/romfs/romfs.mk:32: /work... | NOK | https://autobuild.buildroot.org/results/f21e786f69bfb7f0141cb295624fb44f9a69a84a |     
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/941d2933ef69381bf00afb3f56fe48091d40de3f | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/2a71410c862e2da6191d9b52193bd709e933e97c | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/2fc9bd780528368e019c31e893cacaf351b189e1 | ORPH
  sparc64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/c53ccfa61be8da973faa37096e8c9bb980d011c6 |     
    sh4      |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/95b2228aa9e9e2e6b3c88cf17e53bdb09c2c2cc6 | ORPH
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/c29bb5add5b13458f99abef4e84a4c309313cb14 |     
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f24a28338629da4cd1c7b7aa1198bdf921ab36b3 |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/61ab59c66786be3d01da12f0ec7c56d582c83d95 |     
    i686     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/85aa84a83cd9359129d0bb97b8eebb065bb9f7fe |     
   s390x     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/e2c7ebcc2709a1c7480256b9c71719b2d4b42c01 |     
 microblaze  |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/d7777356f57d19766f428cf9f9981c598aedd4a2 |     
    arm      |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/d23cf3882e38975b832cd060aaf38b29273c8258 |     
  sparc64    |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/7d0a51f90ff31937d42d6bc598d938fd5a602af3 |     
 powerpc64   |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/61d195b628376a7d71a2b01499edc6077f6ec6b8 |     
   sparc     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/596f0b299f51468d0449038a9f8dcddab0fc06e6 |     
 powerpc64   |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/b99d67810dad98452c1154702cad7fc7e7ec6fbb |     
  sparc64    |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/72199a0c8bbb0125d7066f16af7513cc2083a6da |     
   s390x     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/c8615c39a674e1f991d53586cf74f466087b1641 |     
 powerpc64   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ab1a6e6901edf5f7583ba90fe85b057bca1b2d29 | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/b35cf22ba6f8a47558b1bca07e5ce4e7a43cdd4a |     
   mips64    |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/5780baa7c8ea14c20cc4123428a4e3424bc6f342 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/cd341ef20b45c5388cba36a9aaa6cf06d6462167 |     
   arceb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/94603a6d83074f847c7e5e6fb3adb3a06c4aac4a |     
   sparc     |        libtracefs-1.8.1        | NOK | https://autobuild.buildroot.org/results/1461261e617d8ea4b997b518b235e4de83231c9a |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6ca03c8a3136e2899b70a61404f76a95ddccc8ad | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/49b190b3fbae3cdca4c7a08b3ab5100a937ede9e | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d12424c9255158cd75def79ef4e2b6baca4a4cf5 | ORPH
    i686     |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/ccd1533d025f117b4444a65fcacb4d97196ffa86 | ORPH
powerpc64le  |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/f944476c4c3c4c5f372b3e3c91299b9e24c7d994 |     
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/c79aced041b6c055a45ce252084b564a13eda73b | ORPH
    or1k     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/1100b8babfd2c497b4c49185cb6366dc243d38a5 | ORPH
    or1k     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/b0d36ae5b7eb40259dee876f77df295a90fc49f8 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/97155b1522bd0884008284c8ce4fe6484f7067e3 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2cf08e7748e91b3ecf9adfaf5b1e716c1f34304c |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3780b0c28871af3c8f79efd0341ec42c7fc4286a |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9219c895a740741b80f65dac6fa3022b6c52a6c2 |     
   nios2     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/6e38949583661b605f758148b92f1024e974d408 |     
 aarch64_be  |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/319c7826ddb867e40a294cc5587ebd7bab5e4009 | ORPH
  mips64el   |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/a37ef9d1e778c46c8da4d8ccfcdde8b7813946a2 |     
  mips64el   |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/34694e00ec36625b4a80c884b3caff17cc64cbce | ORPH
   sparc     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/cb1c7a2c9c338d3aaa0c07d2f7469cf3df933a98 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5b8a6235b97f02c8d6cca1d5af445eb2e30c8a78 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/05831609e0c7c842dc6e1521b4698cf381cae614 | ORPH
   nios2     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/eca1c4ab2893be0b7cf3468b81a9de32528c622b |     
   armeb     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/baa0274c8da2c05566cb8107d918531923fbf843 | ORPH
   s390x     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/6f5deb01e2afe6e84a3c1a74b2b2735fbafbea0c | ORPH
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/ee74554a33bbd85f3b2e08537d09b724fa0ae191 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/24bc8b91c13b3e76d9f476d06b7035b919ea7fe2 |     
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7227145654d46e84213729642a4c5c556d6b35c0 | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/bf8a68c9c3eb343bb9ec0a65915a05b85a805784 |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/dbaecd70dc7419e64c1496cf35936f738c892c7f |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   foot-1.16.2 | 2 
esp-hosted-6a25417fc880fd74... | 1 
  gobject-introspection-1.76.1 | 1 
host-prelink-cross-a853a5d7... | 1 
                 libv4l-1.24.1 | 1 
                 openssh-9.7p1 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | esp-hosted-6a25417fc880fd74... | NOK | https://autobuild.buildroot.org/results/8c669cc5d5ae17697f986c9bfdb1867bfbb9f436 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/da433938e8cca83c1a05512554512b2f003459e0 |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/7ef87fe5c6a513140f307568e7e9513ca559dd3e |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/aff71865780886e4f2dbf7a7ed3f6d7034790c41 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/4adb83cee7c6188eaef7af6f4042966e5bdbfa35 | ORPH
    i686     |         libv4l-1.24.1          | NOK | https://autobuild.buildroot.org/results/abed1dc069c3543508852c7c4a169da45a3aa015 |     
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/c9b144c10f2ee50ddcde3d3ee2db95fcaa467151 | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/99e13797d0c654110f65bf70ade62f5a46c3fb98 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

       freeradius-server-3.2.6 | 1 
                   swipl-9.2.8 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/cf9e91dce9edfc07cd3e367e0adf0a2ea47a8c1e |     
  aarch64    |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/33ea1217bbc802efde67a1ebfc746fecbb05d82a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

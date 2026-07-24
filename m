Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1B8C531D0
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 03:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AB5340A89;
	Fri, 24 Jul 2026 03:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_Wy1MWBHkTe; Fri, 24 Jul 2026 03:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A187640AAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784864429;
	bh=L44zkS9bxgdu0ukBdYS7zI5tOp0fregulCCz1+WV6cU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PMyIW76pO6ZrbIy8i/+3nZluiQcpT6E7owvH2uEOrhd0Z+1wmyFLyndfR+UkUrUX6
	 Vuqk7ODHd/Ve/IluejqHLg9z+1jN2hFEAHTpRdBt6SARwt4cAI+PUheTk0Tg0on22h
	 +7wbTVFIu+QB4rKmDTXTtpL9Umq4cPghNKfuHzVpwaCnsO0gU9Vu1fd6wY0Mbd6XaU
	 9IMQ7UnfzoOFwf/ji2rSg7++yA0NFR9y4+8DaszNuj8P0WLLxsu+3xFsH4rTyoopys
	 F96Iw6Kg/Tr9C/mJ8DweQoloiF/go2mK25h645JM7sycHGsKvhH8VIFxM1IvbmauFy
	 +9zh+yaprqaCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A187640AAC;
	Fri, 24 Jul 2026 03:40:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BCFD490
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 03:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DAC460B10
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 03:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msA4KdU2gSYf for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 03:40:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BAFC60B0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BAFC60B0D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BAFC60B0D
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 03:40:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso13841695e9.1
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 20:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784864423; x=1785469223;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=V6bNLY9y9kV92g/RuGSbHpAlJzKzQEsRHHBz0dT+Wx4=;
 b=Pql13cAmpz3EHNqI/jk2e8NrKIi+mcp8OXy/LXNwEagmJSE+tXnSiFvdtK5ozaOcao
 56yyQ2WOsZb0Hv3LyWfCtOZtQKKn65ZnFmKx8OR9UwJeuWaAREugxK77lExqif/DPPeO
 qTnnweoe6kd2SLf96/dC/XK+o8H5UTkIOHmg3hK05K5dBlRi6nMJ3vtUgo2iSChFL91X
 Hxn58+VCt6A+EVYDoxnRmH04Dqgth9ojAWAXB7YjNg5Dg0bNBNT8VFbzbkd+3t3qwQgH
 F0ocNCiHCHk8/rhzVbMUWw5eBDf3dXhaxG7Vs0guhmZz1o7yNsMfKz3PAMgOZT8nUOpS
 fPXg==
X-Gm-Message-State: AOJu0YzyiDSPsFQC1FP9bhEp7spt36L8iOb72uEKMh3/UzjVQ5gornTl
 FbjTFRw+GHPSyUgnVoe24GRljKT+wZBgKtSeFpbQRDMZE0G9okpDk+eHfTLV8kCB
X-Gm-Gg: AR+sD138RKSAIKlyDAWDpRavTCBf+nJ5G1z6L5iA+xGR67OXXRmZ3r/8LiDmbPB2q1R
 egzxAJRlgNyibW/4IZ4O+Viq3/DiURwKtPeEht0eEoLu4TVD+jZYN1qy9bf9xxsZ51Yga+yPQZd
 whRugbm77E7mCeUPcUqZCYKL0wMiCiNf8X6T+ena+VdSNpbNnBAaUKlS1Ml3XKu2SU+xO2opnMo
 5fybG3PbNLv5kMrZXqHrcgXpqwnJ1qXBBGr3bhN5rWxoyRPadB5/X8/Xkuf1ORIyZ79Vtd1jR+0
 YazUA2hU76uzPOQfcE1mWt3yU9aFiVctQaSVMLgjxfFMGHpRuaVYACe1tJHFCV/HfJOSgZU/FJQ
 8Rum3iuTNyx2hqIqZvGduvE9dWuJL/z8laoMWnj7zPPOXL5QeGkHLtEXO+j6ckG1MBJ6nHKc+jD
 bx6zqG
X-Received: by 2002:a05:600c:4e91:b0:495:62bc:a022 with SMTP id
 5b1f17b1804b1-49573cd20c1mr56988495e9.13.1784864422697; 
 Thu, 23 Jul 2026 20:40:22 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957af89be2sm45133855e9.12.2026.07.23.20.40.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 20:40:22 -0700 (PDT)
Message-ID: <6a62dea6.3b530373.1c7c3f.ad2e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 24 Jul 2026 03:40:22 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784864423; x=1785469223; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V6bNLY9y9kV92g/RuGSbHpAlJzKzQEsRHHBz0dT+Wx4=;
 b=kru9NI+FnKGgFnl8203PI94jlFy9faQMppoRhXMrgCmyhg60n0xZES5iuvLkl4Ql9t
 zPkrHphF7zembGfmDh9y1xLWLxQtBv+K6oLo49e2t1n+4+WoVnt6FgKwPr+jrRan7a0D
 7XQ8aIqKRbgR/e/4XrfBfe3mbXcDqL0w7VjTfFJVLgGJCXu+oI1owBcSl9H0H5K0cMiH
 rfU7Zcy5yahrREiE5bAewIJqVgG2ostkTVOTQm5w3SnGueANUE+9H/iII6t3Xk9FzbOy
 oNKARlt/djCu3rrgPD7MAatuUQdEqraToWSWTtwFSQ+qdgyJOoVYz8LKdM6lGGmF6EhL
 xZ2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=kru9NI+F
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-23
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

Autobuild statistics for 2026-07-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  4  |  0  |  5  |
  2026.02.x  |  1  |  1  |  0  |  2  |
  2026.05.x  |  1  |  1  |  0  |  2  |
    master   | 54  | 216 |  0  | 270 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 22
              jpeg-turbo-3.2.0 | 8 
               host-dracut-111 | 7 
                       unknown | 6 
  gobject-introspection-1.84.0 | 5 
          host-binutils-2.45.1 | 5 
                   perl-5.42.2 | 5 
uhttpd-15346de8d3ba42200249... | 5 
                   ccrypt-1.11 | 4 
                host-odb-2.4.0 | 4 
amazon-ecr-credential-helpe... | 3 
                    attr-2.6.0 | 3 
                   bird-2.15.1 | 3 
                   dante-1.4.4 | 3 
                easydbus-0.1.0 | 3 
                    frr-10.5.4 | 3 
                      icu-78.2 | 3 
libesmtp-v1.1.0-14-g335ee8d... | 3 
               linux-pam-1.7.2 | 3 
                    olsr-0.9.8 | 3 
               tcf-agent-1.8.0 | 3 
               binutils-2.45.1 | 2 
                    ccid-1.5.2 | 2 
edid-decode-6f117a8f8c0e76e... | 2 
                enscript-1.6.6 | 2 
                    fcft-3.3.2 | 2 
                  gnupg-1.4.23 | 2 
            host-binutils-2.44 | 2 
            host-go-src-1.26.5 | 2 
                 imlib2-1.12.5 | 2 
      libabseil-cpp-20260107.1 | 2 
              libcanberra-0.30 | 2 
        ltp-testsuite-20260529 | 2 
                  ntp-4.2.8p18 | 2 
           oath-toolkit-2.6.14 | 2 
      passt-2025_06_11.0293c6f | 2 
               pcsc-lite-2.1.0 | 2 
                  stunnel-5.78 | 2 
               valgrind-3.26.0 | 2 
            18xx-ti-utils-R8.8 | 1 
                 aichat-0.30.0 | 1 
             alsa-lib-1.2.16.1 | 1 
                   atop-2.12.1 | 1 
          c-icap-modules-0.5.7 | 1 
          cloudflared-2026.6.1 | 1 
           crucible-2025.05.28 | 1 
                     crun-1.24 | 1 
             dahdi-linux-3.3.0 | 1 
                   dbus-1.16.2 | 1 
docker-credential-acr-env-0... | 1 
                  dpdk-25.11.2 | 1 
                   duma-2.5.21 | 1 
        edk2-edk2-stable202602 | 1 
                elfutils-0.195 | 1 
                   exim-4.99.4 | 1 
                  ffmpeg-6.1.5 | 1 
              fftw-quad-3.3.10 | 1 
                      fio-3.42 | 1 
                flannel-0.26.0 | 1 
        fmlib-lf-6.18.20-2.0.0 | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
glibc-2.43-45-gdae425b55420... | 1 
           gumbo-parser-0.13.2 | 1 
                haproxy-2.6.27 | 1 
host-am335x-pru-package-5f3... | 1 
host-google-breakpad-f49c2f... | 1 
    host-mender-artifact-4.2.0 | 1 
       host-nodejs-src-22.22.0 | 1 
                  ifmetric-0.3 | 1 
            igd2-for-linux-2.2 | 1 
                  iodine-0.8.0 | 1 
                  iozone-3.508 | 1 
                iproute2-7.1.0 | 1 
                     kbd-2.9.0 | 1 
                 lcdproc-0.5.9 | 1 
              libatasmart-0.19 | 1 
               libepoxy-1.5.10 | 1 
libfutils-c326ce0cc2a735438... | 1 
           libmicrohttpd-1.0.6 | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.3 | 1 
              libsodium-1.0.22 | 1 
                 libsoxr-0.1.3 | 1 
                  libva-2.24.1 | 1 
                   linux-tools | 1 
           lttng-libust-2.14.0 | 1 
                    lua-ev-1.5 | 1 
          lua-lunix-20220331-1 | 1 
                  luvi-v2.15.0 | 1 
                 mbedtls-3.6.6 | 1 
                  mender-3.5.3 | 1 
                 mpg123-1.33.6 | 1 
                    ncmpc-0.52 | 1 
               netsnmp-5.9.5.2 | 1 
            nss-myhostname-0.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                openscap-1.4.4 | 1 
                openssh-10.4p1 | 1 
               pulseaudio-17.0 | 1 
        python-ml-dtypes-0.5.4 | 1 
   python-pydantic-core-2.46.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
                   qemu-11.0.0 | 1 
                rocksdb-11.0.4 | 1 
rtl8188eu-cca7c28087db740d7... | 1 
                    sbctl-0.18 | 1 
                stm32flash-0.7 | 1 
                 sudo-1.9.17p2 | 1 
               tcpreplay-4.5.2 | 1 
toolchain-external-bootlin-... | 1 
                tpm2-tss-4.1.3 | 1 
                 uclibc-1.0.58 | 1 
uclibc-ng-test-132c6134d691... | 1 
                     wine-11.0 | 1 
                  zeromq-4.3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/b7f067a0987fa522fd88b642f8769b2e317f2dcf |     
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/f0c1fa624b52a4d3a8a191e8f880a2c6344b5aaa |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/a1fcb037f72e6a3629b16fddfb16ece2f7971462 |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/5303eb0e3d7506e0081ad99a24fd83bd61cf27e6 |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/04eb33d20926ce131ec4686a998d0d619943eb08 |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/ac96598dcee9f0a1843ae0d134125290c6e03627 |     
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/48ccb51b4cc20ffe0ce873e19cadc98da25ff755 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/44ce2213db4968369331103472cdcf8584ba4e29 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/0901c7b340716e3f02af6997d50e4d38ce43f399 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/65afacb8086f1a3e4a50da66c750b423e73a5986 |     
    i686     |        binutils-2.45.1         | NOK | https://autobuild.buildroot.org/results/cc3c20ccbbed41c49a85dcc098dd2d60f7f46a61 |     
    i686     |        binutils-2.45.1         | NOK | https://autobuild.buildroot.org/results/0d4b78e8516080c2738618891b28d5e567cbebe6 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/765a35accbece74cdcc4816e372ceb5823f93aaf |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/05d6c3e887f01d4862182b8efd06d1c0b83ceb47 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/dd8fe86487d301e8565d437e872ec04f2b292a0a |     
    i686     |      c-icap-modules-0.5.7      | NOK | https://autobuild.buildroot.org/results/f7907d7c7d396c30efca2a0580ac2df1a5c620da | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/94402cb88800bcefc819d9f86738e5203b7a4886 | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/38e2cdb0def037c7634ee8cf9193f19965232bfd | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/c9c1a7da8c8988a8b23fcb7b039eee9a5eb67f1f | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/6ef16a4a22a2c820386d972104f95fc84fd69677 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/129f44818f3455c41849cc1327501ad4cb767f54 | ORPH
  riscv64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/e639e26daa7e714fee4d4dcba06e1e12523a7f7d | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/f2ca3a925c2f7b99c72e98be76f3ce3d554e1275 |     
    i686     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/08ccd29df85595080b6c7e4d58166ae9530283de |     
    i686     |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/088e824e52401707188c32ca934994af8fcbbf7d |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/da849f1a4df698e7119fe304e4832ff1719ab127 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b1a6ef30f2b6be633ab8066590f955b2ef423b41 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b2d337e6ba97a2ba6b21c4a4617a9d6439b411e3 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5c67c11d2b528a6218162429084c2d1c649bf220 | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/3bc0b320266130863c0df55dbc3ccbe71d4ba8da | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/525273d178d89ae8eef306d6ec662af368f20f73 |     
   x86_64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/1bb43680941194f9a26a03bc910062ddba0b560e |     
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/fc6ec7477eb7130c0eb03193bc0c20f92afa987f | ORPH
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/ea5822c1c29f143cbe9cfb7ddc6c5f2e22a09a1d |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/43cc5d170fd11b5579757d764230db867a2d4db9 |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/bbe409e4ec040d4ee22c35cc9d7a9e5f7013a9f2 |     
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/d772365fb0f0968fe4745675b9e7e1ceca5c5037 | ORPH
powerpc64le  | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/40419832fb7bd0c12b1a4542ebc6dc257d2ccdfb | ORPH
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f15263acd7da6a8a1a8b9b2802b0b6d49a621209 |     
  mips64el   |         elfutils-0.195         | NOK | https://autobuild.buildroot.org/results/bee0973f9e5f88b8a41e76ad19b0e66c7af49c54 | ORPH
    i586     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/29006472cc8c581281353c530db28589cc3d2703 | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/e712bb6a411327280eebede065a812535a154491 | ORPH
    i686     |          exim-4.99.4           | NOK | https://autobuild.buildroot.org/results/2e5bf80f2fb66fceac53458a03a1f0968c7e60b9 |     
  riscv64    |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/2cb806c0a052fe40a153b5b848b619462929e9df | ORPH
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/ad79f72a6d0d9127306d74ad67edd76ae7dd0ebc | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/a63199c9829c41077b96555b62a0ade49cef43c5 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/e9c001c8c4cd15184d7d2c16c11b936b7152ddcf | ORPH
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/a173affece718667bf149d29a1d2c5058b4e3425 |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/017ec57e2d0cd2fffe86704821e2b66a9ddd7c9b |     
  aarch64    |     fmlib-lf-6.18.20-2.0.0     | NOK | https://autobuild.buildroot.org/results/7bba5c89d9e17ef10e112cc7e5542bd3d5544571 | ORPH
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/ab0f5712988259743c55946029f37ff8ea4d0e8c |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/deef5ed86d38417a25e0016b8f421aa3bf6b2eff |     
   x86_64    |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/c51478808ba94f7eac46178fd428592e9d5816dc |     
   x86_64    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | https://autobuild.buildroot.org/results/7e792f4e3218f6df9c1aad8c447cb71169ebb741 |     
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/f357df44f81f9e3b6b89ced1daea76a7a9456059 |     
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/100465d12b889db798b4a0bae2590f422ddcd212 | ORPH
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/791651e26f0dbdd7fa7e907638eedac8208fa409 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/43c1a9fd76d507dfc90ef281821da047ad203674 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c1d2f939d21c15d2bb8eef33a22d9e1cf330cbce | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7311aed887e3625737bf069d793b54b14815f17b | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a4c0db3c9f5db4fcf356c530cb2641ab3595adc6 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/dd9efb09e11eefce1a477a2f26bf049b502ee35d | ORPH
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/a070a17aac9f65a4ee479ebb422cf8e5dd1d50e4 |     
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/43b9f75701e0a01ae18808d32463387ee41b3cfc |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f41016177b055c3d9552a92fb10a690f94e232f4 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/ee3b39b0e75a7c368d9899055699d42892e26d51 |     
  riscv64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/bf88a7800f56ec04595aacbd27cc99558d520978 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/f826852aed9a42381e48ef3ef733df4ad66e4375 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/45fc193cc4ae1e51a951462c479baff4c1a78ec0 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/2c90b10205df77757b0e59aae63921f3737f1865 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/065cecc678766383cc131261ec7d102812b8a8bd |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/f897d3817e79c954b876bbfe4f6e9e1b6d49a1b5 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/2258bd78782355623b7c653a02f35c217ea7e4e3 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/bca7408f557e2752d2effafb886aaa4aa130cf1e |     
    arm      |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/3997047c2ece6aa52be6babdc5027daaab4b55b9 |     
    sh4      |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/42318c61e65d7ec151e2fb4520f39b03df9c1c65 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/c435f92d6339e358ae6ecafa8155bd6367088c5e |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/b9a1baf3427e1729d801ca36347b74837a0dbf62 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/5aba43d7f7232244fcbd74ee3649a7bb233ecb42 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/5babe8364d3176bc0d1e199b56b16717398f2627 |     
    i586     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/54142d7559a836f5b82a9efc8ef9535edfef412c |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f61711734bd30030422474f22218fa259601c229 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/36991e0ebdfdc0eff24203e3837f69d9e7d846d4 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8255252e2c870c5f7529900cc74f31c177e31b7c | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/da2f6febc3b958d805374d2db0246e8aac4c38e1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7024965353a1c1a15375bd43e45489d9cd82ce2f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a7cf167bd347c3ad56644ebfed23088df5d2d152 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f8c906a1cad227c870e996e9cec6418af730a0c6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e3a073fae895a6828aec19ba98f9f7633e9ab35c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7021b224526fccd7ced6ed4f211dee31e0b49fd5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5e3eb3e318f610baf6d7ffea3d79adaab68bf5bf | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/815f18aaa2a6e9ce1b36951f47e92af9501e4833 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/090ab5c86df6bc20e988780af4d59fd9a38d2b9e | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b77fe74550fb245fc56ec4be4933550e9e47f855 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f67a7401aa77ec05df73bfa10956fc5f6f6db9d0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b002c0c8a52316fb9fd44870ab1c8635b9cab88c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c36688f1aa4a2e1a9b4beec0b4c0a3e77ba7d16f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/802546c927843bd49cc6c4e88e1fd0cf5cc2a7e4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2e2b478dd9a1c9ea22fcd111cedcc420354c6add | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/149967302a69a0252fe3e0539a1c60b0264be838 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/91f0eecdf3b51283407fa39aa252fb9ba2be8a46 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/106c01d9a26ef3d23c9c8f2c903e3ef22480169d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2c70cc5eb4e37d0f65b18cf3f947fa34a2eb0ce9 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/876b825f37c26b2986dc6085c1de0447120ebf3a |     
   x86_64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/b94c8bca225dd7c70ccdd67bbeaa2e957bade559 |     
    i686     |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/92e81352549492edda7436d1701475dd94f68ef5 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/9e7ade2957d972ed778a76f71fcd2a621eae0f13 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/55910a7581101a97a3a554584ac3fd0b13b3eb14 | ORPH
    arm      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/a4b1a96559fa098882045f592dcc6d9ecb12f3b8 | ORPH
    arc      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/10272ff15139a1f623d53f3bbef020d77ec5d9f7 | ORPH
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/be6dd087ec9ec4d93714e925ac22ff8fd538d1e7 | ORPH
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/3d9b99b774a369f0a45d611f5d2d7f93d2e0250c | ORPH
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/9220b438ed91c152c5a2c96902691d32ee28e378 | ORPH
    i686     |          ifmetric-0.3          | NOK | https://autobuild.buildroot.org/results/d589f2db3d7ac75aa026d1c063fb353696164335 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/6400b6a2acd7316d5f4a2ba26949651a413301bc |     
    i586     |         imlib2-1.12.5          | NOK | https://autobuild.buildroot.org/results/b7102c271d57a14f76f24f26d18a7ebc874520eb |     
powerpc64le  |         imlib2-1.12.5          | NOK | https://autobuild.buildroot.org/results/1e6e257fd11ee4f26e35b919f63ccbf6ce4f304e |     
    i686     |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/d1e2910345a4052ad03a0e69e4171f8d6aa9bc36 | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2cacf4078ee6967f4e0aade69594910e410be894 |     
  aarch64    |         iproute2-7.1.0         | NOK | https://autobuild.buildroot.org/results/7a6646eecad0b905926fdc60e6a8051d3e46549c |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/c5b52e74168e5bcda4f446145e8a3730153eed73 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/977b304c98929c1b871116e879e25a6d43b27b9c |     
powerpc64le  |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/3a68712e14fe6ed683418f91ae9e1d4a8ce249a3 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/15429d8cafc858a51235a2ef4f47f22d26bfc4fd |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/fafdcf93ef16ea2b68f5cc825d38275c698303b3 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/237d9d1f98af6d3c0645e2ee1b0b1659be69ebc3 |     
    or1k     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/3d345305d59ffde59ecc439bd45cb0ffcd05589b |     
  mips64el   |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/4471ab8135ce83bbdd04cd4ec8a20b409e7abcb1 |     
    i586     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/5c26c0324700bb63afcab75ffddd4ccac71d45dd | ORPH
   s390x     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/8d3e8f65846fbe4e83580b91194605ca77a6a66a | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/6de217e4bc65ca0ad8feea00a3e82e88d424f9f0 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/b99d2126065ee62ddc33a6104730811a823b338f |     
    i686     |        libatasmart-0.19        | NOK | https://autobuild.buildroot.org/results/68d03b42dfa80f569c8dd8aad79b56842810f03a |     
    i686     |        libcanberra-0.30        | NOK | https://autobuild.buildroot.org/results/a8851952c0bd719eb05d1a736c7d27bf54d1d430 |     
    arm      |        libcanberra-0.30        | NOK | https://autobuild.buildroot.org/results/5d87899fe44bb74160933253eb0b202bf668cdf2 |     
   xtensa    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/00812579d8fa572743597fa7f091cf363e2cf628 |     
  riscv64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/3053b6df2a748d5b0eb63f674179e9da785d8ee6 | ORPH
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/2ad7adc5d6142a241b1ec68380a188654a0b8c29 | ORPH
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/79cd4e7feca8c236f9af99fb91dc140d823a295e | ORPH
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/6bcc95bb6992e73713fa82f25599808fc94355e6 |     
  mips64el   |      libmicrohttpd-1.0.6       | NOK | https://autobuild.buildroot.org/results/120ee16b456524b0d0c28066bb93f3ffebe6ef56 |     
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/709f31b940a3510f7e329d158ab106c01574dc7f | ORPH
  mips64el   |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/098f60849391f2fe5493f4ebb9fe057764d10135 | ORPH
  mips64el   |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/d1daf2819f8e342bc5bfefaf519e311c5c9f50eb |     
  aarch64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/944b515ce0fd5e1b52eeb349ecb6c77e67254840 |     
   mipsel    |          libva-2.24.1          | NOK | https://autobuild.buildroot.org/results/81d133b67d9d7b051020a7e40894e48b3281d843 |     
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f8640519a33172b4efab902800d6bb8ea2cddc6f | ORPH
  riscv64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/176dec41e6fdc19079d9dcfb644425de260e6135 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/031c288106598940813946b33e047b192d3074ed | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/925fb83e52368605dd23967326147196110d22a2 | ORPH
    i586     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/bc87d7e4fb5c73a85ec077bfe24ff115c36ae9ef |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/8b291d8a8da86b1f829eb11cb3bd1961ef9206e8 |     
    i686     |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/fec123788d7b96d74f968f3641d019dfeb6cf799 |     
  riscv64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/61fbc8a0bf4fbcd6f6d3d95d2560a16abfce58f6 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/c752308e200c5e8737cfc3d92d155bddb64d01a1 |     
    i686     |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/479ea1107836db8a14e0d06c7111bdc787eb1bba | ORPH
  aarch64    |         mbedtls-3.6.6          | NOK | https://autobuild.buildroot.org/results/f0f4a6e7f1766bbdc85c1061256b9b74c9745c9e |     
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/005429e46e2aa670a53987f2ac6295355aeb35dc |     
  mips64el   |         mpg123-1.33.6          | NOK | https://autobuild.buildroot.org/results/d14754c13344bf7fd0b041755347eecc278a1ee0 |     
  aarch64    |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/032621c63a6246a7f175965fc95aff6e907ebea4 |     
    i686     |        netsnmp-5.9.5.2         | NOK | https://autobuild.buildroot.org/results/8210283d2a7e0b4ee7f4b9d664a13dfc508fff8f | ORPH
    i686     |       nss-myhostname-0.3       | NOK | https://autobuild.buildroot.org/results/27d522d239506f58883e369eb894850e7cf7fa1d |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e510f7808ab9c2aada5e99c7f3eabc59a5f0c5e6 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6d89a3cfc56abb24cbc39c5116feabd45fd6ed46 |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/84dbc8ab4d7eeac0ceb9a637151e9a8c9e815a29 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/60872a5edfc75cee30010d4cae708f0e00debdf1 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/20c6ec175231f34953d19c617c10f974cb20ac5a |     
  mips64el   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/d734a94d32f6a457610c7ff746a5222f4829458c | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f52058b1b46ac133d74777b4b036fa6753bfa281 | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/a6167e795b9ca207fb9ac842a7039ad2f02520c9 | ORPH
  riscv64    |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/3f997cc4f26d91a2249a81afb3f8c69bad5efc72 |     
    arm      |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/8a73fccabc79b152fe3a80c4e363fdc76cb71105 | ORPH
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/d59f18239f08714d7aa856345249525eb7afefa3 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/c85cb379dbddcbc88f31081267a5d77834a34509 | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/b3ba304fff944f0522b1baf44d8c7e3f68c828ce | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/dc332b4f5afbca04610dc3e9fcda1cabfb8a5587 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c1ddc2a387ff260f69fbf8103ad97ecf81959a75 |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2dafd7b0fdb4c23ea23d6bd7fc46d8f24a32e1c5 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ddca596394cbda9e37bbd449105a66065d8f6094 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/3b2bbcdfae504f97c2020bff362e496d54f7d4ed |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/24392c1e0dfac94d726e2fae2a41d765905c78d8 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1c936a5aed712b71aea2b20e21188d2e7569ab57 | ORPH
    i686     |     python-ml-dtypes-0.5.4     | NOK | https://autobuild.buildroot.org/results/b5405da08c4eaeca97ede345ed4389d4d58702ba |     
    i586     |  python-pydantic-core-2.46.3   | NOK | https://autobuild.buildroot.org/results/b81bca9835d89b04c061bddd2fec0ed0c3b48cbe |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f0bbc6bfa0edb36510a5d9d2189605a0939eeff4 |     
   x86_64    |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/3273fede7a4408cd6ede4495436b60bb889fa9ff |     
    i686     |         rocksdb-11.0.4         | NOK | https://autobuild.buildroot.org/results/9d15176bdf44f41bc8615eeb85b9bb3a8b842c71 |     
    i686     | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/0cc4e494ead20aabafd985c8f84d36b522031723 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/2f317c86e63bcca7ad47b90697066fec755ae36b | ORPH
    i686     |         stm32flash-0.7         | NOK | https://autobuild.buildroot.org/results/8eedf20439e488775a02a60934e410c352fc3a33 |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/2d9cdd9c011e76f0ee6e73bffe929bb07ad2451f |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/80567f3e0f99c6167a4f0f06b98ee3e496dcaad8 |     
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/f8a2aacfaeb6e8b4fc344de471378096bdfacf85 | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/58111961caf72cfc464da5af3e65c8dbbd205144 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/3be50d0a6905a5026e8b6603640afa345ea8c74c |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/6aec187289b3ee9b5ae85c46b3c69118747c8391 |     
  mips64el   |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/3fc566778a00edd9df60dc0650c3725ca653e714 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/587736bf3cb190cf17f7f4cbbb100446521f9891 | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/91920a3b5e45af6e4b7603dc5d956a57ceec2242 | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/afca3b77d359e60c62b07daee4cb3fdbee623eae |     
    i686     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/a0f0baffab21be403cb4fd5423033ae5dacce86d |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/bfb2ac57dd4a5bf5717316819998eb755a1e38fe | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/70c1faa30b1357fc46b60512069894c5cf328a9f | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/fcec6fc996933253ae27a1e298436b689c25d6af | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b80b2743915d0b03d7f4d51e0b10f5d781b7e7db | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/cade2786529c07a6b966ddb86b571ff699b27ad2 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ff84c01b59f3ab7223d1bf36ceede4d7a8e0c825 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/774bfcb95ce906959e8375aa252c2f5098d4b1a8 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/bc99282ab444b078f9471e0c291f1028f51b8de5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/598297bf31ce17061e965a3d0b7a5b92a05a2af3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/bce67e6a17896095f078f2105a9c33aa6e05a347 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4e3f11dbb87f71b0c9a3a777f122e9eb93943caa |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/a71089727e7a9c9f93a60531f24b6c78332693de | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/e4ae5820b2d86548fcaf912b708988861a1a1c93 | ORPH
    i686     |           wine-11.0            | NOK | https://autobuild.buildroot.org/results/913fe37010af799e16af6e48b852f39ae9ccc613 |     
    i686     |          zeromq-4.3.5          | NOK | https://autobuild.buildroot.org/results/ac66b78cf55d7d771a626ce9941dec3f6e6500d8 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                  libnfs-6.0.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/175bf98626a6f737b42ff973f34261e04cef4139 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                easydbus-0.1.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/4fa8a55a8b458fb89cd1e36519189c7be193f188 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 1 
        host-python-lxml-5.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
                   taskd-1.1.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/20897c10def835045b64613dcb1910540bdba1d9 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b3589d5e25a5b4aefbb3cfdb09a089d778040075 |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/44d3ef34b6958064f225579a7f4816ce7eb26c6d |     
  aarch64    |          taskd-1.1.0           | NOK | https://autobuild.buildroot.org/results/6d7bb8e952390b9f534411fe7c43a22fb1d684ba |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580D1E6B25F
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 06:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80FFC4096A;
	Tue, 23 Dec 2025 06:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OaNH6Qib9gMi; Tue, 23 Dec 2025 06:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2294D40946
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766470617;
	bh=ssgDek8XV4KMWyj2/FYNd7hpgR0vqDg6HDUWd0QBV9o=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WeealA/98VOk+w0Wb1vlhFh4f+loPhRE9mdjA7yNzyl/aXaM+S3AsnW3WWea/RH6q
	 syMdxSPUBtvXt58xBYonv53KB7SztmNvQsp5my5ffGiLIUg2PQLCCe0ESBSV1T9KiC
	 X8thY7ohRpMt8VhFc7soaLvnpxtAOzeXl9X2NtO0/5w+y/UTEGMoc/2jiC9ozAWxKG
	 PAk/lWtVgEUdbiHnhpYYZJdZ3NblohfmQQJTbEFliJzCVhPpmt3+VBxWRk6q/7QBag
	 BTsgGzNprzhDSXUXa14DucpcegpxVY11nKKlPdpXZ43icNE2cCA2zJAYqhwGaZA6kV
	 +i/HpINopIqJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2294D40946;
	Tue, 23 Dec 2025 06:16:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AF2B119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 06:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70C5D60B6E
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 06:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDcdcQdgf9-c for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 06:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B00160B6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B00160B6C
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B00160B6C
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 06:16:52 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b79e7112398so766645366b.3
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 22:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766470610; x=1767075410;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JvdZ2DF6vtYda1BCQ4fUJOcfLMuzI9lF28sN/IZZp2Y=;
 b=QDMteQATciEEbYZ8EoLx12SToCGFy3rtheraFihZyAzpUB3FKgNt8/YLHOWGKUAloJ
 r1b+JVloS7DPZEm8NI6Iku1AW5KppFcEYd5ZeDFUbnvXvcOLmCqT9JDXBPRftMFrrN//
 tacFQRFbd515ZyNWsV0AfphoOWTi42WVUvJSwJtqwlD4oka08GGvyqB2wTmmJSGcY6gZ
 9tFkhk4UwmSM2s2Fn0kPa8du6OjX5AhA1igWxWSQ1BtXgAcPu0fSKSilDGVpCBOZTkvs
 EYfXzsma9oqvtJcLasFPmn99XGzfe0NldYuRccKFHWPOOfD7+xNSLXcs5r8J7YZ3Dd8M
 yrug==
X-Gm-Message-State: AOJu0YyczfMqvApWuPK6LgJvAQxZ0V6JHmcGF+EOUBxXGv9AFk8tNugA
 ercGCarGgL3SKJzZQ+d0HdZjmm+M9S1/moq9UfCyEG90i9UfeK1UOg/l9YmaRA==
X-Gm-Gg: AY/fxX5wrpzApgCANvDLYiaG24mY/uDIAC9ZAMZ0thdx+yLyMqXics7osvt/RYxi4Dl
 b515mUIyMUbMIAtKZu7bq26W2dn8bTdp5o6OLX8PRoJaAa9yy8XsaNBMGs7SU0G/nxCt+P7I2zh
 gz6AS3oLMJ6i4t2g2HCmhZemoR+t1RTSDXtX59wQ/u3YD5dvARROvpmQGRJIsIvtBSV2nigSHXK
 hyPioAJiI69rxMMmbo/+c9gm5fcVgTwwr6Rx8F6mT0Erm1G58dt1eb0nqDVmw+elpnQkRKHY9gq
 GflYPHC0iYzvoy3iLR4yUbTo4Ocdh7Zjp2ej1AD7cGDb8ObYInAMwC5Cu9YPzw1rXYXK7zU+YrB
 yjATNvsXYeOxA3jCzqjdCttvqwrVbfspG7tG6kIfmFfPVE+dk+dRmtUkjXsvmegDLxWk7ZaNNY3
 zs4e0UjLhublPjJP94pQ==
X-Google-Smtp-Source: AGHT+IH79Ch3kRV9hY7i02u9L28VAfo7n11b66FNF9n6lfL8wstbuAGHIpe5zdii4Ewa2TFvYUWxMQ==
X-Received: by 2002:a05:6000:310e:b0:430:feb3:f5b4 with SMTP id
 ffacd0b85a97d-4324e70117emr12191101f8f.59.1766463555195; 
 Mon, 22 Dec 2025 20:19:15 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432613f7e6esm12875498f8f.21.2025.12.22.20.19.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 20:19:14 -0800 (PST)
Message-ID: <694a1842.df0a0220.305ed3.254c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 23 Dec 2025 04:19:14 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766470610; x=1767075410; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=JvdZ2DF6vtYda1BCQ4fUJOcfLMuzI9lF28sN/IZZp2Y=;
 b=O6+w3tHC30EhZO20gNTyo8bL9L0D25Tr0BggvIfpylfRJVldACR6RLwMz4SF1DWIFc
 45vF9ZUn1n+5GLVO33WrlDp35GG6GdnjZKbvfzXC7JlfolPY3L494fpm9lUb3ongOvEB
 j7L9BnduXQI76CPzhNRTVwGcngirKSrwH4UGSB34Y/gxtU3A0//FvmpGz2QaHLpvSA/9
 NRi6Q0FMIo+wo22VOiFisQUQMOaZWtInEopccwBADR/A/koYj0vB9PdU3qu5H7qXy8GY
 URIkDjrXTq3DQhWD4miCksrPWMq+/qsGDiNycLE0p3Ea4zJJnvhlf0eelN1Zrv2AZINs
 cROQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O6+w3tHC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-22
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

Autobuild statistics for 2025-12-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 34  | 87  |  0  | 121 |
  2025.11.x  |  9  | 21  |  0  | 30  |
    master   | 65  | 250 |  0  | 315 |

Classification of failures by reason for master
-----------------------------------------------

                libselinux-3.9 | 35
           host-libselinux-3.9 | 21
                libcuefile-475 | 10
                       unknown | 9 
                       cfm-0.3 | 8 
                 jasper-2.0.33 | 8 
                   cvs-1.12.13 | 6 
                  libcgi-1.3.0 | 5 
libcorrect-f5a28c74fba7a997... | 5 
                netdata-1.37.1 | 5 
             dahdi-linux-3.3.0 | 4 
                      fio-3.41 | 4 
                 libiqrf-0.1.2 | 4 
                 libuwsc-3.3.5 | 4 
                   lsof-4.99.4 | 4 
            18xx-ti-utils-R8.8 | 3 
azmq-v1.0.3-54-g819b24035cf... | 3 
           dmraid-1.0.0.rc16-3 | 3 
gli-779b99ac6656e4d30c3b24e... | 3 
  gobject-introspection-1.84.0 | 3 
              libopenssl-3.6.0 | 3 
     libphidget-2.1.9.20190409 | 3 
                    mpir-3.0.0 | 3 
                openobex-1.7.2 | 3 
                    rtty-8.1.2 | 3 
               asterisk-22.5.2 | 2 
             berkeleydb-5.3.28 | 2 
                   dante-1.4.4 | 2 
                 host-gdb-14.2 | 2 
 host-softether-4.30-9700-beta | 2 
                  iozone-3.508 | 2 
             libgphoto2-2.5.33 | 2 
neon-2-sse-097a5ecacd527d5b... | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.42.0 | 2 
             util-linux-2.41.2 | 2 
alure-14beed2a86d5a36030e90... | 1 
                  assimp-6.0.2 | 1 
bcg729-1.1.1-3-g8bec1e5fc07... | 1 
  binutils-arc-2024.12-release | 1 
                    brltty-6.8 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
              containerd-2.0.2 | 1 
                  delve-1.22.1 | 1 
                diffutils-3.12 | 1 
                    docker-1.5 | 1 
dtv-scan-tables-15661aabc34... | 1 
                   duma-2.5.21 | 1 
              e2fsprogs-1.47.3 | 1 
                easydbus-0.1.0 | 1 
                enscript-1.6.6 | 1 
flashbench-2e30b1968a661474... | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
            gstreamer1-1.24.13 | 1 
                   guile-3.0.9 | 1 
             hawktracer-0.11.0 | 1 
host-am335x-pru-package-5f3... | 1 
host-firmware-utils-c42a3bc... | 1 
              host-guile-3.0.9 | 1 
              irqbalance-1.9.4 | 1 
           janus-gateway-1.1.2 | 1 
                     kbd-2.9.0 | 1 
                  libbpf-1.6.2 | 1 
              libcamera-v0.6.0 | 1 
                 libcoap-4.3.5 | 1 
                libdnet-1.18.0 | 1 
                libdrm-2.4.131 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                libglvnd-1.7.0 | 1 
                 libmbus-0.9.0 | 1 
                libnss-3.119.1 | 1 
                  libsepol-3.9 | 1 
                  libsvg-0.1.4 | 1 
                  libva-2.23.0 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
linux-serial-test-bf865c37c... | 1 
                  linuxptp-4.4 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
              open-iscsi-2.1.9 | 1 
                opencv3-3.4.20 | 1 
                openssh-10.2p1 | 1 
package/wine/wine.mk:341: w... | 1 
          perl-net-ssleay-1.94 | 1 
                    quota-4.10 | 1 
                   rhash-1.4.4 | 1 
                 rpcbind-1.2.8 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
          sane-airscan-0.99.33 | 1 
              skalibs-2.14.3.0 | 1 
      softether-4.30-9700-beta | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               trousers-0.3.15 | 1 
ustream-ssl-68d09243b6fd447... | 1 
                   wmctrl-1.07 | 1 
               zziplib-0.13.74 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/10d4fe1165a6ed1cdef56defba2ff87f6a421119 |     
 microblaze  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/bc9c677449da4e48a49819754f92b2feb99f1c9f |     
    arc      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/d8509fc82c3e17e74297314af644b8ede9d74005 |     
    mips     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/fdd7b11c69fd52459c6823a0c8b75c67c25474ae |     
   mipsel    |          assimp-6.0.2          | NOK | https://autobuild.buildroot.org/results/78ed87dfb9a79e15ff90564e32213c628e6b3f0e | ORPH
   x86_64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/90bd85ce5585da91a26ab5501ba6f6f19d24c661 |     
  sparc64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/a264d9e11eb24d4a93f5e6709201575b779eb72e |     
 microblaze  | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/0bd9247474accdd352d7f434ee5e8561a17cab4c |     
    i686     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/0ee008dd5b6a93f7354c7428ac85fb0cd83805e9 |     
   sh4aeb    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/7bac260d4ffd093958e8186af4b0d8f7f99ed26b |     
   mips64    | bcg729-1.1.1-3-g8bec1e5fc07... | NOK | https://autobuild.buildroot.org/results/c3410c0d2892fb66ad6083313aefc6d5ba422845 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/6250a467a80d6dee92a3663bb2075db8a029032b | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/02eeef04260d5286c5dca442d9a2228bb55ffcde | ORPH
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/45fa2e3686b841a28a1ef638e147591ef58a3e87 |     
    mips     |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/1d1ed7f4eb55d759e35d9c9f66eabd10708477e1 |     
  powerpc    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/058da7160e34669091dca3892032418f03c4eb39 | ORPH
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/b780cac1f00f4e368b758e7fd35cd1234206f677 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/281033f2adf00177175cdfbb59cc9d98cf14ef00 | ORPH
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/5bc27dcb5122d12434612758aa5b934574f83660 |     
    m68k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/27fc892efaae8cd803f007bbc8ed1b173b66d999 |     
    m68k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/115de7c3540dad4dd8d137d03fb7fabeeab845b0 |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/1f3458b3a085d0a1b35956314349f39eadb135f1 |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/ca0e30863d050e305e47c296331a1b8361d44dcd |     
 aarch64_be  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a7733363708789d8b34cbbee06be92cb9045e110 |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/79f6fc6faa86d6393484a76be0cdc5ea64b43639 |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/9231384339d0f6d8cefa003ceb00caf2beade1e5 |     
    arm      |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/9edfeff1d6a909a6a65d6cca4e0c32267536ae3b |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/33412c05b2c293d1a6dc2bce6b34993a3a465d5a | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/11c688057d9113f168ef42d0570a7cd3e75e56cb | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c7e85e922625c2167bd112f8f7ef3a7e50cc1e70 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/22d6dd71dcaae96f15bd465b4dd8b87ead67d15d | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8b253ab48ee4c87a5342709573e1a9a61949db00 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/508ccc10f622c3d634c79112a1fd22be498ea652 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/414002f241ff526a5ddef2713c4300000017b8e9 | ORPH
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4017f1cdeb055c26aadc70a8f2a037d999b7b600 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/301013319cf433289d6a4fc7edac279ac9ef014a | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/382f2251b7ea6734a7a7477dc7816b6b64488209 | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/14ced49bfbefa8545e28511675c038b3437f8b5e | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a98e777f12d01e8b750d45600b25d4453ea54e70 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/c351a232143baf3401feac3cb8a0b239f8416e9c |     
loongarch64  |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/d912b8eabc14eea669278fd80b328e5254ffcf1c | ORPH
   xtensa    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/85ca1df14f8601d088feab797c8941be468d6e9d | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/0349a64b3746933d05bb893a22ea4c3c5a562fbd | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/1d65d15281663133de2ebee66e252b8c8cc9498c | ORPH
   x86_64    |           docker-1.5           | NOK | https://autobuild.buildroot.org/results/d2fb89f54d29e9420e9bf5176880d9d325e21162 | ORPH
 microblaze  | dtv-scan-tables-15661aabc34... | NOK | https://autobuild.buildroot.org/results/9ccb77199fb3f8d9d93ad2f33954672884fc3e33 |     
    or1k     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/d94711a647a143d79b621ed65e67ade4fe8b62a9 | ORPH
  mips64el   |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/daef20035be6c73243dc7e78fbcdf08b181bc987 | ORPH
  sparc64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/c90e59f5a5ee5b13b2cb6f7dc6a6b13e91aa94c9 |     
    mips     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/c178fe4c2bb247c013cb01ee86a8f240fe4d3cce | ORPH
   armeb     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/f0c5919f86132efb093024cecb1fa746baafa451 |     
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/dfc6a78c424d086101a330179a3b0515637e332a |     
  mips64el   |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e60d68b812fb2b7de5b6ba59c916a0bf5b1ad2e4 |     
   armeb     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/889788e8193faf7c8ee8746261f62216f378530e |     
 aarch64_be  | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/df8168b8f847377c511e216aff1eebe52a041d7a | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/bb0a10e661275d6cb98f702339ae3eebb45311fe | ORPH
  sparc64    | gli-779b99ac6656e4d30c3b24e... | NOK | https://autobuild.buildroot.org/results/fc81552d18b5884421686fa91bbd8870502caf63 | ORPH
 aarch64_be  | gli-779b99ac6656e4d30c3b24e... | NOK | https://autobuild.buildroot.org/results/e65bb925e8fd303079b29fc95bb3b31ee17c3bfe | ORPH
  mips64el   | gli-779b99ac6656e4d30c3b24e... | NOK | https://autobuild.buildroot.org/results/96e820d9247a51131426ee22c70fe8cc7d110715 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/39bc2f266e1970bbf8417b57c3a37048459522d0 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5258285bd27fe642fd0c22b63b15f39f815b0c89 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c68ded8f1b6d5326d8544bc871105c7a12cc1e5b | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b85ca34c86dd24aa53ad9b6764ca76679ae24ee5 | ORPH
    or1k     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/ef84a6a34c10960957f93579b4db67c1df75bcec | ORPH
powerpc64le  |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/10799cbf699efd81c771c8c03bb6f291bdded749 |     
powerpc64le  |       hawktracer-0.11.0        | NOK | https://autobuild.buildroot.org/results/e8cc15be86ec45dbf772e8a7ea5b4fe930584e33 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ee15a19e77035f9548c0fa8ec1805ea1663ff059 |     
    sh4      | host-firmware-utils-c42a3bc... | NOK | https://autobuild.buildroot.org/results/e4b5bd3588e993507ddc4f654a83b118b911d19b |     
    m68k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/98370f5c34d440d2165876499e74de4335d4c04d | ORPH
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/273896eccbae7702b79a2bdd9e9aab482b315f3e | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/f66a9cdbe238472e4076a3d44bdfe554c6dddfc0 |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/d8bab17f680b8ce98bbc50c8bf8a6f7a966c6672 |     
   sparc     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a4ad1af5f79f499a176a99d3ac4e837bd76963f5 |     
    arm      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/ae823233c8228401efced8029a102b34c98875d0 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/485fa90e52d6ab40005cf45a770e17b264e467de |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/45266ddcb5e974734aec2694dc12bffc2e96cce9 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/c93362bdbffb3addd2f539d680cc6154d6ba9cbb |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a30b967abde5548ec29d88035762ed8ac6a90011 |     
 powerpc64   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/b9fa56674fc7edd3dcf43f0e04ca4793362e0ac8 |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0dfadf496a2dc3fbcadd8c097a3aadeb8bf14090 |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/d1c8b4d01d8baa47b3e0fe7194b8e68206f7f2de |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/45cc5057dbf105a7103211db7150a6ea25a382fb |     
    i686     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/015fd40e6bdac7559c7d7342d2d7b90c939dea1e |     
    or1k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/62648b757a1f9c91827bb246de768696f538033c |     
loongarch64  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/20fd7552842cf3023b971e064858df8589898477 |     
  riscv64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/63c4ad0e6e8dc94503ddc6a2b02f68f40db45eab |     
    arc      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/124b20ae3077381a7a549654dfae9d2677730be6 |     
   sparc     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/29cb2814c391f6303d9ad689988f0ffa2577d7dc |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/5eb6489b11265ec747a87d6c63b13b1ad301f638 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7cb1a76320e3d892ca6ffecbc21fbea538a54937 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/5cc9cb1958d581ee1e7bed2e560342c4bb397331 |     
   xtensa    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/9a01efb3e5590c0fe412974eba52a3e09e3bdb1f |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/67c7a5f2193ddbee749bfff4613aa4156ab786d3 | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/f0ef432599a7bec05a0c01ba87f42d84e593111b | ORPH
    mips     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e3ca2b219b6dc0d21928c4e20dacac0083dceb23 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/98359111670a5ed8b1a2b9a44137527531073c5a |     
   s390x     |        irqbalance-1.9.4        | NOK | https://autobuild.buildroot.org/results/e68bebb429bd8332ccc4b66f44e31621632a5702 |     
   mipsel    |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/05bbb2a54d7fcd8bcbc21e4b6bd86c0c551a20fd |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/07dd5df41e1e511a745a198aaf01ac01337f8752 |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/86a365886aab4d7cc2a8ab166ce3cbf69b84c08e |     
  riscv32    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/2dce87f09cb500597df6c81bd3bed005b168ed35 |     
loongarch64  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/43f6b99359f10ef7d3937414f4a84440a3c03f7e |     
  powerpc    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/a7a0c62280c2e7275037638a6917df5efdc0285d |     
    i686     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/29e434af94b0b5129a404d834da6978604f70f1b |     
    or1k     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/4e4c703238a7f5606a2be8ddac377635498cc03b |     
  powerpc    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/767fb453883b793592a3da4daaeb48bf860d3bb4 |     
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d48a9aa1a1a5339666538ec60af9709d5f387d1f | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/2725be3695e46fa6ff89039e056f1023b905c0bb |     
    i686     |        libcamera-v0.6.0        | NOK | https://autobuild.buildroot.org/results/3e8f7d69cd1423198484d58b95027aa7e98b752c |     
    or1k     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/8682057254bf8d715f8dc07045aaeb4d43d3ef53 | ORPH
    arm      |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/8d56f9c3af0f978d5a1bd66f3af6599a818404ec | ORPH
    i686     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/d229ddf8aa502a27954890f1e93692c1d86c5e6f | ORPH
  riscv32    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/07926bea5776ee3c77e99aa1a65d97efc358b89e | ORPH
   x86_64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/6dd7a7bf3f4bccf7b26f5a93dd0ac8bd1fef32f4 | ORPH
  aarch64    |         libcoap-4.3.5          | NOK | https://autobuild.buildroot.org/results/a734f19ce8a97dd972e69671993644f3790a4151 |     
  powerpc    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/9e1a7ad9ec14645e2566c8a8220f9f1ee4666680 |     
  sparc64    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/7e7202569bb307685c109c0ada30adfec1a1dc6a |     
loongarch64  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/e54578048d3f86d98bed9a19eeaf84c51d849aed |     
    or1k     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/727fad6c75211aeff52121ce7cbf2fd35cb6baa0 |     
powerpc64le  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/431f9e2940ca7f55e38ff5dc02d4bf251b4842ae |     
    arm      |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/9c9477669f95a686f1abaa15f01b253f4807b75f | ORPH
 microblaze  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/9e26740d8f6530cdb8db4c15590f12ed2f0fda8f | ORPH
loongarch64  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/e03101ba585e2770f831dbb6d6dc1dc881a3d827 | ORPH
  sparc64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/ba8969c9823f5cef0943ec2d0a4404ee6602d23b | ORPH
   mips64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/98130626c7f336f568f8a28be00fa9aa586b414a | ORPH
  powerpc    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/339fb7a74521805b49d9851a0ca194dc46603d32 | ORPH
  mips64el   |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/0c999b20901bca990f6102ec65162aebc3542c22 | ORPH
   mipsel    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/bbb4d3303d83a0d1a3903525e190c0ab2569a461 | ORPH
   x86_64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/2f4388a3d322ee806ee9e1b910334146634c5c1c | ORPH
    or1k     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/c8d67d8fccb6ee990031f084d63149dfa78c398d | ORPH
   s390x     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/4df6bcaa66d79efac3619a47b08f3cb02c13e276 | ORPH
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/9b11cc4a3985de451d139ad9e6c7e72167e06af8 |     
   s390x     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/bd27364c90aa9ff139aca20a07b84145d1474c9a | ORPH
    mips     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/12791fce2a6dbc603779368a42a23fc50bc31544 | ORPH
    sh4      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/f99b73904904d325fc841e2a40e07ca239468a0d |     
    arc      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/1fa9f6e1b4dae07613e4d8bbf81c9292c32087cc |     
microblazeel |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/d70c013eb444bf1dd71f0c9815cc724a8f57b4fc | ORPH
    sh4a     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/5b35118e3f18b8f55ee7df8df29457aa1829b68f | ORPH
   mipsel    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/566c0d212b4285dfe9d36e84fc88f0f1fb872488 | ORPH
    mips     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/1b0fab68d4e45b93378d657d41745841c04e8b50 | ORPH
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/48a7ac70b258dfddd988c567aebeb27a633dc096 | ORPH
    arm      |         libnss-3.119.1         | NOK | https://autobuild.buildroot.org/results/3e046c996825447f48377f7c4361b5db26b84f95 |     
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/9a5042244796ebc04f3c1b3d1dbdffc7a27b4f06 | ORPH
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/54742f387366c40cb910aba0de9ca6dc1d69d352 | ORPH
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/426f49c0fd44009fa6bca3eca6c36c34d33bba25 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/64d8a59b9d3942b68e5d416f9241f047cbaf5c26 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c8a36b469bafc47a1d295c797275a52696752d5c |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/003dc9e3e69e2158db339cebe661eb06aaed609a |     
  powerpc    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/609001e9a8b568f167eef1de7fe044974a501313 |     
  riscv64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0dcdb1171e79911e6e9e38fdb1cbe0f9cda472f3 |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/03dda4290287d2bd0509d3186b234e1b312ecaba |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/d72143c5c006b9637881be8ca70b0c71a0390d03 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/5efc597f9cfdcb7977afb36b978b9c19319ef95d |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/ce5472a40045dd6d47a1fe451bda33e45469ee85 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/850dc43f629f1ebdc418af5a91b89fdcd04bafde |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/9a3d5df05d23914e77fb41a5aaa9568b85136286 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6bedce779830d1c7f27df452acdac7ed47347546 |     
  powerpc    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/16b824e8f79a727c80ee47b6a969fcfb0ed7d34f |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/dd56ce02eeb9cbce36759dbd0f1cc365fa99ddf8 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/55f6be5aa7fb6f6f40b8a0a87597eecf74e632a5 |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6e4bd27784e950b9bdb8c2e9bb22ed6947cdaad7 |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a9a9d76cf1db82a76c49c388bec2ca4a1fd14bbc |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/dc43fce8e9b824175f1c447b381897e2310fa2cf |     
    mips     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/cc4d2e3f7e4e4ab28b010932c2c6c53a7ebfecd3 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e65ee2ca7bc6b8d7beb45818fc66218bd6fe3f49 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/4c138f30f4e7033dc0a6c34c266c814ccb8059f7 |     
    arc      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b2f690c17d0735b8b9d8d63282ddef8b7fd5923e |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1b5a8c6fb90767e6d3ebc8f506e95e8be29cf24d |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0e897f3a5b60a7ca2ee28340213ab8a5148ba6c8 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/20adfa96b9be9b2ee718bd4bd9457344784c789a |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/d5863265870866b0a5e9213e547c7496ebdd1711 |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0df0710ed993da35e5e8cad6260758b1a6a2ec84 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/5e6e1c2e01904b9b86f9dcd02ddd1eaaf250ecaf |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0640b9c31fb038223b3c6ec0c0d77cf046277e8f |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b41b5bdc401073c34507980f5f50afcb90f1a2ee |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/755498c8100dca4eb332ef1ef9907a4a8be736d3 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/7293dc48949c01c9f72f62fa7bae2b64acf7c4f2 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b6ed4c0a90bab0aa372bdd1ef07b1e614c9a3aac |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1277b4fe809e8b97f9c0f6af8b691d2e31d037b8 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/48c055f6af335440dd4d5363df487863f965f406 |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/7e4c7351b43dc90f4033f16527a8faab343476e6 |     
  powerpc    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/cf9a7225877cc7cfcb13947b291c66e0f1b27acb |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/30c2fbdd032ec525146993765fce58c2086603ef |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/a6c0d361f37005d1315e27efcb775f07607c46af |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d9fa2d82c62623e8755f88f3a869d5f51ef67ecf |     
  riscv32    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/3cf0e727db0a96120d527d49474d016d32c770dd |     
  mips64el   |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/b8b4811479e9bca1412da7450ae4f0a6607873c9 |     
   mipsel    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/befa98c72d72e8b5dbe8d4c6b59d680c144357c4 |     
 powerpc64   |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/ef3b797085e3565e4440da3c825c92d825d540a2 |     
 aarch64_be  |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/e1fb6b02cdb0c16e63a4e82757db1f91144de820 |     
    arc      |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/4d762040166fb933e48e47903982ac5474218065 |     
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/38c87d1a2b7ad943e6016ec5dc1c3a14193343f8 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d2cfccaad90bb829a33db38d38b79daafd4b2c26 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/529562cbfaf44a2f5c6f37b763f0f762eec7311c | ORPH
   mipsel    | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/a2624c5d04f4ebcb2b6f0ebb2a5265a029063b60 |     
  riscv32    |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/02390c0f164baa96726abab6503c69ed8384df0d |     
   armeb     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/a6324a8dba3902dc6d9059b4c3620d962eb3ea2f | ORPH
   x86_64    |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/4f29c8147531034c4884cec9714fa3b3375e0da0 | ORPH
microblazeel |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/622c90ae7a0aa3719e2caf8638a9453522c6908c | ORPH
   armeb     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/7230e66a03d7025d39aa02b4577b1af34c26291f | ORPH
  aarch64    |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/e434cd0a568fcf97c5007d81056c2831c9a35baf |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9d9d0e92862f0ae269595306984d120d76ad7404 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b41e9b1528c86b48e55ab53e4d3d5d3bfe1bc871 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/cdce1e69278980669a9510f2b8b182268ee3c199 |     
   sparc     | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/553f08480c434c02302f2da7e2cca929fb0b8db5 |     
loongarch64  | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/596b112b5ab12ad6a45d85bfe098bb4a5d937eae |     
    or1k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/0561f6b945f886004fd6f3e6c8699ef70031a20a |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/88aa8dd3c3fd77524037562bdddd4899cc5c2ad2 |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/9f777b0cbbd081607f36ababe18bb1d87038f9b6 |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/57bb249704ab529d538ebfa687982699749e4bfd |     
  mips64el   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/0d97c47efaf32e81b1f4ced42193e94910499345 |     
   sparc     |        open-iscsi-2.1.9        | NOK | https://autobuild.buildroot.org/results/ac7963a7bf9af81b8340f867e559aa378655f0d9 |     
microblazeel |         opencv3-3.4.20         | NOK | https://autobuild.buildroot.org/results/cc857993920607958dd817c6a877ed9386c05738 | ORPH
    m68k     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/86dd12835ebb5fe02bb3fc5aaaec24e74207c5a4 | ORPH
   x86_64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/357e6d846865a8218e9494a4312151109627e4ae | ORPH
 microblaze  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/0944fa83ee2b5152e8fca9e62357ca921b7a1ba5 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/06b241e7274b1df1f525612824e0c9effa2d69e2 | ORPH
    i686     | package/wine/wine.mk:341: w... | NOK | https://autobuild.buildroot.org/results/d439e2447e5757e7be4aa37f8213957c298fe276 |     
    m68k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/eba0a969ae15545320e048b5861f07941a5fcc6a | ORPH
   sh4eb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f2298f0226c212585baf41be6e6a8a494a6fce95 | ORPH
    arc      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/19589fcfd50c906dbbd8bf191f849c867e5f2c28 |     
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e4c42a31d2d42228720b41490647d17d3816dc42 |     
 powerpc64   |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/c651e4aae697b374a24d895aa50f6aa9acf08209 |     
    arm      |           quota-4.10           | NOK | https://autobuild.buildroot.org/results/35dd3c64040f116f106fdf06e9b66a85386490b4 |     
  powerpc    |          rhash-1.4.4           | NOK | https://autobuild.buildroot.org/results/aa2a05206c47d3b18a6190379645dee2db0d9979 | ORPH
  powerpc    |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/3ac80742ca7352a93a70ac1fbc1336610cc1f985 |     
    i586     |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/15beb77881c9b1dc9df8feab83b319fc6dee7f05 |     
microblazeel |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/d998e8b9ca674319b063b51f08353ec25a8e4c00 |     
    mips     |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/15bc755a72622db6499dc929f439a1986d6f098d |     
   armeb     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/f76af71b7c952424aa15ca6fd9e5f9e6a753da48 |     
loongarch64  |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/e73ac65637535c7c031fae936bdc887a26d74b8c |     
loongarch64  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/8f20ef3ebb28957a0fd1af917743e4797f9dad2d |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/7118282c5b8abec8f22806175b19bb12a9f98050 |     
   armeb     |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/97a70da85b0eda30cb0e7a04eecb8f85abda2da2 | ORPH
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/8be53aef817a7a0ec4597d7874cbe36d5e84c878 |     
    mips     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/f6acf8b54cbed9d63ecc3b6a6e96cfb0ab5f1d70 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/a0eba69b8ce17371b60d42030c02b5561cfc9253 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/e7cf54120bb714b281686edce510cb944f3fa156 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1be8746c17e16584d1aa94ae522539e408fe3350 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/239d404a4b40027a51dc9b83940441c453200610 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bd751cd297c86af56bb5e917462bab0e524457a8 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/14450f0288512e8a8ac3b20a06b94718d7a60692 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/009f6ee556d7cd350d96838d2a58e0ac5d9054eb |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7d16458eb962537e872861c4c7947e7e93aaaee9 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/77c03c128b31149fcfdf3bed7ef9ae7cb0625fcf |     
   s390x     | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/f631fac08c57cfb0b1c7292fab399e3c60ca4b8e | ORPH
    m68k     |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/bfded5b0022a057f362926ba9029d15476d67be1 | ORPH
  riscv64    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/02db5ee8384487c11727f27b0257a0e67fef2efa | ORPH
   mips64    |          wmctrl-1.07           | NOK | https://autobuild.buildroot.org/results/d30f469ad31ff8812c2b7d2147e5ceae8ee657f5 |     
   sh4eb     |        zziplib-0.13.74         | NOK | https://autobuild.buildroot.org/results/91fce19efc0e6c4026c09a7c26e99559f949b5b6 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

  gobject-introspection-1.84.0 | 2 
             berkeleydb-5.3.28 | 1 
                    brltty-6.8 | 1 
                 dc3dd-7.2.641 | 1 
                      fio-3.41 | 1 
flashbench-2e30b1968a661474... | 1 
             host-libsepol-3.9 | 1 
                 lcdproc-0.5.9 | 1 
             libgphoto2-2.5.33 | 1 
                  libsvg-0.1.4 | 1 
                  libva-2.22.0 | 1 
               linux-pam-1.6.1 | 1 
                 lockdev-1.0.3 | 1 
        ltp-testsuite-20250530 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
                 openal-1.24.3 | 1 
                   perl-5.40.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/826ecb013a0274a6583204f9c51beda6a63f1bf1 | ORPH
  powerpc    |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/9ea7afbfd27832438203f4055ec64db249369a4b |     
    i586     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/c373ef63303e3813689db99246b345417af1fa0b | ORPH
 aarch64_be  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/0e888db9123f7fce252f965238aa3162370b909e |     
   s390x     | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/b413aa6fdf2983c859741d49cd3b26d8caf61705 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/54ceb917e2136c1aa530a2cf3ab8f5de2d798f21 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/681cde4874dc79aa580ca240d8a3faadca8139e2 | ORPH
  sparc64    |       host-libsepol-3.9        | NOK | https://autobuild.buildroot.org/results/30b12faf69b155dff63d5e93402e8b991f810109 |     
  powerpc    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/20418ea0e7c928a510566f16ea43e69e78a3cf0e | ORPH
   mips64    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/f81bc13339c637ac6e94b0f22c91aa8db78cdafc |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/5d2ed17d202e242dbfb7f1821c896c94bca6feb7 |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/5a70ca6cce53cb17ade6a4b95e017eac3ba565bb |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b3940e4d7ab11fa63d31d05325090486da265c03 | ORPH
   s390x     |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/8dde8c9135decc0003ac80d78a5a020529852e2c | ORPH
   s390x     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/ba5a54b195c8e13fe71e3fcca6829c9b0c8c9426 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2d6bb68b31cffb4a64e87f404759f0886f71ed67 |     
    m68k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/cabdffdd97782621bcd5ca85f46d31214382896f |     
   sparc     |         openal-1.24.3          | NOK | https://autobuild.buildroot.org/results/24de9bc5faf77f9defb21329ac212e3bdcd77f27 | ORPH
 microblaze  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/0ce45fe6bc41ed6aef444a94423af5e56b140895 |     
    sh4a     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/7b9b8e6dca8d6b34c18d4eae3c667f7f02e6ea37 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5dfdc01af5199bda2cecedea34f8e31c0d066844 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 27
                libxslt-1.1.45 | 19
             berkeleydb-5.3.28 | 2 
                   exim-4.98.2 | 2 
            gdk-pixbuf-2.42.12 | 2 
                  liburing-2.6 | 2 
        ltp-testsuite-20250130 | 2 
                   perl-5.40.3 | 2 
                 sudo-1.9.17p1 | 2 
                       unknown | 2 
                  cairo-1.18.4 | 1 
                     criu-3.19 | 1 
                   cvs-1.12.13 | 1 
                   dante-1.4.4 | 1 
                  ffmpeg-6.1.3 | 1 
             fluent-bit-3.2.10 | 1 
                   fwupd-2.0.4 | 1 
                 gerbera-2.4.1 | 1 
           host-go-src-1.23.12 | 1 
              host-rust-1.82.0 | 1 
httping-ffb9201042813c58d02... | 1 
                 inadyn-2.12.0 | 1 
                  iozone-3.508 | 1 
                libdnet-1.18.0 | 1 
                 libgee-0.20.6 | 1 
                 libmbus-0.8.0 | 1 
           libzenoh-pico-1.2.1 | 1 
                 lockdev-1.0.3 | 1 
              mariadb-10.11.15 | 1 
odhcp6c-53f07e90b7f1da69771... | 1 
                 openssh-9.9p2 | 1 
         python-pycairo-1.27.0 | 1 
qt5base-2b9835f5c9bcfe3105b... | 1 
        s6-linux-utils-2.6.2.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/55d8e9066977a2ff9427d85294c6ef827fdf30cf | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/06ed51cd9651040cc070a9ec3905232d68ac76a8 | ORPH
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/3aed2ff761bbcc5d58bf47ba3cf8e60ad8ccff22 |     
   x86_64    |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/1489e41eae47d65fa72a0e535ce49a71a8e2fa22 |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/439cdf0dda685f293546cf95ff886aabeb6f0faf | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6822eb28b70289385d32f6a01e0061b048ecf6e4 | ORPH
   mipsel    |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/663bf918529fa3f0c162d87237c2d54c8b8246c2 |     
microblazeel |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/5ee94fe8b04d4512eab8d4875754a923dca1ac76 |     
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/160bc564b0e944f735d0e75038ce2ef8bb7bedd5 |     
   mips64    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/c861f6806168324e752996c61e7ec4e4313b7552 |     
    arc      |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/935771b7bb0ca3a7e69ad2db9f195635ec1874f0 |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e25c6c101173bfd66b724c4a834ca58931476b14 | ORPH
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8d82c815ce46839a4ec805a3af2706b1bb3ceaac | ORPH
microblazeel |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/3f910aa398cf58938fc0d17123917db07e9419d9 |     
 aarch64_be  |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/a68605b6cf86192844e771d8f089822a7d4927ae |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/0535ebcdd15603cead74bb346297fbbc20d30ed7 |     
   xtensa    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8af44e5ff1afa9ed2c2e75d794d6b00a5a22c9ca |     
   sparc     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8708b5d69e960d7757e416ecf739f782648a75aa |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a3a826748601821b6fafd31a391c990c65494b57 |     
   sh4eb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a9caf98bef818430c2e7fc42d31d9719c539a4f0 |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d621ee63d97be57445f4d367a31e1cbc7b806b0c |     
    m68k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f6d88c4456697b7d24fc9495fc1e229f89f525a9 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/5f1c2de2c59083afa3bdb613c2c46c072ef8ca09 |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/3b9a42e3b88b1b901f9ccb2d32bae32bc0538d77 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/ceaaabdc9daf400cf8ce66a0a71791064540082a |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d6230b3d85375053c0e4ec47d183c6fefc2f6467 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f5287fe34de381c26cd8208886d0c7f5e9ea30b7 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/b49c59044b07037c9e016c193cf28ad83dece3eb |     
    arm      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/c66a1748b78c22cac99c393646233da8f3330ec8 |     
  riscv32    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e358bd927e99d09438404f8329c97baf78b78152 |     
   arceb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/659111b13699cef1b25b04f56f488ea5d6a952f3 |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/327d758c1763342ddd5df457654cc469603aba13 |     
  powerpc    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8b8ac79fdd0fc831820394586556c15583b23d2e |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/dd526f1c159f80b98e0ed22f59c96065a22f2cda |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/1bc77bbdfdff7622088fef5c775d14c6472d1188 |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/31b2a66204b211a54dc26e67eb8a9748f477b301 |     
  riscv32    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/58dacb02e2beee4d1da47464efbcc3051272416c |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/68b4588db818eac5510338fd87b9371fe27621e8 |     
   xtensa    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/b38234ea8160b0b06063073caf6268ca5c55ba6b |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/815a9c836a358bbba95f8d42d3bf1d6edc2d6baa |     
  riscv64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/49366beffb3f921dc30fa6477a811ecafd897e81 |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/12de28700faa12000676fdcd63b93b3288754e79 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/55afb320ba8c29e2b31d2b83f351c98b622144ea |     
    i686     | httping-ffb9201042813c58d02... | NOK | https://autobuild.buildroot.org/results/1c135d8efc94e7f3455f12fa1984b78e0ce42bf8 |     
 microblaze  |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/c2a801b2648780bc1022bc40a14b7217960615a3 |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e57a4430042e7c882da3f469f1c027f44cbbbe72 |     
powerpc64le  |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/af786dc629754b0a5d8cd049c5afaefd22d68efc | ORPH
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/d71616ba286e5717892e2e113badd3eb4d31c137 |     
   sh4eb     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/c195bdf3f2ac1355def6eea61e4876aa00be33ad | ORPH
   sh4eb     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/4e4b38101b034582260cb1d4e8ab6d2c1a7e938c |     
    i686     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/67cf24186855d1e020accfc73ea50c32e9511138 |     
powerpc64le  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/f6b0d85633391284bb3b9c1584da65725009bbd1 |     
   sparc     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/116b5f3cdf805f26bbb0a2eb2a52831124bb9816 |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/bff51fa586625777ab29fd18c7fd00d31e5db3bc |     
   sh4eb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/28ab64ce7590b58109ff8f299f9bb60162ac7af8 |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/d62304b1d8a819abe998fda75c670a9a49d3e422 |     
   x86_64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/36038b13357e56aafe34aefbeefdc41940e39e41 |     
microblazeel |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/ed0e22708d914ff794519e2ed853279e813529c8 |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/237f4c36fbe9331067abf1f3ff3bfe92b31c5b77 |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/7d0ac7acef5de48815306161871529b747967ae6 |     
    m68k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/4ce9521bc3c4ff978390cb50dd6b7d8b45c9ede2 |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/da7ef80361c2741d88e730a1759a3f5810e58c56 |     
  riscv64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/f3b6a4dfa559aaef815d3ffb37975311c91e1414 |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/11f7e132b3ae30e558ad676fb37532cc52c22469 |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/4934f8bce71c15e2455e91076360c895a73be64a |     
   sh4eb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/041eb7e2d532c575e66a08389d940573f213be1c |     
   arceb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/b0081a71b2e781f9e5b8c9d62a121e88f47dfbdf |     
  powerpc    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/ca352db225e17d626a2c596c4c9c4ab965a8e7b8 |     
  aarch64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/e6b7067f691bc6e38deae31fca2a2eadc9f86d58 |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/d89d947f222559c571cc7c6882135722aa384e80 |     
   sh4aeb    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/e804a1c694c9094ef0a28f9ea9987e179690fcd8 |     
   mips64    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/219be3491b5843f010e4f41f50c16da7f639ac45 | ORPH
microblazeel |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/2490c22a0769ab77e4e37de822d6b8f920712776 |     
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ce276d4874fe317497ad94f4c0d1a2447d9dfa2a |     
   sparc     |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/848a08f07e31ff0f148606a39549b808b87eb191 | ORPH
   sparc     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/6445a52ec729f47ef917be93be756bf9ff594106 |     
    arm      |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/04570400f34bb95c97def4f3eda1761745a313f5 | ORPH
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/8d478cea26eef3665924a5d43d25501a29f38862 |     
  powerpc    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/30cff015f4730ea4293c41320832c12041c39a9d |     
  mips64el   |     python-pycairo-1.27.0      | NOK | https://autobuild.buildroot.org/results/1bd3f7196730993b45105a36e477d7bd2cae4600 |     
    i686     | qt5base-2b9835f5c9bcfe3105b... | NOK | https://autobuild.buildroot.org/results/67048052b3d03ad9d1cbde528ec6efef1e892424 |     
   armeb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/b7ea06884de1b92562c400fb4e470b88dfebe044 |     
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/8f70d6193a74c6471c34de78d39ca79008673f26 |     
   xtensa    |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/dbed88f2beaaeb112d3ecd51fbdfb020c7de5645 | ORPH
 microblaze  |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/0dc9bebd0fedb48c67da4f231fb18b32ffaa09bd | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/467dfead0024ddbf5faba3fd15d8f085fce6d600 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/04f23c4fae2cd11bb9d9c3a9ee37c8000e35d6b3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

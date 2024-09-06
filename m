Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB085CE7AA6
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 03:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D7E405C9;
	Fri,  6 Sep 2024 03:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVi2f4K-2ZC7; Fri,  6 Sep 2024 03:17:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E706402BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E706402BA;
	Fri,  6 Sep 2024 03:17:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D72541BF4E3
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 03:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C373040296
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 03:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrF0BJyhuC1Q for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 03:17:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ADA6440213
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADA6440213
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADA6440213
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 03:17:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42bb81e795bso11309545e9.1
 for <buildroot@buildroot.org>; Thu, 05 Sep 2024 20:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725592641; x=1726197441;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wLx5uYs7dgiCVSv3X6JmCAxHGvBUKpdJD9Kg7ThO9uw=;
 b=PMnZ/TasqdNZHx2aPfu+ch15JgHUocCTWxv4qUWS8430FdcoQm8/dxtjZpPGZyqSP4
 irebUy9AH2puDJA8XZgdYVPx8kpU7FMzB259LUL0Z45eUsk39Nqc12FwsLSNdMVxGR6d
 tBTx/blFPj+PVDhgIf4yj+npGNE8XHWqyf8NDybjYi5w14QReWJdC3MzAaK9Ag7nZYrk
 aDwOazhItK2m4Qng5lFAGNiI+ma/8QHGR1H3/j4R7RK8S71GuxI6rF69lHAlWKiZ7gvR
 zIU0jTt6VV+f8ZKu6sgEVYntOAxaioKU/8gJRB4DGfc79/QfRk2iciEKHgNqsESAID/2
 +kQQ==
X-Gm-Message-State: AOJu0YzlCD/PagXt5r5bHonN41XgXKTMOwNXL5t4o6UU1tCSo4JBlia3
 v4gSQkUA+5EVlDbEza/Txu39D74QX3nC+ulYqL9VeEicXfpkPcspBY5aLw==
X-Google-Smtp-Source: AGHT+IFuSz1fv1NFj1tz/RwkPe+9zJrz5UidupeKxCuPPJS1v88kUPnlr3fa4lDUrVBJ3/m0awUhrg==
X-Received: by 2002:a05:600c:c18:b0:426:65bf:5cc2 with SMTP id
 5b1f17b1804b1-42c9f974354mr6686035e9.1.1725592641169; 
 Thu, 05 Sep 2024 20:17:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca05d8a40sm5481225e9.37.2024.09.05.20.17.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 20:17:20 -0700 (PDT)
Message-ID: <66da7440.050a0220.2bcb1d.0eed@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 06 Sep 2024 03:17:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725592641; x=1726197441; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=wLx5uYs7dgiCVSv3X6JmCAxHGvBUKpdJD9Kg7ThO9uw=;
 b=NW/Yzkn17/ORRCJPEZRosK6/b3kt7ds3fMFIOmrLNMEy2ChBkU15HB94d/rRWQ2wO5
 +xTaqOqtkTn5gVoo3LflOm3D8YLpkJwe5o1tsg5hn9QcnWSv52vCFXg0djxAYUAUgZFi
 Dsb43sF0cg6QvNeUlx1gYR1DqwX7I+ANwZUkfCb1FZeZKA/fkmY34NmGwrtl2sYEWMyk
 sQTto2y9AIZ04t8YmOsCNjYFPtjv+JQoGzgjmQEyWXRll1FMcPhbUJGF4K/AIh4HWO6j
 rqOWYE2BYv6HMcr+4foyD96eimUDocBO08xM8jloLhFcrUTw2TV0wUSY93k1zLfRTGFk
 8V8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NW/Yzkn1
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-05
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-09-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  | 13  |  2  | 24  |
  2024.05.x  |  6  | 17  |  0  | 23  |
    master   | 23  | 176 |  8  | 207 |
     next    |  4  | 21  |  0  | 25  |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 16
aubio-152d6819b360c2e7b379e... | 14
                  linux-6.10.7 | 11
         gobject-introspection | 8 
           host-librsvg-2.50.9 | 7 
     linux-5.10.162-cip24-rt10 | 7 
                  ntp-4.2.8p18 | 7 
          cryptodev-linux-1.13 | 6 
glibc-2.39-74-g198632a05f6c... | 6 
  gobject-introspection-1.76.1 | 6 
               ipmitool-1_8_19 | 5 
               linux-pam-1.6.1 | 4 
                       unknown | 3 
android-tools-4.2.2+git2013... | 2 
                 apache-2.4.62 | 2 
                  assimp-5.3.1 | 2 
                  boost-1.83.0 | 2 
                    bsdiff-4.3 | 2 
                   cvs-1.12.13 | 2 
                directfb-1.7.7 | 2 
                  ffmpeg-6.1.2 | 2 
            gdk-pixbuf-2.42.10 | 2 
                 gnuplot-6.0.1 | 2 
 host-binutils-bare-metal-2.42 | 2 
             host-delve-1.22.1 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                 libp11-0.4.12 | 2 
          linux-5.10.162-cip24 | 2 
              mosquitto-2.0.18 | 2 
               pulseaudio-17.0 | 2 
      python-autocommand-2.2.2 | 2 
                   bird-2.0.12 | 1 
             bluez5_utils-5.75 | 1 
                  brotli-1.1.0 | 1 
                 c-icap-0.5.10 | 1 
          cloudflared-2024.6.1 | 1 
                cryptopp-8.9.0 | 1 
                 dhcp-4.4.3-P1 | 1 
                 dtbocfg-0.1.0 | 1 
                   duma-2.5.21 | 1 
                      fd-9.0.0 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
              fluent-bit-3.1.3 | 1 
       freeradius-server-3.2.3 | 1 
                  giblib-1.2.4 | 1 
             gnuradio-3.10.7.0 | 1 
               gocryptfs-2.3.2 | 1 
               graphene-1.10.8 | 1 
            host-ccache-4.10.1 | 1 
           host-doxygen-1.8.18 | 1 
          host-elf2flt-2024.05 | 1 
         host-libxcrypt-4.4.36 | 1 
     host-moby-buildkit-0.11.6 | 1 
 host-softether-4.30-9700-beta | 1 
                   hwloc-2.9.3 | 1 
                  iozone-3.506 | 1 
                  jack2-1.9.22 | 1 
               libdeflate-1.20 | 1 
                libdrm-2.4.122 | 1 
               libglib2-2.76.1 | 1 
                  libsepol-3.6 | 1 
            libsvg-cairo-0.1.6 | 1 
        ltp-testsuite-20240524 | 1 
mali-driver-d40c57d81c9cf4b... | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
                 mesa3d-24.0.9 | 1 
                    mosh-1.4.0 | 1 
                    ncmpc-0.49 | 1 
             parsec-tool-0.7.0 | 1 
         perftest-24.04.0-0.41 | 1 
          perl-net-ssleay-1.94 | 1 
               popperjs-1.16.0 | 1 
                python3-3.12.5 | 1 
                  quagga-1.2.4 | 1 
            quickjs-2024-01-13 | 1 
                   rauc-1.11.3 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/e75ecec7b54c6ac86a8405567ef79b5d3a320f12 |     
    or1k     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/021ddc83ab5b4c6db3dd8ee8fcab60a2292b5842 |     
    or1k     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/c8dfd130d993d15b7cfea1b3a1ee60803619ea42 |     
 powerpc64   |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/50ddd6508493597a48344a1d288bbb6aefb90c72 |     
   armeb     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.org/results/5e2e7a19b640b3e2e10e1c4f665d81a9b1d36a0a | ORPH
   nios2     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.org/results/dc2a51f206e1ebb687efb900a8718dddcaf82a76 | ORPH
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/1b6d7db33a6379b7ecb940c43b1083a1235955a6 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/31b1d5d718db85e0114f5046b6fe856e74f220bb |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/5e90b85dd9e1d4e93fa2d29972eade71c86e35f3 |     
   sparc     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b05a9d3ba5146855dc79c919db916cbe9e1314c0 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/ae063b7aff9f70b7ccfaab0c88636aace18054a7 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/46f47d8ff269b2921f053f78ab0421ec9183add0 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/e9806579e6d215c007840c7505b6d6dc0a07980b |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/1f3c23000cdc81132009cbf88e2ed70448b264de |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/7479566dc945afd1e049d828c40583737330a053 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/054616967caadd069d6f91e1642ccdbb7b27396d |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/bfb1ce83505e379b1e16916dd5be6af861e269bc |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/94dad939400be9acd7465d7cf5b1b0d493b97828 |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/881d06a37c3cbc2e454ffab9fb8531443b5faf0b |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/ec406b44503150002ecfe1719df9f10952e3649e |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.org/results/4e68355c0f22f1a979eb4a08027786fa5df57588 |     
    i686     |       bluez5_utils-5.75        | NOK | http://autobuild.buildroot.org/results/b0e5db6379910ac448201171244c55523cecf0d9 |     
   sh4eb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.org/results/b7ee1a08a5dad2dc659d7aa1c982047810b77b69 |     
  riscv64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.org/results/80c07a96acaf4d00ade7996b60ddc12acbe2d682 |     
   arceb     |          brotli-1.1.0          | NOK | http://autobuild.buildroot.org/results/dca362afc84f278484252585f8f43847937ed689 |     
   sparc     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/be8e31dd316685d30c547cb39f46a638dcb9140a | ORPH
  sparc64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/71cc144ca59d67f6aff13546d06b13ae6611a6e6 | ORPH
   s390x     |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.org/results/6ece0630a34cf98740d18dc823d2532410790776 | ORPH
   s390x     |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/994aa1fc1b9875500c4533f52141575e1ff373e7 |     
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/8f1f9ba89490d54b6de152dd23b8015546ed3432 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/cc8daabd80654e19560a5286d6678938c662af71 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/c2bc3f874d74085f89e7443e7bb073b871dce7b7 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/eee824a4f59e7c5366cd0fe40f6c901bfcfc585e | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/dc171077c7dcc5db7f329a841611ace415d2d7da | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/b4503bde4238cf34b1dd55313d515975c17f54e3 | ORPH
  sparc64    |         cryptopp-8.9.0         | NOK | http://autobuild.buildroot.org/results/19ca74f6ad5f23ae28f2a77d40f1ef8c0a516296 |     
    sh4a     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.org/results/1e1addf33eb318a6285ef6c8245b8d5f23b49bde | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | http://autobuild.buildroot.org/results/43ccb15729ec61515266b1c664f66464627bb3c7 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.org/results/a7614b95a1d3014d1b3663d207a61f65949809ef | ORPH
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/25eb4e8e517f031ff52ec9889643b013534b16d9 | ORPH
    sh4      |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/07726c6b595554bbcf381b60f79c186dacbb06ab | ORPH
    mips     |         dtbocfg-0.1.0          | NOK | http://autobuild.buildroot.org/results/3564d295b1ea5b1b640ab80a5960c56eadc454ea |     
   s390x     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/dc0028832c9edcb75b6f11797b6aa4a95ee5e43c | ORPH
  aarch64    |            fd-9.0.0            | NOK | http://autobuild.buildroot.org/results/2e787273c51870eb1fa05032db7554a3d928b135 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/e57b3db45514c5958f9b09f203421b43e6ab721f |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/adb3a3609997c592610d569b486710131f0720c6 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.org/results/3c97187d0bd8ab2238b91d45a0356ec3b601610b | ORPH
   mipsel    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/574ea0ad7827076a1f3f415588896bc93feb39b8 | ORPH
    mips     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/e10ec7688878ae1b3e031a31298fb47525cce730 |     
    arm      |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.org/results/e2a96b0eaa6c8f901c9ae5f889e493074d879755 |     
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/cc6ad56486e37c3f01526c083e65cbcc5c1eac9c | ORPH
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/631ef4dbbe707cfca496c8e5192434735a60cdb8 | ORPH
microblazeel |          giblib-1.2.4          | NOK | http://autobuild.buildroot.org/results/df02a177a618175a30242ab1a3cc96117128b3e8 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/5d4c976ba6f3a6935908f9dc1988ef0ce9a3333a |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/ee6ad6b789ea50b5e04630b07d19f7d3b399d7b9 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/3b85a95c112fcc286a4872a65e7d242cd7815199 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/557d4007195389c8e1483e50aaa6e995ee96a88d |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/9d63fa28d4c923c4d65fbd4a49d089662714c962 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/968ba36e934dbc9409a563190cc53b39da469d33 |     
    arc      |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/9ae0f6667849bd281200e7d44e27b88753dab3fa |     
  mips64el   |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/23404b14b4d7970f4f63cfc612d728e32fcdaa85 |     
   mipsel    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.org/results/edc625041440a2cafc37797b2328e7d9e651f99b |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/2ac37c640d26d77912c991d620a87675956175d9 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/33fed057600b5516b12ac7eeb1442615b3b03c90 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/82245adeb67c5050d0cf1a0de08f83d20dce5e1b |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/14c5b2514a1fe10b33462e4f2403a95dc117b678 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/b10e7d195d4582c9f93099795b48efad153e9a42 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/50b7041d6d38fa0fc6961bc62b8c7cf652df2607 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/fa16940ecf57e5f615061aa70bf4143c21903df1 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/54c6beeb39ace0b718fddd652ef31812311d2937 |     
    sh4      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/69db83bbdf44ec6fc18a44f90ecb4f37e340a305 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/e09ea2acb88840385eb691a84cd3cd4b672c0e61 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/13c5e74b83ad72b7a330f17d0dd93392daa71dbc | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b61f1d008ddff7a7a48119115eb473494ada474c | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/bc0f6ba9471a89cfd67a5e12d1fc78cb129a2c4e | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/2f6f9b46d1f951dfadd374184735598a79d9d6df | ORPH
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.org/results/ae8c1e91cd2fa8679d11a90007f891a50115825c |     
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/e4cf6f229d0f18da07de1f4a1cbf97d487d150b2 |     
powerpc64le  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/76da5b1dd58b211c791dfc1ad3d29c4a03d33b1f |     
   mips64    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/f7dafcc6ddd1c14b8b107455bdb82a8d3d3627e4 |     
    m68k     |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/49fe9d012fa7b3266140b18af9b21f6a46f604c8 | ORPH
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/a1d70b2e425dc845f724d31e5d012b8aade5ba7b |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/25a7d6c8c86805aafd2ebc14605da7d1eebc1173 |     
    or1k     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/c3af5f46b07324abbd15b5e1d0a709271edbeb4b | ORPH
  riscv64    |      host-elf2flt-2024.05      | NOK | http://autobuild.buildroot.org/results/292c8a96f89fea42fa441048b6c01581899f1c3e | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/f982f8400788502a8fb24491e652830138d89c5c | ORPH
   armeb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/3245b158bf218bc6a69ea4e895ba41f043b9caca | ORPH
   s390x     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/0a121cf5d4c5fd3ed9a71da121097e0199d1a6e7 |     
   mips64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/00dfee22967bb969c2b959abfc2e51dee97525af |     
   sparc     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/7a8cf087b3a5a58fa6518ac6ae15da04ece87787 |     
  riscv64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/55152c5ca74dba6433e5fff37ae1fa7c0cfb7d4b |     
    i686     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/9302c05b57a79d271a9e98365c2ee63e59fa912c |     
   armeb     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/940f9ba88f8bc87826a1ed86ef257c5e092f7923 |     
    mips     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/cafb30af428597d50e63d58e4a354dbd7e1227e4 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/01ca1393a6b92469a6cbc1cd78c47bcac19d43f1 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/309267b89777bf33d85d719da829735721b1eadd |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/8b944f3a25cff64c0e798342a5a35602ebdac2d1 | ORPH
   x86_64    |          hwloc-2.9.3           | NOK | http://autobuild.buildroot.org/results/e9da1a831d7185e338a0fdcc84c21d3a3d79bc52 |     
  aarch64    |          iozone-3.506          | NOK | http://autobuild.buildroot.org/results/87d4708748d6228eec6dd8565277f5aed0749b2c |     
    sh4      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/547ca63978555b9df064eb52d14ca57aa69cd577 |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/02291f7c8f151dc633908a3b2621102a10fb132a |     
microblazeel |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/5be9671d4d044b167bd750447a81e0a21e2fadb2 |     
 microblaze  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/d38a9fa444c33620d5b1271281f4c7c3b36f968e |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/573b86fa380fe50fbd591fdbaac35e3df490b0dd |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/0198d25c883a71777176d78bb27776f969aa1512 |     
  riscv64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.org/results/0fb7e435ef8d180897c2ba234a19735aa00c255a |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.org/results/57253bf2fe9720e10356c00e8261518ccc77f6cb |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/5855c562823df43e923e85a461b079b88c09f28d |     
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.org/results/a28fe8ab22207701e0f3982c61e4eb4b8b1ad957 | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.org/results/bc8bda147f0508025f661db31b7b636363abee49 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/c77759c9cdb70da82594a326cf54b9e59e9f6e9b |     
   s390x     |       libsvg-cairo-0.1.6       | NOK | http://autobuild.buildroot.org/results/91ca5a3d5f9acb678e32e42124856a95a20ba328 |     
   arceb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/d88c87b104b6907ecf823179e64a994dd1b792a0 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/dc80ab2fefa8fd601fe8f179801836c6f20c8c88 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/33e56aa3a4cb15c00775ba5882a4a359d1ee094d | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/8039112f0f2d3d29fc665fc0a7e9e3a990df9e52 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/26a24d6b186153127591aaf40e413b750e9ffe38 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/bbba7780350c7d8bae5328898a1cb413847f5b59 | ORPH
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/033cf331f586cf526a30350dea9c25d48a4976cc | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/96a05fecfc36f32041f14cc9b7c9857cfa4b414a | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/dcedd976e22aa1a28fbe67d7a9c8330cce9dd9f0 | ORPH
   mips64    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/ce3921d9e595cf581a99737b79175fdad8aea565 | ORPH
powerpc64le  |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/dfb0e91b02286426f942d3248ec01abafd95f841 | ORPH
  powerpc    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/d3bd792c49260dc0cf227ae40b0e89e818cf4422 | ORPH
   mips64    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/452a6f2156d7d38c3efc1f4298c2f8cdae2faff7 | ORPH
    sh4a     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/a00c45523a7f39547fc3f644097f2d3bda07f3fd | ORPH
  mips64el   |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/df4eb501cc0a77c524c13796416fb9a33c9f1309 | ORPH
    or1k     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/cf5ea6f99fde28c4a70fcd931b5a5706dfba4ccc | ORPH
    sh4a     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/1abeb65a2441e959df4d31f8154214bb432d73d6 | ORPH
   mipsel    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/794f7bee65b98eccfee3984a845a46f0088fcabc | ORPH
    m68k     |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/ce61a2343512309a4a18d10a3c1bc0c8cc852602 | ORPH
   mipsel    |          linux-6.10.7          | NOK | http://autobuild.buildroot.org/results/bb63558b84756674cbf7a3772a6481de76ce45e5 | ORPH
 aarch64_be  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/883eadc03c3e36e7bf2f7ec505469ffe2fa04372 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/715535d7e308d9041a2bd13ca72ce526ad2ffdee | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/8c5ef8723a422a835bd8526959855005eb45062a | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/17eee1a7f9a16b85dd855ce34e88def1401a91d4 | ORPH
   x86_64    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.org/results/5403453d87e168258bdb4bd59b0f0a938c43093b |     
    arm      | mali-driver-d40c57d81c9cf4b... | NOK | http://autobuild.buildroot.org/results/b4dd144f0ca0e0ce2ff72cc1f1e26c035f8e9311 |     
 microblaze  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/659d5bfbc21d3a49546e2a8f8a5114dc9811e76e | ORPH
   mips64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.org/results/2533529ca8a111214942580289ab3cfc45515c48 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.org/results/67ea1afeaa35f0b20b1b4dd963e35ff023255b06 |     
microblazeel |           mosh-1.4.0           | NOK | http://autobuild.buildroot.org/results/ab613d5963134c0f295962f7b25abae8c89305f2 |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.org/results/98fa422246a578cc45e8181d3853bff201f1f070 |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.org/results/8722787cc661474e895b93f32089f002c95bdb42 |     
 aarch64_be  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.org/results/1c81c2429261a21b6cb96abf5ce4bc472d10b59d |     
 aarch64_be  |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/b2b034216c9f2018c8c0e78ae07a8ad4a09dd4ad |     
  powerpc    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/41b01751f3b67233d0281da8b457d125f38e5e82 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/096880caaba5874ab52b854db00531400029932f |     
  riscv64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/a1b22285fb5c93b8ed030c60fd211edb1710fa1b |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/2f503bd28eae84e5b65e8b090c81abfeee98af26 |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/20fe3023bdacd3093ee20ff1f69dfaa141060cbd |     
    arm      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/4a59e2526a49d8a50817de519a3dd3e68c4cebfa |     
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.org/results/18026b14bb32caece24509dcc9de4e86981fe3d2 |     
    i686     |     perftest-24.04.0-0.41      | NOK | http://autobuild.buildroot.org/results/d25c84fc739f15808142311ca79545a7212d2590 |     
 microblaze  |      perl-net-ssleay-1.94      | NOK | http://autobuild.buildroot.org/results/c0e31e6d99b23b7933877017a12141ac54fd1aa1 |     
microblazeel |        popperjs-1.16.0         | NOK | http://autobuild.buildroot.org/results/d1a5b56b987aa178b2ca3fa0855a5bd3da896bcb | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9dc5957265f978118f4cc8ccb80bff4697edfb4f | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/64dce401120e2bb0ae149d08ad1c02f772161f9a | ORPH
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/0a51aef81a68fed45cdced74567959fc62daace9 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/fe2ce80e054121ba9d41bc471cf2a66434bbcb80 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/2da3e8516248f5643f6eb94ecf9e2835ba08a4c3 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/6b7721a1a1b69f5187e3075300231d2420d234f8 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9fd404cb6f82472028ccb2212e670b9fa71673ea | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/edf5a338901617ccd892652b9c5cc70db6b436ea | ORPH
    mips     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/40891b9781f7f1f51055c2402cc56c76e5d22cd5 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/0899ea687e6e8988e343b1fe860059db0b0ad713 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/b80563671f734495574ebc819b7e5f603ec8c41e | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/0c4520ceac798cf97371785926b24fcc1b5e7489 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/2f1f96070448d142e88577484f693863c2af0e71 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/b93bcc5612b4f4159e6b54df3bde20cd154a69fb | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/6f458c5bf2aa4433973d320ee92f67e2d911eb3b | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/da335d19f357c897994da0c07edb857ae7a04499 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/da23b3ac12cc301d221066fe0aef83490d7c2ecd | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/dee184bebfaa3f16fbaf45a841ad90e65fec6723 | ORPH
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/3dd98532ac94ef93b8208c996fe2fc95a321939b |     
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/c81b3d15c83ee3ddac15257484754cfcdc4fa04f |     
   arceb     |         python3-3.12.5         | NOK | http://autobuild.buildroot.org/results/1d7ee64f81d606be10fbeda8f92e7cd44a689e26 |     
powerpc64le  |          quagga-1.2.4          | NOK | http://autobuild.buildroot.org/results/ed3cb410aea65605cceee9ddb4c467f0553793cc | ORPH
    arm      |       quickjs-2024-01-13       | NOK | http://autobuild.buildroot.org/results/e8d32b02f7a6e65786c4dae3339367676f3f8190 |     
   mips64    |          rauc-1.11.3           | NOK | http://autobuild.buildroot.org/results/719db88fcefaf66321e71bf44df3b2e5b633da11 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/c40bea599c7894bd4341771859b516a6aebf1480 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.org/results/dbb0e2dc9a7102e12c9bc5a866aa26c1bc91f4f0 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.org/results/c4d57d655e7ce2fdc0380b84fbe0ca60c27058d1 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/83061154a9c21ecf981fdf5b4c02be6a793a8e56 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 3 
               asterisk-20.5.2 | 1 
                  bcusdk-0.0.5 | 1 
                 coreutils-9.3 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
host-am335x-pru-package-5f3... | 1 
               host-go-1.21.13 | 1 
host-go-bootstrap-stage2-1.... | 1 
          libcamera-apps-1.2.1 | 1 
                  linux-6.6.44 | 1 
               mariadb-10.11.6 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.org/results/8fe0f2cfb2600eb88a57ead42fafaf1a762d1594 |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/8fc680860cde1068dd6ba60cbeebedbce9e0d48f |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/cdde111a0b28d786c707f11191b1e4a30e045b57 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/5b489e075949c4c76e555d3a460029b8ab84aa8c |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/67543056ea6365b1cdaa4964931234e3c350f751 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | http://autobuild.buildroot.org/results/9d6da87a48599279bf5816f958747cc2158941cf |     
 powerpc64   |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/53eceafe335526d29b77b19c29a43d2837a6db95 |     
    arc      | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.org/results/873852eeea9370d2970cab0c5958a054fb1c8c34 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/f80e6f3accfcb53495b4a67663b432172416bf10 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/c94000cfb2eaea9a4ca5ac7eb922871cdf7de4bd | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/ed259ff46ea3c0cad3fac3d74acd76850c0f33e6 | ORPH
    arc      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/ed2343969a5973054221da52fcad60ab1796bec8 |     
 aarch64_be  |          linux-6.6.44          | NOK | http://autobuild.buildroot.org/results/4ccd25ec2bb7996e582a047cc3f7c9669e773aa2 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/4ff3e71cc2aa2365f0393514ba31020a54afc98a | ORPH
 microblaze  |            unknown             | TIM | http://autobuild.buildroot.org/results/9af8cac408efbbccdbadb88660d652c0ca7f4532 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 coreutils-9.3 | 2 
                  fbterm-1.7.0 | 2 
                    bat-0.24.0 | 1 
                   bullet-3.25 | 1 
                  ffmpeg-6.1.2 | 1 
                flannel-0.25.2 | 1 
                     frr-8.5.4 | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.8.12 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                       unknown | 1 
                 x11vnc-0.9.16 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.org/results/590c417d605923d7c9f99e916672e67f9e709d4e |     
    mips     |          bullet-3.25           | NOK | http://autobuild.buildroot.org/results/6faa4ed82149485d2267234062a7b7018a499c1b |     
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/acd5c72c00ef10cc2c8d4569d406fae5e3c9c992 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/fd2c5c5e1c25b92f6314f816d7b3f141d0e23eb4 | ORPH
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.org/results/9a813f3043b6789a96ef44f7034ea2ffa2d4b1f6 | ORPH
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.org/results/150a4f90c9087ecc99d12a19db354da3b27ee78f | ORPH
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/92f5f6f756750e269cce7a344c6126f540222d4f |     
  riscv64    |         flannel-0.25.2         | NOK | http://autobuild.buildroot.org/results/eb884db14708bb1ddbf5a54a845b3922cae0c085 |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.org/results/f8a15e73bb8c7c1ed39db11125ce582cd5584e05 |     
  mips64el   |         host-go-1.22.5         | NOK | http://autobuild.buildroot.org/results/bfd541abd54bff76b7f5c021d02527aca6e9d8c6 |     
   xtensa    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/e29e25f2abe59986abe231476d30429b771ad616 | ORPH
  sparc64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/bb20a17034dffab238063b7d93e03da70369fa9c | ORPH
 powerpc64   |          linux-6.8.12          | NOK | http://autobuild.buildroot.org/results/106408e5a5040319e53b9599efd4e0fe470928b9 | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.org/results/d5c821f76bd3c801ca8d2cd7d42014db7d2d096e | ORPH
    m68k     |            unknown             | NOK | http://autobuild.buildroot.org/results/ba5662389ce0bba38a82905e16fac3479f435447 |     
 microblaze  |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.org/results/8afbcc63818d3e1586731e178f16635e773d5600 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.org/results/d02147e844f22ca9a443b0d18205d134db171009 |     


Classification of failures by reason for next
---------------------------------------------

             bluez5_utils-5.77 | 4 
                     avahi-0.8 | 3 
                   atop-2.10.0 | 1 
             cni-plugins-1.3.0 | 1 
                   cvs-1.12.13 | 1 
                   eza-0.18.22 | 1 
                gerbera-1.12.1 | 1 
                     gpsd-3.25 | 1 
                      iwd-2.19 | 1 
libdbi-drivers-0bfae6c43134... | 1 
              libopenssl-3.3.1 | 1 
                 libv4l-1.28.1 | 1 
           mediastreamer-4.4.8 | 1 
                    norm-1.5.8 | 1 
                s6-dns-2.3.7.2 | 1 
             sofia-sip-1.13.17 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/9d7d3a24c08d676bef93c57f228814c8ca7b40a8 |     
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.org/results/67c6260c8993fbc76ad1f44204ccc18a6c485aab | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.org/results/56a4effd55d6ec11eaf471d6a2335286d9600926 | ORPH
    arc      |           avahi-0.8            | NOK | http://autobuild.buildroot.org/results/041be1910c9b276ae912838571a98ddb2ef1e0cd | ORPH
    sh4      |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/3dd794aaa7fa5aeea28f9d4951f721aaac3ca86e |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/6bdac383aef159393ccbeeb60ddaae09a753f398 |     
    arc      |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/6b7c5aa6e7a3ef3409c91added1b8e274928fd21 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/16a58c4121935f562e12d9d25020c187eefeb94b |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.org/results/f90e773822115ad325ac46ebd90865a692687dd8 |     
    i686     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.org/results/d7a2385e6d0a012d7b1d6bdd540ee73be202adfc | ORPH
powerpc64le  |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/a9bff899a487ef68131ca83b160e371a8509ed9e |     
    arm      |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/35791973527738db84eaf53bbd1aa4e3b5ff9270 |     
  riscv64    |           gpsd-3.25            | NOK | http://autobuild.buildroot.org/results/d4a5a27572ce496c84c5d272cac84414907d9871 |     
  powerpc    |            iwd-2.19            | NOK | http://autobuild.buildroot.org/results/46f22a0bb0729c34aadbd5c7a9f8fd64026dd9e1 | ORPH
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.org/results/d9b3109a066c00bb21e1c1240b2c7f51df06d092 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/95699ebcbdc1a02a9186ed073eb953f308f2a5cc | ORPH
    sh4      |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/0879ed7cada94f77a9c2dbf7e29c37597b75e12e |     
  powerpc    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.org/results/f5e6ab47a255c2a510ee9c8cc388f1c7c9e39103 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/4bf7479e1bd69a2a1b0b6225e974aea272226cdb | ORPH
  powerpc    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.org/results/6296e4bfee902d383dad09e22f0229ca1e61fed6 |     
   armeb     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.org/results/d04c7bc41a7a61fef0207b8fd97eaafd313a474b |     


Gitlab CI results for 2024-09-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747920028  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747920053  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747920130  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747920154  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747920559  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747920778  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747920840  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747920933  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747920948  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921003  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921019  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921031  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921063  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921089  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921102  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921242  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921431  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921533  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921651  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921750  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921762  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921778  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921803  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747921866  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747922019  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747922075  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747922081  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747922114  | ORPH 
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747922478  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747922838  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747922847  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747922922  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747923431  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747923603  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747923870  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747923904  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747923943  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747924492  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747924555  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747924589  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747924600  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747924740  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747924952  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747924967  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747925038  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747925361  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747925407  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7747925446  |      



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

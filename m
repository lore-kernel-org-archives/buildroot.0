Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B212CD98E1
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 03:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEC016F70C;
	Wed, 17 Jun 2026 03:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnCH0kdJW4B0; Wed, 17 Jun 2026 03:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E4F96F706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781666726;
	bh=iRTddmMZwCgMnov1dQXB8KkJJHi2m1/iV26WbWZFI2g=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LQ+3D+6W0McynqfANEl8jxsU52sKO5RUz9qQUuaWvRRTtXPImng19sH5Vj3Oq5sr0
	 9H88gwXaSiBc5zt7aY2bV7vmoVLuXUnH7rUFGAe8lfSEbbBtqNotiBakk1A3LrAfpJ
	 KpKwIfmaQDKwv1byohEm/ckByZXNfdn83is5lZvdFBavmGS4PLH2PuWUrYX5FHJFCO
	 9WUynqbmLKmAUMO4UgLtnJuvWFRm00lU440PD8iv0Twui1sG3/ULo3fWbN2X0/a7AU
	 5o3WVQugiAfOJPmvZ1iF718ms+ukuVEKY82uKRV7nk+xlp9aNpG96EMilrilnkw+CL
	 kWB5eDHzjr6mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E4F96F706;
	Wed, 17 Jun 2026 03:25:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CF2533C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 03:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EE3A401FD
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 03:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64qQ_-GCsklS for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 03:25:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C77D8400AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C77D8400AA
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C77D8400AA
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 03:25:22 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490cdae130cso26023365e9.0
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 20:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781666721; x=1782271521;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEVhuMoHi1+H7Bv2DUQybDNDftYo9DVbv+OR1VN9yKU=;
 b=fvQb2nq0R/vxkU1cSgpRx53Exsyj1BNurS1B6y/jSeBByg1xqATjkuhP5/uz2SEml1
 sxQKj0NmEIpf6k6uTZi4lm5lr5tl34+S8K7t3DizRM1A7s+XDrc/XJVP/aCBaew/XNuy
 18lYgbJoW3l3VVg7xyWyMjSPZ25P+o47DglBmfAnqdhVrJ6nccDgCROlCkyFVvYms+0s
 /lJ9PYYWO4uyOmnL38oenTgBMccXx7rpomSg7E90vPZDIsfQNRK/F9vXVQPUe0s2itvR
 KOQRZ8nLj6VyZW38aRpMYHaawkA9g5Zo0HgGy85ttqkB037DDaima8iXSqbAkl2yVU8l
 Gebw==
X-Gm-Message-State: AOJu0YzTYApI149fA9O6cecvERXB8Gq7H+z1ldNUBYenFw6q5SS2NDhn
 lo14awVDr70yD2tzm5MvHlSgy7sz6BceBTGzn6/IVPNanCvTW40UcAFr1FROEDzo
X-Gm-Gg: Acq92OG0ZB35GtLAv0ErBgIqeSH3aG68B9N+Lbn/5fd1k1odaBpzOfD9RHzQjxn9qug
 GVuLaLtDzLBN68i36ypHFWTcSlXBchvDNE4hcHtA2QP9ifcmOwRtl3Nyp3aZaX71s/l9HGah+Pk
 U66STxv24jdptKg+VSwtiTfDYX/VXgax2n1kUHSN6+38C+Tf7J/yi+4mS4E+9td/U0NrQJDys8Y
 X7TRKmim+WdyZtG/WK8Tx8MUCb5E7IUPxWkOCJL9ukAeabyNp1Uj8bE96YNMbTGkhhGIvKQzAee
 MjOQJCLzbzhI9Q70nf5dy8xTL4FwvIG/OkmW5a+xOqh7A7pWxumhLuBDKQBNanpC7F/dLGea1GB
 tlY1Zy7DzLE+8yyy98V3Kw9Tf2FsLkei0yI4pHlDTycAGZAPm+uZCyXwZfAIrOYvCy4gJt9vkLF
 kUFiF0A+On9Xu6xj4=
X-Received: by 2002:a05:600c:c0c8:b0:490:ba0a:1178 with SMTP id
 5b1f17b1804b1-492333ee1dcmr26271485e9.28.1781666720371; 
 Tue, 16 Jun 2026 20:25:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm50837207f8f.1.2026.06.16.20.25.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 20:25:19 -0700 (PDT)
Message-ID: <6a32139f.924d9f1c.178c71.8f32@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 17 Jun 2026 03:25:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781666721; x=1782271521; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jEVhuMoHi1+H7Bv2DUQybDNDftYo9DVbv+OR1VN9yKU=;
 b=bdGEmK7CkM6fjEZgfdVXAL2DC01HqaDDLoGPcv5I+RIJF4uvzRHQjx/M8ckbPlgNS3
 g39E+OYDCUMXpzX7udoPaO2rL1W7JoF1Xx8vMSQe2ZtrAW4rVV9YMXzLXACGRvLuxMii
 RU56jAxExT+awf7Ts58I/BO/nsGOWns/joDco77SCe8S7RnOn4WeZ+e1OKh4hFFuqkJl
 Dw4Df67t45fZroDxnK682Fg0BNk98QSxmvYbJt8ITe486XIa7ImC+YjeYDE+yESmoU9z
 3N5vwVJmfoVTUHDmt3fGjAGJLGr1Hn13T98C8Q6haqJC8r6prFH/jPMiivLHlF09UoPP
 C8MA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=bdGEmK7C
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-16
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

Autobuild statistics for 2026-06-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 26  |  0  | 34  |
  2026.02.x  |  8  |  9  |  0  | 17  |
  2026.05.x  |  2  |  7  |  0  |  9  |
    master   | 36  | 68  |  0  | 104 |

Classification of failures by reason for master
-----------------------------------------------

                  ffmpeg-6.1.5 | 3 
              host-guile-3.0.9 | 3 
      libabseil-cpp-20260107.1 | 3 
                    olsr-0.9.8 | 3 
                       unknown | 3 
amazon-ecr-credential-helpe... | 2 
                     apr-1.7.6 | 2 
       host-gcc-initial-15.2.0 | 2 
              host-pahole-1.28 | 2 
                  iozone-3.508 | 2 
                net-tools-2.10 | 2 
   openvmtools-11.3.5-18557794 | 2 
                    basu-0.2.1 | 1 
                  bind-9.18.49 | 1 
                   bird-2.15.1 | 1 
                  bitcoin-31.0 | 1 
             dahdi-linux-3.3.0 | 1 
                   dbus-1.16.2 | 1 
                easydbus-0.1.0 | 1 
        edk2-edk2-stable202602 | 1 
firmware-utils-c42a3bc53da8... | 1 
            gdk-pixbuf-2.42.12 | 1 
                 glibmm-2.76.0 | 1 
                 gnupg2-2.5.20 | 1 
  gobject-introspection-1.84.0 | 1 
                   gvfs-1.57.2 | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.45.1 | 1 
            host-go-src-1.26.3 | 1 
       host-nodejs-src-22.22.0 | 1 
                iproute2-7.0.0 | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
libfutils-c326ce0cc2a735438... | 1 
                 libpjsip-2.17 | 1 
libuci-f3fc0b76040685829191... | 1 
                     linux-7.1 | 1 
        ltp-testsuite-20260529 | 1 
                    musl-1.2.6 | 1 
                openssh-10.3p1 | 1 
                 rtl_433-25.02 | 1 
              skalibs-2.14.3.0 | 1 
                    strace-7.0 | 1 
             superiotool-24.05 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2026.04 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
wilink-bt-firmware-43fca73c... | 1 
                     yq-4.49.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/b9fc4c366483deb01eb55614c0fa62d44057359d | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/ca2e724348f6adc6aeb9b1b5ff190262732228b3 | ORPH
  riscv64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/3feac69571c5456bce1de8fad09a7a94dd1bfe09 |     
    i586     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/d7d2703e42034d9c11de89b2b3b6cf401f677aa3 |     
 aarch64_be  |           basu-0.2.1           | NOK | https://autobuild.buildroot.org/results/f84ee251cb93f892625f3133d23397140339f07c |     
  riscv64    |          bind-9.18.49          | NOK | https://autobuild.buildroot.org/results/e33f91600e1c126fc4d20d602defac1dd9dd7bb0 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6431197a61005222f2247ac36a165fa4debe7373 |     
    i686     |          bitcoin-31.0          | NOK | https://autobuild.buildroot.org/results/47ff2940cf64f7d2a340768cb7e62ee9c97c96eb |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6fdfaade942c1ba9d7f8c804c8b760756ab304a8 | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/5250b207af89a83ff6255fd74fbea4edaee4b28f | ORPH
   x86_64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/937fc914413c4e35b9e6463802c3feafbd0008db |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/c10b6046d98e46dd3bc67042ac8cce629c1044d5 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/2ba66321dd184611bf47dc047d741fd529b44742 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/5161bb614f17e4b6b7f6ee069ee8126543bfbede |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/1b0625ad9230a6c43d416c342bbc06415c09edfa |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/2e8c377038be7e65adfd9e092ca7be1a79761e78 |     
  riscv32    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/117e99571d2e943d18fae73231942b6f910bdaf1 | ORPH
    or1k     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/4fbf6c07e8a0aeab700e0fc21c14d190fa4401dc |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/27da59a6a7180de09b15b9997d4425a5b8a1fa29 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7625ff1147dc96989f6ff553c615e59889cd3c9e | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/965608e61a600ac904ff23d3e652101b51ef6648 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/049eac863171a2d301506b6db20d24be6f53ba68 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/2c5f3a98b0038eeb09bdae0b19e209f19824242d |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/da5f735c10d6257f3e8d3fb263f1c191b612a534 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/a74cad427c73544391cd7329dec69f79bf504a44 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/5e525399eead89f510fd97f1e909ae39c2c017c5 |     
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/4a28bcc08d13383ff40ed1eb6a322007848d1313 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/59eeccef4c3391c51071abf5a9af840bc2f4eee1 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/95d018c30613a8ac73a2ad6edf520155b67fdead |     
   x86_64    |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/5112a94100a5372e6643e1498017befe7e4fa902 |     
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/7537953f1536d7bb1416a7014b8844f5aa579b8f |     
   x86_64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/38c8235bb21f713c0582368615a131076eff2339 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/60b21e312639b29baf780dbf8166893892283455 |     
    i586     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/d6e2ebc781bb6b66ccb26aedb7f1b4b40f5354b4 |     
    i686     |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/1b0f82e5285d5bcf082b5a16663e4149cd9aeaf7 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/02b6bb6887643f5d8904de3ac43a9475e6d08768 | ORPH
    i686     |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/bd4aba82b3636e731fc44f38aa90041ff3328a5d |     
   x86_64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/844fdc60902784604004237b4fec704345b123de |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/3ae4e97312f929872db759d640c56c16e7850eaa |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/a52eb81f166fc790344f40a14c1e972ffbba32c7 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/2e6b118102558e0cc9fc999fc9d8c14db4bfe318 |     
    i686     |         libpjsip-2.17          | NOK | https://autobuild.buildroot.org/results/207af492ea48dafcc9dbf6b98a454ca97fb2c702 |     
    i686     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/0206738b3273ec5d6936b8af75abdf01d3244d80 |     
  powerpc    |           linux-7.1            | NOK | https://autobuild.buildroot.org/results/5ce143ac2e130d0ee53e13d48d5f8146f55827af | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/6e635627905d1e9a319d17373081e5ba49c01308 |     
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/07b0ca1e149cdb9f79df41686e8df31cd61f5b86 |     
    i686     |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/733c3d5fb48af1d6d570ff297b25c28875a29611 | ORPH
    i686     |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/21b8a43e5f0bc02af01d2f55f6557404001f93fe | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/fd88e58c2fc442482d259deb699dd0cc55ffeb2c | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f4559c14d72231ac2c63ebf84c8eda930213b81a | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/229176f8d62eb3c8f1b562e5e959f57ece5b2707 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/845f269dec07bbba9c22a0ecf83ec58e38b69103 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/68f632fbb836ef342b43364d21e108a55e535830 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/1ce8a277b23d4b40a6a60bd303de924e33d6ea0f |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/291c9ad8d0a87b040767d9b68c4ce8507da7aae6 |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/91e5d69cd99baa345c843da481ef90e2073a1033 |     
   x86_64    |           strace-7.0           | NOK | https://autobuild.buildroot.org/results/e4014141ca8b51489ad2241f2103157aae218822 |     
    i586     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/2eedc415f0c89536dedfe75e18731a5ca169aab8 |     
  riscv64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/124ac7cacae6263fccea091e1947836ccb1cb598 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fcf69f0f2c5f60eb3255455343b5a111c8057d7d |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/0d71d50b86048805a1c0135ff21a1ac0fe3102c9 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e74648aca04735bfb72d41fca3eebd9ef5b9c57a | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6dcd0c6486eb3fdc3292d1a3808614ba2a0ed43c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3ae0e1bf2aba897ae8327ebd40fe414951361c74 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/da094bbe8396e7d7b9fcfb91122ac7167640d6b9 |     
  aarch64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/9dd7ce29241c6be6f8ad5590e54eae2ef3dec19c | ORPH
    i686     | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/f8b7e4708a07452d6c9ddb2d12686f8c8b463785 | ORPH
    i686     |           yq-4.49.2            | NOK | https://autobuild.buildroot.org/results/37c2447e334212113cd035ba39326854a11f65eb |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
libfutils-c326ce0cc2a735438... | 1 
               linux-pam-1.7.2 | 1 
            nodejs-src-22.22.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               tcf-agent-1.8.0 | 1 
               trousers-0.3.15 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8e4870f0c3d7a069f67b7fcd2ec276f0279dd3bb | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/6be0d434128df8c86c12aab8729195c9d1b56e18 |     
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a72e6590016ed64252f379960cb256ca9fdf27b4 | ORPH
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/cc3860c05329b88209da2ebcc5800e2ea89b73a4 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/a61698f0a5758ead51bab39806004700edeccd3f | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/97d20376ae6e68fae91797871aefafcc24ff76d8 |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/894abddfb52f56f6d25e2f5791acca595391f2b0 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

             alsa-lib-1.2.15.3 | 1 
                haveged-1.9.21 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
          linux-5.10.246-cip66 | 1 
                memtest86-7.20 | 1 
                   perl-5.42.2 | 1 
               tcf-agent-1.8.0 | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.15.3        | NOK | https://autobuild.buildroot.org/results/d8f87f2ef99e87fbe0b7632359e22abcc0cb4f94 |     
  aarch64    |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/9662d7d36adba571e926613fa3110ae0f98d2df6 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/540be4cef678c1ae8569e2e7401bb0cbe818a3ef |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c9f79b368dd9f60c5cc1905ecc9dc098bf1d8a63 |     
    i686     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/1cd279f2aa5198b4ee7f5accc313db16db6324dd | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/0b641f92483c3780e76034dde2159807e0c25c6e |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/62b5dccd6bd15c12e993ceaf9913961e17b6a67d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2e6bb4a6f7ff69ad6513067a3f89757f8121f206 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/ad9813d4a93bedf94c0d793c3041f6a1f0fce136 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   perl-5.40.4 | 4 
                       unknown | 3 
  gobject-introspection-1.82.0 | 2 
                memtest86-7.20 | 2 
                   bird-2.15.1 | 1 
          cloudflared-2025.1.0 | 1 
              containerd-2.0.7 | 1 
                   dante-1.4.4 | 1 
             docker-cli-27.5.1 | 1 
      docker-cli-buildx-0.16.1 | 1 
                haproxy-2.6.27 | 1 
        host-python-lxml-5.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
rtl8821au-8ea0ed9da764448c7... | 1 
                     shim-16.0 | 1 
          sphinxbase-5prealpha | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/73abd2da039a50859275d9b2b3811b9b6368ee52 |     
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/3dbc9c07be530808391d7e581b165d6c5f747011 |     
   s390x     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/fe0f9908c1c309ef564dd716a81a9899d48a640a |     
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3f0f96e815e0aa012304578fef8a64dddcec7ff2 | ORPH
    i686     |       docker-cli-27.5.1        | NOK | https://autobuild.buildroot.org/results/9c9884f5a920f5d579bbe78e0e1e07ef337e0500 |     
    i686     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/db9698d352a50d00c49d8981661cfd2afaeb185c | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9096f4c87ca0d9f9149ec19af85db82eeae9de22 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5cc2ee82a71c7ec6e83cda268103c273f18d240a | ORPH
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/a442efcf7b6833571e5152d8d93c58ef40167421 |     
  powerpc    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/330d4855f193af035a54a2c553869ec3a01ba534 |     
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/2666e2a96322deac145d5ca20a569614fb7b55a7 |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/447547510ee3b9bb7d9d5b9438af355b904e7264 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/1c1e293535f85aed52315f830b8399186ab57c08 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/38b1075c43034881c1b43a124fb0c2825daae54a |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/07be355d3c75e9d1da15e4dc39facfb4339e4081 |     
powerpc64le  |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/c7ea2fee54d73fe6f09ebefcb2b7ceb49beef748 |     
    i686     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/83f4d4a2fffb99363a218d15460064b719aa9403 |     
    i586     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/b1557887fae830c725aeece043ea6c7b1498b262 |     
    i686     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/c96565b680ed1ec3840f5cf7397077cb981380d5 |     
   arceb     | rtl8821au-8ea0ed9da764448c7... | NOK | https://autobuild.buildroot.org/results/371ab96f169badca4df28e1e47db0004219c3572 |     
    i586     |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/9fe14f234e9e8887376762bbf196c69e18995e4e |     
   x86_64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/55397fcae41a050f94e4eb1795a0f73636a3c671 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/29ce57ebb918714d8d93b8a8745a9f89b91d0ef5 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/4e6d895c619c45ffa6018d17f90e020892f2270c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/954199c32fb0da85a17aba1047af8a52af9cbcc8 |     
    i686     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/f55726e56e5ce6dfa7c02e87ffe09636d3b475cc | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

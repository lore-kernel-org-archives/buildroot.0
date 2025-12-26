Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76293E82CDE
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 06:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5E0840534;
	Fri, 26 Dec 2025 06:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sU4_7Hg4CC2k; Fri, 26 Dec 2025 06:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDC96406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766729267;
	bh=go11Kbec6ofsaBexyD8v+xv+/gD82DxCSUQIZ7OH5m0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=at2BtpBPm86AMV+y+LbuGl1kWDk1vvf4ns9+cVLhYOvrinGYT/nCs0O1rpwfmwq6T
	 DJuUZxuUREw9p138RYXqkSnqt2fKvdJ1mXf+MSBS832X9sLCDH3nedDzcg8S0+UK9H
	 S14xIbIPlLrlUqbwz5ufPgoeYsXnOoRS5jHGgqhGEP3iLjfPNuhZTTuict2LV6+k44
	 PcnMVK8V48lvlWBVswOZE2w7q8Fb4FxrpnyU06xSWWhHDra0FWD/DyT85il4hCeXxT
	 QFAtP4PqVCTuZQxVePoq6REmNWFF9UHaFVonZ+4586brmyfpKQMph9fmPBtq/3QO1Q
	 wIPV4wAPW6rDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC96406FC;
	Fri, 26 Dec 2025 06:07:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EB17119
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 06:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B69C4049D
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 06:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjvcRCdw-Ckz for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 06:07:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB51940495
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB51940495
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB51940495
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 06:07:43 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b76b5afdf04so1032170066b.1
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 22:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766729261; x=1767334061;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTNXuav2Xn44HwDQokHBf4CZnz0PIdhsjnKQulCNrwQ=;
 b=gvMo4F4l6hZ86Q6WXHS0vqkVGTYQjD0glC6l06XScuO1cJnI1OW114kt3ezIJSJ8iC
 jNAtagAjdy5t6XaRFiYmXzL/o3WSrEtvfAIGfl3rPtR74EXJVxNetR8zjnKCB99J6GGt
 BWIAab5Lq3zvcyDope8R792sZtH5aHaZ3FYm6GoMeMRNOYY5TNLMD+fR0qZ+gieXnI8m
 YVY+uOr/blU12jYYV2a3t+7ectsik0BFd2VFRlXj5H8tVdb8ewO1G8EASs3OT8LF4ZiK
 JrSTnqIIFTjPNgsbY8Su/VLLuAYUOXXYKW/Ija9PlFNdtDdiX1hpbPSlQ0yn14ttcDNS
 suWQ==
X-Gm-Message-State: AOJu0YwHMFpX7s4H4yolzWaU5eLhoK+GLkMyUKOs/cVQPVlLyAJy2RLq
 3isyR97cHpHry6WXYO93RoIKD4JGMFzxaVsCzIQRLslJ4Mtg2zsJFBxdboDrWg==
X-Gm-Gg: AY/fxX5i1QNjJoajvBWD//WZtMxy/lyp2FPi8v/+wp9wZFtAe9R/O88QfM0/eR0d3Fq
 bmY6VTs3rqxAeRdpq/z+j2nq8s338dnLmVZWflqJJxXwMDlvT11uaUqv3iIYddOcKojOsqgqXXN
 PgEayiLDUTNhuTbVcMxDa1U0KdP438Od5sAw1ngmwUYvn9RS7L38hWBpQGKCwRPI+XLriNY6jf7
 N6kWGL2X5BfwBy5EGPZIKrYo6XMcV/2sz3+D04fWrh4W5XYBYKDck+KNNJdtc2qYhF/PpVd6U8c
 4rxioo+z+2C0wr25Vo2yJmojL98pN3jGm/RNrANNFyVcwKiK/X8yYvbNVLctIhvIWvrWGj6x9hU
 v3ko280gFLzrtXYRwLdSDlIdsD6LGyTZ47UJqdl+WKgQ4rEpK2EWaiYZQPI6Sw5UGEW99+Ref/s
 aC3VMgVMjAbLFaaqRYkg==
X-Google-Smtp-Source: AGHT+IF0LZAb/1rWZJWlyDHa4QRi/bAhFxie5jB7VAziUOVfd5M/QgMq5alSwRMrM2/Edgv3McLB5A==
X-Received: by 2002:a05:600c:3588:b0:477:fcb:2267 with SMTP id
 5b1f17b1804b1-47d1956eb88mr278815165e9.8.1766722649404; 
 Thu, 25 Dec 2025 20:17:29 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1afbfsm43985124f8f.9.2025.12.25.20.17.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 20:17:29 -0800 (PST)
Message-ID: <694e0c59.df0a0220.154d03.4f02@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 26 Dec 2025 04:17:29 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766729261; x=1767334061; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eTNXuav2Xn44HwDQokHBf4CZnz0PIdhsjnKQulCNrwQ=;
 b=QdaJtLndN7pbYAC7w2u8xN7WQFuaDfJlilck7lhJ+Xb5yBY4I2oQrD20oYjpp8lbt/
 W4golV677e3BGZA57lIQ275zPsCbVZ8iaOLqjpECEMAAalHzwK9Ih91kr5orFhjHU+Pe
 wIw+bu1HYqC0HO8etdQi9zKvBkd5FJL7KBWSrAYnWD4wMqepWNqri9ZJFnpzjTZMvGwU
 jeEcRV4MZCEtcB95rp+QBQJzzMetnBUKzVEoSvarFXfld7Sx0vFvGq5DWwUAvdK9J23o
 ylkD7KeTZrsK67SgPQqnbHKbYxVvWnkYouESfASRPsc1ySJSpw4gdLpVbioy8FDyguqb
 ZnHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QdaJtLnd
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-25
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

Autobuild statistics for 2025-12-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 24  | 45  |  0  | 69  |
  2025.11.x  |  5  | 17  |  0  | 22  |
    master   | 50  | 180 |  0  | 230 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.9 | 23
                libselinux-3.9 | 21
                       unknown | 12
                       cfm-0.3 | 9 
                  libcgi-1.3.0 | 7 
libcorrect-f5a28c74fba7a997... | 6 
                 libuwsc-3.3.5 | 4 
                    mpir-3.0.0 | 4 
               host-gawk-5.3.2 | 3 
                libcuefile-475 | 3 
                  libsvg-0.1.4 | 3 
                netdata-1.37.1 | 3 
odhcp6c-53f07e90b7f1da69771... | 3 
azmq-v1.0.3-54-g819b24035cf... | 2 
             berkeleydb-5.3.28 | 2 
                   cvs-1.12.13 | 2 
              e2fsprogs-1.47.3 | 2 
  gobject-introspection-1.84.0 | 2 
                  iozone-3.508 | 2 
     libphidget-2.1.9.20190409 | 2 
          linux-5.10.162-cip24 | 2 
               linux-pam-1.6.1 | 2 
                tpm2-tss-4.1.3 | 2 
uhttpd-15346de8d3ba42200249... | 2 
ustream-ssl-68d09243b6fd447... | 2 
               valgrind-3.26.0 | 2 
alure-14beed2a86d5a36030e90... | 1 
                apr-util-1.6.3 | 1 
               asterisk-22.5.2 | 1 
                   atop-2.12.1 | 1 
                  bitcoin-30.0 | 1 
             bmap-writer-1.0.2 | 1 
                    brltty-6.8 | 1 
                  brotli-1.2.0 | 1 
                   ccrypt-1.11 | 1 
                     crun-1.24 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                 dc3dd-7.2.641 | 1 
                enscript-1.6.6 | 1 
               freeipmi-1.6.16 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                 fwupd-efi-1.7 | 1 
gli-779b99ac6656e4d30c3b24e... | 1 
               graphene-1.10.8 | 1 
                   guile-3.0.9 | 1 
                     gzip-1.14 | 1 
host-am335x-pru-package-5f3... | 1 
              host-bison-3.8.2 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.2.0 | 1 
       host-nodejs-src-22.15.1 | 1 
 host-softether-4.30-9700-beta | 1 
                 jasper-2.0.33 | 1 
                 lcdproc-0.5.9 | 1 
                 libbsd-0.12.2 | 1 
                   libcap-2.77 | 1 
libdill-32d0e8b733416208e04... | 1 
              libopenssl-3.6.0 | 1 
             libstrophe-0.13.1 | 1 
           libzenoh-pico-1.2.1 | 1 
                  linux-6.18.2 | 1 
linux-serial-test-bf865c37c... | 1 
             matchbox-lib-1.12 | 1 
               openblas-0.3.30 | 1 
                openswan-3.0.0 | 1 
                parprouted-0.7 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.42.0 | 1 
           python-numpy-1.25.0 | 1 
                     rauc-1.15 | 1 
                    rtty-8.1.2 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
          sane-airscan-0.99.33 | 1 
      softether-4.30-9700-beta | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               tinyxml-2.6.2_2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/49e978aedc25933b70ebbebc00c825dd8f5dd633 |     
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/8e08e83004bd9565264c68f6fbbafcfc84f58a42 |     
   armeb     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/3a6c4cb3c44396ddeb40b636de71e60236a2d734 |     
    or1k     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/d35320bfef5d6ac016a46c4981ca448b5c6b6333 |     
  riscv32    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/cb6b42060e61653ca4fbd00bf4d81f4a54300899 |     
powerpc64le  | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/cecf9a1fb53f430913ead586f7a46b17aa71c939 |     
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/605f0d6a3cbc833ddc4a44e937461202f748ecf2 | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/1b4b3ad2ca35b38b53ff78d0d56382e61c5bfe15 | ORPH
    m68k     |          bitcoin-30.0          | NOK | https://autobuild.buildroot.org/results/1cd89b21ce205e452511dc0743ef5fe25a34d0fd |     
loongarch64  |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/c8dc6fc0183a6372dd3b748f85fdb3f17440ecda |     
    mips     |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/d723ae979a37221e5f34f5516c84e4ee01b8b0f6 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/0a5d3a8973bed04b3b8a0d2dc33902f85e02bc3c |     
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/f501f598d6d94afaa36a2e1b9bca4978b81f215e | ORPH
   s390x     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/0acb1eee5fb87ae71e22e3f2ba4dc9df38a3eabb |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/efab418b26106ebdfec4aef593c891f2302d2f57 |     
 aarch64_be  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/aa047fdc14aa105bca79ccd03872c0c6ff5c8a0f |     
  aarch64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b41c3b1beb6bc7532df777ac2f86193f748aaf33 |     
 powerpc64   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/fa03cc6e4529310b7e448ab20cc03d5ecba41f48 |     
    arm      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8618cacfb329d8340af34d39777e10bdc88a4f04 |     
  riscv64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/3893fea8c8a8f6a7c16ee9fa54455e7e14f2b1a2 |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/e440b6fe03d6f25d9c98170a9e650010d57f7e2d |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/0d041aba88e35c621d88a04b331d9ae2eea27ab6 |     
    arc      |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/3c3a5892626217221f62de70b5b202e9c44992ff |     
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3a0c4a4b0685c1d632aa1d9184389c6ab80b6569 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c599919402e9527d012ba436f19bed01f49ce1d8 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7355e485085d63163abc6cc606448aeba04255d4 | ORPH
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/409e50f3088bba14fc352a8a661b270e261fc3d4 | ORPH
    mips     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/d62d4a73b8fdceec3c20163662b022a66ead6ea8 | ORPH
    i686     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/63a2aa985a8a46e8c090131336927487b57fa699 | ORPH
    arm      |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/d9b8a8ff738072367bf0f7bd68d5e56aa23a4edc | ORPH
   armeb     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/c3661a1ed2e644c742c4a3b79ee49554bc478764 | ORPH
 microblaze  |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/338a03fa204d55bba79b15dbb88484b44a41a1f8 |     
   x86_64    | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/8f85cf9ecc5efbc56e50eafeb1454e931b1f9080 |     
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/7f9afe81f27f2e693cdec04d16ad4524304aa93d |     
   mips64    | gli-779b99ac6656e4d30c3b24e... | NOK | https://autobuild.buildroot.org/results/4c188088e39595b16bc70e857f61a99b6b56455e | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/371196e438e7cf294e99aebae68ef82f29d088d7 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7006ff727f54039848c3f0010a65ee4684de29e7 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/8bf9695207c1942415abb3653738ce3982437e0e |     
powerpc64le  |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/5cbcc53119f55e207fbb645a10b7919cf8f97cb5 |     
    i586     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/1d5e4743e2fbf11a4cb59307c52da420e43b14f4 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/dc2433bd24e000657c60b757a10e367a1ebf2cc4 |     
  aarch64    |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/fd96370d22b79c69f7704c56afae190c5437206c | ORPH
   armeb     |        host-gawk-5.3.2         | NOK | https://autobuild.buildroot.org/results/ec15c1273c6d6304772b51d33de30faa38c72be2 | ORPH
   sh4eb     |        host-gawk-5.3.2         | NOK | https://autobuild.buildroot.org/results/c205272c1cdfbcbdd3ce3eb7065503ebc0186902 | ORPH
    or1k     |        host-gawk-5.3.2         | NOK | https://autobuild.buildroot.org/results/fe38ce38381529e1463901f4dc5e413f908fb823 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/753a15eecbfbf879e866c424c064ace670a012d4 | ORPH
  riscv64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/cc9b8aeffcafc1631d7da2384008bbda41b93513 | ORPH
    arm      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/ed95d28ad032c6c74d100e8871ffee7d8b31e217 |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/76d62c500e67e8b740e7f72fb778d927de49ca97 |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/66e6aba80e6bb19da335bb2d809c50596bd9c0c3 |     
  aarch64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/1d3831d7e336e5ee6d14f94276048d831930ff1c |     
  powerpc    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/13c9f0df81859d1e300527b56a365e683f95a1b9 |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/e182402b8833ff11cd4813415d086f6c72c10623 |     
   sh4eb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/62879f1e57dddb660fc2de43cdb8a8dc10416d97 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7df3377d375e597534251897d9a0c933d41c53ea |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/226d939497ba601ca836e481785335350f6e9bbd |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/11cf3cd3951fe369baa0be25866a7b26856babf2 |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/75801174daec50d0bb405106455f74f697b7fa52 |     
    i686     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/14977de58e1510f387e53bb49cfb4efad1ebc0fa |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/e4ac49457a74ea04c960efd88dd0dce7db06a2d8 |     
  riscv64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/f2fb507cf560d7f278bb2f23cbe290df2e85f970 |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/5d44a2dd18dfd8cb0554c235f2db6b2109f81893 |     
   sparc     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/e7b4e4ca6ff69f6d173fba36c571aa56e55013c3 |     
 powerpc64   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/6376a9bbcc2ede67ce30cf48c320790430933aeb |     
 aarch64_be  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/41c95c63b796d48029077f3a715138f02b8f5798 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/4198adee427b13992d90b44b643221b37d19f128 |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/cb6a6ed49a2ceb29ee5a66b011c63442f04610d3 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/57651339b01d19a1136c1d94f7c9ba702fd09c7e |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/ea9957569fa12bd2454610b53cd3dd7e179194c5 |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/48a5c06cff4b4ffba89025b9a0afad14c4a1fb3c |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/890a60f3cdd813c8d92c0c2f139a825926a58718 |     
powerpc64le  |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/48647e8b956e126cee886102dd131d8e2765cc3f |     
 powerpc64   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/d5dd239990321ed152ac6d8534844b5f13a9f09d | ORPH
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/32718efd3385a37287e76b1ee6d06dfe849dd0f1 |     
  powerpc    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/b22d4ccb4242dd77e4d5e11cbe72018670c2b0af |     
   sparc     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/e03e44965cd180dd1bec54a42fec695dda456dd9 |     
   x86_64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/712f9a05a649e50857dea8def493eb7a6d9f9852 | ORPH
    or1k     |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/1554ff53346100ac51eec7b94846fe44df57db7e | ORPH
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/a7f9fec311d3d66bf586125a1f3a96de0dbeba28 |     
    arc      |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/50d23ef6db09a1b66a3941fed17598dcd26917f9 | ORPH
   sparc     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/f7e305aaa7bb1168545dd8d2c027c7a98e425a63 | ORPH
   mipsel    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/00dbb6f40cd8fbfee52aea336385e96104036168 | ORPH
    arc      |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/8e0a0b1bef4e35634fe6a850a41bb1f2bfbd5896 | ORPH
 aarch64_be  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/3bfb1c2fcee864bc0481d80d6ce8799cc048dee3 | ORPH
    or1k     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/0c959ccd7ca28f6f3be89c6f8379987d51e53b25 | ORPH
  sparc64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/8c0eefed6c7ce4ef09b940c37f08c5053b444c25 | ORPH
  sparc64    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/ac470eb67597ae3ea13ab180d5977b1d65fab873 |     
    or1k     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/9c5fe10dd696ddf5cfbea97b0591ec941abd95f2 |     
    mips     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/d4087d2003ed9447ddf459e1c230d34f5c932285 |     
    m68k     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/17502d678af15c3f1738b143924a528fdc2216f1 |     
 microblaze  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/41b026b62cc21a68be1d01bf74482bacc1281904 |     
loongarch64  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/604fbb14cecdc646198e4d906b9d423605eda910 |     
   s390x     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/a8a1672b69a9fa4911a1e463de41f53589c98e69 | ORPH
  riscv64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/80628bd6b9e436817139171821d9c2b64fc90811 | ORPH
 aarch64_be  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/c26633c76e3eceb498354acd18b481d1006bafaf | ORPH
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/d015c3a44bc7eb62e7c4613eae7d1718e2f68d87 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/51f124daf1f8ebb2e4a2c6279b4ee1ad41bf3a4d | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/27843389e2649b17a51295079e76a411497da110 |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c9b91c634030329865bb36ec0222fd83a270e203 |     
    mips     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/4d1a4dc4d34a24ac2df9fd85130a903dc8d55621 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/dbd3253b24c80060f871c8f4dea6afc46f0c564c |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2fc075e185981ef584c1cdc16791499c70c48989 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1b87c659f1901b0bf33fa4a2ff0ed40b13114bba |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/fd3488f6ac34b94a82d29f5ff076965774efdcc8 |     
    sh4      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b63c0aff89d55c0688740c2b770d48b5987babea |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e5aed112728236ace332d3985c596f333f8423e7 |     
    mips     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/301a708c4c76eff5e1fa11b064f4dc2643e7f93a |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0f419078f64f4d7a839e5c5e986cb846c1c1bb2e |     
   sh4aeb    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/51fa49e384be4d015dab70a13d0796973b629194 |     
   sh4aeb    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/28ff452645f0602d0cf8bf402751991a4d654112 |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f0a4d3bb58353ab43f026231ade1bffd6286ae86 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e2445daad8f5519613ceb6596df3f3ee223faf34 |     
    sh4a     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2d130637e69cc4d17d11092ff1dfce0f1ffefcd9 |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/189cca8bbe147f74ee8e064c34cf34e2d120f315 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/56bdc88fff009ada509ab61d570905c855581887 |     
   mipsel    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1b97310f782f2052e3f46e2d2014d520cae4eea2 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e958b1b91dc8ef1e9374c9190201d4b7f30aaa4a |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/60c3bf935bf80f97cc52329bac5afbe0df421f07 |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/d0054b5ce67e9ab4e27376da3d25f6c3d9f3234e |     
   mipsel    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2822acaacdc8ed6bb0b5356226d195d3f3059d7e |     
 powerpc64   |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/5c3a29cbb253f676748223c645ed19b60963a51b |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/9cf22cc51d8fc4ad47f1ebef7c6afef1ec0315d6 |     
   xtensa    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/18fad3aa475f049a7a5917b09df5bce7cc2a7b9a |     
  riscv64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/813bb6d1cbff3720bdf0258bc202998d1a40c18f |     
   mips64    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/6f50c1487a4c187ecad952c48e68e23f679c2673 |     
  sparc64    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/76ff1e6e6001b4cf03f30cde353749329f9c6dbb |     
  mips64el   |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/e4960a2775bf5f27ee5259c86525751a2063d061 |     
   armeb     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/a0d8f32bc8915dafb2603db196e801d52566684c |     
    i686     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/02be7df860601c2be46d08f120ce2af677940f00 |     
  aarch64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8555f25dc262c5ae0e589320014233de1d277319 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d71427c7797eeb27cd8c9d7cabf4ac632d255ed0 | ORPH
    i686     |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/dd677a6dadeeada5557d1786d274432a902a0b1f | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/23e218c63a3a0de0486d47cdd99e0fa7947f4d35 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b68865e5dbf785863bed6a677019eed24ce57402 | ORPH
    arm      | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/3385259b4e6cb0583c47987bc49f0d192958b87a |     
    m68k     |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/e909eb640b73fe5db2d18374c821dd1de64c70b3 | ORPH
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/36e3399684d3bfdbe8bd01d3f2113abd8a1e8cc1 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d22d94e6516684c532992ac1a53ef190eae4b720 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a04ea41b30916d6a74fa333e28ab622caf3f7f8a |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/80a54a5bcba09ef69fd92c8da3b189c2c3ace14e |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/fcd11ce453999e8981bc72903d8f61e8dd836be1 |     
loongarch64  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/d07889ea53cf3e9459d52e5855f9152b9b05937e |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/a872adc2bc06fd2344c2688ac1ce3b857bcd8813 |     
  powerpc    | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/2f312cac99d418c77d1b1be459532f2d583d8a32 |     
   mips64    | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/9f7e5d8624c6beb98833708bf29f783fdee4c340 |     
   sh4aeb    | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/3bfe045329aa2c9b510677dd84c706267eb57642 |     
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/814cd0e30d36bae7f4b9b3ae3fa01fce58e876de |     
   sh4eb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/f929d1d3d4f4295238c336a85657465194c9699c | ORPH
loongarch64  |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/7507067ee591e3962af7812c2030c54edf5c8275 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/e1e1a92806c6d10fa388986f8a58f7606177621c |     
    i686     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/902b21a26b8b82627c2d9f9826c49d03cbb86e0a |     
    i686     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/c44f56d6762d25f68169eb7c283c3a6c1b71cf82 |     
   armeb     |           rauc-1.15            | NOK | https://autobuild.buildroot.org/results/34d7f5984f0e1f0bae20c3f8bd49fce6e0b9416e |     
    mips     |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/645393a714b408172e4782e04cfd06f9165b64cf |     
   s390x     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/181440eff256b8f7c191325a485d4fffd661d65e |     
  powerpc    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/27be44caf7980526a3fd2f69e4a5fc720d43ee37 |     
   sh4aeb    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/396b8ea6f57526664d2356a3500adf6052bd22b4 |     
  aarch64    |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/1f0ec354266b9b6cfbfd9b15afb136d917ec57f6 | ORPH
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/48ce6bb874227572c19d89b2b16bf1fc4cbf51a9 |     
   sh4eb     |        tinyxml-2.6.2_2         | NOK | https://autobuild.buildroot.org/results/ed60f879bb8a11f5c07a9553523234c8d4c257c9 | ORPH
   x86_64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/fc38a1d8d93d31c3deed6acb314f575366c86f75 | ORPH
   mips64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/0b1782a965dfd57a3b7ca875bdbf3883c20a80ac | ORPH
   mipsel    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/6e13d7e509904e70db364ab7961f23ccc503e0e4 | ORPH
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/98117e03e83e7b169832fada5a74dee4508df1cc | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2f711f61520243d7ca6318c30ed5c66cf2a9d022 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/8e74b92d9d9a43c57fc3727283cfea9d729f63a0 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/aec8906e8b5c18da326bb9d670ba38140d6d5837 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/58f829465990970aace5e84654325258c819e802 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/82fe004e092342b47bb74e1481b2190622a9ef8e |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c316f26129b5d3bb051c1439d9ef05a7292c6c77 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/adbf40cbcb05fcc40b228b00140183a6d0ff5681 |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/29b2df9c53ac00001b2f25d31bf583dc6d7d73d5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/fe9afe57aafa9a3bdc3f3c2f6ab5cbfa6313df05 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/8f887ff5b0b2b7bd8dfca76b40bd5303f4a13f87 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/8106d74b705da3cf81bcc7346d0697aa082f60e6 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f1ee3492f505433f86398ec9dccee81d881cea41 |     
  mips64el   | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/cda452d7f804695bdc711cc353d6a050b6907678 | ORPH
  sparc64    | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/14cfbb39abf58d52a3fb34c82d2748fa963af4df | ORPH
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/265c949b8d8e1ff0698848761f53d2fda07d1eb5 | ORPH
    mips     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/d91d2f024f22461f20f05c58a0bb09720f33818c | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

     libphidget-2.1.9.20190409 | 2 
                    mpir-3.0.0 | 2 
                  broot-1.53.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                  dnsmasq-2.91 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
          linux-5.10.162-cip24 | 1 
                   llvm-21.1.6 | 1 
                netdata-1.37.1 | 1 
                openssh-10.2p1 | 1 
                   perl-5.40.3 | 1 
rtl8822cs-0ef9ddd619d2a386d... | 1 
          sphinxbase-5prealpha | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          broot-1.53.0          | NOK | https://autobuild.buildroot.org/results/e6e9ce15cfc63e04cedaa0d9f464ac5e3fda1dea |     
    m68k     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/a376d6cc51a762a8d4af3bb94dad2c0cc041c4b5 | ORPH
  sparc64    |          dnsmasq-2.91          | NOK | https://autobuild.buildroot.org/results/cab391d7d6b23739e2252ac3db1a76c17c6dab5a |     
   x86_64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/add4373487e626fc50d64aa394a5333cac9e0328 |     
  powerpc    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/8db4ebf3f31448d7f239db6a1fe57e874103d4d1 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9f8c9acce9a70eea200bcefda0e1da649ca54955 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/dba79189c00c8b2c715620b27ff9ec7964e16df1 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1818fd404139c371686912a9ed43208f8d4b888f | ORPH
    arm      |          llvm-21.1.6           | NOK | https://autobuild.buildroot.org/results/53891c3d449e26dc92b67b5222cadb9723376b6b |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/11ac12cf6dcdaaa39112c04c5a195dacc1947687 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4cee1acc4ae34f02b8858413965497f0d45f053b |     
    arm      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/7415b1ebf04f4f5e7d3478cfa05f8c12b59d79fb |     
    arm      |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/80583517f49960de8aeeda7e9b0d9d6071aeb57a | ORPH
  powerpc    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/7bfd8953245920ec109fd025189a84ea37f798c9 |     
 microblaze  | rtl8822cs-0ef9ddd619d2a386d... | NOK | https://autobuild.buildroot.org/results/822ff76b4f837f645dc54997eefa92fed11729d9 |     
   s390x     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/a7d652c4aafa87385e76977297ec421c79e1ae2e |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/3a1a3bfc39a773a41bf8a60858fbeec26f9edb11 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libxslt-1.1.45 | 16
           host-libxslt-1.1.45 | 13
                       unknown | 2 
                   botan-3.5.0 | 1 
                   cvs-1.12.13 | 1 
            gettext-gnu-0.22.4 | 1 
        host-gcc-initial-8.4.0 | 1 
                 host-gdb-15.2 | 1 
host-go-bootstrap-stage2-1.... | 1 
host-netsurf-buildsystem-75... | 1 
   libtorrent-rasterbar-1.2.19 | 1 
           oath-toolkit-2.6.12 | 1 
                 openssh-9.9p2 | 1 
                systemd-256.17 | 1 
               valgrind-3.24.0 | 1 
wilink-bt-firmware-43fca73c... | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/519962a4e6e6dd06bb4b93c2cec6f4fca80d11b0 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/193f9b2a2c28e925c68cc333856158cc54eb73a2 | ORPH
   mipsel    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/79ffb44a9004d6b509b5a73004b2390162a546a4 | ORPH
  powerpc    |     host-gcc-initial-8.4.0     | NOK | https://autobuild.buildroot.org/results/3efd9e2c3dabcbd2400cbc360e93990378c10254 |     
    or1k     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/145ea68a9b8bd8c971df64332221fc1730629298 | ORPH
  powerpc    | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/cb57d6844e376cc8d24b203311370244279ae72b |     
   armeb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/448f6202eed92987767e27dcc1a09cc2b6087ec6 |     
   arceb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/5e0e10e64321bb4412d40d6045a58e399103454c |     
   sh4eb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/51d4d975d88a915805dcdd08902270e459a5bc99 |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f1f3dc92e417bd2e04167c95ee62e1952685fcdd |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/aa145857d0d1eca56b2a07e0e6aa8d5b9a4a6c48 |     
   sparc     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/7a48af6671cd231e1931611c965716c7c758a8cf |     
    i686     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/b3d2451ebd1877149bfeb1722bcc9110fe6088a1 |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a99610c77b3b94ece175f0261572af0d468483dc |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/401ff51c6df57baa2ec7a143537ed684ea32aa92 |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a1f1cb561af913f545658e9e97bdb377372c50be |     
  riscv64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8851e38533a3fd5f48401e25ffea81bf44b314c9 |     
    i586     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/bdba186a6a68caa773c193fd0382f263c9f68362 |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/bb3f4d4fe26e3c32ca06c287826c76cfb32a7dac |     
  riscv64    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/7747478bef07833407dfec34c92e8899ceb3f55b |     
   x86_64    |  libtorrent-rasterbar-1.2.19   | NOK | https://autobuild.buildroot.org/results/8c8a35052ce03871e94d4fdd3806feeebe61ce40 |     
    sh4      |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/7cc7645309fbd536de3b868fb92bb086bac475ff |     
  aarch64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/75242b4a1db9876215a8a27c2b05dfec86bf6600 |     
 powerpc64   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/f8489252a6d37ebf32fb721046345bdd1879c9f8 |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/b3543f9db5b23040962abc104056e2736a5c028a |     
  powerpc    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/6b8493f54996d9a6e8d98c42aa0dcf63988ff8b7 |     
   mipsel    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/baf8893048c5c9e5c6ddaf1206ed1a45a79fbd92 |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/8192516341ce8de569700d360251e110c23969ec |     
   armeb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/430b16df85d466a8d555e4274f490e4eb1f5abae |     
  powerpc    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/7ec70bc1fc283682deb8f6763a3d1e2b355d792c |     
   sparc     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/420e94b3fdb4cf47fe736d28a56111be12cbef54 |     
 powerpc64   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/fb23e22b33bc6a05dd232455fa7ac865ac058d3a |     
 powerpc64   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/4eb9ab0fb507c8d8919f0c961abe4be0ebec2b02 |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/12202d45349796f17b83dad32f9717bd70b071e2 |     
   x86_64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/40094f6726641bc8fcdf43dc87a6d121d411a752 |     
    or1k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/98517bec97722118b2a595017c3b2f70cf4b0afd |     
  sparc64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/ea7bc5ecfd4edb64a38cb39247ffc4bcb8d79ea0 |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/ee9453e67e8145dd725d0405274b23ac3c04be7a |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/1ee970c2769f776d7936f32925c764ec799827cd | ORPH
   mips64    |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/054288c25ce215bf3e05a9f930aee1ff10f5e915 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/dcdcdce096fdc5c4ed1e6abfa21dca9da13e4aca |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fd7819144631da4facbe3055d0b51f884af5a0ea |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/cff205469584d14f416a2c117bbeb76e13f4d1a6 | ORPH
 powerpc64   | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/ac190027b404ea9e0333af8277e549b14d48123a | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/051ba5ee541f22ca1f0871604c3b88c99f27fa9a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

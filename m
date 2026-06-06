Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6768CD8C89
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 03:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E47A6166B;
	Sat,  6 Jun 2026 03:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yqIM6Szqv8p; Sat,  6 Jun 2026 03:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F397561664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780715987;
	bh=efBe1CroZcmX0a+hE/oWBPqoj3QRVbkY4vXNoHhBChI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ktiUFclwDz95coyQgjaHbJVFcISeUak0RPdvcGn9s8+9KBLIVJWYDDyajaU+tucI6
	 6ZWHMvcCf4whDfBZk5aSsQ96YFeGtN1qdTmVRjtu2hUfPGmO0rpcHgOqByCzL2QIKd
	 OkxSnPM+Thjbh/VdJ7RMudaA0JTAznG8S6+xfKLdwNtRFkI3fI8OliK9tERyk2IyMr
	 BB9ErWGccHhmew1x55teH6xZVKCqPS2+FYRhogrnsTrZgQB55jdrNTyGHKiRgkSmfu
	 n7T8nlbZ02zCqMtBX4CKdpL48YGx3R0hNimRIHRy+6dWQG+FUfYQSCSX95URCdM9x7
	 MuqZTVQoKGGQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F397561664;
	Sat,  6 Jun 2026 03:19:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAC28187
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 03:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A049341E46
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 03:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCUa9HtJOlWt for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 03:19:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C334D41971
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C334D41971
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C334D41971
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 03:19:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490b8a97b11so27607875e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 20:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780715981; x=1781320781;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S9UEApheBIjCz4mssdp8DofWrr6J6HDO2D5F/jOQh40=;
 b=ZVEBPN9CZPtHbVWg7+Ae+ae/unzTAWX/Si2XYKoSs4Kc1MsLd/8KcEC+Kt/+1tcAha
 PH9y3dInEqpafx2yCmeuLA/a7yQrdHp6/juMX1B0hx/m5+a1Af65LjMelZcOlAV+j2Ek
 +htMi+7ffsNz7t3gbTYvlxN6hlstaKcIg8vk+4mjgwZspkcE3BQdWjNQJljJVm/wFfyi
 EP5MVRk9LDaNG/t/48uBrDD294yp1zDFfuUuspxh7hoUaP6flKsRMDyKRPY8j55Yz9uq
 Ay1SMRrrUyAEZnoKGns9BskbXOS/LmKrO6d4+s2vKqx35gY0HNh9Y0BdOJhMKjdJJRF5
 IraA==
X-Gm-Message-State: AOJu0YwHqHNaFR/G6Ej3Xj1hjdLqdQdS++W1I/0BaU91dVFR2D/aK/Jw
 CYRo8Vda2t/TDdFmpWGaAArImSQtf1E3KWcw+YuoHbXMijVLN0uUGV7059ulvOYp
X-Gm-Gg: Acq92OGXCALlqRJ4q/MvMazqphsj4F/wsube/tMp9SNj7uFS2YkTXDB36ZxwJhuC43c
 rdbkQJQBGC2aWfdNqkKAGmioaokstkEVjExG1f1s9DDa0AaKuV02eWVbTrTU69I0BaFJt1bLhq3
 S/n75cgFcdtx3j3HozFgEc/Y4y3VzNqwsveyEeGr3E+6QPbuOMB/m2P657yYQlyDhsfgTM/Lxtf
 7xxsr7rFSXkURQvYO23jiqVV8uGRWchxdAXIVDPwoZUnOG9ofpwEuBrd0KbutilY0t8/ujtZ9p8
 ZqnlKAfM7rStjyxTHOt8AOYaOOzARpwsFhNRaTMZhl8VYJJ01o6YpOF2bJTIK0npHbuETDRX0BF
 +e4PDjmyUUG50AuY22uqJsEGUzdJ+uGUDNMgRrTeTHHe9f4f5uDgTANjPUIOA99JsbpgIVeDmof
 5TeUrbb5Z+XyC+ur66vf/IlWRhO8DVZoiHnZjz
X-Received: by 2002:a05:600c:314b:b0:490:548e:b854 with SMTP id
 5b1f17b1804b1-490c25f5e25mr100262905e9.26.1780715981367; 
 Fri, 05 Jun 2026 20:19:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3cbfe4sm199573305e9.7.2026.06.05.20.19.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 20:19:40 -0700 (PDT)
Message-ID: <6a2391cc.7f42fb59.25b3a6.fbf7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 06 Jun 2026 03:19:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780715981; x=1781320781; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=S9UEApheBIjCz4mssdp8DofWrr6J6HDO2D5F/jOQh40=;
 b=AqZvfPdOESCKi4E3pOyrC6n80xBPnvoBB07nzjk73OBRE9GErYiGJeXHel4zbUPxBj
 Eh4E3zvyoxTrJiYr2O8sUBUqy7JvEUiOkJXn+unWAuZWXR27WFToJ8Ru2o5LG2W65bTg
 QibkKfOav6qo/fqkpFMFz2hl+QMS/lgOWcU0kLNSIydEWljht5+R+Qipt/s4rpJvjsDm
 Eom9Q1vtloU9T09RNvOyiVH9rAXrFN3ofLoj841ardxa7I+2pqJHgiyz4TcQVnTE3Yao
 eV7U06p79V0JGLMvEtR9JmmCHvVjf60T1Y06YUXH07NEhRqK8h0VZm0lJvVi8z79e96M
 1w5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AqZvfPdO
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-05
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

Autobuild statistics for 2026-06-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 18  | 24  |  0  | 42  |
  2026.02.x  |  6  | 11  |  0  | 17  |
    master   | 44  | 96  |  4  | 144 |

Classification of failures by reason for master
-----------------------------------------------

                   guile-3.0.9 | 3 
                  linux-7.0.11 | 3 
                  ntp-4.2.8p18 | 3 
                openssh-10.3p1 | 3 
   openvmtools-11.3.5-18557794 | 3 
                       unknown | 3 
            18xx-ti-utils-R8.8 | 2 
  gobject-introspection-1.84.0 | 2 
      libabseil-cpp-20260107.1 | 2 
              libopenssl-3.6.2 | 2 
                 libzlib-1.3.2 | 2 
                 linux-headers | 2 
                    lua-ev-1.5 | 2 
            minizip-zlib-1.3.1 | 2 
                    olsr-0.9.8 | 2 
                  pdmenu-1.3.6 | 2 
                   perl-5.42.2 | 2 
                 rtptools-1.22 | 2 
                  stunnel-5.78 | 2 
               tcf-agent-1.8.0 | 2 
           uboot-tools-2026.04 | 2 
      xutil_util-macros-1.20.2 | 2 
amazon-ecr-credential-helpe... | 1 
               bpftrace-0.24.2 | 1 
             bubblewrap-0.11.2 | 1 
                  cairo-1.18.4 | 1 
                   dante-1.4.4 | 1 
                  delve-1.22.1 | 1 
 docker-credential-gcr-v2.1.30 | 1 
                    dpdk-25.11 | 1 
              erlang-26.2.5.15 | 1 
            erofs-utils-1.8.10 | 1 
              execline-2.9.6.1 | 1 
                    fcft-3.3.2 | 1 
               freeipmi-1.6.18 | 1 
fs/cpio/cpio.mk:131: /home/... | 1 
                 gnupg2-2.5.20 | 1 
                     gzip-1.14 | 1 
                heirloom-mailx | 1 
               host-dracut-110 | 1 
              host-guile-3.0.9 | 1 
                      host-php | 1 
            host-pixman-0.46.4 | 1 
              host-rust-1.96.0 | 1 
            igd2-for-linux-2.2 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
     kvm-unit-tests-2025-06-05 | 1 
                 libavif-1.4.1 | 1 
              libcanberra-0.30 | 1 
                libdaemon-0.14 | 1 
libfutils-c326ce0cc2a735438... | 1 
           libmicrohttpd-1.0.5 | 1 
                libsoup3-3.6.6 | 1 
          linux-5.10.254-cip72 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                 mdevd-0.1.6.5 | 1 
            nss-myhostname-0.3 | 1 
               openblas-0.3.33 | 1 
             parsec-tool-0.7.0 | 1 
               procps-ng-4.0.6 | 1 
               pulseaudio-17.0 | 1 
            python-iwlib-1.7.0 | 1 
                 rtl_433-25.02 | 1 
                   s6-2.13.1.0 | 1 
     s6-portable-utils-2.3.0.4 | 1 
             superiotool-24.05 | 1 
                 systemd-258.7 | 1 
uclibc-ng-test-132c6134d691... | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
               valgrind-3.26.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/87226c796c1005eaea2183aed0094c304e74cede |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/26aef83a137563771ec425d3122e27c145c47d8b |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/fb198c13f4dda0c0f77c74705ec03218ffbd86e4 | ORPH
  aarch64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/2320e4b5a6736f191fbfae21999ec0babab4f445 |     
    arc      |       bubblewrap-0.11.2        | NOK | https://autobuild.buildroot.org/results/11d6b21f8769f9d7d07d49cd42fbc990ff134871 |     
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4dcf6274b0da13be8ac4e581cf8bf2c39f1ed87e |     
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ccd1e4ff56580bdba7b58f727d60f2c9a9507d3a | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/743768eabb7b5e4a7b3a61a909b5bbb1e0e9d0e6 |     
   x86_64    | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/bd61192bbff172baf65bcffd83ae61279cdd8313 | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/882aafba7c1bad9d782e0d56b65cdea1e3c16f71 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/f5280e1b6797f99d6c03a3b7e8fe7932729768fe |     
    arm      |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/d2441ef06dbee36fe0d17743579ae1b3df1a4d65 |     
  sparc64    |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/1c9b54245cd3247d4ba89c8e082a1743918c7087 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/d80aad6fa0baab66c48ab0bbc505346fb259a0bc | ORPH
microblazeel |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/45cf57cf32faa204189aae2c698f0700e08fe636 |     
    hppa     | fs/cpio/cpio.mk:131: /home/... | NOK | https://autobuild.buildroot.org/results/c2f59114518f05c596aa5d295c51f8432ed3ac61 |     
 aarch64_be  |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/9b02647f6f8d3b61a0533577a4057ca42257adab |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/29a5a11b614c8035f4f3338586c0c01809a687dc | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/09f2ef5125403e448793216493a98204b3dc308d | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/7213e4df7cd9668e2b85614ba9d895728bbc565c |     
  aarch64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/86358c83e8a234f2a5e0e5c785fae4d69e91606f |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/915bc3cb12d7bae29a3eedfab3f7b195df7bf252 |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/73f260b3560272dc49253a2748fa69bcc250c2d5 | ORPH
   mips64    |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/f08d4012921ab0f4b33e8f3dab2eebb3ed9bfbc4 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/1ee0aad56deb19630d3d79ef5125ba33b9a857e8 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/c171143925419f3eecada4fa68a3dcb33dfd6927 |     
   x86_64    |            host-php            | TIM | https://autobuild.buildroot.org/results/2639e7fc131ced978eab1f4f799fecb2ecc2ef2e |     
   x86_64    |       host-pixman-0.46.4       | NOK | https://autobuild.buildroot.org/results/6e43b1ac17438481b9004b8c4a03bda84c81e141 | ORPH
   armeb     |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/3314d8bbac4a3222ba99d769f05c3c283d128aed |     
powerpc64le  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0d3d551c472bb77b5da8d9ee41c949a2a337355a |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/203f39380c21715251420f0e76f9d6c9ab963684 |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/ab4c5209d8dca584d4e6feed7adc4ed33fe0a69d |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/c32e53a1e9a4ffeb28b789877f79d8715a1b5299 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/6bfee7dd896b1e9c9f4bbcc56cd32a55c4a03a42 |     
    i686     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/a7a36bd3bfa2e78bc48af07a3cbba89293676351 |     
    i686     |        libcanberra-0.30        | NOK | https://autobuild.buildroot.org/results/60b6c398752491886b47f5fef732404e91cb245f |     
    i686     |         libdaemon-0.14         | NOK | https://autobuild.buildroot.org/results/f86ebb39eda7d5baa3d42af1d0acfeeb790b8a9a | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/c9bbcb952bb8cae62c9b9b9625c9e2d44f8953e9 |     
  mips64el   |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/4744cb43739588dfea7fcba5e090af20633c49b2 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/050350fc2425b5fe43e1adb52cfa5f0b452814e0 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/3ef867a734ab3b4278f5fbe369d17962750c868b | ORPH
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/aa18616c65ebd5a87ad411d7cb512aa3cfe620d0 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/1cc435f5cbb7a2e9f364fc999fb3e0c63a5d3409 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/d54ea0c035e779303638dc3819f6784f21b885ec | ORPH
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/703774f18a1dd6bb054821ae33293e0acc991cfa | ORPH
    m68k     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/846c97491c0b9423d21fd8b51c9b46adbf151657 | ORPH
  powerpc    |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/ec846ce80a70d0e146a2ee1969d9b16f0b237fbf | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/77e14f203396551ee5b13e2e8b6e38a0f08288c5 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/e4d8c921aec0347b4d8b983c7aa6d94fc752ad46 | ORPH
   mipsel    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/65e485026fefc22b32668798ea3af21b02ee9123 |     
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/9ec1a9f0ae7151c45435d24cfabe2ccffc7ba18f |     
  riscv64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/a2344229ab4b02206d2e2b4a2bf2252bb4af7f1d |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/1fbb0589855c561b724ad18ab1ea68c40d97e6a6 |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/6dea1e1834cc2b3b9881ac6e2d79911f63a0ef8d |     
  riscv32    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/7d84955878fa5eb9fb5d74869109e1f499457326 |     
   s390x     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/f367c6caab40a817a9e7ceec76e63b06b0f56797 |     
 powerpc64   |       nss-myhostname-0.3       | NOK | https://autobuild.buildroot.org/results/74808247586c49a9461453f37460aeaa9b2865eb |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4b71737b10b52aba0d5adbd2828aaf2315b221cf |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b7611567b8c7c175eeccdc754286539782be5af0 |     
 powerpc64   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5e77a306e70ef590ad3319fa74d85dfc13612967 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/1c4ba9df6a893d8c4b998769f4d459160971bb76 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/04a32bb863c687e5ec98dc00b13e25db93f20edd | ORPH
  mips64el   |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/c92acb787edd394b7c5e1654ba16fe71563d6832 |     
  mips64el   |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/79d2df5c6c3b0a39591e9380f70db972c18e73ce | ORPH
   s390x     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/cdc8f4a185fb7adb804292a45d3afeffc696a9e4 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/99e4dee3fddc4cd2945647a47875ef7688b340cf | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/b3aa9e6f293895e6fb5d75dc1c0b1659498d611c |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/aef2f2eadec88593da0125af677ce51bc71ffb75 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/940647d0f2d8954e2136b71596b61182696c2ae0 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/79296a426e07629521916baa1c688da83585d8df |     
loongarch64  |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/0d54f01f6941f61bdb8ebaca615f75e86ea43278 |     
  mips64el   |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/f8258dbb84dfc44452839fb4b92eced00ba46c5d |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a6c2c0fd6e5976034d300cb32862114aac60e571 |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f9c0ea418e8b42e93a60bdaff42732659bbada05 |     
    arm      |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/e34fbadeebdc1f11dbdb145db51bb2148ca9a5ca | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7017c5ef0edc8847d92d2789a40522011f55e581 | ORPH
 aarch64_be  |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/93943da2df230c87e499de9730fb48e361ba131b |     
  sparc64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/fef8af427ce9f2f258b68370cd994b4da1c4c363 |     
  sparc64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/f55f7b8a000f868580b7407a8fe00126311d2f83 | ORPH
    or1k     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/d9dadf8bfaddc9e81ed5be294b36305de0e6e133 | ORPH
   sh4eb     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/1508f1756bea98e780c2bc584181b41072edb2fb |     
    i586     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/224a96ce34d950820128d8edea793ac6d9cb3b3f |     
    mips     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/0040369e8e8a357ae43085c73139665d2b874cb2 |     
  aarch64    |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/6a22be9ce8575d5b38d0d3d0ba6d76166557a802 |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/fd660f2e233c91c810b192c20a66a8f34071e68b |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/79aeb2ba2b39686868e5ca1ff0812660025f6a18 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/cc5ec1bacd06c4bd301ecae6037c1945e6894460 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/0d5b949528d85e847a0dae33df930dfaebfda055 |     
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/034608346da987c5bad1ecc3d9bdf36df1bce3af | ORPH
   sparc     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/ed3dec049d2db93c92cf2132feadfd577041e996 | ORPH
microblazeel | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/fd243fc5584324a3d21bb54559b32e4d2c7e5526 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/8eac1f636bcfa27ccece3f82537f27f720c7f073 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c01f287967cf0a786f9c9724a84430cec7cc95d3 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1e6ddb2eebf2731514e9b07bfa61d5495bd10be0 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/ebce7d5b3d5aabbf87c21be2c0e4f5026573137f |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/dd49975af19d1dadc653f7ba63bff6f50fdd6a74 | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/773cea9a1cb524330d4e3ab3f8a25a85d715e76d | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/1110635cc0ad0d4cceafb2dd46369f36a5b82042 |     
    i686     |    xutil_util-macros-1.20.2    | NOK | https://autobuild.buildroot.org/results/6c95d90956dc93184e45405ff025f1246c065f45 | ORPH
    i686     |    xutil_util-macros-1.20.2    | NOK | https://autobuild.buildroot.org/results/3fd42c714a0a269fc93ce7b5b4207f752b32605f | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

            18xx-ti-utils-R8.8 | 1 
              erlang-26.2.5.15 | 1 
  gobject-introspection-1.84.0 | 1 
              host-rust-1.88.0 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                 pixman-0.46.4 | 1 
       sp-oops-extract-0.0.7-1 | 1 
uhttpd-15346de8d3ba42200249... | 1 
                       unknown | 1 
             util-linux-2.41.4 | 1 
  wireguard-tools-1.0.20250521 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/9a64987552aea38dd87d21e058fc47a212c6d615 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/317051f98c1ba4f4ecf8da91ccdf87c84ff2fd18 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d243449061d3c2caf81c121a4f4b7847a0a58245 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/c18adb0487929ae664ccdd40dab10664cd8f6782 |     
powerpc64le  |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/a8b9d1bd0f5cef7d41c8430f72e297f1b54c003f | ORPH
    i686     |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/fd68343de7d6813e0e7ae6b9ef8fe1ed099fe53b | ORPH
powerpc64le  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/a63083314a59d6792fe80d56066a613e22ecc654 |     
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/728b93e9a79b81b78569f6cbed2dd916e958db6e | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dc7504c7b35a0402aac09432c9baee1dc57c7f62 |     
    i686     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/14cdcdd39765033c11ebfba2726845cf437e51b2 |     
    i686     |  wireguard-tools-1.0.20250521  | NOK | https://autobuild.buildroot.org/results/be86343fdc7666cd8c3c4e2fc08db7cf1fb93f0e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dante-1.4.4 | 2 
               asterisk-22.8.2 | 1 
                    bat-0.25.0 | 1 
               dvbsnoop-1.4.50 | 1 
                   exim-4.99.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.82.0 | 1 
host-netsurf-buildsystem-75... | 1 
              host-rust-1.82.0 | 1 
                  ifplugd-0.28 | 1 
             libgphoto2-2.5.27 | 1 
              libmodbus-3.1.11 | 1 
             libtorrent-0.13.8 | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
                  octave-9.3.0 | 1 
                 openssh-9.9p2 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.4 | 1 
              skalibs-2.14.2.0 | 1 
      softether-4.30-9700-beta | 1 
                       unknown | 1 
            xlib_libXext-1.3.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/fe2edf7a5b2b03b37f0b8ec592382bc3474e8e12 |     
    i586     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/baece078ef03be3f45f4a6edbbd978a0c9d3b4c9 |     
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/02887026988ad066b9c9f68a9c2a418e7bf2922f | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f3b95c2d8b5d56ec3d19e2c553197cda1b79b6d9 | ORPH
powerpc64le  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/a51cd8bf204a33958d797d6ff8144b162b80559b |     
    i686     |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/9048a79d90a934252b56215290e37a3d0c7c976c |     
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9613e4ede049994bfd7bbbbb43a50a7478753616 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/a5a56dae12e5183748fdf62317849db5c7bc26ba | ORPH
 microblaze  | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/ddf749b7d4b37028d6b580dc6f98811f89d28906 | ORPH
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/3d8b66210a6c59f9e5d28cd212f1c5b56e817bf7 |     
    i686     |          ifplugd-0.28          | NOK | https://autobuild.buildroot.org/results/881750924c0f1f0c7021bfeca9babc5f0ab4ac3e | ORPH
    arm      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/3caae56362e62be86a9a0a18d59fca7760e28104 |     
  riscv64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/5b0b4277eee214e0765208d28a41b1a39052ece9 |     
    i686     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/b14c14758ec3332195f4addd522990136275a2c3 | ORPH
    arm      |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/43a8b06cf245854a82076adb384ae9e4092f5850 | ORPH
   mipsel    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/c4ecc9b964da7abcf289e7124e3ab1f446d19993 |     
    i686     |          octave-9.3.0          | NOK | https://autobuild.buildroot.org/results/9c275a7a00a2b919c7555abbe610886920eff73d |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/2158363abacb8899f58ff924a3a7f7dbae19afbd | ORPH
microblazeel | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/bbcb268add433511ac4708003364c8f55af640c4 |     
   mips64    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/49e05521da84833c0c0ee1c17e6eb7fc6a7ecbe3 |     
  mips64el   |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/f9dff4b76429f4bc7ff5914802d59b2775179a56 |     
    i586     |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/a56247d6469fa15af35f96b4d0a8a0156518de3f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4087b7636c3681b12114184299263392cc625540 |     
    i686     |       xlib_libXext-1.3.5       | NOK | https://autobuild.buildroot.org/results/eef93e64c49be57c9fdfe99d3ea99741dd3a9292 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

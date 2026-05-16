Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B768CD4851
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 03:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11AA083E05;
	Sat, 16 May 2026 03:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5IeKqwrF8yt; Sat, 16 May 2026 03:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D46283E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778901485;
	bh=5K5moAwzW4dqKO4qSXagVus0GZitvvnpzK05XiRQglk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UqSrPVzlcaCfCmD6oJ3VgjOHrtkDE1rrXVIsUQuSekxA75yEg29VEXOYqe4HbsHX0
	 uZeX82/LlSQfXpPbDfTkVXgMuBki7WbdNdid5UZr6xds8ucUsPob323P/BEELhwsV2
	 5D0uHp7AyCp/7BA+UWignUrQRj1/R59465rNELJ/QLtBoOkc55mmuD315GGs8AI3Qx
	 MKXDDWb9UKmd/ELC0XjfulGTl9JARSQWPvwXGufqeUthPEouafeBCbogJ7THV7uh8d
	 lw8ilmqc6z+t7eOeWA/7OoDZP6Ruuca3NSSbMtcprpALJPgHnEqiKUqGf1+49xU78e
	 1OOCsb3mYFD8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D46283E27;
	Sat, 16 May 2026 03:18:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18BBE45B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 03:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ABF383BF7
 for <buildroot@buildroot.org>; Sat, 16 May 2026 03:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Akxxi9aboOvG for <buildroot@buildroot.org>;
 Sat, 16 May 2026 03:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3033680EFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3033680EFB
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3033680EFB
 for <buildroot@buildroot.org>; Sat, 16 May 2026 03:18:00 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so6112385e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 20:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778901479; x=1779506279;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6udmQnr+OjYda4ZI6HWqQsEaNB9M9dgtKX+Qrc/zpts=;
 b=M7eQaEE0tg9B0Y5ohUiHGLRDSaeRl/UaiEHVcsdW0VTSPUElPazVrEBMSgTAaQqDQO
 d2+f8+8+IVIz9C34l2IdGcElWR+gJQDwU0Arf8gdwdDkVG69Z0lXTiTZH8Gsk2YsE/6y
 3RwzELqjtX2nQljZBBX45Hp/F/1g0U2rTzEcoAKN6PM/HCel/hD969UC04KK+yqLogbQ
 m4x8X7DqYoxipKV3IDwtPXIa38K4JVN5kxpCihVgF9MxQTkeY0CVinr4mHTtkZon2WUh
 /auy7x3jIqAMOoVtpzzvWkZsAxLOHSQsPXJWPMGSGoeKAsgJlM/h7yoSyMOtqCQBLjEH
 I4Cg==
X-Gm-Message-State: AOJu0YwRbCLJZw/85Yv2QNKkTGYyxHw9ata8a+Ctfe7XtTytxgp9PSEj
 hR0NSi4pHWWV6/p3dpzNduh3hVK9k2XKLZsiKM/dmRu+nLl/5KPfqD7zHcWer2mm
X-Gm-Gg: Acq92OF/jEYvs1ViYiIFaicpLoyHn89PhE+MC6BI9wAWCU0Qun1ifNIvM9A7NGZ2sCp
 P1gXn6jRqVC5B6E0LVM35EMvovsi3/9SKLSf9rzgGhUbD2PGGcYU1dHw296TAjx78WnVLJtj0q0
 +QnDui2TfnLoRubGvg8BW/bAv+Eihhj34AK4lD0Tuvm7C1GYsH6b5jWZRfn3SAG/lOuQHCiOfpF
 iCGz/xDpFvUPIhd5rsVuJeRYiefvKrX8IibgWE08riXhNy3l2kd7FqzMM2Fr20ef/G+Qfz7i9qq
 3gg6FOuDarBkXQoTAmOIgYkalRw6u53mn5P6AiJBHHwhXVFHAWfJfp4BXrIrTvKfr04mD8HDzqe
 YgrUD6dnflI7uFawiv7C7j8lewGxV/qhtjyUGEowJ/dZJrseP2hbnA1iayKD2Q51xMtas9XTo6N
 fh2sG9TfF6ZWGcpmyeWC7Dabbd8flpnw==
X-Received: by 2002:a05:600c:a417:b0:488:a882:c7 with SMTP id
 5b1f17b1804b1-48fe65168a7mr75809505e9.25.1778901478568; 
 Fri, 15 May 2026 20:17:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe6b60csm37981025e9.6.2026.05.15.20.17.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 20:17:58 -0700 (PDT)
Message-ID: <6a07e1e6.05873824.36f2b8.8398@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 16 May 2026 03:17:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778901479; x=1779506279; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6udmQnr+OjYda4ZI6HWqQsEaNB9M9dgtKX+Qrc/zpts=;
 b=pJ7hyGEqmnWobzdYMfzBhbOMDPW6hkrahKcVOET/7OUZNAX3y5p6Lp1BsepYIk85na
 FJgu3L8mi4zg89aLdIg6fIeofcC9hAzPVjl9G68YY6Vw1Q5i4+393hlWEkRfEUXQI8W7
 Y5ubj97hzJZDV3qVXcvhKKjgkk+rDKQ1i9WRrF/S4Et4gaQAlBM6G9W5vSJkTbFlwN+C
 qjTPg/V+zvPNlLoozlUPlYROP5J8ZllIKKDY6Af+GFs0n0DxVhqNmLuzK+DoucHY4eZb
 yyEM49gN8oMW0HgYcQgbMJZ1sCwTlYwnc6azkS4XMaLsVuVtsKLutHoHRNV/7meWO8Yo
 x1Hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pJ7hyGEq
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-15
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

Autobuild statistics for 2026-05-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 18  | 71  |  0  | 89  |
  2026.02.x  |  7  | 37  |  0  | 44  |
    master   | 65  | 177 |  0  | 242 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
glibc-2.43-27-g4070d808bea1... | 5 
                host-odb-2.4.0 | 5 
odhcp6c-f19dd37fb467c9cf10c... | 5 
                   perl-5.42.2 | 5 
             dahdi-linux-3.3.0 | 4 
    host-gcc-bare-metal-15.2.0 | 4 
host-gobject-introspection-... | 4 
               linux-pam-1.7.2 | 4 
             util-linux-2.41.4 | 4 
                  cairo-1.18.4 | 3 
                 gnupg2-2.5.19 | 3 
  gobject-introspection-1.84.0 | 3 
              host-pahole-1.28 | 3 
              host-rust-1.95.0 | 3 
            igd2-for-linux-2.2 | 3 
libdill-32d0e8b733416208e04... | 3 
                 libmbus-0.9.0 | 3 
                  libnfs-6.0.2 | 3 
              libopenssl-3.6.2 | 3 
     linux-5.10.254-cip72-rt32 | 3 
      shadowsocks-libev-v3.3.6 | 3 
               tcf-agent-1.8.0 | 3 
              dropbear-2026.91 | 2 
                 host-gdb-15.2 | 2 
                host-m4-1.4.21 | 2 
host-vboot-utils-7dfa482d6a... | 2 
                libnss-3.123.1 | 2 
           libzenoh-pico-1.2.1 | 2 
                   linux-7.0.6 | 2 
                    lua-ev-1.5 | 2 
                  ntp-4.2.8p18 | 2 
        perl-xml-libxml-2.0134 | 2 
             pptp-linux-1.10.0 | 2 
                    sbctl-0.18 | 2 
              skalibs-2.14.3.0 | 2 
                 systemd-258.7 | 2 
uhttpd-15346de8d3ba42200249... | 2 
ustream-ssl-5a81c108d20e247... | 2 
                acpitool-0.5.1 | 1 
                   atop-2.12.1 | 1 
                  bcusdk-0.0.5 | 1 
                bpftool-v7.5.0 | 1 
                     crun-1.24 | 1 
                   dante-1.4.4 | 1 
           dialog-1.3-20251001 | 1 
                    dpdk-25.11 | 1 
              e2fsprogs-1.47.4 | 1 
                 e2tools-0.1.2 | 1 
            erofs-utils-1.8.10 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-6.1.5 | 1 
firmware-utils-c42a3bc53da8... | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                 fwts-25.11.00 | 1 
                   fwupd-2.0.4 | 1 
                    gawk-5.4.0 | 1 
host-gcc-initial-arc-2024.1... | 1 
           host-libtpms-0.10.2 | 1 
            host-protobuf-34.1 | 1 
          host-xfsprogs-6.19.0 | 1 
                iproute2-7.0.0 | 1 
                 libavif-1.4.1 | 1 
libfutils-c326ce0cc2a735438... | 1 
             libgphoto2-2.5.33 | 1 
           libmicrohttpd-1.0.5 | 1 
      libphidget-1.24.20260127 | 1 
                libsoup3-3.6.6 | 1 
               libunwind-1.8.1 | 1 
                  libva-2.23.0 | 1 
              liquid-dsp-1.6.0 | 1 
                       mrp-1.2 | 1 
                openntpd-6.8p1 | 1 
            optee-client-4.9.0 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                  pdmenu-1.3.6 | 1 
phidgetwebservice-2.1.9.201... | 1 
                pipewire-1.2.8 | 1 
               procps-ng-4.0.6 | 1 
                   qemu-10.2.0 | 1 
          qt6declarative-6.9.1 | 1 
                rdma-core-62.0 | 1 
                 rtl_433-25.02 | 1 
                s6-dns-2.4.0.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
squeezelite-72e1fd8abfa9b2f... | 1 
                  stunnel-5.78 | 1 
             tpm-tools-1.3.9.1 | 1 
           uboot-tools-2026.04 | 1 
uclibc-ng-test-132c6134d691... | 1 
ulog-0389d243352255f6182326... | 1 
          usb_modeswitch-2.6.2 | 1 
        util-linux-libs-2.41.4 | 1 
               valgrind-3.26.0 | 1 
            vorbis-tools-1.4.3 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/d205afc0bb3bf7de1ccda4145371b15a45b4a340 | ORPH
    arc      |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/6e2ea1349c2c2547aae09bc3aad678912efb96de |     
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ac2746a034544883f22ecf50ad672a57edc3ba77 |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/c306b44a62740df4b56ad29232d90e93bb6c3113 |     
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/3b04ef8d55eecbf226e8036593e9c882b599f856 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/1192da410fde28b5070e4d49893979c60c1f7060 |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/625470f32dbd7aa3f38efe5c7ffcd7f55b5ce952 |     
    arc      |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/e01bbcbc2a3f2ef89ec4868ce3d29730fc5c4372 |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3a9276f387e78a94eec057137286aa2394713ecf | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1aa7152ae71bf0b5469345969036e2b22af28d30 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/99a20a4f09f671888b751431a6601b4fe2e45c67 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1d1d53cf6c05a7534c2dcbcccba6a2280e819f87 | ORPH
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f42d19ab44b037f6c420a39fce3abe3278051deb | ORPH
  powerpc    |      dialog-1.3-20251001       | NOK | https://autobuild.buildroot.org/results/7dc9d39afeba7cafd9882a721d67fa0833e42e12 | ORPH
   x86_64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/e350a339da30bed408449bda7e27c2d956fdeae5 |     
    i686     |        dropbear-2026.91        | NOK | https://autobuild.buildroot.org/results/b07a8e0574de25ed3f74edeaa117096d381541df |     
    arc      |        dropbear-2026.91        | NOK | https://autobuild.buildroot.org/results/b5e9a63fd8144342f62c13e047cc901db636eb82 |     
  mips64el   |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/651f9dfeb58b93bf0925aa75f49541282cf41df6 | ORPH
    arm      |         e2tools-0.1.2          | NOK | https://autobuild.buildroot.org/results/26ba2cf8e41d91aa389d74cac68861cc6bff6aee | ORPH
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/e12b3ed8a2742c99523bb4fe781f2bff3dc66715 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/a3275a72d950056c3098a5bc76513481471fe0ab | ORPH
    arc      |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/a8700d07c0200d4adbf0f953fb24dc7104dd3879 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/d5b7601a99980350515a732b5471547de4884e28 |     
    sh4a     | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/3b2c7b3058dc1880562f1f48495ebd35b0fca1ac |     
    sh4a     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/7cd4f4d14bb3bbf4c95b872ae6fc270211284e09 |     
    i686     |         fwts-25.11.00          | NOK | https://autobuild.buildroot.org/results/43aa2764f73d2caa489b2519f0b678166edf4beb | ORPH
powerpc64le  |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/f6bf5cbb015e41839220da0b17a4696b6096e815 |     
    m68k     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/4dd476f7cada1bf18f77341ad8bfecf658be227d | ORPH
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/2f0dea27f32b18925ef378069e7d4df88609d6f9 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/be1ab86a4bc906227f1bd41f96638c06900a897a |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/b67ca8f0d996978e6e2fd57f4fa9d8ff988ef1f2 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/7dee03aeafa0f5575e78aca816f9743ac1da26aa |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/757cef8904ac842802ff062069c15458e110b106 |     
  aarch64    |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/b9b0ea3efd8d8460d69300a580bb7d09ac16b45e |     
  mips64el   |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/89dbfc93fff906f3aeb390159c59c355256c9df4 |     
powerpc64le  |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/07c47ed75cc4281cf36035b0c76555f1483fa70b |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ed34370e710d90a24e36e5e1c4d856ec14f04caa | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8bc0c9cc66915271aa35aca20787523ac800b2c7 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/923c707fd0b6033f6230a06b7a563082f1d23ac8 | ORPH
    mips     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/e6079554f9ebb53df86de559b49d7d918d77a6e2 |     
    m68k     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/8e5cfb80b97030a3269d27738ed2210d9c3c2b8b |     
 aarch64_be  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/aecbafc0220d053d3362d740b62dacc5460d31e9 |     
    arc      |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/145fe83dc9cc15648e1fc31fab5f7475cdb6173f |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/737ee91e103183a5709498be34815285fcf0f30b |     
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/57d2f3094ef8d4c330bffb0ec11757ba9b36d278 | ORPH
  riscv64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/100fcfbb8b08c9bb58c7d98aec304d490c5f833f | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c4ef94bbcf18f1e8724ef0ff2975dce5f8a7903e | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a5aa7a04e46e72b683977c005009d6b12f7acf56 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/838fc074fe581d4ff9888e647f61951df8fb4840 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/31e0d4d4e76d35c8e44372f7e826369dfead62ea | ORPH
   mips64    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/f0c8ecaf2e263ced19ae6568ab9f3a4deedacf2f |     
    m68k     |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/6313319ffd4bed6bd60b5adc22af7abfdce2d441 | ORPH
  mips64el   |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/e6c832f938dd87c08a6749adb1d74c2759faffdf | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/36015b4ece25b2636f27265007977cc6cad154f9 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/08c0291481e9643445b1db189e1a6b10f7a056f8 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b5baf8b29ba923af39e03268a24a3ef51d8ca1f6 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/99caf748a0bbe80e14fc743390b08374fc5a020b | ORPH
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c48cb5ea5c9fbf1caa104fabb701f2fe9f36f20f | ORPH
  powerpc    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/6aaab1deaef6c345c922050d556cd1c7d81c5649 |     
    mips     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/470b183da55481f007388444cb3ab2acd9285b7d |     
 aarch64_be  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/4258ec5863fb22d44b6f84341ad06068b8721b40 |     
   sh4eb     |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/f4c063ecf1c2f6bb167963f43de43195533f8d47 |     
  aarch64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/4e22c926b957bdf3937d30c1cd4e6a3fb59e2b84 |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/ce42e614711ed078eb0a7616f13ede4b44b1a15e |     
  aarch64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/1d296ad4277d90020ba119d3398bdf75902d5eef |     
    hppa     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/8169a053f65a336f1bc51b4b8173ae94cff941a5 |     
powerpc64le  | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/1ea67c058c9e29fc43a8da3f19c6529d4997f6d3 |     
   mips64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/2c2fc4e1906fdb42cc7ba5b07e6f8b384c8dbb1c | ORPH
    m68k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/611d80c4da97d53bee040d56e77b7b355a7114c3 |     
   s390x     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/342a1b8b2e4aad626a6c60c8617d2e01aeb54522 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2b30c0acb463dea20323e356f16f36ed2ae1834b |     
  aarch64    |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/542ea324ef16cdfdff5124aca2bd784a2f309193 |     
   sparc     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/bfeaab1f7427a6fb1a2b51d755771c3bb5dddc96 |     
loongarch64  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/118d7df0791df50058fec30784ca461a9028aeb1 |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/66d8ba1e1604de35779527cb490982276d7b05ee |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/4709a79f1f46fd9fb418e163c379eeb4a06d5087 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/04f7d9dc26903b63bbdf261fb6a795eae191998b |     
    mips     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/7be5175afa4802389caefb5c0b310f4605d8c5e4 |     
    or1k     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/f7880c1ff6e5cf0857cdd18b9d54f99104b1f091 | ORPH
   s390x     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/df85052bd32e72d3f6e109d64c1e28546af4aa31 | ORPH
    or1k     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/fc6d6c91ec42054f6607e6e0d96d3f007c032b49 | ORPH
  aarch64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/570767575414398dba14bbcfd0944b9a4840681a |     
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/72d837878a32d511f931cd3726c2da72e8dd4d2e | ORPH
   armeb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/139babfeab6b91d9a5d3f67232f68ad1dd7f3c6b | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/76685553d2aefef6379f0bf6f90b89046100b1f6 | ORPH
 aarch64_be  |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/1b24854d23456f2e105281da3853aee09954de97 |     
 powerpc64   |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/a6a47ac7448dd67d99d16eaae875729b6d752053 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/0afed202ddd500c9d5ce50167c1040f112ca4e81 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/8c9c43b64a792bb86837619b0e8a429c09225d44 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/6df7ede169a9ec2d455c3d0d601bc9e18ecae6a1 | ORPH
  powerpc    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/a68e6b9fe0255f5ab00cacf2a06332cb9d519be4 |     
loongarch64  |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/e3d9b48328002664c875afd13217c00f594011ad |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/666c3cd2725212ece1f97309cfdd72b48f86932b | ORPH
  aarch64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/973aa51006a33fa09568a2bf7c89d2c5a9fa0946 |     
 aarch64_be  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/bed6f93971db6cc08fe16d08c2d028c185788156 |     
powerpc64le  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/7cfa9525dd6de8305e748fddd0b1ebe46a242def |     
   sh4aeb    |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/baf6dc822680b5481d7e91acf5cdbb7ceb5e8fd3 | ORPH
   x86_64    |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/5dcb948ffb42ab637b8726b1d9e3633b7c6e1f86 | ORPH
powerpc64le  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/b8fc0c07534656bfd4f44b1d8b4481496c5e091e | ORPH
    i586     |          linux-7.0.6           | NOK | https://autobuild.buildroot.org/results/d4273d5a7cd4e8141f2de23a51f5317ba6500d33 | ORPH
    m68k     |          linux-7.0.6           | NOK | https://autobuild.buildroot.org/results/124fc988475d739262b8dd160b1f4cfbb1c33acc | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/2b1b4434cc85a2c649d7809de3338dec65964f9d | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/fda2b09cf994c1ac2c61cfa1c27aa34e2bbcc0df | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8b226ea5dd62d4db3e38e7d76161ec8f86d6d868 | ORPH
   s390x     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/0572f5fbe061d0444345fa48a5a4fc9a2aad5e77 | ORPH
    sh4a     |        liquid-dsp-1.6.0        | NOK | https://autobuild.buildroot.org/results/fd9a6cd73ae66c643645edcad85b36f87625d784 |     
   mips64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/c1a4f3354b6e34c2975022fc5464e2909bf9e370 |     
   armeb     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/ece3840294bc4a9d5d06dfe9363c5463eb450def |     
    mips     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/cef8c8d01fbd8bb66167fdb59e17ea173dbe2d36 |     
   s390x     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/89026013eea5bfb940ca2f36c5197b2b75d11f6d |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f708af8c5cb5d0c32cbadcacfaa9cb0d1b864f9c |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ab653274d593df526f523bda2b962e407716556d |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ef026cb7b4addf301c7a3cc5e12c7653ba10f54c |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/f9721ee83c402184cd1a9c41fd9398b9007edbbc |     
    m68k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/cb568340e3bd9a5b9e708fee15e3a0683c0bd460 |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/1db289e8ef97b211a5bdf95f23e2689d5b0ad916 |     
    arc      |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/55cb168fb186a28ee3c08750e03c749e3e08351e | ORPH
 aarch64_be  |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/7e5db8d9374f256c0e105e56e73379736d87e537 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/2d2851c4ff509fb9390014706e5d8fe030b38265 |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/38cb672ca41bc26ecd070e86c7178ae9fa45d126 | ORPH
  aarch64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/00617586e9830998f5c5aad771ef511a1fd68627 |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/370c1c05d7c4bc307abe9192bb869fb22b3a04ca |     
   s390x     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a62a1c57b7d4741937b7b886abc3ae3cba19833a |     
 microblaze  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/0fde85f15ecb22a84f048a75d2438378d9a03130 |     
 microblaze  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/85456f478a10b583079ed808a847a76bfd207a0f |     
 aarch64_be  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8a1e2e90db4e89d91bffe4636edaad7de30f8aa2 |     
    sh4      |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/14416688f7de644cf6c6ebd54f7e5bb5d493771d |     
   mips64    |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/5a7fb2463a6ea93db95cedf81248cdc0fbc2789a |     
  powerpc    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/69757f79b58ba8e8fc207bfe3f14e8b54f25b075 |     
    sh4      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/032fa7a57bcef7662f54a8b40e0c108eadc22e31 |     
  mips64el   |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/807947978e3bc36aca65d1713134d76e2a05f02b | ORPH
    mips     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/0d37b5ecc75df24088899a69cd436396ac156dfb | ORPH
microblazeel |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/fa3d216315e0938afca21406931082b865250c61 | ORPH
 powerpc64   |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/df9be0b51e65f5ce4e27713ec1ca92778f853f1c |     
   mipsel    |      qt6declarative-6.9.1      | NOK | https://autobuild.buildroot.org/results/ba9a511420d6801d6cef697eed4cc8b46d0f545e |     
   s390x     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/43cf4337ccf434e7a34821e1857139365c81e101 |     
   mipsel    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/2a3a590133dc2b144bcd16ebe16c04ac8f86fdf7 |     
powerpc64le  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/8cac4fa1aba4ec83e0f17d994641ebf5055a488d |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/ce5df7a716acd6e50c59dd406c907905beb14f39 | ORPH
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/4685d97c83c30c47076c3e7f74c082358b3ecc79 | ORPH
   mipsel    |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/d42e502209c562624565041a046e99bb6011b322 | ORPH
loongarch64  |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/b4cd30e0ef27aaf23c906e4d6a542680c708c38a | ORPH
    arm      |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/04d4f7557762abfe7707fe7e1aa2dfdf41d97d94 | ORPH
   s390x     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/7458dcfe71bf2b73c25d9d7107537bf6d06d4fae |     
    sh4      |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/00fc993521401b0a09253e732438a321694c3d9c |     
    hppa     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/3bf2dabf1c8c1bf7f3e79c58522c8dbb08cf0701 |     
  powerpc    | squeezelite-72e1fd8abfa9b2f... | NOK | https://autobuild.buildroot.org/results/23067ad58adea5f0da068782cc3a73ff88e960b0 |     
   sparc     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/749edab43bbea69dab9809f46b6ef69d6036aac8 |     
    m68k     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/393b05c906723e7cc5ccdde2c33c616febf8defc |     
    m68k     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/7452833731ac98eb55187b1bd49e5e60ff89f1d4 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2afbd8f8317e6c3380db184937ad2e1acd8fd9df |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/46cbbcc6aa55c2b2b62d91e8a60af3c2e5b19f76 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fe90e882b52ab351e651da5b2f047f08c0ccfd5f |     
powerpc64le  |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/75934f7d9081c9e23e541ef4e38c93ac17c6e9e9 |     
    arm      |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/213d7fe2592fc0a274f43de98c72346a3163afaf | ORPH
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/0035f5b1678cd43714a82154c22ff094bca73e36 |     
    hppa     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c2dd99ba2a790285326e29c94332d42f8aad27f3 | ORPH
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/fe59670abaad0f2a344e8315089be3a648e20b07 | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/3841e890c9d9fbceb7acebb2b25a0297464c1e54 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/dc02d32a1ce6d83975d2a41e7f7313e530041d1e |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/5f842f7a4ff17da14d9efb8395654cbe5a6a414a |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4cc23cc153f45d03c3e14bc52f7ae36b157fd3c0 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/3ddba6d5745cf9355abe81b1f482ae33f1618f5e |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/567bf0fe718320ad1258fcb0928d3ec33ad99c80 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/994bea18b8a7e88621174fa789dc405c5ae0028e |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/f2d69b6b023eecf0b98930c493b84744a06b2c9c |     
  riscv64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/9a1a1108b6605d14fa2665b9ff62548d1d344ddc | ORPH
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/623a002112632d83d9a1050a3130322105095812 | ORPH
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/b1124d2c896f7e3e250a86a4931acc5138c41a21 | ORPH
  aarch64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/2d4057b7b8af6465c025512aec4250599f283949 |     
  riscv32    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/13e13a24ee50e10bf8c927fa1f434d857be4b5b1 |     
   armeb     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/08865235e166d5188aa6ae5552c14651dfc31f58 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/31dcde1e3d6e47dbeca53b86ca99680ce1f8542a |     
    or1k     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/dff83c5c59addc149c74a2cdae793aec5ac08dfd |     
    mips     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/b8612f2c4352298ce2f87681633033079cd527ed | ORPH
    arc      |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/de73ea60d7f3387d4c22f176ff39b3aab796f6ca | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/834304c5e2f7d7b0c8732beb8e3aeafc0d500059 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

       host-gcc-initial-14.3.0 | 11
       host-gcc-initial-13.4.0 | 5 
    host-gcc-bare-metal-15.2.0 | 3 
           at-spi2-core-2.58.2 | 1 
             dahdi-linux-3.3.0 | 1 
                   exim-4.99.2 | 1 
                  ffmpeg-6.1.4 | 1 
       host-gcc-initial-15.2.0 | 1 
host-gcc-initial-arc-2024.1... | 1 
              host-pahole-1.28 | 1 
              host-rust-1.88.0 | 1 
              hyperfine-1.19.0 | 1 
              libopenssl-3.6.2 | 1 
            libunistring-1.4.2 | 1 
              mariadb-10.11.15 | 1 
                openssh-10.2p1 | 1 
             pptp-linux-1.10.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
uhttpd-15346de8d3ba42200249... | 1 
                       unknown | 1 
            xapp_scripts-1.0.1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/5eed558e6b9db231647f9230f87d90816992afc1 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7aa55983117d7a3ae8836af1c1233eb5caa52acd | ORPH
    arm      |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/0adb41b436c13c3d29de3ddeb9d80bf0d6976b7b |     
    i686     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/24a3c35367d1a6c025192a3d8373efd929c4d8ce |     
   x86_64    |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/86b52c90faff41adea759198a50d92fa41653011 |     
   sparc     |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/835182f7ee7132a149478ae4fc5de1d424be410b |     
loongarch64  |   host-gcc-bare-metal-15.2.0   | NOK | https://autobuild.buildroot.org/results/d96abb48d759e3a3266674b42efe6cacaad254d9 |     
  powerpc    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/46cbe5fa18c086d33f695de80156e7a52e631d4c |     
   armeb     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/f7676d375cba5de176b9f305984bb4de24c653a5 |     
powerpc64le  |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/b9e7801a1c1397704556d77028bcd1b93becd63f |     
  sparc64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/2647cb578274faa3826349607338598046f56311 |     
    hppa     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/f8edf8a716115f5c0121856f817ce1b1a1fcba90 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/237841b29c8bfa4663c5bb22e8d338171a3972ee |     
  sparc64    |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/23e7ed0ff6598768e8e98c97c629aabec785a6d5 |     
    hppa     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/dcd8cc50df325fabe00ce65abd89b96fe13cb80a |     
  powerpc    |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/e3c4732c7cb4425ebef8411161f8942a5e484d44 |     
 microblaze  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/c7734ecdaefd9289545c4134e1da8958787d8768 |     
   sh4aeb    |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/65d8c366a3b87a32f8485aec6a84b91c789be86e |     
 powerpc64   |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/4170a82cb70f61d1f423a218fcffd69f836f7aa3 |     
    or1k     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/2afae03cfd0bce38a52b19f1f5be1775551a86f8 |     
   armeb     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/e645dc9f3c44ba653aef78c407a17d1df84d7e9d |     
  mips64el   |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/7c66d5df9797667823ddc0c7807b8f8e48450095 |     
   mipsel    |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/3aeff0816271e129cd78fb2fb17bba0e50abac69 |     
    or1k     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/c73af9262dda7cf70492a8ff7f7b4a872691892d |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/5ab5c9ba4fd973e5918ad0846b5fb94fa548a3b4 |     
   sh4aeb    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/220b12f621ff7645781f27375d9dcbe9594876c0 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/7cc870ebbe250abb623916892fff34b4e83aaec4 |     
   armeb     |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/e90b5aad427eb154724b317215181482480f0543 |     
    hppa     |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/34643e3a75618ecfc021bb0800379d431daa9c62 | ORPH
  sparc64    |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/4cdb0bb0cc594e3d61070a5dd7d141df393cf2fe |     
    i586     |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/40a953b7988f66fa8050cbe0cc0c03cd0d36a022 | ORPH
loongarch64  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/28c4b1bfbd341e67dda99546ffb9e8b014b1baeb | ORPH
microblazeel |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/8d52cb5597394f513f8b9f1c3aeef6e8fe7cbc60 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/184b52c286b72d4233c7f1404e4a003c8cb1447c |     
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/98d455de047774e67131c49039d188a8145f1504 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4650279df579ea2a114c71212b4629a0a7892144 |     
  aarch64    |       xapp_scripts-1.0.1       | NOK | https://autobuild.buildroot.org/results/216b5b29cd2a6c1841930b2087f6b7f9e81f4064 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

       host-gcc-initial-13.4.0 | 24
             host-cmake-3.31.9 | 14
    host-gcc-bare-metal-14.3.0 | 5 
                   perl-5.40.4 | 3 
       host-gcc-initial-12.4.0 | 2 
       host-gcc-initial-14.3.0 | 2 
        ltp-testsuite-20250130 | 2 
                       unknown | 2 
                bpftool-v7.1.0 | 1 
          cryptodev-linux-1.13 | 1 
                 hidapi-0.14.0 | 1 
host-binutils-arc-2023.09-r... | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-mender-artifact-4.0.0 | 1 
        host-python-lxml-5.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
           libmicrohttpd-1.0.5 | 1 
                  libsepol-3.7 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                     lxc-5.0.3 | 1 
                      opus-1.4 | 1 
             parsec-tool-0.7.0 | 1 
                 sudo-1.9.17p2 | 1 
              udpcast-20230924 | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/1affc110182aa4ada2d99bb6c80c8285a19b019f |     
 powerpc64   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/6899b2cbd736158b29a2fb94142de8be5fef164a | ORPH
   mipsel    |         hidapi-0.14.0          | NOK | https://autobuild.buildroot.org/results/f628019b027e93d303d4bb9a25b4e89107dc4c59 | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b3c673684bc7487a283efeaacdf608d24d59d70c |     
 aarch64_be  |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/e1632e5fbb1dc5560d18661233d894454f695f63 |     
    or1k     |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/fd55ae31ae019eb31da9f7051c354697343036a4 |     
  powerpc    |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/721cb855151d2e8bca3661c7a52d7d094b4dc41e |     
   s390x     |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/6934b62e0f0c7363c02863e6f0dcfede4e2f9b3f |     
   sparc     |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/d3455cec7db65d4806d5fcb6155faab1967b8a5d |     
  riscv32    |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/a663cc9da400176c8fb28c2d35422577b96f8b5f |     
   sparc     |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/68622b6cc2086269ce37a62a2e8c4f1005d8ba3b |     
  sparc64    |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/8131f94678f40614f8801ef32a03eabafef66fb5 |     
   armeb     |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/ade2b88e82c0e130be9456b4a2d451d26c05b607 |     
   x86_64    |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/5c077079380ef5d46a12956be1413646fa5c3069 |     
microblazeel |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/14065291d829e3d47fd27e91437410e23abbd052 |     
    or1k     |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/0e794ec99cfa6b5a0b704b3378e5e8acd7db3290 |     
   arceb     |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/c01b3f441dad4fc25e918721a497534dc6a01bed |     
 aarch64_be  |       host-cmake-3.31.9        | NOK | https://autobuild.buildroot.org/results/2e689ee9ec8390409c74a268603f186131e5d226 |     
powerpc64le  |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/943444b0261df9d65b8051e8ccb4aea3b5b01c0e |     
   sh4aeb    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/e171d2044cde7c90b73beb5fbd1296cac4536fdd |     
  riscv32    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/d03cb84f6655b25c9ef786ceb9884d5caa5ff829 |     
   sparc     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/05776c0fe6cae5798da339ffbcd8fef28e340cec |     
   x86_64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/5023ad3e3666393a6df5a53069c537c5a8c83640 |     
  mips64el   |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/52ff4ec1ea9c7b8e38321d51dfb81addb15c243b |     
  mips64el   |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/0cac609da4b974e6f50af3528f0d413938c71ad5 |     
    arm      |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/f160de02871670e1ce2771744582af05dfa6c847 |     
    m68k     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/f268fa3647505fea5b09352a2ce7fe6cb511852e |     
    m68k     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/9cd2c3ddebead1c260050748c2892e975eaa98b2 |     
  sparc64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/3f610b3a4fa715a9d71935083d2f715cbef6798d |     
   armeb     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/20170846636a945d859bfedffb59f8c1653027a7 |     
  mips64el   |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/99e1efa190092d321a9fbf5bdee2f6db04118850 |     
 powerpc64   |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/7705df4afffc0449b789c4579b41cbbdd47b1b1e |     
    m68k     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/d03c5f4e8ef5e4ca979124f95dbb73057597da2d |     
   mips64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/6fb1ac32f07194b91301a81e05837b24ab085924 |     
    sh4      |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/7386587fcd8eb4689317aa266fe50d6b0b767f88 |     
    i586     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/5b8e614bdf2ecfec6e7f49ebd820ffc5a2775030 |     
  powerpc    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/590b3bac66871e78850bab67bb33921b39e728ee |     
   s390x     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/0a819516b99b22a80d4f4db03e3c296d3c199052 |     
   mips64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/8a4c27f1752b011f570a83d21df8e30a0af63cd1 |     
   sh4eb     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/41879923853fc3bb791d0110d344ddf7010216b7 |     
  riscv64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/88e6909f8e677ff8c75eef950f5a19f12037c4cc |     
powerpc64le  |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/211a03ab5829dc9c825ca5b822a1d0d529370aae |     
  riscv64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/2f848ab9f43205ca31d2e20afe33ac7e69fe95ac |     
   sparc     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/661a304f44a49deacf06d969b6f257418affcc4f |     
  sparc64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/c1b8ce94b2ee20e0cfa782045b9b689a5b784d9e |     
   sparc     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/2793f387bfd598d0ca978fa57b6a22240df44596 |     
 powerpc64   |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/a10c46e45f832f38fe4a1837ac1347d4c1b6a626 |     
   mips64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/1cfa1505146bdd79b6656af451719577449a3fe2 |     
    arm      |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/5b9bf52c77a2f8ba407bcad4cd59eab92ee8a660 |     
    mips     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/bf3de7544de8eeb28ebccb9a28f0497732c423f6 |     
    or1k     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/686c05faed74ac3966e86d904939ecd4bce81622 |     
   armeb     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/9d09a2ccfd7e4671f121d209584a19275295e5e8 | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/5eb01c2fa0971e26098c1d6fdf9f24e7852c3b76 |     
   sh4aeb    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/006b06ec0ff80d987a38b0272437f934a28f9c40 |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/4953c4cb75881f4f7b77c0c5328d4bc9cf1f6b20 |     
    m68k     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/94a7ebf3dab4574f6a196a647435b7b5aab3804c |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/1b269279fb5b71b85c81894a5f09e74792520508 |     
  mips64el   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/3d7ae2a436ba014e9dca64ff045ee5065a9c9e3c | ORPH
  mips64el   |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/4e14f0a1a39a2c20dc47f0868ab9e4f641b01b4b |     
   mipsel    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/f95e8cb04c028113181844b4927f48fe325a4d91 |     
 aarch64_be  |           lxc-5.0.3            | NOK | https://autobuild.buildroot.org/results/60c86d7aa1a49bd9a3aa8dda25f1afc6b7c7e08c |     
  powerpc    |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/d575b4a077e7ed1d1935a0090b6b3695a319c760 |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/b80f3511a3050210c0953a82b982c3a9e40895a8 |     
   sparc     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/083f3812c1cb9d9e84e4c75b1d91a08eb67f29ad |     
  powerpc    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/0be3c8a867a603c27822257a8d6261d7055f3f66 |     
    arc      |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/a871a2ca38b21d9b8e19058643771540347bd47b |     
    arc      |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/804404cfa59c7da9fe90ba34e8276d42c39f8f21 | ORPH
 powerpc64   |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/db87eca7a633afe18390e4be200959b19b811e39 | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/844d0a8342f896ac90451174ffb18fec913f8345 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/06d99524059b6e4c61917c7afc27206317125e5a |     
   sparc     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/2d4f1899b2f3449cc48bdce8b3942a77f0d41254 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

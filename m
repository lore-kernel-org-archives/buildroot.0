Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6083CD4A5F4
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 06:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D278A8061E;
	Sun, 18 Jan 2026 06:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQMHDxX2Izb5; Sun, 18 Jan 2026 06:24:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AC74805FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768717464;
	bh=WBG3l5IOafX9WRscE76o49NaMP1ODWAVcF+ObqOK5T0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NSj3/F8tUD36DqMhbMFcleD7vzaOk5jj+V426Va+FbE/uCRkHyoMq31NwQ/654QFo
	 cwlhlkCIFevtnG0ubs1NvyuCEN2phje0hXw91/ubFDuKHUx8LA/xsR1rWs31+avd9F
	 Xpt3b1tWxgno5UB4JTB0TEyvTQGpmN3nWEnPo2ZuLaX4fwBdmMim6XS4wwC4pYRd1P
	 b99nExdUurf92VOeQnSDnNSWXAIMQj3JFmwu2Gr1BrLq1TRcVYToZ57TipwPAKZmcK
	 2BMxXYFGFImFQCGR7umZaa6VUrkUeU+XpxHIJ9kiXXRRwcxIJCC28L9sb9FMeP7+A2
	 Zln8lxlO0ynsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AC74805FB;
	Sun, 18 Jan 2026 06:24:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88C0D2CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 06:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E8C8805F9
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 06:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oN7IaYpuqYn for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 06:24:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FABD805A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FABD805A8
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FABD805A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 06:24:20 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b876c0d5318so458384966b.0
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 22:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768717458; x=1769322258;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYJYVk4a0enDW903ApsztUT2hoWzun1Zeyrnsf63OWc=;
 b=UzL03AUKd6nh4WxAVngM6/uh3e9SqG27NECoJpf/FKabHL9dVKo6VYhQIZ21tZOAYK
 IoojYTd5xKqahJV67+MpDnUQWzIEK/RVJhouQqq1bvENRFcJC1y20EfuINTzUEezN3xF
 UFbF+6xew1YTlGoE7wrgJKs1EgUmVyVoiqVDrR7DXrHxoZmE4kzARFF8XAQ36DVPXeW2
 3W9nBn4ufmFY/6c7oL7txnTCa6nF/nP47/KY/oCBN0PhM0LNM6dX6pxRAJmong+lGPi8
 TuakbzFeSNguSOeoMJLb+1OGsdfW7qBZ6mSDRIgPZTy4AZE1gAnXEG+SNk0DyJot3BP0
 dnRw==
X-Gm-Message-State: AOJu0YzVohwCKwZy+EIiKL630AfIltT2+PHnENdgGY9F17Zauhv0PXBb
 3wyf5emwpIIHkelxJkkzoH6oklyWfQ49zbYCszCa3WLvbcz8Vo5RIe73/DKvtw==
X-Gm-Gg: AY/fxX4fe8a8kIKVg4JFntb29uXFD54UQCuVjcOBcRLzMos5GKiNzoXqfcSfyyOmG4/
 /OfLUhBqbNpYb8TGTX+AbeYqGltR7VBCPBsGPvB3M0FokP4KDjj2aYA020SNr9SbGAogywjDSRp
 /XY/5nn5cccqqchRpN9GxFNZyZFDoG1t1VdBEnGRAKwX6tCu26CgW3TkvaFKlsW1Tiep6inUl0E
 qfszi4WsJy7Ou7iPlTc5W2gqrIPquFvUU0CahYeEgvIwRhn8uzago0B+zf9buclG7hm0EAx2NNA
 MMYKMLZWmkWWCQENF6+dbgj/nYoppXokNDgiQqkYV7NJX6CLhksSpPOsAJrehFdjPLSoG49YYN/
 Jj49FfSJrqiT3ikcNFoX53Ctc9ccFGcDErDozcLOk5vB+rTuD16mgq7TQR3pCIVmkuwkUpPkvqG
 4qI9Ijujk2wqNF5Ss0RQ==
X-Received: by 2002:a05:6000:420b:b0:431:1d4:3a71 with SMTP id
 ffacd0b85a97d-4356999b509mr10403786f8f.27.1768710150032; 
 Sat, 17 Jan 2026 20:22:30 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356997e79asm14906183f8f.33.2026.01.17.20.22.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jan 2026 20:22:29 -0800 (PST)
Message-ID: <696c6005.df0a0220.157824.49ec@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 18 Jan 2026 04:22:29 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768717458; x=1769322258; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IYJYVk4a0enDW903ApsztUT2hoWzun1Zeyrnsf63OWc=;
 b=gqJLQ4jK2y/OJja/eHG/gNyrEj4tFDIKEvjajTif97i2zfFXoRglI1iI6J73Zewz39
 D8cGMG6EK7sDkTgL9ekBlxSlqpvWzMMMQO53+6YPrcbsJLKAmBFi5c8/UEz0M7dD4DpR
 4bJw0Kbf2QkgB8KAtyuuuZeKbITPE8iMPLuilUdtDKBmMy8tZQ1XDlDMC9qPfHzPojEI
 pBsO2i+0AitwaSjg06G1M+9GFXmYrUIuz47rUBQi3ISZIGeDWxwIbmnwvJlgLzPlgSmM
 r01q/bh2xJMpCHncHML4itw9euqDyba8VwvgmdVPErRRlpRQXsKwvvaK0MJi2E7ihKyu
 wB8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gqJLQ4jK
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-17
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

Autobuild statistics for 2026-01-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 18  | 27  |  0  | 45  |
  2025.11.x  |  6  | 13  |  0  | 19  |
    master   | 49  | 122 |  1  | 172 |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 8 
                       unknown | 8 
                 jasper-2.0.33 | 7 
ustream-ssl-5a81c108d20e247... | 6 
        ltp-testsuite-20250930 | 5 
                    mpir-3.0.0 | 5 
             dahdi-linux-3.3.0 | 4 
              execline-2.9.6.1 | 3 
             igt-gpu-tools-2.3 | 3 
              libopenssl-3.6.0 | 3 
     libphidget-2.1.9.20190409 | 3 
                openobex-1.7.2 | 3 
                openssh-10.2p1 | 3 
cegui-e7a03afc70c6182a091ff... | 2 
  gobject-introspection-1.84.0 | 2 
             libgphoto2-2.5.33 | 2 
               linux-pam-1.6.1 | 2 
                       mrp-1.2 | 2 
                netdata-1.37.1 | 2 
                   perl-5.42.0 | 2 
               asterisk-22.5.2 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                   bird-2.15.1 | 1 
                  bitcoin-30.2 | 1 
               bpftrace-0.24.2 | 1 
                  broot-1.54.0 | 1 
                  cairo-1.18.4 | 1 
                 dc3dd-7.2.641 | 1 
                    dpdk-25.11 | 1 
              e2fsprogs-1.47.3 | 1 
                easydbus-0.1.0 | 1 
                enscript-1.6.6 | 1 
              fftw-quad-3.3.10 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                        gnutls | 1 
                   gvfs-1.57.2 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-15.2 | 1 
              host-grpc-1.66.1 | 1 
                   i2pd-2.58.0 | 1 
                  ifplugd-0.28 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                 libcddb-1.3.2 | 1 
   libcdio-paranoia-10.2+2.0.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
                libressl-3.9.2 | 1 
                libsoup3-3.6.5 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                  linux-6.18.5 | 1 
                  linuxptp-4.4 | 1 
                    mcelog-194 | 1 
                  nginx-1.26.3 | 1 
               nushell-0.108.0 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               pulseaudio-17.0 | 1 
           python-brotli-1.2.0 | 1 
                statserial-1.1 | 1 
             stress-ng-0.20.00 | 1 
             tpm-tools-1.3.9.1 | 1 
                tpm2-tss-4.1.3 | 1 
uhttpd-15346de8d3ba42200249... | 1 
             util-linux-2.41.3 | 1 
            vorbis-tools-1.4.3 | 1 
                 xenomai-3.2.5 | 1 
               xinetd-2.3.15.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/acec30ffcc4a023582e231bb919156fc220ef249 |     
 microblaze  | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/a776173e3b5d667d04e3a40e827f038f38eff128 |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/d4199e97672317667e9c3bad62c12b0d47bfa5f7 |     
   s390x     |          bitcoin-30.2          | NOK | https://autobuild.buildroot.org/results/c5387ac961017331f8c8495dc11ff86d6532c420 |     
   x86_64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/53223f81ef4b05dd36c22b23b6d20327c76a8df1 |     
    i686     |          broot-1.54.0          | NOK | https://autobuild.buildroot.org/results/52bdfc340cf2feaf597375b89852f9fa5e7e2350 |     
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/d9efe80554f158d4eb44549401100a505adb3458 |     
 aarch64_be  | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/be6b8bda1b1a1834afb274b5c5b4ea4f058a538b | ORPH
microblazeel | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/683b723054ecc5fa90dbfffdc5f47fa80ae7d422 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2e1907868be9d6f833e064c5d413a04129614d6a | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4e23b009ec9ffb9266bccd0d04c7534fd2a21390 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0a14fbaa146571350b43c41921a6616c2c9bc442 | ORPH
  powerpc    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/eaec12337c40533ffe7d1dd71ff9e026c169299a | ORPH
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/d6336f429a06588914dc5a8cce6a3facc5f54ff1 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/ffaf083a9736b5848a594e618e2dedcc5ea60d01 |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/4d31dfafa7d186dcfa2b50d93d3b192fb92edf26 |     
   mips64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/5eab3f45d5667db7991f17364f459b758e1a4388 |     
  mips64el   |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/2a61238cf64f1ad5a0dfcec3198110ba2aab0b6a |     
  aarch64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/0ae7b47d992a51d1fdfa5d6266ac9949403fd6e3 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/46e47239a3c80549fbf89c0f12c31cd338dd434b |     
    or1k     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/7719c55b30084d75b13da3e6a5e7dc493bca1be2 |     
   s390x     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2ee9544ccd8107ab5549b1bacbb20b825fede027 | ORPH
   x86_64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/3295c55da7350d66ecb4a7aeabf74e7a4639bb99 |     
    or1k     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/36326de8b95e2dd2a82490c49f760a3a8213e5a4 | ORPH
 powerpc64   |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/5e5c468c657a402befec13e3b7abf6423ccfeb37 |     
  aarch64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/de2025886cf512744f4333257fd346689a1c21ad | ORPH
    or1k     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/1b918d0bfa23c09e81a4e65cdc16f46d738fdbbd |     
 aarch64_be  |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/bc7d197c6e7fbf390ba56fb0e5eefd31943a0942 |     
   x86_64    |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/5626d5d1326b58d5f09c802dcd5928c0a04f42f4 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/e20de6550866aefd063f966689234708bf8dcb11 | ORPH
    arm      | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/4d86e429b40ed96b305d63ddaa3bdab0d8ebb5a1 |     
powerpc64le  |             gnutls             | TIM | https://autobuild.buildroot.org/results/7b8eb77d0f1f9467ffd0c149d81ac4f40c01cee0 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b2baaabf3907891b323bf0090b0e371a1161e732 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/63e1eb42bc544834570a2c12e3548bfd078e13e5 | ORPH
  powerpc    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/b795e5b2d0495cd0e27be7ade0a0fb0e3897f05c | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/79f7e22fe9eecbb709fd89136f74082ecf9b8849 |     
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4ed508b4d5162eee480303b34acfcd33cc472375 | ORPH
powerpc64le  |        host-grpc-1.66.1        | NOK | https://autobuild.buildroot.org/results/6d156bb283813d8dc5dfea43c69278f962c08a94 |     
    or1k     |          i2pd-2.58.0           | NOK | https://autobuild.buildroot.org/results/80d2a978210ac81e811ba41f9b7ee8e0fd8de7c8 |     
   mipsel    |          ifplugd-0.28          | NOK | https://autobuild.buildroot.org/results/6c5ff6d042aa151bdeb5b4495a709b41e7c3cac8 | ORPH
    sh4      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/be5b64eb0227ac4a260feb7cb6455e2e552c1ff0 |     
   armeb     |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/6de1e389780b2a838d8bc3f083de352fe16e6da3 |     
 aarch64_be  |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/7474ba853d11b6901e743df1c5973e4817e49791 |     
    mips     |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/7f0d76de683eba4cc1dff7431837bfefe3aba3e5 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/234916ebba4d3717d76689c0241a50a679c94e33 |     
    m68k     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/6f5b4a559b1f6f084923840c05aac0039d4c8510 |     
   sh4eb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/8963e8c05ebbe6bd4b66e46ad3f8e633a90273d9 |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/7e8a21fe0a8325dfdd9c968504a06110c22ed79e |     
  riscv64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/f56856632a9fd28b6d4ed597f669d83742d94993 |     
   x86_64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/747e29ae96f13ca65d05b5b1600b7f9158e8090e |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/6b085c227c03d5355dcd9e0e03652273d47ba513 |     
  mips64el   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/1ca8c9e2c53215764f4c46103605a0a7d4ace292 |     
   sparc     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/e0cf03c0cd2e494c7b1d0cd8051cd0575d79337d |     
   s390x     |  libcdio-paranoia-10.2+2.0.1   | NOK | https://autobuild.buildroot.org/results/dbdb4f386a417f7467b66036e661e77d04b82431 |     
 aarch64_be  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/fbda26c98d8f95194777c41a6502c2f00e945805 | ORPH
  sparc64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/2028a9ec1a7cb065f69154b15a7fabe55e0e12c9 |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/d505aed54b7080a874ce8d02c3ed9f5c1741dd29 |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/cc8f1d4e7a84395375248cad4eed8c3f2d6f7ed4 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/fa9c225353f5ec0589ba2876e9a9561e217ee447 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/8840a0a4954c4c5cad205b35279364c1da790061 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/4e479ae2acdbf67ac658bc066bdb208046eb86ad | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/db62eca0aa56674b08302593bf398a0e7164902f |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/bfa4913cd1304829283463302270a5478fe099e2 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a46dc26a8b72af9c20afc7fe998c87323931236b |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/82499697e77f1cc9335ce4c3d030f64c29be96c0 | ORPH
    or1k     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/a2be166c26e17222d96666b39ff7f20ce5dd3428 |     
    mips     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/3d5d2f57918134007796d2c8c9e7952d80ef5b14 | ORPH
   x86_64    |          linux-6.18.5          | NOK | https://autobuild.buildroot.org/results/5bf06ba49cfdf9977cbfd604bd0e3db6dc7c3bec | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/e962ef2bc83674949f4c3c9d062b7cf4c97bd67d | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5a162f996a99e5de32ca171c018ec94f71e4463b | ORPH
  riscv32    |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/9dcff5b100cccc878cc8aa0f32f58ceae0c6cba9 |     
   sh4eb     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/c554aad8b61ee28d071d1b8ccf79bd6656c8d9c9 |     
    arm      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/6274b5a34c67a7934f0de550a1b659e49e6a2dc4 |     
 microblaze  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/3a747b1c752b3ebb96052e61a72422bdc8bc6baa |     
 aarch64_be  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/00e811b8387d3d5d82d9aabe956bf58698c7d511 |     
    arc      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/ab469e5696c2813f67895c2cba11058428cece07 |     
   x86_64    |           mcelog-194           | NOK | https://autobuild.buildroot.org/results/9020e4fda8cbc4f9886d5e8725f6df8d99716241 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c5ff086ce3dd2b7229750d5274a2c9538b969e2b |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e038aef92c10abeffadaa1bf055bc67fc8f2149b |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d45b7b15161efa9f3cb7981e7b1438d6b73e529b |     
  aarch64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/dce0b2af3a0e36098dc07386afe1d29e9be7fda2 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/aa3b94633b2b0171533cbdc3d400fc39ee1f233a |     
microblazeel |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/3214e4e94c4f9527bf05b759c087206a3854fcad |     
  sparc64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/bfc42bf205bd9ba806713bceab7b64f47f0dc5b7 |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/5be60a111ce329d4361ec054d8c6353068342800 |     
    mips     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/4b85b5e522e57846cf26f62f50c9840ff807c298 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/e0e8df4144eca69897bbbfa2eef6abebf36d74ac | ORPH
   x86_64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/267cfe326d0cd96bab55abed6996a6f51066932b | ORPH
powerpc64le  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/7bd4a665187c6e8143406897232a12a9a6b50326 | ORPH
   sparc     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/ba3d6f94ad824b1ed335fcf069c59c0afa7d7c71 | ORPH
  mips64el   |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/2589f75f7415cd1a2fd7cf83c6166c900b03cce0 | ORPH
 powerpc64   |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/39a4978cbee819bffd7eacc96c5a1b9c90ba3ea7 | ORPH
  sparc64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/a68220d9dc1d366bc3acfebfdcf1a7f60ee03006 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/045853288edb931c6861b74a62a4ce04b34900d4 | ORPH
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/c703367715e57b2617d64b4ccf4de6fc9727330c | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/e1c70023b90f26fb89e8ca0fe3fe859217e80ad5 | ORPH
microblazeel |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/ec130fe5c37ae9d4188b4f9b171e0ea33a9bc2fb |     
 microblaze  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/762b2f1dd215a3825389dce8c48d411ad5366ed1 |     
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2abfbe1c0d8081de060289d90dcae8eabdda9d0f | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/e1150e434da4217d00595baa4e884ca3413c7b27 |     
    or1k     |         statserial-1.1         | NOK | https://autobuild.buildroot.org/results/603fc0a499281e558c17004331f50bd51ae4faed | ORPH
   s390x     |       stress-ng-0.20.00        | NOK | https://autobuild.buildroot.org/results/e771a08639b61f84f766e2a3359e62b278322bab |     
   sh4aeb    |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/8f35c5871803afe80eda78b196faa1ce5a898890 |     
   sparc     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/ac33da90e8d75fce849e2c78b059e1a8e4530925 | ORPH
    or1k     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/3cd45bde3523f95ec63d7401f800eae26a2fb785 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/6f46e000f8565fc2f771b214413d4250341ff8f9 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/298515a3f19b17370f8f082d386db31ea26dca0f |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6924d27f4c53352dcecbed1d4129200e9489a14c |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4e3aa63778bb75fcff477f575b78e9904d5c21c3 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4fba380157b445f2b2a7c0be26a3f73c5aedcea6 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/1b223dee59a7a2a4079bb6b7f638f1bd4ca47f91 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/61315dd81dcf283005d150c29bec2baf00748066 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/3269b28c82077c8d6713299bc83043f8c3c710d7 |     
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/46fcd3b9514281101a89149ddc46fea4e313f3dd | ORPH
  powerpc    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d0b1b98fafd1cb8f527aa67c78d2189825225ffa | ORPH
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/284ea5d3afa7eeed5077c1f24fb90f29078bc4f4 | ORPH
  sparc64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/337e0d4b0be98ce6242dbc946096a8a2d3e3bff0 | ORPH
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/39733cc5913aa25190689d8db9a92786810b3b57 | ORPH
  riscv64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/e27e9e6f2700d054da3fae06c66dfd9d4315e507 | ORPH
    arm      |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/f6effa2b27e3b0aa482f899593afc3a3e7e6b518 |     
    arc      |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/e7555b0f6acb4f2eb44cb3a3afc2c2c045edc39b | ORPH
microblazeel |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/840809434d768b1b786152758620238d5a504c08 |     
    mips     |        xinetd-2.3.15.4         | NOK | https://autobuild.buildroot.org/results/4db625d395f38636b67adbbf6286c6c9da155f62 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

             berkeleydb-5.3.28 | 1 
           dmraid-1.0.0.rc16-3 | 1 
            erofs-utils-1.8.10 | 1 
            gdk-pixbuf-2.42.12 | 1 
              host-rust-1.88.0 | 1 
                libdrm-2.4.129 | 1 
                  libnids-1.26 | 1 
     libphidget-2.1.9.20190409 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250530 | 1 
      passt-2025_06_11.0293c6f | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/cb74321d382923752d099cc7da72cc45b8147ca2 | ORPH
  aarch64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/6068120613c0e1e0ec9cf7176e868a841c2240eb |     
  powerpc    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/37a39fbf89ea9a7229dff086e8f5437566a6d734 |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d908673581784a81c122bdef468aa652bce9ce78 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/c0acebfad84ef668ba716eb8710870b0d5162fa5 |     
   sparc     |         libdrm-2.4.129         | NOK | https://autobuild.buildroot.org/results/380e9fa333f5128d3d9b8a6bfa3948d518602c94 |     
   sparc     |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/0b600a7655e9506d7830b4c2448cf02412095b2a |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/29b5f7af35d16c5bbbba67df2b73b0539d4932b1 |     
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b3701ce3f6373c16d1765409fa2ce69a054cbbba | ORPH
    sh4      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/2ab0659dd3880328dcdf8faec5fbe98613cc5da9 |     
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/18b6b34a74ed19904cb3d74e421d5af8ccd04083 | ORPH
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/acffbe00060076ea96e5931a5475e69bdd4fc65a |     
 microblaze  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/db478bbb51878009b05d6215138ee46a9e9fd45d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 9 
                libselinux-3.7 | 5 
  gobject-introspection-1.82.0 | 2 
                    brltty-6.6 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  iozone-3.508 | 1 
                 logsurfer-1.8 | 1 
             ntfs-3g-2022.10.3 | 1 
                     nvme-1.12 | 1 
                 openssh-9.9p2 | 1 
                openswan-3.0.0 | 1 
               qt5opcua-5.15.2 | 1 
                  rp-pppoe-4.0 | 1 
               syslog-ng-4.8.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/eb3e8a65c01a5ef776d7320a9b5da7e5ff9138c7 |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3fe11c524017081dc6c6391bd31e72b3b694b269 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/595b06d32b648e7e65d72ecbf89ab7a3ee6c10a4 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f906ff85bd018af0640b65fafff93fc65f24ce4c | ORPH
   mipsel    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/6e2f6e0544568d3b8d6a5eff393dbc2409ff57a0 |     
   xtensa    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/4ef1e1bffe9ff714b175fff2e5c16faeb57644b7 |     
 aarch64_be  |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/74485b9d88dc3b63eabdcbad143d15109b8a7ef2 |     
    m68k     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/286f248e5b50563e153d7dccb06b98c25cf9cdb4 |     
  riscv64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/3d443aae1e4382ce2d1bb19b4f55f838719a590d |     
microblazeel |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/2d4035ca8545f079fddd6b16ceb48675bda82166 |     
   sparc     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/29c5dbc0367b0136126a16f0874cdf4c7cff1fb9 |     
   mipsel    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/4070ac60a6373531f6e531cff5219b3dd562cb93 |     
    or1k     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/e6ff2b9c85b92b240b39bad8dc40f2abc15e7b2d |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/4cb09d1474a086900b5195a34e1c8d496975a966 |     
powerpc64le  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/0aca2ead708ac6eef9d31ff9090f1f50e589c492 |     
    or1k     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/3ece65d0e370ed0705b688a2cf0df1a3ad8b5c58 |     
    sh4a     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/81dca66a3767b3e730abb31f2932cd50846e1c29 |     
    i686     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/f53940e75fdef786774a5fcb0fa7cbfb1475aa48 |     
   sparc     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/19fd49e8d0916d9acff4ff388882e739da9fa78c |     
    m68k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/bedfa82c3b3ac6fc603147150070e52d87e1655a |     
   x86_64    |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/15705c980f204f3ce3ad1888708521f2cc5b2537 | ORPH
   xtensa    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/aa1d0832dd71ac772c16053e2a78e97fce684f4f | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/17377ea5e62ffc3bca3785ad9bf2e68fc8ea4940 | ORPH
   mipsel    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/32be7edb0fd7e89cc75017e8848ebb808a1c39e2 | ORPH
microblazeel |        qt5opcua-5.15.2         | NOK | https://autobuild.buildroot.org/results/d2270d4f3cd54d036a20cfd0df556eac45e34a0d |     
    arc      |          rp-pppoe-4.0          | NOK | https://autobuild.buildroot.org/results/db9a6011b68288ec72c27cc234e95f5c6c41c323 | ORPH
 aarch64_be  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/b941b05e851c85415caa1195f17bec33bedeee80 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9193CCF9E9
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 04:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25AD340BEB;
	Wed, 29 Oct 2025 04:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zJ_rJcXKF6n; Wed, 29 Oct 2025 04:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF98C40BE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF98C40BE3;
	Wed, 29 Oct 2025 04:26:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FAD1708
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 04:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CB4040122
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 04:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZj2kLXq2YSE for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 04:26:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDD9040082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDD9040082
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDD9040082
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 04:26:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47721293fd3so726905e9.1
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 21:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761711999; x=1762316799;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y96OF1URdgWv6VkVPsi88rgpssCjhdtovWCtvfsDlCc=;
 b=qTyN09UOb2g9b7z1UGebImNu9DiB9yxDs5qe3xY6bvGPsl9l3l9P4yovuB+uOn+QXX
 tkG4UBeZcgYnWsQ+o21x37IvvFRcy+WovSWs6QoHuGwUxgrsHTIbJ139CjHlD/l3SxR7
 GghmjhscpOrGEp1BkALFkepaqNi52LM0w8JxvexkJozQ2vnioMNy7exPhme2JueioHYV
 83PHUeI+Yu1g0jRnCgGokh1aWcp6oG4vtRZ6EI1cha/FQyazXapxYRlnARU3PPEt+0r0
 gUNhpDcUN5RLGeOBnje1RFYIclU4BOrDS+pJ5uJN13QS8ZC12wgA9UAw6YF9gltv+EQv
 p+jA==
X-Gm-Message-State: AOJu0YySrMwTxjwTL/VVNM+Cwl7YinENHaV3eyr9xmTYrLuCzZmHPmri
 FukSVvMAEz1NUGLq2MxLwXxJEjG8dFT8lq5OkaXkfV1HVvQGnnnM96rUPGMvTA==
X-Gm-Gg: ASbGncsDq6VmB9zhrJTyRPV3z7/WYo8VqwJGWjVwLNCa4wFkwh5uE9imGWyou2SShqw
 AkRVPfhdsutmg7tQZj6ow06GBqdpw1NMwPyA9/jVuks5+3UkgckwXDlWhNYM9eO2n9fEaXGAriM
 LXPoRjKANDcUWBD3rMyIvxU8/XkNmkbRlqEnoLJxEL0VboTe75bqOzpIAYXOQMb5BLGTYdRHsd/
 /g+ZqwefCuCTl37Y5/vtQi6IMKDaiW+IuZnC5pNwknPaoo9M7ASnTvgF3bWR81Gntc5Y09pprx6
 qm3/+CW0K61UETmEN62G4Zf9FlXMAW/2Cyl1fsFq4bgnRWXRPD/6XyWkAH0BW/XVFC2T9/kR8On
 xxprJo8mVMkCBkyTg8Cx/JnibYsLSPWj3LA2kfTuR6LsQtVef22hB6s4I5kM1viaVeMCQ6Bk1XN
 gM3cSErSE=
X-Google-Smtp-Source: AGHT+IGc7S2vM5v7fl5m6bBPe43nt5AwaUiJV1GkGMzlhAoln+wJe7nZwPZBQM5izEmaekuYKCnpZg==
X-Received: by 2002:a05:600c:4e8d:b0:475:d9de:952e with SMTP id
 5b1f17b1804b1-4771e5da9f3mr11706685e9.1.1761711998536; 
 Tue, 28 Oct 2025 21:26:38 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718b66df1sm36758945e9.0.2025.10.28.21.26.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 21:26:38 -0700 (PDT)
Message-ID: <6901977e.050a0220.181a7.979a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 29 Oct 2025 04:26:38 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761711999; x=1762316799; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=y96OF1URdgWv6VkVPsi88rgpssCjhdtovWCtvfsDlCc=;
 b=lZo4CGvp60IENNADpzRbD4kGzxew8mZ6Zw0CDzY+a60oPLzqhfdX+suOn4f04PONVH
 pnJkPepou7RJ/i7I7lpHzhn7qjU8ihAVHwrfgx61eZ43ru3SdhFqtw9Po+SMWDtYR8pD
 Zo8qGdEKWgiSSbJOl4PQib6Fpva/FTQvCFfHKPgx9nqW5IJhAWNC6qAMM08uEig3rhU0
 QeA6EnWfxf7XKgNJw7HkcAnfNuI9eQ/dj0oOjSTBqgnmCl/qQCudv/g6RQNUNEVw9WVX
 MDUe+1HlZoo3GS4NhVAZMi75ZbXys4tOkHiOswtIf8N45+tk4bvj/CRvVO1zdLR58vM1
 k59g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lZo4CGvp
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-28
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

Autobuild statistics for 2025-10-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  4  |  0  | 12  |
  2025.05.x  |  1  |  1  |  0  |  2  |
  2025.08.x  |  1  |  5  |  0  |  6  |
    master   | 37  | 86  |  0  | 123 |

Classification of failures by reason for master
-----------------------------------------------

                   libiio-0.26 | 6 
                   perl-5.40.2 | 6 
             dahdi-linux-3.3.0 | 3 
           host-openocd-0.12.0 | 3 
                openocd-0.12.0 | 3 
                       unknown | 3 
                   cvs-1.12.13 | 2 
                    dust-1.2.3 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-15.2 | 2 
              host-guile-3.0.9 | 2 
     libphidget-2.1.9.20190409 | 2 
                  libsvg-0.1.4 | 2 
                openswan-3.0.0 | 2 
             strongswan-5.9.14 | 2 
             util-linux-2.41.1 | 2 
                 agentpp-4.6.1 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                 apache-2.4.65 | 1 
               asterisk-22.3.0 | 1 
               bctoolbox-4.4.8 | 1 
                 civetweb-1.16 | 1 
          cloudflared-2025.8.1 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
               dvbsnoop-1.4.50 | 1 
                espflash-4.0.1 | 1 
                 expect-5.45.4 | 1 
                      fio-3.41 | 1 
                    gcr-3.40.0 | 1 
                 gerbera-2.4.1 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-rust-1.88.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                libdrm-2.4.127 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libiconv-1.15 | 1 
                  libnss-3.117 | 1 
              libopenssl-3.6.0 | 1 
                libroxml-3.0.2 | 1 
                  linux-6.17.5 | 1 
            makedumpfile-1.7.5 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
                  ntpsec-1.2.3 | 1 
                opencv3-3.4.20 | 1 
          perl-net-ssleay-1.94 | 1 
                pocketpy-2.1.3 | 1 
           python-bcrypt-4.2.1 | 1 
                python3-3.13.9 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                safeclib-3.7.1 | 1 
                setserial-2.17 | 1 
               syslog-ng-4.8.3 | 1 
                systemd-257.10 | 1 
               trousers-0.3.15 | 1 
vexpress-firmware-901f81977... | 1 
   xserver_xorg-server-21.1.18 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/5022ed7fa16e5f777e5f3bb05ec10d64e179fe09 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/ef36d0bb6f061d00e78eda3cec1505b287807e2c | ORPH
loongarch64  |         apache-2.4.65          | NOK | https://autobuild.buildroot.org/results/dd412e79a4e4da7a0fc26b79ceccedd45add8ee0 |     
    i586     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/9c870b367961a541ab0840f5c51c04391357f5b7 |     
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7c39b4dd7b4ea6c8381d9e4517e0488c99f6208b | ORPH
   arceb     |         civetweb-1.16          | NOK | https://autobuild.buildroot.org/results/5a69c38e949629bd3b714212f9249953c06c5a90 | ORPH
    arm      |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/d1459a8e4a8580f93570ed08734c06f33496ad78 |     
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e64f9c8882adc96437deb53fd8f09f4650e2e3ad | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f2ab566b436b4ccd46525db25c3506bb36c4e4db | ORPH
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9b093a2662a65a50dea4803ecbaf126e7e5c5dbf | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1d95b7d10b738b38f47f0921ecab1e08f5c69541 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/65d3f0edfd35faa0f7b883465f0f1a03325f8f84 | ORPH
    sh4      | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/c467c114124e0cff7091c51a41ba29bf9f96f198 | ORPH
  aarch64    |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/c9ff89a766cff8b2a3e33a48f5e62e12e9a2edd4 | ORPH
 powerpc64   |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/df285d7e72c8de0e3e36b3bd990387da88c1f902 | ORPH
    arc      |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/4e9ab0051de3e7b2ed1b2a8b11af401d37313bbe |     
 powerpc64   |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/05bb934574ddb6ff6cbf550c9c143f9a54704b1f |     
microblazeel |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/2a53a80d92c0071c23280f90a402fdca2ed9966e | ORPH
    mips     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/d1347a066cc4175ae7fcae0ad2dcb235ae11a5da |     
   x86_64    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/2682600a56fcfc2a25e67cd56a831731ba82d982 | ORPH
   s390x     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/f1a70f69de66a5b0f5e870849e0c6b463ed9928f |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1869b963b326ef619a16fcadef49232215951636 | ORPH
    or1k     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/90fbb56768dc339e06cbc8f78b952a453f20b6f8 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/67c9d9a8cfaab46224d5dc331df7ab0e67f193a4 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6b094639c4cdcd281269739bac28b93a3a8a9dcd | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/269cb228871b67a9a0d30f54cd95d1fd151d6ce7 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/d0342e3ee454e55948581143f076b7d2820c75c2 |     
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/4a315b061aebd02086ad1a82ac1201bc1aebdde0 |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/2ced6012c8863cb2257e5cc58365328a364bc249 |     
loongarch64  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/2c8497dc71934ce1df77fd681f8b0cac519819b3 | ORPH
   armeb     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/4b7d599ab1ee5a1285094a3f803ad3f5e25540ba | ORPH
 microblaze  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/43eb45be2f73aabc10f2d6b051631a60db2e0b4d | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/4a0bc2dc94c08d396c3a8fbbeff5486987652bb2 |     
  mips64el   | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/82d4cb113198d6a7f5db41730a5f562d85b96e2b |     
   sparc     |         libdrm-2.4.127         | NOK | https://autobuild.buildroot.org/results/f75532a0b888874a211a2ff5460ba60bf672a8ab |     
   xtensa    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/84ece0a01f6cef8f6566019792081b2144d7522f |     
   mipsel    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/3ea18299dfbcb2acc3b35a22597619838c3ff472 | ORPH
  aarch64    |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/f6229f223ad6cc9ff82bc816f9b2293fcd236ff5 |     
   s390x     |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/6cdd5de372a10fb0f9358ba8dcfc71cc61ecde27 |     
    mips     |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/3a0f332bf856c299cb229d4288b36d3d65c4acb3 |     
  riscv32    |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/36c391f633d8a5ac7d0460d768ac57b833c88343 |     
  mips64el   |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/a415bf95dacf2c2c5011c9a6fe3b9a88be87dbd7 |     
  sparc64    |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/5c3d83f6c6ab1cc2aa51aab2f380aa3718d35ae4 |     
  powerpc    |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/a29b02ef8d22a457977120855def984a4df450a7 |     
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/8b9441349de19d70223fcda6330707fb71aea72d | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/dd9dddfc9ebf09d983942ea4ae195ed2be538f2b |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c0154fc24172b9b0b7fc1df37fff7c6c950c50bc |     
powerpc64le  |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/a6332cf616c8543a7667efc6aed72a4f6a2443ee |     
    or1k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/0df7f00d6f5f94e59d05fa00614bf5d2c0350720 |     
  mips64el   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e5a43d613ab19d0a39337ddad25eac61cccc4257 |     
    m68k     |          linux-6.17.5          | NOK | https://autobuild.buildroot.org/results/2bbc6b254d69e74b4b2ecfc02bfff7b84fa5e918 | ORPH
    i686     |       makedumpfile-1.7.5       | NOK | https://autobuild.buildroot.org/results/8f06b8f81394a04edbbe89151f2bd6003d279163 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/cc0fe4cca9e93a6f2ad1357c3dd499381f6ea536 |     
    sh4a     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/a9e0da27728d3e1519cff869d3f1ba8f7888d7f8 |     
    i686     |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/8f432f9abc8da82106bddcf1a349da5002d82de2 | ORPH
powerpc64le  |         opencv3-3.4.20         | NOK | https://autobuild.buildroot.org/results/a06b3b203f81c83487ecf97a9a1a58a7d88f04dc | ORPH
   x86_64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/64664c786dc77dfd2f93aa7fadc80416921f726a | ORPH
 aarch64_be  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/b03395c8d83a5f45a07ed021d68f9397da438066 | ORPH
powerpc64le  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/c6065b3bc1090905604aba775ce59d2d89d0ed2b | ORPH
    m68k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/751f132c68f63495d9cbe5c1b0cc48641b2f5f1a | ORPH
   arceb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/b0591ba661a6bf3e69c201dfd15909c2c9ed7aba | ORPH
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/06adc3f683add7695733923d3342ed8d31519b3c |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e0de72728a0004200ece4357ab33cd3189659575 |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/52ac373ccdba5ab4b863f615e54b0a2fa4569979 |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a3eb9a65eea1e565f63c69c779fa3d9824234ec0 |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/14f9e580729d27ab35daf2aee62e7ce93041e735 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c70809e6e6299cadbaf3dea22bff7d7bc0634a8e |     
    or1k     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/a72937eb6d707bee5d7e1164f050e4e75783bd46 |     
 aarch64_be  |         pocketpy-2.1.3         | NOK | https://autobuild.buildroot.org/results/8df1f4b5a229c6285ba27473c6fe6eaca2442625 |     
 powerpc64   |      python-bcrypt-4.2.1       | NOK | https://autobuild.buildroot.org/results/7380643e600f0e44593fa5fd9ea67c7020db67ac |     
    arc      |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/d236aaa863114ad741a31d8165bd34704c084b41 |     
  powerpc    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/72d38e7c9a98f9d2e53fa6c40d86c722a2ef1c90 |     
   x86_64    |         safeclib-3.7.1         | NOK | https://autobuild.buildroot.org/results/4a632f319962e50c6ca6d4aa96dbf2923d3634c0 |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/802a008e7d4f2e6740c7b5690a21e96d0d7f7c52 | ORPH
   armeb     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/ee70a4683d2c69f84c6010b556a89c53f13b47d0 |     
microblazeel |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/b3a2921ddd5eb76a4f3e1bfaccbde616f05f5f23 |     
    or1k     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/46103eb22b95efbe9620f3d3744ea854a1c62bcb |     
  aarch64    |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/1aa03b706eef08c538e236bcf7a7feb38a12d0d7 |     
   arceb     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/6918db02d5579d62081d300cfe743a81b6e442dc |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f1f474e53f4cb64e475327ef9583b965e276ca17 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/9b02984607fd713a851dd10ab6e8ec62fb5ccb9a |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b522ae7b799ef0224da65dca2f02b8fcf0923408 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/c689e912fdf9959202c1ffeee9f4aef3295004f4 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/8b9834f35790181d4bbdbcb956abb765730f46e0 | ORPH
  aarch64    | vexpress-firmware-901f81977... | NOK | https://autobuild.buildroot.org/results/d464986ab3559fd2f325dcc619927817e84bf32d | ORPH
  mips64el   |  xserver_xorg-server-21.1.18   | NOK | https://autobuild.buildroot.org/results/94b1a33873ebe8bfbb8e6cc35417518f375b5847 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                   atop-2.11.1 | 1 
             drbd-utils-9.21.4 | 1 
     libphidget-2.1.9.20190409 | 1 
              skalibs-2.14.3.0 | 1 
                       unknown | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |          atop-2.11.1           | NOK | https://autobuild.buildroot.org/results/6aed96c321dea2644bc1a61a858fb2fa727bb4c6 |     
powerpc64le  |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/194bf7ffc7881a7dfa02b5b1f6bd2ebbdd4e7ad3 |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0cb59b6fadacdc38335214280147cf734a2edae6 |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/9f232341cd32b82e22f13b718a665f94551a1b0f |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a2783eebf24927a1d9bd47ff852ae53a24af761f |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libdrm-2.4.124 | 1 
                   linux-tools | 1 
          perl-net-ssleay-1.94 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/6808c93203e7890e0a6f60912e4b173e6bb22f8d |     
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/531dee328856740c99f4d1cb164a9e706ebf6fa1 | ORPH
    sh4a     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/4c487b08c1c50a3c60492cc5e58d02d71f112302 |     
    i686     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/2a68106486b533948b66adcbcee4f06787219d4d | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                petitboot-1.15 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/9c8649593a1538716f155f02462c7e4b3f2a0ecb |     


Gitlab CI results for 2025-10-28
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
             TestXenArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11871454648 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11856841295 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11856841189 |      
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/11856841178 |      
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/11856841174 |      
              TestOpenOCD | https://gitlab.com/buildroot.org/buildroot/-/jobs/11856841152 |      
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11856841148 |      
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/11856840944 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11856840940 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

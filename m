Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A45C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 04:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2832340DD4;
	Wed, 19 Feb 2025 04:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n3mD7_ydLsS; Wed, 19 Feb 2025 04:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25BDD40D85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25BDD40D85;
	Wed, 19 Feb 2025 04:14:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0993968
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 04:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFEFA8122B
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 04:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgOqgSpVoqDT for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 04:14:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3840181176
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3840181176
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3840181176
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 04:14:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5dee1626093so836342a12.1
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739938487; x=1740543287;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v4+Z+KvdYDa0Dt1WIHqPZ9zG/PRLArD+CRsWTP7i7l0=;
 b=B9szgoDZg1bSJwkMl/zMGJEvJuwBpt5rVFTlkJGMeVws/3WzkAZist6PF2b6mRmbq8
 JA1Z+j4Dm9H0Zomal/IV4TEkz8DYHB6+5/RCfzMcW60nwizMiW9pvqCr2733b1CwGM2j
 /WI7LPm/WJXM+lDoxua9P8Fl4x4C/mXW4+qM8jCEDYqUvSj4LgJG7VXnD8PIaTk+bXuz
 Frclsq0KuL0iSKvB/324QoQoUp/XXoPq2rroM3onTaZCBFNkTRqYaF5UaijKRMxdK4yQ
 g+tKUwVrdXJZttTfHyKh7K+cpmHiMXB3V1vq3rnkbnCXASwktI3g+5D/wdxq9A/oIzBt
 BURg==
X-Gm-Message-State: AOJu0YyANg3nEOgVrnbHPsvzfia6Lssb+rw9vB5A0YadAcIPtQPxT4Oy
 SQRtpPot7W4FE8iqjoXe6K9nHnAgMwQ5emRIXwbT6uzId0Quc74ROdWCGQ==
X-Gm-Gg: ASbGncv0rlJkSlCGaoLs9uGiEZZ7uSbEqcOQbke6rEDKl8EklIfZytzNALxuHzESgyR
 CJLndEpV+xelRtwEMOPtwaUQ1A8MsrMBeqhh2AYnW8kBze521gbSReHm4mVpCxoISfI+tA95vyX
 byXR61KlIM1jjHpNu/IbWDWB8gdLE3nQp8V1rhOwIuJk0H6M27wBeYL0b5dzSChUM6B0CejaTgp
 Vtgc5tKgvdbvfK51+X+DRUivy/HrUfIULOdtuQOJGZHDwLMYWKMn0Hab07jJIWqNZ5FbuqpB8l5
 FWP8T0HJuKRwOulW+5c=
X-Google-Smtp-Source: AGHT+IGUskfY9JyoLv4tN9vT/Wvx6HGLCkfgx4c5p93/EYC86wMFSMsph3gH7vP+cgIIYUnVyafvlw==
X-Received: by 2002:a17:907:c51b:b0:aba:e585:42fa with SMTP id
 a640c23a62f3a-abbcc5b9b76mr215171866b.5.1739938486873; 
 Tue, 18 Feb 2025 20:14:46 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb925bbb1fsm578593566b.70.2025.02.18.20.14.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 20:14:46 -0800 (PST)
Message-ID: <67b55ab6.170a0220.986fa.ee3b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 19 Feb 2025 04:14:46 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739938487; x=1740543287; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=v4+Z+KvdYDa0Dt1WIHqPZ9zG/PRLArD+CRsWTP7i7l0=;
 b=lplJyDAWP5WdnrSjNoj3IafxeeI7sC0Zf4QCTrbDVE6JK6mgX5a43ufL9fOUTKvolK
 l8bvLPq5e6Km4ASHhc+/41/I2ff4sa2pamsFw1rG3Y/4FlmrVuqJMsJut/W+sPy0hRoG
 uCEiVjuyStjVusHspV8T8pBh/+ToNmrJ+g8/xCbtIh+PcOBaTdk1O/gpxnnuf4gmVGHb
 Xw1fvzrL43E+jqexP/mrOOKG8baJJix6usESJHlahr/0e7i+FCJIFGXJosfI9PJBXRR+
 0C3gdYG/93E8SM1v/TAiVritd2b0cuttqS/zRsM2KlvwHjuA8kj9jcaTUprVC0+jpf0f
 aFrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lplJyDAW
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-18
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

Autobuild statistics for 2025-02-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  1  |  0  |  5  |
  2024.11.x  |  1  |  6  |  0  |  7  |
    master   | 14  | 76  |  0  | 90  |

Classification of failures by reason for master
-----------------------------------------------

            host-sqlite-3.49.0 | 5 
                elfutils-0.192 | 3 
          linux-5.10.162-cip24 | 3 
           oath-toolkit-2.6.12 | 3 
           at-spi2-core-2.50.0 | 2 
                    brltty-6.6 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
          host-nfs-utils-2.8.2 | 2 
    host-python-greenlet-3.1.1 | 2 
              host-rust-1.82.0 | 2 
           libzenoh-pico-1.1.0 | 2 
                 linux-6.12.13 | 2 
                  ntp-4.2.8p18 | 2 
                   bird-2.15.1 | 1 
             bluez5_utils-5.79 | 1 
                 c-ares-1.34.2 | 1 
                 cdrkit-1.1.11 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                 dc3dd-7.2.641 | 1 
                  ffmpeg-6.1.2 | 1 
             fontconfig-2.16.0 | 1 
            freeswitch-1.10.12 | 1 
                    gdal-3.8.2 | 1 
            gettext-gnu-0.22.4 | 1 
                   gvfs-1.48.1 | 1 
                 host-gdb-16.1 | 1 
                lesstif-0.95.2 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libesmtp-1.1.0 | 1 
                libglvnd-1.4.0 | 1 
                  libnss-3.107 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
                lmbench-3.0-a9 | 1 
mali-driver-d40c57d81c9cf4b... | 1 
                 mdevd-0.1.6.4 | 1 
          modem-manager-1.22.0 | 1 
                  nginx-1.26.3 | 1 
                    ngrep-1.47 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
              openconnect-9.12 | 1 
                 openssh-9.9p1 | 1 
                   perl-5.40.1 | 1 
               procps-ng-4.0.5 | 1 
pthreadpool-560c60d342a7607... | 1 
           python-bcrypt-4.2.1 | 1 
                     rauc-1.13 | 1 
       riemann-c-client-1.10.5 | 1 
                  rt-tests-2.8 | 1 
                  scrypt-1.3.2 | 1 
                 sqlite-3.49.0 | 1 
                       unknown | 1 
               valgrind-3.23.0 | 1 
                    which-2.21 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/678133efd491a5564b32402d8e722c9ed10ed191 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5d06a285710037dbc8af47cf73dc712c58960566 |     
   sparc     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/39cbd308598a8221f4b15b817ddce0ce11adc6f0 |     
    m68k     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/e9f516f6924784253b407624e4619b909545b5a3 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/23ed1107c1a0f5264b1c65a7a95fcd34cc73900f |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/24da13dc763cf69870cd72a3bcee633883e5c77b |     
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/de32944e033995a10d0d27c033b7f8c22b754a8c | ORPH
   arceb     |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/4cf02d9ad65ff5434d67d330227a3a872bbd1588 |     
    sh4      | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/039c0220425086e7851e49c46b8bf85dff3066eb | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2ebf82bfc6cb731ed81b426144a6b5893db5bb97 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/28cc24fd048d4e8317eb3a23a52a7bcd575aebb2 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4ca70ca82a2350959aed7fd5399ed634d7c40750 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cf51b1f22d0d256f62c0c01846644fc109a7acba | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e4c6fd401c307473056507d642c50f725609d579 |     
   mips64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/e11ee00542d021442fa80c4786c65700257aa711 | ORPH
   mips64    |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/3d674396cf363d172132a7ad7f8c16ad6db0a6ce |     
powerpc64le  |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/5f0d140c0c38c9bafcdca3689e230222e4b0ed6b |     
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/0c156ea8f53159597ba26e126cf677bd52a6d4b8 | ORPH
  riscv64    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/777e72b556663d40a3056a55b9dc3130a91cfc31 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/1d823e34fc29ce6a38833213e9c53b2ec736fa83 |     
   x86_64    |          gvfs-1.48.1           | NOK | https://autobuild.buildroot.org/results/a3eba4c2b8357cbd2794c7f6bcbf478d8280da76 | ORPH
   sh4aeb    |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/4c6d5f21f40eeee226d1bee6859a1c2540a8cdb6 | ORPH
powerpc64le  |      host-nfs-utils-2.8.2      | NOK | https://autobuild.buildroot.org/results/fed08f0d9b86481729f33a65a30fd8b5758a22f0 |     
   mipsel    |      host-nfs-utils-2.8.2      | NOK | https://autobuild.buildroot.org/results/1a81cb7c88a41a03767a1a201ee0628468f60766 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/762eebb0f07277d03402d1af5d8371a01ce978c4 |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/55ab126a557ce09d8958e9f51c755246acb5c3aa |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/a3d460437eb5e98117257ee09cef943b14f6f008 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/87f7f8b44d718c0a2672e70ca5e4b0399da41e8e |     
   mips64    |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/e94e6e0fba06ca1a089ef9583dfa539a48d08fe6 |     
microblazeel |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/7781ac2c035a0207f192054763ec2f995044f9ee |     
microblazeel |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/c1f2a71ccec890688949097c24858d4e7e249fa1 |     
    arm      |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/d4a086d651f78e263076705a024c149f573b04bc |     
   sh4eb     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/9a6c1c4ce2ca90ac2cbd2f335b0764148dac8a3c |     
   s390x     |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/8b36ea442f9566374c14399ef30d6083411f4fa5 | ORPH
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/40e02310c9891a4e2862b77cc7aec9e0b80e8b94 |     
   mipsel    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/f86e5b992914658a4de0aadb67f8c5b8aa94dbf4 | ORPH
  powerpc    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/869bb8268a680e4b2ecb36dc67dc39fb44acc03e | ORPH
   x86_64    |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/a1d4c77bd8c8d181ab3d899fdb4cc0fd6b4f554d |     
microblazeel |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/b6af69a068abc3a9f39419d49045822db9e0e6b3 |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/30ec336071f7130c6cbdcf5617773f734b8eb17f |     
 powerpc64   |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/2c36bf261529cc72c75f7a1afe918ac962d27a59 |     
 aarch64_be  |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/5f24ec086809f6448bdcb1881e462fac9739063d |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/aeee0c4a9d8e90ae3389e9e7d486bbf152b5de2f | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e90617208acad88de31ab4f6ac03aed54795e868 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bf6690e746f6bf41f736e494e07c3a106f9e3a26 | ORPH
 powerpc64   |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/e16251478b2643664bdf35f4f6a70acf629b7d13 | ORPH
 powerpc64   |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/e3401aebcbf865a33c290a65cb894a4f0f566db5 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/46b610066cd858ade9b3fa464fbd6f6274da8afa | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e988cc6dba85abee3b81fbd18ddca4e47d041f38 | ORPH
    i686     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/49153eb7d46684bbd16e7a8b1588fab0b73f79f2 | ORPH
    i686     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4f146964eda0ee382c6622e8182263169d0e6ad4 | ORPH
    arm      | mali-driver-d40c57d81c9cf4b... | NOK | https://autobuild.buildroot.org/results/c4247469a75e62ae449387d6489b3acd94d05209 |     
 powerpc64   |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/6866ee05c60129a4ea5ce8ad0fbafe9a73d847c3 |     
 aarch64_be  |      modem-manager-1.22.0      | NOK | https://autobuild.buildroot.org/results/5038b8a9f9a8ab846281cc866a7f95cfc3a16b41 |     
  riscv32    |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/120e3268a71d6310c9a02193a71e325b582a4ab6 | ORPH
    arc      |           ngrep-1.47           | NOK | https://autobuild.buildroot.org/results/0396c8db122c060697b1fde9341a552fa345d77f |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/bb5a67204a10069c1dce1e78b1c5e8c253a77f05 |     
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4d800400f35ead0ff25a280d3a8c57f0f779dc1a |     
    or1k     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/eb972b781ead357c3e44a880cc1b8e4ab4b15b58 |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/615c38c9799c934187810bb1d10348479e703a09 |     
    m68k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/bd4052e171e399b88a7e0d438e2cbd1b6a66c6f8 |     
   mipsel    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/0283ad283ea90fc9b13cbaafa13bc6b6c6ad4be0 |     
  sparc64    |        openconnect-9.12        | NOK | https://autobuild.buildroot.org/results/9c88dd0c7ea16dc3149b7804c41be590e119ef58 |     
   mipsel    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/c17e1aad6206b8ab9521d8e4c0102053ae06a84e | ORPH
    m68k     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/6b17e71401429dc5ae93a69a9ff593670c125d0b |     
    m68k     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/a8eb7e90395326236979df2088884d5cd16a3e6e | ORPH
  riscv32    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/8134132920c8060a7e4d12a6b6c224d14f88b058 |     
 powerpc64   |      python-bcrypt-4.2.1       | NOK | https://autobuild.buildroot.org/results/c33f005e3d19e167b60fac1203eae13e4901711d |     
   armeb     |           rauc-1.13            | NOK | https://autobuild.buildroot.org/results/0014554366fa5927f8df732b29f90f89fa7bafb0 |     
  mips64el   |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/0b01fa486677c5a00dbb5d7ed4e70cd4e1dafce8 | ORPH
   mips64    |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/27736f631ea5b53af5955c23dc467cac64c74fd9 |     
 aarch64_be  |          scrypt-1.3.2          | NOK | https://autobuild.buildroot.org/results/445f27cfb4535ee5800f3ebe36da058966d7bec5 |     
   xtensa    |         sqlite-3.49.0          | NOK | https://autobuild.buildroot.org/results/b28181095400c26d49425c58c35aee79e6fff8cd |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/09915f0c852fc46580e01dfb43155de2c6f6187a |     
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/e62d672c36e3bd9f0917eed1186e8ff355592985 | ORPH
  sparc64    |           which-2.21           | NOK | https://autobuild.buildroot.org/results/ad7ef614e7297949bb0312b062c9c5b761ec130f | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   foot-1.16.2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b5a7b55148244794d2a4e4534df41e1dcc19f735 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  ntp-4.2.8p18 | 1 
                nushell-0.96.1 | 1 
                 openssh-9.9p1 | 1 
                pipewire-1.2.7 | 1 
         python-remi-2022.7.27 | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/900021a6e919533be1e2d544e8f4dc2a87a42732 |     
    arm      |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/1ad1faf00451fbe60bb6ff2898e0994a833c51dd | ORPH
    mips     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/a81604a66e4e35aa9c4823565527ece6a3f879c1 | ORPH
 aarch64_be  |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/529d766b8747f60d93f0163104fba64a0866153d |     
   nios2     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/521dd002fe6c11d45b202bfb2f49c0393caaceab |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/ec7be743bfd7fa9d2b510f9ea4623b430eec7948 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1629AD7308A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 03:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFA36817AB;
	Fri,  3 Apr 2026 03:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGMkFHwEpiLb; Fri,  3 Apr 2026 03:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE00D817E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775186534;
	bh=MwHnYHpWNdSeZRTvwTzm8Vv4qSO+OJS09oGxKfKon/A=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kcdaCxwW1AR/yEKQ2ZUIioKiDfoDv6BBq2yz0RuRKmWUok3R1Li/HHKqZ1ONSDMsd
	 e4Vdnh/++vTL7rSVrQvqLWUmUeFTPccatmcmt6KQoNKkvFnMCPVEXhiTNYQREAV8tN
	 /FunLwRUuR3lIHkl6B3iv5hczrGy5fr8YSCSPXztz262D35xZVYfXMpuKRVGpAX0FF
	 0ZhK19Nnnj15jtVNZ3WfBIgpLHCb+M8L5gxt7dLhvWHCElIZ5/9k07hwi7Ty63vEpM
	 esOKr+Itl1O4Xk+XT/owuPc/UbcZnoTDyOyke+ZLfBYV8gW3iXGnqpyZgj50Pp0CxZ
	 HU4aQuPO5fB6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE00D817E4;
	Fri,  3 Apr 2026 03:22:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FA4C1F3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 03:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFBFF8161D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 03:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMF0CfTJL-S7 for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 03:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9462A814DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9462A814DE
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9462A814DE
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 03:22:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43cf3ee0fc1so1844525f8f.1
 for <buildroot@buildroot.org>; Thu, 02 Apr 2026 20:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775186528; x=1775791328;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lH8ALQYiQ5h4uln8IQJb7NcGyeHL57LMfUIZNlxqDds=;
 b=qAanimhpQZ6LDpBaczx5K9uQXo+rixd2vx6yB+noEudh3bcxfY5jY1cVwVQCvBDY1o
 ZYkxxHptstdusWtREuJXkNy3LlCAytvWfMQfLYSm0A0wyoCTQ92+UOihSpbLhpEDHSsa
 j8+FEs6LK54do5a3l8n5tfxr3laETJauEL/QNr5nh2NdOINhZcRvSQxMsWjM6ihBhZsB
 kfw82nAf3FHTp/pA7VCDhaAIaT9bL9WO1ma1q1QRLJ0SEoMLMIwTVtzu3ypAyD85DJUB
 /D2t8PLz0MueSF6WEqRu07rl03pR4TUchrtZ3hrqarrH41gJaavzwalQSfHQukHHsJSS
 gm9A==
X-Gm-Message-State: AOJu0YzqN/idAuAe1asDEyeRKT/2jlzXuFJGVi5ygsE/XQ9RXTwttjjO
 vPpBcQE5BMtgRbHI55BwBqq3GswxjDsEC8PCDEVzNv4LGkLRlwGFlx/Hinth+Ga6
X-Gm-Gg: AeBDievfP7n73b6l5pB3pPtpt92XUEWCWkq3K2/qsJ34ksUEDf31eUnAY51ly70gluF
 LPaKQVFq45K73TZPBYhfooMz2y99viEsAWlADdoqay8IJFAG8gVyfuIb9TjvJTlfcdjdtTKdRFM
 SQhvXyFkzwsxb8mdZE2yGREzYkgxGYQUJsCmzBk+1V7UX9SMI67jZaVSfFBxnw31k6X2bXmhhwS
 hwEUUeRwYGeOYLUYc9zvuH/4r+pYJMZvovZIbMt9bjLmVSHg1YMuW/xys0PyfdTSP8rW0FvLYDn
 n6MENlqs7RR8fbzW+nMo7ZvlxNEWGweix8yJBqkm4NG1ehQ7CH9b5dcw8B+M0JnD+DYlczMqA8A
 hWoD/h3hjlk3c7GzcsrKRwLAGEGDUMdqF0dbcdBZQANRxItaei2Pts0QzGObSHo0ru+q1tDhQsp
 S/w+iHby1Mq/ZEjRkrcTPjcumpOy+1bA==
X-Received: by 2002:a05:6000:2c0c:b0:43d:258d:8fa7 with SMTP id
 ffacd0b85a97d-43d28f959d9mr2249568f8f.7.1775186527938; 
 Thu, 02 Apr 2026 20:22:07 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c54bdsm14245897f8f.16.2026.04.02.20.22.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 20:22:07 -0700 (PDT)
Message-ID: <69cf325f.050a0220.32b10f.318c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 03 Apr 2026 03:22:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775186528; x=1775791328; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lH8ALQYiQ5h4uln8IQJb7NcGyeHL57LMfUIZNlxqDds=;
 b=lQOQcjNAhI/OSxKdl/iMlXzX3mIOTWQHkWMITjwe9ntb5fAla6ZT6N95U5rH58Zn40
 dDljj90/ew+tbLZ5VCGxzgpDi2sKg5SGh23P9hH63h3ClUlCQqE5p1yR8H67fo+Iitti
 45WOrfOvjbi5gbn64dn/GgmzyyT9ImEnjG7s1PUSOIFNHqAI0/nq0/nnCH4LuEAq3TQc
 xBvsr38i566AkJSHoSjuNU8WO6DBNPFXvjPAqATi7ghvjY1zoYIvL29Cjrk8acQMPSEB
 Ocsp71b+0S9CpRg66H6g6v8MioUaWt/UyTwym2K85jdqcu8u7AuKcXH7UKT4m2OASGC7
 ZzZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lQOQcjNA
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-02
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

Autobuild statistics for 2026-04-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 15  | 37  |  0  | 52  |
  2025.11.x  |  9  | 21  |  0  | 30  |
    master   | 49  | 158 |  0  | 207 |

Classification of failures by reason for master
-----------------------------------------------

odhcp6c-f19dd37fb467c9cf10c... | 8 
                       unknown | 7 
             util-linux-2.41.3 | 7 
host-gobject-introspection-... | 6 
                flashrom-1.7.0 | 5 
             libgphoto2-2.5.33 | 5 
glibc-2.43-17-gdd9945c0ba40... | 4 
                 mdevd-0.1.6.5 | 4 
                   perl-5.42.2 | 4 
                host-odb-2.4.0 | 3 
              libopenssl-3.6.1 | 3 
                 systemd-258.4 | 3 
                    dpdk-25.11 | 2 
        edk2-edk2-stable202511 | 2 
              host-pahole-1.28 | 2 
kvmtool-7ad32e5514aca2b6d19... | 2 
                 libmbus-0.9.0 | 2 
                  libnfs-6.0.2 | 2 
                  libnss-3.122 | 2 
     libphidget-2.1.9.20190409 | 2 
                openssh-10.2p1 | 2 
       shadowsocks-libev-3.3.5 | 2 
           uboot-tools-2026.01 | 2 
uclibc-ng-test-132c6134d691... | 2 
amazon-ecr-credential-helpe... | 1 
               asterisk-22.8.2 | 1 
             babeltrace2-2.1.2 | 1 
              cache-calibrator | 1 
                  cairo-1.18.4 | 1 
             can-utils-2025.01 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                  delve-1.22.1 | 1 
  distribution-registry-v3.0.0 | 1 
                easydbus-0.1.0 | 1 
                enscript-1.6.6 | 1 
                  ffmpeg-6.1.4 | 1 
                    ficl-4.1.0 | 1 
fs/tar/tar.mk:38: /home/bui... | 1 
            gettext-gnu-0.22.4 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
                   gvfs-1.57.2 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
           host-libtpms-0.10.2 | 1 
            host-protobuf-34.0 | 1 
          host-xfsprogs-6.18.0 | 1 
                   i2pd-2.59.0 | 1 
            igd2-for-linux-2.2 | 1 
               iproute2-6.17.0 | 1 
              jpeg-turbo-3.1.4 | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
                 lcdproc-0.5.9 | 1 
libdill-32d0e8b733416208e04... | 1 
                libdrm-2.4.131 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
               libglib2-2.86.2 | 1 
               libpthsem-2.0.8 | 1 
                  libva-2.23.0 | 1 
            libxkbcommon-1.9.2 | 1 
                libxml2-2.15.2 | 1 
libyuv-4825d9b29eea4dac2460... | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.246-cip66 | 1 
                 mbedtls-3.6.5 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                    olsr-0.9.8 | 1 
               openblas-0.3.31 | 1 
                openocd-0.12.0 | 1 
               openscap-1.3.12 | 1 
                openswan-3.0.0 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               procps-ng-4.0.6 | 1 
               pulseaudio-17.0 | 1 
           python-html5lib-1.1 | 1 
            python-iwlib-1.7.0 | 1 
          python-protobuf-34.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 rtl_433-25.02 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                 s6-rc-0.5.5.0 | 1 
           sane-backends-1.1.1 | 1 
                    sbctl-0.18 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
               trousers-0.3.15 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ustream-ssl-5a81c108d20e247... | 1 
        util-linux-libs-2.41.3 | 1 
               valgrind-3.26.0 | 1 
                  vim-9.1.2148 | 1 
                   wget-1.25.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/ceb5b2c58a2856d63e55d08fa6e229eb8ba03f53 | ORPH
    or1k     |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/007311ce3671c2bc528727b635ab3577e1f33542 |     
loongarch64  |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/93b6ee8651254ca2c961bf11801e6d06e60b2241 |     
    m68k     |        cache-calibrator        | NOK | https://autobuild.buildroot.org/results/942c025835c7c0b817b3654b6889d707c66b6097 |     
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/d559ccc70b3d82191e989ff61f7952c9966484b9 |     
    m68k     |       can-utils-2025.01        | NOK | https://autobuild.buildroot.org/results/d96a4658e20d152322ef7743ae7771806041e733 |     
  sparc64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/54cf36264cd4e59ff3eb6d538ad42b33193e4d1c | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8a17c7f9f83f5d8df1c644573df28f50fcb3909e | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f16b9084e34554a907be6d57fb1039b25fb0ea8e | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/1404010e23b39dde0854575982f61ddd69b9c366 |     
   s390x     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/914d6ffc5f80f81ae7d5dec2cedabeaa214bacf5 | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/b9faea74c1b4bdd1a676432b2f88aebb5318e61b |     
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/209c1ce08e44b8807855f98961ee0be64f9cea2a |     
    mips     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/5a25b769fe7c94441ba4a5b51476309036e86d4e |     
    i686     |     edk2-edk2-stable202511     | NOK | https://autobuild.buildroot.org/results/6aa05c94203cafeb63620ec77a8e4bbc8ecb4e5b |     
    i686     |     edk2-edk2-stable202511     | NOK | https://autobuild.buildroot.org/results/e096b3007d1853e7f4c48fa71a772029311fe297 |     
   mips64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/a711e6add2e9ef3eb12872b6613f0b707981ca3c | ORPH
    m68k     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/b9818829baa5477244c334c3c6e6f4c1b0884c44 |     
  mips64el   |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/4ebcb34e7b0a5da62bf770087827d42e03446ae3 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/8939ab983d66663828cbaf36ae99766c3705235b |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/6b56473f886ef2109fd8ff6e4a5e56a45140b848 |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/f06d05f94e517ea4de4aefec6075204698bd9e7a |     
   sh4eb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/6551132f7cec84a0dea26493fb81c21184b2a49e |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/b86e53deec565b4abb73a3e9f09f8179f27da487 |     
 powerpc64   | fs/tar/tar.mk:38: /home/bui... | NOK | https://autobuild.buildroot.org/results/1360353b4b024471db7b5ca0965e12e9309b5c75 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/5f67c12c849a399566074a405226e269a91b6a61 | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/8f5afd5aacad3d981f7821e0235f5662c542ab8d |     
    mips     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/29522a47b876e772563ad983e5229e65c1d3191b |     
    arc      | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/80cc8a1b9bf5a6dcd59ef4da6487640c5a1b7d2b |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/d3bb5c9f2727f56f3f8521e790cb700db6511817 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/8eb1a7a4def59359057dde8b4358b6c3a9a86e09 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/cf5d9f3830a5f70fe08216d3ad0eb8db8d259fc2 | ORPH
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/f0f656cb7f32dfc085794574338f04e46ec64dc2 | ORPH
  aarch64    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/824f9bb3603d2f6eabc8b5bd38515aba74d30014 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9f12415e706a9dcfcca1b52c7191fa1f98919f2c |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/25373db64fece39e879984c94c25cc7eb2292390 | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/51116969a87368137811eaccfe77aeab4101def6 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2869ea6d1fc1f4aa8abadc20cd8fe5944ba75ec6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/efc02af6af729c4d69c8a37768695fbdbadaa8ef | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0f72bd237d2a1bf06546802dcdfd6945c198ca31 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/956e69cb5353f0932ae3cae12c9edd9f878cf09c | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/33f103032479592ee17ea6d05d94997ac76fde23 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1008dbc7fee6d8c825b7e8396379d7e04d1a6472 | ORPH
   mipsel    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/e63fb6cee1b0c12791431d75f12b2e0112cb9cdd |     
   sh4aeb    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c95fda960ad8f326dd0319c6d078248284e3468f | ORPH
   sh4eb     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/64c4a87a9eb365b15ed3b84a74ffcd624d740a53 | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/715599590091759aed5f583c4853a5a5400a3a1f | ORPH
   mips64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/41c07d28d7882e398eb1bce08b64fdeff22d53ca |     
    or1k     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/1ffc7a28fe2c3ea886467b6505c9b4adbc15de7d |     
 powerpc64   |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/697d766e33df3ae1e5c94e225b7782078e296d75 |     
  mips64el   |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/c307f3b81dd04a59366db65c7ff554c30d420138 | ORPH
    or1k     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/1dc13a21ec75a1b60fe923f470ece2b47a9f8250 |     
 microblaze  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/60c790f495fb1c7b021f2f54c914f5b3c9444a59 |     
 aarch64_be  |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/a1d46255637be161107c46bc2b99a0678e117be4 |     
 aarch64_be  |        jpeg-turbo-3.1.4        | NOK | https://autobuild.buildroot.org/results/51d65e7b0ce1e33f8a0d27742da78d1a19fb9d44 |     
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/337468a92e2aa32ec2a45c04cd8d29c25ded6bfa | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/2e41b3d8ce4aad94e0a7b59944a243c29221245b |     
    mips     | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/54d9dfe510704b6ef062e4b2022e477bc7d2ee35 | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/cdd23b418d5fd10397aa27e822206cffdf46e50b | ORPH
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/cdaac57c95d88ce32fc9b34ce1a8f7dc698c5647 | ORPH
   mipsel    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/1a8fa9f5aeffd2e1517b534c96925a9d9bb0bf61 |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/c1532daf18dd3fb241f97f6004ff1f733ebc6e24 |     
loongarch64  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/cf87aca7f703b7d3c24620a75388550cf4e8c35c | ORPH
  riscv64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/c173a22c317bf1567262c7edb23f32b2ef68a4b9 |     
    m68k     |        libglib2-2.86.2         | NOK | https://autobuild.buildroot.org/results/45033c7ba73f654795987b3276010f6dc029caad |     
    arm      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/84ea5c4611b816b82bb62fc3c887566f3ad24b09 |     
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/e1495c7fcbe5d53f11ece2bff936bf1da5a2f9a0 |     
    arc      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/00b4dd18802f5b3572b3705e98b721e765718ef4 |     
  powerpc    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/73b9c8b58b669e279abb89581e1b1109cb4ae925 |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/c8da207f065b8c79bbc0079aa99b3fef21d2ba7c |     
   mipsel    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/b8d77575829c221aa5b50fa1a9dc3eba12bf857d | ORPH
 aarch64_be  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/84b78f2ea2ed7ced82aa50771852afe77cf1f467 | ORPH
   armeb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/f0d2998ad3754302eb366517a243a05bbaf1a488 | ORPH
   sh4aeb    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/acd667ff4449089d928c48a282ae396d2c7fcf6b | ORPH
 aarch64_be  |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/8333947d4051ac46020782b9084a7caa8cbd86df |     
 powerpc64   |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/1443995ba94142ad97f53ef4ea58d06349137088 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/26bc739a147ed8e271ab7b3b6b34cf0c42c55a45 | ORPH
   xtensa    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/e46ffc05a19bb4c4df7cccbca02865f343109a41 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/318b377a22b3979566540deb5825dc8ab4cb74d7 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1587388eb81b7a44837530486c2ad8cfb77a62d8 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/03ff2edd5bee1736c6471cf6b544d10e370034e1 |     
    m68k     |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/6cc66d0b0693427cbbb9970738ee252cf2466db4 |     
 aarch64_be  |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/96dd9cf9710cae6ed349d18a1574a26e49655e83 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/f1918013f2efffc5ceb6fede18de384b3a656cdb |     
 aarch64_be  |         libxml2-2.15.2         | NOK | https://autobuild.buildroot.org/results/ef04fad2c44acdf846b62aceda5063d7458e6663 |     
   armeb     | libyuv-4825d9b29eea4dac2460... | NOK | https://autobuild.buildroot.org/results/31af9b0b8a6dc134fbde2c9893333acdd8d94ccf |     
loongarch64  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/3ea9a4939920db8e61b9b2afadc93213bf194eb6 |     
  sparc64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/284adc460a233c94893ab80876eb4be41318efbd | ORPH
  aarch64    |         mbedtls-3.6.5          | NOK | https://autobuild.buildroot.org/results/505463ede0aaf80dbcf17515419bb357e142a992 |     
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/44c83fa1d647f138b49fb9b2e8b280977405db27 |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/dc08f0505d1e9092ebe34c58517fed9dde1acdf2 |     
   x86_64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/2e753438e8c11a82a52f673e5f61f3a9339a77dc |     
    i686     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/245d31d117b82dc2d73239f23abe9dd7141630d3 |     
 powerpc64   |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/d05dd76aeef2b64500c4b0a9b219325c5254ff40 |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/41518fa34a4de682ff90215122726e589ec28275 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/8f241e7f2b792348bb0426888d681bd3f5dd9d8a |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/deb0a9090bd18e7e10073bfc37ac83560c22eca0 |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0eab142e13e0fee56847b353cc1a3b6c0910d86a |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d08279056e6c22e04c9d95cee4079309ab3248ba |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/8fdf16a73a79c439340e7c81df1a0d1d1b669b2b |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ee707fb0fb7c56f8399f30227ee3b2a713325658 |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d8bbfffcc2fbabae29bc2c8d458d73232328d562 |     
    or1k     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/59d6a53c8d0218d8c4a6742fd534857e05e5d26b | ORPH
   mips64    |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/6de0001a30e3267361f919ae226acb4e4a82345f |     
    mips     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/5f06fa396dc77440ec1ec4f185381fb84ce895a9 | ORPH
   armeb     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/18eae7a477398f2e662f653a00a3fe427c622e8a |     
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/cbc36f9e6bf2fb34ae0a1bb440738ad972ffd60b | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b0ccf6914ce27e95cdaebadd7e22499b47c32bef | ORPH
    m68k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/51320cb1ac44e8dfb1fb4317783bc18da53c009d | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/3a80692122f471868e7ecc76024d8f3bf42f2843 |     
  aarch64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/4f1aee83a8cf55acbb7882829606ff1c3c877c5c | ORPH
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/9a13fe11f602836ef95cadf31bb315fbdd882b1f |     
  aarch64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/6facd6259788ae47c52c56ff3bfb241a3b0bb381 |     
    arc      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4515f6efff713415027b363c75019a94e834a26c |     
   s390x     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e7b9dc72f487a53726f02a501775c4d6fc65af2c |     
   xtensa    |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/aec19b8c40f127936aa20d3ed27aec430f09237c | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/33ee40ac4082f34aeece18e3ded3e515248a91ce | ORPH
powerpc64le  |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/345d1ccd8e9cf47938de798813d88287beebc352 |     
   s390x     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/a0494db43c23290d214fccd32cea1bc60af318b3 |     
   sparc     |      python-protobuf-34.0      | NOK | https://autobuild.buildroot.org/results/5b62775214c74e72c5bcfb26dc2733239070a505 |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/4b0be5d372739b30f021285eb0d502c4f18a4baf |     
 powerpc64   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/3b35d0176013d142f0670e65e060af6169be0e75 |     
   s390x     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/fb081d8f7e988bdca4912727104ed75961cb96c4 |     
   s390x     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/6920137cac7b77e50eb55c3f8294ada1f1304b8c |     
powerpc64le  |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/c0c5c82adc1cc5421856a12ff1dddbda58dbe822 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/e1e3e8dc43c22abe1edb5b351480377295df208b | ORPH
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/990912d5946b7490f82bdb8dc4a346b9f974a79a | ORPH
   x86_64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/f0160e5826e17f7815805b51b98d4e24ff0babe0 | ORPH
   s390x     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/933a689c2f1dd7fd022acac6dd3d1a7001448987 |     
 powerpc64   |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/32ac9d96e1afb622e5bd278c3ed96edcaf9b505d |     
   armeb     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/a595291b0e84f238a44864bd67c531e0bacd2c25 |     
   s390x     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/13ff001260592b5a3c5b4e7f915c536d4b916983 |     
  powerpc    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/34bb7d7f0205183ce8a2d859d6698c22a572da42 |     
 microblaze  |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/e9842600f7db74e7bf65a25fa9da264fba13229f |     
  aarch64    |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/3d4aa55eed6f2a0a21ed9ab2a6920d70d3d70815 | ORPH
   armeb     |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/8f17d50b2c35a44fce7696da5801afabc561e9c1 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/26eef9b451ea5ade04a1f5c6b7b49f54dc8a5860 |     
   x86_64    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/916e3daff210d069d58014bfd2d35d1dbc8d2bac |     
    arm      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5e3cbdf94f3592864f2cd2f11cbb2e5257571409 | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a17b2de7b0a985725009469e777eed9b7a1c3b48 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/b379bccc3b2a445ab2faefe2a22678200325fe31 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3412e027be13a7fc752aee7e4ca7c78d0949988f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7ffea68ffe509e5b9c51fdacd6e9289c0c510a39 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/b516534098c433592793d3221e1ba0c6083b3e59 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/6f6505a33bf652481928883367e0630ad56186e9 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/d0c13f3ec58f6505b0ac64f48a43f118f0bc0c57 |     
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/1e7406a06c5e7487878b918fcb1a60347ad0945c | ORPH
  mips64el   |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/6e3c48d6ec5f38467629d4d2ddd7d9d1b67da91d |     
   mips64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/23edba1a989ec4f2c49f3418d32340c6608a8f37 |     
  riscv32    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/4fedb088a5c674e7d4371b7cc84a4444cbbd88c6 |     
    i586     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/fa7b70ee5a22fdeaa0ee817223d6579154b76c84 |     
  aarch64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/1a6666b494dcfbfa6208ac9bc643ffd297e95716 |     
    arm      |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/d7911ec103ab985b8238b1cccde43c77aad28914 |     
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/c71a80e0c29bc7392a285ab9f25304b64d4e04df |     
    i686     |     util-linux-libs-2.41.3     | NOK | https://autobuild.buildroot.org/results/8cbf80e2d1261a6f83695249a911992154ceabe9 |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/fd125463877cd0a6edd2c64858e561e3d3632ef3 | ORPH
    m68k     |          vim-9.1.2148          | NOK | https://autobuild.buildroot.org/results/dbd340d185f2f93f1df8d8c7a6f77fbbdbc926a2 |     
 powerpc64   |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/65bab0a483cbe717f341af59b0b7909916218b45 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

            erofs-utils-1.8.10 | 2 
package/linux-headers/linux... | 2 
                  axel-2.17.14 | 1 
                bpftool-v7.5.0 | 1 
                   dante-1.4.4 | 1 
             drbd-utils-9.21.4 | 1 
                    ficl-4.1.0 | 1 
                freerdp-2.11.8 | 1 
                  giflib-5.2.2 | 1 
                host-odb-2.4.0 | 1 
host-vboot-utils-4b12d392e5... | 1 
                   i2pd-2.58.0 | 1 
                  libnss-3.117 | 1 
libuci-f3fc0b76040685829191... | 1 
                openssh-10.2p1 | 1 
             parsec-tool-0.7.0 | 1 
                pipewire-1.2.8 | 1 
                    quota-4.10 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          axel-2.17.14          | NOK | https://autobuild.buildroot.org/results/fc1272cbe6d7ba66c42d0cb810c4260cdbfe2063 |     
  sparc64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/285f3861fa3055a4d9b1044a69f7b55939a071be |     
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/36cd4d89b3681ccde5870a0e4c4a5582e10086fe | ORPH
   sparc     |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/0940f5f1128182ec19d7f4a60707b0f917104c6a |     
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/4d671eee374774834997f63c7acb1d030e146487 |     
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/208fcd71559bd466e1f8be8e7d2e9c26103f7eae |     
    arc      |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/5ae3df0ec9dbd6ba63c412aba2e47eb45d94d662 |     
  sparc64    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/789e9cee98102164d44afd713a4d1abb71babd6f | ORPH
   mips64    |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/8f7483353f41076f5f31e0462395382d49703423 |     
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8370512b302ed7b3d64b6d551b6083d98a27f82c | ORPH
   s390x     | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/0e7195a19bcfb6e108c5abe5acdcff0bc386dac1 |     
powerpc64le  |          i2pd-2.58.0           | NOK | https://autobuild.buildroot.org/results/3522b4d701bc7e103b759d40f11825d58c5f070d |     
  mips64el   |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/76419743bd79f3b96f671ef682b863fa425c7501 |     
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/4a573cbaa41712d3a14f07c09e643cbe15c9a479 |     
    arm      |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/f50cfed6c9df2d139a91e9d77e6ea1a41e8cf028 | ORPH
   x86_64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/b157aeccd2a84b09bc6df9047dd93bc0dadf4906 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/19c6ba785101549f77e4d1579d5308d89106bc5d |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/218aaca49ba39292e39f913dd4ef150da53fc6bc |     
    arm      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/73b51b84029c703ec22ffa6ce9afbccf3c7c210f |     
    or1k     |           quota-4.10           | NOK | https://autobuild.buildroot.org/results/6a2b7793011c4b74e64f75baf38d3ac70b36c6d9 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/84714a73ac17dfea2798602dc66ac4353d1a2019 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-faketime-0.9.10 | 3 
                 host-gdb-14.2 | 3 
  gobject-introspection-1.82.0 | 2 
                host-odb-2.4.0 | 2 
        host-python-lxml-5.3.0 | 2 
                 libmbus-0.9.0 | 2 
              libopenssl-3.4.4 | 2 
                 c-icap-0.5.10 | 1 
                  dpdk-24.11.1 | 1 
                 fwts-25.03.00 | 1 
                    gcr-3.40.0 | 1 
            gettext-gnu-0.22.4 | 1 
          host-binutils-2.43.1 | 1 
                 host-gdb-15.2 | 1 
                 host-gdb-16.3 | 1 
              host-pahole-1.27 | 1 
 host-softether-4.30-9700-beta | 1 
leafnode2-9543ffaf82406f943... | 1 
                libcurl-8.19.0 | 1 
                libsoup3-3.6.6 | 1 
                  ntpsec-1.2.3 | 1 
                   perl-5.40.3 | 1 
                pipewire-1.2.8 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                   taskd-1.1.0 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.24.0 | 1 
   webrtc-audio-processing-1.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/64079cbe1ee640ca02df1854732228a269855ccb | ORPH
   x86_64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/065acdade1e56109bcdda63f5587a5d169f1974e |     
    i686     |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/934eea4f8117f123e3793ae1fc84b0068e34ae28 | ORPH
   mips64    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/213e3e5d9e6966642d5cac438c9aecd158647310 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/57a5c8cb618a7b61311334400c4559233622ca51 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/08218ae96b33224a504e220bf83b1e35d652e582 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/4a1b50c4dad43fd1792809f3b7b0a2ffe06ece53 | ORPH
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dd40205f1ac0f144a99ed053c484e545d83e9d70 |     
    arm      |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/3a44d89b2a7fd343bf1751709ad7ce60862f5dcb | ORPH
    mips     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/28d4665c7bd46360293433d4a5cdd4348ec2bbb9 | ORPH
    mips     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/63e6443a92ae95f1d86bc3a1aaaa58d79f49bfa2 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/38b896d20f198e852f0a3214c73972b4c343532e | ORPH
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/56b5084e56a9f182664010ec57c5cd3919985df1 | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6fa7b52d8c6991664737824e454db6c4af7e9f08 | ORPH
  powerpc    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/76aa2a7327b9c55575dee9512e02737f8435d68c | ORPH
    arm      |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/eaca10d9088ddd3c9a42d72e5af19bb75e1ca9ea | ORPH
   s390x     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/4ae42f29ab175ba1db5f160d638d89936cc19768 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d36d1c22a1df1167ab2ca6c80ae31dd6a81ef94a | ORPH
   armeb     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/526799d5366bb97a06e6c35fdfdb29a0157181c7 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9c3afac9c70d470587183ce6351451b7cc07d811 |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/f3231b97049aaf70a4d74dd87b3ab38bce42e9ac |     
   mips64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/4c35f4031a8ac50bab42a35f5c7e706cdba9967b |     
   xtensa    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/49b33bb86b63b9ab0bd461bda9e3e3345b1c70c4 |     
    or1k     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/db05619fccc7a44d66d9b969a0c21ec3d6eaae5a |     
  riscv64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/5ffbcde4fb8580d62eb14f14a311185f4de1204a | ORPH
   mipsel    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/d13ceceb0b6bdf8de614ad206b0119e8e5407811 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/2350f383acf3b7240041c50720ea8f679d2eab49 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/ac1e47d36287e454e1941a823f82c366efa0dacc | ORPH
   arceb     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/5ddec29c2f6a7ba435dc5e385866b46b0780ee1e |     
    or1k     |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/8b63607a8c2933eaa22ce33c0b7871cbcb086c01 | ORPH
    i686     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/195ce99e23b400adff4c4fc266c8aa47f6138293 |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/97c94769ebccce372b953b0bbe1de9c93ab62f61 |     
   arceb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/34cba44f42b176ad1565bec90dceb62ab28ebae9 |     
  sparc64    |          taskd-1.1.0           | NOK | https://autobuild.buildroot.org/results/cf7816a031aae54de20cbecbcf383cde87fe9a9c |     
microblazeel | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/0478acf242d5e02ad7516f990645f79013aa681e |     
   mipsel    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/30616f09459c0b6b9b2291445bc481c46c3fb271 | ORPH
    i686     |  webrtc-audio-processing-1.3   | NOK | https://autobuild.buildroot.org/results/bbd889fe13aef3ceb35dde2de2e9331663624eaf | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

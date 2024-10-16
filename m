Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F37D20691
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 03:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20093608CE;
	Wed, 16 Oct 2024 03:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMqK1tPgT7nX; Wed, 16 Oct 2024 03:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F04956061C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F04956061C;
	Wed, 16 Oct 2024 03:17:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5CA1BF3BF
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 03:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2148E80CB8
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 03:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id af5OmbDjKC4w for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 03:17:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F01980CBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F01980CBD
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F01980CBD
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 03:17:27 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c948c41edeso6181114a12.1
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 20:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729048646; x=1729653446;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0pBQC5dVIOT4UPw56npJO25sbwHXF42j11CUaWatz/c=;
 b=DseUQm5yh1SLqXq5trT8ZWoPTuw9BsCj9ptolUxExHfjSY49Q9dH2E7W4eMeg4B4He
 ZqCE5+S2dLBe1EnaFD4naFIq3ioc7uO4EcxtrtZCyM9xr0EDD2wQZfr7Dw86Jcb38X66
 n61rgZdT2dyBOTmxg60l9S47cFP7yO1RUYt0vsCa8/JUYXCXCvBTvWtty+8VuffuweAA
 UfkDxE90KMm9LuBj+Zzl4G3q3l5zMId73+pgNA7kgm5TVKmtyJQejTywoJ2RRoURxrOH
 K3nD/Q+iTAXQzl9/EM/RvUVOpiAEDo1uaZwUMcP/v5/eqz5DouNFbZNZ1KpSj1+g6ZxD
 7POA==
X-Gm-Message-State: AOJu0YwvMfoQ5KtkzMJTMjEZbtDHlJ3tVUve13U8kY09RljGb/IelUN1
 vNsuwc+ugPRRz42PFPKjXv7A7qjxaNQYaQ7JMKLWB49jfmJ18jiHA3kxSnTP
X-Google-Smtp-Source: AGHT+IHCcxSGZTokFbKaeMZE6cnRuMz5OeLycGy1PlftmufsQN0BZ9nIrWs09zkl5nNNEOgJU9H45g==
X-Received: by 2002:a05:6402:2688:b0:5c9:45cf:483d with SMTP id
 4fb4d7f45d1cf-5c948cc83ebmr12967470a12.15.1729048645443; 
 Tue, 15 Oct 2024 20:17:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d4f97f1sm1240319a12.31.2024.10.15.20.17.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 20:17:25 -0700 (PDT)
Message-ID: <670f3045.050a0220.378c76.6800@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 16 Oct 2024 03:17:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729048646; x=1729653446; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0pBQC5dVIOT4UPw56npJO25sbwHXF42j11CUaWatz/c=;
 b=mWF03rl+iKOFk3HRkvpdtO0+99Wi5wsGCP58bF12FPFM8CORoo2MFeIKMpQTSTHaeB
 VJrfz6TGGmxgDnmW5bB9meE5uMF+AHHV6adN1ETwYb7Jw+avGv77JJjcf2Kvlp8GzzZJ
 6hzAxK/SQs85uKDkrkK7QLs4nStI7m1yArgKr9qx2ajiw43YmAg5FkjOek9qN7QlIKms
 adPU6NTTIamWpYPHm8V5lMlz4EplRxZekfEjE39lrDDL5ySZ7FEZ1R9FvrOk9KIPO+XQ
 7PdVHLMcX/oLDAeeQEtskS1OS8XTELbF0/nhmcYVpgy73+kUrt5DqLFWAxvQbPJamAVN
 LAtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mWF03rl+
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-15
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

Autobuild statistics for 2024-10-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  5  |  0  | 10  |
  2024.05.x  | 18  | 26  |  0  | 44  |
  2024.08.x  |  2  |  2  |  0  |  4  |
    master   | 15  | 245 |  6  | 266 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-8.10.1 | 26
               procps-ng-4.0.4 | 18
                  bind-9.18.28 | 15
                 apache-2.4.62 | 8 
         gobject-introspection | 6 
  gobject-introspection-1.76.1 | 6 
         host-libxcrypt-4.4.36 | 6 
                 linux-6.10.10 | 6 
            host-binutils-2.42 | 5 
              libopenssl-3.3.2 | 5 
                    git-2.47.0 | 4 
    host-python-greenlet-3.1.1 | 4 
          linux-5.10.162-cip24 | 4 
                  ramsmp-3.5.0 | 4 
                       unknown | 4 
android-tools-4.2.2+git2013... | 3 
                 coreutils-9.5 | 3 
             dahdi-linux-3.3.0 | 3 
                  evilwm-1.4.3 | 3 
                  ffmpeg-6.1.2 | 3 
            gdk-pixbuf-2.42.12 | 3 
            gettext-gnu-0.22.4 | 3 
                 gnuplot-6.0.1 | 3 
              host-rust-1.80.1 | 3 
                libesmtp-1.1.0 | 3 
                 libv4l-1.28.1 | 3 
             lirc-tools-0.10.2 | 3 
            netstat-nat-1.4.10 | 3 
                  assimp-5.3.1 | 2 
           at-spi2-core-2.50.0 | 2 
             berkeleydb-5.3.28 | 2 
                   botan-3.5.0 | 2 
                  curlpp-0.8.1 | 2 
                    dust-0.9.0 | 2 
                elfutils-0.189 | 2 
                   foot-1.16.2 | 2 
           host-librsvg-2.50.9 | 2 
                liblinear-2.45 | 2 
     linux-5.10.162-cip24-rt10 | 2 
            linux-fusion-9.0.3 | 2 
               linux-pam-1.6.1 | 2 
                  ntp-4.2.8p18 | 2 
                 pixman-0.42.2 | 2 
               pulseaudio-17.0 | 2 
                   sdl2-2.30.7 | 2 
               valgrind-3.23.0 | 2 
                acpitool-0.5.1 | 1 
               alsa-lib-1.2.12 | 1 
                apparmor-3.1.7 | 1 
                    azmq-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
                benejson-0.9.7 | 1 
                  boinc-7.20.2 | 1 
                  boost-1.83.0 | 1 
                  brotli-1.1.0 | 1 
                   bullet-3.25 | 1 
                cairomm-1.16.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
check-11970a7e112dfe243a2e6... | 1 
                     daq-2.0.7 | 1 
                 dhcp-4.4.3-P1 | 1 
                   dillo-3.0.5 | 1 
                   eza-0.18.22 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
                    flac-1.4.3 | 1 
              fluent-bit-3.1.3 | 1 
       freeradius-server-3.2.6 | 1 
                freerdp-2.11.7 | 1 
               gocryptfs-2.3.2 | 1 
               graphene-1.10.8 | 1 
 host-binutils-bare-metal-2.42 | 1 
   host-mender-artifact-3.11.2 | 1 
        host-sentry-cli-2.20.3 | 1 
                  hwloc-2.11.2 | 1 
                      iwd-2.20 | 1 
                  jack2-1.9.22 | 1 
                libaacs-0.11.1 | 1 
             libblockdev-3.2.0 | 1 
                libdrm-2.4.123 | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
                  libnss-3.104 | 1 
                  libsepol-3.6 | 1 
                  libva-2.22.0 | 1 
                libxml2-2.13.3 | 1 
               linknx-0.0.1.38 | 1 
                   linux-tools | 1 
                memtest86-6.20 | 1 
                   mimic-1.1.0 | 1 
                 openssh-9.8p1 | 1 
package/zabbix/zabbix.mk:14... | 1 
               popperjs-1.16.0 | 1 
           python-daemon-3.0.1 | 1 
                python3-3.12.6 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                   swipl-9.2.7 | 1 
                   uhd-4.7.0.0 | 1 
                 wolfssl-5.7.2 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/a960e537d58a9eab81afd720f0dcd5c20ef78244 |     
  riscv64    |        alsa-lib-1.2.12         | NOK | https://autobuild.buildroot.org/results/3421bdd2c2a1c68bdba3cb6088efa941ad42e3b5 |     
    arm      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/28463228da93178ec2ef1a6c9e0a6a63f4439ad7 |     
    mips     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/e48f1d7de52e79bfb3af828a98ed909896138d0c |     
    mips     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/37b712b61a815e27cebb8d2870abcbe8db68a3fc |     
  powerpc    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/fd8325ceee55c62b8b9569f17737bb5c5bfbe4ad |     
 powerpc64   |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/0ccd4628a2c2e67e424d1ba2372aabcba8927133 |     
   mips64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/364aa89bb0f6ad02349ad6babb3b29a96ef75bfc |     
 powerpc64   |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/5f3f89c2c49b231c50c31fd4e0ec3f9e9b77e477 |     
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/07cf494cc747fe008caa50ab1b74c19a2ca28bb3 |     
   s390x     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/2eaa1f518c2634c9b81dc7296e327f9ed2d1509d |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/4cffb39c3128ce413c952968c001cd0703069116 |     
 powerpc64   |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/cc60072bf1baf1597a64c2d2af4ba344f623ee04 |     
    arc      |         apparmor-3.1.7         | NOK | https://autobuild.buildroot.org/results/2fe44d228bce310e67214f39d7241eae626f4c7a |     
 microblaze  |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/5aa9dd03b61ab216e83389d8aa87409d2ddd5d41 | ORPH
   sh4aeb    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/42defc8a810cfbdd3b298891b72bff417a490d01 | ORPH
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/6f7357a46e995d98d59c30f33443d4c9f8599735 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/898a2527f11b75d7fc8b2422800eede1fdd1a49b |     
  riscv32    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/214c7c274a1f5cdfabea29b5b42704e2569df588 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/0e6272876fe89d5cdb2cad5af09f455a83c690eb |     
   xtensa    |         benejson-0.9.7         | NOK | https://autobuild.buildroot.org/results/0ffcb674f9b75696a0047089edf306314620b17e |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/e86cb94c034c3e2756b22be237af3dc098d8c1a4 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/2e28f52587520a956f64d0feb7c67fc0a247a141 | ORPH
  powerpc    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/9f0d7dee4ba2442b1e8ec9444f11e02606bfb2e5 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/21a69d193d81668ff5e85fd56cf2559081e8f5c5 | ORPH
    i586     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/d38205ace14d92b52dc21aa70670aac5ceade7a0 | ORPH
  mips64el   |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/b52f803056a6564add3f3d04d0c3cdd2d665e43e | ORPH
    arc      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/a9ba1b79d055be1ed8e4753438d45185b278cda5 | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/7368ee0b097fa6b776d98756504b83ed840560b7 | ORPH
    arm      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/b8d3aa824b991464b2028afe46f42f3702d2742a | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/e04b07fe0108a3e976fbf3e8354af4d28dd785f8 | ORPH
    sh4      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/7a16cdba788595fcd19cedca314984713d02ffca | ORPH
    i586     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/2f7673f7659eba368b4f9ffb76e268eee007036c | ORPH
  powerpc    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/d0103c420fa3ef4b50a0828bec9b670b34dde151 | ORPH
microblazeel |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/0117c66e6beb807993dffdb3e97f89b6c89da1bb | ORPH
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/152b51f7f07a7d288032f6c3b5fb6ed61ed52974 | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/c242451ef2acd13b9f3fe70950b438c13e78f000 | ORPH
  powerpc    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/1d50903c3447e412109d3168740358bfbeb192e4 | ORPH
   nios2     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/22339f08de7a5cbdd1131b5d025d7f89be9f8a6e |     
   x86_64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/54495401ce1461b6f3bc249c1611bbd93eec6c9f |     
   sparc     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/d191732b133d4260421abef9d69b35e0c172a7b3 | ORPH
    mips     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/b4efa9df9d19706f3a7b130d033fcefc94888d3f | ORPH
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/cdaa147057e34e33c7461e766a739d85b5ad340c |     
    i686     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/21eaf2914cc82c50e4208afd3b2cfcaceddfa61f |     
   s390x     |         cairomm-1.16.2         | NOK | https://autobuild.buildroot.org/results/266fd47c3304d81364b79d1892cefda0fd73e2a5 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/2a5ffbdb4e88bfbe9ac4a2efb587a7155cb7dcf1 |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | https://autobuild.buildroot.org/results/5ac368abbb483fc1cfb52b5e45ea21ba93149063 | ORPH
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/6f661dd4ef0e1fab051c47cfa874a5a5f47d83ad | ORPH
microblazeel |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/4b4f7f16638868fef7ff767f35d78bc97df43f98 | ORPH
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/fe4af15cc2cf858a9017471f1aa3c3d5e1badca6 | ORPH
   mips64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/a99a6db6efa4a88d5fc619f66c60e21f852a7d90 |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/784ddd2657b9b5f4ab2187b8a060d0faf0f0a7b2 |     
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/df342b80a646d93bd0184d3940440672d7d0e3e2 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/03fbe0e07bfa6370027ee6b0ad0dec27707229e4 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c6066274e1a59a595ce87c0d0eecee57d3ae582c |     
   nios2     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/e31049f09e0457808cd6a66565935ebcdc60797c |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/2feb41690ad6e477e1a289a5724ee5018f88d0fc | ORPH
   s390x     |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/2bf8b3fc2c096d2de44eb4595e13b609845ccd70 | ORPH
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/0e8926ea2b2359f77ceb25244eea15bc019bccf3 | ORPH
    arm      |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/d0e08c827efc0bb5d75b7e098f51fa4060f613e4 | ORPH
 aarch64_be  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/f92c1413e62d6db78a2c28169821f014ff0f5451 | ORPH
    arc      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/6b8d9483ccff43831a84c2c41671d8f739c21b63 | ORPH
 aarch64_be  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/6f4a72c3937daa71c6576cc99babe94489381b13 |     
    or1k     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/fbb8de181d4d4ee5bb3d66326720ae1afdd0faa4 |     
   nios2     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/f43cc8187c70655676ad385841869711fe4c9cc7 |     
  aarch64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/fb61b9e1c1709148f13dbe3a9ada7df7d8b45a43 |     
   s390x     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/13dacbe71ba6eae1d1079f86f08d0bc2dd71987d |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/136b101fc40766836fea53b7e3be8d2425502e44 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/5e31083826706da4c8a685ad0313fbab44cca706 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/22fec9ecdde446dc44d1c2f2944e35a602731397 | ORPH
    i586     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/42f42fbebe76cafa5d40938b4e0fa56f55882d5f | ORPH
   arceb     |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/39d411a469004f91bc6f5225c78cb598e5bb592c |     
  mips64el   |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/c6cc2a7b16b4d8bc61048b1272a1bfd31a27d38b |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/cc55ec319817890cafc53c65555ce614419f7a75 |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/d2bdab47816079c18282cc86a2d5eebd4d75c00e |     
 aarch64_be  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/5f60959e1e429558b1bc4748d899aa6ac72282f2 |     
powerpc64le  |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/a9c4772cf8fd99212ad007a438e98fe606fcd3bf |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ba3bc01e0cdb9c1e569595ec6a928c91d0a6ca4e | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ea96978cb113054330f52268083a43193d69f124 | ORPH
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/50b290231618f9d62d5f12e2fef145e3eb4f080c | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/43bb23d4372bcd5ac98a217631eb24440606fdde | ORPH
    or1k     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/1a9e68f681e13dd09e19f727aa88b1602ecbc7cd | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9e12bdebe79bd1cca1426d46619c5e2cacbb2063 | ORPH
microblazeel |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/563c56511f011926b83da26b64a0b90ee74ef757 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/e6ae09268c2abf82fc205048d68da81319af631e |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/f0f3c3d864f0563e75987b7f2085c41ffe374bb4 |     
    arm      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/519b92c1c3096199cd405946261beff0aa823bfa |     
   mips64    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/1b9e9dc679d7033d4c5130540cfba04056bd76b5 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/34b51ab1ff6ed8df2ec2b63eba8b543b097cfbf9 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/91b7a6cade487a15d6389f0b9997eca27b7ebc40 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/80ddf681bcbfaaaeb6ce8838b6395ae5d524b276 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/7d5f923aabd95e01ba76b939bf086adbaf40ea0c |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/a8611f1f615016fc9ae4f67ea67d4ad17a51095b |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f45a1b62b1773f3b51b4c091d612707a35536b36 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8ef8bded43a5356572466bee4be1b391dba14a5d |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/94ddaa2c50d45a2bee2d82db7440c437ad6e4f82 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f6e73a4beb5c691a26fe069270adbbba9f9c43b5 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/043b796d3d34a974c16016a0b6abec859033b0bd | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a790b489d75479b4342d10b33727190385a0afd0 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1cf98b881df3849f5e2888f6090c19ac3e76cb80 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b25b67d0ba1652399a9722844fe3c98e3371f2c7 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/cee10b777641537e18eb804e15ea9034597b82b8 | ORPH
powerpc64le  |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/803c873bc32d401aea423747a7216d27c11c408f |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d173cd9034123e5e8adfa6599f07a03368466584 |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ad9e9242e1b68c514b9f9d2418ac0235a13aae0a |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/03d771200d89139c5a196c9b5fece915a66c919f |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/cf9184f05155fcf22b6b975b574a84a521eef254 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d02e38f183b23307f2d5dbe3bcb8ea5ca411d804 |     
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3dfc16e0788725bf58ec1085e9057bf035648659 |     
  mips64el   | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/8ad0908203f497dda2fbbe2a32c46a87dbd35fa4 |     
    i686     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/3a5316e3fcaee20bf6b36c2c82e54a568c28229d |     
microblazeel |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/05edf07418739cc2ea758214d7a31ba42d2d7791 |     
  powerpc    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/7e7475255afc23da3a6533ffb8b998c9cb877fc2 |     
    arc      |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/3f6f1677403bae8308c3759f674ea71b073586f1 |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/f3e3b9e362d0748263524e0a6663c50d4fa1beb2 |     
   sh4eb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/75c271d8ddbf0f63049a5c3c04a575a7e2aecf3a |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/ae5863faf3d39c30c61284bebe2ea1432ec58f25 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/bb60b0f977487dd9853c243a9f04c40e8fb8c644 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/9d3316d17a56ba25b8977c516e1e96c362ba9aae |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/aabaa0b9d515195ca2e950e64423862671c62762 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/5cb309ae4c43a05055b2dd41685b65a27cdebd78 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/21a26c9ac7318b553d99f02af8f41e2e2553f26d |     
    sh4a     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/727374034fe806b3b1c9b5029d246a4c099a1ebb |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/bf6c307be0a123ecf0a8289deac354de02042267 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/d5b54ef21681b017cb8d154067e9179c6fdad55b |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/33bebb9c41ca5861f210cf5c6ba65d69d142484f |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/ea060b6a2784efee71ba443047ca91880599c737 |     
   x86_64    |          hwloc-2.11.2          | NOK | https://autobuild.buildroot.org/results/10be4ee48a3ce39c3439e9e133b4e69ac82bc81d |     
   mipsel    |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/65156ec420664605686d7ad87dfe8eda5f1703a9 | ORPH
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/6e82fe453bb23cb2b7a28a4c5d58e58a42e468ab |     
    i686     |         libaacs-0.11.1         | NOK | https://autobuild.buildroot.org/results/397264f109cfb2ae0ceaff72464cf9e243b4dd0f |     
   sh4aeb    |       libblockdev-3.2.0        | NOK | https://autobuild.buildroot.org/results/23320aff26b882a0fdfd6f721ef89429f073e774 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/367c59dfd463093386b47e9e5ad770b69065422c |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5f146137cc7deaa3d0108cee45bb0c87fc59286b |     
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ca3f8f7e22678cd77d9bae73505c2a1940e2b812 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/dafb32f254bfe15f11e4efa4422146ab8d20c243 |     
  riscv64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5e5683ceadc131aa59d975d5682eba6426a3f175 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/28e16698d966c88767dc258350cfd668251d97a0 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b1f5c0c390096ea7a02589a59ea78588b79e1345 |     
    arc      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/fcd9b1ccaaedaadc081a555cf66252f7ac7626c1 |     
 microblaze  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/2bdb4a86f014aae3e6d988460c875df0be191003 |     
microblazeel |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e318363d3ee19daff6da69626f85d3edde483874 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/72fd23d14b033408fcb1bdc86bdff8ca260474a6 |     
    arm      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/cfa41bee3e4ca6905d217e9e556849ddf709955d |     
microblazeel |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1357a0ff27973a283489216d82c77c63bde0920e |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/27a06b437445042fa5693c540c25d5e65fb2d023 |     
   arceb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8334f09fbbb792a3cd722263d49fd5cbbab05b9a |     
   arceb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ed3c9ceec490f2329af7929a1936e98c99157ad9 |     
    arm      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/6ade9d6172623824b975ce981b61c1966b18a374 |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7ba1bb67c1406d3d23e09d92986d05fcf6190fea |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1fabd6bdd0458dd458ce77510d80211ef68e5e07 |     
    sh4a     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/9d2d1e5034f4d81d12c16631b819b10360168039 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/fd2933628d7ddaa35c1afdc3fb2f54c02877d6ac |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ff67ef9e95b69cf51449b1256a6df43f91bc8d7b |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1b1df6ca4c7e105dc95973e2c86fa8f2378f4e11 |     
    m68k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a7a47b8e03b67ada1f7a91392439fe2ef21cbbc2 |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/43050409dbf89bc04fef0723ba0ddf2225352b8a |     
   xtensa    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0cd4df600e92ba1ea743b83de843596563e80d07 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/799e889cb4f30b8ba6503137749c54efbb7c39b0 |     
 powerpc64   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/a6aae4f7f0653cdcba96d6b8adb1bdbe2dda37f1 | ORPH
powerpc64le  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/a0336b8905192222d449da85fb52771a521cdb07 | ORPH
 powerpc64   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/86d3c70c5bf629cf8cb28207baef1bc11ab10d73 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/9ef5d4e3ac75367c4a3b24d05962729dd1de7dd3 |     
  powerpc    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/e819130a71af74173dfd3b59853af031fd84f00c | ORPH
   sparc     |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/caede6a98b83e214e09780c14b9e2b71e71ec609 |     
  sparc64    |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/6d156e9af754dd54799ef68264350dda330dce84 |     
   mips64    |          libnss-3.104          | NOK | https://autobuild.buildroot.org/results/d954d107058b810991d753a9385a79d4971778d9 |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/38a2eefa8017095fcb36781a1d179483624d0e85 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/15682231ac7a7cf0ebf8526b4608da6f3591fb61 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/a5a262084702062c8d3a91dcf9602f7072649e70 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/f007b291c470987a49c2f98dfce3d86506a0fcee | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/a3fbbf13037e22463f176e4a88e79e917a54c672 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/af47981b7746d3b1b8e97755837e6a1bc41f01ae |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/eebca33e02ce3a412c2304914a9b505e69e0c406 |     
   s390x     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/b4144472e729b3f46e951c032a8333fb2caaaa88 |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/73cef6006e2ac3748b32bda0210387a3c8e79798 |     
   mips64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/378ba1e07f0e818a5bac90ec5c658a0f2f013f15 |     
    arc      |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/44e70d49de1e3610e95cc7645c3cf96f81bf4683 |     
 powerpc64   |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/01762e349ce0e7dcd1abd2abf0804e380b9e279b | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/60c8fbd6813f18062ed382c040fcfeb7581c2c1d | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2050cd36e3183eb05e9b919dc77e816ab5c06db2 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5360b481dc4108bd444d413ea6d55f9027524ac4 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/77971f5518d6177c2be061f5c03f3f422ec693ca | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e203ffffa498979dfc0d0e301211dcc0d23cf94d | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1755bd4920f629e23d57b82180afb6b0b6116be5 | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/18d1dfc31596e08c46778b999be89631351ebd85 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/36295148e6cfa6ca191a873ecf3bf5318b860cc6 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/bfe9a2945dd8bbb2c48adb6f7e0a7156a1163a3d | ORPH
   s390x     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/d3122efe4e0c77f563faf3b2bc272fcb6c1e67a5 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/cae61e3d0644d1db903a787cd55ebdf5c443dbc4 | ORPH
    mips     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/47342a258d055ba793a71871fb1720b04f77ebd4 | ORPH
  riscv64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/7fda2c6adbef1c6ea7d9fc7abf0c0e1a03cb3f83 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/c4d10c56ef5a5bcca9969c52174f8ade4d2a14c4 | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7466d6075d0ca951d67de2f58e7ff29e3c88ce9c | ORPH
   x86_64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/49f1826d80dc303cf999f938745de119b724b86e | ORPH
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/ebe88a9310d7e39449de3ea19a720ab5bad8f9c4 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/74790276d09eb53bb4286bc8556c6045302a7806 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/47ec675cea54fd59a113088966aa670ae5c35fb8 | ORPH
   s390x     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/ce98b66b6035740d74d6a752c6d4f37f59d4ad22 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/129672f615560b812dc21bd5e5afac1dc722b43d |     
   armeb     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/6828fa6739228794c8b7bec6b478ad411444da78 |     
 microblaze  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/dc67a730f252f5bb84fcec6f843c7ce7f9507b97 | ORPH
    or1k     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/f1cb5111f804fcabf7ca5e57bb5f0e382b79e482 | ORPH
  powerpc    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/24e0adb07ebd3e15a66848f579353ea7fc9d66ae | ORPH
   nios2     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ffee87fcf3b563f28fb53e0a11d28c6ecc1a529c |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/17da430753b3cea20e03c3c6e98f89f840db3f9c |     
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/cc4f0b745e4b7183580b314583b6b39ed41642eb | ORPH
   nios2     | package/zabbix/zabbix.mk:14... | NOK | https://autobuild.buildroot.org/results/c1e032b7d645fa8b456835b16c9b5d83e482cae6 |     
    mips     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/74be0028b7e2c9656995c01028a97494602b3fb7 | ORPH
   s390x     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/53a6b4c290f1f478f56c28ba3b517607ce93bfb2 | ORPH
    mips     |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/8a9d81bb1e42ef76adc13a2f30e50dce951e5e3b | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5dcad0f3ae0cba9f9a664613ee4a7ced29612955 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0f795c3142435d3f4a7977f71e031cc77c9398b6 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8fbac95ddf41626407b0c8c3650bd6f8ea11f85c | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f7454b66121ee4688a674ae64f77a164277e8acd | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/12f19ad46f7b99fde077088a1c61a0bb244f1c90 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4e8001b3625f59111ac824bac9b8be707b07b5f7 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7967b84d87abaf064a5850eaa83cc46de6acd1aa | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bc54cbaa52ed2fd7da8655d50af0db57b543092b | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f61b23136b43495a48111a5a3fddf34829aa8b37 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/131755c7e6b70e11021d7ceaae55f9f3f95e4767 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/04d73b268404b30f6733bc7eb862643ef0092567 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b269c13b480cd5093fe66b2a2fce43a096947bdd | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b21ccb068a388936ae9359808dfa8e6c1280efff | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bcec4be0f96163fe4de2fd922536abf5355bfdb7 | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0b3fe851f6112a7133bd41677face8c260e7e684 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/19e75e4b63d9925a612da973b0eef16f6c1e38c9 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8b26d9a7f82cc3d0afa2393094c398d7f6b45862 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6d50d7753d967b764aa627aa5ed0c04d41a33258 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/17e0cdcb03d4886b48e9db0796fd817019392ad0 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a689b8e749904f19dd306938d61f47484df8cb11 | ORPH
 aarch64_be  |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/6ae64000b0ba00259c28de6ea00fc0eea855d639 |     
  powerpc    |         python3-3.12.6         | NOK | https://autobuild.buildroot.org/results/473d9435bd283bd2933f2a873ccec017a10b8f34 |     
   mipsel    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/81a84415e41219607285fa18bb1b6a03fd8f0808 |     
   mipsel    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/94bd618106b1273610012ba2f38547bab70a680c |     
 powerpc64   |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/dd62fcd896ca332b5b7300e8e50764b758771d40 |     
 aarch64_be  |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/70bc790b94830275b4b0f5ef5ee3453fa3e917cd |     
 powerpc64   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/4d41186ee9737c523beee11714121d0521519105 | ORPH
   armeb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/aaa3d197b31756fb38499081aebe7a5e66a64e12 |     
    sh4      |          sdl2-2.30.7           | NOK | https://autobuild.buildroot.org/results/943134bce421cd578ca43ee4622f1fc15c4f80f4 |     
powerpc64le  |          sdl2-2.30.7           | NOK | https://autobuild.buildroot.org/results/c30a4e73de598037ac071aab0e4aad2dee9122b6 |     
  sparc64    |          swipl-9.2.7           | NOK | https://autobuild.buildroot.org/results/5d2c0c12eceb4e595e7180f161fa9d99ce5fee14 |     
 microblaze  |          uhd-4.7.0.0           | NOK | https://autobuild.buildroot.org/results/fe51a5d88877fec451a2027c3162d71948c0bddf |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/242d076a689bb3302e3ab8f2d9b107ce30d921d7 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/c4eba946a8320554cc66bb00fa9498075bd236e2 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/241cc044f6462afc099c56e321d7a4538826096c |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/e15bf0beaed69beea25b6301bb8281572a0652c3 |     
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/70eb818308e496dcb70f84d08cbd984e5726648a | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/b85a821f16c2152d61b5d92e53a8178ba7533b26 | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/3fbb48db61f7c5fe84fe3432e23380b3949913cc |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/a79ab4f297c611dc1edf674867b81902c149f829 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
glibc-2.38-81-gc8cb4d2b86ec... | 1 
            host-cdrkit-1.1.11 | 1 
                host-go-1.22.7 | 1 
host-prelink-cross-a853a5d7... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/b5ea086fbbc4295fcdcb0d73880c173290b460ac |     
powerpc64le  | glibc-2.38-81-gc8cb4d2b86ec... | NOK | https://autobuild.buildroot.org/results/57693c1eeaab93f7242d7e96c6a65d4457fe27e8 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/22ccc468086ffa6c9836a4a7d70a5706a5788163 |     
   mips64    |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/b04c873fce70ce9d41ab9c53d3b397101756b145 |     
microblazeel | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/5ee1c131654ac815747d6d659317f0cfb802b835 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
                host-go-1.22.5 | 2 
                  bitcoin-26.2 | 1 
                   bzip2-1.0.8 | 1 
              cache-calibrator | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.2 | 1 
              fluent-bit-3.1.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                gnu-efi-3.0.18 | 1 
                 hddtemp-0.4.3 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  jack2-1.9.22 | 1 
          libcamera-apps-1.2.1 | 1 
                libglvnd-1.4.0 | 1 
             libopenh264-2.4.0 | 1 
              libopenssl-3.3.1 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                  ntpsec-1.2.3 | 1 
               procps-ng-4.0.4 | 1 
            python-sip-4.19.25 | 1 
                      x265-3.5 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-26.2          | NOK | https://autobuild.buildroot.org/results/7f86068c933fbf9c3573cd3e340999e8442852e8 |     
  riscv32    |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/dd2fcc2905411e092b0808759344d50e63215998 | ORPH
   x86_64    |        cache-calibrator        | NOK | https://autobuild.buildroot.org/results/e8337a60f54aaf569de11a0fefb4f0776b351dc4 |     
   arceb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/b69570859204b9df4ecadeecd5a82847201d999b | ORPH
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9a4ed149ea1238ecb93a8eed8b35ba68c9a06b0b |     
    arm      |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/42680cbcbd2ca6f2786927c9228ed2f2ac3aa6b5 |     
    i686     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/3acb7f6f8a53596efb36274b09447eab72ed9e07 | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/5f0e5e9aa573cfae9e572eb5c702a853b5b6b27f |     
   armeb     |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/948c3456eb44c8fd2da9a54cf838f62d7ef0030d |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4604e157b1a48a8d89febc3cc63578da6a0434db | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5655cae1f0d983d1356d0cb0266635791c93747c | ORPH
   nios2     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/2ff2abdda293ead7323f0ce3906b501bfb8a26bd |     
  riscv64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/77cd1d14bfa79eb17cbde5f7eb5d1edf3afdbe01 |     
  riscv64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/7c4113e2043cbcdbd6ed05a1f9f155d6458de5e4 |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/1ce542d5122b376884040e72efd4347222b249d4 | ORPH
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/ce167e3ee64e10d44ae513ac77efc9ea00c9801b |     
   sparc     |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/5aee4dc9e11288d767c079dd7181ff13311e48e1 |     
   xtensa    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/9e2b2bdc3fa37d5565dcfef304329c2a5e6eff93 | ORPH
    mips     |       libopenh264-2.4.0        | NOK | https://autobuild.buildroot.org/results/78614707108f595bdb856b7f1b3eb1cc6961a465 |     
microblazeel |        libopenssl-3.3.1        | NOK | https://autobuild.buildroot.org/results/d8ca1c358c7b0d081811aa2afc06c642cd789162 | ORPH
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e40172f89ce2307c7ac1725449edc65486e15877 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/591186dd226ffe42cf6312707ff91a5b64c2455d | ORPH
   mipsel    |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/45cce118fb0e9b8a81b95e028205c2f190ffe6a3 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e8085114f357f1df4979c91f5d3cd52155c2cf17 | ORPH
  sparc64    |       python-sip-4.19.25       | NOK | https://autobuild.buildroot.org/results/8f24656f3a66d21f2d3c6d6b1adc6bb5f1c0c801 |     
  aarch64    |            x265-3.5            | NOK | https://autobuild.buildroot.org/results/f7f0449f646edc25d12962e8b434ee6dd7110fd9 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

             host-delve-1.22.1 | 1 
             libargtable2-2.13 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       host-delve-1.22.1        | NOK | https://autobuild.buildroot.org/results/f0ef89f12fbf6232702e5a736cea3abf52443624 |     
   mips64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/c7c9870e7c5031a3c3d188adb0bbd2d9b77eb8a2 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

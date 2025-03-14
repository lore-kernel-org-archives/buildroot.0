Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF02C28B2F
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 04:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53CEF60F35;
	Fri, 14 Mar 2025 04:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReTParaKh_pT; Fri, 14 Mar 2025 04:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC70660ED4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC70660ED4;
	Fri, 14 Mar 2025 04:14:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2289C8
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 04:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9588880F30
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 04:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEIqXik_5cOb for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 04:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32B3E80F06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32B3E80F06
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32B3E80F06
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 04:14:42 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e6194e9d2cso2981282a12.2
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 21:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741925680; x=1742530480;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JxK/2DXZoK6n9SgcxlzydmnATxicnuu5qy8cfFkghxw=;
 b=xPAOWDT1mxGLqhMrdlmSCK8z4s4GxQdxVM9NQwMQ3dRPVP7ZyoK/wnzouvUfMB9fV0
 S+LBjJAnrovGpTimdAK8bmpOrdKIX1OARPiNCPkXXek0nlmke+OwVybWnNiDAlp6CW4K
 ZKA9Cy9fBhUzvkycOiE3ng8qVJ60RdN+ZIQXJmB3cAxc+EVZDUd0u6GMNhXXhceVhKGE
 NbwxqkSwycybG9LNhgd8ibjoBa3uJxX7KCZi74i5ddno2hj8Ul7XUUd1DZ08CbkkVC3L
 iYfZn9UulgCmCBhw3wdARZ2L/6xiuXN94eSynunSBQJsIVNGvK2728mlET5AYdc3O3mu
 eDSw==
X-Gm-Message-State: AOJu0Yy3Gg0lxzCfHmI5UU6AqHRihOvkZSe+gP1rYfQvsOAUIvvMRrgR
 tH5o52HJTq000bzomFvKzHLtlSFn9SJNksbOoXx4hnrBOtPLBSMPK7cO2A==
X-Gm-Gg: ASbGncubSLdW9/WPvhlByPmVRbLKBiI+wlaSMdR68OaMp5IrJrZxDwRmHSu5RqRN4qH
 ruTp6DWItWVj/3Mz3HpuXQTclEFsAnRWFlAStMfiLXrWhijk5aSOZYNCdXffov7Os6ZycJzTOAd
 vUvuraxh5vSWi1iEEC43umQbGgL6v319KTu3UCNxOYtqiDGGk7MmX+neR3OlNAVL/b3cXQMXsC/
 LOsBHBoCQ1syD1fuL3wTdnSFnYyU/fQjtwUFifdGX37hnWmZDtuYma7ejTgxJKxI+0D7MuZL349
 4HZgkJ56aV3OfbM0TMzyl9MrdqY4n8198dEQqK7GH89u7Q6LBGHOC4Fc154=
X-Google-Smtp-Source: AGHT+IGyHf23M5lfWi1VVDoYVhw5XHeUR2dNqWkqCtGyfOH2grzbVa1FJcp+GRJS5hvGpu9P8BxhEQ==
X-Received: by 2002:a05:6402:35d4:b0:5e7:c42d:d8ca with SMTP id
 4fb4d7f45d1cf-5e89fa44f3bmr948331a12.14.1741925680139; 
 Thu, 13 Mar 2025 21:14:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e81692e6d4sm1426973a12.9.2025.03.13.21.14.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 21:14:39 -0700 (PDT)
Message-ID: <67d3ad2f.050a0220.294f49.5444@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 14 Mar 2025 04:14:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741925680; x=1742530480; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=JxK/2DXZoK6n9SgcxlzydmnATxicnuu5qy8cfFkghxw=;
 b=RD9+n8Bjy+bXDiVlY9Cs06qxOSEGcbmyG9URsU1ATbdK3wf7Lti+J0dJ8XWgDHGhk+
 hYb2YxrMNPJ/rPm3HtqVTHJnjQufGk1LHVyyDNsOr8i1KDcEh2wgEHr4Kx50l/cNEImJ
 58peO1CAWPNTSANSoh/Z9cdSaeAfHnDJ4I4QgivzH8W/23ZJiES3FCOz+vshbfKxKJi6
 lYitSSrYZfppfMJYB0fKfZm8VIrC/qpYeh4d9IN7w+pQacBhpUeNfMEE8SlfBxFDhfer
 kNalBP97/ZPHeKjGCXdAc0DyYAuW9cecCwLFWU8adl1wrKzVEePZv1/HJ9pc0+SNnkZC
 xZGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RD9+n8Bj
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-13
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

Autobuild statistics for 2025-03-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  2  |  0  |  2  |
  2024.11.x  |  4  |  6  |  0  | 10  |
    master   | 14  | 46  |  0  | 60  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 4 
                   linux-tools | 3 
                   perl-5.40.1 | 3 
                elfutils-0.192 | 2 
              host-rust-1.82.0 | 2 
                  rt-tests-2.8 | 2 
                 apitrace-10.0 | 1 
             batman-adv-2024.4 | 1 
                  bitcoin-28.0 | 1 
                 dhcp-4.4.3-P1 | 1 
                  dpdk-24.11.1 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
                 gerbera-2.4.1 | 1 
  gobject-introspection-1.82.0 | 1 
    host-mender-artifact-4.0.0 | 1 
igt-gpu-tools-0ee4074685c1e... | 1 
             libargtable2-2.13 | 1 
                 libcddb-1.3.2 | 1 
                libesmtp-1.1.0 | 1 
                  libnss-3.108 | 1 
              libopenssl-3.4.1 | 1 
                libsoup3-3.6.1 | 1 
                 libssh-0.11.1 | 1 
                 libv4l-1.28.1 | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.12.18 | 1 
              luabitop-1.0.2-1 | 1 
                     lxc-5.0.3 | 1 
                memtest86-7.20 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.29 | 1 
                 openssh-9.9p2 | 1 
               owl-linux-1.0.7 | 1 
squeezelite-71c012ad9ba102f... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/dc6605c7f1688ea182b034fee5d7d9c11e6995a2 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/4940aac10fdb7489729e25c10463edf73a22f11e |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/2201f1662302881e1d34b2dbe3ea045f5d21d02c |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/2a062027bcdcaff036a6f10c13929d59b086fa83 | ORPH
   x86_64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/636bef191e0306c69a3e0c24e61fda299371fe85 |     
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ac07567fb0742cd492ef82f63574edfb08687d29 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cfa27df694e7ca41d1da6ffb2265dce329a7623c | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ad0fe63986eb5ceb70b07be6cf995cb1d12da81d |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/aea77faeed8dd5885aa6ed49db5809e91f881f99 | ORPH
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/6877241060b696d23991b67042ce192adfbd6314 |     
microblazeel |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/76dacd55062d8e351944907be446a57ed3a70ee6 |     
   sh4aeb    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/2a4431fcf8934584c4f414faf1d42240c8b4d9b1 | ORPH
  riscv64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/50fce9db074a93276ccbe8c7e4d8b4e36849c756 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/828fb731773bca8a2526872823976fbf8e09f57a |     
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/eee65a6b27a35484a2897afb4564135e1d773985 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/12b4ea1890bc426b1c3e9971b7f960ac29b63b64 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/eaf43c4f9a8ea918097bf16658a69a3570275702 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d0caa1ecd193d4cb9da4b33811db7a107ae5074d |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/66ebe070b3a1a1a05b7b71088fdfc5d2b4dae3db |     
 microblaze  | igt-gpu-tools-0ee4074685c1e... | NOK | https://autobuild.buildroot.org/results/bdb2f0d550be9e2332ebc8b6fc1dc5d1e5ca1d06 |     
  sparc64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/a9b8b987aeefe33c498f0581ad490dc385df15d4 | ORPH
powerpc64le  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/66e3379fda0b092040038f762edbc89e7e1542b6 |     
   mips64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/46fa3c7d4df269aab35cee5b1f651f51425676a1 | ORPH
    arm      |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/12da67afd3e0c8172a86dfcffb4f20862a4e9b6d |     
   arceb     |        libopenssl-3.4.1        | NOK | https://autobuild.buildroot.org/results/58c029d3a1ea6dc72686980bfb04d277e816ce59 | ORPH
   mipsel    |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/c0272eb264c9cd0cf476316fec1eb834fc0419cc |     
    i686     |         libssh-0.11.1          | NOK | https://autobuild.buildroot.org/results/0cf6576082420861f7f387e1b92a32bd677a7f45 | ORPH
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/2cafea8e7193b35b3053e0a7d86b1272e5c37764 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/87cf5303f6f9fdcfb314e887b3f8ca47cbfb8e06 | ORPH
   xtensa    |         linux-6.12.18          | NOK | https://autobuild.buildroot.org/results/30ad3388371c7656ed2cfaa3752ac79bc5fd4006 | ORPH
    mips     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/590eead97f7aaa893bb13c959ce0a418a5217be8 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/d1604901c9a0a3b83263953abd4cc9bfe4afba86 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/567e85101e106923e17722bd56f13bd4ec7404c5 | ORPH
   armeb     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/d4986f37bd1d73f8d94509772007acaf5e486224 |     
 aarch64_be  |           lxc-5.0.3            | NOK | https://autobuild.buildroot.org/results/17db2648b889b54602c57a318a926f55997c1f1d |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/bc7022af7e7ad335c7a486a05edee64e53cb85a8 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7ba6a1017db93e3ed88e91e7710ed3241420fe63 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/266509701157fe70b0d838c69270326f398da5d3 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/3a862d7f0138310b46b05f12defe152bace4424e | ORPH
   armeb     |        owl-linux-1.0.7         | NOK | https://autobuild.buildroot.org/results/f370f5babbe36c73b823874574eafc6e3449979b |     
    or1k     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/6793407e9c7b3a3cfd1abda54dbfecb9cfb2be3d |     
 aarch64_be  |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/a06e40deb5318fd3029b9386abbcbe83b4221d48 |     
   x86_64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/e0663c7aadab0b422cb5877aaa21ddb4aa79dfac |     
 powerpc64   |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/92462fe78fcae48fdeeb6f56979a6402ce203341 |     
    i686     |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/30308c74291004c328d6c3603ce68d600c5ef281 |     
   s390x     | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/5ac9156d5c0f446f0cd199166f2721e499e88033 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   foot-1.16.2 | 1 
        host-python-lxml-5.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/cc57862f0525f507402f863cdcbd155f3df20a5d |     
    mips     |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/e5c0067747cc616b1e0cc06ff2c94d9fa07950b6 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                      cctz-2.4 | 1 
            gettext-gnu-0.22.4 | 1 
                libesmtp-1.1.0 | 1 
                memtest86-6.20 | 1 
               pulseaudio-17.0 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |            cctz-2.4            | NOK | https://autobuild.buildroot.org/results/c2ab7f09a3649ee0cdebcaf9d645578cad424c41 |     
 microblaze  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/e52eb8d4296f02086d171a0e0b20efcb8e2139f7 | ORPH
   sparc     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/c89235c864c75be7de8155e0a0cf99cb2117f8bc | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/757536c455e7eaa1d802414fa019ad3a1ba4da23 |     
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ee356ee070eabf6e604611a19b740f71e0a0a9a1 | ORPH
 aarch64_be  |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/584ff22c623a6e44398db999ba248bffb3bd4d04 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

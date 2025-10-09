Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135A9CCA470
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 03:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5C061054;
	Thu,  9 Oct 2025 03:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haaHZQRxRvTd; Thu,  9 Oct 2025 03:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD256105B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD256105B;
	Thu,  9 Oct 2025 03:24:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3138921B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 03:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 228F961066
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 03:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJRlcnlKEOYq for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 03:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 677FB61059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 677FB61059
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 677FB61059
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 03:24:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so286268f8f.2
 for <buildroot@buildroot.org>; Wed, 08 Oct 2025 20:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759980267; x=1760585067;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPndTURkQXK613BZiwDPbk/JtWT4s2BHDa8LpIYcq/c=;
 b=wlbid11Enei/IvIHxukkCs2toWYoqaarX008FMW7diRkpaNIFFWUmyYXew8B7WRvCo
 pApdob+f3C2v0sH9zje6XFUIh9bZroFN0sGNARRJpBPzGlPvIQdmk/J0HsXgQ15v6Z8U
 EJoMlx2QhIoUxJTADXUiZcpQ2l6T5HrCPUhT0vxTyhqm8Xf0zFcDBNaK6fj2oBQmOplc
 53GJl6nXN6S3afCO9ldlJrgmTf6QydJckHAHLI9addl9jtMsBe+J69sAa0rwrg0Eo58m
 mH6+UnwyNP4sKidahvGuBRHTuqt/VdDyIhiJxwrDS911u8daQRItrT62MbgdIjDuRGXT
 lOaw==
X-Gm-Message-State: AOJu0YxM1MDc2+IfgC4xXvJwq1XgEsstFKj2RvoSXoXhz6Hjy3q1nwfj
 +OLs7Lt+OtxDgNxNWSu+XLsgsDIkXylhFQQMjRQar3578HBgeLbSODdpG3Nl3w==
X-Gm-Gg: ASbGnctwylVN7YUU7qV0VlUGVXJ4DDg77XEgFBE6ZJ0FNc88RnB5xEdAEh9uCCd3G15
 r1L3CZDjyrMpmpAzYxxxegN31jvMgJj5NlgkkJw6oplSsY708U9l2Y8ZWOJXyed50SQIslyGD6y
 Vv8WxK5ppvS+Vc23hJ3nW9oYCBC/+s30MTUS1iSxgm1tEwBOhoeivujzWFx8KnWLL4H3qUd0c/3
 chQM+G9e0WYRgYb/+tdInZzBy7kVkwCiEnZHBGnikW5hgP/x/BQ3i3Nq4SGERSbsVwGsVQ+6qBy
 U5jyVhdAcu979pkdYOpC6LdHKf5wI0TilSM1c/+mwGGcIFbfNHYDnZodb/TZa9cVpoaYkt+ZzF6
 uNzIK6fwvImsnLhGH0xUgiV/MTI8ErYm7aL3GPBeHn/OhAsJGRWFCMBB7tr0Dk0qa
X-Google-Smtp-Source: AGHT+IG9a8trq3bye+MwWx45hiBvqUBDPkTOXYF7D14BjnHto/7ZkqJH2gmPQJUWw8kBKowTpDV9hA==
X-Received: by 2002:a05:6000:2f83:b0:3e4:f194:2886 with SMTP id
 ffacd0b85a97d-426670835d8mr3245080f8f.19.1759980266953; 
 Wed, 08 Oct 2025 20:24:26 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6c3esm32781647f8f.1.2025.10.08.20.24.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 20:24:26 -0700 (PDT)
Message-ID: <68e72aea.5d0a0220.f1dca.b34f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 09 Oct 2025 03:24:26 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759980267; x=1760585067; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rPndTURkQXK613BZiwDPbk/JtWT4s2BHDa8LpIYcq/c=;
 b=Y2pv5NHHQ4pDqM18hs+VN2k6U8Sp1wcR8H39I9viJW9pwq2NucnqxIBDHVys96fgCA
 IoBM87jty77VpRN8MvgrIVZSijpWKcy64vC2KvLlM0xYiOXmDZIiY4Zw5e46YVgAj699
 EO2dD93+KhxYbA/1woidgm1bo9JLkGjEqJmdFdrIES8PNdOE9F25tCh0ZEnqcrAEBpWs
 3eVvHXcsNkZoCvHFRzSKMWO1qDZh5bPP+fculRl9mP64YHbJBQWED9CUPS4nM8gs+CcL
 yLe59MlqiJN2gCZH+V/DSdIHJNKEHgM2VPrzMErE55X5pDxP8idYAlqlOlLSNBSCjC2u
 GGKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y2pv5NHH
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-08
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

Autobuild statistics for 2025-10-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  5  |  0  | 13  |
  2025.05.x  |  1  |  2  |  0  |  3  |
  2025.08.x  |  0  |  4  |  0  |  4  |
    master   | 36  | 89  |  1  | 126 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 3 
                      fio-3.41 | 3 
libdbi-drivers-0bfae6c43134... | 3 
                   perl-5.40.2 | 3 
                       unknown | 3 
             dahdi-linux-3.3.0 | 2 
               host-gawk-5.3.2 | 2 
    host-llvm-libunwind-20.1.8 | 2 
                libcurl-8.16.0 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
              libopenssl-3.5.4 | 2 
                libselinux-3.9 | 2 
                  linux-6.17.1 | 2 
               mongrel2-1.13.0 | 2 
                openntpd-6.8p1 | 2 
                python3-3.13.7 | 2 
               asterisk-22.3.0 | 1 
               bctoolbox-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
                 c-icap-0.5.10 | 1 
                 cdrkit-1.1.11 | 1 
                  cpulimit-0.2 | 1 
                     crun-1.22 | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
                  dpdk-24.11.1 | 1 
                enscript-1.6.6 | 1 
                    ficl-4.1.0 | 1 
               freeipmi-1.6.16 | 1 
                 fwupd-efi-1.7 | 1 
                    gawk-5.3.1 | 1 
  gobject-introspection-1.84.0 | 1 
                   gpsd-3.26.1 | 1 
               graphene-1.10.8 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
           host-python3-3.13.7 | 1 
              host-rust-1.88.0 | 1 
               iptables-1.8.11 | 1 
                 lcdproc-0.5.9 | 1 
                lesstif-0.95.2 | 1 
                  libbpf-1.5.0 | 1 
                  libjwt-3.2.0 | 1 
              libmhash-0.9.9.9 | 1 
     libphidget-2.1.9.20190409 | 1 
                libroxml-3.0.2 | 1 
                  libsepol-3.9 | 1 
                  libsvg-0.1.4 | 1 
libuci-f3fc0b76040685829191... | 1 
               libunwind-1.8.1 | 1 
               linknx-0.0.1.38 | 1 
          linux-5.10.162-cip24 | 1 
                    linux-6.17 | 1 
                 linux-headers | 1 
                 lockdev-1.0.3 | 1 
        ltp-testsuite-20250530 | 1 
                    mpir-3.0.0 | 1 
               php-apcu-5.1.22 | 1 
                     pound-4.8 | 1 
             python-webpy-0.62 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                    sdl-1.2.15 | 1 
                 siproxd-0.8.3 | 1 
      softether-4.30-9700-beta | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.3 | 1 
                  vsftpd-3.0.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/c3d531516ca5d9d8864cb8d3faf498d8ea6b5abc |     
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8100922d5eab874f7c8370560d37b02bd9d8c377 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d5f790879e1dac97625cd8490b469d6a3bfa6f47 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/4f4a27e9875953313d9ad323273ab31a4af69263 | ORPH
    arc      |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/9fc359bd87a1e570b57433124504d17b592ee7a9 |     
  powerpc    |          cpulimit-0.2          | NOK | https://autobuild.buildroot.org/results/8592e4eb5959124acc885a1cbc2f9d24fb7bcbd1 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/324496e82136a534eb94cafde131cd9245a530b5 |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4bbe30a39ba1a506ea54b225023103456577f289 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3fc8819afeed0b7f5f10f606976acd1265c2e454 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1957c58711f5064696b05a28930f161a00eacae8 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/59d8275a04a408549ad30e212fd9a54903ca9373 | ORPH
  riscv32    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/927eddcf6381d4acc64beab06c23feaad3cb40e9 | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/feb689b80b78448b5eeac8548d417be290e4b71c | ORPH
    arm      |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/3ff9d2ac50d5c8942134a1fc433b35f3874fe952 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/37137d7c2969ace4e2f40a1aa5a7799c47c76716 |     
    mips     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/4ace0bdd1c5b371f6aeeaf10338ca2ebc6fcb248 | ORPH
microblazeel |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/3403d501cb67cbfd0736da9a936b9bd62f056e21 |     
 aarch64_be  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/7984e9a00f01715576ca86b501ba2325c6973a0d |     
  aarch64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/b758d0856f5692a7f421d3fb85b618b09bdc5ad6 |     
   mipsel    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/c45acf8263da0179fc707f54d04a90aa7c8111d7 |     
  powerpc    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/c64f9ac5eb8bd8e8613fb3df5c1be4c5ac7d6d4f |     
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/6f855868e34e52b1eb823e0a84453da9550b39a6 |     
   s390x     |           gawk-5.3.1           | NOK | https://autobuild.buildroot.org/results/444e24b6c8d7f1f97f63a26d7a1a7544d1b3dba6 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/aa3143381fb28ff926b64c844bf7bfbec4d2034a | ORPH
  aarch64    |          gpsd-3.26.1           | NOK | https://autobuild.buildroot.org/results/52d747d33d714ea10b9e7ee10adeadd9e4512c2d |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/bba98a2578a26ec342f52666bcab53eef63132d8 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/96f2cecfe0b022eda8e5170e98e3d0217fcab7bd |     
   x86_64    |        host-gawk-5.3.2         | NOK | https://autobuild.buildroot.org/results/60823597b29e212b7cb70cd7446c75eea79ba864 | ORPH
 microblaze  |        host-gawk-5.3.2         | NOK | https://autobuild.buildroot.org/results/e53eae3b86f8bbca12f6806bbe040bc5430cccfb | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/e9507e37dc029f4f2a8158561c66f3825962ee67 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6e930524a9bb384723763d5b56535d5c40a7fbd6 | ORPH
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/fbfccf6a28b2411084576577143eefee610fc128 |     
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/558414abbbfabe0b9f6104ae646f242ed4e585e6 |     
  aarch64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/5f1661d4b3d5d2ea64d72aab19d67a0884ca83b8 |     
 powerpc64   |      host-python3-3.13.7       | NOK | https://autobuild.buildroot.org/results/ddb21089cc104e9c786a26b413a2be1fe506aeab |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/12fadf86ee19274f7d55dca090f7936ba66627f8 |     
loongarch64  |        iptables-1.8.11         | NOK | https://autobuild.buildroot.org/results/bf0d4fab4653699f666b9271353da32df6542572 | ORPH
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/0d792fe81589a4f2ae212f256a74672a66fcda56 | ORPH
powerpc64le  |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/82bf711806ee84c1e6c3c7bacb67b0980f8513d3 | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/e9344e4a2c5ba2ab799e31fc990ae5cdc49b94a6 |     
    or1k     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/9675a2b7300194351f3895e7b0cd37546ee5b11d |     
   x86_64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/9198946ff4d3b9d0d9a5b712f4799cb7603de053 |     
   arceb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d6e567a118dbe0036b963704f6da177f7bdf056f |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f95c2ccc3a503fe5ffd736488ebcc2e2be2bf264 |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/15a8c7d7f499bcd34818c848c3593fc70d8f28a2 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/8126fe39ae19dc5566c10c8ff69f0b4b20268708 |     
  riscv64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/9e7f2a8e7cbd197ff078c852ac0c85f668b5f340 |     
    arc      |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/f44ab543e44bc1d9ca11175f39887263a7be48b9 |     
powerpc64le  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/f7b024566154b1ecec9dcbab9afc0a49a398bec8 | ORPH
   mipsel    |        libopenssl-3.5.4        | NOK | https://autobuild.buildroot.org/results/c4c217f2931cb8a9be783390a77535e40c21faa8 | ORPH
    arc      |        libopenssl-3.5.4        | NOK | https://autobuild.buildroot.org/results/3c63af36a3cc5f4bb6830a0b529c64e994b3266f | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b1d8a94eddf2e633a1c4bb0229ad30e03ea45577 |     
    mips     |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/f45239277db8a2d3a91d223805f11aabf5f078ef |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e1423ad69d0258f4d9a47c525cd19db3ffb0aace |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/4e33b430a41eea7432112d78b6f8ed101caac938 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/4788a476319d2ba8012af56b47f634c9b12a065d |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/ae7ec5173a4b1c13d765ea3dc3f144e2ff8b97e0 |     
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/5ae4c70f451dc8e4e5cdf3297828ee7a1f7d7142 |     
    arm      |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/5693006188322fab088d9ce1b2280ea2c4a394e7 | ORPH
  aarch64    |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/2996e1d209116db06363a2ab6726445c6f31fb75 | ORPH
 aarch64_be  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6dc1392ccf550bdca34501fe0768fc089cd26ffe | ORPH
powerpc64le  |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/c21e6fbd198a93b8810ea604331412d2c4447723 | ORPH
   sh4aeb    |          linux-6.17.1          | NOK | https://autobuild.buildroot.org/results/535c1bee3f20302eb676ec297aa1aeb0a75b3ada | ORPH
   mipsel    |          linux-6.17.1          | NOK | https://autobuild.buildroot.org/results/61a4bd0f4c08e70ddc65592d84040dc3c6939e46 | ORPH
    sh4a     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/582fd5949f5d38621032a68ed6c389118042fd49 |     
loongarch64  |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/dec5affcb35f9310a1c70c4e2532f0289d2e2a6f | ORPH
   x86_64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/8f800aa78977fe91516104efed4b9ae615a0ac04 |     
 aarch64_be  |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/8d4e8ee3412e7cad068b456d59d113b8de4bf096 |     
microblazeel |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/4946dae338c60a6785f93595dd8c41167db16d0d |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fe73338d46d0eb10849ccea00b7cb3090fef7fbc |     
   mipsel    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/bbc18ac7c4a13f54e13713d9ef9149e85cff9979 | ORPH
powerpc64le  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/7ca813e775ca18ae71918f67a4b171094d20abaf | ORPH
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a8f05d83bee75bdb79177e0efb9ab7c9fb4d8318 |     
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a6fd9cd4b25db06c464e60180606d1ab33d0a551 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/04c44164bddd78cf3300f212a22a997d60e8c939 |     
microblazeel |        php-apcu-5.1.22         | NOK | https://autobuild.buildroot.org/results/568d112ff9bddc7e24b23efb8022ab8d87897c3f |     
 aarch64_be  |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/b19e1fa8cf814741fe607afb9f433c254e15653f | ORPH
  mips64el   |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/d9481311e28c6f33b2d98e29a9010a546a8c4ce3 |     
    sh4      |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/ea7feccc1337d6c8b66a8396db61628c0515e153 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/b06ecf3c62adefe19675490022e1489f970ca871 |     
 aarch64_be  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/59fd2e0896e3a812fabadce8be13b18032b44f5b |     
    i586     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/244b4a19a6665d8f3077d468d9704311608003d5 | ORPH
   mips64    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/ba44b4bb8316c242881b7a084bc5c2cec69cb58c |     
microblazeel |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/d001024e8ee573a529dab554ec9ceb391bcfc76b | ORPH
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/efef684fc639439bba5877e7c716e087e68fc8dd |     
  powerpc    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/1b47b0e15976161b4594e403378e8494d2ccadae |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/c289509774363b37bc7c26a4834fc1d9d597f000 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/1265818ed6d6dea6e5f0bdcc7e29485c05e96cd1 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/4a9b6b186109978cd87449d97f4ce40a1a1d0b43 |     
microblazeel |          vsftpd-3.0.5          | NOK | https://autobuild.buildroot.org/results/864af1adc5ff32bb63381d4f08b6d588472a1dc8 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                   cvs-1.12.13 | 1 
  gobject-introspection-1.84.0 | 1 
                 libbson-1.9.5 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e5c3db1d3fa9b724fcbda1452a7ea27c904f6716 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/06d97cc72e138cdf5ae39aaac7281d8bacb541fa | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/693447e1cb521b373507de92f283edd4893abd41 | ORPH
  riscv64    |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/d02d35c9d01089a7a945663f5f1984953df15f16 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
                  iozone-3.506 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                 sudo-1.9.17p1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9fd709dfce4a7f6cf3c349d3a3903e71e70f473b | ORPH
    arc      | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/9627251e9f62f6e6ca04c5e5db8a820d3e2d1885 |     
microblazeel |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/4b37c3fef95cea68e105836aba9c1719a3549d36 |     
 powerpc64   |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/e86af6b37ec41e3164473be187aab144f9a0f066 |     
   armeb     |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/398f99fb1710170f839f781229b284a78b2abcdd | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   fwupd-2.0.4 | 1 
                libsepol-3.8.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/4a4afa6c9e76412ca67b615f388c50ae73c47e16 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/9e609491b383a5c28ba5535b50662aaf0676d3c4 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

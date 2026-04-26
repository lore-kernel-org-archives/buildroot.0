Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA92FF8850
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 03:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14FF542375;
	Sun, 26 Apr 2026 03:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDm_r4xMKU-g; Sun, 26 Apr 2026 03:18:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD5E842376
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777173527;
	bh=7RRfG7b31oOx/mW60ktXSll++8wbRb1bjrRjmE0yEKk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cLjcm19KksA0EkOIBNviHBwrCmXxer2aPczgtNdryfEpOZGvBfl1J7DXd5Cd+ZzSD
	 2orN9qdoXKnr0KJB4usfyr+c40MORqyesllpw2nvdZDkG9xEKmMxk2J5n/sJm4kayr
	 eNHkBCrt+df7SMadNE+TRy1Fu6uRW70SJVbaJTU0LjzXiei8R+yNUXdy1DgKTMLUfe
	 2K2M6fOAH07ONCXa/6uUMocX6j6vaDpignRxnAiR0VnuEcq6I0i8r58wWdWMapU3FZ
	 e8uGGb73gtY2ZVMUQT/3fJSxKknxYOEx3MCPUSRoZOeC6iiPQFb5nNP6Ip6t1/H4wq
	 D010nKNuFVyvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD5E842376;
	Sun, 26 Apr 2026 03:18:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E62F0231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 03:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C207F42376
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 03:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG6ypJJ7X0k2 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 03:18:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2220742375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2220742375
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2220742375
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 03:18:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4891f625344so78867995e9.0
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 20:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777173521; x=1777778321;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQggqs1zFkfGCIiy4N8JgTT483lwPUnjNi/RyLofl24=;
 b=Bdru0WET/J/eUqnWYEH1CJCrA7HVPVLdhRsArwe8LOreCAFPEnsSLAYtZDNSmvPNUu
 6/Hjq4ft0iPW9XoypYVLvORLDjQmppQfvI6ZurxxSoW/7Ee3E/+PPUrCG3WmDAf5Zs2o
 TYJHobTBwdAusafyI7mK8r4y5OhmbEcI7dW9FYaEZZwDGcj7wtVo2zQ87sd/xKolOYGk
 oczLE0V1OVZ5aS3K8Jk2yPMKyW52FDDjcHqlOQUm3OqR+7ksh6QHIIsKphOH9z/gZCOA
 qN00vrjCohx19qJ6G3bzFk3FM0SG8NO7kfrpsCAxNh5zpAfLoIpbnYeMyZO54sAONnZ1
 /eJg==
X-Gm-Message-State: AOJu0YwXjb+gkESgPkuw4Ru5ZmFm/IzlNXyUM6j53Fs0AcLUtt5FzyJD
 yzRw6UoqrNc/AZtoHlAV6t5KlxS40SF/5akw544avm4UsX/Z+8tcqGyu7K6W3Zbs
X-Gm-Gg: AeBDiesX57JhhYpnQxBDO+NKNwKwSfSZRk0H54uK/sMZGL/fq1nZAzn9b7U+PykrRlD
 ouT/jKQvI3uF4MDbb3RuAkG1LzoK/Q7tq9mH8WQcsft8yZvRGDvlCNXacRKFLymUFATjyvyqeTJ
 7hJcIpwySlC/GW3+2Nn5eKR/wzpPpFJxXOFOORH5ws3Gg41upGHpnfBKoPsoG26DLYq3Euvf1WW
 0Y0U6eU/huJezZbpicj3Pv9KcIIcaZ55AAsuj6mlWLeAWxFfE7zBiUfa+HaiIWDwuhDNhiaNepy
 HuxODPOiFubK/pFNL+FWf6gj1JMoWPSE7jRIND2OCUSsFAmfEMqRHZOGvyResb7uYVN20MnPiw6
 BdOt9Wn2UbmquJowG0OhA29+JouYzp/g2wcDou5BkkHFdC88DcChSmnjQUo3ZAF83r9/0nvHyrA
 XbIGpEMZd9pL0TjkyCQnXObIfxdpq4nF59ki89N+0n
X-Received: by 2002:a05:600c:19d3:b0:48a:55ec:c007 with SMTP id
 5b1f17b1804b1-48a55ecc113mr294159425e9.15.1777173520526; 
 Sat, 25 Apr 2026 20:18:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc10777csm787015695e9.8.2026.04.25.20.18.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2026 20:18:40 -0700 (PDT)
Message-ID: <69ed8410.050a0220.3c0943.f949@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 26 Apr 2026 03:18:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777173521; x=1777778321; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bQggqs1zFkfGCIiy4N8JgTT483lwPUnjNi/RyLofl24=;
 b=JkkQXTSfOzSeJD/HCX1jt4YpfRC9wkVYSlEju4c+MKmTDb2CBj3xVjU6vUv7W18V5l
 2qtm5pxKuEd90ILPJkPigyUdzwtwhlL/KhAZ76DCtAmevsgQd95YvLv8GXUbYP+zjhCh
 +/mDNd0rbUywGczK1D8lngPveXCm/AoD8s8CrHoqIbqfr8NElvaXa5m15KEyYSCQecv5
 jzp7uZlzw0XuRSeJ7Fah7vCDrpCx+YpJvvqZd/JOF2Q6Xl1KAjIqLqmRl13TFfmMwe7x
 FoftpbH+FFyPSEpfvjXFMkKVskLqvzkpjRXnj8FcqK2ruQ5OscI38GK3WV3vikZuW34R
 fx9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JkkQXTSf
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-25
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

Autobuild statistics for 2026-04-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 17  |  0  | 24  |
  2026.02.x  |  4  |  4  |  0  |  8  |
    master   | 36  | 81  |  4  | 121 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
             util-linux-2.41.4 | 5 
libdill-32d0e8b733416208e04... | 4 
odhcp6c-f19dd37fb467c9cf10c... | 4 
            18xx-ti-utils-R8.8 | 2 
             dahdi-linux-3.3.0 | 2 
glibc-2.43-17-gdd9945c0ba40... | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-15.2 | 2 
                 linux-headers | 2 
                   perl-5.42.2 | 2 
phidgetwebservice-2.1.9.201... | 2 
        s6-linux-utils-2.6.2.1 | 2 
                 sqlite-3.53.0 | 2 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  boinc-8.2.11 | 1 
          cloudflared-2025.8.1 | 1 
                   dante-1.4.4 | 1 
                  davfs2-1.7.3 | 1 
  distribution-registry-v3.0.0 | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-c42a3bc53da8... | 1 
            gdk-pixbuf-2.42.12 | 1 
                graphicsmagick | 1 
      gst1-plugins-bad-1.24.13 | 1 
host-am335x-pru-package-5f3... | 1 
   host-bootgen-xilinx_v2025.2 | 1 
                 host-gdb-14.2 | 1 
                     host-rust | 1 
               iptables-1.8.11 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                jemalloc-5.3.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
                 lcdproc-0.5.9 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                    libev-4.33 | 1 
           libmicrohttpd-1.0.5 | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.2 | 1 
              libsodium-1.0.20 | 1 
          linux-5.10.246-cip66 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   linux-7.0.1 | 1 
                   linux-tools | 1 
                   ltris-1.3.2 | 1 
           mawk-1.3.4-20250131 | 1 
            minizip-zlib-1.3.1 | 1 
               nushell-0.108.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   ptpd2-2.3.1 | 1 
           python-brotli-1.2.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
         s6-linux-init-1.1.2.1 | 1 
      shadowsocks-libev-v3.3.6 | 1 
               tcf-agent-1.8.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
        util-linux-libs-2.41.4 | 1 
               valgrind-3.26.0 | 1 
                 wolfssl-5.9.1 | 1 
                  xerces-3.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/49ac702186c4eae154fb888f64aefbfb269e7f48 |     
   sparc     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/6d31a0ea9b5d0a32c784cfadd0a081bd6a016624 |     
  mips64el   | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/921b9e3acc105224368505d5ae0dc84d9e18ca23 |     
    or1k     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/b969d10a06706414a11d2a682d27236d3dc7a923 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/2b2e4a7276c55844f4ea4f28abc7e36e27a419cd |     
   sh4eb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/87c52650ed20fb623e33b7c87c826ec38c056882 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b5ed1a288cfa340dce43777305b29adc5665f94e | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/013c0aa0352b6f837bb7074f3854842e4a340656 | ORPH
   mipsel    |          davfs2-1.7.3          | NOK | https://autobuild.buildroot.org/results/8ca1b13f168d42d36aef0c634e5cdeb26213a592 | ORPH
    arm      |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/9255edc1b055e3454daf36335a9d33a3079bdc27 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/2114fc779d61eff7e738a736fd27e68e1764c9c0 | ORPH
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/79e41b5408e35e506970f733f89be837de7958e2 |     
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/990f006cbeacfffb6755d96fca61540064c0ef31 | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/c436a68d373906deafa6f3bdf2f419d5434d9069 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/64115d7c4961c190699af7c81f942dbf2cf0f309 |     
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8a48f46793ad8b1edb40dfe3d1e7059b15b5865c | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/46999e17fd691d0cfcae98d70b81b74cf50c3666 | ORPH
   armeb     |         graphicsmagick         | TIM | https://autobuild.buildroot.org/results/6e6d431ad371d7bba85e5ba67d905cb4b895e288 |     
   sparc     |    gst1-plugins-bad-1.24.13    | NOK | https://autobuild.buildroot.org/results/f07995804faa0be38bbba462c52be86c6c69822b | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/86aeb3d897c5aad589a670a5c3afb0b973425a87 |     
    sh4      |  host-bootgen-xilinx_v2025.2   | NOK | https://autobuild.buildroot.org/results/942cd6df722a94fe6e5944292a3aa73de142bbdd |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/fd7bc21b11952389cc70c6a7a83904dd3af10fb6 | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4812083c1bbf5afd5eb90cfa462dccce5d07a24c | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2b2a15249ab95b2d6935bea3e8cf76912f39fb06 | ORPH
 powerpc64   |           host-rust            | TIM | https://autobuild.buildroot.org/results/1b9685b795dd510dd25d486df69ebc89d2d2ee2d |     
loongarch64  |        iptables-1.8.11         | NOK | https://autobuild.buildroot.org/results/5295669c35273c0ae71f1b41e22361cd8c511152 | ORPH
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/c8a61a605ebac6fdb5efb7159fba36a76da59f56 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/16b2e2aac3a7eb4efeb9ca96cda8e9a63235fe4f |     
  riscv32    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/4e62aa21996ca5d2ac4f704791cd4951eb3b4feb |     
   mipsel    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/93183bf3464cb28d68b837eae93fa12c2058959e | ORPH
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/fe92130d1b95ba185853dece62ef9929563394f1 |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/3367b20adb2279aa29be16bd50c2658162c5e283 |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/449af7298f4e9a8ffe9321fb7f20259456b8c44f |     
    arm      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/eb8e39eef2e02e01d2e6e8d1e99fa289db7f3f98 |     
    m68k     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/a42f997931686e47e887a13a6a307cd7edfe6cb3 | ORPH
  mips64el   |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/e0c4a182f212c3a608b46291b72b4c8e555e4f61 | ORPH
    hppa     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/e3e25753c670b5d86d042d850582e2e1e0eedca5 |     
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/ef7a226e1fa7f84d4bbef5a779f44c44b8deec59 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/7d6900a08e5fb368b50b9e430e98517b8194b22c | ORPH
  mips64el   |        libsodium-1.0.20        | NOK | https://autobuild.buildroot.org/results/d65c994d2976a9450a7cd58714fc42e979a87334 |     
microblazeel |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/dd44d54bba0e88ac0eda8f25ae308e12da1478e2 | ORPH
powerpc64le  |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/3670ce599ea0419eb091b5f227ccb69904ff12f1 | ORPH
   x86_64    |          linux-7.0.1           | NOK | https://autobuild.buildroot.org/results/a5beea8bc7d740d5f97477f79b4619f001bf1c99 | ORPH
   armeb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/b0ce2c1e358c4de351848404af7c55dae6aaf5df |     
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/35870b0d7c563e14a018672ba22c510e814782dc |     
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/77cc76fae24fd6a3df6860b63a550d8ab55a83ff | ORPH
   x86_64    |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/82f8b04ad45bfafaa00f0dd15f8e50a66df17c1c |     
    m68k     |      mawk-1.3.4-20250131       | NOK | https://autobuild.buildroot.org/results/602a4b96c29810726c4561eea70ac30eb30a8795 |     
powerpc64le  |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/51055ccb817d4fef0b39bdc0fd67de103b758dda |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/2c7d9d7c844e2aff54a180e1de9a8790f7186964 | ORPH
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/bced2ddf9ac1576d99a4b7b80ac0a69b9bdc800e |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/a7f00f55935fb7b4d9a139c58e740f58cf1bff67 |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/337cb08864ac22e7dcb1b2e624059ba52ecf6b37 |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4b5fc451940909d24baa431ac6134c02a7bcae72 |     
   sh4aeb    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/dd252ae462f549df5d135e32211d57bd3629c647 | ORPH
    or1k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c398f973a09e1999d7636d6a9c325e73092173f9 |     
   s390x     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/77d819412317ced50d367a5179a5b58997390a76 |     
    hppa     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/d49d7ddbc9c5e425f846e4af14315b57417f7850 |     
microblazeel | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/0ae3173289fd8860f500db723bab097f1b044d21 |     
  powerpc    |          ptpd2-2.3.1           | NOK | https://autobuild.buildroot.org/results/249f89b96d52d1ce34dc885e64383c341298e74f | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/b7ccaa9f27a4a9f815b8fde64258d07d06686f5c |     
    mips     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/a5af94fd53fde00dc786f11769872584498b1f0c |     
 powerpc64   |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/614785670e5cb8892792bc3044bc69685fc04496 |     
microblazeel |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/feace519784edcb0c45fb8dd07fcdbb88ea4dc33 |     
microblazeel |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/899004b7188e4fc30338d2a08662cdbcc94fe120 |     
    or1k     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/5f46848f79e41c5e6fac17ea47fd6a91e8d8a4e3 | ORPH
  riscv32    |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/129189ae13d4e95e5719b0d9c46ec375a41cceb5 |     
    m68k     |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/d0e4440ef9d388f068d84b790a7377d3ab9bc1c5 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9f8d382c72cd446eb617f6b3030b6dd2f91a573a |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/277d3e2311609d245496fa5e340b55b58d7ec8b4 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/453b874fe6d23618420c08f7b56fbbb81882de8e |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/6852e2cab5ea9edb7c4710d608fb8eff64fe5285 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/466283d8385e26c3eb4296b689484f235edbf1b7 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6f26fb405b77658e828a364a00884c0b879fce18 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/4a63a1eca174fbd2e13e16625c9cf021a74ecffa |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/602cd8821c73b5e8077897ec5e951563a4d54194 |     
  riscv32    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/a21e81e64eccc866b575a4f3b1376c50f2ffd837 |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/0a428d2f846e91f70c8a04e324547c86385b32a2 |     
 aarch64_be  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/757f5538ff8c900db5e3e76d4b1351b47acab7a7 |     
  aarch64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/ef01f947a10795c759409ad867ed6aabe5f85140 |     
 aarch64_be  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/33a00f0a3d5bf8dfc4a45910d3af6f5ea103ee41 |     
    sh4a     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/41f70e313d9eb9dbbd1ff91e934adbeaf5a0a729 |     
    mips     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/79fa6abe278e37d6dd66785e070038d5ad8b2f8c | ORPH
  mips64el   |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/a2a2a4552f08ad718e04a72129b5278faefc7a8a |     
microblazeel |          xerces-3.3.0          | NOK | https://autobuild.buildroot.org/results/0b68b707cc5bd43734e4838cc599c5c84a85b3de | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                  iozone-3.508 | 1 
              libcamera-v0.7.0 | 1 
                       unknown | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/591bc8fcfccd07edbe1fc8d1ec8bf4e36964f8ff |     
    sh4      |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/fa2742d9309d8bf4fec0fe77f84e988107679088 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/ec942d19e896472925708c0e775a67a55e2363d6 |     
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/27228e278869c2a53bad363e7457868463e381e2 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            gdk-pixbuf-2.42.12 | 2 
        ltp-testsuite-20250130 | 2 
                    bat-0.25.0 | 1 
              erlang-26.2.5.15 | 1 
        host-python-lxml-5.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
                libmbim-1.30.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libva-2.22.0 | 1 
                openntpd-6.8p1 | 1 
                 openssh-9.9p2 | 1 
                  parsec-1.4.1 | 1 
                   perl-5.40.4 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/c879ce4ca7d0f8e113f8d6fadf5bb2a3d21948e2 |     
   mipsel    |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/4511129e91368e8936e4e934f32a412c6ebc653a |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4eef2597c48a3590b345b2763e73529fecba0c8b | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5e579c1aa8f18aac2f0f7b46b04cac7596a3dce8 | ORPH
 powerpc64   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/a2fbc23c44b13a1805c268fadf6763a786631f5c |     
    or1k     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/e6ed0d05bf9e94474193e3b1908a6c31ed8d97ab |     
    or1k     |         libmbim-1.30.0         | NOK | https://autobuild.buildroot.org/results/6346dbd44e8854d1d9c1f68af174f59c296be899 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/16b4eb14326397a33dacd6a6e572b97d68fea550 |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/6a8ada69f2d5bbdb5787a8812fb92a828271e28c |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/80df3d9a3d7afbd09f1151ab0ae408a2f01e6dd3 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/909523b90c760b5c6bf33306ec3688f02fae746f |     
   armeb     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/970ea01879a40822ba0326a0312028da50c69aa7 | ORPH
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/1c5c147cb25de8985fe2e3aa4bcb06e01ca89736 | ORPH
   armeb     |          parsec-1.4.1          | NOK | https://autobuild.buildroot.org/results/5fc21be86ad88d7303fd62d3ec559d32b639dc38 |     
   arceb     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/2633aa91e4e1bf156eaef3d230a697bbbb902968 |     
   armeb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/4cf3c656689bd8d1dd8f5ab65c5ae9d942d37250 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/a772c29c55bf059c9b3341d1e2e836b90a3ccd68 |     


Gitlab CI results for 2026-04-25
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439441 |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439442 |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439443 |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439444 |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439447 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439449 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439457 |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439459 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439460 |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439461 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439462 |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439474 |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14049439478 |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068568179 |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068568886 |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068570274 |      
                   beagleboneai64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068570388 |      
                       beagleplay | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068565711 |      
                     beaglev_fire | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068566015 |      
                       beagley_ai | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068570052 |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068570360 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068565894 |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068570179 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068569758 |      
                        coolpi_4b | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068570646 | ORPH 
                      cubieboard1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068566298 |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068566743 |      
                engicam_px30_core | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068567451 |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068565984 |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572553 |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572998 |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572653 |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068570731 |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573662 |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573729 |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573594 |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573362 |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573620 |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573502 |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573042 |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573102 |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573129 |      
               freescale_imx91evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573315 |      
              freescale_imx91frdm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573343 |      
               freescale_imx93evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573391 |      
              freescale_imx93frdm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068552535 |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574158 | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068552706 | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573773 | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573901 |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574189 |      
           friendlyarm_nanopi_r3s | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068573827 | ORPH 
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574034 |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574393 |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575183 |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575219 |      
                 hifive_unmatched | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574439 | ORPH 
                          hp_9000 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574595 |      
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572502 |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575288 |      
                         imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574312 | ORPH 
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574745 |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572083 |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572248 |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572262 |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572304 |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572350 |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572378 |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574794 |      
               imx6ulz_bsh_smm_m2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574699 |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068574552 |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572389 |      
                       imx8mm-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572422 | ORPH 
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068553252 |      
                  imx8mn-ddr4-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068553446 | ORPH 
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068553554 |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575794 |      
                       imx8mp-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575673 | ORPH 
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575430 |      
                        imx93-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068576245 | ORPH 
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575864 |      
               iot-gate-imx8_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068553863 |      
                      khadas_vim3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068554038 | ORPH 
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575521 |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068576394 |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068576580 |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575579 |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575881 |      
                  loongarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068576082 |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068575338 | ORPH 
                      ls1043a-rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068576457 |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068554194 |      
                      ls1046a-rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068553637 |      
                  mangopi_mq1rdw2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577641 |      
            microchip_mpfs_icicle | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068562762 |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068576689 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068576839 |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068576868 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577238 |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577726 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577838 |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577313 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068576950 |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577784 |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577443 |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577067 |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577144 |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577510 |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577909 |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577807 |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068577955 |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068555025 |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578145 |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578026 |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578170 |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068555364 |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578214 |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578053 |      
                       nvidia_bf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578078 |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068555506 |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068555718 |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068552825 |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578363 |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578435 |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068555858 |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578223 |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068556198 |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578135 |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578406 |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068554638 |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068555201 |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578492 |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068554470 |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578757 |      
                  orangepi_5_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068554766 |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068553043 |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578620 |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578860 |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578653 |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068578544 |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068562880 |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068440324 |      
                  orangepi_zero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068438341 |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068450003 |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068439618 |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068438804 |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068458104 |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068469975 |      
            polyhex_debix_model_a | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068438213 | ORPH 
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068538189 |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068528617 |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068556434 |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068539235 |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068556791 |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068542115 |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068542734 |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068537460 |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068540069 |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068543767 |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068544121 |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068544446 |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068544629 |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068545670 |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068562991 |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068547090 |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068563109 |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068544973 |      
                  qemu_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068545130 |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068562938 |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068562272 |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068543154 |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068547937 |      
                  raspberrypi2_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068547424 |      
                     raspberrypi5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068548256 |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068548768 |      
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068545877 |      
                 raspberrypicm5io | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068549653 |      
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068549873 |      
             raspberrypizero2w_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068550232 |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068551190 |      
                          rock4se | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068549246 |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068562125 |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068543512 |      
                   rockpro64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068550096 |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068550812 |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068551530 |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068562623 |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068545418 |      
               sipeed_licheepi_4a | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068546347 |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068561913 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068564044 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068561749 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068546799 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068564272 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068562014 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068564742 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068565284 |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068563317 |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068564774 | ORPH 
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068564947 |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068563347 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068563457 |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068563648 |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068565555 |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068564459 | ORPH 
                    spike_riscv32 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068563892 |      
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571462 |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068570910 |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068570948 |      
               stm32f746_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571821 |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571258 |      
               stm32h747_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571509 |      
                   stm32mp135f_dk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571342 | ORPH 
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571583 |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571411 |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571522 |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068540703 |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571958 |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571725 |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068541221 |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068571738 |      
                     ti_tda4vm_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068570810 | ORPH 
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572003 | ORPH 
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068572048 |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068541745 |      
                   versal2_vek385 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068560648 |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068557774 |      
                    versal_vek280 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068560799 |      
                    versal_vpk120 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068559924 |      
                    versal_vpk180 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068558198 |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068558598 |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068557316 |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068558952 |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068560229 |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068559505 |      
                       zynq_zc702 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068559814 |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068560410 |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068561308 |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068559210 |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068560952 |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068561051 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068561177 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068559380 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14068561514 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

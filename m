Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C76CAC5B0
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 03:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E005D4071A;
	Tue, 30 Sep 2025 03:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_T3snN8nNXV; Tue, 30 Sep 2025 03:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 795CE4074B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 795CE4074B;
	Tue, 30 Sep 2025 03:21:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50169B30
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 03:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D7934071A
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 03:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9Gaove_-BBy for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 03:21:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B3A54072B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B3A54072B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B3A54072B
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 03:21:35 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e48d6b95fso27489645e9.3
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 20:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759202493; x=1759807293;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3TY5zt61RcYkb8w8cVMESe7f4CiSKSuBS+w6Fq0Afs=;
 b=AEztYNzBE/QHQrwJdycb7HdaG6DitNzLDn7A/v9ts0pVRWay76LRkgkCcHIyQ0DQvD
 XvTtRRTD3hUshO/dT6YAEHxzVPEPTcchykXv81SZFXPpfUP1W3mtCQwTVQ2gwGX6zV93
 3ppSvP/OaDQdo80AcmA1PQ5VZ6fU5aj0m7tHv4K82tj4ppVs63HVYa0IAtq4M5fA8VC4
 C2j3AZFn++a14moCPkwUgi/Znf7Eq8ohcTTXRMBOmBsjyJMS8VryHbkWqKzQYKPy/nT5
 9sfgrUxNKDxMytMvmk76ObEFT1OcWy+/hXsbu1LuvxbgrQxqSBqzoETLdo6r8v6kuZ+k
 L3pQ==
X-Gm-Message-State: AOJu0YxbKsZ/dqCjT7ykIYGQhARHTzJWqnbCO6eWncX5wXeTRrQNheD2
 Hr5kH4poIs1Id4tZkzTQhngxV4yaLs5S1ez14lxrqmG5A5fkRNmFYX4PUsdckQ==
X-Gm-Gg: ASbGncu+wgqBArTFrWXlUnc1V6LurdYy6JV21BDU8ZcJWmqInJRlIDHtHU8RH+qYRtW
 h3Odw1rsgS7ofFRuTfv0eonlxH+E5SQypn76ALzJEGLRcq+8Y8bwrjegYoVeOYc7ngwA7YslIY5
 Vtkj1mLlmAAhXFmIPRQ8NZCFVRo8EBCLJU6Y9ckufe3nQAqLDzWEyVfVNSoTB+wHcIBF4E3TWAS
 +EMErkCzQbFHUUPKzho9gk8rnH0lqxilZ/tZM4Io2n5WFK7c7oML27uY0n+3275K2uUWNjnqGob
 FFOEIiOVCrXDNkceoxa78IdsCeMJXJDLBIWdQKxQkHu4ZliKKfhmhrEpmkujOnI8yhK2ty9qf9O
 fsGTIaYZ3U3Ypq5/3ugxlK8UQabppEn5dvwjcS3zqGRNvboOUgAn0Ow==
X-Google-Smtp-Source: AGHT+IHka/czlG986BAusvTpijCWpC1kecT/up8gL05dYgDafEORarLRmMOdchyUpx7tkS+SWpX5sw==
X-Received: by 2002:a05:600c:8b27:b0:46d:27b7:e7e5 with SMTP id
 5b1f17b1804b1-46e39d7a4b7mr131956775e9.32.1759202492991; 
 Mon, 29 Sep 2025 20:21:32 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f658ffsm35865915e9.14.2025.09.29.20.21.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 20:21:32 -0700 (PDT)
Message-ID: <68db4cbc.050a0220.204e0b.f3cc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 30 Sep 2025 03:21:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759202493; x=1759807293; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=X3TY5zt61RcYkb8w8cVMESe7f4CiSKSuBS+w6Fq0Afs=;
 b=PWWgn4lPMvJcJ6OxnDWkLHrDjTZOdcWIwkQ9U7wLUTQSPKZ+gmWcE1VDpizqcHqKiq
 n6gwx+vgIhWKjL4zQQsKwOgScIRCqD7x90P/cogih8qPEZtVQgrXU2pGk2uxyv+MT/4C
 IcYN3OlJei1lVjj5AwRp/EJcJRLJbDyXgzecp8TxtZqMoCkE+6wnt7YJvFSiqRQXHCRY
 UH5/8oQjjy1JZvXw4YxL467LzNFZtZYqueQepqcrvsRJO1Al9TFng+KA1TTgUOCzfd53
 I+VQ1/hoIy7hUSk7N+C9aRJl6tGIJKIBqVsbKkiPObMt/otwnDpNS2eTHCjoW5tMrhyc
 OeLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PWWgn4lP
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-29
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

Autobuild statistics for 2025-09-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 10  |  0  | 13  |
  2025.05.x  |  3  |  2  |  0  |  5  |
  2025.08.x  |  0  |  5  |  0  |  5  |
    master   | 42  | 91  |  1  | 134 |

Classification of failures by reason for master
-----------------------------------------------

                    mpir-3.0.0 | 6 
        vulkan-headers-1.4.317 | 5 
libdbi-drivers-0bfae6c43134... | 4 
               bctoolbox-4.4.8 | 3 
              libopenssl-3.5.3 | 3 
                   cvs-1.12.13 | 2 
               dvbsnoop-1.4.50 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
  gobject-introspection-1.84.0 | 2 
host-am335x-pru-package-5f3... | 2 
                 host-gdb-15.2 | 2 
                libcurl-8.16.0 | 2 
                 libgee-0.20.6 | 2 
                  linux-6.16.7 | 2 
               linux-pam-1.6.1 | 2 
                   perl-5.40.2 | 2 
                 siproxd-0.8.3 | 2 
              skalibs-2.14.3.0 | 2 
                       unknown | 2 
                  axel-2.17.14 | 1 
             berkeleydb-5.3.28 | 1 
             bmap-writer-1.0.2 | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
             dahdi-linux-3.3.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
           dmraid-1.0.0.rc16-3 | 1 
 docker-credential-gcr-v2.1.30 | 1 
                enscript-1.6.6 | 1 
             erofs-utils-1.8.5 | 1 
                espflash-4.0.1 | 1 
                   foot-1.22.3 | 1 
       freeradius-server-3.2.6 | 1 
                  gensio-2.5.5 | 1 
               graphene-1.10.8 | 1 
       host-gcc-initial-14.3.0 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
     host-python-maturin-1.9.4 | 1 
               host-runc-1.3.0 | 1 
            igd2-for-linux-2.2 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 
     libphidget-2.1.9.20190409 | 1 
                libselinux-3.9 | 1 
               libunwind-1.8.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 netsnmp-5.9.4 | 1 
                  ntpsec-1.2.3 | 1 
                     nvme-1.12 | 1 
                oprofile-1.4.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.8 | 1 
                python-ipython | 1 
                python3-3.13.7 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
                    sdl-1.2.15 | 1 
                setserial-2.17 | 1 
               syslog-ng-4.8.3 | 1 
uclibc-ng-test-132c6134d691... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          axel-2.17.14          | NOK | https://autobuild.buildroot.org/results/3a6e9640e744de144beb6bbf7257fd0ace10dd87 |     
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/221f6e7f8dcec72dcdc25a2f166ccfe5da3bb67f | ORPH
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f6f771823b506c3a4ba62e559c55814c2e6d2aaa | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4b7b9ab1c51ab5f483175c4c43cd04c5904b021e | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/113401a8c910d564406677a1afb1ef9481bbf1cc | ORPH
   x86_64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/30df047ff0e62d71c4318dd53fd9369a0819ec25 |     
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a94ad5d658468e67ab02ba46816f8968ff82c833 |     
   armeb     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/3ff6b10063732467b7f494223349781546699535 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/57007a6e8bd2ed39d6e5d7220260cc6836f1f91e | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cc7b52ed4a0428f3fcf4bdc51c477c2ab438fe1a | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/af321da264d2ffa6db65815c861f745bf6088fd9 | ORPH
   sh4eb     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/b4280799f2b643ea5763f867b9495384593643b1 | ORPH
  sparc64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/10ef16fd84d0aa719fa413eb942bec546640196b | ORPH
  riscv64    | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/b2146a7360055a9c8babafd26f1de562611bd859 | ORPH
  sparc64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/ffdb402c97f90322aa2c604a9529ff8f77f2282f |     
powerpc64le  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/58bf8388cb4240fd1817cbf8913760492c1f7194 |     
powerpc64le  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/723c6b2febe973692234ee83e24e2569d358395a | ORPH
    arc      |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/5ed7b1244c07141b91a099b8932c3173a9f8a5bd |     
    i586     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/e3ad0d2f9d4a24e8b22752ad4bb21ac611068697 |     
 aarch64_be  |          foot-1.22.3           | NOK | https://autobuild.buildroot.org/results/241bc0f273bbd2b2b235b4bb224c5390d53f983a | ORPH
 powerpc64   |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/ba7fa3e1064c09c6acdb9dc463e527b030f6badc |     
   arceb     |          gensio-2.5.5          | NOK | https://autobuild.buildroot.org/results/c70e958c5b96cf305feaefb7252a26138b3d554c |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/800b22e2fedea3765f0978636dbe418920180791 |     
    mips     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/031e6b12d2ff45d70906b13643fadf526cea086c |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/61699e504bd244fd898502f1f9c262b1a85f1036 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1496a50eca56fd02f405ee07fd80a7789e775a3b | ORPH
    arm      |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/029a0ebeae912ec9295d1a5b0e7ad9225d248a76 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/57ee110c2cea0bb5832bb03b994111cf50489545 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/b032e76be88d528f31f4f6d9d6b5cb9ce6020fe9 |     
    arm      |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/d89945d477f63c7b677120666f39b3cd21e8b24e |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/96fd116e9467ca298b44dbaa0691b7b4e93bc653 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/981c62be05adf30909d0b074813ee716e81230c9 | ORPH
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/11c9e796b78400f616c4428f399030de982b02b1 | ORPH
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/f5ca6f7eab00562fd1083692fdf3dd4e470b42bd |     
 powerpc64   |   host-python-maturin-1.9.4    | NOK | https://autobuild.buildroot.org/results/8b41ccc6a040e21a86564b4e23759335f267c8e2 |     
   arceb     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/b04baa56b6442ada3255cfb0e5e5283714a0a8fc |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/fe1ecf1665a67b03fe38d70af672e0c6ca65891a |     
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/630a77f6546166664e712f55dbf7bc8b19171667 |     
   mipsel    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/82cce197cf4d9d57f5d676900157b8b79eefff8b |     
   armeb     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/7a0c489c77d3c95fffb8d73bb78345d0a04b3b9e |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/84a26c7eac864c5f539f3acbd98585f0f1d7d5e3 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e1ab798a2e3e160ee88f678ce37e9ae378affefa |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fa1f3a6c8f2a47c49a06a8421a3f0ea0873cb6b7 |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/6ae030cc6321f03ef39c65f3a377ab7054988616 |     
microblazeel |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/2526c9aa4e4d83e108a1dbadf4c7cd7dc39cbfe7 |     
   armeb     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/1efbe58fb40490dd000baf40b4f0105ed54481a3 |     
  riscv64    |        libopenssl-3.5.3        | NOK | https://autobuild.buildroot.org/results/67746b0e0bb61bfd4ee5ab1dd8bb3a458157e589 | ORPH
  riscv64    |        libopenssl-3.5.3        | NOK | https://autobuild.buildroot.org/results/702655711b96a83e599d2f5594d27d835b758861 | ORPH
   arceb     |        libopenssl-3.5.3        | NOK | https://autobuild.buildroot.org/results/ae2232696cd9c08120d45cd896e63ae59608ad2e | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/61d2195c421c6f9b598961433fe66903d03dd1aa |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/9786b6addeb8a3dee9c3a82187f747504d177eea |     
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/e55e48131926d63fd4cff6a61b77ec362f97684d | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bc4c184d91e77d5190193f533f3dadedf0f7ffc6 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f25ba9a78feb9b8a4d9e9fb8bee97d3148d11603 | ORPH
    m68k     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/03e541f1f98f1df7aaa3a2167ce0acadcc67a769 | ORPH
 powerpc64   |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/1db0fc76efbdce1e8aaf05a1a1abe1022ec56ecc | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/e32a45fdc64d12042b4988e1cd75196caba6b70e | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6fb74e67be388350256feaa2352b751cc189679c | ORPH
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ab9b039d0aa29508d4e77887147c9d10225fa795 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ab2b929d0c9750259381fd83beda54fa90b38c78 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4e0c73677af9f35d81cfaa4abbcd7ae4bbfcd87e |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6806af2f7b871477549cf3845159c31d73231623 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fb800a1f8a482658469194e484c166ca406bba8a |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/68eda2a8690fe14f146a028bd2fc640f12d86a01 |     
   armeb     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/7c8db69b632910c3ae3791985d0f9abdfe190554 | ORPH
  riscv32    |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/9487217199b140718ff2c93a9017315586f87ecf | ORPH
  riscv32    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/11fbcad4ed32bca388f9796f09ad393edab00c32 | ORPH
 aarch64_be  |         oprofile-1.4.0         | NOK | https://autobuild.buildroot.org/results/760898dbb1a7d7ef86b807bddfe712aebf6a9c52 |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f5b780c39f196b356d40408e90ceb372c9374642 | ORPH
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0c83ddb122ea2ce2897d1757b718a399cfecc564 |     
    m68k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/680b9fc3c5a031cba2b6d3cc446c337d69308d44 |     
   arceb     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/1d7c934d93a00b9a3fa3e6a4d436cd02f4f86a2c |     
powerpc64le  |         python-ipython         | TIM | https://autobuild.buildroot.org/results/dfa478a3fb6d51c089eac1550a6216b320733342 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/70db3f26a5e6af664c82c60524a56d480bf68b5b |     
   sparc     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/2a50618c6728cd6feb84c0fce3d4d7c380788a1d |     
   mips64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/19e27cabc9db4be8e398c1f42637f03f47396753 |     
loongarch64  |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/6fba60c41f307fe8e001a446b72338935cd2e600 |     
    sh4a     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/ea15fbaed56ccc71991b43192dbfc7e9a925258c | ORPH
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/8070406e1772a088eec0ec41302d66a7ee53d3bd | ORPH
loongarch64  |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/b36554ed0641211cf9e1ab5c293262f41d82e89c |     
  powerpc    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/dd6216de9c3f57fae4aa2022abed83db7909c872 |     
 microblaze  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/0f0f6fa9fce7a6f8edae4aec040a15a7d4553b93 |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/c9c398a0e894921882a4a9935f5c076014772bf3 |     
 powerpc64   |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/dc41c4ef7bb936bb72404b61c159360e39f77f8d |     
    arm      | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/43267f052a02c3f4fb5e0936772ea67874978dd7 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/5d05633e3004c56341022528db15d5a1eec37b95 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/bae04a5264c2b70f08931fe52c2ed7533a68324e |     
   mipsel    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/1da217425772b917cb2755e33ec16ba8eec44d85 | ORPH
    m68k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/b5565c026048cb5ab5cf50a0b4b30a87528279cb | ORPH
   sh4aeb    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/53b6aec8fbc306d038f64f65ed147c5450a9c78c | ORPH
  powerpc    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/29e9b4132fc14731b03f44518620e9bc1f019f64 | ORPH
   s390x     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/4cfe134ca7a9da2a81ad6f9a6aabc281807d09a9 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

libdbi-drivers-0bfae6c43134... | 2 
                libshout-2.4.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            nodejs-src-22.15.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/dfa5451670a02fcd7b2ffca8870b77deeb231c4f |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/eafef3b0766a3c4e7027e930844131212ba22241 |     
  riscv32    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/ed9e22cd1d8f1546e1443d6a7f6db3d4e1540df1 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1119bbfb823e63b5130a9c20fd5047ee9bb14279 | ORPH
  aarch64    |       nodejs-src-22.15.1       | NOK | https://autobuild.buildroot.org/results/14f80edc8b21497abfd644eccfa280f5d355b171 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               valgrind-3.24.0 | 2 
               bctoolbox-4.4.8 | 1 
  gobject-introspection-1.82.0 | 1 
               graphene-1.10.8 | 1 
         lttng-modules-2.13.10 | 1 
           oath-toolkit-2.6.12 | 1 
             parsec-tool-0.7.0 | 1 
          perl-net-ssleay-1.94 | 1 
                pipewire-1.2.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/faa5f42ca905aeb82bf5cde3aa9979dfaae0b4f2 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/170d2f0e63afda380d8f29c4b1af5c195735b3f2 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/63f5413f76158ffd7e953412a4f627b1f7f1c514 |     
 microblaze  |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/280501f7e75c3b81ad8bc579355dc5879ece149b |     
    or1k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/2a317d8b584c9ef5cf673d75538f4b3d51b0e0c3 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/72789effafe8f57705457511658a2a7f88d9c83f |     
   mipsel    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/c202e8ba8365d3c089651b56e888cfb44418c5ff |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/7de99a75ec05e264a46e89420873c9f34bed689c |     
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/160841638a5bec2c74f0f1ffc725242477b943bc | ORPH
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/0f0fd869a70f21529550765f054cba2162766f48 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    brltty-6.6 | 1 
host-binutils-arc-2023.09-r... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/e340079d39968addca907e42576cba4a2b2bf688 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/11866ee9ec1514fb741f8c8bb09091223c64538e |     


Gitlab CI results for 2025-09-29
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11527086415 |      
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11527086154 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

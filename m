Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE2BD59F6B
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 04:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A2D38149A;
	Sat, 13 Dec 2025 04:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb6quefr_jGZ; Sat, 13 Dec 2025 04:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1A7A82E4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765599448;
	bh=bT3cB0QBvJtuOrrSOMRQa619rM+T7vXLXLYx9N9Ih6w=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CSdeiVVjIjdB+EAL61HFIqqcDWT1L/pkjuZrqnfNvxejRuDkq/HxJTlC8wheQxhRP
	 LO5Dzg41bHJj9/8eZBmRaMjzCD7DmgA4nMt/CKzwy+N9xbivM1la+lRkS7O9dwLxkR
	 MXKp8fZ8b/hm3GbkFNTV1Un1tus3jkdzf+tvvFgT2H+9Kgw5GfACVSbtQJ6/XGtYkE
	 GFBP986s+yDieLke6oxi8DyfvaRZEfbeJotTqqz1detTm2yMXCHWmXjARP7tw6iWia
	 gjdGMwpyHsh+ZZYgdp1DHXnSzfgwJUzVrZbwptDCeMeXc4FJCZ3sTKs7wOV9YmNLBN
	 TiI0ghx8xjTag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1A7A82E4C;
	Sat, 13 Dec 2025 04:17:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73E9E2C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 04:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64CC582E5F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 04:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwKcr4ePe7yL for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 04:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7D9882E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7D9882E1A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7D9882E1A
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 04:17:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so22520865e9.1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 20:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765599443; x=1766204243;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VytqgimXdQqEREVutJwZ8E5b7Jk4EPKml++geWuLkGg=;
 b=dMpeEBSPCsfOzsrVn0K+AgrypE/Q2UbnGK1gO0Psr02mtkeirCiju6Os+9xTOlsbRq
 uJy3Kun/Z4rPImugt7Io0z6QBXz3u5IaXVJzGEBZPAPtjMfPdrzNRqPc9UVdlvHa9Z+B
 XWiMf/ZOzWyNNutqHjRv4ROMi14rVQD++/Zfcl5N5LPNLgmqzHZwz/mHz5iP9ZGbgehd
 emT+NEZUBWdY5PUT2qNbjxzHhIpmyYQrX6pfKRJtRvg8l5aI4+Q0hQs1DsuQZCadZMJI
 FFtpacfB/fDh9FaLqD1Q+tg23x+3rokKL1LctS8LCRyMHf+EcmyBOX/DJClArZn97e20
 +0Mw==
X-Gm-Message-State: AOJu0Yy9G0K7FGQW9lBy/fQVXASiLSnEXG2jZiW35z9AQoyo4gfPgB/A
 n342JwpDG77l97YNW4VUmNwoq5J0tU5nkyJBW06Zlgh5tsokPd9kcPBHXeCc5w==
X-Gm-Gg: AY/fxX6PeeM5d3m1JdqpmmmuwmWPHvphl5OIPK53H1qnTowdOCd6F/gG1tJ21+kuXQA
 2wlyjmX7WtHcz1wuAjxg9JUsrcIHicIAoHR7wXQhnWvaghJccbhoo8LjVtZfcIEHhewKQmi/pF6
 VXLSF/88lDsGH3j2plSIkU5UTE0hrMcr7IEfzjGasmzTY+SxH1faJMwfz8nzoi1Q15QcH8zdW0o
 TNBziKedeqL5ZgQEH1UPfdDvZAMqBv7AV+Jh5oKMo6dqhcOuKqz2NljGmprtCfv0XFlHxxacVHL
 B6jMOO1c4asUf+6XWKpLRB5S4Gfk8m/na4ifSlSQ/pmJQVDQ9sZWpthPPMU88RpFcNW87kpAV4j
 nXcK57E9RILharnqtyoaF/iEF7sf9bJm0aWIALcHJ0YrsPh8s8ZoKBTJ3aOXIrAIEQXcAMvKVWo
 OquZxWI8v9bbffqocQvg==
X-Google-Smtp-Source: AGHT+IFgV5BLzpxaOj71XnIC5gq+oohG6Ejj/8pnUVoXMrvNM7wjPr9u3kwU6nmsA+2X5r0VtX5r3g==
X-Received: by 2002:a05:600c:64cd:b0:46e:3d41:6001 with SMTP id
 5b1f17b1804b1-47a96b2af89mr1112525e9.34.1765599442480; 
 Fri, 12 Dec 2025 20:17:22 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f6e58c1sm62710565e9.12.2025.12.12.20.17.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 20:17:22 -0800 (PST)
Message-ID: <693ce8d2.050a0220.30e168.c599@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 13 Dec 2025 04:17:22 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765599443; x=1766204243; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VytqgimXdQqEREVutJwZ8E5b7Jk4EPKml++geWuLkGg=;
 b=cAc/pWPUpYYyTkzYK04o9xLpT9axZfaKD6GyFX716XOWL1Fwbgj72JQFflnHLAHxH9
 hO8eRMxf+15Yip45tjS1MPI0JrjK+OqZGurL0fXUNCXpHg9FlxiK4dLtw6EwwHS3Zp7P
 ir6gWHObxo3YEHXuFNRjkM/rM0j5IRBTR6QTrBM3kqdeUlYuqqYtBw8b9wG00VUIAbeU
 QjvEiVHlgELQ5o36oQBUqfW9TaLeocFPFxiL3QycSHgRfwAiVmCKgnNfqpWdVFUIW7je
 0b1qR7fmR5z2ZXb5vFeMMU144kdaEQIm5oFob3tPxtk+AYJglQp6OTK46XtGudpCr+Ly
 4azA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cAc/pWPU
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-12
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

Autobuild statistics for 2025-12-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  7  |  0  | 13  |
  2025.11.x  |  1  |  2  |  0  |  3  |
    master   | 29  | 82  |  0  | 111 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 5 
                       unknown | 5 
                    mpir-3.0.0 | 4 
                       cfm-0.3 | 3 
             berkeleydb-5.3.28 | 2 
                  brotli-1.2.0 | 2 
             dahdi-linux-3.3.0 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-14.2 | 2 
                  iozone-3.508 | 2 
                libcuefile-475 | 2 
     libphidget-2.1.9.20190409 | 2 
                    linux-6.18 | 2 
                   perl-5.40.2 | 2 
ulog-0389d243352255f6182326... | 2 
                 babeld-1.13.1 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
                   cli11-2.3.2 | 1 
              containerd-2.0.2 | 1 
                     crun-1.24 | 1 
                 dc3dd-7.2.641 | 1 
              e2fsprogs-1.47.3 | 1 
firmware-utils-c42a3bc53da8... | 1 
               freeipmi-1.6.16 | 1 
         host-gcc-final-14.3.0 | 1 
              host-guile-3.0.9 | 1 
              host-json-c-0.18 | 1 
               host-runc-1.3.0 | 1 
        host-sentry-cli-2.20.3 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
                 jasper-2.0.33 | 1 
                     kbd-2.9.0 | 1 
                  libcgi-1.3.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                libdnet-1.18.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                libselinux-3.9 | 1 
                  libsepol-3.9 | 1 
                 libuwsc-3.3.5 | 1 
          linux-5.10.162-cip24 | 1 
                   lsof-4.99.4 | 1 
              luabitop-1.0.2-1 | 1 
                netdata-1.37.1 | 1 
                 nethogs-0.8.8 | 1 
           oath-toolkit-2.6.12 | 1 
                 openmpi-4.1.8 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
               pcsc-lite-2.1.0 | 1 
               pulseaudio-17.0 | 1 
rtl8821au-dfe6801adb9b3a557... | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 samba4-4.23.3 | 1 
               syslog-ng-4.8.3 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/c51b9df4ea6ef9299043be1a7f0e7f133cceca94 |     
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/e925330174520770a129aa0cce04ace7387cfaae | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8cfaeee5ff932e34d3e40fd8e2725af39c8f25cf | ORPH
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/b8c7281a4a830660830dbdab5662b4f47327adb7 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/4e8b53d2b2707c3dd1dc446862a4b93a0c0ea8b2 |     
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e5d99365e7994dff8f5847a6cd428a1cd40d5a49 | ORPH
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e2ededf908966508079d840374f2438a5e0c8f30 |     
   sh4aeb    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d93a081b8a597b5dad99d40be031311da0a0efba |     
 aarch64_be  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/0646abe45c60fbc25960edd86c6f7bdb9d4600ed |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/1b77c7a8415541dcb88e43aa64d31da6a8491789 |     
    mips     |          cli11-2.3.2           | NOK | https://autobuild.buildroot.org/results/40a54301efb44e74a341df54ec4cdcd2a651941f |     
    arm      |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/23b335789d2d1573487b17aae4ba4c266e29cbe3 |     
 microblaze  |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/79210ee2a0258013ba5841857c63156ca313974b |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b264c7e3bbe396ce8c95874cb37c60c6de748b68 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e5589c900e719681897922f7b7ad20ad1ad5cc8c | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/178536be8163ccdb3246bb1496c857a688ec7d93 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5834df7d6ddee805d453bbf210cde39990112d4f | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/068ef3d77cd80ef0ad107978b66ac53709148715 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/015df319b9d0a978d2b1b17c50c9b86eed2aa400 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0f5c5931e1b87c4c4aea2b55a170160d0c3ea924 | ORPH
  aarch64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/3171f2e4a6da1f2e1e4f481297ac500a77985dce | ORPH
    i686     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/df8b11fa9bd426ad82a314cc997a4c35ab1561d8 | ORPH
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/3cbf0e5c15cdf8684ea9926d6eeba331d0572197 |     
 microblaze  |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/df17eb056dcc7ed6fa0054b4f75a75adf6f83664 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/cb361ad9b8ee7c151672348f7b587d7d9f4d0543 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/671437b15215cba0fb506ee0ccf80d90cc372612 | ORPH
    i686     |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/796eb9b8211ec57a6ebf726752c8344daf5703c4 |     
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/eaef65a54a44ac427cc3accd8ab913ed561a551a | ORPH
    m68k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8a0f91a6c3283e8a55692582c2fa066e528fe377 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/4addbb978a80a168b7e8dd3c017904e0c8f682c3 |     
   x86_64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/695cd500aea71c2dc39fcf3c26a629fda5e32fb3 |     
    sh4      |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/e3b7c84b3a5d187d68de885c3d67d143a3ca9f2e |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/49b74d9f2359f2716cbe4114e74e77fa233a7706 |     
loongarch64  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/8919310d8390940bd2cd7121c335ccbcadfebaf9 | ORPH
  powerpc    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/abb48523e550ac3148f9c57b7004df32ce0decad |     
    sh4      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/89fb40698cfe4590759e86e31c6f6ed4003ab97a |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/cf5ccabefbe23d85662c2c97d44bf9e0c9c4a180 |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/07817ff0f629e8aa0ac860ca13db2a1c206a8f86 |     
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/567fba9cbf28fdb500e2c85ac931fefc4cf8f76d | ORPH
   sh4eb     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/604e8e5752e9a11d25bb65b9913db57d3db85b6f | ORPH
 microblaze  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/bf4ffb135d33bbbe719d6ba10f303ab9310a2892 | ORPH
   xtensa    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/2486bacb681d4aeaf602f511f5f7673fbf716bc9 | ORPH
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9c5266786af8bf13e5484bf2b2f82ac3b26f24fc |     
   s390x     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/e6653d7b0672bd25aa7f24fea2139fa1521113a4 | ORPH
 aarch64_be  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/6802145923dd30b855d460aef23eaa12fc3876e5 | ORPH
 microblaze  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/647312d0fd88b6e6723412379c47b2504b1fb43a |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4cde335458c6e81e99645fb9be07ac581a2a6eff |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4442c6d6be983686420fc0cacea1c69b7005e305 |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/3e020deb076090bcc0838458bfb7d8c87bf88b07 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/fdf6d33dcc31a14cf4c6d7195b422c38bd2ec34e |     
microblazeel |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/f6b0c136703e0cf38c052e6a6a3ef91cdcb797a0 |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4486266d32e8bad3bd3906499eeca439bcf9052c | ORPH
   armeb     |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/9da357715bd5f0cae3b11a5fafa423eac7ddf8ee | ORPH
powerpc64le  |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/a1170dac081cf380d3775f3c7c9c72e8cb2d4fc5 | ORPH
   armeb     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/8f0b11f88d71b8e9d7bd9b1a0437e04059a9b538 | ORPH
  aarch64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/ebf8ba68367541773712558500c1a2b3c1f0b87a |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6f0b61ca8b8573901252e1d143eebaef7fbb8f07 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0ca80f69293524e72ec5efe11915b4e0340ba75a |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e27e57fc2d2102a49c8bd1fc9952a93391594d71 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2f2420c2f2c1f805b90beae929db72a53bd56905 |     
  powerpc    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/4d217db0af234a5f38bb165f8d28ad8cbd48a97f |     
    arc      |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/f59f789add493337da7d92e3372a450f74d2c8f3 |     
loongarch64  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/7935c17649e57119b187d353acb975d31731801c |     
    or1k     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/d0d4f64bac488dc45283a8b8a88055045c6d476a |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/99d3f909da92ba932d36d0429a94392c5bf6044c | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/ddebc8ab22614d4831d1d2498a6c05eed73f9566 | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/be8a35c9b07116f7de611c4b5ab821d500a2b12d | ORPH
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/506a0bf7ff9f5a4fad505b27edcbeda0521bb1a9 |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/cef738d478d0dcbaefd1eaac4c903453776ec20b |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e469f9290114136487d53e4a61e5b73020ae4d8e | ORPH
loongarch64  | rtl8821au-dfe6801adb9b3a557... | NOK | https://autobuild.buildroot.org/results/bc0ec5fe3acb37740b54eb1af1fe5d9284c87cf2 |     
   xtensa    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/1b8bdbb1017b1fc5555fb02e300c9a92fd65c06a |     
    m68k     |         samba4-4.23.3          | NOK | https://autobuild.buildroot.org/results/cffccd4322dac73007f89517fa3532cd76d2908a |     
  mips64el   |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/048f8fe1a6b6f80708ee2ee51958f5189b735373 |     
    sh4      | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/cd781e9697203535f4add1756ca6c2bf9fa1ecd3 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/29b6a6ca2c9183e9a0e71b10b48be00356e5b8bb |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/4dd1a4cf77b4ff98624d16ca89d3d2eace4ba1c6 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e4cbee66fc178dda49b41206ec85209278f1eea8 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c490e628e2fad27966065bb7abb8eede31e8f7dc |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/e9b2a8288b70d2fae2efb0f98108028952fb35ef |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/378058cd3b02279e0aef9b0ef13200198c6068d7 |     
   arceb     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/780275a3a73bfd1e8593027804b0d6c984e60082 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 1 
           ghostscript-10.06.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/9d53fef469078651091c16f5952223075522e665 | ORPH
   sparc     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/973287aa29587a1f4c487c6a6dc415f174f61d77 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                     fd-10.2.0 | 1 
                    fmt-11.0.2 | 1 
           host-go-src-1.23.12 | 1 
                  iozone-3.508 | 1 
                netdata-1.37.1 | 1 
                   perl-5.40.2 | 1 
                   seatd-0.9.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/2b5e4639fe4b5a8e9848385399fba9836705ac16 |     
    arc      |           fmt-11.0.2           | NOK | https://autobuild.buildroot.org/results/5770e10757946536b1d7f0f18c1e652b34372214 |     
    arm      |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/e06bf921ec88fa366794ca4d4c13e4d3de8b43d0 |     
   xtensa    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/82dd242c1c86aa30a49208b41a31faa1eead49f6 |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/48d739dc936844adaee9d86154aa58e4e405d619 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fdd59d780d7fa1273b40dfb0472c552fb6555189 |     
  riscv64    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/3e95e4981af6c27d97a17beb6f501092197a4ab5 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

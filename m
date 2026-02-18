Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4887AE9A04A
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 04:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADE2980EE3;
	Wed, 18 Feb 2026 04:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsovdZxyupug; Wed, 18 Feb 2026 04:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51CF280EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771388830;
	bh=AgtJz9TAXSxX3IzWqpqueT54iRO30RyIl8BrNH63TTo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VQwMUSMvXzUBrRu9TBYMobMfDwlId65tczTDO81nwPhlf4HbN8iZ8/z0hie2uxGkK
	 IARMDiuTJCgmamoWRyrmFel/v7qCuhTeVCGgNQd7QkrBuhC+2xl+FPbIbCU7EaDJIe
	 dxgZo9W3HtnUECpq2Y9lDsW502rXHFva1NXvsqhhiRYfLQ+kMCMBNF3UnJQJ0RIwex
	 EdsXgOpK5xbHZxbCDXK2sj85gYZrkPTHbOswiYcj4vMvYemX6zrwuqaE0ugJhBdo/h
	 2yD4/elsjzgSo5J+3cSJVdammehnM1dcuabCQd+bVwYpbbQA0n3sahUftPG+2N3hCs
	 GpQFbNn4AOmjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51CF280EE0;
	Wed, 18 Feb 2026 04:27:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F1001CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 04:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2079040334
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 04:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hodVMRAvdiO for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 04:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACA6640312
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA6640312
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACA6640312
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 04:27:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48374014a77so43426645e9.3
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 20:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771388825; x=1771993625;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8FyCE4Zty1fzOhXlONpYHrhqQrSAEyqbMw8IxVW3hY=;
 b=PdSVleald7k+FQdT6c8icbXLIN0xm4a73jnj53o9Ha8cdcJwHb69JnRznwHFIlTSMO
 7+vMdsX87YhmNMUv1ZV1t2Eb9acbJhebdMGq/GEdTog7WHyNqn4yAF+1f8bqbHGecBJP
 MUNYDWNaTzNefYNpsXTDCy737JfuZ52ryQmaAQxUQ0y23g5U+nL1FSMmVQeaPzojsxBh
 UqMQBfDnWoPKUYRuKliZmskPuctwdkOVLWeTjuKmA5Oc/NJzP9RbtGJnjhv4XrDQ01FZ
 xajA84BQp0onxZSo+m0o9amLC7r0J965LBe7jz85d1nz3FpkHRMhYHmquzI95YIU7SBB
 ot9w==
X-Gm-Message-State: AOJu0YyPdxX988k9bNHu14g6bdHVEOxwB1cZlSLdAjNHswKmxIFdyx2T
 7XCI6Uls2WJh2VIeku6AOD97CNb5XJa5pTPTxPkxvIEEcxDwpbdwKQDbI88Fgw==
X-Gm-Gg: AZuq6aKv03ib3tJxUtcAZKCtzeZ/nvu7fcbOIQeD6r4JxvyNGEyHyvjQZzHFcwCrLUV
 RvnlUqJdnZN3JQzT0HdUiCh0XAlTwcpuTRewYRxYGRGfw0v7Xff6vB3t5YmkP/dhpsxcRvotiTV
 8WapQK7cejBRr6BmTWg62S5LNV0oa6b/ay4FVaa0CMBduOm2wEUzWM7Rs1++qh3XEA1hwvPkLCH
 0PKwsErmucgczyW/HRCu3sj2K4f/v4wGZSupiz/hpC3mazxlVg0Ar4ICXeDDpE2UJZ0D8Ql68J+
 6gQG+1n2Xx7lOyWnTysKRxJLdNU73+J1NgvnGbgiDt8lAz8ek1wrSq3z3F5CEBpm9fpy4SyPXUF
 +0OYIyirO8TMS6EzjYs3vR56e1NaYsCeI7Cwauk6IehqNtBuxbBUts8dEUT+7Tp2qBVw+cBu0EX
 D5FpGbikWmKgJto3X2MxEDZ2dau2VQofUldYYUbRUJ
X-Received: by 2002:a05:600c:4e56:b0:480:20f1:7abd with SMTP id
 5b1f17b1804b1-48373a58997mr292585125e9.31.1771388825193; 
 Tue, 17 Feb 2026 20:27:05 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483983f78a0sm8109985e9.26.2026.02.17.20.27.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 20:27:05 -0800 (PST)
Message-ID: <69953f99.050a0220.3d7dc1.dd87@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 18 Feb 2026 04:27:04 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771388825; x=1771993625; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=s8FyCE4Zty1fzOhXlONpYHrhqQrSAEyqbMw8IxVW3hY=;
 b=miFcFrCLWBlHAssHGjxf4YcX74UpmVU+u+wFPRu6TPH7rILFRxc7HjULitBdxi2zwK
 RvMWCbwatwI7EOY+n1TPa6W50lPeGPkigZiMYS3GhvMtVD+GGSNhBzRcpWTBlUaMgolv
 TpL9YJmL4VcGQ+yICRH42vpp87CUj40Q3eUh26OZCPJJcwEbUeALF50vOE+w2cU4rojG
 wpETe9nLeW+d2MYLrhvlvZdC5hr+fPkstc/ptnFnY/DXtgoilCRCtIvvU7QnIuu3D1pc
 sYoM/QFTqZ1HYDDe5HSymcl1VSyO1sC1EqvUbZY5Z9A4xoRAylECkjGx+ZoYt6Y/Qhcu
 iSyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=miFcFrCL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-17
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

Autobuild statistics for 2026-02-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  5  |  0  |  8  |
    master   | 46  | 47  |  0  | 93  |
     next    |  2  |  1  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

     libphidget-2.1.9.20190409 | 4 
                       unknown | 3 
             dahdi-linux-3.3.0 | 2 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-15.2 | 2 
     linux-5.10.246-cip66-rt29 | 2 
                   perl-5.42.0 | 2 
          aardvark-dns-v1.17.0 | 1 
                 apitrace-13.0 | 1 
           at-spi2-core-2.58.2 | 1 
             bmap-writer-1.0.2 | 1 
                busybox-1.37.0 | 1 
           crucible-2025.05.28 | 1 
                   dante-1.4.4 | 1 
              execline-2.9.6.1 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                 highway-1.3.0 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
               iproute2-6.17.0 | 1 
                 lcdproc-0.5.9 | 1 
libfutils-c326ce0cc2a735438... | 1 
           libzenoh-pico-1.2.1 | 1 
        ltp-testsuite-20250930 | 1 
                     mdadm-4.3 | 1 
                  mender-3.5.3 | 1 
package/mender-update-modul... | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               read-edid-3.0.2 | 1 
          refpolicy-2.20250923 | 1 
                 rtl_433-25.02 | 1 
                setserial-2.17 | 1 
               trousers-0.3.15 | 1 
           uboot-tools-2025.10 | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/bacaa7153af3edae72267a243cc0c8208377cce6 | ORPH
loongarch64  |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/9dd2fdcfa7cf5fc04bce620e311dcb0da13b24a6 |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/e6f0ea4eb3853ba7f6b5f1ebbc360a55b6ca5d76 |     
microblazeel |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/97830eef20f69e736f838a8d0a7899e41e5962b1 |     
loongarch64  |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/4bdb7664ad76496615d8ca20cf65966db489e9e9 | ORPH
  riscv64    |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/534cad4a7f19cb8ef30e24ea36af6ceb57aa4d40 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/15306b7487258d9b0e62370ab7756eae75a664af | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/95312f0baaf6f2dd1ffa9f6774ab8a3ab2709bcc | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/53dadee9dce0134d6fdaf512bd8bcd562284da69 | ORPH
 microblaze  |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/5c0969150bc0a089f0be871969a3bbe459358e32 |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/94f933a397e9d1797781a69f3174beaf5d3af739 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/76cbf4d63408dc4cb9ff82120aaab9138cb1e4f8 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7898978bdad048b847a4d8f17af15bb53b1dfa18 | ORPH
  riscv64    |         highway-1.3.0          | NOK | https://autobuild.buildroot.org/results/f4c1b88186c8dd378c20ac7389ceba1d2a81b085 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/89cb4bd0bf145d82cca408556dd70c198af701a4 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/159eb0d208274a352677717657f8061166e31fa9 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ea7ae687394c44cd94a1471c89507cea99179e83 | ORPH
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4c1736ded7b36ccf66b31a356f62ab0ac3028ee9 | ORPH
microblazeel |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/1e7bc03e212fc9889243ff364d6510225f6bf788 |     
   mipsel    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/7082ea9425f74df216848a9d9ef33ba68a3abff6 | ORPH
  powerpc    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/329946eff8c10d336ac9a11ba870f02cc3ac6614 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a62c0449a9aa07a92da8126ea6a2b4838096d7e4 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/bd40cdb2fcbe3f6c80c21ceac86a0cd185a0ce1f |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/fd76cdcf3d5ee557fa9db7d91b6b20f5fc9cadfa |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9fe76be0588f878535e64c2abb9d4c3bbd46df29 |     
   armeb     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/c347c41e32d8256ebed9cf2b770d27762ed10808 |     
    m68k     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/914bd6dff9ca868bc89691a1265d69a495f21556 | ORPH
    i686     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/fda95b157b78cf4dbf00c0a7bfd52b8de878b423 | ORPH
    or1k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/011e741fe89c34f25ee478af7706b9b79fa1f299 |     
 microblaze  |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/073577a6738145509e6544d6645632bc5f133373 | ORPH
   x86_64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/28bdbdda7b9cb5940f80b4a9d3fc0406505b6024 |     
    arm      | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/eedb8f97f7f26cc399ca97c4d435c0c9c18cb690 |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/ccd28a8d6a7574212a8ef84bc50c6f3c9b5acc37 |     
   sh4aeb    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/af304701fd65b892f544b8985587222636633c9a | ORPH
   s390x     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/dbd8507091f66fa21554b91ceb58ede943770f40 |     
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/5013ea00263a1477290713db1393596029940323 |     
    mips     |        read-edid-3.0.2         | NOK | https://autobuild.buildroot.org/results/bf1bd7a581630c93834c6ce656ca98230237f0d8 | ORPH
  aarch64    |      refpolicy-2.20250923      | NOK | https://autobuild.buildroot.org/results/333ad2ead599d36fc6c1c989ef97f635f6c885e6 |     
   armeb     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/85b517b04431d4f0ede4ffd757f25a4aa8277457 |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/cda8316574dbe8ec857dba18a4c7513a52cd2ff3 | ORPH
   mips64    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/ee429a33d398723f1cc14cd30272aae62a6e5835 |     
    arm      |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/68f9941c1787da4dc36a33d6b265df0b4a09fb22 | ORPH
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/e080d9df99e426573cf2a5e7935b6deba6a3b740 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/2fab8e3b21e9ea9b8d8b151c85278f57c11e1956 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/233e829c17b95ba4f50cdd19df035026e0089878 |     
loongarch64  |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/54816294866d599040f8eb16dc03f70fa26dbf4d | ORPH
   xtensa    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/52e451e1376f8dad3c78407d956f8c50f9127e59 | ORPH


Classification of failures by reason for next
---------------------------------------------

                  brotli-1.2.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/6bb86e6c15a9273757d8ab296b6834280819a4fd |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-rust-1.82.0 | 1 
              mariadb-10.11.15 | 1 
                   perl-5.40.3 | 1 
                statserial-1.1 | 1 
             strongswan-5.9.14 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d0f1937bf9ba3bffaf6831e0534f30313aab782e |     
   sparc     |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/7f74c237807822e54966e4d56746ae12f6c8bf54 | ORPH
   mips64    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/3d2830a4350accd4a26a34c1f5a4d41a65c11732 |     
    arc      |         statserial-1.1         | NOK | https://autobuild.buildroot.org/results/70e75faf5cd8fc44f87dbf8c73b3bbe15e303670 | ORPH
    arc      |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/bd1c50f98847fc65c96e4e8127e52d7dba94e7ed |     


Gitlab CI results for 2026-02-17
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/13138981946 |      
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/13123594238 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

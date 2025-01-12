Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23943E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 04:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FD7383AF1;
	Sun, 12 Jan 2025 04:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYDOeztQOrnJ; Sun, 12 Jan 2025 04:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9527983AED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9527983AED;
	Sun, 12 Jan 2025 04:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E25D1940
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 04:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9CC7607B3
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 04:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGIBmDHohucY for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 04:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F2D0607B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F2D0607B2
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F2D0607B2
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 04:14:24 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso4578669a12.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 20:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736655262; x=1737260062;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rIrgggIBUMvevpHZlzFlxSHCxbxCcWqMYS/zO79YmQ0=;
 b=w69BK4sGTYPuw8rhhcfMuYTHRcPQXPXcEebrAqW1uvxC0JFS8cupF1Q731XBhdeVIP
 es5WkswN3IiFEsn4mvbgHRbsWlvOh9bmpLAjIxx5h7keqTA7CtzTly6oOpr7RJBlIfW6
 O//Y/wZKAjjAKAVXktPyftvE+4RtLnMPgN3TYl4h3Uob60eIhlVU7xAtk7e5K19L0bxJ
 mOF4lHOyJOgBCfgZrMGQb/cMG8Z098l9eLET/MX/nhagya4Fg47CxYK4bjOwNY1m6J4j
 4n5v2HgWht3JhY1oOPkwferVELX0+xhBgHqhBz1B7GB8gjkIj6THucFE7IihKgMxF/Z3
 biuQ==
X-Gm-Message-State: AOJu0Yyy+qVGvStMyJBvfRg1gJwSJocydnpG+lNNFMsxQMfpCu/W+PYF
 15lVaIyqulXQV7ACa+plI65vQqfNw+HFZ+CyfNVyDDKK/jiHLZgbgm9Xjw==
X-Gm-Gg: ASbGncvNfYj0tPEm0XaXFWIyvGcHSOhFdIuwWu8pCugfX5K16sWuq9pBJFSAaLAhA22
 SLmMt9gsseUZ7ThyObd5psctBL6Ed+yb1RtVhXCXFFQDVd7VoznCuz/tygQyeTYIcViV/JZOiao
 Rmg3FPA7xC8d19o5SEOQcBKwK157xq7T56YjG9NqgO1g2qv6QSIO7VgL6zjyZefrD8qujfJPeiC
 0FFqFtK4gfxf6TUab4IfQo/7NXeYrP/vCe7mU6eccp95gMlGILNPEFaMj+1
X-Google-Smtp-Source: AGHT+IHARCY8MCC5DdFQ11y+5TT6Nspdti33jSCOAcy2TgP5dyb2G443U7rzXAo2vPnunQSKMEyuUA==
X-Received: by 2002:a05:6402:13c8:b0:5d0:849c:71c3 with SMTP id
 4fb4d7f45d1cf-5d972d2418cmr15831300a12.0.1736655262012; 
 Sat, 11 Jan 2025 20:14:22 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99008c3cdsm3371333a12.1.2025.01.11.20.14.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 20:14:21 -0800 (PST)
Message-ID: <6783419d.500a0220.357e13.ddcb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 12 Jan 2025 04:14:21 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736655262; x=1737260062; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rIrgggIBUMvevpHZlzFlxSHCxbxCcWqMYS/zO79YmQ0=;
 b=emypAMYA/j+RvMw9rb+UbD6C8VZiBj0GEfLm1U8hMws0Kmv35E/1O2XaOkPyfvHex5
 yb1lJdJ2Yl6TdWiaDlUsZDCjhrevL7SEGxrHJbSGjRUyUCFs5NPlRFtR7qB82D4p01KZ
 MfUmn9i4ch3MPGTS+t55KwiUO4WYMkCajmapA5ALx0FdC1MyKy6yhwDCYQjIcGvTAHnO
 bp9MMCvnN9d9o/v6M4zzbNjtbkA+gDgtac22VcXKMsJBoIU1UkRhIU77Otx9WBpjBvNh
 NHBcS7O4Lp8/Wa+iluL3ta/TEMz2RBtmIrTm0y2AQ98RsGiFINoZ2ZnO0ZN/0IQHIKvN
 XW6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=emypAMYA
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-11
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

Autobuild statistics for 2025-01-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  4  |  0  | 10  |
  2024.11.x  |  1  |  1  |  0  |  2  |
    master   | 19  | 55  |  0  | 74  |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.40.2 | 5 
                       unknown | 4 
                   grpc-1.51.1 | 2 
    host-python-greenlet-3.1.1 | 2 
               openblas-0.3.28 | 2 
                   perl-5.40.0 | 2 
               valgrind-3.23.0 | 2 
                 agentpp-4.6.1 | 1 
             bluez5_utils-5.79 | 1 
          cups-pk-helper-0.2.7 | 1 
                  curlpp-0.8.1 | 1 
                     daq-2.0.7 | 1 
                    dust-0.9.0 | 1 
                elfutils-0.189 | 1 
                 erlang-26.0.2 | 1 
             erofs-utils-1.8.3 | 1 
                   foot-1.16.2 | 1 
  gobject-introspection-1.76.1 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
            igh-ethercat-1.6.2 | 1 
                  iozone-3.506 | 1 
           libfreeimage-3.18.0 | 1 
        liblog4c-localtime-1.0 | 1 
                  libnss-3.107 | 1 
              libopenssl-3.4.0 | 1 
              libunistring-1.3 | 1 
               libunwind-1.8.1 | 1 
                 libv4l-1.28.1 | 1 
          linux-5.10.162-cip24 | 1 
mali-driver-d40c57d81c9cf4b... | 1 
                  msmtp-1.8.27 | 1 
           oath-toolkit-2.6.12 | 1 
          obsidian-cursors-1.0 | 1 
                 openssh-9.9p1 | 1 
                    php-8.3.15 | 1 
               pulseaudio-17.0 | 1 
                     rauc-1.12 | 1 
        s6-linux-utils-2.6.2.0 | 1 
          sphinxbase-5prealpha | 1 
           v4l2loopback-0.13.2 | 1 
wilc-driver-linux4microchip... | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/0b606b7a9d82322ec7327e7a140843e9523ae146 |     
    arm      |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/04b202882df29ce8454e3eebacb5ab33cbb60168 |     
   s390x     |      cups-pk-helper-0.2.7      | NOK | https://autobuild.buildroot.org/results/7f03da0dbb756504b1a34718173ae3bef6533829 | ORPH
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/4a4d3b248898f0e73620fcb1a7a94dcfb6e6866e |     
    arc      |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/4197d650de3b0061cb87f73ecf004f00afcc3871 |     
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/b2e114727c26cc96f2ebd513615ef2bf283ce15b | ORPH
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/15eeeee81611aeab8e14be2701473da367d3e89c | ORPH
   mipsel    |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/775dc0cc78cc3fcbdff823b4aa311670d2bd63f8 |     
 microblaze  |       erofs-utils-1.8.3        | NOK | https://autobuild.buildroot.org/results/c90bb0e140f25ccc9fe9c2e41fb9a6c1b7f9305f |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/4822d3150e6123d1295a3834e8b80f195d036a64 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/092df557b0e052a8ab8ec7c2a38b8d847422b51b | ORPH
    arm      |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/3a5a90a3c8a01b056120289791c9b9dfd2101de9 |     
 powerpc64   |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/a01ea18cb3d7dab4530a500b42b86975043eb8dd |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/8a636a5c0e6cdc6857423f7fdd151dfefd4a6741 |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/1f95a3485616aa6518b3f7fe98a2168847b2ab7e |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d285e73cf820a3583e575b36532e6c1fb3d487f4 |     
  powerpc    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/3cb2477397969985809ff76cc54b305ba5ff4d20 | ORPH
    sh4      |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/bfa074afee8a70abe597b117ecf815e234f16b40 |     
    m68k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/6a63c2b981ba721944f0be73eaceb0a5652dee0b |     
    i686     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/8e1c6dcd081aaaa0c83e6b2698e0bcb0cb66b804 |     
   nios2     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/2769df1b5978872cf2fff8c111d003bc2d2eb0d2 |     
microblazeel |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/4baba70d37c216971616989c1e5702d94b484da8 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/446b9070e8f1cd4e2e39188a79ee81ab98ee9670 | ORPH
microblazeel |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/4826b6165f0cafac540949cbc459a24b03389682 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/b87a9e2ff941bcef5bf437271351f9677c9577e9 | ORPH
 microblaze  |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/94c7050d92297d54817b6b036f76d8e949d5f05f |     
  aarch64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/30f3a9e2a55a8df47dcdabad5e7bfe7525b38ce3 | ORPH
    arm      | mali-driver-d40c57d81c9cf4b... | NOK | https://autobuild.buildroot.org/results/2633717c7d5432d975843d24eb050fcf59321e21 |     
 aarch64_be  |          msmtp-1.8.27          | NOK | https://autobuild.buildroot.org/results/835fec8275d4ff6eed298b892807dd295436d99d |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/eb9116dd0470124dab87fea90a448559af5906e9 |     
  riscv32    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/3678b5419e9216caef003683cf483b2d43bc65e6 | ORPH
  riscv64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/70707d60990cd9ca2f9bbac9081c9ea510af72c9 |     
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/e92a8369f24d37184c73c50c80d6d8c999510e83 |     
   mipsel    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/36d105476902d5528dc52e9b816ea8e88eab1ed9 | ORPH
 microblaze  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/424a6587110625c272ebcef3f7f1689206b5f26a |     
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/be93d30796e19154311c2aff6fc635a1edd54aaf |     
    sh4      |           php-8.3.15           | NOK | https://autobuild.buildroot.org/results/ac88e47c35c38869615a8b5c85678225d12ed07c |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bfffb2df5641a54842f47cd96be164785e122b5e | ORPH
powerpc64le  |           rauc-1.12            | NOK | https://autobuild.buildroot.org/results/785e82738fff8b6d19d7dec42244a158299c1dff |     
   arceb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/fe5926480449b4322c838d65dc3bcdbc9b86da3e |     
   mipsel    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/70310bbb98dbf8f24a76f99122fe7357007a7973 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/547e3405ae4f7c4d5b8500fa904d05399242de77 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c177e5edd5baf8e999388514ab998482100e95be |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/b3143ab5a9cb8f0e511fbf8f5a0112f4f61d1345 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4f7fa7a3ccc8c665ef6cf4b233f16121b84858a0 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0bac83fcd4407a6f0db2d7075c5018256985e85c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/67b883305b1f987af7bb2bdda6167ca415913f55 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2fc03f3d46988a405e0469c351da7d63efdc4e21 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/aab49d05bf446c48492cb03bddf1089c46a62770 | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/41be8fb09bebfe10179ae20fc1487953f36387f9 | ORPH
   nios2     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/b984dacb7f5dcd5491cc8dfe3a70168fd5dc935f |     
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/6792ea5b96c440409c94a43e5d127544e15f6ea7 | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/396c3e3720529f4fafb1755632a4d6be7ad437d7 | ORPH
   nios2     | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/d8e17695127e49fe1722ba676cbc8fe1ff321ca7 |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/92a65e9a3eda93df2615dee4f8e95db835bce6e9 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

dvb-apps-3d43b280298c39a67d... | 1 
  gobject-introspection-1.76.1 | 1 
host-prelink-cross-a853a5d7... | 1 
        host-python-lxml-5.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | dvb-apps-3d43b280298c39a67d... | NOK | https://autobuild.buildroot.org/results/036cbfff8183458d5b736b2026316332ef4a6932 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/7243478b823c5b969601ae36e492ec8dc1728595 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/5e9654f719c43971e235307e454a8ae6487ade36 | ORPH
   x86_64    |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/6709907d8ca807a4bad1caa54f36f18f05e37cb1 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

            host-binutils-2.42 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a809331bba5b2d4910cdb4c980ae5b0d0ed1b728 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A5CC7115E
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 03:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC95160D93;
	Thu, 29 Aug 2024 03:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTJ3XPmFRafD; Thu, 29 Aug 2024 03:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60B3560D5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60B3560D5C;
	Thu, 29 Aug 2024 03:17:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62DF01BF282
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 03:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FACC40B43
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 03:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvKjpzTA8A5Q for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 03:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4538340926
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4538340926
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4538340926
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 03:17:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3730749ee7aso94285f8f.2
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 20:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724901438; x=1725506238;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZSAoeyzofLYihiOXcANqcauiBtKaiVTj9uCJ3OB+5Vc=;
 b=p8ANUOWBbBX9q4BbvFcvCia2GjylYMvhgTIPHrNmY0SIN7wVqhWak0b8yJDJAt/cIX
 x/Us+p+vOoJTgX9DnMDdSApx48oCEqJlNu3yS3AqVQb073zrKRRCL1TBfQLULdk29H6z
 OZcu7ETJYPTR0GFDU84CK9r0X+fxeq17mqdobOXTaPWW5itEzZW9JWou3VwdpGlW1lwd
 Y8drrXM+KjyrzKsDII67QYiHtAkvL0+WDAf69dAv3KAWPyAmAe+d/aW7/1zgHy4fiplE
 uG+31UiT2XW06aP0BNMSPQ+/nJ+T3hbmPlKJTSA6fFqsg7/xfcdTZPiKUhxv8MNf3Db1
 2tRA==
X-Gm-Message-State: AOJu0Yz+vYSbiVwSBAIvdeYaRXRQCKMV1P5QPr6efNrXP3imaMxjUp36
 p3SaLxqKGkprp9EMnfhIdVTaTM2qWvMD+Z23qHkRVo9NtcXsXii6xS0Lqg==
X-Google-Smtp-Source: AGHT+IEzZGA9XEE4et+DXUIzX+xbtwn3PV6QsfXV5EJ5z67T8P8H6ws0edUW5F3OsPqg9p9WN0MGbg==
X-Received: by 2002:a05:6000:1364:b0:36b:3468:b987 with SMTP id
 ffacd0b85a97d-3749b54479fmr864950f8f.20.1724901437762; 
 Wed, 28 Aug 2024 20:17:17 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749efb2d3csm276220f8f.108.2024.08.28.20.17.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 20:17:17 -0700 (PDT)
Message-ID: <66cfe83d.5d0a0220.3bd449.073a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 29 Aug 2024 03:17:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724901438; x=1725506238; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSAoeyzofLYihiOXcANqcauiBtKaiVTj9uCJ3OB+5Vc=;
 b=ivql9nxqz5HpaF3L02Ci3MLkwD/CPKswHZ1sFHu6ecijLksr93UMsJYHOIeC6Iq5vF
 4wSjxp/uWaNlY30WaEShOCh3BV28kDk+ZwpCHhCURnY1bBV0RecStNcnfR+aepmOB4jh
 NJ9VsW2p4tLWIZTmXsAV4MtprFmGrhLObtz3OzPkNBNNyPq2j7MRKmcFLKEDnl5isRCA
 QHqlu09SWj6GB2RXRs5Poa93y9EFghfV7m99Y2xiPjpIcbXpHFa2JpUo/Z+F+NFPS7gw
 WcIsdgeZyyRwPnGMDAd2zsG4XSV+1QfcrvZvWdQt9taxVyA+p2r/3izzEEtLQsYJ1eTq
 43Ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ivql9nxq
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-28
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

Autobuild statistics for 2024-08-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  9  |  1  | 16  |
  2024.05.x  |  7  | 12  |  0  | 19  |
    master   | 39  | 55  |  0  | 94  |
     next    |  5  | 12  |  0  | 17  |

Classification of failures by reason for master
-----------------------------------------------

                      fbv-1.0b | 4 
                  linux-6.10.6 | 4 
 host-softether-4.30-9700-beta | 3 
glibc-2.39-74-g198632a05f6c... | 2 
  gobject-introspection-1.76.1 | 2 
               ipmitool-1_8_19 | 2 
/home/buildroot/autobuild/r... | 1 
                 apache-2.4.62 | 1 
              cache-calibrator | 1 
                 dhcp-4.4.3-P1 | 1 
                  fbdump-0.4.2 | 1 
                    fcft-3.1.6 | 1 
                      fd-9.0.0 | 1 
                 gnuplot-6.0.1 | 1 
               graphene-1.10.8 | 1 
            host-binutils-2.42 | 1 
           host-cryptopp-8.9.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
           host-librsvg-2.50.9 | 1 
         host-libxcrypt-4.4.36 | 1 
host-vboot-utils-4b12d392e5... | 1 
                latencytop-0.5 | 1 
                  libnss-3.103 | 1 
              libopenssl-3.3.1 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  lvm2-2.03.23 | 1 
make: *** wait: No child pr... | 1 
                    mpir-3.0.0 | 1 
               openblas-0.3.27 | 1 
                 openssh-9.8p1 | 1 
                   p910nd-0.97 | 1 
             parsec-tool-0.7.0 | 1 
          perl-net-ssleay-1.94 | 1 
      python-autocommand-2.2.2 | 1 
           python-daemon-3.0.1 | 1 
                ramspeed-2.6.0 | 1 
                 rtptools-1.22 | 1 
     s6-portable-utils-2.3.0.3 | 1 
                  tllist-1.1.0 | 1 
                       unknown | 1 
               w_scan-20170107 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/r... | NOK | http://autobuild.buildroot.org/results/2bb3bbd0ae07572b68de314ad76810a08494904c |     
    i686     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/b109f5ecf329895ab6cce32f7de968a7d32103d0 |     
 aarch64_be  |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/f8e88dc6f872e499d6d340c4ca34fd71fd46be3b |     
 microblaze  |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.org/results/f6f3ab800074f0202f08bb4587a6ea4077e2e6d7 | ORPH
   s390x     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/e0dad484b3f6fdf4f253be1558f255f99bba46db | ORPH
microblazeel |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/b67c77d0f226dd936a2f083c67f95bf45d54d354 | ORPH
    arc      |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/e79bed3f16007780f676c7c559cea167f5ff6d20 | ORPH
   s390x     |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/cc5e03e4d46e6c05e90d890382abaf23a516dbe1 | ORPH
  aarch64    |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/a077a555d593d875df543354cc6fc459457b24f6 | ORPH
   mipsel    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/91bea59feecfa9f5eb6aaf1cfba5063e6b81dd4f |     
powerpc64le  |            fd-9.0.0            | NOK | http://autobuild.buildroot.org/results/b16ffd088e3455945b7c9c68c7f77a1b6d8a47b0 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/43d918f388e1f74bf3ba6b5c302a3d1dc0c6cd41 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/7514c3cef2c48d7c8b4987c7a002d71ef9d807ee |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/6ecd24c66522cf124a6eb71407e0678bd2dcb0a8 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/f1e50cb0caedd2e68224b75daffb07ecfb71cdb9 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/1f2f01e86f033aae8b4b9f4c42371cb3a05ae93a | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/128363eba73279886777f89410ed775d1f599504 |     
    mips     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/6919aaedc28ed090286d871dc24db1ba31795abb |     
    arm      |      host-cryptopp-8.9.0       | NOK | http://autobuild.buildroot.org/results/dc6817cb86476afc46756655c6ea534539479bcc |     
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/6f2b05733daf2bfde9cfab10891f269c8eceb63b | ORPH
    or1k     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/3da7429031c8cb3056e0eb3b874c1f5a1e898327 |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/906547f8efac67af87fa50a5e04cef284568de25 |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/4e71529c24f5bfd52e4fa8d18fdb67614a794cdf | ORPH
    or1k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/a3f983b7808ba727ba593551843a8916709efa7f | ORPH
  powerpc    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/c9bcd8a3ba3f28235b0c0abac3c5b6d1d6b05601 | ORPH
  mips64el   | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/d2db2fdcdb2c3b9dfdffb5daab97671a4648851c |     
  aarch64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/7c95939532441ef08b3ebc2a4ad3dcd889510bfa |     
  powerpc    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/f01b7403654c38cb06f1aefcc0b8978b8218f7f1 |     
    arm      |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/de307aa72377f6207818d7e8040c3eec2090d28d | ORPH
  powerpc    |          libnss-3.103          | NOK | http://autobuild.buildroot.org/results/436972d89f5795b11aaa4f739baea86365365bc5 |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/09c5430ccb808e1a445536868b45850bf11e2db4 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/c35f9b78b8f114bb795ed162585d707331954b4b | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/ef0c08e415c070bdce21f3695966ffa1eca6f551 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/0a19aea6cf2ff4149497f6476c6e981ce173c72c | ORPH
  mips64el   |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/f4b63997307bf286cd221021b87fa941f757ac74 | ORPH
powerpc64le  |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/52d3fa4957438688da843ec8083393be62a32c9b | ORPH
  mips64el   |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/8ffdb536e1439690806089b08639a06e1a884a79 | ORPH
    mips     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/df8614c992d0199042974b76d40e550c75998244 | ORPH
 microblaze  |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.org/results/9fc73c3e19d9307ad78fc1da0f13a18259945ea2 | ORPH
   mipsel    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.org/results/86cb47a762eb6250fa9a94bfd1381485c2e9d49b |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/b58cdc67d671cfb63eea6943fa565602dcbcfd55 |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/c579a2cd35b01a9005c85c07dcfd816367ea887e |     
  powerpc    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/659dc4f8f9fefb0b01f8b7f8da9814f4f1e34da3 | ORPH
   mipsel    |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/6e0e34c342fe712d5314de80488a2d034a2f5983 | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.org/results/89288e702d2b92270988ad24276c3306b3893c9f |     
  mips64el   |      perl-net-ssleay-1.94      | NOK | http://autobuild.buildroot.org/results/cce9c3d01d0cfda13196bdc3b592f7182742bd9e |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/bd3151d1b865228b37813a1834fac488d73f1da4 |     
  mips64el   |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/489dc5f9c8bf3c6cd8802ed045318769dd7d1440 |     
   armeb     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.org/results/f668b67c8b4285d4472f8cfa6272d047eb098d0b | ORPH
  aarch64    |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/30ca0b77b6553282cf9b41199032411a95bf751e | ORPH
   sparc     |   s6-portable-utils-2.3.0.3    | NOK | http://autobuild.buildroot.org/results/41e85089f3c0e485cf057cf0a8df943452823799 |     
   nios2     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/950688493021c12c4dea98ac4b220355d917ff69 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.org/results/2c236eeb28a92838ba69963ef52f693392442bae |     
   sparc     |        w_scan-20170107         | NOK | http://autobuild.buildroot.org/results/0a9520869762fd12fd80defa1795aca274f5fb90 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/10f52b25650dc6ef08c238d5b11645902110a136 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-vboot-utils-bbdd62f9b0... | 2 
                 dc3dd-7.2.641 | 1 
              e2fsprogs-1.47.0 | 1 
         gobject-introspection | 1 
               mariadb-10.11.6 | 1 
                    ncmpc-0.49 | 1 
               pulseaudio-17.0 | 1 
                sysrepo-2.2.36 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.org/results/68a749e55341c73fbe17fd11877ae8aa8c2964ac | ORPH
    sh4      |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.org/results/445970b003b16918ad7372094ccca2375477ada6 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/fb07729e53b42c185407bd53e23781acf1c2cacb |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.org/results/bb276f261a07806478ba20282ffaf476e4b27f13 |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.org/results/e9829a68ad2ae0aa500f3495fe155603840a122e |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/859cf138e15d5a40ebac271eb92fbda7f6b8809f | ORPH
  riscv64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.org/results/e77d43505b379be57873a965568a7fdd831ed16e |     
    mips     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/e251605396b139529acce48cc5099ac1d1f54eed | ORPH
  riscv32    |         sysrepo-2.2.36         | NOK | http://autobuild.buildroot.org/results/28de929a27e1613f67fb0a0a77917b163c7e77b0 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.org/results/377dda266f03e7ac3793b24540bdc884039d6199 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 3 
aer-inject-9bd5e2c7886fca72... | 1 
                  fbterm-1.7.0 | 1 
                   foot-1.16.2 | 1 
                host-go-1.22.5 | 1 
           host-systemd-254.13 | 1 
         python-remi-2022.7.27 | 1 
             sofia-sip-1.13.17 | 1 
                tpm2-tss-3.2.2 | 1 
                 uclibc-1.0.48 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.org/results/6ea9c9861d1d3ad670bb42ab4d8dfbef7f68d235 | ORPH
   sparc     |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.org/results/c35978344ea709cdddaa5649d679981c51be4524 | ORPH
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/6a0d0996f4b9e709be0230e8ba6d1aecd91c9905 |     
powerpc64le  |         host-go-1.22.5         | NOK | http://autobuild.buildroot.org/results/03922c52bb813e6184a004f8e0d28d0558ae6a0a |     
    i686     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.org/results/66674be811f53332b671ef0d7d963532eb35307f |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/9fc4a3f1797d2f4850309318a4cd75eb8309bfc7 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/6212aea589aa28e07209b26422405888473dc24e |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/ac5faf876016a71314dd40b9e82100630976cd3d |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/a3216051a6f1312e7a6307c9f2302748c85e72bb |     
    or1k     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.org/results/ded42f140410e581bcd6e0756dd7ac703ed4ca10 |     
   nios2     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.org/results/c3bb932a4392de704ffd76e548f75666fefd20c2 | ORPH
  riscv64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.org/results/8e3b81c000df2b42515fedc27b7c2b1ae4d9ff4f |     


Classification of failures by reason for next
---------------------------------------------

             bluez5_utils-5.77 | 2 
                       unknown | 2 
                 ddrescue-1.28 | 1 
                gerbera-1.12.1 | 1 
                gnu-efi-3.0.18 | 1 
                  linux-6.10.3 | 1 
                    mpv-0.35.1 | 1 
                    norm-1.5.8 | 1 
               procps-ng-4.0.4 | 1 
             stress-ng-0.18.02 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/fe383f645c917b22ddc0c5e5db6a68b8dcad05e4 |     
  sparc64    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/7832de7b251950acca6af56e58cfb666c24bbf65 |     
  riscv64    |         ddrescue-1.28          | NOK | http://autobuild.buildroot.org/results/2b7aec4abcf987ccb5739a1f6e889b04070f7e16 | ORPH
   nios2     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/081018df7019db1a636f46ebcb7c442f5e5c8053 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/adc4b9e3a2e04849f9a0d2cf4067f8a086362a5c |     
    m68k     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/a34d15876565edf02ea6d7eef0a4f0422fb92133 | ORPH
  powerpc    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/18015c59777c44f919030bb16705a90ca078bfa7 |     
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/14b815c9f45367852b7fe888760edc6ce479dce5 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f83851ac070988240119ad2dc7eeb20bd18e1508 | ORPH
    sh4a     |       stress-ng-0.18.02        | NOK | http://autobuild.buildroot.org/results/705cba36b08ab79251ce71d9a27b115e3c9c5c4f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.org/results/710e145beaac0c82c13044d54c332176952ac0fe |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.org/results/bd91f1c645730fd87886e90806f12fbfb18a76c2 |     



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

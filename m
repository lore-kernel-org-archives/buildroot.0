Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6A1CD3447
	for <buildroot@archiver.kernel.org>; Sat,  9 May 2026 03:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C04096F4A7;
	Sat,  9 May 2026 03:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwWn2g7A0LC5; Sat,  9 May 2026 03:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EBE86F4A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778296712;
	bh=BV7FfIfFSbortNHeJSNKq8BPm2RAUNO67BiNfhJq7EE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r8wE734yrDnhvf3nG48V+HbgIA1qqSnd/39QE35Zbu33Cfj5b+AWtp0XSG0UoBvB7
	 CKRoA3OT5BrRvYI3vGeI1zwe3Et+eGPZ0FCBRwKZzYpQrLOI0mrm3Botb17t8sRxRV
	 fdmPlayBldZMrtLqCvj/OhexEfTOF7Xod2uTW7fHq8ooaPuGnUT5KCRIrUok/PZ9e2
	 ILasXGV0EUwypixJ5CRrVlSUnyPPl/ueiJiTlhc1y34TTUnbw7cio+nD1MoQ6wn2im
	 CMS/plVCv/iuBGjr/DWOIAfG0zEHgGJEw3DsRSa+yC8pe0BndTTGfQelCIMy7K2W4E
	 36FvAjpPPBnfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EBE86F4A3;
	Sat,  9 May 2026 03:18:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 272FA272
 for <buildroot@buildroot.org>; Sat,  9 May 2026 03:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24B1384937
 for <buildroot@buildroot.org>; Sat,  9 May 2026 03:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bilHmUvFFC33 for <buildroot@buildroot.org>;
 Sat,  9 May 2026 03:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DC5B8482B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DC5B8482B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DC5B8482B
 for <buildroot@buildroot.org>; Sat,  9 May 2026 03:18:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-44ce78ab5feso2249241f8f.0
 for <buildroot@buildroot.org>; Fri, 08 May 2026 20:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778296707; x=1778901507;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PHKtpVOhVQvNK8PfObD8vZhszJqeXn48uVyA+lOXzjs=;
 b=WHk3eOQGwuEv/GT2774isjbV2I39k/Km6Zn0uCtkl+WgmP/R/bWq9TiSKkdcHW6PkD
 tXQ/ZA/zPBKunK2Ou6YL6rs3U2Ppnat+cxKXZNXHQ8zPayU8o6/QBUvbaGlm9XfzR6xc
 lXia7omqDmiQDg4ohibyPZuKPYgPfdgX5tY/7fTRrpdCv89pu7vVSOpALMktPN+uwEJy
 2/Kpf88fKhfgDjbp65iAmcxyUvpQExM/s9N2InujUDVWG9SdJNOSgnlhrfmI/qSoSkLZ
 cB1mr8ZfxPp19UOCmUK9v1QaHURjZ2QoRgqMb5ebpk0WkEj+x2SCNiiGYsj1Rg/9g45b
 Rvvg==
X-Gm-Message-State: AOJu0YzUYmN7e8Q8vKwULhDrIpzegqG0SL8D09QtUDGTItaLnX5f/5U/
 jZDpob5upnEVj7pRljUqy+h8HLKNPf1l/0+QD+fSVShuCv82u5W5r401o6Ij84S3
X-Gm-Gg: Acq92OFQ7Nodgsooa+TK4B7dFQd2UILahwQvXqVAumOPML/9zWPR8E3eSZ0n61ORU2m
 Nlg1/LgKa7LCxttOYMWL/UWNAD+VDAETLJG73QVZujA5usLaUXPg+u8/cSbSDZlaqYZwQQPM6VX
 +IKOnFW+ULIgGXSJ6subo/m1Ks1ELyGY4m/1iBx1Atht7PB+qEFjxG5eLwDIIWHf3BF6d0UaIbe
 MSjORZuYD2gBz4t6yi+Dw2KBqjH7v3k6wax0QZPxbEtr4ZBW1DsDqxglyJQ/k1keK/f/dvKvK0l
 xAXEdRTHEdNzB7HPi47Of/pkIcoT5AOe3rxo8iXBBQHBETv/x05pfhBO8PuwpcoDNRcHb2EHKMv
 RUZkxU/+0NTHyuXbMGTx+sJfAPnkT3OCQ3BPpkBgfP2KXQ7p6t43viBpNEQ6aJkalnCXHio/GUn
 IesJrIsw+uaqC0wpTUsnWlXZ/n+YoRsQ==
X-Received: by 2002:a05:6000:2c01:b0:43e:a73e:cc98 with SMTP id
 ffacd0b85a97d-4515cf11bb8mr22385254f8f.23.1778296706726; 
 Fri, 08 May 2026 20:18:26 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a5b65sm8972064f8f.8.2026.05.08.20.18.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 20:18:26 -0700 (PDT)
Message-ID: <69fea782.050a0220.8af99.ac9e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 09 May 2026 03:18:26 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778296707; x=1778901507; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PHKtpVOhVQvNK8PfObD8vZhszJqeXn48uVyA+lOXzjs=;
 b=aD7pWXLNF8Nct+RkNnp4CtxvZh4ZjyqA5MtQwMbh+oUZ41H5Hgy51YOJDnl3o6b6gX
 QQoY9xM2NzYMHgd7W/mRZJ3yf9QA3IKAYD/wUQzNAYAwanf6hgR/tqd+oLk6YnihZ4tm
 Tp4KQZ9Aa+mb8x6Y0xoRqaaOS9Uvpr8zm0z/nOLxtT6ugTVCPfBdpU2gZq4VJeWM7/PU
 CGTuFFtOdmN8Qwyo4rJPspj8EQTAcnQiLjzzi+ACsxqfw2CMwogqOuMrDGRMqCK9v0DQ
 RSsAM5rCXLbq6luGiwAWOLBI/1qsywZ0syAH3KV6ZfG4VdEzUDKcJha+SNqh0MaYJ3Nd
 RBCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=aD7pWXLN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-08
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

Autobuild statistics for 2026-05-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  | 31  |  0  | 32  |
  2026.02.x  | 11  |  7  |  0  | 18  |
    master   | 39  | 110 |  1  | 150 |

Classification of failures by reason for master
-----------------------------------------------

odhcp6c-f19dd37fb467c9cf10c... | 7 
                     kbd-2.9.0 | 5 
                       unknown | 5 
                   perl-5.42.2 | 4 
             util-linux-2.41.4 | 4 
              dropbear-2026.90 | 3 
                   i2pd-2.59.0 | 3 
             libgphoto2-2.5.33 | 3 
                   linux-7.0.4 | 3 
               linux-pam-1.7.2 | 3 
                   ccrypt-1.11 | 2 
            gdk-pixbuf-2.42.12 | 2 
glibc-2.43-22-g8362e8ce10b2... | 2 
      libabseil-cpp-20260107.1 | 2 
             libblockdev-3.5.0 | 2 
                  libnfs-6.0.2 | 2 
              libsecret-0.20.5 | 2 
                   linux-tools | 2 
                openssh-10.3p1 | 2 
phidgetwebservice-2.1.9.201... | 2 
               pulseaudio-17.0 | 2 
                 systemd-258.7 | 2 
          aardvark-dns-v1.17.0 | 1 
                  brotli-1.2.0 | 1 
                  cairo-1.18.4 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202602 | 1 
                 empty-0.6.23d | 1 
            erofs-utils-1.8.10 | 1 
              fluent-bit-4.2.0 | 1 
  gobject-introspection-1.84.0 | 1 
                   guile-3.0.9 | 1 
host-am335x-pru-package-5f3... | 1 
    host-mender-artifact-4.2.0 | 1 
            host-protobuf-34.1 | 1 
            igd2-for-linux-2.2 | 1 
                 libavif-1.4.1 | 1 
libdill-32d0e8b733416208e04... | 1 
           libmicrohttpd-1.0.5 | 1 
                libnss-3.123.1 | 1 
                libsoup3-3.6.6 | 1 
                 libzlib-1.3.2 | 1 
                 linux-headers | 1 
                    lua-ev-1.5 | 1 
              luabitop-1.0.2-1 | 1 
                 mdevd-0.1.6.5 | 1 
            minizip-zlib-1.3.1 | 1 
                       mrp-1.2 | 1 
                 nettle-3.10.2 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.32 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
        perl-xml-libxml-2.0134 | 1 
                    polkit-126 | 1 
           python-html5lib-1.1 | 1 
              python-xlib-0.33 | 1 
         s6-linux-init-1.1.2.1 | 1 
                  stunnel-5.78 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ustream-ssl-5a81c108d20e247... | 1 
               valgrind-3.26.0 | 1 
            vorbis-tools-1.4.3 | 1 
                 weston-15.0.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/9098eb11f2610fb38ded38f68f40c165af2ac2e0 | ORPH
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/c58921a5b1e899ba66bf73d02921f5d23d3ef8aa |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/c003ad50a4001a5c9d1983a81730a16c9fac75a1 |     
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/7c0b7bdeca2a94e9e9268e4dfd17de4423eb6aea | ORPH
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/e7531425b578057fb3c5d5ceb64fdb38e775fb21 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bdb9b56568275541c87509377dff1317eaba03f3 | ORPH
    mips     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e82b536a88e2beb61361fd69d51a238f5f1eb3dc | ORPH
  riscv64    |        dropbear-2026.90        | NOK | https://autobuild.buildroot.org/results/76243ac18dec38348cfb62c9f950c330f457c368 |     
  riscv64    |        dropbear-2026.90        | NOK | https://autobuild.buildroot.org/results/74ace1170d4671eaaef4bdc36a05d7f655dcac88 |     
  riscv64    |        dropbear-2026.90        | NOK | https://autobuild.buildroot.org/results/34ef85f586eb8e7ee479f9ca14fe26a939ae2235 |     
   armeb     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/8b18350a08e02b0b7b3918d9b3f7b3326611c567 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ce62189403e418090ab0275b527eaae461073af8 |     
   mipsel    |         empty-0.6.23d          | NOK | https://autobuild.buildroot.org/results/6fd186e1fafa6ec1d7f64270ddbfd69f242f5985 |     
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/f0a1eff064b06cb14261e0889ed109afd65c67b0 |     
 aarch64_be  |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/6fa0c01675b7dfab8c5e57e5c9abb8b8222d78e5 |     
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5e09c25da4041eb42dc777e5b35c103907033450 | ORPH
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/83210092612756da7b3d60817fa889a2b10474a3 | ORPH
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/8ed78d92c3803b246895a9ee1e501b8b52c08679 |     
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/114abe6d5e3fa86e076bfdb7e558a58a4e5c7253 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/fd00f9e05485983792226b223db1e720f8bba4b6 | ORPH
  sparc64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/d35070f907022f651ac1fd4aae8c6dbad5291e56 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/55312ada98ae43aaad9222202d4ed2afe5a9ee4e |     
    arm      |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/ca71e8c1c0e3e6796b747ac7fc8d064c410226ba |     
  sparc64    |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/60c61904710b209fc0874930c77b4ae5d75a4560 |     
microblazeel |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/f1c8544634b978de2b3dcbb0226f8c5298e4d407 |     
microblazeel |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/83b5051d90bacb4137c9b55f2580c8f6f4472b55 |     
   x86_64    |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/c4fb97f186343134fe10f62a58cc3f4a3899736d |     
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/82ca704bba4614335d4e38c34afc120c7cad126b |     
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/7dfa92764ebdeb28913f3ca7549ee0b727e62117 | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/b4f43708fd19873c45923f4764f43780334ffef2 | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d458b6005f78db15d24570eaa0862d5506bc817e | ORPH
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/3db5e36ae443acccafc426364c0969febe346c04 | ORPH
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/99fece5e5e607646487f9d68f94cfdf9123a8856 | ORPH
   sparc     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/5fbc7ace2762b0ac6d101bd69ce46fce330df9f1 |     
   mips64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/32ef08d99c2b736876387dff73c18f368e1db28f |     
   mips64    |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/47bb1ba09db329f15b1037e1ae4870d507595f9d |     
 aarch64_be  |       libblockdev-3.5.0        | NOK | https://autobuild.buildroot.org/results/86d471c882a0fff368d4f0bb4f7defab426bc5df |     
   mipsel    |       libblockdev-3.5.0        | NOK | https://autobuild.buildroot.org/results/fceb64bb7fcfced61ef900b580b458135baa3713 |     
    arc      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/0cb3ecf261152965cdd309159ab526c7f000b1eb |     
   sh4eb     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/dbd185af11851201a6081c12c31462a8320a390a |     
    arm      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/edbaf787daaa61f4b841aa3801bf4592eb40d3fc |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/116f7692242b54327577cac66e179d6068583477 |     
  mips64el   |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/964ba24732cdfcf019b71b06044cd2e1c16eed15 |     
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/03e3a968d03ec0870c2f8062bd8612dff0379698 | ORPH
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/8651baf8c8534cac783974ed4fd07258bf5dccdc | ORPH
 powerpc64   |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/d34cad230b9630e476dcde8f5f4fd8733fefd882 |     
    or1k     |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/69f021a19f4ab69ffb1092d891f6302e9d0f7e5d | ORPH
   x86_64    |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/230249e66fca01f54f3ef86953895a2e27b7a684 | ORPH
   mips64    |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/3531b6456f13632446e98980404c296bab8fcbbd |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/447f4be6d78d31f354f37e796c49890911862b06 | ORPH
  powerpc    |          linux-7.0.4           | NOK | https://autobuild.buildroot.org/results/557f3697225ec45851ca4989735e9c0c21c10f0d | ORPH
    arm      |          linux-7.0.4           | NOK | https://autobuild.buildroot.org/results/4f7d9a6a58b10974277ca09a009464799a8d168a | ORPH
   sh4aeb    |          linux-7.0.4           | NOK | https://autobuild.buildroot.org/results/8150e447ae3ea7d04b3562a042cbfc6615fbb1fa | ORPH
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/ff59f52c60c1dccff219cc4c0c99f337c25223e3 |     
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/9500969d53892839d220b06dbdaf8736c78732b4 | ORPH
 aarch64_be  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/972df969071b0f71810d2c3a2c814d53ca038f6b | ORPH
    mips     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c3f5b0ec0fe629f9b0ef164b438e4335e505599b | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/323ee5999ea30db892fd05e2e803a3e76ea64143 | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/810c1de70cacb82182123b30735a8d570386bbb9 | ORPH
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/b0b05be2ee43bd2354fff79ad55eac471fe1b953 |     
    hppa     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/b8e2a23dda79c29cea792311f9a8efa3b906d2eb |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/3c105fa8f34ac94a05ca9bced8f06775541292a8 |     
  riscv64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/5064693f93d4a67ef056bc400ad6d8dc8d316e6c |     
   mips64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/e26c34e48c7b3feafe7ebb2cb097695c8fc0ed53 |     
loongarch64  |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/7516470b3794e6d9ebf8ac6aaf6786c7a0498c42 | ORPH
   mips64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ec7937d166d2f25082dc61be3da8a528fe7294a8 |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/1c7aa40fb8e10ba7b6922dd6b14ac5565228643d |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/881498b90ab039e5492ae484ecdff2f632b63a6c |     
    i686     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/74accb9c0451ae364e2307bf487a4f36689fee0b |     
   sh4aeb    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/1138f9744913f18c79e144f45c732860f33cc8ca |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/1c2a67c177fd82b679a83610835022ed6644dfea |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/45e96d678f15caefb5db39d4f6e944ca915a4d9d |     
   xtensa    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/cdd1b295a32e8f0325fe74bc2a61c73d38c5d0c7 |     
  mips64el   |        openblas-0.3.32         | NOK | https://autobuild.buildroot.org/results/62a3a3ebfa15ed51414ac4ff8dd27ae61f51e882 |     
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/a2bf582edc4aef0959ab1df59be5a8ca6964b85b | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/6d1a3aa35c357799db1a913199ce3879761fe6f1 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/c6134147e11286a4430e45178199acb25e350c2d |     
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9e5f063be1359faece679757a2c58f81b46f631c | ORPH
    or1k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2d92f3f9ab5f7426bf86eb509b9bc7c11d8246d9 |     
   mipsel    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e35b65a7053d1a6c5796647880fdfabe16d62b67 |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/af5816d3696ce240360bafd08ebf0211d200cdad |     
   armeb     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/d8e69a43629775b52651399668f94de0855a89d7 |     
    arc      |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/2f457f0827619b9d8789064e10cdddd7f780d3b1 |     
    mips     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/3434d2565d5ae86bf0c1d98bd79d33ca25f0fbb1 |     
    sh4      | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/f968239301a5e076f55dbbb6cf16df242ee60b5e |     
    or1k     |           polkit-126           | NOK | https://autobuild.buildroot.org/results/0b3925d85b18aeb5d80e30c59b8bbb4f9432ea71 |     
   mips64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d473d8c404671a0c89d143c3cbac2c5cfd1723a0 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2246e41dc5dd12f3f26edbe31c4e977af30c6216 | ORPH
   s390x     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/38c1e77245cc3beb8982f77377cf08b14a6c65c7 |     
    hppa     |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/2a5e9c2b55d09f22b0dd311b2ecf957890046c0c |     
    sh4a     |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/bd6687fcca650e19d0f18eea9b123a23db76a557 |     
 microblaze  |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/b6f8abd158c36cf4b430aa61d9362eb80f5aa624 |     
 aarch64_be  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/45e2859799ba7116510b25dd622a1fa85996d167 |     
    m68k     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/5ba61f4420b17a6cd3030562e2126d4b40134cb9 |     
    arm      |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/a64256c9c6416cec51d570692c4bf457c5f1ec9b |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c177b5e6de3b8cdb8fbb497fb2459087b32cce5f |     
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/19e7d4eeca795b6f7c1f6b2f346b68266d9c12bf | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/231c4875c422ee3cad80c668556bc3577bf42c34 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/e758a7bde25effed0d3cc3ee5272af159953bffb |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/2d1c20c1540e89a189b37eb0392010873f10b3e0 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/11249e8d1a3d5b2e901a2045da9d2ddf4e0f181f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/765b559226a861d34975443b936346b11a7eb086 |     
   sh4aeb    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/a0860b7cf868fe12d53c7e287e75f7d5ecdde8d6 | ORPH
  riscv32    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/2c326a1207d194954d35b836871be418763400b2 |     
 aarch64_be  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/a8009f8f4d64c9d34a2c8a7b28989cb0ba9b6c02 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/958a6edc756f1e111b5deea1f87eb52a966c2263 |     
microblazeel |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/1eaa8b5a29f580ab48b8666832828359e7996d1c |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/ef69c3b7e712148ed197be36e611b5f16c9a0159 | ORPH
  riscv64    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/0547bfd4338ba05bb263136f118185a5b4e9ce17 | ORPH
   mipsel    |         weston-15.0.0          | NOK | https://autobuild.buildroot.org/results/acf8e1ae0261357306084395ef7df7ee4518b352 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/e0e469f7682b89c799f9896e06211922c55516be |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
          aardvark-dns-v1.17.0 | 1 
               iproute2-6.17.0 | 1 
                openntpd-6.8p1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/eaee05d744f93eb757271dd2f05e70ab0e13947a | ORPH
    arm      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/8e056460d46115b406522721db55f8341de76fab |     
   armeb     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/624b4c62b566dde5ce2e7ff1cf11137c1be56de3 | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/70d633ed0bcb711ef1855c07bf52e8ce0b542459 | ORPH
    or1k     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/90586ad5f9fb8e268cf4e868913ea6f5143a3b74 | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ed7817acf8deb489ed9ffe448648e5e8959c0a92 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/ed192b700b046d3f9d2325c2072cea4739870591 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-util-linux-2.40.2 | 19
             util-linux-2.40.2 | 6 
                       unknown | 3 
host-netsurf-buildsystem-75... | 1 
          ncurses-6.4-20230603 | 1 
                pipewire-1.2.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/ee7fbc5fe7a600f737cd5b47e006b5302e0189dc | ORPH
  mips64el   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/fd5510cc2d36b380958932d339e3a3fd2d3b311f |     
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/1a86cb113e4e46201e017ad9f05508d3de4ec80d |     
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/deea390c83d66b86545dcb4ae77378bc218693ec |     
    arm      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/36f2ecefcc95e5992f4a334c7b9601b9a5962f8d |     
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/9e5c0430e1a0d2b2caef46418906dfc15b0e7418 |     
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ba8651e669860e5d360142ee93894556e39202e4 |     
  powerpc    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/9e07aa8ca897cb640392225f06ddead4be2e7710 |     
    or1k     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/f7197504e6635f43233a2718c900acc244e0a7bd |     
   xtensa    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/5db6ac88abf30d8c21d02c193605368201ce5bdf |     
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/5776d00a93ff8070f113af9f48072eb94c19069d |     
microblazeel |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ff47ece2b23970700f80dd2753da50bef8412e67 |     
    mips     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/869ad133a46b6a8c3b468161542196077588021e |     
   sh4eb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/6d2e11fb74257eb147ed4e769d943bce1298b126 |     
    sh4      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/f57f518743076085355177ba976f9a4b53af8c8c |     
    sh4a     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/f9468a5e844f99bcfa3121c14df9c2c37e6a5333 |     
  riscv32    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/3a426e1875437b078042341c3ac3978ffd64a9e1 |     
  mips64el   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/b46012ad13f5ae989cc32ce4300a871e02084bf8 |     
    arc      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/b7ae375bf13703454ed143d88616a7731c4be82f |     
powerpc64le  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e6b7c300762e6e1c0658043efedccb2704206bdf |     
powerpc64le  |      ncurses-6.4-20230603      | NOK | https://autobuild.buildroot.org/results/9f7aa2838082361598a7aa9ef84471cadd43afd3 | ORPH
   arceb     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/aeddeee307505edb45d46748bbab3034900ca25f |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/3e79fa842ee0484e2c60f387ceae1a76a07fd4d3 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/2014aab627f59f748d41c370695809296b4d77c4 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/bcff9f96aa2f27faab418850380739216fd79e88 |     
    sh4      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/28925bb5f208b43d2bfaf26de31bee5fa772c145 |     
    or1k     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/baa69f07b27dfb76d1c595a0c1f6d093b4f25cee |     
 microblaze  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0a1b6f7d2a43dfa5eda235c6746d02a053e32746 |     
  sparc64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a2705e810ce0b6e684dd3129a493f8a919301c5d |     
    m68k     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/47689b4a2b19f6eae9d6875fcf67b40daf59bc6c |     
powerpc64le  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/33734b850c43281ee02ff0d0f63d130e7f57db47 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

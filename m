Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918D0FD88F3
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 04:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEA9860E79;
	Wed, 11 Mar 2026 04:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDxPIbhmbgdv; Wed, 11 Mar 2026 04:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22407615DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773203149;
	bh=T0vNCx5D3tIBH8yQ30D5Y9wSDOhBnoi54Ymq89M6cyM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rc9TGHA41Z5Yrh1IH/1UngOShZ4l0rjgkpJtvoHP4zdY3Q1xC0Jozd5/zGmQFAgv0
	 Gs+GZ157AjylHvJP+/h61xamUhvxUDYtB6FPMRtAJhB3+VQzv8WkHmVOCGd0R/rqVR
	 XXSJQoSx2Gm0hJJomOp8Ch9hW/WpDxyLGXpqH6i8G4ekOLhQ46GSUIB0ImD6NV1YYq
	 aglDi+YsIXwp0lGaTCfGtyrIwHvlkhBgmh4E237sUwBoH/lKSvpL+Z9Pv/XPMb/ziQ
	 hpAHbfcMEEWiCtLP4pMBZD+dsTL4UD+MQ038jGwTtu+k8eDiYUo9D2KXNRyV5w6rPs
	 bmJ9YHSK/XahQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22407615DD;
	Wed, 11 Mar 2026 04:25:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11EE9228
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 04:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E997141E0C
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 04:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fo_zsO8wXQX6 for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 04:25:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00F5141BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00F5141BE9
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00F5141BE9
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 04:25:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so10654911f8f.2
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 21:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773203143; x=1773807943;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Q2zm4b1V3jtVtzY7HOFEUFmMhbSkIB5UBL5XdXzCyo=;
 b=j2lqyb+mSY8CZ+/pq2nw0mTUKRzn27IAPsCcancnO/LNQu/Wym12RdWguv+GxI/Dvv
 uf7bBclz/XFEBKrsaq9EFWzS6KpldQ/fLk6DV1SH9Kp8T6iafnoED5k5kRngayRTZZuy
 5uNmkTKOIoHq6edS3M1GHRBLz+fFg5QeeanVbgHskQOxpk2jYtrEVeUxNobJAhUIfYf7
 zLPP2Jww1xU6CGwfbFrhOdyRIK+l4Ze7veM7SuQQpP6yoOFmCqK5v48Ys731ofAxvkfW
 mq3XckUSl5Dz92goGKVINYy62YaUsy/ElIfL2BDc9H5pWh61eOZcrY8tWTGSjASpA+4v
 gThw==
X-Gm-Message-State: AOJu0Yy3hpYH3LIxIDepjUsuAQexN6GuZ+Md+6r69BfTAMtXDNU2PsKj
 ZZIRH+BkHOdKGBzmeNQoSQcBpR0bzDHAFQ5ix+hg2GznTrG2yMimVwnE4c0zywVT
X-Gm-Gg: ATEYQzwa3qyjAueX4OAA+kSvgSCalteH6H4fbz2BP+wE1w1OdSU6l3H/xIsMFhse5gr
 kx8RMpceIbamhm1vNdj7d103eaU7XeMHfhuWO/JAkUI5orSV8tjIfifEFI61YtFonvSzBQZhsR6
 SxWJ0bE6VXmw3fJHXWz/8PwKIJDKma53FYkYNC+J3er02/PcbBEljQ256XDxQJNzU6hyfD2sCvv
 Uc74iF1RH8xvIfMWHnjZq6CnvRZtK554+E7BZvzZTHZF7YCXZiX+EiBJiTdCs/PC7VQ8/628qld
 1grshAeekRSj/6faULjbtpJA8YMI7SJzVtFpqPQ+oPuGjVQZii2jP5XCiMMcj4qfY6MEhz1Fuhk
 eAJ55YQLjMZEJ+b2UwLidXKNxFaxPMZOxqad69lLQFpXVBpVBvBVfA8p+9/76w4WCKKmq+ndPAy
 msrM9rQy+swnh6T3pEEjSoSkwti53rEESPwNvoo4CF
X-Received: by 2002:a05:6000:310c:b0:439:b744:c601 with SMTP id
 ffacd0b85a97d-439f822bc29mr2295584f8f.40.1773203142390; 
 Tue, 10 Mar 2026 21:25:42 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81a9e25sm2744977f8f.15.2026.03.10.21.25.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 21:25:42 -0700 (PDT)
Message-ID: <69b0eec6.df0a0220.193a70.1b7c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 11 Mar 2026 04:25:42 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773203143; x=1773807943; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=9Q2zm4b1V3jtVtzY7HOFEUFmMhbSkIB5UBL5XdXzCyo=;
 b=W0P1hyxmIpz1K99miS2J114OCLPSV9/fld4AGRqgLUI/gcgk7px0Tlv0xLbVRbknGH
 gZIk7SMKagMpqUDKKOe1JiARdYbVGCGna6fHTqwVr+XlzhSt+bXx5Lkf7cwf06taCGZC
 25FgRpWaasFN5rbXJ4BmZ0BunZLRqWNPs3e/6eVtF7xmIcjCEnL5lEMflhiGo8X7SEbM
 +D31K3yWhi1g5nVHkrGCtaZb+3O/MpAZtf7HsiQ6QhInMhYumkzyVTgXV0qQr+AhFo+3
 4ddBHL6H8lXNL8yWtIDeA8rbogq0YfFNI7ZMF6qt/ubMp6l5GRH59BJLYKMaITh8F3a7
 mN0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W0P1hyxm
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-10
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

Autobuild statistics for 2026-03-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 14  | 25  |  0  | 39  |
  2025.11.x  |  0  | 17  |  0  | 17  |
    master   | 44  | 117 |  0  | 161 |

Classification of failures by reason for master
-----------------------------------------------

                 mdevd-0.1.6.5 | 7 
                  libnfs-6.0.2 | 5 
     libphidget-2.1.9.20190409 | 5 
host-gobject-introspection-... | 4 
             libgphoto2-2.5.33 | 4 
glibc-2.43-10-gc3ceb93dc4f6... | 3 
leafnode2-9543ffaf82406f943... | 3 
odhcp6c-f19dd37fb467c9cf10c... | 3 
                   perl-5.42.0 | 3 
                 c-icap-0.5.10 | 2 
                    ficl-4.1.0 | 2 
                 host-gdb-14.2 | 2 
                 host-gdb-15.2 | 2 
              host-guile-3.0.9 | 2 
              host-rust-1.88.0 | 2 
kvmtool-7ad32e5514aca2b6d19... | 2 
libesmtp-v1.1.0-14-g335ee8d... | 2 
                 libmbus-0.9.0 | 2 
        ltp-testsuite-20250930 | 2 
                       mrp-1.2 | 2 
                    olsr-0.9.8 | 2 
                       unknown | 2 
               valgrind-3.26.0 | 2 
                 apache-2.4.66 | 1 
             batman-adv-2025.4 | 1 
                   bullet-3.25 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
  distribution-registry-v3.0.0 | 1 
docker-credential-acr-env-0... | 1 
              e2fsprogs-1.47.4 | 1 
                flannel-0.26.0 | 1 
              fstrcmp-0.7.D001 | 1 
                 fwupd-efi-1.7 | 1 
                    gawk-5.4.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 hidapi-0.15.0 | 1 
                 highway-1.3.0 | 1 
host-am335x-pru-package-5f3... | 1 
          host-binutils-2.45.1 | 1 
       host-gcc-initial-15.2.0 | 1 
              host-pahole-1.28 | 1 
host-vboot-utils-4b12d392e5... | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
kismet-52bcb902e36b2df1562c... | 1 
     kvm-unit-tests-2025-06-05 | 1 
                 lcdproc-0.5.9 | 1 
libdill-32d0e8b733416208e04... | 1 
              libopenssl-3.6.1 | 1 
                  libva-2.23.0 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                  linux-6.19.6 | 1 
                   linux-tools | 1 
            lua-sdl2-2.0.5-6.0 | 1 
                    ne10-1.2.1 | 1 
           oath-toolkit-2.6.14 | 1 
                 opensc-0.26.0 | 1 
                openswan-3.0.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
            optee-client-4.9.0 | 1 
             parsec-tool-0.7.0 | 1 
                  pdmenu-1.3.6 | 1 
             pptp-linux-1.10.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
         s6-networking-2.7.0.4 | 1 
           sane-backends-1.1.1 | 1 
                 sqlite-3.52.0 | 1 
                   swipl-9.2.9 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2025.10 | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.3 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         apache-2.4.66          | NOK | https://autobuild.buildroot.org/results/2435b2aa0ff13da4885861e366e0c12b5dd8771a |     
    or1k     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/0a9902a8dd6f7be0ec7c2e8cf3d195da3fe794ef |     
    or1k     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/885b0a0d1221abe593a8222fd047e4860a977519 |     
 aarch64_be  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/1909fae22f3d120a6f25894764bdb3e691c6204b | ORPH
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/d732049e5d4818258fd88b45cfbaf43780053f7d | ORPH
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/71fa02e79fb142d66f0c8265995c5a12174faa31 | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/4e5407162cc4b100bf6ed4f51b0545561d078da3 | ORPH
    arm      |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/31349e741ebef4c88037f0b924b06ed4f3380bbb | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/cc50b002bdfab721c9f060185fc6f161d9560f87 | ORPH
   x86_64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/2c5731647511c76b86b7c94a3a99809acb2081fa | ORPH
 powerpc64   |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/03a2e23e2c76c1f28932ffc91f6f32cb38a1b426 |     
microblazeel |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/8244c0d3c14f96b5ecece1d55823b6036dc5f433 |     
  aarch64    |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/f82cc4ab76e4fb245f7e4689cc8bfaad27e03d75 |     
 microblaze  |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/47012f8d21d9560fecff588d1c18bdc8465d9ca0 |     
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/ac5fd2e37ae9a2ae6ece955a38000cbc2b524547 |     
microblazeel |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/b99eebae40e3f50c6859e4febffd85d0b97d4d2b | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b41cd2bbd69220ce20b649bd829cb329f233f891 | ORPH
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/a2af7217c4abaef517e1aa535ee4e3b1d507d6ea |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/6b4e0c80de1ba6dd34aec08272e9461b642c75aa |     
    mips     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/6c9ace6a1ea1ec698de34b3e68c8210369a83e96 |     
   x86_64    |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/6a0021a1255a2df7db5307d437ba7686bf981450 | ORPH
 aarch64_be  |         highway-1.3.0          | NOK | https://autobuild.buildroot.org/results/13b5da0db094857639b2a73d486fd41597b8ea52 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/1ab6fb387938b55f02dd9e254f50553d1d0a66c0 |     
  riscv64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/a0058e68dfeaad4222ea9fcc372ef2601159f6f3 |     
   mips64    |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/54a81e852f91dd5a72571e8dd99fb1aeec5e9e5c |     
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/d13c54a968cc19d56e256948ab5c70918d49eae4 | ORPH
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/0fc4a93a28020143d8d617f70cc30ce3dec3b5ff | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2fd3864c986154e071e0ce346691c09e5766c98c | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/69f4ad382dbc357ba404b1ec236b16e13e5c06bd | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7387fd6e45473c2a55694254c4eb5589723966ed | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/847c3216dc07eae52f0fc5e24271d9eb0d77f648 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aa63b8ad47926457ed731179374f6fb374c3b59e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9ac0d5f32bc1fea14b26ab306b33ae850646f7f9 | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/6620dffeb8fa1b163d3179f80cc7376e48f21d61 |     
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2b225df9feeb6b65f027fe64e2770dc9f5d577a2 |     
 microblaze  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ca266f22078b58c381c3f9d28f5e931197f77373 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/d365bb45dd45299450bab1ed1b4d9a51bb0c930f |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/eb67b74bf23bce0a77af5c516e80267cc5f3f6dd |     
microblazeel | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/0c7872f3e0066689245127f49350df4a76ac61bd |     
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/af110c049651ec84bf549668598718bc59ed406e |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/4bffc55697784d9cc5f850a170b937de17062f83 |     
   mips64    | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/381b0c1ee3923ad67f1ce846dd93d04c540aee14 | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/58b2c622a198751f8ee57f7f9e94d60ff03e31dd |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/f89c9b6e7372cd24e350bef5cf285582009d322b | ORPH
   armeb     | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/e1db5a36701e736e688dc02acd067dce96bdeb9b | ORPH
  powerpc    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/f972319c6ea617e9fc9db9fabf996209406191ee | ORPH
 aarch64_be  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/b76442616cbad3f3436754075e1352f52b83510b |     
powerpc64le  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/78b49baa27d7d66caa3b342299455549f4d24321 |     
   xtensa    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/bb4b418e1c8127f291cbb28cebe352d665a0d24d |     
    mips     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/48da817ba47366f66d33e000462d688dd828101c |     
    arm      | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/a1dadc45dd1ea5008dba2ef1c37880feecc5c323 | ORPH
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/9a1563d031a29a76b74177544d3df4bb347deff5 | ORPH
    i686     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/2a453e7838f7ad5996f044f72cc0cf89cb35abba |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/c4d3028ec9aaab6c9cce72a6c0cc1f44c90cb42d |     
   sh4aeb    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/a11abe25857a7995215ffc66a891237fa4df2361 |     
  powerpc    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/64d086a369fb5092f65e9498a39af86155bc3124 |     
    arm      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/c008a3492389e4bdd5194377558c2ab744beb982 | ORPH
   armeb     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/ec8bba54ebf580f2a3f012a101bcadfc5d4a6385 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/9a3cfd355a06991f44b01d650c2ec85e987ccec9 | ORPH
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/5510e94e24ef4eba9ddbf5eb7b62d6a9604cfa35 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/57af3ad6f3a92ae8105b4baf8e4038ac7135adb9 | ORPH
    or1k     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/ddc297210303381d873de69e9d6902c746cbcd5e | ORPH
    hppa     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/bfe71267bcfb3c05e6b2f749740a81945e5d81d1 | ORPH
powerpc64le  |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/5e11ee9f749a9ef8a2ba3882cf7e0825cefbebcc | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6f79c27a5e400279caf1da10cdb3bce449eeaf35 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f67b2d48863b510e15263001c2778aa9c48c588f |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7e110b9487d868063f1a334442f68a039506e177 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/cf67e6c76162456e91723fa9a4a8a05b61c68cfb |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9a041933724ee3c3b36eea2309e95021967e7e7b |     
   mipsel    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/3a793b54c1d3198376eb0202c1861f2c47d5d928 |     
   mips64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/50468254fe84e83c9dd10d0b91949e77aa863270 | ORPH
   sh4aeb    |          linux-6.19.6          | NOK | https://autobuild.buildroot.org/results/be7cb375bd103d035340a680d53485034880d11d | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/56ec8ca57ed5656284b7d91b9500bb1d90899c19 | ORPH
   armeb     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/a1e664cc9123dc2ff88c137190db58d46715b063 |     
   mipsel    |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/e07d7aed6fa7169e241c6455a80b1d509afa905d |     
   s390x     |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/35dadc42ac29d6bf3b2a5e9e710b79294d856cdc |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/cd9707a75f006537cbf978779a0489889e87f74d |     
    hppa     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/66752b4b28888c55eb679bfdc30c441dd09960f8 |     
microblazeel |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/53c9a121085eb2c19b0a0b96c4162d5f4c60b17c |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/99745c96b971ce3b11353c209881f343b8ba7fca |     
  sparc64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/77b679aa2f5273b49ae0ce6927572032702db962 |     
    hppa     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/5e2c3e4107776b7034a933750f110923b9d03984 |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/7cc9b6d0947ff5425bb0ddfbe5cbd987269a582c |     
   mipsel    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/56d6d19a56b351eb4632f797f0fbb00f80e9d360 |     
   x86_64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/e3804d99615d6e5269699cc4d4cfa68d2ea06569 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/1c3f0a2c676f52ba7e3a10d333e8fdac9ffcf24e |     
 microblaze  |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/9fe5b0e7511f0c020e861b7d1b6eaf8e2732548c |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/48fae8980111fac930b01da1d45e4cfd7b5a8ae1 |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4de3ec13aead855bd710308dc0caa4f0900c91f0 |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/e2afea21df468bacf085049427df968036aedd7e |     
 microblaze  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/e07a727364b170d51e4a67cd4006fd72e989e39f | ORPH
microblazeel |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/84c97a9eae48ed9ef6b630bb29b872892a1b6c2f | ORPH
    i686     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/ec8dd342542d87eabdc9ef2d800006d32a6394c6 | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/aa19132f2cec00a398c3b50f949c04df793c1c27 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/066ce032feb714ef46f7a4db86e0cf9b887bb74d |     
  mips64el   |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/54081c743ed618d67668863d200a0fc6518e6691 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/3d5b4f11326773cc6f53cd43f30edd28db2d51ac |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/bd531f630bd9769fdfea57203226ea0a35d3628b |     
   mipsel    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/96012c9711c889a6ac5cde3459768aabaad388b1 |     
  powerpc    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/520c370897564e90c7eb152ec72ae0cd351795a0 |     
   xtensa    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/3556d6f256094e5927f0f35d05cdefa76346dfbf |     
loongarch64  |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/e91b8d59e4764136563986f6801a1a090e4a73f7 | ORPH
    mips     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/966b1ed4057a5aa93801a1cb6e6b0175523ae2df |     
   s390x     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/4de452b34fc45e9c682119948dcb7a1c53cff43e |     
   sh4eb     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/f6b1e9269c933207c4fb0c582f78403d548eaaf5 |     
  riscv32    |         sqlite-3.52.0          | NOK | https://autobuild.buildroot.org/results/6358bbd35a3c76f7d74459543a096d2f5c017746 |     
    or1k     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/f4c840a4b0337d09a219e67a70ddf8c4181b4dff |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c5b64845556c22ba1f9e312898b434f4f8d84e5a |     
 aarch64_be  |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/1c769682b9461a98e1e17016481cd37d5270f2a1 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/34ebfe3d7fda28fac4e1e1061daa80c7ec0869c3 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/abe539063d3ce870c0ff149514303c54824689b0 |     
    or1k     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/7cdba135cb2e21d1f757deb24dce52510df86b8c | ORPH
    or1k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/b2c1bca65d811d9ec5dc296e478abbc95ad943be | ORPH
  riscv32    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/d7394578a5c5d632c9fd910b7ff3a6a9f4bdfb58 |     
  powerpc    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/a2dfca7898d1581b30b4b963e7c769a2204cec2c | ORPH
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/ea766570b11b2ef6e73ee28c49e5043f94d6b67b | ORPH
powerpc64le  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/ee576f17f816c47cb6a9a970e5682a1fd79e97b8 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                       unknown | 3 
                 libmbus-0.9.0 | 2 
           dmraid-1.0.0.rc16-3 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
            host-coreutils-9.8 | 1 
           host-libtpms-0.10.1 | 1 
       host-libunistring-1.4.1 | 1 
              host-pahole-1.28 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                openswan-3.0.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
               tcf-agent-1.8.0 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/c0f7c4ed07b3cf5e80789156c09f01dd4ffcb56f |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/2cdfddfe6b5cc4093a90db1cfbdf8864374006c8 | ORPH
  mips64el   | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/a9b47dd44defc560131f495de7b56b7cc038cd06 |     
 microblaze  |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/3581159b42f51d5584ba8c49cc3c97729a0ac1f4 | ORPH
  powerpc    |      host-libtpms-0.10.1       | NOK | https://autobuild.buildroot.org/results/9dd8a8bca571ce1e4dc65d74447a9f1a30fb2bae |     
    sh4a     |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/89ec10012ff10af25e04163754079a230c23e339 |     
 aarch64_be  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/9afa2fc0594529e4b92817893628dd0b58471aac |     
    arc      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/da6c6f11607bfed32f560fa3c539efd412d8f165 | ORPH
    arc      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/faebfd1bf6b33474434e756b54d2e3ac4406367c | ORPH
    sh4      |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/316dd08cb41a62c26f2a0ac5e740a854006aef51 | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/7137322ef6242ce79a496f46c7848288f0624d80 | ORPH
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/768fd86b8ef566cdc5b1f8d427573795883ed1fc |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/1934566d7b3dd0ea4e4b86cf2c67e0c026a42105 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/ed958a106ce71b49e0dd5c7b794dba1ae109ac2e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3e40e5173699fd0416cb068eaf68c341e4295e18 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/188122baea7029d6a8a29bacad24f69712c2ba61 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/87c74435be14956fd45f730269eac102e70d56da |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 4 
              host-pahole-1.27 | 3 
                bpftool-v7.1.0 | 1 
                haproxy-2.6.23 | 1 
            host-binutils-2.42 | 1 
          host-faketime-0.9.10 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-16.3 | 1 
           host-libtpms-0.10.1 | 1 
        host-python-lxml-5.3.0 | 1 
host-vboot-utils-4b12d392e5... | 1 
                 libgee-0.20.6 | 1 
              libmodbus-3.1.11 | 1 
              libopenssl-3.4.4 | 1 
libuci-f3fc0b76040685829191... | 1 
                   linux-tools | 1 
             pptp-linux-1.10.0 | 1 
                       unknown | 1 
                    wipe-2.3.1 | 1 
            xapp_editres-1.0.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/5aaead916d70bea7a4814bb5f9f9a72f7d1da58f |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/4dfff10f548d5bb3b5503cb16a3b51ec7e13e937 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/0d76b2a6d3c7c6140ae2d30f9f4e4d3052b5e1d2 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/1e82370622d3ab1be78c59b1b5a02a4bd05fe1f6 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/94a230281f7495815b1345c69b7015bdadda2d3c | ORPH
    i686     |         haproxy-2.6.23         | NOK | https://autobuild.buildroot.org/results/867b16451819cc24faf797f1f84b412a4149ffbc |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ed2041844e8ff2be70cef643f4f8eb41cdb7989a |     
  mips64el   |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/a5405d2fc8991499b9d9414d4092242917be0c7b | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/036be3ac4c796e0961be77165390f64b9ee1859b | ORPH
    or1k     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/d36beb5f333e0786f86804861709a2639707ba2f | ORPH
   mips64    |      host-libtpms-0.10.1       | NOK | https://autobuild.buildroot.org/results/311f10082d9442405e1dae68597e51351e565ecb |     
    m68k     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/a5c886d6655a095b417ac34ef8dae964a748b085 |     
   armeb     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/e6fd21a37cd4d28cfdcfad588f601201727a3567 |     
 powerpc64   |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/68344b4dd55999422ef87d7a3529e9306c625423 |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c9f09e45195428db41e6e104fe1adbb367049d1c |     
microblazeel | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/cee26464689727225d59d879e4612fa3e9286573 |     
  sparc64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/7fbb5c250e10ea00b43fcb5a952382358a8b0366 |     
  riscv64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/6742043a5ec06a08351e9ec0a91e62917aec9594 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/c6bbfe67e23975ae2aa235c7b693dd3b4f5069cc | ORPH
   arceb     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/ea7f11088c5eee1824ca2034d87787c7737519f9 |     
microblazeel |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a54ea89d7fe37267a23f7912ab2fd0fb793fbac2 | ORPH
    m68k     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/136e94e408507062d7d57c1a1e246970a8d332f4 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/11baa154f6717617e82f579ef17b8bb8e31323f2 |     
    m68k     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/71fd0f439d7cf50f8da371069a8ed36c9458b18c | ORPH
 microblaze  |       xapp_editres-1.0.8       | NOK | https://autobuild.buildroot.org/results/6ae4f930d280ee66a731d077c1ef52d8f303fb56 | ORPH


Gitlab CI results for 2026-03-10
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestHostPythonFs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13439331781 |      
    TestHostPythonPyfatfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13439325062 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/13419783211 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/13419776650 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/13402410966 |      
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/13402410722 | ORPH 
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/13402410543 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3A11088E46
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 04:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EAF6813FE;
	Thu, 19 Mar 2026 04:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVolYrYYXEsv; Thu, 19 Mar 2026 04:24:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F3BF81400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773894243;
	bh=5mX95RFhgP9sbGeGWal94DyZnBh1G83kiy6pf5HdoR0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cC3fjm+QBq3ErE2urj2sZPZKK4qn+Lhz+m9kJzxzo1HQAtu+AzgZpi/+2cB7z443p
	 Jhq91D7HQi+EcOH1tQ497lvS2gdA3+g09EE3FojskrAf7qdh1GG7ZAdz+Ko9Tw++kd
	 88fIxok2Rb1VlpFC4PMCZ9FPnhZALIms2AGe7LLI55ei88YgQFkV7IVd4ArANzmyNu
	 /GRMTaqzpY79GyIeViLy6RdLPC4Qn0zYOuVQn05ONr/huxRdcIyVCLxWWsiNsCdZmD
	 0tMRT3OjMR4AWioat/SSnVh8f9oetR+fly5roV3aD5/CHyFqYZooYIgMJPy7C+CXf3
	 SW5IvrxsSVwFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F3BF81400;
	Thu, 19 Mar 2026 04:24:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23F991BD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 04:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B17A60EAD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 04:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTYxkMIbYznP for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 04:24:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8277360EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8277360EA5
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8277360EA5
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 04:23:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43b4fd681c2so383296f8f.3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773894237; x=1774499037;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnQk22bot9A+bjvdFD5B6ltTufDdzEFpGbm4OFrAJsg=;
 b=W0bWmR0projyh2i/KLNEGDWe4enOh7+uK6FBh6ehE2qng0dIMSOky4gVIuHLi/h1sW
 JFsT+HffRPuI+X6PC0g31u/YWZ54U2I1hCE5FsaAvuYuFvHT0SwaM+y8n83fB4yffcE4
 rm8xaarjue2Ak7xKCBrMARgGJDlexDWW05v4Aiu6S+IDhNi00r0/LfhoufBWmjF2Jhxs
 ijO/DO76KliqqjqtvnswIOzuaLhZgec3lteHAhyQ3YtqZDUWY/SREAYvQEgatFL56+bC
 7ET+hcEyOGQ7tz7DvDDTIP0hkQzQXWiyGoEvfA6aEa15Q2BMLi4c/K8k8WSIfxODL7RE
 LXaQ==
X-Gm-Message-State: AOJu0YxFCipTWAxA01xXe1jBXUg0b3UJgNnJpsE+CsZCL9ZelwGZfmQJ
 00FXPmPsFjLx8DnTxgLJQ9++cY+nC5dZM+Um7aAREGeZ3nGudXLAMGCtHxEDRVT3
X-Gm-Gg: ATEYQzxKGoHAFivaSiP/C3tfZwoj7Z1FDyCod+rcDBtApXu481oOaIMMbRxvi+TP4Ye
 +zRwltMWV02IH4MuVmdiVSnv+fnSqqNALNX7P28sdedomRnb4FQItnbaj0SwoV0bESiD6BNmMfe
 K3eh6M2kwgaPEW6qhSsvVC5CRf/RqwdOvCI8wAnkeQE+eGdsZiL3uny+FCBI2oyHtOfcgi8VKbk
 vKOAqd83nb76fB4x5v+GobyAQm9+Vu7oPT2QdPM6ozbtnniyTEhHkVDfObIaqngr1J6lUlCnLW2
 SceU2nWJ1VeVMerHW4P+DAE9dFWXgGdsSz1KxYwn5ijyYR3BsuaPcyWQm0eg0uTEk4fMWll4Ze4
 qRp2cSG5s7ff+tdNyc7PnJYNcHezIgwPNWNVKs/oA6oWwxfROnnA1wX2IIhtQUnpzzX2LtO7wqu
 giDSGnvWVUEwbjq46FAew3XQv/1w==
X-Received: by 2002:a05:6000:40c7:b0:439:b114:60c0 with SMTP id
 ffacd0b85a97d-43b527c42a8mr9876890f8f.35.1773894236781; 
 Wed, 18 Mar 2026 21:23:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b5184b8b9sm13534366f8f.1.2026.03.18.21.23.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 21:23:56 -0700 (PDT)
Message-ID: <69bb7a5c.5d0a0220.2f7b44.eb9f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 19 Mar 2026 04:23:56 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773894237; x=1774499037; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dnQk22bot9A+bjvdFD5B6ltTufDdzEFpGbm4OFrAJsg=;
 b=B0GRRELsDM62RxLReXV3anvAqkepLj9Jtv8j7bCP97vQX9Gv/KDEvF1PgrXAhDYZO8
 /NdhhHDG3UhXYo/iIbx6zy1lS+eeQhYu+EbzGHRx3hv83xxrQs9u1UetEgvC8KQv2vle
 zNkSWHDVRqvTdTJQmoE4if51guelNCPfVLytVCvAoyEepKWY/uwUrMzsr6jSmhjclylJ
 tKZqHsyqWjPlK0ig5s14R3rG4c+IRHp9YQsC+FYqfcto80REPAWm179QADkmHks+KwtB
 O0sjOmOVPKMMULUXLpMxM+dnva9r+I05USDHrXLa515NTyV2Y81bRk+/Qznh6RvdlCee
 r6IA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B0GRRELs
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-18
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

Autobuild statistics for 2026-03-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  | 45  |  0  | 56  |
  2025.11.x  |  7  | 21  |  0  | 28  |
    master   | 58  | 161 |  3  | 222 |

Classification of failures by reason for master
-----------------------------------------------

                flashrom-1.7.0 | 9 
                 mdevd-0.1.6.5 | 9 
                       unknown | 9 
             dahdi-linux-3.3.0 | 6 
glibc-2.43-10-gc3ceb93dc4f6... | 6 
odhcp6c-f19dd37fb467c9cf10c... | 6 
                   perl-5.42.0 | 6 
                  libnfs-6.0.2 | 5 
     libphidget-2.1.9.20190409 | 5 
leafnode2-9543ffaf82406f943... | 4 
              libopenssl-3.6.1 | 4 
host-gobject-introspection-... | 3 
              host-pahole-1.28 | 3 
                       mrp-1.2 | 3 
python-remi-2022.7.27-37-g1... | 3 
                bpftool-v7.5.0 | 2 
                 c-icap-0.5.10 | 2 
           host-libtpms-0.10.2 | 2 
                libcurl-8.19.0 | 2 
             libgphoto2-2.5.33 | 2 
                 libmbus-0.9.0 | 2 
                  libsepol-3.9 | 2 
                 libzlib-1.3.2 | 2 
                 linux-headers | 2 
                   linux-tools | 2 
               openblas-0.3.31 | 2 
             parsec-tool-0.7.0 | 2 
                 rtl_433-25.02 | 2 
                   atop-2.12.1 | 1 
                   ccrypt-1.11 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
          cloudflared-2025.8.1 | 1 
               collectd-5.12.0 | 1 
                   dante-1.4.4 | 1 
                 ddrescue-1.30 | 1 
  distribution-registry-v3.0.0 | 1 
                    dpdk-25.11 | 1 
              e2fsprogs-1.47.4 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gdk-pixbuf-2.42.12 | 1 
            gnuradio-3.10.12.0 | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
                 hidapi-0.15.0 | 1 
       host-gcc-initial-13.4.0 | 1 
            host-go-src-1.26.1 | 1 
    host-mender-artifact-4.2.0 | 1 
          host-mosquitto-2.1.2 | 1 
            host-mtools-4.0.48 | 1 
                host-odb-2.4.0 | 1 
              host-rust-1.88.0 | 1 
          host-xfsprogs-6.18.0 | 1 
                   i2pd-2.59.0 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                  janet-1.40.1 | 1 
                     kbd-2.9.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
               libglib2-2.86.2 | 1 
                libmdbx-0.13.6 | 1 
              libsecret-0.20.5 | 1 
libuci-f3fc0b76040685829191... | 1 
           libzenoh-pico-1.2.1 | 1 
                  linux-6.19.8 | 1 
                linux-firmware | 1 
        ltp-testsuite-20250930 | 1 
                    lua-ev-1.5 | 1 
            minizip-zlib-1.3.1 | 1 
                  nginx-1.28.1 | 1 
           oath-toolkit-2.6.14 | 1 
                 openmpi-4.1.8 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
             pptp-linux-1.10.0 | 1 
           python-html5lib-1.1 | 1 
           sane-backends-1.1.1 | 1 
                     shim-16.1 | 1 
          sphinxbase-5prealpha | 1 
toolchain-external-bootlin-... | 1 
           uboot-tools-2026.01 | 1 
              udpcast-20250223 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/de5d9ca7467262f9fb1c9edf0d4ce526e44e0b54 |     
   s390x     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/8061b4891adfe2b3790a7d69e9d2b5fa31d4a30c |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/65c147333bce610b072f22226594676d5be8fdf1 |     
    i686     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/ad5ed03d87d3167b3d025b88d10075b029ae6e98 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/1b197a8f86b2558e9ec3744c9218b81a432b42df | ORPH
   armeb     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/94b2a72eab8bbaeb127c393970385a736c31ede1 | ORPH
  mips64el   | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/f2f3255b66242b48ebbb8937935ac13c2c71c7dc | ORPH
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/c6b389ec33ce981db34f1d3a60947d056b447e21 |     
   mipsel    |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/0de5694f26a0639016a756541bd8e978a97456b7 | ORPH
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4e6c1e94e7596752a3e85eb38bf940d21916a88a | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/05bd4269e65cf1bc2b297e06adcaa26e9655ef53 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0fb957d800cab6768488ebd165aa68cdbfa5f1e8 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/256cf64350fdc7e58a426ef429f62237276408b7 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fb8fe2f3c02fc35dcc8dde73d28886da88d63d2d | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c505113424e3853369b1ece4c0841ebd2fca795f | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5dd2a8270984c7df1ffed773306193c85714f0a3 | ORPH
  aarch64    |         ddrescue-1.30          | NOK | https://autobuild.buildroot.org/results/5aeec364d72c37265d190a85f6a17a48ab417ff7 | ORPH
    arm      |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/f66db8b36dc86ae34c7fdcf9b8e392d7cbfab5ad | ORPH
   x86_64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/7ba98c997ad1bee5b98ab89c41ad78b1156e2098 |     
   xtensa    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/a813fbc042350c6645bbbafa7a4056e05b91804a | ORPH
   sh4eb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/e8712987c8c4c0f8a95d4d3dad7bd2bf19de6282 |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/5027f60caae6bb8cc43ef5f289abecf85b572e2f |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/d47560d2b248d5f1ab19d3a4da92ea9545fb564a |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/4c0e8872570ba96a915cdcc6f7de68166b89cb9f |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/937950413d1121a3aa816f21a1df0d79b3c3015c |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/2692a26cb0460b67dfe1eeb494a3882e760b7a8b |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/185b109c324e7b6fc0092a6800ddc7bdb0203d0b |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/fd45d63e92000f4591781606bb4fd7df44b1fce1 |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/ac09cdfd13c8f83ba5342b5aedfb8899f561d9aa |     
    mips     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/debfe2f7b80adcb53da826aeec04038bddcb4f7b |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/28ad696dcf9eee38d482ee10255fea97cd446ec1 | ORPH
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/a72a47b4255092658fd061d7e9863460f75b81df |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/efe0d02f561fcb6d4da0f51d8c60e76a052f8d24 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/c44a094ef367935472636416ce5f45cd6a0e2c76 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/faf925b2e3bd280dfa5b13fe083495c0b0e292cb |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/2b2121ef2a7eaa4f2cd40bdc626d284d184e1097 |     
    arc      | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/bc1f155fadd356c5d73625ac669f9f23f938a8f9 |     
    m68k     |       gnuradio-3.10.12.0       | NOK | https://autobuild.buildroot.org/results/f7296e2aae92c1b173f4932d45d4550423d1a0cc |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5523cd11ff1c6104e2a1b317acf05d7b8fb5d29a | ORPH
 aarch64_be  |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9917ecd4b653eefc79d1b9ffa97fc22f8006a399 | ORPH
    or1k     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/1d6c0e3daf31555c7729a9886f64457a597e2c16 | ORPH
   mipsel    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/cf81f1870266696b89339eb2e2c2508f8a0b482d |     
    i686     |       host-go-src-1.26.1       | NOK | https://autobuild.buildroot.org/results/2a06db6a2213a178ab351d0aaced3396536c3842 |     
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/795194f3d6980e60c0d5c390b1eccc0e35179bcd | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/25633c421d4ce7432943c1159ca9c72c26a40572 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fd7a74e6a9c13f6d1d5a99ef58a1471b78a4f000 | ORPH
 aarch64_be  |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/1446e3532ae0963bf1980155edc05ff256aa8249 |     
    arm      |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/d868535e1642efa5838f6b2c09be5c66545278b3 |     
    i586     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/669aa4887a41cb75af947909fc1eb012a4d63090 |     
   s390x     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/25483e51b4c47beb83ba6f36e983fb06e857d4b3 |     
  riscv32    |       host-mtools-4.0.48       | NOK | https://autobuild.buildroot.org/results/7c0b8e588b37cabab660e13440363798d2ca6534 | ORPH
    hppa     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7dcc693940641a3c7361c82c35902c820ac36768 | ORPH
 microblaze  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/692a724f65e8f09da3820c465169f9b1b21839a2 |     
   sh4aeb    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/2a6f91b1d6eaffd10344d427d565a446fa12da48 |     
   xtensa    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/7fc695d94ccb6354b388ade837093e81abca3b2d |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/546688d93a3787cf8b80be91714d422c17e38f23 |     
    i686     |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/79d0ddc8f3371a746445cf975058967c50b55ee7 | ORPH
    sh4      |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/8c4af0678ab0892d95dc4d9b87823da8e4b64b38 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/9c7c05ecbc1a8f56b3f9f6a60d465c72bba8d51e |     
microblazeel |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2c4aadec3911391400fc88024dbafda9cd04f1bb |     
   xtensa    |          janet-1.40.1          | NOK | https://autobuild.buildroot.org/results/017bcb92cec494a796f3b9deeeef10a9f015b7b8 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/7bc0dc7933d25992f63e5f92f15a99267f78c64f | ORPH
    sh4a     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/39ce438d9c4499cfc5b58e7df8bb4a45a12cb3df |     
   s390x     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/ff1f27cf9e1812f1457a2bd4115850846e4d96f0 |     
   mips64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/4b5db2a6ec75fb8d8bfea0282eccb7c82faa419c |     
  mips64el   | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/e7859acc43adfcee24966db386e8039a8bbc6790 |     
    or1k     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/db137ce1171908bc1858bb9d8bf49c3cae2236c3 |     
microblazeel |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/0e58dca17866645f51b1ceb87cbb72832e00095f |     
  mips64el   | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/1b6252f9a57828d02639ba74297b7be59a02c2c8 | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/9dfa9df8bd0e3b7d597a3ea949fdd5d2522d789c |     
    m68k     |        libglib2-2.86.2         | NOK | https://autobuild.buildroot.org/results/be44c8ad10544223da33e18d97b035556d4b13da |     
    m68k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/db1ebce541cddef9f99c5dca7ac7cdd883d20869 |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/c0ac5fca8559ad7f271dd673592d28747c798bc7 |     
   s390x     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/d2d50fab5a097b55ad55506c31e0a0d726096aa7 | ORPH
 powerpc64   |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/0b5215789b696279587e2cd5955574abd34c5a68 | ORPH
    hppa     |         libmdbx-0.13.6         | NOK | https://autobuild.buildroot.org/results/6ca061c5150bde139a0f558ab450cf6eeb4ccdd8 |     
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/e3a90f2b51b1d24c7919a87233aecee9bd1e2804 | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/fb60d402a4afd87c3cfd6dc41f46ed0d364d6536 | ORPH
    sh4      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/d29e3fdd637b41f9da23a7f354040cafff9d9353 | ORPH
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/c21444a159009d932694bb39cc1c490fe68e24ae | ORPH
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/d3a54ac8227fc5456bab90fae235c66382d4b6d9 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/9225d0b3ba06b9ef7c651c2a51e0dff199de5f43 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/eb6877f1781e35e5d630dd573e9b3ecf7eea62fe | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/ba2864df29cc88ef2a8867dcce6171c488e2aae8 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/1f6bf6cfd4f2ce87e7985fb706ed34438ee81baf | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f5ec73b1fdc44f5d1b107a40eea8f22544a24178 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d9842debb8593decb7f77712a59c0fc94f3f4362 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9e17b216dfcb66875916eee3361c91215c22109e |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9230d7e9653130869cea9d3530cba299ab3d6196 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/67f61a77acceb899b2ff9d896c08938f3d833327 |     
powerpc64le  |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/3834fe9fdf10f21bcd2ab062644cf9a56eeb252c | ORPH
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/389754ef0fa0b2f499493bde8de0d37c509e24f6 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/a18c22ee87c6458b688e65308232a8a88519bcb5 |     
loongarch64  | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/61e87b5734136f16a0978b5b8d2f05243e54631c |     
loongarch64  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/7eb4540b12ff615f9f8bb8ceaa7050557592dd64 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/2297f206a02165110df306b64ab88bc4c13a6b6b | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/375794bb04db0e642e28961ab76b89b8f871089b | ORPH
  powerpc    |          linux-6.19.8          | NOK | https://autobuild.buildroot.org/results/272d00bc9205de9af393cb5bc57d41835d1270bf | ORPH
 microblaze  |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/c5c8424784956fb1d69113c5e5e60c3c740ad338 |     
  powerpc    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/cc3b072089372d506810deece692bc4954253e2a |     
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/7b7a1787c5338aa2495e9e8e659ce19af38a1ea8 |     
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/70ec1bd317f027846a27953065c7c79caad6027c | ORPH
    mips     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8ecaf156d837031af1675fb781de5b7cdd31b75b | ORPH
  mips64el   |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/f152285f7f709b7f6eae9d79676f3fa8e114f8c3 |     
  powerpc    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/20fbd31ce425697a25dad17bf47228d13eee3a02 |     
loongarch64  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/005cdd5c27411b7a40077b206083db0aa7bf4f56 |     
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/a5c819048d19f5124a9017dccab2a2bb7c728c50 |     
microblazeel |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/d62c18bc1e4c39022e95f5c864e67aaeed939138 |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/6c8cfa815b10a18b7485455f43981cc8eb07f9d2 |     
   x86_64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/593400729c42e1f29575207a332ed7ce057b2cd4 |     
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/0b590b8523135aaa02a4e0ffb5e8d6442271ae0d |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/c0324cff387a8371dde2c2df67cdda8199ad170a |     
   sh4eb     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/b9bb4d94b226f238182adb2a1c83126dd8a4b0bd |     
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/b3534db07bf64fda1d13f4b43a524523e15a7987 |     
powerpc64le  |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/f9f864af4af60f9faa038875b7752dfa7990d54f |     
   mipsel    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/708552d381b04b8b9a4c912b6d3d681a9a4bbe8f |     
    arc      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/3c0607effb4026457688f5333b5139bd81792fd7 |     
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/ec7c4c62eb2896f5728806675ae0198c78ae6b12 |     
   sparc     |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/e9be2c7e17d10634165fcfd38fbbdaff5120c596 | ORPH
microblazeel |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/9bc91ca32c54e299ae48eea53ae3a5756c26246c |     
    i686     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/26225a7da491bed8f4f527694acd734834a8a743 |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/bf5f9123d12dd1c614cdd0af312e2c30158d09e0 |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/511b97df807e367eabf5217c18ef34c06ce85b9f |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/215cec4b06020784bd61f526ad401e18471af62a |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/a7ea45bbfb42b3fa5c8fa3de18456a07becbe5db |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4e1dd80c8ec35c1fac8e3d4b907c01f6f67f086a |     
   mips64    |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/e76c57e480478e43daa263222f0151bc6b9272a3 |     
   mips64    |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/7d52f433a156e2d3a56fac1a45b0d236c5917d31 |     
   mipsel    |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/07336de2cdd9b50ad07a8e034871cb0a9dd4f437 |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/39fc2566919db4de7b9bfe66af2e94d9c73c5129 | ORPH
  powerpc    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/50960c4670796f07501ab3afb5aca031bc7a544f | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/cb8b8784a526dd26695ef0fb869c2721a8caa862 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/548049bc5589a47a365d7d52919ec99201e0d9f3 |     
  riscv32    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9bd3a71a3f58883bca644de52d640006851477c3 | ORPH
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/5487830aaf894159e2a0b8a4b43b2f4de0d85c47 |     
loongarch64  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/9360a7babfaa231b12ff9d6b7ff59931a3934138 |     
    arm      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/fd8c565f2031fceca389b494fd2944317d47324f |     
 microblaze  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/52194942396d9d4d67b7b6f3b6bab3f8296817ba |     
  aarch64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e56280a87f4ca20d9175a58665123cf6edbb1059 |     
    mips     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/9fd2289a9dd677806d358f2c9c5c6345e24be6fb |     
  mips64el   |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/95a4cf23b8118ff1fb2b240883983f0d615060d8 | ORPH
    i686     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/77a10121b9fc34f62244512d61141bba6b916b49 |     
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/9b3a9f777d51ff6d9fe7d4566bdbec5c43ae583e |     
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/11cd74120657a8ec6644fe3f0bc18e5b88cbb6e2 |     
   mips64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/dd27d7fcb44a1540edbcd487b374ad4a7f61d777 |     
microblazeel |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/41610d5f2dd121232e7ff77411bd56a9b5a4f6bf |     
    arc      |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/06cd6c5fe47e20c57e580dcdfd9baa07fede13e3 |     
   s390x     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/ddf2920ae502f5a2fb5bc3692fc383fa33115928 |     
  aarch64    |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/6c40ee2b0171e0c0d7bf2c42d6d115b831712f2b |     
    arc      |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/f6b57736cf1deae5c30767a7780022fdadb11ed5 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/e4a557c6b4807dfaff5b3f5b060804a5941827ac | ORPH
  riscv64    |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/57b010516a028cf1b631216de4308bae716607a4 | ORPH
    or1k     |        udpcast-20250223        | NOK | https://autobuild.buildroot.org/results/ecf1041c1d1b7e6bcbd47d03a4e54da1e12e6a6f | ORPH
    sh4      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4a73b699c3f825943a4c68f2976ab2183454911e | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/fb7c374f03e2fae6f0e932a44753e6c7e8541c9d |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/0df7dd22885befd1591fc8eb1aea68212ca7bbc4 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/89be7ef17cef3dd1754ceb1b98aeefae9bb8c87b |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/1a4169b4146699e1f7aa9a4f80944d8bf5a45ed4 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/e4b6ee04a79cc6096013c71e8ffc5f7829cba1ef |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2028a6c4202807a04de8e372331b0a146f8f5614 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/79996455e6e37856ffededd31bffdf905e539e67 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/7aaa564554931ed80b73ad755295c3606d1ef1ed |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b6cd019ead432539b6d811cb41c915b854b2ab9c |     
    m68k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/e8c4e47dcf6bd27f2bf847e23ac3a6e129dc24f5 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                 libmbus-0.9.0 | 3 
package/linux-headers/linux... | 3 
                   dav1d-1.5.2 | 1 
             drbd-utils-9.21.4 | 1 
              e2fsprogs-1.47.3 | 1 
                freerdp-2.11.8 | 1 
               harfbuzz-12.2.0 | 1 
            host-coreutils-9.8 | 1 
              host-rust-1.88.0 | 1 
                   i2pd-2.58.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
              libopenssl-3.6.1 | 1 
                   perl-5.40.3 | 1 
                 protobuf-29.3 | 1 
           uboot-tools-2025.10 | 1 
                       unknown | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          dav1d-1.5.2           | NOK | https://autobuild.buildroot.org/results/1f45aaf49c1adb37c641722453b5ac68e063a28c |     
powerpc64le  |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/66fac6b0f41d5b5e5a6ba3c78c710119c4639ae6 |     
   xtensa    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/387038e37d27fd970d3c55e2fd0a98c60c7b207e | ORPH
  aarch64    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/8820357d2f2e831cf6432c180eef45b75c032afd | ORPH
   sh4aeb    |        harfbuzz-12.2.0         | NOK | https://autobuild.buildroot.org/results/0783d582124a6541e2037a4af24cb86573183d7a |     
   sparc     |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/a40a4c2ad89537368a89ece516c6053b9324512c | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/5c6cfb3e6d887d70e5a79bff4394fb96e2e595a9 |     
    sh4a     |          i2pd-2.58.0           | NOK | https://autobuild.buildroot.org/results/851a61ac56f8ba2e09a8578e2ec0fd47e61d2471 |     
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/ee94e5b2f28bd4c0effd7150ddaa7883e1a57f2b | ORPH
    arc      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/d4ea074f646e836c8797fdd3b2017eb5824823b8 | ORPH
  aarch64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/a3a4bb01ca8e20127870f0a97049844805982d96 | ORPH
   xtensa    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/0908960c2972717809b8305d74f7c2e1e8af53ea | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/01b77bdb17aa013ea44107d1e3c22eb1fa44990d | ORPH
microblazeel | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/183b7abe028cdd0185c811ab87d40b6aa6dac2fe |     
loongarch64  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/a1542b120cbf3773c4929f9a99c0c94c2e43788b |     
   sparc     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/bd22b0df4e3beb02afe58ad91c615fc986929d2e |     
   xtensa    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/44d736bfc4d27454cbcf69efc0e3560b4cfa06f6 |     
   sh4aeb    |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/4866c8abb034f76359c35d31fdcbb03bd233334e |     
 microblaze  |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/abd2e4a6459a8d2c9533f7b7101777e023197a3c | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/54e4b054687af4a7b9b88afc91c1460330eb3abf |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/faee3cab07c6e031d53cb8e964ee3bfbd9d151dc |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-faketime-0.9.10 | 6 
                       unknown | 4 
        host-python-lxml-5.3.0 | 2 
 host-softether-4.30-9700-beta | 2 
                 libgee-0.20.6 | 2 
        ltp-testsuite-20250130 | 2 
                   perl-5.40.3 | 2 
             pptp-linux-1.10.0 | 2 
                  cairo-1.18.4 | 1 
              containerd-2.0.7 | 1 
                    ficl-4.1.0 | 1 
             fluent-bit-3.2.10 | 1 
                 gerbera-2.4.1 | 1 
               graphene-1.10.8 | 1 
                 host-gdb-15.2 | 1 
              host-pahole-1.27 | 1 
                  iozone-3.508 | 1 
    json-for-modern-cpp-3.11.3 | 1 
leafnode2-9543ffaf82406f943... | 1 
             libgphoto2-2.5.27 | 1 
              libsodium-1.0.18 | 1 
                  libva-2.22.0 | 1 
                 libzlib-1.3.2 | 1 
                 linux-6.12.73 | 1 
            minizip-zlib-1.3.1 | 1 
             ntfs-3g-2022.10.3 | 1 
                 openssh-9.9p2 | 1 
                    qemu-9.2.0 | 1 
                   taskd-1.1.0 | 1 
toolchain-external-bootlin-... | 1 
              udpcast-20230924 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/46d29d880cfd2647ac884556439ca7f39f0aff60 |     
   x86_64    |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/43a5007431592522415bf3b722aba7cf32ba4aa1 |     
    mips     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/0d4699d45877b9e654ebabd770b92cbba427bd45 |     
    or1k     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/4853bb72e3f87449daac7cb8cce4daf4a197958a |     
  sparc64    |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/8259a7b28d0077ace8b286acfbb3bb782dd42eea |     
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/21517df314ec75b3e22475e3d9f1424a644e0870 | ORPH
  sparc64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/98026cd7e5a94aa07624ed85d377f285004883d1 | ORPH
    mips     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/95ea8e49c824124e019091b172361b6ccce22419 | ORPH
   s390x     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/60283fd6985d6d54068148f9e4bdba18d7ea4f03 | ORPH
  aarch64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/28330bd8b5c9df16f4604d291ee44ffc7fd4732e | ORPH
  mips64el   |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/93dd53af8521d11edb0bf6cbee68f980d155409a | ORPH
 powerpc64   |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/14d59404d130ae00e05944b270a68011176eaf2e | ORPH
  aarch64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/03326bc2e32c9b43afb1ea0a5de33cdc4326dee9 | ORPH
    or1k     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/d77886b828991bb0373aa6f1ac2ec6b456792cd2 |     
    arc      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/ef45595d533c60c55c0e07deaf6be9f7391172ad |     
    or1k     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/0d488b2c728b92ff69583a823d36b27391ecbe8f |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/8cb5ca3e3e8b9d984cc4951e0032b515829a1e09 |     
   mips64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/1fa1a349e7273fc34a1c0de0881b3b1083f1bc9d |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7e3b58892244a4058f7ad61d31aae300c54f2fc0 |     
    arc      |   json-for-modern-cpp-3.11.3   | NOK | https://autobuild.buildroot.org/results/565d0efe5b2c14c4bff19a6cc5a63328a3de7c2d |     
   mips64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/601339ee2e6aac3e704466fabeadfa335ba9e34f |     
   mips64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/f3a1eac42d8cde41ef29680def977b1b25e2d3e0 |     
   sh4aeb    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/bca7f4bda86c1996b7a7d8867c891498e2743b9f |     
    mips     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/253317bc84cff88acf0566e6a4262b450fdb4a20 |     
   x86_64    |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/947a78d9ce5b201f08c8f75f6539e8c7607f15b1 |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/18ddf47116643a65501b948e7662fd82c728742f |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/0e6f83332dc026b505ae2dce58bb69188ecae1e2 | ORPH
   x86_64    |         linux-6.12.73          | NOK | https://autobuild.buildroot.org/results/a6a7c6ddc799c7e60b08bb7dcc986434d3ae7c2b | ORPH
   mips64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/11ed33bafe659a379e6d9cda317a292727e49026 |     
   mips64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/96bc475daf189b130895bd5b20c3cb9bb8eeb47c |     
  mips64el   |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/8a673d125920ad54c2beae6993f0e7e1414449b1 |     
    m68k     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/ad93162090b34f9576ccfd9856022440d2e5e7a3 | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/6aed59d3786627f704c38c6b2aa2da46de79e3e6 | ORPH
 microblaze  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/ae1d5de16dde53818777aa3ff99208cbbe760d67 |     
    or1k     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/85698e61b39b40601ba52be6cb9415aa90e78531 |     
   s390x     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/bb95fcf8e6146729eced896313a0885c21ce71b8 | ORPH
  sparc64    |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/bb35b8f611916f1cb06d67a22d25dddc9562caa4 | ORPH
   mipsel    |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/8756d88fa0661654fa57409e4d8c63f2bfcb002b |     
 microblaze  |          taskd-1.1.0           | NOK | https://autobuild.buildroot.org/results/a48d463569969e36d068dace665f75a4554bb526 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/f2ed3fec821da5d5b4eee9b57e0860aa9ae2305a | ORPH
 aarch64_be  |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/a9d832eefae0131331ebeb47a04655e175d47b7a | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/0b49d93490ea1402b1e291007fca0f4bd09c7184 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/a6440f3043638e4ee4d08a6c8dc7e54079d0d42d |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/cfbc09a7e5fbfb0fe96d1b75fdfdd172f359c552 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/b3f5727e066841d963c46dbb23260c3e1eb011a2 |     


Gitlab CI results for 2026-03-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13536978697 | ORPH 
             TestXenArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518318473 |      
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518314938 | ORPH 
    TestHostPythonPyfatfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518309296 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518306239 |      
         TestHostPythonFs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518305246 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518302654 |      
           TestPodmanTini | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518302110 | ORPH 
  TestPodmanSlirpNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518302008 | ORPH 
  TestPodmanSlirpIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518301962 | ORPH 
       TestPodmanNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518301914 | ORPH 
       TestPodmanIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13518301882 | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13500946864 | ORPH 
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/13500946820 |      
            TestJailhouse | https://gitlab.com/buildroot.org/buildroot/-/jobs/13500946707 |      
              TestBitcoin | https://gitlab.com/buildroot.org/buildroot/-/jobs/13500946628 |      
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/13500946620 | ORPH 
                  TestXfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13500946571 |      
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/13500946337 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

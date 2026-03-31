Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E389C1061B2F
	for <buildroot@archiver.kernel.org>; Tue, 31 Mar 2026 03:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5948960EA1;
	Tue, 31 Mar 2026 03:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msVwS7bzlYgy; Tue, 31 Mar 2026 03:24:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 592CC60DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774927443;
	bh=0kYVhWJuloghNyDD8Irc7hQLtsqb37HOFR8Av5K87eQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HJ9kvNT/joS9THwkHxUUsghd/wVxBi5XtePVuOxpIjb9T3RzFFlJZeZS2dI0aRJ2I
	 bbHRWBpQJ2DXA2vl5qDAhkCQv6Is3lFDHiTl4wExtI+qCZrIET+mitlcFIV7qnQtnp
	 Mbs7sQyAqpYEGJxtEHEFdxLDKLjUyN8p/kBPp0bZ1XoZQWWxyi3Vp2K4ccznhetFy4
	 WmCsI6ySGU5tmkElfPQugoVVfpopNVSWUGbt4vg2uAvgeBwPT1VLpuvtSDVgXrdAlp
	 0jEZQZV8O0qZWCrdN37uG2nGRg5tYOa0jhhJTRS9mAhQQnuF76plI0HHWp4HlNnj6+
	 v1iC2BPJdNrDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 592CC60DED;
	Tue, 31 Mar 2026 03:24:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95C7530E
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 03:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87897403FE
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 03:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKNiXk6gxcua for <buildroot@buildroot.org>;
 Tue, 31 Mar 2026 03:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 033964006E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 033964006E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 033964006E
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 03:23:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-486ff201041so50909655e9.1
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774927437; x=1775532237;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cmtp3lFDiyvduRKdZY4vbHLq2Bvpjz6G6TMpjOvE7Ws=;
 b=nuET8pVej96hoNpZnV6U92/vbMZbl6OcIDCzmouoTzNSBiAtUC553zzun9awHNBFXI
 u4iJhZGs5wFWeBoB+Kx/ciedmJLnPsBMgkGZlh5I4lCY2OfFkhsz4ObAyjqpzG6AR6Q+
 Uf/Geji6/qEOBLyEbpC+U0EKqV6PXrmKhDLHhWRmpvp+40x3k5SQ9+DWFwbIk9ViTVVA
 RTgsy/+8roZQFskd5z7e9X3f03vWhtIu+ws7NSLUyemuO+w0izxhK1qqUOjY58eMpwDl
 lBGhpX67PYduVcxZeKsV0KO8wqZ/rVftzjkNgfuWYqr906iRVVezQ/dQERdDV2HQ7wJq
 Mg7A==
X-Gm-Message-State: AOJu0YxQo1xXczFBxqrWeDxE85fZrC7RmzqQVtP9pT1KQ6onc15gej8q
 7LC6Kwt76ltLRMYL9j1EbwQ7MiQ309Qig0/Mm1aVqWhZa4QnNm4KsxScXSWeCfFKc10=
X-Gm-Gg: ATEYQzxZ7xzPQe6f+Mryt7LTqglk/1wz1DLxV95fhQWKWmUR8XhjPoAUbeiCgGgQCg4
 g2nNZ1c3zDxT3y46X20Q18vNMyxfn5ivN3DoWPZa/h/nOnxSAnP1AiqdsrJ55Zi5Cl45PyJEEW5
 bsG9s3Novc3DrggtPqe1c1el9Cg7aNoy0PigyrCwKaCF7w4usBi6Hq2yxvdQwe/iCjMUJEANBLR
 bgAFZYeknKuZFE7NV5hh0Pvuff3zk6m1ycLgC8xl9rEdk/yUkS8ZVa7zeyldrOnBX3owcPsehpq
 oBNpgpCtIAlFdUiKWvTE3GrhONnygWUbeYqAYR2oV99Jq/xtYeoXos7kuKmDJ/q9zCPRX24AndC
 xkOKcP3Mzi6nq5JFkXT5zq9UTSlanjXFmPyW+diWz/DV2Yhyk+TRhTlLbmdLVQFORPTjqgt1J5B
 UdBrCxCvy/vvqraYE3jp8JQS+vDIbnV0SourOTzNQJ
X-Received: by 2002:a05:600c:c4a7:b0:485:3af5:7e53 with SMTP id
 5b1f17b1804b1-48727ec3a93mr237555475e9.19.1774927436237; 
 Mon, 30 Mar 2026 20:23:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e844442sm1324395e9.13.2026.03.30.20.23.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 20:23:55 -0700 (PDT)
Message-ID: <69cb3e4b.050a0220.1a97fe.297b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 31 Mar 2026 03:23:55 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774927437; x=1775532237; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cmtp3lFDiyvduRKdZY4vbHLq2Bvpjz6G6TMpjOvE7Ws=;
 b=Bq83Vq7K94frrecmG6eUKMDkVgGcpkTWCnxc5XYVdjpcEu/KvSAVuNp2PDE6rLSZSJ
 F+39HLiFwvvof39/3v8txRxY9QWDjSyy1Nc/0XYbb9re4Bz+QTSYAwuvGoaV5dhkAg/c
 Kqs3L1r3kk74GgAsCY3u42jtjYwUw5FFGZd9/dMFyHXJxQu2Z2sDsMSbKXqimsf3wPjR
 w1984rnsj6oQP2ZJqmNWU1a5jZ0nMJzxfsBiTGv7VfMIexfJ3crQ5RVctEyBMdj4IQ30
 TtE5pDTTdoAmdLv61p9bBFPZGEo439+89Dfs2R+zczhrOoixu6c8lGq3fzOJPnoUifxd
 3oOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Bq83Vq7K
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-30
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

Autobuild statistics for 2026-03-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 20  | 49  |  0  | 69  |
  2025.11.x  |  4  | 17  |  0  | 21  |
    master   | 47  | 160 |  3  | 210 |

Classification of failures by reason for master
-----------------------------------------------

     libphidget-2.1.9.20190409 | 9 
glibc-2.43-17-gdd9945c0ba40... | 7 
                       unknown | 7 
                 mdevd-0.1.6.5 | 6 
       shadowsocks-libev-3.3.5 | 5 
                  libnfs-6.0.2 | 4 
                openssh-10.2p1 | 4 
ustream-ssl-5a81c108d20e247... | 4 
host-gobject-introspection-... | 3 
leafnode2-9543ffaf82406f943... | 3 
                 linux-headers | 3 
                bpftool-v7.5.0 | 2 
              containerd-2.0.7 | 2 
                    ficl-4.1.0 | 2 
  gobject-introspection-1.84.0 | 2 
            gstreamer1-1.24.13 | 2 
              host-guile-3.0.9 | 2 
          host-mosquitto-2.1.2 | 2 
            igd2-for-linux-2.2 | 2 
                  iozone-3.508 | 2 
             libgphoto2-2.5.33 | 2 
                 libmbus-0.9.0 | 2 
                  libnss-3.122 | 2 
              libopenssl-3.6.1 | 2 
                 libzlib-1.3.2 | 2 
     linux-5.10.246-cip66-rt29 | 2 
        ltp-testsuite-20250930 | 2 
                       mrp-1.2 | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.42.0 | 2 
                 rtl_433-25.02 | 2 
uhttpd-15346de8d3ba42200249... | 2 
               asterisk-22.8.2 | 1 
                   atop-2.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                   bird-2.15.1 | 1 
                  bitcoin-30.2 | 1 
                  cairo-1.18.4 | 1 
           crucible-2025.05.28 | 1 
             dahdi-linux-3.3.0 | 1 
                    dust-1.2.3 | 1 
                    flac-1.5.0 | 1 
                flashrom-1.7.0 | 1 
            freeswitch-1.10.12 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
                  gnupg-1.4.23 | 1 
                   guile-3.0.9 | 1 
                haveged-1.9.19 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
          host-libtasn1-4.21.0 | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.28 | 1 
            host-protobuf-34.0 | 1 
                   i2pd-2.59.0 | 1 
                   jimtcl-0.83 | 1 
              jpeg-turbo-3.1.4 | 1 
                     kbd-2.9.0 | 1 
                    kmon-1.7.1 | 1 
     kvm-unit-tests-2025-06-05 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20260107.1 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
                libcurl-8.19.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                libgeos-3.14.1 | 1 
                libglvnd-1.7.0 | 1 
                   libks-2.0.5 | 1 
           libzenoh-pico-1.2.1 | 1 
                 linux-6.19.10 | 1 
                  linuxptp-4.4 | 1 
                    lpac-2.2.1 | 1 
               lrzsz-0.12.21rc | 1 
            micropython-1.22.2 | 1 
                     mtd-2.2.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                    olsr-0.9.8 | 1 
             pptp-linux-1.10.0 | 1 
               pulseaudio-17.0 | 1 
              python-xlib-0.33 | 1 
                   qemu-10.2.0 | 1 
                   rubix-1.0.6 | 1 
                   s6-2.13.1.0 | 1 
                s6-dns-2.4.0.0 | 1 
           sane-backends-1.1.1 | 1 
                    sbctl-0.18 | 1 
             sigsum-go-v0.13.1 | 1 
              skalibs-2.14.3.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 systemd-258.4 | 1 
           uboot-tools-2026.01 | 1 
             util-linux-2.41.3 | 1 
                    wipe-2.3.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/ca002d6df2452557c7e2e56f63f3ef25b72519a1 |     
   mips64    |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/2733ea57bbb94c28509ee4534d928949c529d15e |     
loongarch64  | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/a5076e1bb30637136d6cb3f96d5cea843300da9a |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/bfb53e75df37794ce65c3b738f8a3ef331c90994 |     
 aarch64_be  |          bitcoin-30.2          | NOK | https://autobuild.buildroot.org/results/e6b1487334604393f4014b84651b3f5b1ba49701 |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/cb9d6cd90f09e154acbca73ab4ff54ae1f2f293a |     
   s390x     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/01a5192c0ac69fa2042154e4a9b36ac9806aef64 |     
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e7bf54b109cba8c1b022f678f6403dd986a6a6a1 |     
   x86_64    |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/fbaacb855c0ae7be5932459c0924970d9a6fff28 |     
powerpc64le  |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/fbbd2f97ae5092e9cce00e70a4ccd5ccb062b45f |     
   x86_64    |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/a4309e0d5faf3f42b10b33f862804937ebe58e5a |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6b778df2e5e5ccd85c52afd937c2e4e18f88260a | ORPH
   armeb     |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/03d46a55d281d257d1eae83075514fbab7f53edb | ORPH
    arc      |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/c011638deedb4f1b6d9b7b3e6fd337151de270d1 |     
 aarch64_be  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/61941c58d978ef75cb3bf1b82d825f586fa0a607 |     
    sh4a     |           flac-1.5.0           | NOK | https://autobuild.buildroot.org/results/2721e2028ca09d1dd770c99098fca846a1e6fd95 |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/0ada325cfe5082c5f4ec245877646d4ea1d0d0dc |     
   armeb     |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/88b8f18e819a155ef3e5410f5fdca7a951c72aa1 |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8a917446417b05ac6a6d13f716833ceb9632da5e | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/be1ade6a1cd4a72d1f38716218a24d7a41fe220b | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/1dd2e50c791bf834b1fa55fb8761fa6d13e71005 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/af028034aace4206b77ad4918098a7a163f01798 |     
    arc      | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/b7eb13910cadddc88446b2fd6ec2ccaff28b82ee |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/594b2d859b067578a248d7239421bf9bc54e4715 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/d624a5dd97847a2438f970ddb4b6a9407f653531 |     
   mips64    | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/e494a32b25c1d80c6693693896e02000cf028746 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/43399313be56cc3e5392dcf94fd513cc802270b4 |     
    hppa     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/994def72664d74bcb0e4fe2ee44d399f407a7b97 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/364733d0655c664afe377a19a1f31bf33925c301 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6cdecaafbb7b27ab25a5948d8b0b6dd6c31c7ff3 | ORPH
    or1k     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/9309205cb14c2e2870c0f975e4d6ef37efaa1c7c | ORPH
    or1k     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/d635fd123c1255e755b3cbcad1acfbdc3e523f81 | ORPH
    mips     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/e4fd21fa8d061c51098c0ae058f39083dabb4124 |     
    sh4      |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/af317b8e4e4e57b1acec1a23602328d88cd39d7b |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/1a94fccdc6084c0e57ea0997367e7a74beb15e09 |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/20e3f13a55d335d9c2e3b40770fbb55e9d940045 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3109e37cd5112605d29db54f64421849610597e6 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d019f136f8f6ccc2e1a3797e4af304566d1af33a | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cc9c81eb47330edb47de0d18c5caf3d6cc78aa0c | ORPH
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3229ed010746b64fd494a50e25c76f92778d5540 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/44a9ca8aeabb332b0d5546343813b46c68981afa |     
 powerpc64   |      host-libtasn1-4.21.0      | NOK | https://autobuild.buildroot.org/results/7b0a6a775a26fc73dd253694c6e2903fbf0f9c02 | ORPH
 powerpc64   |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/856352ddd690dc8b2314d46a6a837d74c237d69f |     
  mips64el   |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/8b4e6a63226f8a305280641ea930b596eeefb9c4 |     
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/1b3bb815170bb363826bdc8a83a88d9e1f9e0bd5 | ORPH
   sparc     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ce162712de06ef7512d6aabf6019ecf6e10165c6 |     
  aarch64    |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/5ba62fdc11812f5bcece8c5e07b8eec7593129ba |     
  mips64el   |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/c5000605e7949cc1c9ab9da790e07b7d06d45a18 |     
    sh4      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/676896669d4701a9fb10b1e501d9141a4c51b516 |     
    sh4      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/57fbe75b6e75af6c16de101a280490bed248b8a4 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/d5b82ffadacfb15fa9ccab55479a058029778799 |     
  powerpc    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/d23c724d762db2ddc0cc0f468d805a8bdb2e7f59 |     
    m68k     |          jimtcl-0.83           | NOK | https://autobuild.buildroot.org/results/695cc200bf9ec7bdf9ffa1aadd69593592259bcd |     
 aarch64_be  |        jpeg-turbo-3.1.4        | NOK | https://autobuild.buildroot.org/results/7dcaff2c5fdce1c4c9d8792ee39ffc0fb1a0d249 |     
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/db0e20c4a332fcd31b05652f15ec3e7ddeb0873c | ORPH
   s390x     |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/7b1bc51a5b0c4668e040fca6972ac5bd23da9363 |     
  riscv32    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/6583fcaab91aabaa29586b9389121250e06ac065 |     
   armeb     | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/0858513b9b96fc2c6d64afef577901549b797f6e | ORPH
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/54487e86c2986892d95c576e534a96ab4c1f844e | ORPH
 microblaze  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/0cc8bb39301aad62ddce8f4b6c5dc0e3c6ce0f8c |     
powerpc64le  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/17693ad96ea3625b98e89e1fd61b446e0dbae202 |     
   mipsel    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/5ee2766eeaf191347716b55712a7c2389c93ac07 |     
    mips     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/535bd6546f07048b47631b90ec86f0de1c8e3593 |     
  aarch64    | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/469bbacc82ef7f7636070d00dd49c40a544970dd |     
    i686     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/2fe40c0e40143e1d1455c54cb05de37ed8d26a6b |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/ce23c62f8c81910f9edae8cd9287e2556a633293 |     
microblazeel |         libgeos-3.14.1         | NOK | https://autobuild.buildroot.org/results/c1af86d304bf1a56515ab2c32c0294e66910c4c8 |     
microblazeel |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/13299db1e17497ef453b27fa2632077b7e0c2911 | ORPH
   sh4aeb    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/e87c7650cff67d21449b6cf6e48bc4324dc3e596 |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/d7fb65107425e83259d831c28d372b2dc61ff030 |     
    mips     |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/00b7091415a00477db3c0db8cb04b322b54c30be | ORPH
    hppa     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/ce2cbe1f577a26a0fc3fca6a3bed5f1f67cffe0c | ORPH
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/8164a47781247e4cc9f6c1cd9967b9ac884e27b8 | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/bea118b815ae209b10e9861f679f927864581137 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/cbb06f1131dabdc70646ce4bc0e7144b1deb80d7 | ORPH
   mips64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/91e02c4a6a672b71fa96ef78b87ea1d27738f836 | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/20424635ae0a634b48f4ccf0beb9094201c4740b | ORPH
  powerpc    |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/6c8a2e6c82f043200e56c2dd411afe67a40f13e7 |     
  powerpc    |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/76f9aebfba1471614fc90ece88a43cd175beb80b |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/1135b83b843ce2765f92b0f699dad9df72db2da1 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/c1ce97c109d52961b57234ae89ae512b24213259 | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/327ee4dddbad3b94c0269c46fe9b98d0409f9840 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b27dbf4b7ad7c69790eb61c47867070624e5d5d7 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/cb0f8f856ce37020dd27b1b2d109eb7f093f58c0 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/61f3509c3a651f5947efae7e6af6462e638a4b2c |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/cbf37c6653bd0d82e39b90b98364bc0f6a210b95 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1a299248eeea7761568f6ef0c0b2d7b04a2ad735 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/51c49fb0f28ad5b611be04b123089747c33d2ddb |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f6f6066f2993df4113f291ff6de3f8f2625824fe |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6b8591cdaf6500f7bdb7d3625ee13f8370b82241 |     
    i586     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/9d1fbfc5b862b764068dceae4b6367b6a6e1770d |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/16ca2fe8a06556fd504e5de6c9bdcd22c1ceaae4 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/de80b4afbfcb498acf3b6c356b1ac90c884c6899 | ORPH
   mips64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/7a49b1af28ddbd72006f7e11fe190fefb4293c45 | ORPH
    hppa     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/61e1679187d1dfc64660a65c2dd81abd93ea40d3 | ORPH
  powerpc    |         linux-6.19.10          | NOK | https://autobuild.buildroot.org/results/ebd7f3b21cabfb0527c53b5493c983612bb9b6f8 | ORPH
 powerpc64   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/3f3a3668bf56721be76a8011d90c796847b25260 |     
    i686     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/1c9fe7664bf432830f8164693b60b51d5af9322b |     
loongarch64  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/84d6dcfc5909f56f0b011f5778921b0af4aba5c4 |     
   mips64    |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/b7ee81d2f7dbed1582b8f9952273a70e63fae108 |     
loongarch64  |           lpac-2.2.1           | NOK | https://autobuild.buildroot.org/results/738c9e14813757cfc28f6742e540f0baf6b3f825 |     
   x86_64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/d735f448ddd47f9ae022ea672e1ed18a0ae1b3b8 | ORPH
    or1k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/d5db71c840902caad5c5b9d0fc6c99de391be1f1 |     
    i686     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/24f9ecc247bb48249eab504a3920a7dbd3ff337d |     
   x86_64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/c490d8ed3aa5f16bf5ca606a326e77592d865a5d |     
    or1k     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/8041267b77655b7db332571504942e53a6bf0c57 |     
    sh4      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/e98ebc17c2d4373539aee14d7c3ed49c5430894f |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/99cb6ed9c1f8a9830afbf69c3a569004e7adaf11 |     
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/51e9821890956a1562932fb3aa98f4a0d71a2c67 |     
    hppa     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/ff21667f57548a1804103b88cf57421a10b98528 |     
    m68k     |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/09ef1f78d0a1e201b4077a51a78aabdb5abc3c38 |     
  sparc64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/91feb94f3e360865c4b8ccc4791f7b6930383581 |     
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/98d8a0c8058532e9c4e6bc9b5e58780ca5de3401 |     
   armeb     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/9a3e1ef5318bf49bfe21f8b1068ddd9aa2ad48ee |     
   x86_64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/83c9eb54232b144e6eea13eadd0f7ba5d12e662e |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/fd432e5c6737e70dde639a80b5d88f246df30518 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/cb7e21172d742d437a24ca2ed5eeb6c7c10be766 |     
  powerpc    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f1776676f5f9950327d3f86a27b72697755f2be8 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/7db9cf4f89743b7184717eb27594ce524a574d64 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/3d89bafa8b96102c367dfeac77884607927960ff | ORPH
   armeb     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/5d74c3086797545871ed610863dbfc322ccb3738 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/3b2d56399febbca1239d68302d7517a0eb5dab95 | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/b1864579505629c25080a9320f3f019fdd75a396 | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/740b74d02a75c663551e7502f3183c0e9b40f1f8 | ORPH
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/eefef6780d019386b1c1b419f48ae4ac61bf042d |     
   xtensa    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e19ea5cd576f2bc4f6953216eb1403b919c67e00 |     
    arm      |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/1f3268f570aa7202d09e7894e44d3503fcaa972b | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4b4bd42b7ea957d54b21eb90219445eb9598a1fe | ORPH
powerpc64le  |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/6e081cb6df6ebd9d0ebf1fe9fc1baf55bdd37447 |     
  aarch64    |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/15d5cc745e5cad753ee607a5ad6d2f98b7a87fe1 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/24e7c06821eafa7b1a2728d3a23ae55b59113393 |     
   sparc     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/efa7a699403d74638e949f4f3651ae28a4699b87 |     
   mipsel    |          rubix-1.0.6           | NOK | https://autobuild.buildroot.org/results/2aa30b84a1f184fef468394e7bc777420f29e743 | ORPH
   sparc     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/ef397a304968a1e5441784ffab24fde10bd291d9 |     
    sh4      |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/93b967d6a3b407ec6f1cdd994b6b67a2b2eaab83 |     
  aarch64    |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/bc9b15f5e6d9f45d21e7c2ebcaf394b9c38fc6b3 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/1cfd016d504485e19ca512d548e791cbdc664501 | ORPH
   s390x     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/da6ea823683711c576493524f0bfaf8f41041f28 | ORPH
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/72c347bd08527cc8856885b7e00428ad58236bca | ORPH
   s390x     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/ff4d5f64f9894d4dd54f13b09c8167d52566c4b7 | ORPH
    arm      |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/38ceb9b9f78d7ce9b0869667872dd226f943a383 | ORPH
 powerpc64   |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/e21f07abb43422f371f0dc629fdf133725005cbb | ORPH
    arm      |       sigsum-go-v0.13.1        | NOK | https://autobuild.buildroot.org/results/b31ad77cec194952155ccf13416a8047741ca5b5 |     
   x86_64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/7a4d2982304fc0b84010a804b1cec8fd246d0a05 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/719396e84540f8f3b5b97f7c35610761810875b3 |     
   armeb     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/b1d223343eb2da56dd572d9e9778eeeb2bbf7636 |     
 microblaze  |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/207fcb1f71602eead0b58c6e4748c4ec0da168c0 | ORPH
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/9f1a7791c1568a28aaa6069accab1c17c3ef3f79 | ORPH
    mips     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/44c020c5127ca12b868f5f90720de8bf5311bffd | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/94eea73504c3d56eb3963c57e9b87ee42c02b192 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/14b10d1fd58330acbb44ad7eef0271a7e055daaa |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/03e7e32c863ae6fb442033c89fa36f33214ec931 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/482620f8c2f6cef8058e5520d7f8de264bc89671 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/9f743a380a8686bdde1a2ccddde39dcf8156568d |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/4c47ee46abca3d7fd0d7c26d167a606f1e4b252b |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/81acba84de668ba51ddffb73b13e5ba4d1a916f8 |     
    sh4a     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/84ec303f8ab199ed11dc3effde8bbcc681badef5 | ORPH
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/141145fb1d930bed7578ff894efe277875d98710 | ORPH
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/29ff42bb4dfe8950a6c6e8f7ca038e2ade75a25c | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/22b5ca647210e4bafa833dc2f04ee298aea52d1b | ORPH
    m68k     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/71705bd4299794e82ba223ab8a04df83fe81c8ad |     
   sh4aeb    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/2f5cbd7fdcc76e0b6c5d46e19f140e8e1366f04e | ORPH
    m68k     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/3d131c5fc9e81f31d518b8e67b1ea21da686816c |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                    fcft-3.3.2 | 2 
                    ficl-4.1.0 | 2 
                host-odb-2.4.0 | 2 
glibc-2.42-51-gcbf39c26b258... | 1 
            host-coreutils-9.8 | 1 
            igd2-for-linux-2.2 | 1 
             libgphoto2-2.5.33 | 1 
                 libmbus-0.9.0 | 1 
              mariadb-10.11.15 | 1 
package/linux-headers/linux... | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.3 | 1 
               pulseaudio-17.0 | 1 
           sane-backends-1.1.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/8dbcf87170e08f101e08ec1081631ffee9e576f3 | ORPH
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/1dc39feab3d40aa49600968b4bc1621c7528ff1d | ORPH
   arceb     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/a6f6aa6676f591791c4876c5ff68aea20382f31c |     
    arm      |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/6a10465c1bf71512dedc5ed2b3f64e2149395b52 |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/c48f33a34840306637ee3a0f250259976446e163 |     
  sparc64    |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/659166cdfa29c5ad656710c186597bf502127145 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/0a6ae75356244b4de140b8f700db05f848f15c3f | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/a1c4572ec165910182d360221ddf5c4651040ac6 | ORPH
    sh4      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/bcb70b370215d03130f7d63f4baf8ecd79911ed1 |     
    i686     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/53ded44c81922a5d7ed15d067cad7b37f5e424b9 |     
    or1k     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/fdd579de207e4596577aaeea7766a53dc008d176 | ORPH
   sparc     |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/014aa0d1c185741f5f701f961cf5a6c3519473f4 | ORPH
    mips     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/74925473b6b574887d3457a83c1abadaa369cabe |     
  powerpc    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/dac1fd8ea7f1c186b9db50779bea72ac9d5e3d6f | ORPH
    arc      |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/54c0adbf5af50d64bbf2cbbd02589075fa7d3932 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/15b9591c2c61a372ccfdabc52e439449a92d51df | ORPH
   sh4eb     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/74872fce3fb47c93bbf66326cf35c292e962fa85 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 7 
          host-faketime-0.9.10 | 6 
              libopenssl-3.4.4 | 3 
host-vboot-utils-4b12d392e5... | 2 
                  libbpf-1.5.0 | 2 
                 libmbus-0.9.0 | 2 
                 linux-6.12.77 | 2 
                openswan-3.0.0 | 2 
package/linux-headers/linux... | 2 
                   duma-2.5.21 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.82.0 | 1 
                 host-gdb-15.2 | 1 
                 host-gdb-16.3 | 1 
       host-gettext-gnu-0.22.4 | 1 
           host-go-src-1.23.12 | 1 
host-netsurf-buildsystem-75... | 1 
              host-pahole-1.27 | 1 
leafnode2-9543ffaf82406f943... | 1 
                  libdex-0.8.1 | 1 
                 libgee-0.20.6 | 1 
              libmodbus-3.1.11 | 1 
        ltp-testsuite-20250130 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.3 | 1 
                pipewire-1.2.8 | 1 
               procps-ng-4.0.5 | 1 
ulog-0389d243352255f6182326... | 1 
           xtables-addons-3.24 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/b73937f2f8bcf81774f6461da30ec60ea78e51e0 | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/054dc0d887907450333b4aca59b2ad220dc87c88 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/ae466c74e4da49c217c67588b69c9e2493233940 | ORPH
    or1k     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/1cc2c5aa14703041f61ea7f1e848e9b0f8b85e5d | ORPH
   arceb     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/e80c00a2e24fda7f8ceb8fc5df1bfca7d033b80a | ORPH
   sparc     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/7495ccb52ebfd2d7925d3da4118889fb8160f7c3 | ORPH
  riscv32    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/5db66553754217767b04b88923afb45125cb9bc9 | ORPH
   sparc     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/5caf2fbd44ec5d292446d27fd58ac0a90302d8a7 | ORPH
microblazeel |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/5b35078abe6451a767d2ab2b5de5e9c59eb2d8bd | ORPH
    or1k     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5a621e608406d11434f92e3444b1224600670b40 | ORPH
   mipsel    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/21976906f842ad8fca0c0d3ffc3791a0686f0523 | ORPH
   x86_64    |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/01b77cf6ea208915303307a293fc2e1f640893b2 | ORPH
    arm      |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/c18caf467fd3aaad5ddf790f800c7505cfca61f3 |     
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/48cdae5098027510a79b7c46f7d5d5c70fa1ad11 | ORPH
  mips64el   |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/fc10280f07bc34a2ea822c94516f4d59ae58d3d6 |     
    m68k     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/fea4546dbcb043f5c69de6bfdc703cd845f144b9 |     
  powerpc    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/0c65fa7b80265d83a56cdf0b5ac2529be1d29f6f |     
    mips     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/7878704be5373925668c1c001e3098df67ac7463 |     
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/81f1fae24c567d99a53b114fa079dcc911413510 |     
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/04df73af7ed0309150e4e2df586795852b114ab0 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9bfe8017af389ca72e86292875eaab593ccbc399 |     
    sh4a     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/054cdd6d30693fdb0141170ca4cc990cc9782be8 |     
   armeb     | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/ce03c0e0a53eba5135e7c6a0937d1481ba4ec050 |     
   mipsel    | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/084ff0f861a088157bddb48e8befdd737a1d019a |     
microblazeel | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/27ecca87dc81c6a21f835485807dd27e6bb0f3d1 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/5354c64f54640768607db6d27e4f34518786fcf3 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/c3f6db361a1ed9b88aa87791f8792acbde753427 |     
   mips64    |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/434bd87c5ab4a1a5a499df021bca25d8cfcdbdf6 |     
    sh4      |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/9a094de1b499e8ec416144643abaeef48587d00a |     
   s390x     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/71cb3c17b83a4b7baa170aa46619a833aea40ce6 | ORPH
    sh4a     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/59ec09b86508887639517b80452ed5435f9f71de | ORPH
   s390x     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/f81002c9a16a8de3f8297a90399d0e8bad95f921 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/51009056715a3a16abaa7563e52fadadb5d65b4c | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/dafb378f5edf20e7b6886105a8e6c3a21a634fb3 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/a20f4867f847f580e18819460a2cda9a417027f2 | ORPH
   x86_64    |         linux-6.12.77          | NOK | https://autobuild.buildroot.org/results/8b2d9f9068606075aa99713fefdbf0a976dd606b | ORPH
    m68k     |         linux-6.12.77          | NOK | https://autobuild.buildroot.org/results/ee8212f0d5206fa9f8ad10892216c64e9822ec4e | ORPH
   sh4aeb    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/f25e3a7ed329b1b56459ec74361a712fdcc093ad |     
   sh4eb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/8dc545309ee9c9f71f394772818047f9494ee3d5 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/cb7d8595dd4d6f66bad6918ef099e149d070849f | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/9cd77cb12d43555679c1765c485af68ff94cf51d | ORPH
    m68k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/e10d1ef9153c64929edbb89f1a36331eae2f758e | ORPH
   mips64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e9c953d3e13466a6fc87300aa47fd5d30ca89d2e |     
    i586     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e4c8c7da600e7375a827409fbf502f37aa0e8e38 |     
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/531484e8ae286a350f1c9204d8ac3f7d979a62f1 |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/66e0023ad21e7e1c83172b8595cfe3c588c2ea13 |     
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/c6e7b9d7ca8b3ca593fbb33a78d278e0f2888eb3 | ORPH
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/4052fb3f8218219fb5df27d5a5267dbc0a78c5cb |     
   arceb     |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/09cc0c3be354f5b37a1221770eb4b6bc400a0403 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

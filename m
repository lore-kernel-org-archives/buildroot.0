Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DAD107BCF1
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 04:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 276B540F9C;
	Sat, 14 Mar 2026 04:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5obv6zZkCGWf; Sat, 14 Mar 2026 04:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5117940F9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773462330;
	bh=BqwnAvSZsQGqOubxMHjCn6rCok9oe92QcQf/5Uic4YE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qY5AwWw0QbkpSh20I/+2M2UNLZ5yRx8cLUxuWyB5j0glCGza2bOgFUNqgHqAA88np
	 TKny8uzh7qjG9NVpAQyws+0IPp7W7dFAnGY5KtOayQWR3QnxSUnRxj/s4d6n1MymAk
	 b0PDlVwn5HyQqt/ymTfs1auisri3igCAr0Mna2h+PG+FqUKspUbn/MTYeNBqjuKfj6
	 e/f+FKjfutsXjOIPt6FPYiQNea8LkuTuQpxIf4B40qXm0muuHxX3ezIT6RhcXHRp9d
	 gqqeluS/wyjmijhDxJRYy+2UIXubfH3N3zxzu12vexBtTSDl1dBEjMjT2gywFaOegy
	 Jnx/f/UwIGF4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5117940F9D;
	Sat, 14 Mar 2026 04:25:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EE631B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 04:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34C9F40F9B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 04:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THrg_wF9oK6g for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 04:25:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E68440F99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E68440F99
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E68440F99
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 04:25:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso26773455e9.0
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773462325; x=1774067125;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDa4gH3ZsASbxlLp+0aaM+WNRiIVBdv0QTXFLzH2fCo=;
 b=cQW4CEIwVIp2A7NbiMCf8JeBwudxsK40tvY4/1q7fktIdaiCuSHVcEOo5fUxy/nc6L
 T103qeMAqhNYv7xyDnV7RkjtViS7ATznzEQ9uGFQIll4AauP1RUTWkuZaTFCsQKh4HAz
 eRAYNXFzjQDCPc3O1LJnRMiZkrhkTdjb86G0Ojm72aI5RkvRN6/Ty1ZiSTmvJtBmCLBg
 ojXK2SNBcujTgrL1IJGKEuXknpztofmJsa/n0pSou/rDUfatve9TZEzipWt7L38uRaoy
 ybQt1LYPuMVSOK/scBbpcRfBXK01Fk/ZzidACKp0/uXVK/AlRiqSXuC3C0zw8VnKlXxL
 186w==
X-Gm-Message-State: AOJu0Ywg17ESF1rZWXJpFqPSnsSrVFtOEx+UoO8Un2VtTvK8X9f2Yx12
 8/Q62HOXuYVVEq8ICkM0jnQiv7uGUzfveYtQd7Wuh3Lp0xBOV5K+17UuQAxFXg2r
X-Gm-Gg: ATEYQzyKRhEX97R2WSohes4S7v+iqBaQbUyGBmUsvt/V58Q9AtXaXGzCQNgV4Ynsl7N
 onL06YMO8/ZjK1lrDg/7AabxwHQUAu2Vt6Tc2b34BelyqPYI86MXKzpLv32uGmnelqFmLsCrVqQ
 T8I1WCgshlVkJ//142r34qanIXDOetBWY1xLrqcmjtSIIrUjpF2yf/+4riUu+meB2uhcsPXjI6g
 65AKbdUOOAkRGZTjyW7Fy4kGzaJGrA4GNoOyhftfQpuAuB2g3VvfKmAyJ4L/igpK8qGkAvPJwLD
 QfQlbMruAOlAU6UIZw6ggIeefYFofMS7FdHnB8aGu0LKXChb3+7TSQpHPCwonM2pn7Vp6PrMHa+
 qcFmo1mmAvdB6PrdnjEiyqwDVJXr3RknRin7p3igEkhxeFwwyucNQMzFGfNEK6box862z6trJ1p
 IhhzFPt5l/rVj/o4Vkejlf9TUBMw==
X-Received: by 2002:a05:600c:8b18:b0:479:13e9:3d64 with SMTP id
 5b1f17b1804b1-48555b47c4dmr86363565e9.15.1773462324418; 
 Fri, 13 Mar 2026 21:25:24 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48557c6e2b1sm33159895e9.28.2026.03.13.21.25.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 21:25:24 -0700 (PDT)
Message-ID: <69b4e334.050a0220.3849f.711d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 14 Mar 2026 04:25:24 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773462325; x=1774067125; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HDa4gH3ZsASbxlLp+0aaM+WNRiIVBdv0QTXFLzH2fCo=;
 b=Gk0a3bjIWW0d8NaXya5iYRACpXzx7Amtx0W8HQBRBHJh+EsvUid55jlVOhEpkjatgN
 VqNbXjtoICvK1wDeZpPkCCeKAa1G/VlSTX9ZJSSyx9sCGD8ThabvZJJ4mcN1GKl1LfJH
 F3nPSxzDb07tows3s5ArJinkbawRMCvQAeOwX7qJH485rksn6MOiz2oTJIFLRofTN37c
 B7juA207oYCuGD5scfm+sYAHFyg/lee8Y5yXd2lR/16VMMOEcZpl93yHHH+LvPww35+z
 bb+x58OdJrJQ1Vv+YgP65apm59YJAQISjDo6IBCWRizHgtXjyi7LMMEMvQ6NP7jAVYlp
 DFUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Gk0a3bjI
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-13
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

Autobuild statistics for 2026-03-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 37  |  0  | 45  |
  2025.11.x  |  1  | 12  |  0  | 13  |
    master   | 44  | 115 |  1  | 160 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 6 
                   perl-5.42.0 | 6 
odhcp6c-f19dd37fb467c9cf10c... | 5 
                       unknown | 5 
                openswan-3.0.0 | 4 
glibc-2.43-10-gc3ceb93dc4f6... | 3 
leafnode2-9543ffaf82406f943... | 3 
     libphidget-2.1.9.20190409 | 3 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
                host-odb-2.4.0 | 2 
               iproute2-6.17.0 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                 libmbus-0.9.0 | 2 
                  libnfs-6.0.2 | 2 
                  libsepol-3.9 | 2 
                 mdevd-0.1.6.5 | 2 
                openssh-10.2p1 | 2 
           python-html5lib-1.1 | 2 
                 rtl_433-25.02 | 2 
       shadowsocks-libev-3.3.5 | 2 
              skalibs-2.14.3.0 | 2 
       sp-oops-extract-0.0.7-1 | 2 
          sphinxbase-5prealpha | 2 
ustream-ssl-5a81c108d20e247... | 2 
                 aichat-0.30.0 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
amazon-ecr-credential-helpe... | 1 
                   atop-2.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
  binutils-arc-2024.12-release | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
              e2fsprogs-1.47.4 | 1 
                enscript-1.6.6 | 1 
              execline-2.9.6.1 | 1 
                     fd-10.3.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
                 fwupd-efi-1.7 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
host-autoconf-archive-2023.... | 1 
                 host-gdb-14.2 | 1 
              host-pahole-1.28 | 1 
              host-rust-1.88.0 | 1 
                jemalloc-5.3.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                  libbpf-1.6.2 | 1 
              libcamera-v0.7.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                libmad-0.15.1b | 1 
              libopenssl-3.6.1 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                 linux-headers | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
               lrzsz-0.12.21rc | 1 
            minizip-zlib-1.3.1 | 1 
                  mupdf-1.23.9 | 1 
                     php-8.5.3 | 1 
             pptp-linux-1.10.0 | 1 
           python-brotli-1.2.0 | 1 
                   s6-2.13.1.0 | 1 
                 sqlite-3.52.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.3 | 1 
                 vmtouch-1.3.1 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/93ee44809290a6531f964d24da1f07931ea5bd3c |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/7b479c75e1410093cce0c57a27162d25aa14fb47 | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/329dbb710b2a03823a7318c6431a1512b613a306 | ORPH
   armeb     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/5dd859e0a21ee97f817733964883fb7a39a45573 |     
   s390x     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/033131bd413c0b1d79e6ed466c0510553417122c |     
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/4d0bdca23f259e8f8308b86834f28207760e4916 |     
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/85082c710256f82644902b5b63597626597147c5 |     
   mipsel    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/e02215cfb4da2c85a5fdac0df668f1e4c105017f | ORPH
  aarch64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/70a1aa70b48d2f69c85426c919499c7843bc06f5 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1cdb8ed8f8af06af72687644880280c9c8a2f1b4 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0f72f13eceb121e78dd0c0d412ecddd9d170468b | ORPH
  powerpc    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/40408b07c7f20185444c6aaee6b874d1f3f14d0e | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/d3cf46727c44f7c10811ebeb8f1a7bd384b9e0b4 | ORPH
   x86_64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/2730c760bbf85ee5d55bd2e27def312be8a1ff34 | ORPH
  aarch64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/16e0ee061032bd739ac2cf9064f40fdd54d3eb40 | ORPH
powerpc64le  |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/c1951a0f4c70ee179bb2e5b68430c90b562b27a0 |     
   x86_64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/9d9d4c4f019d6233f3341f8d6c685de709a57a41 |     
   mips64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/b05f9a79848ace8dbd633360ed5f9a691804041a |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/4e21b653da8974a1810bc531ca8320b33f301481 |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ad16f02d084dd7d592037acdbc1586e84fd0efa6 | ORPH
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/acdfaf2f91c9061362c373c857087bb39099d3e3 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/08e9af458294c1aac23ec27fdb264403e6162d20 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/a8944c3afaa89cbdc86a5c7dde4fa5104cfd8d11 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7cb2b32d0197d5c051e723de0a619e500395f5e3 | ORPH
   s390x     | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/fd964d1ed731cc1f8ffcf3ed128cd00a47aa1afa | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b100823b276e709e6e618f83afb06f62e7aca588 | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/401ca951adc3853c37ed6450b87f594144ee9044 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e1d78a273b187fe2d2b624783374fb50ad789119 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ffcf5e09c1ddfd869c3f7d86bd71186047a0d5fe | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4efc991ec6f7c92774b6e34791935795741786ed | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/593745ac009a0ff585aef814e5070b42a1cfc334 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9a638da2bd7aedc75c6b16f650fd34561d1aa817 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/3e59f3843aea5a3bcc46df94d5af0043d798d2ef | ORPH
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c980a4aaa43fa498d90371cebf065da06c9b20ca | ORPH
   x86_64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/555a8b32a1f2cf24fa269031cbf1997ac412a589 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/7b48b7c25df689bf5a938b96aa845899e321a23b |     
    or1k     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/78c8b21b019897aaacd27df1795445a8f6a27185 |     
   x86_64    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/03c2eef3b2d4ba01a2b6062eed966197eefb2c84 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/b1c5b47c0b67f7af0744c986de4ea53f287611cd |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/08fb1dcc627d892a8ad985225b3166ea3df5d2e2 |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/c455f4ca9225c7528246a1806afd4f9d6e980123 | ORPH
    i686     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/ae5100add09b9373225330ee8f11a68f0181b166 |     
    or1k     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/8555f4e7f11d1d87f848dcf18c27301c03cb6075 |     
  sparc64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/0af61a1bf67bbf4431ac45f0b2d62201bbce6993 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/2e4da97fa72dabb588ade3ebfc548851815d58c0 |     
  sparc64    |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/a659e6ee4534783b131670d30a6c49628b1d93bf |     
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/b716688653ddf7376ed7947ca5f0e5b379af50c8 | ORPH
    arm      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/eae6daf93c021e5e89d3aec7027c4835e699aa30 |     
 aarch64_be  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/604b12641008c2998dc05a61ef0c1a8a869ec3ef |     
    arm      |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/b3b08dda61c99fe784342c1919238f6688d8e821 | ORPH
   armeb     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/0e24f72ccbbd3ce53acf7418ebeeaec315421bd8 | ORPH
    arc      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/758a7650d9944daab948a47367c88523f9e0476a | ORPH
    sh4a     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/c91025802d6d8d9e4251f09456e7ce93c95f2353 | ORPH
    or1k     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/af182150d6ecf57983b01ddb68f68204cf69a2d0 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/4f2699ea622eac752b3742574786cd7972049511 | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/362f11256893130ad04f8bc8578f89678d109d11 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9c903bca7941c30cef26d5bd632b50b88ebc8462 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1bcdda7810409301c53202ce11278152babf88d9 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/5ff89ff11130815cc69857457d59e2fbead2d6f7 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/6b598eddf80da5c2b0b32265e7bd9f126ee6257c |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/eac58a03c3c5d1c0ae6ce285c720588fedaa29c7 | ORPH
 microblaze  |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/3cd8286c475231eae2fd10d3a678b01aecb96e9b | ORPH
  sparc64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/a749987676749c83982832f442c0384de7393cd9 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/22c5a8a0ecd0531b748cd82b6c18c16735246444 | ORPH
   xtensa    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/29306ce9e35f5f601e562836e3e3724e722a902b | ORPH
   x86_64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/280bd3092530f9aed5d2adf6c58cb25362833076 | ORPH
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/26552386bf649fa4b56bd1fb626137615526f36c |     
  aarch64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/d7f81f8c3b98b513b7a85311cbcafa5c09077bf3 |     
  sparc64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/a6ca6a06b76a4db50c03c7e48020ff173408ed62 |     
   sh4eb     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/584941153bf8aed340443a307624736edc445a18 |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d2e70f524b78884c7a802747b15d743c3553dfde |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/c5310df8607b12f2df481477ad914f2dc520c59e |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/727ba3fd9b6f19fd7d4230058889e9987b7ec495 |     
    arm      | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/28113809a66a5469388d4b6e2679f28a35e68602 |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/93c78d9411f05868e9a8661b5d4235c246032f56 |     
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/3a89181eca9b0b3c6b2a917b66bf88fa94e6bca4 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/f57e20785b20d64a897106b31b6c0eca58cf6d31 | ORPH
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/818d2f6e51aec037699efdf83c8b27dbbed5f830 | ORPH
 microblaze  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/6eb3084a80f54fc29fdfc65a32a1fd30f5fc8c45 | ORPH
    m68k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/da5e72adb024ba63d292412b77fea59d9e318f1f | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/8305c86b2b7f9ab5121474c72b139859f57d5dc5 | ORPH
    arc      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/cacacd73e39fe4c1f0eafd4631bdfa4d3553c28e |     
    arc      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/407d4e091b99bc1cfba1b833814ae1bd4f7c23a8 |     
   xtensa    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/becb329f9f54ea02981859d0c4c1acd6905d706e |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/c64e44bf45651329e46752968e1d6d030fa6026a |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/78533b6e7fac26434df80d3fa16d0411212503ae |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/2251350621d9905358656ddfe7a7678aeaea1292 |     
microblazeel |           php-8.5.3            | NOK | https://autobuild.buildroot.org/results/ef7e2d0b0554730b8685edce96bf054ec7719975 |     
   sparc     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/f9215688b6ae33959bcede51db6caa2bd7b8dec1 | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/264924e48173fda0b7d0759a6e576948209869d8 |     
    arm      |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/d65134590a845bbe42a6dda447ee0af6b66e5f5f |     
   s390x     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/eeba81aecbb01117f7b7af24d0a6c02f3c32cf6e |     
  mips64el   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/214d4d365000995bf28e431770f4a3b47016fb7c |     
 aarch64_be  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/dc2080dcf43357c23de0d298f3b850b5010e64c5 |     
    i686     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/4e2e72ab6658be0dd64ebf056269a8176a065659 |     
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/3789018e74fd8281f82734b837e017a2abef7b7f | ORPH
    arm      |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/152488d9dec84bcbb652fef2024dcfa8caa1f378 | ORPH
 powerpc64   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/475b237fac1a7fc7a00de282ffe507a57b423db2 |     
   sparc     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/fc771ea56c0dd1b04641006e4885aa370c6002c5 |     
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/d42436821ef7b9128cd98762544117145e240c08 |     
   armeb     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/7be95db297e44c460e15718eb8d31b372c68e10f |     
   sparc     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/b864d06f84fec395be741fcfac4848fd09f3d544 |     
   s390x     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/3692d3e6131d9aab594b0a1ca1252fc72839d910 |     
  riscv32    |         sqlite-3.52.0          | NOK | https://autobuild.buildroot.org/results/c8eb2ec5e97748e5eb9c9a076e5f429e0b181de8 |     
  powerpc    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/d0e961217c6bbf93e4780efbc62eee6f2fb1a25d | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c663a52ca6ee90ce8f9ab67d5dce43dd72d644c6 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5b6bf7ad8149c0e4ec72409e868242fc6410ef20 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4d8cc32648cef9e75b74c15ce7ec354d2fb3b25a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/727e2271e68a28d3f3f744fa3afda161586506b2 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/983f1626074a392c90fd6a4193c0a32c9c5d80d0 |     
    mips     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/b77ab11a0e66601e9921ad5f66edbf86fa50e2b5 | ORPH
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/6b2d74eea5b39d84799d636c3122c11d3116f3e4 | ORPH
    hppa     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/9ab1d38c846264404435d584cee9a3438625ce0c | ORPH
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/836a1b8c9066921ab5d496f88634c80e5befc5d3 |     
loongarch64  |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/0fc670bd23f3288b146a06af9e9f22603e8cdb77 |     
   sparc     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/62276fde8e89a3c03810cc8d1b15e048da34d1c7 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

          host-faketime-0.9.12 | 2 
        ltp-testsuite-20250530 | 2 
                 vmtouch-1.3.1 | 2 
fs/cloop/cloop.mk:33: /home... | 1 
host-gobject-introspection-... | 1 
       host-libunistring-1.4.1 | 1 
              luabitop-1.0.2-1 | 1 
package/linux-headers/linux... | 1 
                 uclibc-1.0.56 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | fs/cloop/cloop.mk:33: /home... | NOK | https://autobuild.buildroot.org/results/ec6ca2dbc1dca2e05a22aba4c783c6c105c7caf6 |     
 powerpc64   |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/5d5100b5ca04045d5cf601882edef04cef6d6dbd | ORPH
   armeb     |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/aa34495d06d75f423abec6faaa8d1c24d718e9e3 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bbd969894cb389805ae14e05e606a30d93241584 | ORPH
 microblaze  |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/561fbc44400b4da7aff95db75d12fb34402a54af |     
    i686     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/bb1f47d285855284666c77eefacfd4f36e714f7b |     
   sh4aeb    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/872844b125915f08852aa01e05a041cb295eaadd |     
  mips64el   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/7cec44d5f5f7492e51fd5137326adac9e644d053 |     
   arceb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/98a0b38abfd2518538f605ed337e8453d9640464 |     
  riscv64    |         uclibc-1.0.56          | NOK | https://autobuild.buildroot.org/results/04706831dfc878355386161f00adb389edefd4df |     
    arm      |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/f6df0d72f113221131a8d60e10c1e84b830017bc |     
  powerpc    |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/1114b761c915024df99697ec5fcb4b72d52eafa4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 9 
                 libmbus-0.9.0 | 3 
host-binutils-arc-2023.09-r... | 2 
          host-faketime-0.9.10 | 2 
                 host-gdb-16.3 | 2 
                acpitool-0.5.1 | 1 
                  dpdk-24.11.1 | 1 
              fftw-quad-3.3.10 | 1 
            gdk-pixbuf-2.42.12 | 1 
           host-go-src-1.23.12 | 1 
              host-guile-3.0.9 | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.27 | 1 
 host-softether-4.30-9700-beta | 1 
host-vboot-utils-4b12d392e5... | 1 
leafnode2-9543ffaf82406f943... | 1 
     libphidget-2.1.9.20190409 | 1 
               linknx-0.0.1.38 | 1 
          linux-5.10.246-cip66 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.3 | 1 
procrank_linux-21c30ab4514a... | 1 
                    qemu-9.2.0 | 1 
            quickjs-2024-01-13 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/60d3eb08e4a8fc16a5f6d307f59d5a6aeb0011e8 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/0b29cc1aecdcc4ceb34c6a0ac31c8614a634dc29 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/8330cc0e8b466b07a0b58f9167b3a7fc529eb075 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/41e4ddeb331789e4cd66a65ee8af59bbddb3b24a | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/471e69bfc8838908c34c5ee471eddab018159a8d |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0956322d918e526dba33cdee487b94506ca65a0d |     
  mips64el   |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/0f7c8a20df7f7a658e3d602c7cd1b71ecad9fd97 | ORPH
    or1k     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/939a3bd4ccdb1f7a3d16bc17545767739ab6704c | ORPH
    i686     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/64da240880cdceac7f7d17c00c148c86f7bc0de9 | ORPH
   s390x     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/aac2396f980d5aee0c33eee5b6755b71a1d5a6a9 | ORPH
powerpc64le  |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/2f4f9cabd95dfe035ffdf54fe4081ffef656f435 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/28dafef1d3ed98d7ad3a3ac6abd3ad0b09ade8d6 |     
    m68k     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/3efee8119ea8662f5b0f6bdb67f6722d75deecb0 | ORPH
   armeb     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/280866117deec77605af4da8be040d16e218817b |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/cc37dd2f55ef58cc9e80e85d14674b2622fe2fe3 |     
 powerpc64   | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/67ea9513823bc0ab207e160fe1187317ee16d40b |     
  sparc64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/3784944aca1220e8afc861afa945e2b1c7c0e671 |     
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/05cbdf5b2474b5a32d14447ba890f49e95a925e6 | ORPH
   armeb     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/449b63fdfb056f7b281b60269a1b7e3330cc17b9 | ORPH
   sparc     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/6b0041f84cf58ae7e60b7bef2e2301c0d242e9cc | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d789b16c9ccead6261b5e711a3bf8eef96ee3774 |     
  mips64el   |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/83348bb6464fadaaae5e69f259a3df2594ff5645 | ORPH
   xtensa    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/6e7d240e1046d472ccc4af851bddf922810a7ef3 | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/a981ba0ad8b1c11c61aff5be7b10c8672eadb574 | ORPH
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/ba81fa547e5d07120746288943f217b350e3c956 |     
 microblaze  | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/3b3a97afd59b2241ebe69ae93b756954d99d2e3c |     
   mipsel    |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/98ffc1b5777ea320be70ef6af60e56864b1b4a5f |     
    or1k     |       quickjs-2024-01-13       | NOK | https://autobuild.buildroot.org/results/49311312ac0703b9819b060437037bfd032a10b4 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/a180a704e68763033f2b7ee1d610e70161de6991 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/8a45de6cc8402c0f2a53f7cd11ef749399a9b4cf |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/45139c3811de8c2a49137a50fb11430aed1e6e5b |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/18dbc187b94d9b00b4b5a0487d907f31b1bec026 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/a2aa936e7551d314d0fd33ab2edb449bfded97b0 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/89627980153d57d52ea2c6b7086f953c14b87aaf |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/11642f143d9601c4edda4565d9bfe716c49ec3ff |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/d4d69d0e818d55a745f16a907dca27b0d0fc6762 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/1cc8869320f25719f61e0b7cf1fd28d38b42e401 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

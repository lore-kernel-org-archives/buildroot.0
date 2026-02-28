Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE83FEE4C3
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 04:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF99441834;
	Sat, 28 Feb 2026 04:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RETonmQlUCp8; Sat, 28 Feb 2026 04:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D60141839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772252847;
	bh=JIhESnbp3nDwm+9hrFunTN//u7vN2xDl1Ow5bvpUZMA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K67V3s0/Y7WrhRCi7EydnkKkMjAcSHbz+1kFE0ICSBtAl33NuRP+aWFKIoEBUcbmx
	 C7cnqISm1BlrLQvZ64TlI1C/cp8m3WHTFzeFRIVTuJG3S+dTuhUmdhnev+udfmpCcA
	 yDSJDDjviiUhdH2dG7wjPSrvqI7K2N1zdKfVfWj8jZBxGsCWZhy0dvrgDFbrG07Qk2
	 7kFcLoWM0+wCHPJxcdTNrUJPybt8Zr5t0qaZ0dvyQ8xavuckbEV9ZtCAR3isLWLhv7
	 UxVFHAAFVGNZiBpW/a5cH0xjFLH7qrOn+UTzA1+A9m7Mkh81JLmxwZ/A0tJFW5I4Xg
	 DbCM38an4VCmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D60141839;
	Sat, 28 Feb 2026 04:27:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40AF21D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 04:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26740418A8
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 04:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NtuZ_xTsBWZ for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 04:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 970D441834
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 970D441834
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 970D441834
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 04:27:24 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4398913af88so2366405f8f.2
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772252842; x=1772857642;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nbtI4KSOYkvIIucHJZhH3+AUuNtQjEJMWt4NzS6w7pM=;
 b=lVex0GRc3dZHcJhubzHHBvuDKAsVnPUnSxx7wxzOPhG7pYeaHug9hV5nSmWAM5/86S
 KIuBMvLbVAABmno/TXCn5khmmbtdRQz6YsOuP/0nFoRCfztGb6CRbTcObfPsQ0+we8fu
 +NhBRU2s1hHD+YC9Sk/6XwWczF0u3oVJKHUxTsWaDDy4UhXtmeu/Hn3QlHl9beFUxeKu
 NNMCUweS/uHWa7Nm92bDpPV5Yl+1Q9/VzGpW0yGAoDEic484jEvpQd2BWBqVJ3q+3PnU
 iaQiKEj+7G0loF/loKj7tCD9YWs7eaitN1uO6zfHuA4TpIm7nOPzr/V50OljOuSp/9T/
 MPZg==
X-Gm-Message-State: AOJu0YzMLHl2myLncsHYRhmgP5IP5SBGDELTWeJlcYV2OoFWcSVUpr4i
 T0qa1UV4o+4O6xd8KiK66AeoxlX+1i6bUfDRhJl+ZdKS5qrOJ65/SA4jM80Pe9zx
X-Gm-Gg: ATEYQzzbt51Q2jFt64402bAwaIshZHXZzxgrYJJQ5NricCwDdHCKur1l2szt233md/s
 z9+L0ntalPcWBTx8XXXKquX5Sn/o1WZLoaN/a4T3JLiL8aqTSqfqMIpM23a1jcLu64hZGenR8c1
 SVT9nZoyhNeO+GMoM1xpdPr6dj0zeC3DU5rEEV1/k633mwp/EEA9UwGjpUGPKIV2lWorSKR1G4F
 QJ1/s2hsAskagXAls0x16nyhEjwZ5KPAl9bRERFchzQJjBQgbl2BIb/9HazOH9qy8Th0rrVvohW
 U/hSEmhBsVkVA0MfPzYqqDoqtZIsalChRw4l/9P2WpGeaaRnhVaQa4EJGKVHZM9XwLHdMLTTSNR
 76UAJ3KMse+SiHr1ENSGMEBz9hgNVuoUz7OGiS/YBJblNWeKU6Upjv0rEfxPaFkV1TX2ZuYsLZt
 E9SO/rKW/P/Z25wUOX/sIovUXMvRU2TQ==
X-Received: by 2002:a5d:6e07:0:b0:439:a72e:bb1f with SMTP id
 ffacd0b85a97d-439a72ebb9amr1057367f8f.50.1772252842247; 
 Fri, 27 Feb 2026 20:27:22 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70ed47sm12229838f8f.11.2026.02.27.20.27.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 20:27:22 -0800 (PST)
Message-ID: <69a26eaa.050a0220.866d2.4979@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 28 Feb 2026 04:27:21 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772252842; x=1772857642; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nbtI4KSOYkvIIucHJZhH3+AUuNtQjEJMWt4NzS6w7pM=;
 b=DeN/BCLQc8FUAPAyDoGt76LZVOpn5LSTaWoLCDgk0HVh8cuezw82RxLPvy+dV2WEGM
 Ef9YgGvFDNrPRAKLHJAJ4H/VsJHEvAZwz21319pjZZJwZAoWLGqr0jHUrG15ndYnZUCE
 Ceqa/y9TAWiFjk258X5YAt8T6WWtiI8hB5iPihw3rfmLJbxO54TeszrKIFGEdfOoyMqV
 E8Ve1XLcoDRgpkTfSDZUZKenaoQwRYcbqTpoP6/aeUFRLaTzU7E2XoM7R1kaR+gEywWB
 mGfaDQb4vL64uYuRgtYuKqtk5TFec1wM9pXPqLJtGiYbPPJ32ph3eUIzyzoyFXhc1LXZ
 6Jmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DeN/BCLQ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-27
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

Autobuild statistics for 2026-02-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  7  |  0  |  9  |
  2025.11.x  |  0  |  3  |  0  |  3  |
    master   | 32  | 45  |  2  | 79  |
     next    |  2  |  1  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.84.0 | 2 
                 host-gdb-14.2 | 2 
                  linux-6.19.3 | 2 
               openscap-1.3.12 | 2 
                       unknown | 2 
                   avrdude-8.1 | 1 
                busybox-1.37.0 | 1 
                 c-icap-0.5.10 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
           crucible-2025.05.28 | 1 
                   dante-1.4.4 | 1 
              e2fsprogs-1.47.3 | 1 
            erofs-utils-1.8.10 | 1 
                      fio-3.41 | 1 
              gcc-final-14.3.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
                haveged-1.9.19 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
                 host-rust-bin | 1 
            igd2-for-linux-2.2 | 1 
               iproute2-6.17.0 | 1 
                  jasper-4.2.8 | 1 
                libdrm-2.4.131 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                libnss-3.120.1 | 1 
              libopenssl-3.6.1 | 1 
            libunistring-1.4.2 | 1 
                libvips-8.17.2 | 1 
                linux-firmware | 1 
                       mrp-1.2 | 1 
           oath-toolkit-2.6.13 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
                    olsr-0.9.8 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.0 | 1 
                   qemu-10.2.0 | 1 
        qoriq-mc-utils-10.39.0 | 1 
                 systemd-258.4 | 1 
                 wolfssl-5.7.2 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |          avrdude-8.1           | NOK | https://autobuild.buildroot.org/results/d1ab35918f374918642a87fd5f11531ebe617f2a |     
loongarch64  |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/b82c1a937ff4ac7316ecad015baf4ee17e58ebd5 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e538d4e1b6e33d025daf5b7ad8ff110815f92d38 | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/75fb229500f886627495b1109b42c2404dc7877b |     
    i586     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/e07198d7864331027d21cd2109054d86e7ac1c3d |     
  powerpc    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b1e8a15f5857c050139d1f19c7218c3514525997 | ORPH
   armeb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/69f076343d9b51a7cf613586a45db0577cf25135 | ORPH
  mips64el   |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/49f3e7858b757906371a674b71de5a11997d3f82 |     
   s390x     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/a418565d04c4a3902fa0105bd82a8a5177fa73e4 |     
  powerpc    |        gcc-final-14.3.0        | NOK | https://autobuild.buildroot.org/results/652e2e0821030eff6a071ddc02e255306e903f5f |     
   xtensa    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e0d5c81d7545da18e6e7c60099e6d16b6dd45174 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/18afbb803321d38d12e895b4654eee07c8a7516f | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/096148b79805979270756cd206bb9b5ea9e249ef | ORPH
    arm      |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/074346a39d3032a7da3d6bcd0a8eeb1f195e38ae | ORPH
   mips64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/4d8abcaa50a06de199c85f63d50e40ea4c938eb5 |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/92deb2384541a7da4df17f9a2afdedce32148407 | ORPH
    hppa     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/5e194bed516f402f6c2ec92827b00dcf6696f202 | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/e1d897cea7f934129923c4e3f8350c923240f947 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8e77b14e559620e97dd6f329792f2ff1a624764d |     
   s390x     |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/1f8a9bd0c5f5adbc98b019bad283249563b846c4 |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/839dee3ff95c3d9b490636c5e029dd2aaeb8a02e |     
 aarch64_be  |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/6beae2ed9b32f5bf41c05ce2590de3b6ab2481e0 |     
   xtensa    |          jasper-4.2.8          | NOK | https://autobuild.buildroot.org/results/02de8922b0b235d2f7bcea44f09b7ab1c24dc50a |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/2594c64054c9d3d99a08191da1321bd42a2d34ea |     
loongarch64  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/e1efa9fab1b7cc6c8677f1e41d5e7d3e655329de |     
   armeb     |         libnss-3.120.1         | NOK | https://autobuild.buildroot.org/results/546ea91fc3ac58f16f7f64641d63cf00e060b789 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/c500b3df620bdef0e3b85f573dbd6013a8d108f5 | ORPH
powerpc64le  |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/b8446be95434de870ff5aced75437f00ae464fb7 |     
   s390x     |         libvips-8.17.2         | NOK | https://autobuild.buildroot.org/results/1ef3dcc497da11f18081438f0dbb3d751c759efd |     
   x86_64    |          linux-6.19.3          | NOK | https://autobuild.buildroot.org/results/99c1dcd1c338b8713e21f31e6c9be3d1f16ff381 | ORPH
   x86_64    |          linux-6.19.3          | NOK | https://autobuild.buildroot.org/results/31da30d167fecf01c3134a56ff27b98e907876b7 | ORPH
    sh4a     |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/c4459db2a8dbb35ab72024163e2a09fba4bf6e68 |     
   mips64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/71b53978749daf2313e520115d651e89809e34b5 |     
  mips64el   |      oath-toolkit-2.6.13       | NOK | https://autobuild.buildroot.org/results/f6586d75d4ad787dfc42f312f4c74f345db052fb |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d27fcf4b8abce371e8b579e1f819407a201b88ef |     
   mips64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/ca92c4000b0358e0b2f9fbff54b174aac975a18c | ORPH
   armeb     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/345f1e96b921d82ad39c18b1994c81fc2360e8e5 |     
   mipsel    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/83df449e9dd25a0a28245cd6f2956adbd9126eb7 |     
   armeb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9f3e080dc72a027ba7d5330c99f0d701138a6fc2 | ORPH
    arm      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/fa873c79e7e1518d0b32a9d52f00c35141dd8cbc |     
powerpc64le  |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/17685289b88ffb6a02bfb3281547357c698032cf |     
  powerpc    |     qoriq-mc-utils-10.39.0     | NOK | https://autobuild.buildroot.org/results/1b954a31f55335c5a0d3d136be6207989dbd2985 |     
    i586     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/a16f9ca63cec1bd80e056a0e0bf310bb0e096f52 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/f7e89b6d4794e1aa0214e6bae3eefe2d50cb314e |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/8a367291c9111d7862822470cc909931b1cbaaff |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/b85e32b556b01c02797480e12f19d6cebdccfa57 |     
    or1k     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/eb2663b8619d4983e4af6392f6126208b9797b86 |     


Classification of failures by reason for next
---------------------------------------------

          linux-5.10.246-cip66 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/44e1845938132c4bafddbafa510c41d1b1ba541c | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

             drbd-utils-9.21.4 | 1 
              libsodium-1.0.20 | 1 
package/linux-headers/linux... | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/24d3d9bc1ccbba5125595625a90ce33e37637b80 |     
  mips64el   |        libsodium-1.0.20        | NOK | https://autobuild.buildroot.org/results/0f4ca6ad1722738734c94306a011f0b1ce671638 |     
   xtensa    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/8ca6a238e16f072727a5ee0de3d6a1d88fbcade7 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 1 
                 linux-6.12.73 | 1 
        ltp-testsuite-20250130 | 1 
                 openssh-9.9p2 | 1 
                    qemu-9.2.0 | 1 
              udpcast-20230924 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/aecd7fd247ee984192491aaad4c2785c81e5ef88 |     
  powerpc    |         linux-6.12.73          | NOK | https://autobuild.buildroot.org/results/6f421500ba2e3fd543546d48f6eadd43ffe247e2 | ORPH
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/985181bb29a318f7f3da2feacce2c04d6c05995f |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/66cff753920f19e8ff772992b3fd43f388013101 | ORPH
    mips     |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/7edf8bddb24574d6d6c6ca303f7ded03657f1470 |     
   sh4aeb    |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/62fcc10a0e244124efb5b853da1fe4f13d6bc5f4 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f1ecdc79bc28b22cb7028a9e938ac78c944701c2 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

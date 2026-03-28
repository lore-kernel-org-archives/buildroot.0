Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D8810F3DCA
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 04:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68BFA610F5;
	Sat, 28 Mar 2026 04:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0xqvC61efjB; Sat, 28 Mar 2026 04:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1EB610EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774671957;
	bh=gDQuMUThBV3jJs3GjXKRYrI80TjcG77SWmRVwJHaaYI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K07ZWt2aW3RZNDo00EiN13FAJEl1U5YGoPOPLBFaroXC0S3MquO5mgZuWLMbwz+js
	 RE5vMoSN6Fqw4d0Py3CWsf3wxwRwf65723/KqlTaSlRe52ugR0wuSTPYWhpLcmgIw5
	 EpoGuYO+JSBeVmRd5U2y2K6ZXtRlrPjFNLfqOtKeh11uBDyVEgMt3EIAmCKrMZn0P+
	 GfxW7RE6baYU2MnJLExoWBJGD+CCykq07i0IhqEGVgT8Jc34x4Ilbca1eJbVxlx67Q
	 VtixYTibFmw1FNL3FZIu8nlHW8JZkg2VTsVTgPGJasKE9Tn486B2MrQ6nKeUmfL/ql
	 i+CtClSNktUlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1EB610EE;
	Sat, 28 Mar 2026 04:25:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 404C710F
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 04:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E30A83D93
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 04:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6ZFztu8hWDu for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 04:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 025D083D65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 025D083D65
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 025D083D65
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 04:25:53 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-486b96760easo30385815e9.2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 21:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774671952; x=1775276752;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VSGyTaHWWDOg/6uwYsBV+d0EO7Nl3qq49J5WLd3MkuY=;
 b=AyDJPVwlC28T3n5CtbijikOw8akpC6ZlIsHD316sx5j6tzUcvhrwYZspzlyZTLO1+9
 kPBjT3MziR9d/QMgmC8BnfRu2p6LFSESucmdXO0CP7/SnwU4/WuIgk8JZLO4YPvIdLrf
 ve3rXGq0Z7PqiUQcEPmn5PGVJsla4MtaK7kpO0MTxErwOs75fLo6DxfgzCw77lYY9F9C
 oJR0ybr2+SOKQZHTQ0hnkEh01LENkBb9fhyt7KNgwEVwSbZ/3HnYMHuLhn9wa7i2Z3Hl
 eNdpf7Ew/DsKbueh3TvJt6cRwmIZ5ljOp9lNDa/caeoa4Fc1xEN00MwkVws5uXXpvOKp
 CoqQ==
X-Gm-Message-State: AOJu0Ywirnov9ydbap9lTboxhOVgwYm2Yd6NUMYnmRnD+0TsNhsiTyEe
 E193AlIMF8Qi1EC3cnDQBBzk4d/yAyJ2sfksCsQkRrYSIhh1HH4nsiVouWONFhc1
X-Gm-Gg: ATEYQzy9EW/7ojRFTdCY+gMPrA7J60jLN2+MOjUpHqXzQs2ALhw3/Vx2l8hrvI2IyuM
 UtOGboiJMs7B1YJ/9EM9lwRqqr63QHoZE/iRUY2knvaPYaxdyfjHv4qXa9zLxDu1zZnQAOYaT6D
 Kfn8V7SGk5sSH/ocq0OaIvzNyZZyVEOf9/gswbtG7fJpo32GAbSftIF3PKMV2eJMYXxsuL0fI8p
 78wb4IFZ2Aoc5x9p86/r9/PAeykFk6B9Np8wQ8E4G/Zq8nCMYIKs+VlJfJBk7wHIVx/9VAJ6aNy
 Sl6GiZhWKpULYzhp2z4/fqYYwiF+RU93vd+kluUl+OdhsWrY5bQfk7++cy6vJgfHkmdO+sop8WD
 PXAIQlaffQpfnQ5+FM4+xsqOSDg4w/ny6HdCTE6XKIrlvjpw1hZJbr1L0H/5JbQC3hu2WPiYP0p
 OrhrHNg42hrUy6nK8UixKAI0k07A==
X-Received: by 2002:a05:600c:1f13:b0:487:169:9f64 with SMTP id
 5b1f17b1804b1-48727d73709mr78877365e9.12.1774671951355; 
 Fri, 27 Mar 2026 21:25:51 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722be608bsm167084995e9.0.2026.03.27.21.25.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 21:25:51 -0700 (PDT)
Message-ID: <69c7584f.050a0220.22e634.53d8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 28 Mar 2026 04:25:51 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774671952; x=1775276752; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VSGyTaHWWDOg/6uwYsBV+d0EO7Nl3qq49J5WLd3MkuY=;
 b=SBf10cvDpAJF815ayzVw7QQn5YR3scSzzcdqxxrAFFpbkz0q1UJRGS3bx5pjv0qcOR
 RI+9CqPVJuZgIBAm6mp8DxmS3wLLYZqkkFVlYkQiBjKmFmHaKraA2sr5EcNRN2aAodtM
 mOA7YBuKmeRlA3JIjZ9YTCckn6Y/glcOqDM62fGgjPB6zGLAKVMvFlnFHqmIxS0WaEJj
 PlL+S91+IXotcEyJuIphaH6AZJL9Ut5iDhIiD8BoBPExIjhukVTY84dhnfxTc+g9OIYM
 Npo4YTdCzGmFDLvcmAuZ/9lAO5H6u01MnfdaEJUKYrpJD19iIfJaEmga4p83PB8ExZe8
 gRvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SBf10cvD
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-27
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

Autobuild statistics for 2026-03-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  | 29  |  0  | 35  |
  2025.11.x  |  1  |  7  |  0  |  8  |
    master   | 27  | 130 |  4  | 161 |

Classification of failures by reason for master
-----------------------------------------------

              skalibs-2.14.3.0 | 6 
                       unknown | 6 
leafnode2-9543ffaf82406f943... | 4 
                 libmbus-0.9.0 | 4 
       shadowsocks-libev-3.3.5 | 4 
host-gobject-introspection-... | 3 
              host-guile-3.0.9 | 3 
           host-libtpms-0.10.2 | 3 
                     kbd-2.9.0 | 3 
                libcurl-8.19.0 | 3 
                  libnss-3.122 | 3 
        ltp-testsuite-20250930 | 3 
                 mdevd-0.1.6.5 | 3 
                  boinc-7.20.2 | 2 
               bpftrace-0.24.2 | 2 
                  cairo-1.18.4 | 2 
             dahdi-linux-3.3.0 | 2 
              e2fsprogs-1.47.4 | 2 
                flashrom-1.7.0 | 2 
  gobject-introspection-1.84.0 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
     libphidget-2.1.9.20190409 | 2 
                 linux-headers | 2 
            minizip-zlib-1.3.1 | 2 
                       mrp-1.2 | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
                   perl-5.42.0 | 2 
                 rtptools-1.22 | 2 
             util-linux-2.41.3 | 2 
cegui-e7a03afc70c6182a091ff... | 1 
              containerd-2.0.7 | 1 
        edk2-edk2-stable202511 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-6.1.4 | 1 
firmware-utils-c42a3bc53da8... | 1 
               freetype-2.14.3 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
                 fwupd-efi-1.7 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.43-10-gc3ceb93dc4f6... | 1 
                   guile-3.0.9 | 1 
                   gvfs-1.57.2 | 1 
                 host-gdb-14.2 | 1 
                   host-gnutls | 1 
            host-gnutls-3.8.12 | 1 
    host-mender-artifact-4.2.0 | 1 
          host-mosquitto-2.1.2 | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.28 | 1 
              host-rust-1.88.0 | 1 
            igd2-for-linux-2.2 | 1 
              jpeg-turbo-3.1.3 | 1 
     kvm-unit-tests-2025-06-05 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20260107.1 | 1 
                   libao-1.2.2 | 1 
libdill-32d0e8b733416208e04... | 1 
                libdrm-2.4.131 | 1 
                libglvnd-1.7.0 | 1 
             libgphoto2-2.5.33 | 1 
         libhdhomerun-20210624 | 1 
              libopenssl-3.6.1 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                linux-firmware | 1 
                     mdadm-4.3 | 1 
          moby-buildkit-0.11.6 | 1 
                    olsr-0.9.8 | 1 
              openjdk-21.0.4+7 | 1 
                 openmpi-4.1.8 | 1 
                openssh-10.2p1 | 1 
             parsec-tool-0.7.0 | 1 
                pipewire-1.2.8 | 1 
               postgresql-18.3 | 1 
           python-html5lib-1.1 | 1 
                   s6-2.13.1.0 | 1 
                s6-dns-2.4.0.0 | 1 
          sphinxbase-5prealpha | 1 
                 sqlite-3.51.3 | 1 
                 systemd-258.4 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2026.01 | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/82768467b4c8be7b3a4d5f80c6ef5547d5a152ed |     
microblazeel |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/f5fad0b37953782bc6c242c021a4dad773a082ef |     
   x86_64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/06a60276eef2d68615792693d8e8ebd73ee65ba8 |     
  aarch64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/0f8f6b740a59624db6d7765263d4434b4e549a13 |     
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/6052c787d61fa641d746c74cb4b25bce38434055 |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/6430725a2620d48b378eddeaf72bbe1dd97431ab |     
 aarch64_be  | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/b5ff89f359e2cfa017fd9a9b70f8f30712911a29 | ORPH
    arm      |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/f832ff3a8ffd7987f0ad57ce4bb0f39ad35a6848 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/91046c9582968b8a940df634af8fa68740054772 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e247836c66b5c1d0d1ffab618e465655f4f8f459 | ORPH
   x86_64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/2ede8b88cf66585abcbcf0c99d13eab5e8c1d1d6 | ORPH
  mips64el   |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/3168f0e4255df51328ed3e7794935eb37722411a | ORPH
   x86_64    |     edk2-edk2-stable202511     | NOK | https://autobuild.buildroot.org/results/996c9f7c048fbff82e313833d06d61dfe3a089e4 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/430699ee87aabf7bc4803e74f6aa2e48346e825c | ORPH
    m68k     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/4105597125d76a085e049f7e5325601523d18704 |     
 aarch64_be  | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/fd370c30f5d9c82750999679c20eea6fdc8001c1 |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/3ff7b3029dbaa5effacea8c5e9143609e805290c |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/db0f29d586d76fed3553c6fbd8a338c219063d91 |     
    m68k     |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/70408e4fb4841b4c29348d65c4afed5fc7f955c1 |     
  sparc64    | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/4843b955b7db34d7595e1dc8e950bcc50b259173 |     
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/874d1708f0028fa3cd6a80ebead0ff92468360f0 |     
    sh4      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/2e38ecc270fba2d33e4389ee592cb653f92daca6 | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/e4b1243163c4a827cc13b5daca3b793981ba1b94 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/9db3dee4c62b7f565db07a49fc6df06beb92a5d8 |     
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a01224debfb53e40ec0f754b88aed8cd6ee4602c | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/42956388fca52b9d8af24f05c7c96db4c7c18645 | ORPH
  sparc64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/5dc3e027c985e95c242ae9b7c1b86af7184b52cf |     
loongarch64  |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/5eec21ed72195650376bcf8efb5f1546397768c0 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4da08395912d3a21f65fd6a75ce732005c9b0a2f | ORPH
microblazeel |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/e495f6b725b57de792a5011e8713cee4afe447d4 |     
    hppa     |       host-gnutls-3.8.12       | NOK | https://autobuild.buildroot.org/results/9b403b6908e10e69ed6b64acd2fed1c381f0f0b3 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/81799be02ba7cf5b619c08c57a1d90455bc0c5a3 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6f9297fa2c730b60ac9a1fd54cbea0c5a58a7ea8 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/24b7810c372d67947e358045c0769bc07c488534 | ORPH
   mips64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/6e3c967eb94da02ca1c5cb14a715e930b0c58c01 |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9b509933c8e07be7e030af68b4ecb4030dbfafbb |     
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/e88dec548730691ef431a69f5481160c5e5910db |     
microblazeel |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/51bdde7bf717a48dec2963f20d45d5f25bb5fba7 |     
   sparc     |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/8c40191c74af400c2437bcc09ed714ad318e3069 |     
   armeb     |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/d15f9194b34663cdd16267a148cc287dc3ab3aa0 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/d885e4de81b4600adb1bfdad4a3d2443bcca5d24 |     
   mips64    |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/e0ebe1f11a60494c9a37bc85741acafbca06346f |     
    or1k     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/585cf59ffc89b9c8b7587c8162d95e47a75d9653 | ORPH
    hppa     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/e897011de21205b11c8de14d2a53d539f75b65a9 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/84cc3e0fe2838610505f3d4796f934add88787cd |     
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/cf8ba5249edfdfacbf442464bf79dc4bd8184924 |     
loongarch64  |        jpeg-turbo-3.1.3        | NOK | https://autobuild.buildroot.org/results/3b0b2d82647d428e43a67bc6b34b0b76889dd4f9 |     
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/23c31d29fa9c1c9cdadb0b58bdec4222de6411f8 | ORPH
  powerpc    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/be3636ddbab2ce194583e5efe5c3e9cf4570e5ac | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/b253b15cfb6e6e2d56f170e1f5c95ae40c6e05ca | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/c93e37cf33b7b40d42f2a83a3c899c0ff0cd9649 |     
microblazeel |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/d810887f41e90e1795f345b391cd00f99b719add | ORPH
  aarch64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/5867c5153c3ef8d2dffca7b0411266472de95c44 |     
   armeb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/e1092721875436780c3a05a60374a1557ecfd051 |     
 powerpc64   | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/712fdbad30d188fa685ff11fa147bc24a66233ff |     
    i686     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/f512cd3d87f2207690187d01e49286c6743a72da |     
   mips64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/518ce67af75ea74fd02958ed2f5796cddc88eafc |     
microblazeel |          libao-1.2.2           | NOK | https://autobuild.buildroot.org/results/8fb021711430ceaefe479eaaede2140323764e69 | ORPH
    arc      |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/4dd778cda86d4c7ce2c27911167c3c4d92f124e2 |     
    arc      |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/2686dbf3dbfe085ffe4ec9f7191a835f06c94bcd |     
   xtensa    |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/198de5bbbcd4c0411f80b57b747ec1d9440b2624 |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/7c85c259200fcd66a5aba7cb86777c200110d687 |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/8d20b0a5ad01494ba33613137bc70d9bf09d02c9 |     
   xtensa    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/07fb4ea604b4ea995d11f129d3933769a9993f30 |     
    m68k     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/62a0403833983984fc52b2a41d724db589b79afc |     
   mips64    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/9ca50becc05696100f702c35d1615711d476c383 | ORPH
   mips64    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/ea5f1c2115cfa9c29ba561c9495f022081a4e7aa |     
   s390x     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/42691cdc49ed51dcaede00ce15effd401c559d3e |     
 aarch64_be  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/9323108af3aa5d1c076a624b485994c3bde08d5e | ORPH
loongarch64  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/e1c72c1954c984b72592b23569d762de1303130a | ORPH
   s390x     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/05032bcb92f55e53e208107b00ae6b51605ada13 | ORPH
  aarch64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/50fb559fc3ef919de4b39e66212bc854e09cea7b | ORPH
  powerpc    |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/95933d43e3fab71f4001d0d29d4aac5b4d82b468 |     
 powerpc64   |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/370b9ab04c2eb8bea81d6216a8ff18fe17a6b5ba |     
 aarch64_be  |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/8d77725b16bcdd645fc345268f82b13b8d5ca631 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/564237cab7922fd02a92f6a1559937a70a5acff4 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/91568f0730a27599219600939e5026fc1ab36cca |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6dca951b58e40700706bf9c45001392fa4950b71 |     
   x86_64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/19f05cc50186b872003d4668bd4d77056de940fc | ORPH
 powerpc64   |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/8c64b18065cad925a541377d5378543da66a6bb6 |     
  sparc64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/34e7493e7b2c1d7ad8d41e3e8f1d33d72079e4ad |     
powerpc64le  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/902eae0c0d390edff929bedaa8c2db97b16e66de |     
 powerpc64   |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/dcd7070c234d81305f8fb5ab98cbfd44c59e7ea4 |     
 aarch64_be  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/68135a3c4ceac0d6aa52c25213791eec83ff0747 |     
  aarch64    |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/5009b103baee680a26d957ca4853fc9b5e663256 |     
  aarch64    |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/0bb6cb861233b9c1b449a885f76b30f0168dc78e | ORPH
   armeb     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/f09516f73d0ef675f2d6d46b6ab3e642ddb6e450 |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/11776419df1984461205b54d03080c64d6ece99d |     
  sparc64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/d1bd9a4569c3fb20eecab2647c30b09062fa7f77 |     
   sh4eb     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/d1ba1a3fcdcf1fa684295c6669363115113fdd37 |     
 powerpc64   |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/1583a882a85053d532859fcbaecac4efdb9f9d76 |     
    arm      |      moby-buildkit-0.11.6      | NOK | https://autobuild.buildroot.org/results/a2c9f741272e39f79418be34b44780dfaf0fe3f9 |     
   x86_64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/5cdf108ce19385bf7cf3cc589591fc32a1ff6a81 |     
   x86_64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/45f7bf5e353e660cf9a066047db5170d46f51197 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/9382a7b2e3211b9c720f005dd12edb0aa6cf31a2 |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/615faa81bd5dbf364de7f418b11678860fb59042 |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/017696e9c30311c5e2d6ed53b8d4f6ebc30d721a | ORPH
  aarch64    |        openjdk-21.0.4+7        | NOK | https://autobuild.buildroot.org/results/4e97a7c88578bac12e659637972f7e3c81d9cdf1 |     
    arm      |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/c75c03d5d6acd86ba2e09a852074cec27c61198d |     
   mipsel    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/e46af82c9768b377fe083179e90c13ed6401556e | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/dd722db3451a26c074514f1c91ebef1fd588daec |     
powerpc64le  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/c0e35c44ecb5b1a82caa1e438812570dcc64b52e |     
    i686     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/3265730486db07931b166e1c2bd74b25a7cdf9a8 |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/48ca55d34e3db31516c0b1b52b993990f653a955 |     
    m68k     |        postgresql-18.3         | NOK | https://autobuild.buildroot.org/results/c6c4855e927ea119b19cd532a4f0c0da5d4e7486 |     
  aarch64    |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/96d97dc579fe1e7eadb93c05991afca8fbfee0b9 |     
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/d0a583bf0b0c0485aa0b55a189f6561c84bc4ba7 | ORPH
    hppa     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/9a6043f6113f51a473a37624a2cd44a7cc5d59dd | ORPH
  sparc64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/3d7cf47be4719882db17d4daf98a1fa5dc7ee3ae |     
   mips64    |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/61cbe392be7fea867738c0b94cb54fbfb4f8e371 |     
    hppa     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/35994ca8c22e87c27cc95714e0d53c4860e7ca92 | ORPH
   mipsel    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/98ee14b86851de67e187fc0073b8bcca24c584a5 | ORPH
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/805daac5caa4832cc316b43f23aaed9726ebc391 | ORPH
   s390x     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/f0e9f86f7c44fa660b2170efdb1462d62260e6da | ORPH
microblazeel |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/09ebc05dc3c2bc1d5bf3442f222e21793eb88be0 |     
    hppa     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/16d8d7faa14a3b65bb1a9ab5d9adacfa08a464a5 |     
   x86_64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/5253eafb75e10c0246dcd1ca583407c0e97c65e0 |     
 powerpc64   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/dea867b855a15708da5432636da88e2a20e6e9a0 |     
  sparc64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/7dc1cba4727f5e71d3e5d602cd3dba9b623ae000 |     
 microblaze  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/b1deeafc70ab6efb0b597ebbcee56d0b3cf1951a |     
   armeb     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/4eb8850aebafd69ec835a399645c71236d1372d8 |     
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/5844aa5aad09e7036971ae77cd90f56b9ae5a9ae |     
    m68k     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/10ef639811799b5b0cfb2a3b8e976826f5368b56 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/60b5743cd838c6a261b2746bf3bd11db9dd4e41d |     
 aarch64_be  |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/f67041224274f445b7e0a02094403cd452a8814c | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/8a1ce84963ee252c1e0a695333d0cb292b09edda |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/df20a59da03132c4fc7fc12dfa6757ed5d03bd36 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1308932d18b18aefc762e245dc0f620f8f7e436d |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3b2739cf5bfa8dd821d8db7f2e36d39b99f33ea6 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/321aa136e7597d5e1b6ddd4d06d0d5c31d02ecda |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/ca31dbcf4d504ce4edebba7132022308505a5872 |     
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/338f07c82f4504a25c0a8b4bf84f67f61e7eb204 | ORPH
    arm      |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/99517bfe37175d36173c12fd09d31d4a31f2bada |     
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/32e91602d98956c64b393e1834733ec30e3a68da |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

            host-coreutils-9.8 | 1 
           host-libtpms-0.10.2 | 1 
       host-libunistring-1.4.1 | 1 
                host-odb-2.4.0 | 1 
                 libmbus-0.9.0 | 1 
                   perl-5.40.3 | 1 
                tpm2-tss-4.1.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/c73e52f97c83eb1419795c7f035116bcce538be7 | ORPH
   mips64    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/9034a4d720b1ff80f701fdadc7b04884c79d25d2 |     
   sparc     |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/61f3c5cebc36a931214b007686a2027bf8ebb1f5 |     
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8a7ee9b49bf3c4577eae1e55e39aaf1144b1ee92 | ORPH
 aarch64_be  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/462a511ed4980c0e6ac4dcef4338b81e8d3245e2 | ORPH
 microblaze  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/f69e20b007d361499bebb27b84f26b93487482ea |     
  powerpc    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/a9f09166b5291a305f57a5b3b0455478bf58e600 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

leafnode2-9543ffaf82406f943... | 4 
          host-faketime-0.9.10 | 3 
           host-libtpms-0.10.2 | 2 
                 coreutils-9.5 | 1 
                   dillo-3.0.5 | 1 
                 gnuplot-6.0.3 | 1 
  gobject-introspection-1.82.0 | 1 
          host-binutils-2.43.1 | 1 
              host-guile-3.0.9 | 1 
              host-pahole-1.27 | 1 
        host-python-lxml-5.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
             libgphoto2-2.5.27 | 1 
              libmodbus-3.1.11 | 1 
              libopenssl-3.4.4 | 1 
              libsodium-1.0.18 | 1 
            libxkbcommon-1.9.2 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                       unknown | 1 
ustream-ssl-68d09243b6fd447... | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/fa167c601e3f19d71342b15bd2953b282cb0da1b | ORPH
powerpc64le  |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/037a5c7b320dc2e1af72f34332003a215cd82013 | ORPH
   x86_64    |         gnuplot-6.0.3          | NOK | https://autobuild.buildroot.org/results/2123c0b0a2c37b8378733fedab4d88810a815df3 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/841d3babeae11eab9f72c18447f2bf65a276f7f7 | ORPH
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8bd536bcc9f1ae2e816915a6b53a2f96d7acf552 |     
   s390x     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/126c3964cbb36ec845c5cf769141c4d157acc78e | ORPH
  aarch64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/82726b087edd67cad1508caa1e3c4a1242df54ef | ORPH
  riscv64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/765902d1cae4d6dd2559f65b227a7b6578a0bcf1 | ORPH
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/f0ba7a13521ed588c15345b8e469a891bf700648 |     
  mips64el   |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/7cc1bafec1d126cd88429a2fabdb1381a60a20a8 |     
    mips     |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/acef668b942cde396c58a90b9c0487f36a81ea37 |     
    arc      |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/eed183ec007631c2ae16daf9c9bbaf1b6278875e |     
microblazeel |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/37d06b67a039e04706056d8430f78df33b551faa |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ad9a9c0b9845c7b69085583e848b7329395b24a5 |     
   s390x     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/81cec4b50898c3e527022f0b083ed4c9869fc544 |     
  powerpc    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/a3141875f162a99354ff2ec3ae0854c3458f3b68 |     
   x86_64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/9e8a7788f1d64e1389f6702a1b38e6a528cce311 |     
 aarch64_be  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/7bc94a7f286175c6615f54f82d14165d7a462ac8 |     
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/d640c5391df2519a6c007d665e69db36078e806e |     
    or1k     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/6544c9704720d7b7f6e957478a55bfc82262bcf9 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/afb300db25a73b6c52e580102b3c9ea593d0504d | ORPH
    or1k     |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/a4e9fec5bb991727c3805ef60482551fe72cba25 |     
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/3d1050d7f6fce967fe77d1b231a42a4a2d6823bf |     
    mips     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/b02a838d39f585b97247b0c1e40e5618e899b0ef |     
  sparc64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/0dda867a2053806f85f40229211c90a199c2250b |     
   sparc     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/be485fb0d88b47310c05c49207fba140879acca6 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/f8d077c5c5f30b7532aa2b20f06da8b355f3b340 |     
   sparc     | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/f0ca099c1569ef2d43ba9f47799c7627b11902a8 | ORPH
  aarch64    |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/1469c68884d1408952865e933c978d5320472a60 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13C4FF4937
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 03:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1573240CB7;
	Wed,  1 Apr 2026 03:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCZILHHnv_XQ; Wed,  1 Apr 2026 03:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0314040CCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775014139;
	bh=iO94KHDwxylPUdIIrU5u2dJCLSjupMNIkg0jrDs4eec=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dnmveoe/tYjgVAL/3N2/D4nJiHdXFyCoPt88EWs73XMEYbuwIQ53oIm4D0MZA3kz2
	 mmqlxFRkHEHGAVKWBpp9EIcL2oMyS+gPPtKuAmxluDOGDKy0m9S7tZfioGYvHqeH9u
	 TQUsyYHjVVGjJn6apS1XDvwnyq9ILvlwVJj0FsL8v2zh/TozmhThcMV4nq+991AJtd
	 j9pyjMl8jEz6689AC7t31Sgi1tJVG3sZjiG7rqZKrZdgclIlno4lhpFG9X9Z2R9Fq3
	 eXKvm8JAdbR5NvTzX/uAx3O3Ky3lg4Z7ZOkGkP4z3H/nKeGmgl92lX6c0JKiOT0Jqa
	 4Q26jDeFfr0jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0314040CCF;
	Wed,  1 Apr 2026 03:28:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8110F2A2
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 03:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 691E280AA0
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 03:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EbH_H5cV8Qj for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 03:28:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A55580A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A55580A9F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A55580A9F
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 03:28:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48700b1ba53so58123635e9.1
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 20:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775014133; x=1775618933;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zagui+iOpQwQWIiGH3lR4p9iySShbEQuf5Wd9343kbI=;
 b=eVYeYjK0esk3YTxEAYVZdkxvanVGyy9vWUYNZEyCEvvjvOVB0upYPkAOyWvw2sryBi
 u6Ulg9Q0OLqXxQjwYHccT2PldhdjRQUsroq7RkyuJUAhbsCdovvwhOxpcIhIM+PJJHcL
 I4YIeGP8TcRk0Ddg2mCldnjWRFXlciHxSWfcpUCdOExn3jP2Pdxb6EHert+oVhmErZiq
 9BIr9ssgIVVj1B0cjx9YGWC29Rhf5MkrqBeCl6fJih49xfXAm3wGDCeQWWGx0SpFxV6z
 3eMZzgWIq5mHE1BCvfZqe4P/XYfCV0Tg774w+ClssW+2fX5uw7dOX+tBMwL6VyavRf9R
 rYEg==
X-Gm-Message-State: AOJu0YzlrhbjmvvdpgJcqAhY8Q6CAm6wz5ILP7k15yR/wx9QmSctG2Et
 EyRfIyUvyd0xXAjW6oDHCFnzn1OKLLLUD4LKkPzpgmvdC2eCpwggNCZ+EcfxYPKX
X-Gm-Gg: ATEYQzz1yKz7pM3JQFOTKxcTXktMPvFzga7J3ltR5eUsQ4tS1eIf4LUJOe7+Xuon3nG
 E7Qv9uHDBxICoj9+NqjmhZMGYALnr9+/IJsUX+BTOOxyVoC6XCRtyNfDI6WbXwktK97cuKIV4El
 k4MctC4EUme3zqR8HuPQXZ0Y2P/u0vebo5ewMZq00saFFrx9uBbMhTAHYzwwfe9iAVekBQf48u2
 zMClN8eMa6qCckGNImJryJOVCof+wKDJjaYkpWB0K21dL8fkaM7ulvZ5xmBRl9y+jml7G9x7jsD
 3RK500HWpilidmEvEJWVxaUxjCtm+BZPwX0n3skbhyfu/pLfY2Ley0UQyrjGXMOYCV8ezETSUVk
 hIl8hNzsAfZkLDfF5fTm3c5ijMdq8ZJ7qVPO1OOsKrPIYUdtQNVIa+0wkI1KrAhy3HYdoGUhaj3
 WyqhJJqw8tltwv4CCr+O/i5gjJ+w==
X-Received: by 2002:a05:600c:1d16:b0:485:39b2:a47c with SMTP id
 5b1f17b1804b1-488835a58cdmr26901425e9.25.1775014132311; 
 Tue, 31 Mar 2026 20:28:52 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a6ebsm97015735e9.6.2026.03.31.20.28.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 20:28:52 -0700 (PDT)
Message-ID: <69cc90f4.050a0220.2c9e6b.3003@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 01 Apr 2026 03:28:52 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775014133; x=1775618933; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Zagui+iOpQwQWIiGH3lR4p9iySShbEQuf5Wd9343kbI=;
 b=Iea8zA8Do8IFw4GhK3iolHFybK/LhsVPqzm1h+D0M/JWCBh/CVqqCXwrphlKK618Mz
 mLR8VqIzH0/GiWx/71szbCdCU9TWgOLzc7DPwbb/qzRuC45E7gMrhvO94xeQZoxtt3Xf
 0tXx0+5iNi5LUmK31Yg8dm8ESEkqx+YpvCwpfCs7i3NHScTjmkMUjWCPy80BJ68Akb5G
 kz4aCXiBkPw0rU0T0Unf44e9FBJ7fRqQHHLI3BmvUcQzA0kGBSS4WTFzVV7xa4XC88fo
 QWm0HIDaceVhQitL+T9+Hy7I6s4gBq1KJK08zL+SkaXH26GEonFYwn/0UiEelvYDfr91
 AeLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Iea8zA8D
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-31
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

Autobuild statistics for 2026-03-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 22  | 45  |  0  | 67  |
  2025.11.x  | 12  | 17  |  0  | 29  |
    master   | 53  | 168 |  5  | 226 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 11
             dahdi-linux-3.3.0 | 9 
                 libmbus-0.9.0 | 9 
                flashrom-1.7.0 | 7 
                 mdevd-0.1.6.5 | 6 
     libphidget-2.1.9.20190409 | 5 
odhcp6c-f19dd37fb467c9cf10c... | 5 
                       unknown | 5 
             util-linux-2.41.3 | 5 
                 linux-headers | 4 
                    ficl-4.1.0 | 3 
            gdk-pixbuf-2.42.12 | 3 
                  giflib-5.2.2 | 3 
           host-libtpms-0.10.2 | 3 
                host-odb-2.4.0 | 3 
leafnode2-9543ffaf82406f943... | 3 
             libgphoto2-2.5.33 | 3 
                   dante-1.4.4 | 2 
  gobject-introspection-1.84.0 | 2 
          host-mosquitto-2.1.2 | 2 
            host-protobuf-34.0 | 2 
                libcurl-8.19.0 | 2 
libdill-32d0e8b733416208e04... | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                  libnfs-6.0.2 | 2 
                  libnss-3.122 | 2 
                  libsepol-3.9 | 2 
                 libzlib-1.3.2 | 2 
                openswan-3.0.0 | 2 
                s6-dns-2.4.0.0 | 2 
       shadowsocks-libev-3.3.5 | 2 
       sp-oops-extract-0.0.7-1 | 2 
                 sqlite-3.51.3 | 2 
ustream-ssl-5a81c108d20e247... | 2 
                   atop-2.12.1 | 1 
             bmap-writer-1.0.2 | 1 
                bpftool-v7.5.0 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
        edk2-edk2-stable202511 | 1 
               freeipmi-1.6.16 | 1 
                    frr-10.5.3 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
           ghostscript-10.06.0 | 1 
glibc-2.43-17-gdd9945c0ba40... | 1 
               graphene-1.10.8 | 1 
               harfbuzz-13.2.1 | 1 
              host-guile-3.0.9 | 1 
       host-libunistring-1.4.2 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-pahole-1.28 | 1 
               host-runc-1.3.0 | 1 
      host-uboot-tools-2026.01 | 1 
                host-wine-11.0 | 1 
          host-xfsprogs-6.18.0 | 1 
       host-xorriso-1.5.4.pl02 | 1 
               iproute2-6.17.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
                libdrm-2.4.131 | 1 
libfutils-c326ce0cc2a735438... | 1 
                  libgudev-238 | 1 
               libinput-1.31.0 | 1 
                libkrb5-1.22.2 | 1 
              libopenssl-3.6.1 | 1 
            libxkbcommon-1.9.2 | 1 
                 libzip-1.11.4 | 1 
                linux-firmware | 1 
                    lua-ev-1.5 | 1 
                       mrp-1.2 | 1 
                openntpd-6.8p1 | 1 
                openssh-10.2p1 | 1 
            python-numpy-2.4.0 | 1 
              python-xlib-0.33 | 1 
                   redis-8.4.0 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
                 s6-rc-0.5.5.0 | 1 
                    sbctl-0.18 | 1 
                   swipl-9.2.9 | 1 
               tcf-agent-1.8.0 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.01 | 1 
uclibc-ng-test-132c6134d691... | 1 
        util-linux-libs-2.41.3 | 1 
               valgrind-3.26.0 | 1 
                    zeek-4.1.1 | 1 
                       zsh-5.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/dca883ae85f11e33765ed8d3f284fcc90a90a9f4 |     
    i686     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/e3ca4a112f2ce251ff26f79c52442aa947d1e196 |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/53bd8adc1a272886ec9ef3ac6378093a417ab132 |     
 powerpc64   | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/47a7b1872ff49baead5298f4ace0790232b059ed | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3342861dc285698d99aaa3729b04b7b08c6248a6 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/eb18d16b0d4997e9e25b85453b56e908f5f4350c | ORPH
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1b9089c52202b07d303e8fe04da997b2c31d376f | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/97d7d93e2b5a9db5d869cb315f3502114aa52270 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6015b78c0934b66b305d5050d03fc1f0c1cd94ae | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1508a2e3d6c423e8ea0248ba8d9ebcdc3db7f89f | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/334a0f047c036e8bb75b1364c2af5a3b2c9fa7a2 | ORPH
  powerpc    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2035a926798dc1383c9118ded8712e404609a2f9 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6aea850a52050756f2bd71950d82feb9fd865c59 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f61208cbc974f0fcce40de1fe01336055bb7fc89 | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/1c15cb745d9cf85818e68895f60420f6cffd1aac | ORPH
    i686     |     edk2-edk2-stable202511     | NOK | https://autobuild.buildroot.org/results/ccf8bca65ec5587c7860be9750f7600cb7ac4d3f |     
    mips     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/3832bd7487dd76aa2e489c6ec4e56510b9eff469 |     
    or1k     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/800f1d7fe03f6eae09938f4932004b30d80c3b40 |     
loongarch64  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/72fb7b263b8b6fd8b0e349db2dbe5af13e16e5e5 |     
  powerpc    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/03f64bd03922b0ac962aec2717e8b2f35c6b4e64 |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/1a9896d0b3bdf9676d1750f78f22fa626acb6b3c |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/aeeb98c03e7b73cd3e4d34e4e5d78042f7578221 |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/2845f7ea4feae9e02fdf2a56cfa4b9fa2b7f429a |     
    m68k     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/fac4e275a6b60274e316ab35168b5be4b29d1a95 |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/32ba253b899b630ebd4a4d7fc7ff0524da0340cc |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/a2c5ff7f98bce45ce17ceaaeb5428e2bc54a2f08 |     
  powerpc    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/76efe25bf3b5b24408e470786792527654bca3fd |     
   xtensa    |           frr-10.5.3           | NOK | https://autobuild.buildroot.org/results/0b9203da3a0c36e789f8a3c74b7aba5cf6a03200 |     
   s390x     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/344b820953e60cfcef571ef7376a10c7fc8583da |     
   sparc     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/ddd38368a0360dea03083d468c36624b1cc6cf11 |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e1869209ced0a151ca28c338da439edf5eede95f | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5461b81ed05958fc7055a19c21aef9e764c58073 | ORPH
    arc      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d7dee86d01a5a51c8f436bd17c61c0864d22a579 | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/8dd9b411fadc934669a51d3a840bd90fc2b4ff18 |     
    i686     |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/228f85a2b483833b76c04d2d57074b2115e918a1 |     
powerpc64le  |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/05229eb8835795bd9cfa3283ffe52e363056b60a |     
 microblaze  |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/36c85c1c29847b1d8f22ad381f1bd43d9f6fc659 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/0a5d7765304d8706af8dbdb37d3a632a7af96320 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/44b204b6ea8db4c64b063aa123a22b093ae6b8f8 | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/305be2c0daa1bdd3f48bccd073606aa26b59721e | ORPH
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/331edcae4b71cb8fde904df02250ab10404d9403 | ORPH
    or1k     |        harfbuzz-13.2.1         | NOK | https://autobuild.buildroot.org/results/96b7bb0d3114c426303fd024f467ca88081c6ac0 |     
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8be72234d149e14c33209085bdf0645d2624706c | ORPH
    hppa     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f22b29fa79be007d375914040c5f3a4b0474919e | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dfcaef1a4c41e1f30e41c11c8bb38530c685a313 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/85dd8b8ea271c705c2cb2080315ac929f9e2bb45 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fdb6ef791a1c450b5d944f46fb3366d6f9a12e0f | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7f4585bb67d1b75bedab30eed59e96ec578c01bc | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b0fe5bd6e67d419c9ced87f84e55865808317318 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0dce6fd059dcc085178065e1c55a88ae6fd4fe85 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e6ab432158299d92befd47b4744bb891b92ae4dc | ORPH
    hppa     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b48757f931256dfa3c9c294800232b90883617d7 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a9352737e5d263c04d7d33c5e2181812df3fdbfd | ORPH
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/aeccb561d0e124d14021c0537dfffecae5bed6fd |     
 powerpc64   |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/5ebe027f1e1e720f54b6fd86d2397018599094a9 |     
    or1k     |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/729829b4094a192fae8b0dcb6543b76de17bfe51 |     
  powerpc    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/25f551d44fa03739821e1d5b8bad9410458e9302 |     
 powerpc64   |    host-libunistring-1.4.2     | NOK | https://autobuild.buildroot.org/results/e3f373a807d49a7f4088a84b5ad72ddbae3c98e2 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/dc19260c69562b45a818e61af24d580206b8f01f |     
    sh4a     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/1958429106a940a01c871f019798d621b1c86e31 |     
   sparc     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/533bff690705b77306c237d5e5a4d2e02196db16 |     
    arc      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/3ed5c4da0e6cee2f6693b0df2f4f93ea64352004 | ORPH
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e58158641baf9ffed29566315d9760a64014b7e5 | ORPH
    sh4a     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b7740bf720b9ae4aae91d6189a1e612edeb72095 | ORPH
  aarch64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/d755ae6e99de7267854e45414c6c7b8981c15296 |     
    mips     |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/5e15180facc2a7230d825bf63fc0f6f5665926e3 |     
 powerpc64   |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/18f40c3959cc383b19837133c216cc3f69fb2525 |     
    arc      |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/bd71f536bff16cf56a187b8200440013aaa97dd2 |     
loongarch64  |    host-uboot-tools-2026.01    | NOK | https://autobuild.buildroot.org/results/5eb86ba8987be5534e5760f3cdca0d585e812ae6 | ORPH
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/4b11b653eef918d3074f97491a48ad0aea320126 |     
   armeb     |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/1a608f4b2ba6f2dc4737d34710a742e63441c540 | ORPH
   s390x     |    host-xorriso-1.5.4.pl02     | NOK | https://autobuild.buildroot.org/results/49638914c68268a66ec95a7ad6962ebd5085c098 |     
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/c52535ea74303f91a3c7235ff6635bd8ca911b0b |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/ff00b448f810aec7060df55154ff13bafe872ef4 |     
microblazeel | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/a420326aa2d88fb35c2fcfe88c71eb6ba787a3a9 |     
powerpc64le  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/ddd37dc147eaed234a40017cb80774e6252addce |     
   armeb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/0ed25a05fd5dad81510fe7f567b5f56b4afcc644 |     
    mips     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/6d65bf6f24314f0a7945a932cf864d674722322d |     
    m68k     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/90d5c9d7578de214235fbe4f84f9ca9827644ed5 |     
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/259e368bde0e01c7651ee82e28329f72c30e19aa |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c48b46e266ff113c6a4667ae309d3dbe684cbe85 |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/2a89ccee8f27f06e72c54b86335c30026c1ce90b |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/dd071c40dad7a44e7c1c3d2e514ac7c4e4775a36 |     
loongarch64  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/cb8f4dc70976cb825ea1aa1e251af0f7507d96a2 |     
microblazeel | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/17b41bab4e0eb54b79b627c0cac6698d83a99fff |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/90f0b356dbeab2040d6b8fa400d8d2d5202cfedc |     
    mips     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/df4226164c102389a431ad6c3e07e8b0a7b91365 |     
    hppa     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/a5d33fa457733725771e079e1cacd4c5757a7fd4 |     
    or1k     |          libgudev-238          | NOK | https://autobuild.buildroot.org/results/ba02bf3911a1f6d3b2316009b19cf3b027056e4a |     
    m68k     |        libinput-1.31.0         | NOK | https://autobuild.buildroot.org/results/01ac6ac4f4d35c5deebb4843923d7d8a4408bd0b | ORPH
    arc      |         libkrb5-1.22.2         | NOK | https://autobuild.buildroot.org/results/c5fbf01740338df7501740e256df6a06d724f371 |     
  aarch64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/41ac9179a2569544f74aa58d8e755f9997ba42c8 | ORPH
    arc      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/6dff22eec2eeb36420fbbc2e7f6af27676b7567a | ORPH
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/ddc4fbe217beab4beadc1793b04a170a512bb5f2 | ORPH
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/e68a60c24e044a5da63a64de189ee2d5b234812a | ORPH
powerpc64le  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/61ae862615af17b09ac8e5a44dd4952144cc7a90 | ORPH
  riscv64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/ef2d5c56ee3cc0f715c7190d6f22ff107e18d49a | ORPH
  aarch64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/b3bd2995ff88bd0e0c20af440c6c10323601fb2f | ORPH
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/284e0fe63ee04b884f5d23e7ef2d2870fb9ba84a | ORPH
loongarch64  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/e3f1ce548b8562227a9edbde67929222d985d71b | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/c85a61b6e1aa13ef81d990829308308e3938c6d4 | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/8cffda3efe5d45f84fbcd20cc43ba0c0159c6257 | ORPH
  powerpc    |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/f4144fcd22997a5c64db847b486933726dd2cdf8 |     
 powerpc64   |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/8371df73bd9e3390c03161a71e3758c81d7362a9 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/fd88a07a740b4b3f599e102343d17c977c689f67 | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b22fa237501f1613efd08f071c67f4199eff7cdc |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a81608f98b219241987cda5979e1466357e21f64 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6a292a9c26ce6f362d0bfbeeda855eec50a01c8b |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/76b918c52335be73cd28fac9476390b3c5dfc253 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/213271c9061bbea72617e91c4cb1a61ffdae0854 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/80af421575c05bd4a19f4cf0574ee26261aace06 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/fc1aae1d5b353a165819a99a36fd4a46e59a69b0 |     
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/6dfc11a10ad4f07eeafaf98980c846de1dfe50c3 |     
    m68k     |         libzip-1.11.4          | NOK | https://autobuild.buildroot.org/results/9c246c82a03e213bd75adef5b71a6e4c1b814651 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/af9f410b93448a4f6569b6cfdbf76a508c858a49 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/b820cb647dbcff7c683fa19b04d25e75fff96254 | ORPH
   s390x     |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/cda2514127f1aac68a8ed16fa2a13bba77073e3a |     
    arm      |         linux-headers          | TIM | https://autobuild.buildroot.org/results/78acc1cb8e0f8e950b4fcc1f8c2ebd832f59cdb5 |     
 microblaze  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/bf13abcfb953be47e670cadad033c898fba02b91 |     
   xtensa    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/a922f1fa7beddac04e526fb273814ade5bf7292d |     
  riscv64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/bac8e6bf503132d36b6c880442a87f2da7b4ed3b |     
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/2a95fa3e0b95d113758bd834e29192dddb778fa6 |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/05858fd1e814444413f94d07130bbb87e645ae0a |     
   mipsel    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/cd45a2cf68208b7303e5a72e940e38a806615e81 |     
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/667ac107dbf32547fa53d77e26e21ed024886b7b |     
microblazeel |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/8907351560fa361666b4e32c0c39c9520f9e4882 |     
  sparc64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/ed3f6904274b3f851dbe5473761aedbc0bdaafff |     
microblazeel |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/58dd1aacc2661087e520108b5a701e077d71c652 |     
   s390x     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/5afbb8112f4270d20e5c0cad79925fc5279af05c |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4cde79230f9aa0909aaa83dd31078b79f7359d2e |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/cef24a4990c1274060ead6eb4bdc414bf3099842 |     
   mipsel    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0a060d48de0d5e0fcb9f5604c4e3e6c2eb5a8407 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0818391be472a54df9738ec1f728f36d6d7c89d1 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/dbe9b3a021781624afdb290939ad57901b3f3a81 |     
  powerpc    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/bc8c89cb6c07699bd38b0f8f9146e02abb896758 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/ab59dc9ab508367ed60beb5e5b10f640439a24bd | ORPH
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/51f2f2e788ecc442afc6205d6236da920ee4bcfb | ORPH
   mipsel    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/6ba212d12b1dde54126078ab0ae7258c56565a1f | ORPH
   s390x     |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/08ab95fe5fc003fd599f1e219ca17ad68ee39c74 |     
    i686     |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/c609321bdfa5ace00939739787fa590ce22447f1 |     
    i686     |          redis-8.4.0           | NOK | https://autobuild.buildroot.org/results/44eed9506a09b16122a7b63367f099a6be79e7e1 |     
 powerpc64   | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/4dd2a3349ca6adcc6d201cb6d85f4836f0f3358b |     
   x86_64    |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/0f2e1039bfaae53d0f50cc934a31d30b34ee0c7a |     
  sparc64    |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/73b6bb9cd9a0fe87344ceadeda802c28b28e8b5d |     
    hppa     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/42c4e95f47cada70a5727987bf9cd1a10370ef7f |     
   mips64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/dc0a94c19bc78d9de45f91f4c059015ac2eb8625 | ORPH
microblazeel |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/a208dfc8a816ac70d96f4458d75a591da70bf70f | ORPH
    mips     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/38cc33f82384f0945b2de852ee0351fc99f32fa0 | ORPH
   s390x     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/6f72d648680ebf2c8055b97d1a484a8e029d736b |     
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/1c30ddb5fd6cd0e3e5fb2651bd632b3779c4aef9 |     
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/282d9d19ba8eca7fb007a4b017cf7fa4b20db546 |     
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/4fa22c2b46a5afc4195cd1a16558e4addeb91130 |     
  aarch64    |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/088c72c67f56d3480f0d6dbc575eb2d225ecbbd4 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a526fa638eae5aab5702ca9bfdf0fb1a476c39cb |     
   mipsel    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/d89bad868866a096bd2dbd2e65960a437d7882c9 | ORPH
   mips64    |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/431a7ed01634e3c97f80df94ebf0fb36486e5c75 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/15b73ba20de380c287e205980d1322ac82abe4ae |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d9bf3ddb1beab0d74c384680b596715c9917f4e5 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/90a54cf6bc6af30d229c1ecfcdb0d0e1c2d6822f |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1d9852ddddc96ead5fdf31374461558de82e7d6d |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ecd755117395b4c770b17fb94e1acf946845daed |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/acd70d251a80e089e25fcf190473b95357f2a742 |     
 aarch64_be  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/4ba123777bf435fd1ad32dc6f4dc59e579c43983 | ORPH
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/0f781a073c916076195d29401bdeee18a0a90ed5 | ORPH
powerpc64le  |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/7a5e08652c07a99f29ebd02ad4e36683405b491f |     
   x86_64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/e7d396dd757ec56b9357cf99478f1d53aa97ec2c |     
 microblaze  |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/ca20c2f327996ee77262285f7b8bd90e5bf2864b |     
    i586     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/7d96a162a1c9d212e5f99dc1be9789f2b054785d |     
    i586     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/f5262cb0158ad77571e4e7fa4ac77734bc17dcf7 |     
 aarch64_be  |     util-linux-libs-2.41.3     | NOK | https://autobuild.buildroot.org/results/bb6d41c743c1baecc36b32ef66227238e03c0389 |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/a2730812e1e2a01e8fc911b1ab1997c711f965a3 | ORPH
    i686     |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/c9d1e6bdd70c44341696a05c349204b16cfd1d42 |     
    m68k     |            zsh-5.9             | NOK | https://autobuild.buildroot.org/results/370818d0da0ce54fdd4b834b86e7a64b6aba195e |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

host-gobject-introspection-... | 2 
        ltp-testsuite-20250530 | 2 
package/linux-headers/linux... | 2 
                  dpdk-24.11.3 | 1 
                  giflib-5.2.2 | 1 
            host-coreutils-9.8 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.88.0 | 1 
 host-softether-4.30-9700-beta | 1 
               libglib2-2.86.1 | 1 
                 libmbus-0.9.0 | 1 
               linux-pam-1.6.1 | 1 
                openswan-3.0.0 | 1 
             strongswan-5.9.14 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          dpdk-24.11.3          | NOK | https://autobuild.buildroot.org/results/4a5e52e871e85640a1154758e318382f48ffc94e |     
    m68k     |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/1314ea648fc1744e8e74e13586ea3c9e1478fe86 |     
 powerpc64   |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/a56a62f849ddbd62af634cc388b3e51d2020e54d | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6cca08b6f87edfae671a6c3deb85b116fe644331 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fb1161aa84a5dd369ec12bc67d5be6f09cf382c6 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8db4371b78ce0a2fdf12a719341757d51adea126 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/79734f55bb3e66c67d257c7eeb649cfcd31c11ed |     
    sh4      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/4aca1a32fe1baa6a488716c28ce916a260a30130 |     
    m68k     |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/14c9db8fd914f0d9cc5e97e6c9d96c57c87f6afa |     
 microblaze  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/fa7ed8631d050068999a8049a141bb5c9f705f76 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/e325f1da57c9dd125a6250557d30b7bb4c9827d7 | ORPH
loongarch64  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/6e2a86ce3b1b52a00c3abe4a01a88f6c9664404f |     
   mipsel    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/3b0b0e55938b8c66296f08ff9f97e0353b52c200 |     
 microblaze  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/302660c0cacc0d3e69f9eb5220f8e84ce9993500 | ORPH
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/d65362d29e9b35d056ac827f644d8916a1c87143 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/a9c1d5fbec6dc09a4869e57e5df2186079b34967 |     
 microblaze  |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/a1b6408dbcfda252299ab0a4b20eebb69f16360d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-faketime-0.9.10 | 5 
        host-python-lxml-5.3.0 | 5 
              libopenssl-3.4.4 | 4 
                  ffmpeg-6.1.3 | 2 
host-binutils-arc-2023.09-r... | 2 
              host-pahole-1.27 | 2 
leafnode2-9543ffaf82406f943... | 2 
        ltp-testsuite-20250130 | 2 
package/linux-headers/linux... | 2 
                       unknown | 2 
             bmap-writer-1.0.2 | 1 
             connman-gtk-1.1.1 | 1 
                    ficl-4.1.0 | 1 
                  giflib-5.2.2 | 1 
         host-gcc-final-13.4.0 | 1 
              host-rust-1.82.0 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20250127.0 | 1 
     libphidget-2.1.9.20190409 | 1 
            libxkbcommon-1.9.2 | 1 
                 linux-6.12.77 | 1 
               openblas-0.3.30 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
                    qemu-9.2.0 | 1 
                   swipl-9.2.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/344288a16a37985a0a3dde72051dae70065b391e |     
    arm      |       connman-gtk-1.1.1        | NOK | https://autobuild.buildroot.org/results/f1b017cdd739aa00750d2bf62ee43716a507673e |     
microblazeel |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/a45d39632d9a8ea1e6fed14938af43fba32d3655 |     
  sparc64    |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/909049e2960e7c38321b77de0935542f7c91fd21 |     
   mips64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/b38d435f049755ce8a014798dace8dada9f0d26a |     
  mips64el   |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/d9ebaba0ece47be681badbf0fa3a3689a6761393 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a3627a56cd50a8fbd8bf63fb6025df132eaa84f1 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/81ab1ff710a957c8d220958faee1e4dabf03e378 |     
 powerpc64   |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/793d76ddef057b5106947fe57c92590eb1328767 | ORPH
    m68k     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/3a6bf8999759e59b7c4305c7c48b177fb806af2b | ORPH
   xtensa    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/5639ab662639c853bda98f418f78396712792b16 | ORPH
    arc      |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/0c37e91f4b79ee7f2a15d6458b77c2fe3deefee1 | ORPH
 aarch64_be  |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/9e80d7ba94c2f31778c4d1daa43eb4d3968038bb | ORPH
   arceb     |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/10083fae82c3883b60ef6adf5e1a85fd2971982f |     
  powerpc    |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/984735cab5a436ce50ee4ee65dfa62c1eeb02d2a |     
   mips64    |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/dce09ae1f89b27ca5d51eeb073e21cdd52370ab4 |     
   s390x     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/dc0d89927d46b47c198130989e7c21436fe38edc |     
    sh4      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c0d97b7f865d595ddfd10875c889427f10b49df1 |     
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/7734ba3d0b94a38927f8e63349f69263411d4b93 |     
microblazeel |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/4355cdbb3a9604c9ad88e315e8a1b82ca0160641 |     
microblazeel |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c3abdc3dcf776535035bf5c882a19cea4bb64aa9 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ab6540719fc63dd0a03d4d952334fed177a551d3 |     
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/8b7ce86bf1279b39419e3130dca4efb68372d3ff | ORPH
  powerpc    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/07cb2f533d9c70d4e4e8c75f6326bc67e91b9736 |     
   sparc     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/38265b6662eb79b63924a550f6865c0a1f281c7f |     
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/bc2e4c08f64b8f5beafc05eda34a57c717630cb8 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/9122da428cb1769b1b633bfbf802fa8659374ed7 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/714ec168a2864e592fc3886b022c58291f131b7d | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/f9118a71fc31bbc9d18f51900ee1db200679b065 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/134a1a8675823efcbafb9a8356c4e4cd0ae9cd09 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/15334e6995d9fac2feb316c9b827b57027dd8cf2 |     
    m68k     |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/5ec8372f1ea32795e7da482766451471ade68491 |     
    arc      |         linux-6.12.77          | NOK | https://autobuild.buildroot.org/results/2747028d45ccdbe609d0dced43bf9196e0404605 | ORPH
    sh4a     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/828a60c73e77a682cfa6051e83a5147b2ee52247 |     
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/8e5186201cad07692ee056b01608411a12b22c38 |     
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/29e028aaacd37a360debaf29b15f03ea18475088 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/0e276fde84c1cb2d41898d84a8a6d9184ec91faa | ORPH
  powerpc    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/995b0b7c4d15c27622a062156d5872a110eed32f |     
  sparc64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/11973a54ac79d6a53552cf90e0f7b93faec3667e |     
   xtensa    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/2335876087f85a75e13d34e301887077659ad1d6 |     
   mipsel    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c007e468b3854f5aa2e7ab0870a9e1c624a7cbc0 |     
   mipsel    |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/af63498f99f58427b2b74b8e0ff57f45692b8c96 |     
 aarch64_be  |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/1788e3c1d6191c1ac8155eb430ed73596631c46c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/997987a1cc5aa1a2e2c38ed976d223c73ff57e2e |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/d76920fd2f892da2eeade78953714a742b7048a1 |     


Gitlab CI results for 2026-03-31
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...onPy3SdbusModemmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/13715450291 | ORPH 
    TestHostPythonPyfatfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13715447885 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/13715446306 |      
         TestHostPythonFs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13715444208 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215948 |      
           TestPodmanTini | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215942 | ORPH 
  TestPodmanSlirpNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215941 | ORPH 
  TestPodmanSlirpIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215940 | ORPH 
       TestPodmanNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215939 | ORPH 
       TestPodmanIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215938 | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215897 | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215883 |      
            TestJailhouse | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215697 |      
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215592 | ORPH 
                  TestXfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215502 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

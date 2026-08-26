Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2514DC61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 03:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BDE26070A;
	Wed, 26 Aug 2026 03:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBHEKOgkX_ec; Wed, 26 Aug 2026 03:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787714742;
	bh=9rrxNqQMIYOHbpDSHwmrCjIf1sv8t1WEvh2YTu6pNlM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ObNFtb43rcvDmSx6rIMMVmswNyaDXubWWDR+uRkmifqx1S58pywSb3fkDBpNDXl8G
	 fYfRROSUDe1buNNPrrpP+nFwKCqbes6XRclHJLPjZnXYzDWgncIElXIY86nFwUKGMl
	 26tiaaexnsSQW5S128hqDGAaDN4GVidDzQ0MxrUN9TnC8oCq/lLw9CSlfPa9uTn4MS
	 U7mw2eoe5dV4M7krRReccTG5/tN5Hk5sx9s6QReMEH2w0kYTxQeVdvVE9a31wUW+Ud
	 KNJOg5uK1rQV/05bN/jlxAk/Mw0C4st1DpqXSargensIJcki9xRoRgDhXHFhS+B61u
	 RR3vpY8zPEoPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CEB060603;
	Wed, 26 Aug 2026 03:25:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC997396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 03:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C364880B8C
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 03:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cohBaivrtbp for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 03:25:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qfx68HcK
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA24480B92
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 03:25:38 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c1f758014b8so38371566b.3
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787714736; x=1788319536; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fuKd3S+NcxIlTvIW4n15NFuuUYTRP/A2ZiMiZDrWt2Q=;
 b=qfx68HcKxkCQu7AsLmbnWBqVrd0YmRGf8e1KX/EE+FHaK1w4Qk0Uy4QQlYOuQL3UeS
 gCQr5rFY7Y5+ZAnKGniQ8B/zgLUgb+dPbLkZyg1QnUUs09Q9+3Ov12Hsb4b1AEj/HmfV
 PI889rVip5dTcBSiAxyjgZ8QZSftgRLRMObO5CWDg5aOE4XFjvxKUSgZhjko7VEdjiP3
 iNmwiwtQpIZqYnrVPMWX3wGote7h4HsV3o9GBCWw1c0TnAl2L9P1nHiNzknsBn5fXcZF
 VQ3gN4vlTv0iKkHt+E8J2XGz5uRWTC0UlgjRNzESaKJepMD/DFLNoyqs37HQ2WjCbYgW
 nxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787714736; x=1788319536;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fuKd3S+NcxIlTvIW4n15NFuuUYTRP/A2ZiMiZDrWt2Q=;
 b=myVXzNGSKhakSkDaEklkLBu1k5zVXKzAAfT1RMdvF+8smEKXDXfXULOauMbpwhfG67
 SNVYM0KGN1Y4IKVHdxMGgAYQxyuh/u63Klhz17A/Bx0Eiv8xCdnLRT8aNigpnPJOYZbI
 DrOR/Pnf2ynGvvevuO2fLStJ5M/MGltglol2KE5Rio3/mkVwxFpgiYT00tmCG6lZDYIz
 8rrGPDS7pGK1WzgssmkVPeVtlottjxX5xoHt6fuvQUnov07BXG+4mrBPo/sqAae6cAi7
 0rkkuWxpmsSbDMXaao5iJrVmSROhV+s0R9UOVBYerditO/ZfTK8p77LwwjBoa+SxeUCp
 2KIg==
X-Gm-Message-State: AFuF++l6IAtBaLJsO/+utjSjLZul8P9ikUnGoUh8EXr/YjH8YGVAJxtf
 kUpA1h0UFygEUWov09EL9BogdQEmXEnvVTvPAb7WnslHVsWw9znoJ6TXZxrpidvb
X-Gm-Gg: AR+sD10geRa7iPglcd+M6NWaShdbeYPLQVu8OisPPkHV4Bi4gMFzjRLWJA+hSnEK7np
 1D1mnySr8BQsj2ZlRB5bxlyKsZLz/YM8GkRWjNtoZgSRdv8u/KAI+KS8HdNLlRKJ4YofC/3RyUs
 LMaK4of4rJXZ9NNzArvj2/DIxxGbgahOQg7r37/aGq1wOiLv30GYL29ZdSUDcl9iApZUrGrZByu
 WE9A3ci9xwAZ57X7+fdAYo4mgrrqFwrBxhqCD2F0VkJ7zHvk0GsgEIvShKkjMGLq0cddPlN/8Hf
 hg4FGURIKtuLH7BE9vfV0MYiojK2WkA6VFNrdtPRZk2MoF8umQdFGyeRH1y62fZTMtx287LA/5T
 iSNHtYfrVSqrGDZqZS2Tj05fquSqappzRlo3pJem4RbSRGB0CMM3Dd1UA4U1bf6D72+BW7ds4Rg
 VWiNe8WmfyKOVPk2ks/0tRVXgpE+GvdActs3KEhbkLYpzklyiNjiSaPzoml3Y54cs=
X-Received: by 2002:a17:907:c48a:b0:c24:db68:ecfb with SMTP id
 a640c23a62f3a-c250c2ef777mr461343966b.11.1787714736068; 
 Tue, 25 Aug 2026 20:25:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9ef996sm326061366b.62.2026.08.25.20.25.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 20:25:35 -0700 (PDT)
Message-ID: <6a8e5caf.18d803df.18a5f0.9e1e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 26 Aug 2026 03:25:35 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-25
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

Autobuild statistics for 2026-08-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 25  |  0  | 34  |
  2026.05.x  |  3  | 12  |  0  | 15  |
    master   | 34  | 91  |  0  | 125 |
     next    |  4  |  8  |  0  | 12  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
                    olsr-0.9.8 | 4 
                   perl-5.42.3 | 4 
                   atop-2.13.0 | 3 
                    attr-2.6.0 | 3 
                    flex-2.6.4 | 3 
              fluidsynth-2.5.7 | 3 
  gobject-introspection-1.86.0 | 3 
      libabseil-cpp-20260107.1 | 3 
               linux-pam-1.7.2 | 3 
        ltp-testsuite-20260529 | 3 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
    host-gcc-bare-metal-16.2.0 | 2 
   openvmtools-11.3.5-18557794 | 2 
package/vim/vim.mk:87: vim-... | 2 
package/vim/vim.mk:88: host... | 2 
            18xx-ti-utils-R8.8 | 1 
                 avro-c-1.12.1 | 1 
               binutils-2.46.1 | 1 
                   bird-2.15.1 | 1 
                   ccrypt-1.11 | 1 
                cgilua-6.0.2-0 | 1 
dtv-scan-tables-15661aabc34... | 1 
        edk2-edk2-stable202602 | 1 
                      fio-3.42 | 1 
            gdk-pixbuf-2.42.12 | 1 
             gtkiostream-1.8.0 | 1 
                   gvfs-1.57.2 | 1 
          host-automake-1.16.5 | 1 
          host-binutils-2.45.1 | 1 
               host-parted-3.6 | 1 
          host-xfsprogs-6.19.0 | 1 
               libepoxy-1.5.10 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libmdbx-0.13.6 | 1 
          linux-5.10.254-cip72 | 1 
                  linux-7.1.10 | 1 
                   linux-tools | 1 
          lua-binaryheap-0.4-1 | 1 
                    lua-ev-1.5 | 1 
                  mender-3.5.3 | 1 
                 mesa3d-26.1.8 | 1 
                  newt-0.52.25 | 1 
               nushell-0.108.0 | 1 
                openssh-10.5p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                  pdmenu-1.3.6 | 1 
                  prboom-2.5.0 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
rtl8723ds-122a574f780da32bb... | 1 
                 rtl_433-25.02 | 1 
        s6-linux-utils-2.6.2.1 | 1 
               trousers-0.3.15 | 1 
                 uclibc-1.0.59 | 1 
uclibc-ng-test-132c6134d691... | 1 
                    which-2.23 | 1 
wilink-bt-firmware-43fca73c... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/1df56560ff6b364bdaea06c7daf469ff885558b8 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/7f6106a90d3021526f0cb5ae19fcc2512478461d |     
powerpc64le  |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/989dfa10ed0d23b2f152346b460ebf3261b62c29 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/c90bc8e9243532847cf8ad61bedc698bdb3820f5 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/10926ccaf3d3212d8816f5156ae2405b469195aa |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/488af0fc8ba774f06e44ab78977db3b6ec4a9b6b |     
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/4788ecede976baef677cf9d35f5fe7442a22ead8 |     
powerpc64le  |         avro-c-1.12.1          | NOK | https://autobuild.buildroot.org/results/e4c0652f13650d07d390dccd994976c2a779cf2a |     
    mips     |        binutils-2.46.1         | NOK | https://autobuild.buildroot.org/results/77405663af58c02f96d063a17d83dbf3875842ca |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/ecb88487db0632529a6cd8909cf16bfd255be071 |     
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/b6ae132b5532551865f242cee4c95a894bdaae2e | ORPH
    i686     |         cgilua-6.0.2-0         | NOK | https://autobuild.buildroot.org/results/8acaac4b111e8c6877b03d1cffcfb3d3e9920e0a |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/981dd8bbf0f44352d4285cb139fff1fe646d98d3 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ed73aa844a18cfc15e942ced4ae363c3d0d09015 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/79152e6bc56bf33c8291a25e7311a34183ea9bc1 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/bc39fdf7ee809637ace3d1a18238589358897a9a | ORPH
  aarch64    | dtv-scan-tables-15661aabc34... | NOK | https://autobuild.buildroot.org/results/41f1480760306dc108096c4fdb3affc829355baf |     
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/169e779562367e37b96861df0aba79375b77c81c |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/800320deedf5d77ccf588d2d52e6cf63cb66386e |     
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/a4a9bd0ba8f73146f4b3937420d2eaa885089ff6 | ORPH
  riscv64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/94a7b27866f6fd3f0d1375ef5fc9256a5c8a3640 | ORPH
   x86_64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8fa35192022bc808ce330078849eb4de33a9bdb2 | ORPH
  aarch64    |        fluidsynth-2.5.7        | NOK | https://autobuild.buildroot.org/results/cf5168fd11a10339328c4f07e7bd4feeafc4bc02 |     
    arm      |        fluidsynth-2.5.7        | NOK | https://autobuild.buildroot.org/results/f1f91e0a05630e8be3e1f4889d519e1c924688f3 |     
    i686     |        fluidsynth-2.5.7        | NOK | https://autobuild.buildroot.org/results/fe1765da178f890ca3eb011392bf3f941b72c020 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/c2a7d8d868a997a9d9ab293e6e4de9088211254d | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/8a47815da30d827fc96bd0442f3fce8829648eed | ORPH
   x86_64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/dc4b8e2a12d365996e9335ea5fd852594dcdb9f0 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/8862ea24849bd7b3e35898b7791b8c2a3770bd73 | ORPH
    i686     |       gtkiostream-1.8.0        | NOK | https://autobuild.buildroot.org/results/2eabf4ad1e4dd858e96a8ea5e48df8b1a22b2bb2 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/dd95f0a26e1631943eeb4475fbc46b97c4464177 | ORPH
    i686     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/87bda8e779015042f8ccf9b1061cd4994b6f491e | ORPH
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/33d779f72e824d79b50ec702755811dc7f15fe7a |     
    i686     |   host-gcc-bare-metal-16.2.0   | NOK | https://autobuild.buildroot.org/results/372b512f48965ca37de8c203c14c4b3a31cb31e6 |     
  mips64el   |   host-gcc-bare-metal-16.2.0   | NOK | https://autobuild.buildroot.org/results/1059c4695e8755afe1c9ea14d9f012c972a93218 |     
    arm      |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/2608ccad08d41831e93333efe6dc1cf9f9cdb647 |     
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/2d5428ffd230db055ba514f962e6897eba83afcc | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/38a2b02e1fadbfaec77ba13a75d250ae068f12f2 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/b9b14ca689fc1483148f36c1f43dd68f470e5189 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/328a30aa3325a3fbed3696c565dabbc2cf9e9bcb |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/b2d9830e0d871fb331cc4f0abeda72d98c3ddccb |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/cb0b8f1d99c2924fc41e4f86eeb37dd97ec0ecd0 |     
    hppa     |         libmdbx-0.13.6         | NOK | https://autobuild.buildroot.org/results/8ecba6641f2751c4497c208050f9bb2d8b3ce607 |     
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/1c8996326a609025a55c24b4c8066681834f2a5b | ORPH
    i686     |          linux-7.1.10          | NOK | https://autobuild.buildroot.org/results/af760070c0f96399aea30bd3a7dd435368f5ff85 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/0819558e324ac1eef7410e819f406999af11b92b | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4b7250897729b1f2afb15ae2c3acdbd6c42a28fd | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/2aef2323d1e564d3699f96df6a2b708b2d3fcfdf | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9b8ddcde7f3b67a58ea785283008f92491cb5d23 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/b74ef838fce0d0e0ca65386aaea7169ff35ad2e5 |     
  mips64el   |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/63ce68cea56a2175c96fcf242d70b8c7fa8ba8ec |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/73fd173439102a9c066611f739bb2a998e4e96c6 |     
    i686     |      lua-binaryheap-0.4-1      | NOK | https://autobuild.buildroot.org/results/e7b1872106c78ab8b3ead4ca60e483cacbac1428 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/904cf7a751bb5936a219de805f74978ebfa03dcf |     
    i686     |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/b31f6f67f2a933f0104984be3be5cb33a77aa349 |     
    i686     |         mesa3d-26.1.8          | NOK | https://autobuild.buildroot.org/results/baa718e140264a9aa64c3a8f4114ca1b05f740e3 |     
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/04c3c2df411efe8528e6da3cd09596b72079d48e | ORPH
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/13114022fcdc5cd07d1afe62eaf70fe1431b4381 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/e9493fd18a28f378ec5ab06fad77687b3fc5264f | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/fdde98e122171be3d6e75f156e5a2f4a0a2c5bba | ORPH
    arm      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/89973264e290801c58e2bc7ea4aae442fe0660da | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/9596ab93223dab798b29e861f61a22f3aae02117 | ORPH
    i686     |         openssh-10.5p1         | NOK | https://autobuild.buildroot.org/results/1a9bac344defa32f14935c4d1de234e1b39a5b09 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/111ad866399c795dbe06a70abababd08a53ae9b6 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/a384796fb5e7d010e1cae98b60c9e130db0d9ff0 |     
    i686     | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/2bf954ff799e30e8add4cb5597843596e2b73b71 |     
    i686     | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/c4ccf3a2fedca12fe7732d81c817486f7aa000e3 |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/efcf6b19958ac42bd8e22fc5f8895ec755a28a98 |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/53001fdf3f5e8e97c5f889dda3e227ed76df5a65 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6fdb6a683011de7ad6eb371de7a435c02cec5cc5 | ORPH
  mips64el   |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/8f06098f7455edfb7b2bf02993e27e9afb27a583 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/e6c288f583d9706fb85abe4b5cbb90b8dbe922ac |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/15f3d019c435a1cdf315584bb42566583c6f9e2f |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/fa0dddaff4f1a82c81dcfcaf0902ef07b294ab53 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/43f6e865cca9668fce0c5f17e65572a3a75dcc43 |     
  riscv64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/eb9e86480e400f0b833c2225e038acbd7c3a3f8f | ORPH
    i686     | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/d9c8fecb70986a7cc6c2877da87ea899f10507fc |     
 microblaze  | rtl8723ds-122a574f780da32bb... | NOK | https://autobuild.buildroot.org/results/08e6f5e1b095143c0c9c08ebf1e224847e7b46cd |     
    arm      |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/217dc1e42c42252e8128d4f5fc7152508144ccc5 |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/a4ab5c758750fc43022dd720dc905447a2a131f9 |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/5c0f1efb0974e0895e5472057d1b5558e598e527 |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/17857a8b8d69555f86421b340423b94b39c1747f |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/a5f1cd60336773a17df0e316ec04274b851823e1 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/bef0c7ceb5b11de423ae635f37781767fc3dc987 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/53e97b9ecef43f3cb9e9d3edec954f28545a3895 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/60c4f8406cc4d283b4502ca3766908e3afa0f6c0 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8a1d5dce0169ecac543836d9222c42ff7d3f4818 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ef95577f8e8eac65b85e93b7867181f756d1f066 |     
    i686     |           which-2.23           | NOK | https://autobuild.buildroot.org/results/829532e184e3c51b22b9d8ea1f2f076fd6fd1d94 | ORPH
  mips64el   | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/773e9d8c552d6d73074084929d82a5bffab4f8aa | ORPH
   x86_64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/50a6278644236cf35fc5a4ce8f286dbb52ec3530 |     


Classification of failures by reason for next
---------------------------------------------

                  aespipe-2.4j | 1 
                   bird-2.15.1 | 1 
                host-gmp-6.3.0 | 1 
            host-go-src-1.26.6 | 1 
                   linux-tools | 1 
package/vim/vim.mk:88: host... | 1 
                   s6-2.13.1.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          aespipe-2.4j          | NOK | https://autobuild.buildroot.org/results/3fba9bef018e9f3349280b504dda5e5fe67d06d5 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/ded2897624beef82ebdee2b694c68b6cce6ebcf1 |     
    i686     |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/5970262b3bfdc9320c97b080c4e14b9766536d95 | ORPH
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/2ebe1ca06340ec3db18e3137f5078ee5917aee5e |     
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/64aa24d643be2ddbc6021690c38ef345a8cc0762 | ORPH
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/511c7de6773b42e75d726eb4d8b1566dbf4db09c |     
    i686     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/ad1ce418bcf07ce11724e1db2b6c64522470c9ca |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c219544637ed1f454d746b528c6ae4604e6c8470 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
             docker-cli-28.3.3 | 1 
        edk2-edk2-stable202602 | 1 
  gobject-introspection-1.84.0 | 1 
          host-automake-1.16.5 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
               libsigsegv-2.14 | 1 
              openjdk-21.0.4+7 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.3 | 1 
          qt6declarative-6.9.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/01067c407d09b51bb07c2e4eba6e42fb52ee0ec9 | ORPH
  riscv64    |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/75bbbdf07884e2f68ed62ce2e4cf8505624bdc5a |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/05aa47f17700960ffe75bc67f3de245bbbceaf11 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/dfc1a581118008bfa9508bace9d8d3a48ae671d1 | ORPH
    i686     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/b722eaef0a95793cb6e91e165e710195e0467166 | ORPH
  riscv64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/63ab4f1412df4da095a4f580ba25793844db6c57 | ORPH
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/1ca4d6c7a08695fb2cf4743b16259df54ed517d7 |     
    arm      |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/063c0f1cc775f295d840e3250a8a5b7f02455e20 |     
    i686     |        openjdk-21.0.4+7        | NOK | https://autobuild.buildroot.org/results/001e23531429825071ce8e6c0db82341fa11aede |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/d8982239cbf9f9ff8d08db0f4471049d5a8c4d32 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/3e47ade0963642988fd8e1be9a6e8042700619ec |     
powerpc64le  |      qt6declarative-6.9.1      | NOK | https://autobuild.buildroot.org/results/72c956fdf982382d2981c649c456d1edc2c9d6b2 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 3 
 host-softether-4.30-9700-beta | 2 
package/vim/vim.mk:88: host... | 2 
                 avro-c-1.12.0 | 1 
                    bat-0.25.0 | 1 
          cloudflared-2025.1.0 | 1 
             containerd-2.0.11 | 1 
                  delve-1.22.1 | 1 
      docker-cli-buildx-0.16.1 | 1 
                    fcft-3.1.8 | 1 
                     gdbm-1.24 | 1 
  gobject-introspection-1.82.0 | 1 
                     gsl-2.7.1 | 1 
              libmodbus-3.1.11 | 1 
                 openssh-9.9p2 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.5 | 1 
             python-lxml-5.3.0 | 1 
rtl8723bu-af3a408d6399655b0... | 1 
                       unknown | 1 
                     wine-10.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         avro-c-1.12.0          | NOK | https://autobuild.buildroot.org/results/6f38cb95d4d2a4b7e14330b0f519ee17ddbb4ad4 |     
    i686     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/4698f0f81e2205f85c2570cb0166c71c4dc0d874 |     
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/372171bcc268f9c0f9f5336a1457e83927ab43cb |     
    i686     |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/e69a11c78c288fc99a821723e641dc9d293c888d |     
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/87443a1dc1697215dfa3e609e26be4a5d4424169 |     
    i686     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/f71fbec0302d1314e391f2a3d5000adc6a3a9b3f | ORPH
    i686     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/f4ff24facd4acb7ffadca151fa3a7997b03b9481 | ORPH
powerpc64le  |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/22b44e1579de6876ef388bc517326e38b6ac8a79 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/4214a7009021fcfaeacb5dc9ff1c84e79bfc975e | ORPH
    i686     |           gsl-2.7.1            | NOK | https://autobuild.buildroot.org/results/03a6a79697d20763dfa602e9f006d1af3cdf9c35 | ORPH
   arceb     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/e5d1004ce92fedea25248d3e83286a3598bb2142 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/cff07b232beafa07e181896023df9e2d6ad456c1 |     
   x86_64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/e2adb6a304cd062bdcdabe93bf41c3da4dd4596c |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/08f07e4eeb13eb2ffe182328318953c8f5cb8d20 |     
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/84a3bde83f32ab8b0bd2f65f752e27ea2441edd2 |     
powerpc64le  |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/d5dcbbf31ed69e7d59443777f3df4e0307fd0a18 |     
  mips64el   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/3a6f90c277967b7168ddd321c37fb41fcb7a49f9 | ORPH
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/67a8e8ef62e9d1cde88f3b54665dbdeca0d00aeb |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/0ef5d611c5ccba185dfb72b00b208c688087e9fd |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/f7e6f6712aaf38b07b3aef9e875ab0549cbb270c |     
    i586     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/4d93f2da52a1e66631e84f02ed12a05873a88857 |     
    i686     |       python-lxml-5.3.0        | NOK | https://autobuild.buildroot.org/results/23ff9def11f3e56bf29fca162b3a3dab3ed5552e |     
    i586     | rtl8723bu-af3a408d6399655b0... | NOK | https://autobuild.buildroot.org/results/d7b3687ad260ed3234e1be65361c1d665d9c9dff |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/73fbb8ad43726e54a1c7c01a7bf7fb6cd7998340 |     
    i686     |           wine-10.0            | NOK | https://autobuild.buildroot.org/results/903354f69bf1c2729adf4832c479ef5719e3c5bb |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

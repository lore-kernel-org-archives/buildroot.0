Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23854C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 03:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46CA240C1F;
	Sat, 22 Aug 2026 03:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEVf1PbEXzDY; Sat, 22 Aug 2026 03:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787369291;
	bh=nrUVPfA0u4oXrsP3Xjoj/7GCoad26upYgOls+UK3DjI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q3RFYiI5SDvbAUWY3SGcmLm9LZAW52eDaO/jNHP/+7voVeZYgr/rgrRYhniAPlyJ6
	 uyOyHvjling8fXmSEplSPqH2xOiirc9WC893rTyIh+UpB+vhjUoq+NHWdQDx4YUW2A
	 Ss4sFDaXIWiMv/LMxgzExQ9WJBU5cwhhtT6JjZE6DHdhv7zTqUeaUgBw9CwbT2N4sk
	 ZJxHe3m+AKZI26J5b6W7pXWu+uX3axbtw2r2ox6dEQWhfNyn15iFiIu1X+KcmZc0Tg
	 aVww+12yG2/TjIiQgKl/9LGJV2YZgK2nQQida5q9WKITihBzZQDSJshsH9SDRq2O+F
	 X6bXmuBtTamhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AE9040C22;
	Sat, 22 Aug 2026 03:28:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98944118
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 03:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B20B81297
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 03:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3J9WG9rsQeWE for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 03:28:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=d2lZFVWX
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A9158128D
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 03:28:04 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-698ae09e356so2640187a12.2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787369283; x=1787974083; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=m9EMhg4CmQRF/MkzwBPs7z0q8TJhRqZB15uVuKQfazw=;
 b=d2lZFVWXwJgQbJAIldvNl90CJRU3S+rdbbfzU3vlyCEySqiCEVm5rSzDq0yJedEaY0
 U13nITcG2qs5Ah6gbTipP/0besh354dwNQv+2neN5AFLILd8lNUX9V5x+pct4rfGN6RN
 0uNen62djCGf4v7JlpS3xj4pMKfqjisrqlWXX/gzQU71FJyreUYCk3jkykOj1qB+v0C7
 EACTvhg26oAQf8XRCbAQe/lvpEtG9Uq7+0whjLbjGeRVavaytJirX+41PgsuhJBsxNaz
 NRk+yfq6cQVRviurCbiFCsE06XlVvOx+ntvR6XVR2OuSQMXysLsl2HLjBlOtzz8Spi8K
 NYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787369283; x=1787974083;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=m9EMhg4CmQRF/MkzwBPs7z0q8TJhRqZB15uVuKQfazw=;
 b=OD6ib1msjrIKxNpZZGD5FK+FHuh5AgHWSj/Z4PHUmlE1USuDRjCTmd5hWTGrNo0e/D
 Q9L/lBOT5iftB6QFx1js5UY5ZbucSKtx0qCc6P4ciIOpEhNV8XC2Sa30pq6Wn+ZqjWh4
 KrLUjKDJUO3gcq+r+fpiM8aKoZH5P4+K5ljRUGRQGJgsHKFjRqCO0EeFhhHD9xreZNq3
 2KRfuL5MuETDXDaXSaEqe9C82/Q5RX2ir/o4UsNgwQQl1aD9l3z24V4RRXDDdqq1MYSV
 MPyn69FzgIrETUeGa/NUI7e0uAR/S8B5Eqoy0gNJdMl+LQ/n5XhEnkDS7Ji6KEZ5kepG
 YHpA==
X-Gm-Message-State: AFuF++lLRRkYqJic//iDYxxYvVSkoQvLaulVYghp8w2YJLWimT8vZdNa
 3gMDeHNhukZQRRwCx60OBee54NXJeCDnz7zGVmIxXL6l++H/IAn3j7klMCQPP/88
X-Gm-Gg: AR+sD12u10iJE/b/w4Ii8yfqAroyuEAsld0L9V629dVSX+s+bPyzXR4MbWFW2rn+rav
 XFu4QwI3dowsm/uEEtbY2VlVqv55sFWMN6E7MlWUpa1ZICzze1+EMVG8TR4el6c273rAMISh0n0
 2mGctf81BnkLMCKMo/qwIM0/zijiJ4VTFNHtF5oWkPwt1ycz0ZBqBc4b0f6Ayl+GkUAiru1kH7x
 mrilzpo38lUXtAo8jDk9ZVLBbPUFKbJ0IlfEmXoRug9aKGvYPAQBY0tZRC/cCg8pw9wD9dOD+nS
 bgVyHqiHdsxnENTeW/roBeJbLzvHRzWrsh7OVi6C0z+mWh3F6NFs9myXTvG8MC4EPqpqIgZYFKE
 jxUr9v7vMgZsLduW10IWLDJh5AWEFdv22tWrkjvAdC61KUJ5GtJ6RSAHY0kcinqeDrbO7TcmMXV
 NQ6yopM+1qWw4RPYgj0mkYkY7u57upXCsSgr2MQOfxS70DsoQFwf5GNk3gfXvjxAg=
X-Received: by 2002:a17:906:6a25:b0:c16:12ff:dc8d with SMTP id
 a640c23a62f3a-c246a69a22fmr1151770666b.14.1787369282485; 
 Fri, 21 Aug 2026 20:28:02 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249629929dsm126251266b.23.2026.08.21.20.28.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 20:28:02 -0700 (PDT)
Message-ID: <6a891742.15fbc348.b9ef0.9c0a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 22 Aug 2026 03:28:01 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-21
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

Autobuild statistics for 2026-08-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  | 20  |  0  | 31  |
  2026.05.x  |  2  | 11  |  0  | 13  |
    master   | 28  | 76  |  0  | 104 |
     next    |  3  | 12  |  0  | 15  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
              jpeg-turbo-3.2.0 | 4 
                enscript-1.6.6 | 3 
               libgpiod2-2.3.1 | 3 
        ltp-testsuite-20260529 | 3 
                   perl-5.42.3 | 3 
                   ccrypt-1.11 | 2 
      libabseil-cpp-20260107.1 | 2 
           oath-toolkit-2.6.14 | 2 
                    olsr-0.9.8 | 2 
               tcf-agent-1.8.0 | 2 
           at-spi2-core-2.58.2 | 1 
                   dante-1.4.4 | 1 
                    dtui-3.0.0 | 1 
        edk2-edk2-stable202602 | 1 
                      fio-3.42 | 1 
                    flex-2.6.4 | 1 
                     gdbm-1.26 | 1 
  gobject-introspection-1.86.0 | 1 
           gumbo-parser-0.13.2 | 1 
              host-bison-3.8.2 | 1 
host-google-breakpad-f49c2f... | 1 
                host-mpc-1.4.1 | 1 
          host-nfs-utils-2.9.1 | 1 
          host-xfsprogs-6.19.0 | 1 
               libecoli-0.11.3 | 1 
                libmpeg2-0.5.1 | 1 
       linux-firmware-20260810 | 1 
         linux-headers-6.6.152 | 1 
          lttng-modules-2.14.3 | 1 
                    lua-ev-1.5 | 1 
              luabitop-1.0.2-1 | 1 
                  mupdf-1.23.9 | 1 
                    musl-1.2.6 | 1 
               nushell-0.108.0 | 1 
                openocd-0.12.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/vim/vim.mk:87: vim-... | 1 
package/vim/vim.mk:88: host... | 1 
      passt-2025_06_11.0293c6f | 1 
                  pdmenu-1.3.6 | 1 
                  prboom-2.5.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                  readline-8.3 | 1 
                  redis-8.10.0 | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
                   s6-2.13.1.0 | 1 
                    sbctl-0.18 | 1 
              skalibs-2.14.3.0 | 1 
                 systemd-258.7 | 1 
                      time-1.9 | 1 
                     tmux-3.6b | 1 
uclibc-ng-test-132c6134d691... | 1 
ulog-0389d243352255f6182326... | 1 
                    which-2.23 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/4a3fd5f1bf5a28621d8149aeb42dc1accbf0e749 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/5948d5378990a59f8d0f182688778f5fb2f3e61f | ORPH
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/a9aa909d45fcf817adfcc8a56a53d1e6c72141fd | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/597a74492d5313b16d6740bfda50b51492d3005d | ORPH
    arm      |           dtui-3.0.0           | NOK | https://autobuild.buildroot.org/results/e254db2654f18f1d2110eb8b1a32b43ad0f2a3d6 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/8d7df0aa5b67654cb2d9eb9d9436dc1b8d61032a |     
  aarch64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/c71c0ff2f6d3b0e5f5c79b3740f313a30bfa2224 | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/d39d14bbbb3a51d67fe962b877c7f66ff1204ecf | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/5b0b7b8973c01f37c7a1b64262a551cac63d8ae6 | ORPH
    arm      |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/5954ceb81e7c1bc5e1003cf1b333b73121d297ad |     
powerpc64le  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/09ded0fb0117b44b5b6057bdd36a9614a95a8197 | ORPH
    i686     |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/5ece80a7e3fa185746b9148eaa7ed8d95b997105 | ORPH
  aarch64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/f9b2407ec204c652f56fd08389377b539db92ce0 | ORPH
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/00a5fa37b219fe08742a6f65f3211d49521777bb |     
    i686     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/335ca8ab1e0ecc2e635f4167142d7ba1b2b259c4 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/26c28381f6c59b35818f35f49006133f332428fb |     
    i686     |         host-mpc-1.4.1         | NOK | https://autobuild.buildroot.org/results/25fce35bea646e857fdf06e34f52072e16c7ff4c | ORPH
    i686     |      host-nfs-utils-2.9.1      | NOK | https://autobuild.buildroot.org/results/130cc6a21a11ed8406f4d805120dc2190f5de613 |     
    arm      |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/3587d157818cc8785be7267bf7fa9c8656c0e4cf | ORPH
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/d5321270034c2f14b613d69519e562ec16135ac0 |     
    i586     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/6110f6c0695d34903f12de982d8bead181e2b7c8 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/a39d6eb710e8ecf7391bf24e078d23c1bfb55cc2 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/8f98c163483dab4c501e105ff1647beae0dcee68 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/5d99112c4215fdd34c1027f4cad13f759a63381c |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/88a462231b8780cd4a7121a2b3fa230f7bbb8671 |     
   s390x     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/d3f70b635a1156f6c06c9a50b6ef4077fb916490 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/ae480359b7fd02703ce85bfd763f13ec6c1af382 |     
    i586     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/22c9cb4df5896b17ca28b7c40926e468bd63e14a |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/92ed997d7e5166ecf493bf9aa67b10f49136c388 |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/1d6b07ea039b14f631d11ae03a30e3032322ef3e | ORPH
    i686     |    linux-firmware-20260810     | NOK | https://autobuild.buildroot.org/results/f23fb1a3ea1c334b1dda606fe2bd667f8be6f60f |     
   mipsel    |     linux-headers-6.6.152      | NOK | https://autobuild.buildroot.org/results/4a947deaac8f5fd33d053578fa4cf09b56980c21 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/c025580d350c98cfe1295e043a0afe88eb75719b |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/645e4e7d4b86d8e851ff524a5b2da307bf495868 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/bdefc86f218c7bd933aa215ae4f9ed4c25a50510 |     
powerpc64le  |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/8a34fa4a644113be5eb1858e3680f9537a14205d |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/16c6383271d5b63e1ba1b90d026d1e943d5291fa |     
    i686     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/553da8254fe9c0ba01a7ff7175fc87ee69f14901 |     
    i686     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/c56e182f8d38a9fc62f2889a44c8704918189898 |     
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/91030f3448489b6d06271f7bd03d4c054e935f1a |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/7264cb668c579cc0e53d20ff2a78d1baca5aa603 | ORPH
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/4697e78a8c19e4579e19f0647683fffa38750109 |     
    arm      |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/c61af977785fdbb44018b4217bcb066963789677 |     
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/099b75eddb11e48a570f9548a92a67bd1735a94e | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/2ca512b65f7900091055d430525b747e9d0d3dfc | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/9b22a74bbc01bebe2d911b42c91d2aeb4a2d66b3 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/63d96c95731535863e349680b723f484515b55ab |     
    i686     | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/2755e31ad13c7ee08aac0e4cd68be17d50fb523a |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/75e3a8bd2bf97d9b50d694a281b1ba25de4636bf |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/c6651b9a316953e72b714c0bf3bb62ecde7b0e4f | ORPH
    arm      |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/1bdd4333c18dd7e224cb3a02597ca6c5a10dfea6 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/71cde7daa43ebc1de93dcdf2656610066184aa53 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/297aad1f6b3b1964db6bf803b26e0e672a73d540 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/06e2e34fc25d1347400705203489f524b29234b9 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/bed416bc0155468d93b729ce44baed2ca9944fb9 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/2747138d83cbf10d2f512db9868eaef8aea54124 |     
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/4672d893233630cc2bed011ea655ae1d5d975aad | ORPH
    i686     |          redis-8.10.0          | NOK | https://autobuild.buildroot.org/results/9b3cfb4184ffc87a3e4b6a4e73410015fe52f742 |     
    i686     | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/eb8435956adf3b6712dd0f7b4aabc8f4a33d542d |     
  aarch64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/745cf0242481ec90506e302d2dad2fe4ec7f6071 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/eca555b224a85635fc6a1320dfba94a02a548b80 | ORPH
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/7dfc976ae72ee617ef660fc6da990d93844f9b4c |     
  riscv64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/16d81661047259a5aac9393088b6f34d1387d42f |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b6d83db94fae84f4f0f4391ecc15392d8ef92e14 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d68277202513837e21df9152320283f334f0859f |     
  riscv64    |            time-1.9            | NOK | https://autobuild.buildroot.org/results/711ec27e31069ab933393d395eaaea68fb2f6ffb |     
    i686     |           tmux-3.6b            | NOK | https://autobuild.buildroot.org/results/002ded092a299c35f830c1c23e662a48b771c991 |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/2cc2613dad8dd93b6882f74b813eb813244630c6 |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/86c414134e05e45bf910838ef85b72c1369bf0de |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/009fe2dc8649cdc9ba2c025ce810cbb659244248 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/695489f3234a5d42afcf9daa738abfbc07c53737 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/bfce5bed2ca8b08222e7dd95f001376ea16dab5f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/63ff2cf6f796c5903c43d7342accff279b8257fa |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1378ed15bfc12b5dfcc3f430bef396e4dd6fe9cf |     
  riscv64    |           which-2.23           | NOK | https://autobuild.buildroot.org/results/822b949a73ab3edc2d52e0af7873a1cfe7b336a1 | ORPH
    i686     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/0682a62cd876037718ec534735c74ab97e84da1b |     


Classification of failures by reason for next
---------------------------------------------

                     acl-2.4.0 | 1 
                    ccid-1.5.2 | 1 
                    flex-2.6.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.86.0 | 1 
            host-autoconf-2.73 | 1 
       host-gettext-tiny-0.3.3 | 1 
                   i2pd-2.59.0 | 1 
           lttng-libust-2.14.0 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
                     wine-11.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           acl-2.4.0            | NOK | https://autobuild.buildroot.org/results/81878ab6a084a9cdb677b749a921cfff6298ff18 |     
   s390x     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/d9fc2d1c88dfa9c32d9463ffc71626e17028448c | ORPH
  mips64el   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/61da3059f403a44b61821080894a1112b56feb7b | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b252cfeb2f394374c9125b490b69091522d0f88b | ORPH
   x86_64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/43871344c095f5efad28ec8e863b89114e086a26 | ORPH
  aarch64    |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/a0c34ad5769f457999d7bc61bf350490b13648bb | ORPH
powerpc64le  |    host-gettext-tiny-0.3.3     | NOK | https://autobuild.buildroot.org/results/ae55df5e9e11324537480162d3378c1ffd322f30 |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/bd8616f04df2e1b9e18d1e16921979a852bd566f |     
    i686     |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/cb7e22ec2a969b4ab2f045c5e88251fcdc3ab316 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/52d250a3516f081f366b1257504a096d56f44f15 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ea764bb1292ec3ea03e3ef3e329b334d549b9702 |     
    i686     |           wine-11.0            | NOK | https://autobuild.buildroot.org/results/5ae4daab4c289bb6a58ae6034651abfeb5737d09 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
            gstreamer1-1.24.13 | 1 
           gumbo-parser-0.13.2 | 1 
            host-go-src-1.26.5 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                    musl-1.2.6 | 1 
package/vim/vim.mk:87: vim-... | 1 
                   perl-5.42.3 | 1 
            python-iwlib-1.7.0 | 1 
               ratpoison-1.4.9 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9c9396941d5868a5272b45447520f4b77e4537b2 | ORPH
    arm      |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/d5a32cb9f3172c4dde2e3175d6f39b2a9ded369c | ORPH
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/28f5634cae150769912e3ff5360efb2f16254c0a |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/bb314486137ab96e7009d521ea7c081faae62e3d |     
    i586     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/f0ff5533bbeef53a495be76cd40bac44a07561ca | ORPH
    i686     |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/3c9a62c39e90dad84467ba522e157bf04c1a0dd0 |     
    i686     | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/eff92982ed66a41c1dad4cf0ff44bcab600e40fb |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/1627ee3c981ceab2e0e0ce0114e6474a13ce6b65 |     
    i686     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/03e6b116778e4129b640c3fc1b592eac78767af6 |     
    i686     |        ratpoison-1.4.9         | NOK | https://autobuild.buildroot.org/results/c9535630e11689b9f6541c05993805c3c13d3418 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/598ee8bbcbadc492da429fc7e5ea348cc165d314 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
                   crun-1.18.2 | 1 
                   dante-1.4.4 | 1 
              erlang-26.2.5.15 | 1 
                      gdb-16.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gerbera-2.4.1 | 1 
               host-attr-2.5.2 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
    host-mender-artifact-4.0.0 | 1 
 host-softether-4.30-9700-beta | 1 
         libhdhomerun-20210624 | 1 
                 libiconv-1.15 | 1 
                 libv4l-1.28.1 | 1 
                memtest86-7.20 | 1 
               pcsc-lite-2.1.0 | 1 
                  pdmenu-1.3.6 | 1 
qt5base-bebdfd54917e25d1c10... | 1 
              udpcast-20230924 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4a72c95780eb9d94becb1215e7ecffc1ef492214 |     
    i586     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/f31234a80e5379e0add9abb34d169ad05bc04da0 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a1a423ebc5d9a7cbd3d5a16da2f7efb24d6da397 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/2fe9e754c11b83877545d8d4c5463fb61fa20f85 |     
    sh4      |            gdb-16.3            | NOK | https://autobuild.buildroot.org/results/18bd671928b4dbf18b5084d85f572cb21c2a913f | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3194243d94c88b08c7f1ce5c996373bde740e4b8 | ORPH
    i686     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/873771f1ae695c5d1e06c9464036928e06212762 |     
    i686     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/00ce0e2b0b9574c10d3c313f1a85948fe6372292 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/bb746f16fe8b12f560b2751caf557b6abf9c75e0 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/d79213025b720e405b7fc426550db9cfee30efc5 |     
  riscv64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/9e3db94d4db4abe13cab441eda6e3b6d2bc8d4ee |     
    i686     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/b999448a01778394dfdc9acb74406189dc45b741 |     
    i686     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/8c10da81fb1be36a6552dcbbb3d96ce50acbde0d | ORPH
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/8b0ae762b3f74e5c7421eb4b2754de18490b18c3 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/81f46b9f18da81c8c32c79f23a3f0d162525e8a5 |     
    i586     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/9363fe2e46b784afefe20e40acb078cf22b66419 | ORPH
   arceb     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/5e352577c0c5e2b9091378964747a851296fc13c |     
    i686     | qt5base-bebdfd54917e25d1c10... | NOK | https://autobuild.buildroot.org/results/f669c02729a6a586bb5f6acbfd9d4d846eafccb7 |     
    i686     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/8f897c4fd1bd8bb650eb5b2313aae94bac03c7ab | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/31fa1b1e52f4cc61ba8ccfda7a98e94b03c7700f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

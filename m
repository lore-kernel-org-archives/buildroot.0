Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA66CD13DA
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 03:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD00F85389;
	Fri,  1 May 2026 03:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3B9ondFML2d; Fri,  1 May 2026 03:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6036C855C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777605550;
	bh=C6xRCISPEQ+Cxs+siPbmH9shetor442olfB2nP2S6/c=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a9gPm4mAy/my+pRuphQGbRDcO4LeiH87Z4lBkkV8I/g9PJ/vsarC/GZBN6WOzLSaF
	 LHSDRiEZaFvjnc7PI258sRpIyJJJp3JplUs9UEmn3Tr0eyeD/XuHf69ydk0uQgoQE6
	 1VToSsuZsza+syU9gM+MWEJImDCjWDO7SXyopak6klMRfsEFJgg+TxIokB7G8W4EVa
	 jY/jioE+LmwFZml/4ZYbLoCsgUr1f3ieb23VPPFxawzjvzYhHdc1iuopvjjwOoqlWJ
	 NgilMPpMQjqSzqdt74kQFt1o8GdHPwdyS1uEg8QtKEIQQcIZ71jvMKxkAY0NeC+54h
	 Emr6iovY57KOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6036C855C8;
	Fri,  1 May 2026 03:19:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F303C293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 03:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7CD66F753
 for <buildroot@buildroot.org>; Fri,  1 May 2026 03:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Lt5crRk1voh for <buildroot@buildroot.org>;
 Fri,  1 May 2026 03:19:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D7B56F737
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D7B56F737
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D7B56F737
 for <buildroot@buildroot.org>; Fri,  1 May 2026 03:19:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so22465905e9.0
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 20:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777605544; x=1778210344;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMXHfRcPBHts4GUsnOhBWW0/au6E01BKm2d4DAgCjek=;
 b=QV4Y8ejRN2lJf4NPIgfsmdcd0YQqM9OmcApxqeYnV+v1rx9Sa2jd6TUjIJb+/7008r
 cdmuJLJehPyIsa/Zg6uDhMnMV65ew/Q/v8Ev42pN+W4o6njAvfldUAOlpbscugphNVCk
 l3CwWxATmb2F6xf8Zf9KancnezJh3c4L5Jy4itF7So3cZCByov1fo0bB46BlwuHam5Eu
 DYgCsbTDfe0WtuTNNTsB3f1VJsXeqh+PTs9ItFhuhb05erPCGBPI8cJmUgxLnTCYQPMq
 Ui+i1YKTb/tN85SUg9OdTpFavLXg4eV9kCkgCiYGZR3S4FBw9n0fiQ8xNbsrGOGuDOkj
 ePkQ==
X-Gm-Message-State: AOJu0YxXqplmXrNI4JIZRXOm4Mk5KFx0gMYEYWvobUjDgT5rn/9mX5hR
 jA7KemfdKsNuPabczZ2TL916rkiy82mFNc+8RR4glkPKW3bxnQDqf3ObcHpP8CSz
X-Gm-Gg: AeBDieuMKZl0roW5o21WGaoo1qL9jyoRInz7qwYQhZD0GQk1ouHyKOPLR2vrB3diZBt
 VWWThXpvdpgwTzhzpxWsXp1w7gBS7BPAdkJuPszpaYYhM55bjZ2VxX9V7hyz4jRkkwulaQ27MYU
 WPWMag1f9mdGm9TYJNOr0xl+pJotLREjnEK3B4KUB0D1IyZzRUb9tHE6wYGjDOLw/G5g1qmYXlH
 AMFKQQyKoXbMEY/Am1KmEm9deQKvdNJG4h98pRS6thQRZjNHffTZMg8+5heHx0KCw0a/x37goNE
 NZkaP2JrE3Ecso8vqiLNnZ6vgkrzCzkx00oYZw1BqydWFl6S2lKE1SSEofdXL3EfkHGy7FIoLzn
 ZBc0rob02kmOyo+exT2gxWmdQE/Nkhlye4zfZH1lQQueZvrPLJKFR3X3dEEMeBeRCOz9NehZBvU
 IQeqJe0JHYTc0yy6ZjtVHtvn+Xsxm9/cOGbK3t1/vUPwheN0OjoW8=
X-Received: by 2002:a05:600c:154b:b0:48a:563c:c8e0 with SMTP id
 5b1f17b1804b1-48a83d66d08mr92403925e9.1.1777605543460; 
 Thu, 30 Apr 2026 20:19:03 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a981dee7asm1973937f8f.21.2026.04.30.20.19.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 20:19:03 -0700 (PDT)
Message-ID: <69f41ba7.5d0a0220.1636fb.7947@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 01 May 2026 03:19:02 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777605544; x=1778210344; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oMXHfRcPBHts4GUsnOhBWW0/au6E01BKm2d4DAgCjek=;
 b=aOElX3r5v2jYF4ma7pbILV2YMFJ6vTGVKgDRFMoRMFvGlbTdFV6l/vPiCDNWsZxX/N
 Vzg9tK+GFqRe9jEDpUoiifxqKBZHHkzRbHtbUW0Mpp3b/pIlfqWYJyv/xZQC9stw9zq9
 70BJS+lrXJ+YxbOTHnM4bAnxiRkdy+Xq1bgImeswk0rgKaX47q5DmAJYe9I/ulvpKox0
 raXxLnSyN9phDCXPXEep3+N+msJ+UiADTUBsjeofj+2edzOFFWZwlxB3U4of5IvTiKsb
 JsJXR8T5YXxRDxPaF9zKwoj0BNfpxfKUrOf/l9p3nMZFptY9xkv0A0/52mLsAD22yYRh
 GoNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aOElX3r5
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-30
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

Autobuild statistics for 2026-04-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  | 14  |  0  | 25  |
  2026.02.x  |  7  | 10  |  0  | 17  |
    master   | 49  | 79  |  3  | 131 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
             util-linux-2.41.4 | 6 
                  iozone-3.508 | 3 
              libopenssl-3.6.2 | 3 
ustream-ssl-5a81c108d20e247... | 3 
             batman-adv-2025.4 | 2 
                   dante-1.4.4 | 2 
  gobject-introspection-1.84.0 | 2 
          linux-5.10.246-cip66 | 2 
                 linux-headers | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
                s6-dns-2.4.0.0 | 2 
amazon-ecr-credential-helpe... | 1 
               asterisk-22.8.2 | 1 
                   atop-2.12.1 | 1 
           crucible-2025.05.28 | 1 
                   duma-2.5.21 | 1 
              e2fsprogs-1.47.4 | 1 
glibc-2.43-17-gdd9945c0ba40... | 1 
                 gnupg2-2.5.19 | 1 
               graphene-1.10.8 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.95.0 | 1 
                   i2pd-2.59.0 | 1 
               iproute2-6.17.0 | 1 
                     kbd-2.9.0 | 1 
                       kmod-33 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                 libavif-1.4.1 | 1 
              libcamera-v0.7.0 | 1 
                   libks-2.0.5 | 1 
                libnss-3.123.1 | 1 
               libxmlrpc-r3335 | 1 
                libxslt-1.1.45 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260130 | 1 
             matchbox-lib-1.14 | 1 
                       mrp-1.2 | 1 
                  nginx-1.28.1 | 1 
                  ntp-4.2.8p18 | 1 
          openfpgaloader-1.0.0 | 1 
                openssh-10.3p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.42.2 | 1 
                 pixman-0.46.4 | 1 
                      pngquant | 1 
            python-numpy-2.4.0 | 1 
                 rtl_433-25.02 | 1 
      shadowsocks-libev-v3.3.6 | 1 
                     shim-16.1 | 1 
                 systemd-258.7 | 1 
           uboot-tools-2026.01 | 1 
uhttpd-15346de8d3ba42200249... | 1 
               valgrind-3.26.0 | 1 
                  xmrig-6.25.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/14dfce3f315ddcb9eb2d6f14a900ca7a436067e9 | ORPH
microblazeel |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/f2536ce1aebc4455d3f657bbad83ac4d6cac179c |     
  powerpc    |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/d45f9f246384ac9339c1ca4c454b05e55f5d77ff |     
   xtensa    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/e75925beb9a00e8aaf139669f35322017bc0bd5c |     
    or1k     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/8af65596e6da17dc59432e19abf500d61238a317 |     
   x86_64    |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/bfcf76f7c9633e06cf8d57441a5ca96321d27ddd |     
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/d60d6387c028c6f26b32bc2045f1f36e1f3ede72 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a1792a8efdba50d5edec4714183fa50ffa5d7a61 | ORPH
 aarch64_be  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/795082619d0652e6b62a0f74cab86c111d277a11 | ORPH
  powerpc    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/d8b84a2f211b5caff14a38f372a05fc5b9d89d54 | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/0c23a7689c0160136d0772291425868b5a4f22c2 |     
   sh4eb     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/f0bd72b494fa5a2dcffe1d89ce60acd88ca7802d |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0571b729f6cfe539f767f9565774dae5a697f1cd | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/29a1038e8cca9fb81726972d13843e269c697fd0 | ORPH
    arc      |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/eec81e91ffc348b24a1769430a1fefa629477fde | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a7b76e13db0451328d7ade8330e0b8a51429f55a | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/10d0a5748ff139a8980cfae26dc8f76c357b7524 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/e2a532fcb031856fce60cff8290b467745eb08ff |     
   armeb     |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/8ef77e47f2ef2054cfd1974b5131d683121b62d5 |     
microblazeel |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/438ab3ab4e08291f84a8e9c244e0ddb61d3a00fb |     
   mips64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c11f7772f42a78d5c71f2176c422fe816278d617 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/24e65ea7b3572c6f65597423eeadef4e6e4c20e2 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2486240f19e658d98a9cceb8581e15dcfac07bdd |     
microblazeel |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/2f7929f6795c04e1ef3df915419d35d2507dfdf8 |     
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/129e1f3005a74ff36f011e02e87f5e5ef24c962a | ORPH
    arc      |            kmod-33             | NOK | https://autobuild.buildroot.org/results/c9b998ee549c2fd93826e5f15489e6339d0ebddb |     
    mips     | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/419d06eaeaecc0678d6f3e04850b287833e9c42f | ORPH
    arc      |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/f4f5e4901a690c91e64a527307230dd82400956c |     
  sparc64    |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/071494663f031abcbc182336d91095947a95351b |     
 aarch64_be  |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/aac25e5c584ede962cac95c353afd64bf720199c | ORPH
 aarch64_be  |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/9cfd0a3c24f38993fcd40b1a5161cadfb5c73353 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/7fcac6aed909968c56279d79c16b58ec6d366128 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/30c1bd6977c94fab9e26593a9d7dbe336a48997d | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/8c73b21f174c29a9e472ef0c702cc25b2651522c | ORPH
   x86_64    |        libxmlrpc-r3335         | NOK | https://autobuild.buildroot.org/results/c4595299d9eabc9df161823a32961b2e9823bac7 |     
    m68k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/384fba7482977ff073de16b9cea67744246677b8 |     
microblazeel |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/1a603751fa762408451e45fa5f49b3f5aaedaab0 | ORPH
    arc      |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/1181a7d9964cbcf4bc22e1311e3a84cd700675c8 | ORPH
 powerpc64   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/83a78db014cab52114b7eb0e9e49c7964b35fe1b |     
 powerpc64   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/e9e13dde39264e93d5bced29e76e31d42842877a |     
    or1k     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c571046d2d96c4ae8f6e8529e4b543f7accaf635 | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/6cca449395d3c76a4f464a9c6da7f365eb1f7a24 | ORPH
 microblaze  |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/8a965e003719a8db9aa028c16c7f23b5eacb5b89 |     
    i686     |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/532949526681bc59b2f415d536465edf0a8aaa83 | ORPH
microblazeel |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/ef3cc2db9644bb073f12a2e8b9abbe956fb8a97a |     
   sparc     |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/5dc739b87c21adc3eb559cca70aba75255dcbfdc | ORPH
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/74091af132a42166fbc6f884273ec694566389a2 |     
 aarch64_be  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/71d5d14e141d2bac51a44e6f0a4cbc9e6a11dd73 |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/8ea720cc29219ff3333871539f55d7a6a0a476a2 |     
   mipsel    |      openfpgaloader-1.0.0      | NOK | https://autobuild.buildroot.org/results/21c2ab15e86bd25ac703483a2f3fd57f06ac2eb4 |     
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/7b2941cafa729f283f63791a4d2cd203f0fa3534 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/0055cbb16e3c16a2fdad5270959b288b8a312a4e |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/e1ba3445e31d03bfb7cb700251b86a994cc9c9b9 |     
  aarch64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/fb3ecea7ef95836f42c6c324f75f11de13ad45bd |     
  riscv32    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/53d2b43ef155f4ad7a33af0255bdf2479f6007a6 | ORPH
  mips64el   |            pngquant            | TIM | https://autobuild.buildroot.org/results/70afe7fb4fcf6fbd5b5446891fda13cb6d814aa3 |     
  sparc64    |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/a38165c0649e2af3e5f571d4abacc7b673410090 |     
    or1k     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/cd261f796aba1b54c0e172f90d44ff5355ce873f |     
loongarch64  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/db3de6a104a67e76493d356fde0ccc6edc99485a |     
   sparc     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/51146f11670042f127204c4bda45585b0ed11ea4 |     
    mips     |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/ecbee13c47940e91d4dab345d4ee72f71e0631a0 | ORPH
   x86_64    |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/f64213e8cfc9ce073a2f84dfc34bdd0ace8bb0ff |     
 powerpc64   |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/a7951c1379056a0908619e9970c21dbfe6de0470 |     
  mips64el   |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/a78c6a71605fc93e302d2848b296119b34aead3d | ORPH
   sh4eb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/fed6a431018a3dd91719b735a164547b9dfea49e | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/2261a61970c8b122f9a2bf714ad7ac9b3d34c475 |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/08f946ad17e818abdf532eac1acc7799de005652 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/393cb043740c6b50212bacc0094c591ba244b6bf |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/01ab4ce6e01bd0f4d479d0a65406de265f6111e2 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d2112284d9a12e2f0bb45d9e225d0b9ceeba9490 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/40ff40defd9f186af16d88372da7f4cdfe58da5a |     
   sh4eb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d19cbdadbcb1ff4f15de495a37b7e91bf678f707 | ORPH
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/c2c161c500c6449f7b7335e2dbcc2f4ef2642861 | ORPH
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/21e363cf701d8d2807141cbcd2d5c8e91750a958 | ORPH
  aarch64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/01ec4d78c3c1acbfb25edf0a95fa0dc05ee4a1a7 |     
    m68k     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/e1d4c3e0bf73e316231f575acff1303867ffa1df |     
 microblaze  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/a925935837d0bd12071ea627b2571c199352ec51 |     
   mips64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/f7eaa7bb4882573531777aa42c470db00cd46f34 |     
 aarch64_be  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/fb336a7e94f97c1dbff9bb2ed69ef572151ad6e6 |     
  aarch64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/3bf3c53e3b88b4376b82a17cfb2a30452b6bdc44 |     
  powerpc    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/8c09f44236278bc870ccd47e3760eac4aed0f575 | ORPH
 aarch64_be  |          xmrig-6.25.0          | NOK | https://autobuild.buildroot.org/results/3a4c9759844f53f166e15537ddee5541c674f1a3 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

               asterisk-22.8.2 | 1 
               graphene-1.10.8 | 1 
                   i2pd-2.59.0 | 1 
                  kexec-2.0.32 | 1 
                 linux-6.19.13 | 1 
        ltp-testsuite-20250930 | 1 
            lua-sdl2-2.0.5-6.0 | 1 
                     popt-1.19 | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/2de060525d580e499e43da4ad12ad3f5791ac311 |     
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/b7a76df456efa1f7fdb619039c3127f4432466f7 | ORPH
 microblaze  |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/c527da6514b335bb4f6ea8f514c006df605f7baf |     
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/659ddb3c53a1d01bea8467864dfd783f1f392890 |     
   xtensa    |         linux-6.19.13          | NOK | https://autobuild.buildroot.org/results/880aaccb8b42c51113e91d7ff210bc7799446892 | ORPH
    mips     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/c3a91f0ba8f1510f36dd496fb93bdc51ad87b741 |     
   mips64    |       lua-sdl2-2.0.5-6.0       | NOK | https://autobuild.buildroot.org/results/98711b6948959f6de04d566d397565b5ea8d647e |     
loongarch64  |           popt-1.19            | NOK | https://autobuild.buildroot.org/results/1311efd5931384c68c030ef8ce5c7673b58c0410 | ORPH
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/d6db2a4b9d4c8ee2410260e08ac1f423adf856e9 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/58a89d6a243a5ac69b09a36bf3c27bd40cbfb395 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
  gobject-introspection-1.82.0 | 1 
                haveged-1.9.19 | 1 
            igd2-for-linux-2.2 | 1 
                libglvnd-1.4.0 | 1 
           libmicrohttpd-1.0.5 | 1 
                  libnss-3.108 | 1 
         lttng-modules-2.13.22 | 1 
                 openssh-9.9p2 | 1 
             parsec-tool-0.7.0 | 1 
               pulseaudio-17.0 | 1 
                s6-dns-2.3.7.2 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/503ddc49e631a01f89c63518390eaf1ad4d53336 | ORPH
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/eba6fdcb5c18a2f3de38b7ff98a210c6e1d10820 |     
    m68k     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/d3ea3564482a648e94a339e72bb65acc7e249c8f |     
 microblaze  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/e80c10aa0e2117971155db07a11b79ceeab627b4 |     
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/dea80b78f9f631be4714482f500579a85d092bf1 |     
 microblaze  |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/06b557f130b935876f69c551c9b6b8d55d8dc021 | ORPH
   xtensa    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/572f986d147ea3c08ce2aa4ebd92a35220b9adc2 |     
 aarch64_be  |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/400ab735c16d0b1951ecf24ddabfc1f282ca0027 |     
 microblaze  |     lttng-modules-2.13.22      | NOK | https://autobuild.buildroot.org/results/ef02961a5df533c06496d3c3d0ffc82a8278146e |     
   armeb     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/ecb624ebab0797a56bb1c015acc4e7613358fbd1 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/e6854fcd815acf1c3709528b169ca49453afff0b |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7b3c6a5f596d265270efdf5f79dfdc4ffb443ac6 | ORPH
   s390x     |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/5612934ed4f9fae760cf8836d94945149a667e39 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/905d40285c7df9afb9fc1ecf50e20f1cdb79fb76 |     


Gitlab CI results for 2026-04-30
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357189 |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357190 |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357191 |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357192 |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357195 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357197 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357205 |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357207 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357208 |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357209 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357210 |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357213 |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357214 |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357216 |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357217 |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357219 |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357222 |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357226 |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357228 |      
                        coolpi_4b | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357238 | ORPH 
                engicam_px30_core | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357241 |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357245 |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357246 |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357247 |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357248 |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357249 |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357250 |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357251 |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357252 |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357253 |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357254 |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357255 |      
               freescale_imx91evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357256 |      
              freescale_imx91frdm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357257 |      
               freescale_imx93evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357258 |      
              freescale_imx93frdm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357259 |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357260 | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357261 | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357262 | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357263 |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357264 |      
           friendlyarm_nanopi_r3s | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357265 | ORPH 
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357266 |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357267 |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357268 |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357269 |      
                 hifive_unmatched | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357270 | ORPH 
                          hp_9000 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357271 |      
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357272 |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357273 |      
                         imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357274 | ORPH 
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357275 |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357276 |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357277 |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357278 |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357279 |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357280 |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357281 |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357282 |      
               imx6ulz_bsh_smm_m2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357283 |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357284 |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357285 |      
                       imx8mm-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357286 | ORPH 
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357287 |      
                  imx8mn-ddr4-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357288 | ORPH 
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357289 |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357290 |      
                       imx8mp-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357291 | ORPH 
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357292 |      
                        imx93-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357293 | ORPH 
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357294 |      
               iot-gate-imx8_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357295 |      
                      khadas_vim3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357296 | ORPH 
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357297 |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357298 |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357299 |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357300 |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357301 |      
                  loongarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357302 |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357303 | ORPH 
                      ls1043a-rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357304 |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357305 |      
                      ls1046a-rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357306 |      
                  mangopi_mq1rdw2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357307 |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357308 | ORPH 
            microchip_mpfs_icicle | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357309 |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357310 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357311 |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357312 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357313 |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357314 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357315 |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357316 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357317 |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357318 |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357319 |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357320 |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357321 |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357322 |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357323 |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357324 |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357325 |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357326 |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357327 |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357328 |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357329 |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357330 |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357331 |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357332 |      
                       nvidia_bf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357333 |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357334 |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357335 |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357336 |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357337 |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357338 |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357340 |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357339 |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357341 |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357342 |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357343 |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357344 |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357345 |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357347 |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357346 |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357348 |      
                  orangepi_5_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357349 |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357350 |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357351 |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357353 |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357352 |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357354 |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357355 |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357358 |      
                  orangepi_zero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357356 |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357357 |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357360 |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357359 |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357361 | ORPH 
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357362 | ORPH 
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357363 |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357364 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357365 |      
            polyhex_debix_model_a | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357366 | ORPH 
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357367 |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357368 |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357369 |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357370 |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357371 |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357372 |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357373 |      
                  qemu_hppa_b160l | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357374 |      
        qemu_loongarch64_virt_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357375 |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357376 |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357377 |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357378 |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357379 |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357380 |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357381 |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357382 |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357383 |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357384 |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357385 |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357386 |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357387 |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357388 |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357389 |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357390 |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357391 |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357392 |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357393 |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357394 |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357395 |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357396 |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357397 |      
          qemu_riscv32_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357398 |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357399 |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357400 |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357401 |      
            qemu_riscv64_virt_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357402 |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357403 |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357404 |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357405 |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357406 |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357407 |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357410 |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357408 |      
                  qemu_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357409 |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357411 |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357412 |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357422 |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357413 |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357414 |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357416 |      
                  raspberrypi2_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357415 |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357418 |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357417 |      
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357420 |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357419 |      
                     raspberrypi5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357421 |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357424 |      
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357423 |      
                 raspberrypicm5io | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357425 |      
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357427 |      
             raspberrypizero2w_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357426 |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357428 |      
                          rock4se | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357429 |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357430 |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357431 |      
                   rockpro64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357432 |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357433 |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357434 |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357435 |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357436 |      
               sipeed_licheepi_4a | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357437 |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357438 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357439 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357440 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357441 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357442 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357443 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357444 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357445 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357446 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357447 |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357448 |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357449 | ORPH 
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357450 |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357451 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357452 |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357453 |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357454 |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357455 | ORPH 
                    spike_riscv32 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357456 |      
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357457 |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357458 |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357459 |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357460 |      
               stm32f746_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357461 |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357462 |      
               stm32h747_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357463 |      
                   stm32mp135f_dk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357464 | ORPH 
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357465 |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357466 |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357467 |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357468 |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357469 |      
                     ti_am62px_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357470 |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357471 |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357472 |      
                     ti_tda4vm_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357473 | ORPH 
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357474 | ORPH 
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357475 |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357476 |      
                   versal2_vek385 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357477 |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357478 |      
                    versal_vek280 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357479 |      
                    versal_vpk120 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357480 |      
                    versal_vpk180 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357481 |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357483 |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357482 |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357484 |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357485 |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357486 |      
                       zynq_zc702 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357487 |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357488 |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357489 |      
                zynqmp_kria_kd240 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357490 |      
                zynqmp_kria_kr260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357491 |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357492 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357493 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357494 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14151357495 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

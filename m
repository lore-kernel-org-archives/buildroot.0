Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81606FAD3E7
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 03:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB8AD813C9;
	Thu, 23 Apr 2026 03:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4_OX1780HCg; Thu, 23 Apr 2026 03:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC15813CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776914309;
	bh=IamjPjzqfPYfgwmzyO3uM7pNRsgDRrsF6MyVS7GcPCc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FeSbKzSbvVoF9LS0J0h5ysF5f0YKDpqC+A/U3im3vIWkMNlGSKS5svl+fCXAuDmWc
	 dNPBa1jM3zZ0SKnx8cBh4pqL3G0G7nOKxajxFjDwkHdEj+UdVwckxPqWXCvEluuF9a
	 2fKoPYtlpl2L+n0URpxUzc+k04ZukWEeRZh8b15dNKtIqJ2ja9WTr3/Fv8L+RdGduY
	 x6T9QNjeVXQU/LLXdf+zCSp9rLxntTJMAbpoPAKGdM48tG4W4Nyzdvk4j6xdcEnGFc
	 bhIdWSlNQ9bDZN/DmfOnvLW4tgckKvV4QgBGJwAxekF2JDWfBpMWVnvMw6fJIsYVyp
	 IkJJYTcF0BMtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AC15813CC;
	Thu, 23 Apr 2026 03:18:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5E4124D
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 03:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97A17813C9
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 03:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITwoVmrgZIjF for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 03:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 633DB813C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 633DB813C6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 633DB813C6
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 03:18:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso36684925e9.1
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 20:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776914303; x=1777519103;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gwHr+YbuNPR4o3Lf4MdFO1VbUSxX81hPFS85Vv1Cy5w=;
 b=kB20DRBC95pxYDWmDhfKivUZXmkD7oRYSRKHufve84WBqNNUczbVBSwkqV7RXNJX7V
 pJyC+aPAlF1/OnKc5xujW0UZENGHyMZP7gbmTNF464dNx/6r/SMTlG01d7EETvT2phUA
 Xs1EKToay8sPqao6fl0fyZWAKFUXehk+BqOF2zFAZfcw8yWiMUA6O4ZAE7TelxwkXltF
 zq/0uNKH1JZ/yHUTRCq/+90nMMFvKdZ5da/43NkTBFqfchb3QeXOoRTDG5xd1oE6EPsS
 GaOQ0W2/Uo6o6fmU9akUGIs418oYVTwPnmjbdvr70ijvL09f6BEoeoRsOGdeCy9oe/sN
 /qXA==
X-Gm-Message-State: AOJu0YzVQzJwtQYFH3XJjJRfv1moXv16ZJA3O9Vv6E+FKlyHHYOBRHXa
 lrueBr/5PGh2Ygjl2J/ZuuH3GNWqNu91GKHM3iyxY4MAxkPjV3HUcBPih7HnKZ8t
X-Gm-Gg: AeBDievuKdGUxncDF2yX7YBkgRBiV6AjAycDSwsFQrvU+4e9FWj9GSqGbsmu2k2UaD4
 lWVPXUU4YUOl8ue5TpMfHtFwDkeXzG9cJW1gz+hPdtSVrK5MxvZ9kLzB19n9mnMrA97lOhuQkn7
 +Mxwn/qwhE9FCwpe+Nm4is1CG7OTeO2wDkxzTPK5GruwqDA9LuLRCmE6rChrlQ6/6tCnx5Czt1s
 46yR//ukI8syJkEnTZwzemqxan/fmFPjz7MSX3X3i6QamZ0bHL4/oanVPuBqhMOktZk0heOBI4L
 +U+XY8loLr5qibxZz3x88D8HffDgNSnDuZaN9nyx9HijZJMzezIaTLXQb7/eOLKnd8ekocDha0r
 M1AsvzSllec/nG6UOVFrabM9M0Lsjpk5ZBe35EPd2Lese35j58cqEISkF0UAHLVxK+mfPftHy18
 CIaLdJsyuy4ztY33f9Xvv8q/yBiNcRwYl9nsnSWEv0
X-Received: by 2002:a05:600c:4746:b0:488:9439:881a with SMTP id
 5b1f17b1804b1-488fb738412mr332895285e9.2.1776914302585; 
 Wed, 22 Apr 2026 20:18:22 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cdfcd50sm104326035e9.9.2026.04.22.20.18.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 20:18:22 -0700 (PDT)
Message-ID: <69e98f7e.050a0220.91fb8.46d1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 23 Apr 2026 03:18:22 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776914303; x=1777519103; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gwHr+YbuNPR4o3Lf4MdFO1VbUSxX81hPFS85Vv1Cy5w=;
 b=BKyh6x91citRhl0ao/0p2mfhhrdYL7oodLpXdKGGrih8AUZCCJbXYdRd0GKuXiAdal
 G05ywyeREI1bCVIs5dni6GNjvRAF95wUIOOUuJ3AHJ9z77WbfzCTqQhcEv3bh47MSHME
 YGg5HMLHX7zOq6pjTilOiaS8OYZZtlX5OfKUIZZYj0AOR+oxrWvghnu79O3t2TfTle/u
 9p2Si+GSWUASuI0JwS1CzYvhi3ArITT85gOU+zRwt+WSqxeWTySvBzJJ6LTPODd7bza5
 ymRkCg58bGkLq1zjN4Z432ntMYJtrHiDSg/lIOCtQwMx0qQfAktL2I53RDH8bUIZSrrI
 Spgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BKyh6x91
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-22
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

Autobuild statistics for 2026-04-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  5  |  0  | 13  |
  2026.02.x  |  4  |  5  |  0  |  9  |
    master   | 47  | 73  |  3  | 123 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
                flashrom-1.7.0 | 3 
                  libnfs-6.0.2 | 3 
                   perl-5.42.2 | 3 
             util-linux-2.41.4 | 3 
      host-uboot-tools-2026.01 | 2 
                  iozone-3.508 | 2 
                 libzlib-1.3.2 | 2 
                 linux-headers | 2 
                openssh-10.3p1 | 2 
                 thrift-0.22.0 | 2 
           uboot-tools-2026.01 | 2 
amazon-ecr-credential-helpe... | 1 
                benejson-0.9.7 | 1 
                   bird-2.15.1 | 1 
                  boinc-8.2.11 | 1 
             dahdi-linux-3.3.0 | 1 
              e2fsprogs-1.47.4 | 1 
firmware-utils-c42a3bc53da8... | 1 
            freeswitch-1.10.12 | 1 
                    gawk-5.4.0 | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-15.2 | 1 
                     host-rust | 1 
          host-xfsprogs-6.19.0 | 1 
         host-xorgproto-2025.1 | 1 
                     kbd-2.9.0 | 1 
                 libcddb-1.3.2 | 1 
libdill-32d0e8b733416208e04... | 1 
libfutils-c326ce0cc2a735438... | 1 
             libgphoto2-2.5.33 | 1 
           libmicrohttpd-1.0.5 | 1 
                  libnss-3.123 | 1 
                 libpjsip-2.16 | 1 
              libsecret-0.20.5 | 1 
             libtorrent-0.15.3 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                 mdevd-0.1.6.5 | 1 
                  mender-3.5.3 | 1 
                       mrp-1.2 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
      passt-2025_06_11.0293c6f | 1 
            python-numpy-2.4.0 | 1 
                 rtl_433-25.02 | 1 
                s6-dns-2.4.0.0 | 1 
         s6-linux-init-1.1.2.1 | 1 
           sane-backends-1.1.1 | 1 
              skalibs-2.14.3.0 | 1 
                   swipl-9.2.9 | 1 
                 systemd-258.7 | 1 
               tcf-agent-1.8.0 | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
                 wolfssl-5.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/cfad78d0df94bfc7bce52c3dcd10cdcd323f6a56 | ORPH
    i686     |         benejson-0.9.7         | NOK | https://autobuild.buildroot.org/results/4fb427e494dee743a1b26211f5643add7575781d |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/212398b6e6bf16c9267eda9beda54b1d17590941 |     
   sparc     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/b55404808974b6ab710a261b92d81de7284f3e36 |     
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/68b95feafdaa54b6e9df17b070e23d147ffc44ba | ORPH
   x86_64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/b9e96ac5407ac63b75b3b9fad18ef55d8222c526 | ORPH
 aarch64_be  | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/e0e7955025885ac0e2346a87d37586c5f0231d86 |     
  powerpc    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/85c9d1e549ea44a46d94b3fa7e30eebc38617662 |     
  powerpc    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/448e730c014770c778291e42496df92f2fc8f1b6 |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/cee2a5b8553c3c875114fe939b6f728e6335df86 |     
powerpc64le  |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/2368095326f7bd45a62c8b2672fcdb676a153e52 |     
   sh4eb     |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/68c0e65e34723ffb7a05da604b149e57937dac5b | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1f0081b6f92f27ad5d6d264ef56c9b4ff307565e | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4d32dee9255de81da0109446132dc6990e6bbc67 | ORPH
 powerpc64   |           host-rust            | TIM | https://autobuild.buildroot.org/results/621534933d220dd5fed639795ffdc6c0aebd20e7 |     
loongarch64  |    host-uboot-tools-2026.01    | NOK | https://autobuild.buildroot.org/results/924ee98e048321e063a086358f6b4c7d6b9c4b25 | ORPH
loongarch64  |    host-uboot-tools-2026.01    | NOK | https://autobuild.buildroot.org/results/250183639fefdf8ce11f6b0ebefe6eea25d87c6b | ORPH
microblazeel |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/2135e24e15cc96f046099cb0715b1511950c3694 | ORPH
  powerpc    |     host-xorgproto-2025.1      | NOK | https://autobuild.buildroot.org/results/35e71d5fe8b90b14338bcc4b351168e3e0c0b95e | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/254d83dc6b15905430ebfc2abcf72c15e8b71f66 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/94ab1efda78381f171ed15d1033ff2951c74743a |     
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/abd9dd6443792c96da5cfc0e8b6f6efce62639ab | ORPH
 microblaze  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/d221645c3bc99470a00a2120d568bb844250a5d2 |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c03a92c1af415a42a3f04d55a91c0339d0dc684c |     
 aarch64_be  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/65d5b735ec9f4cdedb5ea72c6e312901da5ff5c0 |     
    arc      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/d95be6f744bf3b8a90637d08f2e88b1d999132c9 |     
  mips64el   |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/96418c0ef2bb4070a84a71e73dac6d27992fde9e |     
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/336354c39a9068505306dc04f5d47e69ea13961d | ORPH
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/5945a34922d91eabd6eca6dd67426106afe787fe | ORPH
  riscv64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/840c1741a472dc72d78e2e687dacd2b8f8da74a1 | ORPH
  powerpc    |          libnss-3.123          | NOK | https://autobuild.buildroot.org/results/1a2b2bd07045ec5ade794dd9170d62f099d657f8 |     
    sh4      |         libpjsip-2.16          | NOK | https://autobuild.buildroot.org/results/78ae690b0354a48156d00ab0ca4530bdf7ec6841 |     
    or1k     |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/c32d842f1cdbf3d3caf6f5828443e8bfeba0f756 | ORPH
    or1k     |       libtorrent-0.15.3        | NOK | https://autobuild.buildroot.org/results/0ef7d0aa9b86d53f68104835dc15194f65a189d8 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/07d80a33e9e680ece02ab3992f203dc67d6fd24b | ORPH
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/4d066a5fa409d9ed0b65f3fb2ea1b5689f2cadff | ORPH
 aarch64_be  |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/31c1c24932e6e92269f73426499f9610ef8f0103 | ORPH
    mips     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/b7a83c52835e572b983b235562c135690dd4881e |     
loongarch64  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/d5cdc676e724cd7ea72bc9b0f1ee3fc0a2134540 |     
   x86_64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/a2e40eddf22ad041a61cffe4d04a4522afe05020 |     
   x86_64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/6b87c2210219873c23eeaf4efacfc068002ba1e2 |     
  aarch64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/bc9393e46a9f41e7a86c743b83d48924231f74bc |     
    or1k     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/f4d2baf9bf8d5e6aed135670591c3371bcb6e405 |     
   mips64    |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/14b2a790ebe7b16dfe7f0cc0507ffcd98cf3e093 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/2316c2af44cae72f94f3084a974c8f11385712f8 | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/756b64beab6495f1e57e0306e4fb3ffb0689d41e | ORPH
 microblaze  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7e54b5d1a9663d56eec866d7bd0540c415fd0b4b |     
    arc      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7963f28e608789636590b641e07105c778f6dc9e |     
  powerpc    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/bf6dd5c927becca024ff80eca799e1e767862302 |     
microblazeel |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/ad8289902132c4033e4092df215e38817ede24a9 |     
  mips64el   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/8dea050f0c4d2412569736ec21f3b46ede0eca76 |     
    arm      |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/9b1b00973e86459f0bf785693266d6995d140fed |     
    sh4      |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/3bdf3625c6fd391f88b9bbf7be6db86ea6759852 |     
 microblaze  |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/4ac19f507fe8d73ee184e2c00e7868cee2e0cac2 |     
   s390x     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/2ecff3ecb2adc3406c29f88aa578c689a5adf622 |     
   armeb     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/6f16e25088e9170900918ec3d9a96d5f3b25411a |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/abc6751dfa5a642b9e3c08aa7a21a707fe2d7e01 |     
   armeb     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/82a343d58d6500edd18ff982b776330b15183ff6 |     
   armeb     |         thrift-0.22.0          | NOK | https://autobuild.buildroot.org/results/0579f08cb0460e43e839e750f294b3774e520ca9 | ORPH
  sparc64    |         thrift-0.22.0          | NOK | https://autobuild.buildroot.org/results/242ea99f1c1c29fcc364d59a6a7efc8f11bcf76e | ORPH
 powerpc64   |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/39b049e502e643bff6fe7a706d3e0e2f92a71852 | ORPH
  riscv32    |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/203e2534f9150c5f943b72d870f3da8d3fe8cdb6 | ORPH
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/6428b9c85f7026f3911c9bbdd6ef72309e5722f3 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/7631478e5eab3f1c978f77d623e102be005f0e02 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/524f0940fc59454f48cc83781f3a88549b786f5d |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f3e24301368d92e7a4796136ed2de677aab3d0ad |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5a70899c980647f90a6b7944feac389ffd41aefa |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/48a534e9fb779e4c71c008e005d877bc19244c2c |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/7ebd969d5494456746bd9905ee4aa5118b6ea78e |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/3d592a7ff121ac7566066b4ff83776256c889cf1 |     
   sh4eb     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/d91bb874966e072c5fe3dd4634ae51d8189eec7d | ORPH
   sh4eb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/90cb9c14951340eb475d23882e9dc9129fb9787b | ORPH
   armeb     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/4cb63dbe81e757e4a3187ee4438005849e0568a5 |     
   armeb     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/20694eb01355c3a5efdec24e6eeb11e1cc5418e5 |     
    m68k     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/9035084b6de8dbfe220334087961449536bba608 |     
  mips64el   |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/336499bcefe5946b0cf0654cf25afdf9f2e5e6ca |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

      libabseil-cpp-20260107.1 | 1 
              libopenssl-3.6.2 | 1 
               openscap-1.3.12 | 1 
                 systemd-258.4 | 1 
                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/e6349337721247f6317a244b211d3a9042ca4d0b |     
    hppa     |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/23a0583b625be1e394b77838749eece2ad08a3bc | ORPH
   s390x     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/ab394bca2810cdc887551b0f7384d49ae836b504 |     
    sh4      |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/ba2ce6c3f1e747f1b7b6f41df74e08a746322ec3 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/c933b969cec80b57ca67cf05deacfbfc2f737f58 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                bpftool-v7.1.0 | 1 
              fftw-quad-3.3.10 | 1 
        host-python-lxml-5.3.0 | 1 
                  libnss-3.108 | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/a5993b6c0eba244e49f4432ae9a474b5d4670e45 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/6af801f0664dafddbfdafd14f6f50f91584c2da8 | ORPH
   mipsel    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/db0a956d65ef8cbffac157aed7af97d40bb8240d |     
  powerpc    |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/45c6347e1aef9f81cfc030132bafb70fd5e46ccb |     
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/727385c9f18c5fda46c988cdc2891b6b1379cd90 |     


Gitlab CI results for 2026-04-22
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028345390 | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028345244 | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028345074 | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028344840 | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028344625 | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028344402 | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028344248 | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028343978 | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028343783 | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028343617 | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028343458 | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028343050 | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342882 | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342853 | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342747 | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342616 | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342553 | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342481 | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342396 | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342354 | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342332 | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342254 | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342065 | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028342044 | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028341973 | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028341863 | ORPH 
...cv32ilp32dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028341649 | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028341405 | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028341357 | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028341069 | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028340948 | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028340749 | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028340613 | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028340274 | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028340211 | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028340078 | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028339825 | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028339785 | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028339613 | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028339523 | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028339503 | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028339282 | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028339216 | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028339176 | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028339100 | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028338722 | ORPH 
...90xz13MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028338670 | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028338603 | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028338466 | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028338355 | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028338331 | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028338237 | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028338137 | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028337887 | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028337852 | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028337770 | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028337703 | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028337332 | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028337261 | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028337204 | ORPH 
...p32dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336855 | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336821 | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336671 | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336636 | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336590 | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336580 | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336537 | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336386 | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336272 | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336241 | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028336161 | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028335810 | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028335727 | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028335695 | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028335549 | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028335354 | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028335325 | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028335040 | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028334952 | ORPH 
...scv32ilp32dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028334832 | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028334625 | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028334378 | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028334203 | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028334119 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028334052 | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028333938 | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028333752 | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028333699 | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028333362 | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028333336 | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028333281 | ORPH 
...xternalToolchainArmGnu | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028333187 | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028333045 | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028333010 | ORPH 
                  TestZip | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028332939 |      
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028332841 | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028332685 | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028332596 | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028332491 | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028332167 | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028332125 | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028332058 | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028331897 | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028331827 | ORPH 
             TestXenArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028313106 |      
...onPy3SdbusModemmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028299153 | ORPH 
    TestHostPythonPyfatfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14028295098 |      
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/14007804609 |      
  TestPodmanSlirpIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14007801501 | ORPH 
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/14007800316 |      
           TestPodmanTini | https://gitlab.com/buildroot.org/buildroot/-/jobs/14007798848 | ORPH 
         TestHostPythonFs | https://gitlab.com/buildroot.org/buildroot/-/jobs/14007798305 |      
  TestPodmanSlirpNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/14007797752 | ORPH 
...yfsVarBackingMountUnit | https://gitlab.com/buildroot.org/buildroot/-/jobs/13990994661 | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989926077 | ORPH 
       TestPodmanNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925782 | ORPH 
       TestPodmanIptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925781 | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925751 | ORPH 
                 TestLame | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925638 |      
            TestJailhouse | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925632 |      
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925560 | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925544 | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925530 | ORPH 
...SystemdRoFullOverlayfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925529 | ORPH 
...emSystemdRoFullFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925528 | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925527 | ORPH 
                  TestXfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/13989925517 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2352FF94CB2
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 03:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C984042318;
	Wed, 22 Apr 2026 03:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNeYOGCsY7_m; Wed, 22 Apr 2026 03:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CCAB42311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776828173;
	bh=nbnfIvPd/JkAKDNsHEueSQ4cuicE5g5damayVYACLwM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PryhuAUVRT4oMF2K43AJfM3wJ7fKzZvBvlKti285dJElINzcNxKGs0A5inT7oWWCq
	 ljT/zUP0qqK2jGYlzyaemEZuWtjAXsh2wmRxOB+f/OAfQAPZBDiJjxR0vqskf3RJEb
	 Rrkuq8LAcQdFOSX80qtH/k1qiZcxlhCl1Hg2+8NXBzlQTsrXD7D6Zc8X7gaTNhsIN+
	 4pb0gV6vI26Db+lrO2G/p1/LLsNg7tqts4vojylsnoDj2giKTSjrTwTqqFHizf+KNN
	 L9LXYdP+MIUmqnptFpJvXWCBZe4m1P9wOVRL5Ip19alKJD2Vb7wEoiNEG/e/awUJ2G
	 5NfgIOOCJaXjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CCAB42311;
	Wed, 22 Apr 2026 03:22:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6C8024D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 03:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A760C843B8
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 03:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ScbYRMYxhnk for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 03:22:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE81E843B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE81E843B6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE81E843B6
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 03:22:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso24472855e9.1
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776828167; x=1777432967;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czV5/wOrg6mnJBYaZwTW5plE3OcFyg1dwKMDRQ7LC7I=;
 b=eY1S2wAJfkP94BUuMj1HHuWpnvafuD4DNt+NJQs4kjnPt59kighSsGRifeJfuA+rx0
 8MPca9fXEO5OAN/8wFjP453oV4vkiErl18KQXF2Zr8LJ05OytIp0wY5A6ze+4WQwBIhY
 KYu+S5ifyNdZTOmJVE9pPGW450LCIqh2xDT8A8YBUi8636enzv6AwP68uc+QEGL4YQPH
 ZITi/eX3zlRs+39tqjccJ7Z6LCksChPuydyuIZC2B5QbjZWdyiMVCcrDJwlWIQZf9QKj
 Gda6MNGZtlk3MWbyaRLXC0cuTCd5lhrAl3PLgUr5nyfOzbEvKAyQulicT1ShDe/3M6f1
 sO0w==
X-Gm-Message-State: AOJu0Ywc8YhunhXXTiZGg77M9J5TomCfJEhpOgO3xh6MJr2roAEMN4lD
 yHdL8A8djbdrEA9ravTYvpQrNn40JTbz/QKDkS3R3ZvXnulKT/S2tuBdTEzH7Zu4
X-Gm-Gg: AeBDievsJ1NRT6C9u1usjmIyt/KaGiHTKeSftFdaf3oeAm4lRAzJ883HVGPDbqKlJEK
 YEdER1xcu6cVQoT2q542Cdb/PbmNbylUof46YnsH5t5CfYZW+G5Q73WufPF4wEMS5wuOhYFEL0s
 6Oo/GDBebOIxRk9ADI1dYGwpuDFot4I68MO9MVMEaXmhCTtFlx/RnnQRZrTjXI4M2sIx04Z7fmD
 AUyOkuMxC5ov4hdBRzH5Yp3shDFihxYE+aHFY9ihaJ8AW9v7fPJQ4w+1bKD9vGRfFfoG51CJcIH
 5P3y0bYnATWguMsOA6eLo+qsfjmHUSlWKB73bqQFrualI3lSDFaIYvYOYttXXGd0f9kYUuunfNw
 oR8O42/PV7ATrXy+Ao6SmRx9Gj1e25qNCPTvffDomBRZBFdz8xH85ntN/PSJ/2vQXnV43pDrkF/
 SBDdO7UluuCbW8EtUhnkFc09+R7Q1Ey3RJ3g7pLE1B
X-Received: by 2002:a05:600c:6209:b0:48a:592c:e63d with SMTP id
 5b1f17b1804b1-48a592ce89emr29796365e9.14.1776828166355; 
 Tue, 21 Apr 2026 20:22:46 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c01cfsm429646335e9.10.2026.04.21.20.22.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 20:22:46 -0700 (PDT)
Message-ID: <69e83f06.050a0220.5a973.90b9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 22 Apr 2026 03:22:46 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776828167; x=1777432967; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=czV5/wOrg6mnJBYaZwTW5plE3OcFyg1dwKMDRQ7LC7I=;
 b=ni4dr31bpXcWQA7Snwbk5TFsypRiP5yUoJr+8tfyXlBK6xu/Rblzufsw/aDQLeQljx
 f16+xKBD1DGsBXkL6LNAmqE2mKnu728IK6xpXa/sgOqzyoBXXHuNn6l40O6s89HAH9x4
 1qAHK8vizRSndjg1cl/wgL7RJ6qK6U1DbLJ0ZZ9V+vEfDCSdYaBN5ol9w+9Bv6jBmpQK
 DbWPwTjOGIraqGusDQzp5SwV79sEqFZVn+TZWu005iY7S2NtXb39K13PBkWirhsx+cej
 UCCUV1+4th78RO7nWp03S2ufIWPHtV8CQWDqxRdiyqzxZ2rcsMQZ/cL4QL/XqRIbrQRt
 ga2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ni4dr31b
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-21
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

Autobuild statistics for 2026-04-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 20  |  0  | 29  |
  2026.02.x  |  2  |  7  |  0  |  9  |
    master   | 40  | 78  |  2  | 120 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.84.0 | 5 
                   perl-5.42.2 | 5 
                flashrom-1.7.0 | 4 
             util-linux-2.41.4 | 4 
                  libnss-3.123 | 3 
odhcp6c-f19dd37fb467c9cf10c... | 3 
firmware-utils-c42a3bc53da8... | 2 
glibc-2.43-17-gdd9945c0ba40... | 2 
          host-xfsprogs-6.19.0 | 2 
                  libnfs-6.0.2 | 2 
                 linux-headers | 2 
uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
                 babeld-1.13.1 | 1 
             dahdi-linux-3.3.0 | 1 
                  davfs2-1.7.0 | 1 
                  dlib-19.24.9 | 1 
      docker-cli-buildx-0.25.0 | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202602 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.2.0 | 1 
       host-nodejs-src-22.22.0 | 1 
                   iotools-1.8 | 1 
                  libbpf-1.6.2 | 1 
libdill-32d0e8b733416208e04... | 1 
libfutils-c326ce0cc2a735438... | 1 
                libgeos-3.14.1 | 1 
                libglvnd-1.7.0 | 1 
             libgphoto2-2.5.33 | 1 
           libmicrohttpd-1.0.5 | 1 
              libopenssl-3.6.2 | 1 
              libsecret-0.20.5 | 1 
                  libva-2.23.0 | 1 
            libxkbcommon-1.9.2 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260130 | 1 
                    lua-ev-1.5 | 1 
            minizip-zlib-1.3.1 | 1 
                    olsr-0.9.8 | 1 
   openvmtools-11.3.5-18557794 | 1 
            optee-client-4.9.0 | 1 
phidgetwebservice-2.1.9.201... | 1 
python-remi-2022.7.27-37-g1... | 1 
                 rtptools-1.22 | 1 
         s6-linux-init-1.1.2.1 | 1 
                 sqlite-3.53.0 | 1 
                tpm2-tss-4.1.3 | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
        util-linux-libs-2.41.4 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/57e71574e710eb49f265be13a908ca828d12f50a |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/74e10bb2b943903694568ced842a83b017bad86c | ORPH
loongarch64  |          davfs2-1.7.0          | NOK | https://autobuild.buildroot.org/results/80acb880e22be684ccaaa55ad2019bb7aca0caa6 | ORPH
    or1k     |          dlib-19.24.9          | NOK | https://autobuild.buildroot.org/results/f83bcd4b289615e2a8dedefcc41f91d7bf7d9b46 |     
    arm      |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/187e58035e117671e4cdd15ac27d4555c25f9f9b | ORPH
    arm      |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/b7d80fd0b75e3b1360b1b7770bfe48591e6be015 | ORPH
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/37c089028a0cfa923ffbbe9e7f42d7c67d440569 |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/32085774894573e2257cfec5e78ca80ee4456740 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/abfcc31a805784405f3fe4d72797a03051d597e1 |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/dc7209a5f0e1bafab2005bbf695295f1b70d98ad |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/37906fdd1ba3ff55083428e4392412887b5f23a8 |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/c329e1611ad8d9c3ed54bc9d32910ec01d844bae |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/d4bce24ca1f6cf4b3f29803a9ddb8aeb2df3c208 |     
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9f98a33df6cf0d3c7d78d4bffb54489906d05911 | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/77e12e94d6601fa7073b0e426a294aa97301d0ac |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/200f21095b2214dd4f1a2f949f2df4dcd47f0330 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b846859122daa76bbd53c0e697980947bcfcd385 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f3c5877b7dc3633cb654700894903da78ffd8aec | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5ecf3d4c88f454d124851f09adce8bd7dd38e084 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5c568afc5fc00aa6313f34fbc45819d2c3a1f1d4 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/edbe4879314789be99046805892b6ea17dd4f036 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2c49e9b01f2b8e029315b059903e2edf2a5a0de8 | ORPH
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/de80f9a75009e6c567b6adfbe3efac18e551f088 |     
  aarch64    |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/78307b1b45b32a3b574591b3296d9b8789f63ee9 |     
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/e745e24cd30ef9f6ac233cc411925ea196db6887 | ORPH
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/bc1d0fb3afab16658190b768eda3c84d6a18a84e | ORPH
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/fe40807cf3ab7079f396f7fe53d2a1cc258e9c38 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/3e3bee463e69200cc17ff9a60c2b877ab8f24e87 |     
   mipsel    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/2381e1fe2d5e9390ef0de4711b40a89d60ffc310 |     
  sparc64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/49331ae6636d86b85dbbcb79d728076abe41941d |     
 microblaze  |         libgeos-3.14.1         | NOK | https://autobuild.buildroot.org/results/e750587b9847f165b61e8c9a502eacde48036e80 |     
   xtensa    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/8e850a753b57852e00ca59529dd46657b5cee3b6 | ORPH
    m68k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/d0b9188db5c7906cd28a557ef85059eb423cf83a |     
   xtensa    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/ae6ad3cf3246cd4a38baae624389df82eb582283 |     
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/4f603ab4333f0fc564b098753aa39c736e9ec132 | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/c448327c3de1eb77b1c9fd90a474d2998f0a3390 | ORPH
   armeb     |          libnss-3.123          | NOK | https://autobuild.buildroot.org/results/47689da85c8831aa61de45b2a2e329363d9090fa |     
   armeb     |          libnss-3.123          | NOK | https://autobuild.buildroot.org/results/c89f1cdca9defe4ab57967ab2adf7cb00177d5b2 |     
    arm      |          libnss-3.123          | NOK | https://autobuild.buildroot.org/results/e977a245b469641c8602d71e9c3a91c93c6e6964 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/0c40119982dfcf16c7c9dfd561f704f362466147 | ORPH
   mipsel    |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/88019f5a93137160e4214627783cbaa7ac06c45b | ORPH
   mips64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/48ca6da52aeb0d693020bd82333c5420e5ed5eeb |     
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/624413e3ca06f525be3fc8c301d75f07b329dd4e |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/e264f485cdb5877a619405153c0ff76c2b80a7b5 | ORPH
 powerpc64   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/8de7105fb243d77b2f718b1a217688c977cc01f4 | ORPH
    i686     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/976fc46fd80da862278972a91bf33a746267f24c |     
   armeb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/3da111cb3d43a1249fad5aa28f8bd1073447641c |     
    hppa     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1bd4b2c98084ce5b9dfc02287a5232bbe94a49f9 | ORPH
   x86_64    |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/682f30fcfe6b7071a57b7559b6448d60eee9678a |     
microblazeel |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/2e6856b2cac0e8607a3da789561005b309ad484a |     
  mips64el   |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/5cc3088abc11642fd6e07730f412d76f86464f55 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/77ce6220284403d55669e32b612ad51ab2e920fa |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/79405ffc2feb10b8d8da1a66bc344d469d34db27 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/49607d3d9106a8a1b65fa05f6aab46657ae8a0f7 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/520016e029583a2ac3eb3e6079c5042bbace3a5d | ORPH
    i586     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/5bd860b1618f15bd7ce7523ae3c5f98d6dbc9f9c |     
 microblaze  |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/9d6ba6ba10175a9b522be012e7925f410c4d5e11 |     
   armeb     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/63d206c84f860c30ccff197e4b4a755e6f8e8d94 |     
microblazeel |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/9b8d2a40252d46deafecd8cb3dbf4eb18c2697a6 |     
    m68k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/1cc21c624d2109de8d3bbcebbab598fbda899693 |     
  powerpc    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4a6b8b44790d4d0cd0b9fef56ef8dc293f4b1ab2 |     
 aarch64_be  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/86ad29ca3ee14b8dc655a29ba740b545b1ae157a |     
   armeb     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/47d7dc55fe4d6a176cc3fe64479b1edf60bdc1ca |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/1985c49faa957799e981c1f9fc88c7f17a67ed57 |     
    mips     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/7de7bc27fdb2201eaaf60764f81a3548072d1d9b | ORPH
   armeb     |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/6f92017befb7c71004abcabd4413c1190c424e46 |     
    m68k     |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/45bdec276ce73686ddf25927763a62ca1866959b |     
   mips64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/c6f0c4d231b1cf6a00fbfae954f87389185153c9 | ORPH
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/10bfdf31b3325f3b0a27f5d8ac632827407b0e6e | ORPH
 aarch64_be  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e38f63a3f7699fca3836ddecdd3ef04f4c25c3e2 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/e4305eeda545355def31c0c0b38e2317763525e1 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/f39a8eb91fa46c42138ecac120e377176d655b18 |     
    arc      |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/1cc05b31ba2c7e1f972c27213a1a02779638c176 | ORPH
    hppa     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/5a36feab4e1502af1cf0c49c28df584ddaa21e1d | ORPH
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/83b8205f7556ebc2030adbb859a1ad97b3a36574 |     
    or1k     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/159a3f830aeaef007616056ca633f0931aa70f5c |     
   x86_64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/07c48746fbcd21be1691c79d8cfef8ecb8a78477 |     
   mipsel    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/8f40888f17df0a392e53b23a84229f19c63650d7 |     
microblazeel |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/6c8cd3a963ff464c2aa2d84acef6a67c2d44bff2 |     
  powerpc    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/39d088b1ff921b8dfbe43fb51d0e6b11224ebdc1 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                       unknown | 2 
              libopenssl-3.6.2 | 1 
        ltp-testsuite-20250930 | 1 
                 systemd-258.4 | 1 
uclibc-ng-test-132c6134d691... | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    hppa     |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/0469f7ea3bee0e3d8e4b6926369296cd21e39fdf | ORPH
 microblaze  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/57485b3884eceac229b52869702900ee9a058529 |     
 powerpc64   |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/e342a075ec6cac3c0fd82396f2fca9f97c816f23 |     
powerpc64le  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/9435135e07ec49b58c9531b64dd86e5dfa4e5209 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/692076db127d0300edcfc6044b13414694820a71 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/e4496e629d4fa8931e1ebc0166ebf92fddb8f369 |     
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/e11df4de945b2f507d6c4be786a0e1ab27d7e257 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 3 
                   fwupd-2.0.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gerbera-2.4.1 | 1 
        host-python-lxml-5.3.0 | 1 
                libcurl-8.19.0 | 1 
                  libdex-0.8.1 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   linux-tools | 1 
           oath-toolkit-2.6.12 | 1 
                 openssh-9.9p2 | 1 
package/linux-headers/linux... | 1 
             parsec-tool-0.7.0 | 1 
                  pdmenu-1.3.6 | 1 
               pulseaudio-17.0 | 1 
          python-grpcio-1.70.0 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/baab7bcd050d0cd0ff25f9114123052bd0549db2 |     
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ed1ea50573e6ae7c4cbda7740c4d94e10d10ed7b | ORPH
powerpc64le  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/efda89f51955adee4704cde22bddb8b10559c78f |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/0d48937822f343e8973f0777c415ce3c6eba8f5c |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/47d35221c0b28ca42b68ab2c1efab1c2d5785676 |     
   mipsel    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/f4af66090db52d73caeee9725de3dc27ab1f2481 |     
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/815d3caad2d215dbcda6702d974e3930fd391081 |     
    mips     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/5fdef78bba71917e2f68fd3a692b167a191cf052 |     
  mips64el   |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/61844f9688106c6e7088af7b8eeb6dafb3e85a13 |     
   sparc     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/e7417138d1dceecb156fc7053252e019a34a408f | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/482b66d43ccbe842d91e27dd527d140a54004059 | ORPH
    arm      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/6f6b1a9ab1c1ff8cca6ee6c1816516b8406fb18a |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/767411b34cbfb20cfc0713ddb88b2c6b67a17aca | ORPH
  sparc64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/cb68f65178fb2ab3a3262bfe30259de166242350 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/a1dd56b0ca2382d79129e3ee2a0f444da5294c2d |     
    arc      |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/4a635d0fb20e895a9cef48645284ebb8356978df |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0877ee0a5f45cb0e56b9247abffdbd0c8e522385 | ORPH
  mips64el   |      python-grpcio-1.70.0      | NOK | https://autobuild.buildroot.org/results/9cf98bff7ce05262d6ff4221953901ae5543880e |     
    arc      |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/a06b8a1fe3668a7c1c9d2afca1669266de4718d4 |     
 microblaze  |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/4191ac7a301f5f4db92ccd51d78392822ab8de21 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

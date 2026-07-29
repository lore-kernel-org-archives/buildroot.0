Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F08C53219
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 03:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BB2D40A80;
	Wed, 29 Jul 2026 03:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4ynAP5FuKor; Wed, 29 Jul 2026 03:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAAAE40A54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785295754;
	bh=0h9itjihPlN7JkswIWvc8c1tZVPsuN5dRZ4pwY5VVTY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c4HvL/sm+dJ+5ho12kVKdZV+fkXpcUIY8AFq+ftSW16k0AnTa2Lk83+G2S+1gaJzr
	 uhe8BDXitSwEl967p3bFvgocD+rAtY5/e4MQgZaZcvS6ZfZjk1YkwZiu+imTXrUlUK
	 8pOcgXYd+d+aKfr/zRmpOuCL857WGEiMfZMHWy35KdLkJzJ1UC+6DSK0GHdJ2JoUvi
	 pHKu5PjW3LQObYsJps1l6sVpV2czkeYpYi74Tmmhtpwn6tNaiETkAf31HV5vwkMD1L
	 eQg8QUH8JPqitmB9MkMw6pHRijxOibVItaIsofAuZOwSNizkNJzZOGA21JHTVp+Cv6
	 PWFkDxC/NhekQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAAAE40A54;
	Wed, 29 Jul 2026 03:29:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D37FE4BF
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 03:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B970A40A60
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 03:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7FFUmy_pPTI for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 03:29:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F5E040A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F5E040A54
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F5E040A54
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 03:29:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-493f75f7172so3627195e9.1
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 20:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785295748; x=1785900548;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4FhoVZr/hYD0hKnxfoJ2gm1mtCpesWzpTkVb0hz7GEM=;
 b=WwzAoe/zGmGMNbBo9Z2mpC3RLXGC6z8K1kl8Xo5UoJTLh1nlx/JHEaFHK/KBj0paYa
 VmjNjE7t7G6uJWwsj3ZBpSUZanN7mxjH6hnqc/AMgN0EgsCMdhXwIg6C6kqrvpvv1GMR
 NEWi5dlWelAABCudH8nuXSrMeY6i6liIiKn6Jk+qv9dDvN3HiD5I6ckv5URNGhNU0W+3
 4/qYUxT/AglcAyYpKzL/c6ZFy+X1htkwHZ2VGpYripdAT2HdEb3qHnfhTCZ/TiQbsfS3
 kp7aWrHNwmzHjfP/fzaJi3uh9kzmNdJcIW3CD/Tr+MlhlscLGlTI26gTSXEMpu2g+yoV
 0+KA==
X-Gm-Message-State: AOJu0Yw4D4P0RvMYOQJWlEN2cqGWVAf1qTCx1rUiI0XsGQuCQr7K6Bub
 /D/eu08SBXd9kMW7RZl+TtpjwWlH4mHZ+Xd3UOWhwXv/FfSSAEu9srSsnAv86zwZ
X-Gm-Gg: AR+sD123bwxL69sMtGVTq+kRgg3R1HGirL41IwBoxbhqF05GkAZNgKdAcNbxXfoYxk7
 5M8M/L2zHciTn97+NuSsZnqXY8FBEJLESQ/v3yQ+e064MuK6ry6l5/vdkbSaoiIS1XH0aUl9aw/
 zmA2N4WdyM2Y2Xiak/sDi0FKEtrxkrgDtsskrdw5T5zOmwpvwaCjcsg1L3utqIiOxM32GHOU/nP
 3j7ySz8bHF376N8v0bXAryH5bCGXl4/3OFfMV0GoshF4AwJdbemgKUe0kjZ6xL/SFI2CmImUStr
 lLi/LVE74+1ZaBt5dgjrZIZiA7xW+mzWbWcUokgsZWF0Giojjah+v4H+oQnlxLxMNHi+k7k6kFU
 QpkMgSrzsPG74/GUNKTiDhe/5pCm5QdM5IHQkC2CsHZyog3hwjPxgNSdMhuhCUfveGDFP46szdH
 nQw5SEE5EzdNMJoBq5nV4F/gIkTbo754ZWQN9eEwFFvwwTF/kuRL2a+AyJy3iWnv8=
X-Received: by 2002:a05:600c:628d:b0:495:4a27:483f with SMTP id
 5b1f17b1804b1-496c6586d39mr47341305e9.29.1785295748044; 
 Tue, 28 Jul 2026 20:29:08 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496e905fa40sm24505315e9.2.2026.07.28.20.29.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 20:29:07 -0700 (PDT)
Message-ID: <6a697383.55395e76.bdcaf.2605@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 29 Jul 2026 03:29:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785295748; x=1785900548; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4FhoVZr/hYD0hKnxfoJ2gm1mtCpesWzpTkVb0hz7GEM=;
 b=pKzn9YgLz7InxFPv6BwNF/hzn6LGij7komy9Zkx8stMHBTQ+Hq+u4zIVh8NtHO003w
 NpjLxUzaddrEnPhPsoWtiJXwro0WG0qiHfmPN7VEqk1w1iVdkZ0V1b11JiYQHnxOLXIO
 x1ugMMKgjbXHPIuWO9NHr/4MxKHbJT6B/b8lkaaRFu39Y8twfezqFYPh+mjaUYRBisjU
 DAOtYWvHH3D3fR3+RMZtRUlQknpQ8KDy61ai3tgmEFeHcm1aGPYk7G9jPS85GxqJFYht
 /H3Utn4l4aR/hNFyXRWtRtxk8I7/kEy17rN+k5OgZCEZL9f5gLgEQjAG6uIqxSEhxb9l
 DJQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pKzn9YgL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-28
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

Autobuild statistics for 2026-07-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
  2026.02.x  |  2  |  0  |  0  |  2  |
  2026.05.x  |  2  |  1  |  0  |  3  |
    master   | 22  | 45  |  0  | 67  |

Classification of failures by reason for master
-----------------------------------------------

              jpeg-turbo-3.2.0 | 3 
                   dante-1.4.4 | 2 
                libsoup3-3.6.6 | 2 
                    olsr-0.9.8 | 2 
   openvmtools-11.3.5-18557794 | 2 
                 systemd-258.7 | 2 
                    attr-2.6.0 | 1 
                    basu-0.2.1 | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
                  delve-1.22.1 | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
                    frr-10.7.0 | 1 
                 hidapi-0.15.0 | 1 
            host-binutils-2.44 | 1 
       host-gcc-initial-14.4.0 | 1 
            host-go-src-1.26.5 | 1 
          host-xfsprogs-6.19.0 | 1 
                      icu-78.2 | 1 
                  iodine-0.8.0 | 1 
                jemalloc-5.3.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
           libmicrohttpd-1.0.6 | 1 
              libsodium-1.0.22 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-tools | 1 
                   mpd-0.24.13 | 1 
                  ntp-4.2.8p18 | 1 
                    opus-1.6.1 | 1 
                   perl-5.42.2 | 1 
            python-iwlib-1.7.0 | 1 
   python-pydantic-core-2.46.3 | 1 
                 rtl_433-25.02 | 1 
               tcf-agent-1.8.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/68ea28c98e2c7fa8ac08e9c0baae939954d49b0c |     
    i686     |           basu-0.2.1           | NOK | https://autobuild.buildroot.org/results/4ceebab505697a957fec3c4c2bfcc526de0dbcfd |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/4e595bf67a3ac21965f12a5fcbe74fe17eb4d608 | ORPH
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/90e650975531f369ca3fdcaee0f50f29b5d13b29 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6a1977e8a2507953c983ff844adb751cc3db94d4 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/70eb8ef9b0ea6a457c5f721b617dec228329e5bc | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/6a4b3628e5775ed665e20f925e7c45e5e5a25ea2 |     
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/22868aceef492902d7fa65566e1d716d6cdb1fbe |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/50d06a68e579b60e3acce35707f247eac941ae0c | ORPH
    arm      |           frr-10.7.0           | NOK | https://autobuild.buildroot.org/results/2e077f16d3701dcb3eefff592405a65e7bc575f1 |     
   x86_64    |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/4b2e18a42119f51b2f31a7126f61478ed50163bb | ORPH
    i586     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/be2e08b33ee3b7aa1a1c473576f148657457d00e |     
  riscv64    |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/cec9de77ff782d3b90ed3e433d3b834fda4055c4 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/e05d9992ad5c6310d56a4dc1c096b173d0930ad4 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/a72a26a46340289d27046a8a82367d047d19c375 | ORPH
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/f20530fef520032dddd859a9dfe0d91715e54560 | ORPH
   xtensa    |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/c3755cf60c02b9b8164feaba88611ce82eec27d9 | ORPH
    i686     |         jemalloc-5.3.1         | NOK | https://autobuild.buildroot.org/results/f5c4c2e3176d879f7ec584e0c8c801977b24914f |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/7a24146fa8ab022e2ade692cce45ed5f1ad221a0 |     
  riscv64    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/978960b8abc270b9a2252efabccf5e8e33855a56 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/e96a90af3feb6a7b2e3e14cbdf4711f68a5bd4f5 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/b519fc0a75c5fd0809404df3e2dc3d7da77a564c | ORPH
   x86_64    |      libmicrohttpd-1.0.6       | NOK | https://autobuild.buildroot.org/results/bc75e811647e6b4bb519e872a9f2ff575b5eb3ed |     
  mips64el   |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/59b55dfe8340fc115bc6c5009d8d12867086921c |     
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/a21564f921ff457cabd078327bc45700dd5bbd17 |     
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/09b531cc1e9061340cd753a2f1557e5f7c4c2845 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f78d0844d6d40fdb0eb22ad1c82a2a5c7c538fdb | ORPH
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/98381085bfbd34b24b92906486c8648e6b13e43c | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1916c06c3c8ee8b6ca1a20b188a92e19c55d270f | ORPH
powerpc64le  |          mpd-0.24.13           | NOK | https://autobuild.buildroot.org/results/b070248b2bceaceaaed8e826b1247ccfba1ba9fb |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a4e70bfc3cd0f26962870b235cc72ba1f20aafab |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/4de0320a0fe920433840d255acbdc0a3c94de61a | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/ad7f812f19204de2a6e4bce802a9a44283aab111 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/a386498a20197f1b450dd28df55ad345904ce1ba |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/7224f4f99935936f7aed3b68b84c74a74714eb49 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/639e354861e448cab0f325e17ac162ece06e514e |     
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/726b1e38aef7c13ca16f63c6624102005adb9422 |     
    i686     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/9fa4a5ab72fa4f5ac35aac38b7123d8a12f2eddf |     
    i586     |  python-pydantic-core-2.46.3   | NOK | https://autobuild.buildroot.org/results/1cf9f03da161adb5e2fc7d7b1b28951d1a540f1c |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/778d1f1647da2350a7c1e3d1fd573a401dcf84a3 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/ffe2b6fc37cd24e2c993b33c7ee22a3648301b41 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/2e5b94a7769a2e88983b26393fe9a3b1b57c9940 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/18b7162d7b5a619ccb5deda6763dab6b4bca8c8c |     
    arm      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/bc348de0f7e73dc8fcd58f7c8464d6d6ad3262dd | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/4734aaef8a35740c7394d1fda01c51a6edba0e43 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

    host-mender-artifact-4.2.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/926b6f466e06f773489e544df5121df36eab1ae4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 2 
          cloudflared-2025.1.0 | 1 
            ecryptfs-utils-111 | 1 
                  iozone-3.508 | 1 
                   perl-5.40.4 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/3e8404ac1622a3af265f8b83feb13e4383860670 |     
    i686     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/a604c7976b39b152b3a65d33fe2e717be35c5922 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/28b423bf0c72bb1a18ab144f8c981b24110f2b02 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/91627ff05eadc2645e561c61e9e5417df1ff8462 |     
   x86_64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7cc2c9108b949567b348104093e0121fec5730f4 |     
    arc      |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/c9dd6648821554c2baae1223ae89bc739b3e1079 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

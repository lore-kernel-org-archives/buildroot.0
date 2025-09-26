Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EE3CAC5B5
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 03:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E981061762;
	Fri, 26 Sep 2025 03:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjgIgv6nGc0e; Fri, 26 Sep 2025 03:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79C7A6176B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79C7A6176B;
	Fri, 26 Sep 2025 03:19:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A569A198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B86982329
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBL1xuLoi8Lg for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 03:19:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB1FA822CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB1FA822CF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB1FA822CF
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:19:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e37d6c21eso8565435e9.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758856791; x=1759461591;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WNJDL9DKIe0oRzIaeDg8Uinah1BDno6jn6SICiaiZF8=;
 b=F51UDc3/Ql8AsWQWa8F14U83OZjDUUHod9j4b5reltZs7hofxtaP3QpLnjG2XavYly
 m2gQrlH/NNDOmBztHLdpR8FrzCR3qwBJ02dx75H8pdhB1BKfsyJy2FxWyxKx4io2uThf
 fZAXViIhEIHWUZ1kF58Ge31D3wBIw2Hl3jf52Da+gcer6mAmhB5+svMYww1ANSo9yG0T
 6xl7+M+vfnDNQYEeXG0AQN/XeUv+WmuZDiOgPLxA+edQQ/xErbGSTnie/+5fzUBnz8aK
 PUXQNJAIMlExrWmEb6+QlcmH/x/A2WU0VLYXMWnAlPYZ9XX18ZUAgRyV8L8irQLMwUaX
 8grQ==
X-Gm-Message-State: AOJu0Yxc8xFBcDR/F6KWT+zAl9JMiV/E8VncPX9BTLXryMeJcVt2S8GY
 UOaCwczuR5PP7gOzMN7iFchtvk1upBw/o1XEqPmzryZOb6qGvptzf+xoyht7Ew==
X-Gm-Gg: ASbGncs58vy5VpVnMZO6Ra+h9zpmgisTv11b8YLKyggKWBiY7ugoQLB1Nklvo5GhVbr
 lpNxcfbvUP4OzbWBz4+qTXQvZv9K28eT+YcQjINJ5Ci04VRnYZtbBdYPhcYI5Xia54YtLQ86P8F
 Qn9AL3ib0gO8CU++EOw4JVdKFo4A6dccGzHgwpcYB17rdEWBVgGJebG+PMJ9xC+Ali3Mt6lmY61
 4JKpZYnSPdSW5J111qfXK4N/VNWpuj0Ry3yplk++M9353ryPJNey/vXcSu5j+MMJxkBzkmYfB0s
 65ubT2ITt0C6PrEscFRpGJMv3HuhgfOfKiP7ftupWEyrvN7REa+njtjTAG6pL4IdzF4kC3vlV8m
 vxoRcwogbuXZOKtH9OKQnV26QuGyRMg==
X-Google-Smtp-Source: AGHT+IEa235gTUhNBUdjxbHZ6W8tICu6QScPiHwkcm/lbjW0oj1bH4z5XIcmai3WcTcopXseyaQJog==
X-Received: by 2002:a05:6000:2912:b0:3eb:f3de:1a87 with SMTP id
 ffacd0b85a97d-40e49e725f0mr5818756f8f.56.1758856791212; 
 Thu, 25 Sep 2025 20:19:51 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7d3780asm5062907f8f.52.2025.09.25.20.19.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 20:19:50 -0700 (PDT)
Message-ID: <68d60656.df0a0220.31c288.3183@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 26 Sep 2025 03:19:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758856791; x=1759461591; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WNJDL9DKIe0oRzIaeDg8Uinah1BDno6jn6SICiaiZF8=;
 b=dMy5enWR817DJMdL9KZboYn6UKMKTENLR+LZrPAIQg4eO+yQo+m+AUaLmYAtnlcJWl
 hDMmRz+eMK3gnqdOlQ3wfcFHvyRA+bpZOqBEgQrB+FvExSRIfKXlBOpVAs6jBdklSr4M
 CJNljUzzVa1Kp6AucFa5Hv/8xh2HeeP/MF2pTESWlXF3iEfI6kWMv7pzFS7vVJdKg+Um
 dFMbbi469+gM4n3yqLQBHUE1NyAI0VnuX4cyaa4BZ5f+DyHjI8G7ALHqHUAvbZ1nrUw5
 ctkTQmo5x/66GSImu7L23wY80gYZNGX9hD+qEETxfy/iETDKC2Qgv1DT4ZpkF5PI7uhA
 lnmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dMy5enWR
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-25
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

Autobuild statistics for 2025-09-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  | 10  |  0  | 16  |
  2025.05.x  |  2  |  1  |  0  |  3  |
  2025.08.x  |  1  |  4  |  0  |  5  |
    master   | 26  | 91  |  0  | 117 |

Classification of failures by reason for master
-----------------------------------------------

                 logsurfer-1.8 | 8 
libdbi-drivers-0bfae6c43134... | 7 
                   cvs-1.12.13 | 4 
                  linux-6.16.7 | 4 
                   foot-1.16.2 | 3 
                   perl-5.40.2 | 3 
               bctoolbox-4.4.8 | 2 
                 c-icap-0.5.10 | 2 
            micropython-1.22.2 | 2 
                openssh-10.0p1 | 2 
                python3-3.13.7 | 2 
              skalibs-2.14.3.0 | 2 
                       unknown | 2 
                 agentpp-4.6.1 | 1 
             alsa-utils-1.2.14 | 1 
amazon-ecr-credential-helpe... | 1 
                apr-util-1.6.3 | 1 
           at-spi2-core-2.50.0 | 1 
             berkeleydb-5.3.28 | 1 
                 cdrkit-1.1.11 | 1 
             cni-plugins-1.7.1 | 1 
                     crun-1.22 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
               dvbsnoop-1.4.50 | 1 
              e2tools-0.0.16.4 | 1 
                enscript-1.6.6 | 1 
firmware-utils-86739f2b3ae9... | 1 
           ghostscript-10.05.1 | 1 
host-am335x-pru-package-5f3... | 1 
host-firmware-utils-86739f2... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
              host-swipl-9.2.8 | 1 
                 inadyn-2.12.0 | 1 
               iproute2-6.16.0 | 1 
                  ledmon-1.0.0 | 1 
                lesstif-0.95.2 | 1 
                  libbpf-1.5.0 | 1 
                libcurl-8.16.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libgee-0.20.6 | 1 
             libgphoto2-2.5.27 | 1 
                libselinux-3.9 | 1 
                libshout-2.4.6 | 1 
                  libsvg-0.1.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                    mpir-3.0.0 | 1 
                 netsnmp-5.9.4 | 1 
                openvpn-2.6.14 | 1 
                 pixman-0.44.2 | 1 
                    quota-4.09 | 1 
                 rtptools-1.22 | 1 
                s6-dns-2.4.0.0 | 1 
                    sdl-1.2.15 | 1 
                 siproxd-0.8.3 | 1 
             util-linux-2.41.1 | 1 
               valgrind-3.25.1 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/eaed051368f1d365a4b939d8396a5089c35b5829 |     
loongarch64  |       alsa-utils-1.2.14        | NOK | https://autobuild.buildroot.org/results/90ac394db3c33db11dd86d979fad62fb317ebf61 |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a1bb39cf839980c950667cce0c7920d5ab1dd9dd | ORPH
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/eb6d51e702e9eed3c7ddc2e09384f48da6580527 |     
loongarch64  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/c836f054ce8629fc48ef70f1128149b32fa6d059 |     
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6cc5346508adcb5ca5019117270fae9ab028c5e6 | ORPH
    i586     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/71dc06bacf1d5479c65738d56595fd97c35a9c7d | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8aa85fde19d09d148aa8a101c8c9db1e22f4ffdc | ORPH
microblazeel |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/9b516ff025390e4e33d335a4b66445f7e9c29d40 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/f9b688df8363e19479c46c6a7f6a106f18fa9dd9 | ORPH
    arc      |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/da0a2031ff325e97d391e746a4439d15f904829d |     
    i686     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/0900c8c647fb13ebaf8edec517d29a8dee0b61d9 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/7fd25d2e9204b9ffc886525a9c5a213edd5a9341 |     
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7ea7153ba9f9aae9353779c9e1a2c6de8d196c97 | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/755c3e86b85b3162999c3c874c84c4f4c50e679b | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/40d4a455f34209fe7da08b726609b775ca07b29d | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/28b9c511cdc88c1ed7645b5905c3a055d9e7a1b1 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/711172f3f32fabce42c5889106d7abb5e5e2b773 | ORPH
    i686     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/dd631b6546d3b68b01483ea34332ee1f51d10415 | ORPH
 microblaze  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/d24b19ce0ad59b9377143a365fa9c56babec12c9 |     
   mips64    |        e2tools-0.0.16.4        | NOK | https://autobuild.buildroot.org/results/194afc8131033009db5e97245ec6224f4ca0f431 | ORPH
   s390x     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/f737628121cf49e0ce6a45692304f94a88b8a7eb | ORPH
 microblaze  | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/1d4bb93cece6c18d4a54f87ea2e84bf239df4d9f |     
 powerpc64   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/18e65be2f52be6dd592b5e1c9878de4d52254b1f | ORPH
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c4cf9c2cffae70d6c0a9ab6dbe15f7297b5955ba | ORPH
    arm      |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ed80c48a8605f7628527b1c8a2d08287d44dbfa1 | ORPH
loongarch64  |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/00541c8ead17fa904864c67b88b7e88c581e0f11 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/3514574f23dfd20a6e3b80c0f7a3f73f8969c0ec |     
   mips64    | host-firmware-utils-86739f2... | NOK | https://autobuild.buildroot.org/results/d01b7e50227479def1c45ab603e0d0b05c781d6a |     
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/649ad0715cda4c1b7d805afaff9f57a5ee1e811e | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9909e8f3893601cd53c39e197722b07fbdb91847 | ORPH
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/214de3fe7fe8b29c27e786f7016ea70d46516a4d |     
 powerpc64   |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/dfb82ee3c29d01ead3778f4b4e695da2b29e9009 |     
    mips     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/70859400b4ef5c8b199eaab7dea363a657645b15 |     
    arc      |        iproute2-6.16.0         | NOK | https://autobuild.buildroot.org/results/0efda1c592f3b264c7863056bbad241c2f2ef663 |     
    sh4      |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/061eb487f617500e0ed45d7ce5376b3f92345417 |     
   sh4aeb    |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/d68d706e181f779f1e62ff14ceb51f0459d78b8f | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/2d752a18fbfe47a423361a9ff344cf49e0ecdfc2 |     
   mips64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/ac19ff3761a5a8759db9c9e0850a3c62b1b7c564 |     
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/62671426148c7864a2527cc02c064e78504a51c0 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/375ab38e818b5a12e3f601017d7aad4726eafdfe |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9c672149ac920ca3d465c3885d2eb11f0a38375e |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/2515ea69991f328b5979ad0bebcc62b56cd21e0d |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fae5fa10677f8376515dcff2fd4e879142d7fd10 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7c603ba3fd77f786ec557115203fbd213db9dfce |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/3ef59718b82c18632828a4aeb8110aa507bc54aa |     
  mips64el   | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/ab4c0afe62e69b22772e7179e7f358d9577c2f72 |     
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/d64c8e49f442a0445407df1b155fe7e2a434112a |     
   arceb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/b4d23c02182e7a385adf714749c13f2230c00b71 | ORPH
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/8496586ffa93f4b8b9c4f5be3fcafc5fb1fdcd0a |     
    arc      |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/ad7761b417caacc100695b499496b9c06f643a94 | ORPH
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/6f63f2822bb9f424979e681d397af01f19e5e147 |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/04f199cee994de86e7cec6687d1fd49530636fbb | ORPH
powerpc64le  |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/91fd3739dc7653b17dd570efc0a417c0cea59624 | ORPH
  sparc64    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/4de55d3ed7ea95dddcb84acf6d3c2b567daf4cef | ORPH
    arc      |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/9c50910173731cf181669ccfc42f3b75dff70163 | ORPH
   x86_64    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/3f4dd593f08f026fed943820d5644889febeb0f5 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/efba898c7daf1eceb33f1df6f425623f6ea32670 | ORPH
   mipsel    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a2ed58ae11575ba77eb4a1efcf6450dab04d9f0f |     
    m68k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/6fb4fbf6f80fa70001d518ab5384eef40c55d181 |     
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/63f285b9951823da6e56cdb71f3f377afd029d3b |     
loongarch64  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/b257ddd096907b17747c27278f44b062c7ab1505 |     
 microblaze  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/71f63a7a1ec77346204220409303a3d847b17b2b |     
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/8c95ceb687d379c36c9d75fbbc8342f734cf2d83 |     
    arc      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/1aa80dad801869431ed2f10211d6d4346fe2f848 |     
   s390x     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a5c070e0fece534553c56b1e77a07653fca68300 |     
   arceb     |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/7134bddfc646edb37fdd946f8a741af4d3f857c5 |     
    arc      |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/0668047d0a67a6e8563acaad18081c31dfec9514 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1e230883330a2928c1fdae88ec9944fabc44883b |     
   armeb     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/d7bfeb7949b6bdd34f493c9a7c08f465d4f442ba | ORPH
  powerpc    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/5e367dab445bc98a090d3ec19330175f3875ac66 | ORPH
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/8e53337504d6d39cabef9da3753240f2bcf0c0cd | ORPH
  mips64el   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/0041555f8e171158cd1224e7d49db501751a29a3 |     
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/37caee3e4f6bfacbcf0190aea47947cb0b841103 |     
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/80fea481966c4f4ef6f4d0bd73498672747b40dd |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/034f1f57de1d108c0f45b855f8be7df0d03c5bf4 |     
  riscv32    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/ad2493a23d36dcce8ddb8e98de124f56676921a7 | ORPH
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/bbf7e99960e5047ac64e5ea60fd5014a9cc1c8df |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/7307ed0068296dff67686c33f3444fcfdf15890d |     
 microblaze  |           quota-4.09           | NOK | https://autobuild.buildroot.org/results/4c6a89da1a8247fdbb8c7a79d8c5e424e26ba6b0 |     
    sh4a     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b5a04af5bb09ab03bc9b8ba7e7dc984cb5e46ca0 | ORPH
    or1k     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/f56645f3a17e9d5a0948bc574cd03d8ce10aedbf |     
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/7ef637fe01acf391bc436a73b2e56ad2cc71bd17 | ORPH
   xtensa    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/4ad7aa4a2c986d14160e865d3b806048f675f7e9 |     
   arceb     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/8c84d1b8d6a313fcf1442760efbea11dfe3ab7a0 |     
 microblaze  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/82ebe95eb447b881418407d633b094000a9128f0 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/be582084efe9f5f78cfbf8277c5b8dacbc80be0c |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/be14f4c7fb40281f699d5f512121339221287441 |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/3b8867b7a8b7ef358413527d11f6e5b2e9b446fa | ORPH
   mips64    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/7946d2b5605c56ed73eb512b806ca024ab2bade4 | ORPH
   sh4aeb    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/7f9e536c8262f47b0353dd9083f4213216ea4cfa | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               ebtables-2.0.11 | 1 
                libcurl-8.16.0 | 1 
                   sdl2-2.32.8 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/05d73e936d0f9d3aba50d875e0532f7e7a4f4b79 |     
    mips     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/f600da7c8e1f775ffff4b4784023324ea61756e8 |     
  powerpc    |          sdl2-2.32.8           | NOK | https://autobuild.buildroot.org/results/8e31dd34d328b82562f47653e19d10a6f9e7f4b8 |     
    or1k     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/e9a618683d5b956554b611aea203d82fe994ceee |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
               bctoolbox-4.4.8 | 1 
                  ffmpeg-6.1.3 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
                 fwupd-efi-1.7 | 1 
               libgtk2-2.24.33 | 1 
python-remi-2022.7.27-37-g1... | 1 
           sane-backends-1.1.1 | 1 
                    sdl-1.2.15 | 1 
                 sudo-1.9.17p1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4a205f26e4ad66f473e4709b185f112a1de4d4f8 |     
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/66dfbadb8b168efc4843af8dacd2b00cae3c2efc | ORPH
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/b2dc324a0596186e98919fd086006efdd6e96029 |     
   sh4eb     | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/b913af9b1cb2eba57d6e9d37c81b38a5891e39e5 |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/f2614421517c5f160a7ff6eb12029b31cce524a3 |     
   mipsel    |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/0eb0bf8b469f5227e6883c73c992c913988e1d73 |     
   mipsel    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/dd657d60cf64a4f7beff48d54c0c4e0c8c3fa27f |     
microblazeel |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/1353ac09c37dff0c01e7a9c385fa53568b903455 |     
    or1k     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/c405bc247753373ed9645f5b5bd367dc2dc9bffa | ORPH
   sparc     |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/5aa9a5412e8117c45eb0eceec2e6b69db3b98b51 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

ustream-ssl-68d09243b6fd447... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/fd88dc81f4b0c79185a58f8d6e9ad08ed06913c8 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

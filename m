Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF82CCA471
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 03:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A40841B05;
	Tue,  7 Oct 2025 03:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGCDmKcNclU5; Tue,  7 Oct 2025 03:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327C741AEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 327C741AEC;
	Tue,  7 Oct 2025 03:30:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8F88226
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 03:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A964941AEC
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 03:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iyj1byxf3vj9 for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 03:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A95641AE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A95641AE0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A95641AE0
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 03:30:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so36254565e9.1
 for <buildroot@buildroot.org>; Mon, 06 Oct 2025 20:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759807836; x=1760412636;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GQV0u87U7+UVfz77a8QN9ns992EH26NnwhjqMxIZL2Q=;
 b=GN2ZUo76SPbPAlT/e67cjT2WBLQG8yC+3IwsqiE5jYcUtqzdMyLi166crozLt7m3RY
 RiPDX3YGH5c/8iXUkwHpUheFx5DSjjn6ldAEzjODqJn5+Ly6HlPo2Nn4Uw7hpSLm+Gy3
 GIBrP4OL2JmgVetEfYx/Sgq/pX4lzfRcCU5ngSPyE4y2G8MwGzdOIf2O9Kc+6Xve6daN
 kQmFQl2576ppsMS8Mr8xcOOpb5EIIgCBkWIqmW0rGIvG/jOULVCzWg9at+si9fWpvgSg
 QUUcg2PD71RDvZwWQwAstYJQSoAJs0ahSeEZ/h2nZbPcE84YtWrwgU4/t/kKw7lbTvT+
 vxlA==
X-Gm-Message-State: AOJu0YydwnO+CZCaoZw2qPW44n2yuV+la8Z6snDM+lEoVx+VxgZ0/Tb+
 +z5ek00vLgYZe6MajStqHrZERR3Ut2sMVhqn+KTea5XtUi501eASeleFbRVFxw==
X-Gm-Gg: ASbGncv+MsO/s9eBeDAQ0Ljn8PQ7Lt1VrNpXNoXr5nLzW6ToL9IU20Y7fDYW9qVD8es
 nQJ0Iqzgy5dnO9OjlFh90YDzX3H/OL9/08CrGasB58VM7LccMTYODXi7o1Bo1TeGNKt/n4pwBAP
 x0laODSuBpbFScBdpR8nI3H0JFKC31QHVsbsl9ObWh6d8xicBpq5iauBjX2cJCvpCzmLSmBXmbL
 bHNV86+8L9CSJJGKR41xf7CCOS+Z8DUrJupme414ZnENK0BwNw+gwpauLtLLq9E4xX1FaktvkYh
 hr0NCzK+GchQk4sTYaQkGKTnIVV1QKzHgQ3QZauW4f08kA8GHKb8kQ+1dwv+Yoa25hn7VrK4hzd
 EpfA75qT4ecLak0d+hmVOQVnmpA2av+5EpILiL8tNdtq7U8TSYhkxiA==
X-Google-Smtp-Source: AGHT+IGzalFgmT+g4YYU0wiOx3FHgLJ4wV7v4M8nqNIjCZ/1BQcBnYi/xjey+IVz2N1M3QMrp3EDRQ==
X-Received: by 2002:a05:600c:8b74:b0:45d:d88b:cca with SMTP id
 5b1f17b1804b1-46e710ffac6mr84521575e9.1.1759807835838; 
 Mon, 06 Oct 2025 20:30:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b8507sm281942725e9.3.2025.10.06.20.30.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 20:30:35 -0700 (PDT)
Message-ID: <68e4895b.050a0220.289067.cf13@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 07 Oct 2025 03:30:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759807836; x=1760412636; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=GQV0u87U7+UVfz77a8QN9ns992EH26NnwhjqMxIZL2Q=;
 b=AwpC80hLh9V0yRSv/3Sf/BFsi830/LikOQdWq2AHuNXEtOA2mzFp8AhQbcjfW+L8Up
 eGZa+dPbwkQXmz+uChnBn9DtaxHtpmXUSpmY4yb4UZD2aFDwv8iGdkvmbvU2yIoO612u
 3ja2u7AM8CorS9cFS2RX5Ln0tZPr3QG8ItVe5HW75J0paKQ5z3TJgLY3oM9vZjYoVmPK
 bvDsh39b4idA5517BXbPgGRGxzpIsqldN/kCbPMvRmpvCCddhiG+Rt1MNiftNCMBIB51
 1oSO60dV0UKzM911wNG/L0y+kdXstwQ+HXsdIXgqVg8oF0gtDUl0F6KUq/xGPeyYfPYz
 31bA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AwpC80hL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-06
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

Autobuild statistics for 2025-10-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  6  |  0  | 14  |
  2025.05.x  |  1  |  0  |  0  |  1  |
  2025.08.x  |  1  |  7  |  0  |  8  |
    master   | 31  | 82  |  2  | 115 |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 5 
                   cvs-1.12.13 | 4 
                enscript-1.6.6 | 3 
                    linux-6.17 | 3 
                python3-3.13.7 | 3 
               asterisk-22.3.0 | 2 
                 dc3dd-7.2.641 | 2 
                  dpdk-24.11.1 | 2 
                      fio-3.41 | 2 
                 host-gdb-15.2 | 2 
                  iozone-3.508 | 2 
         libdisplay-info-0.3.0 | 2 
                 libgee-0.20.6 | 2 
                 linux-headers | 2 
            micropython-1.22.2 | 2 
                    mpir-3.0.0 | 2 
                   perl-5.40.2 | 2 
                       unknown | 2 
          aardvark-dns-v1.16.0 | 1 
             batman-adv-2024.4 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.4 | 1 
             dahdi-linux-3.3.0 | 1 
      docker-cli-buildx-0.25.0 | 1 
                    dust-1.2.3 | 1 
            erofs-utils-1.8.10 | 1 
       freeradius-server-3.2.6 | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.88.0 | 1 
              host-swipl-9.2.8 | 1 
      host-uboot-tools-2021.07 | 1 
             libargtable2-2.13 | 1 
                  libbpf-1.5.0 | 1 
                libcurl-8.16.0 | 1 
           libfreeimage-3.18.0 | 1 
                   libks-2.0.5 | 1 
                  libnss-3.116 | 1 
                libressl-3.9.2 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
                lmbench-3.0-a9 | 1 
                memtest86-7.20 | 1 
                      nbd-3.25 | 1 
             ntfs-3g-2022.10.3 | 1 
                     nvme-1.12 | 1 
                openssh-10.0p1 | 1 
                rocksdb-6.20.3 | 1 
        s6-linux-utils-2.6.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
           sane-backends-1.1.1 | 1 
                 siproxd-0.8.3 | 1 
       sp-oops-extract-0.0.7-1 | 1 
          sphinxbase-5prealpha | 1 
             strongswan-5.9.14 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/b4e4a32be56e9f5af47cb995f65b708c1ee223df | ORPH
   mips64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/ed874e1efd0d404497809ee4c24b8eba4df7e548 |     
  aarch64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/2d3f6b226fbfd526e9da33d66d2dcba64ae8d0b4 |     
microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/34473ae0104fc36a083bbcbc1914157a57a9dd01 |     
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d40aba4bc832955259efc530b17bed919db0c40e | ORPH
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/3a92c4a3a4df62b6676b7095a7418d50ef66eb03 |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bc3e39c9f355ea2b12b85d1498988aacb0d623fd | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8eabb9811028a77e658b9121c7d2a72ce5f03777 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/859aa5ba379efe08a81cda8132b474f595ca97e1 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8e5601dc8b315ecddf32d5e607a24102ed251df6 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d488e4d139ce36b5b3c82c0af22c442fd9c76d98 | ORPH
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/fd726a03a2248e814c31d9c1b69e40cbc9ad82cf | ORPH
powerpc64le  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/5220ee2518df2b61d6e2daaec526912190875863 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/9b51b6051cde4a69f8f1f7e337f8d16d5cb00f9f | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/20a365806e1bb43119a62fc38b5951b1127d4a4f |     
   x86_64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/772f32b17e515970b45549b2e9538b7b56dffa2e |     
   armeb     |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/89977b55e3a43c950f4d9709988bb7bd47bf4bc9 | ORPH
   armeb     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/d881c332d3e37ffaa816574e55e10f202e3689d7 | ORPH
  riscv64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/933d8d51b69a336e103c1efe01d00718d983a576 | ORPH
   armeb     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/d78cfa6642863e45eda712ed51e200c2f1f2e444 | ORPH
   armeb     |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/a29e008a4cb491c472faec629cae1aded31a91e2 |     
   s390x     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/8b6be6b59dffd4490437cf17460ee80a8897c861 |     
 powerpc64   |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/65c1336a265d34911f454dc9a991c084abb2702c |     
  aarch64    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/3d27030ea74e9d52abe656d297482edd49e73ade |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8e3c15f6d884a8341837e75f4e9661a09b3091ce | ORPH
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d69bdd94d0f6113cf79c57fbb3aab90fd2b33bd2 |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c4b10ba8a53a1436091f528c9d24fb65e3c03db8 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/1e24b74b1295f90116b6708557e91d0a3be783c1 | ORPH
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/cf17381be88f21926f62955db26cb326a64b8e16 | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/dc6894ff110fd14bb6a329294575c7159d725a15 |     
 powerpc64   |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/194b74b2602a7be10e1f9367d68cde543d53f43b |     
loongarch64  |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/c14ad1e12e5461ead875ed3ae7904e4df78588ee | ORPH
microblazeel |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/034741183c8582bbd8ba802a23e0a7830484a100 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/799531f957f7f3c3695f6ae49b114a1bb4f6c8bd |     
  powerpc    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/6820861b987c8875169c51598bb20b3153d922b3 | ORPH
   xtensa    |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/c55b0dda070e3726760a06ea0251792ffa4e481e |     
 aarch64_be  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/64fad87dddecda1e8ff6b0a9abc0b827b5136e4f |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e293f7aef17e2793ed603272baaab6bde9001ab6 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9102f2eb79503966b62e6dcf4dab1ff073b2d2b8 |     
microblazeel | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9c4967bb29a8f979fba6cfbe5a4a279fe4775b94 |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/03517152067b604464d17efc894a138e93614eb1 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c553ea0f7ba730ef6a5121b882f578b0af04465d |     
    m68k     |     libdisplay-info-0.3.0      | NOK | https://autobuild.buildroot.org/results/572c8e21f3a7507dc781fb480f671dbf7ac2c7f5 |     
   x86_64    |     libdisplay-info-0.3.0      | NOK | https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d |     
  aarch64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/1f561c15b2bce6970c4924ba0c17c0f36b5ab10f |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/7e0a95e7c8122eaf7ee1bd7561b5892323111994 |     
    arc      |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/37da397969f2cfe4de2f529edfdfc3aa3a5ff485 |     
  aarch64    |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/ae5bb2b656f888566dce239852385cf742b1c2b9 | ORPH
loongarch64  |          libnss-3.116          | NOK | https://autobuild.buildroot.org/results/d7df94712856c45ce9bdfa450cdec04f8100d7f8 |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/a21a35458857e42c816b2f251af4fecad97d7dfd | ORPH
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/261f93470d5ccc8b55607807cc7988329fa37c20 |     
   sparc     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/42614f77be9fa1b3a596cdcb40cfb81f5496b41b | ORPH
   s390x     |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/11dda62ed2aaef748ab3c930ed4cb762caaf349c | ORPH
 microblaze  |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/343d331769ea65f07048321878856edf2304a8f5 | ORPH
    arm      |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/0d28e4eebd0cdcd8e4b4c3911bd2cc75f25baebf | ORPH
    mips     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/55de2ab75422673fdfd6f31321473244e02a782a |     
   arceb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/2c17572a2b4af47d073369fbf66333422a84d4bd |     
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/bb573dedcaead4292ff8bff02da8b4552c7672e2 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/212f2f2fb8997f3a3e62670fedda5be993d743ae |     
powerpc64le  |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/2480a95fd1de81cef56cd7c82a819924b42e30ff |     
    arc      |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/2d9e6241654bf520f2eda9c9010ce379d42e3392 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ba23e4fc982b75a5caab8f30358fd1b10263fa2b |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2f74976c1404df498b1eabf932efe191043b95f2 |     
powerpc64le  |            nbd-3.25            | NOK | https://autobuild.buildroot.org/results/d64fb56719bb94d1dba3ed3d928ac4d7b070bb45 | ORPH
powerpc64le  |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/6a87b56e4c2fbc862d1f90f32e50b66b3c5fae6e | ORPH
   xtensa    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/3361ae8212d3b5e75b238939d40610fef5dea812 | ORPH
  powerpc    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/c220c01fe94273c24207ee725257f8f781f266cd | ORPH
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/16c49481be551d0e6d00169651636f6f5fbb48ac |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/53621a1fbc34ad2670779248bdc94c05b07ef3ee |     
  aarch64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/595011309c0f68155132b59426d841716d05373b |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/280114dcc5391482ff818397a88b621be6e9c803 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/bb01617c28d563ebafda4ccaa76c39fb726f7a37 |     
powerpc64le  |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/d55bfb07c9beba7e3067719c6de7dbebced7fc9e |     
 powerpc64   |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/3c16e90ae9e61f213e9df8cdd32b1acf857298b2 |     
 powerpc64   |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/6611c8477365a6850b75d598cfeb3be47d38528b |     
   mipsel    |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/fc57d9ec5b2708830b1ea3fbf72777e8eaabe8d7 |     
   mipsel    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/2dc8422fa7f1e4e6b182eb94145a51782d039681 |     
   x86_64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/ec79370c5ab2753f029e4977a0da809f0ecc6033 |     
microblazeel |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/9a1132a87a1556261bd4da91a0622aabc69679af |     
   s390x     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/635e54ebb9fa039378fba59579bd72e0be52d003 |     
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/5b167dba35aeb06e785f071acc70f98dc450f4ba | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/db27645afd2a35df56c4d3c2c2b6b6ab0e672fa1 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/0622086ff3c932ee27e0acf7a2fb6beafbef2667 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/9dea6c0b9754093eb8cfb5bc956c5503ade325ec | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                 libgee-0.20.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
package/python-flask-cors/p... | 1 
                rdesktop-1.9.0 | 1 
                 siproxd-0.8.3 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6246037cd21efc4e3ebc0295976846bf4f3adeb2 | ORPH
  aarch64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/dae4e09a19765298387c847fa02577adcc9d4eba |     
 microblaze  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/31a1d1f9819471d853f551e66a558c167ddacd73 |     
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1a14a0a6da9d4bd03a15c60c1a037ac4e4d5fb23 | ORPH
 microblaze  | package/python-flask-cors/p... | NOK | https://autobuild.buildroot.org/results/7c07270d54f7d5010fad6333c10e16bd6581575e |     
  aarch64    |         rdesktop-1.9.0         | NOK | https://autobuild.buildroot.org/results/8ad5d33f726fe57910a70df7c8f40a9568c2dfa7 | ORPH
  sparc64    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/edb91355fc903ddc59628c17cda273db19395ddc |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  cmake-3.31.5 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
            gdk-pixbuf-2.42.12 | 1 
                 host-gdb-14.2 | 1 
                   perl-5.40.2 | 1 
                pipewire-1.2.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/bb7d6d470b0ee6024eada7ccf80a636b64dc4dc5 |     
  mips64el   | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/763a627e10f361a0b6cb408fb5ac23a463376030 | ORPH
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/c95a3880e8252d3625d53fa5cc5825541c9c8dee | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ea33d7585a37cbd1fdb69393c46ccceecb5c555b | ORPH
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b4311077de164788caa4d03b60b90668f5eb1e88 |     
  aarch64    |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/d5b601c01790c78abcde508521670275c21cbc28 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

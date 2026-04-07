Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD867FB5189
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 03:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02EA84056A;
	Tue,  7 Apr 2026 03:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8ErzPoFgi3D; Tue,  7 Apr 2026 03:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9CF340637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775532612;
	bh=jbKC3y6mFswXMD8d6IYDreWHz/3LY9sEUNAJ6N5S9Cs=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n2PuO2j1Iqn7W4t44pVmC0MIJYqB8mYCM5tFWSYKfHZgVGEN5jiLW45yVEGLCzGh6
	 BmCRcehhzashovd0B1E8C4m2PsW/jzG+MjGKR+Ijpln99yokZMOQgmG0j5eS6vNSZz
	 eWbjkdrutqQbPh1A7aCtlDRNKukoOPfXAbkGojx6HflP8ZzQ4e5MjmAqVpx8HoimVa
	 /NN6aolnHsPdqZjletB9EfoWcY0lBz4K/vQbBc0CH+qrotMS4Z2vT/PpY4+npTwniH
	 SYEmfKD0sBlNF0CdN054dpzGpvInz5ItQTCnWyA/PALLSWg+sG8OeknL1/y+2qskNx
	 4oLjGNqS9CNNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9CF340637;
	Tue,  7 Apr 2026 03:30:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 931EA219
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 03:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F2D44017C
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 03:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6gTZZUTbZyz for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 03:30:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24ABF40029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24ABF40029
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24ABF40029
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 03:30:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43cf3ee0fc1so3699734f8f.1
 for <buildroot@buildroot.org>; Mon, 06 Apr 2026 20:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775532606; x=1776137406;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wj3pyjCaTqeYD2Ze+muUYUCG2tRri881iF60eEHtWPY=;
 b=IIHm57aC5ZfZqKjCwGWfsFqRoF6Co64c7F7KLqDYCyv1CcMG6xyBEuAVsV68HxOwYk
 NBlRfc7QSKVmdCiX9udd2j7HqdaIu6ZBxopaXhH2tTby/nuosVOZM5ueJqxrxgZzeqP4
 UTljI12jOY9t7oyUgl1jcxx/SZDLII5OEoAQkXE1ipmMh62d8WfCj6ptcd1OEzUb3JJx
 yBtRDG/uFZnY9u/Kv5rGQeYaFCkAIIfpAjTPJdWDymd5Tpq/Fa70TUBEfaH1MhHTE7j7
 yKr7S34gtptHVBC+ycqBo4DozmlXR2ZD0DVpNmb1xQquf6jN5TsmfQjipa9Yk0+kmSXq
 IAgg==
X-Gm-Message-State: AOJu0YzGfzpa1CjqqsEYq9OQBScXGcXvaLY1B1ZrcUUVOfWXTC/vmONd
 a7Xp+rp4CWYgB0C98z9YI0CmTV3cOxk3u6o06eMGLvf7uQ77+lteCxZTSneH4Ztr
X-Gm-Gg: AeBDieuLTmq3QY65lvoI2kZbkjNtDNSEoKEp+nIUM51DaGzzqNRSAXeG8CVdsVbCEFM
 1pTLugFf4TzuLWDQ0L3y727kOMMQ4XJDHc7n6HLbqRaOTD3GhJvmUl3BTdFWRXy3POmplraLJJH
 iN+UHnEkqkeGzUU7n6eap9leZ0PDBg93smNm8DU3N4gGHt34rrrLp81vmsCq4Huc+RImhyO3RAg
 sgXqS5H4lEnq/hH7tBmqzoHzE/Rk1qJV7pYR5dE9KsbPjj3YDsuUN/9drgXwKdAiC+2uGxLiRHp
 h6rgAuI527uHGJuD4WsdEunZg9kqCw967WQqtbJXZHv4upvm6FNKEEgPk2tGh/wzHMXt5M7RnX0
 tkx9QN8yqDT4ha3HxsclDDJ/DZuST3W19T5wnSA3gnB6CM1gKkpUSx+JhAVA2GIIcrq6QlXFTM7
 MSwyE7QLpQ3BZTTOY4yt2LQWEwQXoEXA==
X-Received: by 2002:a05:6000:2512:b0:43d:1598:2d6e with SMTP id
 ffacd0b85a97d-43d290e7b83mr23145221f8f.20.1775532605582; 
 Mon, 06 Apr 2026 20:30:05 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d282esm45845621f8f.18.2026.04.06.20.30.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 20:30:05 -0700 (PDT)
Message-ID: <69d47a3d.df0a0220.1c5b98.28ca@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 07 Apr 2026 03:30:05 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775532606; x=1776137406; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Wj3pyjCaTqeYD2Ze+muUYUCG2tRri881iF60eEHtWPY=;
 b=aoo/1Vn9NXiFbJOTWwhzCYYwu/ylY1x9k/GcQJqZpzgMhpX+eixFUPXxySeePtbX5L
 HLpLT04mr7IPksseoaBR1+9yGWifVXtWK5siLrVO0eC+ZJn1sM2Vo9zC+oE9rniQqo9k
 695nA/Uaa1ejhXDw1Z6cTxf+JI8pzAlcuYt8ju3hqhJKjL06GN+0CtYhoDzVD9XdGK3C
 SGIRiEAXThMnzqe619Y+rmLxSaI1v/rG7yJxw020usuXuD0zIIjx88jVKDBgu7I7HHWL
 gGk/QLU92BtLjmqc+PUsAljJm1kmO0goNVYXyNKsr2mKO9LTEu5vikjEA+E7WU8WQdHg
 St2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aoo/1Vn9
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-06
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

Autobuild statistics for 2026-04-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 19  | 44  |  0  | 63  |
  2025.11.x  |  4  | 21  |  2  | 27  |
    master   | 70  | 132 |  3  | 205 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 11
                flashrom-1.7.0 | 6 
glibc-2.43-17-gdd9945c0ba40... | 5 
                  iozone-3.508 | 4 
odhcp6c-f19dd37fb467c9cf10c... | 4 
host-gobject-introspection-... | 3 
              host-pahole-1.28 | 3 
                 libzlib-1.3.2 | 3 
                openswan-3.0.0 | 3 
                   perl-5.42.2 | 3 
           uboot-tools-2026.01 | 3 
cegui-e7a03afc70c6182a091ff... | 2 
  gobject-introspection-1.84.0 | 2 
           host-libtpms-0.10.2 | 2 
                host-odb-2.4.0 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                  libnfs-6.0.2 | 2 
                  libnss-3.122 | 2 
     libphidget-2.1.9.20190409 | 2 
                 linux-6.19.11 | 2 
                 linux-headers | 2 
                       mrp-1.2 | 2 
                pipewire-1.2.8 | 2 
ustream-ssl-5a81c108d20e247... | 2 
             util-linux-2.41.3 | 2 
          aardvark-dns-v1.17.0 | 1 
           at-spi2-core-2.58.2 | 1 
             bubblewrap-0.11.0 | 1 
                 c-icap-0.5.10 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
              e2fsprogs-1.47.4 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
                        gnutls | 1 
                   guile-3.0.9 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
host-vboot-utils-4b12d392e5... | 1 
          host-xfsprogs-6.18.0 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
leafnode2-9543ffaf82406f943... | 1 
      libabseil-cpp-20260107.1 | 1 
                libcurl-8.19.0 | 1 
                libdaemon-0.14 | 1 
libdill-32d0e8b733416208e04... | 1 
                libdrm-2.4.131 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
               libglib2-2.86.2 | 1 
             libgphoto2-2.5.33 | 1 
         libhdhomerun-20210624 | 1 
                  libsepol-3.9 | 1 
           libsoundtouch-2.4.0 | 1 
               libvorbis-1.3.7 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
               lrzsz-0.12.21rc | 1 
                    lua-ev-1.5 | 1 
             lua-iconv-7.1.0-1 | 1 
                     mdadm-4.3 | 1 
             ntfs-3g-2022.10.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                 openmpi-4.1.8 | 1 
                openocd-0.12.0 | 1 
                openssh-10.2p1 | 1 
                     php-8.5.4 | 1 
             pptp-linux-1.10.0 | 1 
               pulseaudio-17.0 | 1 
            python-numpy-2.4.0 | 1 
          python-protobuf-34.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 s6-rc-0.5.5.0 | 1 
                   seatd-0.9.1 | 1 
                setserial-2.17 | 1 
                 sqlite-3.51.3 | 1 
               tcf-agent-1.8.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
                 zlib-ng-2.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/12516cfc400eb9d92518d00c32cd805ccb6ea015 | ORPH
loongarch64  |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/41827abbd324821b417d8e01bfa0e6aeebdf18f7 |     
    arc      |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/a63578efdf4351e60e99d809bff5c6e7e28a0be5 |     
  aarch64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/bf10b6c00532d2daacb4245e74ccd17e6e3bd380 | ORPH
microblazeel | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/64e9635d98978d41f703f8e80bfa94ae57203cb5 | ORPH
    mips     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/0e81ccff92a540ce91e8201e8d27062f11b5d1d3 | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/cc6d8aec1e06a79059e9e004402c1b67873e7e25 |     
    hppa     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0b590351d6f334b1f70f65ab5ca04cb43b6a36c9 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/40748a3ce580885830633cb2adc04db4c64bd997 | ORPH
    or1k     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/164b65e44f10f855e4d3277ad7b782616cf0aa07 | ORPH
powerpc64le  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/751ba5918f6945b7e06428277cc1305d57dde75d |     
 aarch64_be  | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/7352d98fa1e60a53c55c6c6b1192f72a547c7c9d |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/61a7e46e6a981714cced2aefd2bf72abdc0396af |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/598c8281cb0e299a9267ee644e4a79c4320582c2 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/b8c55270ca0b8f1e29c4a628fb14498cdda8bf6f |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/e2ea90b6fa8103f4516719206e5a3ba9e093bbe3 |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/b3191568377e830b1e8c35e38ca29067ad9352f6 |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/9c44c03a4c5dab3de599a501b5dbdcd1c0986b0b |     
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5e8dfc63cf2b91ec2ca2345eb7b076ad62154ce0 | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/6f0c1bb7ff0cfcbf2168c620d6b9c91cbf274a2a |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/733bdb31ff5fa3b098ec0ad8e11126d36a89d648 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/788a00dff1bd1e9c1668ea516fdf911eff0dc83d |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/e051ed2439b845f8cfb31b16a8d4067ed17fea05 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/92c05164f4a267936dc53805c2e2e37bf7a4bff7 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/8b51bf7b66abb2af6b55183a7d6497ac9aebc957 |     
    sh4      |             gnutls             | TIM | https://autobuild.buildroot.org/results/5ce810966d18d953697f4ff33a0302a6097aa00f |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a226a1285ab8d667388062a11296c96c2ad78740 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d925ca020a1b8a716e96499cff12a12869a563fd | ORPH
   mips64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/7521d3180487ea80c7913e51e516d577298b92d3 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/fdedadeaa2df3fc860640cd15b78d4fec8656b11 |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b26a8ed3b7399dc84af954b1dcc688a3687922c3 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2c963f15db8f01fb72883bdc33a12642cf77e183 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/450badeab8f66252c92e8bcee1ec6a43a4b2fa94 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e436b9017f72c512a985d7610c8381909c705367 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eb0a8425dc69ea1077dba2a4f9a843d1ef54a936 | ORPH
    sh4      |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/cdd59745ab6c8e098e1ae51122e8fd6a2ca7a636 |     
   x86_64    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/3da5c24fc4ae2336779ffa917820d5322e2acb0c |     
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/1f7925470512e90a83cda514e1272436cda46940 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/4e4c5fbf18018c6061c436f6002807a187988210 | ORPH
   armeb     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/2589b267459df4b7dd153133b21eac7ce4fbbd86 |     
 powerpc64   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/2f282f568d11dc01de4c8dcfe7b097d7d8c561cc |     
 powerpc64   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/2edd6d6d8760ecddcc11cb12ace2a1a273c3f2c5 |     
   armeb     | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/96ec9a1ceeaf766cef400010532fdee6e373d79f |     
    m68k     |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/d5fdc290bd0506a86bf9e3900c36fe561178ddcb | ORPH
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/34b7b53100d2b51b6878ca1dd673962f3df9b7d5 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/e33604feee1fcbc5e56b37ad8c03e84e51aaa4ea |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9a16f04429f1b55c744d9630cd11696ca9049484 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0840bfcdfa2fcedd1f08d1451c0d7333c88f863f |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/4333ae163d94628c5c361356cf7cae5b1f5c93f6 | ORPH
   xtensa    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/00c514498dbe35c9c053070c40033626c23c8725 |     
  mips64el   |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/4004996bd1d83fa8ad4132b6929427a395f6e2bc |     
 microblaze  |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/43120c2bbac77fe29de9639a5ea180b83cfbe69f |     
 aarch64_be  |         libdaemon-0.14         | NOK | https://autobuild.buildroot.org/results/a5aec73c48fe6ec3efead71f1b0417dd11a2f14e | ORPH
    arc      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/4aed99b9593c436fe22f1999971be9eb5904abcf |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/7211c8140593d62ea1fdad43122904bfc921ba48 |     
   s390x     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/36d955bf5750d55542a0891280d512a59c1922b4 | ORPH
   x86_64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/bceee52778689d3bc525a2e8b551a3eebc0fdf68 |     
    mips     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/4ced28919c04c986b86c8bc90704801c3464c78b |     
    m68k     |        libglib2-2.86.2         | NOK | https://autobuild.buildroot.org/results/48f9d4d2f02c662eba936e7bb0575c85232bde27 |     
   sh4eb     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/9cba5cf33b7dfd8b813c0818cf7cc367257f13c8 |     
  mips64el   |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/5baeb5fc3f6d2247e3a905542cc440eda362a8a1 |     
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/4779a946beed39bc8dd9a542b24f544ee444ce9c | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/684b1480491d27b005ca0a350f966f0ba73aa256 | ORPH
 aarch64_be  |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/c2e486bac570d93a2507e4f059b3ed43a4915592 |     
 aarch64_be  |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/707e7bf80a476e65ef78785392ef9c8d40e3bf81 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7ff8819c175aa0d6d2fe780be21e19b46c87cf34 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/03f1e860a11215c593331eb1b0c01012ee9f9789 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/9b6eb29a6904974aafb893c7ee138055c7001eec |     
  aarch64    |      libsoundtouch-2.4.0       | NOK | https://autobuild.buildroot.org/results/41ff484c949a05f522c412c147756cab83caca69 |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/a5803e0ce0b9adc23677f03041762fb3d2f838f3 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/4dff9670a97f2683a578f131aa3615156cbb9825 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/b9571ca9901c494ae50a1d1311c68693fd7f3b15 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/5bbc6a27f843377b79c35dbd6ffb8e6e5bf00635 | ORPH
    i686     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/fe6bf3d100b5edbb580d9cc957ad94a3b135c799 | ORPH
   mipsel    |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/333716575b628f43e4b8f24525778740fe2ae5b3 | ORPH
    sh4a     |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/4f25736bd49fb94e52b00987d877a0bf622a385f | ORPH
    hppa     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/66f205bdd8cdaebc93883692f687847ace8ba498 |     
   sparc     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/8f796fb90e67e9972ed19065aa0ecc22247ff3e0 |     
   sh4eb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1f54f0a90d2ed92a23ec0161932c371fdce0cb10 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/e9fb68666f00cc9798a781ad8ad6cfa7940e84d3 | ORPH
   x86_64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/a8473e98d6b9acb2ac365075ffd3eaa0c224bf2e | ORPH
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/40a20bcae699eb95d265cc47c0858c550da08c98 |     
 microblaze  |       lua-iconv-7.1.0-1        | NOK | https://autobuild.buildroot.org/results/5fc58503f5d00420149e53d933e20d273d2316fc |     
   mipsel    |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/a72a64f0b3110c7eb04f6baa1a2115f292af5149 | ORPH
   mips64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/63f5d94282d994f29851675b12fb98b77a6b3682 |     
    sh4a     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/a6acfd1b2d5a9f73f4ce5d11dd56d20da9b65e57 |     
powerpc64le  |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/9c0668c36ff4a0ba44e798e16691d621693aecb7 | ORPH
loongarch64  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/a6c185ab9b482913e440f1df2c8ae771ba872faa |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/b3f368353aefdf37bf76b011af03ae16a48c78fb |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/5832103112b6cf54594584b9859fb4b9bbeca9de |     
    arm      | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/4ba7034feffe605054665d1ba73a53021710df25 |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/ab03bb387968754f40bf01e332ee9be12edc0303 |     
microblazeel |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/fa1d516444ba754d7a939b806b7ca13a972fd6ad |     
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/cf30d9860b402c167fb95d5cda5b318a03a0bb0f | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/0016826356171d9ac22ec2db1ec4b5457d9857a6 | ORPH
    sh4      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/10977310a1a725c0451097e25836922edb8a09fe | ORPH
   sparc     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/890c506e82191fec1becbbc36922ac2578eb6c66 | ORPH
    mips     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/21c8da1a61911fcc93be19105ca71d1f2b3985b2 | ORPH
   armeb     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/9903a8777264b0b5891fc6c4b7468b82185b05ec |     
 aarch64_be  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/aced4bfd69522c28202b1faf654a81007f35d735 |     
   armeb     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e4a7cc0c75afbb0045b556a96f37c7c48fa5051d |     
    hppa     |           php-8.5.4            | NOK | https://autobuild.buildroot.org/results/57fd29358aceef03351769114c88ba071298d135 |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/2e90da7786d30389f17b005d3379495c3472f0a3 |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/6780be34c4d7a9e1c495df8eabef658a1a9e8023 |     
microblazeel |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/908ad8749a7d56d4c9a8fea01211e90481ef5695 | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e0ed0c2b03325cef81d507461f8143d64fbacc71 | ORPH
 microblaze  |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/f6f78cad9e82b2ada5de3ab7851f519f8d00a8d6 |     
    m68k     |      python-protobuf-34.0      | NOK | https://autobuild.buildroot.org/results/e689637ad4d44097bc5eae7d9bc85053f202b3ad |     
  sparc64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/621497dca635c6acbc8f2e50bd4451217f1a4a95 |     
   mips64    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/5c0474f0d61610284cedd1a14293c5d66960041f |     
  riscv64    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/aaf60d89a996b5f55cdefd59f3b55e737bbefc41 | ORPH
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/c94092f145b17ccf324fe6069d757017c7422a37 | ORPH
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/800e02ba9d989ae287ac42cd7795ecd6953f939c |     
  powerpc    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f09e3252bf9df21f870c9345406b1487498a930a |     
    arm      |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/3e49cb29fbcf01f74f5dc3c86bbc4b6b64b28e62 | ORPH
   sparc     |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/af9b5c02a649788f99db6ee3dad4d8bbd7b030b5 | ORPH
  mips64el   |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/ce050118abddedcf9c957b082fca93a3686228ca | ORPH
    arm      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a8922dc3f9523777133d3bf7ad5400c8f77c290f | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/47d28f5fff3e83da09a101de8388ca1567b3b5a4 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/322ea7941b76e8b9cec5e2a7d03c4b78f62107a4 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/889e3f5cfee4f18d6f388da3807a63315b27e4d1 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/6ea323afc92cf79ef6fdbec0e7d67d2f67302c08 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/042c15fe447dc9983c379a442f2f108267488e7e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/bb431fd77810feda37527d57823bad24890cd1e0 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d9e2d38522d79c420dfc5c60f0946e42e8719f9c |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/0009c98faad2936d96db220727ce5b65a8ef773d |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/b2bc4df6f7d69557786b5acc82a5db15fb44a8a4 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/9c279f6c4b219a5c22ce6cc276986576fc40b2b5 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b84cf8a3abeb81651dc0f9ff2aea20c5c908cdd4 |     
microblazeel |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/d9bca3558208cacb41104c9b325fd37dabf1c2a6 | ORPH
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/13cb574dce2eafeb3463c7127a87d8e3acca8fbb | ORPH
    or1k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/886fa7b99d4976f800221e1550b83e4d628c1911 | ORPH
   x86_64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/b2e2356ecb8b3775fce58528e97ca3ca7b7fef8d |     
  mips64el   |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/34e51ebcb7460d209f8f2fd4037f971013a09c4a |     
powerpc64le  |         zlib-ng-2.3.3          | NOK | https://autobuild.buildroot.org/results/9107a7a32ae934a772a8fbf12f87f263cec1cafc |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                freerdp-2.11.8 | 2 
       host-libunistring-1.4.1 | 2 
package/linux-headers/linux... | 2 
                       unknown | 2 
                   atop-2.12.1 | 1 
                        gnutls | 1 
                heirloom-mailx | 1 
            host-coreutils-9.8 | 1 
              host-pahole-1.28 | 1 
            igh-ethercat-1.6.3 | 1 
                  iozone-3.508 | 1 
leafnode2-9543ffaf82406f943... | 1 
                  libbpf-1.6.2 | 1 
libdill-32d0e8b733416208e04... | 1 
              libmodbus-3.1.11 | 1 
     libphidget-2.1.9.20190409 | 1 
                 protobuf-29.3 | 1 
                 xenomai-3.2.5 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/6d2a68399d8c0dc479765dc98ce01b697377aa22 |     
 aarch64_be  |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/cae4b4cfeb36c285d45645213ebffa81ae0a6146 | ORPH
  aarch64    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/764f3edaadce669f45b1cd893b314497b003db72 | ORPH
    or1k     |             gnutls             | TIM | https://autobuild.buildroot.org/results/c024e2f7dcc4d8ee7b75400173f078e42706f85d |     
    arm      |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/ed9c1bdbc8268d137066530d391b2b8548c21a35 |     
   sh4eb     |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/dad2070f06e592ff2240539845a756ef883c70bd | ORPH
  mips64el   |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/1d101081b556552a7bdfc0b6ab293989a3f0f942 |     
   x86_64    |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/32aaa358fd5d23191f2488775c45f0cd6a4d5f55 |     
microblazeel |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/dbf860013cb53b4ad2592b386d60f790ca79dd72 |     
  mips64el   |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/177d24620234cbcba93c7d95b63fc2c50fa25bb3 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/5fbeb852b62ea65e639301ec9f7d4b9d706d8cf2 |     
loongarch64  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/e60b4685d06c040c41fd88646a53cd71449521ec |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/c39f57e58f1854a9e97aefc545c10e672b6b5a0d |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/3d30982589da40562c16bf575a0e2c66836e3a77 |     
  sparc64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/dfcb131581b161dbd3a89626c4f7adeec6c2be8b |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3e4aff3493001ca2c2590a1af1d37e26515e3c4a |     
loongarch64  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/2955ea4383e6dcbe389a006698987c58702c2745 |     
    arc      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/98eec9f265384bb36813c024e7d47e0eca174933 |     
   sparc     |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/0ed897e0ca0ef43ac8da6da57b2dbed02703b237 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d6d47b8ccaeb4f2418a9d0a4dcbf32228e27408f |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4a300f838ccfe71198c993ec6628e51025cb5f23 |     
    m68k     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/fd656ca9dc7a1419b2bc568ea51801e57cf14061 |     
    i686     |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/9af7c44a3027fd3a5dd6567cfea56494a2427879 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 6 
              libopenssl-3.4.4 | 4 
                 host-gdb-16.3 | 3 
                  giflib-5.2.2 | 2 
host-binutils-arc-2023.09-r... | 2 
                 libssh-0.11.4 | 2 
                       unknown | 2 
                  cairo-1.18.4 | 1 
                 expect-5.45.4 | 1 
                  ffmpeg-6.1.3 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.41-123-gfb4db64a04a... | 1 
               graphene-1.10.8 | 1 
              host-guile-3.0.9 | 1 
host-netsurf-buildsystem-75... | 1 
                host-odb-2.4.0 | 1 
              host-pahole-1.27 | 1 
host-vboot-utils-4b12d392e5... | 1 
leafnode2-9543ffaf82406f943... | 1 
                 libcddb-1.3.2 | 1 
                 libmbus-0.9.0 | 1 
              libmodbus-3.1.11 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
package/linux-headers/linux... | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.40.3 | 1 
          python-grpcio-1.70.0 | 1 
                  readline-8.2 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/9e63bbb7d07491890b597c831edc795b04d9ec08 |     
    sh4      |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/e151e88354d7182fd568143a139e004d6ff4a888 |     
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/e1a50eae3c8710db369893adee19826b3ab9a337 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/249b913f293787667b22137e4726807b75d7edb5 |     
   mipsel    |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/03d15b104c65a17808c8a8ba0ff98e7926b98f51 |     
   x86_64    |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/273c66d1c0edc99561b062700d43dada9f7e8d05 |     
   sh4aeb    | glibc-2.41-123-gfb4db64a04a... | NOK | https://autobuild.buildroot.org/results/8bd9c3feec60a73be93a234d7f50a20b47682b56 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7f4dbc42be041ed9529aea91e535c5f8863cb1b3 | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/81519d0ffb853a883e43eb5b24212843f61bda46 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/143cd562b15233b2704ad3c117ae19ad391849e6 |     
   sh4aeb    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/9ac34fd7c4b640f9e9498497cd48e31bbb05dc45 | ORPH
   x86_64    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/09b9510ed79af8fb0f3ea34ff1bff89e84063af0 | ORPH
    arm      |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/da654a7e44312f13e0824ff476d2723d84fd2d09 | ORPH
  powerpc    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/9b48a0eddafe2a319d187e96da5239924eb3e2d2 |     
powerpc64le  | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/66b5a576a143a64be7c2da7692d2aa64181e8fe9 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/184084dd12670af23d0454a00d3d9c0b854d6c99 | ORPH
   mipsel    |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/b62ab5dcdc1317d14c3ecf1046b74c3397f6aa3e |     
 aarch64_be  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/cc55350aa8c67913dbe89e5760cbd6b1e9a1133d |     
   s390x     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/bbc2682654f3f75fa608bb5e1d043e7ffe1afcd0 |     
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9cfd573249ed3df86f1588e12b897d930c69f93f |     
   xtensa    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/36be1125d5cfa5f8400d5dc9aca129f603663bd2 |     
microblazeel |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b059dd65397e84e3c0f4d9840425ee5d21976244 |     
  sparc64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/a1a5550f2c7a4fc8b4c5f380e2f4a8b1bfb068c4 |     
   sparc     | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/43796c9943765210bc85d3dd84c06235d31b8717 |     
  aarch64    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/f9d4e97af866d9a35a0ca652aeb85d550fa73a64 |     
   mipsel    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/6dc8593e7f57a78f3e6a0d7932c61c2ec5fe9572 |     
   xtensa    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/0a521933f2fb4f4f71e3455061fc17c7b47cc0c5 | ORPH
 microblaze  |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/1ee23e2ea76f3a11c08805b5bda757de465ea46e |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/ee5473bfbd2f25dc21654d2b2b136497c295bdb8 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/09d2a5ced10e314c2c3015af5dce234f0cf4ebe2 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/f7efe40262053ec926b92fa0b3c4a4ee8dcf8a9f | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/f95be42129c0bb929794343d30c14e14135adc91 | ORPH
   mipsel    |         libssh-0.11.4          | NOK | https://autobuild.buildroot.org/results/991443bd6cf830611d7dbeffd4a8941621560afc | ORPH
   mipsel    |         libssh-0.11.4          | NOK | https://autobuild.buildroot.org/results/65583742b559de99915a35e3af74773ab6e75635 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/47786ec7507ed1a31c06acd83af2b19f78452f09 | ORPH
 powerpc64   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/aa2ddb5dac88bf119ba47e9fcda36a3764ec0cee | ORPH
    mips     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/4d318bd8f02bf8a0ac988ffac684f951e12a16ac |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/875e2b99bb5efc906df736a8162d68c08b124f47 |     
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/a90ba44eff210ea3a950b6da8df23daca8999a98 |     
  mips64el   |      python-grpcio-1.70.0      | NOK | https://autobuild.buildroot.org/results/fd10303f2ba9013fd9b2937dbd1bc5d537529a30 |     
   armeb     |          readline-8.2          | NOK | https://autobuild.buildroot.org/results/50bc8e65e71d6540897c03827191d1d2196c1fb4 | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/5bbe76a6c2e038b8863586537bb187986c8b685f |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f459f0da691bd6e1e7c30a2af8d0edd6b07ecc46 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e5070319621959dd925f449bba6f1abd8f9aa8b1 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

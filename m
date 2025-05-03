Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC7CC3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 09:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 230708042C;
	Wed,  7 May 2025 09:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtNnE1h0AHOa; Wed,  7 May 2025 09:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E5D81174
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E5D81174;
	Wed,  7 May 2025 09:51:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DF48438
 for <buildroot@buildroot.org>; Sat,  3 May 2025 03:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DD10416FC
 for <buildroot@buildroot.org>; Sat,  3 May 2025 03:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvvg69xQjMMB for <buildroot@buildroot.org>;
 Sat,  3 May 2025 03:10:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A95AB416DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A95AB416DB
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A95AB416DB
 for <buildroot@buildroot.org>; Sat,  3 May 2025 03:10:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so16329245e9.1
 for <buildroot@buildroot.org>; Fri, 02 May 2025 20:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746241812; x=1746846612;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4T4P4lvW6yozKTI8UCSYjJUMRw8mm8Xg2LsvgK8Ufc=;
 b=i6Ht9mP3zSC3o4NMMjTeJO5gp9cJpzHpCjRLDSJCYGH03egsioBn+QYxz2q1XHEArS
 1ojcqQ3J/XqQF+g4tmlHRAtO4OWl4tmtk+3kC+AfsMN+7nYWfLb5UyXWBf4Xy1l4JmkW
 bodVQw8OleTQrCazzxA2aSpGprWytFvRf44N39RmfDHfmX53S+afI6rlFokN3uXfv0rE
 H7FY0eC777CNDRrdy5MEdPM6wVdaMGfSmlOGR+Iym4gchT5KY4XBNEmz9KV6+wVmG72/
 VNx+rCGtXyeTz13cHihn8p125cDDD2BRupOUpV+x5z9I9uD5hVo7hIzNrGbao156JPR2
 LLjQ==
X-Gm-Message-State: AOJu0YzaqZXxCQbH0byXW0Nkc/hY6oGd9rZ9HBSSWFyIjZ49sZLNowSd
 CVyp1HpbO+SBOA0NbIdnUPzQagaf39854Mi5ya7uqso3qdi6wl+kxsGdRQ==
X-Gm-Gg: ASbGncv6O8JabKWauKqSXR6Bwo+7Iw4D9DEcL7ezR4IgM6jo+vBQQwgBVg3g/RlKdhl
 7Nc0JCRdiidMKtFYFWpONzx/WolrIAldhFSzrM9zvOVcr0bTen9Cr4b5Z2S3dMJjYmlVQw3Fgj5
 W2GOpAzgEuHrISJH3/gqy0JhRDbJK9wnsvhbQkrGi5sLDrAJN3qPv8/Q25CdJ0DstsSah8O8psg
 FLpYbBg2GV4Oe1YvcyUe8JhjYhAPo0mguT67d4Myi3aUL5g0ANnnZTEgwDOO5bR9cIiJq9PYVU1
 pGN9TJ384rZx0/5Jbb1By5UPFqVtbw2hyguwKxq2oBQv
X-Google-Smtp-Source: AGHT+IFXD5JI1sXCZ8Z8BypJaL1zuaMhZj5m8AB7WzO361GlHJrEIOaQc4K+tpgNH4sY/ettvmnEug==
X-Received: by 2002:a05:600c:1e13:b0:43d:db5:7af8 with SMTP id
 5b1f17b1804b1-441bbf3456cmr39785735e9.21.1746241810880; 
 Fri, 02 May 2025 20:10:10 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441bc264e2dsm39581545e9.12.2025.05.02.20.10.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 20:10:10 -0700 (PDT)
Message-ID: <68158912.050a0220.386294.e76b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 03 May 2025 03:10:10 -0000
X-Mailman-Approved-At: Wed, 07 May 2025 09:51:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746241812; x=1746846612; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=u4T4P4lvW6yozKTI8UCSYjJUMRw8mm8Xg2LsvgK8Ufc=;
 b=UjGCAXcgPf+4J4qjD8EsLERJ4A5E1KHUvKZmarIOQpo6uSkRkRcxiEQvcC6qoMH7+1
 uHjd9K7kBkKv9O6Mw3e8kjW8GhbQJqv9HIZFD5gl0ApJ709o0nPok+UPKH7aTg11+p5Z
 pLXwHcQb13t5WTQmhZ+sQhTSF1dvTj+VpqWnicddUqO3dCijfNgaUmPpFzNbdv1yd3AT
 FLZd61mVRyBPaQ1lrE1B3vfdQcUkkS0IRtnHDFVvFafvDXy3UyhQKblw+lwysJ6ghRkq
 5K+mrrvN+ytLGZz2awn+FqwbHao6F2zpdC5MbHU7cPjlQjEm1S5GAAEYLL1mLLFcZFlZ
 whtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UjGCAXcg
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-02
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

Autobuild statistics for 2025-05-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  8  |  0  | 12  |
    master   | 18  | 3180 |  0  | 3198 |

Classification of failures by reason for master
-----------------------------------------------

                host-m4-1.4.19 | 1882
            host-hiredis-1.2.0 | 623
                       unknown | 284
            host-cdrkit-1.1.11 | 181
                host-cpio-2.15 | 105
                 host-tar-1.35 | 13
                 host-lzo-2.10 | 10
            host-pkgconf-2.3.0 | 6 
                host-gperf-3.1 | 5 
  gobject-introspection-1.82.0 | 4 
          host-binutils-2.43.1 | 4 
             libqrencode-4.1.1 | 4 
                 libmbus-0.8.0 | 3 
      passt-2025_02_17.a1e48a0 | 3 
             dahdi-linux-3.3.0 | 2 
                elfutils-0.192 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
                  ntp-4.2.8p18 | 2 
                 openssh-9.9p2 | 2 
          aardvark-dns-v1.14.0 | 1 
           at-spi2-core-2.50.0 | 1 
                  bcusdk-0.0.5 | 1 
             bmap-writer-1.0.2 | 1 
                    brltty-6.6 | 1 
          cryptodev-linux-1.13 | 1 
                   enet-1.3.17 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                   fwupd-2.0.4 | 1 
                 fwupd-efi-1.7 | 1 
               graphene-1.10.8 | 1 
               harfbuzz-11.1.0 | 1 
            host-binutils-2.42 | 1 
            host-binutils-2.44 | 1 
               host-make-4.4.1 | 1 
              host-rust-1.82.0 | 1 
                   iperf3-3.18 | 1 
               ipmitool-1_8_19 | 1 
               iproute2-6.14.0 | 1 
                jemalloc-5.3.0 | 1 
             libapparmor-3.1.7 | 1 
                  libjwt-3.2.0 | 1 
                    libndp-1.9 | 1 
             libopenmpt-0.7.13 | 1 
          linux-5.10.162-cip24 | 1 
               mariadb-10.11.6 | 1 
                memtest86-7.20 | 1 
           oath-toolkit-2.6.12 | 1 
              openconnect-9.12 | 1 
                openswan-3.0.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
                openvpn-2.6.14 | 1 
                      opus-1.4 | 1 
                   perl-5.40.2 | 1 
               pulseaudio-17.0 | 1 
             python-webpy-0.62 | 1 
rtl8812au-aircrack-ng-b44d2... | 1 
                 rtptools-1.22 | 1 
          sane-airscan-0.99.33 | 1 
               valgrind-3.24.0 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/910176745256487d0c3f1140d73dac0ec0f0128a | ORPH
    arm      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/6608c036392318021819610ebd7e77ee1d08c951 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d2814b7246bf8d78b91538f089397543515ab6db |     
   x86_64    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/51fc7e79bae3e4fc67a8097fc0eb101be9fb2811 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/a2e4338e4b5c08d070cb8cc1ab3172ad09866c92 |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/54a912d85c662d89ac981a8f2b8d521f0c067f39 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5209afcdd0e5bed6ca55e675447329bf757ffe71 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7e11390a7205b33ec17f4801335b11503f05f99d | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e67ee80fe18d29afc29dc7bd0cfa77a4a35be901 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/44c9e642ea71a6cd31783a999e7fb4c464f4e7d1 | ORPH
   mipsel    |          enet-1.3.17           | NOK | https://autobuild.buildroot.org/results/8c811175000a1613d6c4f889257d6289b301f4e1 |     
  sparc64    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/5f85f775fdb1b74c59f03ecad1a0e83fd8f4330d |     
   arceb     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/8d9597866861ffd496413eaa50c4031db6ad51d3 |     
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/d1a66082de31bf9475e7f1a5528a41c632935cdf |     
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/12fa935f4a9f9487251009748226d400554fdb2e | ORPH
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9c1c576f94ab2b4920c5909ced29e02f80af469f | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/2617f11b59ca4ebb6633f8b4d41e22e2766aa2ff | ORPH
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/af7e5adf3d728f045704afdfac6450185d9c1d98 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/eaa4dcbfe9b41856c5ba1557281398a2c404c619 |     
    or1k     |        harfbuzz-11.1.0         | NOK | https://autobuild.buildroot.org/results/7becdc268ea5a45c516135e0d9baadc753ac466f |     
    arm      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f19d42bfba5540a4c932dd9ad05249467832e1e0 |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e1ae9376cc1ddb47bc46aa96ca1bb4b4596590b0 |     
    i586     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1a014235873db305e7ec83d8f21dabad4843b8ca |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a25430512e618021048228d67e5ba8bec2b26db1 |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0342c80f0246fdeef4377665f79740204e2e67b4 |     
  aarch64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/d24d3a85315b00bef052d2c8c1c617bcfabf7a93 |     
    arm      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e980ea3574ea78c76c879df76cf890d4803426e0 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7e3ab3465b8f8f4724479816eab9486f7085c42d |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b0c02c4a5004c1ff72ec1783e138ebc0bae9554e |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/45151f9682c283a56056d8c0d127930bc54b4a7c |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1570795145be6579ce3e26625f548727788a75cf |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/a73a7d3b1a2bb4f0156e9943f980d46f85d49407 |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/48a2a689cf986a348e4e4bf4e1e95dc2a8aa5d6e |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/72e42834e3b8b989da167a6a5cc5f2e5d5760214 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/77e82f7c3a30c94a3baae678f855009464bc4854 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5c05a4f27b920b5357cf1937183a8dd3756fe8d2 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4362d41cd07b6f1fa0102e51d20040015d388014 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/88af5f6d4ce742807cc9db3c9c2a1785742fb4f0 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/836765d966dc63f3267c9d80d9fef1596014409c |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7c6fc0a747012615c239d7589c83489e581fc6e7 |     
    sh4      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1792250d35e5bc929effebbc53175a2dc2b3c740 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b2fe902922b0937f87247ed894be3877995ac907 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/20070de7dceffc1408b5627017ecf122a1d24dd4 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/746949b6c6bec36b4a7d03380b51136f937d0852 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c1bb3573b4aa1793f0a49276c6ddfc4b12baf35b |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/af5f750b358afdef75f8e502930476f82e59219a |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/46041c30a531b93214621df7b762fa1e45dd9ad6 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/14f25d4f09131c3e2492ea461fd33a89b946c82c |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/6e77aa6bf379d3c9c7a91672f7087a73b1514d09 |     
    sh4      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/cdcd9d3ac31cd54575c57ff8029e9a6d59dfdea4 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b54c04e662a114014ec3326fb261448f2f3cecbd |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/bf82178339fb8b354674bf3975c32c2e5bc6c6fe |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8ae9f8107a3b5a1ff063783a2ceb0a8c14d04014 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/dce8c5ccd1a7422059a44f0d5225a310fdae55c9 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4c1297cb00e6cc380b29d2cd8f9301b58c0eb936 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/352e788a519a2ca3ee6f6a592f860259baade8da |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/14ca927b0c91338ebd908ee7dba0acb8dfb7f6a9 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f740ae2ec28ed6d118ec5640848a217741b54571 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/bc31687198344f48bcb8734b3d49b81bd083a0b7 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f98ee2936b4c754b73c13618d4be5c3acd837a8f |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/70f6616901fe0f80df869c5e0c38094a769c4a21 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7da1b7054f9dd8bfedff183ea3fd685838ce6956 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/72a250e8c58bf913bda9f55f0d03d3712e62c415 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/decb472f18d0e3c7eaecd5669419f91fed55e76d |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/bb3b7d33fae4fec7e50b5174d2e4ff406d0b1c22 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9cddf990c6c8034524d5fb9a191453b1630c317c |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/a56e967ef5fc6c19563811c8fd091d6bef04594f |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/edb78d31c9d396163e95b2f7876c8ba31af0213c |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7db17933d3aad0b315b2f11c2f75ac9e82bbb543 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/53064afaad5e4ea5b71a41b2f7c3017d94bd7cba |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/bb427590d4e6170cd289bf9b14e702ddcc05de32 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/44ae201356536f06492105c73ac8df4476ed6d92 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/57229632a7c40a3a173f6b3c97ba532a7a042712 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/cb686b4fdc1f820e6818697bbe929055ebdbc729 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ea78c438d12bc7cc3109133c5a8b60722fb2a9ab |     
    arm      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/074cc0116fe7db581ae23cba504623998e7ee01f |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b1140aff57fea88d8ef9ca896a7edd25f041aca3 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e314626790d06ea94ac984a54a52e39263aa882e |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/cdc1165519ce89aba63d7c3361f24ebffead636c |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/caf7f3f925116b4fd54cccad5db351c4770f15bf |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ce6dce2442a5b3208b8a357dcb6bf69a29bd677a |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4ce217f07dd6070ca3352eb3eb665c7394226cb7 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/fc8c7338587b5de549de430a3fdbb75aa82045d0 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/70cf7f85d3ddd81722b85413dc4b45570029ba3f |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/72f8ff4aae3d305621a4ebc4204e267eca84c177 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2f3009a68655e75fd0949e8035a6343e3034ca1d |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9f101c35661b789a4b9932eaa41db9a10f4ad6ef |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/10e37e2e8c876a02d3d19e781b438996fba4ad46 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9db5fe320e8605e4987adadf267b3e9cd91f177d |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8c3b21fde246aa333b4ca1accdc630b2ef126b9a |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8c648626fe690ca1ffb8b197d22fb79278adcce3 |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f06b85d9fe7e9f0eda5ffb01ec7164df801e079d |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/3b26019b4f793f79b5971a38b60de617d7ac3ddb |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/44c9657145e0870650eea3b76464d24888803ac1 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/db8c51d68cc98dfba0d11006ec07aff47bc28f93 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/dce6b40679dc2ac829664a45cd97c60204b9abe4 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f741cdc662fe023db3a224e2c12db81995525ec9 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/3cb95a96ec2fabd179679aae40fb68f701fb303c |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/27532c0a2935bf68e72e41a18cd08789908a49b7 |     
    arm      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/bae5e6544e654773ec6841b82103841ab2b10ff3 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9e475c19e696fba9b9bec36ce7b6e90773adc755 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e27d4adb8185c91244a0f5d217adf0152a66f020 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4acdcfa8a1c6ba953e958abdd300b14d873e0eb8 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f6db1478340657288fe41b47c95d882ba08ab1a2 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b75a5d2a448b977cd13cff734f2ea19bfba66338 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d3d20c15842eb1682ffe818173d471f94711f0db |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/be3d4e684ef79b2310084ed5f12250a814807c8f |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/3e86c5632625958bafbcb7333480a95a5372ff96 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8f894e6802f0fb108762c9182fadcd9148137056 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/0aa7f1d29237480f889c1ecd0665a119ace7ad90 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b9aba1607a5b17c7837117064b0ac65c6141bd88 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ec6e212be4a015d014d431f4961048781acef7a4 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ca3cdedec120b1e2ce0286ba441b3e92377e1ff5 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e89be9be3d96bdb4ab9b87b89ac88b4a7ca8d2de |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e5099ed92dedbe882e8c0a6abb26f8232ce8eb7a |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f5b794e18d2dc1734ededc9ae2114f32a55648a5 |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2227dea0c7f5c0249ce692ab9208f148e98d28c5 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b40874800f690a339b22842728826cea26ea89d0 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/94fb793167d431aa40b524fb9c9c403a785db943 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/549bd73a490c443d2a7e81b42281459116b678b4 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7f4dec60b55fc5f3c449e4f6b067ed6542b3cbd4 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e533b09b43322f36b53dfbae537076c614fe4d3c |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b3a941e1ec7db4d3a045099405cd3953d4c35e21 |     
    sh4      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e0678c57da00814196bdc6be5b596b273f1cd5fb |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/250565cf7e0143badf24f0f23845266f49c09fe2 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9757b2e55f963266d4b4e81adcd9d568d7e68606 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/91cc4383d98d0be006a74cfa96a0413e9f4f71ea |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/47e6cfa54d411579a184360dd488ac59399345e9 |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d905cd908eede8280bb2fbabec5eac4af8ede85a |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/19fc7820d417ca3999db308f7bb6034e8d8550dc |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e66b3b017e6001bbe4b299fa58e7af1c58bffa0f |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/15e74fd03bc1e74918cbcac8cfb03e42024feacd |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/6a00b12fb60b32b66fe954255e059dc77441a2c2 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/42475c6c6b81c3b330a882b53073fe971a5afdd5 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8dd9333d748ce0c941c5d9855c796b7f2e410ada |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/75258019f43512f935ea5f8129f859066bd487b2 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e92f0476105b9fdccf1dcadf017544e05a215b50 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7660242c92e8cb754a8cc641456aaf166ad2de38 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/27300a439e883c93d9f08cee6683011457a3b60b |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/a251fcb698e86482138fa4286c058871a49f9991 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f26e0733c0bc09f7f1e4c0b406d967ef2fd963fc |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/46c425d4de59f1d35e2d175427b162fed9a5c7c5 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/0c25afa1d0bc146c3be2144f0c388595e433d8d3 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/dd9a93580a3d9697d71eeb13324b374d5f45c992 |     
    i586     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f7538a5b8c87ba8a54868004cac21f62cbcc3607 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/963874ff144e51e3b202ee19cd7bd76e1faaa5b9 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/555cd0bb2d783ecf96f79127890a8251b455dccd |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c0e3e64ad7611156b8a692e78ede710914ca3268 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d9389e53d7900020dd17ca3a85e3d9b54da908f7 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f7be50b79e22c2fbb8c60cd34e79baa0a2faedca |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5ea59ccab9ccfc4080c61f5fe1d6b7f802be025f |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d19726ca14628401b8f7d5cf65a2eee77b8d097a |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/66c07a31c676a942cc040ae91ea9060f1b3f6f44 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/084aa77fa3a04219e53d94be9f4ba9579aad5b58 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/fdf0cbc99f515543be92dbc357fbd205a6e32357 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/6216b284f0ec6752937bc384973ba6bc31863090 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b45f7737e0fe3ae994791780d3d1fc95a6c6580c |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5ec004e927a05831c42647e69ffd5075a43b3e50 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b641c2326121dae6700bc5459442408cdff33911 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d9ab4580a1fb31ef3f905183a776674db710cb80 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/03ec5f64a29e081835a32fcbe4d44ab2870e7bfc |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/173af31dc6bf0d60a6b2caefbca1d6b5fe521fd3 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/68c86d80c4fcf7ae77279765048b95aada151e47 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5572a44fc2b6d7b8280357e3fc16a0349780f380 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4b2ed43ec5b8ef5aa66ebdefad06468c028650ca |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/d2dcda81540e973e433d70227a743cd0b409c47b |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c92d43a4f3e286453d251263ac2faf533d2efb00 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/0f7fd338abe4c3ed46d00a10271add4cd6f48fc1 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9fbf33dd88b727a89f556303ecb655dcde0fdf52 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f4f13058304236c2bff8d692078bb9ef7f5dfca6 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f30a31a9f5cdf70c58f1aceaacdbbb84be88d39b |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7a5bd4f9572caeaa3b45d468309e4fd2719999b2 |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e47f378e52c60192a8952df2aaf2a798e888f230 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ad2cad202e14871f58ffdaad32f6769b9fa31f33 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1ea4e67ed04aafd1cb95ce96ff98a957cbfd89a9 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/513d79c18c9b3dfb893a82ee27a2b45b138b96c8 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b8cfb8a9b020bf6a6c9d9ec7febfd685c6496528 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f676c73782428109660303e5f25eecdfc4833586 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/505f7f7e7ae6860d8ba9b05917d8b49a52f5385a |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f218a80a88a992d58da5bf71b89a6fcc73e54e1b |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/21b6784e1ca99b2e5bf7dc1494ceb351c28d16d4 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/90d5ac7fcbf04bedcd4bef1ee178ec7d2646dba8 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5af1c29c0e4bab7e2ec2375e420b1acdfb4ed12d |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4171fb76d11353cc0202ad3fa9aa71e37bc765e5 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2fa8c3cf990af850bcc21ecce72737f617a54a80 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5060a8d32400535110752fd28b2254db7280dcf9 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b2c8a83e888271f006e0835f86731db6266e4ea3 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/455d4c8039728458214d5ee05e6c7be211e44bfd |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f6d7602483722b52b508f03523879bae58f08f3c |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/526e471034321b363a553908ea573fa748dda196 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/99463d03f21ffe0115805dac8943038605006a02 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e64d7eabef63d7f0ae1c009b0015bcd83c6fe77f |     
    arc      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/dc04cd26dd739d9c63feb4db03650af2d736778f |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/edf952dac1fd89f3e24512cf20173c57b1ed753e |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4c9a81066dae32abbcad2f43d5fefd2f032c3689 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c6a2fb0b67dd1b094f8b49438e67d5f932f72a0b |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/16f251986f67594ee7682a9b770fa38a1d8ea64f |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1387d53c5d49e55544760663d2efbf7dde6921a0 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/abe6476aee81c717ef1bad21334de8863e62daad |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/3f5511659482586b8427ab75cabce71242881d7f |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/1f1d8d7bc308ca212be7b0b224302c12c73174d9 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/055ec5c0ec7f930e087a860ca0b383b0b6117924 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8c987b2fe6605f0f57b2ef074f4161e7b0b22623 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/fc53a0935a89d98fd0ebfd9fa022138c6de2398f |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c27a364dc40cd812d2e581440915ae241a1e8f01 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/04ee2d62f046f45119d757ea81b0b68b0b28a95e |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/aa32847533b9c8a66580de3540427b5f9783f0a7 |     
    mips     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/db91ebf064209165823298ae87529557e2d4168d |     
    arc      |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/d746111a4e091d8df030a569ae88c41b43f73640 |     
powerpc64le  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/f77d76337d3b455e6ad0481b837ad227033b159b |     
    mips     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/bf11338d80e5bb73a9de35d5021390eb3ae8e130 |     
   mips64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/45ecd416b63f94bc168e5e6ea0239fbfa0f9ae4e |     
    mips     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/ed7461c25a0e609aaad48058c6c62635c54dadd8 |     
 microblaze  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/dd22ae7bfb1754cea27d3c02615cb4b878bb21f4 |     
  sparc64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/865e1fbf7b7c427518803fb7720a6346bd385eb9 |     
 powerpc64   |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/a28501894a1355ffb555bf9e552ce95bf469f422 |     
   xtensa    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/532ee28daa3413ee0359e8334bce2fdb6392280e |     
    arc      |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/1823af96b3820cffcbadee635958f73c4aadfb61 |     
 powerpc64   |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/76e807571d8caa4e4e7ce3f22e8a135bdfa61a56 |     
microblazeel |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/5eda94501f9d8c9b5094da97d110d018ade0d60a |     
  mips64el   |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/1ef0532deece11583a72d46b0f8bac4ca70627c4 |     
    mips     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/0cbab7fb80a3dcf3c7cf1dd07edf14619351120a |     
   sh4aeb    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/b15e4073fadb847f882aefaf502ff19d17791759 |     
   s390x     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/203e062cb9239c2d8274138719fb32b67bb9955c |     
    arm      |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/d0fe601208e2d090d88033ebf210abc162de164a |     
powerpc64le  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/0fad5d9d46a1a3ec45fe01fc7a1d77edee637f0a |     
microblazeel |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/d0ad5c62db111e24e19b658c30fc5ab544a8cc5d |     
   mips64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/4620d84f9f8311d95b4c43ad1dbf977c49693fd4 |     
   xtensa    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/712a44e478c61d1c54acd3ca05fe3b940f56147c |     
   arceb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/d9f947ecc6bee9d60043722a8d970de1a2ff9331 |     
   sparc     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/9a2ca4964d4c4850fb9347bc00cd08697602bba3 |     
  mips64el   |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/4c4229ed95a541c46ba683fe9c07ddc6e37e2239 |     
  sparc64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/1aecc954a73be5001f1eff5a388909f0d7a78c09 |     
  sparc64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/07afc326d5ca43072d194e95e1074f66650b9e84 |     
   armeb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/98916d96a20fb3956f3ff305fb2b99044879c01e |     
    arm      |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/b8ef6603ddac32c9b165502af05ba1592d7b2599 |     
    i686     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/3ed8aec7f454dffaec3066d22682f62cdd98ed9f |     
   x86_64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/02441009e40d811087488d3a9e1caba91d6fd516 |     
    m68k     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/1ab3c1bd95f263c05e0e2b01c3788d85a50cfc1e |     
powerpc64le  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/17aed4da0d995004f7e70838dfeba1a372711675 |     
    mips     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/e6f7d756c1403d7e53d69c17b88b6544aea265e3 |     
 powerpc64   |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/11d842545cb335e07bfc0d05c615814627877cc4 |     
  mips64el   |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/5f9507fc6b926af1b7c36a0854213661210452ea |     
   sh4aeb    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/7fde2847d3a0c80721a052e102ad0b6279a2d5ad |     
   armeb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/f0a6f779f231afc620d84dc6976522b1e01f11b2 |     
powerpc64le  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/f0e1a560ca86af14c03ad78b21da9faf37961d95 |     
    arc      |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/0fd8870052cfc9ca5879c5b41f5ef39db02f5880 |     
 aarch64_be  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/e226e759cf9834aebeb8db3e87e7d0cb78f9da1c |     
  riscv64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/2fe0d4262f4af5534a22cfb9c26ae0fe56acb188 |     
    or1k     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/697c557e93596216e204dc4c542a369c51c9faf8 |     
   mips64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/3ce6c4f5ef87f3e048ac639eeb80463945b11984 |     
  riscv64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/4179b014945de5a4d032fac463656b5793821912 |     
    arm      |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/6b7d9ca957533d7666eedbd23383e2336b85b7d0 |     
   sparc     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/8ce09e093f08c5d38eb1aaf1cd25d57887bba09b |     
   s390x     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/a02f47e0e7d254f3eaec10e2ef06fa4f8a2d03e1 |     
    arc      |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/2b9ebcdd6d3dbcc48d07a3ea10dcfe084b7e9d17 |     
   mipsel    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/769d572451bb45546096a34d995c7bce330d1cda |     
   arceb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/c5cd5403fd015912395232ce4866d56274758fd1 |     
 microblaze  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/9fcb8299572b9ba3a8a9178433b067029aa2052c |     
    mips     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/84fd3380029ee11c864f26c5aeb0bb1881a5866a |     
    m68k     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/1f74864c9d01be34d38c3a401a16351517d6bd26 |     
    i686     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/bc5a99efe7deec78dc674cf6864bc0c788632963 |     
microblazeel |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/dfe35bd0b9b8b1b56b903002144b9d4dca46e2bd |     
   mipsel    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/26f30cbbb26ebda5fc6016b888efb1fb50245147 |     
    or1k     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/cbe12ad229f7f29a53b2dcee36b0728968aca110 |     
microblazeel |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/097e52eb5fb4cac474b80941444e0b1e43c8a299 |     
   xtensa    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/fa1be9fe20b5721d8b50f17910ec3a3d8643db01 |     
   arceb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/c76f19f8d80a8399d76b015ba2fd34302e2e05f5 |     
  powerpc    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/ab6c2a795f44b650d1bc5bb41b98484e5bf7e698 |     
  sparc64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/250bdbb86451c5f442aa3c119213661731a683f5 |     
   mipsel    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/c1485948cb17ff98bdfbc91cee4e937bb1ff2c8a |     
microblazeel |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/b766a3301cf66c084015d4cf5da6537d7323cd09 |     
    mips     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/0eac618500a612060d2d6ad81c2d90fa5817f601 |     
 aarch64_be  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/4c601161a9b13b606c34b590c5d71ab09ffee763 |     
powerpc64le  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/395f5c16a4162c91e2e47ec5dab2318c2ef2e1d1 |     
   mipsel    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/bff22f76b488228bd56c3d7f5bb43ddef82a4370 |     
   mipsel    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/7f2f7a4094905922cdbb9553f9b66d0d53e70a35 |     
 microblaze  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/53e73e1f939c88afdce1ce15a36ffba05bf64974 |     
    mips     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/090520e6d8c90fff2f08a8d3294aafd0f9ac1ef0 |     
   armeb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/0baf1fb3c441ba00623c0ef4e248cd8fcc35d00b |     
  aarch64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/8d03496ca2c74d651d29b51a1df8869248314cea |     
  sparc64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/fb83e695ac60bd93aee0ebd527def779abdd8789 |     
    or1k     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/ea921d1768824e72de6617c716ec772bb559967a |     
    i686     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/d5327732ce76d51450f2fc9f4583d5eed61989e7 |     
   sparc     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/f42a327a754c1450ffa5ecb7ba8f769f088764b1 |     
   sh4aeb    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/70f55aae4c419c271d847dafe78ff0036342df85 |     
powerpc64le  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/256977ba4097639b4f55591736c31ddd977e0a08 |     
  powerpc    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/3495ee4de256fc5dab07ad34a69c2bd95d48b034 |     
powerpc64le  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/50057cb941188b9138de05e682c0509c213b3112 |     
    or1k     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/f6839063a23e3a9f91d0653342f2a1b48fbcb484 |     
    or1k     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/b52e11204d73702db4bd6306afa4424d1615c873 |     
   arceb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/bfea1a70089fbf6f40aec1f14a9774da59fb1141 |     
    or1k     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/1b92f9513347f900e4eadf906427229bf06a1024 |     
  mips64el   |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/d1ffaf538db31c0aee6667c1281d8f261156c1c7 |     
    arc      |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/20f9117debc279b64b3438b685d3b0521ed33466 |     
   arceb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/1a401e35b43fc4b8b87391073216938ec07d0986 |     
    i686     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/c4f2501d4adfa4d76789ba521e4e566c52e8a1f9 |     
 powerpc64   |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/38594f90dd7e03a3a3c7bda0c2d1433a0bdf9e7c |     
  sparc64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/2d9653c2aa15535c7c01e71def4da09d3ee56a3c |     
   mips64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/35224e39e4bcbbeacd3513179411efbd61c458d4 |     
  sparc64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/71ce167a5a2f06d612191be3b023abc86fa7a4bc |     
   sh4eb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/187db1992528ff15b8c1b3ff43bdab768b75c774 |     
  mips64el   |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/d8a1d2271e46935d01713a4d20ec533c98cdfd97 |     
 microblaze  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/827e3c9820656abf3e3d283bac0b389aab2c9d18 |     
   sh4eb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/340c035117b60a276f1d64e4d84737081234ca4e |     
    arc      |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/9cf955349ba9ec72c5c070f42d5e8c3f7e78c773 |     
 microblaze  |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/ed11a6917db4335481531980a4c87c3079404965 |     
   x86_64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/7b70fc5f9e1f0d743be3ac5b08f28fd393fff688 |     
   x86_64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/d40fb1182df70428fd0a7ae318ff63303418dacb |     
    mips     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/deeada5372c7663433805c9bce93bf2d84f7d19a |     
   mips64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/f2bdebd8a768f55ef1c61b728ae6f5039640d554 |     
    arm      |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/9150ebde832637443a0e95f541c495c34c2f2c6b |     
  mips64el   |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/8ac68b075559e0943d20dc03b267d277bb9a4082 | ORPH
 microblaze  |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/e88917e836d547ad50e70cb8133c60eeaccdd907 | ORPH
microblazeel |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/b1424f0d08d8ff765624c9efb47c89c1755860fe | ORPH
 aarch64_be  |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/7f357166ca75da54789d04b837c19b4e90bf9f91 | ORPH
    arm      |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/e5062d6c6d47d3ff6db6baed891810575dca9b83 | ORPH
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/26974ebdc80cf36f510f025b8f3f61da543aa87c |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/904afb5f64a6150ad5c3f46f0e04ffe1f5289e7c |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/07b15ddb73e1a12480747c79e182abba706b642a |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9f3c5e7ae190e91aca0382550ccce34957d195d6 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/912b3a2ff90ad7e5371c094a58793e41fbf129e3 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/61287f953bcbaaf4dd54838a6369566f20c57840 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/390a7af372f26ea9559c4f20d4a9f0cc70e735cd |     
  riscv32    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/57116d2c752fbd64f05c4940dd49e41536682aae |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3be49bde25b9024f8dcc013e740a1de116a7341c |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4ebdb448b2080b37e707db7ff22df7993209612f |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b4495ca87223356d2ce334ad65b93b81776ef800 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9257eeed9c8bdda323fc8dfc90377289486e9160 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2c47ae4abd607dbd24f77f8b4acb87ccf8d94f53 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b506c43de16e0f48d95be5e614df8b84edd18c13 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/381135bc821c8c420f00706defbb311ac81e44a3 |     
    sh4      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d10117b1a764a8a01b9def7cbed68d7667ed6867 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f2626ce21e521b371588c5a479c9544fcdbbd599 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4e9b14e14ccbe84e19decf221d09b53b1e0e15be |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5d122eb586dda1e6ad83eaa74b1e2103504cba2f |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9472db135ca63b4b28b7cdbda9b8ce1aa971d133 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/082b30a5b3582db5e7b33c783086b8c9912415b8 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/56427eb809c304baa03d14140a0ec0e12a68d711 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4ca870ea9f58e89fcfd761d90b18fa6afbc3180e |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/40644b3f3e92e76b02e1e037953d1399efc27db5 |     
    sh4      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/caa7cf973094aa4598d9db2520ef52363a8575d4 |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/95e1feccdad148f375491a410d583343c55c1433 |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8d1a16acb2cb31110a2f2b1815e316921adbd2c0 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f154aff562faf1c0d9943156824c8818e4cd236f |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1aeb8ec3e8717001363099681e532172f6b22950 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/42d51f88a6effb7523ab5372c00e1aa85333cfe2 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2152ce593cd2d76411c61c710b52bda5f3854ca4 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/954403a02c68634f3d6e586836a20dd15ce7cc98 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/79cc05535ab31683bbd5d61c78594156a51703f3 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c0a0d2868e49becf9d07cbb9376757b07f412210 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/32f5f17fe810beec9b3077233f4a4764edc87632 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ec674358f2278fa01bac32fd9ef589d87027feee |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/456c7eb0c34e3ff920bba1b0e996ba0901305e99 |     
   sh4eb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e4cedb2ca53719f355ef2074748f083336ecfdc9 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cc3615d2af93fa3d96d74e7dc14bd870b610b768 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/aa59154d5833c431aab65a8f61539579993a0c2a |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d6570da325c882a2586d0c8913a011866cc60b2c |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b56aa45ef97b3edd27ea8a02ff9bf5b72beafc0a |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/38eae0ce6a1d06b14c11e6ce88432e72deb70d5b |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3b765d1d54b810b12ecc5d120af5d5114cc37bb5 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0e1a91d03884fb5fc4fead78219951adbcd9df4a |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/feac9b088a34ee772de9d2baa187968666656735 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/66efe20d3e0045506031fcbb0dfc1e5230df97e7 |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/985ef97212b414b1e1843fa38bad3abb869d8c31 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/42fba87731fb2d561feedf569f76b8b70cf432cb |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a0c5dfaafc43a785108ca1ec458aea470e1d4abd |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/fdd6d55a7ba1970b1155b1492671795b6189c75a |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/851c622bbc326af432da80941156c65f87802fc0 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ab742c6796778ccd1d6ebef749ee47a2e12e29ee |     
    sh4      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9e71476cdbb639c03ce41314dfd4b777ab642151 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/99ab84871793b87f17be5baab69ac4ff9f159238 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f21394eae1623a3b42e518d9feb070fc2ea5acfc |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4d384afa301b6d97ae99c5f178028c5c19759ea2 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/dbb4978cd8046f3a5b160d6cdf6e337f5cb25933 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1626866055ace1222052c33ff53d2e09595bb631 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6a1bde983ff055e1eeccc22ee6e82f9ef4f1a6c0 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/21e3dc1a9eeb95072163d7b52abf5b585cdd8133 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7ab8df4c386501bd2ba7604c4961c52fe5c42f92 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ab7fa5017109e35b116a567fe9ccb7c5bf0305d9 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c6ffaf6ccb77e65a3516622eadabd2e21a7f3984 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2ee00aace163bb04b3e5e618f27f97a8d9d0447c |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8f84675bc306b69d55b9d7c8225003440c773a04 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/56f6b8d2244401dca515984d257854ad29c452e6 |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/afd688ae720e774775068defc6503b5bcc091adb |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2d866c13b858a9cdf5b9bbc9947b46b863d9ee30 |     
    i586     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6ee980071123bb69b2249bf646560b9c57ef4620 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/539b60b8beb7263a094191e4dbd9858d41f537c4 |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c69855973ef8bbd4d3bf1ab03bc06784b0a0dd9a |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ce8278152d23539b857f41d73c83da0aa71fcfa9 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2ce58651977e155abef92c742a9ea2e281961486 |     
  riscv32    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/09c751906e4fb0a3ee79a925d340b87689d2b1f2 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/147e208ffa501d41acb0c22c6619fc83ff7d5942 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cd50108d888d6c8f3d22590cde3df57eb853aa1b |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3b200c449a90a4ac528540195462769e38f394d1 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/293bbc005ae0f49154b9159bf2dc5d0a8cb48a28 |     
    sh4a     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e2d95db0f4f1ba982b98a6544d03b2283d48375e |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cc1daf9722eae9b7aed5b7bec7e5d78af8acf78f |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/30bc0d589f638ddf5098663b8175ee0d71e3043e |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0b301d4613c923e0662e2c8f66f396dcc5d61d56 |     
    sh4a     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/dd76cb01f01e7d517e073e106b566de92f554df1 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/881ced0081bd49c7e6db55f801c6c879d62cbb82 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3d57434e7f38d110a54b25d2e533dd7b9d379107 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5de6de9720a25a5895af0cbb0be7bb0e5d86b63f |     
  riscv32    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f245847db3be1ae3fecd2b3471d14c80c0a1e46a |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f8e7c12535cbe36d19e1de9072ff3c75b617e852 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f342de5a92a29258cc8622706ad579293e82b348 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b211ecb9c1ce39dcfe926ae9922cdbb31b3d2d25 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3caf1ce1cf6ba69e0d25dca7bafd7dae27e8ec80 |     
   sh4eb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b37b3483304c37cbd57f3fdf259700541aaeacc9 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/03e17d51f95f682c9b596bd3e0feaf98ebb6a677 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/62d87d2a9aa1a59a3388227631e58360fe01c291 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e86c49c7a5f90dceb6abcab6e5ec42faf55b006f |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b4eee2d1cd15fb8be220c35a20dd34acd1230dde |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a4a12d2f46905ec3836dbe08bd2a2360127d0bdf |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cb027eb4b99e2d5454e6b02155998b321150ee85 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0bd8f4c254c7c7ddc0d5d694af7ee3e5375be38a |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5ad3bbbb1c02c03e181a39ddde71c255ff70871f |     
    sh4a     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c2134f3d6abdba90621dd16797d631a67b798294 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8ad85e84bb0b23a34a4feeb24c370345e1720155 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3051a7de003e80aa57ad996aff1c462fabdba796 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/58b02859ffc43bed4947899fb62f4ca648d7061d |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3a75acffd503b8ab53e4fc2d4e5e7a73049a3e05 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/65689dccdb5eb30c7fcd8615184137220ad49171 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/da0cf67951bedce91a819bcdbd6f16bcd0df3538 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0fb6524e3eeb521759b842d2f78be134c03147e4 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1a8852819e7cc7f78676e6b06f6fc5712dfa6937 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/15ccc1fc2af6b9346ee5fbfe828f528a5b496d31 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8ec2bdc367b3f6e308b1c122f6791679746d7770 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/97582affce6d2004daf666fe1d15e67ca6d0061a |     
  riscv32    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3e0963f162de5ae3a8064d7a44126c038b4a813e |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2b33f952259be72dfdc8d38150c627b8200c06f1 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5c840ddf687a3fe6cd2f9750fbf371b020eb0b40 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2917d7d23272341fd098709522b4ec7e21b4e775 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/363d068308483fa9b39f38edf34d684751c59fd1 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1535e79c5b842644533dbfcfc44374be89465bf7 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/528c95917fed4160f1d5c97390ffd4e3938ecf23 |     
   sh4aeb    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7067ed0c064e850dfca61c17c32258265225c87c |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/daad77a840bf637a32dfd76492bcf211cbc0c945 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4618b20d0259d789b76e1792b83af5710f165510 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7a01da3d68214508329538850d40a88cf6b43883 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3f976f98ac67423bbf16a49e5e1a766e636ef8cd |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e9846a5644de6d05ad49ea61728d820519c103b3 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/28e963c83a50b50935d636749184eebf722820ff |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4145204a665ac118cd00a5493a474e812c729834 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d1ed64bc442d6eb4204f4e6bcdc15220e1b4e051 |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c6d1b30b2fe88f1b63bef5dc2887648b8bbd350c |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2893928f7036f30391020a74d0a8b8bd1fded03a |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2d8aae73fd1c3bb94a1f7053298c234ec803ab56 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c8b8f22fdfc1696e126842dc18802573f1f2867c |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9f968901ccda1aa1ddb6ff9489faec34d59b3a25 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/381631159aef3f4285391ae98878491d19badea0 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/bd6eb8f21277ab57d2e9fab9a115ad87f7df5fd3 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9d6dacde5f17110e54d54e1929e17d25b0861fe9 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/34a0aaf37e19d3385593fdbef8c66a34b84edaf9 |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7501757120f55d1aa856e753912e22b81dfc974b |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f4b132b3b4b7791e819f9c40e009fb93393c6b5c |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d541103635a03462ef1ed7927bd0cbcf99749cec |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/317b5cd449398ccdfa16f720b923ea205e06b839 |     
    sh4a     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/800352216b1afbdf299ad2f66089190dfa4e4805 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/aaca868ca7cea216ae1f76506483ca2630730d02 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d0e1b52a65d81975eb2ddf8dcb34ba3a9a5bd775 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1573939cb427a2f6e048102375f9277907f8cccb |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/63889a0cfc8f08f448b886168467eaddd008fa91 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e4f134ebb774ba2aeaf953de66121116bc2869cb |     
    sh4      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/181c595d4b535c0619460cebe7979addeb906b8d |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c75f1211f3ca73d09c5e2bb24eae22277df76b21 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5623683988aaac6da380fd8e6a7bc7783ae11357 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9222ec4a4008bcef8ab489a3d328cec76d39cd03 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/54f22b00d4853e79718d47b48fa98ca361469b5b |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e6e51edbcdba4804264894b5e8d1b3370df4d353 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c1e29f5b2d6c56b6f36d3b64e88ec8745542a1cb |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/de6e81e662b68ab57fd4bf4e07d60593dc151add |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0bf8288baa348171599d14451bdf4e592ebb05ea |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/289b982a95c37b4d2d84a349e0b237dbe5859537 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b47cbc3d4c050e1424cdac5c318b5ca92d364d8d |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f3542690c83877ada888aca59fa3a02f5d2066f4 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0b5d7af56c7ec929596f60dc14aaf3c388d5abcd |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/028b3a969544e327ff713677bd2d51e787d940d3 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2a99908fa827c9c071f1ddc9f93f316e4b3260fe |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ae8ad99f1b5028c9aa1f0624e5c5709064d75c1c |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e7d2a3eb8186087362106ea4348ba489790e2dab |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/85196c75de6146d3873bd995f7861f20973a4199 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/06ab4cc6f322dce21a826f13f69b6c31209ba75e |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1b116033ca01e6b2d4a34e87b78c3e80fdd83c01 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e688f2c9ad1f50df6396420e35d415dc00799550 |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/754976edc77a0da63c936a4c49a52d6589a44a3b |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2a7ac32849165e81563298a7662838179fd50869 |     
   sh4eb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/97e56fe0c70d0faf4c9b3694533ebea592ff94f4 |     
   sh4eb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9021e6872365af69702dcbe4ee04010ee9a95f92 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/38eac080487597e8f3bfc65ad453bd39e903f7c0 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9f09847f606f92899037763401e814a469d32e7f |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7cf43ee97faa4f3cf6c204623d3bcfc29f00ff53 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6f2ddf273a3d48efa47e33514884a839bf59b764 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c9d129ac3fd0bb1bf19c18bd5f6989eb178acb43 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a0bbe6ae7a62dcb98b7b756a4d7d031575713ac0 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/58ac54d7ee68f8eef0541183b9b8b054923516ec |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4cad36b0a584d97fc2e442d8413fc9c2589823f2 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a2b36f86d970b26b704a346d46adc25eb00f723d |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b158459293cebdeac6995b6aa1af52b5ea0fa969 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/20b84945491193f1b0a84fe8bb47fea72b37d239 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6ae2f69f546bfd52d126b5a6705732d0a03e80c9 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/84ac8caeff88b5c51ed0d8d2c31d0bc308bf91e4 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e5526a09d7fa17d572f6b59814d888c90ecb1d84 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8ef7b8cb440852b6a3b4ad59653521304514f5cf |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b4df3c97aabc822343267957c3c72a46a38bc832 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e6570fbc06dfc77753c42d4b8875e36d97c2c3d7 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7f58bb5fc9f06a7c32c68ca318b0442faa5b12fa |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/67ad2fef05c422649880a6fc4e3b73eedcc9a7d4 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/996ff91cf7a503924d7681c66dc2b74656ce9aee |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/21beb2f168b971bbc8de1988777bb7dd55c853e2 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/305304b3dd92e5a3f7f872a86b34678dccb0c677 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1efd3e368474fde0c6d96892a4552736a3697a97 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/43fe1313fcf63b931bbabc9979ba821a8e1548a0 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c6d27286da42dacabf16e768d52c58cde73e8db4 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/be522a5ee886c4579bcf0af2fffcc8a051cd194d |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f211eaff5aad11ea86c3dbf4c7f4b005e0c48b02 |     
    sh4a     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d8a3e08776876d07700f603d13ee96c133eb8aab |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7763925d6e8a9b2d502c1000ba386f1a1f4cf98a |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2ab903737981a6e48463d79e3c7efb8ea3ea21fb |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b751ed610ee4c91ecd4403140b5f863ed375906b |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f4195ca916792ed3bde55a7838968404bf59aabb |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6baba1454326d07e2288c8db6cbb4b1bdf83caeb |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/43795f18aef17d15516deffe6d625587de74ddc3 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e3a5563cb119be37d9b3e14b8841218db324d8cb |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/82e7cc49a168c1037268528254ef408a305fa14c |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d85e1b0669ebaa2128284795af007b242be0749c |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2e612e5caa1c4dd557400546cc6b4b2b4af3c6a5 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d749d1a04486f968e0226981151de7faae4f74b5 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6613374c0d3d9afd72022e0f6b424fa4244f7a92 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0689119e9221ae7a889cc1b802a2094e70949e8d |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f3d5b17aabd78610aec6f7ba54a79d4876695c0b |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8bcc2f2e4d52b76d39ab59b9473c2d5fa85f276a |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9cf67503fdbeafd2d9e846b7a3ea99f249c103af |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/05d5e68982a71155b134730d72fe0a31b6287bb0 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f3abc87f3780e3fe020c1b3a237dfc15de6b7fa0 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8810f6d6a8f0f367baa5932a9a1d6eaafaab83f0 |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/dceb94407a86c82ac9c459d19777e62eddf0eab5 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4721b25a686c9180c73664cfaea041eb21bb9bf8 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/74f196352a09469cc9cc4a6dc9e3f09c5132235a |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/bc7da9f07561b6daf099c1b49bbde3ff1038d9d9 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c5655eb063fc25086972e10b69caf4074d86e9f9 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/39a015b10c9892a3bff6f342000b28ac80788eb3 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0c60338079beb18b3d662887f32c2665c0728259 |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f3fa1fc1c3d37bbc57df49807b3966d9666066e4 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b8c06caed1821d04b714c07d288b5140195bc656 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7d6acb8916845b87f3a89052894203bd01fc0f8b |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/97e42082fba4354fa17e272da6d4289ae83a574f |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9f2f6091436e6b3386f9d663359d03d6e3997412 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/46d56089cd498cf3732af68b0e68014df034e039 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/287eaa9186f5ffb5ca02321f117db9c0aa07a46f |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/bb25a49cfd8daa2da9bd8930b7a6295012db8741 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/33cf0e60b8d7cf43703e61c5d893c9b4c63b9987 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3ab3b07fbc023cd656396716f3a24b2f1bc23950 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/38f9a369dcedc5ad71c64a9ecacf412237494138 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a81863ccc013106fcb7763be385d0c6905d7043d |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6949065ffda814fcbbab0493b60ddd233beb4742 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/dbceea7b3d18782ad54afd8f883cee1c19a03f39 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4af6b185ac8a3f1caee2fec7529ea03057d42220 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6544ca9365a3c93ed62cc4fdd8cb089e8f22b60a |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4924be1581505b550a55189a5508574bf5466cdf |     
    sh4      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9b789d9bef0d011762643e587939a0fe2d7ba248 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/dda005d9629b43e7afd809f7dc967344fca985b8 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/14fe1c598d216ee38400aec4097c36d7378c2729 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/857bf0f40f2e31b638065844bb8e8cd64f54a162 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/19ba2624e14b56f375b305cfab1dbbd1c34103f4 |     
    sh4      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1f1cec7e2e8e0e23b0b6929f1add51134a006ad4 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2269d08ab673227f8e8669d0c1d663d6c45e5d40 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/66d515726a91bdd6f282ba9e71de54f7e7837bb8 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/22ef1a6b30f980339ccc0d0eb0e2d7234b22e134 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2ae26f19c5673fe0a145e6efda254085ea0d15c6 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a18a578aa45eb4616fc6a01c57ff4e1262a4095d |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4ebdef52d48147087f2626fbef23de38eabd9c0c |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/84e2400ead44aa0a27ff4db9fd11959d57e8a789 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/832efada66a1865b1ea184d997b1e29f10b3c552 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/30b6052f737f96ec91e8d53deaf35a01a26c7d44 |     
    sh4a     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6dc9b23aa9093e2cb119f715b0774fe914a0a69c |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4138c9a4b409f1bf13cd771e3025b8d72774ae95 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/edb26b2c8693448e5c6d7f332f711c3b42795640 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5e541a1434fb1db5c43436600f712d1d9a8f9b3e |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/77242b8397904e518be4fb53429f5c4d1faf77ca |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4b4583591dc50b754854406409c5c950df1f031f |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cbad70231020c304a2d523af1f7358a0c28341ee |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d6d0a6c5437db7cd24ba0565ae4ce04ebeb6ea66 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e7b275b9237f0c0b90866ac0647999a196564671 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/21acc56dae30fcb683aa5e492abe974c486380c7 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/936912074fdb1bac22075495ece32349d8562bdd |     
    sh4      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7cb0e838c2324993008a9c0959b891e5f3358c01 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/24c62722b75ee6d02c43871e98166ad4f20238a8 |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7cec81500bff4f874545c1506475522f81b63255 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/96320c84075005fc3dba4d05482ecc2cd7203dd8 |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7a17524a82554889e22e68935e584e71ae8cfa9b |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/87183366cea2cbd4c0e4f81cdab21f226825c4c5 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6a2c2e5d9b839c49873010b61343dbd018973480 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5c3ec493f40e8aeae89ab233aecb9f84ac75c175 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/60e561105ea5b393c4fdbed65560af33ca9ca970 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9106cc7cffb66ca895463e0ed9716db9f719dc0d |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1696e6f3fe5d4981237a6a839055e7f608655d0b |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f656e15c28a2d2041b5ae7b1bb215c7c9fa99100 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5e914710bb9d7579e2c195bd5e8bb75bd374c2b2 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/897fa0b8dfd8e26ae6c4196dd915694218ac094e |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/06a90c577c39504bf86cba190813fb52b5ae8c1c |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3617c28ca912bdd17dc6ea4a2c062014e4784caf |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/bbb69b249e1a4ab14f043b6c9333f6f6840ab062 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/fff820c6904c40bc6b26618eb40960e7797ff96f |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6836a0f8428d40a613ed5c20d4c858aae88b1ff6 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c196a1c29a15a9e1feafa7cc29cf2433dedeab04 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3b197e940b08fe31d448734f0261917daa3bc346 |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/314758decd9ee288277fe416a64f1672eb1a669d |     
    sh4      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2b96b1a196bc0113b7c2acdab11b76e9267fa266 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/53b559df712bf7db22308306a6134b28f34f9cf6 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/08909ad11eaf6c246419a8ca96a0632445ae9e5a |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/243dd6dce64d685592463e714b883fb47c380ebd |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0d8351ac6cd1216aec49900f5435329f3f1b64a1 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/57b0697d0e5d568722cce8d07df521b16a7cad5c |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/fce958c530667ff4058acefeb1b916ffd4c95a99 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7f82d092814d476c79d5d2b008cab42b55855183 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/81d47c53b1c97c0628617cd61f1f7c740a0451c3 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0490d152159bb11c653169f14c3184121f0c52e6 |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3ddb21a05ea630934954eb92bcae8bc19045119d |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/742975771e7c213dcd1960522a36f51fb8b7a636 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e2d3f065a209108107a3d373af779d0d648e7ab6 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/280362bd953e216388b5d8c47c50d1d1b48ed813 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b48c794ceff6b220358cf228c760857f63d07a93 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/60801961111b41f382b04ce0cfb4a64c590cc9d6 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2bcc39736eb63973c1dfae6f753fb70c1e1d51f6 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9b07bcc33ffb2f70678d30b7dcc287314a1d5222 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/78962547cb846aac438136ba4d05559670fe8b4a |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c9a43b4e919bf369b95adfacba882e32b54af50e |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ddb16a063ba5e01845a324269f41752ad01accfe |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1b83cb774aa96fd7f3c26a49288d186ce2f8051d |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2920543b5355372451ffd492c11f3796d9328792 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0999deb73e9e8cfe117ad14040aa0cbb32a2e414 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/647870a28d31ed24d4a9763997f97e1106e84dae |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a5f8d65b55e4b0cbb5d94a549507f0704d43808e |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0342e773c78ca91cfafdfd8481af84ecc4a4e71e |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7c949e6a058b83a0d3ef646d4ab45f3502d2b2bb |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/49fedc7eb44d31f7f4622d994ce68b0eb646b4b2 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9e54ffa0fd0d106a0314da2aafd0ac23d3f411f8 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/883f6ffa49316a910a5e1a9f601cb132a843a6c0 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/35a9247ee1098d68f21769767feb21ad1ec0d762 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/da404b63089b679cfbbe42fe049d3714628240aa |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/30de05dea738be455cadee6045bed6709440e9c5 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c580b42d1e0d60cb299413de56c2bf353fcc8135 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/78bdfa4601752727e70dd5404c0d6eb644d46173 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0c026254f980c3dd0373c40e704a8ca931f6807f |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/33d159646dbefad7942b8fc16a2deb10747fbb86 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4c293437e2ada54a41385fc6c29c1ed812cd4536 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1442e92dfed8f1e4fdcb59e816497807bc12d8f0 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/436f0dda3f0ebb2cc030f706af591127cda6f396 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b072226a228faf184fb505f5a718d863309e722f |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1ae54bae759ce11a43e7dd97f5a1b58b5fdee7ce |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/74c1900f7de72c460b53d20e885eb2bbe50205bb |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7ecd0cc2065c8b55cacda940ddeb1acd544520fb |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/36ad20cd67b62bedd86b1fe8d4b076f7657b9c6c |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c76c79f47eb5f2fef180bb06af2b0539766b3fb7 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/bef7006f01ccf390bbbd1834c9d857ad7fb7d176 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/211f61691bdd3e29421d27e4361604626e083a2b |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5fd93b2d5ad5027b37869f8cfb4388023cdbc156 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/60921cd4ad1a5558df5ce941adcb3967ee4fda34 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/53d3ab50af4dd18ed7dbe289d612b4588c1ce71b |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/89f5caf8bef7b84c3ece36fe03d6bbe920b6d85d |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/05f2a86b194fe0e005163d0f46bf5ca7fc446e09 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/038e563ab961c4f6bec11f3ac00d52e2834dc897 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/43cddcd2c9a3638dabe3fc7a9b5444306618bb64 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0e30f2f07286ad5e1d07d90f7c9d4f5d45932453 |     
   sh4eb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c495bc04466c9ff954042829e551833bcefbe3e8 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e09acc7df56389b0407e70e4e1f1ac57d3a92aeb |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b7e8f91d598f5ad302c34de76961aacea18c25db |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/fa5b3ac0e9e091f3646b3d2855e61744735d6299 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/91b026b09ec925f5ff51c2ec9eedcd03c6c49c04 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/702f42bc63d436ea0306c304b08a6b7e72b81cec |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/31891ebfdd0844a5fc9b1fa93a6b534c50f38fc6 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/fcf49f7c3865539ae1966815137a68056b50627f |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/655374fcebc7db351da73691b60482c1a6cc2004 |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6a46b8ab16bd98fdac205bd25acd3ea39b92f856 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5221bcf359347c965e0cc35eddc3b6236fd0a6ba |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/678d849aaf2294bd9882330afc788d9792ecdc6d |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9ea0f3ac20230f36d2d37bd6f637c675465976c8 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/419d34d841ac8a63280f12e517894e2949d681d6 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/35841c57a570114534e21e7e393c766925aaac48 |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/01f005269f6dff02d7a55dd4fbad8401cc83522a |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/407b918fa0c18a8572b204fd7dbcf942d1c517ca |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6423f3f0ee8f571a8461cd5024c24f338f5aa154 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2f8ce1b21c8fb173e535b9bb1ae046916851c925 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/01a02d82bffdf210060f49dabfd17dd69bcb9b0c |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/adb5b0989f00c7c5ccabe8de625df45e31c48eef |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/85fc1154700c966f3f06a80bd76a62c11336387a |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/96c94f5d1163f507f966cdd44aced34a86a6fdb9 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2cff5dd30d067ee1d986a7b91ff1e045ecbf410e |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/46c4e1644b3383281f8339dd57d21aed43f7bdc3 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2a0e999e43d97199791f684513a8003d5d4cc5d2 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f208fea3cb68eb1e0b1fd9ad9bd04c51a48b12fe |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/93045a90cc19536600f647340cb0de30e8d34334 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/93bbc460e6cb884bc964bca5323fc1363d87d915 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c63bd4fbb3cfbae9e48bd35fd22b61b5a873f564 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e940eaa1e7631d751f96c453ffe563dc0445f5c6 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e2c97caaf80a530fcf85a9a2511d6d41889b7b50 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2310ef93dfe46b2bd5f0686fd58a7e0127bdb250 |     
   sh4aeb    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/52193092f00c687ad3dca3eb952dcba0213a3bd9 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2e49cc8ffac73d4b906aab2a8d49c7a08e1ba6fb |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e8f5ea8f2e5bcec1c7dfbd1c988d7034ccc618a0 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/811a2658327f65b32df5cd19b3cc6d683963214e |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c705a44a906765473c5418cd50624ea86f04ec96 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/daa5949dc44533b8b40908e82d95e840754b1a3d |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2b45621a3d1aec8f01f9d911f86db1ad3589bbe2 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4ea120bf936e449e29d4fe807a0d6339909ea7eb |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8d386689f789a6aa414ebd3507cb14f0b63e6e26 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/736a3095151b872c83ea85fcfd36d65f38b1e782 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a74120e01cbb7fd5a2f7cb2bd641de0bff2b6db3 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4a9f89606d7661c5bfecc16c81295f673961f1a0 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a566747ab202facf23b53b9060a09f51c6c47e0b |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0868a447abb0b8ad69d5b25b5198ac7c5be7f703 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b81e253049351ac98b8846ea1ef4a3ef8b20f38b |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f8fbec56c4c7c8ab4e888cce4c277f83f3548424 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7a7b90170cf008e96fea0bde54b209e40b7581c8 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/789050738585da5af105f55c8935c39e44e8dd05 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8a84e0e59b410119e89f73382dc31f182f42aed6 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7891fa1e68c8961c5cd0d7441fad11f7815722cc |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2fcb929e412c3c24df3b18690cb65e900c4e7221 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2a92c3078185cf7997c3f293fa36a5edcba31d60 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/991cdc1fc0834897791132124b4dd6cf5189f5cd |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d426ed9a528b297405ee31adc86d7727f2148562 |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/85af4ca38de5d6c4a42834a4f8dfe8c56802fd9d |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/61083480e7ad1fdbe39111fbb75e7967bdef6671 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ea606820a426e50f6c23d0047744af64884ce6c3 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/970dfc93ae04abd83d8355677d12a43b589aebf1 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/897adc2557fbdc53d0cf9e92aee84ccecc225330 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/86b4ba96fee0f4a069753bbfbe39ef60574abae1 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7bb8671164498b3d584664206223924a3b14367d |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/eda2a9b4045571075e13152d4b54164131f10e38 |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/aeae36d53a3e06acb9f25d86ee4b2c0765f2321c |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4c39111ec1928c6e63d74901e070e0ee5b7f4ba0 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d25a804c6d88d7fe22f8cf9c3b6e8cbccc35ca12 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/41e1f142a68c08f0e85019fe121136429ecedced |     
    i586     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8616078c2d0f76754ba969ee0a3db3d3067fa35f |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/08873e735abda58535bbb5337860bae52c04ceb7 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5f98ceb5a7f69c837bae6f5344ec1dbba2a7a36a |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f396e0f3938b7b410661a385c523beca41a38453 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0bed3bc9f86cf74717baa4aa0577bdc382756272 |     
   sh4eb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cd62cff76f5d69335ba68adf9b70a95cb1a9f3b7 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7c35e58a4d9dbc8ac3088d8b63d75fd04861a974 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/21432476d4514acb27215f5b9dfa4267aa83dc39 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9045ce7661bd24045dd1137d61bfd21241bb8bb4 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2cacd1eef4e81d12287f956148f5a8158cc40bfb |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cfcb36a0c1b670b4a7ee77e3cc81fa0a35aa9592 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/79b494521624328e7c12e49d294142a4327c4248 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/595dbf2dff15cf2437cd1e6525d0e0ba66a1956b |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/056be3dade63832d4ce4222399f17329af0ba51b |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6018f7116811536a7012ce4a32daf75065e0408e |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e18de7a75a949fe121095a47a2e075c28e990536 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d40c99fc6080ba480c22da69386d1429493bb6e1 |     
  riscv32    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/eae8c57e74d7bd9cb6257849072ce826cd09a1e7 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1caca4575d42e28fcbe8f10f59a6d8810858456c |     
    sh4a     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8129c5717dcf5ee93b0cfd8e15e9e3d1cfc1c6b8 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2df13374006ebde12170aee9dc1e9306439cdea0 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/eb0a66ae26bad6ab464f62bcbab746b40ec8b20f |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0f76d84bf0e2787c498247e68742ac5e57206cd8 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/820cac3b7fb70a6a979d1a72efa6ead2d81b67ae |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0f0ba62d1387e0b70bbad280a8ea5e35cf6e2961 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/aaf207b8800848c2eca961ed3223ddd7b2e48f1d |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0f2dd157e63d3543002af8e722be9d2ce59670a6 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/75bdb9f23be04f895a775eb9fac4766500bb4762 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/001d199b17b68b744e1e49cb9803910a444b1c49 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ea343386fc46e18dc655e0c1c487eaceb5f25c33 |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8a7e4310729813e9e140ecee484fde1d6c13b8e6 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b8fa1d84d1071874610627355f855535a5c4e8b0 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a53b8b6219651c2f0e2533f2659762d3b0fadf2e |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/42d0cc006f2e4d490a153d1993526e065550cf37 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d198dc8b76aa434816020e7399073e69efd2e66c |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/044d49b201d6748a21b8e7bec5e440d41e84724a |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/89f4cb4aba59444e7705b5621e9dcc30a8baea96 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f4c64119ff86c57fbd1df3bf792ec34221d460be |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/87dcbbcb2d46b7557ea4155248dd5fa5c6bd5dcd |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/effeb9e03d723cf207e75d042044735fd734bcae |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0ae29b21dad911fbce2f3584f678f98d6f5b4536 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7578cd03795ae402bc77d05f2d720f8fda658cfe |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/eed05e22309fa9079f2f974beb84cbf8575867b2 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/eb79ce5168ae88494aab548fe3b1f0cbcdbdfa33 |     
    sh4a     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6e6de3f2ed30e41894925e2eccbd0fe4e8a17db4 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d0f3eb13125187d034fe0e86a3e81122af364fd2 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/20cfd7d389fd1dbf51645221b17d58780409b450 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/716be6ace1419e150ccd6038223b4d29991b01b0 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4c90dbda5cfb5c7c5700aaf9199df053ccfd2e53 |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d5f38e399235de1f5fe1b5b02803f21b0678816d |     
   sh4aeb    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ca264fe54b4cb11f81a25e7e19b4104067629d69 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f341f88ca2af5abbba0887e7d5710ed9fe4ca900 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7f73c93f08869f375566adacc4967b574dfefa20 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/070270424d322d5cf6f45d285e4eaea23b321de0 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2659e7c71b7f91c5f7c97bf312c20d9e57660e2d |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7db478dc7c1a6914a7d1dc6d7a9a4f9820008984 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5c846da9fecc34db1f953e1d2d4ec556c624d4df |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/578bb1d569d2352580dd87ca047bb59c7dfeed75 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e4d38a7b44565957f9a5584779b44b1f5149a54d |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5f5e9403a71467fe1fb91df753255df4250c9b40 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/223e468d44b3e033bc07064f51c4d883830a44de |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/05fff0c2bebe0e207a3da3eec490a8039f8a0cdc |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6c960cb64feadb9fca43a6cca225b00d15b5408d |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/fa05e559f98f197c51da48f5e5dab017b525985b |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/34058aabc642f1d45bd216de4066cc221e81c67f |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/519c618b0ee1929f4a12ff9efb0cd896caeb17c1 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7b11565ee266a85ccc5d8182292720416d233f8d |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/95d8b6a8bbeb47f3f552ec709198761cd1cedc08 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/603bc57b26874b7bc031181cc69fb983d5704b18 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c2bc2cd964bd65202aaa221cb4a108504c097b8e |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7888c24d3135b5ba84a42ee9026a5ed169981dd2 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d27ae274fe211796524096bb347f4dad73976e2a |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/bd9e0ae8d07fb5d50326162ef9c059363139b757 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/938da093ddf0f3e598e07b89029698d2fb75dacb |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5b994dad14bf05ef1ce977a6d77d00c459ace491 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8345a3d1dadfa4fe0971349ab26b657c293522b2 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/86d5b82b5977426c33025c52e92eb5785c8616e4 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f3851cb4b936aa94d206aa05d5d6b9d8bd8e7210 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d5107620cc2737ca5e9ed2e6b4797c28c0c8bf33 |     
   mipsel    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/57e3f6c0ea81ad90a9b20b10ef2139a49695682a |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/892a3dc751a94e010e3a4b85a837240316b4e72b |     
   sh4eb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/290f0abb8a41124dba75ec6759789f6b0bda8e8e |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b38aba1bab6f8bbb1428b0c0c8e7da10e216c877 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e1c59c39ebdef1837625c39d86cf7cbe3494af1b |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/60e8351b9549c50e1f5df4f278ba23be303c66a1 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8d1be9024979c139750c5d1dcfbeb759d3d1b916 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7a28bc78a459538b3c5217447088ff3f351bff25 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8f1b8230ad55d381358acd94945f1c22c3357ef9 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/65e746ca453d7323198e9428a21b32c3a238c9b0 |     
   sh4aeb    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ccef698754c546d673f52a29cb77fb3f7b6cc980 |     
   s390x     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/21d99ea6323ebcfe084d1294f0b8f374d559e599 |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ac2481d3a4b43ad658e353b6ee2e3025c117727f |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/bdb3725a7428b50918994f7ead8c4af94ecde7e3 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5f0c05fdace4edd12baa62e624f5e5a9c799dc66 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/00fa46d82c36a5988bd9e47e26df90b41903523c |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/be9564fcb89a8a7bbdfe15c51e55b1d69af2655d |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ad4029564749c644e3ee030ce47b0aa40b5c3d94 |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/26ea1a462f9b1c351ec812ae48f4313d01c7e9cf |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c78760f938acc8508e06f5dff51b6660db4a3383 |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cdc7dd263639d50376885efd9571f7146aab0366 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/accb147913b9856d035914aa58ca03d2eabf9ba1 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c078b56d4fe984a64b23545e514e86379bc5086e |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/46fa2a3b21b459c648a39e10a41547310bd717b1 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/694b033e9e9e31f34d532a935accf03c191c97ff |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e9336e5906614f04b492c48b74b4db9e861e4b4c |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c8f799dc1b8ba9c2012d3252edc165dd6a627f53 |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/460092dab953049612c3e6a8dba700c7b372d2e4 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1df204dcb54a9441b96deff451a4d430fee7a80b |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/73b38f5ab889c4de322531901d966419a3cf9678 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cf0e506c9233c792650daa4db27fdd08b675a8be |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/aa67fb58321f7289cb85c2a978201444413b626a |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/94b8dd53ad05d34af37d13626bffd79c1b42a82d |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2ec00cf99344ac2a6553b49644da329d3873b757 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/eb14be8c9ee238c97d448c3b2faf195b0987e816 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/40f6d98caf5bdb701576b055952b9c95233acbc6 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/975b8cd5e00dca8606acf6bb6681b65be54f4243 |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1b3455be606241686eb2ab74dff391c4d997c045 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1becb200c7a2e16511e70d129e02cdb8e1909e67 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/61e4daf57ffabf299b661ac5ac2efc4e32ebb60e |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9f626882ae055a1b853af24e65944b3a30767414 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/1f08f3a5de1322a01a112006148efbec9c5f6b7e |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f55813b6cf8949a062dd4c80a13b441fb79556a0 |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/67fcb014779dc20f2f1be203118af51236e35137 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3ddb2711510d196b4af0e4e7ab525451ddc038c4 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f83e54d040e7b4b5ebd91540254f473366753fe1 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e93c2de2abaebba9faa083797184a6ad84ab3b7d |     
    sh4a     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b6d1da1ff8185cbb370e3ba00488c7d43fe8ce04 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/6569e576e1a10ecfc0dcd9b14261c32512208171 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2b6ca1be74a116cd3a9a3a64e851d21e8b81b9e9 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/adc109c06a0a02909eba71ff7912f91d385e568b |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0ed723c409428bb85e226226157e9197fdfec510 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/30474bff04d453bcebb637998858ff1d5c077dc7 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5b1640019a5722c2d46f3c48523a9f6e6dc0328f |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/39ca952bc60ecf633b31a59662f340cd983ffcba |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5bae4153cc155101c98db5dc5d38c4c81a848637 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f2a298882a0a0e2377ebb80a2b2810cd6f56b451 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/26d60e097eca47cc4c076798deeb791846aad291 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c766a9bf52a497104574630ffb14cb5339767f92 |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/2460235de57cedb1e523b978ae6cb059acc8a4ff |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/681447e5c9763c5bff9bb34a78ca8c9a2ffe2071 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/993c79e7fc12896eb4db3a2e8cd847616cb8910d |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/fad4556d3975ed669edb6cf8363e33967d815a52 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/0476e9812c3fe99e59df0503d86376522fcf3423 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4b3c59d07bbed800936cf0d0f47cd63310dfa47a |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/701972e08e3113c2393fba22831130b94048375f |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/4e17bce7610d26280192826ccd3740cf4c22fe3c |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/30cf03d43ecb4691c339fe534e049a715ff87893 |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b5dc34de1398dcb6e8e3aa2ced564d3c107f57ea |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7c9200e8fbf9bc0fd53035e013b4894e557fa080 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/62572aea1421f83973fa0cb037ee514270090890 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/eba52b727bac66be952e04a9585754195f0bf44b |     
   xtensa    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/648063e83a23a41add98a722a1320bf08696e0d4 |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c719b71f26bc393e088145271423031241ed1512 |     
  mips64el   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/bf22624c4bb74cb363d9d702c05d0a153cce126f |     
   sh4aeb    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/047dddd958e867abf5090acbe84815e7eafbaab5 |     
    arm      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/947ed4d708c587766e3f9f254b611eec17bd8b6d |     
   sparc     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ac4f5a9c77a44cd4bb40ff07bcaa2d6742329547 |     
 aarch64_be  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8e8039ac314f1f188c8efbc5baeb3e5f5a8eed51 |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/f6a084030b25f4b8199af7d89b3fc18d7ccca907 |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e9f73b3592224e722adb5c987cdeaaa74f8ea174 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/79a25ddbce127c19ab20793089affc64fc25bf47 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a0b1d03c076e1293d13ca6af176edb538382883c |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c9c258a362cf543a358ec4694f78955b3e20e9d8 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a31c012c4b4caa66932f7dee0618a9a72e4158b1 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a71014a93307756b6fd7afcca2aad8d4995f2f02 |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/fbf48bbc2da8c0b72c94d28d80e75c66ee5de878 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a461cf6151901687253225dfd74b44d2ebfd9888 |     
  aarch64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5d44d241feed59b990fb8653aaac404ba3e65803 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d74c4f5fdb613dd48d6cbb232384c74615623906 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9565a086700a9e0ca6121910b6fe811fccd47527 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/309aac145729170b683933ac23525fd2663c6072 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/63d1095f3e6736d3998cffebaacfd5a62fd77fab |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/b785af556b26e9a1811d72bab5284d4ade716e70 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/a5795916891cbfcb7d2bf4f3d3d561cb590de318 |     
   sh4eb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d3015d73ba46c6ffe3938f71fe568cab6145c362 |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/09df6b8021246d876e5a67cde0c536a7e43e729f |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e6a3eb5e4ca7ad21d429a747c622d6b1a0f1b6b2 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cd0f61e53cfb6478d66cb43c472a3ecae8ee1119 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/05ea4d076896b1d995127a1809d05d57f2d35512 |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/51774c87c597eaafcf21b5f89aa3d1821c64a7a7 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/8ced9039b0007e528218afe41cc28d32c019bb4a |     
   x86_64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7d5a37cc84c159cd51b7819e94b2dda414e48d98 |     
    i686     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/9f426f1396878ebd2563bf417b525f84eb6bdcf2 |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/e1d0c79d5d9250810aadd827049afeb1030379d3 |     
  powerpc    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/5883d82b7ff4c9cf24bd2f6fe0f9487e3273115c |     
    arc      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/48d3b731a3f96f2efead40c63e90f7ed9ee16191 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/3d61e87de85c0a46b3a2931ee2fc5211b8b24e9b |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/56d9c03ea0001d8a991c196a693e12fbacf5305d |     
  sparc64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/07a68bb0ed921c59a1a97eb82ef8dcf4ef3eeff9 |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/df99f0118ac0d20486fc763bfb3d48b791cfaf7e |     
   armeb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/18dec6ed6252f4caefd35198cf8505a7c84bcdf7 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/cde1c20bf01c3ed1d6771bc50dc90cdb902968e0 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c72b7aa1c1508df8579ae11dcd416be7f57b33a2 |     
    mips     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/7aa2efd6df6a75bd948438eeb4d39f0053aa2899 |     
 powerpc64   |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/54feec2452dd274d922e2aab7b56acd165d8a201 |     
  riscv64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/caf7456d4af5bce23f666741a5f6255079cbd744 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/aa27965d43dda6289d22cb8efc151124cab2dc2f |     
microblazeel |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/502be3a0db212e73475b01af73c10e836a970c29 |     
   arceb     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/bee098ac1424a439bede9966e13cd7267f24a003 |     
   mips64    |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/ef3f744b631936822fb8fbf157de78f082425525 |     
    sh4      |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/df972a6c6c21b5eb9b35d76a52b06a9d1c4f20a9 |     
powerpc64le  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/d0a0b78b216e7101a2f277e9ba7625cc39bcc220 |     
 microblaze  |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/c365c8cb8bf17b1ded2012018ef9da28cbd08a9b |     
    m68k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/36b2111b7c4da0654d6bdbf9437c27f0b1814b64 |     
    or1k     |       host-hiredis-1.2.0       | NOK | https://autobuild.buildroot.org/results/46f4b3af3dcc9b12335505ecc1b4ec3ac585d93b |     
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/91b8af3933bae344c152b5dfb0988d160a708db8 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c054de5135089a4d9c0ac6a394288227def378da | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5c92410bd0e5d07ded7ab2a45faefecc97245fe2 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b9f3856d3170f608217c70523cdedf6954aae96f | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2bca7c11ec864e1bb21dce0cfbdf6e17f6944919 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e1b5cfbedb1fdc7d4b435a6ccc845a9148e9fc49 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3c0e5cb8a6c7e93bc1b3b9fea59db3980ee66195 | ORPH
    sh4a     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e1ee78522efe437079b15b8e821b65d0301a77a9 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c11ea3ee2a0f8a8e1f68f11e202c1f8e154e1cdc | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/81c3645b5317d7cc1606039cd083bc49f0568988 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0e428caf2f9354f06d16d8013ed4c2346d3c2d4d | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bde87c5f29d5c5fabe3750f4fe26dcbe4755eb28 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/efff8e7d8ef6660eb16fc2b98f6537c85c4da0c3 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e2f0b51ee91d8713801889a9c251da107546f0a6 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ce53001fac0611c4cabc4d5e3ec3c99e8443969 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/11d906129721148e82fbd5f52bc123cee07081fd | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6e98b996bcaf4c313a4e8c537d04c87b519cae80 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e40c07a48bcae028821bd1e2078a61424c089e37 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cb8aa49e549290c748777b8a43b0e1176c34e209 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/80ef6f4179632747e9e1de85215197746e6c1434 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/949dc4cfa53cf3d4c50811676b91339dddd4439e | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d508d2e0a50ca9be0332068ea74c13ba5e600d31 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bb3a020adff71f436e6eb760448b90993cc2bf8f | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/206251cf01efcd7f9ed53ede774a545d9c24b3ac | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2d4537fc87266228a1dd70eeb9de69eaf66ac192 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5026c950c64a3fa9e447d65837c41629ffefd87b | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f31b07ecc0fe80d745e8af4964906b6adc768e63 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/91092037b92c6f4f8055bb3b6f90181f9ff18545 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/92080ab3cfb68423920a9a0f1b34b2c5bccdf6f2 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/87449ed8b0271034dea9cf0f013dc34b720e185d | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/96c048d30080df22fcfceb2962c0ebb38801e5a0 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/12294f3c59a530b3fa4fa12ebcc61ceadfb4c6aa | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/676de425ccb4d86bb13ccfa1c79058a4152333be | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e61726cbeb93bbf8dd34ad68d8bc60540940b83e | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6419e50dd0b4ae52c8884cd935ae0e1ff53b17de | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a2680b15bf8fbbf0c97ccb5e1af7fd847bf2e2f2 | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2d3c4be02f183fa2c5a73c300d5c06ec0cff3929 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2ed68c4de339bf25dc228400309491a2f14e1bfe | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cce0bcd617e3cb0507f50fa9b922a3f6b16e21c0 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/079705fd3bd7f02dd7f5d32185348e486b3385fa | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c3258792ea72623d7fc9d4d1cc521802831fe04d | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4cb0d927562fb62e29c20c44627fff1c3f9853c9 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/df2c09829520f4f4e448a8eadbc154c39f5142d6 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/03766269f441947b2fa325428907881cb816c850 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/64c07265b8c3152fdcffec696fc045221008abed | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/594ee5db33d696342b522e42d496acaa4ece65d7 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/843c8b7c81b5949bf6e756e549baddef3d73151c | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d2062f5216f47c8f6c8ef9f9a1a13f51b78d05ad | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/af429604279412db1ddff18724f14920d1422d56 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ae892b4049aa75d3b5049493bd7fe527ca03d10 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9d954364c383e456e4d47dd21f1840909ba2c18f | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8cf3c1fd8a9ae58297b26842de37389060825f0a | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c7ef5ee4ccc99259099956d84ff5aab2d90744c6 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/99b29b9cf64358be290f87b0afcf304f569fcbf3 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/44eaaad8558b652d3c40feba4a8f6a69e251bb32 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cee4b54929e4cc7d473d4a1017dabbe11885b917 | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ca87e110dfac23775d21d418bc1b135c4d78f09e | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/74f4d842f3932edc6987aef000f6120d4044dbbf | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/30a79a0a7e56a7450c11ba24440272381c233f89 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/de0ed64814072ccd370b11471938bd64b885c41d | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/12126e56e65bedc171cd4b549a4a3f114ab5102f | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a805612c68944d7549bd5f83a900872d85325b88 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/72c23f06c37ec9721d29f2347a2169d7e70f0f84 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dbb059bd63d358dd6d15270fe34975e065f55ec0 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dbe38b4674ae2f6e3deef0b649cd1c42bb11a51f | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0a8e99daf1735d465d08187e4bb52d28df140d97 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a20e34fbe872484117af3f3ec4e8ad017ce99d90 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/edce4b6a5ec1aca7801a83f57e889253ffd3245e | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/973ba155846af538511846f064a0cb88f3de75bb | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b524f6be88c3c1962341daf96af1ed2c28f05fec | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/99d38c1bfc4ce32e58292d907bd134140233f703 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b90cb6c6e0e639ec4e8261113ada354c5675f381 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aa7f8d0652766e137d37b56ad4e29bfc4aafd6f4 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5830fd1339632caa3aba757d56ff19cdf408ba30 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/52928e301f065401c10e40c703b60f86d46a3e9a | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7b35dfad5c9dcb0c9b4fbc4549e92adbfc6c19ef | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e3344feec272f8f30bf5d56923c9d86ba7a0b172 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b17a21501a806ffd4f06ee5f91fd854d9d7828ae | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4a114f25b7e456d32c461d9423ff0cf11207a2d5 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/61ac17776af82fb2f621b914c6487a3788e80106 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/070cdfc1f03270e704747f675e88976a3ca039ce | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/460340545e7fc5a3f269b62475ac5fcf6db46d65 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2aed7f5f9621e3c4c67eb7073c49b46b986fb692 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b2e026bc54be3bd239ed89e1aeb4439eec578b88 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/998059ae4aaa42dad12e2252dbc73f01efe70f9d | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1f7652944b94800d1fd3b44531665e4ec473195d | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3b1e5fb38d3500111446d77024c143f6c69dfa34 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c949334d7e2b4d305f45992fbc948ec55d4a79ba | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/49959e48b06f381d3d62589d2499b12e53f0825b | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f25c9a994f0b83f5a5559583793d92492c1b431b | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a44301a805d2abe938fd0ce530bb915e795d593e | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ce3667a61d6c0005feb906f8ad519094df041d54 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/153c6919c64652bf49441765f58e19bc9ec17629 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a6e3cfb8fd4585670777419e8cf8e4229f72cee2 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aec4ba9ed81d7aecce93a26231e4875b61ea6352 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f2751b430d8d13a86f3b988d470d943a03e01853 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/df095fd6ad9de8255771ebeceabda8198fbf2841 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1280e2fa4ba0125fb406649b0e99715072cec3a1 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/110eebf156100c01afbb409f5a6dcb4db4797352 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6a7a53f9d49eda7f9bbbe9f5736aee0c249c0ab0 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fc74003d5bd4df7268fa9ca3f2c3b2c7815dc4a7 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/397ca389647ed4d99f5f08184335108682b00aba | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0e302e9506d50af6739f15d9df3f2395cb0f99ec | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bee538c9c1fa942c78cec6876cdb60bf061e0d47 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8f1331f9bd11d91ecd4ea798e213a204cbdb0cbe | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5041ad390e5af3248f4fa543781edafa1d004937 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/193b3da079592fe227b260dee6768b1400cfb762 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f7955ef28e943e9417aae6eb9a98ac793e350f02 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ba59487e5f6e1089ede2288487153dca30ebbea7 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e18e5d19a163779fb6c63c56b8d7cc1f5b330698 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/798a1ceffe80fb1e04c164400effaa38fabc12e7 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7bc47abd07c4df2afc6188d7c7b101d91f649166 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5b507d7992dffd9d02a226df621c79316ec53698 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fd07bd647dc386db68aa54b7e49890116a0057a1 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/39aaeed7f07de60e25f0b40e2b80a7726389cccf | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b335bbd7288796d95617775b097cd9a7c8428480 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ccd6a98a429280aa1555984a154f1cfeab04585a | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b4c4e786c6aec82f416df5853c63600f6f434f3 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d99e8281542154fe75e1af703dba83dbf2add19f | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/57ec97bf7781165af7affad1fde1a94e2e05496e | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a983aaa70b0bef11cd8cec394fcc74371993464c | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5046ef72f9d4f2ca26a6960c21483b4bdcde0501 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/eeafdd40c00624b4e454c4309880078b999ea8d4 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2f0af6fc350b9fcfe3cc118798b76aadae9044f3 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1ac8f27e6290381cb9a87a79819aa4a9dab0b160 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/45e4f620dd05edf6e2676fcf5bb9d3da78e95285 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/310ca0d76e4f0bcce69615bf4acbfcb5cdf8fb42 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/381f5838c9bab9550b6b707fbe74e8770969e76a | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/faf69c06531c7e46d8e45dbe65abf56093b501b3 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/485cfc350e9607ac927c077eb120f48ff76922f7 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dd274bc49bc1f49b4634a66e30ec70ff7ab7060a | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/22f3bdc5c2695913ad960ebd34d0cbff9135f9d7 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ef95371ce9e639855d598946b7e5949c5408a383 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b4a7d4d3f9084c41cdce237188b04162199d17ef | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/00457840c9ab0a186e322e1e67b713557449b0d2 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/33f52ba112f1b18c9b0851957ab656b60c92bdb9 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4dbb976730ad897b19e18d8373969dd46a837d81 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/36fe7316ca3ec0084e4201b3e4293259ace0a233 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fd4ad0df6626f30e95d702a1f67a55baa597feed | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8cd217fe2309c9c445567db8e1913e628d2f9238 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/84ae548e9933defade6f33d4a481ca6fd5b83cd9 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/69c6713baf3e6991d38d480ebf2f6282e8a35f83 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9325572b31440f269f073f3dfcabe2c5431165e7 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9668806ce4c7d613d641a976546247576a8a000f | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/de0bbbfc90a87cfbb5037c42bed837684ee28193 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/11457fdef0d783f686f3d3504ecd2db9fd9148b3 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a7101545f1c3f1794665533139d2911cd392151c | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/904eb8bfa214af0e8960f71f3fa935d435e6ad43 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8f8ce87e57d6391ad91500e6ea2bd1bccbe2d91d | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/135a7f591e3a3390a8e93740fdbf0010a8817e8d | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f6ec99e6d0b4f0c684f3a6024d4d5f5862e92f0e | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e67a164fd3bbbf0ea33d62d00d95685d47cb1b5a | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7e6d9a93042218774753b8f883c4d306da81f98b | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/da1184f5b39e0f9c83abd83d7af95d5b50e0a1c9 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d72a01314d658ba9c9c0801d4a633dc84cdedb3f | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/433240834d66e21ff3d628df13ed7019182df099 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1036c7fa55873fc8ddfd0d0da6274b588ff52df5 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a48f4b5b1364ea1eb9b1f38d921d652545a0f751 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9f96c616a31d12d468cb2af6ced2e8079c932508 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/99b15cec414ff9e7bba852cbee43f28a2b4d9d6f | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/36d527b1fd0e63034c741a76fb5314bd04151e8e | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6818bb6b237f2ab8ddb980f2135bf7a59e6ec8bc | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/26d22a8f1f37a6d26192e69c789285b75ae49c19 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2b03b6116d8bdf7af641c3c64da129ef788e9d86 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b523198efc8b75dc5a98f100ee4cdda08a420f28 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2b58cc64b1c98a1dc83aab031a57f97c8440982e | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/62e520269fdd27bfbe8f43dbb8d773e4d9470557 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/daf1cf4a578e7d26da74f7bc66ffc2c9148fb1a4 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2ea9ad864b05625e33a8bf7a7d8af7f20e47be55 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/276e20256cba3ff16cbaf2d8a9c1c86a59d61e7a | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f4e5b7d86e9a2efe4fad067d7bc42146c2db2e11 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/379bf21dfac09273f7ead1f4a1f2b2e3caaa6aa1 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/eef3fe2bf45373062f582dca69b4b6178526e389 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0bd33a38a3e7be06850666d4cfd86631141da3c4 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c32b5fbe0e492bb80757510bb0fc233ab9e45e11 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f3fa81106aab0fa1e62ae95670e62357a64d6c4d | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5133a8668de2e4285077cbe8c01719bfc34e6e00 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7c2b63801b13e875e2bd65b1e95bb0688317846b | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/44c61f2c64b9215f89c997e25fb21314c1720503 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3d4030a07f051c4f138608184db2487059bb3545 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3c195a9cd4d491351f4f7d63a076d6b01fc7f951 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a7186e3b4fcd8d8875170897cd8a1c66edea58dc | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3b2702ea19b4c09e6d47cbf1d513a656d4fddc05 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/74cb6b6ffa779a630870f9416f97595324123f9f | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2e3e5440cb398136a59a4f08a81ea3e8e1d9cbd5 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/28ef28b39909a176d54e2be806f043acbf1cf727 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0b013aa819a6a4286572b63e16b7a097053b07c8 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b9a9052d2c0524e3e77084fa4f658d39dcd5ab58 | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a754f12ed5ead2065d777c3ecea399b26bb9ee17 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/17c3b984cfd310218b93d90697726c0cf7acb4b4 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/796676ce63f7338414cf9aeba7ff03fdee203a9c | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d032a0b523090983ccc9f8407f19732630a17ba8 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0fb36d6b1e1b211ff9330bcbb63066ac41b3021d | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4c2370c97aa92c51ea5f40fd25e5280ce7b4f839 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/af0996b29b9c53ede96ed8e8daf8dc82cf92aaa5 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b646654c481a0337619218c3ef965c9559f5d4b8 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/188ae106200fb545a38feff939a043170c48ad7b | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6975a07e936218ff240d0a0fa3459794f61e26fc | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4fb8531dbdb5946696a76c3cf8161d554d640ffa | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9ad4632ea120b2071cf416b0ac1129aabf386387 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ad7e03646c530e49b6c1464c14561a155574e162 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bebf981c590a711ccae40881140671b4ec9cc034 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6341d1441f07e2f249248c37dc4661c92f7fad62 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/921aadab1a64a66cf4dc4516cf60af81ea15bcc2 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/84cec62ea1e880bdb673a4de690dc87836bff6bb | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/810516217ca403ad1663a9dad0e6eba875a40f32 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e63dc6687b34e5e267cd6ac372b1530ede0677b4 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/42b40aff5da0fb8f685fcd17fab7df7f40a204c3 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/568e2165b58bc848caf6b12e4c39adc0884462c8 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5607a9bfa449f694739560f67925816842146455 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c875d208b1c4b8fe2744c7123ccfce57a7c65384 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/40086087e0628aa043f47f3884e39b92b992a7fe | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ec71d29e0bc12be3804ec4fa934a2f056d2e51e7 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/90eec2f408a08cd4183072ae60094a29b2eecd2a | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c28834838d4783b08c4c8578d763734d20b2067e | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/78b46201ce4dd79a6b4b963d105b81ee9acc5ed3 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e53473ab224771215a57a6ebaac9cd5283b223a8 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d18077dce89505708b1c7399da2ccc319d87e627 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1210c7b70b00923223823a9cba44d2c6b9c586f8 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5aaf7b05123c3db5aac2fd11658f18c7b4414f0a | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ba5e62ee05c85d8f309bd42c2793e1933bb25e0a | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c71ac4b3908ed0ed9f5e3c3c8e6dbf40a4079518 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7bc2da3ab32f9c7512b93daa50c6c315134525bd | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ec623eec60dcad8e88b501f876fb2ea8b402bbd9 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f96b6478c17057c76ba5b795580b4cd0385dd7b4 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/14526d16d54d7a9f384b1a5c90cf381029910476 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/51dda6b1f9ce1c354b7ac3ccae2eb573e97da41e | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/53fdaaedce08a87cf8ed2a7459ecfc61670299da | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d1bd4f72b13a090d65611f74ca344d78c5d36c84 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/98c5d6dc80de2c084a9d79201e79ff5363b0d1db | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/742a8c971a3ccd860ae0794fe0366c0ed55570cf | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/03541b9f0cc7822caef193f38ee872aacab9ac9e | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4a32b597236e9f30874a12644aaacdf09c6f90b1 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2915d2e67decf2a97b86dfe93ff54fd36c58e59b | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5e101876c4a79d1f69b5437a77987c73f8946eb4 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e624ea9e3e11673602e2fb8912260f3fc8187fc6 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6092548e459e9311e63ab61073ac70b56760bf74 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1098d1bbee4e0d5c9d9b36683ee095fa087963b2 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ca8a8d121951d0e61041136e4da6b1c5bd6f8179 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2a7f1b6749b856a2b320ae30d64ab6af23b90d5f | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a140e37e25a79b9c92411989f98193ae054a0f55 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/024e263be72035fd7b1d9b0f8fadc65422eabad4 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/29774ad9df2bfe7c00e988dc17e96698787a7db1 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/26a7fc227c68a0739642e1f4ae3f08510c8446b4 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7f69ff768b03ed51548061a17b49b91964dea1cd | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/94696ef29829cfc61c7ba25096bb1223625312bd | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6553790e0e685577f51707149d3c57615a9483ec | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9faa2a22eab90d87f53e55521b592afe66ef9512 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7e9ec4a40f8169dee2a7bd3b10339bde356a8a34 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6f7b4e2c7c8bb513e5dcf5c9dbd63a02b6e43b5d | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dd516d375de54c9177f1b269d4dcb5fa434477af | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dc1dce8c001607341b8f30981d2567f024b28a4c | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/851c6c231b0238212c8a4ddd67aff4c98a6328ed | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/473c223ad1391e2593c00dd815fc1ee2347ff3ec | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4f82f5a60e30c81c40177e803fd5b3e149160c51 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/57c87d487b462c067d52fd14d7a9e44c0612b395 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/56582ac5a7ec4200bbf05dbf37843ef5338b1f7a | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4538e1613df88941a40ca3768f2a4c90b9e3e407 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/674cc4012681f8c0ccafeeedf081bca6774ddef3 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b298ad1ec270232cfcc842540ff0f2acb3e9457b | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8fbef29dc82a363d9a6e16da5c1c8bbe0cf82f1d | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/76cd354399c9ddaee2206b503914ee72e52a24a4 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/feeb1abb1f2bb8b4d74fc28c4a21fbbf26f98f38 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/be8946f7e84cea25efcfa326880ff406dddeec2c | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f1920e57f3daab9ac72a6dfc7cf9589c66a9730a | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2e432108c7105a7aefa75cafc4f0c1f8eca5b480 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/57715b9bfe1d94cba97ddc1209db9e8a3d325dbc | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aea884ad9964e12afd5f1d46a319442fade77797 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2cd8cb9e3461ceed8c8a028a002e9f79cd9b0db8 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cd403ef1548111c9d3f1a36f4af75c796f90e8e1 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/761e010782ecf7795e1629345af659b626d21803 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/629c20db3f38c8a1ff5c76af047f6c60dda12d73 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8cf841a1cad5f5430f884075b9675fbb8eaf7c02 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/71597d848c579af61acb4b77a4346dc821b1ef11 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3e234ae582e879aec9e42cb194545dc7cb70357e | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0f6a4cb9c7f3986c7204347dceecee70074df185 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/06ab1aa274938721e402b3dd31ae86b17013bad5 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ba3a76e74cf2b79091cc4b8e8cedcb9fb40b34de | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b49565f45a2b3237b6196eb37c02a68c1b46324b | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9ef5807e5e28af28a784c33c452a97f731119447 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8d56a85109561804003310faf5ce26e512560b62 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/94c50722819f6003caa2684d4a3598f2bddd29a2 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5914f2ed7d1f8c49bdfec27032cd6042fd622e3c | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2efa7421c86ade70e1be5dea1aec929d85a79e69 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b86097438a9688ab1c8c17dd944750871cfec665 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2f68c97aa868eea9da9c6993be357d14f6f23c58 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f3077e9dc72dcd7c2f1084952192eff204895279 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/381d5dffd6c703eff11ac87c9c6ce743b05bb984 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/39ca1607ded3818ee1165f8dc2345e3d30a7fce9 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8818ab4376ed5ee9f0fd4b38334ddbd57a46d885 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2799a18aeeeacb0b88f6f6a666d71a824aa5b22c | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/67d45258a668666981f685f11b3ee3baaba8b271 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0d246fd2c0a9149d9cc58c94bcb5a93280d8a1a1 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a131f6584824bd2b283bc6852fe8a7265036b52f | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f2beef727ec3fbd6a05ad18ea18669190d65cdb1 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/916e5de7bf83fac05ca4992bcdcde2cdbdfe5fca | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c895e60aacb227237a7c1a4114d22e9a7ad5931f | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b16a92973a6d4bc817cd222c7828e69e882cc44b | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2ca866c637d7deb768fe790c266216ef564ab543 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1303e867924f42f4a0471a10c462e3f44dd71ee7 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fb27010b4bf491a3c2d4192a422907c21c29a39d | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3eceb336a76bb9037cb7c46af69fe82713d58347 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8cd33cf02ae6864510cf450bc8eb0ec87c269beb | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c846ba989311b6d506d1fa007d4a7bd3dd7c7a25 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/49639baa7a4c84dca653405c7eaac8f341f5dea0 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/818299342d10c4494f360c3a14893b907ea43ce1 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7ce304d0ee99daa99c5890c1e7cd46b4aa821b85 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/928cb044c20ed98fb36c88ad3076ef655d601814 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0f343540b1dc0b72c0e173f21ab4a12c7cb4a11b | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b993bbca412b3430f4efcd210eb94c38648fc0b2 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c69864f84b6a4e05b25535eb176c02d73e0ba50f | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c022f53e27795388e2f521e0279a1b796ecec8b1 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/988e2d97695b6f17e7abe1334928f10d718701f5 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f319ca393cbb8086b55a73c19d9c3fa0863083c4 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ab1754d047233071f9922b43c413dcdd88eb3c57 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/292f1e9e9999e4f743a841709b2202b7723f7443 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e331dbbd41c9263383df16bc2beddf1bcd10c136 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a2d7c41f834c5afa9fb372c652203319f9d080bd | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b1802cbc57e2210c602d7558b30d49a27eea5c6e | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b5b0bb7ac622afbac88f1f3663b49eb117b3f7c1 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d35adf09be52ca4a6cbbf7689cd86d273937a1e2 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a138c8aaddb16596792f55c19278e92cf6c32935 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ea3d4618c1ebfb834a0d1ab2965d34cc86a3a61f | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ed4134a9c211221c655b96a394fd4ef0c7d030a2 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/653c6ba2e947a11a40a527891f921e97a6bc8152 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ec85867d1222c49f3c1dd17317ec682c3d39531d | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1bc8ab89b99c293f339f7cd4d1d65616dbe06bb0 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c8d4ad877568a360cea1aee2c49779ffb323bde6 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/da67558bf04e72abe6f2f6cb59cd3aaded896fdf | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0325e93d5951cdff1c54d0d52ae32a4727e90a4e | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/876184b2ab38daa6ad18964f776a8ec8cdb136cb | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/368740f64c09921e77f0b041899bb769219703dd | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3657e17c9ea389af51153a29632a33505d8eb6bf | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/28684b331ccbcd1742605f32d7125a3415a4d253 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/adf8c1f000fe84c8f43d184c1832305229f1b23f | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5ffde0f024cbf5e9848df6c416702386193e17df | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5f87cb6a4acae9b8f40b2125f080767daa4d4e81 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c9c3c6e9033155eb6fc184da8a5b9d7dd7984acf | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/26436d1136e6e99612a35ac5fe5cc031b62cfc9b | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e0d0064deff6377e729ea2dc2e69a63951b8ebb9 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9c1f01cc72e7be30226a2127bd05f22279f2b810 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/19ac3d746ec5fd25d5c14a8501d5d89230af7304 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bd7112c7c24ba8f6ce61b98d138a972934bf9cbe | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/59981355ae8e62b88e3590c1c290b9a1e50e29bb | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/787067ec3e69fdaf01d33bb833f0963427bd0480 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dc7242b12eec4c44b629b57f6105af0c1b7f35e8 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6cf0c77ebc132a110ce91df5b5a81954883d175a | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3810bff73c31540476a5b8a9676963d2d9f7c0cb | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/afb9bd69cdb7e68a396bb86b8a552bca15b0915c | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c6d930d48fb3866fa1833ee32af4b9b3ea52a2e3 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6b2bac2c399f11f3463273a3618fb0424313f924 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3f5fbfdddb433c2af9026bbd54f2e4eb1bda3b5c | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/422f06034057440e71735deef3341c0aee47bde6 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/96f77c151bced3093abba837af7c25292bb5b4dc | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/08e3e555c22ca3d24d65f4ede06557d728e9aa9d | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/24f8eee55d7961357cf39e498bef9f1caf79f419 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3e97d1e220bf2f4a2d998cd51a321f943d94136b | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b257cc25c96ef83edefffc46274b5233789c3b0c | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7422f1aa563f5584c35961e16a9df82f7d71fc3a | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2b3b93c2830e01bd081b671fb679df4c296f4ba4 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/af091439be6ae218b888132fba227754d35ac464 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/affb529585e526146faece00515fdc487840e3f2 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/37f9796d373c2b26f018afdcc62ef920059b4a9f | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/298eb8330fd751c06307943caf897999a1a58291 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e42cb7c4866db2c1fdf4a6a5e8aaa3516b172d0e | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5a6bf2b1a01cd479056e1f508e275fc963cdf50d | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/10d4302b272b48587efabd1d66e43d6012d19372 | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b7bc5d97a62524a8dcd6ba5ca74ddb64f69e4418 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9caf951e60d67306c73daca5c981273d0f5ae185 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d437ac823e807052301988d707df1d5854cf5047 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fc88e26951c83e4c754fb8ba79fa1105c68cc314 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/06291bece5a8eda074ab960cd500b2145edbe202 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ed3455fa8e22b4ca0a75ed6b4199277edbf4bc82 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9fc392fb059557564c58e42fc4dbe5c3d67a3588 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/83367e3a80c28c105bd69999b4fb05acb64bf11a | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/314ad9a3509f98353370ac60ae7e1986fab419c1 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b496c5ff1de92f2dc229330420aa3e0e1d107a22 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b068ac697d039d55f952b53c2fa0536585d6d6a5 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d2fef59490f6154d812130db184aee0059c0bb48 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b13a363834faa0f10fc73343228ba93b6efb4f6f | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/807ba77335b2e732def424cbad9ce4aacd03bfc1 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2732792e53f08b3a27a7d3a08040c62229e9a700 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/812f7d145191eaec44c64bcf6ad4d6992482f82b | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9107aad6e2ba8deeaa72a0c8dd6cf764fe5dcefd | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1231ca9e86c8bd65606e0718b6db6075faefc3a9 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ea77efc979d969ea46de8ebee05ffc09519fa4aa | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ad47798d84d95f10cca67b8fbab7016139e4f1fb | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0238598c661fd5743262166fece823fb458b13b3 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/96853de5e2c7d52f2c301e983dfa99c7d6614233 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f3bffdac5945fcf167bef5e2c31ca5324147443d | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7fb2dd7a9242e4b28251f0d3a7db0fdeb06e99eb | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c9f7bc9452c38ccfa9458895ef2b74f1555959c2 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a393e9ee33c9160275461976639fff89a5584789 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/13657eb0529f1f1a1d9ee9f8deb5db070e7f8b80 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e978acf7361a1ed323cedf24507cf8f7d12ccebe | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/89650845d36440da74a631d221528eae1d52aa90 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/033aa64e86b2eeb1fdd9236f3397daffa78f0089 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0258edeb389eb4ccdf19ed0ee9987966e450928a | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/901857c255bd7010279c77e8579ff21b386df201 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c1c97fbb485ca20e962b692eaf6c90fee1b07f49 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/32c2d18732df19095295e5ffe19505afda9dcfd7 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8060700667114518e1c3ec4b6d0e0e9d58378547 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8bf4ad549ae36c54967e3f177dd415a8b65246ac | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/61618bdbbbc7183bb8e2b69e45d4c372c0852d2f | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9cd825241b2c48afa97ff9fdda32af8c41e93473 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0a76442f6c1da62cd60255f98baa448256953624 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/54d8ce459783237f86c230323d13478fca3fc8ad | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/913735caa27719a085e8bf0179829873e7128f02 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bd2fd8889c8af51a28983eadc86e055bcc23bfd8 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6838967d46755e34b115ded42298b8ffc184d890 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b9a5b03ebce709681c74c725c1df7d2df207aa1b | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cafc60edfae02f94b63be8d57beabea4df74a7a8 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/40e33c49e97d8c8d1983d08dc41b00d04fe0c9d1 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0e05d02f6a3c129bdc52665b32dad4a82c6f6b86 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ba413c4d64bef4f553b23c918ad7de39b14026e6 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ef2127d7e4c72ad3d1b0697500cdb3560843524c | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9d07b513121e217a1f318436d898b6a143ec7b80 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1b492b4d0b056d14fba1759f2637afc6ec7214d4 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e7f1155e12931fd157fa539af53885fb36503846 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/63bd549a1a4cd12051bdc473b1948fb5de6d616a | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b7b80ea65307c4678e4d5299a4e467e9433c8494 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/57b4dabc8c2ca208ded4699dda060255a58aef65 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4b4fa6e1f6b6e8f0b86a07e4be8a31d4a4707654 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3e4b10f380ad9c72ae5456dd4c5899783ba7df99 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b7c505f175ad403268099ed39ba12206356a441a | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/78acc6599fd59589bc4c878fd671740a3b25bda1 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/60a9c08190026574552b01040c39f83ee69e2de4 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c6c326018aeda082e5009f82ddc883098c5c1a65 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fa8cd6861f5985c3c3556b32d5a9c905043f0dc1 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1f743f401ec432fa48eeeff4211863ece59d55da | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/85866bf22fbd982d376de6e2ad3de4c9783b483d | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b999268d821e3cfd5628bf77e591e2c6e1965b7f | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fe8638671537e8682286164176e1ba8a3c82d612 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1db35f321d10a4ddd86c377c7e9f96f136cbc0f8 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/71e2fe20d027b187c831612c83ca71975befa03a | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0a88800fcae173c097bb013f817f1d0e0f284409 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0b944a5b3d83d634272e1ca54d50082cb791684f | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/147b484e5126694e37b35add2af483c5fcc775d4 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1e8e567c687f8568a655e040d986d0ebc9063327 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/522a52c5c303b17388572934e1cea32fd2626228 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0cd39e186e8fca3887980606c9395ad81ce22c0c | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/14f7afe0b5b3bdbdbca2eb40a0f3151600048fb6 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0ef486c39d1e090015cb64606c1faa21b2003756 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2cd8f45f35726c74f0cc43e9ea9c6538b9fb62d3 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cafb91ba502ac26570fc6a2a5e2547b81a694d4b | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1e57ea57e6933304cde2ad0efe32a14f8742dea4 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/59d1d05f599cc1a904360b9760e5af65d8c8dd30 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/48343794b555e18be1faf0ecd830031a57f0832e | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aa4ead192ed897b039792b512efd709f126c4f77 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b34e01174e110cc2abdbaffd126a9e51e8411314 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f8e791279cf1bc343f000ba81ab0730a50f57c44 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/452070ba0cba8343b575fdf57ea65401baa48cfe | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bac4518247ab18bbfac17347d2969ce5967dd821 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/28f5d2631d2c793b05e6d6508e3c11d85628270c | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/54ff6cbcee811e84190fd55e8f3f21aadf90f9be | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a33f6266c4e769b1074c6b36074f9df2a6968cff | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ae3839e16a2380508b75ffb3f3e04c9f0259fe73 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fe3910d71549ba3fc99d9695d91ba92d549e61db | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2d9b84e406b0e3225eab82984f59c0a787eb5849 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0eab727e059706ebdb05dd3b0e4d2db9ff3aa790 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6495dfac4f5b707a87a36a66bc262e1f04443e84 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/39cff51e6faa9dd2bf44e39a8273f767c5c66963 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6ea74dd7ebc749c4acb1aca6c2c2087835a991be | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e14e748cae6b392b8efa1880ac8dcde8d39c906e | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e05644242d527b229507d5e93ffb5cf679a30ad6 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0184f6d1a3e182000543f5b7b332e425bc7ae662 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff92a4d8e79b7aeb7e1618972a54456cb356d513 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c07e268d9a98056b76407e2fdc8e9d2d5aa6f36e | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5dfd04e585dc58caafec0a68b6e7c2da298fb4d9 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/40d54a668b6155d95a09055773c0bfd018b02dc3 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a7d5346fbf3678cfaddbcf5ae13126a2eb4556ac | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dcaaeb4b41b5bd4755ab61cd474b312c66b0178f | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4c8051bda41685ce85ff7ac158bad5da3d362fde | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6cb1a0417c42a6ca40cf547385b9eb7a99bd12db | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3bd3640109ce07bd268d708070de4646848d5198 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d9ba37c0af18d5501b459af3207429eac4368988 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ecaeb85622acd410f475e6e192795ea5e7f64d3d | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b86f116f9efdefcf65b17298c5980e906c013f37 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/93dc5e67b93084b3fd2f5bc18d527889aee73105 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/28c4fb8bd314bb64561d591eace10f564b8140c3 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/366d1f8d006406e188ca92734dede3108a62a1d6 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/785c5c5cdfcd533ffe0f0ccb241373321608332f | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ee94983d58711ce3dfb35b3c712b8ea6dbc70251 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d7805431c46bea4047b8b5289767ef65e5c9a658 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/def54e52ab9683adbd53297e8c13584b66a03341 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d56b71bc623abeaa92ad3c0459e32b5604a4532c | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7f296b49aba284d8b61b6f41e005e9a5688a3ad9 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2beed00b2f9189ae5a760fa827d7ee7bebc098f4 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/297f31ae045ed2a3169350afef17c62d649175d5 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4a5fbf86c05b3076c12c8417b27de0e950271a05 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a08c14a145fdad65e0b869674c95356fba4313f5 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/85feaed3c1df600b0a43451c07d110b8e5d41141 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f81cd1832e1d638c4ff9fb7688e70241af27de8b | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0ad589bf4f687ab63c6cf574d713f955b3e47f3d | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/375c3e201d9a768dd83ecc8fd3ab6af27f1bd047 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b0c58cc7a82e8d35f2be067a7c21372ce20a400b | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4d99022580f131c070faf939ecbd3ace23ca04df | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/492c4da8b2c7a74eb933420ffcd1283dfca4fefe | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1df594c848c0ba1144509b504da66ae4a60f8810 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/33c6b967fb0f5e15f62d04f1c29e400baef7bacb | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ebc6d497ae51c7e7fc077962eb8fbcc504f32f7c | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/84dcddb5cd8092c5126a8513e2e59c9150e11773 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5c9b8e41ef6bc7870f3127841ab73349d4b26ad1 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a40250b518f8eb84314f4136b4c899720ec9884f | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/11615301260fba9764b3594ff42f6ba0f94181b4 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6473a3a4a892e2aa9f97c8df748133521bd4e592 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c1d60a05fe48a2eb7a3d2088574276c87ef59f5d | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/975296f5a25acfa799d85ce90eb2b00590bb03cd | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b940d0ba451fa46c047719279e4ad8fcf2f66e4c | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1ad8d7c254a3157199845b0cc424a959c1682ce7 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bd2e32ca560a126e8eb982075d71e5a78967706e | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7895f61862dfb4f547c4704a206775208bfe54ed | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c68c1df8dbd2b12ecf38c8462de54809ce674637 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5b88289b41ea41eca498eddb111dca54a17ebb52 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1b700c937daaa0fc9f17db60546826fdaf562d4f | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6ff559f3710ccf4f86435f2d917e5534546c411e | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c5fb05b78b13347f11ad067eb1455e90cf38fd0e | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4a4003891c348477ee450cfcb842318978cb4b8c | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/644d90494ba94d3417cb6de3e9203222ecb59529 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a477190c8fd6ca3a664785002fcfd4bb3577b8a3 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7d1e74d7060d947a840ff2581e5ad85585baed84 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1b6416357843ab0c78d4e80325a3e3b58897b6a8 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ee879584b4e8dab99c0572a2349d78785974438 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/300e42c958d453ec8a9e8ecaa50c3b8fa92ca414 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/592154221a784a47359cae7322c0ed1c7ba5c9ee | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7ce167fe2d93ce3c9e62ab6d1657e36b89ffe12c | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/820c9b979b3a7aba40b68e6ea91b023f79c4b2f1 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/11d5a60a3fffda9cc25ea4966be55c05fd7bbf41 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/eaa9046ff86fe08a48af718c88f52cf9d590ad11 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e236c2a77db1bf92af036c0ed601cc3057e5b88c | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5e37009407c99012f67c3c8e2ac0a1d6a45f6f0c | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6ee40a4dcee7a19ee88e608beea5059628dc7849 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c9fc9d9a48c56e928dc8165ebe2561761633b790 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b0761d06909782e7c03b52ffdc1d3716d8ba383d | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b706365813a3c1e1fddfd6c253c6ad335dfaee31 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9b980682a66175a4139c09af32c90caeda9bd386 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/64fb5961d6c3fcf0f3a514b700e2370f1d7fa893 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1aebc9c7c94ba58291b3a40f9ff9fbeac4fca99d | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2e01ae1356c1c3fdceb0264c604e24b93f0ac759 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/893b703da331d89cd8d8087a9e3d8d062508b3ba | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4cf7d1827b768dc1a4178594d1c60baa9a52b892 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a765b33f5fe577c53a56cb0c509f300e725b6ba6 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/262485c61c4d879a4f3722c6daadc84ce6fda842 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/77239571b5e1ed3520c85b94fff9a4d40f0fc11f | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2c02148f5d9a51f3a6a6be59cad8cb8fd51b7760 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bc7ca09da4f09702a1b8167e03e4e2944984bee6 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/51935929b9485961f4337e00e946761c2038f8b4 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1a49d90e8d74c008cd011b3e630a89cea8c3aa97 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/376a1ff51c164da2c2cbc5a49649be8ee264dd13 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ab82429ea83d58a0c5f8f70b84265f62ddbf33a0 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d688692ae3f0d48899170b1fc84d09e1ba2e201c | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cb465dfbe180bcaff896826d719055b3dfac82ee | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/20d8125b9b68e8cd7574b5db57f7d088a029c0c6 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6cdb518ac66d1bde855f984560580223e21aa7e3 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8d96c6a7bff3edd086744d928f18ea10be51002e | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c7a0beadecc00e4a892b5a3b0cca89ee16958a57 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d53830107d18618e8fba2d2552d8e178e6545c16 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4f7949edaf224732add0c25d91e4f393b5de2543 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/15bfc08f2ead471816f0d7d371f3980ef86441bb | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c6ac917a07a4e7be9393e1c1e12edd6242b0778e | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b6895ad4af7906bdf55e9ae0bbbc4f289a5a35e1 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5b52b22051bd78a73a42944715ad112910a4a8df | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/37b77cffbd6c2b666f94c216a70a71e74993ac42 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ccadb012d909bf29fa2900c043c0d06873eaf5ea | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/90b257246e2fff31680316a693fbe59f8bfd1e89 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/81ddc13e24d749368fafedddb3b4353c4b33bf8f | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a8f185325e0961d2c6f994c7540e9610f0132e74 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d2aeab12af4170a72a0b801e393db78de76ce391 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/064620c3f01de3d0d92fdd72bfeb088233f23086 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6b76c10d82ec1eb1366422322ec519e25125d7d3 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2968b6263a7956c51f23214e18fb7dfea73c4098 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7e33abf9e02d6d6ee683171ce803c28b05f3a065 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/32db1712da4454d48f9b49a8401b3d0e6dc299d2 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/29abd4c9bfa8360f7635976d5fa7b0cd9db95f87 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/67bdcc80b98af9980c6b2a6315961fbf606d8a3a | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b208d9d2e428d3383d642037be7e9ada9d26d5c6 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0a5de5631a421aeec6d4cc6ae9d74bdbba6fa8c3 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fd17a4ab372f446790fa70c6afa29fd2e3c44228 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8568a5b2c65eb5c75546cda4f03640c3d335809c | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b964c20e9f60f0e0004aac105b01c09607dccb18 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2939e357ece3b3cfb45975c8ec4c987286a35471 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/10f1c6318945d4f7448c23afe2bec822bd65c30e | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/682114cce8d3c3679549bf5330365191939914a0 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/86f95611d12917f70fe14514c5c21b0b7a258c99 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f9161ec55254d5cb3f6957b2d660169188016575 | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/81a747eee39f82d53be9899b52cd4c3936909049 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/51aef8f9470173f68d9b3de1f892f50329c3bbf5 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/43375d5cc9cf413076c779fdc2213be2c907121a | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/81f94fc2ea486921395f86fda803ce7a34e62a12 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/65520155997f205f1e3d5600da786d70dfe2ce14 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/67dae70bbbb2a3e7e812686eba8bbdaf1babca3b | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/557607a138fbe31a4f7e3d0493cacbfa5a2c5fa1 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/934a011177b1902907100e24dd19d2610eee1559 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b096408cc7431603a07bf8b84ff343dcf7a9bdfb | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/68a83ded4fc8bffeb7ef0a6d4fc9acf433d4cf80 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/39f109ff2b3758f74b651154a722e9624b0b5df4 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3dee6e99e6a794a6b0cdbf772d8b348ddc66ddb4 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ea2b9e70383abe7e90fb6a048fb86ce2a81ec9e0 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a0a4344334923ae1ac2eb3f32ed26c1e22ff129f | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8eedf9a1ed0057ee28271efa0ab971674fe0f1cb | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8c13eaeb27dc888c86fdf3b0a3eb4a5395fc956f | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/739e7171cffa821d1aeda38ef89af81b526a0ea1 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1d1997a642c9434b794a0bcfea850a88b047e5f5 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/eb08bc59a5eed5d322b9ddaa2efcb4ad4d9c5197 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/738c7c857f8e526761c55720b95b87f4a71df8ee | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/766a09fd7017090350e0a6bea5c4161436b7295b | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8cf58aaba85ae4e59aeceb67d0bce225d2d2dd4c | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c1f2d27e4815713146aa3fc8458fee010a8521d0 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1225972142af7991eb6370818d9cf4d35843f2ec | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/436aa71eef6385617d776d85321f1c7762345032 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8bb64a6134a908ba77aac7915460b49080005b71 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff210441ccb95ef110721a4e512a43c6164887d2 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bdb81462279e44cede6927122b10b99729fdf1f1 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6df66467fbdbd50ee4514f5fcecb3d755c3c7b0f | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/54ddd64956fb5674a49df9d879d7abfd8dc5a44a | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/de346924892f63c7b5bfdc10a97d600b59eda2f9 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/be0786da339703859a722fe6abe19ece23bfda57 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cd10c71e98c0b2e48fd86634731ad1d454f088e2 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a2f260173c9ac441003265ce4c2a39cdc6b93a1d | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/24966a43125a61a31c39a9384a82234dc673de54 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1ee493547f9f37b6f7c632e4d770d9532959a022 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6e6d04875fd43de3f788780122c1803c34518e12 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1f7291006cbaeb6825a2f7607c1b97adea603934 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/56da18db14498a40cf090942eb8a683f2975798d | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/95213cf79c884141988e0dc539e0317f5ef111a7 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/72d134f913f1ebd011588c5aa61e2bdb4f0925a2 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/13de8fed38e8896d3a7857acd6a1d8885ecb9d4a | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a9bc70c87d1c86214bd6334f5986e008c6c59fdb | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e097aa09bc233abd59b2bf61420cf01832745305 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d8211365341aa5e29591c6d60e26e5bc9562a207 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4c111424b3ba1a79ce14ea818f3a869441715574 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/305665ff7883f83cac38c23f3358d1da241a9c94 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/016e3d5501a886b97c010a7b7412b40fc0dda116 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d981db956b22f04fc48e56bb6ceca8d7ee9123ce | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9b36f75ca4e6c44f2a0c96efc9720f7fc06d011a | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dd5b046c35026202591ec945f7ef5b4ac758bf8e | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a117452bfe7aded6ea0952eceffd7b354da6f903 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dc570548a4d078c98f08a33ddbd9cd69cb261331 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bb4d844ea7d56623a48ec4229da571a61def48eb | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1d5d231cc77bc9bfe1b2df970d357ab4692a2072 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6f3bac928c37ee44c6022eb0bfaaba41c952a949 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cdbf09b2632a6cf00e830e1920cf263ccf0792b0 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6212a0157bc9dba66d756c7a25fcae579f538578 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/767678858eef98da2f10e7e0cdafdeab05c4e821 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/993138f96317dd4a360c4e14f52e2758788c25cb | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f23b21d15fa4aee2f7f72a7fb8dc091406d1aa17 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e875a234570ec04a919be7241dfecdfc0fafcb57 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/050b9b3d558386a689c7121eefe1b2e0a2a89b6a | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6177495a563f626e20ed3245388c76c79f39c38b | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1afe7766a26c061a78ae631238a8f67f5067617e | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/185df8f58bcfd4cb93da1885e704a7b766c7a597 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/38f7c36cf2a3f6e6bcaacc8aa8cb60c8fb23c922 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/79062aae9f11b3412191ee313d9f13919711df6c | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/85be199e8f02742272238b8c6a3f8b020e8d74cf | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6d9efb9b26f26b5a2340393cc98f774f9ad8d1f7 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/688f09ab1a36edc3ce71f1c19e6e53e8c482430c | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/38b91d738a99c1fa7a61b95c22bfbd6b1573d910 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a137d1a219a1b7783b4526f819edee0b0f05298d | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/71ab677872c57afbf9bf70331d9250e5c7a420e7 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/74b13288ff82589399e0ebf0c8d38e2fb6b1002c | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/14233d3636e7e9861f513f1378db5dd6c980a0d7 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/84f55d9b60c535e64b9a12470d758daf2f93b5e5 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/86df33bb27a0bf278953e24cf97ac1d8e2dd52db | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ba4bcd015a1c366d68f213afa161689bad559554 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/be86e8911ab64e7ae8b5eb421a7ba57f3d177e57 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ef772448c168b8aa35d95b29113a37f886f38624 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/91762f6d4f797db839bb65b29ca6b3dee64c6645 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/533d25d6daa5cb164ee9a659d744bb7cd23b7c1b | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/73582909e2c20a4f97ea4764499d9ad6084923b6 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fa47a69d81af3430a5368e6a064d2e1883f51dee | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/257494ec7e4de36762783dc527c199ebefedf9c5 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/51bf097248e578ababdc485e9a86c3c6cd675acb | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/60090560ea1730f4a3caa019c84eeb7481081a09 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0c1a3647ebb427d3d0ea9f25f429b139c36d031c | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c0b46da1b6bee7ff929ace156ded443ffc819263 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b26b0f5c1b47c0d374df9abfbb58ebe311db5804 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3fa580ede7cf9db83742a63719a06067c8ff1481 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e0c19bf8aab1a4137f3505b036dceb282cb32d9e | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9ed128fe7d7338198bf800157d999dfee86f9f63 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dc09b9e362f64522267746393123d3488979ffee | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7bf7171eb82d6c0abaf6b30496bffbb6c7067a49 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff04271506532dcf23a94efb77c350966c16f2db | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ae72caaca4787e9aadc1ecc2b4f4e5618394dc06 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/73ee1e12ebb27f4522c898d5c1d64216714eac49 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dfef9a2bbe888e877befe0d7492775c799789643 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3ae6751556a77c607362ef341dd23f8ed971c374 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8121200a21892cb6d64eaa27872ff4233efba271 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4f43a4e48b7c44e67718b1924989bd79ee5d69c1 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c830e8dca2a56c6c17140b2c00283c53ada3ac80 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2856132226ae81af1de778ce2c37b74369925704 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c8d4969bf0da24d7c803ae5080e10e5604d15d3f | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/59bd49b4a7d46d5dc629f758fba946d606a2421a | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2f6758b627be92870c1abd293c0a7b7a81a42038 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/268d9af4855c83dd02eb095c61c0a0bd8cc0e3b8 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/48c150510e251cf74d41fb3b7a10bcd04e9b3057 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c59449381473c99485f944f817fc65285f1ce796 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0f1dbd0e97f08cd537c0ddab996174b030066b39 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c9fe32916b6bd83946ee46faddafe422a29fa38b | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e7f62727719684b6fc99a1364a25a39ba0acb46f | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/85f799c12a2aa65576325421ad96cd0bcdc4fc6f | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8309a79dffde682fc34ef951ac4ca76ce3234c3e | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7366f6b4ade8fa0f4b6e48479f8e55a831ba8fee | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a9c98b59a1d7121622f618daa182dc9f04aae3a0 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/769df4e1da6d968b0b8663a717602b0d07353111 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7655fbd3db9af4f772b5bdda1a968cf470dbdbac | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7cc6163faed0f9b5a7f30ea78ba3fb14b8b9d42d | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1126de6b7163ccbb1bd162503a2d22b6fdf88292 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/736a315cae7922a866712a65a6ef1e82a3ccb1f6 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e337024904051bcf597c8c0b2858276b5d8c8cf3 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/68db596acdbc6a9df9507e2edabd9eb1bf72c8d1 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7010fe3f1682ed61a8e37dc63756c9b6dd18a869 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/53fcbfedba90ca5b5e534579206732b8bdfa6c58 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3af1ba1066120e21d311b405c10f0e1b0c4e4009 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/693d3c100a80a9b7dc8e50795cdd2395b05094ae | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2d7b9e43b1c8df1ae859446fa2cef78a1ab3baa2 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cf6ea5c8aa52e49770d107336e870cbdd91d0829 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a36d2431a03e9b00dc4665888e793eb2104ce1cd | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0faba5c3b819a85693813c3e8387568d4c84062c | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1ef34cd36b840f5b02f2db009df89de57dc71919 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/88f5d51573cac80d434b936b73a951199a8bff64 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/31a264a795f2ef5dd1746d5bae91e7a7313259d7 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c733c9ca6da7e8a83c0d7482bf5b788e55daf110 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d98a608baa9b70bd7bd6f8433876f90dbce35e2d | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9c7128a7dcf2b08a157fbb0cdf247e936c5922fb | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c7f0ab3ccfb7bd7336d18b419e653195020f783e | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e2c5b5406cfc9eceb0847862580bb5e107d3c40b | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/00e496db9239e26b657cfaf4134062892240e23f | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1ac518ee26ef3c9898955a2d2f4fe64f926918bd | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f6c2f86eef78274a205bf7f70fd293e66b5e5a8e | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/14279e8b91b28ac0e5a772a5d776a1ba2d162302 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e2ffcd588453d8b7742e5824d4462bae5bf6722a | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/40b7d5f54d9ff8a155fd4f32d15241f62b6fbf19 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/352d8b8f42ceb0cb05eb522ca6f80fd75c7e71e2 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/47a568790f16c9d7503cb812831f5524ded8324c | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/509016377dfdba5d47b31ef23d5256d074c68224 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1bcf9a9f612563d2adb1e6486202aa567fda7f79 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5850a820382e79b4b73f612a316c025c0b8631d7 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e265530206452f74b226094920639ea70c40cfb7 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/df00accb326ae0e8bb7e56a2224a6e97c7d339ce | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ca8552e184ccb3d980b21e6e3a259c14eba0592 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/10270a3820f10e66bd0742eea72b833ce0839175 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/98be42b32cc4285ecee55c8b204bc34d4b704f4d | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a67dffd0197698a68ed4ff92071fd8e65fce38f1 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/75b01ee827bc781b508181e707d39a94d687d1da | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a91fdd69c2a2452a789c59f240aa0efb1e359ddc | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/86188a613261d5e6082b4b87750a97067c7b425d | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/42d3cf26bbd5ca3bf9b38d97ac7791c3f9b696ba | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/27ef15645a5f5ed3fc32ea5a47fd7fc64956746d | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/437a24d676b4678d27d7c0a80e1581adc89b129f | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ec43badd4faf177e9166dab32a8e7887c8d6a2f7 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e8eb6997465bf67c95b0ee207c63f0d7aedf6b4a | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e3efc59849c26e33c23fc29b033d1f2bb7516a28 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aff9ef491005f21099366a7e33d9667d0d4b75bb | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b45de3951a5f7a8878c55e422b759d5d4577778 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b23eaa3e83862001b7c0d923bb4c6e668a6b8c91 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ea38d42d750991e8f6b19af9fc7419c797faa511 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1fdd2dfe4ba30635786cabeeb0f09a788b205c91 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5eef4a2349954d3538ab55fc6568153ec219a357 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0911347e6b5c1954aa6b1423e6bddfaf8a5c648b | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/31bb83580dee202971e6ffed6516d2b355de499e | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b812976fa03d14b31c1109a545eafedc243b016e | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/477309d8be8c38e2a0ca8853d3fc510317880f6c | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0c159b2b97ccf6fd716a96d253be5e39b24840fa | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/00fcaa6e9c27a2701602929c8c283a5995026454 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b8685a3891784a1bfaf5bd255bde2c354c68845e | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d0aa94cb8a80b5120e8c15f6e57c7a354c71a045 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dda0409ac4f2ef26fefffa75ab59a1478a5ef23a | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4b93121ffce00a9cbc2a67b119260d3b795c0e0b | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/da9540f26127f87a832d12c46dcc24d391d576c3 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a8d4507f0395a7b3f6671e47fcad3e0aa9bad191 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/66ab92b5e01440a29aa4ffef97e9597b80971cb2 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e474d81a27ad7447754c2516b24aa4288245e264 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f87dc618bf751dc19d63e4e475294b64f4522bfc | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/43f63f7e7646aad3fdfb8431c051c4f8e2283a80 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ec16b1ab84b23cdc0b11ce8933525ca0c9dd20bd | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/17251b380dca088725c065c345df7b738121bed6 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f16bee1fccc4dec62045d011b115b08da854b041 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/92ef60f05ff8f9037238047911a92b2799cfa491 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/73610aa6ac69a064bf53aa948f27b463b8358f9a | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3fc8a183d4983c16aa07e5ffdd6ea3072b5d088a | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f2b07601a6fd32861d48ec8d635d88323c1c9cf9 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5db60c14e35064ff244bdad142054d102552b714 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8bdc77400323efb69c8fca70c849e0461ef9bbde | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3d2e721849677b4b5979ce4fd6643324520c9690 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a3a8420eeddff93acbfb51f97206bc45f5807daa | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/504e4b4c2be1592e1123f8bcab024bde1228293f | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/314a15325957831e98a6e0ac7bed8701d46d52c9 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7f477cd2a11094122448cef30aff129a3728de58 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/590d258a4e5ad8bf7b1981c3021d73e1c4904ea8 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1661037d39f7af230a45890c44885b97605c7004 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/718a525b67fc70b036a8c9e339bb1558462892a5 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/27964b3ae383ccad4e4ebba2b7b0ad914456448b | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/00e7eb38aaf29ab050f20839d5ce6ea073ab4c8a | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/954998f731e3068908724c4f7333fa4f5af99700 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4014478f931f41e26ba9f1b414b89fd38f046607 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c216cdc84f1fc859b3fa8adff2e3aa17ce294147 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b0b09cf815bd35dffe1895d4cf8cb307296586f4 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/300a159d3da9374e3d9eb9ee75ab1b43e53329d2 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ecb5978dcf0a9cbf5f5c8e5a1da5e0b31b264307 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7c8eeb5b7ee1f19f02aef2559d77c666a8a2069b | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6e15cb219d3a0e974f38edadb84202ca616aba35 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3b74dcf430ba0cd923ab4675dd6e34f79e0c5193 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4f32f3e81e38ec083e8f17ee5d25539f1fdb80d4 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c8d946e75c5c73b53f41aec2f9183aea789a319c | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6a53e886c202dd0d720539416720d6015e677161 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ee17cea01e73e7fa5fabe0e107d1f618bf6bf040 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ab202867286c9bba8433bb68b5003d4f90f771f0 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e283aef031c11721bb2fdf9bdc5489188dceeab9 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0993a49cb1cac7e8869c613bca402c613b438cb4 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/720e8b081558edae255e74373d7a9ad0d2aee884 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/52583151b5d6521acfe490e1551ae9aa809a028a | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1ed58ed4e3371a72a3e5223c5ccc156c9b685d48 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/383ce5283996756b6e7af7507d51d91331458ba6 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a5d53eafd6065e2d82daf082f594ffb4b9e315db | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9c0d3a2b1aad97c9f084934d6a6bc63bc3f6980a | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/63fb414c4a104db569613803ce20a0e7e3a70875 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a2add27c8a9009cc883a3dee1123908b5a22ecf9 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8c7f992073f4c01bb5b8df7d052ac9f8429ccbcb | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2163aae5e223de835961b5918ff367d6dae89908 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d882c9cd0149f4b20fe4e168d48b8eab58803b9d | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff131388f16f802f6f38aeecad5f548eef69a503 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cdad95cb0242bea2be42a325c3782ac07b411e91 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/30978c51593efde73c276e4db151cea746189143 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ef83b4f5aa069d803462b06b093c2f4f1191a45f | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a3fd1ca196f3056a3668db57f3db222c6ccd1263 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/80fb484dc10a14c22e59c607b8319beabd1717de | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/de242e6c2b5bbacfe7fc5549d1cf9406cc30bf7a | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9b6a627c21b32fea1f8c7ba998c96f322fddc1e7 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fde3a0a222564696ac3020a37f035e691b49c047 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5623d3d184387f30109736226a161bd7f7008298 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/daae0cdcee45b4b702158ec961f64814d4c9014e | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8090c106855c870dd1cd7d0d51747c27b3e4b212 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4c9e2272a0254754309f7661e5aa792d13926152 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5dfb60b63e02281cda3ca1a1c81bab9197df36a3 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ea8461916290cc82b2bc25f71e066e076c0a27e1 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6cb4338d0f243742211c5bf0a6b44bba1d33296c | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6352c4a199f2e868669d6e032b433593c11a6fc9 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1c38a67f26f0d8c4b7b7987146635d75540dd8dc | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/844ec973a9003c1a9f6e2d0a89e822b7d7f5d073 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6de8ca65fa3e5002c1e2cddd160283ff373cfa4f | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4f061d431fed54f1c85784904527c8ffc6b40a2c | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/42c13b3f3da30122c6cb0326b4a95e61528e0503 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1358326881cb624bb5ccd98c7b1c745afe9d6494 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/10ad47f20a20f84bcf85b78e1903aedd7ff138ce | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4346c96e69d0db1ee225b2707c6cbea99f12fee3 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f1dbffe798aaa12d5acb2def6d6d840983f72f1c | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3efa4df15164b15016303990e8126e4b97704362 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b6ce7ab5eed5bc9e65518b82546bb8c90496ce18 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/99745adc41178fa87c090e56b83ba34d3f09bf6b | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bf101f1ce5c211149634ff53921d9c65380b433a | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/588bff3b80030fbb972ce2522f873c2a2bc7bb78 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f8c3abf998c79d1c2db6d49b19b6fe3ffae47998 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6e4c7eee69f1f4d5733c6115a0c4630f7991fddc | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5c2ce6ec1512d59b9aebcd15d4d3b0ea6bc9be50 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c05d960f80272a45274aae150e32d69b2a33b601 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5fbe74a89181dfd8d1decdda39ce71d66458fd0d | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b1f4ed05d57dc47f5ed2a83a338ad1b08683902 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/debafa5de5a020fd986a338d45532c888e1fe7b3 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7e4d42bc48ea1027c9976c1baac6f5c0cc144e3d | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a179276c7777ea3d28f2b19316101e14dd834770 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/15bc5e77414965fab5b914a22705adda34c9581b | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9b91ada64b5b75b3ca362c379f1e40eeb1231cae | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/feeb2aa50a1f88b33587adf3a6c6777f1a535fb7 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/76ae51cbb3ba65534153abab271c3f912eebb20e | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ed153eecf87c38a67e81c06dc7496addbf7543c4 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bf61b6c23b86883e85af8c0c4030912bb450802a | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fa4aa0a5f8885864dc2a485d2d68bd6a45aefaf2 | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7398beecea3e8905ba0341c21dc6b319f87f1bb3 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/32c1f29ad449a090fe393ecfc776411d60247bf9 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/60b1f178550ba88e5f7d515b3f5c3fe44d8f57bd | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ec351bdbd4356cbdd7f7f850ff6f6ed88743e7fe | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bb5d4fc7fd12f0be2bcb4d975727032723c7eea0 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/35bcdf3dc37248938f7b8138d01c6e26aa85ae4b | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bbd36e48f186bee67ed25b6d4ff593dc1bb036c5 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fb256dda5b209d117d046ad779f9c94cf3df4091 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2a987bd9d43dd46cbbd377386a6b71314bd3b817 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0929f1b4447bd393d532c93bb3bc291d6472a364 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fa2d10d99498adf372a4cc904b3e89b64e1b1413 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8bfa8f7759a8d7e91ae2712767e814177b229c5c | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/35a0aeb9c7858e6a04b74dc64f6172d97acf8553 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0e102781e93d80016654406e6e18dfb4df1e4271 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/50b0d15ca1a458899be9ad9741ae8ecaf0404d51 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/24ae4c83e9eca1da405cb5a86ec934fdfa13e69e | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c492577b75ca0559c5ab720623ff2cfa9420b11d | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b749dc78867b2b0f18cff4e7ab78becf40ad614 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f70e1df535990d7c4f7114812d2bc6b80e6319ee | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d023609338a4c1ddd7c90badec45a28481543c75 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/de9e6176c52637193130e37cfd9c54ec177ae69c | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/20e1c20ba5a7078a8be0b02f7adf2bb66316b6aa | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/31cf4f9a1d97ed0163f18ebe9283f4e94d9beeb4 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/adf737f7bdc70cfecdaf5c8bbe7d3b74906869b7 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d3ecc45e7946150cf9b6f19729c76dbed361dc99 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/76128ebeda300d907f0755009d4840a6aafce160 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/80b058c566611e71e19e169717fec051b4a542ad | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cba6b6dee0a91d73264afa8f0815dfef898df828 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/667dfa7bdb91b32bd7a8c397679e648ed189a7a4 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fdcba9e02743588ac9c393d13362934117da80d0 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7921c2f19c55b83f658276f70a3617d44c087b68 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7de23c47a51b7367c23047e4ef32fededab2d493 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f8a292b1e3c20894c388bb1e87ebd68655781510 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f66e6ab023ebac1db46bc9217861d69592ca6096 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b379ed2549f9ab7c061c8a9da810dd696eee83fe | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5df2049584cceb3c321feda5c29aeae2b44c4582 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/093ed6ebfc22558e234d99b4d2b61d030f82cb2b | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/07c50fb8b05ccb822ccd8f571ac8884cabacfed7 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e21d7459de90d06747a69c83c247549902d53f16 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/13cff7f419e6b3e4ea47f1f3b4112911799f960f | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/afc1f7676d874a365c702cfb30075d99965ea0ad | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cdaf84e4216ab1aa778d58d2d5ef9f7b60da4e81 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/073925de88a9d6365fcff808452dd47682faf824 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/869dcf7697d603a944846fa309f9af0c4af50b13 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/497b67cbf155bea066df6bc9f29451d389097ab2 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/86638a164473f7f68223b5d0425ea8042e851e00 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a8414e62229baf50d45dbb8f3cadb5a6b1c324c4 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fa4416103d09619cae596c4c285a4f8a1980b100 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/33313e57ac922c82486dcf170238e223fa739ddd | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fafc09118d16b09c042e7409ba04494208162d21 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/01101e5faddfd4d6d3367a1ae52def4775a5ea45 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f99806d648d6bd41aa74a9452a62f3157b64514d | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9b8070b67d72e485df3ae21779c5de689146c7d1 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/99ceea71e9ddcf6befd98f84c2414e02738383d1 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/98b7cf4bd2f15c037230f5f5254b760a87b8205a | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/31100f954b0be4c0bcc54d96c4a54aac7109af6d | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f93eb5800e772327185fae419d3124b0e195854b | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/93d6109965aac0f04d145473fb6efac424d59d22 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/35e89d37b4fba96cb84e420bcdb1774ae6244d91 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1e1f18859792d450e816f6a71db9a685c1d487e0 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/78e7093c4f8dff7dd65354366ef1c001806c1614 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/58487a3d2532ec9df24c931827c18f85e19d5a60 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7bc977349b0d269355acb91cff4ca35d18852031 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4c25e3b4f9617cccd926699cf216431c850e4922 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8cb1059337d69f982d67fbe99966e47c1f697e0d | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7d47054a50b308993d9b477aeb1aba59bf35273e | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8aeb26c17b5dae98813564b95e095204e805baa4 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9545a2237e0b86106467646f1c0b2f3803b92bef | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cd6a4e54d77a9099adf035b38a1fccd84df94ac7 | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/03511a309543e8c2ff761d413932a96259c94523 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/04cc10f6c0ab433c66af96d672a1007cee35e777 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/47dbc03947a8890685079bf30649dd0ff5bf136f | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9830470de0abf91846b3bba1f0fb9c01e279aff0 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/29f0257ecdf94ff13d8710f1b33ef5413bcb41d5 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1bf7772708f8131e5fd035afa3f55e934581153d | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5d6fccb19c2a87e6617f88bb118874d7804c9e73 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/67729a017c37ae5ea352c8fb4fcce8b0198aba54 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8cac276d873932f26176102634a60141681613f3 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/61694a95c08d50649d92bbeeab6d5043046a85db | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b859b67a57a35457c036e114042a0bf15eb294ad | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/544d0df8c0d93622123896f9c23762dd54bc3bf7 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/48c8283b0b78dd72d768f6e2d636e0a4d0f6a70b | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/933c4a344a302869559777bda7b9f8eb6428f42d | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cac2dab88acca585b0f413df866ebac7540490ec | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d98261786a6576d4403a0a1e1a9ea0646fc41703 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8986e4127d91c8eb9a79b3e9125e5443af0449c7 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/654b5aa13b17e6c17ca3e8e1bc7c5f2db0079cce | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/944b1b98a544770499e653bac4ee5f34d81780a3 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0b69e2485d5a73f9bbe53d54fa5e3e7a8318ac73 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d27c2820d9580678cfa744b2ebe22c942aac67d9 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/39a9439d0e65b5661dcd86310b3b6e97ceab580b | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f88181ebcf34d5a761ce0951eab833e4ff5f4c98 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/00d86dd62c9c12267ddea3650603e56a96c594b2 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/93c576f8595e2089d9ba694ad6b8589d479a40ec | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fc6cae26f4c309af94c575f63e48e10bc5723b4e | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b3201576847f0d83f535fe65b1d969ebfae2af59 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/69db446ecb7cf40b22511c423925809646680682 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1b199b70b15a2c95b5f0636022d173824800c024 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f950db3cfade8e3db9908588fb256beb12d54a33 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4ef049d97901963bbde9ffbc18582404c72313ad | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/de3c151effccab67d1777fe04d65c749941a9a4c | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bf2c0c98885c76a8c389860dc03fc483670c2622 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/13de89bbd57c2bb3c80c53021a7da017a3a6343a | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c39bbd9fad4ef8aa7af15fffd07c0b3f4ee4cc7a | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/24daa0a654c796404c344e27e9f96219951d8d75 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1c4b88e77e4dc03fa20f893f6b7bf006af5cd6b6 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e9d839e49f5f120b599aef9c48425d1ab4d941d9 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/281a4b505f1500d278a069d6611f7ecd74490f37 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5af2a9bbd7f7df081851293d93b6d20cb1677238 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3dda90ab1ee28999751f921dd773c7c1e7a3851a | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/56db4dea3660a03b48ecf5d459c8e4966ca226b9 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6209e5afd6bb24ab86796d7eda9f25fb42990523 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a8b3eed9723d267a12061016ffbcb3f1f0cea0d3 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/31937f272adfafa5b86d9cd599210c602b6df68f | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bc595196e7cd09d1d0fbdaefb88ce8d1e3cfcbf6 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/89c6c84e7ec893189645ed2dfdda900984b8a5b3 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/94ea4137d9411bbc7c2c55e5b2823fd2b1f77ff2 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/92199f752c38e699a5018fa464cb0f6d050dc4ea | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2c0a0abc2ae06ac20240998ad418b159b17186e9 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/08328dd161f4e080d1c1dd06d9e62dce9d4f4157 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f1590b59db53860526a4c9c49a47411fad04e212 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/91f3526686471b19c31fb30d97ad443d1a321721 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/76c607bc1eae50b48f6ef9bbd86efdae9aa6d426 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/089352f8349f34a7053a984220d812dd46043a9e | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4cb7779853dfffa64006d154dddfbe551041f5d1 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ac85849637752dd5dc9bcbf6f2fbdf6e82b8241b | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f5e6ab26ab500c0ee6f581e25766d5d4852e1e42 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f50bc07947b68cf337f3bdcdbe53053a88ee23f7 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4f194340b4cb8a712469d9843dd3529e5c6240a4 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/64b2bc5728b582eb232c921d53a73ea2d3f11935 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/abd5ab049c455b11ba8737814e55479249f5bd21 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/de60803c405f340d4431284ba1b78240b75eec25 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/242fa7fd47df69476e6013b50509851c39366d05 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0530275ce977f87f0b6bb8ae9b44f4bedf6bdd4e | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9f9378bda6fe13088f86891bec6c4aec206132ea | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/025b14c779b6d5bc2acc064a2ea7646930537e9e | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e688e73e8747666f9c55c9ed4fc5f6983830ff55 | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e4b4b9871f5025c7db192bd5e3c9c0000cd2ac1b | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8db9f3432fc7f08249857d686185eb63083b0e96 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/db4ebc4e7027fead133766c564f5174933ba5686 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/36115772d780bbeaf75b461e125680f1538ddf6d | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3a3a81406d693335155f66cba678cbf4a49ca2fb | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/267e67e25c3ef7957a11a05c9216f9bbce4264ca | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e677512a055483efd96c8c6a30aa5e9fb8c19ec2 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dbf7ac0c2de429bb049f78b745149c358efea412 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c54c242413860b3b4e04814fa1898b2a989bff89 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/553bbfa276412060dd68a279e1248191da549846 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d8877b4080ce041f352d280e82bf9655283de093 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/67d5a19a7e6185e7b730f7e11f01fe2ee7c4bc0c | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6e01104e623a48437ec07528c84c452f8f5cc9f3 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bd0fb3764349e145c0ae3d9b29a56796bdba3d14 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ea8729cb6d7e1bed0f4fbe77def5c2b5f48905e6 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5940e2fde046167873119ddddcf203c4b8d9554f | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/12d78731d90c67a484223805a03a32d3592a5cac | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/666c68ad1e45f20925c08e9d859ddb325e0b69f4 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cf1908094e1017731e5b8abba4881c6d3058b412 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/edce27e2a290c82d9cad3ac87caf74984b76f2be | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/62db8a2e1398f9e0de9e85df3b6ae86b6b6cb19f | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e5b22f088749903e6b99d607f134c6df08ecac94 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6870cc4c5e2c9e8879eb1fd4d9232642292e7196 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/edd49ec6c42cb7302d435bd47477eae5db13474b | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/93c24fa9ddb601bd7a132c2b3e336d5d59abccb3 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/21e43b26e4cc61a80132c155d349a7fe7845abce | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/64233902b1af3ec6508169ae54a06e9d9964ebe3 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2cc48bdf763c94b6b75a0ffdbd0cb8c6c6068318 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a3623dd06e6bf243420d01e5006d86164805609a | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a814476e5added59591b4779d95f53b5442685ea | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9f7eb0202628b7b588baeb7454eb9edfe7724769 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3d535baa4b8375d1b69faefccb6fe3382423c652 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c3df49c2f309a3cd20eaf1010081d87356caea70 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/434b3a6f09e652a1ff9be4ff462b4dde3d0f3521 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4665597e78d7bee78371f27b6979beded87f5243 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ce2f16bf559952a66597221f1326d6070e11eceb | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/655b4c7cf28205632b8c19004c4343c9e3efd2e5 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/839e0221f1cb30266df2ad562e615f0521b640ed | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c8151c5c0b39fe3a5ea99d35475b3d101faab191 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/182fb91d2ff0a6440e06fb052355f11a510b17e9 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/73d301961d39e4eaa6f0af595ed1ab1ffa3380d3 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6bf4b473591980cb6d07bf2b1d8a6b4c1980741a | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/224af8eb563aba0ee4af3037d793200b9fe88b63 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6111abfde45ac018039d24c7a70893257bf22167 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d6d25c9c2ac0b2fac4fb6b5b401dd5ea3251b9db | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1d05e3979b1ebf82345aa17489558a5f3f26847f | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2dc8e59b8c7843b998593ef265898363b51f503c | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5cb945faab31b572962b52c69c0ebf14b25b8000 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c7c5d23d59d3f6707f187404c569005d19254562 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/91ef2df48983d61a1a7d9b59b11adbf4c89876d8 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3378584fe226950c94cee709a7abb5401e9651d1 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c35dbe7d085730bf1b4ef265667598f8d3c6319e | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/63ad1a05d440b25ef91096310d3ca01bfe8179e4 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2490ca07c4decc49eb9aaefca000e8a68d10bb5a | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a157d9b117923c88a00693be2cdf4a07f36e7a0f | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/46dbcf9d6c0c6874edeeba1996dde7d371e89b8d | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/020f031782dd82e90680eddd5583aa9c00e5b986 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8feca7c06269c4661be79bcf792325781e577004 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cfd7abe405a4ed283e9fb8291ebc72856ebae1d6 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/79e460402a2fe90cbc55bb248a66f38eec8dd0b3 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b41a2b0eb212b90d970a234168b61d021c84f18a | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b3d153ab5c69d077fc93982610c649f15ee74f33 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f68f626a10016c0b189579a128eed4ab6c59a9ef | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/785f44745ecb1dae89504bf91e497856af851789 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ade0801ff15adde962e6d15ddd2a55be3dc788de | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/698e395c50c18b1ca60019a8d4e10aef0790db89 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f70150cc9743f702d23aab4d848fbc0b54cfb4f3 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1745aff7912cce7d194f5ca6360f47b3d4912cc2 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/53ea4713201416efe6f4c0958f3c663e9f7a4b58 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f661cf180d2f41cb3efa594f7eea8b82f62860ad | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/211a2ccd0b54fc1bf8f40ad451aabb71e6dd8b89 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7dd10ff6da4e36064e50ab6fda3a099deacb6123 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d0bc38b483ee94c428d549a63dc2c6ab47420594 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aa4c3f3b3a889fdd9cc6e1f88b3008fb67d92829 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/20bd4bf91486c2fc00a201dbac09dbb0323b8261 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dbd5f835fe5efe088ec8a58282e0fd7cd60d941f | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/41019d4abf2a9f93da178ee192adde6cd24aa12d | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a03bf78a437c852984e6b819135d79479b46e88d | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/872b5ea296fe7b7a72e95845e7c6151653933af9 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d144c69e2fe33919fea78316aad6bc5b05e0248e | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cfb3dcb92050276f48c78c6bd8191be13a28a636 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5d6dc11e3b41faf9fc9a2e099f355c4fc59c4731 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/640eb4f3e35b9c9ae053102699a9eff58b7856e2 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/227850a21d84e84288aa84c288e6641ab8996c0b | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d6d8d362a496208055a07ae185fdb58dce9b9b56 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d0b78861ca4b89339b59c8cdb3bbfe58312c88b8 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/807f8d10a23d2ff81609b1350fafd5146015d81d | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/27f6fde6ee7b5cb4676a33945f7af41d3d6aad2a | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/47decb14fbc151c70ca159f4571ece2d6167c248 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0e23b4140b3685419e5eecf2b9f821436266025d | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/684619ee62d44d63d4bf8b8931c45cdc47325734 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4b73b8f0464d3bd9837776a177ffbcf4d766bf4c | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/34ca5e1c8ffcd6044452eea53a89374a059aa56d | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d3375737463bafc6f08887dd9be2706ccfd5ec70 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/31a727c22615a9eac7692a5d7d8004913853bdcb | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9c74cfb3a985948741d96638cf362ab64ea81a87 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2acdc12fcd1dfb7e6ebdf8078d187c206a5286a4 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a434160d7c47ad304bb08d534ea109fb51b15279 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7775df8e3dc4880947e066de70f8c5e6c7dfb110 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/36196729e040c231d96af0b8af5c775296d34db9 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/31c73997a544ed0385bbeba501e1f8a1db9516c1 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/208f9116a4892688cbdb6c5caeaf62c8a9a887ba | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/deb3672e469e3aaf2f942a0f6bc604713719c314 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5d14d84cb512c77743caffe381d6262231df9637 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a8f4c1bc9ae05c53ddcac4fabb04aa244ae28de2 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1618acc486b128a8714a5b43967e7777ec5613ba | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0ba5d3f8731535bdad72a4acf5addda36f4220bf | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/86a93d1345b79ef25a096d48016447611f94edb3 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7499526eca1029c1c4f9736f7edf40760a29f2d7 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b47c220b881c1fab30cee79a9f11f58fe898b99c | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9df743ee2be782efd2f7a7df685ddd9615a70509 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d095aa75cdef15f43a336660327f391a7f00fb6d | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b79c2ad9031d2a1ef86e5ac5f0ebaa80733c4bd7 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2a3f2a464b5992861778de16e3528cdb5cbaee41 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b5c7b1306af4dbd81ef29ccef6a6d344cbc4c86 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/87480a17370a50ab097950d83e12859dbf3a0ac8 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ce8c917277e23dfe2c365dd6f69d5b8fd37958ed | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ddeb0ed2e6012d8f0698f024be8d5d61c97c0cdf | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a0b5db466490c5151404c88b42049219233d4565 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/83c0b1b018c38b4fdd19ef0633ef502cb6e77d50 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/20f69e4f6e9e7508ab5bd20809753265cefe5a12 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/78dd40fd06da0e0df3172de90e157fb85c749abb | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/71890f83d41d5b2ff3acfd1be963a7a5e4f6d03a | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/829278e1a6b234e83f6d82c70af7828d272bb3e7 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c09136404484cd5e64d8e5ab7acc5f248e968020 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/beec1ced1f6f4bc574321c45e8dadff9d5f7c529 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3ef50b8b73b52bdb805268b6a7c1b804f05c195d | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2b6749ad08e5655270d1d7a273e9ebe6dff55185 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/70ce35899588c781dab7aec57f77f884def5d396 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f05be5bbead66ac09117858b86ce5fdf03c881df | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/390ca04b20618f76d002f2bfc9c08ad9082c94cb | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c430c8ca4b9fe57e088180c39079939186a11bbd | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/702a9c79c942ce4724181af7806968bfba833df9 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a1fb6edfb595246b5988702e5ab29694d1cdf5f6 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a4dc762d701d38663caccb805bce091826e5aa8f | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2f1e5d28f963ffab368ef0cfeaddeb750d02f828 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aa6f667f6b57395fd3b06c8d72b9e5d106725431 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/194342884be9fea9b2f55bff7ce063811d286b14 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2eb618e72bed5456ec93dc848faa2c190e14dde9 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6d741b4633981f808bf2cdee1905d13dbc312a89 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1303f875f468033293534c9b7121db68755f07c3 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6547c8492ee0ef42b26ee4ba48d72b7dcd724954 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/24656eba10d77c034d7b019adc8e885db9f06c60 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/99e8ff6fc372de1d190165033b36ab163bef1633 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9ebc4f4cdf80f1479bc43384d3cca402eec3f4d4 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e6ec90f844a640af1a5c6a5a9c03052677d31ee3 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/79be7c6fed8b0e423fd6ff57695dd0a17890d96b | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b329e7c6233d5e6bfb88648307663c81eacad867 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3cc5942ed86a58d045a76fd9631525806fda7fe1 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/078b4736b0fbfa511eb548cb5c42a19437c713ba | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/92cc2a1aa604355e7eb5fb0649f06cac6484a5e6 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6a57c25d0b697a717a75677ae1fa766eea9c47b9 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e9cb91d217bd3ff04610509c8eef26306870e01d | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ebe379492ff7aa2dea784bc137300d4e401d287 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/36ee84e5abf55ed06a54ab845a8140fb1171c4b3 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6aceb4f975244e2f3869292d46681ae5c0a33c01 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0f278ff547958f0b8b438a2e57100e5e41af732c | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1922c0a854e3744a75ec12131c403979097ca7f0 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/00f63a4e39deeb145f47afbe849d0a9c88cead63 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5190364bc328b6921aac705025e3e90913202317 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d063d2a9b74b16067071cd32cb7082337a78ad7e | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1d520f1eb4eddda7a10b3b09e2820699a4f89b21 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e2a2548bdbd417460dbdf6e204b5b89ece9482a9 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3b98be9cd3e75dd7605adfef464343f3ebddd5d7 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bf8e738b4f54be3fdfa94111729c09e3eeb99a31 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/caf05b812d8b7b7bf921d6748ca8b1fdbce00674 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/22d23dabed740e71e39db1e6818480dcb2035b85 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e0dad681721a42423ebb80a5dc01bb8b70c46b72 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7e40f02672469ad9960b4fc47a6743a2316f3cef | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fae62181660ff3b269d7e61fd11263abf778b405 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/079984452573dfee8a7bb3cb4d58044d91c5957e | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3028a9223ba651e8e040e2955ee7c51ee4ebe520 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4f695ce50c1b326da4d004ef763e6392ab034f03 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/64013646a9c1419724a0334d25c35e7864618919 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/94aba66e7238adbb5056f4f1fe2985ae76063906 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7a7ac6d31ea9ab13ac84541e331938e3478bdb55 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/474c4a5297d8e4915114a8617037fc01afcff26d | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ee30d83d127e605287d43fbcbd5fdb6494ca38de | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ebb3df293bae0ac736f3f2f9e0a4862048c0b7b9 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff94e78d3e67709c4ba45d9d72ef3d603ba7744a | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8a3d186d766153d2b782eb6f0ff7404c185a7f59 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0dddc3ea5300e1ad2153a611925285c564cfdafe | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9ff269dc5066729e594fb5257a187d865290a7a2 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4f67ffce7497e36fac0ce87a2f1b714bfe4ae3d9 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/14f8b48b6ddaa528786ae2c0ca0b6a3ca4223e24 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0ead349ec9fd4c9953a4cd94d803c89f6e491626 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/47fe59f5e5a231217c997bc4df2268ccd2b0898e | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/16e1e51439df9da38e3731a7573ee308225adb93 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/afe038849c0dc32e18b25dbb755f9262bff2e53e | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a6535318257623f714eae495d082844c56be292b | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9969a3b24df4d575b68c0632e0b0111920bdd4be | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/97b34e987f7799bfa683d5c76839d1f7d229fb78 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/860c607c05d80e8a615ba6b65ceb7b69008712aa | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/81eda37203e5409b269d1cc6a9cdcc701756e495 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/43bd8c2dae2b50b3a12e8968d667f362036ff906 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0ff751dbc6b31b5d67a6ec82ce6034c834bfdcd9 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/072b25f9a1061143a0214db766c52d3f3c4dacc9 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/766551cc6476ec0ef63cf0e0e02220763cba417e | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/12c7d3bdc47f65025bea5c0aa37c41afdf714d8b | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d00d29a0ab1f8d5dd28da33ae9bc2a8d6cfbf9cc | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d1ed17ab2d08df2d9b9c5d0ba75afb2291ce0757 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4673315ce5a8ed50d173cb05bebea19d7cf2d24c | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0c3666e03a2226c0777067cd120484e41294a740 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9accd8012fe6988cb5bd095d8ba5203832dc232e | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ad60ed5026da76e2243c292dfba97331b4cce5cd | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/89fddec98a69eefa9d53c0df90daf0df17497795 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e986fe995a434fb603a4a33a33d517e70433301c | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/940328e5501da9cad4688c7f2d82a05f4467d8f7 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/33dfabd5a080a7d4e8915fb3f7c80b7a476fc535 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e74b765ec5aada9d21ea7726b383ddd917d7ecf1 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f4f628730b152fdaff8698afeafb68f9fd62728e | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/046ba42c6810c5dd98ba501b6bc499f34a2365b3 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/493e981186778059c5a3431d3073fd8405a6fbcf | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8c22197d156379e7895c59fe1b827387585d7853 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a2fb1a113401ae6bdb7acf9abb1682bd4be17b25 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9227aa08188f14d1527cee308eeb7882d79106bf | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/69b39c72998c2457e436cb5bd26ba4f557373441 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8936629e83609b65db539eea19134f0b0dc3fa86 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f311ba0ddf7773ad45e4ed171570694064a2fad5 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/78a76de11bafbdfd80db0e3f83a9886cfb0d6abb | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/93a06e4258fed1d2e9bda718f931db188fa6ccb8 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3c73ef62e7063bb96f0adbb063892f5bda3ec5ff | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9abff392b02039b7021479643c6310a3103d3f9a | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1de98a1dbe35bbad363e5750fc1903215049dee0 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cd018ec7a49d684eafdd160ef2d6014f6183c88a | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8cca7d47707bb92d93934b2d35e416d9bff7f635 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e52990dc718e857b125ce77fce3e4c841cacb42e | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ac4b79331c9ce2b06a78c0c5d99ce77898972c01 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a1f0f01a1f3e3af84bbd3809669262669d6d5d02 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4aa2e148e9122fc2b59f9cf80875699319205abb | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9b281de8f5cec8f1e96a7cee3da83eb2aa56fb88 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/59de16e86fe0faf710025f27ca7d2c8f0ac9eb0a | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ebf63f741d5468a38b8c2903a95a5abf34fa126f | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/317c0f1fa5323a76512b48535915c90b5ab9323c | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d070515f052470281bf98a85177eba337e773c06 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7f0331e3e882668e0bede49a7ff2c62902d655cc | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a10b274f90ec1457859ca2d9467905d825d86dc2 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8e7fb970c33e0a905857c8ae3919f0a149e42625 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a553b47ce3fad4cc04666b45eefb3e15e382c56b | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0c44a7a56a55dd3ac12c97c0632e709564a6b2f7 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d06538aa415ab3790650d045989d4a90dfb157a3 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/08de096088f28c860ae5040e92bed303462d7bc9 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/690a59a26d6719b87edf6d49159e58d35a2e5a60 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c134aa068149e720a173ddf5cb1986ff852bd630 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/719f02290e854dc1e099ff4a2be52984930a2bb9 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bd4d8a65221ca8f2347f28a204041baba62a4768 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/71658a05be212359cb2f52b89af3da125c7f0b26 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/242dd77e8668210dd3a11c5c599f731037fb03b1 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e02ec3e6d7c92abc855912ce884770ead8a2d618 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/eb81bb55ebb8b22a0c7a0d4151dd28733fe858e3 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/67fdf95c7d3f8d26bf76eb47733e9effc048961d | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6ad28efe5231a1854dc2f068a48cb96937806d75 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/27d160a2f7f31efea1aa7cb7ea551ac84b3244b0 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e10bcbbf0e93b20fe55bd7d9f47bd468d1beb637 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/53a85f8a2cd100e19eb9a0e63f1e99aefadab12c | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/63e98f66a23df76d6f0908326901aa2f63f5407c | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e683ca8f4999258c16a94564e40f86cad4265fa0 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e7630bf0a36ba26a39a32ecb16604ccd5a7a1c68 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9e2a3d1c05f38cb328104e1608019e4f588e3eb4 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/32f0ff87bad9c67a64d4daa3e37fbe2e0cd374a8 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7e35b5c3e69a05548cce6cb22e0c8ef563232961 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4fd31b555ddb0240c0ccb3d7d8d212e9e4ebe34c | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/72cb141dc07c74184bd5adb06abcff1c805b306e | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bd25cdd2b3cf9e976254197e50fafc7910febbf1 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d448da044f18fe7bd8fa5c29ef88c2ce819bd8bc | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d31ed41bdcbad33bfc9910fc174632f699a631bc | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/688030fe9fd74b4e1c2ba2d574fc70aa5dcd587a | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/19c2ac5b2fe54ea45b434f71def19e227af2ec97 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d662adadb98f1bd90e00a6f680343b9634c3cba6 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5e6de300549ea81394c5394d303b4d309254509f | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff8ba6f1ce9a0075b6a0d765f17d79da0dbc39ca | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4950c8aed0a80377b878146151a9b26f3d753697 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/27ae5a5afda8cebe5c86c126358807772da9a83c | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f36864e9154f37a0ef688f7ca923a288558cd6e1 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a0f6235f311f49f0d99f64f29882f6bb550d92ac | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/db7224b8849428bb5b6206795da3e1c0a250031c | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/85bbe6000527cfbf166c3a342a17b97fa870238c | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e45ecb9b6b7755e7fa88de3284ba54b7332ce66b | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/65e16ff145850fe036292bf1285ac35008acb2af | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6055268a6a1f32e65d7bbcac02b8e9ef7e368cbb | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/904c8758fb38968e10eb63b456c02a8a88d393c8 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2c202164c6eb8b9ee37e69099943bc1374674794 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/06c3e7a62974f125c1bbd60cf6f96b8cc5a0248e | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d9c2411e7b624492a82211056a3a6faa83486310 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7d87d9d5971c01cce6bf8c9faf891ed500d2d77f | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1eda456ce1e2873b54a5663b09a6c91bd3b356df | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/548627e12e0e71b5658d407d415a535cc3addfd6 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e7416d4c63196b582d4ac8b1770fccafbe4f4a5a | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bb14780310df545d6a0a2315d556f832f4f583a7 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e8f6ecef0198192483d2bef0783bc3dc13c863e5 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/15119f14c5ad6b6b472b462c701fb809bb78d7d9 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8e26c73c570dfdd8a82ea8692260f99aeacb1541 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/708180362f3d7caad6946df7b496885c5746c647 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a1a99aaff5f86e961cdd704172c425a51758f7eb | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/80aead4bbe657897355e6ca4b54ac481a0332c6c | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2cf847d7b1c9bf18e8ecb45de3d4b683d20a7037 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7656a6d7d343b38be8d121324bd933a42903e8c6 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/30369be9fab69b6bf8307fd94296938e804e256a | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f91675c4073cd6bf1e5b348463698ec1c72d6503 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e9cac3bdc102f55e79b59871b6cc33d41976fb1d | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ca56cec1b6d58ab5c15064e0eeeef2f24b98d5ed | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/87e8f2e3f6295f1c92854f70c607c96633e67ddf | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/de2061dd504435327f5fbb7be52352ba00176273 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bf5a1577633357c8f94956b6df27e7d91ae1fb25 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/96a79ac88e48f18581404c387bd164993f6f96b8 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7f0da1ba98c15de898f84e7978668dab7013dcbb | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f3ae73aece5a24a66641a6740142238ae22f6867 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6c23ea5052b64816e25975f19170588901fc12b2 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b12bad7eee7d00cb5571bf78f67accabbcea88ea | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4d663c20ef4373e94e9f83267db36b1752ee0623 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bd58083f263a097803fba30b39e847da0546efa5 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c4d55ea64464afd4701e387875546ec589109191 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/32d8d0152fbad6b4c7ca770255291378d3a540c0 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d7ff6b82d1f5e7a5ea3cc3a326b905d215ad89c5 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/16138abba7eaa840f2731ea2c864d4103bad2934 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/786cafd6a7366d486ea8eb2230fe65db5b99cdee | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/699c359597c191a602a9122bd5ee898ab3cdb686 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/047ab98f918dd65cd26a2d0efa4f34f702c6f0e3 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2381ea32aab952d0bd3dd1fa9f40ba753f9b1256 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1fe1b51a61b7465dbec77d21731aa824f6ec6fbf | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ee57766cb112ee0c54a66e2c27c431c3fd6f1a1b | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/94d4c2076bd0b4a54d677cf7fbac5e1af3bd092f | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/901214e8d0dd38b4fffae4684f6bea74ef0a5246 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/41bb52b8b151ac184b9b0c9925ec35ba06aa13b7 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/571bb6e2377bb398108977efc74167c27ebdcb00 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/db0ad3b3b6c091d2c5d1e42c08e62fa74e83c21e | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c7a7841024aaf7d873e65c8e2bcd8b5554be3cbc | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e12cef475d22696f4eff19df5761698f81b1e7a8 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/02fd1e59cd389dc3531b0a259112a52b61c4e7e5 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4678c8038993fb34514684c8a31c363933a46970 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ab370d5bd9de0e866b58e6ff7e1f89d8fcc10948 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5093bd4ca4367002ec93155d0d8d81cebaa76069 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ba7470ba040b223bb0df7a5297bc250f8b38dea9 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff4ba30fe00f5cd27d5153b0df958c4b184c734b | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/eb1c2102f864e2318ab32f4a5e010c64b4edf155 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e54f568e3189bbd44fea1c4882d6d9c877708e8c | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/63cdd625c38e187556ef0f732bf310a7a016a425 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aada1788f68072c0fada0e1c53feecd95c3bb826 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/65b1effd8f1b6915c9fb116a6bd9665cfa2f95d2 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b2cb8f7b2cb5400e6a8f4f18ac9059400cbcf24b | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/565114a6477b3ec3292d1708a28139f3808836ce | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5be21947b6b9b0e228783cbe5caace5250bb3497 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/75648f5d3cebd7463051a79399ad1ebe2f04d3e9 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/66aaf787f4ad34d223ff875c5617e1145188ca1c | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8da9bb708d88f3b304f9cf905f714b52568d189c | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e61f5d90c156c03b02e860e7d7378725f99aaade | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0702589aae2beb976ba0a400296bb312f0ad9451 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/584a2bb8f93d7896d26f1ffa3715cd12bb67f28d | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7fe3e5a4167273e972d5b8c02b1479a4ac117dcd | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c7221a5673a1670da64080573b08035dfc40f6a2 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/01e66b43bb57262bec6065c65dd063cb3a46d843 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b6c653a92fb9eaab91f6509b323b08b5e3497a27 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/97a903dc1bd80bc626d8af380c5df014b21fd26f | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1730760ec983ea9403f31b86f225a29271dad621 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b3f623aa957ebe6a6b303615fbf6daa1244dc39a | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ec7c6df18027e9ed15b3806a8848abfd7c7dbc7e | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bc445ad351254f71455c204d35dda27be346aa3d | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e59e54a091f8ca2e09b1df7cdbc07b89505a5d03 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fd4e30f7b53d45e253261a3ac2efab93bc9909ec | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/411e4ba5df4a493742ea810c8b7a2c810c60375e | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/992f4a3041a8c1a0a8e511cef0b2c1ad3ee82a86 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4e156419cb4626eb94e89b547fc324c249f573e1 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d1fd318e8be9ee6379ead782244b1a761db505f8 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/59598223e33647ee834c984f215fbcfb1c76373d | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/da681500c171daf73cec572eba47054b4a94afcb | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/22da4d50ee21dabb4cf5e32bde4d02605628505d | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5c494bfce70943956011cc5a6588253ed0bc2104 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a0927e9b5d38dddbde32c05efe93e01677832f80 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b15faf2b0c0538a93da569486aabcbfd6308a8b | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5aec9b43b679b7ea97f10bfc4c526c652c71c02f | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/50ca379f797f27e89ee9d9a70e68ca7a0d91f216 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/62551d70502a233f46f1260216eff4ea987b4248 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1cf33753ad9a83b20fd1e4852e33fb781dbf3e37 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b7750ce0729460f7f7c3fbe9b303eb787627b63e | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/131d1ac195bd2b4176fc77fe7b8b38a5ca7628c7 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e5065611a677870bc7537a1d9ec4c7e8ff8cb912 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8a0a0160824668751c7a6b689f563e34c27c6b40 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6fefbb7a8affa51a17fd1d00915ae1171591dc0e | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/84d2fadb942a01b98d6b082c1424195d9698288b | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a887362bb7afde51f7a1a4602ab2b14d25f0eacc | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4e2471ff560d761e1754e7d4af02418d1ad2239a | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bc13cc9fc64074b6f8166d3f95eeabc4f31fe8e8 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0f8059909beb52b85a6764ddba5f699237374900 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/36bf991b2498a532bb8932acd0dfffba20ff607d | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dda56afb5ef7710685f61682c06afed51c82acd0 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f978eb250ee3285739401082c274fc55915f0bbd | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5fba26edf79bd81cdfbe41ab542b456faab739e1 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d1ca9b2845bc0bad75573673f48b75f70d7f2038 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f42f27b8ace40271c315b187e8b7151f361d2408 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/18057bb88d4595b3f8d314ff76523bb7c8c1453d | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9cb98370626d715a2f5f0dd0b0ca31bd8c01f980 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/39a58a67e88d8114e5b4aae1a2d96d2db7027e73 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ef931cf0549ede63cf2b3b34609e823a1c51b3ff | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff029e7c627e38e6af463a69710c787f751e0936 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0306726766b5247ec17818dccf1492cc583e1e8f | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/426075fa2a3556ebd0288b139b6732e9732b71a6 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d6d8f6324bddc7d23ced8359e4810e5ddcd2e581 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3c8de081b50a1c576a9880c76afbb139e2eed68e | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/71bcf5488a3f2aaff767671103f2ee6bfba44328 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/167b6dd315d3da46b3a6d48fe75c7d4027976cef | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ad477dfb5c27dc202a256c8cc284d3a2adbce5db | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c159fdd5677a46290aa49816b23e5130d0d5feb0 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f5a9a3fc5f89e7a599c448796d145b0503003981 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d7690a60e1f311f116db7f109ee6de89ceaec212 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b860be106e7fb483b9d2f7281f5b56aeb5352a98 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/333037f427fc3b1c92ae69828d843df887134e53 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b85253298783d70e60ccf30b87c270797842ca8f | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/68f93df8ea751cd44244c0cf0fae7194b2d39ffd | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0246bf5a9f6591d33b235328d67f143430d8fa88 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3b47d192c0f768c52e049e3733597ecc0ebed260 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/09d0a81813ca2595d5568edd265987eef0290365 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1fd9b07a3b475544b00509ce8023d814de6d7143 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e946903ea39a0e14fa95447c2c5be68a7d3bb76d | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/15bf2553662bba9495f174ac6916d4dd58508432 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0ad15d61e7caec7717035818d318548a04e48102 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/829f8f880d04c58034ea9fc961e4a2a15687dc3c | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/52db7e2e1351b42a4228e71e6bdefa6e696824e1 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/907dfac4245b1a9353bf75c29afd228876b3e5f9 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b55fda9edb5866af0c1791227f105af232a666c7 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/104f56f1724c6818bd29c28022ceb698424a7c51 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bde06e6d738c6e3023c492fb1df1e0390d871251 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b0edee0bf41f95ccb75f78387d5013403acbba5b | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8d2bb48c6efbaa861081f6255047184f4c2b1802 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dc31d3d8d838b29fb53e9a720948d1ba8910243e | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c9af0556ceb68ad985bc6054da7fdb5d3ab4547c | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/61d02796e13f04278d23296b708898449b7f4377 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/749e9414bfba1af32cf2d4cb9506fc188e5f78fc | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/eb72ae14ddf01c32f55fba61cf88fe6c66e07540 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/094731957f7a61115a7dbd119a5fe8a7c6b9cca3 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2a35e3480ce25c43e34d9e37bd09c76f27352905 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/59d6a2b9aae87d55b3fb21fcb3976ce03a9650bf | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b3e4fc9d791fc3f7b5d1e80577b60bc92cceafad | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5f376a7b5f2fc5f4888e843bcfe193d00ae2c10a | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/24c93afdf7afe84742c87dd88e74ae22e85cfd1e | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/73564000a984431ed3871c33a7bdf3cf72d24b17 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/22c9d535f89d3c2f72756ab4a0047cf944927738 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/912943201b652d1c3ae822f4717584346c52064b | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3a2c7a862e0ef30e834451cbf5ac11963226023e | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/733e2d5fe99b48375c9ee2800144039baf4d292b | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2b06bd73f5000859fa128d4f6d3ef575dd34b752 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/90b4ed5971f4c256213555ea6d43a1f2ea91fe9a | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c6cc311171d92bde7e401e2206541fd2eda5b45e | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/84ebb842db635ab2f42d965445aba4e6853b97ba | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6c97af6db1d5e7680d2b78cfaab74fb361ee4d67 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0cde3666c8aad858dcafe58ce11a63b63a62f033 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/211293f86ea3b83af72b5d91dc79437a1af5bc9c | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/85c1b99575f7fefed0ed21360c32f8beba5d451a | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/975f0c1d4d95e99710b8d1c98654f7cc7127c449 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9a580c939386269d46981471fcdaba7492e01643 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4dfa4dcb9584ac48d63f73132b8bb234b7e6f292 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9d22ca2090437c46a0ccd36b1772d1dcb6427f30 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/62d922415b64db1d033e5adc5bf8b13de71e3038 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3db8f6da1d470fa046a89ae28403a7ea44d77cd8 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/22bf52287275c6a975e978210dbe261cb3f214c3 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0535f692e4b6fc61fad6f89ea9cbf8a61d86558e | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e493d7720366db312138c328277c8a6e32f7e490 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/edf0b84a09b8b91b2ef75d86ff71e641000d1fe3 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/76b97c7160f796bb4d1ffbce2c55a9459b7d0576 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0c00c193c971c808423396e1df76dc642730f39f | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/89c0d7bb6dd84907935e550a6a6feb7287da6826 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f6a0f72618ca5c328da100a99a4c5f4e5a855c2e | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0f13455a956b34999a6f84b335aaad98bdd50811 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ca40cb43d04c046dc9d256e3cf96151c6254a06d | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/56aee89de997e36dd94598c2b3f763ba41e1cce0 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cde627d6861dfc5a54e51e1d01518aad053c7133 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d30678791bf2a9aa4cc9e8e76653066942042997 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fba8026949d6a31f5e53c29d64d25e3a2efd8135 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5bcc9236d6a0eea3cd6ff3f89bc1b160c6e1c857 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d67ba7e860264699bb94466de444df36b903af9e | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b83fa96107e2b6fe12ab7b6dd25a588465be36e4 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fe9224d1a65303fd0910d696fb5b952cb8569df0 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d99b4120ed09f3e7f743b8f9b6cfc684791f6da9 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/301fc5d22a7637a19479e4c80f258c494c597001 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a48a738b11f7d703aeb74f109f987359b9168bb0 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b7a3dd93625c3140ab45538c7c194271cf34b7b6 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/64acf5dc3e7db371dfe6b475e607c1d27558e3b2 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/141877757b1df3abe2b57f724bd89e7b105994b7 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2819a8743a211bd1d20e35b62e8f967d573bd20c | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a54c72a880a71415317dcccbdbec0ad72e9b951f | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f799b689d45b88d49c46c8842de8b06d51c0d003 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e44c1c42dc4bf3109e7a31ef73aa2e42f05897db | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d4d6af9b6e12193cf0ab0904477ca05930e5184b | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9c4d445471fa5ed299bc588049727ac9c4f400b4 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7eb6d6f6b26b4fe241b5e61dff49db7e58844262 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/56374440bd7a9a52ec5f910e733911f1b3fdb28f | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fd8c533fb6dcf1575a3ffe678f6da0d0a51757dd | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c6b527530f14032f694a821112c8e6b25dc0e869 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/81f7e9043c4f246151d5d66b523b6ec6e22337a6 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/21718ad5c41f64e632cf852034f58089491e4245 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2ab0e0edc426875eeb33de30743cb42d4f4e9480 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/60d2d3c1417c8f3b9e5fcc14ddefbccefaac68dd | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/739313aadba0e30c12d73b72d252a63c8024273f | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3b668246814ea3a67f9cc052e3b5b323687457ae | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/660566c75064bdb1af3e772856a5bb5177752866 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7c101c1b8bba6c03492321a200d51be729de52b0 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/db1cf6f34536b6820efeebd54892d47d3d65462f | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bbaf6ce2f8b130835e4ef66a954614fcad3c6ea9 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dc518deb95de0b7f000192b0154787ffb123da32 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/84ef55f9c878df79fca61b68c0229bb60b5135b9 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8bd57fb3377f4280380af7aa8a01bf6ace010dc2 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fed6fc1e2f50b31948446fb74f9b80e78c3691f2 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d373fb363c72b3ad949d7e8aef2ee18b7f67ef06 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ab5941a246d9cc037e2f5b67fcd31e221fa3694c | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/871b7d764f7e5c9201a5ca003695aacfd8b1020c | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d44011fd90038fc4f2409c583cbe97fc47846f96 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/190a9fbf2949efcc0b79ed112f9af1e91758049d | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a94c32621d508aebdafe97a24120b12654cb8528 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/46eab8f580c674f883cbbf0e00b2aed5cb8ce7d1 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff49384f869309fe62409de300cc13c9359e805e | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9dd6297cf32b7507ce47888fa286214c478ef6ff | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4e05da5782f15cb9b11596f860809ccad8a3282b | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/032dec9e8472850de0d6917e9ebee282142fdc86 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5a30f9bdff12787ccb2b46fc0e0d0416e406b750 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/91247af08fabcdb947547145b6ed78d106d81e39 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/97d590d3756ecc603880a321dc6f577c52fbce3c | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e64e3f3cc4deabae73606409d78cb662da2a1eac | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dadd52d7e8b6cc3f295410b6d6ec3ed86cc4ccda | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7e493d7f4c8e955fe17a8e3c448e70d256f2fcb7 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6192b3a2e3ecd8ea01a6bd9647ae6b035266b8e7 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0695a921062aabcffb6305c5a2338bb0e27f3a2b | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fd69e5c0f820df3ddb59e6e0af030de77e56ba0f | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0f0779827ebd9c85bf0454abf219bbbaa3757c37 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/28b32bab58895dfa7e2f25838d4454af4e2d8a35 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d9453f514bb3855ff89436966be9dcff8f091ed3 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a1a562c79893da321862fc71614f8cb5bb61889d | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/869bd2780a11782dfb4a58c45afdb76d5ea46033 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aa3e926fc954b1915f17533f492f33ebe3b7cc2b | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f56c3dc96afdccd91d3f21a70d567b3bfead82a5 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bd99035590c4602c82145e08a58e9fb2c5314900 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/18e2abd8e21f42314fd17cd67da4004987209a0b | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9a19a98d2c8b227e2f9f95b6e90f7f7e1d9b32e1 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5d83ecfc305c9e04a92bb72cdbdf41dc25d3be49 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f72463378b8f1fe10084a74682279c78b61af47a | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/81a1eeb457b56047358680e12362e106d93558ef | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/72ea066fac729ff1389c7bb87ebbda2791a7c569 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8c18cff2938c8bb86147fbc709f19368ae68155b | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b271dcade1f39a5320d3ef1c4dec1ec719c490fb | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6d151756c2c6ac3d6fff0c61eab9e7ebf605b4fc | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bc72ba9cd87334553bfb29f25dfff463ea705094 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/15a74f6aba89b98086da94662a11971394f53630 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a9cf43b9a13d2725d2fd67e9e431b0df08726753 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff8720f52bde8269083c424c43a7a9e5f09c022f | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fe53b6a7c9413435cdc4e144efea4be7e1273651 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/13f16b3621a5fc29107c580a0ba66cded58ff745 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bcfec8a09608c64d189679ae851444a419ba4d38 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/764bc15489a6663e1d389f6b1ea3cbb274c3cf73 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c53da9ce71e538db0858af48ce1a4f57323e4aa7 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/527a498b6b4361508fcb1d9fd4c14848d12fd6b2 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/86059f17183ef8c9dd4fd3c71f4638e4af6b1585 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dd047005b58fd7f2219e1708eadf612acd972bb5 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1f3909e66fa1e1f505aefaeb012ec58645f4ad02 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/83052966e1cf526d14319111c7417ea016bbef8d | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/02b31da8f44489c0130a71cc1bb88b5e145dad4b | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d80d952174eee96bc36d1d1ea91582c85f515d5d | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f83657f00d002c45d468b73863655b6fadb99ea0 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7ceb6228fb6c72d90d3ca803e228491249c7fe58 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fdf41664367ab1ef14c1f2020d253b150f2af51c | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b51315ae6c79945717e75406843d8bb10e3ddf1e | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e516a01044a628357d26b94d25ef5e1f912d3e13 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3f870aeb954bdbcb84ef8e3eb9475d23a466550b | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/13041b111e4d3f487267d3aa4b43eee2f316a955 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1b486135fb547ff69b250b3c8c59dee78d4b6069 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bb8b7a8b1106a27f568f699cacca6c90603b98b4 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aee8d34ea97103a1775a6f8edcc2df87b127820f | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/762cbf62398b502ffd6a4cb24a4f65e401fd604a | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/77df4f7d638e8ed83d7702642033da0c66547b9d | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3ab71a43f814302527a3fe976bc8be0332856417 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c173281bb6cec9679ca43f216b646771aad29c68 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5dbeb9939bd76ea9219165453f7c1116af935810 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/15c8bb8a1ac894f1a20c716a354281b447145b64 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/38745d1f3490e6f7868a1fd40fee041c52b2b875 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c18027a0c3907c84094a3cb06576df5bac904440 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8801734221f01053277518a8f33859c2c1b2bb8f | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d7b4027bea213611272a89fe33b6c7445222213d | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5d2defad9f932a2f614e6db9cfc95c3cf5351e73 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/71d1a1d00db150e44208be6257e8c6c80009b859 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/18e02385a4f2543405ae1ab798bd3a430244c261 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8063ec5ec8db5941a51315bb3e626d4a71c69518 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/99178a53a1a733e376ba8ab99fba73ae2aaba9bc | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b4175f18c9b3dfebe1d502aa4b58f3112b8aee21 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/462072baf4b13471e4652293eb2fbcc06a9a3d6c | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f5645fea36d14a93cec38f687a29db8a2e9caa98 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4802e7a4ab44679622a2d7d1756dd5a08a011931 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/556b6206457c9ce911d064fbaeaeb9195182197f | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/867b702cb99e71f0cbaa79e13bc3d8e0ae7bb477 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d6f533ed6e40a52cd71d3bfdb7344c54b5dd4c49 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7dad8b2c1bf5d3bfb7eabf9d03698210a43515eb | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a73e45fb438c1c10685a1054dd087ce8821fb137 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9e8536fa662b7cbc37f6c318e1174475c599ffd2 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/722ed9d37cc91856cfff4ee529681e93dc0ec393 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fc5b37035382f04ef18062a0420d453bdcc21ef4 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b64306e558dd49403f99173ed8dfc5c79fa44f6 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e83e34349e6a1be640041d7671b93022a59e7871 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/114829df7271ec0de58e6ab8d88edf25c57e032b | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/14b52ad896b9bb4411534c6eefd7c2d5e60289d4 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fd9af3dedc5f1113f61539b386f244e83498129d | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b2e5e5dccaf5ccba99aa1753bbae508f3c26f660 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/96bedacbe477b728ab771d2cb381b834103f3ca3 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ebabc3a0cff4892a5af6e6cb540a373a5a70f02b | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fc3b191262cf7d49c2cef07786075498fc646045 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dc4f55530687a20593506805f67dc9d9f658d3fc | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/38d2f73b7f80e51f6ef59cb19683af43834fe7cb | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/690010023f4d2853c5dfbbd3242bbc05baa97ebd | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6c5916fe18e44703ea5f0faa7eb6028ec95fb2a0 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b0f7e77cb7a199ee5b491ff73ba2ea56c1cd95ca | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b59c87503900603d55d5e59e86ae2367c73c2b8 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f843b34e4cd038dcb9bcf33f0ee16617527ba3b7 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cc027abb1c01ad81abf4de9d782a6c68ddf54997 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/02ef099c777f3b65ff40f1f6925c95381be06ce8 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f43c5a12eafb57875fe82cec6a0b736c1e25323a | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5a556f379a5980f717dff9ba3243dd57c405d115 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e31bde8aebed02afbfe57823fff29999189ceba6 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6f2a5151623e1fa1709684c51b05e230ce4a493b | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fd12bc921cffd26438ccec619ab1ea36c914b027 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/19dcdfb048dd79c1b03daf2ae02f2dd015fea47c | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/82cb847d68df77bdca32241b44ee2fca51435d29 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ca823ad34e4c99f718e64f6ba80ac5cd5a9a4dd4 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9d3d9d71507722f6123492fbd8aa422f0e4fba79 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6432b62b6645b3f9ac80e844fe6588e26256db69 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b405c3f3057339478b5842701c735741bc9d672d | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c9953b1092ee2a993d83e6a7b5fa9be97e41a782 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/56ab3ca38b07eb52f34cafbb8657c3f869503ca1 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6626d1243a5782cff65e96cc69ae9e6cf6cb1a6d | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/abccd4366e2f159ddb8d1b00af4690b8a3762a59 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3ac5dc83c38c3d6b01f2a0cbeae6969d1e4b6ee1 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e697dd165f4c4cb056084fb6af86e32c2f1674f5 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bc1fb810e3d0f0a9afeede0746dae11c7bf6668b | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6d78f252dd2032ca413ba3af378200d129038eac | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/74786b237d9347791007a99c607977403b0a8560 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a31a86e3505a404ed5da674abce3e362acb00e65 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7c99ea523b6f072bc750c34bb498b1cea1a8846f | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f94572b5b7c1d17c13b8fb30ef50c75ca3ce0035 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2512caf7935189533b5b886cf09322f10825d35a | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/81c3833989655d24dc8a616634b2f88a59544da9 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bc605f0131368ea2b9dd719d7f7e56fd5ead975e | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/89a1fd4015a33b59390458bb5cbaa663d0ffcf45 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f99a0907febc4710136e895b44ea3563434115de | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aca5f410c0552342e29f68a04d440a4d2d7a347d | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ad9e341195c25e89f2071c922f727a40e50e0c13 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/12eee2d2ddb8b1cd51bac4b30fa49a4a72f4bbde | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e4c69a9182ca855c905a00571f215b0d3bf3dc85 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2399d895c879a6ba6083d4ae9e0dedfe79918548 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/735dcc59f9f4b9c22b53a9b74728cf03fab6d76b | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/62ecf8d4bd3fba14f6f4e1494752438e5fafe033 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8df9eecd5bba7412ee51a8c0abd9adcadbcf0ec6 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/73bac60a5f54c33b81b4205f68bba6b259daf4cb | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/45080aadb2bdfe07031105c995b1870c77bd138b | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b365098cf531e2004c89df5d89961438a4427aa3 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3d9de7347c70d73dcc41a4c134f38f1374a06955 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f7e76e52e35d6e12ed79c93b5ef7e64ebb737bd0 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/86340a0824521f1f4aa8f4fc5c397d487914d612 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a2cd4729b7550b5b8ee21dbe5080b0ec1757b61f | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cfa420f49f35213342a17693e7941fc4dd67e1d9 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6c7b209ff849a984b9e0f98774b791ae4d0f09a7 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e88fbb1ae317de6a4efeb1d964ab293af92c5638 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/57cc0af02f0bf900ebcdbdb63cc8db0ede20b064 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1f1db897c50fae035e2ed83c23546cbf4872fa05 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0e1da8b79b246b8acf93f6ec2f29d090f51b50df | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c029689f7c29ca7193deef007ce7561facddc74e | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/faab56f18f9fd15138b9f5c07645572f77e51682 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/985e396629613ac97ba30a0cb945776fd55599d3 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ad00c9da19e75a9875cb6311789aad80c0e67f67 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4f0446b402e69ca9c2d35d7288679dee2cea95a9 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/55e471c3916d221be845f71375435549eeb1e3c9 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/98fa314be428f34e51146c48a532cb3076d3fd67 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/26327a59f5d293fe37bda71b7f722173bfa8c53d | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e9696c2b4bb022a28995a1612185d6d84da038fd | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/84cef949cdbe2b28ed6cdd54be958608ea97315e | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b760fe81cddc34f1faffbe022c3c7d47d9c5c8e8 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/21b7e62d9e671042740bed6c0c2faaa7e59328cc | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f929a256828be85e11f363fa9a8ea1ae4be958d7 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ee530698d8f1b5fb9a4e04e6f19f6622b6251e26 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/970df24438eef5333ca90f8c116768b9a66bd060 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bb44eb0c317783969e2bb82fa9d77ffb0b51be9b | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d0a5e9691f68b2f766527e07fd4ff1b10b3b5638 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/50c81318190576246cff1e058d84199b7c97b769 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/738010a1cd09bde945c7011565253c3c3bd96607 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/281aaf57622b14a2b1584e98b74a8fd985e889d7 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a11067119379f64bda7636b6bf7d0685e4e2df3f | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b0bad8cb3898042ce9445cf0ef7d01578a535041 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/20688df4ad8908918c70d5882ec69fab737ed675 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/517ee9b3e9beb5be182518c2665ddc8fbebf6c68 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f493cf3c4cb977816361e782c5ddcea4c275846d | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/784ad6ef4c59f53b463fa8f355f407bd184bc205 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/770ff7831e6fca563c234cf139e4ad373637f224 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1e97a3af4677eb44a06285ffa257105d01cf771b | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ee032b918503ec9d96949dcba6dff27a48cb66e4 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6e7d6f8515cf97e0393354a941fcaee50cc6a61b | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8fade5b6c28b1ab8b07031bb5ceb6a56d4ad3197 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c73c3bc0800f86fe09af0cd14d4d73c7a9565b63 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c643ce16c1942fe37a4359a3817148e3fea1a9e6 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/67e70a585a869bfb103d101ff17d0b835fc61e32 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0866cb2cdadead5f103af42d01f3e8f95fa4c028 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bf5967b102fdd4d954dc6f2da5371343da48f794 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bb58da1e67ef3ebf1b9eb4827a6f0d42ff6a96d1 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5cc7b32b7e28a708153af50e97ea01dc1a525d1c | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0c6b40a45484ccc418f124bffba37a93fee0a189 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/039474db38e7c7d25b5571fc9e76b484dd488fba | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fa75b06632d4806c48655a5edcd99a96c35d1a61 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/945027cf99031b91fc01f4c0c35a423df5761f2f | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d77ba004c660cf424c6764f05467dfb44d1cea92 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4de4fd235bc1f9b7a38c3f2879a90524d064c3ad | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/af627d672f347cdaa595f15afc76098d656eed05 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b8078fdda946c04fa49c38248cfd27071153fa74 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f7143aa1fe0fd7f272e7c6484a4885089f2cfa08 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e2e50bd8f2f4b2e383eb5be276e0f643590c4e38 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7b6ffea4a6310b4612eca6b263d601077299e4cb | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/26868cbcca86c3559deee5e1b572102ec529fa76 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7e7d245ae264390d79320f690eeff1be871a521a | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1c23741a48fc51f220c577854f4c472f8c8f8336 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/26e7a4ab58edb61d60b82b346fd0c4aa8d923f6a | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e94663540365863f038724bfd4933aab67e52234 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f12b2e2c6f5e16eef07718b070692079652f8763 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5a20eea746eb6c1b19df1ac21c6a92b5fd854b82 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/72de8fb3bd58865b621cb9da82baa66e190e5f9b | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e33adbf1416af3680da1af127cc64aded8786835 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e66c9ef310bd1ff9711a308ce901b8e2bc43fb5a | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b099a9ab90a348828604592f3be9d724e724038e | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f60e11035843edafb6be9f0d377aee9614174cf2 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5de5e3711bd26de1d846272fd10251e4b1dd0dc2 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7fb944fc0afe54ec742b549d6ecf3a41f8683789 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/98a2885fd72911a04a40771b1286ce00fea9e94c | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6e3bc91a83eadcdf142e041fd442e10dc2902861 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d23976ed0d5ff881184015b401924fd7e43ba6d6 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/07e19743e1b9564052427c8ddd668bc17fb8a5ca | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2f5b5f8536676bb4683c6b330d6abb8b6990ee4c | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7953df09b51bbb261b59c3ef9677a0aad5d98cbe | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/11d0febfc8f225685dd66d990a82cf417b540891 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/879100ccf33febb452a16aa54b73880acddae01b | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ed08a058861762fcd703f0037db3e9fa5cb841bc | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0b0aa67ab0bc9baf3cb3a72bb576f9762cb67a41 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8aa7578c4481a1f71c3cd89ad8537d989de8b346 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/30aac7f097df94ad0a6c74674c7b1af1bcb721ef | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/add045c878c1d79b47c839f6b422b55d61e12e59 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/54f637379bda1d80667a91503bfc100c6f53dec0 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a1166481f57bdda4e103b93a8f840620f5b4de28 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/760f5b82dcd9c2df9df615ef5543017b019e3205 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/97801ff0f7e7b68304fafbe55050dcfb105097e4 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/623e6c5bddcd1b7e1387e0c837b0fa1a4bc75dc4 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/faf5bff03153d8c751cf1700f2477d7b0e114a1b | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/eddafae8aeeed3a162e822d63f492a25f59643ba | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0a08982563f4e257af56f001919b5e08d3199162 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/be4d9a24ca5c07eebeb9144a164ca0a2e9b1c44b | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f4e55274aa7b53871b29abb35a52d26a5263e26f | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4cf3a50b38214adb2dbe3193d0dbbc4de6e2241e | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6d8cb59b9a355bcbf9945872187bdf753c458a87 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bbaceb51c28b537c0053ec989afba63b95915146 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9252ee2cfaad87a0493e062be6ffc915c388c480 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8806a62897efb4110dcf64ac6ed9d6ceaa06d683 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8f8ae39ef00c68b23e7ced9ec9ed2cf6b530fd4c | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2d37d540168c83328968759e057316a93e2dbc14 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5bab0c881bc540c5176f8250818f57b94d39b968 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/eab6761210bd7a05a9fde0e30d89ad3139b05e8d | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/054003221f166e0500119893057c50276d0610ec | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ecd12e34403e68f05d1daa6d9b7a4ffe04deed6 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aba375d552f3200ed738399d7e3886e903e85acb | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b79df75e5432d95e96a5c094c76a88fcaa504f2b | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/21fb1a34211ef0614998c4c372365ee853df0383 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6bd2357ef86427721fb3826e58b72992608c8152 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/73593823ecddeeed928279b829c7d812009c4f57 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/365b5952c8686251d2f7e6cf9acd81da097cc500 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/048956a6f4bd28c61d15e84295887b3cc51c42bf | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ca9e3cddf2ed213b467c732f5150473a757dc370 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/08200f942a0a842b97458f228e1aa9ffeecd7bf1 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/944c6eee1873373ea30d1067c2474f40c27fe1bf | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/116d4748c502078c9c34338c93ade0bef1480308 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5b161304ca556ec0a30f08acb494d639e7ba03bf | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/71123dcad9f412fa0f1b1dbb0027f2338412a31c | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bef82b8a7fd775df5caeb6e10ee90756d4b16620 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c9b306314b222d7fda139da2f8a2024d9e013859 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ee22a8c8caacbf94d9a6164f4383f1bad7d0de09 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4a362b6c9db3378e8dd7ad046f367f94662dd6f3 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/06831729d6ca0a14a2155d8e60a27391291ecdb3 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/137a83bee1c989d2327b1b96dd0ecb03c656ffad | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5206cba2ef320854af3a1145b533f1a83afde102 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1d02852e13d11d225f213e3341d6ad5339b905a0 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/de8042f0e0629bdc6fc9158ede4c823d586275f4 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/556111b37b8556d012fdce5f0d74dad99ba54f73 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/58ef2478b3e768487d5f51735d60e95badba7538 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/89bbceba0482bd9b6366f763e9e4865ea7c1eca0 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e4f247fc663c9a3085a5d26dc359c48d8ecc6228 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/85a572adb1c2d9b95b3a4285b789cc7e49f39ea0 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/63327d38b3f464f076f6f4e611b47d7bcd5cf58b | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0dcf08b33f617f79bc8597cdcd0a7f61b8448118 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dc64f79f0c55696cc8f289fe285610ee43280134 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f8069c969ce7529299be8256a36d755657a38bef | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8a3ddb2a3eb8f6ff9c97b70412c80b89108410f5 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ad960e2e4fad826317565e09f3eb7b2a09cdc38 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3ee205faf15d5ff917b3218b6231c5e1ae7829c6 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/732a2bca85eb7e1f6a27839f0ebcf8ef61425df5 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fa138925327b1bcf5e9671ee7f355b457c80d3ff | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bc0c035821d91a7034d904347138f8a499036f5d | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a132682d50a11f65b18c8afbc3a9792b38e8b882 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/21ec7bc19a25e2ef4aa623efd43ea17f6108bb8f | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7f623ad48132df254c5f81f4afb057128824e8c4 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4ba580eab01851e5fdfff42f7c65d4db6ceb6808 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fb7ef3a51f6e4205846536ce84a29bb07587d8fc | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f1fe676edb4223cbe5a49a452cf4e9772ba07271 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a0702c92530675e61ac69e86fef5aee8e81e5098 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/344b7f72e5324c5942c2356a7cc21f31512f43d3 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f7a354d79a0376a08a74b9b048b2d965667daa13 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4cb0768cc35ea5137de7a47d4a8d2c8e30f3e5cc | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9674d475130778556aacfad7ceaa20cf5fbc708b | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4a5ca1d5962657eeabbcd95d4e4ea3b4cc8e44a2 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e2422289aaf2cc981400931d42e87262783ecafb | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/472758ec2001ae106501c749a1dc9233fa7cca81 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b199d4bd3268bd86a1b7a4d2d1320c4c22e106e5 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/33311f5c2210d7acbad4f18197e84e3ceb0dead0 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a45aa7f71c93a6a1d5b63a9d1f2141d7d945cf7e | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6f31e06050432a325a0a3911d974d4fe7ebef601 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/22da235f409f12473580dbbb3f4e393e51c95de0 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ce3bf01610d8091dd8972fab398431e3f244839 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ae5c358db84de2d188b439064c5497a90bcbb9e9 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9f191886c1e07804851474fca2b8f48ecf25b50a | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/87a9371e060fdda9accdee322b2d3e53edc8e82a | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f8af39ff3aa11c7cea1434f95db4146cc037b538 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5b2a423c52697741949ea7a8c19447ab032ec005 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aab49d5af7ad3867eb5c4d12528fa831e598a9ea | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ff23811f8121d4b1123215d1ecd55605e61acc94 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fc77acbedef06df4ae5be6cc96203dce34985c24 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/069d65a4f3c341e8f7c809bf76862771cd47afda | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c8f9b802391e1653a1a8b838741b1afe2730cf80 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c2a7e4bcf0b2a64187984b1b31d31b64c96afe82 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/744f89d4608076969d0e5510032e44005d1ff416 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/537b1f579e91c534bc29416098e8d5aae1c372ad | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cf733479304316b9ea78f166e5fbc3e709a0fdc5 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/27d942a4a153511e337a3cd62727efba601ee304 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d4244e5f5ee13bd77dbc56ebe5a8475a16e38a4e | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/098fa9390665cf52581afadafd3811d582c356c8 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a4a60afc8bbbd79c92e5b70190f0f76db96659b3 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d94970bdd1ebb7bfb683b388d857f0e56729862a | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1d132165634d623206b4739ababe3436f904c026 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1edb8cfa7b604881f9b16882e59fa9a49e96c04f | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0b5b6726a44af17fa08fa4a1d2dcb5e05a605d9b | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5544b8d9e7a7457e142bc4b3b2ae7c7fd25da2f3 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/676c69f010ab931c3b985ead911f949ef5a0efe5 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e5e60229c3e0b5049a5c03e2f87a9243df2427ae | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1d777ccecfd9ae6375f072031500ab4172342d2e | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1ce8a38d690e24935496c539b0499072797987bb | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fdf4f91f9b486f1b7201f62efbb9d4e039178e23 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f6607c76bfd165d3495907bfedcb90b483ff7bcb | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4b15707c4507a30abe55faee7f11b79af412cb07 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a5c3e83e39832ce9503b0ad898df084a1a4a02fa | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a247d68d69c1e073fad5ea28b1ff557970a7e161 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/19e96a39c180205bfdd9c2d1d18050811f9779fd | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/474033ebb2bd91fd2ce2cc24bebd3a7ae4d76a58 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f74ebe17874e020e30a615ec489f4194529ad540 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/774b843aa8532fc3837b06956a4246f0ad0fc5f7 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ccb8a1c11e3a98fd6d5f7f7552d3d9c9c5c7c8cc | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/33cb3205cc7953bf640c7539178701d5d727ab96 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dd12f66c9ce26585dea01d3e766e88f44b1ce196 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5487cce9471a6ed0cf49d4ac367059a918fe3dd5 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d8559580fa23acf2ccbc9f82f059b2803a3a23c8 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d35a4695a1063e20efa45fd84f0b5f3648172df2 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b1d480015bb030ce03a4fbede5ed00e174d2ae30 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/13d326cc1952ef362a9dc336b533c6c83714fa39 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/85d1eaede9d566dccb83f402f6a9eed87d90c4c7 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1d9eea92b486d1ee29b64fc549f26889bf70d23f | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b6d07d5b62dcee418f20ad0a1c1d70d67d044375 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7d80fbb812e2b2a8b8d8807387995d4c27fec539 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c1c9acbc9cc4cc49c143484eccdbc881e5559ba8 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/806c263c45c8f22d2515acc270250d2e6a6e70dd | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5367b562bc043929bd4261975621d89f2f981495 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8bb8b80ddc0cf28583f5e6638e784d4dbb740039 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/346ecb66a7fa2ac4f874098ad5600aa4c91e572b | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/034890c457412479bcfc8da91e3d06c2a5406889 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/490d7cbf0046d0986a34397e04e29bde3bf47822 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e82c3f0de6a437cc410d3a44a0df893463e799cf | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6f4da4b1ed62fc05c13f8d2b98e0bbb8b7e0928b | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/75d68411ba66b3dae64d8c9236d2e3ad76d5411e | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a10e39a9eb83cc8288d1ef14484f2ec162d48c57 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6e5f1eba9ff00d2b16deb95b61c8ff0cb040d4ff | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2624df2558b7d78a6e3b4b8ccba8ba6008d709c6 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8290f7eaa3b0498d4393b38cb8f3c00cd73ccea3 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bd881ed2e013abb59fcbadeca0a1e5f27b40fa3b | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0c34a75b410ccaeb0d83b35948c64357154a402e | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0c81d2c79e8c90c3fc2e1a14d694a3995219e6e5 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b9849219678b9cbbd1488d2e8d8677904263139 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/52290a8214249f6b9e2f6c023cfc176324f579d0 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c885dfbcfde65670003f93114feec898f5c92a79 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/89150e9b540a405bacac95a05ddba70ecede7e9d | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a7e406afac6e85b03713633035ce269fd68c6d51 | ORPH
    sh4a     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/02602bfcee9f9ab44cc4f35575e0ce76391cb972 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c66d8b1e8ce7b6b3e556a15feee5421cb8d62fd3 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/69d50bfc412ab602edab1dd53a24218b30c9eb9b | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/469f9f0bdab43d220211383ff6af767075f411f4 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8971eea8853cdbd22c0ac5b49a7d5f1481ece897 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a8d4ae0eb8234d3449b54ca29fdb24ecf5e11e44 | ORPH
 microblaze  |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/4ba4e81bb6af6ee59b6774b65e65789d23ae4aba | ORPH
  riscv64    |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/d690f68e1b38c9c6437e9740e20b84be5ab2bddd | ORPH
 powerpc64   |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/50d7bbfc32fef6886d302435b7b7ed2d797bd426 | ORPH
   sh4eb     |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/560be4424e7de0b26ae4da618525121285a3e6d2 | ORPH
  sparc64    |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/49407d5742714be5fda220d107a75c624c2f5213 | ORPH
 powerpc64   |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/dae8abde540e04480646b55b3423399857a33b38 | ORPH
    or1k     |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/8927371c726d009ed890157a376ebdeab9e2cfc9 | ORPH
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/8a289e03453737e582b2a21d8c6aabf93898f440 |     
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9e60190b46c7948ff359991991cf746c2921aee2 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b99ec1e7965c727df860c7aaa1091e303d6d6541 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f54bbfba210bc85d3fc9890a676b98c1ff6b245f | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/20cfd7efecb39fe054466698b526bfdeab614446 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/56dfcda483f0de3f54560bbe66509e58f42b361f | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2b5d5c87143059612b74258bd48faeb25001584c | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/46b16436886920670512c4dca10795c91fa2dccd | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/599899c327d931ed45d711aecaea3ef5c3bf1546 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/afd8c00881856372cbde87ca0d9ded2fd0adcd6f | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ead50b0c839c13a393ec814ded6f43a376bebaf5 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/44f1c515f4d046250326d2fde89f3f21a6bd3a3c | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/19b2ffdf1b08a7c3afb539d5935409588a5384b9 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/99b79b08926f5b85be9bd6e7c8437fe36ce7fe44 | ORPH
    arc      |          iperf3-3.18           | NOK | https://autobuild.buildroot.org/results/bbdad816a49bfe884a2b14b410493f557412d390 | ORPH
   s390x     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/f813e6625b279614ddb73c7a713fc1debde9ca1c |     
    or1k     |        iproute2-6.14.0         | NOK | https://autobuild.buildroot.org/results/495ad758c481008d005c2088879fa8e09202bffc |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/c599e37a6affaef41c1090fb806136c43acae054 |     
    arm      |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/0a487846163b72622e69a1ad9789f62beffcba24 |     
    arc      |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/03eeb2dc01c7c471005fc80bd109c5057b1f912e |     
   s390x     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/feb74f93c58bba5ec2f38c73769092054dc51650 | ORPH
  sparc64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/47e588edb7977f3b86337bbf496714f62381c7ad | ORPH
   s390x     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/e617a1576494a4c7917b72e29cc6bba55edbaed7 | ORPH
    i686     |           libndp-1.9           | NOK | https://autobuild.buildroot.org/results/878887f80ddff13132bac856639da64d24da5470 |     
 microblaze  |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/2305b009c4cf3d2f4786787b016647fe5f3edffb |     
    arm      |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/e4d46eacbde7ea880c955d6bd8988d580ca7ce9a |     
microblazeel |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/0ad21a87c3bfc8021d41700f9799907c6292aee8 |     
 microblaze  |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/1a57dddf28c656c02dbc80b0c9282a000a49e096 |     
microblazeel |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/536aecf5dd2b1a7278ba29acc37faa2b1ccab9b7 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8fb7e60e23325417d3b0f9badc3dd2a3f556554e | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/92ec39057c4362b3049fd7a032c99bac3d9fc1a4 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e07b8e35b46a9b6ad50197a5023ce4631aa71592 | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b721ad263026df7f946181a866045fe16505ccf4 | ORPH
    i586     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1f1fa980a95d3ea2de5bfc6a2a3d4739c866d3a5 | ORPH
   mipsel    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/12c01243366a69796a128be17de83508d979280a | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/a5296896c2b92c495e6cfcca456b64038588cb17 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d55f5626896297cb67a06aad9193e009dd46efce |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d01fa957f126c7823ef12610b5f18fb733d85e2c |     
    or1k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/e61f030a35ed0a1d5616af35308709bc4ab3d812 |     
   mips64    |        openconnect-9.12        | NOK | https://autobuild.buildroot.org/results/baa2808c923eec0e97917bd21fdcea8c25e6968b |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/51b3dcced77a7599f0f02de9bb892c837789bf62 | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/98a7d37b64f34e8cd66efd58bc256aa7b4b81795 | ORPH
   sparc     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/32ef17f10843c4d33f8f23d5fd81c4c3c685d6c3 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/1968bda67e7d1bc80b97c5b5b2cd2bf570c53000 |     
microblazeel |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/23acfb6332c815ee19622cf357382581e9618c8d |     
    arc      |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/be90d64d8a3a40e143c6137d682c5b28371468e2 |     
  powerpc    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/e2ea79f931ef7226a81065b9342e1eea859518cf | ORPH
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/401eb0e01d13efba8e277c7449dc6b0c7dfc5805 | ORPH
    sh4a     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/57126215500bc1b4fa6461b3e68c771da925606b | ORPH
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9c253e2d95a19eab694b583493bc1f5c286ae005 |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6d28f969791b87fb1dcfec321a81908088f141c0 | ORPH
  powerpc    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/0e9c0cbb74522203bc8453e4c97766b79949f889 |     
   sh4eb     | rtl8812au-aircrack-ng-b44d2... | NOK | https://autobuild.buildroot.org/results/4bbbd61aaca1172bb6be46c8f9cd577ee77a7ddc |     
    m68k     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/5f0a1fafb3ae8cb54619ebea293c068f77706e6b | ORPH
   mipsel    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/61e4d99bfbc848a45154a20394167f628fa7c9f6 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/bde541825d087798211de3dde4ce176e418700d1 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/cb9e1f75cee3423c5e160afbbfcbe2488ca30612 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ed85a6934192f12097b0931600711b77c6833654 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/344c68825c671b16b1d59b844daf991e6f3f1116 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/9c98ecac256103f75c683c7070cc4ccb7809ee1e |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/6cd10762688eb2d2ac4dd2b4848f63d9f087c0a3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/859e31578ac612ca15a8f0efb5271a96314e6d2b |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/eabf884123191c0aa19ed7725abb7e0a60eddeed |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4fdfc53fac14bff701c25a665717cc9ee9b20bec |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/2048d3260b16c3e49d2ca6a18c1d159972431daa |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cf98493d946c827a3a156f42cd665e0e1a23d23d |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/474bf71e6d21d7c734e443f3d856867f42f65240 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/9d449c6f742a61e48ccb4397477797bf9fdffaa4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8c3cf6638f0e9e2ee50a4deb4b4c77deffa7fd4e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a66db39a509742294def88f364688462754b746d |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/f85eee9f1aafc9662f0a7f0ec1683ee3a2b544b2 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/3fa955bc510310ab5fe6385245b7c76dedeeaba4 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/51c4976325c30372d96fba4e68b153b77c062927 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/92b4afae5e052759ca0dfd646b914b4f0f520467 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/667dcbc54c91c892d34cb5779a5f765cbd15a487 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/89d73c7287bf341b75d6645610ab8b9967b4e829 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/315b81ea93e1610778567ab122b9e64b847baa2b |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/6256e925551cc14c9cf70381ca559a352a1beb67 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/9366a244d359fd5df92e01ce75f5c8886dab5da9 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/7c83523a0a308fbc3f65150ce7bca607737ad812 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/40016fdc4b21f1324bb22b82589e43dbc3b15e8e |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/dc80890791cccc9a4381a99b3ba1ed9dcf3b8530 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/2fd74ac374972db48071e49e338dfc8a6280349d |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/66a622b7183b02739a06e8cfd17f29e8486b08f5 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9bb5658a7b8569c452787a987a73d9243bc0b0d2 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/dd3e0cb25b0f870128de6841462e271b2ae96b0f |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/215323a261522516bfceef7b055f4e72c0eba9e2 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/0f7dfacf93ab0cdc075e26d86af77dfa1d88ea03 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/97e8dcf267efa61b70d7b8c5b94907ba00651472 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9486e4cd407d62b0767e18bea70813e45ec1b493 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/22541e7de89a9b8da4a620d2d02d21cf8d12d4c5 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b07d1488354024e50b02b3840b3f80aabc128b18 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/1af283a4f0500729d7787f15e51a77d9c06fa465 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5b2310fa953c569bfec4bc0031810e627e533050 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/09ae1b665469148a406de543975293cc59202bc9 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/5ca0337d11a55cce98320e0f3c29b8b949aeecf0 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/cc3db5a477c69ce16fb75e88f06d4f32ade4f54d |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/a9f3b2eca4a261a39ca8843c17df81fb0544dd04 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/7b80c37607eabd9c5e95d90c16e1abb3df7b7b99 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/74711888dc8e62a231f9add2262e7a3c52794ffa |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/b156d9f7624931c8094d3a2f16ddaf6b8bf011a6 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/0c8c388347e2b2ac53016b3e80e4aaa92d28c007 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/46eff5fdac3f4e0df4d2aec33a95e8d865b2e132 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/372b03226145a367215ce72371edbf3fd9c81dc2 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/f55e49ab032b900b6eb78eb5830c958aeb298df6 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/c4a4c40bc6102bb2e09ba168bcc4b849fd1e1e27 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/fdc95fcb97412128efaac4b39adf21ce03b3c414 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4113b70521d60d04b64e032d752e0b55db3639b9 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/a49b5ebc3982daabe73e5247a3bec082e57a7079 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/1f04334e9465cc7ff7ba4119a5df7285815abed7 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/4acb9c244d2ecc6d578016084e48340908d146cc |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/980d85a75eff2ee55c276cf79f3ba6b2f473e051 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b60b7926dbc289973cda8708f174ad61a78d6fd5 |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/82fd6ff101b55a7b1bfe046bfc75fde396f1b3a3 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/76b41924bc4dd9d27900e697ab8dccbfb359aaed |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/abe35236d01fe00902159bf8fefa57f402639eb0 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a566bdb1b49af8a5d430bb834de85f47fb560966 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/fd25a316cf7c12c59fdcd9a1ee683e0d20b41682 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/22307377130529d9a110ac25c01edc823deaae50 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e7d9511694903457ffd7321ded41ffae35e0cef3 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/70982fd57f358ff633196cdfed4e8e91cd95df67 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/1a79e0184f742327cd8af4822c68421694e4a740 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c6e898a92884678c56aeba2510f52545708111e2 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/8c566f559310f1714089bd16e2bab9b253399690 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/69babf81bc1e6435aa5f0199dfd2ea3eeababe8b |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/f2c2d30c7e916d94fe3ec89c8f2c2f4f911beb15 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/8191bd15f28c9b8deaf89ed918788a0372d12136 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/274fd76d57c5980f6bb5c661eb5d4a9aa62da9c0 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/1b1147f7eb5e4bdde15e7569fa71623acfbe6d97 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/12d6a459e31f8a9b8fcd4bafdb756dfe9426a58a |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3d8dbd31030cd4393b0f9e075d04534294e30d9e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8d4371bcc9d38bf8d5654e39f860fbf073fcd766 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/7c5e01a846181c03fcc4cd75e0117edbe717b7d9 |     
    i486     |            unknown             | NOK | https://autobuild.buildroot.org/results/57840ac3716cb1d5bed9b419f7f2f334dd4e57e0 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/c70c6e8f46344dee8f8ad32dc202bf5c058d1725 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f8912fa4779f0d8b596de5c426189f3e4a1a9c57 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/5ff6d075b772efab8a55039c1b2155c2b90d133d |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/de88f7b4598ab97efbf095e0ffcd2ced567a6c97 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/dc2257e262f722292bf9ab728b8e33104f8f276d |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/126cea06590a345a877955933ee5a47607be7a63 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3f9ecc56e0d5993cede623f75062c5dbafb25a31 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e61671df486f4bf77e9c25eb3d8c9a944536aa8e |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/bd9c1e2a91c57bb0fcd674170f1b25d07a201afb |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/a52dd891765578bed86310bc8b097127bc40d550 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bb523a5e69d0f2b8c6f3f04f33f9722d550a4d71 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/879d1f6355f946f4df5fc4f1098f3eadd2cf061b |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/3e6a44b8d775b1cfab1fa2f8b416dd71ace883fb |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/35817b1ef509146ce4ae251cb138cbadeb574b00 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/8c38a40a8179bdf065983cd038fb60a6ed0116ed |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/6d45f2bbdb6d2e68478c5523215bac0eb112b79e |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/195eac8d55379c59ecc94627bc48072bdebf150c |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/757f06d88e0e0a9dd3ca044f94461fbcfe255b3d |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c9dce469001a5f7eaf5bee94ef399b5d0025154d |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/518efe633ee916214a141391086d21eaa4e19fcc |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c4e2f3c174718cfb30be30f8e2e6ef9338ac950b |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7d7147186e7e2be536bb6cebc2f604d64a3c5cbb |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/a26310d25e09fe3013bffc67c22ec1418edd9fcc |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/827d1ccbceb940f5c4181da6ee2cc21efa201e47 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/55b2da516a2f134d7aa666b0f0b9aa2b4b416488 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/b9d92cdf730bf466225c382536163708f8983ba5 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d569721c5fbb84ad18430f8411625eb71d2a4d32 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/32cfd02355341081cf7b7e8ffc10de40a04a27b8 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3cf7bb827e88e5506815e2999b86d97aa7c9c906 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/941767931caa93e41fe7a954dae782877703490a |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/97b4e3e903ced17ee63e3decbd25dbde3213a6bc |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/f0060fdd537f227b68d269d020843aec17efca40 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/fda3eb6bc2956516da0cce016c1296e93b8ac9b5 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/4c6c1b172955f65815813fb60eb6ca3c67bc5f30 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/bb34179ab0fe8035bb6bb577a610d976fbee4724 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ab00a515c0b3dcda9d374706de7e20957ead74bb |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7122026dc994609b7049561db1cbfd19ceb67274 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/aeff5c8bd90aef8b92e1ab0d6fbd2065d5c27c5d |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/0fc805b42e01a114127fe7d3fbc3e0f14617eb89 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/22e8ab36831b9c26302cf2730e871ec51af2907a |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/454a53930cc3ca5cbde1efcd7f90eed6dc2cc4f2 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/e8aad12d83939e4abe3a6f60e04a27e1d2f04d14 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/efa7e0ec9636e659725f5de72235324110b56f12 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/fe29a319f595952a5b980111c9959bb6c368432f |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/878e6daa3dd09fe4abaa5de3eadfa7de83523dea |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/7866a7c9c940c67afcc58e7319e4a1b9938d8670 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/914d89b674f1ab088bbeb670f34ed3120411fe5b |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/07066fa3be2c550449d27e6272bd4e81612fc2b5 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/56a8c5f2f7f431ff59c5a7728ea0b9e3bf385304 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/4f99eb4314877facdd2fc98b702fdc2859963d32 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/3ed5da182f97296137c847c3859306b583a7f0c1 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/152e842b462e4f3adafaa281b20b783ccfff21bc |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/1de8771b8f17815726d84347dfca2434fb621f39 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/2dc8d6db87c8d12ed6842d920140f1e295d2f2ae |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/4b50e8b60a8403035fdcc98477ea151fa834337b |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/546af6b3bf90286dd19ae42528b2ab6f54c048c9 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/b2283fe68c5c659db49634b7fde869f862ff15fd |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/861cbc10497690975bff78cebabaef9f508423fb |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/79df01ec71e300beb63b09bb6faf4b9da1b54aa0 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ffd49623f692bfa1cf7ace040cbe6cdd3ef91701 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/80f594bb7f48ca309ac1d1e623ba9c5c4a6a00ed |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c5c34349ba140a6aedb22706be72ba0f29072212 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a7eae383f30bba587922ee9de4fc2851d93e5247 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/1895288303c92adb04010dee94a55447964a4a68 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c19ff76e60abc5d5955efb76cb0f35c2def9fc59 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bcd62b685b9eaddab6a37083b5f53251328b59b3 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2b6ba26e58c7b05f5eb9dbb6fc6e3b686c903e41 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/8e2baf0e3ba61b7c9bb5fce9f66a9ac9603bbe60 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/2dcddc628e043c4f513ae438af32dc9a1f60b693 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/3bd601b8df27ca294f9a358b9c22b2c2e6560665 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/090871b5df9c5e7d2211946261090c14487841cf |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/d0dd5bd42baf9df8bdf835424bbc18786e292292 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/ef35c923b8816b4be28355d0846e3a3e916515f0 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/6e9316c2d81bb0460e80619349270efd57fbe0cb |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/92c04a0381a82f52ecfdf7a18d16d057d909e114 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/5982a7f4a62cccbe3aa02e0627329c74818a79c0 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/125c9e6aa37d52e77b61bfdfdb398fe31b1fec55 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/ffcab0aeab2cb48bfedd4ffb615ef96e1e200d4b |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a016414020750258fe8dfb1778da94cbbdb5baaa |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/96fbd9d420175e12b517630a5bed05eb2fe0cc1e |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/26ae86edf8786ab45f66e3ad838ab5b5cf4c6329 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/8212dc59f59800e3998e51b57d042c8230079c75 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3eeb37b8007a3942289e616b0a6efda719f40594 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/02ecbcc23e16eb469035b2a31218492d34e5151a |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/093345967b40a9c1b27a4b6528430d25a276aa75 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9052dcde7fadb22bbd02dbde5d720ff84f6f4732 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/ccb7b94cdb9a2832fd36481a457427af416c94f5 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/89294c61abd6daf2664cde11a656026243826674 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/967b0994254133ebc0b773f233ca33d04c523b13 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/b317d23e0353a2887607ff369add6c4107a02bb1 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/a549b7a5e0698b3d3fe91a77e98efe0901746112 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/8b276d833fd99c9c05cad1fa431ba9b26bef417b |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e9e14f4752e6bfc7acb0b09d2e1236ac36d4674d |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/05d970bf7070c1501e3679178591847a0da8bb3d |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/2dd01bee38b01da911147383792da24194d6d2fd |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/d7873da37a506ce4d5f0c7cb0017a9fcf249c288 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/ad6e105d4deb58993642fa2f833b993fabd55d5e |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/52d6ba0cc8705015a9859de5974b08bb7dad6f91 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/43dc0d8688fdce4979ed8414ed2b253403707cba |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e93362c065ba31ad70f550146ad917e5216dd113 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f5149dd1f915e0ffe552228d820ae4a23f33777a |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/41924baf27d95e9b6bad42d987d5a391d1f86005 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/95e2c89bbb3eec1f2d04f26dd3cd25ad26a67d2d |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/e31c9c9879fc18166442bf088828cdd763ece06a |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/67e6b1dee288228b00cf6966831f82b5c4b6ec49 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/953abc888b1f102c08605f49fc675749db9dcf40 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/79824ae1b0ba23e9759a9eb707c8ecbbf7eeab10 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/459ca726075c6e228d100a6a9dccd94539a6c99f |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/30983a55dc203342f070127804d194a7be60e582 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/8b934e84b723b27f782c5c186cf9306aea7cf517 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/addb329875065caa3a5fd38fc9b02c0581636c72 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/29a6b9f08973dce718a2ccd2dfcbe359ef865584 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/df3698bc14ce39b04ead9a211cd98ebab9616a83 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7bc0706a1d61c22ba1062bcad1cb0bf673471fc7 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/592f72d97a73671dccc8922875f5a57afdca7fe7 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/f8e4c466fcfee4f031c37b7875f06015eb25f645 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/1824165fd0a61eb328689beba9d74fb8084896ba |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/1e0d271f7dc7a567c258e3d940fb07f0fc691e25 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c1334f8041257cc794594aba3279412c6bc068db |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/0c24c0373efa0c38d31b797ca3ffd4e493b6315b |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8f4871021dfa7c21609ae3f05c23a5a2e9332f6b |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/0bd18419b4eeef992d341ad7c825df000d7c309c |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4b7a96509302843fcb62667c83c008cddb206bf3 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/ac5698f866eaa0022e457198360fd5e799d736f6 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4914130454ac28541b0039ff2a8290d160f69356 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/121ebe4910d38fab87d9a25911230f21ae4b29ac |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/413199c54abfee9644f0acd04a266b1c13752d98 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7f1312c6f8a113b5cd00b6ed62fbc0209609ffac |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/bb692da53736f468ed50f98b51c89ec0fdda9dcb |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/74ff3f4c0c46b09c8be9f3ffbfd6ab484dbf9c74 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/963e38de4708cb930fd81f9d7294b784f7e21831 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/cd7f0b7640d950c6192d1309143618b98d0cf970 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/b08c87a9cbc65358b5b881db5c960e5d2bf704cf |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/8474a662e3de1c6afd52d8962cd8bdf76bbd4123 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/94d3fdcf94138f7ece53e605c2acea9a7b21a1cb |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/268f0d1da5148229df05b73ef3c6e88a15e90d39 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/f0b237b6ca8d799344424a9d8e23726514130f9f |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0d0977051ad7a33382310ffdda365f376a5d891c |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/d860f4da3fb4e7a8d01c1293cd42296ec242158f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c247831a444851d7bcd3450367c1209856233a34 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2f274de23953b73c04d34d52068a0ed4eb4d0e03 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/57acdb7bb00315c8f3ef7df48105b46a1eefdf16 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/1b8ce27a043439948c43d4a53c590bed18e06df9 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/b14c7616b821734c1645e43b2562df0195e83f95 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/d19ea9298902c3f64ca475754c38c293e2850ee5 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/52a6ca79859e7e097aa94c1aa7007bd72c1c6e03 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/b846a45b1ccc9f98e0e4ade688f24bbe6742b41d |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c7a7a9eabd0b11a55fde9b2c8b9bf4f70285df90 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/9f6ec4ad74ee1747dec061597d3994c084c7c33d |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/dad1e3876ab3c63c5cc5cdc02426cb8b4d1cb9c4 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0d16aa9f4ef2117dd17e5048ae577fde09ae7cde |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/26ead6d7e9eda633079841cfe05ec23edd79638d |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/851c7049525c9429b4113d0f18e2f344a5a93816 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d3c5cd86e8454ab206a825d5b59fea5dd65af4a9 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/a633e207e122d48d2cbff375470c3b5182efba8b |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/27a3e5dcdf7fc8aee777afe5233410a6321214cd |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5741f4acf7b348733ed186ea541c4c9b563dc1df |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/3e7df2ef73b9fb512ac610d77b2c5c05a0ca76ed |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/79fbc9be01ee4f1f01175f5bdc353796e9e813de |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/d811af6670de2cedbeca8e2a2baadc9c99414d74 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/4abdc84d02fe91b0ddd6bffbb6859fae26eec346 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9357b81f9a02315d5fd95123dda2b3a918685c7a |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/8ed7df6515021211fd97a7023bbc84c3bc42129b |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/4f6ae758c411f8c044f8ee3e48d19bcafa966cab |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/597de69e1c3b595a2f5ae62be75e9f58ebbfb630 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c19e08aa9f243fd299a650ca7d1c006f5de9e85d |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/865cdec5f21e71d0f18121d0a7b835de64af4f92 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/f2e5d8245c0c440824c97380f0e6191535572085 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/2533cd1aceb0f47ae1258cec4146af4109aee1d5 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/17ed33dd85753ffb36c35cb13750bc173f4c6a89 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4e198af465df258f48b5857a0faf40be2747d8f8 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/36c4cd063f490b6db61b92ff6d76c10e9032c824 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/37c9d8fcb4be3c8b3604d4e163c6320bcc24708e |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/31485d3eca03e6e90caf7222a859a402a46dbfda |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/1404a9c83b7a8e8517b1a9100d1d00825597177f |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/25bc6a714b05785ea0bed4c2c3ec726e6a8d25a7 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/2f4cec72e962e6c97f3a7086885fba626def5a04 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5ad81d9f76a967ce4a9048f2a7b9129417bfda9d |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b5b621872b0cef361ddf3669b5c57f3b9cabc32c |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5bace18b58545a629f3ea4a09dc7132ebae4eb8b |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/6df38c1c0b35c9c96d55dfa6aab45466d8176863 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/5d93f7a8b120f1e83c227e2578047762eab5c8e9 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3667f0e8a5b5b6f48cb258dca5d1724b9b734b8e |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/203805d3f18a1a3676769b58b190d67fb28b3057 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/19f6b8c50d4127f3aad124db492ce2d34b0dcd37 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a72a101646f1ace75fec363429cca2e8aea6c3df |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/867bd0e11758923eff7896851b9a931fd2845fdf |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/c9a673edb66fc6dd1f9fce80589e6e098ca2283f |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/75a9c7e97c0246975b6813d506a0ddd38a7db7c7 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/a9209c3daf3d54850fa18f10e48348d06ea0ea3c |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/985025ce84900fc3a943f01cdd8c1557d84196f7 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/d0ffc7ae94e74d7f7d0c9926bd1eebe921cb71b1 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/da459cef36fe1471508b0b5f03567d6ad2a1fc33 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/032f9b5ea8f3fe91c0098c634d601873779a3695 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/60b779c5f068fbdd9ab5659c1c168839930b7cf5 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/91e782ef73aaf523eab25ddc6e0227a075831505 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/4f1dd6f6a1cc8f169388d419c5038e453e3d6f2b |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/9223c1fa7eff68327fd9cfc0d2e678477e4f6676 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/c4e540484852278159e0a6240fc4b0bb7b8aebc6 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/743e644e592038ed5277250565e337d380ec281f |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/6b7ddba4517f43c190e6ee1c5124921aab4653d3 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/91d9c221c04d7b5c79780e6992a7a84e4391f5d7 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/a611051580e6ec6580f68bd66ae7464449e0019c |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/f6a7d89ec695a6017596fdf112006e96f5c713eb |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/54bb5dec93c0edcd73f08f6978e09b85baa91edc |     
  powerpc    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/12f64fb3b6b76ac3dc703bfe33a05cdcf76ccdfb | ORPH
   x86_64    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/ae6e055f7160129fb4f8949455bd72ea1decb4fa |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-m4-1.4.19 | 2 
            host-pkgconf-2.3.0 | 2 
                    flac-1.4.3 | 1 
                host-gperf-3.1 | 1 
                 linux-6.12.20 | 1 
              tinyssh-20240101 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/5488b2a6525fb9c71131c773db70030ab1899db3 |     
powerpc64le  |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/d954e7591c639d117c93823c061ae7e8804e67dc | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9c01f89907e4935f90131d83f37c308c95c0e3ae | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8a12e45d095b9b4ffab74322eeec042432e0af3c | ORPH
   s390x     |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/7cd2611c8a440b9c49a0848c9cf692c77beeb2f8 | ORPH
   mips64    |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/dbec5e04acb80146daf0cda21ca6fab87b0d1768 | ORPH
powerpc64le  |         linux-6.12.20          | NOK | https://autobuild.buildroot.org/results/bb2b5d3d4f70a2c5e1cddbd5a572c844ad4b8c20 | ORPH
    mips     |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/d61ee0b8482c05e632e1f137297b885c54ab6e32 |     


Gitlab CI results for 2025-05-02
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887215945  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216018  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216026  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216035  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216053  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216206  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216277  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216300  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216322  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216331  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216334  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216342  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216344  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216357  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216363  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216366  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216415  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216417  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216419  | ORPH 
           friendlyarm_nanopi_r3s | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216429  | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216493  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216567  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216587  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216595  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216614  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216617  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216698  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216712  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216720  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216722  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216737  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216738  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216740  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216742  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216743  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216744  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216745  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216747  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216748  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216757  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9899063747  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9899064264  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9899065003  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

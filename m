Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7366EFD0048
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 04:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3336419C7;
	Sun,  1 Mar 2026 04:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ua8yPFAhiaAH; Sun,  1 Mar 2026 04:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C193141A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772338952;
	bh=zO+NnqiAMUy3iAhgtA/80Ezp9tq3BFx2qrdyMQ3PuAY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Puj07IQ5wjBGQPrfSud1VLjZNE/ZMIEscNdPdcE4DCH42oZyEPcpATieN6FbCzVV1
	 F9mWfg1jfzmov7lS3+cqpV5p4UjD4Jf2gLThspGnFHI4yglfi/SygFRsLh922G0uTF
	 JT6ubJk2Z4dbR5bdgs4JnQJ/gV5GTnovo+d7tOHChcaj7jhievixY2mv9T/2TIva12
	 cL2KLX68syN1qagoFv6viSF6oY1Ycksa12kfmVXMfMKya6ahIGqTOUOSsrm5yAWV12
	 FfdQH/wFwEea0ZgzDQ1eYWq+Hs5RTQBIwV0PCPfaPZouYFuePIegFsmvrjQnB43ix3
	 dAP19LB4LrpGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C193141A74;
	Sun,  1 Mar 2026 04:22:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A0881EB
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 04:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B7FF41A74
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 04:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id an8Gj_yfHZ1Z for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 04:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33BA1419C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33BA1419C7
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33BA1419C7
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 04:22:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48069a48629so36589405e9.0
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 20:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772338948; x=1772943748;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmZ8lwcxUda6oTM8snJMBsUpt0s2WDmmRWtqE+SmJTE=;
 b=ftVBc6wUtRGzSToM0BVBioWX5c/Gc85e+JM8CaCKOPEcL3zhI1dqWUGieKCUErcZEF
 T/ds8HdkUGXj4fehSNHdpsRFdhZUJOB1jEGBW+kC+2InH5s4OkQAwfkIH7WRJ0ky9wzR
 9CJXZyNLzt+CgS6q+OEff5EU+icLjO3/kRrfgqqHWZiyVSUODHbWzyHtXINXHkdmfzvD
 7IOFwAsC3NvXmq3fQs8PMYxxqRWNMjhllA4MXo+gD+00wA3q2h7fs9Q8RXo1raiQZtk1
 Cd6yrcSlLjAdwMGl9cgLDS9jnQCCekuXdKSO5k78D8u1mM5cXf5gFuF7KFeVU/JxnCQ1
 G99g==
X-Gm-Message-State: AOJu0Yxokhu5k1aDzwVcPynHJfmtAsz+iSD9h9bij2Gob0WWK+ULGF+Q
 PbQfUK8JIl+YF5DFIBZuneq7uTNfJI/V46I/R7YEjsn3m0z+nbvVX/lZcmpSCQeH
X-Gm-Gg: ATEYQzySpOzbWbQM8r11dl0zUU9RRtvXJabaWLRK3xrjI5Qe49khZwQ9qUUjiNBT/AV
 eQxgxCgZ9bJ06nTvq+2AJ3fQFWugzorsw6CeNPbDNg/p4SY+9LqGu5jLXGvngoS63CMNj4yfe8s
 zbbwrghlHDs7CyZcg7l/7S8zSQm41XYsVsn1rSU8Or1H4UfgDKbYnlG/9l+TbTaXtI3jIb7+Er4
 C6GT2RJV7AaP2GDJtqh62mBS+uGYf6gjaRyQ9iRkC/tWkLerw5hZmc4H4fCb7Z0P1JXsnneFEp6
 XbeXQeLNdKCtob65Cqw2nhkdDUeXHEXhfbhAMFPjL2fiMwoZ1V+wF1fwHSeZRZG5TRR14yXbRvd
 /6cXgDXgbQlopIduNVg/Fd3iBi1XVY599cPkDXxmCCyyiG+0sFIgrXZQYyijL5/n/hjKE4piZY3
 rJmhXwqibAO2PZFfkbVt1gzeHEilEUK5rVdM7McBtA
X-Received: by 2002:a05:6000:2890:b0:436:18e5:48 with SMTP id
 ffacd0b85a97d-4399ddedd28mr14392337f8f.15.1772338947800; 
 Sat, 28 Feb 2026 20:22:27 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm16163799f8f.31.2026.02.28.20.22.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 20:22:27 -0800 (PST)
Message-ID: <69a3bf03.df0a0220.28ad7f.b7ef@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 01 Mar 2026 04:22:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772338948; x=1772943748; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=fmZ8lwcxUda6oTM8snJMBsUpt0s2WDmmRWtqE+SmJTE=;
 b=f5bD+bQmnd9us0Br8kwM1m3KG+DJBG8kujTgxtb5GEs58CBXM/gxmNeoMAOQpzFWeR
 GVEq2S++HvW0ctdYBpoFQhmiQJd9RzqzlknNODDp+DTwYwtuG2ASQtTCDHZBxg33tERp
 yRwoliK0SWI4YmXDPbSyquEAUZu6acBPMkPys2xjHpTcYkUygC+i3jL/AmfJgq7espfX
 SOF5rIo1YAMovVcZJWEmYc7GrEx1Fv0SBqSD+tzAIKekZBdawqUuXop4VBsOZ4kluU9q
 Y5HasbLXe+GPm2aLP8Q1eaqxcqUf7+Y80bbMcN5D9PDQJGRVJVevQY8NKz4ST70uRnO8
 8uvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=f5bD+bQm
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-28
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

Autobuild statistics for 2026-02-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  |  7  |  0  | 17  |
  2025.11.x  |  4  |  1  |  0  |  5  |
    master   | 37  | 47  |  1  | 85  |
     next    |  1  |  1  |  0  |  2  |

Classification of failures by reason for master
-----------------------------------------------

                   dante-1.4.4 | 2 
                    ficl-4.1.0 | 2 
              libopenssl-3.6.1 | 2 
                       unknown | 2 
ustream-ssl-5a81c108d20e247... | 2 
                  axel-2.17.14 | 1 
                 babeld-1.13.1 | 1 
                  cairo-1.18.4 | 1 
                    dpdk-25.11 | 1 
              e2fsprogs-1.47.3 | 1 
                elfutils-0.194 | 1 
              erlang-26.2.5.15 | 1 
                espflash-4.0.1 | 1 
                  ffmpeg-6.1.4 | 1 
              fftw-quad-3.3.10 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
    host-mender-artifact-4.2.0 | 1 
               host-runc-1.3.0 | 1 
                 host-rust-bin | 1 
            igd2-for-linux-2.2 | 1 
                  libbpf-1.6.2 | 1 
libdill-32d0e8b733416208e04... | 1 
                libgeos-3.14.1 | 1 
             libtorrent-0.15.3 | 1 
        ltp-testsuite-20250930 | 1 
          lttng-modules-2.14.3 | 1 
                 mdevd-0.1.6.5 | 1 
                    ne10-1.2.1 | 1 
             ntfs-3g-2022.10.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               openscap-1.3.12 | 1 
                openssh-10.2p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                     php-8.5.3 | 1 
               pistache-0.4.26 | 1 
         s6-linux-init-1.1.2.1 | 1 
                setserial-2.17 | 1 
           uboot-tools-2025.10 | 1 
uhttpd-15346de8d3ba42200249... | 1 
             util-linux-2.41.3 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          axel-2.17.14          | NOK | https://autobuild.buildroot.org/results/58f6d18e31c0b98eed91c36c4afae22b72785a8f |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/39e2cdb029587827da632e3e8c3da8dee193f1cd |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e9121430f2a6668f4599132b6813fc19ff265197 |     
 aarch64_be  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c3dd51c55ae41eb6ad67d17616cf2b2b220ec551 | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/88f3d59e1fc990802929fdc0af9cfa28d89bcab9 | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/22995ed9a2248fd87c64fef5ad54ddf9ab51cfe6 |     
powerpc64le  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/cb9c8d149f794cfcc80737cc94f24d8bb1387746 | ORPH
   xtensa    |         elfutils-0.194         | NOK | https://autobuild.buildroot.org/results/72dd0e79ad07a437ff5ef08fcef5311a6f937ca8 | ORPH
  powerpc    |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/4286fd5043879e44e78a7fc3a6422dcdb99b6f9e |     
  aarch64    |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/64b6c0dca1d80dadbcb042be46b01ce390ffe75c |     
    arc      |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/19c7ad3c76d4a6773219fc08b9735fb6b5362ddc |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/bd68a2f3239f234d6c2187cbac8aad8771b3b68c | ORPH
   xtensa    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/3e4f5bc0937c3e0f5453429c353b98f1f04a31fa |     
   mipsel    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/13d621d2c534f0eaf9b93a28a05c7ffe1abde932 |     
   mips64    |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/d4beed9c89287c7a4aa28478ef8a51941f4bd5bc |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d5f9138016ccc17ffe2e543d2d6fb27afa09d638 | ORPH
   armeb     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/946afe826e83b576fcd9e0fd0e5d75e2d278f986 | ORPH
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/f6a35656c0989922f25776bca4bdd2f9710db70e |     
   armeb     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/26e476205c39e03877d1114daa5fc410baddf73a |     
   s390x     |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/2de38c05cfa9a6f7e371bc51c98c8b166baef328 |     
    hppa     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2fc3a05e75316365283a9aef97bfd841806dd4a7 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/695a523c1f37130026ac2e6fb576a840b74e72c6 |     
    mips     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/56a8a9b3dd71cb5a1c6a5adb46d129468c3f297e |     
microblazeel |         libgeos-3.14.1         | NOK | https://autobuild.buildroot.org/results/32c1e4ca2d3b40656edaf21f08c79f5ee55ca51f |     
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/a87d903a98fa77927a6663b8499f5d879342c5d5 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/1c5381fe2d0667a268882a7e5c0cf59f8b959a54 | ORPH
  aarch64    |       libtorrent-0.15.3        | NOK | https://autobuild.buildroot.org/results/95f475e68f7fa9f7f89bad49a43ff2f9d44dd128 | ORPH
   s390x     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/70686006b673a9868ab547db18c99f0c1688bfeb |     
    m68k     |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/c96aef469d83f70a310cbb6eb9320cae0c5b5b0d |     
    arm      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/a2be1891b690001543961d5e4dab6d63e252ae79 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/72fa0e85cc4c0e6e96edde53db7074795608b365 |     
    hppa     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/96f94e7d015a10b0acc13f69b5ebaf62646da62a | ORPH
    i586     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/c0a39da1dfb4efb0bf10bf810892840abf643e57 |     
    mips     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/677022f93745d05c012783c4d04a1ce2d3c1565c |     
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/fb2bb9899474093e24b26d25b30a1dd11055797a | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/4158adaeddf5cd9b4b80fadee4bd350861065478 | ORPH
   mipsel    |           php-8.5.3            | NOK | https://autobuild.buildroot.org/results/ecb1fb82ee71ad9848f045603a90c16ed817c2ac |     
 microblaze  |        pistache-0.4.26         | NOK | https://autobuild.buildroot.org/results/05c54cb317bdaa081bf4d9d6593bfb041bbf5152 | ORPH
   sh4eb     |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/79e617369e43a29a6f383aeb9ec0d8f365dcc363 |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/2b1adc51f42e14a090b4c4ee879a5f834882e8cc | ORPH
  sparc64    |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/d7487366829177f064dbd9db5af15c8d611c903d | ORPH
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/dd20a5045f050342c0c8da6efc66edf6217dc156 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/606db7440f69f27dca0274c2af80a622ffa17918 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/b59a8e62ead63a3effc972bb459e87b9dfc648e1 |     
  riscv32    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/6fe5efac4a26d394a2adb7980c48f7fcfddd41a7 | ORPH
   xtensa    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/c0530b89bdc08dfde1bdc8944a8f1b84299e66bf | ORPH
  riscv32    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/fbc3310a56702fbdda827909a6c8fbe5f181567d |     
    arc      |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/21a047abe073a2557ea00a762dd13fa3a64ad433 | ORPH


Classification of failures by reason for next
---------------------------------------------

                bpftool-v7.5.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/ff4afe4e0e4ca9ef354dadc8cc0e5a6877c7d48a |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

               valgrind-3.26.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/05004f85f710651a25d753a61d47ae9d52d45730 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   perl-5.40.3 | 2 
              e2fsprogs-1.47.2 | 1 
 host-softether-4.30-9700-beta | 1 
              libopenssl-3.4.4 | 1 
               pulseaudio-17.0 | 1 
          python-tinyrpc-1.1.7 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/965e7266f35c0a866d530847815ef422b3bc1854 | ORPH
   mipsel    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/0967e78e68659eeb07d690330485d7aa1b6de624 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/74a4cd88cb5f72d3912e4a301ef3601c92ed5654 | ORPH
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/89987e72b250314db2a9458b7a2a2b77af6e3f1d |     
microblazeel |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/d15d119ce66a45baf2ca13cd003c3886aa875e14 |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1e6e66b0559477b4f67e0e30bf5244372a81ac09 | ORPH
  aarch64    |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/368bfa294175a511a51c3860201de0a77e9997b2 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

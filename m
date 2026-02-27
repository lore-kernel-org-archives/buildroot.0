Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5435EFD9E34
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 04:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6B11408BC;
	Fri, 27 Feb 2026 04:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxvbCdO9oA_8; Fri, 27 Feb 2026 04:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4887408BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772166256;
	bh=WQysS6ijQI6opz72YKeORBD2nduvH1+C+ViX4DHSjgw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bu0y3NwWa0gTQuWSi+/xy79+PwB8Sj3oNVXWA5YNYbTvQRgr6gFkBGaAGuZ//1w6g
	 +8kfsoT2r9E60piEl+pSXuPmDYBzL+GK43xFym0puvl+FQrKtbNYwGpw3VGxfLLf2o
	 3P0AdohzOnNwZ6jIHf+L3TGjz2Jdh6Lo91TJFGN77Admf50hIpI247fyBy/wZAbD6M
	 D5Lc9VMm9af3iuroRyKFNhx4MPIC4HmyOsUpLzQbhXhgTC6kCUF/Vr78ICXewA8B6x
	 Tp3UWC3IDBjmHBRo1T0L+whJZ8REgyE5C+4PEhiKKpi3oFRGPUfD4+LSWDpQEE3ow0
	 n0yiUbMU1PuaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4887408BD;
	Fri, 27 Feb 2026 04:24:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 014771F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 04:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E71DF8145D
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 04:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruQdf2tIzDRl for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 04:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F4A181459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F4A181459
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F4A181459
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 04:24:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso21290745e9.1
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772166252; x=1772771052;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPD3COEzxd19A+zKY60P8WdS9oScH3UMtoz+HkBIfvY=;
 b=iLmoOS+SwmWRLk5oVlgzZU9oxRuDNiULl8jmI5PsPz3rO9rtiOReaUhNf/qhysK2vS
 /rFP3m8ZCJpta+bBHIG0NGfs0axsbWN/Qxgpigx8XM5gwSO268SAWEKRl7zh1dsR5/Ue
 9t3GxMx9aygK5/3Jl1v0o0e7yVAEzAyHJ9YtVgtIdRy7KUkG/qh0ULyJGxAuBGbQoxV/
 ws6DA7Ye+6oYjRix0+1WSogscQm8W5QvF2VnoiNfzFGRWFYSy28aWzy8xKmGg18lEvtu
 HO7wV4GicOuym1DNLJEovykCXgOexERMpwLcbNf32dxhfFsKFZmCrqA266u99RqWGsEy
 NFxg==
X-Gm-Message-State: AOJu0Yxq8dEwifwc9q9CqudeKqDGZyW/L+P8HiQiDi56toOsjKR3CFAc
 r6boZ0L/Ddgy/xugGqXqgr+QDUiU7xhS5GZe/fsBgOKkrQ0uCiWkBp5DFO3uTGMK
X-Gm-Gg: ATEYQzz40PVyjt68wbDwr1RFP4SxRvPZt1O8vDPXS3kYHlwwyTmPHn24t1cZaFBdSDi
 G6XGl37qO1DGGyiwdACpZEWvcxAHnQAtFQpXiv5PB2HZzdrMvI8YEl+rmtgS3yGNOWqXdTjBgTY
 uwyyFTr0UVyRnrDj/0tVi47a8xpDoFjCyatNlGAiBc2yw4ZYDH0Hz/+4R+GVhsCEoWUWybY9/WK
 DpguSVcfs9GmsCpBdZkSwejijMw380sueZSM6xVv5tSv9qv1FcfhbIPqvFF44FxKMy3d+SWlAAd
 Snw15yFJHzG2yTyr5Njj0eOg6K15dider6IjcmfpbiMSV5WXnRCaykr62s2GZmi5RRKs3NgMgyi
 IeKOn+Q6TGCpLG7dqMGETb7/a7z1sixjp8IMz6xVQe48kSObQCXgdDjnaw3plp73HbMVfmJNNnU
 MUFEayFsAr1jhIzBc/U5A4cUKXN3j/BeQ9Ey6z8qKO
X-Received: by 2002:a05:600c:8106:b0:477:7bca:8b34 with SMTP id
 5b1f17b1804b1-483c9bb7bc6mr16289615e9.6.1772166252026; 
 Thu, 26 Feb 2026 20:24:12 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd70e6c9sm156355485e9.8.2026.02.26.20.24.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 20:24:11 -0800 (PST)
Message-ID: <69a11c6b.050a0220.2150fb.887e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 27 Feb 2026 04:24:11 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772166252; x=1772771052; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zPD3COEzxd19A+zKY60P8WdS9oScH3UMtoz+HkBIfvY=;
 b=bS5EcAwgtNfVaGMumDHmHgcF1wMO3B5rZtt/qjdQ7KOJHfBZAj8VaQSbGt90HWclop
 pRREt5T1BOjAphbV4k5DpI480l0YZbD30K6EJUQFm8tnhq692XHfnPYglvNqjl9MzLpr
 sZOKOw251OJZgYj9OQB1Q4nWYhpa5+8OpXmesfnfF2/UIF8OkfV3TvTJ1JjQSG2a2GH6
 Z7p7AS2YzKc4CFwC4KUAmoqYKd51ZPleCzpoLaVhNK6yv02UGeg7eATyJsNt12To+y73
 u/3LMvi/f4v7N36DK9uHxBf07lqr0jwxK3gB1t54jetJd/MAXOlw5pJw7NpnihSDtanC
 A+Bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bS5EcAwg
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-26
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

Autobuild statistics for 2026-02-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  3  |  0  |  4  |
  2025.11.x  |  1  |  1  |  1  |  3  |
    master   | 40  | 69  |  1  | 110 |
     next    |  1  |  2  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

              libopenssl-3.6.1 | 4 
     libphidget-2.1.9.20190409 | 3 
               linux-pam-1.6.1 | 3 
                       unknown | 3 
cegui-e7a03afc70c6182a091ff... | 2 
                    fcft-3.3.2 | 2 
  gobject-introspection-1.84.0 | 2 
    host-mender-artifact-4.2.0 | 2 
            igd2-for-linux-2.2 | 2 
                  iozone-3.508 | 2 
               libglib2-2.86.2 | 2 
               openscap-1.3.12 | 2 
                   perl-5.42.0 | 2 
ustream-ssl-5a81c108d20e247... | 2 
             util-linux-2.41.3 | 2 
           at-spi2-core-2.58.2 | 1 
                   atop-2.12.1 | 1 
                  broot-1.55.0 | 1 
                  cairo-1.18.4 | 1 
                coreutils-9.10 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
              e2fsprogs-1.47.3 | 1 
                  ffmpeg-6.1.4 | 1 
                    ficl-4.1.0 | 1 
                      fio-3.41 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                        gnutls | 1 
       host-gcc-initial-13.4.0 | 1 
                 host-gdb-14.2 | 1 
                   i2pd-2.59.0 | 1 
                  janet-1.40.1 | 1 
                jemalloc-5.3.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
              libmodbus-3.1.11 | 1 
            libunistring-1.4.2 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
        ltp-testsuite-20250930 | 1 
                 mdevd-0.1.6.5 | 1 
                 rtl_433-25.02 | 1 
                   rubix-1.0.6 | 1 
              sdl2_mixer-2.6.3 | 1 
             stress-ng-0.20.00 | 1 
               tipidee-0.0.5.1 | 1 
toolchain-external-bootlin-... | 1 
uhttpd-15346de8d3ba42200249... | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/dfc05162a6b85a24a32e11eff86110a71f7ccfc8 |     
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/da0ad37db402240671a62435872b25348e50ad55 |     
    i686     |          broot-1.55.0          | NOK | https://autobuild.buildroot.org/results/22067549235ab15caac34158846d6247e0900e23 |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/8f5f3d695cf946230e4219047a1fd21adaf4b1fd |     
   x86_64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/3fc2d4b03b5278e93af39d31c4d39b33787878eb | ORPH
    or1k     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/7738cfa93c64af65bc4d3977b5524fca05430a3f | ORPH
   sh4eb     |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/1a672eaacc5ff3a75e80ffcde522680e9a448144 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4a2dfc1612472fa4002ac9b85d346d1b408abd5f | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c7d7b7dd2835f7aef8a92880a30d25dbdbd36c40 | ORPH
    or1k     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/d385ce84f85a8e0c192b8a7145bf878d28d4f64d | ORPH
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/8b09cb614cf02a078cd9dfeff7dc959e37a92721 | ORPH
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/b2310ad5df5bfceae814ad606135f710f482ea2e | ORPH
   s390x     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/6bef664e4eb258b45f9d5595be5da84610217068 |     
   mipsel    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/4cda196a5b891c39fb5e7c14a5e30a37df7d8e9e |     
 aarch64_be  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/da4271fa6c039990620046aefe422f3de2dea4b8 |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d6c8891e0ebbf0d22cac3f611f5d376f2e106818 | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/0768a9cce7d4c052e60d41222af2b73a47dddf7b |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/f5482f2a0380999de3d13ea6608579189d622019 |     
powerpc64le  |             gnutls             | TIM | https://autobuild.buildroot.org/results/453edd0352cc42e74d3b563d5a9db093f5d58b67 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/79262610e2b72ea923d0ce7db0e1b877d1455b1d | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/35eb7c350dff82ce400a6cbe942d40316b81af49 | ORPH
 aarch64_be  |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/0957a7c0cf9cc76137e531c49f9f23b655a6bd6b |     
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/604c602cbe6b6eccc7f7962b30b744e297bdea67 | ORPH
  riscv64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/15b2d71aca697d4a4e886d9767b8fd107feffeb5 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/95f6f9f9be9cf8345353b62d206d9d545ab7a7e6 |     
 microblaze  |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/e46c9dd185a2c4bb5e7b6aa795ae867c32c33f7a |     
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/33891aad717b1e959b20fa18235e37002cbdc33c |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2393d0fe9a1a943b2985b9495f0683a9bb9ebd9f |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/359d38ca0687ebda40ae2c9b730408916d933bac |     
   mipsel    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/40fa409af162c334bff4f5d3ff9b361f95916acb |     
   xtensa    |          janet-1.40.1          | NOK | https://autobuild.buildroot.org/results/d021c08be32014c3c75bcb95b32ea060406f5af3 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/5da1bd0044248d4613e6e218668a603579d63b2d |     
   x86_64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/91dfcc8972523f3b3f54f797f950602de59b5c5f |     
    m68k     |        libglib2-2.86.2         | NOK | https://autobuild.buildroot.org/results/4c33d886a96b6fc25437ceb999c7aec0668923f1 |     
    m68k     |        libglib2-2.86.2         | NOK | https://autobuild.buildroot.org/results/a94ccdc10514e041f76d7a7c3ddfcf1e9487b781 |     
   sparc     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/b9b4520f915856279868707a6e83af2669bec473 |     
    arc      |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/fce81bff266645ca6dba1733725cf03ea8ecbca4 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/662dbdf5ec0417359b89ff5feddf5db81c94de67 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/bffb112bfbf565984bbc832f491316a9fd67ded5 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/c0873f0e82eeaed7415d5d9302b557d223692a90 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/49f31c1250d4f39b17c68bc7eeac0a5e636fbf74 |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/fa2080343a1b3fe4bc1dd32c3b5b2c2035dd3505 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/57367551c1db2c268e669e3529a8bd64e89c2d0c |     
    or1k     |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/8f7931bcb09341996d597a1d6d62773b6062b77d |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/62cde8242546d9541caff929e226b20e741fdaba | ORPH
   mips64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/65411ff319d86ee894a05bb7ea2c68f5bd1d8f45 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6ed06b3a36bd8df74802b93fd1a23f053c2d0c63 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c8a552630a13b9dbe4d4971d3ba31d0d8a342f8d | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ed76aa4e7007a984940406dc41d8d73c1e3c2a86 | ORPH
    i686     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/0a86b2eb18968298623d461f23ed7b8f0e043c91 |     
    arm      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/92248724444bb82661c6409048c7bbf9f82e5b6d |     
powerpc64le  |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/d6c344a01bc1c68eefacd75e855e453fbce46bd5 |     
   armeb     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/c08a8198a0c804a8f7ca437ef37226f423b87c51 |     
  aarch64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/7498eba8555e6d3bd3be18ec3dda5caa563f695e |     
   mipsel    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/8b17230689072b4c240347f86df98ff5e195d0ba |     
 powerpc64   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/7dd2e913200b4c673ce85bf89da2d62807dae89f |     
microblazeel |          rubix-1.0.6           | NOK | https://autobuild.buildroot.org/results/3e78f477366f895cbdad3aaa9a091c29494c7dd9 | ORPH
    arm      |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/2cd120caeb0f3f761d5f5cf6c483ff13e9eb25a6 | ORPH
   s390x     |       stress-ng-0.20.00        | NOK | https://autobuild.buildroot.org/results/e3bfcb4093e6c81c5d25fa88592244d041e497e6 |     
   s390x     |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/3889b2307a761400989c9a2d7e53c979d1c4f3c5 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/714da4582f20e693fb9a542aade4c058f1fa8e24 | ORPH
   xtensa    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/334e81ce9fd774c7ddb02522ead0b9ba2dfd3e22 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/7f85d1f63d54ed31099fdc0243d1fbb16dbd19c2 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/44355255b17871e6cf09777a6550fb6fedf43f7c |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/cc43681fed53d92a794d00db066c40ca1611042e |     
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d3298e55c3022023a248336650dde96529ae0e94 | ORPH
    or1k     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/f00b7d2c20d17e4e896af50df5b028d199a419c8 | ORPH
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/1c09bbf3a4dd237e88a3121ca86301c241893c8e |     
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/bda4eecacaf80ec4a74d119897955d0e1ee1b76a |     
   s390x     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/72dcaee817e2dfa1c7aa2a452595454da5452c0f |     


Classification of failures by reason for next
---------------------------------------------

                  assimp-6.0.2 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |          assimp-6.0.2          | NOK | https://autobuild.buildroot.org/results/29aab8f66db63b2a9d1f061c42d1709eda0980e3 | ORPH
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/1e2ac0aa33c2d48a581cecf2a32fe29a7c4432ba |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                        gnutls | 1 
                wlroots-0.19.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |             gnutls             | TIM | https://autobuild.buildroot.org/results/a3c36b3770f93b9de8abc8c62d96a35ab64adad0 |     
    arm      |         wlroots-0.19.0         | NOK | https://autobuild.buildroot.org/results/a7d42d6877484eb0c2b8e44b22f04120c918a51b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  ffmpeg-6.1.3 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                   perl-5.40.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/638551da115eb585036c3b7b4111b9fd54f9a5c1 |     
    i686     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/b0bbf5bed3255449ffdeae62c7884419d107684b |     
microblazeel |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/cfc757222581ba6370122d25f00d8ffcade50ca9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

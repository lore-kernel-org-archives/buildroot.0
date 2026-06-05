Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40971CD6E75
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 03:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9512D607CC;
	Fri,  5 Jun 2026 03:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRqVYBhe12Nj; Fri,  5 Jun 2026 03:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF767607C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780629507;
	bh=jrr1b0PF5y05s+DmF9oWB6yMm8JKqY6iMwZduLXC9Eg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nJftGYzvnPN5W2iTYcGpGGd+N28+TLv1vbEJKEEA8jYSfeRBiRMvzh2cqn9AUfOTr
	 iCuhzKx19tYF/T/jh7kJchNRtBA7Ijpkmtyo63hVCL7flb3GrelZrALhj/qb4dF6Zu
	 fPx32a7JmXN7zCYD1djq1SVJj4ZtApMQzs8iTt8LgQ7eCQy8473N3ooBgVM7pl4JSV
	 bUbQMAsgNaY3ZQL4UKWPkpYp2IeWjyD7WLw5LpTY3FHpiV4zm03tfjiwSz/2gFbey9
	 1e7yw/wCenPL1OZbLSwnwm0YleiMM+v4cXjId+bWzwfMkzER4yh5qIfLUdCFk1n30F
	 002xhJDFYsPaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF767607C0;
	Fri,  5 Jun 2026 03:18:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA8B1F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 03:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E893C607C0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 03:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azlIDVCdVlch for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 03:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3198E607BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3198E607BE
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3198E607BE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 03:18:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so11196495e9.1
 for <buildroot@buildroot.org>; Thu, 04 Jun 2026 20:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780629501; x=1781234301;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWMmkg5pE8GfM/UR7/JJ/mt0PBFxMSKDBhj7z6I4JmM=;
 b=NhwY+7wfTYFzHYsS2vh0ni1lONvZjrqEU7mhu9cVSgVI7+t4LHjXtZOAVHLyLA+o1e
 6K1gWssYox38UWHSrG4dozupc9MTrspQ2VOM3B06uKZfkSwlOkS5VQqg5QImapwFhmfZ
 lp7xKtpPS2vNCwJDu+43irppdRVz4oRO+tiA+0BCZff37uVO/eXVycyo5XBM3Zj5Xv93
 lIuMyJAv1G4SzIyJ0Ovj0/Rl1R2A6d/1I0cm0oqMg9Moay7BKLkdYLYd9tsR8+HrDT4k
 APhyQbINrGRnRteU80oAtcivo8gGtFwcxd2B7+qR6MqNUY/hMyQ3TVumG5pfW+RHbQfU
 4n5A==
X-Gm-Message-State: AOJu0Yw6upS+OTMM1XrkSoNpU1XTK5ZPrmmG8Ac7m88BYqHj08MapWV7
 OUr0hVbtsHmvRzluk7l58++xMcLzA5n6GjoCjx1v1rOxqVw1fYI4uCdn2yaXErBQ
X-Gm-Gg: Acq92OG8O/GRn+rwpcaPUtNLiXRuLW1WlCSHxtrpIh5r5oUOUNsgYIcMB1bKw0bi4Au
 0DaMBZDDCvvichn6P3VsiYdrCJECqiZv/OFsuRVdMg2Ca+urb+XWrat2y1Y3AQ12LcdoNYGlC0u
 ZDYkmMzXcZyuFJ2MCdHOoaGXQYvxwhjwAXa9tbW/gYr2s2ZAzrOVfbZm1yX4zSXa/Gyu1be3APp
 y5mgdc2bTm6R/OJDFKnvKNU7ADqOaWjg9VAezHk3tsE8AL38bpWzt/sonFV9gkJZqKME1isC4Fu
 c6QYIJFIdo1kgsB4u6PEk4mndQWFNd1HoWFPh/Mifz+p7V7VP8CqUpbOTxwGMyt8nRYPo0W4Bx9
 0g8vmMmLjcIkv8/VJtROuERvlF4ph/NgRKc48qS7YYq6WlGZWkEdL9Dc2XrtqtkI1IGVWSnnB91
 USebbk/n/EvDE1WhDux/1NF/hzCtNZYgX74cmz
X-Received: by 2002:a05:600c:1986:b0:489:32b:ac0b with SMTP id
 5b1f17b1804b1-490c2cc27bdmr9271445e9.6.1780629500671; 
 Thu, 04 Jun 2026 20:18:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc391aaasm138006895e9.1.2026.06.04.20.18.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 20:18:20 -0700 (PDT)
Message-ID: <6a223ffc.a05553f2.14c34d.d46f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 05 Jun 2026 03:18:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780629501; x=1781234301; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xWMmkg5pE8GfM/UR7/JJ/mt0PBFxMSKDBhj7z6I4JmM=;
 b=BgbmAH0mt/suy1imwMo44L+wwFiPryM4amK26lRqYJcAH0w6P2N0UA6UCwnyZLXNku
 wVXqcx0aiMnAon7afvwZr1+ttcNTM8w4sv9QRdosQtO0npab1cJnWyXqiEbeR+qKT4s2
 W5LEJtsmoL+Ynt0o2FX9hrvxpnMxWg3mdiOih5nHAPrRg6mASAgmHT7syMik5urWZ6Jw
 tOHaX+vPp1HTymVBb2JLAl694Z9VDNzH3UD4AUrB/jEoVaGKtKhy71/ytSP7VLtVbmS4
 quqWrgeatTW+6XG/oianafYzTTxt6jxBbbyEn74Nj+o49uqMlCXTGyTYSloaj/HeSHaX
 3C4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BgbmAH0m
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-04
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

Autobuild statistics for 2026-06-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 12  | 26  |  0  | 38  |
  2026.02.x  |  7  |  9  |  0  | 16  |
    master   | 49  | 89  |  0  | 138 |

Classification of failures by reason for master
-----------------------------------------------

                   perl-5.42.2 | 4 
             dahdi-linux-3.3.0 | 3 
  gobject-introspection-1.84.0 | 3 
              libopenssl-3.6.2 | 3 
                  linux-7.0.11 | 3 
                       unknown | 3 
                   dante-1.4.4 | 2 
             docker-cli-28.3.3 | 2 
        edk2-edk2-stable202602 | 2 
              erlang-26.2.5.15 | 2 
            host-go-src-1.26.3 | 2 
              host-rust-1.96.0 | 2 
                   oatpp-1.3.1 | 2 
                openssh-10.3p1 | 2 
python-remi-2022.7.27-37-g1... | 2 
                     shim-16.1 | 2 
uhttpd-15346de8d3ba42200249... | 2 
             alsa-lib-1.2.15.3 | 1 
amazon-ecr-credential-helpe... | 1 
                apparmor-4.1.1 | 1 
                  bcusdk-0.0.5 | 1 
                  cairo-1.18.4 | 1 
          cloudflared-2025.8.1 | 1 
      docker-cli-buildx-0.25.0 | 1 
              findutils-4.10.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
              fluent-bit-4.2.0 | 1 
                    gawk-5.4.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
               gocryptfs-2.3.2 | 1 
               graphene-1.10.8 | 1 
                   guile-3.0.9 | 1 
                     gzip-1.14 | 1 
                haveged-1.9.21 | 1 
host-am335x-pru-package-5f3... | 1 
    host-mender-artifact-4.2.0 | 1 
          host-xfsprogs-6.19.0 | 1 
   host-xutil_makedepend-1.0.9 | 1 
                ipmiutil-3.1.9 | 1 
                 lcdproc-0.5.9 | 1 
                 libavif-1.4.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                   libidn-1.43 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260130 | 1 
            minizip-zlib-1.3.1 | 1 
                nftables-1.1.4 | 1 
                  nginx-1.30.2 | 1 
                  ntp-4.2.8p18 | 1 
                    olsr-0.9.8 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
            python-iwlib-1.7.0 | 1 
                 rtl_433-25.02 | 1 
                 rtptools-1.22 | 1 
           sane-backends-1.1.1 | 1 
                 shadow-4.18.0 | 1 
              tailscale-1.78.1 | 1 
trinity-v1.9-82-g294c465226... | 1 
           uboot-tools-2026.04 | 1 
uclibc-ng-test-132c6134d691... | 1 
               valgrind-3.26.0 | 1 
                 xenomai-3.2.5 | 1 
      xutil_util-macros-1.20.2 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.15.3        | NOK | https://autobuild.buildroot.org/results/4fdf4d5859e2ed9ca9ae05398a1df49739944efa |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8c8ab797126a5d17e8b0d30b5045f8ea6aaa8810 | ORPH
  powerpc    |         apparmor-4.1.1         | NOK | https://autobuild.buildroot.org/results/ae97fda24cba706261a23e6047299564b77ded00 |     
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/2a0bfa71919febe2075f64fd704883be3509f641 |     
    i686     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/03705fc835e6d9ae9745a2485c56601f3459a090 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/57c7a92eac5d640a38358cfb98bce390d89bd868 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2a1e602be3842a575fe2bea7318b05405aeedb1d | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/94d516ca90c5a381c8788445b6e021ae4b9d1690 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4bfe66ba1c6d33f9376cdeb183b6c607f0bfd6d1 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c3b51d88bc19a1bfec088865f750f79dde7e56c2 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3823c0ef3d541370b99555ae82484dba5a8e5609 | ORPH
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/129f8e76d614696c14d958d58e642acf76bb7c9c |     
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/bf015f2961683795e41342eb27d0408e1fb6f819 |     
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/e7d93499faaeb5fc6655305235551c041a13aa5c | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/49c21f0f958c4c56ee15234f6c45a300647b0991 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b759239f041f76a89ed47ce84b78fc6baffbee78 |     
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/3435295b8cb7952088ba1a733aaa394bf4a80545 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/6056b97bc3a680f69f4ed3347193be1f5740b370 |     
    arm      |        findutils-4.10.0        | NOK | https://autobuild.buildroot.org/results/80e5ea7791d87928a5dcdc3349e7cb32a89053c5 | ORPH
 aarch64_be  | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/2cf82ee4cc75c1dd6d010862f542b608222eeb5e |     
   mips64    |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/7382fa4c8d947e0327b07c48df63e604cc167ab8 |     
  riscv64    |           gawk-5.4.0           | NOK | https://autobuild.buildroot.org/results/f1633314862206faad133af471d8e00e9017c512 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d2fa6fb51bb062848e930eb8101266f64c60fc05 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/52c2cd6297f9fd62c1a8d48110ea762f6d83ceff | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3abf1021953b7e9ea5520164cb3731ea50d72737 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/22ce1af6bc22eeb06e524d2a8b3a0e1f80b49976 | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/6f46123a5f786e222080e99ed4ec9e2a692cdde5 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/a3fd97717d8827efa73b6d5b5905768b7f03edb5 | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/e198ff65a632f046cb2b1b1657c89a75d098b00e |     
    i586     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/7bd39172f2b705bac59cf6972b50181131a50284 | ORPH
   mips64    |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/daeb1d2ce605abbf97df7462db47571d5c82342e |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a28bc9574250379f51e512a820de6f5f30fdbe9a |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/b71819c1b26eb18d74b73fff89212815f4921f3a |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/4ca58cbe59c309c384eccdee495b6d324ecae8c5 |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/f61121ec4f29ea3ee2fd780a545be62b18aae73e |     
   x86_64    |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/3324d160b03147d6b64e59ce29cc20304c98ab44 |     
   armeb     |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/eba59c9eae893b8e9b987d549accac302ee259da |     
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/4bd13dde5334ea040ee6ed61e9b2946b190c5769 | ORPH
    i686     |  host-xutil_makedepend-1.0.9   | NOK | https://autobuild.buildroot.org/results/83e6642a45ca0b60cb35a352608193e3f0e8cb4c | ORPH
    i686     |         ipmiutil-3.1.9         | NOK | https://autobuild.buildroot.org/results/f7148744d7f8468e36abc3edf3fdf797ec492121 | ORPH
microblazeel |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/989527de8ccae7c02f73f885ab286d25c427c879 | ORPH
   xtensa    |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/4ef39d34f4174299f137c0fd89d1b3c4f9c81414 |     
    arm      | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/f5212f8f886c3208aca2099e2f7c633cdde650dc | ORPH
    i686     |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/e2f0e00614b255b8834e0b369e2aa79ac934bd15 |     
    arc      |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/98c1c7ec02f8d408aedfbf8b53e46c5ab590d64c | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/729395ddf975617e1d0068812f910d77097b22ea | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/d13860373c83f7d009d993e62c09407476d5ae82 | ORPH
loongarch64  |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/5f4b339ea28a743ee84b31383ba5b325c568933c | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/cf7ae05d512972f1edd6144cc497a1d18d620ae1 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/73f83dd25a87b64cc545be3a5a99a3398f640aab | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/908100b21c7811a8cf7ace29f41375021a55ee47 | ORPH
    i686     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/f713dd55b831b90749a41a37771b6da8415d5af2 |     
microblazeel |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/a5fb6ca8b9c793f2f7b5d5fd61cdd47c0a238f64 |     
    m68k     |         nftables-1.1.4         | NOK | https://autobuild.buildroot.org/results/287fe7a916c7e59b8d1906df6f03f7f2d8c126d0 |     
   sparc     |          nginx-1.30.2          | NOK | https://autobuild.buildroot.org/results/9ade908e55d33f2075a3e8147562bbf9ab78916d | ORPH
   mips64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/da66b3f218014f63746c1dffc1e8989c24edd978 |     
 microblaze  |          oatpp-1.3.1           | NOK | https://autobuild.buildroot.org/results/13974f5f91f3d1a975b81e8bd344099698084110 |     
    i686     |          oatpp-1.3.1           | NOK | https://autobuild.buildroot.org/results/2b52381dce75fa0109ea02e0affb80db55e581dd |     
   x86_64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/ff981b6bbe7b860820a8bdcd824a90e769b3843b | ORPH
    mips     |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/3a4faa30aff91b2465598c0539a9c08c92083ba2 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/95512d89ada88f8227cc17ea6e17d5d035df876b | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/ce01d659aa851ee502963acf885320e2b18e298a |     
   armeb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/a8092476d12b6d9011788aaf815a100fb3ea15f8 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e12efe55ac707ae1433078ac48e9f34e702f07f9 |     
    arc      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8b716b949b2e4064467495ae5011177090a473c5 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/6f558a9b5d6a358cf30746956bd3800ce764216b |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f6d6f077f8470f5963cbfab072f4805c5139720d |     
    i686     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/c6ec1068a087f0f2bbb8ad9f8a1f493cd919db15 |     
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/a4b2c56982d0138cdb741599adc2ceecc7097225 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f05aca83c80a75d1d63448dd3bd8e3a8f5e2ee58 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/67fd31055f33422e87e57e5dc32e9b1eda330303 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/4f6463d2cc05d9f4bb804bff8fe550e41a536e1d | ORPH
   mipsel    |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/ed2252823225ff4dd0ae4cf09a67b472e833f55b |     
  aarch64    |         shadow-4.18.0          | NOK | https://autobuild.buildroot.org/results/90ff13ff4c519b0606888eaa90acbd8cd0c0f73a |     
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/2b87fafa3e300382b381dbfa7d8c0bc146e8a8fe |     
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/d62657243ba0d877f5223bb0fe595068e3db79b7 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/22cd5dba680c45f263edd1ed3fca3ba012538b80 |     
   x86_64    | trinity-v1.9-82-g294c465226... | NOK | https://autobuild.buildroot.org/results/cb9b137c51b99564a2a55b76a3710dfb90897bd0 | ORPH
 powerpc64   |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/1b23236a546953761d561bf61c3c8e47085a4ea3 | ORPH
    i586     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/a6a41545fd6c40945edf45fac2002b35f00eb564 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/8294dabaad70f49c3fa0b7beedb63a61c467bd9d | ORPH
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/d9b7bf64887cfbe913e19b3e2714c8d934d77896 | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/61a17e3282ca0d21934ca738112aa25b35bd0154 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/8535c18a2a1857229b4bd243f988969ff268337b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/56aa21b841380a32bb73708a0bb853dbce27b14b |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/08778483767700b41c64d6fd9ebdf2510f6a8a85 | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/f420ecda8b9e3f8444bf5c76ea382d63d98fbdaa |     
    i686     |    xutil_util-macros-1.20.2    | NOK | https://autobuild.buildroot.org/results/bb062d6a399c73911b581d3e21fc58cba93ad753 | ORPH
    i686     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/64d52f1ad086983efd3f2a98ad7264b64094b0a2 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

cegui-e7a03afc70c6182a091ff... | 1 
  distribution-registry-v3.0.0 | 1 
  gobject-introspection-1.84.0 | 1 
             igt-gpu-tools-2.3 | 1 
                       mrp-1.2 | 1 
                     php-8.5.6 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
             util-linux-2.41.4 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/fd0d217527f3c73839eb8a680576860a4956da41 |     
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/ba8b10e47cc96140fc1238550300388beaf17d47 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e47752066cae3e4abe08a82fcc187c6d06173785 | ORPH
    i686     |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/eee7f0d87e1aebb733f34ad26fb84516449869be |     
    i686     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/aa6a1af97c03d9bea611b0893c9de9fad8721b47 |     
powerpc64le  |           php-8.5.6            | NOK | https://autobuild.buildroot.org/results/e3f03eaccba2e05357280a95799311838369ca1a |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8e6640eddebbf5e9d7745584ca07b7bc312b19dd |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1c59e745b7f9ef7dbeca1886564d0fbd3dfc3d69 |     
    i686     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/d2153163bdc558b5c6e7e51159c1e3eac56c1bc2 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 4 
            18xx-ti-utils-R8.8 | 2 
        host-python-lxml-5.3.0 | 2 
                memtest86-7.20 | 2 
package/linux-headers/linux... | 2 
                 pixman-0.44.2 | 2 
                       unknown | 2 
               collectd-5.12.0 | 1 
                   exim-4.99.2 | 1 
host-netsurf-buildsystem-75... | 1 
              libmodbus-3.1.11 | 1 
                  liburing-2.6 | 1 
           oath-toolkit-2.6.12 | 1 
                   perl-5.40.4 | 1 
              skalibs-2.14.2.0 | 1 
             strongswan-5.9.14 | 1 
ti-sgx-um-909e237baf47d0bde... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/e03918fdd40b507d5ff9a69e6adec5ff83f0f333 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/3cb76d0bd67dc81f07d3fdc0e2196e4a01d19149 |     
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/2e927cab8e3ddfdd6dfac8b778366a0e2792ff33 | ORPH
   xtensa    |          exim-4.99.2           | NOK | https://autobuild.buildroot.org/results/503c7e4e36e479f41f3f0a1e6add1a298481981c |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e81b15197193a243395f3acfb523c171b3e4514e | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/18726db6794c5750cf1ce9759ffe8ad94b2f3d03 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/6f32fcc912463e6fc12ecb9d91a081e54505e7e2 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/bdb7b17b60a550dbdbb486472458d7482b00940a | ORPH
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/90d9c64fb413432ae24778b1b1b18dfd8e4bae23 | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/f874aca82469c800adb593c9f6882abb7bb8ab16 |     
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/a1c4113396bdcc0861aa843126f8ee255b47c98b |     
   mipsel    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/ecf0e163a15d908cd18f58e8eaaf6bdaf7a96e56 |     
    i686     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/a461781a1419210cbc7d135a1aec9bacb646dfaa |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/4c9ecbfd5ece5bbaba5f5187410922375dce8e67 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/6feefc248464523cd2957c06e1a160c69de78051 |     
    i586     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/478b3361f31b30e1da9d8be05b4c779f439fcbd5 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/8e559cfa2fb613f8ae76000dbf76354b62c12cff |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/98e27b905e046be3b2d19b8325cdc049b9690a5c |     
    i686     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/a5c514d2f07c6139e866ebed0471941446cba454 |     
    i586     |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/8f6bc6f790df037f2a72a93d0bbbe977cf8ae84b | ORPH
    i686     |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/351d608dfce03e7a59721a6789ab0d2ccd9d6dca | ORPH
    i686     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/cc4cd0fd0670e32b90616b4d17defc5ff7d46d3b |     
    i686     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/8b07d264489137a47989f76ea9fcb2b8b175924a |     
    arm      | ti-sgx-um-909e237baf47d0bde... | NOK | https://autobuild.buildroot.org/results/1a4f6688fdf649b8b6354820fc5cbb8edd167451 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/14d2784d7ae0188ed85b3556b582fb4be2b7ada7 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9870c6f9e960dac978bb2db998b3296f8a5fb3af |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

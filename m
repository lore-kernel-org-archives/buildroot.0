Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBB7CDE008
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 03:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C6AA40E9E;
	Fri, 26 Jun 2026 03:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GELAE0_7gMH; Fri, 26 Jun 2026 03:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28A140E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782444155;
	bh=jLjjmDsMDhcforwx/cdSx18lMEV39keNrA8zUaWQohc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U4RyV74tb1VBxajcTMMvc1rVGKV4TLviNOc+xleZhRim2zXhOHqgwU5H04GIz+aAM
	 z6KKErButjFo/t1GKt5EEWvdMX+/0pyFxANK7jvLe56FLCVOkqh6MEn8wQ6Z6BabXn
	 B+c1RJaPOK6+squzI2+FbY/yUxPOi1ygOZRlCQGwv6N+XApbEXufF58QgfEEv6Gp9C
	 rKYp/4hcB72NMiXKMangAF1VXj5ARRc7f9MJi57kw6ZieYpjqEZK4R6xqgrxKgeyUj
	 BHWeMvrLNPNBaAbIsEKgSy4MynkdYhcszRz4Agn/wZJNx/GeYNJMMEPSaFUVcH9R/f
	 6hcNy7AJfCWmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28A140E9F;
	Fri, 26 Jun 2026 03:22:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35FCA3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 03:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23D3F4008A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 03:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeHmMBMH_SpP for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 03:22:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C64CE40099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C64CE40099
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C64CE40099
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 03:22:32 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-46f098551bfso91357f8f.2
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 20:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782444150; x=1783048950;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w197cWGewWAQZx1q+AwFL+c9YwxwerTJcXTiZHWPZ5M=;
 b=Y0bkqp+3G/MWv5loYh+b3eGoHCrl0WXpvR7fl87K/fimZFBJRZ01Dy7GWrIIEdkSi3
 rCq5ELRpQEjOeV2qpsD7v4nTIeuHt0x0TG3wp5HodBzkn36Nk6AsTBZiTOAol50MoA+W
 9hEkLL7o4fqtR27y//Zobi5M4+x5DIfz8E/QrJUR9TTnmjW3oOEcIE6U7hrCM9TSBBlr
 PQ0UWLwOus6U1Iz9fiwEMbKiDa8hjZ4YYZF0IeEYFvsCHZTqOQ+gRd5t5PbX28kVD8WB
 AwhCUYh2VsSsUIhThyXEw3zevnoxNnaVvRhJL6LGyP+tQldd2eQbzV6BL/UH38apEvue
 n5Rg==
X-Gm-Message-State: AOJu0YzIWJKztRb4mykCIih+z8/gsO3BzBEXttNt0EPeFW7HTu7OPNgK
 T8HU7+HmRe5lCDwNgzWaT7947cOe0fXcouywtDLJg2KatkqrQIZuMxbG2maIxCZs
X-Gm-Gg: AfdE7clwbL+h+o95y+2ZXTr3SdFIFExIB/+zwaAlSV0C0sBZ0OJ9yOmVniAdUYjCL0M
 SmhdUHMzi5WhSp3JU+7gzPNkVKAGAtZErZBRTI/2TI/2wvnkkU5vZ/LnRjczVlvjPFMRQbG6vY+
 bztS/lVSW9pgp+qQWaeFN/0N9FTK7k+ZZg7/p8n7f0Eeplbp11HiFxeQ1zS1dYwYtncv9h0X8f3
 9vkwbfC8zy1Iladlmye5ijQpH+wCrUsw4BDYOcdz2l+O7kYUzHFD7WxZRfqxMXhZEhIsNjPXZ90
 YdUlsMipuauq6/6kamcJZ0Kj7sRvACrEWyypQ6RyBNqGZ/cuHQQR0Ug5lx6jwXayggv1xVKC5gj
 axwmU9JXoWerkJuJ8vyuJ0RDbMuE7375S6+q3UHkItoHKXug0HvNZGYs/SuO52uLUAKKN0jwyla
 PbjUhKqggFHrAH+vo=
X-Received: by 2002:a05:6000:41c4:b0:461:a15a:4155 with SMTP id
 ffacd0b85a97d-46dc055539dmr8067752f8f.8.1782444150312; 
 Thu, 25 Jun 2026 20:22:30 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c2279b85csm19702109f8f.28.2026.06.25.20.22.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 20:22:29 -0700 (PDT)
Message-ID: <6a3df075.795e137c.374e2a.ee41@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 26 Jun 2026 03:22:29 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782444150; x=1783048950; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=w197cWGewWAQZx1q+AwFL+c9YwxwerTJcXTiZHWPZ5M=;
 b=nRDkIpXZF8jBDaCdZY/fplK67g/lLFOQ2Q96VCdvEZfyIdeP5PMTETqC2LmJOC9CdX
 d2nirUuySWt2tAvdTJTxpBuyUNobW1eWIhbu3ySjjspGr3hmaZxH03GhDGURhJYw/EqL
 Z7f/ldLo0HhjTsYoGLlliPLPVQysmv5sG/Ol1t7xI7oh32P1vwtObXsOegNr51xG1DdA
 GTVc89luwUZuFDI7uhGKJoiJxe1I34QvK8c6d430Q//gj06x+YXszXOgbVughWbbrTPC
 s5bVEmy+h8r5DqQV9g45VD/wKfDThy0PuSDHIrNO6KcgP4BI6kfkfM7MjaWshcPWdU+t
 hCEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nRDkIpXZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-25
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

Autobuild statistics for 2026-06-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  4  |  0  |  5  |
  2026.02.x  |  0  |  2  |  0  |  2  |
  2026.05.x  |  1  |  1  |  0  |  2  |
    master   | 31  | 44  |  1  | 76  |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.45.1 | 4 
  gobject-introspection-1.84.0 | 3 
       host-gcc-initial-15.2.0 | 3 
uhttpd-15346de8d3ba42200249... | 3 
        edk2-edk2-stable202602 | 2 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 2 
                    olsr-0.9.8 | 2 
                   perl-5.42.2 | 2 
               binutils-2.46.1 | 1 
                   bird-2.15.1 | 1 
          cloudflared-2025.8.1 | 1 
                  delve-1.22.1 | 1 
              erlang-26.2.5.15 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gnupg2-2.5.20 | 1 
               gocryptfs-2.3.2 | 1 
                heirloom-mailx | 1 
              host-guile-3.0.9 | 1 
            igd2-for-linux-2.2 | 1 
               libepoxy-1.5.10 | 1 
                   linux-7.1.1 | 1 
                   linux-tools | 1 
            optee-client-4.9.0 | 1 
            python-iwlib-1.7.0 | 1 
                s6-dns-2.4.0.0 | 1 
              skalibs-2.14.3.0 | 1 
                  stunnel-5.78 | 1 
                    szip-2.1.1 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2026.04 | 1 
                 uclibc-1.0.58 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        binutils-2.46.1         | NOK | https://autobuild.buildroot.org/results/6fa2b4e4770c3a16ee4f1a849ccfcc85bf7c876c |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4ba71e8faabe39bf8e1afa42bfe6017050453351 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/718e9e4b4ac104e75d4b5a42cb38e94f307e829f |     
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/eb4d0eb936b58592139344d750f2c2fe73f64680 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/7177c9f264a33f7f149c1f21416280ced26a59e6 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/e184b74317798e743df1b64266cb063a879923ee |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/a49c2c58d6b3bb5ca963b0d774f8677e91d16875 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/865e78e4f569064cd8f766ce60157cd2fdf22789 | ORPH
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/021c85fbb1e6cef2b5ff9fd5bce64b738ef321f9 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5ee30657c2c53bdd05322adfcb8216e6654b512c | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/712976cb4864ed83b6f7ea22dd7c4622d21c9925 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/62e536fa9bca51e62c24f63061f47943ff137f08 | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/d20a4282f72d6b6f9403a4c53557f87bf8385e96 |     
    arm      |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/7b6e117ee7837b97e5e02039afdba992a0521dca |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/f4e510f3d7387de8960f977e8eaca070c401d0c0 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/389f07d4171869868579272213a189bc4b28f7c9 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/5e3622034c4db4c83f24c361703708b813f2f6a0 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/7ad2becd0f8ad1f8f357c7026ac80b8eea0f457e |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/ef6bf98f5271ef0db6c09dfb63028a50e2e18966 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/4f40feb9c83d82a413d2ec77564d6ed6aea98be7 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/14c7b30704e870edbdf784364edc0d2c9c6e3843 |     
  riscv64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/caab28dcb239f86fc2d4f4a5b71ffb6febe76c89 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/28d1796c1b9c303a5cdab8b0c52697392fcbdf1a |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/5189384d347c1dd50e8ef9891e2b05fb6d3ad547 |     
    i686     |          linux-7.1.1           | NOK | https://autobuild.buildroot.org/results/cc2035c6e9721eb0c28eae1204836b1d131943cf | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/43d2419cdbdf774bd06337b8fb471c7dc672355f | ORPH
  aarch64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/b4bda26742f6b433d15f2aa4d959ad3c218f9016 |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/afb3a04c0827061fa05be6538f02ea984f06ffa8 |     
   sh4aeb    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/5585d8617e6bddea71c84a622d9cf034bb581df8 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/452425e76516f423098a3353d793e1fbfb29e004 | ORPH
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/5b195d5d873c82a4bdfc6460ef8da32ef47ddbf8 |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/52b37dba3c186e3463e192ec32a8513ef9a4e849 |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/58dad899e674f82ef1338c88dcc00b12ccf2bf06 |     
 powerpc64   |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/fdd6823d5246ebc68d74671b2f181edf485783d5 |     
powerpc64le  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/48395a847045d7241add1f5e6095936060f27328 |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/26a73bd160345fb3e35b6e99f754b746004d8a32 |     
    arm      |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/d05efaaf8673b0a750d9a5b16d9c22453bce678f |     
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/d99d52032c39ce7b75e6dc4517a441c79bb4bd5a |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/ad42cc152e01bf7fef58dcb53c1338bf633846fb |     
    arm      |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/920e3bfa1cf354e25ffd1ec31bb348f9dbbe00ea | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/8b07997f0584ed3406a68aa86cafe0b37f38c4dc |     
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/950d121a929c5963987484208bde4b249d014042 | ORPH
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/8514cb55cb556b692ea172051ab36e2d50ddb2ab | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2516db4b1e6e9bfcf249aa73540af2c55de958e6 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7ee39a1f1625dcb5c88b4979decf87c43f3724a1 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

      passt-2025_06_11.0293c6f | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/969c67701ed1c6c6be7e7a7cf4482d940f0f0b46 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

  gobject-introspection-1.84.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b3d3612e34dc216d716ae9c67a6eb53c4be7ec1f | ORPH
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/6f9093ab0c105e3fc649797e5fcf768733458ef4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

host-netsurf-buildsystem-75... | 1 
             parsec-tool-0.7.0 | 1 
                      poke-3.0 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/f95a67af77b787f695415b2134b836b251db78eb | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/2b97928aa03c179393f87dbf0e84b4cb88ca8076 |     
  riscv64    |            poke-3.0            | NOK | https://autobuild.buildroot.org/results/f5fff9d7d1d914de9fe9bb1803f1812f90c24eb1 | ORPH
    i586     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/708d4b60ea33e6a8fe8955fa2c1e711fb6339d74 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

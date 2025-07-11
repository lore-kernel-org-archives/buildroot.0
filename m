Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB2C83F17
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 03:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63FE060F6C;
	Fri, 11 Jul 2025 03:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GkfK66RDP8hK; Fri, 11 Jul 2025 03:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 464FE60F74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 464FE60F74;
	Fri, 11 Jul 2025 03:14:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BAFDE968
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A154760F6C
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRx_aYU3NWty for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 03:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E9FA60F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E9FA60F74
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E9FA60F74
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:14:43 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ae0c4945c76so260792466b.3
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752203681; x=1752808481;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kIDNNLUcJhSBsDVq1B75KE52Z8qdXEjz3svblFgnNZ8=;
 b=PtWvThW7LbIBYOKBw2JOyl87zPA08LwOKVnFdQLYiA+wez4aleq1FwjGONAxyoOggm
 fn7VyrfniwjBxIQj6dH/oBlBEy/Jm/63mDE3yK8LouB/phFAb4YPk/0fMImsfajbxORg
 LuuJg1XqB2wVCE+QgdPYn4hSICX+aoMfegkUKrvsmxhyesYVuWgvZoUak7j1SQiYGWwt
 sgMmbd/gUgCK2F+iq/01zZmjxkSdA/xFzJO1ColiizJcc3inTMbszqYcPbO+inAtLywl
 x9NoPAwBS9U3C2ka+rbXlCcH4SrDNBXbuK9IyAvgHXxhfAprG6cj4e16a9ZXjdf+xZ3G
 x+TQ==
X-Gm-Message-State: AOJu0YznU0/8j6vMEnpQM8DQOacrBDGJ0MmjEye8aF7yUq2dsAI1Jzhy
 8/fBZtqcwW8MA8ElON1Y6TbxAf9bt9D39UwWp//QOV6uRm6Q/+XEOJ/refAYmQ==
X-Gm-Gg: ASbGncusUXP8d9pguVbgiCBekdlvh5zlEafJ11kpYSQqbpk5Ejzn+ZmOATa00Wd4iZL
 hMAgjLB3aszTysoEIIfI4UVnk8V2CMGBIUdL9k9aYTgh/RU0HkBIFXxYcFKOoOfTvJ9tPU60Hi3
 aqJp3l24Q8WBhllrjGqhQRHTm6pJE7nKwoKe4RV2lQKloVhYpCYbPPGSlPmzrNKIzPgcuLiCHOV
 CIPXDF9I89POCO++HoV67EAdeCNwUDFY3y88St8vkQVI/STFK5LTNE0Gm6tfnEdsAEJybDDpZWV
 jao93VNy9eVmch13BDAmsuM5m0p1d3jL7EY0Oc7s4DwsWqKe19/nu9A0a+hxIomS/DJ3cCIcHIY
 66pjdOuHMFlh9+8LXP1GtchM3OQ==
X-Google-Smtp-Source: AGHT+IG3mBfa6kQ/GzoIVfRzJoI9cri1cuUXLtIIMYEDN6jY01j6Mhit+kkCwnozjwo2cBubp/qA0A==
X-Received: by 2002:a17:907:9413:b0:ade:79c5:21dc with SMTP id
 a640c23a62f3a-ae6fc0f5129mr150363566b.25.1752203680734; 
 Thu, 10 Jul 2025 20:14:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8313c88sm220890266b.181.2025.07.10.20.14.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 20:14:40 -0700 (PDT)
Message-ID: <687081a0.170a0220.333c9c.5808@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 11 Jul 2025 03:14:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752203681; x=1752808481; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kIDNNLUcJhSBsDVq1B75KE52Z8qdXEjz3svblFgnNZ8=;
 b=SGIjL6kgIb1x/4X33+jRV74nDDjRHisQYJoMFw0BxRXSpp90XMPRSUwUzMNUIz4kbn
 iCtvyJmY3FaCjocw8YgaSL4A5mxSNUycIOsgqWvlbGSAUW/+rOEp4awrluYMp3hOf451
 eix90e174GQ+oIFdTPP/6BpGQ25dPTg12zoC0Lz3nRKq2+Y9WPjdwIzxcaT9/WtuJwgw
 3a5BXqzTLyOhXbFtC9M5sLSnf8G8ewDb8yqB+VOVjP+XqHsl2l33JXv17QidcDa9xsyc
 DQJQVAYvNS9yM0e+VewoG62VbTnI+KuWu2prS7FqRlGtyjnNk9++ikVsPmlLUBG+628l
 VwEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SGIjL6kg
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-10
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

Autobuild statistics for 2025-07-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  4  |  0  |  5  |
  2025.05.x  |  3  |  4  |  0  |  7  |
    master   |  6  | 44  |  0  | 50  |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 3 
             libargtable2-2.13 | 3 
            ecryptfs-utils-111 | 2 
       freeradius-server-3.2.6 | 2 
libdbi-drivers-0bfae6c43134... | 2 
                  linux-6.15.5 | 2 
                 logsurfer-1.8 | 2 
                   perl-5.40.2 | 2 
              tinyssh-20240101 | 2 
                   avrdude-8.0 | 1 
                  cairo-1.18.4 | 1 
                 coreutils-9.5 | 1 
           crucible-2023.11.02 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
              host-rust-1.86.0 | 1 
                   iotools-1.8 | 1 
                  iozone-3.506 | 1 
                       jose-14 | 1 
      libabseil-cpp-20250127.0 | 1 
                 libcddb-1.3.2 | 1 
                libesmtp-1.1.0 | 1 
             libgphoto2-2.5.27 | 1 
     libphidget-2.1.9.20190409 | 1 
              libselinux-3.8.1 | 1 
            netstat-nat-1.4.10 | 1 
      passt-2025_02_17.a1e48a0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
      softether-4.30-9700-beta | 1 
                    sslh-2.0.1 | 1 
             util-linux-2.41.1 | 1 
                    wipe-2.3.1 | 1 
              xlib_libXt-1.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/5c8ee1f3bf62ef2015ab5db162f136b8db00c451 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/32619dec2424f6c89c3f95ac5745d56e81e550e9 |     
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/c0a65395202e157e35574c4551a3b91fff01d483 | ORPH
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/8a1e83696c2c650a082c97f61438f23346e3e678 |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f91b8f530ec7ceca5a127ef4b1ba2ae29a7247ce | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e7b5ec23f2ca7bb682e0bd297832c5dc0d24cdbd | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0c14ae4dacef3215faac7071efee0b616ee0f16d | ORPH
  sparc64    |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/eb9f840450e0a0add95a6f9e275ccb016271e436 |     
   s390x     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/e7b64a1e0c17080ba65546a163cdf146f9fd013b |     
 aarch64_be  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/b34715ffac2de637f1102f43deb830a5cb263a92 |     
 microblaze  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/aa9576b7d54012a3f2733cd09d406ebf3dd64e83 |     
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/c8856fb54d79a48a9bf22d455d72306c576b9564 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f180a7056836e0aecf703f2ea8c82fe0ef8b61bd | ORPH
    i686     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/581e37abd646d682cb7f9d2bc4c068e7ada3e626 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/605d687e8d660c6d586237b577174e02f7fb8f45 |     
   sh4eb     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/7596aba4bc1557391328f721317e1b3575a66fa4 |     
 microblaze  |            jose-14             | NOK | https://autobuild.buildroot.org/results/65f0038e6d194f0b730d195d05857f45d0017185 |     
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/baf36451b05fee56217a0ca56d4535a4e435fb3f |     
 powerpc64   |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/67ba4854c78ff724a109a8af4ae961c1bb590280 | ORPH
  aarch64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/5a69c6708cc0ff2911d765ce4395a73a88e31aab | ORPH
    i686     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/ca4f7c2988e6475ab91f74ca489529e5637b5d14 | ORPH
  mips64el   |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/bb3312dec5d0833c91e86523395342cb292807a7 |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/39e14d04635b9335f405353bcc088e5a9cfb87a7 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/6d5010212641e35ff1bee604e23605baed917e04 |     
   s390x     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/7f8ed785155496e967a5c358c28da2f9e3433dee | ORPH
    or1k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/5f3809ccfd7b3688ed4c9330fc411a569c88ccaf | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b4cddda7a30f07a7b63b04a2918041a377943c64 |     
    sh4a     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b9b44f5160b6cc7ad5cc7af2eeef29ce04674c6a |     
 microblaze  |          linux-6.15.5          | NOK | https://autobuild.buildroot.org/results/b23ecfff33dc76207110a8d42d8355c520c4d033 | ORPH
   x86_64    |          linux-6.15.5          | NOK | https://autobuild.buildroot.org/results/81185ea9c0b5c28a408790baa0c9f8c52d627772 | ORPH
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/28561de1df0e32e8ba1b050204bbc73b76e4475f |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/98ac833e200831e8fc1f9976ac92c50fa71a19b0 |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/8b971825ebbe2750744496657996d329e0c1094f | ORPH
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/7361d23a45c208f577b55c87b1ebfddde3c1aeb7 | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b9942f9cadcf99666950d7ee5a9216539c57ac03 |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a83084354d0b9caf2d74bc467141833b051638b4 |     
 aarch64_be  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/3546cce51897b068aa5c3a65a6bfed39d5527554 |     
    or1k     |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/e4c437104e91720e24fd4b7a809db33e6b9b8a58 | ORPH
   x86_64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/196590c25228369aba45c6ecf9c1515e1f44c515 | ORPH
  aarch64    |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/f83c01e63b570b338aa4b4f8e37d11ed06fad3ca |     
  mips64el   |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/521f158cee526934d80a5a319dd69c71fb26e29b |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/7e4e4d9f3d67850cf6cc94372dc0ec9054163caa | ORPH
   s390x     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/0c416f05674540cea64170fbb0f2715f1670ef6d | ORPH
    mips     |        xlib_libXt-1.3.0        | NOK | https://autobuild.buildroot.org/results/c1a078efe3ef2b5f871088978300d17b741cb9d2 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

jailhouse-e57d1eff6d55aeed5... | 1 
             libargtable2-2.13 | 1 
                 linux-6.12.34 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/493c0b1e2a1bf22fc824041259e3a8f11c3dc644 |     
    arc      |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/d38e3e12f52c3fde08ab446ca14a1a7bd65c9469 | ORPH
 microblaze  |         linux-6.12.34          | NOK | https://autobuild.buildroot.org/results/9e9ccdc1736e73607d64abde8fb5a0dac0a77f8a | ORPH
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/16096297b91e576a60a870d05f488813ed9b39de | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

    host-mender-artifact-4.1.0 | 1 
          host-oniguruma-6.9.9 | 1 
               host-parted-3.6 | 1 
                    mosh-1.4.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/947db3e768539fbef86888b9ff39e09b7420e699 |     
    sh4      |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/86a80fa8f8741f5730d7d1e3301b5475f5f16fb8 |     
  powerpc    |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/82317e01bff48cbedffa873d6fcb02157533492b |     
powerpc64le  |           mosh-1.4.0           | NOK | https://autobuild.buildroot.org/results/2c146251248354aa4a5f7fa93bd20b31f8258be3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

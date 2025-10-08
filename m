Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E49CCA470
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 03:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90BAC811C0;
	Wed,  8 Oct 2025 03:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54aQUM1fKJfq; Wed,  8 Oct 2025 03:23:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 275AD80DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 275AD80DBF;
	Wed,  8 Oct 2025 03:23:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12898226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 03:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC8B740710
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 03:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cb3c8kpmnFu5 for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 03:23:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 891464071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891464071A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 891464071A
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 03:23:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e37d6c21eso50106075e9.0
 for <buildroot@buildroot.org>; Tue, 07 Oct 2025 20:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759893783; x=1760498583;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b0qaer2R7axT8C01HLRoY9wYoQ9/ryySBmSiTIkxgOY=;
 b=H5r/JYL2hqHyRwBBEb46au+GU/j2jlHWBfyp87dJ28+I/1jCxjH/7/c6cLw0Hd+Yie
 2WkPEYId71l6OVQhbdsXUrWhPUKcJ/hhop+IN9YERddfEGOqQijaJ4/pvR1iq31pvTqD
 319YyknPb4+7m3df/nKK/qI4zDlevArQf3UCkH6bf8KyLqXWgbpdL6SEeV2BRVlwObLR
 EZ0p4KhQIBeTv9UrbPzdvDMm9GZfDVBy2ecIHPzOAiZkwV7yQUICcU50lfC2ZJeHTooO
 cC8D+W7YBXuvJzJs5YKQ6+jZGWU2eQHzTElzMNu6GbYjdJfSneWm0vb0DZ17F0SZzvw9
 ZkSg==
X-Gm-Message-State: AOJu0YygAkeqROajcMGBgbmUsoQb3GGlRZpUSKZVI+KYhw1XbRdMW1u9
 ve6LCWAJ8eR63aTiUMhdZTf26hJEn/UFupap9Qt+BnQoAhTv7BqZ1sbKigyduw==
X-Gm-Gg: ASbGnctonG569s6/07hwwlH8EpNYhONFT+dDsHmIgXrn3L4vDSgP3XjK7Hicq7sp5Ns
 JRcKqhkZGAsottpSzYrhSsGqQ5dSvIgZlSWg3dpc+9muYgICIohmb5jugRNjhBdoxUFvL5AE5h4
 N3xfZ8YUteW0g24qxD/m57RNU3n7wBD/DlN/6/yLWEmfKak6W2NmNV4SqkXmsevoClyL83FNTTu
 N0L/rIRoyS1I5lrtZZmCLHf9aiz9wy7YkafQKxGxaE4jw+kBeu5pWDM26r1fTFKrdcqgZCvaClb
 NEudaNHTfexiTwBMBAhFSJs2jqeAOqm5OTnRqUBC34YKP2A5taFy74Y3AwPtt13C9up5FQpWM9l
 6DXC7CoWpLTULMuCTq+kkEYxDnvUhKbFciwdWZRaQSEwsQabHA/GTjg==
X-Google-Smtp-Source: AGHT+IHCNvCpcQensuBz6TJmIQrYQM8LpNZLwaUrRGtzvZrlLWJOS0kaNd3JkXzzCqV1CVvGTA+ZCg==
X-Received: by 2002:a05:600c:699b:b0:46e:410f:f645 with SMTP id
 5b1f17b1804b1-46fa9af8fa5mr12667425e9.21.1759893783118; 
 Tue, 07 Oct 2025 20:23:03 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9890sm28065936f8f.32.2025.10.07.20.23.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 20:23:02 -0700 (PDT)
Message-ID: <68e5d916.050a0220.11af5c.b133@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 08 Oct 2025 03:23:02 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759893783; x=1760498583; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=b0qaer2R7axT8C01HLRoY9wYoQ9/ryySBmSiTIkxgOY=;
 b=UmU58peP7507qXhB5WJ+2vIPP+hmLTQsmNwxRDgQM+RqS6az/S2FMj3cxdYw0rqtcj
 nLaSuYSsTSCprAD0Jhoenbb4CzJnuN0CiW4vZyT5GmK/Lh01ODWIGHtDLh42IDIGBsqZ
 vv5UlGIcnouY6EyJIjIbdPHQ8rulTII0y91Isun02v3Pe74R2epvtWLryWPMKquBV/z1
 9E6lCuKJ1bCjpbgmMZOUJggZIvTdRdqW5Mgt+9sZKsW+66rlc083aU7rkFncf9FmS0s9
 CgUx2D5vB1LbG13AgJDPomp1F1cgPJ2M9TC2gYMcjY4+g38f0w40/99GUJzssehvVsBH
 nGuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UmU58peP
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-07
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

Autobuild statistics for 2025-10-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  5  |  0  | 10  |
  2025.05.x  |  1  |  2  |  0  |  3  |
  2025.08.x  |  0  |  1  |  0  |  1  |
    master   | 36  | 60  |  2  | 98  |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 5 
                   cvs-1.12.13 | 3 
                  libsvg-0.1.4 | 3 
                   perl-5.40.2 | 3 
glibc-2.42-3-gbc13db7393773... | 2 
                 libgee-0.20.6 | 2 
                libsolv-0.7.30 | 2 
                    linux-6.17 | 2 
                 linux-headers | 2 
                    mpir-3.0.0 | 2 
                       unknown | 2 
             batman-adv-2024.4 | 1 
             berkeleydb-5.3.28 | 1 
                  brotli-1.1.0 | 1 
          cloudflared-2025.8.1 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                      fio-3.41 | 1 
                    gcr-3.40.0 | 1 
  gobject-introspection-1.84.0 | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
              host-rust-1.88.0 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
         libdisplay-info-0.3.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
              libgeotiff-1.7.3 | 1 
             libgphoto2-2.5.27 | 1 
     libphidget-2.1.9.20190409 | 1 
          linux-5.10.162-cip24 | 1 
                  ntpsec-1.2.3 | 1 
                     nvme-1.12 | 1 
               pcsc-lite-2.1.0 | 1 
        perl-xml-libxml-2.0134 | 1 
                     pound-4.8 | 1 
procrank_linux-21c30ab4514a... | 1 
                 procs-0.14.10 | 1 
                 rtptools-1.22 | 1 
                   rubix-1.0.6 | 1 
                     shim-16.0 | 1 
             strongswan-5.9.14 | 1 
               syslog-ng-4.8.3 | 1 
                 systemd-257.7 | 1 
               valgrind-3.25.1 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/dbf7bfc43b170fb3b21e7cb3d241cfa257013b22 |     
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/3489a7d7e7db918cffeb8852eb09d51cf6347f70 | ORPH
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/1066ab48c84d8f410944d430b95b41127dadfc2b |     
    arm      |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/99af263829a243d0b264c88b44a3b00e2454f73e |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/01158b6a4c91395b9443510e0161e8fb23a22d09 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f362c67dba90db3c1b2cb3af6b626e55788bc326 | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/67c89d08cda09eff6de609d6e346b188fbf95656 | ORPH
 microblaze  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/305998b0c5bbd62d11d4e4c7c9b5175a2a4fc700 | ORPH
   x86_64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/cccee0acaa359f325f7195770e89c34c83bde6bb |     
   s390x     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/9922b35811902339674343c82e0b80083260baf6 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/910eeff38db31cf30819496e0654b3823ff6e66b |     
  mips64el   | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/b35d8c7f84abfe9460c49a99bb225d4c7650a4b3 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d6c3a48565e63f51a5f0dd533edafa2cdd224b6c | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/86ea6276eeafa15acca6a465c53c5d0d567712fa |     
  aarch64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/059e0b956b10d0702bc8d84467adc4bcd5b40137 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/407b917cc845e593ffffac9128008a9d0ebe72e0 |     
   s390x     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/e7b17da84698b602aa339ec0c397a346b32b393d | ORPH
   sparc     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/dda877ee8e7ef3480ad186886ffe0fcf9a71564f |     
  riscv64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5bf1baff8cdc94688e840612290d90d5b1ed0c90 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a0abe3749a9363c80aa4382942de104eda25d50c |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/edc647846f10824a7bef9709407c804f7837b871 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4cc61ca522a8c60934fe66b230f72662a2fa1455 |     
  aarch64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/01590c3a47ae1c2f3eac7440a3c266a7bb83291c |     
   xtensa    |     libdisplay-info-0.3.0      | NOK | https://autobuild.buildroot.org/results/4fbfc3b743247b19181252340f3d8ac741359983 |     
  mips64el   | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b65db7473327bd3052c457e10504aa52fc8beb73 |     
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/cb422bf3e3817d7d9d089db6748b0a2c24412422 |     
 microblaze  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/d388917185887d2c547b9dccc5baf971027a55c5 |     
    sh4      |        libgeotiff-1.7.3        | NOK | https://autobuild.buildroot.org/results/8b3d849ff838f55292966c4e74f6889a38c1baf8 |     
 microblaze  |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/c082e269611f2bd1cdc8da3621e8da094618275f | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7cfdd869f41dc145c31bbd4c299cc33fbd61a55c |     
loongarch64  |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/a74a408ea54d3d9d4b15a6894446eac8745e9601 |     
loongarch64  |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/1e3a7f279c81ea95e0e816244696a01f372566ab |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/2d7ed3994b03d8250e6cc6844240be8101329945 |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e1d5e684dfb5745ff80ff10aa2c5c89f735ec0eb |     
    mips     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/9a48ab04c6afdc8685da4c541077db92ba91cce0 |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2653d6268a05641ce6679e34300ac1be984acbe7 | ORPH
    arc      |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/7c81ad0e944071e489193e6a90df4912bc179a9a | ORPH
   s390x     |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/4bc82e2b26dba5e01058cf1bdf9142b51418ee92 | ORPH
    m68k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/338850ca000f81bdf9edcc23b8597454c002a722 |     
  aarch64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/7c4e1a848d8ac860056661c6d74fd7ef2a0fb1c8 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5707fbb5ec6ccf8490c72da646d96f3abedaf084 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e1f243ee2d589ea88c7bc3d0ac37e7febd04aded |     
   mips64    |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/8dfd005acc2597429f14acb012d7b0f8f4df2589 | ORPH
   sparc     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/614bf39d57392b2d57991781128e1c3a94144963 | ORPH
   arceb     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/df65ede0d51d31b74b5017428be3fe4fcdfdcd2b | ORPH
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2d7c3d8070e488b527c747e8c1bce1be76efb256 |     
  aarch64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/4820cd0b558e63d0c7cd2ccb165b86d6725350a3 |     
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/470058dbe5757b587639850e8d613e524e12a397 |     
    sh4      |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/c4d188c683d0c8bb8e8b5c294efa6802b23a3f01 |     
   mips64    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/d1fa1e63b1504d897ebaf04745b4de1e9e7cc0e8 | ORPH
   xtensa    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/f4e78df9f5c5f622eda69d749f0e071d4fcf796d | ORPH
powerpc64le  |         procs-0.14.10          | NOK | https://autobuild.buildroot.org/results/721f4b84177d35612b18caf318720fca520ec29d |     
loongarch64  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/02f1763c2251a2b09b8ade0ea671028ae52b0124 | ORPH
   mips64    |          rubix-1.0.6           | NOK | https://autobuild.buildroot.org/results/14b329f8f872de8a8d68489433db3dd5322e6cde | ORPH
  aarch64    |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/7ac5ba8dd9a806e64ba3b4ad25c4e9b310770cd9 |     
  powerpc    |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/2bbc6789d8a05b02aadc4871a4f94c0ce4bf5cfa |     
 powerpc64   |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/95c2eebe499df65c1c1098f861fa8e3a3a8daf08 |     
  aarch64    |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/8a9aca97ccbb30da9850fea39ead317018f40211 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/b24fb72899213e30a9ec4569422256b59c9cdbbc |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/e97e40f6f21ca30438fb8001c93451498717f48d |     
  powerpc    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/a8ec8b9f7d012d310cd1c61fab9ff0547dc9a3b2 | ORPH
  riscv64    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/43bd6bc205451f42c1f5c49ff892e2ccb0a25309 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

open-plc-utils-1ba7d5a042e4... | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/90bbe6986f0b0b43bf7a048be098444e347c2061 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                    ficl-4.1.0 | 1 
          linux-5.10.162-cip24 | 1 
mjpg-streamer-5a6e0a2db163e... | 1 
squeezelite-71c012ad9ba102f... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/af67fd94de6b075b1c0f1c6e16d814371b2a4714 | ORPH
    or1k     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/815f2e48f000df7f5b4c2d20d8a6edc6198845a5 |     
  aarch64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f910c1e0e864055120e2deaf4d56b127cabb89bd | ORPH
    or1k     | mjpg-streamer-5a6e0a2db163e... | NOK | https://autobuild.buildroot.org/results/fff5a274102b770cd52e7b58180197c738576f86 |     
   x86_64    | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/14a3f6a452a36bc7f32606e0bfdd78b3829c4064 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
                 host-gdb-14.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/054e199dab4ab2d0c11baaffefcb6b0897c64b4f |     
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c4f55bc1f2ccf7d1319b56964c4e5b73aabbe6ed | ORPH


Gitlab CI results for 2025-10-07
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/11610441039 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11610440906 |      
                 TestPppd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11610440722 |      
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11610440675 |      
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/11610440265 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

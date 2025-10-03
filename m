Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1472FCCA470
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 03:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BEA160DF5;
	Fri,  3 Oct 2025 03:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHhhIe-33Bav; Fri,  3 Oct 2025 03:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17F5D60DFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17F5D60DFF;
	Fri,  3 Oct 2025 03:20:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E99F391C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 03:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF49B40026
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 03:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMU4GlPw6n78 for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 03:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 784BD400E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 784BD400E3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 784BD400E3
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 03:20:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e6674caa5so8920515e9.0
 for <buildroot@buildroot.org>; Thu, 02 Oct 2025 20:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759461633; x=1760066433;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NRdBofqrQmKtdQ7bjYEdDsiRHQz1XcqvApkkQX/5joE=;
 b=JN3lWNuP354fU6jhaZaqIHDBaRjdadTPj4vS7rJvFuelZXIzCjUlRsIeMRRru9uv91
 zp5wEfHWn6Le1xsB58ivejL5sC26VQdGzWGykRLwnQLMxydEE5xnUrdoHB+AygHuRWfz
 wdn5xa5jnB1X7kNQgKUoYeUCccdicbVBx70nJsdNxXFLJ4FogsaSeKAQmbQyk1BF4sFe
 FkcZiExuQBwisTQRpXtsrdLV6naABuSA7MF0rhDp/arSY1ZvCREV9f2tubiFx+l2Qmpg
 XsggAOQsLiQd5ILSSY4jlSwaYuaVPbjdVZ8oEE1d3g3BGWM66dlPp3RxJAwpBB9Yy7YP
 WI/A==
X-Gm-Message-State: AOJu0YwbZxapRw5Kxyk4NqQWvbCEzz18/jvtolk3uaKMVdsM6FGjJUaj
 eTExmpARaZ/owHqJfAEuP1oAv647IDFn7gdaiF1CC7jk5SgZ+H4DNRV3BIa8aQ==
X-Gm-Gg: ASbGncud0kj5jQAK/Egin87IaFtPlR0vVmAAx7l5LEfUS531ziFexjdqiv0VNNljLhx
 3dazequbYirm2w2Jc/AD5zjyo4k2REKIDUWwYxILL1GcQLOq3Y4Gl+iJWCzArH21h87RLH0vQZn
 edh2W+Yh5o2LU/XvkvIn02MZMKgzRQPqmhSqcN3He9VN+Z1SwzFHQflkPpSqMBf3SPO8FtFX/dn
 1hxhthTUw/ty9Fq7cFgCKTRM9gX9H7M8x1BRQjnk09yuvGhewuLpO4pFMVKfdIwTPOo7CA2TXon
 ph4vZvxdZ/7H1DzuAX3EcX7sshtG/2hS36mA951zJhf7eDLCbdWQiiNDwzbwY4jT25iUmdkfNEP
 eJSTOLtSRPwm9aezoFXHoIByuEWwXWf7ZRPxXeKjz4So0qBCWnQWm4Q==
X-Google-Smtp-Source: AGHT+IGMFRiNarfbcvU8ZLsQmBEjcmAVKwGOrIGgFxkpT7VzHFW41TVecYVRtQ0S50jej4XqbTSBQA==
X-Received: by 2002:a05:600c:530e:b0:45f:29eb:2148 with SMTP id
 5b1f17b1804b1-46e70c5ca50mr11108815e9.7.1759461633051; 
 Thu, 02 Oct 2025 20:20:33 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e72343260sm9866055e9.4.2025.10.02.20.20.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 20:20:32 -0700 (PDT)
Message-ID: <68df4100.050a0220.1c8438.23c2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 03 Oct 2025 03:20:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759461633; x=1760066433; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NRdBofqrQmKtdQ7bjYEdDsiRHQz1XcqvApkkQX/5joE=;
 b=kPnP0QWLIjcQBsRMd/PsfIZNf5uI1eA9Bnb56h1mpOmkrUlpa4feEMFWXnRZ/LAK3d
 GYfyM8Nw4j3+RE+5uCyAHoFsCqUBfePiPkKXS6+scRA1OsZST4QGbDjuvXw/AK4hMG/a
 vwhGdfnUyryvZP3814jaVSNAxeGB4ZsxbhkQGNqSqLbf/Dab1CD2QkiLvJhT6aUDOwbH
 RhS9aLxFMM107HmOfnA/ROvfVINE8iBZYDwbRVpogWzQUaNMaZgBZuB46qXEXd5IxLA4
 kF1J5dl50gxng3V1BIoKrYlZv853YFwkmomnivWq4eEuSOJsVWrfyC9aKOoVlMgnYmWc
 v66A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kPnP0QWL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-02
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

Autobuild statistics for 2025-10-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 11  |  0  | 20  |
  2025.05.x  |  2  |  2  |  0  |  4  |
  2025.08.x  |  0  |  1  |  0  |  1  |
    master   |  6  | 108 |  0  | 114 |

Classification of failures by reason for master
-----------------------------------------------

package/linux-headers/linux... | 29
libdbi-drivers-0bfae6c43134... | 6 
               bctoolbox-4.4.8 | 4 
                  libsvg-0.1.4 | 4 
        vulkan-headers-1.4.317 | 3 
                    brltty-6.6 | 2 
                 c-icap-0.5.10 | 2 
       freeradius-server-3.2.6 | 2 
    host-mender-artifact-4.1.0 | 2 
                libcurl-8.16.0 | 2 
                 libgee-0.20.6 | 2 
                    linux-6.17 | 2 
            micropython-1.22.2 | 2 
                    mpir-3.0.0 | 2 
                   perl-5.40.2 | 2 
                python3-3.13.7 | 2 
amazon-ecr-credential-helpe... | 1 
                    bat-0.25.0 | 1 
                     bc-1.08.2 | 1 
             berkeleydb-5.3.28 | 1 
                  bitcoin-28.0 | 1 
                blktrace-1.3.0 | 1 
          cloudflared-2025.8.1 | 1 
                  cmake-3.31.8 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                  dpdk-24.11.1 | 1 
            erofs-utils-1.8.10 | 1 
                    eza-0.23.3 | 1 
                    ficl-4.1.0 | 1 
           ghostscript-10.05.1 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
         host-gcc-final-13.4.0 | 1 
       host-gcc-initial-14.3.0 | 1 
                 host-gdb-15.2 | 1 
               host-ola-0.10.9 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
kismet-52bcb902e36b2df1562c... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                libmpeg2-0.5.1 | 1 
              libopenssl-3.5.3 | 1 
     libphidget-2.1.9.20190409 | 1 
                libshout-2.4.6 | 1 
               linux-pam-1.6.1 | 1 
                     mdadm-4.3 | 1 
                      nbd-3.25 | 1 
                    olsr-0.9.8 | 1 
procrank_linux-21c30ab4514a... | 1 
          sane-airscan-0.99.33 | 1 
                 sudo-1.9.17p1 | 1 
uefisettings-149bc92970949d... | 1 
                       unknown | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/38c61f439e477a77125fa3a0b6d12320f73938a2 | ORPH
  sparc64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/699ff9ceeec1503683e2bee6ca5058e41e97d95c |     
   armeb     |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/0f9e5fdf9a41b928e51a837d653e175438a96744 |     
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b4542360ad8e8854ca5924fe88b5eedd6f20a11a | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/bf34fe51de21a0ae62fb0b78c8182e1a3ae72386 | ORPH
loongarch64  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f4e8afa9d428518416b1ecd900cfc229066a6d0a | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/45fecfc48cdc8bd71f35f09f4359e769d952f87c | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b0da97d7951ab0e540b41c0785103e37c24c6202 | ORPH
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/8974cd752fbd65e9d673e16a24e6d6252b51db8f |     
    or1k     |         blktrace-1.3.0         | NOK | https://autobuild.buildroot.org/results/744be9495fac93dd4ffacaf9fba32d616849ce85 | ORPH
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/9a8edf1453072afc1ca72d7a4753d3eb015b32f8 |     
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/20dd976234552d8ae49ef6f6745834ddecd58482 |     
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/6e1c430cde93959237270a21e9f1e108d225ef27 | ORPH
    i686     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/41b68c587b094ea88cc9dd2058ab54845d294d37 | ORPH
    arm      |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/8cb602d4bf0174b1b43d35c31e75aa950343e65a |     
 powerpc64   |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/e92475589c33160a8796be48d50284dcbfd73614 |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/89c5794eefc4def2549d89bc65e8aafad339bbdd | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ebcf3b63537249ab86b31ee8c8bed3a26bf3335a | ORPH
loongarch64  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/005af4f036f58c90b876085b2926e03d33d5a521 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/4b0dec07c6b4443a72a057407f1492416453f543 |     
   arceb     |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/f4fca473bda18753d541cee8b504edcf4b5b8cac |     
powerpc64le  |           eza-0.23.3           | NOK | https://autobuild.buildroot.org/results/273ed532f4bcc3a1d259177cdbd12e745772468c |     
 microblaze  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/b3cc7f558e0a274e280f0e120279bd1968871aa2 |     
  aarch64    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/a7951e09fc6c10a24a75d1a3acffe97469e3bdf7 |     
 powerpc64   |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/2844adfdde0cb3ad196ddb396792d987d0b253c4 |     
    or1k     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/9b8847ca87b4a68480752d1f0c99b0430faf9570 |     
    mips     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/a7446af8b69200851dd94172e3d1bf44cf2abac8 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1d8cbf87893b5449a1cd3ab8b9b3cfa98083f83d | ORPH
    i686     |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/4f6ade8406801f3397684c4967fb3ec6cca8aeed |     
    arm      |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/5c702674b37409d0b999b00e7014f05ebc9a8f14 |     
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6321243a7091521da538735351e6333b921214aa | ORPH
    i586     |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/fb2a8bdf0709e370fa8876576a8ac55a3ed4bc0f |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/9135fb84294ce0d3839a0d7738ccbf6077af097c |     
    mips     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/1bb9714ac63c275889aa729d8b5fbe83975dfd78 |     
  powerpc    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a598610ed3c9823bae2f6f6eace5ab13c4b851ea | ORPH
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2ec717a64cd40bcb8be063bae8806d95512c9b47 |     
  powerpc    | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/fb9ceb71bacdb86f08a253b8106e0fc7478fc868 | ORPH
 powerpc64   |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/1660fc3d63dad241fb63e73edf94a89a9376d766 |     
    m68k     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/6b2461f55e5ec7f186cfc52b9a7d112999ad8f61 |     
   arceb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/375e46249002261aa59a31947371e97012dca7c1 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d69ee44f3ff0bd027af0fbb64d531384932e7e7a |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/650780566bd21a89884abeea77cc517481c58b53 |     
    or1k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/6436117d4d7fe687cc194ee86d07f33ca43aaa96 |     
   sh4aeb    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4843fa20f8b6dc66c49d8db9e159ef2da5814fbc |     
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/13495cf240a759ae5011b49582fc5d4baa176a3c |     
loongarch64  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/8d59e972e319ce381beac6cc966c7f3cf8e13fb5 |     
loongarch64  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/05cdb0f9ef8f98ed74c616093950a7f50dd8715d |     
    or1k     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a8a1f84dfd11dae2f5b190c4e7e47b7dadc00454 |     
  mips64el   |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/8753b731b36cec7afdb49447edc664162dcc6592 | ORPH
    arc      |        libopenssl-3.5.3        | NOK | https://autobuild.buildroot.org/results/6fb330bedf147f90346cdb81f457cd40bad9845c | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/39c9d964673cce1907a8c5e9e728ac2c42f35574 |     
   mipsel    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/5e60767fbd1f8248f0c4c6e3cc2d7fabbb43553b | ORPH
   xtensa    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/1ae096345c4bce706c5a087fed618654ba2b7c56 |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/20e2846b3352045d1b76bdd656ba9b8700206c9f |     
   s390x     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/340f06a4d5b87b1e4bd872fc502152f51c91ee5a |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/479f75641424709b8988e6746b53b4e83f59c861 |     
   xtensa    |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/dc8dbab697ddec9e4ec290c08f17c3a0744402a2 | ORPH
    mips     |           linux-6.17           | NOK | https://autobuild.buildroot.org/results/99ea43d389338ef7b8beb37598b3b155b4e4bb53 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/fd96189e7020033e7bb316ac371be7060090039e | ORPH
   mips64    |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/2f8dc51af3dd10fc5242acd976b4b3879d523488 | ORPH
   sh4aeb    |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/66e99c4e1360dc7bb5523794a0765bba34512daf |     
   mips64    |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/f95af7976ef2aa71ed03ebfc213810e5d4079656 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6cb2b04de475504473da23aac26053615c08dab0 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/72817482a6795bf9edfd7094b38fd3cca530dd95 |     
   s390x     |            nbd-3.25            | NOK | https://autobuild.buildroot.org/results/931e7eede8ca79a20fcd4086b9e0ba928596630e | ORPH
    mips     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/4d38ce22529c6914bd5213e9a18b663c6136c40f | ORPH
powerpc64le  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/6352d7dfbc5e29c6d7fda065d0b597067dd6010d |     
 aarch64_be  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/941551cb2d6fc6844cb5080c7b84f5e6ecf3f306 |     
    or1k     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/92c89aa0a7b771b6ffc80ff2bc5a5d2a255faee4 |     
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/7ba0e9b4ce01932e19af5af157ddbfd9e9be5567 |     
 powerpc64   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3b7d62f2d6a148fe286f9c7a490c710d613b3c74 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/977af7afff7d2853f6d8c9ac9aae8f852cf7bbbf |     
    or1k     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/cd396b99fa0d6c98d14c320ecae62306ff2958fd |     
    m68k     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/259a20b7609ad8a629cda5fa89a7a2c4e701453f |     
   sparc     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3a8c188ec86d28b8e7e9ac0387f75b52d3f1af09 |     
    arm      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/5a3e2f251979a38a5d76d2440fbebaaa8b045684 |     
   mips64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/31db48a0e2b22c6080bd0c563546c2248139be0e |     
    mips     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/30a7c40ac02d7585bebffcf7cd2e7afcfd10789f |     
    arc      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/53b6710966f4d0fae66b370120c656f04d697b7e |     
  sparc64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/1b97cb69e48dab410be2120a15f969ca1fac4ac5 |     
  mips64el   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/c810de3507a8ef55aa65c6b655ef3c57fef34f4a |     
    sh4      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/cdc8026d17b9f43361287ffe21ffd951d1bcf03e |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/d9b393723ea2184f956a1da80d459cc9aa9cf647 |     
 aarch64_be  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/0726bd9e95bfccb043273cf1075c56905687f983 |     
  powerpc    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/c591981b0d769c976b54d9f1e2e1474f20866f4c |     
   mipsel    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/0aaa42b295d9ee5101744a91ef164a46184b4f5a |     
   x86_64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/eba1c0a34c19071a911fbef2c689d36f11a50568 |     
    mips     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/4515973d7480c0995d425095c6b897edacf0ba2f |     
   mips64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/c15b1488969a4bea6c36efcc83259e31e7e29436 |     
   mips64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e2e52a232c949d2a91d86b4f8683fda60bd0baf9 |     
    arm      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/5fa687069da84d61d2fa832bbc80eb5bb9aa6c78 |     
   mips64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/d7337a6891f7e8f44357cfb2aaa71187a9b83d67 |     
 powerpc64   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/54c14a444ef8ddec3ed80dddeeda4410c86a7a79 |     
   sh4eb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/0b1ae333a63c812f373d3a15f7655b30f727d3e2 |     
   sh4aeb    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/a10cc3855702554ab081ab63cf89de2c38e549fb |     
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/df7b5cda74fd3cc5d896d7153de36695144734fb |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/68729305c481aeaae53f4f267a371269a9e176a0 |     
   arceb     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/143b92006243659d9bd3610b573396a269950d84 | ORPH
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/2306498c148022084db2cd0af5dd2b32cfb39501 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/e610392d0d27c1d2f8c912b1bebcb16a5513bed7 |     
   mipsel    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/8c67098c66ddf13f24a9b0ba38be4c8fbf0b09c5 |     
    arc      |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/bd5984fa3881ec7b81bdb763cd09f1ccebdbe9b9 | ORPH
   s390x     | uefisettings-149bc92970949d... | NOK | https://autobuild.buildroot.org/results/f3fc6e7e71246c9a3a979f4e391e60a48d6a7759 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/4e46ff7ae2d2aca52a6031c5709889031f08c76f |     
   x86_64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/4a1306e9cc8503a440f4e3540d7ed02e72f9d600 | ORPH
   x86_64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/0cf1ce376d5b0ebc4204e116860c4ebd66adb3b6 | ORPH
   mipsel    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/ebe5b4e0d95470e3ee888ce90eb903a1ae6e5774 | ORPH
   xtensa    |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/16280282a5a5b83fe6565fcd7315965bda104d9b |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                libcurl-8.16.0 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/c2911a0e2cf41ac3a0d7ab3d7ce1abd8e912b928 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    brltty-6.6 | 1 
            gettext-gnu-0.22.4 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.82.0 | 1 
                libheif-1.20.1 | 1 
          linux-5.10.162-cip24 | 1 
package/python-flask-cors/p... | 1 
             parsec-tool-0.7.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/a8d0596e20c13270a34287ff07ce720dbd13e86c |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/df9846d00efc8346194b5ef5f5cfa377c6ee2e23 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/944175a265003ba5044b83ece25e3f01ff05b950 | ORPH
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/414ae0494479b7a12fae7ca1931986cfe40620b7 |     
   mips64    |         libheif-1.20.1         | NOK | https://autobuild.buildroot.org/results/cef027a126cfe0b27cb34e79cdbe51c052a03682 |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/7def020a0afec58577df152daf42da948276e034 | ORPH
 aarch64_be  | package/python-flask-cors/p... | NOK | https://autobuild.buildroot.org/results/c6256d3c1ddd70e61504ac64b9f7eafbb7381e44 |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/ab2634f1c51dc364579da941a5597cd189244d8a |     
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/f2c7f77f93ff9f109c01b0f16c6ca4d16061dd7f |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e1ee6b9afa791e3d9d0875ffd23779513181f667 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/79ccdd9abe269ce3f4b37bd0b8efbb350427b132 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

       host-xapp_xkbcomp-1.4.6 | 1 
             libgphoto2-2.5.27 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |    host-xapp_xkbcomp-1.4.6     | NOK | https://autobuild.buildroot.org/results/58b7d37c305ed837267f7d2905b5e655f7815d11 | ORPH
   armeb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/ad6cef468cf2889b4c72069baed73cbee5d976b1 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

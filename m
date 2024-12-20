Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B215E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 04:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0DFE6074C;
	Fri, 20 Dec 2024 04:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g21q4zBdmRoQ; Fri, 20 Dec 2024 04:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DC7160722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC7160722;
	Fri, 20 Dec 2024 04:26:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F97D6C
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 04:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5412B606E3
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 04:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6VOY2b1ELu5 for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 04:26:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94C5A60690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C5A60690
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94C5A60690
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 04:26:45 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3ea065b79so2054668a12.3
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 20:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734668803; x=1735273603;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xMxjqifnqR5DdUEAkWZErubH8O+yQcQDMNADRhm3XkQ=;
 b=tc3nHpRe7K20cBviGGt2i+lAKnGUvj91XN37CUQK1FTF4uypxWLh2yOXOF7bOC+Rf5
 L+eE/FZ0aZ3YMVnaA9AJlgDmtX5aG10TllODzNnF1/M1fplS6V4qli2p3ywM7q5vQ5vy
 I27T3xxBwc/FUnS2YeGIeZSvTAdBcwyzVOIjM/MZAmpCEq4a4lGqbwkBW8nHO/5ch2Ap
 9Pdk0uGdmZs8dHD3OE3mf/PeesULiHj8jk0K9QOWPioghiOzYRZ9hX9hMILiiAl52yn9
 m1jieNiiHcTCJlhOH8olxeV6nNkkYoWGjEupIexpJvkSV3tgK/vf6BduHY20JjkxwfyG
 0J9g==
X-Gm-Message-State: AOJu0Yw5+WBVh9bgaiu3rgYq987yJXAFSHn/k/bHtTued9TS9uGIX51B
 WOfWxtVshyGnbEFUbjV8uvAEo55bSFPgcGl0nD4p95ZbHTbWX0OKwXeKgA==
X-Gm-Gg: ASbGncuW1YfVqbvtvdCP0XZ6jxF7ggVaI0dykFH3g1svdtUHabHzD4DpggDl7HJgDIn
 pZ4/YnW8YWQCerwnPJcJOcyF9NhfTl91jSnCzAgVHhaVtyDlitsphZnqGtyaEFhqyCrmWo/c6Lm
 3+GYtnaVz6Vs1w+VN4+sAkMgDdgBOoXM1fEG1rMtIbK0s3V4J8VMIyZ9MbblWjiDWsuibN5DeR/
 xCyXRdbVNABKiyEDHOFckp7iJ6pqujDLbtS9eIOZCS+BsqDcYEANtr98D4h
X-Google-Smtp-Source: AGHT+IHAWpV2FKmLAxJBqPgxeSSqN/PDy7YP4e5BgHGiNgYSE4yK5j2dEJ7duArrz97caK/oaFfQcQ==
X-Received: by 2002:a05:6402:214f:b0:5d8:f3:bf43 with SMTP id
 4fb4d7f45d1cf-5d81de38bf7mr880509a12.34.1734668803113; 
 Thu, 19 Dec 2024 20:26:43 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80675a3d2sm1297266a12.16.2024.12.19.20.26.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 20:26:42 -0800 (PST)
Message-ID: <6764f202.050a0220.142ef5.5229@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 20 Dec 2024 04:26:42 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734668803; x=1735273603; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xMxjqifnqR5DdUEAkWZErubH8O+yQcQDMNADRhm3XkQ=;
 b=OnSWYpsE3MAtQMGUSOeBW5Wy8e/uraWVGBKnzR11dtbrYyiDWkiZWh88/4YMyw77r5
 Og9ojZxyaKLtof8sTNYPLno4vnLpI19Ofjgjke8hGPi+hGOIA4oYfWw4OCoXf2JHSdZR
 OzFLZ+nJ5wW1C2h6MSxLQvL5TTQ6A3bD6tVgjxg8HH+UsugBPBUw4CgpgzP+EXQiqCpQ
 b6i8qwadtSNBHoPv+fOYCBjRpILtShM4aFUB0awT+UyAvga1cTntmHb6pFKQM4shvg6r
 FyOum3Z6irQhTaciLVZF5Djd/wC51sPdfRjKJmR3W0kTFU/YCjdAhSfjNwZfcuKdmS85
 oXkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OnSWYpsE
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-19
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

Autobuild statistics for 2024-12-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  6  |  0  | 11  |
  2024.11.x  |  2  |  5  |  0  |  7  |
    master   |  6  | 58  |  1  | 65  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 6 
    host-python-greenlet-3.1.1 | 3 
          linux-5.10.162-cip24 | 3 
               postgresql-17.2 | 3 
      python-autocommand-2.2.2 | 3 
       freeradius-server-3.2.6 | 2 
              host-rust-1.82.0 | 2 
           oath-toolkit-2.6.12 | 2 
               procps-ng-4.0.4 | 2 
                acpitool-0.5.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                   bullet-3.25 | 1 
                 c-ares-1.34.2 | 1 
          cryptodev-linux-1.13 | 1 
                     daq-2.0.7 | 1 
                    emlog-0.70 | 1 
                 expect-5.45.4 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
                 fwts-24.09.00 | 1 
glibc-2.40-18-g564178076272... | 1 
         gobject-introspection | 1 
                 hddtemp-0.4.3 | 1 
          host-binutils-2.43.1 | 1 
         host-libxcrypt-4.4.36 | 1 
                latencytop-0.5 | 1 
             libargtable2-2.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
              libopenssl-3.4.0 | 1 
               libunwind-1.8.1 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
                lmbench-3.0-a9 | 1 
               mariadb-10.11.6 | 1 
              mosquitto-2.0.20 | 1 
                 opensc-0.26.0 | 1 
                   swipl-9.2.8 | 1 
             util-linux-2.40.2 | 1 
           v4l2loopback-0.13.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/c7587e2259ad59782d70cc3b32aa19a29709b494 | ORPH
  powerpc    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/bad274658f79c957d2c3a3a3e928959c5b4ee445 |     
  mips64el   |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/baa687223e26c9efd7e269d22df5c9b66403abf9 |     
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1c557cf5d9296e1ec378008444e9e4bf3a22070f |     
   sh4aeb    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/82b99c5d5c2768c5535b315d1cf4b3a3f27abc6c | ORPH
   armeb     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/313e9744c130df1e2222e1c0d998d26be1704be5 |     
 aarch64_be  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/22a392a8f8dc48d8e1138fa71162c5c7c0136b12 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/1cba613d1d9a2ff0d307528f0e57b9d5a3b74ebe | ORPH
    mips     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/a206402b9e95a580b0f0f0db955067f13b76eb79 |     
   x86_64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/b5298613f9b4a349cc81729e4186deb9149683a5 |     
    i686     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/bfc247f147494c84c3d44930412e0c522c2a0f17 | ORPH
   nios2     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/947d36f005301acc48fa772012e932720df13993 |     
 aarch64_be  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/a333d323721be692460c0c4799d26eeeaac8795a |     
   mipsel    | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/9523db74464457a5834b3d8f65a3d8484fc6f44b |     
   mips64    | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/e0809883442112bffa462b291c9e77ebefc8781b |     
    arm      |         fwts-24.09.00          | NOK | https://autobuild.buildroot.org/results/8d9085a210a229f98e7fcedbd3b2c9b922cc1c9f | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/b92ab01566e622b5a945311f0a067520eabbb40e |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/a467f5e313bfd0462f20a367a6aea9b735644958 |     
  aarch64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4b7ee1fc8f759a00702f680cec1bb05198af7df9 | ORPH
    sh4      |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ecdbf27e81077a12fda13be31ae41be67ac72cdc | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b2857f60f1371701e4433e3c2553d00ce211ef79 | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f89e5998011b774b58050bfa157822b3f9a20be7 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/35ff3bf35b73517e175e3da02420a5381e88bd0c | ORPH
    sh4      |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5de4c5ea6b650742955c90827107a7c560ba4cb9 | ORPH
   mips64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/bd0bfaf53977c1e2cefc0c72bfb6fc27fc3187be |     
   sh4aeb    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/efb1e6beb5bcf9384b649af9398099657bbb524c |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/86821dfa76619f7ca41461b70b640ef7d8c5e671 |     
  riscv64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/6e47383f00b224ddc3be5e56c92f774d79496453 |     
   x86_64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/d369c28aea66d1fbb73fbe5817c50a2ed7ef7df6 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2a41c2d71b51699f47341a0bfc28f50e3d4a32cd |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/5ae9d158f3becc1b55d9df0e3f620a079e8b5690 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/5bf029853972e4967bb782c303313e378e64019f |     
    mips     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/2194b4ea8a594d0c4893a992f3e8d0a7878d2bb4 | ORPH
  aarch64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/ee8f0e54e58f843fac91e89008468ff571abe835 | ORPH
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/29630588552d1fc2124162ebc0fc2b66d2b74cfc |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/89408d2daf54c741994e02ca06bb6ddaee8ffa9e | ORPH
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/081c1891a7d0f9939e952a3f75a0bc864af2f30a | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6cd23b19912303c84fc7fca093b0160ec4049276 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5b245457e6104debd4b93115a2ae75e1e03309a1 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/30a0f1332a214612091847af7f329166cb926af0 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d69c4790939b856b4e0362f7b2c4c45d7eb2d7ae | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1b24b74768a29f6193cd5decb2b2b225ed295151 | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/99c729df1fc0a68e6cdb7742a903632905f49f59 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/b93368997f6a6ab3e0b28ff72fc12a3912188fff | ORPH
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/fa7d3edac4bba0f70bedc7106540bc348c7f48df |     
   mips64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/e2343982ea10bd12f93f73fd55e96dedf3c898f4 |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/5fde23cbf33accb7c81bcc3a9d661c1f7d963155 |     
   s390x     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/28fc7a6b0cf8ba614abd44e1de0c6485a6863c0c | ORPH
 powerpc64   |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/b6a4d094afb82358d7331300c68c1003e706f519 |     
  powerpc    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/d290d49f666d1e867739bd28db6069befc2c6bfa |     
    arc      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/2fe4014c96fc7909c48dfd57dd7ee4f9643b3636 |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fcde43475221710912011547da433cbc798b16d1 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b2e89da82a03f0c3fcf3b70339a6c95f8fc12457 | ORPH
  aarch64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/02670424fd44f10b5ab07f4318172cf0e125debe |     
    arc      |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/e33b405df913a0f9ba7e706ea68034186a62af1c |     
    arm      |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/7dc2d73b124fdbf1e8560857f53d9c31602e7e12 |     
    or1k     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/f4a31f5a53c0a54313ea175bb43586e4b251f9af |     
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/61acf2b09832341ed506c4bd2da9f3b17d9ec5d4 | ORPH
 powerpc64   |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/c6c6034d007f7ec8a090dd7749f9a0e5a40db22c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  linux-6.6.63 | 2 
               alsa-lib-1.2.11 | 1 
                    bsdiff-4.3 | 1 
                     cgic-2.07 | 1 
               host-go-1.22.10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        alsa-lib-1.2.11         | NOK | https://autobuild.buildroot.org/results/0d073624194cc6a56b107a7c506a22b2b5c28495 |     
   armeb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/ba0d91dd0993250474314cd952c99445e3581b83 |     
   arceb     |           cgic-2.07            | NOK | https://autobuild.buildroot.org/results/3dba515780d2494554c6c9e60e2bacd15495a5da |     
   mips64    |        host-go-1.22.10         | NOK | https://autobuild.buildroot.org/results/73b1cbd5739cee7f91ed95a43d154201aab03e1b |     
   sh4aeb    |          linux-6.6.63          | NOK | https://autobuild.buildroot.org/results/4468ec1c1a0513b59d8c1b01df122820dddcbe4c | ORPH
 aarch64_be  |          linux-6.6.63          | NOK | https://autobuild.buildroot.org/results/52a3b56b4223e12deb9f8b2849c40311357d0c6f | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

            freeswitch-1.10.12 | 1 
host-binutils-bare-metal-2.... | 1 
                latencytop-0.5 | 1 
                libressl-3.9.2 | 1 
                   swipl-9.2.8 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/d35312eac4b42e8f77ea46173807e80f3f9a38eb |     
    i686     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/42152d981cf213f785a157b272b7207cd5349a1d |     
   x86_64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/8c1141057e89b5436a30e5c1cd6b0b97ce07f130 | ORPH
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/b16b80c290586e6aa5e766a7cec4a4fcc84c496d | ORPH
  sparc64    |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/15f5430e520f89c378f19555aca270d5c9245724 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

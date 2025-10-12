Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2A7CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 03:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBFC40E73;
	Sun, 12 Oct 2025 03:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyY9h2rB0J1K; Sun, 12 Oct 2025 03:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F224140E58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F224140E58;
	Sun, 12 Oct 2025 03:20:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DA45195
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 03:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53B9760ED4
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 03:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWkv5qEN0d3c for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 03:20:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6ABC160ED2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABC160ED2
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ABC160ED2
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 03:20:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so2145875f8f.0
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760239228; x=1760844028;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U/YeoxTza5NJ4wnkqagi7FkU8ehyU2fWO1AZgpiEw9g=;
 b=YeQ6jFE7yH+AN3moKjQ0Sygq4CE1TPhgTlbEeyBA3enlmLAkLBFEY5v3BxtklQR/10
 EoS2WlsckQbv7+KTnLzsPbp/s5LsR6hZNaZs2OjzVsvjnuCxKR9Ppz5wXzOyktGqUlxo
 XfotZGgQ0WwQPI12zW+r2UPpkItNpoTw7NDVCmgv/Jvz2aep1QqrHG11TbKbOdtjs5ju
 rjt3tG7zXNBESu0JrazlEnyyoo2rVub8U/aEPgBMeaaK96oLg3aJWqBcUr7x4OxgTZNR
 R/r2aNe+4RKgcY84uKiEQPq0v+WiOclg7M4EMUQFXWUE1ipg0Sx84d+Dzp6smPQG/l4Y
 sI5w==
X-Gm-Message-State: AOJu0YzM4uJ4i0TP861VBv2IZ+xlu0XecyS6ljyQYSvkWXGFouuLyH1Q
 bXQcIZtKMXlMza94Z1gNPvuKtxQEge5XZf1/+NDBpajUyVfXVSccBRYaGWaXiA==
X-Gm-Gg: ASbGnctAOONBgR18tCfF0fIeOZG/xMb3rvBlf8i2aRTYfR9QXgWwlQZmNQR+4OrI1ne
 mjHYVAYg+DCootnB8XIzcXkAAaVqr+NQLtuvxOS32R/s1kmcDxlHwsmWoiU3uosKhw+WYr7T2hp
 7lbSsRkg7bodMTheHA4Tp+91XjZTTKnGs7hGhjEKQA7DDopNi4EpimbHqz3RvUabIAHNVXU4GAx
 56n873z7/wgvMgbbZUD5iSq+H1gmApJEsan3zMc6vbBz43f/JHUpSnPlaToQUgbvtPFl8Mv7uiU
 JE6zWeo3eUvxvEhk1pfSQ4i+ZY/y4EcE3HHuQjEeN5QPXZ/STCNhWkjP6zbJ9LKh558PJqEkdJY
 EIs213La88cSOKtPhYd2wPg/mKRXOnhChIZgotVR3NU4AzpVVQe+uBX7kW8aZwFDOV4IGwA==
X-Google-Smtp-Source: AGHT+IHb4MSwozFCFt6D+o940PmBuixu0JxVqnpbgizP6Wtlhr970Gnm6MxNGIoBtaZlatNqok4hTw==
X-Received: by 2002:a05:6000:186c:b0:3ed:e1d8:bd68 with SMTP id
 ffacd0b85a97d-42666ac6107mr8625205f8f.7.1760239227862; 
 Sat, 11 Oct 2025 20:20:27 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b99fsm121074995e9.3.2025.10.11.20.20.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 20:20:27 -0700 (PDT)
Message-ID: <68eb1e7b.7b0a0220.ba434.fd60@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 12 Oct 2025 03:20:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760239228; x=1760844028; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=U/YeoxTza5NJ4wnkqagi7FkU8ehyU2fWO1AZgpiEw9g=;
 b=mrywpiLlLC3YLaQ63Bmo9gfWIajKjpjAUnDWHmasqKBtHDNEbCd4rxzT0DZWV6zPhW
 uhSMD9U+zvXBwIBByPXnG3AfT41Vt2hum3WT858C2PoR7wyVRmCuO2uSrp1i3GHYFb4+
 OAfMtk2+nGc3qu/pwau/sDqImBwi+93QWqrhhtGq2sIiLPIVgdV7JKusiyw5Yva5DbSl
 dT84NPFJolvh9+Qzoode5PPzmayFx+DRtDPhJOdu7VWaFg9KcV40E6s4kJzaqv8YXufW
 gJGqZBZnWsMv/G+5nvjC5gTK4ub121jqM6MY/rD6s8UVwCE+YGFAB3NitZSAze+fGN2b
 Qh4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mrywpiLl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-11
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

Autobuild statistics for 2025-10-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  |  9  |  0  | 18  |
  2025.05.x  |  1  |  3  |  0  |  4  |
  2025.08.x  |  2  |  4  |  0  |  6  |
    master   | 41  | 83  |  2  | 126 |

Classification of failures by reason for master
-----------------------------------------------

 ibm-sw-tpm2-rev183-2024-03-27 | 6 
libdbi-drivers-0bfae6c43134... | 6 
                   cvs-1.12.13 | 4 
                      fio-3.41 | 3 
                  linux-6.17.1 | 3 
            micropython-1.22.2 | 3 
                python3-3.13.7 | 3 
             berkeleydb-5.3.28 | 2 
                 dc3dd-7.2.641 | 2 
  gobject-introspection-1.84.0 | 2 
              host-swipl-9.2.8 | 2 
     libphidget-2.1.9.20190409 | 2 
                  libsvg-0.1.4 | 2 
                 linux-headers | 2 
                   perl-5.40.2 | 2 
procrank_linux-21c30ab4514a... | 2 
        s6-linux-utils-2.6.2.1 | 2 
          aardvark-dns-v1.16.0 | 1 
amazon-ecr-credential-helpe... | 1 
                apr-util-1.6.3 | 1 
                     avahi-0.8 | 1 
               bctoolbox-4.4.8 | 1 
                 c-icap-0.5.10 | 1 
              dovecot-2.3.21.1 | 1 
                  ffmpeg-6.1.3 | 1 
              fftw-quad-3.3.10 | 1 
       freeradius-server-3.2.8 | 1 
                    gcr-3.40.0 | 1 
                 host-gdb-15.2 | 1 
                  iozone-3.508 | 1 
              irqbalance-1.9.3 | 1 
                 lcdproc-0.5.9 | 1 
                lesstif-0.95.2 | 1 
              libatasmart-0.19 | 1 
libdill-32d0e8b733416208e04... | 1 
           libfreeimage-3.18.0 | 1 
              libmhash-0.9.9.9 | 1 
                  libnids-1.26 | 1 
               libtheora-1.2.0 | 1 
                  liburing-2.6 | 1 
               linux-pam-1.6.1 | 1 
                lmbench-3.0-a9 | 1 
        ltp-testsuite-20250530 | 1 
                 netsnmp-5.9.4 | 1 
                     nvme-1.12 | 1 
open-plc-utils-1ba7d5a042e4... | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
          perl-net-ssleay-1.94 | 1 
                    sdl-1.2.15 | 1 
                 siproxd-0.8.3 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                   trinity-1.9 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/4eb13e16b6c0442ce046eac9b5aa1cbbb67b7ff3 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/7a3f768baee8ec8a8cda88481838d68f204c3ac7 | ORPH
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/c9809dcb79da5766d10348982eed968ded26a8d8 |     
    arc      |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/a036e7ccfc17563e9131ebacd3e040751aad4fad | ORPH
loongarch64  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8002b2ac166ddbfa9ea13d2a69a34702f8c6fb51 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/faff87e7487f5f20ad4fc8438b36128331f34cac | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/55f92f45daaec475d29c7cc885ea9cfd8ac5b3bc | ORPH
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/aaa032cf3b008a780a9bb05f6b3ab50ca14235bc | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8afaa569fcb57b5c1d3c3591103099a6a1d62172 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/797bdac596999d3a57e929c6d7001988efa5a5fd | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6e02fed4572988403c4c06a335416d38cd42b4e7 | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/01c2983661ead58a1196df5b935a2b6d9da8286a | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/18401f079f38c25555acc5fc40baa6baf3342783 | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/7839ff21ce5d783a0ecdb5853f140fb0173f64b8 | ORPH
 powerpc64   |        dovecot-2.3.21.1        | NOK | https://autobuild.buildroot.org/results/80d906db9c8bdf484c90484ec2361359cb67aa70 |     
   x86_64    |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/40903a539d1d26dd325eff162756294d7d730871 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/497869ba52ff41cf1fd81698486f3316d2a089f0 | ORPH
powerpc64le  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/850f795e12bf2666af22c8bc02878b35e59eb721 |     
   mipsel    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/5dc1376f19547339b8977849e6ef756ba837931c |     
   mips64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/a79f2d0e44da08ec8dcf87eeef6f56f43c156d9c |     
    sh4      |    freeradius-server-3.2.8     | NOK | https://autobuild.buildroot.org/results/aada4a3a8282696d6ca4b2c290423ec8d2dc4fb5 |     
   mips64    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/a64c35bfd8a2127243a93fbfd211514960f541dc | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f53bdfec337eb59e3f9984e4d924c76144343832 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1fb279fcaf838268e7dc21f7796e8fb2ff4f33fd | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/50484b01981c7987cde268777b7351a22a0090bf | ORPH
    or1k     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/d6a928a0842f0500c02726d09684a8b5edf78881 |     
   armeb     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/7ba8f05bf3dbc272fb3f2a5eda827be551ee97a1 |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/4bc8df69ddb9533de7d877c42e5f7c39192ca454 |     
   armeb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/530269c52c72221d00f4cfda308c8cb59c8adb81 |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/609575db96b824b35bdb3c9c074d33b5dffc1008 |     
    arm      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e5f5f10b9ce14f7b3943c3555951f1522fdbaacb |     
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/522dd1fa6e982338a79735a6f76094d44a4fed8b |     
    mips     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/8b8a26701c69f5ce90f99315b4257a57f1685ac7 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9b4c71dff9e0e914f6c0a256fe08ce7b22bd8e74 |     
 powerpc64   |        irqbalance-1.9.3        | NOK | https://autobuild.buildroot.org/results/3e201d5190f93de9b28e9d12670bf337764e9e4a |     
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/d1b4a1fed5fe7664bf706af3215e131d4f0d9743 | ORPH
    arm      |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/0eab85dd5f54bb54945dc04a444aaf7577906d3c | ORPH
    i686     |        libatasmart-0.19        | NOK | https://autobuild.buildroot.org/results/1eefcb1fa7de5c30164d355ecd7d5ec917279a64 |     
    or1k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ac8fc11671285983fcbbd5f8cbb4bd95e752b575 |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/b48a185f4f2697c8f04176e7827a441c8d722892 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4bc30adce1b06136d65483a0b4b65fb38f75e689 |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a4413e01a9c1206e9c4254586148d83b5c2644c6 |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/bcc7ac991f08ff92c4bd78a193c5731e56e6b1f9 |     
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/999b5350e4ce4a318368c78356049a317c7b063f |     
loongarch64  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/a1e672c8370be395686f301355d4e5f1419b5124 |     
  aarch64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/33ec7518a85b47b687e3181bf0823dbb37fa6fc2 |     
loongarch64  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/7eb90715a661606adcfc2900d8bc2be930529196 | ORPH
   mips64    |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/9159288a0da23d4fa92b3a2a0ed9ce344329c86f |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d6ebe1fdd59d928e85cead15a6dfa8a006837672 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e3c641c5aaf49287f1f5d246c6b1160994562e47 |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/367269531dd7aeabaddcadabcb9e3eecaeb0364f |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/9196549937f6ba698a4e09d808b5557eab1d1322 |     
   mips64    |        libtheora-1.2.0         | NOK | https://autobuild.buildroot.org/results/fb48b35dafb4e0ec8026ce1908d13a5db65fb3ed | ORPH
powerpc64le  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/0a5a99c68c948434e9cf2a953870fbf135d2e1f7 |     
  sparc64    |          linux-6.17.1          | NOK | https://autobuild.buildroot.org/results/1629187649deacbcd0ac8a5827b91d602ec6ad3b | ORPH
powerpc64le  |          linux-6.17.1          | NOK | https://autobuild.buildroot.org/results/5b7ef3d67234a92b0145a44ec1bb6ed8e6075aa3 | ORPH
loongarch64  |          linux-6.17.1          | NOK | https://autobuild.buildroot.org/results/7133be874ae90b3e1649764be8e5ee70d3fd35d1 | ORPH
   s390x     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/0e7ed064082f06b35e48cb2336db6991cd424f9c |     
    or1k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/bf6bbe8ca8794cee66077f34bba6905588954e93 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9264c52684d9c4c1ffafd25991186515f13d7351 | ORPH
loongarch64  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/233665fccb445fc57c2adf254bd1a4bbf081a740 | ORPH
    m68k     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/64260bed420563ef6cc95ef1f527366851261515 |     
 microblaze  |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/a623366e1adde4db24d6af6655f605f2d8d88a62 |     
   arceb     |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/3d0239c726e2257eeaefb6860630a5425c8f840f |     
microblazeel |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/b18d6fa9938c1267a771fdbcd8b4c3df812cd6b9 |     
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/582aaf1e57c371fecb734e2047b585ade74faf49 | ORPH
    arc      |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/f518aa5599edd07d0b21d11561162c65adbefc19 | ORPH
  mips64el   | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/dee49c6ad2cc79dea3c7512b0ef90f1336f1aca4 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/89abe26ab187421961704c4e73a6448aa686fa7c |     
  powerpc    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/18a2136d7d38ed7d3d1c8141a9b74f959a27779d | ORPH
   sh4aeb    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7fad665625bbcb89ad9d65df64a2c2a7ad347d8c |     
  riscv32    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/aebfdea2c6ea6eb25afad001ae2c92f6dcd03f4e |     
    or1k     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/06d95230e06e7eb877faaaae8d876a04448dde64 |     
  riscv64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/70969caf0020cf90b1c617aa31fae4b1670a8aa4 | ORPH
   xtensa    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/3b78e59045f69f9cb8ce8576cde720004fafa111 | ORPH
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/90d061077afbccf9cfa63d7fa5ca0a05945fc05a |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/bddfe5e78024e8064af61bc6e9fce81b6fc70bde |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/30410f3a62f3469e7d5458a94d1bf05aa4818ec5 |     
   mips64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/1237426cf2ed36ba5cccf2884a8cfa5058dd20ac |     
    sh4a     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/2f88a37f56adb362c9f0a747c9c93f08bbefa8e7 |     
   armeb     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/e962c6a077d5e54daf55f04e4d1d3af1ecaa2b01 | ORPH
  mips64el   |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/85fcb29ed5cb9f3e3b8beaa1e12f76243cd7e621 |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/ce5b437a51380c149f5a446183440ba484972e93 |     
    mips     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/469c248e2dcea1a6d12c28dc48b18811aff116bc | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/ea88c9d6799a69c273f2b522ff6dcbb3d7c6f0a3 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                   atop-2.11.1 | 1 
                  cairo-1.18.4 | 1 
                 lapack-3.12.1 | 1 
               libunwind-1.8.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          atop-2.11.1           | NOK | https://autobuild.buildroot.org/results/5c922bb2ad757f2bb9ba0439c17ae6a02e125e65 |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/667414cd9f006df202ff167eb7e7c6b05994f448 |     
   xtensa    |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/9fa2cb9631774ad9154034849b9053c045816f43 |     
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/a42a87c7a4116def6835aa43d7d182fc4797240a | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  ffmpeg-6.1.3 | 1 
            gettext-gnu-0.22.4 | 1 
                libcurl-8.16.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               mongrel2-1.13.0 | 1 
                systemd-256.17 | 1 
             tpm-tools-1.3.9.1 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/2ccb44c24dfcce8e61c246bfb663e6acad12e5bf |     
  aarch64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/eab223e23146a9fb93205d83193e5acd381071aa | ORPH
    m68k     |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/2eda16decd062b2450fa67007646123c2a34d3a3 |     
   arceb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2063ba4b3312e5c8c7f27e4e3951f3269d112259 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5723fda3689c6946369c1e2dc014334c7b9107f1 | ORPH
  aarch64    |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/6b0f748fa249745bb45df98e6b081bdbf41375fd |     
   s390x     |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/d4d9d0548d515a7640bc7e8a53f322076f57d476 |     
    sh4a     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/a94ed49932271c6c346bc56f99bf5ffe3181da6e |     
    mips     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/59bbc8411980f85a8f018730bfe154f865b4bb74 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   crun-1.18.2 | 1 
                libcurl-8.16.0 | 1 
           uboot-tools-2021.07 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/c4cef6112ef1a6b1df85b464fa3013ed62c9dfc4 |     
microblazeel |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/7f69755ca3c597e0cd3f7d6fe655af903ee63438 |     
 microblaze  |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/b3a64d12f928dcf3267577ae242e95e072ba70cd | ORPH


Gitlab CI results for 2025-10-11
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/11652711064 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11668654692 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/11668659430 |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/11668660854 |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11682648626 |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11682649081 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11682649162 | ORPH 
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11682649958 |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11682650501 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

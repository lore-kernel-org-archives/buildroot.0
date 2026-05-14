Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67854CD37AC
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 03:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB71840CE0;
	Thu, 14 May 2026 03:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tff3RNUr9fav; Thu, 14 May 2026 03:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A769E40CE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778728671;
	bh=EzKy26JYZoBOwidSBj+LGvcZ8rlFklQ00h0Kigor13w=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bnjg6ig5hEPZFejWs1bvxPpmCVg1FV4I/9n6gnAHi67F+A69Ayak6Yk99ZluuJ/Sl
	 CGcPqGICjRfP5IrwhApG6tgwGKExpj8Nk44ZXLAZ86+5ZBA+W7tp5s/eUbTaMp6IOQ
	 B/xB3QuJNRSEY+0PjfeaBiAELMSxK4m18dIz/akpxoqX5V7wKXrzPQBc1zLH7jxEuP
	 3ZjrwQWZPajC5kOec1zAqoDFgwLZUhfOpD1qcJRW7/cGfQB3rtANo+mNTYK13YD8/l
	 txOx69Eoev1ar+3WSics3UYln1qyOAqJtutX+Y0GhmxUp72IkQfq9i6kwDp76p6APc
	 PZCmIaWRKbEJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A769E40CE2;
	Thu, 14 May 2026 03:17:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78D38223
 for <buildroot@buildroot.org>; Thu, 14 May 2026 03:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7671A40CD9
 for <buildroot@buildroot.org>; Thu, 14 May 2026 03:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CD1jHCVWZJAF for <buildroot@buildroot.org>;
 Thu, 14 May 2026 03:17:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E18F740CC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E18F740CC8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E18F740CC8
 for <buildroot@buildroot.org>; Thu, 14 May 2026 03:17:48 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so124187475e9.2
 for <buildroot@buildroot.org>; Wed, 13 May 2026 20:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778728666; x=1779333466;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0AVloHKjNa7U6RK2u7W92dXCjmERdQnHrki0og+qQgs=;
 b=XmQcqTymwh2r/XYh8XNhyKPeZ1Isqq/zQbyG06Tq42Y3gQeqU/o2RB92oiuF3XRF0S
 iS2ldpkJhMMsEH2jo/H64a0IDBmExi5zC1OGB3GpbTM9etVAwhLtZH67gfLYLGKHjM9F
 kR+vMd8Fz0djnsM6R8RnuRyL0aw0ydWsYIhBYb1hS2UbIV6pX0BAm83jvZOMkN6UH594
 k+LqNNkZB5SAvx4T7TYw30QBzkFa/Za700w7Xm5Jnk9dTluhr0UoFjRsl6tUGDLq3mw+
 jtCIQ3ygoJaxdzf6IkQRmrUZ629bujHuEhtCyN8IaR7Xsi6S82mK6TEH7fAd3/2r9I1v
 9zuA==
X-Gm-Message-State: AOJu0Yw1aIXOrSsBPZJ6juEG5+FlJfEI6dSCbvdVe0gzuWhDQZ/XDCtD
 85mcaq4RLmjVPV01sbGfOe0OuTR859L5EQmqRwzG+1rECyKI5ieHk4BwlOkeinIG
X-Gm-Gg: Acq92OFSTlzm43J1inblT9TMkieo4l8xtIUDwXWYXUHFAZ2Urs9G04kgroHnwQ6Q9x9
 oZ0YtSSTOtlGYaTCeJKl7gy9eSG38Zr4iluNzJKtcDqoTkNRaqCG8LDOTDqkIBm+3D1w6RlARkS
 SPYK55g/Ii5BIIq8Jdpy9rh41lDm9avccGkIvi5yMTgSkfA7o7M1zEiiyMtCGeMl0JMmg+YxtWQ
 aqY0N0HNGNftbm3bHkHkpLY4+lzs7CQmyJMPVdjN6u1i6Tw1KN+3K8xSN5lx2PGf2gbOIOnTSwn
 lANa/fCyMS9sG2L6e4vc7YN0Dpk1C4pWgO1ZVynlqV53l3zbXsO3ENbhRr2957Sz7fDpnlHoo4j
 M9dwVNrGsldOWIMoTSV/0xp3ezKXxaJCIWTt+RPhZYXRj+AbmesbEtAC451Bn/yK6FnPS/n1s6F
 D61lFDA2d7NAS4ZXFIl96HtIihHVorqg==
X-Received: by 2002:a05:600c:474a:b0:48a:5501:7995 with SMTP id
 5b1f17b1804b1-48fce9ef1c3mr77465755e9.18.1778728665952; 
 Wed, 13 May 2026 20:17:45 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd6498cdesm40237345e9.5.2026.05.13.20.17.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 20:17:45 -0700 (PDT)
Message-ID: <6a053ed9.f844783c.47223.143d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 14 May 2026 03:17:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778728666; x=1779333466; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0AVloHKjNa7U6RK2u7W92dXCjmERdQnHrki0og+qQgs=;
 b=PSNW/zxUuNKroUo/u7QdSS/Hl08HCLkJ/He0ki7Og8rzbl30usdyUP2u6rRaYoeQiP
 rVAO2YYe5LVbKIeJiYn/8WjnK2eSlqpFVihMR/wApciiQqyJeJj/3JkslOYEELkfCsTp
 pzH73DEM0JUHf460mHGiRoxzvWCc0jwRg5AX1N9H/t49NSsCZdTFJDf+JwrxU3xk0s8S
 TkWiPaZXvxY5+/x+Ak/WWEDbQvMPNWCxwAYwWT+lXtO++YdmV9M1arooXKXsLNT4/acA
 U3uvfGkkgvOir2Z1ZYI77KdHOWUKkn6M77UkD5MHdZ17OkjPwMqF+/XXMYTdecgayaDp
 mmMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PSNW/zxU
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-13
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

Autobuild statistics for 2026-05-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 20  | 17  |  0  | 37  |
  2026.02.x  |  9  |  5  |  0  | 14  |
    master   | 40  | 76  |  1  | 117 |

Classification of failures by reason for master
-----------------------------------------------

phidgetwebservice-2.1.9.201... | 5 
               linux-pam-1.7.2 | 4 
                       unknown | 4 
                libnss-3.123.1 | 3 
                tpm2-tss-4.1.3 | 3 
                  cairo-1.18.4 | 2 
             dahdi-linux-3.3.0 | 2 
                 host-gdb-14.2 | 2 
            jpeg-turbo-3.1.4.1 | 2 
                  libnfs-6.0.2 | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
                   perl-5.42.2 | 2 
ustream-ssl-5a81c108d20e247... | 2 
amazon-ecr-credential-helpe... | 1 
                 babeld-1.13.1 | 1 
                  bcusdk-0.0.5 | 1 
                bpftool-v7.5.0 | 1 
           crucible-2025.05.28 | 1 
                espflash-4.0.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.43-27-g4070d808bea1... | 1 
           googlefontdirectory | 1 
               graphene-1.10.8 | 1 
                   guile-3.0.9 | 1 
               harfbuzz-14.2.0 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.95.0 | 1 
          host-xfsprogs-6.19.0 | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
libdill-32d0e8b733416208e04... | 1 
             libgphoto2-2.5.33 | 1 
           libmicrohttpd-1.0.5 | 1 
              libopenssl-3.6.2 | 1 
               libvorbis-1.3.7 | 1 
        ltp-testsuite-20260130 | 1 
                      ndctl-83 | 1 
        network-manager-1.56.0 | 1 
                  ntp-4.2.8p18 | 1 
                openscap-1.4.4 | 1 
                openssh-10.3p1 | 1 
            python-numpy-2.4.0 | 1 
                   redis-8.6.2 | 1 
                  stunnel-5.78 | 1 
                tinifier-4.1.0 | 1 
           uboot-tools-2026.04 | 1 
uhttpd-15346de8d3ba42200249... | 1 
             util-linux-2.41.4 | 1 
        util-linux-libs-2.41.4 | 1 
               valgrind-3.26.0 | 1 
            vorbis-tools-1.4.3 | 1 
                 wolfssl-5.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a3e0accbf204361d5bd6b57661cb55c8fc9abb79 | ORPH
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/c75643713fd5f27fe063c226630680d26a8b9487 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8fc29c78455a0f4c0cdf648508bd6ee5088dca50 |     
    arc      |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/0d65c6e39177e6465b8cd1c1817b95ec916e7bec |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/3899804c0cd26592fc5c178f796903ecb2603cb5 |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/bb10aa554fb504ed5ee779b6cd232b3d7676ac71 |     
   x86_64    |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/daafd5f1f18ca01c3b406cfa703a4c99f98a51e4 |     
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2f46f14580dfca9f6672ceed203aa7570305c07c | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/aa0621111372004d92a81fa9eb2bf56dc2fc25ac | ORPH
    i586     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/b722971df1c8ea296fe1c7d071ee2145e92a4a23 |     
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/c39881b937db1d0dd8f4f4abbb7240eb7ff9d9c1 | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/96c8ec732f6ae8e8d972b767435277e852b5dfb3 | ORPH
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/63514c9243906a9782685efc3a8413403ef21e5d |     
   sparc     |      googlefontdirectory       | TIM | https://autobuild.buildroot.org/results/cdeeb7f1ff54d533425388c2309588fcf7147d34 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/8390ba4820b19c7a0a8bac40bd866804b7c77071 | ORPH
 powerpc64   |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/09e683422af9211c2b7db436b245bcb737212d09 |     
    or1k     |        harfbuzz-14.2.0         | NOK | https://autobuild.buildroot.org/results/2662db52d11036dc3b51adeef3649bc3bfca088d |     
   xtensa    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6cd5904e94daff9045a27e33879dc3b931c99473 | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/682443f5d0ad1acfee1dcf443fb54b3ade3998d9 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/b257a29a4ebff0eed9289448be8ee1365ccb738a | ORPH
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/36da86856bc87cb5f70d4a248e5f73c1ec77ea31 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/e0ebe79e7ea7075ddcc0107f00557146fd654d13 |     
   x86_64    |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/6650c85fb4cb3d8df1810846ef487d2f4c5a167c |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/861bcd3740e42325374f6117f5814d7fa056626a | ORPH
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/2ae2bebe696739308c275df6c600c8031d458d38 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/89ccbf5a79462ee8981ee4fe10f09b2a6a3cd2bb |     
   mips64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/9bf8a9ccd5fc93b9ecfddf7917f06f676caaaa1d | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/d818c0cb202e659f9a3e90b5fb3f6b2389d1cea4 |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/d5fc7ee5f03c6d1aa21209c6536caed06effd2b4 |     
    sh4a     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/dfe056270ba672adc4c55183b23674860900f20f |     
 powerpc64   |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/e4871dc857052066fcfce33ac60a05026d040b36 |     
   armeb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/b15d4f6115646cb93dd148f7aea4be8c9a28c9dc | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/3f614ddc43fa340d46a05ad6f8f2693f59e0cd83 | ORPH
  powerpc    |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/3568ee4d2fc0090247864aa7ddbac9160bdc270c |     
 powerpc64   |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/5c69151f556831210221dfaed671825ab90aaa1f |     
 powerpc64   |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/a7919aef133fbeaee7054588780059366ee707ba |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/ba5bd457919a978bdd71901fe6c5a27a1af08e4e | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/2015f75078a0f752847f019271e2e45d3f824b5c |     
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b27b80daa7cb9211832dc9e493bc5a7c0852f077 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/0cf54f4250aa565a4070fd2e8daca68820afee50 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/6200204a0b3fefe566679013ae92c2b24cad5a7a | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/81c17a061280d753e11be6c1f925dd7df5fcf887 | ORPH
   x86_64    |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/0a9c7fbda8f39c67246fff101f4a66bb2171d607 |     
    sh4      |            ndctl-83            | NOK | https://autobuild.buildroot.org/results/7b00fa966be397e5b593d9fdf623348c0a843861 |     
 microblaze  |     network-manager-1.56.0     | NOK | https://autobuild.buildroot.org/results/5d60792dbf5ce0b179a91d0b77e46c3ffe6c1c54 | ORPH
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c23ef9aa2a011523f5af4598b38b79b7167658e2 |     
   xtensa    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/121415d8e82bc066394af3af1a16e11f76b06e43 |     
  mips64el   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/9b45d383063043b9cbc0c8dae7b327f9264efbfa |     
   sparc     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/2f2fc77793098ffb63e2f82711bc022b95496d3a |     
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/44eeba162ad2ca51bff18b941e732de43dd9a519 | ORPH
    m68k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/d65f85acbb5e4069d43adaabeeec4f9c153cb2ef |     
   mips64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/beedf875153f7c61af092260935f986c687266a5 |     
   armeb     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/00599b79eb3856264898629e9fba7d4ede13d0ce |     
powerpc64le  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/20d461721303b0c2ec63520fd18e026128908463 |     
    i686     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/af7d3d06ee4c11db7fed588ceae0ae6ca3108292 |     
loongarch64  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/d776d000b7b35a1f3367712bbb958dc260efd4e8 |     
    mips     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/6f569266b35e81ce4bb1862821d940dbb6104a90 |     
 powerpc64   |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/7c234a8e20a942da63838ad5d0ddc0f323dbad4c |     
 microblaze  |          redis-8.6.2           | NOK | https://autobuild.buildroot.org/results/38ac8122601b1b8dede1527ebc3d7cd69484365f |     
   sparc     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/4e081993c6be4cf8e27505cafea5c0e8ced33939 |     
   x86_64    |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/1437aa7cf80cd68a6c2eda4a15cb559f8ea04b27 |     
  sparc64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/fc63affc500891e66f82d740ebb2313d9e807b5a | ORPH
  mips64el   |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/0ff6b9c79e773d4a0106e2dc690ad5651202e40e | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/1de54f3c80b14541f5b0fd61b2116bb3807e2d91 | ORPH
   armeb     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/f5dba6699caedc20dbc19570a2461be50a6e3e9f | ORPH
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/af2235e45f0c82be503e14572d3be6a48d508f67 | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/cf4f5bba2791fd76ed985788bdd11a3426dbabb9 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f96688e7ddae61cf23f10b74b4670493b710011d |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d72df586dba0a7eb504fcc7aca13b54c16205062 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e1eb18913a2d5b2574808e7a17368b5c4f8bb687 |     
    sh4      | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/896c52cb81b4cdeab10895bcc8697eaeaa546550 | ORPH
   armeb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ec751264300cfad852fd115e4afeef895613cc4d | ORPH
  riscv32    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/2519143a66a59d5124105086880ab40cb4f3b557 |     
  mips64el   |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/7b901f8fffbb31847a08f17585aa4d2a944af809 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/f6c990af2156b9437277d050891369e1c26cdc83 | ORPH
   sh4eb     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/11082a9767daf215b30b877a6b0651410a1b2367 | ORPH
  mips64el   |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/195b990a46cc45782e37a6f0100be116e78c9007 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 libzlib-1.3.2 | 1 
                 linux-6.19.14 | 1 
                openocd-0.12.0 | 1 
                       unknown | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/833862951d4d3972c75153085d75c01f36000205 | ORPH
   sh4aeb    |         linux-6.19.14          | NOK | https://autobuild.buildroot.org/results/7b9119f9eb2223a6f1eac729edf11f3ee76f3238 | ORPH
  powerpc    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/62e3b598000cde4620be194538fdded50fc4c1a6 | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/20ecf51ca64399c2eaa4db13cfe46587d477754e |     
   s390x     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/a6bc0a84296a52f9ca89c15b0b50e956795cd94e | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
                 wolfssl-5.9.1 | 2 
                   dante-1.4.4 | 1 
                     fd-10.2.0 | 1 
                  iozone-3.508 | 1 
                  libbpf-1.5.0 | 1 
              libopenssl-3.5.6 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libpng-1.6.58 | 1 
             libtorrent-0.13.8 | 1 
                   perl-5.40.4 | 1 
python-remi-2022.7.27-37-g1... | 1 
             strongswan-5.9.14 | 1 
                tpm2-tss-3.2.3 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/d4d9593bc0c87c83d4b5ec247d2a3e74ac013fe4 | ORPH
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/81c2059ea5136de66fd63107bf83b61140bdab2c |     
 powerpc64   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/f6cb8759b396627d349367b19e44cc659a1b0072 |     
   s390x     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/ac9abcd05ca688bd64caa81e3ba202c5742db351 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/49aac12f36f85c56cc2caa481bd091294e61ef14 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/ec3d0420c260e73036eead89e1ac06f2e0ca414b |     
  riscv64    |        libopenssl-3.5.6        | NOK | https://autobuild.buildroot.org/results/e63c7b1dd2d0b9ab66d1c94c1a2684d3e2bb55c7 | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/441434b055f5fd565cdcd9a36d23547155dfc91f |     
  riscv64    |         libpng-1.6.58          | NOK | https://autobuild.buildroot.org/results/b01ac9f11d3f32e5df1e81ee066efc6148ea9a9e |     
   mipsel    |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/9ccbc3780598b38e5a09264a9c8171307e59a614 | ORPH
  mips64el   |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/4d3bb4c5944f438e292fa6b30eccff339345b64f |     
    or1k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/44c26c1a4d59ac4f0d23c5773418b5c2c9c793e1 |     
    m68k     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/bff0ca58e5dd56fbb5a3b6b80f66f44b39e4cccc |     
  sparc64    |         tpm2-tss-3.2.3         | NOK | https://autobuild.buildroot.org/results/c13b1510df1bb742ea3cfa2c9e7e21eaaf52a52b | ORPH
    arm      |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/2d09f3d744d6f6ed2e8972c80c42d0a075b794ab |     
  mips64el   |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/0592d3c769c710460fbc024201afb5681177675a |     
   mips64    |         wolfssl-5.9.1          | NOK | https://autobuild.buildroot.org/results/30cf3f4119f6cdcb48f3cdc34c942d19c50adc80 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

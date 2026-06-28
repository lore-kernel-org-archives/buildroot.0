Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E6DC43458
	for <buildroot@archiver.kernel.org>; Sun, 28 Jun 2026 03:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6AB560A7E;
	Sun, 28 Jun 2026 03:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpVUTQoqppv4; Sun, 28 Jun 2026 03:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3AB960770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782617585;
	bh=ssDuvtnlojjnhejK7yxW/xW3pptExNvkpo1Hm6LILOQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JZ/483m3SZ6BJD1J6PD9LElSLMyT0vQCzxFIZ6rquvP/rMWPtMTjQpHZmxjKcK9Pm
	 DUDlPh9JWonulr3LbnogNqHMSmw0G56hcWqlkcp0RNlLq+pt6xi92eapbq/EJMN+ot
	 55KhfaHktA59UrabT4XGjB5wjT0VajZRRI9G6FO7e/eqAEsANhFeAzDmclGAU1DnZJ
	 YUw/ik6RwqYDxvUwQYEvdVokSYX0d4aunjZUVsQSErfGkmFPAHk87vZgvfCmrwBcpN
	 bmJGs/Z+mehbTiyANvsA+mW9MxJQHhA5k0yT0yKdQtfdgCxuOq0vjh1nQ2sBHxo0Uy
	 8co67rSYAyf2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3AB960770;
	Sun, 28 Jun 2026 03:33:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 264A8BC
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 03:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C4C66075B
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 03:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtKiOy4eYKCf for <buildroot@buildroot.org>;
 Sun, 28 Jun 2026 03:33:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C1F360770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1F360770
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C1F360770
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 03:33:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47013e1996aso666659f8f.1
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 20:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782617581; x=1783222381;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDu45NsOMZ3iNXS67zrbSgrmqs2ik4GnTxwLmU6TeJU=;
 b=krEOAmbc5Vt/iKwjSor+EIlTNhFTIJ4avkBziteo9Ver/B33L/kxsT999jjy3w7cu3
 NqEOoGr6TszZatauv4wagoEDzNWzhHCSP12M026lBqx4v3Ul7ELOOIP3F4VcNjE0n5K8
 B+NNM8cxrT/g++kxkrqrTLhUHFg4qtskzBLek8hrG3Xlx+k+94bH0Y4Cgy0K9vcqv5Wy
 yYpgWiBzl+O+Mt029xI0GGMvykl8bxkir5DGoFH4NikFcM9IumrFRdg/hPiS5ObVEbrV
 KmJTJQ0/2Ct30RoiFWFkwyHdUaVZG1p//UvZ6tOh2ey5q1m0pIADyH3tU3RKfgQaNbBp
 FIfQ==
X-Gm-Message-State: AOJu0Yx+/OXSzU5/fOfCnd2K6s6JYGN2B2KYPBbwJgw8UB2ZqLc0lVan
 LdhGNQ5/ZE248TczZ4q4XRNtoh76uTh9iTdIE5vcsitQQbuSIO1pMs0gh0K5EqoS
X-Gm-Gg: AfdE7clf3jutl99IzoD2KB7JJ2LotyqcK6qZLpBLf24CT7XxKMZGPWAvjQ3lUjPAowA
 +ZddPKScbU9iVRBmoc9aBIBZMbGGHG29fXYGAgf90CsW1G5DOnyGLYiNCZmCq9C+m9psyV11oOz
 DIkENsHRjCpCnXOCV3AV2QWRh0dtORMJV7ZLkZJkKcXfPg5X8eFPsdRSiotDclU4z8h5FRgZJ0U
 wOWQ5ZWscXZPjNrasAJ2/KAxhvmGwkvb6FSeIzOhcRXTdxWnwOTTXeoteyXbILCBg8V0FAVOR0W
 PW91k0FDE+tEX0EUl0HNDQM/sLPUKCQtVydsllt/b7vRp+aE3uzWnIE9+GKJNmH0O7A6pdHqBnp
 d2ib45xFAcy5HtrxKb3eDK7nGGKBQxUeS/FJE3evOb3TeaUiYpzZT5oTpRluYF/mNQQz4n1NFJJ
 8T1gY2oX6OGQyrhSZQM9YCefqmDA==
X-Received: by 2002:a05:6000:25fa:b0:46f:7d90:8125 with SMTP id
 ffacd0b85a97d-46f7d90825fmr10279409f8f.15.1782617581257; 
 Sat, 27 Jun 2026 20:33:01 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-471490336d5sm9502896f8f.35.2026.06.27.20.33.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2026 20:33:00 -0700 (PDT)
Message-ID: <6a4095ec.bb4da8e5.a1b33.56f2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 28 Jun 2026 03:33:00 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782617581; x=1783222381; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jDu45NsOMZ3iNXS67zrbSgrmqs2ik4GnTxwLmU6TeJU=;
 b=ZH5dbePc28miWCsfKlYTKIdonEK9LNNWWywASKSu7xStgRxWCHD2Kq1L1tvA6EFibE
 eoSSaMJnCAQ58se2gxoUvB3W2gxPYYAHt3FYSi/O5JKHl5ygQbpZpGQJur9gxCwnmJOc
 CYZlkrcNnlytLQr6fb63ZfnEuCWl2n7Akt/uyquKRS6xOUbDTM4pQ198ENnd3VlhdUp3
 26IQGPRpKG4MIHlvbfs+9tWBNwByucDbHq6oLT/OFFt4fT6IhRoCV1dfrq9O0vf3u7ji
 5GdLaTZ5C/lVD/NFDsdEFRE9aqDzKNi+mKa8pYOpW1QlNjF2SrYKIVQ1aICdXl+axuRa
 tLzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZH5dbePc
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-27
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

Autobuild statistics for 2026-06-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  3  |  0  |  6  |
  2026.02.x  |  1  |  1  |  0  |  2  |
  2026.05.x  |  2  |  3  |  0  |  5  |
    master   | 17  | 51  |  1  | 69  |

Classification of failures by reason for master
-----------------------------------------------

host-vboot-utils-7dfa482d6a... | 4 
            host-autoconf-2.73 | 3 
              host-pahole-1.28 | 3 
amazon-ecr-credential-helpe... | 2 
                 gnupg2-2.5.20 | 2 
  gobject-introspection-1.84.0 | 2 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                  broot-1.57.0 | 1 
 docker-credential-gcr-v2.1.30 | 1 
                    dpdk-25.11 | 1 
                    dust-1.2.3 | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
                  ffmpeg-6.1.5 | 1 
                    frr-10.5.4 | 1 
                           gmp | 1 
host-google-breakpad-f49c2f... | 1 
              host-guile-3.0.9 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
libfutils-c326ce0cc2a735438... | 1 
           libmicrohttpd-1.0.5 | 1 
              libopenssl-3.6.3 | 1 
                   linux-7.1.1 | 1 
        ltp-testsuite-20260529 | 1 
               madplay-0.15.2b | 1 
                    olsr-0.9.8 | 1 
               openblas-0.3.33 | 1 
                opendoas-6.8.2 | 1 
                   perl-5.42.2 | 1 
            qbee-agent-2026.19 | 1 
                  stunnel-5.78 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
                 uclibc-1.0.58 | 1 
uhttpd-15346de8d3ba42200249... | 1 
                       unknown | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.5 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8bd9733f423467c1f0650e0a5ae946f9cdfe446f | ORPH
    i586     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/4f84245dc2ec6fc72d166a070ecbeaec815dc135 | ORPH
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/12b4efedc5d5a01e174c5f659d4f06177bd8d238 |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/ef29450dfe376b4049fdb3aa0239a014be5f4f51 |     
    i586     |          broot-1.57.0          | NOK | https://autobuild.buildroot.org/results/5296dd21780a5b433e4d34c1526c41ad65cdf0f0 |     
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/8cc41164a4d1d3c6bca8839f259ce7f89c2aa812 | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/0dff5e01912639c756e6e40f1d89ce3a972a46ef |     
    i686     |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/ba82abc8d9a2be9a830359fe5a9524cc7f6721d8 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/1e873399bd0a5913e7739bab8f9de56b79596e2c |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/a2ab79779f8bf83a5f5e4ba0fd1b4ccb0666b533 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/4a0361a3d1e755b72e24dbf2c2b8c73bd6bf470d |     
    i586     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/ff339c00d34c684ce3cbb07fd6739197a2073d89 |     
  mips64el   |              gmp               | TIM | https://autobuild.buildroot.org/results/1db1c1980fb803c2f834bef826502d6b684ba52e |     
powerpc64le  |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/4729d802978a7bfedfd47c6d4811151e1cff69e5 |     
   s390x     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/b65e7d4ee04956f85598a1f783a84f0868555aa9 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b0bb2988892db3c55a417feb8629d4087c583a7d | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f945fbed1942157bf6a53f5c5e96e25a8c621d6c | ORPH
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/0b9d4d17ef398c73016a3f1b5dc1e3867709f105 | ORPH
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/fdba3f8881c12cb22cac0e7e227cdf2bbd067bc3 | ORPH
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/e6d2d54bce1c399efc87269fdb52d996afb1755a | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/912ed8a083282e221bc34e451acd9b7b5d5b0e99 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/a561ab439ec24d7a8be8d43b5d6598c03c98e5ea |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/a09c4b8e92fe18de8cc5d846a7142b25c50f7644 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/5e3494e60eb2af1cb8604e27b0c0668996e7126d |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/fbe89eecead5c5518df3d42ab616e96e190b6131 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/52131da0caa635268fc43efdd3c82c7686426a10 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/1018c24c977bc5206a5b80894145118566a69c4a |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/310d3fd5fa655a19feae03cf1a128363be79851c |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/7d3da379d0780c7979653f1ff9f250bc51f4b649 |     
  powerpc    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/b48fc1be561b214fe6f69940cbc5e22d3872f968 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/194660db9af6fd7f3cf35dd9ef8417ac936a3c2a | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/234eee7f3439fd78434bace87ba2390b74f038ae |     
   x86_64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/294a6223b21164fd88230dc5ef62a923fd1127a4 |     
   x86_64    |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/9d60453bd7de7869e9e6283a57cb425fff5ca18c |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/1d9199b20dd71005a92fdabf1bec295d1838c036 | ORPH
    i686     |          linux-7.1.1           | NOK | https://autobuild.buildroot.org/results/6a27f052a5cb9c2f6c11ea4b2abfdae6ef91da13 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/cdef3abbac3e42f526857b840edfddcedc2e48bb |     
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/cca8280757870d2b73d15f627d95811e0090bef8 | ORPH
    i586     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/4e888c3691976e96aeb018b6a523c85f2080cd38 | ORPH
  riscv64    |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/d0adbfe43afad719660d3cf84e98350a74d4bfa3 |     
    i586     |         opendoas-6.8.2         | NOK | https://autobuild.buildroot.org/results/cf63c9435d4ec8ae17b1cfd6d3a516be33d47105 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2a4a8441fe0546602f272f57fd453c5afe4c7df6 |     
    i686     |       qbee-agent-2026.19       | NOK | https://autobuild.buildroot.org/results/72a320579c5b72332695d07832317f2f1b29082a |     
  aarch64    |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/69b87d600ef9fa1d4eb8f65a7282c53808faf362 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/7f99ee4150e4f6daf618ae80c2026003b5557b95 |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/e2b1903b213b8b11aef18c7a6ddd20b8db8897a7 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/2dadbc68e3ca51119a485adbf1d77a36de999e04 |     
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/1747ef7d64fe5c43d0fdd75973795b873653c06c | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/50184bd857c74e97693693a602be838e6a7535ad |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/1129625e0e11c2048145bc554b5a144765f8f196 | ORPH
  riscv64    |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/717cf3a451ce25dfe18e5a2079e95288afd066f5 |     
  mips64el   |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/b90922b4e9f624f6a21033123d7d61b8ea37655d |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            host-mfgtools-0.02 | 1 
                  libnfs-6.0.2 | 1 
             sigsum-go-v0.13.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/708895dd6b007d25c38651c52eab217d896d7940 |     
    arm      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/6355c99bd3e11d59663e37fa762fad12deca4129 | ORPH
    i686     |       sigsum-go-v0.13.1        | NOK | https://autobuild.buildroot.org/results/5a8db8b062480907da6f8a080cd4044a10ca6d0a |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/31ccf1b5b00a06ba48247d19586f2dc8e03aaccb |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              libmodbus-3.1.11 | 1 
                 logsurfer-1.8 | 1 
              tailscale-1.78.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/ab205f164e4b83cb3745a73282188a958897c765 |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/84feb7a2a13f15a81746f09dc7d85a22ad6c3e3c |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/f920cabd488815f61a564973fc354f74089cfebb |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

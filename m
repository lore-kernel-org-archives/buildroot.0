Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C79EE6B74
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 06:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E5534116F;
	Sat,  7 Feb 2026 06:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bkbC9LkOXG0; Sat,  7 Feb 2026 06:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 179EF4117E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770444553;
	bh=R/Ht66EHEK9k8U3n+8iG7HUWvQCjX6kARqnlDPn24Uo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MqJh9YQHZIiubJ5UUD7v5ezEnBZRnqo6u4EDi5HoRmWt46au7pii45zFLXkp9GE4w
	 pu8k6KwWFQNCj71tjfubF+igSaOc8H8Kfo9OA/bWVRwyAxxW1dSV3m4sb8n2dX6VAs
	 /Dr8VHxSWEU/c/BRVyFL6243hDMGL1okmUQuin9NGuLZpSCXDDfbK7gKpxutGedEVw
	 bD/Czg4nsogEWfHqHA4QXnqFdl4vn19SJN+q+kJIk4NSGZeNQeG3HROWToAJ1bB+3q
	 FT8hd7JNsfbN6KtGc2ozR0Btjr9ZH7ipPO6GZ9T9ycWwbEvZyEyyrwEIDFunO6BWWl
	 /L/foNk4hrsxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179EF4117E;
	Sat,  7 Feb 2026 06:09:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 287C8219
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 06:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A30260810
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 06:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jxEMOBRw7Ks for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 06:09:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F6FB6075B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F6FB6075B
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F6FB6075B
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 06:09:09 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b883c8dfb00so482938866b.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 22:09:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770444547; x=1771049347;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9X3a3lTObBkQsskd1j1dN0a53E5xwohbp9TkYi9BVAY=;
 b=ROKocydZdJqYb5hScFdMXhWaHZALDGBeP5UA5kGPHxq/7ky3OVV1zXCst2CI8g6kgL
 l6AXTg6BOJhNiWJbKGvKDU0nXOiuMDICFQUekex70BqBbc/BVw02cSxGZpgs08v24DCc
 Ekz329flMsqTFh02WYV5mGona0U3uTO6fF1rRcSz6v4+xv74hHkl8wSVzfKDHeZMeJn2
 zKkiYU/8DCmfMAHN/iON1iEmjGPtiF/UjJykIuix8aIVnUH2VPmZwtexhy0mlBhtOMWX
 fuzezZ/cNFx2NV7LpMU9HV0eFF9B8pcNIcxynxMkWPnB8TWpf78fEeoGgG5U6uS0wlTA
 usyA==
X-Gm-Message-State: AOJu0YxMPaDmjl2eWkJjX8UGoJbeO30ngah5aGHvu0g+UVsPnZsMNFf8
 YIrgwEWLxLQzB3YvZkgV5DEXZDujJa0SOa7GaVv1116+qjHUGSL3vbb6zE1B0A==
X-Gm-Gg: AZuq6aLbzXxM+effARtaLgLyERk5i7Va9JPnmMYVFk/0iV+gYYWSYQEgPSi6ESTkb7U
 fFlj7uoZXaSb7PZVJOJnHof4r8Dzf8fn+KK4itktMA6xVpl7klElQWiY9OHSV31iPuu2nYH12K3
 NI4PCBRoyQvB1OQ+x0FIppV6Pr4MPtEV3p0dRax2sNxAKf4a5hcJ7xzx/tTYwQiG3m9AQLQwzbz
 P4YqNFUWOahdD/S6hbwLJr+TIukcT75Qs4uGMfWTXR9i6C4uKKflH086QLGRbKOmPykWiApN4GD
 T1ZirfftlMYdDfl5bvta9YIxEuzI7HFt3pkIImZmZK3KVx8OhfzaST+voVUM8ejgDqDzDjrOLBg
 TYVnzg32N+S9Z3ZdvLuEjrAJnJDh5vyxNbptC9oUf3KyHorWr9FhwMLCnlA0F40qVFuTXHG4NpG
 6OF+2r1I0JP+mIWCnbZw==
X-Received: by 2002:a05:600c:3f19:b0:477:9a28:b0a4 with SMTP id
 5b1f17b1804b1-4832018048cmr69664005e9.0.1770438477937; 
 Fri, 06 Feb 2026 20:27:57 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d7a924sm253357805e9.10.2026.02.06.20.27.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 20:27:57 -0800 (PST)
Message-ID: <6986bf4d.050a0220.1d6aea.87f6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 07 Feb 2026 04:27:57 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770444547; x=1771049347; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=9X3a3lTObBkQsskd1j1dN0a53E5xwohbp9TkYi9BVAY=;
 b=b4wLA8/z5yulrBOETUAC9FtTKWfpmR4OUDgJfz25dfa9cTJcjOtmGFnzdLF3gWCeHA
 ZXEz1l6AWVv1Yi67wJ0qlr7/dkKYDmDbS0iS73wIOmGoG/+ZDvjP1uVoshgAyBRLiuL+
 KHzGJ21BQFSOIQNQ2mTXpAfp0FYOwpoBwwzWPmg6cl37U6gaOA0vIG9XeA8qiZiBYlfr
 MAr4vUTZgO5w0B3YmvqrOOpTAxptyIWMx9ZdUzG7GkuWZVgbmjr74236Z+2ty6aGwrWw
 L1MNKgH2EBYTihim5QBuABZxFEEzMbzuNHnvct8ll0I2gm0O9pXzSYXv7fk9o5iO4lUM
 0QrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b4wLA8/z
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-06
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

Autobuild statistics for 2026-02-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 16  |  0  | 25  |
  2025.11.x  |  5  |  5  |  0  | 10  |
    master   | 52  | 93  |  0  | 145 |

Classification of failures by reason for master
-----------------------------------------------

     libphidget-2.1.9.20190409 | 5 
                   dante-1.4.4 | 4 
                openssh-10.2p1 | 4 
                       unknown | 4 
    host-mender-artifact-4.2.0 | 3 
                   perl-5.42.0 | 3 
                s6-dns-2.4.0.0 | 3 
           at-spi2-core-2.58.2 | 2 
                 c-icap-0.5.10 | 2 
                   ccrypt-1.11 | 2 
             dahdi-linux-3.3.0 | 2 
  gobject-introspection-1.84.0 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
             libgphoto2-2.5.33 | 2 
              libopenssl-3.6.1 | 2 
               openblas-0.3.30 | 2 
      passt-2025_06_11.0293c6f | 2 
          sane-airscan-0.99.33 | 2 
uclibc-ng-test-132c6134d691... | 2 
ustream-ssl-5a81c108d20e247... | 2 
                   atop-2.12.1 | 1 
             batman-adv-2025.4 | 1 
               bpftrace-0.24.2 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
      docker-cli-buildx-0.25.0 | 1 
              e2fsprogs-1.47.3 | 1 
              erlang-26.2.5.15 | 1 
               freeipmi-1.6.16 | 1 
                    frr-10.5.0 | 1 
                   fwupd-2.0.4 | 1 
                 fwupd-efi-1.7 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                   gssdp-1.6.4 | 1 
       host-nodejs-src-22.22.0 | 1 
              host-rust-1.88.0 | 1 
               iproute2-6.17.0 | 1 
                  jasper-4.2.8 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20250814.1 | 1 
             libapparmor-4.1.1 | 1 
              libcanberra-0.30 | 1 
                    libev-4.33 | 1 
                libmpeg2-0.5.1 | 1 
                  libsepol-3.9 | 1 
                 libzip-1.11.4 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                memtest86-7.20 | 1 
                       mrp-1.2 | 1 
                opencv4-4.13.0 | 1 
            optee-client-4.9.0 | 1 
package/mender-update-modul... | 1 
             parsec-tool-0.7.0 | 1 
                  pdmenu-1.3.6 | 1 
                 rtl_433-25.02 | 1 
                 rtptools-1.22 | 1 
       sp-oops-extract-0.0.7-1 | 1 
              tailscale-1.78.1 | 1 
                 wolfssl-5.7.2 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/ddf6eb2853647d7c1c213ad3c8da34165eac3a2c |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/20772e2c787a555624d45ca8a69a70d0c294c354 |     
 microblaze  |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/2567ae8442ae640e2b8d638279769bfed84aeb5c |     
   sparc     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/849ef9c140b885b4bd35618e7afeea9d5617c5c7 |     
  aarch64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/d8b416e40bf7bd019cd93e6f2d42c98fc12d4160 |     
 microblaze  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/9e65cfd3677daf33c998f1517e11e3de5edda38e | ORPH
    mips     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/7e2f2fd984eda918d7190412869e834b75568ff8 | ORPH
   armeb     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ac22efed8f7283c95c73aa39f51cbcb3869f7082 | ORPH
    sh4      |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/0d239c830d1a9cdf9602c3975981a4f884c006a1 | ORPH
    or1k     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/8aecbc9df8d40ffe57ba45e502d4d16248815521 | ORPH
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/1ff173647097177090ff5d45f74ea837846e327c |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/73c08b43b385eb7e82f1abfaaeeb1038af42f3c7 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/36369b31083d82969867f703f4a99742dd75a832 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f9d6f0084031fb584504a805e7aa4ad1e5b2bfdd | ORPH
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/9a978a099a7d163e928680b902dde9421880c335 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/763d398b95e87ecf4c082d37a71a29443ec851c2 | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c438b092342019d55c4a0b7cb93ed56f868a52ca | ORPH
  riscv64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/cd813af5909234817da1fe24526595e5204c34bc | ORPH
    arc      |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/d9c52352dc9cd10f614fda4a0ab0802d651923cd | ORPH
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/78f8d49d6a6f03567e762fcbdd8710ba23382cb4 |     
   mipsel    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/950fab4a3dfa5150fbaf69f1c801b2f2cd9b1336 |     
    arc      |           frr-10.5.0           | NOK | https://autobuild.buildroot.org/results/4b294b7d70a767dcd26f8f03230231027629ebe5 |     
   armeb     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/b05ba331fc5f2c4c6d191dcad42eff19601b642b |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/17d2f06cc870fc46e351e3c39f2487e04634ce01 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/b1a99edd24c0f2858921b857211d45e739792563 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/a36eda73f472c0e152c6f4dc8b25b632dbb61f13 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/245e73c79b888928c9d1ee21c2895151c46ececd | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f7cd0caba7f48e5957e43e0d5ba8934f094545a5 | ORPH
    or1k     |          gssdp-1.6.4           | NOK | https://autobuild.buildroot.org/results/65d01a804bf77d3da1d4cf54b665527b940ccd3e |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/9b16d8cbe2bbd6227d3088af40d64a4bcbf4b027 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/f5c48cf0b62354a0a6c399f67ab3491c2f718b16 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/e47ee2407589041b1d0cda56b2dd88ee74f028af |     
   s390x     |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/c88333672b1a6c3c83378f70be8b01b668f9dd5c |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/1461f11c23681f07eb8ba38d0b51e8b2a7ad4b11 |     
    or1k     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/9bc63658ffe3bab8af1e65a9df10bdbadc0bc233 |     
   x86_64    |          jasper-4.2.8          | NOK | https://autobuild.buildroot.org/results/1a1e579c3d56b2ca63436e73c7876a7a0c53d789 |     
    mips     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/d5a10ef1b3781f0f6d4272de7db259625e6a3047 | ORPH
    i686     |    libabseil-cpp-20250814.1    | NOK | https://autobuild.buildroot.org/results/d720c331dc3432219c377a7788a5c1006eaac15d |     
   mipsel    |       libapparmor-4.1.1        | NOK | https://autobuild.buildroot.org/results/e656684298b0462f8044667e7384c64d6508f22f |     
    sh4      |        libcanberra-0.30        | NOK | https://autobuild.buildroot.org/results/05eceac6e24e0f6f97b2fd4cd9c3fabb4508b2ae |     
    mips     |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/e68f240059610879a96ca24ed459e61a5812869c | ORPH
    mips     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/f50fdb3e1f8f667211987b7094196c7ba5fd5f25 |     
microblazeel | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/ad3cd6112eb908ac62ca3ba46ca85434b5ce70b6 |     
    or1k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/e2361a11b5047b7bd1efa5aeedb3f8029e707dbe |     
   sh4aeb    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/0dfa39706bfe345e642629022857b696575071ff |     
  aarch64    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/b10ec87dfc77b2fd5ee8b4bd47d59068ba60150b | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/af014de328511c5ca7c5d9503ef67a3eb576e200 | ORPH
    arc      |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/48dea97152f031f37586ad5d042df9b280f8282f | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d7718c055dc580dbc8cc82180b5910d97ba110b0 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a0a9055018782a9d337e4f811ef4d0b2a6f64daf |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/99b73b38b7c0af844926d56e21ec586e6d7dc458 |     
  riscv64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/52135ddfd7608a81c904614a479cb79c210a83eb |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/07dd69184d8f57fadbc6c74b4186520ffd42b573 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/927c0dce9313dbf5cac4fe26aa1f77bd611ae1d3 |     
    or1k     |         libzip-1.11.4          | NOK | https://autobuild.buildroot.org/results/6515c5a09c7cf42ad71e4b4341e4412796fb30fb | ORPH
  mips64el   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/adae7e683fd3dac38155f08ebf5a2188eb509076 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/53e5c823d2e609ee1f5d489dab30fb66c916d4e9 |     
    arc      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/31a08d8e3161580ccd3a035d443a472d5cf6ca99 |     
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/aebc4375a689a59aafd00ed9dec6828c8372eb53 |     
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/6c6993f0c49d8560d7f60af79a3a109768ba6883 |     
  aarch64    |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/5438483a437e82dc9a6ef8fd5bfef990168eb9f3 |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/70a35dd6aea70741dac7fe189ebd1a0139c4595f | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/5f352b22606316cd555b1b3dfa64222c119cc271 | ORPH
  sparc64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/c6c07c972cb33e8afef6576fe9d5b9cd7ee745b5 | ORPH
   x86_64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/8eff2d2293a4eb56955c05758d5dab5c58f5736d | ORPH
   sparc     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/f6f47442072ba415d363403ac38ca2ec17a55399 |     
   s390x     | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/70279530e05c650d37e613debbac29288261d06f |     
  powerpc    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/c297d0e04209949fa2515bfbb7fc7a460fee15ba |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/cbe70446a28dd07aebab8651fb28470289bd9a4b | ORPH
   xtensa    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/29956150c497653e722051eb99d971c987a9e4bb | ORPH
 microblaze  |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/faf6d6c3826e1930972fe0b16276af5c7b6403c4 |     
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/bfc67d1ed3d8a01f9e0c0d53dc7158bfa86e06d3 |     
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/86f2c4605df0c7eda1cd66207de86ae990c5e094 |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/b3fce9bed67f9a7ecf682acbee6b21e2c1df2ab6 |     
   mipsel    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/e581294b72dbd2620d012e96a2d4edef427b133d |     
  sparc64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/bc55a5f8ab3b1a205c794e9ef4301a14835acf4e | ORPH
    arm      |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/f7d408d9998d401263cce6b4b8d5646dbeb98a18 |     
   s390x     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/6a15d5ea2cfa36b0c7c8d81dd42d19972d001517 |     
powerpc64le  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/44d2841f685ae12070034508796a3d86209184b2 |     
    sh4      |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/8992ec0c271caa0b84d1351cd9e5d947b54d8cbd |     
    mips     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/612b17226c23f01d0d41bd7c941a0a350c062527 |     
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/1ef796640d0a5cb213404cbdf40da547bd359174 |     
  mips64el   |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/073d0b81ab975a16011741e30af41071e53de157 |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/81d1d1c6e08c16a7311afc0c5dcd7e303fd1ec10 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/a990063a059bb7dc0d23e51f87f583bd17d8e621 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9944afdcf5e4fbb5a4598e5361c70369b9a52eb2 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/d89b9dc4a829feaaf838f62f29b8614b29a62a7f |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/4032717f7409e4d32140e3d70fe3cc535dab27e8 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/169389e5b6022d8a8b42b74b92e96d550f19a224 |     
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/7a03df5214487c6c0eff7f8f8f82116960cd6280 | ORPH
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ebd493a9ef1db15d85a68d80c79d2f0962fde8f1 | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/4b431f743ce3a6f3c50c7a8e6fbc0e43ed22e35d |     
   x86_64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/435b62b035bda02b0cb5030fe031ce133355ca48 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                  iozone-3.508 | 1 
              libmhash-0.9.9.9 | 1 
libubox-3868f47c8f6c6570e62... | 1 
          linux-5.10.246-cip66 | 1 
                    mpir-3.0.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/b8f42cd5a0ceef21d7872ec391b85e6cbe0a8fd8 |     
 aarch64_be  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/2457f145696d7971c04f756ac5f5a348e055d180 |     
   sparc     | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/65a8b09182ffcf9b5b7d24a07408e91289239139 |     
powerpc64le  |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/f22a3ebd7b19404d17bce4430bb976434cc44586 | ORPH
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/061b178bd77818c299a5cb3e0a411a656dcbfe3e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 3 
                libselinux-3.7 | 2 
                 expect-5.45.4 | 1 
            gettext-gnu-0.22.4 | 1 
               host-ola-0.10.9 | 1 
              libgcrypt-1.11.1 | 1 
                 libgee-0.20.6 | 1 
                  libnfc-1.8.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                   ltris-1.3.2 | 1 
             parsec-tool-0.7.0 | 1 
                 sudo-1.9.17p1 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/2588939075b098ea398928a80d4f3d568d77efcb |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/1fefdca88a911be4a68cfd137782bee6e4d96a36 | ORPH
   mips64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/4df410c4d579b6a0dd67ed849fd4e557025e4b80 |     
   arceb     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/4fef9fad89b5acef4ae13221c50a6d41c13e8373 |     
    i686     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/d70d92f3f9e4fce9653cc951d11fa0e96abc90fa |     
   s390x     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/b336a499f01fae9b44b54de320be50f6f615c5a4 |     
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/698ec22278ead3af36493b6b1364cb2a5eb3dfbc | ORPH
    mips     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/9bf3c86604bb9881778560a5bbb619ec9fda77c4 |     
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/b77527924acb992a3adbfdc201ca76c848a2b4ec |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f128beee119beb8ae6262269e0c275e9610545d1 |     
    arc      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/b0195c61692e2d99ca8aaaba604bf5e96a04d94e |     
microblazeel |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/772f1bd287a57dd8a5883f597238b7bb8f7becb9 |     
    mips     |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/c1c7db391ce653ac3fcb11697c98a11eca72c456 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/94375e5c3c38a64e5c8dd1d7e471a762444ee0aa |     
   xtensa    |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/f0b57af0fa0d229731ae1456cbc44a9382c9d53f | ORPH
  mips64el   |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/dbb52c1ba1d2b06f17666465ad62381a878b729c | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

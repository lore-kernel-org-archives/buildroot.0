Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9779108B8FF
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 04:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E8B284439;
	Sat, 21 Mar 2026 04:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id clzm4jSXv24J; Sat, 21 Mar 2026 04:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E38F8443F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774066953;
	bh=FyprjvWF1uHPF76XsoKMidf+C9AVE9B4+qtGOl2+iGc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dIneLtdmbxqWVgCDGfCRtVQUpoUVYn4V/IFxRKWS4ihL9eN3hIWbxWynvWudJC3OV
	 y4VQqXHvN1Z7rhDSPsojC8HyLFs1JfQGkQC9OzUILjQoRmPWYtEvHPcND05l3ioNM6
	 AMkhs/ZGUcoJ6lnaPgDXtkLghjQIN8Mm5Yx1lm2xKBThuhPb9itUqHVGs0YfHcdxGe
	 sIflZOLEBCQ/4vEqkjSQtTO56LTXGdnhX0Bg5bNHUJhaDnJa6I9Ooky6ApCgTfaiLB
	 iQgbcFOfIqenZ/v+G4l71Qwauhdq6JtCwIrH6cH8tPEVgdGZqh29NO+DZ3Eo1hMOzk
	 sDy4+GnspmEPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E38F8443F;
	Sat, 21 Mar 2026 04:22:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C09F21F
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 04:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E11684430
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 04:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nl-N_W3M_DJX for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 04:22:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71F318441B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F318441B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71F318441B
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 04:22:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-486fc4725f0so19240635e9.1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 21:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774066948; x=1774671748;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xaTXpj+qnbmy/xhEhEu5XakG1q0pwgNpL+cqXQ8L8eA=;
 b=j7mEDyis1QifrVbKTJ1OfXpeCi+ZH6gtOv0hgXm5W6f5a6FCXHllau0op398Ogvx7T
 NXLuy1ev+203bBLQ+s8MVsv/oBCcYFFqH9vLGYATasTPo8FSKQE4d94HbLAnPYN3qMSY
 8jW+lLB+XJ3ajGOs5DMFMk0HD628tXMSUuDlWnkXrnQ/Ds7LWEL6gSSPPt/OCPE8GMzx
 W+DoTrv823bVZDOaegPe6AGN/qaQYl+mn/eEJatqL0djWTgmbPd3PTF55T707hQTGFKu
 Az3NgcAoboUvtuN4YNmCtgOMbcPE0x+KbubrPGBxQ8Z/k7wIfBKhe9ngoqNnweanfARx
 Ul+A==
X-Gm-Message-State: AOJu0YxbBv9dFXx/qvCAMDws0jrQ/OJQPM/kW7Og1JaaHQ7fPRoKooKn
 3C5/T5IarXYnSUAdIVRBxjLQGoV1YgCvJj88Yqoo2lZYFnnNITPApqSxqjcEoOaL
X-Gm-Gg: ATEYQzxPzlBmihGLfzymqflrWnFGfAEdER/TFHLqN1nqKIHSvM29J7Du/Q9oiRZdb89
 5t9oYgYa4sBsG2ZPQxwGBxnYN/cdMptQ5oGfisY6FOgAv/MoYDT6ONB6QjbJegj11zpfxQZO467
 nuhZ12bs5OgzsRTEVShhPERBEFjF6dlxhZPaqavFWhy06DezqtscvL+ERZqjSdnRtH821ijyLco
 co0knYx6F77uQ9wiLS7zSTTowTyxw1yt+DQgV9AvjU1wOqSpCKHqC9nthT0nJHUhD3mX6CrW31n
 y4GMyTHm0696I8BvI+h6vfJx0yPMxtBy6A5PmTt8pcSow8BZCuRePLpKgI0/dFE5hijcea7RTPy
 +ZeestiuJV+GspMklN01SwXgA3dqb6psiXYa/uHD5WfR3MkkDL+LvEv4vivX/IBClJBQD+UyLoF
 IAFK6gHbIevPSz7qDmTVHEsJUzbw==
X-Received: by 2002:a05:600d:8449:b0:477:9890:9ab8 with SMTP id
 5b1f17b1804b1-486fe8a2bafmr63738515e9.3.1774066948041; 
 Fri, 20 Mar 2026 21:22:28 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe8159dcsm41715485e9.0.2026.03.20.21.22.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 21:22:27 -0700 (PDT)
Message-ID: <69be1d03.050a0220.30042a.db29@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 21 Mar 2026 04:22:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774066948; x=1774671748; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xaTXpj+qnbmy/xhEhEu5XakG1q0pwgNpL+cqXQ8L8eA=;
 b=KcxSOnvuRCZFa+6i9ewlCgD2gRmBlPtFbiegew7iE9wQiRBo5YrHkDVl7s8o79OAl2
 QSpPQT74inbyLwfFHawbr0Ca2J4sKyc+SzxfETyatrWZNCs04OsbpDCCnTtVJErqa6pP
 vI+S9h2uX0OBlo9ZTvYNmrg0N/lSv+oUBEpdeL/K+He+IYQYKqGiPQtrw4zNcXLuL796
 7+Prl6GSh98JxO1IrCoWaYP/rP1SIfFxUPb8EoHK0EU14nPZ5iTKS0f0xOQ/7A2enp/L
 2IXjnRhqHqp1lLEkUTOMh8RClK+dTBigs1lYnnuwi+IQfdiy4XbVRuzjKaSIaUSEIFJL
 UcHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KcxSOnvu
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-20
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

Autobuild statistics for 2026-03-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 16  | 25  |  0  | 41  |
  2025.11.x  |  7  | 17  |  0  | 24  |
    master   | 55  | 104 |  3  | 162 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
                   dante-1.4.4 | 3 
                flashrom-1.7.0 | 3 
glibc-2.43-10-gc3ceb93dc4f6... | 3 
host-gobject-introspection-... | 3 
     libphidget-2.1.9.20190409 | 3 
                 mdevd-0.1.6.5 | 3 
odhcp6c-f19dd37fb467c9cf10c... | 3 
               openblas-0.3.31 | 3 
                   atop-2.12.1 | 2 
                busybox-1.37.0 | 2 
cegui-e7a03afc70c6182a091ff... | 2 
cpuinfo-8a1772a0c5c447df2d1... | 2 
           ghostscript-10.06.0 | 2 
                host-odb-2.4.0 | 2 
              libopenssl-3.6.1 | 2 
                 linux-headers | 2 
        ltp-testsuite-20250930 | 2 
                       mrp-1.2 | 2 
                   perl-5.42.0 | 2 
       shadowsocks-libev-3.3.5 | 2 
             babeltrace2-2.1.2 | 1 
             bmap-writer-1.0.2 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
              containerd-2.0.7 | 1 
                coreutils-9.10 | 1 
             dahdi-linux-3.3.0 | 1 
              e2fsprogs-1.47.4 | 1 
                    ficl-4.1.0 | 1 
                      fio-3.41 | 1 
            gdk-pixbuf-2.42.12 | 1 
                        gnutls | 1 
  gobject-introspection-1.84.0 | 1 
                   guile-3.0.9 | 1 
                   gvfs-1.57.2 | 1 
               harfbuzz-13.2.1 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
          host-mosquitto-2.1.2 | 1 
               host-runc-1.3.0 | 1 
          host-tipidee-0.0.5.1 | 1 
host-vboot-utils-4b12d392e5... | 1 
          host-xfsprogs-6.18.0 | 1 
                     kbd-2.9.0 | 1 
leafnode2-9543ffaf82406f943... | 1 
   libcdio-paranoia-10.2+2.0.2 | 1 
                libcurl-8.19.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                 libmbus-0.9.0 | 1 
           libmicrohttpd-1.0.2 | 1 
                  libnfs-6.0.2 | 1 
               libunwind-1.8.1 | 1 
            libxkbcommon-1.9.2 | 1 
                 libzlib-1.3.2 | 1 
          linux-5.10.246-cip66 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   linux-tools | 1 
              liquid-dsp-1.6.0 | 1 
               nushell-0.108.0 | 1 
                openocd-0.12.0 | 1 
                openssh-10.2p1 | 1 
      passt-2025_06_11.0293c6f | 1 
               procps-ng-4.0.6 | 1 
               pulseaudio-17.0 | 1 
           sane-backends-1.1.1 | 1 
                   seatd-0.9.1 | 1 
                setserial-2.17 | 1 
                 sqlite-3.51.3 | 1 
           uboot-tools-2026.01 | 1 
                    unscd-0.54 | 1 
             util-linux-2.41.3 | 1 
            vorbis-tools-1.4.3 | 1 
                     z3-4.15.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/639dc0d2bce954ee6c2aea4116d6ba295cd9448f |     
    arc      |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/44e2744c7d5d92ae82e2d8ff0be178269e88f1f0 |     
   sparc     |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/71d06475dad7b9c880c74484b27153c9b80ad0c5 |     
   sparc     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/4a98ca90727a019a69b1b907e4e54e10e578a9ad |     
  riscv64    |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/bca336fb9346d01892e60e06573a549f12aac43b | ORPH
   x86_64    |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/3593056888e0ec965ed1c5bce189ffd97c9282e8 | ORPH
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/7693ca41dcd46618413f9947bacca312e683360d | ORPH
  aarch64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/34f155d47a4abf3eca3719d26c08eac55d5d7538 |     
microblazeel | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/3b8849188dc8def3e1622aa3158e2ee2af5c8ada | ORPH
    or1k     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/9c71e7d64094d9a841040cc8a8b9ef01507711e6 | ORPH
  aarch64    |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/e1ebb04cbd282147e88a8efc52eeaf871113a683 |     
loongarch64  |         coreutils-9.10         | NOK | https://autobuild.buildroot.org/results/5ff2f9952c662b1ace565817e49effd2fbd0020b | ORPH
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/06a09b7dc83762bb6a4f63609cb5b1fb5e4191d7 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/80014dd0c23e77e3b64eb72968c76926ab492b41 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/00b7c387da6be1e3cff7360ef3890d5d43d5b1f6 | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a37c5e062d5c9bc0c269a15aeb9d29e40a35317f | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/41cbef1a7a6a062bd1f22675dc1fa21299cfd68e | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8cb7d2b635b3ea35bc7f2bc6fa411e41bcd891e6 | ORPH
 microblaze  |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/ce0842b40b85b511820008d19581f95fe3b14e21 | ORPH
  riscv64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/9f96430aaec8d2724caa1fb1ae590414f532d7d0 |     
  aarch64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/6bf01f0bfb2a0d5ce9e5ea7210770aaf8dd7db2e |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/70c20e1d0e1fb96637d1aaa68e620d6620a2d0d5 |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/232575074336eea929b574cc5aca536593e1aebf |     
  sparc64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/6a88ed4ea44552350de759eeb068781da0f8f37e |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6868606730f48e1fb0ae147ea2a40824e04bfb15 | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/4b00f25a64056881f8006b7cdf16b3dde0345125 |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/ee8f1f57b4049de95facced69cb946e0775f226c |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/f5cb01249da6c14a2dc8830b00250042f1cde561 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/222a6b174bb735efd9f3034fd74d4a492726c521 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/0670cdecf2b4e8075225460d6ec04821dc74fb4a |     
    mips     |             gnutls             | TIM | https://autobuild.buildroot.org/results/6b6df3b5a47486f86efc7d5095e1fc9ac1fca726 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5e47f90603234c2eb8219a45aa44a4635a4f4c05 | ORPH
  sparc64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/567c7c14798d5d6531f67e8c7736ae905a617585 |     
    or1k     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/e8a93de572310ebdbac8eccf555cd347bad701d3 | ORPH
    or1k     |        harfbuzz-13.2.1         | NOK | https://autobuild.buildroot.org/results/58fe1125c09c52ef280d1bc74ef9082c00b8e63b |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/0dea3bf27a8e664aedd2da22b3823dd150d205a8 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/29c978f2bba1bc92992cffa94711a8b21aff2598 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/241a6226b9016701a00a8bd7149c9bff5221b44e | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9cdea58a9c94116dfb29cade7de0ba7001924e75 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/e603d00e26a26a2a775c0d1b892adbbb5ac3307f |     
   s390x     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/1ed23a7fea2880176e7ecef59c53387ac5507c70 |     
    arc      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/fca815c847953d488d9da7693eac945a5fc45f07 | ORPH
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/0b896b1d3fcfc703af066d1d3165dea8c8eb7a8d | ORPH
 aarch64_be  |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/9be7e175feb84de6992e7efa04d16339658b913f |     
   x86_64    |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/93dc12aab99246ede3a150745c6c0daeaaaa6bdc |     
    hppa     | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/0515b546f8ad85856ae98e5f108bdd860ab90880 |     
   s390x     |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/e5d719487e0d7cb1bff9b683b596ff74f0974b0d | ORPH
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d55a56729e2d1453b2cbf7c7efb27109a4533388 | ORPH
   mipsel    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/42886683c2dfc81edfeb7be85ab7847f55adcd0c |     
   armeb     |  libcdio-paranoia-10.2+2.0.2   | NOK | https://autobuild.buildroot.org/results/341d3c64e9f2b2a4658f3eccae2ad703a3244ce3 |     
  mips64el   |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/8bca23c9e7c3c7a66ee5f036670e2c7e07afca58 |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/302aab99f4cc9d672d6e1517b63904e06ab73cea |     
    arc      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/6c62ae4b88c4bf7dbe9f09d92ce4a29da835b962 | ORPH
 aarch64_be  |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/215ccae130c477de754e920997921a287738d561 |     
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/0005f41abf65260ce5a6dc9aea3c223c2e7a87d9 | ORPH
    arc      |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/1ab9240a437077fe40959e38774173e560f881ff | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/0462b63c5d93debb5d7cbb5ac3250e17f6a28023 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9f39b85b43092558cc75ef720cc8c19e6c31c1d1 |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0f68bdce44487d316b84f49f843149eb901af879 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9be89b6ebbfacac1ee1d5359ab77f1bc22487c8b |     
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/5b6d0fe156891e1b45eb859cf9b241f11f0acedc | ORPH
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/c5970a97d9e30b8b348c01982bcea07db2219c97 |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/5bc6c4ea367910fe6db22bc256bbd3f81cd12183 | ORPH
   x86_64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/557c894e0d7cd6393235274601cd9a20bf9dcae7 | ORPH
   x86_64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/68676fd6497fe08bb5646cf0b4a75fdacf18dbaf | ORPH
 powerpc64   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/364afcc034c49a330c77113fff542e06438e7287 |     
 aarch64_be  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f0cf4715a6296beeed818d7a96745bb4eb492b85 |     
loongarch64  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/aec1b91be75e58e226243fed65fa4e85ae701604 | ORPH
    sh4a     |        liquid-dsp-1.6.0        | NOK | https://autobuild.buildroot.org/results/fe0d4db0c186ae97b9f06bf25cf0b93f10f6fc30 |     
 powerpc64   |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/a9014396e06322f69b1a252942389f6bb1162523 |     
    i586     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/736098869186567cf7a82f6b9b6b02b7d959b9b3 |     
  aarch64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/5c74a7254d9368cb7a6cd1f234bd2d8cdde78d05 |     
    or1k     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/79978c246048493357c272380053c79881952ff0 |     
    sh4      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/d4d4207d75123edb36750212ace88d0dc005fd63 |     
 powerpc64   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/9c23efca82639727d9011277fb30bace52533989 |     
  riscv64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/6610f682149174235bcbec1a551fa0b4ca70406d |     
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/959732b17c6b323830ce04b2ed80026100ea69db | ORPH
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/7e4d36abaf4fdf58c3b46d7d48d90ecc187a0d22 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/2b3ee41c118cadf37f94b154fdf001017fa0c86e |     
microblazeel | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/7690a85fa73285a41cf521af230d579657e09c13 |     
    arm      |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/594cc9ff40cf6bf810d87c45cbeee6736d30a7ed |     
 aarch64_be  |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/6854a488a3269f6d27791fe4b38597de4ce0cd85 |     
 aarch64_be  |        openblas-0.3.31         | NOK | https://autobuild.buildroot.org/results/5f6a354996207b6e0e26c10ba9bf00ba93c9f465 |     
    arm      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/7f604c147fd77c9a24b2c684cec6cc57b24f2b54 | ORPH
loongarch64  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/9c405b4d6ff6b6023dde83cf678c7b7b130b64c6 | ORPH
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/dc52057c4f21ae8d59f43597dc0fc3f7e850415a | ORPH
    i686     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/2bec39d039cb39968a82ca9605820b2b7f58260e |     
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/a9e1ab657f605aad7ef6578e3701ed17a38bc080 |     
   sparc     |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/118c69dc1a3ae892c91e2ca0cb9c3ffd282ef586 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/66274fc570dbf4dd8796945018e40a0559b8a2c0 | ORPH
microblazeel |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/3b96de8295cdb981b60637a518f28c8ce21234c8 |     
  riscv64    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/ff268e18fb008de3f39f54cef0d90be68e015dfa | ORPH
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/ce0c4351238d49a995214979692e0be63d966716 | ORPH
    sh4a     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/4fa52009340dd8e3613ff3b85edd77a0b2385f83 | ORPH
loongarch64  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/d000883dc2fa7ffe4653cc970b5ccc60e07261ef | ORPH
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/7b608f587c2c8d6670b84764cfdf7cb03c2849c1 |     
    sh4a     |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/7ac663cc9d6b697eeaa724defa04031aa4e48b98 | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a50d32c1ecfb7db50a06fd6ba5725eb11d991be6 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6669d669df0646f0b8e330d1d59bd6daf2635519 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/15904f6f8774ee2de25a506819323985a626eae9 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/843317b5d56914fd9c8cead0d347f0d43d8159d4 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/59fd34d7fcc11f92709cb50c4f6040b53d8f0609 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a427421e889cf9c2d0b76995e286948a246229c0 |     
  aarch64    |           unscd-0.54           | NOK | https://autobuild.buildroot.org/results/ad2336abb4b0a1d0860c3c4ddcbcd53d8984a165 |     
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/633852632e6b38b809e3d952141b8be072578250 |     
   x86_64    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/a67f7e198d631f0587a8562fe9c202f27d3def9c | ORPH
    or1k     |           z3-4.15.2            | NOK | https://autobuild.buildroot.org/results/59ab0705da3ca563a78f623917dcafcbf030602a |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                       unknown | 3 
            host-coreutils-9.8 | 2 
           dmraid-1.0.0.rc16-3 | 1 
                    ficl-4.1.0 | 1 
       host-libunistring-1.4.1 | 1 
            igd2-for-linux-2.2 | 1 
             libgphoto2-2.5.33 | 1 
              libmodbus-3.1.11 | 1 
                libsoup3-3.6.6 | 1 
             libstrophe-0.13.1 | 1 
        ltp-testsuite-20250530 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.40.3 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/07529483a4ef68beae63997c8ea54d951610893f |     
 microblaze  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/b41fbfa1059ef8f14c16cfe3cdcc887b0246538b |     
 microblaze  |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/64bf07baa104777c109a31011cfc822157f4fd30 | ORPH
   s390x     |       host-coreutils-9.8       | NOK | https://autobuild.buildroot.org/results/17eded233ff5c036ad12c449cd0a33d84275850d | ORPH
microblazeel |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/e40f3cb8c03a0265fce07b48082e6d147a00db1e |     
 microblaze  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/dfc0e0951054baecf5735965dd29ec8064a9c3e9 |     
    arc      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/04c4adcdc0d9ed3ac912ede355c309d953fb776e |     
    mips     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/7acc846fed1566459ea2b2bdf8e2487a7f506e5a |     
    or1k     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/442b61623cea90ba90c1049376b1eb8a04592477 |     
   mips64    |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/68a4b8ae3173ea10040b416dac57025b2fc68eb6 |     
    or1k     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/d5a52b82d399305b35979b6f8b1a4851876dc194 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/9f6b30272d4642b3a574910e907da22f9ba377a0 |     
    m68k     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/3f915896df2787b4ef7dcc6d6031b819b2511717 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/0f39314f0459cb028739361aa8caa63138dedf53 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/82b1df48deea94e6b1af4d3c29877eed60c3603b |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9996153d30d2037fc8b5d9bd97cc889b88ca320b |     
  powerpc    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/76514963418afd8a3bbd8e5b68e8a2894cbd6536 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-faketime-0.9.10 | 4 
                 libzlib-1.3.2 | 4 
              libopenssl-3.4.4 | 3 
        host-python-lxml-5.3.0 | 2 
              libmodbus-3.1.11 | 2 
          cryptodev-linux-1.13 | 1 
                cryptopp-8.9.0 | 1 
                freerdp-2.11.8 | 1 
                host-odb-2.4.0 | 1 
                 libgee-0.20.6 | 1 
                 logsurfer-1.8 | 1 
           oath-toolkit-2.6.12 | 1 
                     pound-4.8 | 1 
       riemann-c-client-1.10.5 | 1 
                systemd-256.17 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/a16429ada5be5006bf8eade17b107d847a68bd4a | ORPH
    or1k     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/cb8878d57fbb9a40dae11e718c328d507f8d4f64 |     
powerpc64le  |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/12f334ba1677ff0ae6654fda6ec5ee39b6fba91a | ORPH
   mips64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/47ae1cf7aa87f0ade7193a9ec6ffa8dd01e2b212 | ORPH
 powerpc64   |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/4db56d5a06d6fc317a8859a68ccbedbcceb805a8 | ORPH
  mips64el   |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/d7a5e65f3856f893ed8a95d13608df60a8e490b8 | ORPH
    m68k     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/886ebe553d2570fa6b2ec21b04b8d3d8155480fc | ORPH
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/50072ff222b24101a334aa7bff29e1b87a14937e | ORPH
powerpc64le  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/bd17ddf2c58bc949dfba0826ea4b7ee7bfe0f809 |     
 microblaze  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/6c1cabd2090fe8a25e0ef953bedd056f8e4bdc52 |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/fd1cc61521ecf9887811e38f21a1585650d61ad6 |     
    sh4      |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/93e040dc0cb4c7f0c3234a68ec4a30007bbcb64e |     
   s390x     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/e6230a686e333c10588a69e42c50b3c4c23716fa |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/c69ff2b7089e30ffd5100b82a92155f1d7dbfee6 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/640419a8ecccab4f47ab3e1a9282f812e862bf1c | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/07b83cdeabc14580c75bfb7e68984afc01fb5e63 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/50b625104c3398c0888735f661fdd7fad9a3705f | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/1c30527391efb015d10fbcce7b5e635f231d2117 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/5f9a036650aa303c3fcde25e8557c57afc77d7ad | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/c83c112ac81192738a7e71dd4b308c929b762758 | ORPH
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/f5d1d92e7660d7b2f421d3a5a9d1ae685aaa1700 |     
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/f5f67bef6c5aa245e22a49aad7d620f104bc4255 |     
    or1k     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/61d7fa5eb0f8a434a4f4c7230c820f2c856c3943 | ORPH
  sparc64    |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/96ce866ac5a0877756a1c952e2fd74c0775bcf4e | ORPH
   x86_64    |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/2ed449211a6172fb2def199fceeb9959c78f10ad |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ED9C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 03:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD05C60847;
	Sat,  8 Aug 2026 03:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xu85VyAvygLX; Sat,  8 Aug 2026 03:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EF8060829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786159882;
	bh=FHilLJ2QXsVQzo9LgN+58huAwjsXSvNLKyU7oJ1sRL0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OLCa5PIu/f9C5ultOt3D1ykTzbzQLNMjNQ2GEmRzHadzNEw1zwodO9PaUq8R2+pDP
	 ftf2gROGwRQiZwuGAJmCCGJru8JLPaltnGN1xUOQTNWvb6ioxoo0SgmT5A8yiNCgHa
	 3TDHFmqaDVPsf8JuJkiDXv3nrq0Wgz6aRHeTgbKKGk7afuafLB/WQmVHCNxdNDYzpd
	 h10DrFefrBas7efj40+mlEcAxEcUlTH6oJLRukAe3gBmP5w/uhuHlu/qp7dMSOfwK5
	 uhdgnwUn7oI79gC5b78PdzGzETixwDWdMlcRnq+8Ao/A6s3JzkNyld/CGoThbfj+G6
	 OcaBpJ82Jwbzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EF8060829;
	Sat,  8 Aug 2026 03:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44E982B6
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 03:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3713F40810
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 03:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-iF_UVrzNTA for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 03:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D2E040819
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D2E040819
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D2E040819
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 03:31:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so2055355e9.2
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 20:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786159877; x=1786764677;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Mcw3ZwKULKnkogz7K/gisuFx3qHnv6HCXkLf34jUe1U=;
 b=bYwKs5Z1EqiQwddez47cALKVhsOPDd5YXDD7niDuXF0piFbb37vg+LGzSU/B61Stkb
 3dq3GLQTZvaUggfpi4DfXRw6CGM653hFTu3ciH/1sjKNfVnXcu4jSoR/ly6ox6STtmzS
 pm6mJT8OLzGh02s9+prjofPGrslrJ90Lp+RDjnjWPK8iRmm26Q29qC2ePKebzAmr0drk
 DzvvNM/TBiCASOVp6DyfK9YImGMuxB2X7Tmze2RKx6ZoU5c9ioHap7yNZsI045Nm/Rm1
 PJp+fUXzwdMRa4cX0KgO3BtBDivX+6wYjlppH/qa8TD2TfdusVDf2cgJFpXuD7+MMZjL
 s9QA==
X-Gm-Message-State: AOJu0Yx4tBP4m92giBd+TbE/rHl4Q0aCeRJHaUceejJYGzjS+etjMCWd
 GnAvoBn41RLep6wyiQfWjU7l7mQv6n9Ou97dsHH/u8EFPFRLFcBjWBT6EMACZmr6
X-Gm-Gg: AR+sD12998bH0ahK712CXOi7fjxNUk5Tt71kybbWPsykCuq4gwd0qrDkbpR787pxs4Q
 6nk/ETcaMdy53txxCDYqLSEfEo6jqDlmFMwpMXYi7M15DjBFMpQ0QKK01syD6U2FDd9xF2gox6w
 DqW8JkvnJDcDo5fyU5tpvSAF5Sp6LlOZvtZjV+gbYuM9JACrb5eD3oyBi2cqTuXqKY3H0i6S6Bs
 yxgQIek72EFpQeQ7oZFfFsuq9Qk3VvMfYdeDNYvhVqmiX/5hHTbRFKI57RtTLnQHLfbsL/7vLBX
 x6n8c4oI4JbeoMPhs+lsmuUymbBOmel9M5L2U1GIYA/XSF2KbWGWPr9Vo/tIIflVFdjrOV+Kr6w
 ChwpT6AKbXTIX2esHe+vvQQj5kx7v7elJud1JQWV1IC9nYcHxWRHnMhCRIsg6JEhh+2HHTZJauh
 xNlkwDcf9Z3N5d6wOjvdFQLTFJW3rcoZj0BHX0s+RSF6ITqmL/Kd2uCzZ3TFRih3Fs77f1MqT62
 g==
X-Received: by 2002:a05:600c:840f:b0:496:c1f3:e8fb with SMTP id
 5b1f17b1804b1-4994e71ffafmr345961735e9.8.1786159876489; 
 Fri, 07 Aug 2026 20:31:16 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48002206effsm10588315f8f.32.2026.08.07.20.31.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 20:31:15 -0700 (PDT)
Message-ID: <6a76a303.21abb996.366296.01a5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 08 Aug 2026 03:31:15 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786159877; x=1786764677; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Mcw3ZwKULKnkogz7K/gisuFx3qHnv6HCXkLf34jUe1U=;
 b=E8mJ4oiC+1Y9HRScRpBNkdOspBJIZLkyYKeeTsd+uDtOjq7mDXJKxyVlqpuFblv8zt
 lxH7P0aGzlsevKZTaYdGnmu0sHrp8nCF8bQfArzOUIPExIpwqAoa3OgPlN1utwex0Di5
 zxdWiOyadP0pD2NjTXKmZ4zUuPARu1lLesaSxMqFm7+uEYfn4xHdpsIeWfrvKcL/07dt
 yweTQ56hWRnouAreKUzSwE+xZZqMEu2VXanfVvXGfS0FMBWDWaC0yQSnXQyRxgg78qrj
 8AsjqFlI7m0A1QoOrwrP8tLNsXn2jAVEqUjQ/V9fjKCV/1tEmjuvzMxQyR0cnp/48igr
 3htQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=E8mJ4oiC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-07
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

Autobuild statistics for 2026-08-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  7  |  0  |  8  |
  2026.02.x  |  1  |  2  |  0  |  3  |
  2026.05.x  |  2  |  4  |  0  |  6  |
    master   | 40  | 164 |  1  | 205 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 22
 host-binutils-bare-metal-2.47 | 9 
               host-dracut-111 | 7 
              jpeg-turbo-3.2.0 | 5 
                       unknown | 5 
             dahdi-linux-3.3.0 | 4 
                   dante-1.4.4 | 4 
uhttpd-15346de8d3ba42200249... | 4 
                   ccrypt-1.11 | 3 
                easydbus-0.1.0 | 3 
          host-binutils-2.45.1 | 3 
      libabseil-cpp-20260107.1 | 3 
   openvmtools-11.3.5-18557794 | 3 
               tcf-agent-1.8.0 | 3 
                   atop-2.13.0 | 2 
                    attr-2.6.0 | 2 
                   bird-2.15.1 | 2 
  gobject-introspection-1.86.0 | 2 
               libepoxy-1.5.10 | 2 
           libmicrohttpd-1.0.9 | 2 
               linux-pam-1.7.2 | 2 
        ltp-testsuite-20260529 | 2 
            optee-client-4.9.0 | 2 
                   perl-5.42.3 | 2 
                 rtl_433-25.02 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
amazon-ecr-credential-helpe... | 1 
                   bash-5.2.37 | 1 
                    ccid-1.5.2 | 1 
          cloudflared-2026.6.1 | 1 
              containerd-2.0.7 | 1 
  distribution-registry-v3.0.0 | 1 
      docker-cli-buildx-0.25.0 | 1 
 docker-credential-gcr-v2.1.32 | 1 
                  dpdk-25.11.2 | 1 
        edk2-edk2-stable202602 | 1 
                  ffmpeg-6.1.5 | 1 
        fmlib-lf-6.18.20-2.0.0 | 1 
                   fwupd-2.0.4 | 1 
                           gdb | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.43-45-gdae425b55420... | 1 
                    grub2-2.14 | 1 
           gumbo-parser-0.13.2 | 1 
                   gvfs-1.57.2 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
                haveged-1.9.21 | 1 
host-gcc-initial-arc-2024.1... | 1 
       host-gettext-tiny-0.3.3 | 1 
            host-go-src-1.26.5 | 1 
host-google-breakpad-f49c2f... | 1 
             host-guile-3.0.11 | 1 
    host-mender-artifact-4.4.1 | 1 
            host-mfgtools-0.02 | 1 
                host-odb-2.4.0 | 1 
              host-rust-1.97.1 | 1 
                   i2pd-2.59.0 | 1 
            igd2-for-linux-2.2 | 1 
                iproute2-7.1.0 | 1 
                   jimtcl-0.83 | 1 
                     kbd-2.9.0 | 1 
               libecoli-0.11.3 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
                    libopenssl | 1 
              libopenssl-3.6.3 | 1 
                libosip2-5.3.1 | 1 
               libtasn1-4.21.0 | 1 
   libtorrent-rasterbar-1.2.20 | 1 
                 libv4l-1.32.0 | 1 
                   linux-7.1.7 | 1 
                   linux-tools | 1 
          lua-cqueues-20200726 | 1 
            nodejs-src-22.22.0 | 1 
                  ntp-4.2.8p18 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
                  pdmenu-1.3.6 | 1 
                     php-8.5.9 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
               ratpoison-1.4.9 | 1 
                  readline-8.3 | 1 
rtl8189es-0a5d04114fac3c9f4... | 1 
rtl8821cu-7f63a9da2e8ed8340... | 1 
                 rtptools-1.22 | 1 
                 sudo-1.9.17p2 | 1 
                 systemd-258.7 | 1 
                 uclibc-1.0.58 | 1 
uclibc-ng-test-132c6134d691... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/adc275a3d3c773968f42927b4ae8c5151a7db3d7 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c5a095586dbed90201bb3425c7e8823607d101d3 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/abf4f4d91fe3a67f7741aa074c7fccc293012a1b |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/3dd9bd25c956db6f8ffc61a7f15b9fc004b94256 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/7d10ae7fe66fca895f43b2fe9211267e565c0397 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/366735bbd5c9c2fe88860a132f5552f245714e58 |     
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b56d1cd4bc225aea8b8d95952afc8c2a47570e93 | ORPH
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/a8397e0f930cd64d47f9e6a4de51871ef19e47f8 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/8f2741dfa60526feaa5dde5932813560c7ff33fa |     
    i586     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/1b2b914a8532fe9b82c6c14fa0fe7aeb0a669fa7 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/e9fb5782d7db63d03396082b1afaabbabb099223 | ORPH
    mips     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/369af3d50be34adca6b45b1909c34442e86b630a | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/65be368c1a2f00941f49009bf01d88fdac7b5772 | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/bd4bffc89a306260968d7283121aabca5c6721c2 |     
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/049c0a28f3c48bab181ad45d3bc942dca5b3f979 |     
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a41f61883ab2a6733c4e9937a3b49633a34d8548 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8f5a9931300c5887511618ddf10846e5615d1272 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c6e9c7d885fd49f98ea1c9173bfdc0a4a2b07bcf | ORPH
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a3f712a3d973a73f0ec9b89a3295d1ef6afdafc6 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0344b26fb84cb887f711d0ce2527bf54246915a1 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/afb604ccb439a9d35ab21852e533076ce9a086a9 | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5475c39d3ff55f19a5fdd2dc94ae974f66fb29b0 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a3b45d087443d993a6fd2a7b609a9a207ed7c310 | ORPH
    i586     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/8c754e11276fbdfdeacf605e6ea25849d6d6fd4e | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/bb0b77ab761775f268793ba617b1690deada69ff | ORPH
    i686     | docker-credential-gcr-v2.1.32  | NOK | https://autobuild.buildroot.org/results/ff8ab928835d617eac8f4b96008d4ce60922e998 |     
   x86_64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/67b49dd74f678282ca7959e09223637fd98d2955 |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/d4b18f92bca91677d5ca9350aefbee363017f263 |     
   x86_64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/ef82c8b1523ba651e63fbb90f6f637accd102a1e |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/3ce98ea32335fddfb2d20a2b84bd8c2ddcc669d0 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/8aebca4a9e6dc3b0e1839d6f7cd6b4cfe0f91a25 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/21418a8d02ef91015588d7a1a8a13e2f4d6bd873 |     
  aarch64    |     fmlib-lf-6.18.20-2.0.0     | NOK | https://autobuild.buildroot.org/results/ab35a4f94852bd7b26fb3601aad8446f024d6c88 | ORPH
   x86_64    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/4356acf451ad5bf45aa68587f914ed6107900893 |     
    i686     |              gdb               | NOK | https://autobuild.buildroot.org/results/f1d61d88057e151d07e6ff589e86892feda4b63e |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/eee186143bb97790336da39e7e21d337445f059a | ORPH
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/4fdbf500a70127119dc888aa118f7c800b8e9a69 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/43891f9eaaa437121acadd7e6332cfce5cb727f1 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/7aa686fe8aaae6f63b6bbcc51422689257ea5e59 | ORPH
   x86_64    |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/670dddf65ac7d20348a3cd0d204208c1ec646a8c |     
  aarch64    |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/2eb1c67a761932cb65c544346c29e492c13ba17f |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/5ecc36015150ca5e235d3c5f50abfe3ca773f134 | ORPH
  riscv64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/1e07d64d9bac5295bbab1cae712a4c1562544e1a |     
    i686     |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/8c5b75b643d2f66e67193d1fbd15689975e9b7bf |     
   x86_64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/e69e76d52a5783a1f705f866b6344e33a377a293 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/398a3f2d9bef61e2baeea6c62e6961a0d42a96da |     
   x86_64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/67c43fb9e3eec2b7cd70f70902e9f9bea8328cc1 |     
  riscv64    | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/1669ba35232a9911cdabfb67df52ad8d68719d6f |     
powerpc64le  | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/1e322d5aeae715fdb2ff48e628413edbde39690c |     
 microblaze  | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/e1f52c14b04e344d28218fa0e4293c00984377e2 |     
   armeb     | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/42cd269fa736ebd7a42675ea37d87e2e8871786f |     
    i686     | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/d068d2484d47c9739a2f1f043b179ebcdf1c6df8 |     
    i686     | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/5ff520f179dfaba02989f1129748a18a99de8bb2 |     
    i686     | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/de428d43d5c2a39277480e77629967542c86c27f |     
    i686     | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/3b30edb3bbd94ce92da5305583116d80b7338593 |     
    i686     | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/2d586c2c5f1842c1f9784b128ffa9680f771a6e8 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/168769b547fcaabcc9ed37ed7dd9ea4151e404a7 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/f9907d49b8bb3987ba38f22962ef542896588d7e |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/a657b3689ec090d9d52d3b29865243f4d905e853 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/6967f8e9ecd3c390f3986b86041e341a615142d0 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/0d19deff23586aadea3a84aaad8a8e893bb94ceb |     
    arm      |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/a307cc388bd5467d71285ae0bf7c552a7a6079b8 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/1307263170bba9892c04b653992e98cd5e1a0aa2 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/9f2d41d503916d11f3e23b64fe0656ce9ee7f778 |     
    i686     |    host-gettext-tiny-0.3.3     | NOK | https://autobuild.buildroot.org/results/a5374a468aa128a31ee71e221c487445e142b210 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/eba26bebd6459104b36cf6486712ccb53fed3650 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/191e1c3ff55691a0bfcabc78478987fd30b4c8c5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dfc2593a156fc357956204c8c04da94e09632d95 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a85842329f40addb6a1ea666b50c1591d42e5f41 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/742ed30a43884eea7819c4b9eea9c7bf6df7a220 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d80ea53ac132eb1a6c6c3045e397616e04082c2d | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/04842c84ca0922ddf30ad222cebbc0bd8d472fc5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/76d8f8a75ee55012ee2d573d0e19ea16f4c93798 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b3e06e94343f6ed0e520d7fa561a2621c7cd95f9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/34ed4ed3bd6b1a04771fd16690fb5dce87a07030 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/024edbeea126dbe0c5241bb6ff63bdc651690762 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b03e3b46882620d1c9faa6d528611ba66c63efa2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a179106ba508d0e07ce330e06ff57fda1c237a1b | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a54146f0204007851aea7c843036383886db6ce0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8b72e692ee91840f5afcac6e4e4e8759b6c24844 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f33cd89640a093933862b0fba1b3a5080df04388 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/363b4fd397571d59ac5984a1158d187568a5402d | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9e899d0ecf128950a97be52756c026b0fee71ef9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b7c9231db4e998f8d581d6d13dd0176671c030e0 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/500c8fe46fd7a52ea9086f44f3f3834b4a86eb32 | ORPH
    i586     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/26d08c10b7ac10e621a82f7e5bba116f7738480d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/053217abba1b530552a4d68136dc888296b9ab83 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b8bb1b74cd20cf0f674ec2b0825a910efe0cd9ca | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/16336a47418ba2c624e74057a0f183e9024c9507 |     
    i686     |       host-guile-3.0.11        | NOK | https://autobuild.buildroot.org/results/f587fd9f7b8c362c7da0bab3471e7895ae009e72 |     
  aarch64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/8ecf3d167289a4defe1bd6141a97ef77ebcdac1b |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/4e73540607918e6b6a9ced17db386dc9ba1222a5 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/412460b59359bdddafc85558f4c4d8f6dcfdc2f5 | ORPH
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/2b1a55b4c7dee15a4536aa1d9f8be1e17f02673b |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/710895eee6369311354181f246356206e37cb1cc |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a238fcef87a40556564e7f9748e96eae686cb9c5 |     
   x86_64    |         iproute2-7.1.0         | NOK | https://autobuild.buildroot.org/results/7796fa4399de503d37d22d39406f16ba9aaa3adc |     
    m68k     |          jimtcl-0.83           | NOK | https://autobuild.buildroot.org/results/19d4a35232228f9d076877ba8e77223e0c6a6c04 |     
  mips64el   |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/1ac15b7cb2b02177222ca13f727e9b062789265a |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/fdfd5c0007233e926a76b6ca6e8bf928ea0da65d |     
  mips64el   |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/8def69eb8c380f434ef850041293e4565619499f |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/5091e72c0a7b012cca846f4a3db214d84063a253 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/0fbd2347e8e5c2e3644c370122e3a93de4cb621d |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/638613770a138ab18e98fa3403f56d57623ec203 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/238ec1d43efaca70d02f067b038676dcc27dba0f |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/ac35aa8d4d635e079a43c67e07411712475df9cf |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/6725a19e1f8cdf92988bda09fc35eceb0de40cad |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/2b3b81ffe00544f8ef13165fe3ad4734916c2c49 |     
  mips64el   |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/b5c00ed6a95d9beabcd5248dcd639ed34efa0902 |     
   x86_64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/93ee38dcb129f0f6e082e6c21b91cc9b2247e5e6 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/7fddd94eb4dabb0ad62dff9b9203c5a28efd6b5d | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/faaafd2dfc7f9a4ed989d0134bf45652ed4435c6 |     
microblazeel |      libmicrohttpd-1.0.9       | NOK | https://autobuild.buildroot.org/results/7c25f158a2933c42c6d8faeb812e79b15b2c8de0 |     
    i686     |      libmicrohttpd-1.0.9       | NOK | https://autobuild.buildroot.org/results/6bc5ae5ecc80f1526e3831e17e7efa08a453b507 |     
  mips64el   |           libopenssl           | TIM | https://autobuild.buildroot.org/results/6b84b60636693e1d2f001ffe11b19771aa0341b6 |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/cc7576bbb7accba634086fe531d32780df467e62 | ORPH
    i686     |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/c67fc4e0f9e78b20775b7715d5d2433e4ccdd02b |     
    i586     |        libtasn1-4.21.0         | NOK | https://autobuild.buildroot.org/results/9730cdbe3f30267efb98ba760b08cb5b982cb11a | ORPH
    i686     |  libtorrent-rasterbar-1.2.20   | NOK | https://autobuild.buildroot.org/results/9a0a9cd35d52915bbf3416e2485c5400e005e487 |     
    i686     |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/e9d7ccbe8640842ab1f6025635ffd83a5475e8e5 |     
    i686     |          linux-7.1.7           | NOK | https://autobuild.buildroot.org/results/9afedf8874f11edb18173cc4294e8a150b7f2610 | ORPH
    i586     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f1c8d696c2796fa32f9eb97c0836930d267a8a91 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/589731ed78cea02f904c765e76845c5e68b46262 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0bee0ea0f6368f9ff47560c07ada8fc4bb3947bf | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/a06cacc446c3a5b8a93cafc9c48e0b8df6fc9cb8 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/872fc0e6c040de7bf9fb5dc8be7f0823b8850d1e |     
  riscv64    |      lua-cqueues-20200726      | NOK | https://autobuild.buildroot.org/results/e3287c4797c3e273d5345587af2134531b729982 |     
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/05c03bba5fd194621933506a16d0879f8cb058d9 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4b83a93ddc2aaced1b348a0d2424a3259a09e98a |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/b6f014e49c4820e8e6383ee1cff0c4e971ecc21e |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/d68cbee261a444a994b23dfe2951f70df45adb2f |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/4e5cdb19142a6a6552c604722bf22cc8d6e101f6 |     
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/5eb8dbb60766b73f7f4fcc5b3e27db4549b0c82e |     
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/01367e36ea10f32fef581b755ce9b98aa177f609 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/566b0b4100f1bc64ea5eedb04f2c93de7682f565 | ORPH
  mips64el   |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/5abae97d10ae17896b5969c9f1fd9825bb952b97 | ORPH
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/fab4e0b6da147840c9c7dfbdff7244de670bcfd1 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/325223dacdb528af1ceb7e0de40100e86e4ad144 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/9ece6849e1e1040558a6a26f966ddb661d2f505a |     
    i586     |           php-8.5.9            | NOK | https://autobuild.buildroot.org/results/7f87ae852b269bee9632465250c585dada6cf5e0 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/408af6e2fa4f29414803315b9263f7d31cc094a3 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/4e1746cf3d4cf4e7e263f25879f1c9b93b744a30 |     
    i686     |        ratpoison-1.4.9         | NOK | https://autobuild.buildroot.org/results/0b0230ffe337f805730632c53f51e2ea0620aee2 |     
  mips64el   |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/7a1a279aea8e0a5e17018d044af71b074cddb601 | ORPH
    i686     | rtl8189es-0a5d04114fac3c9f4... | NOK | https://autobuild.buildroot.org/results/a3b886234a2194f56277cf2e1f05d3de5ee9f047 |     
    i686     | rtl8821cu-7f63a9da2e8ed8340... | NOK | https://autobuild.buildroot.org/results/a2eafd04f906e2efab17b67e2be3ac8cdabf5f63 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/4d3727295d320ad775998a2e78a259b28e4b1d42 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/cfd55a72ce624c90163d7ab389971144bc2ecd98 |     
   x86_64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/57dea0f56abe608d8f12672997be6328fb41863c | ORPH
  mips64el   |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/715a1f735f224ede417365431f60aba443c96362 | ORPH
  mips64el   |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/db2303c3b82008c352a487a39660c3b301c76c38 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f8ad69fb5f9fa43948d7b2eaf4830800c9a15bbf |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/db79e4a295e99d29413ae137a33a319df94e95e5 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4517ea6b47cfdd2e1925fa7bb9ed800d8d46baf6 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/1e57ba06231478584e95b102a7c6c8f15b2126b1 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/ed7646da328c530470fb41ab0d326c272f1b545d |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/81a3a8fe7bc60191cdc6bcf1b9b386be48ad4665 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2b840a1fdfcddfb03feaa8e1dc59e73af94511bf | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/cdd84723412255275c367bda618bbb7122408219 | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f604daa06c749f3bcaa733d222367a31602b68ef | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5c1e17fdb6c410f8fdc14f301f190d93d8134afe |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/76c274de84e611b19b91b0e9b1d753861aeeb678 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c2fecbd69d18854dfa56eb07d888e5323fcb45dc |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7a25564fff59e626c04fc32483d15ef7cf21b6f9 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/eb52cab37187fcaf486693465eb98205cad33e18 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/efbbfd0700f6032997b277eefc6e75524750c757 | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/eecd3788f4643997eb0b8c585b024bfbdc3f4f65 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/612fdf169333f0e0ca32a52c8f6a5565b2d61ade | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e1ef26ba0e7cf8bf72f7e371e49debe7d4aff202 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                openswan-3.0.0 | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/63845da80ae683c88ba60b8884c791cae383aed1 |     
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/7bac42922d20920aaeb37c9dbfc224f0cda747d3 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 2 
        host-python-lxml-5.3.0 | 2 
 host-softether-4.30-9700-beta | 1 
                 libidn2-2.3.7 | 1 
package/linux-headers/linux... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/5279fd954c0b3dca1e939c02faf6f5554c21999e |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/5a58b1844b6d20a0ea15100c4f965d29070136a9 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/e6a99be89c7a581e296cc21184155d57511defbb |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b8469f81758be4fdccaf95c3a34c8bdf9dfedb58 |     
  riscv64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a8a5388696645db2a0e06f24aad92efb4280e756 |     
   x86_64    |         libidn2-2.3.7          | NOK | https://autobuild.buildroot.org/results/302d686011aa7950b08aed48cf0c150a74bba156 |     
   arceb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/c150be652c63aec967a0cc333020bc8a543ee3a2 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

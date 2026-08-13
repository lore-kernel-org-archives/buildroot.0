Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27D6C5AC67
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 03:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30FAD6090A;
	Thu, 13 Aug 2026 03:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDz_0k0xWr-B; Thu, 13 Aug 2026 03:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80397608BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786591698;
	bh=pCNfnv4A/FEHnBAtYm8p5bCijm+3bslVM9Dj250+yC4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ko6S8SfFHqOdy0FAVzMOwsIsbRrzd3yCsAx/c1RnqKJE3ifrpmlODb2QOp1qrCvbG
	 BjHQekYaOA4TCl/V2hFVJbH5zfZxHpmtZX6KvxNYEcWQL5WvwUIs3bdA6xVMn84ixU
	 tf2W2Bf7O3UxhCkw7+09v5N+JBjxaxnxDckn+MswMifIMo7OCgU97g5/L3iaAlhncA
	 MBrhVT6Y3+p85/5ceTgDjVadVN3nt1QBkDl4BnT0KtMN3HyAhU82HPug8KJsouOsAp
	 wgTWyfx9F10SSP8OyXEP9I88nE2dQOom31/Yl+GAGEjrt+Qza15oSvG7+csI85gLNE
	 7QHXcozkdgPpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80397608BD;
	Thu, 13 Aug 2026 03:28:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05BB12B2
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 03:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFF3A608BD
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 03:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixmxhfyFaMWH for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 03:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31BE8608B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31BE8608B4
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31BE8608B4
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 03:28:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so1875885e9.2
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 20:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786591693; x=1787196493;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mso9TKHqOEfxmgwS38jJo0ZPv6zj30XEpMUPzO3jv9E=;
 b=PeoswExtYRaLJCCKDhQvc6uaTTaDxcv3PuEraetuNzGtGrtoijdqC/tUYU3SgWEdgi
 oVVbbg4b2jNANynLdMdKg9Umw1tO+xTOfusgoCehcZg96zdDmoZXqvEOAWezABqxcsu1
 QwiSZXbbQSBck5kwTwFpREwmUbDbaDCPDWYLTSZV4qhdPROFTsnMAvbJ6DjM2PE4B2Wv
 m1sNxJFzg2XyDOoxehQwj4mn8RzvA6mc2sYCEdmy+pik/ltGATO3O3/lOPjgSeXAFnhF
 VNa0ZwV/w15x0D7HeTJ5JUeBxObrIbThtpHQw+lArP4WnbmGQ81OWnoXlwLKWner9PUE
 ammg==
X-Gm-Message-State: AOJu0YwqFyuoCs1K+dZRFklpGwbQxo1ZQQWEW8Q7hJN3dZF4DyrQZG9B
 r0fgtZ0NKMMMaLe0baV8luP3EN3WMpWSj3YCKaTPXGIOMCxpPp9bhv4liWzsLGzP
X-Gm-Gg: AR+sD117aPymZnq93wUgGqm/n23nPIYXqviPSKk+KYVCKto3Ee1kvxnrbkqv6qH3hvR
 OPtDWurl+2QPLfmI2ghfRypSZko1eFwhKDXhEaV5bvkt4JzcZyCsgYygzg6EE3eFMqtYq8s8mCC
 0mrIOlbfT0dqG4cbjynVxY3/ri9OGgoWfHjKbnXdCwJMatMYQ8MHfCwCdYVHQzN9RseJZo40TfK
 Q0BO2Sl3vy+hMEwB1g+KYkoc2eh01tA4dQYQ6s1Pmou5kanYbFzO7tdoWxgQhGzcOicVlloDQ0s
 /jZe+u2MweJh1lmCdSWnBAIxle1byC/brtobJl9pLgPuNCs1xfbd285G/+NN5Xjk7OtsELAUH+a
 Q3x0Mbwy/md7wyFBB/kGGWP1uReo1EYKtbm/LKVPJN+9OAwYDvzn4rgZt5uJk+nfONbQXWueVXw
 6xRmL+ScQgfe1wViNB0BSvQhXHe5hHQMVtU6m7lzJjYTYYqF6/Kw0+o2nvU2c8ZJc=
X-Received: by 2002:a05:600c:5494:b0:495:4811:d71c with SMTP id
 5b1f17b1804b1-4998218e8cbmr23838195e9.13.1786591692867; 
 Wed, 12 Aug 2026 20:28:12 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b0f4afsm37148615e9.5.2026.08.12.20.28.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 20:28:12 -0700 (PDT)
Message-ID: <6a7d39cc.89544747.306e50.b43e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 13 Aug 2026 03:28:12 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786591693; x=1787196493; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mso9TKHqOEfxmgwS38jJo0ZPv6zj30XEpMUPzO3jv9E=;
 b=IiYC3rQ5V/bIg3Nr5h8Fs1AKllnhxe7lt0YperFaAOvwZBYjjLEENrkF/mYFld5kB7
 y2ytHOzDv3szEQcIZHKov443EQzldBantdDWMsplGH1eWNmyYFshWc9nsIgNGXEqSiu+
 T+bZJrBXfYQXbp8v6DcHCuYojvpHy1+a2Zkbzw3l9+OQwWRSy+qas28YQkuBZvKF4ZB3
 cImgtyDSA3lSoSTMvKR+JvthOUDDtUC0hMl/LrQl2rhxdO59QNqBxPz0nTDbAttGzhea
 JMVm649q+s3U8OBpfHR8cxND9UdR8sLbFsHOFChI9IJYL1zwpBjF9g720aP1nBrDc4FK
 0XTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IiYC3rQ5
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-12
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

Autobuild statistics for 2026-08-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 21  |  0  | 28  |
  2026.02.x  |  2  |  7  |  0  |  9  |
  2026.05.x  |  5  |  7  |  0  | 12  |
    master   | 43  | 79  |  1  | 123 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
                    olsr-0.9.8 | 4 
  gobject-introspection-1.86.0 | 3 
              jpeg-turbo-3.2.0 | 3 
                 lcdproc-0.5.9 | 3 
        edk2-edk2-stable202602 | 2 
                    emlog-0.70 | 2 
                    flex-2.6.4 | 2 
                   perl-5.42.3 | 2 
python-remi-2022.7.27-37-g1... | 2 
                 systemd-258.7 | 2 
               tcf-agent-1.8.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
ulog-0389d243352255f6182326... | 2 
               valgrind-3.26.0 | 2 
            18xx-ti-utils-R8.8 | 1 
                    attr-2.6.0 | 1 
              bats-core-1.13.0 | 1 
                            bc | 1 
                bpftool-v7.5.0 | 1 
             dahdi-linux-3.3.0 | 1 
              fftw-quad-3.3.10 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
       host-gcc-initial-16.2.0 | 1 
             host-gnupg-1.4.23 | 1 
            host-go-src-1.26.5 | 1 
    host-mender-artifact-4.4.1 | 1 
              host-rust-1.97.1 | 1 
          host-xfsprogs-6.19.0 | 1 
                      icu-78.2 | 1 
        inotify-tools-3.20.2.2 | 1 
      libabseil-cpp-20260107.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                libglvnd-1.7.0 | 1 
                  libgta-1.2.1 | 1 
                   libidn-1.43 | 1 
          linux-5.10.254-cip72 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260529 | 1 
              mariadb-10.11.18 | 1 
                    ne10-1.2.1 | 1 
neon-2-sse-662a85912e8f86ec... | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                   openrc-0.56 | 1 
                  pdmenu-1.3.6 | 1 
                  prboom-2.5.0 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
        riemann-c-client-2.2.2 | 1 
         s6-linux-init-1.1.2.1 | 1 
           sane-backends-1.4.0 | 1 
             superiotool-24.05 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.07 | 1 
        ux500-firmware-1.1.3-6 | 1 
                  zeromq-4.3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/0a475b5676a85a98af86742fd4654f8ee06ef91d |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/606cc996ca78a87ff88f18677dd1f97fa4722cea |     
    i686     |        bats-core-1.13.0        | NOK | https://autobuild.buildroot.org/results/786a79d3839eebefc473281a956cfb1eba9e037e |     
  mips64el   |               bc               | TIM | https://autobuild.buildroot.org/results/aaa07bda4e87a15e3de7c56f589e4851bfd20686 |     
    i686     |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/23d5014c7586d08edc0e5eb6a71826b4e0acc02f |     
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/354c291ca691658458de986a2e5853bf8d20eb7d | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/a5b91eb8edfe024053197301966df012bd3f575a |     
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b0b44880a608874f6d9e6e70779aed60e49c3b3c |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/d45a57b2efb4c75dc92a162200bfb07700a2a726 |     
   x86_64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/a6f880b7f768cd753e45fe121973e85a01dbbe61 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/64c80d3ba40d5d0ca0dc8fd1e90353185bcfcf6f | ORPH
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/bdc0c3e5f78946d83b98984c5899408c8d68d203 | ORPH
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/0be0e77d9fc9663c78621ea63a351ec5dca7ca4a | ORPH
   armeb     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/944db922d13ab5f192993ece430338748308936a |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/14d42f5c270afe27566ee33bf0dffe9b58c76f8d | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/64b3977d977a2f723fc4c3a72f1e669de1c42160 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/68675a834af4d832a75543ce7a904e214abce91a | ORPH
  aarch64    |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/6839b4ec4fd87fc9d330f705e7e2ce223d229445 |     
  mips64el   |       host-gnupg-1.4.23        | NOK | https://autobuild.buildroot.org/results/dbac095a98d59bd12575cac8a9fe944fd4d5245d | ORPH
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/580ec1cc55b7ef18920e398800356f510773ca77 |     
  riscv64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/160384f14a19b7c4bde812bf278633d22ddc3b8b |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/105f8595b10c8364041f6a3e03fe12bc958557be |     
  mips64el   |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/4dd8f29bdcb85e3f6b8ac91af14a0c894cc9deac | ORPH
  riscv64    |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/4d4ee3882129f2bea2bbff6aeea4c0630e5f95b2 | ORPH
    i586     |     inotify-tools-3.20.2.2     | NOK | https://autobuild.buildroot.org/results/27e3709811461f3155ad3633d88181edf820ccac | ORPH
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/96e49d48ea4e3b45c9eed7391b0b8e2ed3d5eafb |     
    i586     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/76d3ec380eef27c7b88b33d4390212474f53d090 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/ff1b3f0e689dbc371f2b220df6ab906d90b65433 |     
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/a0eea893975cbb92c2985dcd683a279bbe0786be | ORPH
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/60863adbbaaaca2d48888e675996200918316f3f | ORPH
  mips64el   |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/f8c49b9da3bb31eac2df7fcb1742a60eae0c11a7 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/a92dd386a41758bda72f9431f23bb5e7d59d6ed9 |     
  riscv64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/5c2f3f4aa1e363523b9dbedad3e87e3e4b8b1718 | ORPH
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/3022f5af25f015429dfc0691af054e58b313a511 | ORPH
   x86_64    |          libgta-1.2.1          | NOK | https://autobuild.buildroot.org/results/4cb4a03a18d502ca32c3c86601134a12dea6a09e |     
    i686     |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/b82651de38469e1817c0061a3b509477508d01d2 |     
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/3e16db7256d457e430fc8ab9cd3104f6f94413e4 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/20f3bdf5188918f4f9161939a9ead577a2675566 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/0b63b224aefe0b38d69cc1605451a6a53f37cfa7 |     
    i586     |        mariadb-10.11.18        | NOK | https://autobuild.buildroot.org/results/1014244c4de54c433751b25930855c3a57ab2969 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/1ee1c28ed548fe515e896ec6ffde2918eb576b4f |     
    i686     | neon-2-sse-662a85912e8f86ec... | NOK | https://autobuild.buildroot.org/results/d03d59d69c63083a04fa896f4665a1f965a38e4c |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/96cacad37155049aefe190acd2e1838545e4940b |     
  riscv64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/c8f18548002a4356424446fc579b912ec22df7f1 |     
  aarch64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/c71588bd6ae0bdaa463aa67932395d9e0fb79f0b | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/1716ef6363f2c04b78365c296bda24cc0044da6c | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/404e9d731eaad3cdae868986989703f0ebf46aaf | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f4afa3311830c90f2ec10450dfee83265f9400b7 | ORPH
    i686     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/0d76559ee53894d0ed60b663706cafb3bf8e7609 |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/95a309c813333ed9303dc806afa714197507c9d8 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/40e6b7baf3b399adecec90086c09c7e1f379449f |     
powerpc64le  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/795d9ff7918772d667ed5f6cd122b5da1bb9b99e |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/cb7434b3fffa74af013fd902c1f099e72b5ad204 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/a03376edbe9e03bc95a032b36840761a8a512f7e |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c264e54da4a3ad6cb72d445a769e5ab6a3156c58 |     
powerpc64le  | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/80e1bb20c8bfb89c3f084f87de954247d064b66c |     
    i686     |     riemann-c-client-2.2.2     | NOK | https://autobuild.buildroot.org/results/b062338fd040240d444b2f0285053339da0880b2 | ORPH
   x86_64    |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/1914a6ea9e850a0451e3b3b89f0c7363590be229 |     
    i686     |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/ad2dd6c5bafe323ca500a06dc4f98aa10264be79 |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/ff15f78b1c51785dd4dc63e071a168a9a91dc676 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/3a5bdcdb9abd0533bec48a42aceb40a90ebc4054 |     
   x86_64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/a1a39f24fd53801c167511fd618efffe35a86274 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/443d5da5bb0da36b92dcc3fea473990efcb4d6e3 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/25eb1fb44f7b391e5631a29bcb6a1e0767ed7fe2 |     
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/df2d44368c946d8b8273690fe4267dd30bda2435 | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/f274be20ce9075efdacdf8e4545d49cab7ac5da9 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/3520e77fcce2749f3f3ac294af3cb056d2f7e244 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/7d1dabec9e8817b636fd0cb498db0ea729d561e1 | ORPH
  aarch64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/550c4078b5966d13e72603118e3d6d42cfbd06f8 |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/e6c6e5cb59aa33ed892dd3e5c397557d222b04d0 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/acc29796816c8630421b0b6afe04241341e9cfe4 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/0b741e79e8db20f2292cd3c1b9e31eaebeca8c47 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dca423926eb67d814a5b40bf40396703f49f3183 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/cf55481da25ef8383f43fc9a4aa4b3c59a5f16f6 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/084945571b547698feaae17c8915ec93e4650f86 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/beca1fda655c430ca0c2a7f0f151d24c431f4736 |     
    i686     |     ux500-firmware-1.1.3-6     | NOK | https://autobuild.buildroot.org/results/cdcc4d160f5e916e206b9a235d1aab7f6883cee0 | ORPH
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/58a2c3ab7dbc15b95ae4f082ad90cc7738edd5f7 | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/71a35fa8dd98022b5cfb475f209f97b805043ed5 | ORPH
    i686     |          zeromq-4.3.5          | NOK | https://autobuild.buildroot.org/results/25a47e6d3353e04a189410ea5f2f849ec83b94b6 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                       unknown | 2 
             libopenh264-2.6.0 | 1 
               libtheora-1.2.0 | 1 
                   linux-tools | 1 
      passt-2025_06_11.0293c6f | 1 
             util-linux-2.41.5 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       libopenh264-2.6.0        | NOK | https://autobuild.buildroot.org/results/9d5220a7917cdd34fe1a9d0a0bdc4bb2f8f93261 |     
    i686     |        libtheora-1.2.0         | NOK | https://autobuild.buildroot.org/results/1b737845f58336d026203a3ac4c878fb8f367cc5 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c76652c1734c2bae8db318d243d1e2b32b3f8fe0 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/5755a81a85bab0db838c975e8cf3dd9cf0317d19 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/90f840de3100aaf476055e9d2cc597ca16e45c00 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/e90bc3110d551f549e9a058b1219c05945f04c0b |     
  riscv64    |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/e2a556c9fb1e0601a40e575f4c8ad049d1fcf708 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                   atop-2.12.1 | 1 
             bmap-writer-1.0.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
            host-autoconf-2.72 | 1 
               openscap-1.3.12 | 1 
                pipewire-1.2.8 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/cf3614cc6fa62297c4cafbe4ed99392e2603950b |     
    arm      |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/6a01d42aa2ec15c8bb806f1083204e387e8d14aa |     
  riscv64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e376f4aef687e9f3c2698540c7908d420563be84 | ORPH
    i686     |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/bd6fd93685b7b0798978a151902061932567a2e1 | ORPH
    i686     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/a874d4f34d36fa9f8566be90ad2d5facb99aec24 |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/e983801029454e1500fd16d55246a933a54c47d2 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/39cd6958c957297e634c02f40f7d69e02d6ce522 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 6 
                       unknown | 2 
             fluent-bit-3.2.10 | 1 
                     gdbm-1.24 | 1 
               host-ola-0.10.9 | 1 
                  libgta-1.2.1 | 1 
        ltp-testsuite-20250130 | 1 
              mariadb-10.11.18 | 1 
                  msmtp-1.8.28 | 1 
                 openmpi-4.1.5 | 1 
                   perl-5.40.5 | 1 
               pulseaudio-17.0 | 1 
              udpcast-20230924 | 1 
               valgrind-3.24.0 | 1 
            xlib_libXau-1.0.11 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/738bdc276c01101f8649e30ae73b15a4d0ae1ab6 |     
    i686     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/5ffa1fc8449aa9cd0361700ac7bdccb6b9ad5782 | ORPH
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/6aafe8bd5e410ca6963afc78d3bd7411a757d6de |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/4064b7c7af307505da7eff8fc3b7eeb6c6516b79 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/18509c74789a28ffc45419f7debcb7463f734ef4 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/38a84a21cdf2792e9efae1190f3a57ffa8dc66f0 |     
    or1k     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/2ac516d2f82f08f6efe0a9c93e23b5e4c07de413 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/95338c862ef40358d2518c8555c88b82ecf25d50 |     
powerpc64le  |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/02dad914f2d5446a5a567d1d9f61fa4660bdbe26 |     
powerpc64le  |          libgta-1.2.1          | NOK | https://autobuild.buildroot.org/results/9d75574559f0500f11490f3f6a70e43aef06887e |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/051e9a936f446bf50f06eb689934368f3c7ce480 |     
   sparc     |        mariadb-10.11.18        | NOK | https://autobuild.buildroot.org/results/3e0786defb5a7102bd8f827a5a8d7389d0399939 | ORPH
    i686     |          msmtp-1.8.28          | NOK | https://autobuild.buildroot.org/results/c1aba87e7e6bc0c0d1424a1d5befddd302bcb026 |     
    i686     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/c311b3291a3cf7aef5fd31c8c7d64f4ca798f7dc |     
    i686     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/b7f0732a0e72f07256ca6d8c6f68bd187d9385cf |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/83ca1370f7fe4742b56a482fcb704ef7d7496cae | ORPH
    i686     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/8421e283ddb93ad5b6c2a707db8d5835ac3e5fd4 | ORPH
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/c93e9418139720667607f7818c4a81778cf7e2a4 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/47d9be803f70b250b63f0b01349554f16c667322 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/9e6eb3f7d8f43d19950a981803607cdf7dd66ee9 | ORPH
   x86_64    |       xlib_libXau-1.0.11       | NOK | https://autobuild.buildroot.org/results/3c19e076f48da6617c21ee0b39fd9e3a2afa84ee | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

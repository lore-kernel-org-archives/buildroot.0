Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3D1C021AA
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 04:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C337940C8D;
	Fri, 21 Feb 2025 04:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqeEzqU3df40; Fri, 21 Feb 2025 04:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55E8C40C92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55E8C40C92;
	Fri, 21 Feb 2025 04:15:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A8CFCF
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 04:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E898040453
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 04:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krlmmkzmNUO7 for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 04:15:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 445C640025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 445C640025
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 445C640025
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 04:15:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e058ca6806so3039247a12.3
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 20:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740111353; x=1740716153;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MzWLoyPrAIsr5BKrGxv8kR0/8yWnzMU3XBC+eXqgYzg=;
 b=VQ8SX/6r544P9SyahTVsvTFTKHpEJd8yv4pjHvJ05ImLGoopLLJ4XAPmsakGCSew/o
 BZUCRZG9TfIEM9B9ij9xxaoYV8YgMUPQS8nmzvVEJUWPisVkrDBVKCrbirity9JSlWJh
 Ap6RczOnJGSbYifqOAWyvg+EnmWySXtp4iXlSD+4KwBUuq6BI3ce8z7xhTiCGrP+VZYx
 90uIqhFazrpVK2FhesPvFoHuuDROEcV/myGTRrro9BBJldiUKZ/hwstOzt/UJ7VE6ggp
 LFnpvkCo5Bd7VST8P9eXT/YacvdjH/qcA3MccZGAPyCkV1nO5Q8muAaJ0Xk6FEBueDl6
 sM+g==
X-Gm-Message-State: AOJu0YzhOSQ8gqMbGvW17ma1qvT7ekmXBFlknVv8kUTVaVjRtomblYag
 0G7sDJ5+ullui3QHtb0IfgfXkMP5qAmHuYRdQU8EsyJhTcArH7f3Nkz1cg==
X-Gm-Gg: ASbGnctGzNX33/84iJTUk4rHr78fVyyvMoFbbWywi9aP833IuemdSn4yx6OxdJSq79r
 eu3UhaZMoQZ9U/HPLoqTJfCQ5w5thuZ5zL8EcEWBHUmqEeJlczFHTRiwNXk6rE0lVB4vrUWG8/D
 KCiI6VmIOoCQTGLKOgg2K528vZR5GJTo/l8LvMi8l27D4hsUMzpvJ6t586i9MIPlVnyxOb6nk/6
 /xmHnaNJ0HiWU1wrkhhVLDrIbUwyPenBzIYGGvc6pco2WWqkUHwyNYgXNy5uuCUGd3mjDghsuMD
 Z9gNz7jFoEnL4fcxMleaSbuiXXr4KQ==
X-Google-Smtp-Source: AGHT+IHbNe4ik6fLptcPVUuktSm/Uau9ct8M9XmYkztMtHK7Kvhjn8hA9t0Ln/I/f+uxJBzr+fe8yA==
X-Received: by 2002:a17:906:3155:b0:ab7:c6a2:7a43 with SMTP id
 a640c23a62f3a-abc0db35941mr104188066b.31.1740111352828; 
 Thu, 20 Feb 2025 20:15:52 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb836ee14dsm1079777066b.47.2025.02.20.20.15.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 20:15:52 -0800 (PST)
Message-ID: <67b7fdf8.170a0220.26ea1.dc24@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 21 Feb 2025 04:15:52 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740111353; x=1740716153; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MzWLoyPrAIsr5BKrGxv8kR0/8yWnzMU3XBC+eXqgYzg=;
 b=YWC4Q0iqxipj7YVE31slqUZGShcB7HtFIOgpZlMaoU86zwkYbOJSd7s4DxmVqLQSPQ
 L76lPT3j+hQ+ohLghk0kGrbU9ey/Pj1blWljaqtLFsWe03LSQGJVrHS8jVOQFi+TQYgC
 ykYsbm7vwxCveY0s26p4HdOHRAe5ugGfr2D+6Cl0P8fltYyAsKIxfcWldCgod77hfqP1
 pvTG8zCu0XxsL2/KFnQ1sY0FhGzmB50rBzI7qkqhdDjoDv23rXBJ5wrMjzdDy/mmJQwu
 3u/rhTkpVGMcfsQ9iJrFi9OK/7qzVem7la248iuuJb5S4dTA4mQURWq1qlGRd5QFmqLg
 UP7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YWC4Q0iq
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-20
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

Autobuild statistics for 2025-02-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  1  |  0  |  7  |
  2024.11.x  |  1  |  1  |  0  |  2  |
    master   | 13  | 159 |  0  | 172 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 10
                       unknown | 9 
           at-spi2-core-2.50.0 | 6 
  gobject-introspection-1.82.0 | 6 
            host-sqlite-3.49.0 | 6 
             fontconfig-2.16.0 | 5 
                 libcdio-2.2.0 | 4 
                memtest86-7.20 | 4 
                    mpir-3.0.0 | 4 
host-autoconf-archive-2023.... | 3 
           libzenoh-pico-1.1.0 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                 linux-6.12.13 | 3 
        ltp-testsuite-20250130 | 3 
                   perl-5.40.1 | 3 
               valgrind-3.23.0 | 3 
                  ffmpeg-6.1.2 | 2 
            gettext-gnu-0.22.4 | 2 
                host-m4-1.4.19 | 2 
    host-python-greenlet-3.1.1 | 2 
                   linux-tools | 2 
               mariadb-10.11.6 | 2 
                  ntp-4.2.8p18 | 2 
                   s6-2.13.0.0 | 2 
                 sqlite-3.48.0 | 2 
                 agentpp-4.6.1 | 1 
                    azmq-1.0.3 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                    bat-0.24.0 | 1 
                  bcusdk-0.0.5 | 1 
                benejson-0.9.7 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
             bluez5_utils-5.79 | 1 
                   botan-3.5.0 | 1 
                  brotli-1.1.0 | 1 
                   bullet-3.25 | 1 
                 c-ares-1.34.2 | 1 
            cppcms-2.0.0-beta2 | 1 
           crucible-2023.11.02 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
               ebtables-2.0.11 | 1 
                 erlang-26.0.2 | 1 
              fftw-quad-3.3.10 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
glibc-2.41-5-gcb7f206537240... | 1 
            host-autoconf-2.72 | 1 
          host-automake-1.16.5 | 1 
               host-gawk-5.3.1 | 1 
                 host-gdb-16.1 | 1 
       host-gettext-tiny-0.3.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               host-make-4.4.1 | 1 
    host-mender-artifact-4.0.0 | 1 
 host-softether-4.30-9700-beta | 1 
httping-ffb9201042813c58d02... | 1 
                   iotools-1.8 | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
      libabseil-cpp-20250127.0 | 1 
                   libcap-2.73 | 1 
                 libcddb-1.3.2 | 1 
                libdrm-2.4.124 | 1 
           libfreeimage-3.18.0 | 1 
              libopenssl-3.4.1 | 1 
               libsigsegv-2.14 | 1 
                libsoup3-3.6.1 | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.12.15 | 1 
               linux-pam-1.6.1 | 1 
             lirc-tools-0.10.2 | 1 
              luabitop-1.0.2-1 | 1 
mali-driver-d40c57d81c9cf4b... | 1 
              mosquitto-2.0.20 | 1 
            netstat-nat-1.4.10 | 1 
               openldap-2.5.19 | 1 
               postgresql-17.3 | 1 
                 protobuf-29.3 | 1 
               pulseaudio-17.0 | 1 
                   rnnoise-0.2 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
    start-stop-daemon-1.20.7.1 | 1 
               tipidee-0.0.5.0 | 1 
             tpm-tools-1.3.9.1 | 1 
             util-linux-2.40.2 | 1 
            xlib_libXau-1.0.11 | 1 
         xlib_libXcursor-1.2.1 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/6d03f7c35218686ce945426adaec0eebc55c90b2 |     
    i586     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/6cde7ac899f196ca68b22e4e1366ca9cb6163277 |     
    arm      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/989b9cbcc8fc13ab568760185b0a2467e2efb9cf |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5d5e66a3150cd3711b351b75603aa9bef51998dd |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/06fd63383d571e7388e819943d60c6dd8d051fed |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d504d6ed6db5bbcac4c341dca0dca09b6a95b314 |     
   arceb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/7959fd57ed2789da5239b2ed8adb023353365ee7 |     
  powerpc    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/5ef5d044c6415e5ee2fcd5598f8b9aa394435c02 |     
    sh4      |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/a1809c43709d32a98837d9cd05d2654a0c75d119 |     
    i586     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/5bf95dcaa58a876c87f359c69f73900d0ef87739 |     
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/38ad78cb0ae1cf9021418e3dda78150997226e41 |     
   xtensa    |         benejson-0.9.7         | NOK | https://autobuild.buildroot.org/results/31d9220be69ece324f3c6b9e7e743cf00ccf814f |     
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b6fc5c1e5c760880034bc76802e4f1a8c85637ce | ORPH
   arceb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4f9cff579fe8ab48922a828b0c7c5dc762735e4a |     
    mips     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/2ad0d16a44dede3b6eb51e4befe76126435fc830 |     
    m68k     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/18025d736d27ecd00aebdc776e51e78810ad62c9 | ORPH
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/30fa5b71766b50012f06ca3997fc0aa9de6dffc3 |     
    mips     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/722811f74253d8790837f4247359ce36eb65409f |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/92df103e189b710f45997ba25be7772b89e8162c | ORPH
    or1k     |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/af612e6fa94488bfc14d844c717c31de542399f6 | ORPH
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/73c4c1f7eefdcd84bf2758e317eaa1a45843b797 |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8982ebffa789705d12b5f78662fb4cdc0da68c84 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8d9fc9a255bdcf71a70b9622577cd78f8733213e | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/3b93a1a34122d54a0542a6abc8d4581b388c139c |     
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/2114d679e7720b3099858bed2a581ddba7a4bb0f | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6e37bf0ed188ca40af26614a24e0335d49c6076d | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1a135f4b37b6acae946c2700b0b6bf1d0d3de6fd | ORPH
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a6fb1729cd67896bde96fe3057b4a6aec8930eb2 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5080133910dbc880e4ee96e3dca775bec3fbc7e1 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cd3e687854cc517acec21ed13852376b57094ef4 | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0397d65247e1b5bf2b57fe5e311e2276a8ee66fb | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d594b3f158a102ca323001bd69439b362fc50815 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1bf802f64177b2d0d9f2a423ac1f34c068020efd | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c2c432d2e02687107f43bcaf57b0b4204b1067ec | ORPH
  powerpc    |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/93990dcffb2ebbcdbbe3e5ae9e01a38c761d595e |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0bf6eccf5730c29dbf6481797b17c8b09ea5eaac |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/709227d3d4b5f269c002b4e81742213a8613b136 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/3693e74fb868975773dc0b3a8f77e2832175fd2f | ORPH
  aarch64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/e2d03f5955f36c9419f9bc2c80f154dadefe4df9 | ORPH
   mips64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/04b9469ca5b192995130b9c0fba24ecbf399d94e | ORPH
   x86_64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/1d69c7343394f7baf2187b4632f5f8cbf3d3c4af | ORPH
   armeb     |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/1cec350a8ae18c424cf267c400e70a41e83d1a52 | ORPH
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/fc0051a7adefd86976ed72b0172de554f18ec00e | ORPH
   mipsel    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/d6f650cd61484ca5d227a6129f1522ecf8b7c96b |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/99552bf1f942d3df064b7e76665edb799b197627 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/69e71a4e86bb5a9a3da0540b710ee2bbfb03f3e8 | ORPH
  riscv64    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/cbc28d2ac7d4fa811f0917c4d99376687cb01e73 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/6ee34d4d054150eaa59eda5f6814346377e54649 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/35f679c15c41d037090e5bf127c598c7e03f0352 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/391a0e6551bd6d3af4cc8445756a80ad0ec98d52 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/7c4979f518885725648dc07a3033568351881a20 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/509c67c89a97ffc6ccfdffdee1ab71373e21bdaf | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c455c9c40fa052dd753f7f93f0fc1d9f384a78b8 | ORPH
powerpc64le  |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/d1f792b39031325e01322d7331be600cd58fe691 | ORPH
powerpc64le  | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/b3119ca4161bf845ea24ce25822721febd854724 | ORPH
microblazeel | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/c60b1b42a1f53c0dcfe35c127a49ceeaffedf56d | ORPH
microblazeel | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/48cdfc2eee483b1d202ff870da5b686717c2544d | ORPH
    arc      |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/06a51a1694bd7db31f8a003d3366c25cbaadaf3e | ORPH
   mips64    |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/73f0f727b900e53e1f6838cb9b27cc3ec2fb7eac | ORPH
  sparc64    |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/940e180352306c7d96b9ec7e625ce030a96aab94 | ORPH
   sparc     |    host-gettext-tiny-0.3.2     | NOK | https://autobuild.buildroot.org/results/b95fb0ebdbc1e4c28f97d79f68cd53a8cd4a41bc |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/baefcdafa8f7af877ec9dcfbad3b1d9f2deb7893 | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8312ba5e6e78959633bd6941f642a3d5b6b4e244 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/893cd1ccfcdc8b03956abd276bd5956044750b86 | ORPH
    arc      |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/456016191c4416d09313a4880cf06dabe41c707a | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/5702c9a756b0c4f90f373644469ca9f011782f5f |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9484c60997f54db23568f31e4d734fec664e69fa |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/63263eb9d8dac40084407a89d1a5ac10ae084902 |     
   mipsel    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/e5ee3e3fcb57b9c448cc65700042177d0a756a36 | ORPH
powerpc64le  |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/f462f56407c5b3ad04f96d4586c0a3aa957c0729 |     
 aarch64_be  |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/7e79d6686c50f24505558d4338bb1d176aac72ec |     
 powerpc64   |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/e75be8daa6d1841684f7563e0a55cffff510a7c3 |     
  sparc64    |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/296a850d54430c2eca8d4dfc6b70c816bed47d5d |     
    mips     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/52c0eb996742d38afe4ee2d490fd2ee6188852ec |     
    m68k     |       host-sqlite-3.49.0       | NOK | https://autobuild.buildroot.org/results/c7ae2d80ccec21691f8d02d677b7f2fe5c6dd75a |     
    or1k     | httping-ffb9201042813c58d02... | NOK | https://autobuild.buildroot.org/results/bcd6c732742597e04b5a8c742ee355313422484b |     
  powerpc    |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/11f8db215a26dc9785b72e63a0282fd4e17ba9ba |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/aab9f71715c46eefc0ed8281d43088cd4c0ac85c |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/b6b662ebd998590ee90b02ec67f715092fd0a1f2 |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/227d11d5a65da4d7f8e34fb4a446f66e492cfee3 | ORPH
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/ff9fe4e1292b81c4eb782ccf1cfd1e526b172e3a |     
    arc      |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/9bde4b7f32dafa851c0ab0def9474a3a1ef3d11b |     
powerpc64le  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/be619ed39aa9104290f437cdc5c9cb53476088fe |     
    arm      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/94992f3b14be0440541cc1cde854b7efe59901ad |     
    mips     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/4ecaf8fd1a0304057d511d04b173a85b01aa1232 |     
   s390x     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/c1f424aa9ac6ed4cd1aafc1dc9578fceebec367b |     
 aarch64_be  |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/cb59852204111ff7bc0f22772be71e6c6e97c866 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/b9984f13268d02b9260bf46d47ac5669ac0f16fa |     
  sparc64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/27e5602abe136b8d25488886389a6c099aea06c7 |     
    arc      |        libopenssl-3.4.1        | NOK | https://autobuild.buildroot.org/results/c66e59d345df42391b872bd18d068347bdaccd6f | ORPH
   x86_64    |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/97c3e404592d77fd391bdddf12bb12d9ab0c3d6d |     
  mips64el   |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/2dc2ecd784e1220912a8141296ebcd43b6572ee7 |     
   arceb     |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/3f15b29846cc279c0bb288cccc8c8b38d773df17 |     
microblazeel |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/f01c445a8f4014d80ffcd62c0b0c339fd260b0b9 |     
    mips     |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/38957488331a551ce54e95eb24e6efbd9574c32e |     
  riscv64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4566c9d0d9083d1b1e685e7feecf94dc63974728 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/22615f79e084b4d92af6c3e3ec4d4a218d986c26 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/519e71732b329809578cd0b88db64c577da0223a | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9ce81a7f8c3015e780daacc84fa6108fa2f8b011 | ORPH
 powerpc64   |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/30f3eb7b908df649d7e0457aa3d230e356425299 | ORPH
   sh4aeb    |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/bd475b3df565f475139b7614395b0d868028d69b | ORPH
powerpc64le  |         linux-6.12.13          | NOK | https://autobuild.buildroot.org/results/257968a7b29e7d4937d18b92aeb035875f2b8a80 | ORPH
    sh4a     |         linux-6.12.15          | NOK | https://autobuild.buildroot.org/results/013e556e1fc09ad86367a5326dcfc195d5f97fe0 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a94e143de2b532e73ce977f245a7d0941cab3e84 | ORPH
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/5c8beea9cfabe0ebac8f5a92df518b39b8154728 | ORPH
    m68k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/36a3a8d755f7efe7cd2d8f1fabe34365b51f6659 | ORPH
   x86_64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/21dbf66759208117038bedb6980c2b3f645aed6f | ORPH
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/460b00602adef96b8fc0634f752fe4f24c21d60b |     
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ca94ac043db63df59924a22553ee89b06c876ac1 |     
 microblaze  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/c72bb44a8624557c3aa72fc888f2066de9def3bc |     
microblazeel |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/35cfb1086493cd1899789888a43967d805fce538 |     
  aarch64    | mali-driver-d40c57d81c9cf4b... | NOK | https://autobuild.buildroot.org/results/2ed3d1e026c190e81bb159156ab1d98d5db39bcf |     
  sparc64    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/abce5a3f63f2072996e8f4933ac4d0671bec7095 | ORPH
   armeb     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/293bfd516be6aa4cc51a637fea7f16317b64c4ed | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/1316c47b59c9e0abbe2a3fdcdf6376eb7fd933b5 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/ee652b2d33cf41bfe71e9327710da3266b8a4084 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/ac3eb9032755fa5cdf8ab4ac5873d802ea9d124b |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/b5b118e31a602a02be4c1b518fa2c332dd66d3ab |     
  sparc64    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/97639730ba4760ffe1cb2154ebc948ad1c5b37b7 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c1b39848ff00e94e5f6ceafccfa7e08dcb352f81 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/99eb78318297979f1a87cde9a8ac13c052a1ee9f |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fb942f8e2116df4756905b52e1c4607221d03dae |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/dcee1d1bebd3983120c2e4263ad547c3b3318fa0 |     
  riscv32    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/90d8847e64ac8027a2630e9ea1abd31588656b49 | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/207cf2f8cea886f3a0380c0d4289d1f81ea6ff99 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1e566cf0b603b49133bad47d97d7170170dedb1d |     
powerpc64le  |        openldap-2.5.19         | NOK | https://autobuild.buildroot.org/results/fcd667e329dc68f9038209c0b49883078f9544ab |     
    i686     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/c4ad86ce41e406861a63549822162af9d44bbe69 |     
   mips64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/f65852804f5caf45df914c3a123a7f92b3bb9912 |     
   armeb     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/1508d2691e77f971eae50cac683d5df66e95c345 |     
   mipsel    |        postgresql-17.3         | NOK | https://autobuild.buildroot.org/results/bedec49bce0037ead32fe0a564c695308c2a4126 |     
    m68k     |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/de188509f5d9d41190a0315386c22fbe1d140483 |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b405122a0e8121bb0b1707eac62e5aeca1dfd96c | ORPH
  powerpc    |          rnnoise-0.2           | NOK | https://autobuild.buildroot.org/results/0c8d46f051d8435aa3fb8516015bface1f4e0a24 |     
 microblaze  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/7c6a9839c869cd6a94542c36282ec0dcfd88df79 | ORPH
    arm      |          s6-2.13.0.0           | NOK | https://autobuild.buildroot.org/results/7a0dbb2d8f049c3d40b2b8ef60d581c5a61e27a7 |     
   mips64    |          s6-2.13.0.0           | NOK | https://autobuild.buildroot.org/results/7537b0be2df652f45bf2c448c21b0b3da276fd95 |     
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/4c846d766a5d39eac7abe2db561ed06aac945b43 |     
   sh4aeb    |         sqlite-3.48.0          | NOK | https://autobuild.buildroot.org/results/1f49fc9190ee2381120105aa68f8ad7005462c30 |     
    sh4a     |         sqlite-3.48.0          | NOK | https://autobuild.buildroot.org/results/85b212bd8883a8d380c162a67e20d406a98bea23 |     
  powerpc    |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/561518bf0211d299e81465c9b2dcc23a5c4f193a | ORPH
 aarch64_be  |        tipidee-0.0.5.0         | NOK | https://autobuild.buildroot.org/results/275f811500f7b97154f5ab01c1a0b7360c40f53f |     
    sh4      |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/9be417d8ab94ac33a16297cc77bb33d07c49e010 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/7ce93c1d93f00abc1911c2e9b7fd8e5b484c39a9 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/2597f6ab74ec061eab1f9bd94b435cb6c78aaee8 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/31eb3d2639093813e7282b72ad607bd577ae0015 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/3ab21b8ceeea2cba4db6666dfbda27e100c62a9e |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/b1cf96e77ecd6b0d809326d2369cb26c27d35dd8 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/e0b3da4ebba33150b62f0eb4a6aabe9ec006d417 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/858025774f32ad9e27010cf1ff5771cd99758b80 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/e1d69fca2b400b09d9631717425818f40c005209 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/a2c96778d07e07d350cb0c597d242f6e27f412a5 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4eac36e71c1c1644a031c9e46740395005410557 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/3142d1467707cb12b8d1e88555c0d8d086f048d6 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/fa839785b1e9b2bdbf3c297a4dcc36a4b27a2afb | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/1c991d22573166541a954a7e7251049f7e78a38b | ORPH
   mipsel    |       xlib_libXau-1.0.11       | NOK | https://autobuild.buildroot.org/results/0c5ecd48950955ca3854e78d86cc115c456a869a | ORPH
microblazeel |     xlib_libXcursor-1.2.1      | NOK | https://autobuild.buildroot.org/results/9541a29fc33ca3abd71e1379412169989a2ae965 | ORPH
  aarch64    |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/20c9cecd1a70f652b8b38c748af32b0d1c6129ac |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9be22ec5f357903f6935dedfdf11657c1ce5514c | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

          host-tipidee-0.0.5.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |      host-tipidee-0.0.5.0      | NOK | https://autobuild.buildroot.org/results/45eca747839dc0bff925d5b9e37d2f4759f9a0cf |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

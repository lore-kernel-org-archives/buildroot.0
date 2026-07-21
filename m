Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33124C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 03:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71FED80C98;
	Tue, 21 Jul 2026 03:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TU2DJoY9Jtds; Tue, 21 Jul 2026 03:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CFD480C25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784604483;
	bh=+utOYzGsW1JYhNSnBMLXGXlIURRGgdTbu9yvpDmZ+2k=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M45Vn8t64GM46On+KMaxuMy9u82fL2H7UufDYya5FAmAt5arDH4dXG4DvldUZePP3
	 TwgcMuGh5uVu/zPAlC8qmtoT9nSRtO1VFdsXVkDiy9oK/wjoY8fHHqvevLt1nxsA8u
	 k2Vp0DLkCXso7vGZ39AoJGAERWpt9g9cV5p8Xc5xPiQKJDOTeRpMMEmvaIa6lbNyI2
	 3BQfXOr2USWaMU6o9fHsy4E2oQhyHjfgtupPf7TSJXty0ClQkX/Tkfm55FvqpzPyEj
	 aQxBze29hvkArSd/UF0zRdnOI1VDz9FHKLcDlzgbLYgesUwqRJQEd3aD+4Yy00pw6U
	 vimGLyt0YBUsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CFD480C25;
	Tue, 21 Jul 2026 03:28:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDE1B9E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 03:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFAE9407F3
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 03:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UfdIgFCb7Cl for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 03:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7061407F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7061407F0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7061407F0
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 03:27:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-495437bb891so36085885e9.1
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784604477; x=1785209277;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mRxtX9iOwR9fVV9jN20aY2bTGOAT/g+us/8go08AVdo=;
 b=VO7m08MxAj9RS0uXfSgBwji5QwxE02XkmbUJj66sRgaSjhqubJ6hYIZOFIAnm57ebB
 CqicJMp7ENjkqe8//00DcpImvlQ1KOhuYYohGJ3rfM6BcCx//e2542wJiM+1GjWnT+iC
 cW3deWR21WmgNkeqlnKc8xHfX5/XhV8f6p7RlefF2iBzsS9aJnu9vsWXC9w8thCk5jMA
 aEAKhXAr9SPX93bUMEH0HNnbsEOBtRAI2i840/NXrjFbfOPdCBz2a0/CXG2Jpexz6hqF
 njqTXSeccml/kExgawvmoBhWyHJ8quhlzcsAZbsEXqPgRiGzV4eWas7067GSklFt3ZSl
 266A==
X-Gm-Message-State: AOJu0YxAzoOSoEKwuJWRwT5jW+17duEOyHhjWF9+6yDRoW0UdRot6MM8
 POdD+LQFfrhBcYkHCphGzFbbxEZa/WlrMy50QKepbATkrfqocE74sX0ccTe6OkgG
X-Gm-Gg: AfdE7cnHSn/VkvoPkx9Ykm9PCm8784xC56cVqHceemO+hoNQbEJC8zYSlNEEcfuzKPA
 0R1cRD/QVlkFpdvMVOCrxwPjMQ1sCSZvUjX4uWM5FTvUDMVvNHcRtxx/p0KUsOl6SW3NH5U9UUC
 wejcj3dzl473w8HiwUfKJy4XlSPQyrtwcF0lyI2eOTpFtsW9y0XHdltYC10EXfExfImH1RUl0b1
 4EwQaqI8aSMNSPGPzcXauVgOWI26s1Q6i3SncP7cR07KXrdAosAZABNDOU5Ji5GQt78n3cyGbj6
 xOXtSerWyk1uQZuw8OljVkaDQzzsLSn/8x+RNBSOpawGzldPSLxL+/5wBLvpvuqE0+akN7gQ7ow
 CFvEQh2aXX/f4wUWFTkBCKPsLrRzO9TMZ4oRW2d/CPdxWVohaybCBwlr8qQwep/ajH6iD328PpN
 2iW3eXKtZkG6Ybft4=
X-Received: by 2002:a05:600c:3485:b0:495:6193:c6c0 with SMTP id
 5b1f17b1804b1-49561a30bb3mr57898965e9.18.1784604477008; 
 Mon, 20 Jul 2026 20:27:57 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563969482sm115222205e9.3.2026.07.20.20.27.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 20:27:56 -0700 (PDT)
Message-ID: <6a5ee73c.1180f85d.1b5bcf.bd4c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 21 Jul 2026 03:27:56 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784604477; x=1785209277; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mRxtX9iOwR9fVV9jN20aY2bTGOAT/g+us/8go08AVdo=;
 b=fCtMHSkAqCJARyiTqCPLmhl7kfkaurQnguwKWsqkJ1a+E38WqxlSu1kXF35lOhXQHe
 ybKgnRMi+3SC7WGRjRk7I/1gCoO70oPtKSPjUhEx2+G0r02xr56i5ZOVj2W84ZF2/SiG
 7JGUB3g7TfvBmk0RWYkV/d1vLS99SghKkny2xkPAoMpp5EkWEggStO6gBR8i30DAnA8+
 LikF/87N8H+FxCu3ncFuaaAKreJygQu3aEODk5m5GRjiXTvwGYnXzGWzsJ6gEwWtny5n
 jV9ecsPer4fyxzgxkeysXab/iBqhA2B/a0sj5Z8TPo5ZXYm7V/qDpbJgUeVSI1/mZeqA
 Ao8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fCtMHSkA
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-20
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

Autobuild statistics for 2026-07-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  6  |  0  |  6  |
  2026.02.x  |  1  |  3  |  0  |  4  |
  2026.05.x  |  2  |  2  |  0  |  4  |
    master   | 43  | 170 |  0  | 213 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 19
               host-dracut-111 | 13
          host-binutils-2.45.1 | 5 
                   perl-5.42.2 | 5 
host-am335x-pru-package-5f3... | 4 
                host-odb-2.4.0 | 4 
                   linux-7.1.4 | 4 
uhttpd-15346de8d3ba42200249... | 4 
                       unknown | 4 
                    attr-2.6.0 | 3 
                host-gperf-3.3 | 3 
               libecoli-0.11.3 | 3 
libfutils-c326ce0cc2a735438... | 3 
               tcf-agent-1.8.0 | 3 
amazon-ecr-credential-helpe... | 2 
              erlang-26.2.5.15 | 2 
                  ffmpeg-6.1.5 | 2 
glibc-2.43-45-gdae425b55420... | 2 
  gobject-introspection-1.84.0 | 2 
                haproxy-2.6.27 | 2 
            host-binutils-2.44 | 2 
host-google-breakpad-f49c2f... | 2 
            igd2-for-linux-2.2 | 2 
                     kbd-2.9.0 | 2 
                libsoup3-3.6.6 | 2 
               linux-pam-1.7.2 | 2 
               madplay-0.15.2b | 2 
                    ne10-1.2.1 | 2 
                    olsr-0.9.8 | 2 
   openvmtools-11.3.5-18557794 | 2 
                  stunnel-5.78 | 2 
                    szip-2.1.1 | 2 
           uboot-tools-2026.04 | 2 
               valgrind-3.26.0 | 2 
             alsa-lib-1.2.16.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  bcusdk-0.0.5 | 1 
              cannelloni-2.0.0 | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
              containerd-2.0.7 | 1 
             dahdi-linux-3.3.0 | 1 
                  delve-1.22.1 | 1 
                diffutils-3.12 | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
                    frr-10.5.4 | 1 
                    grub2-2.14 | 1 
            host-autoconf-2.73 | 1 
            host-go-src-1.26.5 | 1 
    host-mender-artifact-4.2.0 | 1 
                   i2pd-2.59.0 | 1 
                      icu-78.2 | 1 
                 imlib2-1.12.5 | 1 
              jpeg-turbo-3.2.0 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20260107.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
               libglib2-2.86.5 | 1 
                libmpeg2-0.5.1 | 1 
   libtorrent-rasterbar-1.2.20 | 1 
                  libuv-1.52.1 | 1 
                  libva-2.24.1 | 1 
     linux-5.10.254-cip72-rt32 | 1 
          lttng-modules-2.14.3 | 1 
                    lua-ev-1.5 | 1 
                  luvi-v2.15.0 | 1 
             matchbox-lib-1.14 | 1 
               mosquitto-2.1.2 | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                openssh-10.4p1 | 1 
                  parsec-1.4.1 | 1 
      passt-2025_06_11.0293c6f | 1 
                 pixman-0.46.4 | 1 
python-remi-2022.7.27-37-g1... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
               rasdaemon-0.8.4 | 1 
                 rtptools-1.22 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                  screen-5.0.2 | 1 
                 systemd-258.7 | 1 
               tcpreplay-4.5.2 | 1 
                 uclibc-1.0.58 | 1 
ulog-0389d243352255f6182326... | 1 
           virglrenderer-1.3.0 | 1 
                     yq-4.49.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/024ea44e793b313cc44905e7a0a313004c7a7ddc |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/d2fdef16d34a9c196ce9d712f4a41401476da38c |     
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a9b79204518aa99b642e2fd908571fdbcaa599ee |     
    or1k     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/171085f4549af7c70636ce63267616739aa75e10 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/8f1229dc97bdb313cb723e5fb363966bd6d7e4f9 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/8effbd6d64d18522808d7d72e450aeb5e32b9b60 |     
powerpc64le  | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/7ad20ce0c463b9d58b13b5c44076e3aad934d75a |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/34c9ac8ff8b04f4a8dfb0217d7fcc7e3d05adb7a |     
    i686     |        cannelloni-2.0.0        | NOK | https://autobuild.buildroot.org/results/f0d623f24dc0db5f994f806188926acd3a437dcb |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/5a7c21828afbe544a65e920322a15569a8426105 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/edf42567bfa2b2b47e2f4e8c063908468601ba7d | ORPH
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/9f0bbf47eeb3f3d18f68d77ce2afe75e947dffce |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8b13a80eba9bc053bff27e60736304d5410109fa | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/6da7f304bec409207db7f5b26239f4373cbbe603 |     
  riscv64    |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/dc611c2b1f91b6422525d4d92e86b179d1ba9ff5 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/9915a75d0616744f0b7cf185102dcd9e695eff00 |     
  riscv64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/c197d96cc1e2506f56c67638dc07aa2f20826697 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/cf752a810dc7226149354e8e1ed290f5afc3eebf |     
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/c41e94ae72c36783dc9f850885a1b09e830fe416 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/cc6f97a6bf8f9aeae86e745787d2410ad114a2ef |     
    i586     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/fe9b0d9b6b1c98a19eb38d3fec1217f26b1c50a1 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/c00022ff8787ec0686abd3e12497c1a9cbb89267 |     
    mips     | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/9281b1fe8ffe2e00bfd35ceab15ae201e3b14ad5 |     
   mipsel    | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/fadb103a48f9b704457c5fce1aefd466c21c4e35 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/452a1c3c5ef5c6207a81a766cafdcacd7d0b350c | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/80ea2ed614d077bca2c933eb3fd069accfdeda71 | ORPH
   x86_64    |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/f9f400304ad7c42e323eee0c14c0c032f3f701ca |     
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/1ab0df9c0d09188a7c25f808282f6d3b3869fdd2 |     
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/9d1906ba4116f86f1b05ba72293080a13fd436ad |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/0b0993eec3eaf469ac82c9a518282300bdb8bc5e |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/72a5dd50bc7fe11c537269ea798171602bb12392 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a6fe9a5e785ef36e84ca97c39157eaf46d2524f9 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ef6227d5dcef7d748e2d159b131b101dcf135e9d |     
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/7eb9932aaafe21b16181fa557ff47a5a2987ad14 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/6c30629330809ddb4edbf2bdf13113aedca7ba91 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/8f8955c7a17ca55536f75b54564c7ccead38253b |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/c4f997d385fd3d60297ff5ae1d1fadd5c81b1c17 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/4811f9dc1665c3a3c9d41f2cfb4b0e7ce6010e50 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/bbdabe9d4787250a1bb460de03fb23ebae856533 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/3552d9d37d52df2700cb54f4be029876a1508188 |     
  aarch64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/6a5c60ccd48b84f5ba178cec78fa4d90270e4fb4 |     
  mips64el   |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/fd07857d0246ddc9b2a4a8fc7c0ec81305602368 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/b08ed9346d79faef3365aad32fbe35f47cbf6c54 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/adaf21f0a679e534d15dedc56d6e2014cfc89080 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/9aa84eb88d6818a75e85b1187bc25b528578e8f7 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/39aa6641003c890f51e2c34fced22732796377a1 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/7af1eb4b3fcac9db626e3524f1a8069e0548b7aa |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/7af46914d860b56ad5f107548007fa8a356651c9 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/a12af478570ce0f8feb2cfd95798dbb29c16bd38 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/2cdf0d3d746e1538f4110df93b087c167efa8083 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/83cc48d84499dd0cb2096a66e4ea28762187bf52 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/c48581b5017bdf8b3d4b26823d4d4ebadd02e676 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/0144492d32a87e164cf5d22ce0daf89a44d119be |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/d69ff94f61dddaad9a312018b2d9615ba3fab14a |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/94883cb53f1b73a271e7a11892c8d39d5c554afb |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/03af4e9c7a7743dab43fbc375317a70e34f00357 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8d343c2776f205f5810a448e2861ee0a5de36342 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6090bb72ccfdcc566b1f360545fa538972426f7b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cac3d95af16af0bf56bffba03c1d57c7f55e9078 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5916add85f205e2a0d1b322a2ec3bf922a048927 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f3ff2b2f66f6ce11d67ff1485ce07924de080751 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/433dec8672c2e7d6dbbaa9d4e9ab90f3bd7dcc26 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/768d8412a9a7e514222760766c121ef2c5b7d2b5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0e111ec47170f5984ab82f9542d5585e797b8ddc | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7f1e86cbaeb6474eb5129d37539df8d46dd9733 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8eb8e100ea29920e8685e5332be486265e505c6b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eda83b1d6d566b0e47f1c88eae15d4f6a48d8388 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cafcf5bac09251f5e9f8be87da7ce84fcc052793 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/95752ef09594d01a92e124cb9eb07c3cf9091346 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3e572a977cb80324ce4e37ee2e2819dd667e8871 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/19866aeeb65f9b84d3dfd0190bf8aa14b66741ea | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fd221f5a5dc99be560b21185a434cab27e36570e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d5453d0c26fbecbd958b51f1ab73b7ee5907ff1a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63a6d6b7818cc54685883c2603f18a0fc1f91b86 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/6659d3541849997f6204101d846d3fd0eff18246 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/b47f468d2ec9bd20d1bcb010586986d3a3703b75 |     
    i686     |         host-gperf-3.3         | NOK | https://autobuild.buildroot.org/results/4da59e41627f70050e2d802d98503c334e52bbe4 | ORPH
  riscv64    |         host-gperf-3.3         | NOK | https://autobuild.buildroot.org/results/0f08cee1fd63ab29429d4f7ee2049d0c8da4e91d | ORPH
   mips64    |         host-gperf-3.3         | NOK | https://autobuild.buildroot.org/results/77de0217d8e6329d9517163a071cfc0c7711a99e | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/d5eb498fe730ee364081b6752ae22c689010c6d6 |     
   s390x     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c5a130f66de11911950d85eecc001e2dfdf775b2 | ORPH
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/17e038f02851089a432c81e0c17d0b7976952fdf | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6c2e256067160ab1c5453ae14afe7ec56965ace5 | ORPH
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8414826b16fad2d8e0ea64cbbf35cb3a9b1369af | ORPH
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/7021a2711c081b6ee01aef6a8541cc0b780faf89 |     
  mips64el   |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/86fd198f14b1285a01cad4f0c595be24b8cf7915 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/d343d682e1db0a4d18eabdb9a76528f6d8f72c62 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/83a0b05c2ddbec7137732f44f8288291fde17e56 |     
    i686     |         imlib2-1.12.5          | NOK | https://autobuild.buildroot.org/results/6c6a688fd2c7959ef4b9c813e92cab734c5f9977 |     
   x86_64    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/55b070af0c931b112d45110a6393528f527fdba9 |     
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/67f7e30f649ae79e4a8a4602a4f2090cf5650130 | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/c77eb4793c91cd75a549776a20855ab8eef08938 | ORPH
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/12ea70e80a7a2b2964d813c9abea2720737d5d68 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/94fef7054d4e3c36486a60638d9deb480a54577d |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/21bd5315c6a743e5095b0ec13bae4380a9c3a131 |     
powerpc64le  |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/d18547122a1ebef36a9923c9a026c5f0eaf60da3 |     
   x86_64    |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/23e0afd59985ce40190af6fb3d27e6461ca423a2 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/35f4b3b7d6e35d20fbbb155b97cad1e0e300ac19 | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/7d139c6e5f8838ffb0b5e82af47c9a747dfadff8 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/9b7ca56da891cfb8c1bc4de4d0bcd6028469cc2a |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/9d2efe17d05d523e80457825c17891ab364281fc |     
    m68k     |        libglib2-2.86.5         | NOK | https://autobuild.buildroot.org/results/0c67f3bd94149dce71d6197a4f781e3a70b4ce6f |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/723eca0abbf9a0abcbda87fce6a342d0c34c13c2 | ORPH
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/c02bf6c4f9ffa24fca6774dcab7e981282f796fa |     
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/a78a0afbd20d4d6dd019b546675a3abf88e94278 |     
    i686     |  libtorrent-rasterbar-1.2.20   | NOK | https://autobuild.buildroot.org/results/58b328640a07086cdd0fb7f9b22fa4deefc91c45 |     
    i686     |          libuv-1.52.1          | NOK | https://autobuild.buildroot.org/results/dceb6c914d7ab8a4661078534f4c0faccded757a |     
  mips64el   |          libva-2.24.1          | NOK | https://autobuild.buildroot.org/results/edaadc7d5290185998aa2caa4670fff0d45f6e04 |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/7e5adb2b825bc5bff65a6b6c0c93ca68c15a83fe | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/336fc573cc615be87f1e2b3a84587a92699bb3bf | ORPH
   x86_64    |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/cdaf0e632ec101ea3786f89af77147c96467aace | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/46388cbc78c9d9c181e912499d781dcd45047fdd | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/be3a8155ebe6dba964dbfb7a7cde5c981c9dd9a0 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b94347de13138ae4c0759ec58231d6050fb84c66 | ORPH
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e470954cb76f88ba9068568f5744de83de52056e | ORPH
    i686     |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/193b9f42c92f6a4a12526a2b40bf562e31313871 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/31b39bb6e93d645f67749406546653d5d0eec898 |     
    i686     |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/7415a1d75abc9e287af69c551e5a0d0bb3c1eec0 | ORPH
  mips64el   |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/de1987bec3fb641367ee417864a7b011a3d97e06 | ORPH
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/f96bf867146d11b620018a7e2b6b0a5c53e55433 | ORPH
    i686     |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/51a52355519d0e099d69216ad87d3eb9c9e7c0b8 | ORPH
 aarch64_be  |        mosquitto-2.1.2         | NOK | https://autobuild.buildroot.org/results/d78ab0434660310d106301a136a8b29f178678ab |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/485e036465441e3c0e78e88ee5a529af1e99170c |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/d68ac10c6c32beb37a379740e952765a9933911f |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d009c2b32ffdf7dbb642a7bb9fdbb0573315621e |     
  sparc64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/feeefa9e8fabc7b8a4611fb0bc2c2184c05e1f9d |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/24736c6e59f55235c90b0790b456eae76313b7b3 | ORPH
microblazeel |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/7c359d2c9d854661577ea6e7b0a69be53b04513e | ORPH
    i686     |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/be557d95bfddd9c330cd83bee38f79f796175fc9 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/950058de58e47e6c21c3a99e680d7d49ee23af69 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ed69395c5a1946aa4d7640a64ff3456d3f3803d5 |     
   armeb     |          parsec-1.4.1          | NOK | https://autobuild.buildroot.org/results/52e35f472beba50d5b8880dabe8432d6cfd4e59e |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/0154ffeb30e7b0b3da4145d8cbaf8636612186e5 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/cd48876c8b9246350e1bfe5d295c2a756dd1e18c |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/0f0b8754b382ed03463ee78eca2b96f923c4446f |     
    i586     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f6823577757f4634c89fec48ef51dea04b2e5e7a |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b34ef9dddfcd96b81d405f84f7aaa6e372d202c5 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4922b2ef12bc73548449de4037bf5fbb3ddb78b6 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/c828288ea7155ad90b144f38d549c17b3e97b88b | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/aa6b61420b609e0e3f880ce9be69cdd77b3d0bff |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/cefd7209db3d12dc29712736eb435c395ca04127 |     
  aarch64    |        rasdaemon-0.8.4         | NOK | https://autobuild.buildroot.org/results/aec1c3d55611f04776d6be8374f256461f74eea8 |     
   x86_64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/7c2dfb1ec254a8614dc73403af277ea77db7c26b | ORPH
    i686     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/768e12dc5287741c7a485c1e60f066fa7cbd2701 |     
    i686     |          screen-5.0.2          | NOK | https://autobuild.buildroot.org/results/71e1e86ed81421976e96c3499ef13e9df3f303a0 | ORPH
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/cfd9b9a249d420002d402795726c522d51eec9c8 |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/e2e0ea1b2680e82880ec8011a2071b12970b147d |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/a09b749f2991d0add3aff0f367753b912d860e9a |     
  riscv64    |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/84e2ed700cbcecfc678a1c70659feb0e78c339c6 |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/231bebc507bf148786d2a7301993b2329d7646c6 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f044c9ff8d0c60e52a35c6992f85af5513416c47 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/01f4729a2bcc556f1da33ce82d204804fca2d4f3 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/27617c71e5f5e68296abd3e6dfa53729de660120 |     
    i686     |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/735c68ec6b7f5ec16d5e331f8760e2360173375b | ORPH
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/6f528eb98a521eb08c0b08018cecc82b648bfa70 | ORPH
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/f5abb92313ac455b780f414d4b4f08ca65aa20bb | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/489d88a4a74d5c2f4737fac34b7e7c243fde3e19 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/07b229ac23fe3734bc076384d30d275ef1695b5e | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/98be0457e1c12d07fe27941c7c1f05971cdba27b | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/61538e46ba3db9515fab01a0ce209404e013cc70 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/dbad87bf4a167246dc4069e9234d2c5484f50069 | ORPH
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/207209e3162c74f419a1d05c7c8569f455ef14c8 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/37aa318a4c7b7ec53b44086e9fa0ce027b274141 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/6b0d46b6ae0eeb02b970ec75c738a53aef5831e4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/92e6b5b6bba7f0e38aa040498feaa199c72ea1ff |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/eacdbab7444f883f9d7fc02f4c462996f7df6c77 |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/e692fed5a48b24491b5f6242bf41f5a4f69c1ead | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/ac780e2f4fffe8195a06ac64cb632360683c2ae8 | ORPH
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/570fa64fa836901e23b8cee0dc185da8077f1290 |     
    arm      |           yq-4.49.2            | NOK | https://autobuild.buildroot.org/results/d554c2a579629f5b091b01a24880c9b12dfb06b1 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                  libsepol-3.9 | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/ca07733100b67d0c6c92abc935e98a302bb7c614 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/c5322058fab97dba6fbffa2ebd3ad93d923751b9 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
                enscript-1.6.6 | 1 
               nushell-0.108.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/da50b0f0d6d7500a2e832df5ecc8f9d5d75c3c86 | ORPH
powerpc64le  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/958c6bacd1f333f05aa31e5d1bfe924015d11906 | ORPH
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/eca65d731afd0e76d34d287028a56b94285b50c8 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 1 
                libdnet-1.18.0 | 1 
                libglvnd-1.4.0 | 1 
make: *** Waiting for unfin... | 1 
package/linux-headers/linux... | 1 
package/wine/wine.mk:347: w... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/0781b166b94e94054e5ded1e721508c8943f6c8b |     
  mips64el   |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/de54804bb2d7c369034360724c53e7e1e8adb1e2 | ORPH
    i686     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/db9297d46d33ab79c94cc20273df8c09caa36654 | ORPH
    i586     | make: *** Waiting for unfin... | NOK | https://autobuild.buildroot.org/results/a942d9c3e6af0d01b9a83487daf45f30043b0ef2 |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3793350647f8b19dfa9b5fcc0a9ecb237179c1ee |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/3ac7ac6f39519b82cb4b560d94c78cd98b609729 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

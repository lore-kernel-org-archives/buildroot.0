Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB67E92722
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 06:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA94E406CD;
	Tue, 30 Dec 2025 06:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqvTxtWEJrMM; Tue, 30 Dec 2025 06:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B95240718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767074543;
	bh=ykrqyeLRz9Ze+J/M/ZDVGlKQof7FnfPg9kiwNOyfeU4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gW2zXqSaehj96PID02A4ANiZkCDTAcq786H789aKiTVwXh9Tg6+akWH1etpaagYm/
	 NYHbEHG2EnsbRwvjrH44HyBpGowGuhhEfCFs6cPZp0CqvuNpyplopq83f3DHN+Q6My
	 H2+D0MjgHXvq+wkluACVPeo5F7FX11b50xF3AmzW4VZrk4ylzAjYm/xaR+LMVTdx+1
	 zBJOWuShjsDy2gbzibvVpH1la8BIUGb0sgf01DjoiN9JEkSX856FUdZJYmNGQImuNJ
	 Ipo3hXvin3AGuqQgSDCBXIAl+vLAisMBDeBj4RLT8SIJWsjKINmtdr8fLFnCEPGdRq
	 2MRqHwomE++6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B95240718;
	Tue, 30 Dec 2025 06:02:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 427CF177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 06:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 287CB80F03
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 06:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOe8of5Y7ztM for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 06:02:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E21D280F01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E21D280F01
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E21D280F01
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 06:02:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5959187c5a9so8323441e87.1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 22:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767074536; x=1767679336;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5h4d+zbKKmBST3Qb+IGy+COo+cS+2TWdYn8N15uPyc=;
 b=PM4Nm/rpBnyw1E12e6s4FTi5kCY702mqtDkaO1GeYNgeAPeOGM7oN0RSQAWiIy4stF
 d7nQms96RGyuRUQr2q/Mb8TtyxkmwQZm42WM0SbL0OhxSj3lZ+jXdbp3wAlQPRbl+++1
 K0gmKaHEqtvYboQthMHZXkTsLWIuPq2AU5tGzUnEjtk76pCd2aWyoy25sHdpxdQt1bnf
 uqXrpp/e6xpx1hiOWSDl48LqSDg7sfl8oWsYLKKn8DIBfzENQy86kKGimvM/grn88s+2
 7Uu26z0UtEdMtNganKh10aAoel09e5McDuhMHa85yQN8vRI3nRhDZVTTw9Q4lPH58UXj
 mfTg==
X-Gm-Message-State: AOJu0YytFiWZSoWDh+KyYqasn1LlSDDz8Db7bXDaypBNxl+XkSj8tSb5
 YdQwifUQ1LfUNSlT3uOFakioKBEAH/JxY7Tv3dSnn1Qu4Yvm8jD+oi0KU4zZqg==
X-Gm-Gg: AY/fxX4Cv9hD0TFJax8g4k08OZHytp3SxmVU43BE2cyMhb97P2AAT5Eawd9KmVMT5kZ
 Xsr3pNKiXVlA8YqegaHXhKXQKITWTfiF8fyKHeLQ/Dlrq3UmXsbo5EtlXiAb6nvnvSNYuqCA3yh
 SyskXphX1gvGeVkx5lemthP6uIt6LwSxPnyFdK6HmWtoZVfP6m6rQIBIRW8wac574BMQWDMcHhp
 5xHZz9UiZ77GgYIWdC6EhgrDHI1x8NV89uHd9npEr4LQtVtSV4KXvUP2aWfxZ/rljuqvEFPcnnA
 8A46eKtO5WOszhyiVA2AKLqhrQMD0LZMzVxLgqd5FhLDWW+iK9Z7cDfwGXyY3IdQSv+2RoCIHIm
 qNT6CnM6OARxIsez32lO85AxImCYUAsAGD4Tm8lJ4Dx7R2p+4EnSaqYgATl2XbUR8Ow3RMR/hsn
 X3QJl+sreYIFaorWwPkg==
X-Google-Smtp-Source: AGHT+IENCDJwBbqzz1ea7XSp+CHfa2l5GDo5dynrojXgqy9cGPoZEZUmHnLABjtZB/5lOTH8S3Wmtg==
X-Received: by 2002:a05:600c:4706:b0:477:9b35:3e49 with SMTP id
 5b1f17b1804b1-47d195495e1mr369997545e9.3.1767068350921; 
 Mon, 29 Dec 2025 20:19:10 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3af6dbdsm250893915e9.19.2025.12.29.20.19.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 20:19:10 -0800 (PST)
Message-ID: <695352be.050a0220.f916d.b371@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 30 Dec 2025 04:19:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767074536; x=1767679336; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=A5h4d+zbKKmBST3Qb+IGy+COo+cS+2TWdYn8N15uPyc=;
 b=NQMQvYEOhrC2AFOSuQLqn0sKiXxrePCA6koJKBDPOoP/m7wT6LH4vIpYBZgf7TsLlb
 +Ti9WZCptuNi6NMVUUGYrcxcW8SRodPfznaoWo2eKPBrGvzK9QZy+1n2xC1VRF2qcqIq
 BEbUgJyu/08bRxYfx/uqvE10G57OXVvFcQ9WyFpSpySggeWKgCqE+f/fWmvIlVneKMW3
 m2jPitgtvtgVQsCfdk6kj9w50yZ2VyrgkkEygmbN43F1fkc2bV5rIHzIsZxAbO1TKm8c
 GTpaEL/5mYZ1Dm6W06cZ+CaM8PKhtKZK9gEHubZGrCnc6IazrqYPc3c7AbqNj2UH63jJ
 I+jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NQMQvYEO
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-29
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

Autobuild statistics for 2025-12-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 20  | 36  |  0  | 56  |
  2025.11.x  | 13  | 10  |  0  | 23  |
    master   | 36  | 158 |  0  | 194 |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 9 
                 jasper-2.0.33 | 9 
              libid3tag-0.16.3 | 9 
                       cfm-0.3 | 8 
                       unknown | 8 
libcorrect-f5a28c74fba7a997... | 5 
                 libiqrf-0.1.2 | 4 
             dahdi-linux-3.3.0 | 3 
glibc-2.42-3-gbc13db7393773... | 3 
                  libcgi-1.3.0 | 3 
     libphidget-2.1.9.20190409 | 3 
                  libsvg-0.1.4 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                   perl-5.42.0 | 3 
             berkeleydb-5.3.28 | 2 
                 c-icap-0.5.10 | 2 
                  cairo-1.18.4 | 2 
                   cvs-1.12.13 | 2 
dbus-triggerd-ba3dbec805cb7... | 2 
           dmraid-1.0.0.rc16-3 | 2 
                    docker-1.5 | 2 
                      fio-3.41 | 2 
  gobject-introspection-1.84.0 | 2 
              libmhash-0.9.9.9 | 2 
                libselinux-3.9 | 2 
                 libuwsc-3.3.5 | 2 
                  linux-6.18.2 | 2 
               linux-pam-1.6.1 | 2 
                   lsof-4.99.4 | 2 
                openobex-1.7.2 | 2 
               pulseaudio-17.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                 xinetd-2.3.15 | 2 
            18xx-ti-utils-R8.8 | 1 
                 aichat-0.30.0 | 1 
            altera-stapl-0.3.3 | 1 
           at-spi2-core-2.58.2 | 1 
                 babeld-1.13.1 | 1 
                  broot-1.54.0 | 1 
                 cdrkit-1.1.11 | 1 
          cloudflared-2025.8.1 | 1 
              containerd-2.0.2 | 1 
                   dante-1.4.4 | 1 
               dvdrw-tools-7.1 | 1 
              e2fsprogs-1.47.3 | 1 
                elfutils-0.194 | 1 
               graphene-1.10.8 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
       host-nodejs-src-22.15.1 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
               iproute2-6.17.0 | 1 
                 lcdproc-0.5.9 | 1 
           let-me-create-1.5.2 | 1 
libdill-32d0e8b733416208e04... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
libfutils-c326ce0cc2a735438... | 1 
             libgphoto2-2.5.33 | 1 
       libpagekite-0.91.201110 | 1 
            libxkbcommon-1.9.2 | 1 
                   linux-tools | 1 
         lttng-modules-2.13.10 | 1 
                   lzlib-0.4.3 | 1 
                netdata-1.37.1 | 1 
                   nqptp-1.2.4 | 1 
                openssh-10.2p1 | 1 
         opentracing-cpp-1.6.0 | 1 
      passt-2025_06_11.0293c6f | 1 
          sane-airscan-0.99.33 | 1 
                  snort-2.9.20 | 1 
      softether-4.30-9700-beta | 1 
       sp-oops-extract-0.0.7-1 | 1 
               syslog-ng-4.8.3 | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.2 | 1 
wilink-bt-firmware-43fca73c... | 1 
        wireless_tools-30.pre9 | 1 
                       zip-3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/7d486eb54caef8db854acd5228aebd96a9d12747 |     
    i686     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/1bfc21811b1bdbf05845119fb1e45883775021d7 |     
  powerpc    |       altera-stapl-0.3.3       | NOK | https://autobuild.buildroot.org/results/c4fccb03551a1c408b5b542ca8ce4ff78b87ef15 |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/190824c3351f2167047ca72ab295227ca649c9aa |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/effb6aab2593708b0ef0295ee79a40ddefab6109 |     
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/48502bee677b31e3f3dede102c70538eb2c2a117 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ba01fee4ab4c6b02bd8d9983f0625ed64f24cdaa | ORPH
   armeb     |          broot-1.54.0          | NOK | https://autobuild.buildroot.org/results/c2004728c03e880c1bcc71219f96880d88ce8571 |     
    or1k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/3f04a9b0e983507b1ea47ef190c62377dc6b8095 | ORPH
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/82602a52bab93d98a858b636194e1ed649432b90 | ORPH
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/6f36ec0764d32081f792171d02d61511fa4095ef |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/93661f4f06d2e5982a457e6b063c878944cd5b4b |     
    arc      |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/de414666882c9b1cd4136b7c81b51c6445caeeea |     
  sparc64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/f749b5480b9a81cb64d2c2a786f6a1e380f6385e |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6615b09f41bc05944dbb73d4dc69e78da111b118 |     
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b2e6f0e7781cb37d27a864dad39e23573744cceb |     
   mipsel    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/9a0a656bda6c9c9138b61658af3024aa0314a079 |     
    arm      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/5d18f5743ed199891416094a3bbd4be305fc5346 |     
    sh4      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d46000815f5d4abd2f57fcda5f8c1fd5e828f5b8 |     
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/e04f56bc6a8c156032f6edf95a3dccfe0a0a53d2 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/33a1ffa958466967629240825a8b952e97e2b45e |     
  riscv64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/876d3b8b79d4ce033f124eecbf13697cb4b36d48 |     
  riscv64    |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/63ec348988d05db40e57bb539d9bb5735d0b7b69 |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/61eae5d12e15973867f4a41076d10a51b0982070 | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bc273030ca931ae3d58500db2f968e5d01c1f020 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3fbf85eb19d6f96d4b36a96c5b5a0518fca57ea9 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/42ed0023862a3182262dfe00fad6fe519e47a767 | ORPH
   sh4eb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fb2af267d14e03a2f15a8b8d3f690ed7bff03800 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2fdb59c06f55b5ef45f6a72823f4e52181328e52 | ORPH
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/34f2aba2625ad1f32fe9fc25e574072c204a6e8b |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/31925170fe1beb1851f0c47f8aa447d150561876 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/c97f85b312efde651fdd4450bbd3df761b5f957e |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/03202d24fe5675e761956cd3f72ad2ee2e151dae |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/97ad4fe14060edc74deb08d4c0fcddff8d82e2e6 |     
    i686     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/000dc1dc1a2d3806c34219cd8614050d26dd2fcf |     
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f00965654a15c3986f529396285da530526550f4 |     
    arm      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/d732b2dc53212e8d060c9c69e261a48fe5d8e474 |     
  aarch64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/ef7fdaa96e4450e04f5dda76452a9833298dec94 |     
 microblaze  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/748038c9c63d59c9649aeef96cda86a52886c163 | ORPH
   x86_64    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/75cd4c3d355f08cfe85d93df8639e67a93013289 | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/191ddb5e0e88b747d1821c7eec5ddb508e95fb85 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/c4e0f030d2a910b3eacc68778bbfd9688204a253 | ORPH
    arc      |           docker-1.5           | NOK | https://autobuild.buildroot.org/results/5ec7322d513efa4ac5a6bb6629034b51e0d9c368 | ORPH
 microblaze  |           docker-1.5           | NOK | https://autobuild.buildroot.org/results/acf63de60a0418f29075b74f9f7d972721673e9b | ORPH
microblazeel |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/5dd4dda7741444e76d0469ed5955609ced013897 |     
    or1k     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/527bc29f882f4c361a66423a6e40b00a7ffd50b7 | ORPH
   xtensa    |         elfutils-0.194         | NOK | https://autobuild.buildroot.org/results/b4f44afb23d9e2fdea0276b56685c3ee33fb46ff | ORPH
   s390x     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/7fc76f40bc0c571f0e320fdbfe798ad23f354520 |     
loongarch64  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e41fd736f94a2e0ed91c83da69eeb32b5074ec0d |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/d39c42e2b49b537e2747e9f0d2a508e8515473f1 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/76bc5dc1271a1a94b562443527d9b892d7a51d46 |     
  mips64el   | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/6f0e8419b76d3f8a6bb7a2ec2ab3d83295614a36 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b1194af365439d9b0641ea331d7692c326e342b9 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/96959a1cc5988a1503e6ee5c6c5dd1e11bdae3b4 | ORPH
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/99df8524436938ffd09939c457004eb2c798472b |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9563e932c2b6d856d3ebcaea658aef6997935085 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/8a3c9f784bdbce0acfa0467ded2dcb6878404714 | ORPH
   sparc     |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/f94eb80b712aa69141f0d96a8849680d81120c87 |     
powerpc64le  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/33ecf3ff97f0bc3a44aa789afb5a9b103e28cde7 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0b0cbccae40e34b4c1a97427298493ccc5dc15c8 |     
    arm      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/44c0e17b86fa8583a4eb7c74be1dc470d172f8ee |     
   mips64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/43bca112720755c00abf423ed3d31380ec02e84b |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/dd8cd0c620b81f5332458734c14e414448653373 |     
   x86_64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/17c6662c35880926d9e1965b61dbb7ca0a7c3dd3 |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/e0b70e9a4ed930b12f45fa51cbc4304af2d22195 |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/0981ef3f1c693de62fb9330c528da927631deecc |     
 microblaze  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/ed6ded472ca2a34893ad2ab475f5551fda8ddfa3 |     
powerpc64le  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/e401cfa6a952dc955871a71933fa53cd88a18261 |     
  mips64el   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/83a2954202e12a6654ea9f472fa382d514993fa3 |     
powerpc64le  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/f2cd47f0becff7a4d53ac453b19edd05a0485faf |     
 aarch64_be  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/16d2e77d50d54c533cc267df5dca33365a370140 | ORPH
    i686     |      let-me-create-1.5.2       | NOK | https://autobuild.buildroot.org/results/0f45cdb3e7cfe841994bfaad79560386ade9cc15 |     
   xtensa    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/7f4aa1d4c1c3c7713581a9a7055308d4dbb374d2 | ORPH
   mips64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/35bc3c634a5eaa7c4e60e7bde8a8c94218f38312 | ORPH
   x86_64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/99b6e478da39c843f44e2488cc21c8c5ef92aefd | ORPH
   mipsel    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/e985723bdb7b99fb63a05f73fe106af83cc2ea03 |     
microblazeel | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/2b8be553f8791276adda1fb092cb482d8c2303ae |     
microblazeel | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/461aa118a57e7ebd2cd7ccd611007b5b3646801d |     
  sparc64    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/e26906af852d628469023490d28b85dfc6394cb9 |     
  mips64el   | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/fbde240d84d81a6db462ac2d42b8aff797387d82 |     
   sh4eb     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/e8f4c6aecd48cb6ff1f15550da7bcd6210458dd0 |     
 aarch64_be  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/3b2e46beda0f134a4ab78cdaf1ecac9b26cdc791 |     
microblazeel | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/648fae3678e080f591163e93c9b5011a4806bd36 |     
   sparc     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/04e3a925314e4b81029d2ab986c98e2d1a12c747 |     
    i686     |        libid3tag-0.16.3        | NOK | https://autobuild.buildroot.org/results/078938e2e13d36cd2429c8c3b5018e128a069ebe |     
   mipsel    |        libid3tag-0.16.3        | NOK | https://autobuild.buildroot.org/results/82f8a9dd98169b4dc6cd81d12d28882c9ff433a5 |     
   xtensa    |        libid3tag-0.16.3        | NOK | https://autobuild.buildroot.org/results/0c2ba0aa2280ae8359e246335c4a7c2a0556a1da |     
 microblaze  |        libid3tag-0.16.3        | NOK | https://autobuild.buildroot.org/results/02db8c1a1b461fa3b5b5932e5b48c77be50b68af |     
   s390x     |        libid3tag-0.16.3        | NOK | https://autobuild.buildroot.org/results/499da942a762ab0ecbe5b89914efa488030f3bfc |     
 microblaze  |        libid3tag-0.16.3        | NOK | https://autobuild.buildroot.org/results/13b913926011fdfc0d08382608e36b7ca26f3700 |     
   xtensa    |        libid3tag-0.16.3        | NOK | https://autobuild.buildroot.org/results/e3081b7a76f1c8a0b6dd44f8ffe11944bf3f116c |     
   mipsel    |        libid3tag-0.16.3        | NOK | https://autobuild.buildroot.org/results/ef60af191b1b1fcb462e87ce8d77b41af25042e9 |     
   s390x     |        libid3tag-0.16.3        | NOK | https://autobuild.buildroot.org/results/0e165a98adc7eb9838043b6d92df8088e042935e |     
   sparc     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/dbe2852c08a671e6a6e16080a1c0ed4c55348766 | ORPH
    or1k     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/4bf92bfa0bf0f7bc3752b5cab9eb60ccdaf40d6e | ORPH
   mips64    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/bd8b71d6e729351db7c7363cf592f0e38ce24dda | ORPH
   sparc     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/bc0132aab17dd7cc1896aebd2cc6d37f738a940d | ORPH
  mips64el   |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/878a330fb217183afa449d4cdb3bc63fe9427258 | ORPH
   sparc     |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/c3b09ff572f6db3bf7f95b4637060dc2da04bd70 | ORPH
    arc      |    libpagekite-0.91.201110     | NOK | https://autobuild.buildroot.org/results/4cc3f0f196d9e5e535f1277463e3799c746af7e4 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/73ea8dda80623597d7ec553f1f9803b30b4400b2 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6183dce8cf67baad8ec66a3535c22a436d6457fd |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/768781e4c8ded8a069e09f664be9f3f7608adc59 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2225bbba6b5c91b4e96f7e87ffbdd74de4fe438b |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/34c5e359d17a4e9a5e10eb6626dfd0ee16b39260 |     
  riscv32    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/60a43edb8852ba43a0c569baacc49bea07e433aa |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d074061af002ff7b26640179c3ca1f33f547097a |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/3a082dda774a7a1c2626f3e8dc8641faf474fac0 |     
    or1k     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/0c08480641056f398a80270b5c3fcead8bebc3fa |     
    i686     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/c729a459966ea282830f873cf8e65c50e2488bd8 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/f00db772985a59a60c9b9323a4e19fd30c1ace86 |     
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/cc34edf23c929f7cfdabda37795ce199dbe1b0a2 | ORPH
microblazeel |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6164c39873106cab44fb257e445c074b0040d6bf | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4e139341d1d03b199871c6023d161b89dcc6747c | ORPH
 powerpc64   |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/e5c2ea962899504968ae335968342b0c6a1032b9 | ORPH
  powerpc    |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/77c740062fb7540f3c089bdbd83d80025259ffe8 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/78c710f2958bc2f5bc114d3adac3679fba350aa1 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6380a45d1ef009ed4228eb2c8ed1a76854d4cce7 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a89fea739fe9df95c211f6ff20f377f264c586cb | ORPH
    i686     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/1288f6bdeec993e463bff32b8fafd51d97a826aa | ORPH
   x86_64    |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/eb54141d49bcbc16a799c8b1cdccb2f8a170b2eb | ORPH
   s390x     |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/78d05ded97877f866d2bd7aa600a2dafa01bb364 |     
   mips64    |          lzlib-0.4.3           | NOK | https://autobuild.buildroot.org/results/140e16467f56f51154e374777d79351521d69994 |     
  mips64el   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/9086d63361199e093b02f1436f1cefb07adc7f1f |     
    arm      |          nqptp-1.2.4           | NOK | https://autobuild.buildroot.org/results/123b11a1e8b364107eae505c103a21aca7a526ab |     
  sparc64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/592c39a93a96ab8a736df35310fe01f84ebae89c | ORPH
 aarch64_be  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/07b7f48f38f4eb7a899ca22b5db8ed33b9900640 | ORPH
  powerpc    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/d33644d2ffbcc0b931631713e8f830465871d040 | ORPH
    i686     |     opentracing-cpp-1.6.0      | NOK | https://autobuild.buildroot.org/results/cbc80ffb0dc4d4407bb788cec05d13ae37d1eff4 |     
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/299002a0b81dde226d4c5a27befc535a00cf4a30 | ORPH
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/718f6791a30f503c2c6d79092255bf6e13aa95a8 |     
 microblaze  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/92cd509ff8533062b1bbc5e538b442d87dcb3015 |     
    or1k     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/2795cd4b71c9913efb41a4da5634fe978a1d07b3 |     
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/de15802af7dcd94ff81774362f38788cd5633942 | ORPH
   x86_64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f72e8a9a89e62eff7b7a34c6012df8637c80baa5 | ORPH
powerpc64le  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/f5d1ca6e4ce0f28135355182b4a80978b3a19005 |     
 microblaze  |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/89d4b8cb111872c203fded248dba652af229d8c3 |     
microblazeel |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/769f6b5459ff1a5ca0ba6bd7523a861b57d102a3 | ORPH
    mips     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/429bf8ffd226e4d234a4a5c7da25a07b28a0fb92 |     
   mips64    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/9fe50ae4f66a636c775b9663cebf30a17dc8be6a |     
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/54cf747ddddae9fa95541f317d8fc2c1e47094e5 | ORPH
microblazeel | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/d66f26f16fd02e810cbd98d4b240e02fc5714a19 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/5235d07d7a54aeabfb821dc8f482d8e7e0d82c52 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/568a0e525fcd49be2571fcf7573fca448dd0031b |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/9d823cce650722c7812f36d57fa2232ad1150555 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a080dcf9f816937210a34365c844944430f314c5 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/65a335cdcf01b973b3163f78f74887e0ac4fb8df |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/1e314a3422660b9b3ccf5298367d4194cad44513 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5697f8748647f7f0069f097aaa485b2718880077 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/fc53c6212b09feb3d8a4f4c0409df32a0d3bc715 |     
  riscv32    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/6a5317774c3b8f340339576c52338de40cc1cdf6 | ORPH
    arm      | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/f8d49ae115aa9db70c11eb082152b867e7f71483 | ORPH
  riscv64    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/e3e0958fe41c764290f599e40eb8a78baa92039a |     
   s390x     | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/44fc56a05b96780e6f961f18b121060506181fb5 | ORPH
    sh4a     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/f8c5691561326e1cec199368bae997623c9e87b6 |     
   x86_64    |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/9db55703fbca15bfe85b9111d3f4aa9b937f83e2 |     
   mipsel    |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/82b967a02c8b20f4569aec5d8de9c23639fc2983 |     
    arm      |            zip-3.0             | NOK | https://autobuild.buildroot.org/results/79e4756f8ed1d29dfe0eea1090b5b099371cd32b |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                     exim-4.99 | 1 
      gst1-plugins-bad-1.24.13 | 1 
            igh-ethercat-1.6.3 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libjcat-0.2.3 | 1 
                    mpir-3.0.0 | 1 
                openocd-0.12.0 | 1 
                    quota-4.10 | 1 
              udpcast-20230924 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e94acfadf27a3c32de3251ba8f8268972cb9ef7e | ORPH
   s390x     |           exim-4.99            | NOK | https://autobuild.buildroot.org/results/5dd7287ec05ef595a993056ab68e0a3621df9670 |     
    m68k     |    gst1-plugins-bad-1.24.13    | NOK | https://autobuild.buildroot.org/results/76b8415c8c6b8495988724ef12b64001621069ce | ORPH
  riscv64    |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/a3498b53980edfd46099ef350c89227fce199284 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/7ffac7303b409e2403c80b3aa60d00c0a853e277 |     
   sparc     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/2c5dde7bf05f573c25d583f289455a12741d7b14 |     
    sh4a     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1359c4180bd0daa16f2122c10ad408273a15e127 |     
    arc      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/ab95b58d75eb94b2499a30f5332da6d355a9e7b0 | ORPH
   s390x     |           quota-4.10           | NOK | https://autobuild.buildroot.org/results/1181a42afafeb3b5fb0ce402d414f2cd1ae42f79 |     
   sh4eb     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/9b170d34a0dc7489255c8f12e00156cd69a2de2a | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 10
                libxslt-1.1.45 | 8 
                   dante-1.4.4 | 2 
host-go-bootstrap-stage2-1.... | 2 
          linux-5.10.162-cip24 | 2 
                  ffmpeg-6.1.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.82.0 | 1 
host-netsurf-buildsystem-75... | 1 
              host-rust-1.82.0 | 1 
     libphidget-2.1.9.20190409 | 1 
libuci-f3fc0b76040685829191... | 1 
           oath-toolkit-2.6.12 | 1 
                    polkit-125 | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/036be9cae2480040a0c798dd24b4a5f31749026b | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0ab0f65bea35a3cca1ff4c836442420be4d4f17a | ORPH
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/ffa68ec9cbb9ef99094bdc7ab042df795aa1bcb9 |     
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4e62cd0210be6408deea980a96fffaa2db5dc782 | ORPH
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/e9f7c74b9242e71f439425679883c5b47c42739c |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/6e7c84100d8236c6a07c406040f7e0adfbedd455 | ORPH
    arm      | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/7d41615a05527de3bb7bbf4f2bbcc6d29af97a06 |     
    or1k     | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/5888de41bfa01e0aac9931f90301a5048b71d132 |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e1dbe3972388ad4e94f931b13a3ea5b84a940afe |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/fbe38628bd769d0b460fd0070a75b25224eadf25 |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/75ddf123dff96ac17ab4c1a1fcdc43716de86602 |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/dfa88cadfebc53f3d66db3aab997feb801edd051 |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/ca70aff2d61ed358a4911b20775dd16f7e85f697 |     
    i686     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/60afe440bbe1c6be9285937916e578cece4a26e8 |     
  powerpc    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/979c1f4e92acb164d328c40896eaa8d978ddd743 |     
   sh4eb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/3a024ad65b2c8bd718965898ec4d3baa3c1eb887 |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/fd27c423b1fad8d8cfe7c77336320ae71a105301 |     
   sparc     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/0a653ce5bf8b422715bb4946f633aa45d956ffbd |     
 powerpc64   | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/8ea91b8c7375059448c3f813d0434c122b3b99b4 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/4f3f45fbd8473ae79fb4e257fddd36514ade66ae |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c2864c3d8e7c12fbcc720fab59c4bffb4c7ded89 |     
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/0e8506a0404cb450c39d69b0e0cd17bcc6373ad2 |     
  powerpc    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/f4e729a39253b9564384840fa6fe3ad5be5ffb7f |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/52b3305b3c1f5d2485d5449b739183274c4e1325 |     
    m68k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/02d919c21765ead383cdd8bcf1b46387e1b5a5ab |     
 powerpc64   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/85fa0c9a93d991337f3c3133d5d2054406da8558 |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/cdfedcb44a70368c477d3b639f60463a98571bdd |     
    mips     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/829d5f0ca0f302de0ced19efb8f2336a4bb2f12f |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/ca926c0892e79990f35619d8870e8ab2f244f9ce |     
    i686     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/6d244d01a8ff7dd82afc1ea826dd344b4ee9bbc9 |     
    or1k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9b35d17a19f0e21777aa2963542f4bb35b1f14ce | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/54b54959703fb430f7a5dcdf2f6f1ceec79f3f47 | ORPH
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/67d06a974cf5cbe68bc07416a7c24fe3bd83cf2b |     
    or1k     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/f0ad1fed18fa3b4f6288a1919de029cf4e712c10 |     
    mips     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f0acf6b592e16363a16a49d7ce2a3ea150597423 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/1929664eb6df93e4d16e80282662701d423df16b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

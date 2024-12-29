Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E87E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 04:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F8A4043D;
	Sun, 29 Dec 2024 04:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exFwbOdD352r; Sun, 29 Dec 2024 04:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF27A40505
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF27A40505;
	Sun, 29 Dec 2024 04:14:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75E0872
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 04:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5786580C19
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 04:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZawa4M2YKP6 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 04:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13407804EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13407804EB
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13407804EB
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 04:14:22 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d647d5df90so13974109a12.2
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 20:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735445661; x=1736050461;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sEDny/pGbPK3YJwHWYdYnIu6uVTx1JwcXxdqWIoqpEs=;
 b=W4Bitnaq1FsD0WONz0QWipRb25LAThGaO0qlJSgaiyl5NpXra53B0HcSKere4ZBLDd
 FNa/WO3FaTrkrqsxUTRLRUIdLwnEg4uOrWrBRD9XnZAtatbhzBJPbJl541/7LYk5CiAS
 aoINQoH809x1XJPBFfvA6nNgR1pS5fRlOhDiPKHytPUmugUhCiUsmgG1THdTZKYUUsGr
 9OO/C6eyWO7XGtMMQ1+fPew+1cXWmxJGc1Tmv/FW5Fv3xBSfjLFqXFUlg9o7jU3fXwga
 1Np0p7FpcZksMYSp63nd+J42zmPp6XzKQ5rtJUfdIp0MScgFjfS7ruzZVb1NyoPYxktj
 bVcA==
X-Gm-Message-State: AOJu0YwV6lHmh0c9fEj61jIVL+3AzBDfFicuvvAPc4HgvDpPQi9kYSqY
 byLGWrPCKW7y6S/Oc6sEYlpchkAL6eCPZXHDxLTyAsDCB6x8lPcOruEIoA==
X-Gm-Gg: ASbGncuzNRPS6Yv3tS6THV/TwOUjqC2v3iMi+21+OB1JsqvPqT6dcRuBKJr7ivIRGDg
 ySgpU9BpBsaZQaJplRs6TwP7XCilhzA+I3AZ944REfNMk7XD5e0MBoyzZG53Xqr+2stZxCcdeai
 u9wQkt7IuRhVsaz1XGyLQ/BiXslRHtF6aHc7NyYTo9k982GRdRDqifkc0Ui2OI+cSarAutfvKr8
 FpAt+FUe1NIaCejfCQPCtEcttmRtvMk67g87tcz405yAheL1vMhY/02ajuY
X-Google-Smtp-Source: AGHT+IF8rlhSxu8jc1eQsUBkg2oLGNGvvi5HrVOpdHZj5Uj8PVzc+/sxp3KRzpcqiHgYEu8NEo3UWQ==
X-Received: by 2002:a05:6402:35d5:b0:5d0:e877:7664 with SMTP id
 4fb4d7f45d1cf-5d81ddada54mr28409715a12.19.1735445660682; 
 Sat, 28 Dec 2024 20:14:20 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806fed2a1sm13378282a12.67.2024.12.28.20.14.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 20:14:20 -0800 (PST)
Message-ID: <6770cc9c.500a0220.16524a.6fa2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 29 Dec 2024 04:14:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735445661; x=1736050461; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=sEDny/pGbPK3YJwHWYdYnIu6uVTx1JwcXxdqWIoqpEs=;
 b=NLz+gs1S2tplH7iN+Ix4YVHBLK6KZDv9pyvRE1HQTTb2AbIMHzxjko7ZzNazl1m49k
 poHFIlRp8+EzLReFuYOrrAXAVdZXA8uk+uqNmWq7o0aC8HiUirtyBzw8+GqmrE8fmXVT
 5GzaER1YyooKJl5WL8dKAKNpeBa/W3NK+eTLQ9PFL1NYmAmGaXHFwgzHqAgoSu5pIfYy
 Ab/TG1f+1BpSDFWauUKs78vgY4zoc6pUkV8IFpqofDNQ+RfKBc9QKNPP61RaLlsootwF
 pXvvScwX50HnUbv9ZAvz1pZ0aRT75FJ1lYyJYzBLEeGUHdEIPb5UxFF4Lb0QwSBeea3L
 7A/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NLz+gs1S
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-28
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

Autobuild statistics for 2024-12-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  6  |  0  |  7  |
  2024.11.x  |  1  |  8  |  0  |  9  |
    master   | 18  | 143 |  3  | 164 |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.12.5 | 9 
             util-linux-2.40.2 | 6 
                   foot-1.16.2 | 5 
           libzenoh-pico-1.0.4 | 5 
               procps-ng-4.0.4 | 5 
             batman-adv-2024.2 | 4 
                  ffmpeg-6.1.2 | 4 
  gobject-introspection-1.76.1 | 4 
         host-libxcrypt-4.4.36 | 4 
                  bcusdk-0.0.5 | 3 
            gdk-pixbuf-2.42.12 | 3 
         gobject-introspection | 3 
            host-binutils-2.42 | 3 
host-binutils-bare-metal-2.... | 3 
   host-mender-artifact-3.11.2 | 3 
          linux-5.10.162-cip24 | 3 
                    bat-0.24.0 | 2 
                   bird-2.15.1 | 2 
                    brltty-6.6 | 2 
                 c-ares-1.34.2 | 2 
             containerd-1.7.23 | 2 
                   duma-2.5.21 | 2 
                elfutils-0.189 | 2 
                    emlog-0.70 | 2 
                 libv4l-1.28.1 | 2 
               linknx-0.0.1.38 | 2 
            linux-fusion-9.0.3 | 2 
                    mpir-3.0.0 | 2 
                  ntp-4.2.8p18 | 2 
                   perl-5.40.0 | 2 
               postgresql-17.2 | 2 
               pulseaudio-17.0 | 2 
                 rtptools-1.22 | 2 
              sdl2_mixer-2.6.3 | 2 
                  snmppp-3.5.1 | 2 
                acpitool-0.5.1 | 1 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.3.1 | 1 
               bctoolbox-4.4.8 | 1 
  binutils-arc-2023.09-release | 1 
                  boinc-7.20.2 | 1 
                   bullet-3.25 | 1 
                cairomm-1.16.2 | 1 
                 coreutils-9.5 | 1 
             dahdi-linux-3.3.0 | 1 
                    dust-0.9.0 | 1 
        gmrender-resurrect-0.1 | 1 
                gnu-efi-3.0.18 | 1 
               graphene-1.10.8 | 1 
                   grpc-1.51.1 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
                   i2pd-2.50.2 | 1 
                libdrm-2.4.124 | 1 
                  libsvg-0.1.4 | 1 
                  liburing-2.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
              luabitop-1.0.2-1 | 1 
                   mimic-1.1.0 | 1 
            netstat-nat-1.4.10 | 1 
           oath-toolkit-2.6.12 | 1 
                 opensc-0.26.0 | 1 
                 openssh-9.9p1 | 1 
             parsec-tool-0.7.0 | 1 
                 pixman-0.42.2 | 1 
         python-remi-2022.7.27 | 1 
                    qprint-1.1 | 1 
                ramspeed-2.6.0 | 1 
       riemann-c-client-1.10.5 | 1 
                   sdl2-2.30.9 | 1 
                   swipl-9.2.8 | 1 
               unixodbc-2.3.12 | 1 
                       unknown | 1 
                 watchdog-5.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/2153e4ab7e2b876789bcae4bf89df88684a618fc | ORPH
 microblaze  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/1245702fba3d5a259b980ed066d98a25fbcb548a |     
    m68k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/19dd959b370cda4b947517d0428cab12f31787cf | ORPH
 powerpc64   |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/6b9e9b2a50de9a836bc6e49fe83547625ec5b439 |     
powerpc64le  |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/52fd2749de0c716fc29afc22bf51758697558b0c |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/ed37413d363f6aa032c4da58433a3a7cb3d482e2 |     
 microblaze  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/3afc4e12a9d6500d98ac63328ab1189f8a0e994b |     
   xtensa    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/498fb4d96712825c92697fbb292b648e7704385e |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/951a469fe9dcafe11e705eb7f9957704c0bbe9e0 |     
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2ba5b97f3e6f4eff313f908862d1e223dae9f5d1 | ORPH
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5252122b19dc48ea566eefcdfbecbb0c0e4940b7 |     
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/dee34ea3ffc502cea5a2a35e02783fd509d092fb |     
   sh4aeb    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/826aee93f5ba39239f8c3f4357d542c2def3c541 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/615abb42018b12d75e44ba8264ada0a13c8aedb0 |     
  sparc64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1f8480efbb48ef0de02e6cfd9c6372b617b74f3f |     
    or1k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5ef185943451792f53aa9e98ff0941fe31cf06fe |     
   s390x     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/a8462b114ccb25750dbad9dee8548d0f1a164b17 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/4f9e57b0a5d21648530b1d0e94abc3ad2a0787a2 |     
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/cd0ef3beef61a680926df06528b4da7e72722c5c |     
    or1k     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/7a714d83a625dde1eeca7584b7de44fd8239d1e1 |     
  aarch64    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/e66da52ed6db02bb833532252243369189a8a000 | ORPH
  powerpc    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/8ba9d32f41cc05c9d4467434b101db7d4cc64eef | ORPH
microblazeel |         cairomm-1.16.2         | NOK | https://autobuild.buildroot.org/results/09a90553cc48eaa566b17f71ddd369e0c90c8f0d |     
powerpc64le  |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/6c1571552f3caa8b3afb9ce9f3cd5dfef6f6d7b2 |     
   s390x     |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/3310fd5bc763cbe62d9f2ecd82f4a2f0cad4a8f6 |     
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/73897b58ee37b43f350b4a604026a49acebccfc7 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9c4cbef82bd6a139f0d2048b5cd4239fb81dd722 | ORPH
powerpc64le  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/834a45d50fbb7ac6fcb61321a17cf7379fa092ed | ORPH
  aarch64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/eb12d614abb7d1a3862023d6cfa08fa814175836 | ORPH
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/717bdeab434e54dfbcde637274de299cd9bbc97b | ORPH
    arc      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/784940dbcff1b73aa910beee0f07f12a4c5fb6f7 | ORPH
    mips     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/2a31e26836f8cde3f1562eee6972d61fd23595c4 | ORPH
   sparc     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/7dcda1048b06c8cb65a48a5dab064aa22bfb4567 |     
 aarch64_be  |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/285c0a33036d391664a7a7faa6efe20810400476 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/cde819877e1460fd95981da666559546ccb204d8 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/57ac8d8159b4763390fec8d1c37fd26088d5029d |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ca01ad6618b716afe482e220ebc8d26f55c9a829 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9d2a81419c4c3cd1d60e9b2489bb88b89fe146c8 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/976f68a97aa34de735ec414cc6aa050170ccfb42 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/73070a9a84aa5aff3132eaae308987062dee08c5 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/adcc30385af1de7777ca2314179790f9d8a19739 |     
   mipsel    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/722c71bde01d75622d429cba6751f1ec86565040 |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b6a53592494fc1d9365bc0f318329a33eb3054c2 |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1ac5533a829d1bfb52dda38aee9a88412b16e260 | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/2b9e42b6fb767dafc2103553d57731f71a18d415 | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ca39156d63278d5c9e76f72ab2911dace6134ac3 | ORPH
   mips64    |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/a60a91120c766981a2bb55a93b7f30f65049435d |     
   x86_64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/b24610a804cf4d7dfe61b3859712fba7959f4fb8 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8c6c76213a9bbd15481e50ed9d89c6fa332bbf98 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8f193e6d2666b4c4f9509c087862b90fc842fab6 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f638d84cbed4c96d5e8c844f163fd2b834ae91d7 |     
    sh4      |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5082064b1c84fee7b483eeb2c87e55c0c9b753d9 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3af26c5449b3affdb3cd1c678180834248956f1a | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/fbf8300cd3bfcb416cd298327a9e3e81d2201eff | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/419608d1cc935b619f334b410184a8de0336b952 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/286a9782e0e50ba0257c03f2050b8904c0abce07 |     
   mipsel    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/b0a25445e93c1303dcfa2b9ffc56bc0fc1049c9b |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b5a3774209a5f8d6f351b9e5d2a208c345679542 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3206235a26b28f97fe44d5b506893cb595da6af0 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2329d76976672aeb393530c81d8e86422bae4262 |     
   arceb     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/8d2cfc0fc344d51fdc76b275e12c3e35883f7ea9 |     
 microblaze  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/5ff79f4cd996bb5b907d5a67afcfba8e4aea081b |     
 aarch64_be  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/663841b1bc6d73bb71b4be50ef516b66676784cd |     
  powerpc    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/2055c7345707e31accf0707a09a9e0a36a99f7a5 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/27f0778d2c24ad7976ff80e21a9234de3e9cefef |     
   mips64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/2015660b43cc0e956ac02544e093320a00a9532b |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/3255a2cc7ce106da5254f1fdfc52fdab1a67c662 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/f3135eaef4c25acb5a6ad6c7ee87fe81d5cc2546 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/6a6d10f325878851ed328c4a1418ca8889cbf6c3 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/c2420c311eb2130f53652c8755c1a945cc0596b7 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/1c432f1d5362d0467e4570b66e9751250c9e6a25 |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/953a4e32dacbe4b2780f3f5ba849b656f10c42d8 | ORPH
microblazeel | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/d2784d888bf01a4459728c63b063aa4f5473131b |     
   s390x     |          i2pd-2.50.2           | NOK | https://autobuild.buildroot.org/results/70da25b50059ffe12ee568b074a721314282bb38 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/778b536b6bcdbc872551070a2ba1e95ffd59f8ba |     
   s390x     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/91ed43ca8fbf86d87fdb7662b935a7f1770f9f11 |     
    sh4      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/e1c829bb18fc17582edb46df5e5100c9192a3b9f |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/fceaadad1981eea8578cfeb46d2e6b233c63c0f9 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/4ffb622f5ee2ae01248694c3738b466752221c33 |     
   sh4eb     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/5fdb189de10113c00a0c243a6873f1a1200d8cca |     
   mips64    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/296aadd87c6476146b28eb241a861e7a4ea825b7 |     
 powerpc64   |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/0e3e4a45734ddb9a48fc03896cf6d831dab065b8 |     
   s390x     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/01e2e3a695d97df57836ba4f7615267b88200582 |     
  sparc64    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/579468bc8fc8a22b553fd1132f1c99d052a13feb |     
   arceb     |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/7834f23e5e51252156a82e676c3cb7ec3d6cee76 | ORPH
  sparc64    |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/911fe77f1aaeed786a9ae72caad4204a070e6489 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e0c4346d9284d8b6e31df1efd7594d849dd4e62a | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b0cacfb7457ae6ee75b949d1db94f2f1703fcf46 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/49ead383a7a9b276529913f1674367870794ac46 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/397ccb0681d4da2460beb945b0ed33c0af63df2c | ORPH
   mips64    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/529051f01d84ec77d7ff72be6b8023e9aeb5c3ec | ORPH
  powerpc    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/ca2c066e8d209f4c9e8c764ff22e0c4baf2770dd | ORPH
    arc      |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/fc90211d670dd2fa6bbda0582b136309d96ca295 | ORPH
   mipsel    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/0cc48919e37b8b7412b0e49431c9c966a2c5f3cc | ORPH
  mips64el   |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/bfa085bed34e199378112f0ca51381864cb9e734 | ORPH
  powerpc    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/f2d660343ce0b06e445392636e0aee3572cf7f5b | ORPH
 powerpc64   |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/4d57515490cd9b8c98de82ced6d364ee5060e395 | ORPH
   nios2     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/a1b96cc0863e02f368f9db73ae97f2fd4dfb9570 | ORPH
   nios2     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/50469faec1a103e2e094d8b2ad9152d0f358c3e8 | ORPH
microblazeel |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/64fc110d7de8dd897e99e86f40dbdaf74c0d3a94 | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/2ea6be0660a5931430d1c470021eb08ef03526d9 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1f1596609f5de6adf7e4670ac1db4ff936b1f28c | ORPH
    mips     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/ee8ec843d43eebd0465b34d201700c735be7ea7b |     
   mips64    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/1ef15889b524c10acc0e26d2732876a23db037d5 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/456a212ef955ea36b59791cb04f98c69a8695df0 |     
  aarch64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d94848a038263d52386b37beae9be4b736ce23de |     
   armeb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/ebaba42202f6d409ca6e5d3a226709e786578fd3 | ORPH
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f475a050ab0cf757fe0bc4291441c46a8cd4745c |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8513371605e6bda0ba78ed9e0bc6332c81843e71 |     
   nios2     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/51b5efe209fbf27cff27279361aab90046dfc3ba |     
   mipsel    |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/101790c5fd77733f1bda4cc80ecd4354a2678ec0 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/f6f6152e9ba1e7e795d1c14bb1f58105e3b4368c | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/27c79040b8aa5faebee1931edde1a14ef93df3cc |     
   mips64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/b16c3853939d9a4f216f06c76516c1873f2ccb65 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/aa3dd3f9aaefc840e54ba9100caa9f27a0f6cbe3 |     
   s390x     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e357b975985be2ec728fb51dc2bac3b3bee329f9 | ORPH
    m68k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/17b9767aa476f0933932c6e58eba59e6a6d1dd29 |     
   mips64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/e1f4eb9df9dfc5d05b4b47d23883e311d822b5c9 |     
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7dea5f628f26b6a6af31fecd53e396c3b8fce0e8 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/afc035e866bec6f2c14f9d52fa74a9c1897706de | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/68a06e45a66e99fa5b3be7b1a3d371951b8ed060 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c63e3a636675b9d9debe9ea5029bed666c95f5e5 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2afb7b525841493d1f819cae20b05d34bde08feb | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/8aaeee65847f10e255438c384ff1a5a37ed40347 | ORPH
   arceb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7360c5d73f24f7e47f016618e0c00551cacc08f4 | ORPH
   mipsel    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/cd28cfd8d2b6494b6cdb68fd96d15cf0e41b18cd |     
    or1k     |           qprint-1.1           | NOK | https://autobuild.buildroot.org/results/621e0c8a168308f43c8a446a7f1b28c0ad3ecc46 |     
   xtensa    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/db7f619b43fbf85f2aef02c7be0a83063d166cc9 | ORPH
 powerpc64   |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/b33dea582cca8aad33846d1acafc78c75583be7a | ORPH
 aarch64_be  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/8b9ed28bf7c51c9bc6c742bebc44d53da2462936 | ORPH
    or1k     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/8c2ca9d08c123fd3626b3f6169a71091d4a3e94f | ORPH
   s390x     |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/dfc3156c08a304d6a180dce6960c93537d237529 |     
   armeb     |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/cd5e182b3ccdc63cf9dfdd59c3ac77551ca1c811 | ORPH
    arc      |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/241ecb7319f60db4a06656443553f4e397dacb0d | ORPH
powerpc64le  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/fd7f8f8609fc9a48e7aa72851a2602b654f22638 |     
powerpc64le  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/1c3a2ed71622976770d243d39ddb1fb7f8488866 |     
    i686     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/a4d9021eae8194848f8fb6f360341ebe2b2136e0 |     
 aarch64_be  |        unixodbc-2.3.12         | NOK | https://autobuild.buildroot.org/results/b338dd3bacf6cecbdc178e0b92077cf86ba440aa |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/52b61f65b8eb7bb998c5129e4a9841fa6724d385 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d870b33687d8ba7eaf732d117ce07f0fdac27be1 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ee007f7ea6c5dce4e21758897e42723e29fbdf52 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bc861ee9d0d2d2cd6460c0c121c1bec4d5cef758 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e5c35c8d499903c6f257d3b26f9619680a6720a1 | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ec2b971c416e3b1964be76aff44c79623c0338f1 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e57126e9ec71ab22208bc406f7674e8edda87edb | ORPH
  mips64el   |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/5327abf67b63b65bd2995cf52c378165108b9997 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  boinc-7.20.2 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
  gobject-introspection-1.76.1 | 1 
               libunwind-1.6.2 | 1 
               mariadb-10.11.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/79255953aa456c45e8345b6861a3c1aa618ea88b |     
  mips64el   |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/41bd077b1a7f0f41f564363c85a54546a13aad33 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f64ae441a8b7ecba1709cc2bfac08d896b7568a8 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c43c477564f11865f182819d083a57467ffb9d85 | ORPH
   mipsel    |        libunwind-1.6.2         | NOK | https://autobuild.buildroot.org/results/b26049671897316d288f43cd2083f119abb4cace | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/87798f45c72be95be088e9577849dd1af90b3c9f | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

      python-autocommand-2.2.2 | 2 
                 dhcp-4.4.3-P1 | 1 
            host-binutils-2.42 | 1 
          host-binutils-2.43.1 | 1 
               procps-ng-4.0.4 | 1 
               pulseaudio-17.0 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/59fcff4ba69e1652d0e8dcfb6a5dcfc69c4f3d5d | ORPH
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4fd0a3641138a209c02bc8553e5c086e2460eee0 |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/239fc966f027220f553ece500177261a2941345a |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/60cabec7e9288716c14749051561b651d3b3d89c | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/52b9c685dbf18eef60e03d1c2d7c872515767edc | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/c7db6c60180d5db232f7bccade0c133d21b5a107 |     
   x86_64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/82b05a3f44bbf574bc31614ba25d4132459295a7 |     
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5306be0b0b6727745147e2238c2d10b266e68158 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

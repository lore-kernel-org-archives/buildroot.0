Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6E7CCFA10
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 03:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 109AD607B4;
	Thu, 26 Sep 2024 03:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hf2G_BwPvrne; Thu, 26 Sep 2024 03:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B066611F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B066611F4;
	Thu, 26 Sep 2024 03:18:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78F771BF37F
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 03:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67B10611F4
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 03:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORpBbd_IAI_x for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 03:18:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AC3A607B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC3A607B4
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AC3A607B4
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 03:18:01 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c8784e3bc8so459561a12.1
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 20:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727320680; x=1727925480;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=owCwjXtP9v/Xmbsz8r0JHDOgamQEnCYx6LZY6cJg95M=;
 b=c835s2xFQutVek3Z6uguoCiyOo+Z5BdIwpVQxwEry66/+aGNQ5j1nA9SHek40st7Zo
 ea+WD0NOP5CV7kv0NrJBbH+JZmb1YYjkn2CHZv+p/uZGBdavw23PPd+qMjh3CT1vUgDA
 IJBzPtSPShu20IuD1rPOZEcrQr9ETUNoNnxHnSwtAcZkdD9Rtyq4ZWqH5SYnSpMhGqJm
 OD1nCQpS7BXuzVnSEbRXauKCFUKuonw3Rr3jum4HsVEtBb2wjhn30LTos/PcY3WTd5Lf
 LIsZC9Wselw1kHW1zLlX2YKvyEuCceu6ePzZWdzkZvGAMIVFx6eo8BOlkvJi9yS6JxT9
 aSfA==
X-Gm-Message-State: AOJu0YwI8YQ8ZLq8eOL/z2IKh0tLcQ9usBnToaNidb5jVrW+kPOKANcH
 n3nJwu/gB60mQIqnlOWyUJanC8M7VOiOzcUGazXocfx5iaImY1rlZ+oQj9jv
X-Google-Smtp-Source: AGHT+IE3iysHNlDYXf3n9Kr2ZANhYkE/bvF1we1lYUDYpdKJKZs3Pmscwk8wLoxx4lBYh13/8cfyyA==
X-Received: by 2002:a17:906:c108:b0:a86:97c0:9bb3 with SMTP id
 a640c23a62f3a-a93a060ccd4mr437169866b.51.1727320679407; 
 Wed, 25 Sep 2024 20:17:59 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f65c4dsm296540166b.92.2024.09.25.20.17.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 20:17:59 -0700 (PDT)
Message-ID: <66f4d267.170a0220.ddc52.b067@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 26 Sep 2024 03:17:59 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727320680; x=1727925480; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=owCwjXtP9v/Xmbsz8r0JHDOgamQEnCYx6LZY6cJg95M=;
 b=cru3vK8xr9KbsfVI3Qex9UNJQ2fqmyCdMCIGZn/i74NUKnyx2jbDDGkJjU2j49kxut
 rj0tVKcDGOU25m4o5N5He2g++NfWATJUw5EEI3NpIkCPAoS6doUWXc0Sr+SbWZGUY59P
 iu05JxGntwiOYNoDJ9LIAX+UQ/KNz2rj7ux+xQ4mkzULLXAbL0DqjyMbv5nLdXv5UB6d
 I8JaMx+jP1q8s8B8TRFLNtXpO89wFyH9+WeE3kWmwUrUtXDkgLstRxudR5t29ddd9Aun
 1lPjM2izXvjsAiMcwFnhjLPEGN8JJ6ffpHu6DzI2XgZ3d0cpiDiGttVLuNT65s0MBw6w
 Xfug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cru3vK8x
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-25
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-09-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  1  |  0  |  5  |
  2024.05.x  | 16  | 28  |  0  | 44  |
  2024.08.x  |  4  |  4  |  0  |  8  |
    master   | 13  | 100 |  0  | 113 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 13
               procps-ng-4.0.4 | 9 
           host-librsvg-2.50.9 | 6 
                  linux-6.10.9 | 6 
             bluez5_utils-5.77 | 5 
            host-binutils-2.42 | 5 
                  bind-9.18.28 | 4 
            host-ccache-4.10.2 | 4 
                       unknown | 3 
aubio-152d6819b360c2e7b379e... | 2 
                  evilwm-1.4.3 | 2 
                 gnuplot-6.0.1 | 2 
 host-binutils-bare-metal-2.42 | 2 
               libglib2-2.76.1 | 2 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    brltty-6.6 | 1 
             dahdi-linux-3.3.0 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.40-18-g564178076272... | 1 
           host-doxygen-1.8.18 | 1 
         host-libxcrypt-4.4.36 | 1 
    host-python-greenlet-3.1.1 | 1 
     host-python-maturin-1.7.1 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                libcurl-8.10.1 | 1 
                libdrm-2.4.123 | 1 
libilbc-829b08c7902ceb87a26... | 1 
              libopenssl-3.3.2 | 1 
              libsodium-1.0.18 | 1 
              libudfread-1.1.2 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                     lua-5.4.7 | 1 
              luabitop-1.0.2-1 | 1 
                   mimic-1.1.0 | 1 
                  ntp-4.2.8p18 | 1 
                   pcre2-10.43 | 1 
                 pixman-0.42.2 | 1 
      python-autocommand-2.2.2 | 1 
                ramspeed-2.6.0 | 1 
                     shim-15.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/16d01931555273d671f2dc642f3fce86520ccc13 |     
   mipsel    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/0e3f96444029f65d106d1b8411fc95e5963bba84 | ORPH
   arceb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4ade90263e9680d5a2987369a7dfa06106c0ce7e |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/4746cad1a65019b657c9da374a13bf2ab830434f |     
   sh4aeb    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/bad18d5fdc379fb478292c25bcd4e6ba1f0775f1 |     
  powerpc    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/3448ce1bd4243b9d2d2d3e3745e68d0fd7a26bfa | ORPH
   arceb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/9701f91a01b6337c2061e0754912e946285bbcf9 | ORPH
    m68k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/fd9d3fcfc4cc6d3762c7b879f58146822aa54710 | ORPH
   mipsel    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/e2634432616f4eeb8ec944f5bec668844a7c4706 | ORPH
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/f671d409599446c4dc708b7b2dbe66b5041a2a8d |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/55133d30898f0a3508a79b21ce6bff3f647267bc |     
   mipsel    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/3b077bb961c8fe70085fb34cdcc0217e287c9f4a |     
   arceb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/12326e8b433da51a3896009671508db665b9c559 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/369894822baa01f2b7a805a0d739d8daf006d385 |     
    arc      |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/472a198fda21f3ce2e5dc5b203839de6c77b92ec |     
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a002557e395ffbcc4f29da467436b97a000a877e |     
   sh4eb     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/9300c717e907f6179a1224a5559afb96310526a3 |     
   sparc     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/ef9f70ddfa4f99926e8169ae48ebbd6792d80719 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/bdd14b9eea6d216c0a204ed5594e4a6fd3e1638f |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/f3ffae04af648287617242285cc4115a0c29ce86 | ORPH
    i686     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/76ced08ce3ed8edf7cf50cf87590dd126cbcebd1 | ORPH
   mips64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/6b7ee2a948807dabd4e353fb79a1479bca0ed8d2 | ORPH
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/d208e595e02be87be76aa14c41a92b3084f092e7 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/bedcfe93b60f792ab7d45786baa9eb89774c1788 |     
  mips64el   |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/868ca441daa2485b997f307edeede31dd229bfc2 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5b7a45aefec8f832aff0812b6d4ba1cf03e215e4 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/06f9163ba34895ec9796b3a767bdcf2ddf53450f |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/568b0a903fb343d6a46c8370ebe241d19810a495 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/da0759b19236a069b1f1b73d6e872b4ca7bb8d10 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4392228372a8bafa6f9adacbf39d9b212734c457 |     
 aarch64_be  | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/183e7f8f6b0d8b564f60031fc7c20a16e71ff9ed |     
microblazeel | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/6918de324d96e9c3d4c4fc2991809bc405bf6d99 |     
    or1k     |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/8a106a301b149cd351f300f783a7459b0a999cb5 | ORPH
   xtensa    |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/8eb0716ba21f5cac70fa8f475709184180b2e21e | ORPH
    m68k     |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/034612afe0efc80214ed14205efa9c02f5201af9 | ORPH
 microblaze  |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/1ecea03a4c52efe17bbdf69670b33ed15348a980 | ORPH
 aarch64_be  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/37099b22186d09975aa74c3424838281dd400d6e | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1f0abf7f7ad4f1aeef2041e1e37a65a1b5fc4ef6 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f690b2b331a55effa278a13ecce7d655ad7d6d99 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f1f3ba3bd7c45b7aa079e95ddd7db23a8e62273c | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/afd99e2c0c98ee42537d5b135826192fbfb9aada | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/839c2bea1167fad5e66f91f7f584fd3d2c31ab46 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/35c3d2044777783ae75c6b097b5f374c45686255 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7d12a0b6d9204fc9a446dc05723254a0c9a4e81c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f57bb782098e3815db329f7d1b1d82d391582209 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b0a29fae9c1d315465466c664a4d1a3a3e151310 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/008108ba65374ce813c13438bdde96bf3e6ba2e3 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7dfe72194f9c02c3d201eb8ba42c67edfb3a4808 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6f79bffde6ad7e1b2b6fb3f050398d4aa9923822 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1c15736e5327064109b9c461f44a1f967db394f0 | ORPH
    arc      |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/2fe56acaf4cb9152ea585c325fa18748139a193a |     
  mips64el   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/a2e301638c434344465185e31f750d547e8b4059 |     
 aarch64_be  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/64f4da53a6737f06ff6d6c3db68b45e6e9c74875 |     
   s390x     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/d06d01d6e5e265853b0df7df40992592d23e6acd |     
  powerpc    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/2e5da30b3611be835121feebdd31fd32e7552f47 |     
   mips64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/736b9312bf044425d9b6a34bde7389148042e360 |     
   sh4eb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/f2c8ba92b4aa0d69c62f951a809ccfc469afeb8f |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/d4a57d7083f6ccfcdc9a228effbe858ede9aeef1 |     
    i686     |   host-python-maturin-1.7.1    | NOK | https://autobuild.buildroot.org/results/a6a32a472c17ea27ab6b2c3fbc1bb93a204734ab |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/d6a316b04142ca47c6254d868e94d947dace2b1e |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/4607b08af9f24e2e97cb1b389b96cdf522a49d18 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/afd086c45631582a784ca4b3783b3f987e6ed305 |     
  powerpc    |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/8b7c80e3ea065a2b7f9f940f250342ba4b50c348 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/523e00269670f72e3d85bc2999eda7cddae7099f |     
  riscv32    | libilbc-829b08c7902ceb87a26... | NOK | https://autobuild.buildroot.org/results/8c8b073ce163131763fca978b400e596fcf39e62 |     
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/f7e6f2ef06c36d5117c63106602d6c63d70a785e | ORPH
   arceb     |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/fa369e21cdf5e7b4fe044610de23145141bbced4 |     
    arm      |        libudfread-1.1.2        | NOK | https://autobuild.buildroot.org/results/4828120cb8e256eb189c5e197bda4992549ac2ad |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/b5f63f309c5ee9945bce1407f09685de58ce6508 |     
    arc      |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/a17bac4b4cfb8a7c73669a3ca7797c3b4b4e65d2 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4c9ab62cfa79f69a74235b29323616868040e8e0 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/07ec861d06be0f9b90b5b6c4ca612ce249431181 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/fbe5cdd3d14678af280889bf1331bcfaf1779929 | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/ddcbb4a80afc14d71ef8cc5c469aad572e7fa8d1 | ORPH
   mipsel    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/d02f8f3d61b0a7155c2e6259d1e95fbd1eb8528b | ORPH
   arceb     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/86a93f3fda295f4c14abf8735019212c383242f4 | ORPH
   mipsel    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/ae4e5c4c449dbbe692c5b904ff0fd2cf4a5f6839 | ORPH
    mips     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/8eec98fe95ef4c2d412688afbe580a5a26572bc6 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c2266e09fc1e4bae47961eb9b6d0b2d2b4a868d1 | ORPH
   nios2     |           lua-5.4.7            | NOK | https://autobuild.buildroot.org/results/930b5c84a6d75df4fddfc9ffc5d85b09bdaf6275 |     
   armeb     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/28f305ba1e5cb66700efee43580e8ff26334459f |     
  aarch64    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/937e6afb8c52b7fb4a3d0076ae7f872216af595f |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/10b4e64c99b42bc1e7cfaca750c4ed27b77bcd46 |     
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/e8a9178bff8c537436424de6f548127f34cd1151 | ORPH
    arm      |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/cd93c95fe86cab1aa2be369905def94ba599c459 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5c13fc2911306c5bb5ae6741fe6118ad094d2907 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c737aa9dd068c3e6b74a4015cc9287e98ec51728 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/878d2b8822878307e67a27c1f9c63bc3b3bc3eea | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e16a263ae8cbaebea5d7db03ebcd564c79540684 | ORPH
   sh4aeb    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d83b25851295ce7199a0763486ce637ea88fd7c5 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/773e1fd78aeaf0f7f83f051ff64684f810b0919e | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c8f3ed2193b11f8fad468b3d42497c0bdabd1a85 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1afa90abd7a237181686707722213872905542f7 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f9e7e1e4d5d68fc37c84fa4f843090df7f9798bc | ORPH
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/46ce2d8e71e539b507d1b4f6a7a1b65bf30c10dd |     
  powerpc    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/f5406dd70b4e2bc57d7953b604731c8e06fe1142 | ORPH
   x86_64    |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/7a256303aec27249711430d726ccf492eba02da0 |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/ccb0ecdbffb59c4b4da06a0beb3dcac48d874581 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ba596dc80462ec3d2fe55482a3f728cb328c2f6b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/67fa216ecdb488e8ddddcf61ec8a8fe47d2efa6e |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-prelink-cross-a853a5d7... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/b12a9765cd9981932ca697cedfef28e2e3be03f7 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

               procps-ng-4.0.4 | 4 
                       unknown | 3 
                  ffmpeg-6.1.2 | 2 
                   foot-1.16.2 | 2 
glibc-2.39-74-g198632a05f6c... | 2 
               libglib2-2.76.1 | 2 
                     file-5.45 | 1 
  gobject-introspection-1.76.1 | 1 
                 hddtemp-0.4.3 | 1 
             host-delve-1.22.1 | 1 
              host-rust-1.74.1 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
          libcamera-apps-1.2.1 | 1 
                  libffi-3.4.6 | 1 
               libunwind-1.8.1 | 1 
                  linux-6.8.12 | 1 
               mariadb-10.11.6 | 1 
                mongodb-4.2.18 | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/df239764bcc885143abb1ef24e8efd085dd39f14 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/26128f17ad512243b96f23de8b298f6fd7870dbd |     
    i686     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/4eeb034847caf1963917b1d2eab9e0d24b658705 | ORPH
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/facbf3c405746468cdd7505ad4f7d64d9786fde7 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/50b4dca3a932e61e8f7e51a6eaf4de55ead304b4 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/bb77b84f0ff9a2f01919ffebe220eef49bfde3a0 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/1e3479681607dca149d7fee574b9b2b15bd77db7 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b239c9dc2334cb1503ecce60513f5ef095c27822 | ORPH
   mipsel    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/c10a19c28a551f3bc09918d0986be20724767349 |     
  aarch64    |       host-delve-1.22.1        | NOK | https://autobuild.buildroot.org/results/a81ab0cad920cd53bbe7866101d65de0922198c0 |     
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/85337d7aa9e756806db6b685d00ce639a59fe319 |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/462700a3bb48b79fa39315433a4410f3a972bdf9 | ORPH
  sparc64    |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/6f4a755e1ad15a9cabd2cd1976ec4bbe4953de07 |     
   arceb     |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/24c025bdcc976cda9a28db34665aaeb4c8070be5 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/a0c8c532c7b9f69ddbcf5602b1efc566cf8fab67 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/85a3d6d6529777594bd7afcc8bbfadf35eb62492 |     
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/9d990b3f75b291649c81709171f672118bf55200 | ORPH
   nios2     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/16e7f08c4b8f80da5791b89b191ae516f6dd2eab | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/d7ca46a865c975b9d57768a21eb79e531451325c | ORPH
    arm      |         mongodb-4.2.18         | NOK | https://autobuild.buildroot.org/results/64973b2891df3c8f7928e38a8a9e015b76ac9772 |     
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/5ac3f651a9fee8f68fdef560cdee340503d49436 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/35a32e26a2325b4cba4e887a93ad3d2e7fce46f6 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/47b1ef0df5e3490ae63b00d67e6ff50a6e01a100 | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f0cd1b46620edbec25cc3a8d4ccb94562f32298b | ORPH
   sh4eb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3eca51da9dda3016bd25fc3ab6905d675ddc1e0f | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8649ca5ba500f8ccc4454a58fa830569552b985e |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/4ec868cbb355a367a798a5cebcdbffd4c572fe43 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8f8b6396c18ec83b810646c70c8d2d3a105a64fe |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  bind-9.18.28 | 1 
                cryptopp-8.9.0 | 1 
            host-ccache-4.10.1 | 1 
                       zip-3.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/e9a820ce0aa0695435b69afae4a0328240f7016c | ORPH
powerpc64le  |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/03287d7cc6e42cf8deb82adb81ea93cd0b7be466 |     
   armeb     |       host-ccache-4.10.1       | NOK | https://autobuild.buildroot.org/results/796c4ce010efe0dbb75947c7d2277aacf774fbb1 | ORPH
    arc      |            zip-3.0             | NOK | https://autobuild.buildroot.org/results/778a6c739e848190b2052ea4c37cf849ea0b5304 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

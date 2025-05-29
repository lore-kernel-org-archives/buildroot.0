Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BE6C54FB3
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 03:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF2C7807C5;
	Thu, 29 May 2025 03:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 014UKL4as6Dy; Thu, 29 May 2025 03:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97B6581F2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97B6581F2F;
	Thu, 29 May 2025 03:15:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B554127
 for <buildroot@buildroot.org>; Thu, 29 May 2025 03:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C75981F37
 for <buildroot@buildroot.org>; Thu, 29 May 2025 03:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msZJdIl1c1RU for <buildroot@buildroot.org>;
 Thu, 29 May 2025 03:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1554881F2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1554881F2F
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1554881F2F
 for <buildroot@buildroot.org>; Thu, 29 May 2025 03:15:25 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a37d24e607so420692f8f.1
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748488524; x=1749093324;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qkmC1WzGGc5nmmZWu2FBqodcVM3J1rqFFq2gIJoUczY=;
 b=k7p/HF1GYkt1vmYsVDfAs+3zzZs1KoblB/+ErPgjFHhf+26t/lRbaKwHWJoobuFcLv
 hZHiaF5j/fgnGL3lAOdW6b+BdWR0PXqEBsgsyWqtln/zprOulUOLX7YVDdxgNwm4+qW3
 Lxhkrd3vaxBLwLon5bMxEjlMtSaCVBQA7a5wCMJwGlQIjP8HgU7jZ/LSH2miSFmaVaSd
 C5xLFGZYtB2R5Qv38yTcpAhhZ90Qjdc+HYSX2gy30dQWN9MnodVHCeVVw+isUfQcjylN
 psCsjANT+pXYctyLzYPKi4PmmGGz7VUXFMZMl3QImOdkP1Dk6tZjysX2oDknjhiaHYLQ
 ni1Q==
X-Gm-Message-State: AOJu0YwmzjnRf4pjB3v0E/4yHb8BDvD2UsbFQV6tYEAnBL7m2rjkTwce
 IenSBwYo2RmlSkoVOVCXPnhmifb2MK5kEyB+xjcOzxJOsnNKZo+6lQCxmO3CaQ==
X-Gm-Gg: ASbGncth1FYn3E9mb2wB1gb5Y1ACbKDwFJcPeqieKkDbfayOGdmRL7rb9vL8MWuEnNf
 DbTTDMHYJOk2uXsQlgsqwR/PEpDj4yZempUSHSCDawXLjE8m17BjG65VJymhmE13E7vUeB+JCkg
 cWi4bUnfWv8+dEK58RwJNRrfPU96TfPCtfQlf7RnlZIhqDS0KlMiVTsMs0whsd6s3YYJI0mjW7S
 aUWaeclzedeTG6CgikDbqE1FIVeXZd1BJ+PKbQReve3SGpQubsPQ+zftxYABpCndcNYYMLknPFn
 n/JJFVUh4S6F8FzzcVuM4QP8m/+wLdzacq9DugInMIaizZVvuNZVGBeIm59GXwXPuQ==
X-Google-Smtp-Source: AGHT+IGozFJqxG9p90Ltp3GMkYSbDNcyYTdNoq0sB6H2hukfjJEXrel4YPCKt4h7yyjyq0u+689Q8w==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:ef8e:b31b with SMTP id
 ffacd0b85a97d-3a4ef8eb479mr573284f8f.24.1748488523791; 
 Wed, 28 May 2025 20:15:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe74111sm613231f8f.56.2025.05.28.20.15.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 20:15:23 -0700 (PDT)
Message-ID: <6837d14b.5d0a0220.bc54.150a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 29 May 2025 03:15:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748488524; x=1749093324; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qkmC1WzGGc5nmmZWu2FBqodcVM3J1rqFFq2gIJoUczY=;
 b=BsSTBUbm+cDm48GZrGxq6pcm9+TUEol9E9sEtVHGPbjVmRuaj2dFLAK/MGW2zQjiT6
 cJGt1sner/NitoLJwlFiViOyeqXqrKw+CuQ93xbEOAoblmkKkLufa7pPtRULVhixtfFD
 3fp1Lt/4p7TlCp3C9ghXTVewTnExZia0vZIGTtUwboaJE/OmuQbktIDZMDhG8F/wwCoi
 HouEpgLWiw/GNPJt32lSlPJEPGmtdItc9aYViPTmMKqzauJDGGVAY7LixROwcLvbkiKL
 m1jaYPHc8vCENSPGibLrHAgQqNAzT0BRo+a3OSxr3oJSmV7xwz4634z+xvdtfcGJGUfk
 RL8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BsSTBUbm
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-28
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

Autobuild statistics for 2025-05-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  | 13  |  0  | 14  |
    master   |  8  | 30  |  0  | 38  |
     next    |  0  |  7  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.12 | 2 
  gobject-introspection-1.82.0 | 2 
          host-oniguruma-6.9.9 | 2 
              host-rust-1.86.0 | 2 
                  libjwt-3.2.0 | 2 
                       unknown | 2 
               bctoolbox-4.4.8 | 1 
                  bcusdk-0.0.5 | 1 
                    bmx7-7.1.1 | 1 
                    brltty-6.6 | 1 
                elfutils-0.192 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
            host-binutils-2.42 | 1 
                 host-gdb-15.2 | 1 
                  libite-2.6.1 | 1 
                 libspdm-3.5.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 mdevd-0.1.6.5 | 1 
                   perl-5.40.2 | 1 
                python3-3.13.3 | 1 
          sane-airscan-0.99.33 | 1 
                setserial-2.17 | 1 
       shadowsocks-libev-3.3.5 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3c3bd5f86bf7347353794e843fae8e4df077d553 | ORPH
 aarch64_be  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f285840827c7ccce6d6dcc216f423510273761dc |     
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/20cd8f46c43257b34df7f3577ebad10a6bb719f1 | ORPH
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/a6d9e2925e32fdfa4f71ccfeeab0eb53648d77ff |     
    mips     |          dash-0.5.12           | NOK | https://autobuild.buildroot.org/results/2477bc80b1bd7d97aac48505d825ba4d8474d1ad | ORPH
 aarch64_be  |          dash-0.5.12           | NOK | https://autobuild.buildroot.org/results/5ca7121f3d7e5b79a00477c1b0db5928c3843743 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ff7063e534bd7c5b940bb6f53844febb7dcf725b | ORPH
    arc      |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/678919a28b9bcea88f9d216b8f8c5fe1e6c5c7a5 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/132bc2033b02c6016b6ce86880472c625f16bcc6 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b8eeb569762ac4f7ee910f6da8008ed9904cd4a9 | ORPH
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a295b663d1b2beab2b0e0fb0d0e3e483c3cd841a |     
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4e8346aef4bcb6b1cf34d3132c5c55cc7fa630b6 | ORPH
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/21e63e7c232cfb2c6f26e27d7ecb0dfcd13052e5 |     
   xtensa    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/97ff4dea4a116b9d6f6b875023bbec4b48777fb7 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/825261ff8d6054ca7a22a0479be9074696c2d856 |     
  aarch64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/47d60bb3c9348e35f5dddb0b0aeaec9b2e8e473a |     
  riscv32    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/1ac4fa67034509587a32a00e6c7216eef6627242 |     
 aarch64_be  |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/c49d17e90b4401228f21aa30aaef8a9d9af965fb |     
   mips64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/f71ccc76a23145eff1dfbb499851dfb856d7ae1c |     
    i686     |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/9cf821d90242ad3cfe3935a789e84448053a5f1c |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c7ba3201ebec5acabab4b40f8d7fcd3cbd1b570e | ORPH
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/432d3a4c15f6e74425d0e54380cabb49de327b1e |     
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/33a3efbfb261e8a3eace8e75d14e2c81c45eccac |     
    sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/499c1da36e43416b38972b3f83a87ee6a0d3ad54 |     
powerpc64le  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/6e8a4846b9a99bb1010c4ea69499d3da007cf06f |     
    sh4a     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/9e57d514cc5164b0ae6b107219f84090f62ee54a | ORPH
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/6c9afdfc38466f324a1afa830f4d86ddfa2fb758 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/76314d71460cd3ae0735e00a44564f24595aad94 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/af1bf8b5437bdf341520b36bc4381908ec53391a |     
   armeb     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/ce0e984fe8fae2900dabf97390b18fb381f4f5f5 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            python-flask-3.1.1 | 2 
                 coreutils-9.5 | 1 
      docker-cli-buildx-0.16.1 | 1 
                elfutils-0.192 | 1 
                    flex-2.6.4 | 1 
          host-binutils-2.43.1 | 1 
host-binutils-arc-2023.09-r... | 1 
          host-dbus-glib-0.112 | 1 
               host-runc-1.2.4 | 1 
               host-yasm-1.3.0 | 1 
                pipewire-1.2.7 | 1 
                    sdl-1.2.15 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/5d60f039e1103bc47ff8c70c32e9aefeb0b5c656 | ORPH
powerpc64le  |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/d8ecdb2ca5677dcac918afa49242ccafc8ce6995 | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/297c699bb04fce85558905fb7107f45492f6d615 | ORPH
  riscv32    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/5accfab450aafbd0b07fbe384923d2bef59fc4f5 | ORPH
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/14b4a0cd9eed5762d00762c0194b189d2a84e636 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/849ea3709197bba05753ef1af8f9e42184d42209 |     
 aarch64_be  |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/27cadc7c8ed7b3274e14be6bf7bc52c6b986e39c | ORPH
  riscv32    |        host-runc-1.2.4         | NOK | https://autobuild.buildroot.org/results/299f4e6df1ad0270ef4debf165b4738ec623e1c9 |     
powerpc64le  |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/0475fc6d33f240e6092c5467b9217cbd1764e070 | ORPH
    or1k     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/ca84081ed540dde424985613d29ccf3280bb97ff |     
 microblaze  |       python-flask-3.1.1       | NOK | https://autobuild.buildroot.org/results/c53de0b07ca3088e187310973746cadaa190ee1e |     
 microblaze  |       python-flask-3.1.1       | NOK | https://autobuild.buildroot.org/results/e0040f4ed914440a7771ccd49982e316717a2d22 |     
  aarch64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/e03a807a691de2fd512b6576ea5cb667a33dbce6 | ORPH


Classification of failures by reason for next
---------------------------------------------

               bctoolbox-4.4.8 | 3 
          chocolate-doom-3.0.1 | 1 
             libargtable2-2.13 | 1 
                  ntp-4.2.8p18 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ec4b3bff2e52e058574020cf20b905994a88f63f | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0525d7b8e3b0f38d6a1c0f74ba5ddac3cf66aa6c | ORPH
    arc      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/daf6f17ce8810689248be324eb8817194ebce8e4 | ORPH
  sparc64    |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/a624a5fd326162537444e3f86c786f61071d5ffc |     
  riscv64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/a72985618d48a7fa6dda6cc2dd903c3282035f0a | ORPH
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ea82ade33f4184edd88854631db6b1f064ba0951 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/7132d1e10c6167c7d1977154c9771d5306257786 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

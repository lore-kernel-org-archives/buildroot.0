Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CC8C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 04:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E78682F11;
	Wed,  5 Feb 2025 04:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKgPEVmlavHa; Wed,  5 Feb 2025 04:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A0AD82F39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A0AD82F39;
	Wed,  5 Feb 2025 04:28:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB0C6185
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 04:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F09C40445
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 04:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrMmVGrAtqcR for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 04:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84258400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84258400F9
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84258400F9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 04:28:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so8601855a12.1
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 20:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738729683; x=1739334483;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=njvKkrsm5qzT+alcT2kybexfFSRKowGk7/adfsp8PSU=;
 b=Sdn89WLGvQWpfsKpZTLybMQAhUpv0DxzoOh8XakrvFtGFHnmG8weY3tBTSZudLQSQs
 PwEyicXQ4kEa50Z22+DSI3N3Z1eD1F7u5RRSICcsXnil/5gv1GMupSCHqu8mfpvwUV4x
 tPqkf37px4Xn/CB9NHyTZfLRRVJm00AHt+hVZeJ67ppjlQgYlwHDMoBJgZURTZ5ilQiu
 FZaF/1LsAMmwyI10OPL+sWZgvIIySFwkPsgmW8RmPobHJIDiqbJEgqgx3FcjJwXSKFuE
 rW5hAtsWKN+A3WHmDUDkJVPzER82odiiSLK9ZM0eW84ATJzJmgx6h7vTAx6vZB4HMP57
 nMlQ==
X-Gm-Message-State: AOJu0YxukeA/dDo7i2WTF1suyXJMvNKZKjxdB/IbzGoKjRYzS5A3Olv7
 Up2bHxSgGedcJoPUEP+r1Y1Ly8hbKiDCuFhiQnVmk55DTOCLIVpdGmd29w==
X-Gm-Gg: ASbGncvdUYgKUr+DiGvbNg/WWVqtiN3pdFG4iICpy2TUAXtQNr3JeemgU9QDvjzp3ZQ
 lGTWp4dEYqF+fc10ISi/+6PiYoPySzYWmuJiqdkBsT+cCrpmV4N46WgYffpWVg+//4u1sZFa0U3
 zm3W2mPjbWK5fYRCDFRvQ7KhVathrQHVZA1VcUhiabgPkbaGZcZrN+fAmNvbGNxRFabnhOokHnZ
 j0+DJBxeXzxMvsXG8lJZ7NiC9mYID31f2FJ+OTTuGsHt2JOzJFbaeaFb2OFNdoTtpzwTatn/Wvi
 UVoPcd8SeHpRJi7kowo=
X-Google-Smtp-Source: AGHT+IGgVThogcSUgpeDMWzqHknfFWkoQ5YXhb8AQqfxnzoBIEEoh09VYfvn9Uj8R8POiROmGtQ3Ng==
X-Received: by 2002:a05:6402:13c8:b0:5dc:8f03:bb5b with SMTP id
 4fb4d7f45d1cf-5dcdb6f9ea1mr3802137a12.5.1738729683245; 
 Tue, 04 Feb 2025 20:28:03 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6ff1bdbadsm845798466b.62.2025.02.04.20.28.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 20:28:02 -0800 (PST)
Message-ID: <67a2e8d2.170a0220.9e728.f0fb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 05 Feb 2025 04:28:02 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738729683; x=1739334483; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=njvKkrsm5qzT+alcT2kybexfFSRKowGk7/adfsp8PSU=;
 b=fVXJ/Qq6IUtt2gYMAPrGjDlwBofF6DjyWKKrqD0s3Vd83uhMRa5D/X+tqX+/HWNxYO
 FjPsCn+yj8crWmddHPEGe0jtHDHmp77t1vQImfQx0Zl1qo1KvleUWgPdFck64tLPpSuk
 zLi/Lh7pStiDEs5XHRSq8+UUn7IzQoJYq00kOhKLYaWohpvHbJPVAlsjHC6bKgBgdKNi
 uoX8a7yE4IoiZDEvfULOjhQcngg3S3vY8tMVoIiGxNI23JLMnlZ9wtp1WXr4kgXyjW+5
 c/xXGNDvY3nrSJ8HNbPOv4G+K0sNC/uoGAULxGy1f64dp8C5AozVUUJiAdydiaoZ53jR
 /anQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fVXJ/Qq6
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-04
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

Autobuild statistics for 2025-02-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  4  |  0  |  9  |
  2024.11.x  |  4  |  1  |  0  |  5  |
    master   |  8  | 64  |  0  | 72  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.82.0 | 4 
     bandwidthd-2.0.1-auto-r11 | 3 
               pulseaudio-17.0 | 3 
         host-cross-ldd-1.26.0 | 2 
                 libcdio-2.2.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   mimic-1.1.0 | 2 
              mosquitto-2.0.20 | 2 
           oath-toolkit-2.6.12 | 2 
package/glibc/glibc.mk:207:... | 2 
               postgresql-17.2 | 2 
                       unknown | 2 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
             bluez5_utils-5.79 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                 coreutils-9.5 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                  ffmpeg-6.1.2 | 1 
             fontconfig-2.16.0 | 1 
                   foot-1.16.2 | 1 
            freeswitch-1.10.12 | 1 
              gcc-final-13.3.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
    host-python-greenlet-3.1.1 | 1 
                  libnss-3.107 | 1 
              libopenssl-3.4.0 | 1 
                libsoup-2.74.3 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
              libzenoh-c-1.1.0 | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.12.11 | 1 
               mariadb-10.11.6 | 1 
             matchbox-lib-1.12 | 1 
                memtest86-6.20 | 1 
            netstat-nat-1.4.10 | 1 
                  ntp-4.2.8p18 | 1 
                   perl-5.40.0 | 1 
                     rauc-1.13 | 1 
          refpolicy-2.20240226 | 1 
                   swipl-9.2.8 | 1 
             util-linux-2.40.2 | 1 
               valgrind-3.23.0 | 1 
                 weston-14.0.1 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/85e294f564b98567420cc5d50a59030362522317 | ORPH
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/fced258d172ac310bce335f1a7ec9617c30f6109 |     
    arm      |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/5679b16a87cd681c6555b37cac0678faa1e55a99 |     
    i686     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/3a1b4fb25f1ac30437e778665d03f07d1e3c4ae5 |     
 microblaze  |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/3b0451eb67826c1dc16399753845046c347010c4 |     
 aarch64_be  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/ecb2b9eb6f4d2030f03e03db445b1e47cc3e150a |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/40989f030a58a872f23c267e5a8dcc6f7620447f | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/50f243ff1591c5d6b26fc0e80e88e78336de3095 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/df652ee30efc898e01bf51d524a168b74b57e79e | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d5cf708edef3ff3b1755b850214c5b8e57236b2c | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b87d5ca573a2f0b6cb4c6d4a053170e1a5bbe992 |     
    arm      |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/68a882e786ba2ea5618fea7eec55c3c8edb24f76 | ORPH
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a08ffbef556a2e13d7ae986ac8dc7099e47045cf |     
  sparc64    |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/53bec90ca63c5c52224d29ec667e8b096fe7694d |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/b994910acd7dde81afba4eee64903aa7e3d211fd |     
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4940136bfdc505001aaa6d5e3f2d2a64e76f9f25 | ORPH
    sh4      |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/89528bb58b482878c1bfd02c5413e6b5c2f7634e | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d385540694ed8e166af40f4114e65907be3d2191 | ORPH
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/882358e20e5536ef5312f87d9dc76ac2a50433d8 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/32cedc877b01ebdf0d58d35c0368a0450dbafa26 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/e286df4c1e50702294fad9b97238b28ba1ee7842 |     
 powerpc64   |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/2ef16c821c4dcaaaa12b9b6c582da21a0592e453 |     
   sparc     |     host-cross-ldd-1.26.0      | NOK | https://autobuild.buildroot.org/results/ec8558a05260b1b23adc0d6564513bf4b7bff009 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/fb57caf33ba060013acd86d9e86b4365615d7134 |     
  aarch64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/cdeab4df13085617f68b9b96cabf05a1a76b32c1 |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/d787c3c691d66757079117918b495ae64020fcb6 |     
    i686     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/f2136e7c8144402b6762737768012bece8fedc8f |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/3f8f504f23f1313f8652953994a2583ff3ee4f27 | ORPH
 aarch64_be  |         libsoup-2.74.3         | NOK | https://autobuild.buildroot.org/results/84cd2b3f972ecdf1ccf320573ca215d8a8e25cb0 |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/3c4873b1f3fa1ff3c3c980e2f13383f3522e2278 |     
    arm      |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/9bf979adf02bfa9a57c84d10c58d1a45c45e9bd3 |     
    arm      |        libzenoh-c-1.1.0        | NOK | https://autobuild.buildroot.org/results/6797ca0c3936566afa7eefffa8237a446604c37d |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a8977f8a9c53c2b357b16c8846a346941dd2786d | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1573a86bd6fe33ea06f125414b5ce67f2a2b0a7f | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ff51061c510adeee104e60128742bcf47836011d | ORPH
   sh4aeb    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/108a771c7634a2cc31b94098da31a5907435c95d | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/8cb27049679c42c54db158f1f10f82ee72bb5a5f | ORPH
    sh4a     |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/bb272af22adec9470cafe8f1d23584de8fa9f2fc | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/019bf84800ff8c9017ebbb855ee1251672835de3 |     
   s390x     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/b9ab2f35164478d3eb8488bb8d08ab00d246c65f |     
    mips     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/27b2bbb66f1285fcf9cca483d3aa71a3ba81fddf |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/899c904aeeef90d9c35ecf7145bffa8a58bc0624 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/11c4104978257a1ff5e2fc3ea5f634a4c744b011 |     
   mipsel    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/87743478f51d9ec8d8a8a1203805462616d250fd | ORPH
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7a93125930cc6c56ba1887daa7a68f82672e43db |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/967b99ffb72e92fc04cdb7172f089068d5d3e1e1 |     
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/8d2a684695f7af6989b9c5a89c07e8d329eddaa3 |     
powerpc64le  | package/glibc/glibc.mk:207:... | NOK | https://autobuild.buildroot.org/results/dcece726324f777876648434e3d615570c639591 |     
  powerpc    | package/glibc/glibc.mk:207:... | NOK | https://autobuild.buildroot.org/results/4062ecfdf79860070b3704f76b8dff428a42a4a4 |     
   armeb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/deee22e5af181fb1903ce10e3330a454f0ebdf4c |     
microblazeel |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/f8b2a05634c7d34e0e5ce66f202305f61b5f2c7d |     
    arc      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/8b0f273f6a09af449dd3c8f6fbaa6267a030f5f0 |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fc3d55c4a73f92fcaa2be919984f5d61f928a3c6 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fa91330ebbe8b6a1153d5acca946bbb6a130f8fb | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0aadcc2b1011fef1280bfa701f2a68a2eeaa0f83 | ORPH
   mips64    |           rauc-1.13            | NOK | https://autobuild.buildroot.org/results/67f3565bf92480f8804efa20640786b0d5e61933 |     
 microblaze  |      refpolicy-2.20240226      | NOK | https://autobuild.buildroot.org/results/b1c65863054bec97b91d64ef9e324a24a9a1d96c |     
 powerpc64   |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/6b82b60b635b28f8307cbfaff6bcda0628ba7a6a |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/21e1c2d0f418bb31802fa8c0adc7560004d198ac |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/926386f331050558583bf83e41377073f3934fbb |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1867f9b311e68032b6ad830e7638bcb8642c7713 | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/7af372586b974e52d44bc3e685aff825a3db7b3b | ORPH
 powerpc64   |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/a8d5cc74e702f41e6c94103d61d0a30958a8999d |     
 microblaze  | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/150a49d9254c9d565ecf9c657bceb17ba4e40eff |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

      host-riscv-isa-sim-1.1.0 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.6.74 | 1 
   python-pydantic-core-2.14.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |    host-riscv-isa-sim-1.1.0    | NOK | https://autobuild.buildroot.org/results/e2adba5d15c1e3b3165a0ce2433174c517efc4db |     
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f23dcf65ff924dc6081d083c390fc121a71438e4 | ORPH
    sh4a     |          linux-6.6.74          | NOK | https://autobuild.buildroot.org/results/faa5c989739c1bf6e65d88157177ee991f2810c1 | ORPH
powerpc64le  |  python-pydantic-core-2.14.6   | NOK | https://autobuild.buildroot.org/results/c45e5f31c33bffaa8b21094984b91330319e5d43 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/423aba4df8de316c5315b7f7470fe01586647b9e | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

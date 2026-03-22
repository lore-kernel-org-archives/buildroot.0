Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6C5FC72AB
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 04:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 667C88427C;
	Sun, 22 Mar 2026 04:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zj7qWIiIWRJq; Sun, 22 Mar 2026 04:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E5058435A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774153352;
	bh=P2FgZ5ZZn6wJi15dv6twdPNCcJOb5uhp9ahbjC/g8UI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MktOBgS4jN9hIkYHH6cLGzQJZwS6nAOH3lerOC7NE1O5GePKCwMksmFJyfPN81IkG
	 lHOeFyPHMdHl+1jIQJPi/s4kH4nd8RC8w5cagyAjm5nbsotKXu7ZIUqk6ODODSizvZ
	 lHD7XmQVQxUN0qZC5evAgowY2nN1TSL5xjiJemodJKt1FMVFo3Gs70rBD6JfaTOUtq
	 9cz03jrr85yOQqiursRAA1FNuUTXDJgW0GWm8Vo6Hxl7hUfpPjxzdEGvZnt0A6MghT
	 0UBl04e9Itqg0nm/2M96JCw1O9ivGPcaIAcKLJTOKlxlfMi8hxs3b/KSgSim0m76yY
	 KPGbWaneZJOaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E5058435A;
	Sun, 22 Mar 2026 04:22:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C87A2CC
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 04:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D30141288
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 04:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VRbYsYuvyCy for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 04:22:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00AE041281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00AE041281
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00AE041281
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 04:22:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48374014a77so30206555e9.3
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 21:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774153347; x=1774758147;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sapnPJhcFdBqA9ojlIq3bbO+vd7e6i5jHMpdQq894Ms=;
 b=WQZ+aDxDiyOv1rkQjFmRgwWkwZPrUS6cC3TefsmbNAuMEPQo5modVv4adYJoSlQsdI
 8TUVoPn3llp29qWt7GTRuwxFlEHcvrCabGDHsI6G5qaK1YrUP4U3leeww1gjgBJ6Q3k0
 AcU6dsGt2PP1KsJLw3MOQjC/PWGKYDfUFCi8DfjSc/AIXygyjJlj3efhu0PlXazL+Px5
 trdrx90N8i3mC89skkQReBtkpf7o+r8lOPaoA63yDUN3r+CR68aECeOcEEmHOCQahs34
 n6aSvrerminUR5i+1WWfBiYvkA8Wk9nfMGN2+CzurimI8ioCxncvaUpT3g8ouK6gvIBs
 J4IQ==
X-Gm-Message-State: AOJu0Yw0uiCe0SA1AFIetltBHAu1mdsWmlMgFgAtunZoC2WO3kG6WvK+
 ngv9t+jibJ2MD0Z0OpbmHxnW1acslldom+vrs7gQx9ACCar/CoNMhtCUxHjN9pTx
X-Gm-Gg: ATEYQzz9wZcLNg4AdAMZ5f2nzwV9sxmW735K1xN0Jq6cl9yMMJvkuCNmmeDbrK2J3n0
 E+ve7DCcBpwQfN1njSExLLytUyI44pDx1Xm5rqYyX/EhpR/Z5S+kp3IRtHfKd4STSj9tTh4/wKG
 cNy80pqJygT18T2OEzW7kzCBwaqSFvMdoqAZAAb0Cn6fEa6iueb6VzisH+cBglCtwblAwehVj98
 up1y/KxgVhwrGzrQ/Ychm9fGYQRiSQSYCTODHjcTvqaAROuRtYwgrX7/ogRuuzXPCMMagJ8mWSl
 hU5ff44mP6j3ZjMvS0AGln4OoC/HfAGk2I17Lnt+w30M0gEe1Q+WVN+Px9vGQ0oa0PYsxPevIs0
 R+0J75/euFqB9G0LwAteIlpublKRVNOUJPTNxWKxdC2dl4djbDpKCBHzMNxVEW9NguKAbiNQu7o
 wgV8eURHeHtnSHqkHsWgVyEUoZv0Cpzc1dQ3Uw
X-Received: by 2002:a05:600c:c173:b0:485:5981:1411 with SMTP id
 5b1f17b1804b1-486fee1a26bmr102355685e9.23.1774153346353; 
 Sat, 21 Mar 2026 21:22:26 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe6d923fsm292873605e9.1.2026.03.21.21.22.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2026 21:22:26 -0700 (PDT)
Message-ID: <69bf6e82.050a0220.232756.05e7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 22 Mar 2026 04:22:26 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774153347; x=1774758147; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=sapnPJhcFdBqA9ojlIq3bbO+vd7e6i5jHMpdQq894Ms=;
 b=aJfdnD30aR9lgmPxFxS7d8lORVCzdYe53F0/OjJEaHKXHqhW3yt2CYfX15wxyl14Zn
 Cvohup2EAm1VBC3K55+Y4vCqJuDWxhqI1Z5Pb4b5LpNAWS3fNn7SpIMZHaGnt8+uP0ql
 nfNMFLw/1CVuG7Y6/k6oLWyTNqwsecho+NWOpMjzP1W3XZM+k5kGyC4/gtYWm5dIbMhF
 vIDex+aNROUNZoEZjyk1k++w/cKeylO8eFX7WpLELZ6C8yRl1FY8VhdqAlhnqXWw4d1J
 4IavarqAN/YOj4HrjlLeSYjiinKhYoMLxxLeZ3ZjuYP+TsNqK7K8wLJvPu7uLIV+iaHF
 OFGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aJfdnD30
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-21
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

Autobuild statistics for 2026-03-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 13  | 45  |  0  | 58  |
  2025.11.x  |  8  | 21  |  0  | 29  |
    master   | 52  | 160 |  4  | 216 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 13
     libphidget-2.1.9.20190409 | 9 
                flashrom-1.7.0 | 8 
  gobject-introspection-1.84.0 | 8 
                 mdevd-0.1.6.5 | 6 
glibc-2.43-10-gc3ceb93dc4f6... | 4 
leafnode2-9543ffaf82406f943... | 4 
                       mrp-1.2 | 4 
odhcp6c-f19dd37fb467c9cf10c... | 4 
ustream-ssl-5a81c108d20e247... | 4 
                busybox-1.37.0 | 3 
host-gobject-introspection-... | 3 
                 libmbus-0.9.0 | 3 
                  libnfs-6.0.2 | 3 
                openssh-10.2p1 | 3 
             tpm-tools-1.3.9.1 | 3 
                  cairo-1.18.4 | 2 
             dahdi-linux-3.3.0 | 2 
            erofs-utils-1.8.10 | 2 
                haveged-1.9.19 | 2 
          host-mosquitto-2.1.2 | 2 
                host-odb-2.4.0 | 2 
libdill-32d0e8b733416208e04... | 2 
                 libzlib-1.3.2 | 2 
                 linux-headers | 2 
                   linux-tools | 2 
                openswan-3.0.0 | 2 
                 apitrace-13.0 | 1 
             bubblewrap-0.11.0 | 1 
                 c-icap-0.5.10 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
          cloudflared-2025.8.1 | 1 
                  delve-1.22.1 | 1 
 docker-credential-gcr-v2.1.30 | 1 
                    ficl-4.1.0 | 1 
                   flann-1.9.2 | 1 
              fluent-bit-4.2.0 | 1 
              fstrcmp-0.7.D001 | 1 
                 fwupd-efi-1.7 | 1 
            gdk-pixbuf-2.42.12 | 1 
                   gssdp-1.6.4 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
              host-rust-1.88.0 | 1 
          host-xfsprogs-6.18.0 | 1 
            igd2-for-linux-2.2 | 1 
                   iotools-1.8 | 1 
                  iozone-3.508 | 1 
               iproute2-6.17.0 | 1 
                jemalloc-5.3.0 | 1 
              json-glib-1.10.8 | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
              libcamera-v0.7.0 | 1 
                libcurl-8.19.0 | 1 
                libdrm-2.4.131 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                libglvnd-1.7.0 | 1 
                  libnfc-1.8.0 | 1 
                    libopenssl | 1 
              libsecret-0.20.5 | 1 
                linux-firmware | 1 
        ltp-testsuite-20250930 | 1 
              luabitop-1.0.2-1 | 1 
                     mdadm-4.3 | 1 
                  mender-3.5.3 | 1 
            minizip-zlib-1.3.1 | 1 
                      ndctl-83 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.0 | 1 
             pptp-linux-1.10.0 | 1 
               procps-ng-4.0.6 | 1 
           python-brotli-1.2.0 | 1 
   python-pydantic-core-2.41.5 | 1 
                python3-3.14.3 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
              skalibs-2.14.3.0 | 1 
          sphinxbase-5prealpha | 1 
                 sqlite-3.51.3 | 1 
uclibc-ng-test-132c6134d691... | 1 
                    unscd-0.54 | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.3 | 1 
                 vmtouch-1.3.1 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/ab3f6195d5770b7444cdf5cd279196372f2055e8 |     
    arc      |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/76cc197e86725153373422872b94ac222d8a7503 |     
   sparc     |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/9eac2030f48201bb7a3d9ddf11c2ec477130d6b2 | ORPH
   sh4aeb    |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/b69cd016424ee3e1add6c901199924821b745a41 | ORPH
 powerpc64   |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/d2fd8769e9711ab292524098b69edcc68e4d3dbd | ORPH
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/9bf0d90547f7c8944861e0326baf787950bcdecc | ORPH
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/ecb53e1ed4f78ae7ef04bcd5b2da714d22e6d7b2 |     
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/8d3c59f0b07be7db96634e7c2e1f44175b17debe |     
   x86_64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/198b931277d8a6b519fd552342620b0100053d1a | ORPH
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/30aaf59ecb591a55dc4eb14ef383b933621cf812 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/86a36c40b2f51a89b4009140ede63314f3f43ee2 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8e5aebbc1093bed0c3256b412ed34c374535ba88 | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/7224702670260e666cc3bc2402ee3b3d408e4921 |     
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/0bc4f177bbe9822d3c1fca067d4bde2eac7cc51f | ORPH
  riscv32    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/6f9f94ae3d89f893940422c1d91bdf3255979113 |     
    arm      |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/9357b303320e3f1bcccd6ccfe7ddfa55d7770ad8 |     
  sparc64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/3bb9f277ea5a8e8cd1792b884156988d45a5fa95 |     
    or1k     |          flann-1.9.2           | NOK | https://autobuild.buildroot.org/results/346d76e1ec9a762ff5029063022d84bdf0531e5a |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/4dff318850c317c8760e00077e13094076a1cdc9 |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/1c9a437e3667ced7ed249dceff4a87418292bae2 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/fd6830945db330f2a99a3c87615a5a1c26d53579 |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/69683ea6d71e39829091e4431c61164d39e6b33a |     
  powerpc    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/cbeb4b600f1d65ac7bdf5dfac0a939c086aee4b6 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/d2f5ffafabc83baf909ce0d0a48282951802d368 |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/da7927a65d71ab16a73e7baebd3899af208c0f6c |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/28d5f89e9de4158511137e89f624faa62c61a8c5 |     
 aarch64_be  |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/03727ba9b88f35f371f0867e184d569b6c8ea711 |     
    arm      |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/98828c50dda1d543c74e5796e257ba194842e11e |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/29033a9a89360a667b1b528da2c71a9e81423ab5 |     
 aarch64_be  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/b117d2303ddde00e984897858a9f4572d447c3c6 | ORPH
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/fae0a32020e2c41b2925689a7514970c437bae48 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/c89453dac3eb1b6fcbafb4f5973f1cebf17ff7c4 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/8c0df8f3cd32b15ba151f37da3acd06d673f137e |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/34c9d7b807f90f28b3906e9ae511f7cab7182f41 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/aac07f96c5a0eeed5a0fe89076a819a1f1a3a033 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8f3fa4dc079ff3f6be994276f0ec98f1ad4ef66d | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d37ccf2ff723cc6c2c2644b160907c5e2aae094f | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4092efab699bf55796c4d1c0018223082c2d324d | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/525dbfd047a096adc0fc4c6c3d089e66717c7779 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a8c6c270723bc01ac78df5ca95c3cebfad747ec7 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7c5a8269f1a7389c89a113f0d7dade3d73576a7e | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d6c90a43a37b8c58b58117652dce9e71b7347173 | ORPH
    or1k     |          gssdp-1.6.4           | NOK | https://autobuild.buildroot.org/results/2a53cc023a154cc1fe98ed3e961b0b78318dba88 |     
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/eaf1ed1868b25cf1290c4f443d2a87462fa38073 |     
microblazeel |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/9c7ccaf3734115edfa43f683ccb042d76bb4f0ad |     
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9f12844db4d02941b36568e0dc1d0e9e2b6293a4 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f17a1db05ca2c28798af90f3e1ceddc6bc5f2f83 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b80fac48900aa55217e91642d4ba672a9eaf4f2a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f33e2eb68e292f2516a8b04dd681bcf2e289b7c0 | ORPH
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b89d45691fe5452bc5a92f20546334858bef91e1 |     
    i686     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/8c6fd5e9870940efe62ef781c58afce2f3d36e04 |     
   s390x     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/37c57d040a1a10cade2369addb2366275dc06c47 |     
    m68k     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f47b1a2f21cba9ec36d4ee41b2e213d5f8b8e4d3 | ORPH
   sh4eb     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/56f9e03d9eeefebaeddd4e357addbb752a0b2366 | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/166fab21d3c71b44a5bb72c870a2a33683e4523f |     
microblazeel |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/2fdd912b121465c269412e3711ceefd511f7f7d9 | ORPH
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/e080b80cfff14afad302757deac61191ee607b2f |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/dc2995f4a8a0b6cdac2941aac5fcc70b6bddac5c |     
 microblaze  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7d3fb1cc145f503bdaf6275982979346cadbae42 |     
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/6804837efd946823e722d56b36092e2a3ca535d1 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/6f98d8f387fed804fb8e724dbd5f1e92203f828a |     
    or1k     |        json-glib-1.10.8        | NOK | https://autobuild.buildroot.org/results/5b3e0b9309e008704955b664c692803001795afa | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/b7dc2ae977c9c80f9b3c86cb2c6a4fc7df09be4b | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/668a0e3888990bbe7f54f554a8242701543d6cb4 |     
   armeb     | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/5d1741a70233f5e85cb3101532a720cca79ea289 | ORPH
    arc      | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/2c56dda16f61f178a4ad528a7f54604ae79ad6ce |     
 microblaze  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/a3910bbec55e8350b7b974ad210244631e9854bd |     
microblazeel | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/ffe02ff40acde00ed4dd487a3dcd8a97af87b22f |     
loongarch64  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/4fee97d1011e29bc2bb69b74ec73d3433b932391 |     
  sparc64    |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/d5df5257a9e595df2939152cb85dc77697fde5c1 |     
   xtensa    |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/77a8900a7e4c286c9742573dab196f41e991d377 |     
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/3a27277388c8a1187b69038f3ccb892f18e53e63 |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/d6646be106761efb6e19f403708c6e038f57d60b |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/abc9a7b2563f78ff5eca5ca13d9e0945f3c9a6a6 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/9fda58507a78fd60905e04572de3b07dae669a96 |     
    or1k     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/35074a3bda8140ee949f6e3edd3d57b4a546e8f6 | ORPH
   s390x     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/01ab29c290dac2557abf2ee430b7763db4144fab | ORPH
microblazeel |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/50382f16202a754d6337d070a42b094d9b21885a | ORPH
  sparc64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/db21a5e0740b05735820414ea6d65b08f263d578 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/c1f7698a21aab8b230321cfc26a9b7ed53494c33 |     
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/fd0692add2d9474cbb0b0fb603865e535099d8f3 | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/f8cd5564738f5eb1f948f38c9aa2c122b192c3b0 | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/c3f8d2c8409de31225c20ecc40cd87eb71a8869a | ORPH
   mips64    |           libopenssl           | TIM | https://autobuild.buildroot.org/results/2bb4c28c10194804149306d5fb281561d25dcda1 |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c16b4c9c60adc1db28c784eaee40167c8e6800f9 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d5079fb151274c0b3d48f4a9a13f57cb14c33b1e |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/741d8ad4d0c0a74b7eeac6222ca2541f30218a0a |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/286d6cfdd5ac9bfe4f264079a53c5c7683b994a5 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e70012d20e981269bcd07578290ad3a9f8bd09cb |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6e8f4bff83c83cc5eea4e9e14f011dd9a308c370 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/954a98ef53772f3cf93fa129055b2d0fbebb3c1d |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/886765d705e5202d1e038e33db49af89b7f7e6b0 |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4ac26264a1e6fa5251c5b170b393f4068360e39d |     
    m68k     |        libsecret-0.20.5        | NOK | https://autobuild.buildroot.org/results/176711dd0b8533becbaad4688a23f838a7126c3e | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/0fcfbf5e30b44459bac5d87cca12af87f8bfe3d0 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/83bf16177ff44a2ca295659c79a684a3bf60455d | ORPH
powerpc64le  |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/343cf4092a4a5b525df91b5a773416998e38b1e7 |     
    arm      |         linux-headers          | TIM | https://autobuild.buildroot.org/results/6b2bf4e2c76d344d64d3e82b2ae27d93afcec698 |     
  mips64el   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/7e9310c2e608dfd66f5779044d92d6445b3e3043 |     
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1da2a4740aa45e17efa87ad796742b4213c518e7 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1f3f7780606bf0741dc887af0d85483a116a30aa | ORPH
    arc      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/affc459f3fd4c16cab2ae220b41b7b3665daa0e4 |     
 microblaze  |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/0a493395b3a9c3d424fa69c34c7a00fb4d29281b |     
 microblaze  |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/560f3a4d866286d558fda7c87264e8c4b6ea3ee1 | ORPH
  aarch64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/f9883690855e1d29329996bf33935173f17b1e3f |     
 aarch64_be  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/cd8d7e4bf360034781f2026afc1ed5d45128c09c |     
   s390x     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/924b402276882ce03be002c37c17dffeed125373 |     
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/85a91a7c228152cc238fa47fe1df5d91f7c77371 |     
    m68k     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/1ffe2e7bfa18c4a39454dee978564895632399c5 |     
   x86_64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/45f59fedad8292372fc937db71301d096878e586 |     
    i686     |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/55c6d0b0974f4ec4f81fcb80ea3dda272ef8b203 |     
loongarch64  |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/c52e0267da2c837c1ffb17a38dd95dfd77c42248 |     
  mips64el   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/0951ed4c0eb01769abe952d19409a5fbd6167de0 |     
microblazeel |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/bf33c1154403c6395e457e814ab6b9b347520dad |     
 powerpc64   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/f012b3d798b4b9a780be057a7f31389dd410832e |     
microblazeel |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/f663ed57a8f88c0e1b3e2daf3b5720447f1c33e0 |     
    arm      |            ndctl-83            | NOK | https://autobuild.buildroot.org/results/12310682d67acbc369708fcbffdb556ff9b95180 |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/252613b1d498ea98c2a86ec185977fcecef6f3f9 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/1c8e6a7d4e752f813d96a6d1b363b0750f1a25d3 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/bd22b76bc27e445ab3c184dfc45bfae05afe385d |     
    i586     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/d4973ea72b0595efb232b31c9cef0580031c0055 |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/c915b68df2e6601febef3f990e7b061e9033abfa | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/08f383287e9771308c98d3bc9cc759055806a71f | ORPH
   armeb     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/9c200b23bb8254ab527c9359e4d99230ae911ebc | ORPH
powerpc64le  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/69c5dca72b570fb323f1539a045a0ca8dc20b2cc | ORPH
    arc      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/3a4d4c659f85f8c7dc1eca8aeea43417b55211e7 | ORPH
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/14da90a29e9ce2b1b8c6ff9b095011efedbfac8a | ORPH
   mips64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/8d02b3e68601c6a70f984d55deca65c798ad2036 |     
 aarch64_be  |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/d900fb56b08ac6da496b66bd6e73ba670fa06db4 | ORPH
   sparc     |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/0cf781d96a8f9e0c3b3726c4764d2f79c558fee0 | ORPH
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/4854b76e23ffadb51fc45c83ef7413c787295270 |     
    i586     |  python-pydantic-core-2.41.5   | NOK | https://autobuild.buildroot.org/results/4cec4087b87bbe65a44121295d265de01b7faf2f |     
    arc      |         python3-3.14.3         | NOK | https://autobuild.buildroot.org/results/4bdfdd79cfd9e66aefa798e42b40941687802c53 |     
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/941a6f3a0cfd0cf9a8b48efc7aa1900563910a6f | ORPH
    mips     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/d2b35a438b9cd3140f0bcfc160a256079e9e8385 |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/ed825620e4f684aa18a5ce2f0fa3ab8338a61ba6 |     
  aarch64    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/417e760cb04bed7b5277ed1555007f678acd8e1c |     
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/a5ea393d6704da52c9beacc6ea29d033d49602b0 |     
    or1k     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/2f0e7a3906547061a11abe9c35f3d022131edb2e |     
  mips64el   |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/a548fb59f1e47d7a3543ff7d443afca322077858 |     
 aarch64_be  |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/7f09d613e788ba05c8586c6230c0c8e9018480f6 |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/f917c139ea9e5e10eca54be9884bd6fe8ded8546 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5049a66635622a66f88749efe42104708b43e707 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/1ddda1c52b9bad3ec72ed1a5af04dfa8d9d2c766 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/7eb83e54b9bfb1ac52ae9d7e00f1b4726fd9b414 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/cb65974faafe786264e08fc8f34a1a33cc5d7986 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/78480def0afd421809c0659e810168dd39bc99f0 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/6a34e8a4c1b5f9666ba0a3e7783458b9c6ce5550 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e4555f991c8a0041bfd9d91239390f509597529c |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/25d6633e864fd8f684c2369c3b532b24c06adfb6 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5e29085367b1829455f4966ff7bfee4534c09a75 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/d36b82b0972301a4c5df4578801ac2edc6de0da0 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/2db2b34a22552bf8fee0affbf5ad59400357a83e |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/bd93e7d20cfe88ad546c7174b5ee720d3a0faaa8 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/fcff53e219ab28d1d05f254bdca54b75905b5870 |     
    arm      |           unscd-0.54           | NOK | https://autobuild.buildroot.org/results/5669340860016c18b2278ee1a80eeb8833ed88aa |     
   mips64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/9bca76b26bfacf53b6cfc79b52fe8b435c1254b8 | ORPH
    arm      | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/446211deb7efde025239e0f5d4b9b883c1e74f3c | ORPH
   sh4eb     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/623c903e0bee58e12541633bed529370664d08c8 | ORPH
   s390x     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/30cf1fd14f33d79dcf84e9222f0f1281e541adf7 | ORPH
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/8ece8f9f27c4233c3708066d2da30e7e4a25e6c3 | ORPH
  riscv32    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/e6cbf663a9299842df2bb269cd9f0dc36d1ff60b |     
    or1k     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/0c33e59d5d765c8006860950a2caf47ff75715de |     
 microblaze  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/97e3e3099fde228bcac14d7701494457b4a2a6bb |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 2 
                 rtptools-1.22 | 2 
                   atop-2.12.1 | 1 
                bpftool-v7.5.0 | 1 
             dahdi-linux-3.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                  ffmpeg-6.1.3 | 1 
               graphene-1.10.8 | 1 
host-gobject-introspection-... | 1 
       host-libunistring-1.4.1 | 1 
                 libcddb-1.3.2 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
              libmhash-0.9.9.9 | 1 
                  liburing-2.6 | 1 
               lrzsz-0.12.21rc | 1 
        ltp-testsuite-20250530 | 1 
                openssh-10.2p1 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/f0cde3bca6d0b52710c1c85973efc5ebe5e79a03 |     
  sparc64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/663d86d7a194e07a3233eaea430aceaf09c8403f |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/40dc51eb146dac27bbf9e095ef3889644144fddc | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/dce8803650ff4047ca4c48e1e91b7e1bdd706c82 |     
   sh4eb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/f4b904f61ff112c06faa45cf58d9884ab46e7cbe |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/29b8adbc3ea5eccb4dd1ddb86e07c9be1307e9f4 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d975a0f7c8ebda2fcd8fb2064a96f732f75f55b0 | ORPH
  powerpc    |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/b7604d41da696c70d8e9beb8ab99580890172dce |     
loongarch64  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/e07b72a7d46d54c25aed76076870b2fbef47e565 |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/1d0f509625a4abe89150ef9524895efdf3eee3b2 |     
   arceb     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/9c6f8f5dcac00106ffa727d617ffed9b34cd461b |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/2345a6fcbb8e756e4c6f715de532afbe7b003112 |     
 powerpc64   |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/06a89360336450cc79ce3e846d50a2278fdd483d |     
   mipsel    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/3c1c62e1e74a2d860542cd31cbb7f9667b27fe6d |     
   x86_64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/1d5bbcdee45df877de3c38e637f2dfd9e27ad147 | ORPH
   mips64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/dedf7cd17900027e2befb0e6d7963e0aae69f452 |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/f2dd6d00a84dc67f8bd9459926a337ed5cf36f71 | ORPH
    mips     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/b7b0ed04fcf27004ed1a71c7ebb3c9a6e04bb434 |     
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/5d6908885fbf3c0687a76eeede438be36d3201f2 |     
   sh4eb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/5097d92ec664e632361a2f8d8189f4976418d87b | ORPH
  powerpc    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/4cf4eed8c1315fd7f6399ff20cb7158d778d19ba | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-faketime-0.9.10 | 7 
                   perl-5.40.3 | 5 
host-binutils-arc-2023.09-r... | 3 
           host-go-src-1.23.12 | 2 
        host-python-lxml-5.3.0 | 2 
              libopenssl-3.4.4 | 2 
        ltp-testsuite-20250130 | 2 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.82.0 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.0.0 | 1 
httping-ffb9201042813c58d02... | 1 
            igd2-for-linux-2.2 | 1 
                lesstif-0.95.2 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
            lttng-tools-2.13.8 | 1 
                memtest86-7.20 | 1 
            minizip-zlib-1.3.1 | 1 
                 openssh-9.9p2 | 1 
package/linux-headers/linux... | 1 
             parsec-tool-0.7.0 | 1 
             pptp-linux-1.10.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 
               valgrind-3.24.0 | 1 
                 vmtouch-1.3.1 | 1 
  wireguard-tools-1.0.20210914 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f4f791191984648bc271e93c85d33544a2accdc1 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/38d319f219584522dae4327545f4b140cd8a522c | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ca69a1184b63d4ffa20c6649ce23aa5b3a7a3b14 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8dc1a52de00cb84971946d9bb0c8948c5ad6a09b |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3577572cab042e973b693347f85a4d3cd518788b |     
   s390x     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/60e1a64c661ce8bdaa7d410f03ef29e1c82e07b5 | ORPH
    mips     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/d27afb160ae972078d23632de0809eca3307db8a | ORPH
   armeb     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/3e4cbce7849e347efefdaa99889096abb49e8ce0 | ORPH
  riscv64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/ebb1bef852350e3d683976bf8fb5592fdc1b32bb | ORPH
  riscv64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/ed977f6239ed5dfca9ad9a222dec03698ad35f5e | ORPH
    arc      |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/1f9cdca2e004f7a218982ef235a7f6c440884426 | ORPH
   s390x     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/ffee1132cbc5f78add2840607833a0ec1b882726 | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/809ed32cbdbe9820633f42a06999132ff8cd98a3 | ORPH
   armeb     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/bf72c765e6d179f972ded82258289e201cbfd5d3 |     
    arm      |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/26e82c574efcaeb3b6a9d874bbf93c98960fe135 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/4a147cfaf916adc396e6692c480abd9bed914211 |     
 microblaze  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/8a66a95504e2335b8330ba798a2737d5902c2d61 |     
    arc      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/02ff09e613e17418cb9b841c306685ace609bdaa |     
    mips     | httping-ffb9201042813c58d02... | NOK | https://autobuild.buildroot.org/results/8747923e5bfd3e81a5eca4f4aa5a5b94797087f5 |     
   sparc     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/662cef6749550c33769f8dfdf3f8dddfd9f10ba2 |     
  powerpc    |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/292a8a16fdef35e179378895d6e18dae7e1247b2 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/c8cffb4ef791af9dab2d25c3e73d9a11744390c8 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/618fef59fe37fc93c5ff562ad6bcae25a0f2733a | ORPH
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/3374f40e513538d2e64e7fd292014142d07f3115 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/1e81e87f454bdcf8bc484fafd59af3e1923f1451 | ORPH
  mips64el   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/0814c72425b9b07db892cac1d8f3ef21f3d06222 | ORPH
microblazeel |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/e54f656f1e3216058fdaf6248d98d4428a58688f |     
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/3d4850ee2317074cb36558c82617f4729f8adf8d |     
   mipsel    |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/9dc434b08c6b7adc36dbc71338eb4cbcf762ef85 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/2bba445641ec65c029d01b4e7cb50a8b05541a44 |     
 microblaze  |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/a1ee4c50301963c56828f0091e80d4323ebc8caa |     
    mips     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/950b446412ab973501e5f28429a045d225245c5a | ORPH
   x86_64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/aabd4a2bd45f60a8a4ed5bb1360487a921b59a67 |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/3d087440da6c8bcc2786e0a8d865f31a58183567 |     
   mips64    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/7c4701b509eab39d598b144e9d1b9c783f2f7e68 |     
   mips64    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/1f6708450522f31341f65294a75bb74e9a57197a |     
   xtensa    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/cdf518cc2849d4aa15d34a5eff40d600adf7acdf |     
    or1k     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/754ed3c939f8db67403f0f26b7b804e8b210e137 |     
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/ad0af2d2ca448f0c12aa85a934856437a10a295a |     
    arc      |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/2b6a4380c074dfc595665838ca1c40e632b114f1 | ORPH
    i586     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/ca969f213e1f766917d64780926718ba90865a1e |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a576dd20c6ffcf62a69d4dea4f3adec40270f71c |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/d133b0513a062afe7c76d6bd3953698240b25eb4 | ORPH
   mipsel    |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/b66c8e450e807c416a6445da1a2d94487c0abf09 |     
  mips64el   |  wireguard-tools-1.0.20210914  | NOK | https://autobuild.buildroot.org/results/c74be12a2a5b5179e7dcb98b133fe10829a49c0d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

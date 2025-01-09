Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183D5E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 04:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 818E1403B7;
	Thu,  9 Jan 2025 04:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-wZ7Pw_LNJS; Thu,  9 Jan 2025 04:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D262540314
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D262540314;
	Thu,  9 Jan 2025 04:14:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 911E57AA
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 04:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78E3040A21
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 04:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpCwjm4Qov22 for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 04:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F7824012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F7824012F
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F7824012F
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 04:14:36 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so609104a12.1
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 20:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736396073; x=1737000873;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6JdfPywgvL2/XMXUQcRnOQKFfOXGl3HvbTcsuOf4Qpw=;
 b=EXqLGXWZyQCIPKB99HHaYtCoLDx5Kogb7ReclZgASfKAloir6Dju+HcqvYF90A4/dB
 ISaRPjp06pn3mvHxQLG20a9nbtYAxpzXNe+UzCsHQgKiXm+pBEcO9xzqnmRn+VWW8GKu
 i17MaUv/XDC+/6c26nHM20SJt6tPUkN4NTCHO69eNKXRw9P/knMZUla0AQBhIxdqB7yC
 bFwxyzAfQ+9X4RMglQM47nXp/9e8DNYA2MZfexagrn+hNx3b9cvdx+JQM4NfmN7b6cnL
 RrR0WyajK9h60Adj609D20c1TI4Jdz6xjBJUtCeWZFjNvRWtpinXBBVt3tfo2y67rihR
 h5Zg==
X-Gm-Message-State: AOJu0YzXignImGKq0Gaq/WgR24JIKx8FpDImoaoLRrjIhxxBFyeDfzS5
 b9tTxLOHQYmvAdhtmM4OiCiMZBGZbZj9bhKYCdUebo8NWz8CiG7JhjJWlA==
X-Gm-Gg: ASbGncs37Hm1osuGL3cMSVHua0Gjr2OZn+dUtUKHH5IJ7Y9DG0RCbVP2cqiRtKxuBrg
 ulljMgSlGHywtRf/uPV2USaZxK70az1y1sPuuX9XqayRYkFdMmtrw1/lkGDGoapnwapt6IZF1C3
 vFOh3u6P8BZ60fWC8gi0oEfDvEbObUh4P7yomCu23wvRjvtCmjKkRM2yDLW6uTnO/HkNKN/NFBu
 Y4DDlQSnHFqI2r5K8Xcz6ugT2XD2TgCMBrA2/a4zuchRQKXGcWxUPSQJtC8
X-Google-Smtp-Source: AGHT+IGazd9wUGeLMpSqPQTkjqkOeUkw5Nq3XVvjtf+TpOInYSmAQMzvBapDMZVbYWUGQspERji8ew==
X-Received: by 2002:a05:6402:35ca:b0:5d0:d818:559d with SMTP id
 4fb4d7f45d1cf-5d972e0b954mr12442144a12.11.1736396073331; 
 Wed, 08 Jan 2025 20:14:33 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90da180sm26552266b.59.2025.01.08.20.14.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 20:14:33 -0800 (PST)
Message-ID: <677f4d29.170a0220.156b3c.0d48@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 09 Jan 2025 04:14:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736396073; x=1737000873; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6JdfPywgvL2/XMXUQcRnOQKFfOXGl3HvbTcsuOf4Qpw=;
 b=QaUVudfCWkx9w7YikEBJyCrvlEZ71XUENPIapx6WylkPdceClHGbNWiCwrvW9QSgVQ
 hQugOGebc1VW+SVFR8nVfEQtl9Ww39qT+s1Cnto6Ix5SCFeP/PwuosP0O/hVjZaSUpsX
 iriwZzd10YNIahtSMBMo10Bc4sshW/707sO34fGoE89njYQC1gkP42rM7smqNLJ3Joyq
 3ilJid+/kZpOUFpPvnQfTblHeK0aX5SNOO1nRFixDLdGAUgnpSRbq92rfqDrLx7mTc69
 vfn14eyY1jg6ZFXwbJ/IuKx9jwV049gChLF8ElA2XQa9TRdRxjFmtmgCY6JqV6zS9Jbx
 oR5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QaUVudfC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-08
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

Autobuild statistics for 2025-01-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  2  |  0  |  7  |
  2024.11.x  |  4  |  5  |  0  |  9  |
    master   | 15  | 52  |  0  | 67  |

Classification of failures by reason for master
-----------------------------------------------

                  curlpp-0.8.1 | 3 
                   perl-5.40.0 | 3 
              host-rust-1.82.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  msmtp-1.8.27 | 2 
            netstat-nat-1.4.10 | 2 
                 openssh-9.9p1 | 2 
               pulseaudio-17.0 | 2 
                  ramsmp-3.5.0 | 2 
                       unknown | 2 
             util-linux-2.40.2 | 2 
                acpitool-0.5.1 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.4 | 1 
                  boost-1.83.0 | 1 
                   bullet-3.25 | 1 
                cryptopp-8.9.0 | 1 
        edk2-edk2-stable202411 | 1 
                  ffmpeg-6.1.2 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
glibc-2.40-18-g564178076272... | 1 
               graphene-1.10.8 | 1 
               harfbuzz-10.0.1 | 1 
               host-qemu-9.2.0 | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
               iptables-1.8.11 | 1 
                libdrm-2.4.124 | 1 
           libfreeimage-3.18.0 | 1 
                  libnss-3.107 | 1 
              libopenssl-3.4.0 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.12.7 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
  python-pypika-tortoise-0.3.2 | 1 
           v4l2loopback-0.13.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/f576b12838eb53cd52f95ca091bbcee6d8b7acae | ORPH
 powerpc64   |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/f5ff985cc8b3cdbc5fbee1af3c0e6a577c9fde5a |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/b305a4d8e49ddc1fd58e1193d9c376ccdac68ef9 |     
   mips64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/bc66c4eaa325e719b9be8f676177b3701b7d9496 |     
  mips64el   |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/d143d99bbb0a3e233a4173fea51ea7dd880e07db |     
    arc      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/16068e85f417954c563e0fdb5bf35d51f194b2a5 |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/37dd710113b1fe8ce7399985b8ff6054f122155e |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/3d39bb0d5000314acf737692458187601f5ca49b |     
powerpc64le  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/47b56f73f456f5f18be239f652ec0f3410724511 |     
   x86_64    |     edk2-edk2-stable202411     | NOK | https://autobuild.buildroot.org/results/3de76ffd4eea8bdc31776062752b171ca964fe1c |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/5f3470f541aa981883ae2310149ffc8c1b93f109 |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/3e81386279bf648c34565b3b70b54d8af5f5a649 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/a86875834167ca8c52b8fea4eead594252a5da7f |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/cfd184cf4f6567638d8fb2afc75a1d36ceed2bf8 |     
   mips64    |        harfbuzz-10.0.1         | NOK | https://autobuild.buildroot.org/results/1a4721436bbd2b33e199ccaa1d6f5ce0ee46d7d0 |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a20b9dd858c26395a650f48cba6a1ed008106f73 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/de4b3d7718f4a8a60d1c65393d8febb164531d5f |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/edba07f30a1ee60cc68a82e15135a06d6faa4261 |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b72e2516e441f4e5e5e967d3b69da2cdaada96d1 | ORPH
   nios2     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/d5b6b7fb43e95a485015804f3de45548c9251e11 |     
 microblaze  |        iptables-1.8.11         | NOK | https://autobuild.buildroot.org/results/5779c320e3639cd071c18aa8eee029d2160de480 | ORPH
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/1d980a443cc577bad0640c0a95119c500a67483c |     
    or1k     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/c5a347c70a5b3aa59dcf7b808498799127ec3cc5 |     
 microblaze  |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/95d2e09a94716635ec9fa4b2d81f977f1a3e81ec |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/0e2a004dd48b51bfa82ad9db76fe47064d9ffff3 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/7c65f32a69b750da330bb6f0951c50194e170576 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/477f96d05f9319955408c4077ea60815af04fa04 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9ec18efff243ab96cb942a6f0568523188f2d1dd | ORPH
  sparc64    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/1bf81a086257ab74dd1a1b7ca4dfb87607e3f72a | ORPH
  mips64el   |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/560f66b0311d02dc884732221d6870ae3c38067c | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7e10071d4080c953a22b5e3740856c86dda8fc24 | ORPH
powerpc64le  |          msmtp-1.8.27          | NOK | https://autobuild.buildroot.org/results/af66c36f8448392effe267ac1acdf5fc47de5fad |     
   s390x     |          msmtp-1.8.27          | NOK | https://autobuild.buildroot.org/results/5025fb1c7eca7b95958007b4170f5ebd748845df |     
    arm      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/6487a887423037a819e26f30b28383e677966988 | ORPH
    mips     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/02ca54bd4de0a3ae950e9f9f360a00347f99eb97 | ORPH
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3066e7dd453aa3c7e04b02b73110d7cef4a23354 |     
 aarch64_be  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/be1f30263b63db3dc3c5e7e469285fc4133180ae |     
    mips     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/e616c79f91198b2297369159351832a523226fa5 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/36f0c74e76244e2032d10f39143adb807e8d4c69 | ORPH
   armeb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/48cd72f4517c1c18e7c79e24892fc8dd9e851da2 |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/2b95d9a9f996045f969312d8c3e1a45d261abf96 |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/58afe03ed23459f77c25f509d7b877b5ebf33188 |     
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c4ba8f18ab36b0aaabdb90b5a96ab82dbedb1131 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fe46eb7d9297a491c237c6345fe2f521eb17d848 | ORPH
   x86_64    |  python-pypika-tortoise-0.3.2  | NOK | https://autobuild.buildroot.org/results/4bcb3b3a709c623856151e3be47b27f290f8bbac |     
    i686     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/4e95c36b0bf4c1dd186c8cfcbe2731187b7acbf3 |     
   sh4aeb    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/e5533834f86efbda7dc9c937437f4d2f6322fda6 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/55bf896437a21cfcafb6b9bfb632d928fd9f9d2e |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/e7cffd54457ea5acd2f90359becfe68daebc43a9 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/96d82852f65868f548b9670178249ba4ceae4338 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/87841c089239e762c2b830db7bd9aa714bf2a79c | ORPH
   nios2     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/107f6e14d15f82a3a5a92953ed1bcf379bc9ed8e |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bat-0.24.0 | 1 
  gobject-introspection-1.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/0cd0085a1a04c3af133327debccacca61493899c |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9f13666ceadbad22c52abc7dccb577588912c3e2 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
                   grpc-1.51.1 | 1 
               host-runc-1.2.0 | 1 
                   libks-2.0.5 | 1 
                  snmppp-3.5.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/c29f95e3204ba8994959044dfc848a623b6ad055 |     
  aarch64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/693ad08b6a2e47f9f40bb4573cf658e7c7f991d0 |     
    m68k     |        host-runc-1.2.0         | NOK | https://autobuild.buildroot.org/results/effea1a657ba76bbbc238b06c82a6c28035a332c |     
    m68k     |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/07f161e150f79fc098eac3428ef42d5f6671d382 | ORPH
microblazeel |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/ff3167fcb32f2f32bc5f5871835bcdbda990702b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

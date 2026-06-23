Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6299CDB475
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 03:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1408640978;
	Tue, 23 Jun 2026 03:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIjwzIZMseND; Tue, 23 Jun 2026 03:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0BA740971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782185103;
	bh=Ppj0bRi41eSvvI/dtjVFYcxNB1UyS4W7sR4F2taEybQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sm1A1csrruRz+4oeOfej7+/chfoCnGRuOVqyHxO/MM7W/9jhg2coKTEzLexhHVXsW
	 ldnp0fvGVpRIhP5RHLqX7ZmMM32G1xKY9sxShVc/viG/Fc14Oufkr8KCMEMsCPiopO
	 DrQ1HvUg+6UirLyjihYmAJtzfbanp01ivWNmhT4ZsnSYK1fzUSNiBF2E9WU+/DfQkM
	 87wZSZaGyB4wZfEdXeJEArd9wuYqiJ/zrya3D9upZaklmqqEEgmToIj4slOkKE19hM
	 zVp7sHYtPHGsIzWQDCpba7u59SzgPkLjUXntbaVRIZCAwMXuR6lYDN/x26KqfdolZv
	 qf5q+cd/5b5lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0BA740971;
	Tue, 23 Jun 2026 03:25:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91EB9256
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 03:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8733840971
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 03:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bqk19wB43MtF for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 03:25:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 312C7408FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 312C7408FD
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 312C7408FD
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 03:25:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-45eeea039ebso2848111f8f.1
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 20:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782185099; x=1782789899;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HPWGzTTGF0R/7dRDETlVw7Eb5XNRj6l1dazT+cG8OHE=;
 b=EIfPc6lFlNPzvonUlZk1UTOlUOmsFFk3yuZM0XG8OWLCqmBf0abHndWe4IJbBwLFGp
 viociaHbVy3bglqgOZtV6pRdOgPWJHt3Qrr2JKmTjxt0md10gBCFz1GyW6oo22e+pumx
 a2GzxvTSbIjzQnsnw0Qs1Z8NpM9d6R2rcAuo/H5oAnJ47o5y0eFrSVgjOUrwFHUkP3cr
 p6C6qtixikPafCjDXaSoKz/n0jVwyyb4jOX+CldFM6cbtq79L2rFxpYu93neLYFru0jk
 rcEsg9wwZkeMolLuT9cs8Gya7jqiZkzheuoKul7UcK75+VkhUwdqbBIrADmb0nCWitO0
 tilA==
X-Gm-Message-State: AOJu0YztLVeVhp50+o8g9p8C034AyW/9xfClIBhqNd1pfhNcKeforgK3
 MuuMx9dBdsS7Is6bDCA9Cr83JBLRhMCDUstg6A9OLVZ3LkxokJqM58IpSokTzsAm
X-Gm-Gg: AfdE7cnQhhz2Y9/GA5+eNoE9vzDrq22XNIy7b6OBwwFeGCSZGPIsPCrUrko9610viGq
 Z1Fmjw/iXSVwoQ923gNSLPraW4V3lNkbQ8wXDlTGCcwqFrCBJI8ZlWTC0vbW1tE+5VMBse2zNFM
 Iymwm4Dzzk1MbVA3/AZ4sIxgvnBNVxk5d8jeyjYlD5nDmMm+xg0zVfJ9zU04N9hdbKZ1VA6fu05
 3u9bIbfj9kmu9uxI1Vu52Rp4WQp/czKEaaBhJRXIjDgLgYnAJ+tCI9u59aO58b3laqkFYR2h2hd
 hzt3gbmwLyvNvQClMD6RlAINRi+vf9sr4XGmm3kPHQeHmJg/PTpKwBu9z81Rf0X8YYsKrOh+5Ez
 sTstY7EA+ICHex75wWd1GQdi+5mVV0Of3UzDOQ7h8E6SqrMW3aKozyHHc4SVFdluVlU9I8Acicl
 a+1rHtaE4aBHl3i34=
X-Received: by 2002:a05:6000:2285:b0:460:1967:abed with SMTP id
 ffacd0b85a97d-46adde0ae4emr1198633f8f.39.1782185098732; 
 Mon, 22 Jun 2026 20:24:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466643f4e93sm34196678f8f.7.2026.06.22.20.24.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 20:24:58 -0700 (PDT)
Message-ID: <6a39fc8a.95d0a0ea.1c3512.526f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 23 Jun 2026 03:24:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782185099; x=1782789899; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HPWGzTTGF0R/7dRDETlVw7Eb5XNRj6l1dazT+cG8OHE=;
 b=RH4/qlhhbADiVxJHykJOv1T7KVhf/NFCzPFa52y2DDVG8FWB5T9Ab8jq8EKHzcwQWd
 Xqux4tkSAaECp6vw8dnDcJijdLHPn9P0pIqpHclJH9CpNa8GUW/9Rb3zKhBVKjBcIbOP
 ueNEpMz85i4Wn6/MWmMmSJ/Ce4mPjYWt0Fl/bHNyuZN1iijrOcg10cSUSSe4hGjEMJVz
 ecJRXusJ3RV8TO2kT37zJlReXoqR3qwr0hS0RF/uMpXWAB24ufi0fAaOf+3bpLyAsjor
 kplPk3NISqWh2YUNMN8oR3ILtnHW6+P9godQp4AUllx0KOODj00H/5d/oCY3LEuETXoe
 Zn6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RH4/qlhh
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-22
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

Autobuild statistics for 2026-06-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  4  |  0  |  4  |
  2026.02.x  |  1  |  1  |  0  |  2  |
  2026.05.x  |  2  |  2  |  0  |  4  |
    master   | 20  | 57  |  0  | 77  |

Classification of failures by reason for master
-----------------------------------------------

              host-pahole-1.28 | 3 
          cloudflared-2025.8.1 | 2 
                 gnupg2-2.5.20 | 2 
host-vboot-utils-7dfa482d6a... | 2 
                   linux-7.1.1 | 2 
            minizip-zlib-1.3.1 | 2 
                    olsr-0.9.8 | 2 
                   perl-5.42.2 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                   atop-2.12.1 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                   ccrypt-1.11 | 1 
                  delve-1.22.1 | 1 
docker-credential-acr-env-0... | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
              erlang-26.2.5.15 | 1 
                espflash-4.0.1 | 1 
  gobject-introspection-1.84.0 | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.45.1 | 1 
          host-binutils-2.46.1 | 1 
               host-dracut-110 | 1 
    host-gcc-bare-metal-16.1.0 | 1 
       host-gcc-initial-15.2.0 | 1 
host-gcc-initial-arc-2024.1... | 1 
                 host-tar-1.35 | 1 
     kvm-unit-tests-2025-06-05 | 1 
      libabseil-cpp-20260107.1 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libosip2-5.3.1 | 1 
                libressl-3.9.2 | 1 
                libsoup3-3.6.6 | 1 
          linux-5.10.254-cip72 | 1 
                    lua-ev-1.5 | 1 
                 mdevd-0.1.6.5 | 1 
                openocd-0.12.0 | 1 
                openssh-10.3p1 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
                s6-dns-2.4.0.0 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                  stunnel-5.78 | 1 
                 systemd-258.7 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
          usb_modeswitch-2.6.2 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/043f472783d1f9578569cb05b3ec1ddeac135efe |     
    i686     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/2a8d069c963ae6ee0ea14e1ded0ed43ceb59b47a |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/b7ce5b5e8e7a5ab37cb24a58a8d63572aa2998b4 | ORPH
    i586     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/0f5fc599b3ca82d1830fd50cf97181206febcb6b |     
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/861aee327ab2ba8e53665558b398aa146e5be2e0 |     
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/a5b930416dda339fb5dcd0633c365ac094f0ef47 |     
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/3380b4ee18cfaaf3bce3a16001e145d3e7c8bdac | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d7c69ac12786c32f3eb9ae27e94441ae39e6e2bd |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/c00bf2054cc56dd98f6877a040638fb1ce6b6080 | ORPH
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/f65e570ee052c6a4cfb2837b5a1ec63ca3558716 |     
    i586     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/47ac1a30e89942721d0799707031e9bfd1c6f65a |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/be3bf84d59b16655ab76b10bc1b830021558faa3 |     
  aarch64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/5181530d6ad1b317917907c9010f86fddd9344c9 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1b962a2586b743d10b8c3d4f16054d7dcb900728 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/b58fef4a5d605800617596fda8ffd7aa7ed52919 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/dedb37c9cfb6f1c6876ae58bde8d2e546c59563a |     
    i586     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/5da560429c8a8cea35eed9c90606bf4ecfb22811 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/19573682c076357f38dc28b278a194a1eca158b8 |     
    i686     |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/0fe91b3540ecde46beb36b3c49e0dd74b118be42 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/423edafced1cf3f1d6acb0c64b51421284e999d6 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/e657cb0bfbcaf3df50284b94bddc3ee30f2ed8f1 |     
    i586     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ac366de61f5c60bc5db62c3ccb069e17a95796a2 |     
   s390x     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3ae476448a5d8e9089282369b549c5a12fee5d8b |     
   x86_64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/7045ecb4bb14198537135bdd37ce3f36da221d6b |     
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/77e6d563007130b95d0056ec687d781a840bf6c3 | ORPH
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/a11efe8dd746477191b46c167f18c46052f7a7ee |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/be552efba224bc0b8c9f6f9b8f159f62870aba73 |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/2376707bd12a09ca5e9339c0c96d52afb8c3894c |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/5a1147596b46acd360e344dfa63ef4343d5b8caa |     
  riscv64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/e1fe99702b3f5514d9944b36e6e9dc60cf09d076 |     
    i586     |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/22f867117a5e7442618890b86bb5262f52a3f563 |     
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/58a840bf1cb17fa3e361480b82b0f932a9ceed7a | ORPH
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/d23bf7c9b1de7d6c30d6cbc0f3755a44f21abd9b |     
powerpc64le  |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/002b0a8044ba4a04cc79d636df6e9ad169795143 | ORPH
   x86_64    |          linux-7.1.1           | NOK | https://autobuild.buildroot.org/results/95c9e80623551db9b4b02378578281cb5f7d7283 | ORPH
    i686     |          linux-7.1.1           | NOK | https://autobuild.buildroot.org/results/43204dee5035afbd561aa28730dc7b0a9dcede1d | ORPH
    i586     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/74c25052a8a7ecdaf37722311f490f7a08c7cbfe |     
powerpc64le  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/e95cc214d35378d41f2452da36ba5746075c16db |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/cb553dd0a824c615fd16298c98242f791aff9a22 |     
  mips64el   |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/13dd131cc40b947c41fcfa53e428f5afd6ec1696 |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/7b446b7d6dc11d9b54d8e5c695c000e9cf85f428 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/15482f7461f1578df6596297c4f3d2ddc3317ae5 | ORPH
  riscv64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/0baf8880aee607e154b36567257e7c470bb930ac | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/5ed186ea6b752fa6c9b107906c37d0a6c77b42ff | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/612467e09e4dbf0d4324d6d3fe32b0ee4a973a90 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/20332000226e1601de0105af09895344aef406ef |     
    i686     | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/2746b29884a453d06edefe4b1a7a0aac4cbbfd39 |     
    i686     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/ff8951322d3920555076b32f2d26fd4564c00770 |     
    i686     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/17963840245119904fbd2062ee73eaa4d37fdc67 |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/7b5ccbe333fa2475a2bf1a4f0f631e1ea78fe5df |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/20b228e984dfc537fbe29b2f6aebd09d9cc467b7 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/32e4b4791d47201f2cb966950701a14806829e38 |     
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/0860da8e2a043f0ca1c2ffd5f499b7316fd1aef7 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/15e49f45a9febcb8ce10c2554bd8dd489480a177 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4a5cb30016e962f2e75304f8ba443ee5224b9c39 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/c79d846baed690a51476bcad3f20bce908520e9e | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/798875744939f9aeccce3d849b07a821ba5c4148 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            gdk-pixbuf-2.42.12 | 1 
                   guile-3.0.9 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e2b5b75330ca5364abfb2622497ae5871e04a53b | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/8eb01ecce4b3fc1e9c26ffacfaf2dde355292b5f |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                   perl-5.42.2 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/abd19c166ddc42ce1f6bca1865645f987a9da9c7 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 3 
                   perl-5.40.4 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/dc0e2192a6163781315c184bc019a47687f07dd6 |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/be607d16d980de12d6bda1a955b97d576a6b2619 |     
powerpc64le  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/4318ca3d097671ab3211805860971b4a49cc1895 |     
  riscv64    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/db30c5fb718471ed13fd401465761d370a57595a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

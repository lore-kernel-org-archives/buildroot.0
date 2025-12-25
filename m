Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86BBE7AD40
	for <buildroot@archiver.kernel.org>; Thu, 25 Dec 2025 06:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AB9981ECD;
	Thu, 25 Dec 2025 06:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1bALEs3Ehnx; Thu, 25 Dec 2025 06:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51BC781A73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766642549;
	bh=/31RRAjp6h0Q5PesOe7kPaOOFHxFuCyMCDVoobGUEXQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qLhFs8hc9pBgxOE4ncygRBPIO42CfzhTifx+E45Toi3KAzNM8ZvZFRQSTk71hlq8P
	 HCvEUp+dwAAnVp+9Td/of3pGHBVkmFIODo6ynK1BXJUiSZ0fwrvT9pWF5PLQVQgR0A
	 u0Jx2O6d1UyD0PyQyVCqLLoWTsUBjuEItR6S8YXb9rUGiVniL3qoAESS2r8TIlrAjG
	 rJRdLbr0myrXQlceVShtUzVMIYhaLN+CqfD0zxwib8SLqUHYpD+LWLXyCKZE/1ZzpJ
	 SIzRu2dU/+ZawXfN+kbRHQtBlNWLtKNzet9OqnjHVrUcMWtFXDVuPYM6chsN8zF9TB
	 qZd8tPkZrx+mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51BC781A73;
	Thu, 25 Dec 2025 06:02:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3572B9
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 06:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B19E960C0E
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 06:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeZNi0f4sSNd for <buildroot@buildroot.org>;
 Thu, 25 Dec 2025 06:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEE9360B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEE9360B8A
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEE9360B8A
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 06:02:25 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64b8e5d1611so7807556a12.3
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 22:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766642544; x=1767247344;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PP62feKu+4/mqP+Z1yriszhnZaBkev//2nz2IivvePM=;
 b=Csf/dYJOMqNRBiV+HNhMrm2L9VwfNHDozpb9uS6AL5A0Qz+Pjbk1fHBtNPtBJrN5/5
 ecbEwxPvQbuoKxTWUFJCsLPoFs7FWWLe2z2vT2qEO46CUNyeIoGuupev2Y34oQtrOGHq
 KNBZv5KTGhhvmm86tfvOizbPWHOAk3qf4L1jQNlU62/7sRllELHMnlD8tZLVR2aKFfeS
 J2eYggUsI2HrMJGGbHAj8+RgVR1EDyqIVLresGTEw5oDme2/u800vNRcnCMX8L6y8Po0
 cVMO5Zyht6zpSg1zT+ar5pGLUkfrPXnFfy4O3nMi/udUxYIvz5/r5qOExYlL7/Wf8pwL
 4CTg==
X-Gm-Message-State: AOJu0YwjlZR3b67kabga+86rCpFH31IFX/4xk5vQaBn8rpCAn/GjPvDr
 1DuQaDTijgCKhH/X3vDHpZrv0/G+ZyLRfcdKzrE3h2n+zJ3kgqXE7irzRQ+WJQ==
X-Gm-Gg: AY/fxX5u+Q/qQF4+y1UPE0Y2oiSbGbyiTj69js26Qskg3Yo4z+PmnedZjJn+BXn4lzS
 HUhvRCsdzGfiHbsN8pKs83/cRop6WRVUt72SmBf2/inQI1J70T/LvQhg/Yc1dbC5eDSdLH46+id
 682abBL1fWg+EPiOkfX2/yVt00R8+RIkitpghKZYFBsPFkJXO4HlZZOD/cBe9tjxOzg4BGJM2N3
 Mj0NOHLigRu5+vLCvloGQ8TgQAXe42r7P9vryLxlD9Zai6NQ+2xspwVYNIf7TmLGzaeJMovBvhG
 47F9eERHaoeA/SjC159Oc+mglyEIdLaobyO3oZldLIt78XgILt1nZM4gk25ps3cW0FuTzGQ+1Fn
 zokByMvB++5SZU4jc7lia2epiVZilW6Gcn6vcMRyFy5JxyGeuH5AyKyXQ9+M7m3rb+yfzoyUyYx
 tvOMqWXtlSkMEMB9/hpA==
X-Google-Smtp-Source: AGHT+IE60ZnXiBj10Iwd1l3fu8X1hc2EJ9p0Fi0YaA9p57CKmTR84s8NMZV8wERkYoxEmcSLQBU1mQ==
X-Received: by 2002:a05:6000:4009:b0:430:f6bc:2f86 with SMTP id
 ffacd0b85a97d-4324e50ad9dmr22720764f8f.46.1766636284699; 
 Wed, 24 Dec 2025 20:18:04 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830f3sm36865462f8f.22.2025.12.24.20.18.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 20:18:04 -0800 (PST)
Message-ID: <694cbafc.df0a0220.3a33df.d698@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 25 Dec 2025 04:18:04 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766642544; x=1767247344; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PP62feKu+4/mqP+Z1yriszhnZaBkev//2nz2IivvePM=;
 b=j5HS8B/9y2eLZV3QG4xGdlPldl98CyQ+lWA+XX7ZTYW5WWvdkyLSiqzz0qRVfxmZmk
 ZXIUQO7rOX7XQPoPARq+7S/DjgdOBO2T4BQ4ZNDiqzxCEeytvFUxEb6laCzYAl/fUqHF
 EALZuIOoo9snjCudCwbu+IL9DsaZt0LvSaZkFifZC7BwwRB0vkLv98ahZVxZ3HgEJUT0
 1b10aKA4xud+Yr0t/87H9HYCsrJ+9XqQPxEEQd6wNA++q6p94p4vFqpcB2Q/qszUwLAs
 qfCTi1QhQcxrM3IeWAk1dfcYlMppG8umULrLlDzxAi0vIwGCOKSttfyZXO5blDoXICuY
 wRIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j5HS8B/9
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-24
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

Autobuild statistics for 2025-12-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 35  |  0  | 52  |
  2025.11.x  |  3  | 11  |  0  | 14  |
    master   | 35  | 107 |  0  | 142 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.9 | 11
                libselinux-3.9 | 11
                libcuefile-475 | 8 
            18xx-ti-utils-R8.8 | 3 
alure-14beed2a86d5a36030e90... | 3 
             berkeleydb-5.3.28 | 3 
                       cfm-0.3 | 3 
                 jasper-2.0.33 | 3 
               linux-pam-1.6.1 | 3 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
                  iozone-3.508 | 2 
                  libcgi-1.3.0 | 2 
neon-2-sse-097a5ecacd527d5b... | 2 
                       unknown | 2 
             alsa-utils-1.2.14 | 1 
               asterisk-22.5.2 | 1 
                    brltty-6.8 | 1 
                  brotli-1.2.0 | 1 
                 c-icap-0.5.10 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                   dante-1.4.4 | 1 
                 dc3dd-7.2.641 | 1 
                      fio-3.41 | 1 
firmware-utils-c42a3bc53da8... | 1 
            gdk-pixbuf-2.42.12 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
               iproute2-6.17.0 | 1 
                  janet-1.39.1 | 1 
                jemalloc-5.3.0 | 1 
                 libcddb-1.3.2 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libiqrf-0.1.2 | 1 
           libmicrohttpd-1.0.2 | 1 
                libmpeg2-0.5.1 | 1 
              libopenssl-3.6.0 | 1 
                  libsepol-3.9 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.18.2 | 1 
linux-serial-test-bf865c37c... | 1 
                  linuxptp-4.4 | 1 
              mariadb-10.11.15 | 1 
                     mtd-2.2.1 | 1 
odhcp6c-53f07e90b7f1da69771... | 1 
                openobex-1.7.2 | 1 
package/mender-update-modul... | 1 
             parsec-tool-0.7.0 | 1 
               pcsc-lite-2.1.0 | 1 
               python3-3.13.11 | 1 
rtl8822cs-0ef9ddd619d2a386d... | 1 
                 rtl_433-25.02 | 1 
          sane-airscan-0.99.33 | 1 
           sane-backends-1.1.1 | 1 
                  sdl2-2.32.10 | 1 
              skalibs-2.14.3.0 | 1 
                  snort-2.9.20 | 1 
               syslog-ng-4.8.3 | 1 
              tailscale-1.78.1 | 1 
               valgrind-3.26.0 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/e06ab5947c5aa085e1abaeb67ab1ec3152302fa4 |     
  mips64el   |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/47cbdc361919e62f02051690997a32c03dcd1588 |     
microblazeel |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/6e7bb1a551c6173bc4e6f4f1bfed0b09200dcac4 |     
loongarch64  |       alsa-utils-1.2.14        | NOK | https://autobuild.buildroot.org/results/3c7894c2b11ca02136f54db2f0af2203e706bbed |     
    sh4      | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/bf7797b0a10fb5d51a100149e53a893ac18a2e42 |     
  mips64el   | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/ea0844f60d52f0ebe7fa418f58dfe853ba64cf9b |     
powerpc64le  | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/a71ad0f5b31d51bdeabeb822ade0b68bc45c68b0 |     
  sparc64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/ca3ac2619f3ff344098e81d53fe9408ae657467e |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/68834866624d11fd6d34ab92b17190b28d8b5fca | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/be2737e7c821132a8c2ef93f84f614849b112a74 | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/66c48f7a3d2141727189630b5343d3cb9d3c64ed | ORPH
powerpc64le  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/3da1713c425658dc85e0ab79414be1c8adb95ab3 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/ecc7ca8cdd360eb0a855fcbcd5afa9e225fbe042 |     
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/0f0b89a30ed52b18b3f2676323863d1090f69bed | ORPH
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/5f11cc89ec4fb1cf35c6bbaaf605aeaee5df2db0 | ORPH
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/0ae0db071ca36250c5e42a7d448bfc93afaf9e84 |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/fdef8f0cdf3baaef25d92525bb6dfddaeb520fa6 |     
    arm      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d9bd9f266e9a6cc0b14bcf860fbc5a300551b725 |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d3a8bc5bab87bb505adb91ab279399af3121a5b9 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/547cf509397b4964cc3b7b896f6c5a6f7b3434b7 | ORPH
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/eea9581531e88b43237614981b7991cb267c51bf | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1a7fb42e392f2f473ba55091d8dee422cf4283a0 | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/cf48c35cfb1d4fe2847050b5bd7fa83a06c1367a | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/99a54da33550c3c554ebac0ad65ffb0d81ac2b8f | ORPH
   mips64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/4d484373bd34766c7d92f3bf01c6529e3f5fbae8 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/e7b3b453ee2503bf35340b03976fc957aff8fd93 |     
    i586     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/55d45bf3600d57b7a1854befab05f27fc947f695 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/934be652a1ed7a7575dd7b5388f617d1399eb235 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/eacd5d62eec472ea00e5ec236220108d594f995b | ORPH
  riscv64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/010f246bf649251d66283e75977ea046f7c31fe8 |     
powerpc64le  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/f604ac2bcea6942e41118fa5a584bf82f7be4624 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/4b9bfc7d2cca1208e3f5095d47e52c1629a045ac |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/2099ea812fd8c089e6bb483d56b31839ce006c64 |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/496eb0440ad5147e5ea8c73d82870a3002ece6e8 |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/af2a283af1fcb3bd3a02b96d2e46b605f503c4e7 |     
   sh4eb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/5d0f36e48eb5c7f6ba81797dfeb960c0080f8357 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/2188b20d9518db5f48e42a0f96cea3720d19473c |     
  powerpc    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/740ecbfe8ea27047197fc7f8432eae150f17831d |     
   sparc     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/d4e648a19b51c4f8de12e134a48b772e9820136d |     
  riscv32    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/9a6962708b7d2a2761b6d956c998dd7621c64a2f |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7f963b92c05358d4f87856c28f6226e65d8e47fd |     
  powerpc    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0bd473bce878c57b93f957d4023f5e79fd6e0851 |     
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/328d054c6d8b829d5331b96dd399af99dda0df11 |     
   xtensa    |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/24fcad3063e56979e0b25764cd87c0638c7ba00b |     
  mips64el   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/590352b430c352edb1ef78ff2daa5c899a8f810b |     
    mips     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/5918750b0244f87af85f9f226d09c577c8fcc359 |     
   mips64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/ba9051f676416d957d42bbff58e09313feff4b65 |     
  riscv32    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/f3fd0ab87c30b6108e7d918d53e8b64af63bd702 |     
   mips64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/149073f8ed7e99b2d3d7c1a7adfb88f0b4e44d16 |     
    arc      |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/405b723872eafdf8d0f51a489e03eb193debd326 | ORPH
powerpc64le  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/5ac5b37cb0131e5a92e791372e325e811bcb2a1d | ORPH
  sparc64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/e36c24e655251d52fc6853c3addc16c0abc5ea0f | ORPH
  sparc64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/ea8cddea5115ff36e0b65c97e513c90f21df74d7 | ORPH
   sh4aeb    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/424e44ad1a62dd5ebf4b60a54e8ef356ae45fa7f | ORPH
  powerpc    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/1c886e28ddd78487ddb323de24129a0a25fbe6cf | ORPH
  riscv64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/9e6cfe48c50a0ed04f0cb1aa8659b222328c6eed | ORPH
   mips64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/64833f8b2295bd6125e500ad08409a1a8d84d904 | ORPH
   s390x     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/26ece506af4b47598ad9bad683343549b543b7c4 | ORPH
 powerpc64   |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/e9bee1580cc873f6e967f7ce350096077ddada11 | ORPH
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/e8cb81cf683c75732488407c22ea772564a7e0c7 |     
   mipsel    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/802b43324a528682b6d798b256756445d92af620 | ORPH
 microblaze  |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/2543059ce1ba17647fbbd2d329468a022e2a0bd0 |     
 aarch64_be  |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/0cdacb19a3f26293c661b0dd459bfa996f65b7f0 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/5c240602d22142627742360c3100436e37c8dfed | ORPH
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/aecfa14efcb38b220bdb5c11b3c28969ad42a186 |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/71c49d31273641e1bf1d64bb6ca1cc559c82bc21 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e0cdabd4d17746cf9cf43092296dd5202cd16131 |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/8a57cb4f96100c11dba1952d6cf6d0b5c75d10c6 |     
    arm      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/fcef183150fd8d1a5908cb20207c28c85882c161 |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c474bfd797a54787961ed5e44b8fa7b3dd37a3ab |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/53f184d02a77b613ad2bffe26be958b776291351 |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/7175c7aa17d25fd34dd65a27f00e931a21bc248d |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b43987eb7a0cc4e619fccf452cfc7f971a424680 |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/20fe2093631d502fb0e945df891088f7e58d138e |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0bf9d5f434311e959fb2692e633e1edeaac4b002 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/4647d780ad5100c45b65dd9b918748916f0c938e |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/618e741f90f4048d1bb3c527d471f91f436acd88 |     
    sh4a     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/878bba84611121f9572e921970199e772efee04c | ORPH
    sh4a     |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/e5da275b027ebc7bedb197d77892e5e7d173d9ec | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/aec4f2c35a167852d0b0b08f72120d392e410f5d | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/bfb53e1f043e783e6437a439609a2431a4af86fe | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/10d2fedfdb10b5c475948679e0e34ee3e978f1c1 | ORPH
microblazeel | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/501ff41378048ac2352b7724ae5ca250114059c5 |     
    i686     |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/810c8380172dc1e93c3a9dcc3a86fcc7da2b669e |     
powerpc64le  |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/ec417584ec808fb50c225c1522f3e5c28363231a | ORPH
   xtensa    |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/4616401ac03c54c5595b32276f92b1f11229b6d7 |     
   mips64    | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/daefb80b4c32b2bd7db2132c415133267078628b |     
 aarch64_be  | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/8a7188df4e4d836750cb86a32de7eeb4de7e8f57 |     
   s390x     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/96b1afcffd8be24ae1a7b7caf52298368ae045ad |     
    or1k     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/dff65892bfe8666efb38a2a123664d555edd7bbd | ORPH
   s390x     | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/e0c4fac7deb9da0a975cddd75cd4c0c56754ffd8 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/31e7cf55e4b5513303439b88596efc715b85e866 |     
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/2b47f38a6b32531eb0bd258f3caca482d181b806 | ORPH
   sh4aeb    |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/88208b8ce91e29c8ebd34298b51f907cb154b63d |     
 aarch64_be  | rtl8822cs-0ef9ddd619d2a386d... | NOK | https://autobuild.buildroot.org/results/b9b1bda79339f6365e444eba3ec1506ce1a099e5 |     
microblazeel |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/d1cdca60f8f706060acc1d8444f3832bbd0ee9f3 |     
    sh4      |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/a8eb5054143a0dcbb9756b47676c0ad73b3b9a98 |     
    sh4      |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/f0d496de17cc5b2da54e31dd06f4ce3852401def |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/bb7a11399e390c81475a0283f96821f7e38f63f0 |     
 powerpc64   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/26b1cdf40b0618c607bea392fccd5711db09efd8 |     
    or1k     |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/2c2ba0a7574bfb7e7242236eeeed11e56dd66b91 |     
   mipsel    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/41fad757c5e5d136da8023ba8e453881d8a59e85 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/1d1ffb17e2b9cbff39a92b3114bf687160d53b79 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/7e6852a09b81ac374b6a651ab8b54f826b3cd599 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/c0146a308cf7f034a474bc3c8e7f6f69922ebcc5 |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/0259b98f4441cbc0f39f5b0324693201acf9613b | ORPH
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/a20d9a0496e876ed304cd7dbbc8c798344582b37 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                  iozone-3.508 | 1 
               libconfig-1.8.1 | 1 
     libphidget-2.1.9.20190409 | 1 
               linux-pam-1.6.1 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
                nftables-1.1.4 | 1 
             parsec-tool-0.7.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d15290c3f608f989a079d3cbde53825dd8520fc9 | ORPH
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/08a6b7cc4203b8891db7b7873e302f40d9ae3663 |     
  mips64el   |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/915c5c60d2dc35ce1bd1a406aa8ee346e9f6bf07 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/568bc3f93ed31d2d923851ac68d21f6be6b82e26 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c66c8b73f66fb8d95c704694bb97974520d15b97 | ORPH
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/dfcd23eef3ff6f4c85c0f71a45bfc160b02fc06d |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/fef2979d46cf0e2d65bb2491824055f59897bf86 |     
    m68k     |         nftables-1.1.4         | NOK | https://autobuild.buildroot.org/results/9d3f50a9e51e283f2210a992d49c5e8d8e3cc160 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/1db86d8adc491541461eaafd7e3f68a528eda0ec |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/c94a413848ad6f1b485ef28620ba260ec89452e1 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/183756ff03b1eed7f2c0c3dcccef2af99048a432 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 15
                libxslt-1.1.45 | 6 
                   perl-5.40.3 | 2 
                       unknown | 2 
                 babeld-1.13.1 | 1 
                 dhcp-4.4.3-P1 | 1 
                  dpdk-24.11.1 | 1 
                  ffmpeg-6.1.3 | 1 
                haveged-1.9.19 | 1 
                 libpng-1.6.53 | 1 
                  liburing-2.6 | 1 
                netdata-1.37.1 | 1 
                   swipl-9.2.9 | 1 
wilink-bt-firmware-43fca73c... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/a269b02ce5f7c3f096b26aebe3068ee175bb9a89 |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/33b951cab9e6d75a11e8c087fa937f681b4b25f9 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/3a976e33bcb26cb08fbc5518ca044118249d3b43 |     
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/b6c6d336676ccedf90e17fc471bbeaaa135fed3e |     
   x86_64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/e2e8c9a20112d7d655d0bd3fb2b51ff4b0d77ca9 |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/10ff5c03e187b898e0066c2724a58b093bb01ce2 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/89167ff26233e48895eb95126b56d2a6b664cd2c |     
    arm      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/949b81d4dfc6ce8a2f4a2fd238893835a44619b1 |     
   mips64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/26442df77902a775501708e63f7d4d22637c829d |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/ea8fc18c91b4f3bbd02b67b7ea0341c6e075dbb5 |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/644c368fffa9e729fcd06908d765a83a41de6aa3 |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/94c0097920b729bd58d09eb597d2cbb428924e3e |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d628534a9d1471b823ed4ee9e107ce229bc2fa0d |     
    sh4      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/8acd0dd48df4bf014a2398e4e18f7e9ee561fd22 |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a9f3996dada92d0d66202b5b24590fee34e8c48b |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d52c58590dfd2e0f5519c996c34262850d85452f |     
  powerpc    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/642710a4983b631144ed72d22ace684b120bb3e3 |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/3c9dd3eb6fb3b6a2bb31babcc9ee7fac747e32f4 |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/469b13a48495e064c23f0a404bd7e7420d22c256 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/aeaa95d36dd7025d4465a57446f1f79516f0774e |     
  riscv64    |         libpng-1.6.53          | NOK | https://autobuild.buildroot.org/results/add3454c77e0db2a002ba89af7fbfbe275787d01 |     
   mipsel    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/9aa01a124783a67c5d2ee58655143c0ef33eed09 |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/a2df85e246e0c8decac336b2492def43e4a13ba2 |     
powerpc64le  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/1cea0d3ae63ce95b54ea4b9fe15d87b91e7d5b8e |     
   arceb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/b548599845c396f5082bbfe74ad0a3598abb721f |     
powerpc64le  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/a2ba1f3e2a4b8b2c433404d69bcca83871a5296e |     
    m68k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/c21b5686e1172ef6f8b83791cd73689ca98e3485 |     
    i586     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/85789550d0205f768f335fee323ee651e7c1b144 |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/750c8a1e7867f5e677cfe2775b894ef5e844960a |     
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/06454dc89af787b6b5304d8288e75dc9e62b9aa6 |     
   arceb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/d3f9884e50ea0428f2d78c2eeea894c33f82cb5d |     
    arm      |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/00e7e0ca899d199000f4081153fa78504a4cbc81 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/41b0f2d4e4de6c6c4a637f9764bf8c53a575d348 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ea83f140ea8cef9f18af5ca15c7273a7edde3327 |     
microblazeel | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/9b8a42d94d420f77d8dd3b531ea01af07aa4cc3b | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

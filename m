Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE569C5AC67
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 03:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EC8C80AA6;
	Sun,  9 Aug 2026 03:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVMdMfJwewB4; Sun,  9 Aug 2026 03:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6716880AA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786246125;
	bh=c2BXWEp+lCYWs5NWzdQZLmwD7zYSANfZljAqObRZmL0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A6/xwAx7m5Istur6j36BqmMyfR79HzFw7B3xh0vavcoEWjuKEJqBqIK6w7uGZIpWc
	 F/w5gdegZPIdnr2CqlTe8l/RXYSoMnSVqHKv5YM7ZxIBFMTrsaBqK1iR2vmc7i1M4D
	 zmoi9NDC/FFZnlUT4Caztl73Kbo4v+NosAZtzCcKnv3ZwXYWJdtgA7WVFJ7PzgL6hI
	 bLsN0qWLBGEK6wBqQJCL76ZI43jjcbWWAsubW1qm/pdATkDRvj+pUUwoxHz67zwUxT
	 L+2cx81RLVBbxqjB4xU/gWr50Xv91UyYi4IMPNyrpv15vqbjClOtPkEkzMtrw3WjJ8
	 zbma2LOO1wBqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6716880AA0;
	Sun,  9 Aug 2026 03:28:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E24FE282
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 03:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C87FA40099
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 03:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1g1Xg2uVHYTi for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 03:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72C1740051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72C1740051
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72C1740051
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 03:28:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so647583f8f.2
 for <buildroot@buildroot.org>; Sat, 08 Aug 2026 20:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786246119; x=1786850919;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=FoQKXRxGzya9jV/0oi6QwCGCNxFZ1pqs+dxIsDQ4fho=;
 b=GxMYQol8HNiR34J9MouHXj3FrVWORxqNf4g6GJMgwlPPxlmGrsNXxsXntSthlz809v
 YbEUBMTA59U816C8gpWvx1Mv7lyGS5spEnGFDjrGL3l3sLoHlFnhAF2ZsDLNx/p2PGfn
 mcXidPIQhuFfrU7gigVnhzgCU3ZpK89v4Qi4bVdpx95JUPa1XxAYDakn1KVpS7XNekAN
 HjCPEZlABhEOFCiiIvEVxhaDrfqCRjxY9lzavRfGST9H/m05/elac9tmjizYBsJIruDM
 O9lGNn+hArVQA8uZAdaMNgef6p1KmCz+ElEgLa+/ZHpQcNScqo1AjmZvhbwlJXadZcjG
 krTg==
X-Gm-Message-State: AOJu0YxA+oy9EKZGfAhlYpWezFpEEf7ZyDhB4iSczfk9/jK2UtXGg+h9
 BjGvzQV93gfHwik8vVqg5aQEWjqW6B3hEKOeVQVOUf/6tjDF7juYWcAUL+Qdf04T
X-Gm-Gg: AR+sD11k4tGrmvbWbUOrnv9KrJcdD02nG7LYUvtrSfsLzO1WfsfxaZeEB5A+vPSAQhT
 XjkeHjFWFJfqSwvnK8asdBh/QEm4APWxf7zmwVUVqGQs1UI+BR6sTj1Q7+GfQI+HzwIciW6NfZv
 x7+Yv6XyY5fP3XREn/M+GhEAfjFDFXmifU0VP73X7ASQRmsw0RWfYT7RCVRVfG1avrork8l+Ivd
 UedtQo0YXyTtGDs8gGBpI0hHfw+PRGjcHHmnsvxuvA7DAe046iKs3dXNGNM9Dd+kBKcE2kTbgU8
 4J2Zp4R9DJ+rFJt3u44dWnJWg0B2z41rMCAf2Bg4Oi+Diu+tTIvEXiTz1a1CXBSnRgIqXiCPC3g
 a7/WZ/9bzwibDwfVH/6QIoxZH2I2RbkVzsAyxxVATHkYyLbwH5J25o036PU/fJbBaElTI/EHq1I
 7phknlaM6nNu+r80M/Znyfwqqg7B4gwfg7GOE/dl1Pi7NGPp011TY8Km++Tc85i+s=
X-Received: by 2002:a5d:4577:0:b0:47d:dfc6:b28b with SMTP id
 ffacd0b85a97d-481310f2e38mr10460370f8f.30.1786246118971; 
 Sat, 08 Aug 2026 20:28:38 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021fb89bsm18625818f8f.30.2026.08.08.20.28.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 20:28:38 -0700 (PDT)
Message-ID: <6a77f3e6.d5b2c389.22b8e9.2cea@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 09 Aug 2026 03:28:38 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786246119; x=1786850919; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FoQKXRxGzya9jV/0oi6QwCGCNxFZ1pqs+dxIsDQ4fho=;
 b=JgTvvXkbKjQF5gZBCdcuAWFHXZi/e/Z0smVYDrE+SMTBQu/QLX8bDAiMfXZx1InECh
 nPHQAeyJ8zI4YTm8MZhSc/Fk7CakHQUaWQsLYGp/H248pMd7MdXrbSxWmeTc3GOKD/Ip
 pEEoWnxe2tJE9+M4FEjLBz9jD3khhpRPdGN386qi8UBjUb9XpUAORM7MbvVUhyI/1YZ+
 R+/QEA4ALZ52NOcwWdaFzleH7QBS4Gz35Mn7STIVaekNXXwCSSe6W98QoGiqaXRSf2Ir
 xQWO0koYt4nHQRY5jGDYdS+GIc8yEBpcJ/QQt9WDIRAxn4NhKbQjabmHvesoo9rd+2Qr
 AeOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JgTvvXkb
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-08
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

Autobuild statistics for 2026-08-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  4  |  0  |  5  |
  2026.02.x  |  2  |  2  |  0  |  4  |
  2026.05.x  |  1  |  3  |  0  |  4  |
    master   | 52  | 210 |  0  | 262 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 27
               host-dracut-111 | 10
                   ccrypt-1.11 | 6 
   openvmtools-11.3.5-18557794 | 6 
                   atop-2.13.0 | 5 
                  ffmpeg-6.1.5 | 4 
                host-odb-2.4.0 | 4 
               linux-pam-1.7.2 | 4 
      passt-2025_06_11.0293c6f | 4 
                   perl-5.42.3 | 4 
               tcf-agent-1.8.0 | 4 
             alsa-lib-1.2.16.1 | 3 
                    attr-2.6.0 | 3 
             dahdi-linux-3.3.0 | 3 
        edk2-edk2-stable202602 | 3 
  gobject-introspection-1.86.0 | 3 
       host-gcc-initial-16.2.0 | 3 
              jpeg-turbo-3.2.0 | 3 
           libmicrohttpd-1.0.9 | 3 
                   linux-7.1.7 | 3 
           uboot-tools-2026.07 | 3 
                   bird-2.15.1 | 2 
                easydbus-0.1.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
            host-binutils-2.44 | 2 
          host-binutils-2.45.1 | 2 
host-gcc-initial-arc-2024.1... | 2 
host-google-breakpad-f49c2f... | 2 
    host-mender-artifact-4.4.1 | 2 
                      icu-78.2 | 2 
            igd2-for-linux-2.2 | 2 
libcamera-apps-v1.7.0-10-ge... | 2 
          lua-lunix-20220331-1 | 2 
                openssh-10.4p1 | 2 
                 rtl_433-25.02 | 2 
                 rtptools-1.22 | 2 
                  screen-5.0.2 | 2 
              tailscale-1.78.1 | 2 
uhttpd-15346de8d3ba42200249... | 2 
x264-baee400fa9ced6f5481a72... | 2 
amazon-ecr-credential-helpe... | 1 
                  bcusdk-0.0.5 | 1 
                 binutils-2.44 | 1 
                    ccid-1.5.2 | 1 
                   dante-1.4.4 | 1 
                 dmidecode-3.7 | 1 
                  dpdk-25.11.2 | 1 
                    dtui-3.0.0 | 1 
              e2fsprogs-1.47.4 | 1 
                enscript-1.6.6 | 1 
              findutils-4.10.0 | 1 
                flannel-0.26.0 | 1 
                    frr-10.7.0 | 1 
                           gdb | 1 
                  giflib-6.1.3 | 1 
                  gnupg-1.4.23 | 1 
               gocryptfs-2.3.2 | 1 
                   gvfs-1.57.2 | 1 
 host-binutils-bare-metal-2.47 | 1 
                 host-gdb-16.3 | 1 
            host-go-src-1.26.5 | 1 
     host-qt6declarative-6.9.1 | 1 
          host-tipidee-0.0.5.1 | 1 
                   i2pd-2.59.0 | 1 
                  iozone-3.508 | 1 
      ipmitool-IPMITOOL_1_8_19 | 1 
     kvm-unit-tests-2026-04-17 | 1 
      libabseil-cpp-20260107.1 | 1 
               libcgroup-2.0.3 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
                libgsasl-2.2.4 | 1 
                  libnss-3.125 | 1 
               libsigsegv-2.14 | 1 
           libzenoh-pico-1.2.1 | 1 
               lightning-2.2.3 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
           lttng-libust-2.14.0 | 1 
                 mdevd-0.1.6.5 | 1 
                 mesa3d-26.1.6 | 1 
                   ncftp-3.3.0 | 1 
               nushell-0.108.0 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.14 | 1 
                    olsr-0.9.8 | 1 
              openconnect-9.21 | 1 
               procps-ng-4.0.6 | 1 
                  readline-8.3 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
         s6-linux-init-1.1.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
               tcpreplay-4.5.2 | 1 
                 uclibc-1.0.58 | 1 
uclibc-ng-test-132c6134d691... | 1 
        udev-gentoo-scripts-33 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
               valgrind-3.26.0 | 1 
                    which-2.23 | 1 
        wireless_tools-30.pre9 | 1 
                wtfutil-0.47.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/89871f766f9c5e4355985265b01c6dfee76b7e3a |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/4eaeafa2e0390e28bf3fdc5a9c31c0b1c01c1737 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/b0dd952a8c29d1d7f82e951e1efb3b175095bf9f |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8ac1a74ff8050b22e9bb8213b364219ab1582eb4 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/32a5a26b881ac965ac6c2dfb4fb157432ca95a01 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/5cb95a6d5aa478bc86935938483abe4a3867e2f1 |     
    i586     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/ca71ed63ff92b09909d12ecec37a176aa017fca0 |     
   x86_64    |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/f6c38288500f6fb3d1932751ed5dc508b3b22185 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/33c2d7681373f68e1cc5408e2342c9ce84662e91 |     
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/997174d748d033fa9f705e8067bcc72cdab99f8e |     
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/9141b3a1abb2ca3c15e9ded2586e2debbd41ab0a |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/ce00269af538faa341813745f6ad3ebe325dfedf |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/6ee7d98fd559baea86745c93e772851d65106de1 |     
    i686     |         binutils-2.44          | NOK | https://autobuild.buildroot.org/results/9c50c041e87d3aed6918b82428afb31a4c81ed66 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6f48084f0b8bc5c8b8aa6d8450501f43c05a71e8 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/609dcaf119e6d45b4507e67d7c2abde5b5741b1a |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/85222390b16afa5495631290599fe77de925aa88 | ORPH
  riscv64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/48dba835f2bc8fb645573799a21a3e89f09c74f5 | ORPH
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ac975d9b97b68100ebcebdd4b24516651ce7103d | ORPH
   mips64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/01606420ec35675e9ff2d0ac9c7a46ebceb253d8 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/bebc739c0c062ca2c287794603565b15412f797a | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/a0a30bbf0a6cb15259031ea374e7b1c173e467aa | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/bc4688406ec1b65f4e31023045e94eb7cca17ff6 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/50659380f61ad02180250283c63d5d1b7406628b | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a84c3608b9922b1bee92587ce4dd23ec3f6b6567 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8a99f75e3e1a0fbc92adc649655078d9cd0a4179 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/050868b4e16462c4847803ad7668ccc2935f667c | ORPH
   x86_64    |         dmidecode-3.7          | NOK | https://autobuild.buildroot.org/results/20cc94d487b51b1f78ca730dafd6caebcbe2aa76 |     
   x86_64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/b53d16391e075d8cba142aefdcba6fe327db265d |     
    arm      |           dtui-3.0.0           | NOK | https://autobuild.buildroot.org/results/188f6442371500731453f75983590c922eab6d57 |     
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/a75c4bc5cdf56be25814306b7c2cab5a67b0fce4 | ORPH
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/aaf5af6b58714ccecdbe3f04dbe6d4e0e0946781 |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/d0b379036f6c9e171e9e8bb542012ba53b7c02b2 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/8a2c8ac6a18ac628765e7bf2063a6b9a91178080 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/2879109d4b9e90a929c3f3df698ac5389a618f24 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/aab3dd116293fb87ea0f64aea48f26a2a0b4c26c |     
   x86_64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/e7f0a50b8b196044fbdd711b4f126a09d07165f1 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/37a3e607bd19634156b4a19984ea1bc5a046360e |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/7c98855e7ed45494081f352d5e718b276358d494 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/0865a748ae304bf6f063c30f0f8db9b0627e4d1a |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/adcd7dce71241683b6a0cb9a84cc129dcad830ed |     
    i686     |        findutils-4.10.0        | NOK | https://autobuild.buildroot.org/results/a29f26dc0a6de8ee2c1a87817aa19a7d3404966f | ORPH
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/17acb2bd963417fe1031599e7a5442cf5e6eaf5d |     
    i686     |           frr-10.7.0           | NOK | https://autobuild.buildroot.org/results/9a66850a51717c69c571bc05110bd598ebad3a8a |     
    i686     |              gdb               | NOK | https://autobuild.buildroot.org/results/c6913c6825540871fe382db8f6e155d30ae673dc |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5a39732c12f30256487497cbbe3337aed5a521d1 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e7574e4822e568e2b0d5939c5fe7b7893123ee0f | ORPH
    i686     |          giflib-6.1.3          | NOK | https://autobuild.buildroot.org/results/cb9ea3788d278776a01e648ab14cf2a018729012 |     
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/dc36a0cf66ea502ebcc1c9434cd75f7c9379fcf4 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/1599ec32adf9a3f59953d7604afc2033120b2cb0 | ORPH
   x86_64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/495fe80c4821741df61f03e0a3c0a313a144980b | ORPH
   x86_64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/66872bf815fe6b15d55199c45e07adea5a1ed23a | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/eac92a24bc8768cd2b65fa871f25b4e995e3e8c7 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/3979f76b321af3e6c74928088659adf96f1aa960 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/f0815785281700a948bb770b69abb05663966617 |     
  riscv64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/df2ea4989938c188ef5e643bf005dab01dfe1289 |     
    i586     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/63980c3e201315c38837ae3b26ef1db98b374f3e |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/83d48321a4e43dfe0eec91c035a54565f2840021 |     
  aarch64    | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/a6981d0d63f4dc5295943535f94266a845da10db |     
powerpc64le  |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/84cfc75c0082099ba848c95df711b6f0080c643e |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/88712ac0d1028ea392d9785761fff2c4a1042cb8 |     
    i586     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/42c733b8b0901cbe3913a782fe32df0258319384 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/a78c23845cc7d1497a616ee263e740dc484735a4 |     
    arm      |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/a8440e01211c0338177253faf589d44282d2b77f |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/cba49875d320a45f06381c6741c5af645af2314d |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/be5742741ef40ba8749984a645a7bb68b0141b1a |     
  aarch64    |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/589cd532617a813ebfd809121832d7a0d9fa36a1 |     
  aarch64    |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/ebec0d1e42704537c88d6b02254f0525269392da |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/5273d7af1dce32aa10109a5b4c740396559fb758 |     
   x86_64    |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/b6fa1713ca7e462eab3757c44c5e22528142a538 |     
powerpc64le  |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/9a1e6a039800210f3a1e18d1a59a8a1cf140f2c2 |     
powerpc64le  |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/ef438b4fedaafbae51d83ed949b3992c65d35bb6 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/4600e53623ee24c07fe52e3f6263572b336990ce |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/4c5aaf803ce99c00d90be3e4fc285e5e20f1f1c6 |     
    i686     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/3d210462cba5387473a4b47c17306c2642a3f25b | ORPH
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/ef9fb3eecc997751333937f47f7fb682d5d39ecd |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/04269476e439f2eff2f7c7bf3418e92df18edff7 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fdfb7dfab4af80c837c1aa64d5c9cb21809b4cd3 | ORPH
    i586     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cffccb2cac56d76a112ae63098504695a3926df5 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dbad3f8d0820bbd9b62ea1e8b7a6f37a4007e450 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2d9f699fe1cada8db91de486c2b0ed6c6256e0d9 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e8c92fed035da6f80f39ce7b7b118dd6161e5916 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0c07f0a7f2ad136be57f4fc1b2afc0d753146fa3 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1ca9048cb581f6704383ebd2f952ecb64a4979c8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dca83cfa6e2c57b8f291c25a548b18c686d6afd0 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/05171cf7f52d2532c2c5c59c7ad23fe155ca6b70 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8b029d8caef11831827fa45afa624f605e697eef | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9c09b0e6d77039ddda3814dc098d3ec184102a48 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0434b16cb60d10826aa4f04790e5c5f287dcb1ee | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/37d0ebc937b9608508a6d1d276bf3a9f8b882e27 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ec259b3780728a7ee7e9348063f4c42aa1199bcf | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ee86eaa016325b4f805d6e951baf67bdadf3738c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/631759070721271dea197277aec354f716f52118 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/15881367970f4821baa63881d74765c564fe2f63 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a68838caadd7a669c5fd3e862f9c7b49bb592cd7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a210d1b2775567cf321bad02ba3964eb3c53e43e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9dab250aa93b664f5b32e641f5153e8887e9820b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8b762a3142927bc82659d11f3e2baa1f2c7c8e57 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f20eadcef0eec657772119ce936e3d58b2225ee2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0bd51772117cbd18017313269c606790dd98b7c3 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/002fe755b4d252d67208abb4c3d42d933fbd587b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c6e5e022c29d383a6a17fa7c640bcde180991c3c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2b6199f1d31526dca72a50a3482336a6369360b5 | ORPH
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/38e38203ba7cfd3d912ffe56ae849d55d1610ce0 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/8f1d7c8f8f4299ed9b4e816459bb9e33d14240bc |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/c2693bc6425ed25a3317681c8bd5a2276b79c159 |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/e3800c1c2d60cb69c873f75c131c21595f6447e2 |     
   sparc     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d1ca7fd80c8af551cc01a1d25d8c7490615d9b9a | ORPH
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/9ec5420603da6270d2c6030a9608ae18b2e2321f | ORPH
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/de24766d2ff8fa0c0fef9a384ac5b605ca549bdd | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/42a5afe9d9613f64e3dd3f8481dfb86976624823 | ORPH
    i686     |   host-qt6declarative-6.9.1    | NOK | https://autobuild.buildroot.org/results/6d1df94a1981ab4141e892f87c47670729869a46 |     
    i686     |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/4975d10b81a72f5a6cc5273fa7533e2ed5c6acf9 |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/350b743b89ab03609a693d5a3054f7b261b48381 |     
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/877eae569e14f4078f93bb341b7803d76d9a5468 | ORPH
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/a7ef80dce11bb31fbb3d5e0546c14bad901662ef | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/ddfeb0fafbbfdee28a15918cc4e89e136d17c6af |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/79249cf96579190a49b7ff3836d739fa82c56933 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f937fc40df12a87bfaec77f04a6a0c314b127183 |     
    or1k     |    ipmitool-IPMITOOL_1_8_19    | NOK | https://autobuild.buildroot.org/results/26926a20e5e0dcc47a41d4ae54f62e22b4493553 |     
powerpc64le  |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/c11fb7afd261d1ab629076a61ff4276255efc924 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/97b7112012702e2b5f1fb7984289546b84707b2f |     
  mips64el   |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/9b7bedd0ce2fbd9478943543d81dd6be6529efb3 |     
    i686     |   kvm-unit-tests-2026-04-17    | NOK | https://autobuild.buildroot.org/results/019af8eecc34ed00c5e775e3726187c118548a1d |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/b4d255cfb9ce0fca7e1414968f13f566f1319026 |     
    i686     | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/df7496ff7f0e850961be29a500511cfeb1ba89b0 |     
    i686     | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/ae05162dff31fd8ee1e03ec55649990e907ac872 |     
    i686     |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/d5063cf0db87d038823d590d335ce2802bd00370 | ORPH
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/c4372b0634d9643501c51ad40c8c88cabacab6b1 | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/eed106937652b1402197d043c76b7063280cb8a1 |     
    i686     |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/903bbf242aa37b180f35b5a7f259e9b731df0ec4 | ORPH
  riscv64    |      libmicrohttpd-1.0.9       | NOK | https://autobuild.buildroot.org/results/8aa28b83a5de8f9584483fedb325223346024b49 |     
 powerpc64   |      libmicrohttpd-1.0.9       | NOK | https://autobuild.buildroot.org/results/71fbfd544cea8510922f120fa14b56ed23baf55c |     
    i686     |      libmicrohttpd-1.0.9       | NOK | https://autobuild.buildroot.org/results/35790423a3397cd40bb4c36968898bfb8784073e |     
  mips64el   |          libnss-3.125          | NOK | https://autobuild.buildroot.org/results/063dadce9132004d5436da83df742b8f08d36f1f |     
   x86_64    |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/b5a17cb99c9ac914230c2b273eadb3b07ac63151 |     
   x86_64    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/3f3e953fb675b002e56620d750d3175ce1571f64 |     
    i686     |        lightning-2.2.3         | NOK | https://autobuild.buildroot.org/results/79514a8e571407b329bd3b67bf4383d6d630587c |     
    i686     |          linux-7.1.7           | NOK | https://autobuild.buildroot.org/results/0efddcae293005ef86a10503bb0cd793018f880d | ORPH
    i686     |          linux-7.1.7           | NOK | https://autobuild.buildroot.org/results/f0867abef8702bcb1e4c0d21db1d2f13f8fdcb7d | ORPH
    i686     |          linux-7.1.7           | NOK | https://autobuild.buildroot.org/results/b0a238ffef941c7f939fba32c068929b4352c045 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/32bb042a1a05cf84e24d503ccf4b007f15e9e1ae | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b9e4ff7ffc22b529ca51cb3e52dd2a9a4f5804e5 | ORPH
    arm      |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4a6f8552dbc6c40b091b948acba63949e5fc9476 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f550cc10132bbc716093e72d4e4aa2e980bff49d | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/f5ae53921e7ad3b61806f2aa4dc5e768abf3bf4f | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/5731e89e849909e6bf3dc25257044e7af1a5b4aa |     
    i686     |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/e502ff97a75afd6c045da8ce5e8fc2b590d6b518 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/57626bcda329e0dfd79fca578871d8f5b4a05b96 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/b8996a0d83316e94ed282e35c5ede8e6500d868b |     
  riscv64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/31da53d1cbc93d87170afe8fe9883783cf2897f4 |     
    i686     |         mesa3d-26.1.6          | NOK | https://autobuild.buildroot.org/results/acd9039901cf4168e6318c62252ddae6ea0ec93d |     
    i686     |          ncftp-3.3.0           | NOK | https://autobuild.buildroot.org/results/ab25f98d7ab8b397e2aa4f87af9cf1d814f3d6cc |     
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/5366649719260b0aa8cfa1ac4006c2368266612b | ORPH
  sparc64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/4a6e7cdde4d0f55346220ee4ff40111ece183cc7 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/df1d0acdefee49999375f761af0120c8173f0ddd |     
    i586     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/c1825f4563aa0c3905df95b51e3fc1be686c248f | ORPH
   s390x     |        openconnect-9.21        | NOK | https://autobuild.buildroot.org/results/3f7cc76252f4e75613f83990bd767bb2c5a1991b |     
  mips64el   |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/0a71ee3fb0d24e3e57363b199ebd7dd46fc6b28a | ORPH
    i686     |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/a2e1bf66079c832c9c02c70aa4cb4c19195e0da7 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/fe4b42731f1f43157bd044fb58ceb0d60c8ee834 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/1dd2a8c686621ebd4c1907cd0fd305bea1959eda |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/51cd7e16c13619666d8055225628da8694ab4702 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/524a15e0a9be876afac211daf363d7857bd9d46b |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/920e0ea850e92f337a8e36b4f84798f9dfa838e0 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/53ac8fdca2c859e833453a7f6441d21e3038f333 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/14e30e93206c4e6290ed2183e4e152e405b8d40e | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/683008d208e9754550e07b1ed3aeb40398d1ce11 | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/a2abec5d3caf6077d60b8d5cceb4b8be9585d4a8 | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/aacfb0994fbed264ad7edfe1cf1168538ef2a354 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/053e267d8cd0d213516adde57c5ecd9d6c680730 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/2a66cf425a28fa7337350f1b49a1243ae92a4782 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/3b4e3bb4addd276c684032f953eca80835944482 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/69299b558e34bf7cb47d94fbdcabb34512dabd18 |     
    i686     |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/747b15395fe07068a080571cd165508d10276d77 | ORPH
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/665ff5285dab0dfae22c6a88769f993a7d46c248 | ORPH
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/7b6b5f83dae6300f7e1dcf289e1e9d4c48d55242 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/c5b4df3e8e3181cf499eceb431208d4285eefa15 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/5dc03a5ffafe5a91b607f3e06955af60c1f1d537 |     
  aarch64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/1df8ffedf9ee063be56a6ecca8b3872b52a36c83 | ORPH
  riscv64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/c3308dded5baa2792253b341ca306ddbe6bf6ac9 | ORPH
  mips64el   |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/06143236033540d6a39eb02984a32172f691df98 |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/9e6c577c050e21b29b059d0d6f29eb0ce144fff3 |     
    i686     |          screen-5.0.2          | NOK | https://autobuild.buildroot.org/results/8a22267465bd26fab8294ab02437f1cb5d7c078b | ORPH
   x86_64    |          screen-5.0.2          | NOK | https://autobuild.buildroot.org/results/645e8ac5915e288ce62cf45645a9223b2aa9d0a9 | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/f7b526ca0360187195b5f18217c8a2ff6982567f |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/965d3523cecb1f5a1396a0032f7801fc1445c3fc |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/d88bf7f580b7e34bd74cc4331ce04391abe6066d |     
  riscv64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/e657420e739e0adf17713d98b5a21c1ad76a5660 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/dd3bcd26e2a76328ae2f185adb381eb17c85cb1d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/91f5e24ecec8be86364d52990f8c34f8aa9f267a |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/79f54c23fd32289160f117c118738d6763a702a9 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a5bec3c9c2516f15ae17a7631541c67f8b351201 |     
    i686     |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/2fe1823ef111ac4f47a08eea3e9a9eca132f8a1d | ORPH
  mips64el   |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/dd25f0755a488f988e8487b46334f244fbce1fae | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/0652516b5ff54e121ccc001c87a5b7fb3f980ad1 | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/3c240bc262fc0e4b706ac231df881433b3bf6576 | ORPH
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/2bd73b0060cad4f44649ffe4ea60c4775160d86e |     
    i686     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/b7c57682ce0069b58d8e82cbb29cede2d434ec97 |     
    arm      |     udev-gentoo-scripts-33     | NOK | https://autobuild.buildroot.org/results/e48a91a00c2a5ebf986ef7443ac49ac4df80279d | ORPH
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/6cd14b2217f473502f7369be4f742b8a45fdb06b | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/644a9ddfc2a1fb50c8c4f3a7b209667e9b8f1d02 | ORPH
powerpc64le  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/f51fafbda0aac4aba9b4b98fd7d80100dc5c4068 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8717bed3bad6d99616c50bdfdd83464aa0ba2cc0 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/06d4ce22879dd3d03ebea811fe64a5f46cf483c7 | ORPH
    arm      |           which-2.23           | NOK | https://autobuild.buildroot.org/results/d462d0127fdb8c6639e11fd8069c0af7e7963a22 | ORPH
   x86_64    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/38230abf1376b9e3b724a8c61a91d1c83a492aa3 |     
    i686     |         wtfutil-0.47.1         | NOK | https://autobuild.buildroot.org/results/64e01c876f4388d91e048663bcac8a007ece159d | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/9ed0909c0223c3375915ae5ca6789ca51c6551cd |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/5e83e18431673988b120c3c3c992613249885594 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                enscript-1.6.6 | 1 
                 rtptools-1.22 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/c38fa4d0595fefb9679afae7012216d980dfb00f | ORPH
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/6f5396553ba585583c7d4c5a048173b65ff15036 | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2838f0839c11c1a10fd3bad1306a1f362259d3f8 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

       host-gcc-initial-15.2.0 | 1 
              libeXosip2-5.3.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/5bf5b8bed528b72a77dd22e60ff8b26678a5bf1f |     
 microblaze  |        libeXosip2-5.3.0        | NOK | https://autobuild.buildroot.org/results/cc3aeda76293870d4f82ffdb467045a7807d5e09 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 apitrace-10.0 | 1 
                  boinc-7.20.2 | 1 
                netdata-1.37.1 | 1 
package/linux-headers/linux... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/f5e80dfe1432d0b1566e573099433e81ad80209d |     
    i686     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/5cdb30facc7c539c683d2135895028e103735dca |     
    i686     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/3208669d8186252726c7f88e4bcee7486a71ec59 |     
   x86_64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/ebfe65bba7f681f28282db2e6d8ffe46b01a7c7e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

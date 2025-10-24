Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C43CCD1AB
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 03:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32FB060A53;
	Fri, 24 Oct 2025 03:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mslq2MbBijy; Fri, 24 Oct 2025 03:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E2D8608F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2D8608F2;
	Fri, 24 Oct 2025 03:21:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3286371E
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 03:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20CEF40560
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 03:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8ne7ye6tnQ7 for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 03:21:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5991C4055E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5991C4055E
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5991C4055E
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 03:21:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-475c696ab23so8786335e9.1
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 20:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761276081; x=1761880881;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fr+FDdDifwoCUwVfNgTbIhoas7Ekizm12IkfhcCuJY0=;
 b=mCE24KbgKbi6c4AGKR0GcqREqbKbLvei3bkOQ8XBznQdP6/3I2fFnlay8uEC9WGLcm
 TV1/WUmowwPDuyLDOpNXy/NmNIt7VwrNQ79qehvkId2jbRGdfMcuG2TFJGh627uzwGrU
 RSpEEiVjsPMrEe4V7Ntgj2NK+Ehii8ZTE6nkeyLV5s2oaxX48eBa2Rfr+XVOGsGeHT4E
 Wi6JsI44MXASmA8gWpwZpOBA3zETAhp+r354qy/eYEvNBE6FUCV26/kVwzTPnagZ7sxg
 qRgiamjIPj2vAm5fyk5Aw6SwG0Cm0Ayc6c24ZzSDCGoYWDvKHPBvT5Rc6EkpDibT+tBr
 w4ag==
X-Gm-Message-State: AOJu0YybqElIl18UkPlKX1paXOQJtyZ+frBfqiTwVpO2VixdOCQS3iZ+
 bI4q/xtiQ/I4UgWlHE+BWGZP+4spG1wWaGl3708/6EYgGFljeLLJorlf7PCXPw==
X-Gm-Gg: ASbGncusZrLmnBeVKFX7kLin7ZMyxAimh3/bkYcw8v66V+Jmj3e/vrclWI5tVb/MpGS
 llqVgCxIll2vdzxFagr1WteXZKUndFsONvopmxoDhL+h8Ipl90BjTPmb3q2CIhSMK+shr1k1xYG
 NN8WOAE5ogeVxwitfinZpRd89372YmdNfiprpM8gmzsDljFJthpl+TJxsMcYZ8iknrT1v9kwE/T
 6X0acxvts1PoH+kJa+ivbojqRX1lpW74wQQljx3xo4uxkpZwENmL0YvhQ93Pbd12gGPDDvAsr62
 rcQcP6uE7C3KAP6tUB4YmWXBb+wgHLAI1aKqwF3s4eGjXmgIXdRoKA6U1lx/S62erUMBNRT9Oov
 97EKScjnWn5VwdmyxRo/umrpCepI+mMib7NR/U3AN+68QCHxeaXhmbHFx0eDNQvXO20i1rFzIpU
 GawldJ28ytEcIkKSX7yD06Gh86hVxb
X-Google-Smtp-Source: AGHT+IEHJ7b2RKxmORU/nFPhaviENRhwyPaL71Yp7RQuGJl/RYk3lyvsqO07nSlf5r+lYdmGqcRzgw==
X-Received: by 2002:a05:600c:3496:b0:471:1702:f41a with SMTP id
 5b1f17b1804b1-475d2edacffmr4431805e9.33.1761276080906; 
 Thu, 23 Oct 2025 20:21:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494aa0336sm76992825e9.1.2025.10.23.20.21.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 20:21:20 -0700 (PDT)
Message-ID: <68faf0b0.050a0220.2407d0.5bd2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 24 Oct 2025 03:21:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761276081; x=1761880881; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Fr+FDdDifwoCUwVfNgTbIhoas7Ekizm12IkfhcCuJY0=;
 b=c9P4Ay/+Z8lJL5AeKYJ5lHKkxovymHyXbNTcLM32RSY2JNZnpBwiDxwhH65KixEnK4
 MNrAgRNCnDGeKL9Xxn5ZPjP3FNSaUtHNFdl2/0m9EOzYV6K1kC5FZOKkOCSwjd/R7MPP
 TV5tSrg8vof6Qg1jLluOHtu3VFsBIwonrcw+rLMSf5sv1jh+3ORVvNnIU07X5S0BnyL7
 SRKiragjt1rIg0XGv6OtGbq3nbNVMdmpMsmPnt/wR8YoET25QmvMXQKKCkcVjAPREaq3
 79ZKDXvAKO8qVG0bPWQsLvGTZQ4FOn8dXWJeriXQPjUCoNa2xD9zoibLXrvLAOFYK6S+
 3qKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=c9P4Ay/+
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-23
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

Autobuild statistics for 2025-10-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  |  3  |  0  | 13  |
  2025.05.x  |  2  |  4  |  0  |  6  |
  2025.08.x  |  0  |  2  |  0  |  2  |
    master   | 33  | 92  |  0  | 125 |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 6 
                       unknown | 6 
           host-openocd-0.12.0 | 4 
               asterisk-22.3.0 | 2 
               bctoolbox-4.4.8 | 2 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
           dmraid-1.0.0.rc16-3 | 2 
                      fio-3.41 | 2 
            gdk-pixbuf-2.42.12 | 2 
                 host-gdb-15.2 | 2 
                 lcdproc-0.5.9 | 2 
                  libite-2.6.1 | 2 
                  libsvg-0.1.4 | 2 
                  linux-6.17.4 | 2 
                    mpir-3.0.0 | 2 
                openocd-0.12.0 | 2 
                   perl-5.40.2 | 2 
                    sdl-1.2.15 | 2 
          aardvark-dns-v1.16.0 | 1 
                 agentpp-4.6.1 | 1 
                 babeld-1.13.1 | 1 
             batman-adv-2024.4 | 1 
                    brltty-6.6 | 1 
                  cairo-1.18.4 | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
docker-credential-acr-env-0... | 1 
                   exim-4.98.2 | 1 
                flannel-0.26.0 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
host-am335x-pru-package-5f3... | 1 
              host-guile-3.0.9 | 1 
         host-libgcrypt-1.11.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-rust-1.88.0 | 1 
              host-swipl-9.2.8 | 1 
                  kexec-2.0.31 | 1 
   libcdio-paranoia-10.2+2.0.1 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
               libfuse3-3.17.4 | 1 
                libglvnd-1.4.0 | 1 
              libmhash-0.9.9.9 | 1 
                libmpeg2-0.5.1 | 1 
                  libnss-3.117 | 1 
     libphidget-2.1.9.20190409 | 1 
                libselinux-3.9 | 1 
                  libsepol-3.9 | 1 
                  liburing-2.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                lmbench-3.0-a9 | 1 
               mongrel2-1.13.0 | 1 
                 netsnmp-5.9.4 | 1 
      passt-2025_06_11.0293c6f | 1 
          perl-net-ssleay-1.94 | 1 
                petitboot-1.15 | 1 
                python3-3.13.9 | 1 
          sphinxbase-5prealpha | 1 
ulog-0389d243352255f6182326... | 1 
                  zoxide-0.9.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/17882a02fd96a522fbccd7e5d37aae5d9a951f8b | ORPH
  aarch64    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/503375ab6bfa69379a5ac34b33b649471c11d6c6 |     
   s390x     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/2be6e891010c64c78c5bfbba06081ea5586f33c3 |     
   mips64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/28553a7b99685202149c141903ad0bf697423efe |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/f60a1cd71ab0dd211fd9925f87c05381c08a41f2 |     
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/518948a8e2fec168d0d65320e5fa73d5e5082f08 |     
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/154c999165944d02a9ba247ad2fb3a6d14dd7888 | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/96558d3e3667a091c5cf47eb742cb6c3cd3d55ea | ORPH
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/c810118ce06db357a7db0d498d74747998d22d7c |     
   arceb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a9fadcf50c75bcdac2ed061c725b5f96c4ab8f31 |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1b1cd74eda72eb6777e19f7475cc8ed0d7ac30cb | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f73dcd4664582c1c9f31522a7bb7354494fd794d | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a4c105464ed64f30116623be27b85c6e52f06440 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0cbf69254a1c81ddfef88a9f2b2ab9ed8ac484ad | ORPH
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/7a0d4a22d1d30e4c8f9b36b5cbdb5575733f8837 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/1383f4bd7f9bd80b5647f84680714750945930c1 | ORPH
    m68k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/22cac3e20fea9e2072c711e17e94e16fb2283cf9 | ORPH
   s390x     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/1f1fa7bec55514c8d49060cbf80faf27972d7fc3 | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/86c203e6e82808c0f3959c00187f0805c7fb32a6 | ORPH
   armeb     |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/8201fcfc9a1e95bd127224d1e852948dbac2f6ac |     
 microblaze  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/9dffa9ac7068b820dcac033a6cf15b64d41f9a0e |     
  mips64el   |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/790762abb996d964c2542181ff7d95b4a9220cb8 |     
  riscv64    |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/29fb1fe14cad264aac62919fc50394679aac1ad1 |     
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3471678dd68223bff1f04c04a2a8d99ab5152a61 | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e11ad469c177ee03ed726fd51bc05b6ac8317452 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/bf757660c674f03ec0937d8f00bd1c1d5db551aa |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6938535f610df29cf6a5f301809d9fba2fe809f1 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8cb62e23c0a1f5a1eae06a2f5fe548a6063cc047 |     
  powerpc    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/3897929c80b349a4b65d150d4e847bbdd802d90f | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/8c47466e5374ce594a2768f0c79df835fea11570 | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/24bf170c28ca64bc8e0c098c69dfe6b061fa6e40 |     
    or1k     |     host-libgcrypt-1.11.2      | NOK | https://autobuild.buildroot.org/results/782805204b04954189e8f69fa17b0b65a6154f75 | ORPH
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/35f3b636e6475f5cb0b190e91ec9408ff6824df9 |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/e4d0c14242e040eacf6461f2bcac0ec898aa230b |     
loongarch64  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/2dac58009cffc8d6ad0ac26180bb2d3edcf88af1 | ORPH
  sparc64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/2ff8d92030b562d944d3a247470c790533e1f592 | ORPH
 powerpc64   |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/2adf2d208b347de8fef50d0b2b806fe7eaf2d744 | ORPH
powerpc64le  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/fd4e2e2e1e8886e517467595fafb9b98e48bab61 | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/85e44265c44fed2fde363a1c7aa3e815842c1ed1 |     
 aarch64_be  |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/7b20a851cab6f4f590e2a4e4b4e894808542e1ec |     
  powerpc    |          kexec-2.0.31          | NOK | https://autobuild.buildroot.org/results/a1841fd7e51e041297ebae033de2d4226d8b7510 |     
microblazeel |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/1eb13a41a51c97a0d43d822bbfe56cb240c365fc | ORPH
    mips     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/bbee349f60b1df3654df71b4a9d93b40c76a0311 | ORPH
    arm      |  libcdio-paranoia-10.2+2.0.1   | NOK | https://autobuild.buildroot.org/results/fc5be5e78852f6f66cd631f12a02ac10eb846e97 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ed49ebac2f22d5590fa2643bb1745cf6a6bf299a |     
microblazeel | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/2fd77c8026f656741497b35bde856aeb2cd2b24b |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/369f77ab6a8570c45b1e9fbd4aeb570ebe5d05c2 |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f689c68200538a93f9f1cd229cdb520902d24770 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/691b086b6bb839d63aa00206699b92dca0ff86a0 |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/673a636c943a17c11aaac2545a1d9cec4d48f1fa |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/679ed9addfed93af250378de83fc97cf25021fe6 |     
   arceb     |        libfuse3-3.17.4         | NOK | https://autobuild.buildroot.org/results/d0d571ca54f7a6d4312c082e14363c1006eabda9 |     
 microblaze  |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/2d4550f5543ad4adfa4d413f64901ddf93e9bfb7 | ORPH
  riscv32    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/72d9cdf064b7cc53feb4f2d1c8e4d5e223f29cef |     
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/bc771d181e0e520927151e8077b2b4d9b210d613 |     
 aarch64_be  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/002aba836510b76ed70d3401a48e243ec0e0ed48 | ORPH
 microblaze  |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/c00859825fc9ada355a4260088f785a7124d4562 | ORPH
 microblaze  |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/dd5b17d23c7b6cd27d140870ba57d1b49b2e0b30 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/54d8992e064783f2c340b9ad7a3a279f8f568c55 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/5d550b1486e818df90c1dd1564d89a199915ef79 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/c80b0fc6e7092a46894020dea49183355fbcf2dd |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/3ae770f7ffa97f9b1c316b99f812eeaa7acb746f |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/3c7c1d9b044cc8952b38d2efeb1c682a9e4b896b |     
    arc      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/e7fb2203b866540435a94367bc87865dfbdc3412 |     
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f7a33efb2e6016aeaba5a11c953e4aa2900eecaa | ORPH
  sparc64    |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/69423cef00c26f46e68b117f5117d4ad8ed39d21 | ORPH
loongarch64  |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/e4ed0bf11f2252d711d40126604a6fefb75fbf42 | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/251ac1d688b20875650a815c2cbf88f0b9540ef0 | ORPH
  aarch64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/cb253cdb5e3dcd9dd1a2ee65a04b3591f430ba1e | ORPH
 microblaze  |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/6c17827d21135886b1f4822174a4a963ca6325bf |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2b1552a050d3e7dc481bb350e2f6d389343fdc04 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3f1b2663db1744a3ccac5867f8bef7672ca9feea |     
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/f12ea72e8778266079bc2dc44ed31fc1c06dd61b | ORPH
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/9e9d039715878eb10a1971d60819c9e11edc4b26 | ORPH
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/1572706e5ef707694971c5ca9d5ebb273c1ab146 | ORPH
   mips64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/ef6a922be62c900dc6028b33ebecefefbe9d854b | ORPH
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ef19f557d8b93d30cc606f37c1878cef19cd913e |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0e6ee40bb6d50d9e3b441168378329fc1cd05288 |     
  sparc64    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/237259a728fc18c37fd6d8d3ee8ba4ec154954f8 |     
   s390x     |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/6c6e4894963f67f771e372550c04718e31fb249c |     
    sh4      |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/149c7806cbaa8ec645396ae238ac08f37a0d1938 |     
powerpc64le  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/85b7d634b7a651568b37d3f6a0817408203e5dc6 | ORPH
    i686     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/ecf46359b9cf30281d27d56ccf44f126f984ba0a | ORPH
   sparc     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/336bc7f9b74e0eaa7ece0c983157bfb029424d30 |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/13e8d3bfc082e421c5a079563b5f969fe111a31c |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/47cc9ec935cdf4eda928a57dd8e940f6af04f223 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5c03b57d4a30733e1c379e7c8d18220a6267103c |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/3ec4b59977cbb6f1496339cf40866e3f5bc7ad9b |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/db5c661a580eddbd96795459cba3271fb49b7eca |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/aaebbd193faa87d4b775b793f70988eed10db29b |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/b5f3d2306c93551cdb828b0b7f3e91a2e33a0694 |     
 powerpc64   |          zoxide-0.9.8          | NOK | https://autobuild.buildroot.org/results/b29e1c96b471a01aa684348555947d86d12a7e14 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 logsurfer-1.8 | 1 
             python-webpy-0.62 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/4d9d0fbb6531636d63ac5f354dac7f45c003b36c |     
   mips64    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/956b4cb9d21e459d83b6ad3c4f3ee10fccef84c2 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                  dpdk-24.11.1 | 1 
             fluent-bit-3.2.10 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/27bfe3a004becf3239812d116ab386b76fa90f31 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/e2486b67cea4553871687caf8f8ec55a59315c0c |     
   x86_64    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/8d3927d5fb576ed4622355a162701e87e5e6f15d |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               dvdrw-tools-7.1 | 1 
  gobject-introspection-1.82.0 | 1 
                libcurl-8.16.0 | 1 
ubus-afa57cce0aff82f4a7a0e5... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/ca99d40777165eac2c30c06f2d06c8e5a8aa1019 |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e520f34186d49e8bd9f4912ecdca4d854fe3df63 | ORPH
 powerpc64   |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/3f71216810db7ae15a71df7a79b05e9f3c61fb14 |     
    arm      | ubus-afa57cce0aff82f4a7a0e5... | NOK | https://autobuild.buildroot.org/results/e0fbe4da93326d867e87840a14d175abaff7ebb1 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

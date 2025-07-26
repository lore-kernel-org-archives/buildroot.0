Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71954C87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 03:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E3F606EA;
	Sat, 26 Jul 2025 03:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laAsI0rk2E5e; Sat, 26 Jul 2025 03:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB76460AE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB76460AE8;
	Sat, 26 Jul 2025 03:14:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2C721D9
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 03:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFCA680B25
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 03:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zZp3sY8G504 for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 03:14:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B323383EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B323383EAD
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B323383EAD
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 03:14:25 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-adfb562266cso400122466b.0
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 20:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753499663; x=1754104463;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TwrNOt4RERPk30VZB+7+WvqQGBPW1zMNafhnMdjC7gQ=;
 b=UQGJCZBTAEf4P0aZ+pNiU/K+WlW8byzmGAp1G/9vVvMTGLOCQ+VY6w6HJWeDo0SEfM
 WRpRdXFhNDyDlH1U0QPJgbyFCrQad40niIjlVwDUNnCMVz4qj6GNBc6AlMmL7BLnwiaU
 w05VZNGzngoijLzL3HIPxdHTkbs3h06t20xDdsguCOokTGIafhglf152o+g5zTkVvxHb
 qf0oGdMxUOsaKol+2In0pRbMTMLZvCRPA8Ej+WHgMoN8MXSEVMdW7Al/OdU3OVE9RMpu
 Nn1JO39G43gUbG7lRDcI5Ifp0JP7pxh3KKhgclrPFuhgNejYMhxiVXM8BqyBmB/DUM+f
 uLhw==
X-Gm-Message-State: AOJu0YzmSN1qveahRtez/lKHxKN8H4uHyCFq7BKk+aXiHUusEJYaL0la
 JJ59Aqc8YZrO7BXPCvt6f0NPGuxs1CPq5dKYw5OxlSn8ZX3U42YWfGyRNGRZLw==
X-Gm-Gg: ASbGnctZidmpd0GxpndLdsg91Tuj2XyXoPKactMJRVNGDYFWRfBfnsV9okJs5hFmQH5
 sMrIBe4tX0w+q+O655R7Q4/BBzfTo92kbKPUct8G4EM/YQ3PirgT3LM1IF/sr4Q8aaccG3FOgYu
 rWrqRel+LVI24acCh2VYnamjWjhJh5CFdnOC4SIdwty0HeHMGGVQIV9D2YZN8K/lUuT0X55gmTm
 rwRGxcEr+QnzoqopQptHKw8v7thLUnHNTSgCkdvptZNU6DHOf7VwJlkHAB0xt8zYShTVwy3YOwS
 o6ydzhyBGXlFAYG3qd3YCJpos8DOGoOK5hsl/sovk75Lrb8wWPI9771nlOwtQ77LNbESu3N73SG
 SZNeE59EKT6+zi7DhMXvizHqlmA==
X-Google-Smtp-Source: AGHT+IFpgsXTaUMHqAPMFJyxbQk1Wfpm+8xbd9KbBJ6N0b8aFzsb0ChgG6QHkMV/Kle6XVl+X2tT4w==
X-Received: by 2002:a17:907:3d12:b0:ae0:c539:b89a with SMTP id
 a640c23a62f3a-af61ca9e70emr514624466b.19.1753499662802; 
 Fri, 25 Jul 2025 20:14:22 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61500491e01sm551403a12.8.2025.07.25.20.14.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 20:14:22 -0700 (PDT)
Message-ID: <6884480e.500a0220.25095e.1ee2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 26 Jul 2025 03:14:22 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753499663; x=1754104463; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=TwrNOt4RERPk30VZB+7+WvqQGBPW1zMNafhnMdjC7gQ=;
 b=ha3koUFAePWOfqwv2TwSp/HhtXdf+wdUSLDrzqpgBIYtIkJPAckPPDkCZuwTkTuJiM
 TySk8s+jWhoZJotqpRMUKD39j0xBSeqC2duJTToZjhrfw4b7yWdd+Y628O4pQlUwX6N1
 jF4mEOtKYXaNsDfaPG3/JztyIlDEGGoMIeaNguXn8ZCgdzgSfq1n5mS/h46V2vknXRA/
 bSZ81dFp366EFgpRDJQ0ywkfSkY4REY97wppng7iK03BzsIv4VGBWHvoYjZlVJmYIFsx
 LlYmQJYZ4MEhkhJgkkTUY7AVgIZzgyz62slyFHG+7oEaBENBVBibCSNwdX7tjF0bdLvT
 3hXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ha3koUFA
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-25
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

Autobuild statistics for 2025-07-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 10  |  0  | 14  |
  2025.05.x  |  3  |  4  |  0  |  7  |
    master   | 18  | 139 |  0  | 157 |

Classification of failures by reason for master
-----------------------------------------------

                liboauth-1.0.3 | 7 
host-binutils-arc-2023.09-r... | 5 
       host-gcc-initial-14.3.0 | 5 
               bctoolbox-4.4.8 | 4 
                 host-gdb-15.2 | 4 
libdbi-drivers-0bfae6c43134... | 4 
        liblog4c-localtime-1.0 | 4 
          aardvark-dns-v1.15.0 | 3 
                   avrdude-8.0 | 3 
                   bash-5.2.37 | 3 
  gobject-introspection-1.84.0 | 3 
        host-berkeleydb-5.3.28 | 3 
      input-event-daemon-0.1.3 | 3 
                   nanocom-1.0 | 3 
                    sslh-2.0.1 | 3 
                   cvs-1.12.13 | 2 
                    gpm-1.20.7 | 2 
host-am335x-pru-package-5f3... | 2 
         host-gcc-final-14.3.0 | 2 
 host-softether-4.30-9700-beta | 2 
               host-vde2-2.3.3 | 2 
libftdi1-v1.5-48-g22b4667a8... | 2 
              libselinux-3.8.1 | 2 
                 libspdm-3.5.0 | 2 
                  libsvg-0.1.4 | 2 
                  linux-6.15.8 | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.40.2 | 2 
                  prboom-2.5.0 | 2 
                       unknown | 2 
                   atop-2.11.0 | 1 
             bmap-writer-1.0.2 | 1 
                  cairo-1.18.4 | 1 
                  daemon-0.8.4 | 1 
             dahdi-linux-3.3.0 | 1 
                 expect-5.45.4 | 1 
       freeradius-server-3.2.6 | 1 
           ghostscript-10.05.1 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
                haveged-1.9.19 | 1 
            host-binutils-2.42 | 1 
          host-binutils-2.43.1 | 1 
       host-gcc-initial-15.1.0 | 1 
                 host-gdb-14.2 | 1 
  host-gdb-arc-2023.09-release | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
               host-ola-0.10.9 | 1 
            igd2-for-linux-2.2 | 1 
      libabseil-cpp-20250127.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                  libffi-3.4.8 | 1 
                 libgee-0.20.6 | 1 
             libgphoto2-2.5.27 | 1 
                 libmbus-0.8.0 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                  libteam-1.32 | 1 
libuci-f3fc0b76040685829191... | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
                 logsurfer-1.8 | 1 
               lrzsz-0.12.21rc | 1 
              mariadb-10.11.11 | 1 
                 mdevd-0.1.6.5 | 1 
                    musl-1.2.5 | 1 
        perl-xml-libxml-2.0134 | 1 
                petitboot-1.15 | 1 
                pipewire-1.2.7 | 1 
procrank_linux-21c30ab4514a... | 1 
         python-web2py-v3.0.11 | 1 
            python-yarl-1.18.3 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
              skalibs-2.14.3.0 | 1 
                    snooze-0.5 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
    start-stop-daemon-1.20.7.1 | 1 
                   thttpd-2.29 | 1 
                   tini-0.19.0 | 1 
        vulkan-headers-1.4.317 | 1 
                    wipe-2.3.1 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/b002b7512c1035f218a98e49358c25b24a6a1479 | ORPH
   armeb     |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/af52a1118630183b7709d0d724c484eab6985ed8 | ORPH
   armeb     |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/7ea97b526f338770b1ca54492ac7701a9960d2d8 | ORPH
    or1k     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/2c05f6215818aca5a21281d409ca2789c4546e4f |     
 powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/f8408dea4438e5b0a6d4eea33700a9b77794c14c |     
  powerpc    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/149417cdd0ba78c08a119f71495d3665e273415c |     
   armeb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/bc019ac82c19bea9824121da0e67fa349ea39833 |     
  mips64el   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b00b5c6ad4874c57ae00fc939ab3e030fef32b33 | ORPH
   x86_64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/7bb1fe72f67b73bf7174f40de18575b252c5b35f | ORPH
  powerpc    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/5e05ff0b0a5b9f6b3968855abf8d6c3efe25c971 | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c1fbd00048a6e4d7f78de5c26f458f4d0e7904ce | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d8eb9fa0b945767cec32779e9b4e8ec387e31cd6 | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d51304d5201a8661e64fabda1516e23c6b2760fe | ORPH
    arm      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/50d4dca5d2de20bcc3257943fba737d11d739524 | ORPH
    arc      |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/101d7ac18be4923e9c57122ddf6ca7b6ab181b6f |     
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/ca75b19595cfa0bc72d931d1f72dafb1d2716aa9 |     
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/94694970da3947ab3c60e7e3490ff4dd98fc4033 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/affd8d169c7c45e1f619601d7806ddea728ac486 | ORPH
powerpc64le  |          daemon-0.8.4          | NOK | https://autobuild.buildroot.org/results/cc3311c86e2b14bf9a9c1ea00056e0b290ec11a3 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2fc73ffb127ac88f52d9f576123ffa45bf461fc0 | ORPH
   mips64    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/8b9f17d6b302e3c27ee06572a8719743ac536eff | ORPH
    or1k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/9153e10adc0a063d2e9192545a105b01ac64b9a7 |     
    m68k     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/45d0414f341feb2354478b145396fe137f9cc6a6 |     
   mipsel    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/ebb3b3fcdc22f87d2bfcead64bb292aae5bb59cd |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/54255e1137526418c7201a7166531c0065b1af9f | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6e82b44462cef61888de213722aedafbd0ed6c16 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4835185f86ae5cdd2f922c6bd127b8895797e212 | ORPH
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/90b5539a62c83eb8ad46e61ecb2e10239196ef7b |     
 aarch64_be  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/887ac50bb1fb2eba6022f9695e6f6614b65a5bf8 |     
   mips64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/4a0cf79103e1386ada704b1348d34d4f7825f51b |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/d9707998ae9df5f8db5621ef639d8fba17d355c7 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e64d84bb3fd2039bc5e0f889005730b02302065b |     
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/fd54c0e89847b7393bbe07899656ee856abeb758 | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/fcec0458384b6e971d1b0eb1ae35967c8f6d9ecd | ORPH
  mips64el   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/d8a8e712bd1fce04cadcf1596dadceb1a13a0c13 | ORPH
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d377f32e60322ac6bffea91be9260028a32fdb5b |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8a331bdf3ec310084a57780013faebc3bb628e68 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f1ccefc2bdd7e14b1d1298a0f941501ce47c9011 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2f86b0b09216e92218702821546f3a9be334447a |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/7bc0359a7e6830b8c9ed17743f07a1e9b3b77ad0 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ac1153dfe544ca76f2bf5025293705cf6a2d1e98 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4c1a46d7232a39f52dfe04e0cb1b9dd1ad311159 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/4794321ec0198999ff7435a0ae638960312d8356 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/bba2d5428300e7efb0dda4ba27f70862360eab30 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/d957fe8e22454a705310076a3ecd47d18d4f7005 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/a2d1184090f2100cbe5a08062a8439f2760e1a48 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/85d55af4c8e240138fe57e04c17ba69248af0315 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/29bc4727e2d151d3c409dc79a8f05b64e08cc81f |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/7fe827a55d1ae4df77091ee242d56cd1a94952ea |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/b9a992aa8d423028d09a62551642852eb5c71d32 |     
    m68k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b8b3216b8766da3f36541bc0796c912aac0f8a69 | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/00ac877a413555f76c9c95723e0f6de9c0ad0013 | ORPH
    i686     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/947db164606cf12b60ca1bee9b4656fc9b61a0bb | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/01244ddfa55affa4bc56f7cebeb71acbeef01b76 | ORPH
 powerpc64   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/7f21788fb1882ca402445a14b23a63d341b90b11 | ORPH
   arceb     |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/38b234a13a22d7c1d0d3fac6344e64411995a222 | ORPH
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/f408c488069e73a276a160fe4492066ba952f375 |     
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/f9c9e68c0fd72ed7a5a5b37274380045f4bcf2f7 |     
powerpc64le  |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/1353a9d51bcc4a11a204e89d2f731570e4569cf2 |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/dd40a4b0c6147135cf8ae9cdc6407639da6eedee | ORPH
   x86_64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/552199aa89554557558571ecefb253db09328907 | ORPH
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/f4863048ea590aafe449a60c5b73d4a88e97c4e8 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/8de0275c16d1ce629451ad1c46b4cf671d317ca8 | ORPH
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/195ad1cde8f4d43972524c65fcb09364ae50ad33 |     
  aarch64    |    input-event-daemon-0.1.3    | NOK | https://autobuild.buildroot.org/results/b8a0021c1e5af6a0db10649b1ed055b4a2ee777d | ORPH
    m68k     |    input-event-daemon-0.1.3    | NOK | https://autobuild.buildroot.org/results/61f4e90949ae6bb5a6ce643ac1e1c9bd912cff80 | ORPH
    arc      |    input-event-daemon-0.1.3    | NOK | https://autobuild.buildroot.org/results/c6077829c3c053abcbf40324b331c2e148869606 | ORPH
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/64bb1c22a6f6dce09403edeee99e3f60db69db9a |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/33505a68442e07a18a72f74daa007c0ebfa02552 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/db8b820053a94120103861e68d4cf41a68a44189 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8262a7602f33b3c32ac59787490f6221a85dd800 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/840a45b87b48e706f9234b610e7015467c559359 |     
    mips     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/4cdbdeddf021376906391c13186a3f7e642c26a3 | ORPH
loongarch64  |          libffi-3.4.8          | NOK | https://autobuild.buildroot.org/results/e4adccac5b3c3722898fa5e4c772bcf9fa0d0c1f |     
   mips64    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/c2a3cea8acace0d9f457a9e5d0e8cabb1291e495 |     
microblazeel | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/b58ede402fecfc34aa50374cf116e72d3c708711 |     
    mips     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/fec23b22f93f22fe2daaa4e319c40880759a2bd9 |     
    m68k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/05ec828baffc5cc7cffc0c0be85431367d9a5364 | ORPH
 aarch64_be  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/643112cb7ecfb9e60d7b5e9959af481e8fc7b4be |     
   mips64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9c6e3799b5f9e0223e2542b959b0c3f661d7d3b5 |     
   sparc     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/f17982290b838764a8bc1753ecd94f5d4f2ed93d |     
    arm      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/df49ae64b979ad2345b219d36b0031a8532feeac |     
  mips64el   |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/11d9e371033f7cdd3b24a9c1feb85b6aa921f96a | ORPH
  aarch64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/96b676f837e5bae2660ab6ae4afb40686c290a0f | ORPH
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/5c5c4fcc7c9b9cfe5f7d250a746cfbd71e2ec1b3 | ORPH
    or1k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/52ee2f68160ed6ae663f66280845b03a3607716d | ORPH
  mips64el   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/fddf923175d4ed3b1d7afcbaad4977b948f91503 | ORPH
powerpc64le  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/064afef7aef868752e3a432b686978a184930c64 | ORPH
   mips64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/887fd127869b15128257223097cdb9270dff5d40 | ORPH
  sparc64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/2cb57a71bd1fb6cd9f28074030634d235416297f | ORPH
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/366f9fdb15f2931df2f849cf242733323f9d91c0 |     
   sh4eb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3e9eac1c4ac12f19efbc2a6ef520de307b26bcac |     
 aarch64_be  |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/dacdb73fe6eb98edd62e3a7ab93c6fd36a997ddc |     
 aarch64_be  |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/a7d43bb3e3551d27981bda959a36052b1cde99f2 |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/6820e37a594f4d3cafe9e551fa3d00021f6e4f5f |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/65dd0a0fbb210ba0291da8816da1797b0ecf8f62 |     
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/f25bcbcc10127fa735cc1fd46878eb6e209afe57 | ORPH
powerpc64le  |          libteam-1.32          | NOK | https://autobuild.buildroot.org/results/5b08a1f33f79c5a72e7d99dafa9a318b156a31e5 |     
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/82323453653b3bb5f5de2b4911ae40aacd679351 |     
microblazeel |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/c242a132acb26fabca56dc3a94a0ae5c1711007c |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/a91e398d188621d0003df9a748cd6c433e1e895e |     
 powerpc64   |          linux-6.15.8          | NOK | https://autobuild.buildroot.org/results/c67d7ee09121ef536a407399cf82fa876ccd0f57 | ORPH
   mipsel    |          linux-6.15.8          | NOK | https://autobuild.buildroot.org/results/52b1ccd09736325c49d4756df6ff4706951601e9 | ORPH
   xtensa    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/34fda77fb08b68f695222cbde7bb845e9946f54b |     
    arm      |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/0825f71434a8c85782fa076e17f5ec8141fcb50c | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/0bfe8498889fb653f29bfd85e0d16f4a6d899535 | ORPH
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/4bb0f622953f11824b178ce1eb88202a793e4ca1 |     
    mips     |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/46a99ab3ab58b7aa40d33d380d2a055c828e5d2e |     
 powerpc64   |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/28f825387c5f6d22db1555546f4320ad694af29a |     
 aarch64_be  |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/289d82a583b65f0b26b3370ec6ddf4c5d7bc4373 |     
   sparc     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/702e13287c532a6f774b7447ed017386e9f1206a |     
   sh4eb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/689eb16379d3ab15d4b3b8ad9189d1bd03049a35 | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6c99bc11559d81401a128e45fc368a4cc4e5fe7e | ORPH
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8f8ec1f227a2676f277a37215670948c247e6863 |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/6a944e567b3b98c438fe6903ba06479ffdd935e1 |     
powerpc64le  |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/14956d2bbf482f1d1ff40f6db603297e55a3869d |     
    arm      |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/4c50f7ff0076fc317f2969757b6d7b342a8e3e9e |     
 aarch64_be  |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/77893aad6310770407356239aac809e219ec2a10 |     
   mips64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/14d003e699f2903b469b7f83b821fcce81fdfdad | ORPH
 powerpc64   |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/10f1e14fed088a276999e92fb76c98cb86991669 | ORPH
  mips64el   | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/0a4020a5076acd63ba5cea00c1ccf5d628d34a42 | ORPH
 microblaze  |     python-web2py-v3.0.11      | NOK | https://autobuild.buildroot.org/results/e9c086e369eb4bbe2a01fe470d66370d16cdeea3 |     
microblazeel |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/c37bdceee4a8883f819e333255d15bb5128fe03c |     
 aarch64_be  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/580687c0f7dde050c7fe15d89f4768bcb74d1275 |     
  aarch64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/e2acb64f3d388fca2e630e193401b537b1c2829a |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/9fa91473c50167fa92eed6db04e85c0a0d32152f |     
  riscv32    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/da2de0370fffc3f63687f80ca49f4173f78f1a83 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/1fb34da1a50e26af621c28b7ad2287c1b0866ec9 |     
   mips64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/2de940a8a237f6bff70e152d0539147fb941c69f | ORPH
   sparc     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/f8f28a45fcf3af51e72fab502c5470d6de8f0cbe | ORPH
   mipsel    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/9b778bd2a042d2c479397e2c3336c9327f040847 | ORPH
  aarch64    |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/2723627a0ce2e6693d06ab21b1a517e07521bc76 | ORPH
 powerpc64   |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/663b43792162693d7547fe1f10da77f5f0ef9cfc | ORPH
    mips     |          tini-0.19.0           | NOK | https://autobuild.buildroot.org/results/8d56420e7fccbbd5ee8e8400d0ada1c5be08a036 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ed1ebd653dbb6dcd9d24d6fcf0ccd2f79342a864 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/c052bd85b9bee3b88db8ea5e2bfef1445413e737 |     
  powerpc    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/c1b48cd83fdf944b639cbc638627b60a1378d2f2 | ORPH
    mips     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/b90c71ac0717a37c11f61e0a54c17bc3b04f4715 | ORPH
   armeb     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/91106b9a9c130fa111b4f8d182c0b7120089ae9f |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        b43-firmware-5.100.138 | 1 
               bctoolbox-4.4.8 | 1 
                  cmake-3.31.5 | 1 
                   dav1d-1.5.0 | 1 
             fluent-bit-3.2.10 | 1 
host-binutils-arc-2023.09-r... | 1 
               host-parted-3.6 | 1 
                   perl-5.40.2 | 1 
rtl8189es-6b4cfb5c37f10c099... | 1 
                     shim-16.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/8c8da0c8ff471e6d8ade687f12b44a50b5fbe2c1 |     
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a833cb8ca793b18a10835d50b1db78b153dc0cf5 | ORPH
  aarch64    |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/b11b667f6f1c4feaca60ec06efd4b45535ac9aa9 |     
    arc      |          dav1d-1.5.0           | NOK | https://autobuild.buildroot.org/results/b8117d69b2260e5c38fc0e64eeec37f63a9cb71c |     
    sh4      |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/0b2604d3b6643be0e9334280a49451ceffcb5988 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/73db67460c944a4696fdd41b8de4c615dd948090 |     
   armeb     |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/13ce6d7b275a0f6b66df2002cc5d7c2ce2cbf197 |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/4e490ce71e23a8d02164aebbf7b6f54203d722fd |     
  powerpc    | rtl8189es-6b4cfb5c37f10c099... | NOK | https://autobuild.buildroot.org/results/835973d5b71bb085f62c533867746fc3d6b3a8c7 |     
    i586     |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/964c4c8c6b1d572575859970251f36c126c735c4 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

      passt-2025_02_17.a1e48a0 | 2 
host-binutils-arc-2023.09-r... | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f72f6bb3f0c04032b8ea86712476096e0cd592fb |     
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/40f7b714aeb5bfb31bf6078b9d912474d0fb3ec2 | ORPH
    arc      |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/e602e8f22f2475273795f6cd1667d4ea9e9c4572 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/f72211d45f8ff44bb63c78bf5e1496ab371d7489 |     


Gitlab CI results for 2025-07-25
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531052 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531064 |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531109 |      
                aspeed_ast2600evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531122 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531131 |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531140 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531144 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531147 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531152 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531155 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531164 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531178 |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531179 |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531184 |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531192 |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531197 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531206 |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531229 |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531237 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531257 | ORPH 
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531268 |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531277 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531281 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531286 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531287 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531295 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531298 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531301 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531302 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531305 |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531371 |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531438 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531475 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531482 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531488 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531493 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531547 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531586 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531594 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531619 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531627 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531628 |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10804661638 |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/10804661266 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531866 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531882 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531889 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/10790531901 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805547972 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805548117 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805548189 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805548314 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805548414 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805548438 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805548511 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805548620 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805548706 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805549372 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805551704 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805551742 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805551822 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805552987 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805553057 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10805553130 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

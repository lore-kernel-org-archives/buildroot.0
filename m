Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8A1C83F17
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 03:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 443C0843F5;
	Thu, 31 Jul 2025 03:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHzPpY4yR4R8; Thu, 31 Jul 2025 03:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53A99843EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53A99843EC;
	Thu, 31 Jul 2025 03:18:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36752168
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 03:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2667B41DDB
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 03:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0ErBjd3XRLA for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 03:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4228A41DD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4228A41DD8
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4228A41DD8
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 03:18:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aef575ad59eso66655666b.2
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753931889; x=1754536689;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6bltuw8EyKqShnpjxtIlvGGJPjjy6yrSkq+8lfda2Aw=;
 b=mBcLy5G9StJCGa6A4f78q7p4s1Of/r/0q3x5JZ3pf4x8RRyBnJ+rQTZRfSZSWdV8hr
 /wDpc1+5ElHj931MoFVWIQZdWc9snQpmtIAj0K2sX7K5NlO7+8t39EJASYIEop75XCp9
 klsb/OxALHbht6f+7zShTVDsNUzWzx2ux4Usq/uBhJI7+PEpS4LQCuN6kQjPWuRRRawB
 yBc1EOxpDL2uJs8pKY8CQIi8CvuBhfoi8NKK81vdbhBCFbgyQQRde4E6nO7R02irDb//
 dCcU+C2l0WLpe9T++vDdNyFtJaYsCny62CUqurzoLtscaIHgErhzZq6OYeGIygK5ajSL
 UKbA==
X-Gm-Message-State: AOJu0YxXsosTlVubIjGqENExFPMBkJNZu3IRWJ/1FbftirgGTnYqUxE3
 KAXwhRnryfc8hAudFjzO8WTL/fRh3YlmjU9K/U2ffBpKvYNtze40ccSkXZYo4g==
X-Gm-Gg: ASbGnctuXdaQ0uym6GN/evxYxKGKjFYC5PCMbXyqCtrcbg0jG1g8KaBOUdZ/70yUwoU
 hzN7uS1+ZeIMucHkKLmUJVF2+pCJrTz5PTHir5zBGt4NGgDED+WhKi83S7C8fH9Kn7QMeVIjW1Q
 01RwStGrvDVt1s9r+n49HoiRZJB0bdhGxQJFaxDaEgcDL66kCkBTWXh/VIyZOKaT57G4B8UOaUp
 Isy8t15qShfjk99RQykYELwOs4xbBskKCCsAiPX1OMJxj0QXx1mKC+LLlOnKvrj97A5EWjtIO8U
 yL/FjtSXXuUxJGUiNNkY2HEiV+fHjv8Ptt+KYHEA68g3zjQhjh9+08xq2/sJDw6j98teX+xq3Si
 iIBI6T+HI7I5RdAqpr6ajZtLgSA==
X-Google-Smtp-Source: AGHT+IH0XTHrdKOZXck/wBkU5YBsmKC5JY2cm07v453WVC4szT7jGmpJ5x8fNkrJi5gRRxzio088zA==
X-Received: by 2002:a17:907:9406:b0:ae3:74be:49ab with SMTP id
 a640c23a62f3a-af8fd690f69mr748452266b.10.1753931888716; 
 Wed, 30 Jul 2025 20:18:08 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e82a5sm36996466b.82.2025.07.30.20.18.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 20:18:08 -0700 (PDT)
Message-ID: <688ae070.170a0220.17e014.18e3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 31 Jul 2025 03:18:08 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753931889; x=1754536689; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6bltuw8EyKqShnpjxtIlvGGJPjjy6yrSkq+8lfda2Aw=;
 b=Ga8xOi9EwgnktM68crGtHItyB6xM1/fXiCP4eJdNArG7zqUMiZYFD07radxdmqtK6m
 mfuwdsBcS2ymM+NNVMMghyVanhITpvrgsjlEZfRInaDo29SLnAHf38ccNVhKvotDj36l
 efUYR2pJqDl89uow9WrJ8bVSuPcb7KbrRo0uoXIjuyDK2t7NiOWIWlmvLcr3EGln24PS
 Bn4aBB2aGPtTAxi+47veBEVM+k8b8pqbLv1VtJL/bnRH5aPsMY54WwrZu3o8OanqMUHF
 5w8hoDo1TWR4Zq/fWQxkf8eAo1B57R+DvrTJ2OU16WODn6tlWRUhzLSIbfTzgeA5Byn7
 568A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ga8xOi9E
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-30
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

Autobuild statistics for 2025-07-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  5  |  0  |  7  |
  2025.05.x  |  1  |  8  |  0  |  9  |
    master   | 20  | 123 |  0  | 143 |

Classification of failures by reason for master
-----------------------------------------------

                 host-gdb-14.2 | 5 
        liblog4c-localtime-1.0 | 5 
                liboauth-1.0.3 | 5 
                   cvs-1.12.13 | 4 
host-binutils-arc-2023.09-r... | 4 
                       unknown | 4 
        vulkan-headers-1.4.317 | 4 
glibc-2.41-5-gcb7f206537240... | 3 
  gobject-introspection-1.84.0 | 3 
       host-gcc-initial-14.3.0 | 3 
              host-swipl-9.2.8 | 3 
             libgphoto2-2.5.27 | 3 
              libselinux-3.8.1 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
                    linux-6.16 | 3 
            netstat-nat-1.4.10 | 3 
                  prboom-2.5.0 | 3 
                   bash-5.2.37 | 2 
                  bcusdk-0.0.5 | 2 
                    gpm-1.20.7 | 2 
         host-gcc-final-14.3.0 | 2 
libdbi-drivers-0bfae6c43134... | 2 
                 logsurfer-1.8 | 2 
          sane-airscan-0.99.33 | 2 
                   thttpd-2.29 | 2 
        wireless_tools-30.pre9 | 2 
               asterisk-22.3.0 | 1 
             bmap-writer-1.0.2 | 1 
                 c-icap-0.5.10 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
             docker-cli-28.3.2 | 1 
                     dtach-0.9 | 1 
            ecryptfs-utils-111 | 1 
             erofs-utils-1.8.5 | 1 
                flashrom-1.5.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
                   gvfs-1.57.2 | 1 
          host-binutils-2.43.1 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
               host-vde2-2.3.3 | 1 
                jemalloc-5.3.0 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libgee-0.20.6 | 1 
                  libjwt-3.2.0 | 1 
              libopenssl-3.5.1 | 1 
     libphidget-2.1.9.20190409 | 1 
               libsigrok-0.5.2 | 1 
                 libspdm-3.5.0 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
                  mbpfan-2.4.0 | 1 
                 netsnmp-5.9.4 | 1 
                   perl-5.40.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
             python-webpy-0.62 | 1 
                python3-3.13.5 | 1 
         s6-networking-2.7.0.4 | 1 
                    sdl-1.2.15 | 1 
                setserial-2.17 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                    sslh-2.0.1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
               syslog-ng-4.8.1 | 1 
              tinyssh-20240101 | 1 
toolchain-external-bootlin-... | 1 
             ufs-utils-7.14.12 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/fcd6eb458c85439ab5141291a29b7d7f76e99d64 |     
  mips64el   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/59c0146cd21f86f4272b8414679984b3bfc8a7ac | ORPH
  powerpc    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/570ca74397377452a779cf48c30677e5ba991ffe | ORPH
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4fed8f086dfe0d68531c4d554f092819610941c5 |     
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/6f1702daa531392d16c27879905789a4dce9996e |     
   mipsel    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/db606376712a8deb5cd90309b87e36e0ff242aba |     
  aarch64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/728820dad8d36e7c2cf77b4a4432bda46e07154b | ORPH
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/1fa6580bca8e7cb70b1989eeb8a6ca520bd510e7 |     
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ab76eeb3eccdf0949b8d665cfcb50801885da648 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/53656d7ae9e04d1985b848603e6a06200841cd70 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cb17e118f7036da23b0c0b5f06ff63b5cf9b9907 | ORPH
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/27ba72e0b7085ae73842c62ffd8c3a19d73b7e44 | ORPH
    arm      |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/972da801bbf05cd4bb473a5b2b9ad502f49fcb10 |     
   mipsel    |           dtach-0.9            | NOK | https://autobuild.buildroot.org/results/346371f5f49637b67344a4abdc4c53631a1bec0d |     
    m68k     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/8b657a77fd78fcca69be4427a0ad4ba80fbdfa38 |     
    arm      |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/2a0554dd860830f6b505743bdad3f0b3dbbf9341 |     
powerpc64le  |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/2a11f5548c4ae9c5d4c66257e2376b4ba5f832cd |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e01cf5b18c748245c353ec825afe41ccfc8daecc | ORPH
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/11ac12e5e5be41c6b2e6e3b5667870d675cefde9 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/638a0f17d8eb1e045d5eea8e025566d8c30874e3 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/d2d75ba9941b147e999cb6b05c74ecaebc7580cf |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/af015cf308efb6eed2e7cfb400f204dce34a9ef6 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/de46e8c575784bf7ba57d8c658a13bf0f8f62754 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/32fb2fa0ffe30ac4c602f9c510294e90e068d953 | ORPH
   s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/704cfa06867900f571fe417054fcf4b5c4694bb2 |     
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/95069981a39b93a0bc0ba872b25c307f32ba54f8 |     
   s390x     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/a9f017c1dcb141c43943c2a3fb98afbdd3e22202 | ORPH
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c8cb9765d508133757c7984456dab6d5cf77d177 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/772caa910bd48e015c9eedbe2f1d65f5beee6c8e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4f83c6c04f364431455a4db421a70bf48f51ca39 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ddcf3e81b23598156235f11b9e879cd625312ff8 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f9b7e1d773e800d910a7e9887fb518c82b46f747 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/cf56c37fabcae964dbf4f96eb43a7e4d964452b6 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/f21f04d16661911bade015b0a997dc344670c468 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/7f9d99a5a688921465950b86bd1aaca8c4dc250a |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/ed02ceeae869d1db8158bd7b701a3e6eeecc7319 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/f98570293823867e6c43a1672e1a4b43ca1e4be5 |     
    m68k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3156cb1986bf3319061828e8791471cea6ac8523 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c038301b5e410aef04b2b82454724706a285505b | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/96ebfdf9b1ede4b00b9e968a08108f60973f1274 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/90411345a0ec061a368dc9b5e377ee336f4932fe | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4436d05efa0552f3636c784f229f36b609f3d18b | ORPH
    i686     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/0628c41ea491372e44619eed0cf0608f62d0f653 | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/45b09cba6530497b5c75c205533146b5cbb6a737 |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/63a6d2d419fbe83608f5a34caa9d677f3796b787 |     
  aarch64    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/440af1e3da8a0b331c416bbec29afc342d37a1dc |     
powerpc64le  |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/cb3a1e5e014b6be5e17b13377fa4275f9693621c |     
    or1k     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/ab58f1df785e81f240f0b7dd2fb3e40c1b9de00c |     
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ba51c8e74c9b1ccb04c612d57722723d474cd175 | ORPH
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/1eec888804af615ed61881c6489a789b7cd1b463 |     
 aarch64_be  | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/ca5b3a7e64beb17bd97627305c371a7aea145149 |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1c01a2acf41caa9c170fec1e709f413624f5a00e |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/79c0f1d7bfafe026095bf68a32e2bc887fb20264 |     
  riscv32    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/4ec70e96f04fdad7ecd7db0436c5c03bbc4a6fbb |     
   x86_64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a1eb94d80513b04635eea08f31953ccb217b8347 |     
   sparc     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/12041e38c9936895a3343d39daff209aa28771d6 | ORPH
    sh4a     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/89be2c9d86787061c42e1e7abb2b1b13298d7c42 | ORPH
   mipsel    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/eb17835a619ef347ef6d7c9606f4d6689f649d08 | ORPH
   x86_64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/d5f1a6cdc70de254814a7f9ce2c0637963af061d |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/39f0597ea827c93b0337be3a00acb94d44c3012a |     
    or1k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/89a7bcb4c9c585f88994e634931921bae19fc65d |     
   armeb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/26483363b42532e94b147e9eb9e5d167b70df7dd |     
   mips64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/f6ae5c56dfe2a9ff5ff3a54a11735949ca0eeb02 |     
   mipsel    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/c0efd3f7ded987750b5fa1c61c5c44d513c22990 |     
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/b59ea86c79b8bbf68d23cf0c25da4ac39860f9b4 | ORPH
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/bce6e449e0c92e7dfcf7a647ed0885115692cf23 | ORPH
  mips64el   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/02da1b44ecb8e6d3fb4be77cb674d9228aeb0bd2 | ORPH
  mips64el   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/dab1adacf56ea8b5dcbf1439ee52ee0c047871d2 | ORPH
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/e1914107098a36ca8fb137d6e1dd7eaa5337452d | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/a30de9704af2a30234366d42d4f4d4be15b8079f | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/71d60c46bb96426e48cde75771c21e8774701338 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/624a919f9e9fe2fe363a8c41050088b5c191c92a |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/504068d4a6bc2b169a2f6ef75dc15368d64f62ae |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4d6f4dcac5cb015e6c53faca8930e348dbb681a6 |     
   s390x     |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/21c3aa1c19fce4a7d3b5d37310f60edf79d119d9 | ORPH
   x86_64    |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/bb791bcd5bfae05e12c45ac5c6f10e5bd992a614 |     
    or1k     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/df232caa8bd54f22dc7ac899f062142df895e39e | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/98e7ea886e88d2f7dc28b1f781f54502b6274a34 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/d8fc4a61cd9b88889a9582f0ceb6470cf88d98f9 | ORPH
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/5c4639e66505d9bc2b440bfa85898341bcf8bd3a |     
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/98db54620035d8c14606e32a096a5f353b1d97ee | ORPH
loongarch64  |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/cf486ee4aaaaaad28865f69bd3a3d4be919c26bd | ORPH
    i686     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/f9f0fd7a86e6d34184dd4b02512f2de94e5759ef | ORPH
   s390x     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/a33ce594db4a651ad65fbfb897a7e432a90bdc90 | ORPH
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/c29d665a86227e076fb62ad103497468b504fb40 |     
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/c346933ad0a850d49afe7ed207a0f6eca6f50ab4 |     
   sparc     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/c9027ef1348fe480798c8bd52f9848f970b9cba2 |     
 microblaze  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/ffccce90461ad68c1fcb3059d88e33d7be11ed4c | ORPH
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/3bbfb0378c408aa6d5c4d946f2fe85cc52761e89 | ORPH
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5c61dd38abfa3f21a8015d3002b457951ceaa568 | ORPH
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/939f1ba524653e734ad8ab0a24d8f7ae44112664 | ORPH
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/6d6f53a89deda2ee125b3fe3bff2c04028dfd8d4 |     
    sh4a     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/90f9273ce534a4ac7ffc2bc84050c20918033c60 | ORPH
 powerpc64   |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/94a73dcb7739c014493baa880e5b9f4caff178e0 | ORPH
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/3884e57a3c6da87af000bd7b70ae76b7dcda31dc | ORPH
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/56c48bffcd1342d4bc6a1916e0a98387adbd4115 |     
  mips64el   |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/0083478b1d48eb1b89046e5c000a69deee4b80d1 |     
    sh4a     |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/e149c2c0104900f44d50ab177ed4217bb1889c4e |     
   armeb     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/7035a061e6d17aa879d8f7a8d400a7c0ab9b128c |     
powerpc64le  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/fa348eaaff3733a5f53bec4ed9d8ca9e6a0f7321 |     
   x86_64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/4f520019921678709ba1841c5f728284e9ada3b0 |     
    arm      |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/a5ddecf56ea0d91fce67e03d086f0352ac26067b | ORPH
   sparc     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/07cc5b98fafc6ed8c1150692ad2179bfdb74b93a | ORPH
microblazeel |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/5bdd1882791e405ef7a518d53684f3d9996eea67 |     
  powerpc    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/3176530dc856e90310efc08297b24effa277cfad | ORPH
   x86_64    |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/121086de2365525d7585a151315bebc8013c3f95 | ORPH
    arm      |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/dea17dac8722a9b38cc93f32ef04a32289459c1b |     
   xtensa    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/795c232f8ec3144e95f15074d44967ab45d13d43 | ORPH
    mips     |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/cea7e2a52d3f5a1d653d840a556c1870bbc94adf | ORPH
   mips64    |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/d69c032dcfad06b797955121cd88db05ddca7a89 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/7d5b03c878c272e8fa6fe81412c0e417e23db123 | ORPH
    arc      |       ufs-utils-7.14.12        | NOK | https://autobuild.buildroot.org/results/429a28669d98c6f424f33a211eb0ebb48c6f4553 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cee29a038334abb7524d8b619abe6f7673930013 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/44bf3a59b3af4d69d41ab39d8ade1e44912929a5 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/837f04f674f7756bb561c59a8d9eeb1eb1839517 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8e034492cad361ed1d1c924a8b49437fe6706eec |     
    m68k     |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/77692c73004c813f7aa5eed77c0ed3df03065d52 | ORPH
microblazeel |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/22f95584dc82ed58052cf4f43535aef5800f46c8 | ORPH
   mipsel    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/93dc4c0be93d91d642fbc7780b8fdb6c191878da | ORPH
microblazeel |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/8f093c2f432b2ae786a84b7f3b95a052519800ab | ORPH
   mips64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/ef778d46b024032b767ae056b442ef0c5c7dcffd | ORPH
   armeb     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/63398635d0004232c5ef29c1bba9a6703698ea33 |     
   s390x     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/175ec5ed1cc882eaecbb2299d0e473069dd14794 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

       freeradius-server-3.2.6 | 1 
           libfreeimage-3.18.0 | 1 
                  libsepol-3.7 | 1 
                       unknown | 1 
                       zip-3.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/751d628ec99883bb360d3067c30be67da957843f |     
    or1k     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/c9990301a46e133aa6daf08e1a8476842444ead0 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/27ca36989532858c90e2d481e779293aa4064faa |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/c54fe4b80c6a9cf8ce79f5a8742c6f2997a61b30 |     
    i686     |            zip-3.0             | NOK | https://autobuild.buildroot.org/results/0fac1cf80e19ff47bc394e851e1a4ae416b03961 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              host-guile-3.0.9 | 1 
              host-rust-1.86.0 | 1 
                   iotools-1.8 | 1 
             libmanette-0.2.11 | 1 
              libopenssl-3.5.1 | 1 
                libsepol-3.8.1 | 1 
               libsigrok-0.5.2 | 1 
                 linux-6.14.11 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/222f5099f06cec4bc466fa043b55b8ccd42f7fa2 |     
  aarch64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/15b9d46749c97bd060684f43f429fcbf88ef7923 |     
  powerpc    |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/d09dac8ee99949d7014889f5974036b817d0da15 |     
   mipsel    |       libmanette-0.2.11        | NOK | https://autobuild.buildroot.org/results/667663f91d156ffcc5d80de1ed8cd6632a929d6a |     
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/161740d4754b71204f67cd5a304b63d1919f77c5 | ORPH
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/ea54449c27bde63c7abec178ba803051fe319eec |     
 microblaze  |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/d64b37539f4930b955f2216257beec39cd96491b | ORPH
powerpc64le  |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/bf3c05035763a2aed0a1780a71d6419ce4740e7d | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

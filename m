Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776B6E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 04:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B47260761;
	Fri, 13 Dec 2024 04:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbetr1DSy5EK; Fri, 13 Dec 2024 04:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1764D60738
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1764D60738;
	Fri, 13 Dec 2024 04:15:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE6F875
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 04:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F0E581E0C
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 04:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lh7idhgTdksh for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 04:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4444281E2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4444281E2F
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4444281E2F
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 04:14:58 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so473123566b.0
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 20:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734063296; x=1734668096;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vfH2H7dqyoHSmeQckae/pTiK8uA1S5N2zNM7/Bqv2dM=;
 b=pd0Vcvv0WRbtvhOUseaVDousP8wXE6X5h8rveg75EIhQ4rNcDi/7fiJoBqnrVuPLH0
 a6AFJNqdnqVhCGZojSenFc4cAa9DKWt0rTdk7SgdvMyLq+e8m+6o5oGBhjlVOSQ5zDxx
 nuLiz+EexI8z5TLOhKF95SqmWJUd/2cb2aMKfKdlUTnkaIGhXSlNA/xQ30IHKdh1HKTY
 k7V08k5H/JU2Zbz1/hvGfHRpfzz7lRduXQk5Zwa71C4AA9eIqcJQlfZOVHsb5MSI9rP8
 2fde9YbC7jOVhpkiL20AHrzvASISGdRVv/KUShEvs6QFvclIq1+iGbIV1WHwxNG388pQ
 rM2g==
X-Gm-Message-State: AOJu0YwYLdPuc1kBwFeofbRN2KbaRmR42VnxLAeJKa9GQex6+L2Pn5j9
 dzd7I98YOZy7Kafute+cmosDW2bP3AlaDWdAykf9uBsx5Bb1gDHs8IvuZg==
X-Gm-Gg: ASbGncvfL34uX/Tb27q9YOwE+O3rAG8BKbxuTBd7vcvqoVGQ0BSnNPnIIe/EX81TIUN
 QgjxS2PXHr4ny6m4p7/e/QAo0V5EmZZqj/4EGi6AagDf3TU5NgRmN8WN1+fH6ApCT6rKaKIGs3N
 ShoaS/W6PHOS2oJG+fGeInZGrL+W7UGtNuiw8T+vQetTdC8eLLKZspIAzApoxHmb6GM8DAPawA3
 kc/+L0atu7i9dGUF9Vmw0TBJWP168c2Esp4ksmtxAn7fQwS++9FxE8Fx2bn
X-Google-Smtp-Source: AGHT+IHmD115R1KuDGn+qvcJaoj+x7z+D8ngwcT0yOqRMLOGV+NNx1bjrDB8koXwDC5sQ4JHunuLGg==
X-Received: by 2002:a17:906:18a1:b0:aa6:50ee:d44c with SMTP id
 a640c23a62f3a-aab7b75deeamr74799066b.15.1734063295749; 
 Thu, 12 Dec 2024 20:14:55 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa66c646defsm821680466b.181.2024.12.12.20.14.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 20:14:55 -0800 (PST)
Message-ID: <675bb4bf.170a0220.27a1c7.5775@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 13 Dec 2024 04:14:55 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734063296; x=1734668096; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vfH2H7dqyoHSmeQckae/pTiK8uA1S5N2zNM7/Bqv2dM=;
 b=ZBkGYtqqBsitK7iCyj5kcUGWtsR0d0ziI7jZ2dA1zSmZIO0yQZW1ehccH8dWBtBBb3
 HSu+m2RHFjOXPA7U3nYAcfcqelumdae3kpB18W/VKL2G05ui8Hqy3qeBWzqzsXzXFWFz
 eVOeX83c6V3sYnhHY3vZnSf4MoLv04GU9gUq0RAb+UqAJEH22bAz3eWFWI2JT3488K2B
 yjYWOHHWSKIHrbxToLbMOaY/gSXA0uHIEFp8SNnLDRn36CyFAqjWEgMbqOMICcruTMdE
 GkPFeVvg5QYt+bZ8ViDbc7WUVOSIFInFyLT6EGlE8vqDH9TMUREF0wgwByfNce7k/Anr
 PTug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZBkGYtqq
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-12
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

Autobuild statistics for 2024-12-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  2  |  0  |  5  |
  2024.11.x  |  2  |  3  |  0  |  5  |
    master   | 10  | 295 |  5  | 310 |

Classification of failures by reason for master
-----------------------------------------------

             batman-adv-2024.2 | 15
                  linux-6.12.3 | 11
             util-linux-2.40.2 | 11
                    mpir-3.0.0 | 9 
      python-autocommand-2.2.2 | 9 
                   foot-1.16.2 | 8 
               postgresql-17.2 | 7 
             alsa-utils-1.2.13 | 6 
                elfutils-0.189 | 6 
  gobject-introspection-1.76.1 | 6 
            host-binutils-2.42 | 6 
                latencytop-0.5 | 6 
                   perl-5.40.0 | 6 
             dahdi-linux-3.3.0 | 5 
                  ffmpeg-6.1.2 | 5 
         gobject-introspection | 5 
    host-python-greenlet-3.1.1 | 5 
                 libv4l-1.28.1 | 5 
               linux-pam-1.6.1 | 5 
                  bcusdk-0.0.5 | 4 
                  curlpp-0.8.1 | 4 
host-heimdal-f4faaeaba371ff... | 4 
              libopenssl-3.4.0 | 4 
               libunwind-1.8.1 | 4 
               procps-ng-4.0.4 | 4 
           at-spi2-core-2.50.0 | 3 
                   bird-2.15.1 | 3 
                 c-ares-1.34.2 | 3 
         host-libxcrypt-4.4.36 | 3 
                libdrm-2.4.123 | 3 
                  libnss-3.107 | 3 
               mariadb-10.11.6 | 3 
                  ntp-4.2.8p18 | 3 
                       unknown | 3 
           alsa-plugins-1.2.12 | 2 
              armadillo-14.0.3 | 2 
atest-9ff52ee5d7764984e21fe... | 2 
                    azmq-1.0.3 | 2 
  binutils-arc-2023.09-release | 2 
                    brltty-6.6 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
                cryptopp-8.9.0 | 2 
      docker-cli-buildx-0.16.1 | 2 
                espflash-3.2.0 | 2 
                gnu-efi-3.0.18 | 2 
             gstreamer1-1.22.9 | 2 
          host-binutils-2.43.1 | 2 
              luabitop-1.0.2-1 | 2 
                   mimic-1.1.0 | 2 
           oath-toolkit-2.6.12 | 2 
             parsec-tool-0.7.0 | 2 
                pipewire-1.2.2 | 2 
                 pixman-0.42.2 | 2 
           python-daemon-3.0.1 | 2 
                ramspeed-2.6.0 | 2 
                  snmppp-3.5.1 | 2 
               valgrind-3.23.0 | 2 
                     ace-7.1.1 | 1 
               aircrack-ng-1.7 | 1 
               arp-scan-1.10.0 | 1 
                  assimp-5.3.1 | 1 
                  bitcoin-28.0 | 1 
             bluez5_utils-5.78 | 1 
                   botan-3.5.0 | 1 
                  brotli-1.1.0 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2024.9.1 | 1 
             connman-gtk-1.1.1 | 1 
                   cvs-1.12.13 | 1 
                    dust-0.9.0 | 1 
                    emlog-0.70 | 1 
                 enchant-2.3.3 | 1 
                 erlang-26.0.2 | 1 
                 expect-5.45.4 | 1 
                    fcft-3.1.8 | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-86739f2b3ae9... | 1 
                    flac-1.4.3 | 1 
              fluent-bit-3.1.3 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
               graphene-1.10.8 | 1 
                   grpc-1.51.1 | 1 
                 hiawatha-11.2 | 1 
host-binutils-bare-metal-2.... | 1 
              host-rust-1.82.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
                   iotools-1.8 | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
                   libcap-2.73 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libdnet-1.18.0 | 1 
                libesmtp-1.1.0 | 1 
                 libgee-0.20.6 | 1 
                 libjcat-0.2.1 | 1 
                  libsepol-3.7 | 1 
              libunistring-1.3 | 1 
                  libva-2.22.0 | 1 
                libxml2-2.13.4 | 1 
                libxml2-2.13.5 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
                memtest86-6.20 | 1 
              mosquitto-2.0.20 | 1 
            netstat-nat-1.4.10 | 1 
               nfs-utils-2.6.4 | 1 
               openblas-0.3.28 | 1 
                 openssh-9.9p1 | 1 
                      opus-1.4 | 1 
               pulseaudio-17.0 | 1 
                      pv-1.9.0 | 1 
                  ramsmp-3.5.0 | 1 
        s6-linux-utils-2.6.2.0 | 1 
          sphinxbase-5prealpha | 1 
             strongswan-5.9.14 | 1 
             subversion-1.14.3 | 1 
             tpm-tools-1.3.9.1 | 1 
                 uclibc-1.0.50 | 1 
                    uftp-5.0.3 | 1 
                  whois-5.5.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/5033b87034abdd520e61b9a883899cf10dcace9c | ORPH
microblazeel |        aircrack-ng-1.7         | NOK | https://autobuild.buildroot.org/results/be536d337b35c6127743091d322c182eba9ce6d4 |     
   arceb     |      alsa-plugins-1.2.12       | NOK | https://autobuild.buildroot.org/results/b6f3ae382585b0084c6006109c79fc4a1d0715b2 |     
   mips64    |      alsa-plugins-1.2.12       | NOK | https://autobuild.buildroot.org/results/ef93c148b22b13fab42470784b10ef261438cc07 |     
   armeb     |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/6e556b823bbe30117ddee7f293d07a7ecf0ce62c |     
   xtensa    |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/df422e06a85803ad33a775f385ddd4f015013fbf |     
  aarch64    |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/8de0b2c8b2102a6dc8b61e91f043944b95498094 |     
   sparc     |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/a197806b2e41c1f3d2984bc4fa205efb6311ef20 |     
   arceb     |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/4a77b786f38e455a2799f5722801583936485a3a |     
  mips64el   |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/378cc0e0f86d37adfd24d21d9de03d51eb7c3940 |     
  riscv64    |        armadillo-14.0.3        | NOK | https://autobuild.buildroot.org/results/584f639e4cc0c650b0ebea72eecffff0d01beb52 |     
   sparc     |        armadillo-14.0.3        | NOK | https://autobuild.buildroot.org/results/0f024d736a6c3f065ce6fae39d5bc7701e4d091a |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/9801293e4ba745ee073a8e22b9c8b90c9df077e1 |     
   sh4aeb    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/01500c14428360d17279adb013e0070a08f36d6c | ORPH
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/3a32da7f1f62d418bb483fc68d8ed065170e7719 |     
    arm      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/a5ab8859058ebe56b516efe57248123f503a5f8e |     
 aarch64_be  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4adc46cd825a013f1d575db113c912abfddff85c |     
   mipsel    | atest-9ff52ee5d7764984e21fe... | NOK | https://autobuild.buildroot.org/results/5f899810d6a04f10ea3bb8dbeb14ab20d707860a |     
    sh4a     | atest-9ff52ee5d7764984e21fe... | NOK | https://autobuild.buildroot.org/results/3031df792d74b1f3dbd579a488f622e5b228a8b6 |     
 microblaze  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/6c9b9ac68d17c7bcc94bf0c9b6fe43be537e040f |     
    mips     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/56eaebd0d84c2dfd849d14ba93148beb627857e8 |     
   armeb     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/65f35bf63acdeb370ddc4e2c01ae14408e902b7f |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/9ca26d9bfb3b60fc0e86e4afbcd67d3d1d1dd223 |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/bb83d86b650484c3b5c8f1549949c6571457a70e |     
    arc      |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/24ef53a8141b0a897c57344d14bff8d14e1a4fa6 |     
 aarch64_be  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/5bf728dbc3bfd0e87759cdf12c19d5a6091f1031 |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/9d92c7682ee5043da52cc28a0e32aabc9080f2d8 |     
   nios2     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/4e0802260eb229f1c3793f418e1bc204b81ac1de |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/a02017e3af28a7d7cbba2e97f48e258ccaa00ced |     
    sh4      |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/523f3b29a1b5f9d3c980491e92b6391d9f0048ff |     
  riscv32    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/a533709212b61b22347e5290d5cfa2a20b18adba |     
  sparc64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/3a43e81620f0316bdfbac1912fa5748234cb321b |     
  sparc64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/4e46ae99252dd5b9907b5ffef435aca456bd5723 |     
   nios2     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/856977a62018ceab138dfb0380c947149ec3c552 |     
  riscv64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/bdbf24561f3cf07e6658f22637c0c08089a01923 |     
   xtensa    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/d7d88b010ea73cbcfc68e86886b7bd18f4996a69 |     
   arceb     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/33a8b943f849e25a43d3f101052c9f5ecb468a54 |     
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4d57efa5990106711b2e31f4a3b1ae71728883d8 |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/473815e75158fb1677be7e88df94e2ce5fd91d27 |     
   mips64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/65d2d1976fd8acae7a6dc6cda9c36291b10e51cd |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/b3814505eff5104a5837f0f8a2f0b3eab487f4d8 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/e714311b4f66fc23ef63bcb8e45416b51d14dc61 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/804c152213d07921c0b478cae5872478cde2886a |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/75842444fadf0f53ad5ab82dfacdee0e8c43b05e |     
   armeb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/2d4be44d649ab5a3113a5820f5034a1c5f4cf29d |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/6e08c9ed6be49dbe7aec8d50148c15cfe4697dcb |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/e3ab1747d940132b2087b5a8b851f704315027ac |     
   sh4eb     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/3d1d8c9240f8a6e8dd927b3c4087689e4328439e | ORPH
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/7b4df2cca6150182035c6dd640602e64e86beb8b |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/be66986b859385726c2b1dce28582593d3af95ec |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/87a9c9fd5addb1084b637a69e0a78f1883685ce9 |     
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/0a3e7c11634aecf417e966ea16034b5fb18f42e4 | ORPH
 aarch64_be  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/5ecd8636361da73c62e34b5c11b5af8ac8e5417e | ORPH
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/d2bbea49cac73a46bd8d42d417c51df487e2c49b | ORPH
   nios2     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/3ef4a56048dd0c930b2811f3a2825cbc41549b15 | ORPH
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/876c25f0dbca95e0302461cb3e5512d495ab9f72 |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/53f2ba8d9b5ff553e29672540b23d17271e11ee1 |     
  aarch64    |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/3590743078b334929ff4bbe3c0dfe09e6d6716f5 |     
    arc      |       connman-gtk-1.1.1        | NOK | https://autobuild.buildroot.org/results/c237e2ac9884bf7c58cde9f7ee4e8c83aa65a973 | ORPH
   mipsel    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/4ab770466d2b2f24d3958759371c2e25e158275a |     
   mips64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/1aa4e442b1c912ae92404da2c5b69b1c680d003b |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/2f65ea304ff78b70f6bb4cabf44316bad0ad795f |     
 aarch64_be  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/2d2db1d060ec779a4cc017bc583278a4ce2fdf14 |     
   s390x     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/575bf927dbd886ef791f4103c7e702db66662d79 |     
   s390x     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/df6b6b6d3e394feb9c65d7e979b819d8677502d6 |     
    sh4a     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0bce76ce4945b231393d0c5179f4c04204f303b8 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7760fd7b25d5fa5d5c6b323a6f5e260302664093 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8b995cd7e83507171b98f739b3dbc46f587cae4b | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6e75691877383a0db0083ed62a14128295c92ec2 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2230d7de0516b879e610b2389e3ac388e800c825 | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/76170aaf940357337f1cc1db6790964f70c38727 | ORPH
   s390x     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/bddec5a36ed3673e0ce4192f15d8b5fa33490882 | ORPH
  riscv64    |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/9eaff4cbc252e27bed74ab10d187fa0c1a40320a | ORPH
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/d80ce1a101bc0cb3f19a8df98df419031b57548d | ORPH
microblazeel |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/31027356311f3ca696c9c541ae4a8f47f699235f | ORPH
    mips     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/5e5795a0f038aa069f60dd473e99ea33a8075b94 | ORPH
 microblaze  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/3f220896d830e3688fcd02083c6a1e8c8295297d | ORPH
    i686     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/52e39dd8f2b12509b43678692007d7895d53da6b | ORPH
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/d77fe2098719232cf6f6f7b14c976830204c045e | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/503ca63fa3e5798d73a90d0421443560b9e68bd2 | ORPH
 aarch64_be  |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/27ef21e8a9f3db90046cdc74a6c289b83fe59f8f |     
   nios2     |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/17cec21115df9371003308e2a4ff9471e497ae37 |     
    arm      |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/9b3e7012aec68ff86ee1adf44a117f9a0b3d7a7a |     
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/3a364507dad9763229e61aaa4316ff42ac1ac1e9 |     
    i586     |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/94139e9f8303bfeccf27830cdff8b5660a5cfda6 |     
   sh4aeb    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/d9908cc9156be4d0b07c41b204949971f75e75b6 | ORPH
powerpc64le  |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/762ebaa81f1c325ea77a9d1b59bbd92a08ab5555 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ee256d955938310647f9f2f2b4348f91ddf9388a |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ca8d1cc46ea1f469a4cd828161e17bbc4c1361f0 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0b7aa040d7a54b62e433d8a232e17019053f94eb |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9efb229cf1453a41d4c4f49f24aa505a44d80cbd |     
 aarch64_be  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/86f197a7e2cde312cef02023edc9c57c6ba4806c |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/6227baa9f34ce00236609abe966eed6cf7a52281 | ORPH
    or1k     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/4379d9f81b99a972ea01403798df81227a3ecde6 |     
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/3cfe868a323bf09fe7889c6af4c1ead2c1c78721 |     
 microblaze  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/ee192864b10266b9c2896be20b45611eec8ff5f8 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/705b2a25bf1fc52c4180be4d0c75ac775310ccbd |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2d5cf03a2734cd92913070cc0f76c235195deaa4 |     
   armeb     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/bbfa59009e93e6fe86c3b2412e35220656e5962e |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/d4c0c1f76d62579b974b368af6b40635d03788b6 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/df8425b5e53b3f146c46bc76ef310afd9ef770d3 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/d8e1e328fbf215aa6fbc62c35163bbbcc341e2bc |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/6a3ea6eded99ed71f4f19a8647447f44d8bf0c3e |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5529416b2233c2977998af99806cdd38cddf52a8 |     
   s390x     | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/c60a6db3bb45e8bdcc70c73be995ae1361714bdc |     
  mips64el   | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/26a8ec73258053b37c8c0776486b096b47382cbe |     
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a366dd03019f419107444f61ac0141ffb9454625 | ORPH
  aarch64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/90db41df08075abfb912a324055eed85105c157b | ORPH
   x86_64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/2645d9f728b08395b1e68b0b930f51771ef7fcf2 |     
   x86_64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/0feaa43a26fe2f40158194c5e3b30bd97427eeab |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/0f2cd2023d0f0f31c30911412ffe6de0cff4a73f |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c7f4c8903fcae48d585e4db54f565e3ef130c8f6 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/7dc2a61b1306c6539f2d25b9ab03d091753227a9 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/1163518f2fe3198d5cdb7ef2bc73f2be7684ccf4 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c43b531009ca75ccb1c667dfae979d47bedc3f88 |     
    sh4a     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/0a36981e1a1eb418f011ae20c34053381ce982e1 | ORPH
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/eb0e95ae27ccde894a931995275393c0f21118b2 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f64fc62d8709739039fcd175c48ac1cb6dd66c05 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/fbf9f57abccbfcac43353a8b0580101348f86dcc | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b559c33eb167456ceba50a8bb2ddd0edff09305e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/de6292b48dbe304a252c7e42c7daf52e57016b33 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/6067f36fe2f0fc6c08c9a9a65e1852af05fde07b |     
    sh4      |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/a25779243a74bd945357d09cb18e3275c862eeba |     
    sh4      |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/ab10cd438f17021e83cca31bd9df1e0666e7f4f0 | ORPH
    or1k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/9c7a859ef23b4289b98047dd101057dade144a7a | ORPH
    or1k     |         hiawatha-11.2          | NOK | https://autobuild.buildroot.org/results/65575fd6b0f6599d375c2f370121d6b2585bb3e6 |     
   nios2     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7826a3a24118678616c489859dcff929104fed15 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/84dba423c5b100ed9017f0a3c1db94c1b627803c |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/493d2b4c7f7e398128e81526e4d024f025d72c3f |     
    sh4      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2871b187377b7f9979b45a5b25ee1d9851ddd8ce |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fdabb82ff86fddf99ed4f03c77f5ff4cd5864ea6 |     
   xtensa    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8d66a7e1d56bbd59dd4b09f2c31f861374bccabd |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fdb115064d1f8694777bbec615b196a09b6a9832 |     
   nios2     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ead5cc57bc1716ac2f9d71e4ac38171fccb675a8 |     
   sparc     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/328f6b41d6e8e48be9d81be28d532ff3c644a46f |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ede283a96885c7be9876b4c769f49ac5ff795125 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ce003295fc4bc45b5981fddc32d3db9c231e800a | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/7588267a4e3b511f4d3de9b5212f4978e3ae5c7f | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/c8dd065d10e63d549f160e348379eb35f8651878 | ORPH
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/89345e808c9316df11d30cf2aa2faf5280a24864 |     
    mips     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/b79ec6529264782437a7e7a18b800241bd2d7b65 |     
    or1k     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/3fc68772d866e5a6273d1d8a3606748dabbe01bb |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2dc584a31b4b4acd409a3c82e8a881991618c99a |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7344acd36ef87cf4ee7778bc2aa224fa27ba14db |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9a5e66063104293f1787f4fe2d96a626028bb5a1 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0c44c636edfd013a43434a420aa6f3e5968f651a |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/f5a1b916cba2f444a7377380add4149e93fca3c8 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/23f6c041cce2cf6a0cdbcd6f134c34eaeb6466dc |     
    sh4      | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/cde553131a69846c889e32a0528c7e6c9619546f |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/bc55feb768cc7d9cb4860fe459d3915a7fb2836f |     
    or1k     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/4ee029ba7e8e7f777d0197a48310593e655f6857 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/af1314a4e66dfc8ae9bbbe906aef9391d0a09433 |     
  sparc64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/b00be36206639b6567941cd993d99df290e4a8f4 | ORPH
  powerpc    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/306823bc7a0113d43e1afb32c58a977bb02ad18a | ORPH
   mips64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/5d08ba7a5350bf9b17f3db13f1302e6bd93a9661 | ORPH
powerpc64le  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/e2cb07cd99ffa475ea6132a4b7af8ddaccb86592 | ORPH
  powerpc    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/e15b5181eef9aa432062ce5df2e3120a8b5efec8 | ORPH
 powerpc64   |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/4275af377a33d0bd94f209f5016dae1dcd3e6bf5 | ORPH
microblazeel |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/d3f21f90546dd614855b6167656fb3518c3bfaa5 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d75aff4483e3d816062646d87a0026a7b5d3e5d4 |     
 powerpc64   |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/cce82b6a2f9572151f367ba7bd06247e192295eb | ORPH
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/0742cdc3ae070e73c430f318a3626d0546972a78 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/dc69db6d196c271bae5a7d7494db86d433745262 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/f40af1c307742dc69c02805ea10539aa999b16df |     
  sparc64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/fdc829b1e29b528b3039889246886dbb23f9b050 | ORPH
    sh4      |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/9471e7ae802dc1421d4e0b23abe7e50711a36d34 |     
    mips     |         libjcat-0.2.1          | NOK | https://autobuild.buildroot.org/results/bc05df227c042da0de5e742f45a053483ff11d35 |     
 aarch64_be  |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/1636eec8dad685196675add2bdf2805b3be9e67a |     
   s390x     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/d6c6176b331c0ff3db737157726a88d964dab565 |     
   s390x     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/9e2240bc54f7b23ceac93bd468ed5f33a1cca952 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/d9efdd9c8a961412d89d9c5ca295eed3abe354eb | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/226b68f03a9de9e34aace63f935391f0e0fbfffd | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/9de7acb7b1b85bbabe6eabd36e97b802d7318ef4 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/e38966e97b76a5e3183111ef1405d3b8a475a791 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/e82cc9188928a4645dbbd95021af2f8871a765e2 |     
    mips     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/32ec8316fcf08cdb9c8c7e93a2781d6291358893 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/320cfa735a891f1a06f623cfdba8eb515bd2ccea | ORPH
    mips     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/a3cdedaa871cdb71c3a8d5efe2dcdc84953a681c | ORPH
    mips     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/628d3901f214c43263368187a182dd35aec0023e | ORPH
  powerpc    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/de48ea10c6923268e956aa38cf02a1b96892856f | ORPH
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/d7115744f77ffc61b544d8f1b54e5f633a5e5cbf |     
   armeb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/6b44167728f365b4e3b4b08ee06106e48ddec0eb |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/c6a7e11016b9aacfdf841b626831d5e78c44fdd8 |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/a02254b319249f32a4b956ae7820a26f504d683e |     
   sh4aeb    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/d0a28eb001984e545f2a41adfd18f582481d3407 |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/cdfa1b93f830b31857c4827f315345c169144ba6 |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/28f4701fc17eb83bb62773af06f5d38863133573 |     
   sparc     |         libxml2-2.13.5         | NOK | https://autobuild.buildroot.org/results/248b2c335a6a4f1a4e04dabdcbaef94c3f0967d9 |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/60f687c607352e10071df58ac277ea8417c2e236 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/634b622ffd049e3f91e18ea1b08c78b220babe57 | ORPH
   x86_64    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/83beab6a03d64d8007ec3dc7326964cd4c2d6d85 | ORPH
  powerpc    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/4d5f690c1e987a4ca8e92632a39a981fe2a48029 | ORPH
   mips64    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/c19bbff1115e881ed55942390712d4676462cabc | ORPH
   mips64    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/72e7b41020121f6ee8b1eea763c2b756eabd68c4 | ORPH
  mips64el   |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/eb55295c03c527285044980e890520de55313616 | ORPH
   mipsel    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/ec25cb4008553d5d87c90c2036201eb64f7b8a50 | ORPH
   armeb     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/50f93070c80106cb576a8c30a2cab818c5dc82f8 | ORPH
   arceb     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/a3592e2989d178b0b619e3f0d5a1531d029dcdb6 | ORPH
   nios2     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/4382c8a3f3b3a820f7c508e75a8516a08c197199 | ORPH
  mips64el   |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/906ac612714aa565449b4814a71850c264b316b2 | ORPH
   nios2     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/e0f0997d3395876a545cd93455832c3e222546d2 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/3e32e087f163771e3acb7e5bd715b278b3e84a9d | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/073cc729d5c8a3ab13bd2e036d0a24aa1e7a46a6 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/773cfa2a6cc2d0bc13566095bda5f2bc8aebbed3 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/67b6e8e2549f295b54a74abd7502b8105a0da55b | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5392d62bc540eea2a05f82c1d7b1eb79f1fe1e88 | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/53efda9677a5bb7fe796ddeaf2f2f3d66bf801f9 | ORPH
    m68k     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/40c19a83a03277400ce8f8405b1511b15f5ca6dd |     
   sparc     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/907b1e9ebc2a576c6aeb94389a4c699fbe1c39fd |     
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/257fceb87494d00d947f1b9804e2d4132d26b287 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/a4f0bf3ea6953cec7e4ed01f3399e14b31c2fa36 | ORPH
   nios2     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/419aa502efef2b27c9b82258eadce049ae5d7598 | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/9fc4a7bf43aacc9f062fec83bc8a8f42bfaadc28 |     
 microblaze  |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/0aed02325025baf8416ec93b5edcd9dfe6075942 |     
   mipsel    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/316a3baa3347e3150fd8df3155b4b1ba1b7f9b1a |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/6e3a49b9f9be955bfeaafe073da867e152cff853 |     
    arc      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0dd2310743c96035f1d4dab12ca797768ffdab98 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6e7261a9651eed2650dab1973fb897c525d3508c |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b491a7518292758514b0fc21c53aa2a7619051b4 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2c2fe3d72f25f4bb7efd4792f1b5a6c667471b4b |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/98c4ee99c5b00a636ebb4d97a43a3b6a3a4e2e01 |     
    i586     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/699cc75850d07a4e7a7c58ab5a8b76df44cae5db |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9d96383337975cc181285f406f3b458bd2db0de9 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c3a5ba315ec0282099155dac81e83d87d4536318 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/bd3700a3928e97aac345d89087bc16c09c23197c |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/af3ba56335aa9e79c2a16ba9e963ddf9aa3dd945 | ORPH
    or1k     |        nfs-utils-2.6.4         | NOK | https://autobuild.buildroot.org/results/07bbaf8691d3e0a977604a89ecede5ba82b02ca9 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/070f3683a5d47bc64358694e38e6fc34db09a810 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/25d2fce5d213a369006f2fb97741227ba78a10c7 |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2eab358a83ba34e9393fc2e531665af06dfe4e8e |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/572994251be46fe42bad2d7176ff2be838dfbeda |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/4492ae274494da168d0e21c789f3ca35b9c08cdd |     
  riscv64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/3894aad75cda53ac3362c4be6deb4a538f49aead |     
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/0eb5085a0a55f15eb1006efb9d8d37304e8da872 | ORPH
    arc      |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/d0ac84169ac8444c338abd4c9e4e5b57f56cc936 |     
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/cc1375c482bdfafb5027e8e5ce760da13ae967d5 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/4218f19a1a4c1b60ee899ac7e21570114aa16ab1 |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/5f1e995f6b8b3bdc0784d1bae8041e2b19ee0989 |     
  aarch64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/17f884d3674253dbdd354ab9d12a574609632996 |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/0bb0aa5fbdc7337728402618dfe7bd15627761de |     
   mips64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/dce34cd4db3a349098115d1880abd284a613c649 |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f092c11fffeae82d5b3ff00c7e4a8d4731ba50d9 |     
  aarch64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9d2e07c2ec646ee143666f4886b7f30c7175f054 |     
    arc      |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/dfbdabeb78f7d8746b084e704aabbdf4d05ffaaf |     
   sparc     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/d2c660532c7a1742200d4e904f768ee54a21b0d5 |     
   arceb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/60e138e818bf59bdb970767327b4796b3bcb4ec0 | ORPH
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/cc82d52d207e83deab6f7809262d3708d1699bc0 | ORPH
    i586     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/3c51b403ec9d318cef4f5aedf4b08a9a46da2f79 |     
   sh4aeb    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/522c60d0602425dbcc36d80f9b63975ae735e84a |     
powerpc64le  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/555813b9db324616a7f2bc4ff6c1623ec189c488 |     
  powerpc    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/24d9bd4a591b187858604d3194111a89c9d2269b |     
   mipsel    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/3cc146a31e145b104c966d2c8441f7cf786c37d6 |     
microblazeel |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/46f8b3b0187552f7252b397fcd6edfe6ca425a74 |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/9ea13159e484b4f090a7164c82fe08dddf9caed1 |     
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/de81e3671d1b4e1a6ae625acd4c1b8ceab7798f4 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3ccba21735e1618f9017af25243e9d75b5aa1bac | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6b70c8113c348e55522c226244aaa2c145c24614 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/56a689b850b69a8eef4a992215c494b2d8c29323 | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/512ce3dce16a92711af08ea243bf8770777be33d | ORPH
    mips     |            pv-1.9.0            | NOK | https://autobuild.buildroot.org/results/f0aeae673843427cdaac57326b5efa6866f2583e | ORPH
  sparc64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/93836d8fab16d2e4fc94b1a57b1747d1348c898f |     
    or1k     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/8dc31956e4c07b8f59ffcd56b94365d139381771 |     
    arm      |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/493386d6116bbc6ecb757841a01df27334bfd69f |     
  riscv32    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/348fb3ecac975c7320b924abf7c6600e125c342d |     
  mips64el   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/dde0b5e53f4b723586e1b3cac858cd8c63071362 |     
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/00e4bf54e3d013c19b9860fa87e43ee7b659e1c0 |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/24cac7d1ffda7747f6943b930828a0ce42eaf609 |     
   mips64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/27df1f68815781b5b3fb2bb6ac0455bcd659e6c4 |     
   sh4eb     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/fc3201c82d9d94635eb04ae1b3003ad08bbb64af |     
   sh4aeb    |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/be73c9a41b3ad3dea8a924ab98f6fe804e6808fa |     
 aarch64_be  |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/4cb684c6e8758b728d54ea367d1f279b2065bd83 |     
   armeb     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/fc71dbcd15f53df5783e43e22856056dbd0c17c7 |     
   mips64    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/98afd1739ba340c444f075ac8e94e6a102988016 | ORPH
   nios2     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/644093cb4206d8841541c74c19dad27cd1328873 | ORPH
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/1a6eb6ce70dd8e6f56bb2f5e7e558ce98d5f67c8 |     
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/39a0888d6237bf92b18111feda6c0498d946d29d |     
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/30f7caa083a3c945525afa02b97ae187616690b6 |     
   sh4eb     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/54afc38168292c1ad5b91161947736aee978a605 |     
    arc      |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/248d432773cc55d7f08efadc27a684287f705443 |     
 powerpc64   |       subversion-1.14.3        | NOK | https://autobuild.buildroot.org/results/882dc03ff02ba72c8a455fddaf6c1150fc293c08 | ORPH
   sh4eb     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/e6ac4c6546ccc0705aed89e7320b7a5a76899811 |     
  riscv32    |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/81a687ca78faaa86169266f1f8decd3666ac137d |     
    i686     |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/194018617bec315ef249b6cc51db68909cb26866 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/cbf1bede73371b2747268cc66d4f5716add9e747 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c08a0efb8cad04d2773b739858ec1bf3d1494208 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/feaa91884ef5ea6b520a46a1bb865c26f5789487 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ad79cc108cc8ac2a5eb66d75e92f643316118797 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ae85afe65f1ed5de130c61d1e84109d555293f2c | ORPH
   arceb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0538924d70eb0801bfc0fff9d5b4f2a2b9149644 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d8edfdf61c435888eec20c98e7f430a835436dd2 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/771ee56b87998db109be1db552819e733965f3b2 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/dd694c0b4116c05994a8a818128c466e75c16958 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/60604a53fcad3a1dd73a548e1cbad0afce2ecabe | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0c296e00ccd528189eb7aef6ca141fc24cbe1e06 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/15e9fd3065f3afff1a179dbedde7e04a5c7c4d74 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/75a8577223d252204bf8bdec364276aa0947171d | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/aa60f330b68d1c5b5953fb5e796fd73fab2c6b9d | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/22e44f88e53706928851b9e7e8604d41870cdc8e | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/b2f94aed3bb9d7d5df8274437505fc9876c410be | ORPH
    sh4      |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/ec6ae69e5f45bf5ef7890552b0bb20509c7172e6 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
              host-rust-1.74.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b9c459f53876dfa93a1b07490fce97b0898eacb4 |     
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/c57f3d2032540e97c1505150a570c678a066d9b8 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

               graphene-1.10.8 | 1 
               openblas-0.3.28 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/efb309e294fa23bebc6f10e9444dbaa6018a1bee |     
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/e07feee1c9faddb5834e83633a3602ada1a13550 |     
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e482e0f545d01197d306dc698890e2c6da191fd3 | ORPH


Gitlab CI results for 2024-12-12
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8609307891  | ORPH 
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514188920  | ORPH 
             TestDos2Unix | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189127  | ORPH 
                TestErofs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189033  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8609311651  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8609311956  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514191112  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8609311968  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514191115  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8609312391  | ORPH 
...nDbusbrokerDbusFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/8609308745  | ORPH 
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189258  | ORPH 
              TestNumaCtl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189280  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189313  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8609310635  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189317  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8609311057  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189410  | ORPH 
          TestPythonPyQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189399  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8609308062  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514188957  | ORPH 
              TestRtTests | https://gitlab.com/buildroot.org/buildroot/-/jobs/8612825077  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189438  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8609311203  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8514189468  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

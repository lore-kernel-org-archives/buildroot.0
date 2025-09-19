Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87E4CAC5A5
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 03:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE9282306;
	Fri, 19 Sep 2025 03:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyXe3GbQo-ri; Fri, 19 Sep 2025 03:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1363782307
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1363782307;
	Fri, 19 Sep 2025 03:20:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7A70E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AF2D82307
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwNKNQjSYZwm for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 03:20:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24D7582255
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24D7582255
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24D7582255
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 03:20:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45ed646b656so15804105e9.3
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758252021; x=1758856821;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jkrnzMN2cl+v4zhG9SsMMOhbMy59f5rozNgBtIJlUGI=;
 b=s104jP5nyjoxoujNvOf7+FWGXy3eXxEcp6nfaoO6dGoB4piaTQWh/W3I3iy9+yulLA
 7/ZuFsV/8jXIEPY+wl1OhqzuxHlVrNQwIO76TOVAz70l0Peyi3/OjOTo3VUgc2rC3dwc
 Kld6L/60ql2r2U5drFCE3Cy+N/qM2JwImhj0Ebe0GuddtbUzjKroxjiXsypImP4BJrhd
 IfB4Sc7ieLqAo3IkB2Jxg+Cz/iWQaFrIjCKd0EeHWGEaHIaHNMRuq9+WhsjkFNtPwqIf
 xkkyJpptVxSXbuy8X28Y17cSpv8dPterZxVJcRWtJtB3OYazMmM+F6i/1HFoLL9feZnq
 w38Q==
X-Gm-Message-State: AOJu0YyeqbbI+HtKB+Jaf0kVVlyHK5yLPFUR90XHtxzJACvfNmZo7c4U
 Na8sjvncxPiRH39JzVLCLvs7rKt/TJmBv2c6YWZhynE9cowi4HPOW0T2YvPghQ==
X-Gm-Gg: ASbGnctyW8Fkdq0t5yqCLyE5+FUO/z8qQwP87gljpzq+tSIsp5n0cBWo+ii51FpLvk3
 TYQhoh6vz9Mn13c1NKcdh98MwapL5ZKz0+oPFEgY2uL+gYyF9CgNVd5qsGduVcMg7px53rNm77k
 OWeawvBtT3T6dbJbQateYC7ORHtr5gD+UgAoEP4mcDAhZe8s3Wp3aTfKRmEDTTeDx/kIWuTQAhI
 kxzPif9qBvmxUS7R/qjruLrcbrMkRIx7B9TyE7vewQGO/vM+pLrrgfUi9ga+JpoeJnZAuon2c7Z
 ckqgHyjeGZ+vhy+tM6inT8VH4JlHNX/As0PBfhpYWXWB+cY8cnAZTrkd6SdJSLfpP5fHMCAa4TQ
 70wLPiR1NTq6l+wEnu5Vv4GnKmFHZjXmVVyFU
X-Google-Smtp-Source: AGHT+IHIekHv8ohU3og0MllbxHBAAhwNiRYS3xOfc7zxUbDSO9x+BK9LS2apZTC8EN6eqYUVCsV2Cw==
X-Received: by 2002:a05:600c:c491:b0:45b:47e1:ef69 with SMTP id
 5b1f17b1804b1-467f15d40acmr9958135e9.36.1758252020773; 
 Thu, 18 Sep 2025 20:20:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f32181a47sm75369615e9.1.2025.09.18.20.20.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 20:20:20 -0700 (PDT)
Message-ID: <68cccbf4.050a0220.3551ef.abb2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 19 Sep 2025 03:20:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758252021; x=1758856821; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jkrnzMN2cl+v4zhG9SsMMOhbMy59f5rozNgBtIJlUGI=;
 b=egj25niEPuGBdWQXGzFUHaViS30lygdPN+oPxgRaNJm967+udlL6n8EGT8KpKx/ioE
 YCMUlJqQuKFj2jLrtMHkbdyYpBC2GJ3ld8nj7VGTnsKZ2KIqUrkamxSNkmcQe4lgg4bS
 ssdCFk55MuYSVFLaB4fp6OusmwjombRJOhrmwjRHAv0jgtmTrKN9OA6q13mEAIPjJr7y
 yplFa9GvQKJzeJP7M6kRspw+qy5sMT/8J7IsH3GrboQ1005S6QIZLvlLtcQClRTmlFTU
 1XqhhN3Rjk1PXS4mj+wd7ruTgt31KrBvNQzpqTxEEckq7SYgEw856tbMHxQOxJddTLZy
 +TxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=egj25niE
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-18
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

Autobuild statistics for 2025-09-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 12  |  0  | 16  |
  2025.05.x  |  0  |  1  |  0  |  1  |
  2025.08.x  |  1  |  4  |  0  |  5  |
    master   | 22  | 72  |  0  | 94  |

Classification of failures by reason for master
-----------------------------------------------

                 logsurfer-1.8 | 5 
libdbi-drivers-0bfae6c43134... | 3 
                  linux-6.16.7 | 3 
                  cairo-1.18.4 | 2 
                   cvs-1.12.13 | 2 
               graphene-1.10.8 | 2 
 host-softether-4.30-9700-beta | 2 
                libcurl-8.16.0 | 2 
                  libjwt-3.2.0 | 2 
     libphidget-2.1.9.20190409 | 2 
                  libsvg-0.1.4 | 2 
                   linux-tools | 2 
                    mpir-3.0.0 | 2 
                python3-3.13.7 | 2 
        s6-linux-utils-2.6.2.1 | 2 
        vulkan-headers-1.4.317 | 2 
             bmap-writer-1.0.2 | 1 
                  brotli-1.1.0 | 1 
          chocolate-doom-3.0.1 | 1 
                  cmake-3.31.8 | 1 
                 coreutils-9.5 | 1 
      docker-cli-buildx-0.25.0 | 1 
                 dtbocfg-0.1.0 | 1 
                   exim-4.98.2 | 1 
                 expect-5.45.4 | 1 
firmware-utils-86739f2b3ae9... | 1 
                   foot-1.16.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
    host-mender-artifact-4.1.0 | 1 
               host-runc-1.3.0 | 1 
              host-rust-1.88.0 | 1 
              hyperfine-1.19.0 | 1 
                libdnet-1.18.0 | 1 
                  libnids-1.26 | 1 
              libopenssl-3.5.2 | 1 
                libroxml-3.0.2 | 1 
                libselinux-3.9 | 1 
                libshout-2.4.6 | 1 
                openssh-10.0p1 | 1 
                openvpn-2.6.14 | 1 
      passt-2025_06_11.0293c6f | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.40.2 | 1 
           python-numpy-1.25.0 | 1 
          sane-airscan-0.99.33 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             strongswan-5.9.14 | 1 
uclibc-ng-test-132c6134d691... | 1 
                       unknown | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/33bd071b07a0b6ef966d3d5a6c73dc02cb6797c9 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/d54ec0945143abb0768dfd0520d1d2aeb6502f8c |     
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/c48a3ab24696e0e2ce333d94ad9f6b383ba84a8d |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/863d90c2468d6101f7b837be76cd3500fddcc647 |     
 microblaze  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/7997821a4be572ebff5979d1d82fa2f3c58ef5e1 |     
    i686     |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/e2c6c183700884258f4c04c9b1d2cbde0f65029d |     
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/217285c417aed79df2c3589cae0315d4330bd940 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/00a6b6ee18390b12097a9e73c352a770201faefe | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/46b77d612e39c4c0fa85a36274889451fc6896a8 | ORPH
  aarch64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/65b2a1b056619ba413526c79d4f49dee9b4897e4 | ORPH
  powerpc    |         dtbocfg-0.1.0          | NOK | https://autobuild.buildroot.org/results/deb05df8d614968fc937b43e417e6ff534fb6d8f |     
   armeb     |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/94bc04ddb1522c47e30c9452a4c446e86629cab4 |     
    mips     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/85ff7d5dd68cb3efaf49b046053d52f7c6421d4b | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/2a1079f075c2096db81473e10162a0b3e269d042 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/4e3cf60b4a845f60ceba8ba63f58d81f0dbee0ec |     
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a043eddd8f878d9da056e86afe8b92f444a39c96 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/edcc914dd5dfaf8627e6b832b349c819b571c4f9 |     
microblazeel |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/610179bd62d8bd302c229b603934d8adbd6f94c7 |     
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/ac3dd99c7bd0a291a85edbc37a7f8a9638de7f9c |     
    i586     |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/f233b54487bd707bcb2cdf9d8c8ec7d82be6891a |     
    m68k     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/f94d2bf7b5d5008f991eb77de4f22a946dd6668b |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/0d9c7c80cdd34b12b6fb7fad76016140bc64b8d9 |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/e5d4d7acd3324cf3c5fad36972eb0662ffd148ae | ORPH
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/4af51f6a7433750d94f7041b236d6372e84cf030 | ORPH
powerpc64le  |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/2f7929b21ce70c1c4a27ee96bc79e2e9b1994e22 | ORPH
   x86_64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/0d2b620e273a9a1d24f376a326b61e64830733bf |     
   x86_64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/f988ba225745cea473ce280c337645da3cae7f5c |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/cbf9099dc850597e8bf759f4d6994360e857ae7b |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4310a63e286671d8719ceecc354334c397bc156b |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7509591eff6ee6263205640b24e9770a994fa417 |     
    mips     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/9f7d5a2de8191a69ebc0258dba264f002bb79e28 | ORPH
   sparc     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/18ee9b5432f26d4cbf0dab3d788cbd7b0b26cbfb |     
loongarch64  |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/476c3adf08de1a7bc1966deb684f35785e903afc |     
    i686     |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/e3fe3805e2f22ce97a24fb7c37313cd59ca5b417 |     
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/6dcc068875a26e029b4fa16957b6da487f5d9026 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7c172f01d4388f91e431dd35dffbdcdc6a426fda |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/240d09ab4170c30f6577972d2f8d286e4c690055 |     
   armeb     |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/f9eac94e6ae972d95a770851aaa168bbd352d320 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e15ec46b8507d9a4317ec198a6d4e44bd31f038d |     
microblazeel |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/050d279f5a5500e22c82f52d59638a62a49c64b6 | ORPH
    arc      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/37da3dde468bee5d7f9087dffb015c42a8b5653a |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e6c711b2ce604d3298e0365ff94abb33671e4f3f |     
    m68k     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/17af834c00154f161aa5a9ec2691476a92471771 | ORPH
   s390x     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/17407753f95b3b91159ad814c4b0507b024a5a9f | ORPH
    i586     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/7216fd92505032e50d06470040dc79f771fa5ba7 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9f4606bc12b8d54dc757d5ad55475d4245cdc535 | ORPH
   xtensa    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/5a14767cea726e5cbfb1ba61cd21d38c40bd259a | ORPH
    or1k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/6bbd22099e0de34776e2d6cf5483eba3dab23a1f |     
    sh4      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a41f31be85ade062c374b78e70a1885f4cab7f5b |     
    sh4a     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/11d332be4782d59bf3fddf772ea9dbd23eaa375b |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/984fbeee38aaa55830b4455ae3d2bfab80ff387e |     
   s390x     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/26a148780c1bafa01e4aeada5b48419df40e5483 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/58cb3800be428cb1671f0c4c463c9af59c1a8250 |     
    i486     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1383c1f72ca4a129985820ce90934b95773d47c0 |     
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/c88bfd4fe784dc0ff249534438d170d0869ee217 | ORPH
microblazeel |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/beed5b4d5754b675b27cfc21353ebbda4e1a5cec |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/30398c3ac447a097abc246460aae07ee132c6832 | ORPH
 aarch64_be  |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/b36e81f741680b97177fbed2b89a3919c1094c51 |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/cac886365980c235f8414287ec93b5ca13ed489e |     
 powerpc64   |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/47a87f97b977c16f01c6e547797f89d223810493 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/efe4a1589c43b05e09d201c4ee6d0c604b7acd04 |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/1ef154c7f53b257b90b6cf364241d388030fb99e |     
 aarch64_be  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/726e34130570a61a8b5b10b2697c1358e2b8e9c8 |     
   mipsel    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/1fdc9f1d8f5a1f9775d2bc1e4dda9f69262c9de6 |     
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/b69f663a01216a35440bc9c5885e05ae385efdd2 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/49035f1cc94176cb0a7bc38affbf43200b3effb0 |     
    arc      |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/271c177f4aee4d66eeed7bc54e1c81985e7fcccc |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/3fd470d3b440c474f3942fd1448cdb481e35e5c6 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/4975cc9be2464cf0a8c87042659eeaa1c18e1084 |     
  aarch64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/bad99a4e24c78f19f4f7abd3975fa6e7f1b083d3 | ORPH
   s390x     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/74c578d0cdb16d777514e80c9eb89d237ffbd189 | ORPH
    i586     |         wtfutil-0.41.0         | NOK | https://autobuild.buildroot.org/results/67724f5fb996094bdf602b9441f08fd64aba85ed | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                apparmor-3.1.7 | 1 
          linux-5.10.162-cip24 | 1 
                openvpn-2.6.14 | 1 
               trousers-0.3.15 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apparmor-3.1.7         | NOK | https://autobuild.buildroot.org/results/c78d66c0acb8f0f724f2d6cb481593b2a840528c |     
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f218e077663c33bce17a968aad3eb15da87b2bb6 | ORPH
    mips     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/6d27fe25528dea128574f4bf9ace83a37b986aeb |     
 microblaze  |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/e6a1647a389eec9c3639f33ce7b5cde1a18c408e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              execline-2.9.6.0 | 3 
             docker-cli-27.5.1 | 1 
                 gerbera-2.4.1 | 1 
  gobject-introspection-1.82.0 | 1 
              host-rust-1.82.0 | 1 
                  iozone-3.506 | 1 
                   perl-5.40.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
                setserial-2.17 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       docker-cli-27.5.1        | NOK | https://autobuild.buildroot.org/results/608815a0667f0376a0b371b1f8ac1287c399ec71 |     
    m68k     |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/ce2af186171081ad4922ad4fe9c74e011d84ec9e |     
    arc      |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/6254fab3bdd2c6b9a8ee12db8131e13003617962 |     
    mips     |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/71f05ac1601e1082a28c3f3e01db687da8c04b11 |     
    i686     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/7ae0546c942d5ea0365b96994050ab657cad7748 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/170ba13d6787cb7f92c2b5c29a53afdcf8d9e680 | ORPH
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/08f14a0e90a4dbb9c4edb87f5eb843067a27fd55 |     
   sparc     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/50cb78af732b407c6845817e14b9964759142c3e |     
    i686     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d8e0d8e40c616d04e2e92b5731bf12561f3e3eca |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/bb6d494be5f98b64fe44b8ce4093b6f6f2c8be57 |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/cd21bf43250a8aef55fa2f760a92c86f2b387da5 | ORPH
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/e98b6fe9b0324e8937496b51959eee7de2e99b1f |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              libselinux-3.8.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/65a8989c10227066320a36ab5be454f7f2d4b93f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

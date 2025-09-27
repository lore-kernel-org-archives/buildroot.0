Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A2ACAC5B9
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 03:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A715841536;
	Sat, 27 Sep 2025 03:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgDyfu9XVwW1; Sat, 27 Sep 2025 03:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B45D42340
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B45D42340;
	Sat, 27 Sep 2025 03:20:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CFED231
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 03:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 093EF616BA
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 03:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akbcHUtx4UDj for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 03:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D0116163F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D0116163F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D0116163F
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 03:20:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46c889b310dso22178115e9.0
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 20:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758943200; x=1759548000;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fozl/fhxuHXMT6wUirLAd4f5CwTLmPNdm+eyJr9oUdM=;
 b=Hg7PGx3rj0QlHTcoeryoUY9LPOqmw8Zkfo/srKDIO9mQLUvA/2zk1TrsWLTpeJOh0s
 4Jp7jjKxT873ChGPpRICPV7RR4QuXTqDtxwjyV/sp6yfF3/BBUbY9h0HY1vk9uik0ukl
 r6qZNvfGt90BiFb2zczXmJaJ2BtprT2loUVuT8pcli4S1KmmrfhF2mq+IL80PpZM8rrW
 7n1EfEfO4JaKBbY0XHz8/GtdBEwtjY/5/2wDsYFj2ud7wrNemVHZ6h9EeY2VDrcrw7lr
 lgSm0Zt2yzNtZUS71VnF/oeuTlzb5gkboZUMg6r0r1yqpnBny2hMnuL1VKMLvJEqMPZQ
 BaUw==
X-Gm-Message-State: AOJu0Yzfdm0cFkhGhlT+rLIi0hxhW6hpuokoaNRbDMTMquLAgq3HDeDn
 9is4Wy8gwBg3AlBQbFHTmHjdeBsLSAS4z9sZMy0IVzGFWo7V+y5F13SoOalBmQ==
X-Gm-Gg: ASbGncu6nf5NLHD1a0nKhrtAFU3sefG50iY+UBiPw5CEPFO+xTWyhdafmz8niQmOQPF
 BfNmorWNkvb+FxC4vF4SsH+SwVRKoshdJ+/k0gd47pXBLtNIJS6LzdzlojtQfQ/DNgBiqiSg7Io
 M75r4YB5s551hnxMLG7+MZyf+xvOr3dpGM17IRdrUGHQ+1wEfE2PwX5acwWQIWLc5hlkvDCLhNT
 275lPX76FKjS+D9ofgvYjAb1y/wGabHh52jEWmCOcWx1gIpovDsayTCk2VV5MdlonOjSRm3k+Af
 mJJKnaU/1+Xy35uyUz0inpzhCRveLzSYZ06e2NpWwN96FYL6BF9EaFVJFS0NoASVNG390GScT3F
 HS+CeM/Tk3tAgs3o6mvS6h0J0xTispQ==
X-Google-Smtp-Source: AGHT+IFaGs2r3lku5oYy3YmCWaDSUMmNUpECOIdYl496sxJ8BFTfkuwAKq0gIY5sztBW4X+WAXunJQ==
X-Received: by 2002:a05:600c:4754:b0:45b:8ac2:9761 with SMTP id
 5b1f17b1804b1-46e33c8d50bmr91316625e9.13.1758943199690; 
 Fri, 26 Sep 2025 20:19:59 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9af27dsm141381365e9.8.2025.09.26.20.19.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 20:19:59 -0700 (PDT)
Message-ID: <68d757df.050a0220.69d73.6e48@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 27 Sep 2025 03:19:59 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758943200; x=1759548000; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Fozl/fhxuHXMT6wUirLAd4f5CwTLmPNdm+eyJr9oUdM=;
 b=no3iHiCzsowy3dHk2DVlKekCmMp0fbEgzAhB1qhUWPOjPOGRIEb5pMsfIdcMgWX3Gs
 97LwC2Okkk7a7+QWZJEAMXgogzNM+p+wU4rgSEOcPl8l57jCJt4mjbBRxFYk8/yza1OR
 wXE0ZQouC4BuH7Latzm4ZkOtl9Gi6qN8aCd7DTKhNfJ604uAtQaIUchPa7h0SdWIS/jQ
 fa4vMLmgwhx90Xgyq0IS7pKe/WNa22Pn0D1aJfJRa/YX4JM53mB2NXaH1StB76YrB089
 fhdjBq5TQMIQXNz6zJcyJMbTLffIeR59mcqs2DVVzacw3O2wc7nHf6xTJk8mApP5+2DP
 TEbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=no3iHiCz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-26
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

Autobuild statistics for 2025-09-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 10  |  0  | 15  |
  2025.05.x  |  1  |  6  |  0  |  7  |
  2025.08.x  |  1  |  7  |  0  |  8  |
    master   | 26  | 86  |  0  | 112 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 6 
libdbi-drivers-0bfae6c43134... | 5 
          aardvark-dns-v1.16.0 | 3 
glibc-2.42-3-gbc13db7393773... | 3 
  gobject-introspection-1.84.0 | 3 
             libgphoto2-2.5.27 | 3 
                 logsurfer-1.8 | 3 
                 host-gdb-14.2 | 2 
              host-guile-3.0.9 | 2 
                libcurl-8.16.0 | 2 
                   perl-5.40.2 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                  axel-2.17.14 | 1 
                    azmq-1.0.3 | 1 
               bctoolbox-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2024.12-release | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
                     crun-1.22 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
              dovecot-2.3.21.1 | 1 
                 dtbocfg-0.1.0 | 1 
               ebtables-2.0.11 | 1 
                    eza-0.23.3 | 1 
               freeipmi-1.6.14 | 1 
       freeradius-server-3.2.6 | 1 
                  gensio-2.5.5 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-15.2 | 1 
               host-runc-1.3.0 | 1 
              host-rust-1.88.0 | 1 
                 inadyn-2.12.0 | 1 
                  ledmon-1.0.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                  libnss-3.116 | 1 
     libphidget-2.1.9.20190409 | 1 
                libshout-2.4.6 | 1 
               libunwind-1.8.1 | 1 
                  linux-6.16.7 | 1 
               linux-pam-1.6.1 | 1 
        ltp-testsuite-20250530 | 1 
            micropython-1.22.2 | 1 
                    mpir-3.0.0 | 1 
                  nginx-1.26.3 | 1 
           oath-toolkit-2.6.12 | 1 
            paho-mqtt-c-1.3.14 | 1 
      passt-2025_06_11.0293c6f | 1 
                     pound-4.8 | 1 
procrank_linux-21c30ab4514a... | 1 
                rdesktop-1.9.0 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
                s6-dns-2.4.0.0 | 1 
                 siproxd-0.8.3 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
uclibc-ng-test-132c6134d691... | 1 
               xfsprogs-6.11.0 | 1 
                 xinetd-2.3.15 | 1 
                  zoxide-0.9.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/4bea4671d03a281fb2d1f0db751f47b671d10548 | ORPH
 powerpc64   |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/a6bab298d68189964c4241ce25211ce1f7c43074 | ORPH
  sparc64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/170b19f9fa389dad18179d1a3fe2faa6b9860a04 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/2e90e5dadb2c1a554c1144042511e1c1133d3907 | ORPH
   arceb     |          axel-2.17.14          | NOK | https://autobuild.buildroot.org/results/3cf9554247cbade68390fc2a07304fa5c37cfcfa |     
   mipsel    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/1c6e210fd32a8be79fd9bc89fcdc50b85acbb763 |     
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e13e914aeece145c77df1a1023a7db33c50dac05 | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/343effe24b1e505d4d62d2c266bfcb28d8cd463e | ORPH
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/7f60ab937310d071e3daf31c5b19e382f096f92a |     
   x86_64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e935060853629ffbe30700ac6d0d7335cbee6e62 | ORPH
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/15a527865d1d7409a58a1f9a85f52024fdc27bc3 | ORPH
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/61a759f76cbe072d15eb943f7573409b202fd34b |     
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/781ed0d60716539e72fd31bae5694dafbe36b4eb | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bfce750a3ccd2486e04ad345e31e0b91dc8df91f | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/66a26fc07fa146073f1ddf447d8ab607c4d04ae8 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9d3fd38864e449d8ef44bace199f52d1d5a1f306 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/eb191a3c1e64b839b2ea313c658425424e304eb9 | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8bed8786ecdef1a03cbfbaa0d6a57c5fcd6eac3c | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6dd2d265dd2a4bbc4634a2fe10286e46afecb1f5 | ORPH
 powerpc64   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/f76c5bd571376776f04ccbf0f22816dd6b65cefa | ORPH
  riscv64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/d38d2bfac70a80e285ce976a88f04654d311f21f | ORPH
    or1k     |        dovecot-2.3.21.1        | NOK | https://autobuild.buildroot.org/results/4dd9203c0c7116408940115bb4581d17c3d51eff |     
  powerpc    |         dtbocfg-0.1.0          | NOK | https://autobuild.buildroot.org/results/843c76126fec09f4e194b7fee7af1b1bd53e8f8d |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/39b073bed8d4a15de93ba2f1d5027021490e0f3c |     
powerpc64le  |           eza-0.23.3           | NOK | https://autobuild.buildroot.org/results/6593bcc13a79493129e8738fe57d0a2123220a30 |     
    arm      |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/b95b602ec0a89c873658b7cd5bdfa35392eb89c8 |     
powerpc64le  |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/970da72a1356aa2d971f6d53fe7b1fa1bc67603b |     
   s390x     |          gensio-2.5.5          | NOK | https://autobuild.buildroot.org/results/9ab9c606b5995a85e4dffb18cff1884e622273a2 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/ab358f31252941f7fe458f297b77134dd86395b7 |     
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/6e60fa0e10c67bba2f0f12d288fef76d66f59ed5 |     
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/2845c908757b1a7f7bbeb8827c8e5df8a0a43b4c |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6484c865117bb0bb0bcbfd31af5942822273031e | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8fd74bda0c70e01457340c924406d60e3e19f202 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d9639cbe32565867f2bde21646b2d587d023a5b6 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/7f4098914d438c1a22e43f1d2da5a42d1146c20e |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f98680f2ccc5851ca1864d1d741a3411b4400623 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a8c5d6d42265939d0d4532bc20e124cfab7e8813 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/dd22802814471d4bdf6982ed6a6efe296dee24c6 | ORPH
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/7f348e32c85a0fdb0211dbe084190353b8e3031b |     
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/676f235c3d9b6b4bbab374bf03c226c90dff923d |     
   arceb     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/a5892cf4c1b8eaa3c863f4a0d58faf44d548738a |     
  aarch64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/0143b1d46eab11bcae7ae10617c397681df19513 |     
   s390x     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/c3dc1259c759a531006b7a69e619c9b86e549648 |     
  mips64el   |          ledmon-1.0.0          | NOK | https://autobuild.buildroot.org/results/93e6f126ee9117197ca5155bbb12e0234b5baa0a |     
powerpc64le  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/9e197e54b51481d4a231dd28b15f324639f70af7 |     
  aarch64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/c6aba648d3b9f941cc60b220eaa51b3704158305 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/732654af30e5b936d795f0556872327a042eff4f |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/2eea73915fd1a9ec880cf57635e056ca5749b6f3 |     
powerpc64le  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a4cf1557c81904eb5e9a68e3da737fbeee57f75b |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d5a8e2aa0c1effb908a0b56ff4a53efb76c72299 |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/566d600a85a1d1c22314269970711e3f2065b1ce |     
   s390x     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/4c62251db217ea740a786644e65b5763a22e1ed1 | ORPH
  riscv64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/48f996593c0f7ded9f9a9d8e310f5989988b595c |     
    m68k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/1eba4d5c43132f358cc7e5d8f15f01af66a3d463 | ORPH
  mips64el   |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/d701312bf33d01c83e5ebdbc157a68c4fdc06851 | ORPH
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/83d2d5caaed3964d6440a170d8e149b316e331b9 | ORPH
    sh4      |          libnss-3.116          | NOK | https://autobuild.buildroot.org/results/bc1d33bf481e524c7e95a7ca33ee3a778279de3d |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e81f004f1eb644061985c15d07f2ed665ab475d6 |     
   armeb     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/9108eee68f3e3d8ec52c56505328b35b5a8216ce | ORPH
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/719f6a17319ce81ed3ea2c991aba7dcb4235d127 | ORPH
   xtensa    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/726d7cdae11f0898e98699e64088bc029719876c | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6f602f27c7f55ac2e133917ac57555b90d53fc7b | ORPH
    mips     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/c40696f5bb23a6e5470a3d249fe0fbc9c2e3dde3 |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9ab4734c1b3e405b7ed1f7a784becc6c69d9780d |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/167320e206855745c97dc19aa534f2cd42dba12d |     
   armeb     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/61340400b02f438a9e2886f6410c8c0beb193b51 |     
   mips64    |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/a87719ab1fa53a038a2b6215dc58a95da9a5322c |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/eee2ed773739336f7a82bbf0fc4c71be7714c01a |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/1a69f0cadfd60829b2be90f7c9780ed30f1e6e4d | ORPH
   mipsel    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/61e1e6f3f3c4e4eddf55634292372dd458cf8aea |     
    or1k     |       paho-mqtt-c-1.3.14       | NOK | https://autobuild.buildroot.org/results/6d8fc842b18a1d4e06966d713618cac3d68a50c3 |     
   arceb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/566d86a056f5791c80ae2efa9d540393e44c2433 | ORPH
    m68k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a03b7720e940c6fd17dd8cc9b6f70b9d28fade11 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e67a4a56ef912540ec5503a3d17d3a39c0adb4e7 |     
   armeb     |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/a3e73092ad6029a8cfbcf35d47e3594ce87b87c2 | ORPH
  riscv64    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/b538e199f76941c801870580dedba9d5db1b25ed | ORPH
   mips64    |         rdesktop-1.9.0         | NOK | https://autobuild.buildroot.org/results/80f2cf2e2b601cd92e355a4ea9f0144dd147779b | ORPH
  powerpc    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/798e203ae7c3cb7aa30c261b0da4fb0b095d9ad7 | ORPH
   armeb     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/74db2cfd41a6e668c1426c22d1ca302b333dd95b |     
 microblaze  |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/fff2397ff7c2c86c2a43761d0c3b371c80ca87eb |     
    i686     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/1306db4d4f5515d4b353e5b6c6b0237303b9dce5 |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/9600c0938d289419d34fafb2bf8741fe4d4a3102 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/a3b02b0c03d79847a6cb861ffdf36ed5f6f1322d |     
  aarch64    |        xfsprogs-6.11.0         | NOK | https://autobuild.buildroot.org/results/a30bf79be2102f3a77e4a78a488fb3b6a5b63bbb | ORPH
   arceb     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/81b2de580f44acdb1d62982b05e21debe34526f5 |     
 powerpc64   |          zoxide-0.9.8          | NOK | https://autobuild.buildroot.org/results/0f24fef0d350f5a76b6ac89db39277d2d8da841d |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

           clinfo-3.0.25.02.14 | 1 
                   cvs-1.12.13 | 1 
                libcurl-8.16.0 | 1 
                  libva-2.22.0 | 1 
                openntpd-6.8p1 | 1 
      softether-4.30-9700-beta | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      clinfo-3.0.25.02.14       | NOK | https://autobuild.buildroot.org/results/f57afca3287ce7faa923cd261374a8cfca6ba8c2 |     
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/88fa6e41bcfdaf18f75c5ffb5b29fad70aabcb31 | ORPH
  mips64el   |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/e3b4f9db9e87cba5d51159efccd8e4294c438705 |     
  riscv32    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/16b7cedbcd01da282e7821b6ae51eb25d149c6dc |     
    arc      |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/8bd731b7c0b76279d805118aa304577a382194d9 | ORPH
 microblaze  |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/79d152a8a993dde47c82fb7fbc82f8e9aeeb0a36 | ORPH
 microblaze  |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/056b4cae062729f9c240979a9cf54707b3afc6c6 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 2 
                  cairo-1.18.4 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
  host-gdb-arc-2023.09-release | 1 
        ltp-testsuite-20250130 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.2 | 1 
               pulseaudio-17.0 | 1 
                tpm2-tss-3.2.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7ae48672c6c606025097abc87dee5caac4dd73aa | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d4eaf5e42a3e90579453267ea16cba2c779b4702 | ORPH
   sparc     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/bff668bf631b37b5b3d42015a91d74d135847b5b |     
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/75039b2e73839388d2e6e662ed7a4f22e109bbbb | ORPH
   arceb     |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/ca078ac265d3c3e0cca89ff67410f1c64d60a9ff | ORPH
   armeb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/1adfd7aadfa69463fb70b8e0eaaba4198b6cb862 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/adf7abde89087b9dc944fd448d7d439b8ea794f3 | ORPH
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/421a522e53743c9620b07cfa30b724360d1291d1 |     
  aarch64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a02b4efe467e29faaa5fe69d739065b1cea1f23a | ORPH
 powerpc64   |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/2dbcb24dcda64f58e0814ea33e90234d0a11ac40 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 2 
host-binutils-arc-2023.09-r... | 1 
                libcurl-8.16.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
         lttng-modules-2.13.10 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/05336af7cf2c868c639be1f7a66be726d01e1f44 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/af356ef4fe7c0950706942c9b3b75c7c0e1f2a0e | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0b43de24c143c6b793b389658dc0cb55e6e1fd0f |     
 microblaze  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/1dcfe38cda9b04c39e9cadf78980a9a5bf6ba0ec |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4bf3a83eb23147bc528752ccfab14c4fb00f51ef | ORPH
 aarch64_be  |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/94a28642d038ad9652aaaef97c09913d2a904389 |     


Gitlab CI results for 2025-09-26
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                aspeed_ast2500evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/11481238341 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/11481238379 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/11481238458 |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/11481238506 |      
                   beagleboneai64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11481238502 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11481238794 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/11481238875 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11501385206 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11501391196 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

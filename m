Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538E9D6407A
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 06:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F353460680;
	Wed, 17 Dec 2025 06:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yyl-CSantMVh; Wed, 17 Dec 2025 06:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D661A6069A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765951853;
	bh=TwMymQiNREkceaHQ2ygV8bcSEGIVGSGzbrQS9cJ7JWM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f2of43oQTYhdWzFsphk6QkT4QwtrYJCuNYrGFcr/3SViqk2s5P4P1crwHsVgW8Yqu
	 2TbTlsH4xQc5VcyeuuOkI6wmkfnp0foA74bnSuiRn+S0StWffyeDK0Sxa7RzBI6kOp
	 x4XOCRC+V8L1uNX3IEuLxMYXw+sYVfyAImHrHo3+RuVlI0qpJCaLBE0unG7TdEvhOK
	 lcXgA53C0McP++/5tNfrvaF4iGBviD19EI2B1sv1xtbinZj4LHuLkCjgLMqDp049bL
	 BkLHnu1FI25ywORnH4Z8lDi6LLek498LoCFEdXUDgCBmjYO6ILjryprKKWErufVoeg
	 W5TbdO7DvafoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D661A6069A;
	Wed, 17 Dec 2025 06:10:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4050335B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 06:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31FC160680
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 06:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNn8drg7RC_2 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 06:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC78A60632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC78A60632
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC78A60632
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 06:10:49 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-597d57d8bb3so4600011e87.3
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 22:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765951847; x=1766556647;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCS/E4Jit1s/4AWXFbI4Eq/g7kJ51QCXxpExVsKZjWw=;
 b=G51KWaSNA1ZOLixiM1XsNOg15DXwGWLTtz2OOhDff1EWDriQervleku0lYKNMdQ+dd
 WTCv14ClYVW5F0JPF82xaEAIYuGxLtmomyPg8gMWCJunLThjKb4uFw6swHmgRNS4gx/3
 UekBpRdr0bmNQVIxBFIpex0WO7AMZOcpxQFQpNaahmddbJr7LLmdOE+vgfAo+1daX3HG
 tZbIar5wsdc17RVQ/TaqSkHj5VyqVJpGH1Zcl6uHAp0oly9gGyICNdLFb5K7wPC/D3sa
 skhpzMtriT0GGNPXT/MecR7SShn7an+UjBtBu4QdjwKuhJgzJ4SrE+NC3Y4cnFeT+VMV
 6iiw==
X-Gm-Message-State: AOJu0YyVT/jNRn9vucu+GXG60DsZGqix4MRVX+XE3btBtToJSuCtOABL
 XSWbkwk4sNM58z1f5okE0Lu6+VCfCPCJNyf/tV570gdK9/kU/aeQqpezVGx+nQ==
X-Gm-Gg: AY/fxX6p6hlt17ket488dxtW7XNfJEX63feGvfLZ4IOvdC+jrHzbD6S0yxnxxXUc3Lu
 3jNJTz0docXNCq8JkYYAvsGjDsXMoU7Wz4+dXnG9PNGlvAqwK6PdEZe475XbpdQHtTiyrmtsm+L
 e3TvngV/ei42h3kCfxHcqbzpQI61hij3dKVa+oUngzykRC6YkMXOruM4OJGC3sb1XuHfVP6H/XS
 7nU6MbVG/FFRKcyQ7UAK915P5YbGDKGnuHjHhfeFWEmCvPsWlUSUqZQacLXYs42dF+qcKzuq8KR
 /ds+H/v/JZSTeQiXHYINsbK5Joe/S+JbnNlFiqauUENDdyqqLTSldl6uC/Er0f7WaqpGK2N3/zB
 xoe3xBo8HbMh3WbvKY4n9xIE0d67rZs/x3jtoTuLs8rixUut5+QH0Swq9+xn+T0YMvXUz+IJc1m
 uOakn1wLVVfdYLPlkESw==
X-Google-Smtp-Source: AGHT+IESd5zRsSrsKH+gwc+nQ9q8v3zNdCZP1OWRzFQB6aeRxgoP6CRdnSuEs1xVvGWgY3+RRK9PxQ==
X-Received: by 2002:a05:600c:3489:b0:477:95a0:fe95 with SMTP id
 5b1f17b1804b1-47bd466121emr51149265e9.24.1765945099933; 
 Tue, 16 Dec 2025 20:18:19 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd8ebb068sm23837085e9.0.2025.12.16.20.18.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 20:18:19 -0800 (PST)
Message-ID: <69422f0b.050a0220.2eca55.0982@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 17 Dec 2025 04:18:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765951847; x=1766556647; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eCS/E4Jit1s/4AWXFbI4Eq/g7kJ51QCXxpExVsKZjWw=;
 b=DHx87hKHb/gPCXzZSWEPXFqTX2zSfEO9WLLNiRwwZUbBOnnDGZdXVQcxDjHdxvTsss
 4l0IRsNrYhfAaEEBe5xHPD0gbK/flevOjyeYmYpnKJx9uCB6rpEu8MVHJhNnA9DbCfLf
 a8LQplnV1DEYuBReF0YHZK3j/cazjiGS6aNtK6Vi+KDzMRuJ6F0iyhosjrE+u82w+B7M
 uz+GCTCOpNBVahdqw/fY6kj4/npAr6BOvHHdMKJ3jWa2eyka7Pzc/un/3Xiz0SyFPL/3
 1yWcU08zUATFfZq1/vgm8MyHv2d+kukTI/VBvnu8+baiZcQGI4DRwHz8v2B1u6XNmKkN
 B00A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DHx87hKH
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-16
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

Autobuild statistics for 2025-12-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 27  | 40  |  0  | 67  |
  2025.11.x  | 12  | 18  |  0  | 30  |
    master   | 43  | 178 |  0  | 221 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.9 | 22
                libselinux-3.9 | 19
                       cfm-0.3 | 10
              host-json-c-0.18 | 6 
                       unknown | 6 
                   cvs-1.12.13 | 5 
     libphidget-2.1.9.20190409 | 5 
             dahdi-linux-3.3.0 | 3 
firmware-utils-c42a3bc53da8... | 3 
glibc-2.42-3-gbc13db7393773... | 3 
                  libcgi-1.3.0 | 3 
                 libiqrf-0.1.2 | 3 
              libopenssl-3.6.0 | 3 
               linux-pam-1.6.1 | 3 
linux-serial-test-bf865c37c... | 3 
                netdata-1.37.1 | 3 
                 rpcbind-1.2.8 | 3 
            18xx-ti-utils-R8.8 | 2 
azmq-v1.0.3-54-g819b24035cf... | 2 
                 c-icap-0.5.10 | 2 
                enscript-1.6.6 | 2 
  gobject-introspection-1.84.0 | 2 
                libcuefile-475 | 2 
                 libuwsc-3.3.5 | 2 
     linux-5.10.162-cip24-rt10 | 2 
        ltp-testsuite-20250530 | 2 
                    mpir-3.0.0 | 2 
             util-linux-2.41.2 | 2 
                 apache-2.4.66 | 1 
                apr-util-1.6.3 | 1 
             berkeleydb-5.3.28 | 1 
                  brotli-1.2.0 | 1 
            cppcms-2.0.0-beta2 | 1 
                     crun-1.24 | 1 
                   dante-1.4.4 | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
              e2fsprogs-1.47.3 | 1 
          esp-hosted-1.0.4.0.0 | 1 
                espflash-4.0.1 | 1 
                      fio-3.41 | 1 
                     gdbm-1.26 | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
                haveged-1.9.19 | 1 
          host-binutils-2.45.1 | 1 
                 host-gdb-14.2 | 1 
       host-nodejs-src-22.15.1 | 1 
          host-python3-3.13.11 | 1 
              host-rust-1.88.0 | 1 
        host-sentry-cli-2.20.3 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                 jasper-2.0.33 | 1 
                jemalloc-5.3.0 | 1 
                     kbd-2.9.0 | 1 
               libconfig-1.8.1 | 1 
libcorrect-f5a28c74fba7a997... | 1 
libdill-32d0e8b733416208e04... | 1 
                  libsepol-3.9 | 1 
               libsigsegv-2.14 | 1 
                  libsvg-0.1.4 | 1 
                  linux-6.18.1 | 1 
                   linux-tools | 1 
                 lockdev-1.0.3 | 1 
                   lzlib-0.4.3 | 1 
              mariadb-10.11.15 | 1 
neon-2-sse-097a5ecacd527d5b... | 1 
              netavark-v1.17.0 | 1 
                    olsr-0.9.8 | 1 
               openblas-0.3.30 | 1 
                   perl-5.40.3 | 1 
               python3-3.13.11 | 1 
                  readline-8.3 | 1 
           sane-backends-1.1.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                   swipl-9.2.9 | 1 
                tinifier-4.1.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/61d90e265f3a1bc7553352c68bfc2944a079d223 |     
 aarch64_be  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/9d65fe0b20ffb7875ea1b1434715ee1ff02a078b |     
loongarch64  |         apache-2.4.66          | NOK | https://autobuild.buildroot.org/results/265682267f42e13eef0dbfa90e15d06012f08166 |     
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/a32f6c5b6a151ff7471eab9265b628c92c0231f6 |     
   mips64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/8e79d59a63ef81dda577d3e101830b4bcfe77cac |     
  mips64el   | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/a7bf95951442703a85aee39b646326adb2060921 |     
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8226c9388668a8479b2bdcf914509020b52be404 | ORPH
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/ccb42b38b2a766ba7ae0f73155dea8ad055596bc |     
  aarch64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/a0df69e53ce3f44e20b51a36656a77ae0d9bc7dc | ORPH
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/f5871d6320bc585348770fa84876fa723ca29617 | ORPH
    mips     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d8fdfc6de9ec3ffa8075a2dcbd258f1d68a2350f |     
   armeb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/1aefb3cf6dc342cc4eceeaacfe628ac34cf801ce |     
  sparc64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b5d6866ce5b8e3d4fcad9379674e3d4ada79a097 |     
    sh4      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b3558524a723beae9d5ba3e1d157731be4c0a2dd |     
    or1k     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/44147e287347e161e66cc6cb3666e1ccd5de5a03 |     
   sh4aeb    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d1d045b9cbdf78623ed3db6f664494a033113b53 |     
   sh4aeb    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/19aae625d47f10ef6e7be10c7d3adf1726a510ae |     
 aarch64_be  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/bb8560236591a2ae1dcc64139ce3a6d1a18be6df |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/dff5fd392a4d35ee54ac8f1e7d44a04a1f1323b6 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/74ecf6d02d539ff3dd53f1cf00707c6ea2f8b56d |     
 microblaze  |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/5f0a3a525866519ee12acb9997d217b4a8b870fe | ORPH
   s390x     |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/b544ef35ac2247aa18df8935438f7522e6e251c5 |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fea2ed103fb781d90ee138c88b9a7c867b3a1ff6 | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fc593bc15ba576ebb5752d1a83053fb5f1ef4246 | ORPH
   sh4eb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bdf752a20e028fde5f77be7a4de26af15fcb9de1 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/00e5fe6250d06bfd92750c4ba55af59ae2ba1ad9 | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/668b22a8d615c8caf1ef047f8fcbac3f89d1a182 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/867d06662f00ac87b2b5bf6fbabfd29c01e6ce8d | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/797f7d11710f81cff2ee59a03d204202eb15862f | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/463dbf487fd2f1d2e3ae5fd96706f36c7d5a5fbb | ORPH
 powerpc64   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/fd91b668b4fc67091402c89b0dc6572e4ed4c99e | ORPH
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/bacaadbf41ce67b0b2c9c98fc83b167274bbc9ea | ORPH
  aarch64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/bb31396a79dee4665b851c63aa927e0726ba573b | ORPH
   xtensa    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/163661c006172c19a9618e90f93e87b7fbceb97b | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/eba61c92659d80c0920c7edef26d8baaf86aaed4 | ORPH
 aarch64_be  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/f38dcbbc7eabb29816de8bee579deaaae1dcd42b | ORPH
   mipsel    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/a52c00c4881983edea6dfd364741f988179529b8 |     
 powerpc64   |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/e9926db14308ad360a2f560491ec776e694f584f |     
   mips64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/0728b11d56e07a60097430dfb1e61802f5f20eb4 |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/c99b97fbe03f4e97057b39226449b5cd7d12644c |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/7476c48ca3fa6b3e9a43dc6a918e8b2a3b43882f |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/76ca5f24c995bcbcbae47cd121bfab0c0d17aff5 |     
   s390x     |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/27819c999d8ba8bc2e407447c5b921669c55512b | ORPH
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ad195f47c177f25ac5d861f11453f13fd6b27dcd | ORPH
    mips     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/4071df6ccecb45b7e237827b5219d50041bc3e37 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/5c9a816b8838f0257a6f1477ae071551924d23f7 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/099326141783d2c0a30f35e1550206f44e2ca640 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/090c0739ceafe91f2e48797df0864886cc03ffa0 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2689474e3f1e6900d4d6b16f809393f62d9c5ab4 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9ea615fff69d5c76ec18d8209085245df3efa941 |     
   mipsel    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/35e8885936ac1c44467ede16c71726a1f0d35d08 |     
   s390x     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/ea438685ad56c5976ced6079a0c9889bb421ee5a |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3e1c384f149acac35216c5b4d20d104889cf3910 | ORPH
microblazeel |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/b546c9de4cd4e531def6313548ca22f0774a2547 |     
  aarch64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/bab5fb9a9f5e6536c30d98dcaec9f296f30f8e1e |     
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/6396d1152870b7af7227293f3ada5ab7a0e68818 |     
    arm      |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/4a43a299ef045d64f4f8218f40506b3866920308 |     
   x86_64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/d472367044b8278bf25f09c95f40adfa99fa3e6d |     
   mips64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/1dd27887688919e8f8ee5ebb34206bafdcf51bec |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/6f86febab5d04e93a135e8236b57a9642230e967 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0cdd3f023c87d51be8b278d285a7ace1edbb4605 |     
    arc      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/ee53d68ac4ce12b3f82e5ceded3fd63f9621d5cf |     
powerpc64le  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/af6d7465597ea5435ea887626924a6b3ad702a70 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/09894fa1ceab800819b8f92d4c5f652508c37273 |     
  powerpc    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a861d910cd920bf342e80912d37a112b08b5d5c7 |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0456a9ba4d19dc0a975ca5ec2e93292543af5a33 |     
   xtensa    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/b49f38a65dafa955e525efa681e374eccf280dc5 |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0f29bca3e48795bd387f337d9b6712d6d531e74b |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/1bf48a2095055ce4cc3c642ab0d4996e23313ed8 |     
    or1k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/cab7954c17bd8fcd6413a1d5206e6dd3362fd78a |     
    or1k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/da24aa4814056d58d6c05a0369843ce961bb4f3d |     
    arc      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0859c251c2afc22d8a2ffe4c030b9a252de07e5a |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/60572590c8ccfde26caf8554a87600688d55cf24 |     
 powerpc64   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7c816ccbb8116932ca01bb94c17cc083e336fb1f |     
    i686     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/cd3f2c617ae5a3fef2ff4dab76735d21ac50a231 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/71be225cb9923d8b2a993ecffb30423769036916 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/fe3f4befc9ab3132fb6fe9316b9db6442654e7df |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/53052549f28f754ec128d2aa3d591ca0c5376f60 |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/ac539404793e086628dfc9aabf11ed501c19b004 |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/30bfec8cd30376b21b10efde06962d753655e1f4 |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/79b9875d1df5ffafca8df698aa770d54ad30f9c7 |     
 powerpc64   |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/1a03ebab5f4d6691c6eea8fbf55c767dd83b7f91 |     
    or1k     |      host-python3-3.13.11      | NOK | https://autobuild.buildroot.org/results/3761a1b80f4a2ceff85f0526515d6ce8ba6896e6 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/8b7626ee166b5afb417c4d7884927d9240ba02a7 |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/b787714c182e75e5e31a93c3fc9ec4789af0ebc3 |     
    mips     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/fef191ce03021cb14bc3fc70d6eaab29b58fb538 | ORPH
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0370d6424c0a988a16ddde0e4d2a1fb8e4d5d8b5 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/b0db88ee053381368d45ec017515a7389de065be |     
loongarch64  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/dfb25dadd14531b0d113736dea8df14babe46e29 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/71c4aac57667031e7cea1ff0eb8690d46624b0a8 |     
    arc      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/bc4710d84899138449e3fd146dd5b7f9987d1b18 | ORPH
    mips     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/3427f9b4c339d2174b1558af55715d3c74d4a59a | ORPH
loongarch64  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/cd71b88bbe1811aba00d1418db215e897f84a7c6 | ORPH
 microblaze  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/d1ae96e433e580fd65107e1a368173d6777553bc | ORPH
 powerpc64   |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/c08f95f9f4e351877a3637b059a865897d7c5a33 |     
   mipsel    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/fb662ba5c2455abf5298d32d27b513882e2d37a3 |     
 powerpc64   |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/2d46d6c8e672c618cdb9fe98786b6498c18af9b9 | ORPH
 microblaze  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/38979ee9c1ee517211284be9423e99a0964f4a85 | ORPH
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/8e825e53fd743f5beee44069fa3e6b5e5d7d9a0a |     
 aarch64_be  |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/db3d14d68ff1785eb2e5a85a4296ce9e438c9ec3 | ORPH
 microblaze  |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/2595f3ee739ba87a04afed59b2b01ca4d6b76a40 | ORPH
    arc      |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/af226c86cd8ddf471353d91b1c6dc2f82ba7d4bd | ORPH
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/7fe3932b41cc7157afdb9c7dcab8594c3875ea08 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/6d568a85cffd0efa29d246401e2e703e8cdfbe8e | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/6377d33a44f0abc152d376dff220c8d6b078d1e0 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a6264ed9fa27e470cb4191869c34d3bd766eaf0c |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b77d4290fa9338f1747bd840af8ed955c783ef57 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/adf74ce5553a2d85c1b0684ad76981609a2ce14c |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1486fece765e244be3b1a35b1accd0a9edbcc2ec |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7c1418e80dff29c07446b175ba2b9d5edc05fc13 |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/89ef1cbf5be711a9cb5662f3b864a49fb74e4735 |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/dc437e7281d3d30c86ec600a51f14f1dafc9e399 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/84a13fcb667bbadd39e531082ff65bf6f479b4b2 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0127b68a4791ad0491828361ac856f7572f0ad04 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1aa17467136586c5806e4f666e322144c2923d58 |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/662acd7e112e80552284e475fa542bd57c835a66 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a0335a8b46ed6b91d5c81cf8bf379362d49758a1 |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a42169ef160357011058cb6223ae32a2b729d23d |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/eae0862924ab222c00cff707ff28be648e9f8833 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/23c8f949af2a19f583a2c4c601a0da05841da55d |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/aa8192f582ca3bfc3bbcc5ce5f27f57b3ccc8c46 |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/637dff61d258eba4bdad1bbcf39ede719ce9bfbf |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/4124bbb391e63e1d40384cce455f8dae7b6e5925 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/80cee3dd1d41b03c438f228d0cfd3f8c9c8f3b5b |     
    mips     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/895443ae7c98eb4b023c8e999b24ec71d432f310 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c12094a7901654c19491d81cf6156cb14925b745 |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/63ee1adf02cb1306db1e5a98018ec08602ce6320 |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/4e5364e71db7091af7524b62f0f50fa46235d47f |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/40490df0bea9521812b31f68b00f305c45205a0a |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/0de539fd69c75d5bd5bd87c22a58a2737c07d0e6 |     
powerpc64le  |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/f6a509958031db870303dc4148cd127c07e425ec |     
 aarch64_be  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/86b830baa70b5d63d04552b37c5f15dcc8023c01 |     
   mips64    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/4e8213de0d4157aead402fff03ceaf421ad9cd4b |     
 microblaze  |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/15e32aec38938d6e57774a2ca8ad901e08966f08 |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c2a2ec87ceb6836b53489dc51870103f7847b237 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9146b63f71dc8395dc92b99e48023d8629799d1f | ORPH
loongarch64  |          linux-6.18.1          | NOK | https://autobuild.buildroot.org/results/57451e39faa6f354eeb8753dc5478c0424981508 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ba9533253df94b1ef9a381bfd4d812072a663bcd | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a7cf5fa4a7236afe41e5a1629f488d2a264fb343 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/120171c4eb6d64fcecc645f80767585302343a49 | ORPH
   mips64    | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/f25740f11e32675f2f276a73db59104eb3d4354e |     
   mips64    | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/ced606374202d054e24090a36dbe1223918f05be |     
  mips64el   | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/928164d909ebf0594ef1ad6aa58d3882ceb5b53c |     
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7b3fb83b275d84aa4f9e76c16a68ebe3a97ee994 | ORPH
loongarch64  |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/f46be79bdc86731551625954078c09b232b18af3 | ORPH
   mipsel    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/de67a784ed1e090f73ae66a00d83f6b02f2ed2d2 |     
    m68k     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/17e05f5678cadf0d6467ec3872f535e319a31470 |     
    mips     |          lzlib-0.4.3           | NOK | https://autobuild.buildroot.org/results/151ab23c26e669da9a1694e34fe26bffe4f7db3a |     
  riscv32    |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/00bbaa96fe719bf4b090e7717bbd1d897841cf56 | ORPH
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/640ca9d5bfc453ddafc2900251bc15d7c9c93c08 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2fed15f6a58582eae9b979867a0b9ea4f6453cc7 |     
loongarch64  | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/20e930366ca84a841eb0c71ef80404fd2bdfc5bf |     
   s390x     |        netavark-v1.17.0        | NOK | https://autobuild.buildroot.org/results/e86ee29c9b9207221e26b2e862f206b9f50858af | ORPH
  sparc64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/cbec7f7cbe3711dd7a6285705c6c8df4f10ee608 |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/2ed888332f00fa941685d0ad2a1b896dac1d594f |     
  powerpc    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/158e4cf97c0f88dbea6c528eee37de44dfa25e35 |     
   sparc     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/6f82540981b6bab1acfd7866a5189a2ed844aadc | ORPH
  riscv64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/c6e6dd36d87ddc61cc6fd252311df40388a9a144 |     
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/235e79429e7ef4115a0558bb94d2156f57e56950 |     
    sh4      |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/890cebff116cc1cf1ad54968aa354f453d6717e6 |     
   sparc     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/e56b9b5e947ee075a3d07a53dab510ff958befb7 | ORPH
   xtensa    |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/a913b0666105ffeb3efdd759d8621e5441bd7aa9 |     
   mips64    |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/83aef3cea1bad163ab71c9252eed762cbfb822fa |     
loongarch64  |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/fd7e38b8a60db9cadcd1fe99fd0a8c6452a8955d |     
 microblaze  |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/77564c5b26c67a6eda4f727ba29994a690caed8c |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/c95525dc3ebebedc5cf073a872b4067093216e42 |     
powerpc64le  |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/d07e7fac320f40de6fda3d7184e6a1c57075edd0 |     
  aarch64    |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/18fdcdbf344ed50010f4660532e3a7f6e77c1334 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/5f40aa6dc93ebab22baaad95fec793d93a2f8536 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ec3f01b6ec037395060ca9a1c6d165c2148a18c0 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8cc1350c1e3868bba7099313314c9f8a3663f4c0 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/fed851e8f8de11c329630366a5b59c4197047abe |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/33dfd84267534bf3ab8694600165bb49d8d0702d |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/5d74a335c9ababe8de24c5e83cbda066db5efdf9 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b720ba9f59488c3695a3987fa1c2f8fdca5f1220 |     
microblazeel | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/506a1cb22348ae0dab720d009df3bb271018d7a6 | ORPH
    arm      |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/e1ebfdcf44b62954594a25302902d42d0d46c612 | ORPH
  riscv32    |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/813a6fd4e2a11ba08431615523aab79b157c6960 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   cvs-1.12.13 | 2 
            18xx-ti-utils-R8.8 | 1 
               asterisk-22.5.2 | 1 
           at-spi2-core-2.58.1 | 1 
                    azmq-1.0.3 | 1 
                 dc3dd-7.2.641 | 1 
             drbd-utils-9.21.4 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
                   guile-3.0.9 | 1 
              host-rust-1.88.0 | 1 
               libconfig-1.8.1 | 1 
                libselinux-3.9 | 1 
                   lsof-4.99.4 | 1 
             openlayers-10.5.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
              udpcast-20230924 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/7f9b25e0e96ca2f9ed95fe322c2568efd4ebdf7f |     
  aarch64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/0288f1634c29b68dabe101376c5d464dc8c038cf |     
    or1k     |      at-spi2-core-2.58.1       | NOK | https://autobuild.buildroot.org/results/e5661c43bb2506d940309ddc74760de7f4db7cdd |     
   x86_64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/e74543b48318856aa7e124fbfa8ee1724cad78a8 |     
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b07e4657230761ed397a9a7bd5f2cdf641b9bfcc | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cce18fdef6477e9a059908c52a6c1226749185d1 | ORPH
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/345c1b104c3cb6ae483f3a3d39c3e8234c9da7b5 | ORPH
    mips     |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/2dbae5912b9b3b84e3190864afcb2929cac02183 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/716daaa354479aba307139f3cf2c8127856bbfa1 |     
  sparc64    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/4dd8cfb38d79909c5ecead6fc1f1d3344e0bcc59 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/54b693c8bdc730dfb772671b81d010aff0150088 |     
    arc      |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/0cb87fa2bfab6b853f5663243c54ab5e82ad780b |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/72256399db8a6a5163b5005b54c31f4e7497ba7d |     
    arc      |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/e95cc6d707f091e69eefb00c4b42e3d5f569b986 | ORPH
    mips     |       openlayers-10.5.0        | NOK | https://autobuild.buildroot.org/results/4882e490463cfbf3a52c406fa2b598ed6775ce12 |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/ebbfc7898297eb08563ce8232ed6aed9732ddf33 |     
   arceb     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/4fc5e8d48f61ae63e69c2553492585e69820f314 | ORPH
    or1k     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/8bd7a8b6aa9f9f3561c28592a046d16f31120cad |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        ltp-testsuite-20250130 | 3 
host-go-bootstrap-stage2-1.... | 2 
                   linux-tools | 2 
           oath-toolkit-2.6.12 | 2 
                   perl-5.40.2 | 2 
                       unknown | 2 
            18xx-ti-utils-R8.8 | 1 
                  cmake-3.31.8 | 1 
                     criu-3.19 | 1 
           crucible-2023.11.02 | 1 
                   cvs-1.12.13 | 1 
                   dstat-0.7.4 | 1 
                   exim-4.98.2 | 1 
               freetype-2.13.3 | 1 
  gobject-introspection-1.82.0 | 1 
           host-go-src-1.23.12 | 1 
               host-ola-0.10.9 | 1 
 host-softether-4.30-9700-beta | 1 
              libcamera-v0.4.0 | 1 
                libdrm-2.4.124 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libssh-0.11.3 | 1 
            libxkbcommon-1.9.2 | 1 
                 mesa3d-24.0.9 | 1 
                netdata-1.37.1 | 1 
             ntfs-3g-2022.10.3 | 1 
               openblas-0.3.30 | 1 
                 openssh-9.9p2 | 1 
python-remi-2022.7.27-37-g1... | 1 
                  rp-pppoe-4.0 | 1 
                 rtptools-1.22 | 1 
              tailscale-1.78.1 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/5818c9404b4551164a484d6286f3a782bb065264 |     
  mips64el   |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/2f326707f015a254660dacb04452275aeab9b2e7 |     
powerpc64le  |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/1b218601f63022083f07564cdb6215eba94d5970 |     
   x86_64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/867577eee049ddbdcdd46c0bdee5d695e51bc51a |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e098d0cbfc3f42234d24765790927cfe7f6d9d20 | ORPH
 aarch64_be  |          dstat-0.7.4           | NOK | https://autobuild.buildroot.org/results/7d49d99b2312b506aec590011ca853e72b84af0d | ORPH
 microblaze  |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/20ed017a700d38e04a2e7ae8d63ff703edb0d25f |     
  aarch64    |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/8cd39a9b11280dbec8a2b1ca4f8a73fbb835b4c5 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/ee6fe556b00a49e183eaf559c7a1c59de5a9bac3 | ORPH
 powerpc64   | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/c0d4a2eb9fa8e97a021a8ddfdfe41347473c1693 |     
   xtensa    | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/5f05f3f03904fe9be3fd598657ffb51603502b08 |     
   mipsel    |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/553c8637d90b4238a2b3000eae68cfa3200289ba |     
    arm      |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/f7277e2cef40e731b170b9b80032c6545db80351 |     
   mipsel    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/6dcb5cfabc4482b6c3694b87f85cc133b93b2fc0 | ORPH
    sh4      |        libcamera-v0.4.0        | NOK | https://autobuild.buildroot.org/results/1d8d74552bc123d5d6b6ef97c21847714566b520 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/ee0277332c2b59a35abb599d8b33dfcd7dca8df0 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/91719658e792e32ba8b438f6568d81be6b48942d |     
 aarch64_be  |         libssh-0.11.3          | NOK | https://autobuild.buildroot.org/results/39d73a246085204a3229b9c316c1091b0991a52b | ORPH
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/48104057d2ccefb9a45f99d5093eb1947b478d3c |     
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/901adcd084157bd8d73ec73774d9dd108994b08b | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8e278d24d92ff42cf9fabe30e0d2d5ab7af62fd3 | ORPH
   mips64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/76d6caf583d0652bbbe58a4210ac026aa9aafb8d |     
 microblaze  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/904ac4ef5f5b2c90d39bea287f93fee4ec358514 |     
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/1384b72ddf6fb49b8e97707aabcaa3150ece0209 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/3b73dc39dcec3933f2166685d27f69c1fda43d28 |     
   arceb     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/7c923e0b3a68923cd017567d1145b8076f9fd929 |     
    mips     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/7d56d24d6b0a87cd281c5624cf990d9e5a3659c3 | ORPH
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/f0c3cf49152245594e1a348211dc5576f7df40f9 |     
    or1k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/743f013e393e74014716b0ecae68feba4332cdc5 |     
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/740c45b2746a3ca8437d5c334df7bf56c5035afe |     
 powerpc64   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/8a198ef6ae1e4f425b89578658c92f7ba1845685 | ORPH
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/688fada4913406e420c74d0c3784822d3128f489 |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/46450cbefa392e2765c27b4027288098611153b9 |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/bd09d724d0605779de279809edd85e9d1c5c29ca |     
  mips64el   |          rp-pppoe-4.0          | NOK | https://autobuild.buildroot.org/results/4aa5533bd31b363706ebe4b4c7e27c2f23020d54 | ORPH
    mips     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/bf94a551393739e84749a4b48ae3fb78d725f401 | ORPH
  riscv64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/1a2f1c4b173ce2ec379c3af0ac49ba8e81ea5399 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f2f8a5024cf1681a0172bdf5dec911cc1a4662e8 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/9ba414ff23b0f40e306710c27072cb5e60a6c8cd |     
  mips64el   |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/275962821d578bdd44d747bd3a10c0aa1475990b | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

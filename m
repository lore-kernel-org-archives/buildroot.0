Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D446CF8558
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 03:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7904F4023A;
	Thu,  3 Oct 2024 03:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utaYo_QqRSw1; Thu,  3 Oct 2024 03:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33896403A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33896403A2;
	Thu,  3 Oct 2024 03:18:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 783821BF28D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 03:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7467860634
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 03:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45Ao3GkSV9sV for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 03:18:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 666AB60632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 666AB60632
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 666AB60632
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 03:18:09 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso62797966b.0
 for <buildroot@buildroot.org>; Wed, 02 Oct 2024 20:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727925487; x=1728530287;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QciyRvI25IkZsc1ghFpOkUe/IXk3es71eA6nsHvvhg0=;
 b=c+WkqnQUxre9hQTbYovr/7WIp2MKczHX8l5nw3dQbYBAztQ8aH66BZITcodDSjCM0x
 SKaKEv9DPSkdrDBxzRskKOk27bTrCJC5+Ps3tVx0NnFKVKH8YwBiRVTN97Fqvb/J/fdX
 DMUdjxD1RJRLFXNaPkF2ZpF7X9/pXt6+q4FxbM433ClwGcKk3tO/rYboXmysJv1jzBw4
 nLMgqe1LWL/2GZLIyWzK1vEwrSq/sNtpbm693SjJwMgasToXGjKoqrtNk6w8c77lBeyS
 2ClZu6y5qa0iFZu/87Faw0miwpGFmIlwPysNALzmkuJj/ITI6xedIRJnGEOM+9pTqtbx
 Zdrw==
X-Gm-Message-State: AOJu0YztKa7ZsaLU09VzDKWYqhc/pxLBrKHtM/GtmuXbMtobNXP5rkZ3
 3dLXL5d89Lng31myoD3PJvTtWIbRCvHJjUwh6oMFfJZS6MT1Q4x055c7BA==
X-Google-Smtp-Source: AGHT+IHyPP2aF4D8fYgqJLE1kpNYfIM1CCOcAqr74Th0Z4vFUvwmNcNvfPTCYUZaRivj+NeC0drZjg==
X-Received: by 2002:a17:907:d29:b0:a7a:be06:d8eb with SMTP id
 a640c23a62f3a-a98f838781bmr506057566b.53.1727925487091; 
 Wed, 02 Oct 2024 20:18:07 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104bf8b0sm16926866b.194.2024.10.02.20.18.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 20:18:06 -0700 (PDT)
Message-ID: <66fe0cee.170a0220.905e7.0492@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 03 Oct 2024 03:18:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727925487; x=1728530287; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=QciyRvI25IkZsc1ghFpOkUe/IXk3es71eA6nsHvvhg0=;
 b=WokIB5ZGzH6iI99XKpgeJQs2JW2Nf7UtoBfYIs/Xu1zH7s7Mivt0zXa2bb7S+YJoHE
 fXtcmq7LjsV2KSzmZf4kTprgqda8V25Qvp0/S7qvsTROu3OYbA6XZWme5QFWHcKpsN24
 HnFd+xChSultNV0bNE1TcKoViV63FpX6q8L6B54jR8eK3IkSQtNcfXrBFJo+j8m2rdgv
 q2kSpLEynBLO53dOyMMmiPYvQR3fyQwo9JU1H/chwYJDHkz+qwJpWBZwnjwlb/nKglvk
 Pwuxm2tTYupfai8D21loj9sRSOREcdRMQRUiGnURYslgVMo/umPFmTE4wpMMbLpFENhA
 qPCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WokIB5ZG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-02
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-10-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  2  |  0  |  6  |
  2024.05.x  | 21  | 22  |  1  | 44  |
  2024.08.x  |  2  |  5  |  0  |  7  |
    master   | 12  | 79  |  0  | 91  |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 10
             bluez5_utils-5.77 | 7 
           host-librsvg-2.50.9 | 5 
                libcurl-8.10.1 | 5 
               procps-ng-4.0.4 | 5 
             bluez5_utils-5.78 | 3 
          linux-5.10.162-cip24 | 3 
     linux-5.10.162-cip24-rt10 | 3 
          obsidian-cursors-1.0 | 3 
                  bind-9.18.28 | 2 
                   duma-2.5.21 | 2 
                 gnuplot-6.0.1 | 2 
            host-ccache-4.10.2 | 2 
    host-python-greenlet-3.1.1 | 2 
                 linux-6.10.10 | 2 
                 apache-2.4.62 | 1 
           at-spi2-core-2.50.0 | 1 
             dahdi-linux-3.3.0 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
               graphene-1.10.8 | 1 
            host-binutils-2.42 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.80.1 | 1 
                 libgee-0.20.6 | 1 
                   libidn-1.42 | 1 
                liblinear-2.45 | 1 
                  libva-2.22.0 | 1 
               linux-pam-1.6.1 | 1 
                 mesa3d-24.0.9 | 1 
                    mpir-3.0.0 | 1 
                  ntp-4.2.8p18 | 1 
package/zabbix/zabbix.mk:14... | 1 
                 pixman-0.42.2 | 1 
               popperjs-1.16.0 | 1 
               postgresql-16.4 | 1 
                       unknown | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/8f49ecd464e783dc0a7492901aae99808d072053 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b03640977f45448fac7cedd6881d89b1223e8e94 |     
   x86_64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/5f5607c34cdcf6f1895ec65c99d7f4531f9445f1 | ORPH
  riscv64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/6d15f6dad430f4924f29601f073f0eade9c10279 | ORPH
 aarch64_be  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2edd6e6cbadfb7b702ccdc80d1d3f9eb0de15cbc |     
    sh4      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/24c99b6be4c36db50049167663f20acb6cd9c278 |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/be2668bc52569177f58e80e066560f7aa16562df |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/945b1c8313b40f813cc6ca11dd616f803c2307bb |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/6f799bd0c83739dc0602288c7237e8cc4e2cb6ec |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/6b453e9fea49f8dbe96c879ab56394e3a9cc8dc1 |     
   arceb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/acad971b4a1cfa0860b7edbd2ba963ce9c59f91e |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/5d61048adb1c7eb49fc8296f4cabf870eb5423c5 |     
   sh4aeb    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/9c06a292e4e18fdedc5f69de32dccb945d434cf1 |     
    mips     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/088aac6cbaf67caa72797d113cf24a373f97548d |     
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/488abfc6313a150d2cddf03befcac56c5e478704 |     
   x86_64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/3b33cd480b8d344d514766d9856ffeed61a01e54 | ORPH
   sh4aeb    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/6fe32e93863e11cd97229810e025c0d09b8e9ba6 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/88a42c0d42fbd7e23b93d1c637e470c8973565cd | ORPH
  powerpc    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/5f5b91c156e1e03cc46d0b8dff586e7ec704e4f0 | ORPH
   mips64    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/307395fa34a849f901d134da235c044708d199ba |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/ccd77e7828e5ce5be2a3ede7557a46fd06f17e4c |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/3bef05f2ea39b3d5a5d2b5b2e519875085e3526a |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6ec682f144c9a6866d571298c9f03122963bcf85 |     
   sparc     |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/b76eab4990c164c6533d7204581aa362a5fc2f50 | ORPH
    i686     |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/a522c05408dc5c77403de5baaee21a3496a55a5d | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8fb18378be2fd05150e224b5e27f430c4ea4ffdb | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/28456d9d7976ca04a872b4c2a8cdc77070e2a4c2 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/db04d51735b26148a8ce93651f5ee41a0656112c | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a3ca3278b0647fd5be18216de6f58867474dc185 | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a104e1b24d4b88a367201130b9ef8cfd8d922703 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/848a28ef6684f7de5d30fb0f38ad37f8a1058843 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/31f3b80a7bf7c0314aa0412c0349c4c88a3b822c | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3dcad82bcd86588ffa52391eca56d32a28266ea2 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/07b07b4ef842db99d6e9be5ed84ae450b72d9905 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dccdf3d7a2fca6490176f5612d2e9689669124fe | ORPH
  powerpc    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/60aac4167158fb18db49d627e652c6ae5c895b58 |     
   xtensa    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/e614ea9ab5c7906b23b87162fd75a5144f807cc1 |     
    i686     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/1feddcac92a0259fa4b08a79ce5a9f91dd492920 |     
microblazeel |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/153bafc9ebf14ddd8ec1674776942d3a235a9087 |     
   sh4eb     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/b68e7b3476434223b8eeae73edfdf50b3bb5637a |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/f95e460733a630a9d9c18301a49990f1874c9ac1 |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/67c146b23cd3e44fee308bde97f9238f04421ddb |     
   x86_64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/a8534e6d84a718ec7c247465025913b6e293fccd |     
  powerpc    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/e31d2b4a7189597fbbb10470ae15aae042ede980 |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c4ab75fde37f647601c482688300154375d52f06 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/06a4d854bddf77c03a58ee693f32d17f4e439ec7 |     
    m68k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0bc9fee4f2ab20c0fbfea3df4aa8cf8385ed1c42 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1c29c1ec72422c4cd181b2b23edd548008f43bf9 |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/cd00e81eece120ddbfe6af14fb8ab046b5ba24c5 |     
   sparc     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/dc607a7db9238a899f1908af7fda06cab1cc9e23 |     
    arm      |          libidn-1.42           | NOK | https://autobuild.buildroot.org/results/9ff9bd0a9aa1627beee0b745dedc71c5eb08c66e |     
    or1k     |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/9244e85c7766ff23f3e716c53a3525706a6ab5e0 |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/f3e30b4d7088faa98e86dd440698abb446dd5019 |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6f85af6e46b998fa4e410398f49e0950de8aacda | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0ae29b9041435a59fd52ad8c801111cad8d266c6 | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/44d171279d8f4b4f7eb1dabeee46e68b98f1f0cb | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/acc9dc3a596282528e42870b4c1611fb43c63554 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6ee28ef84a81ed015fa79c09653b980e5ef182bd | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4499ecd8881088acbbdbf11f83b193414295500c | ORPH
    mips     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/987442efc9038d25ec4adc25ca848b5bc6ab4b27 | ORPH
   nios2     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/12548cfdf2cdf5014a07f8d429aed9a78ce584e4 | ORPH
  riscv64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/929f1ad7db41c73a0f21160ecef64acf0fca5ec4 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/b234dcb4061885a8d1d8fc167a34b84c194a1934 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/52449515e410a40867448b075a46dce49f3ef77a |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c6cf520f7699e744db57ba63c68b9d1c048675fc |     
   mips64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/b81f90b8e2910c2a97ffa22aeafa79f1e221dfa2 | ORPH
    or1k     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/b8d73294e87ef345ba52a37554a629a6b59a467c | ORPH
   s390x     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/16ca353bcb4cfe9e3d7d4843e2a27788226fc5c3 | ORPH
  mips64el   | package/zabbix/zabbix.mk:14... | NOK | https://autobuild.buildroot.org/results/67b72b325de578b12c4a953b6b635dfcb71e77ac |     
    m68k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/57556769c2fc2ae0a11fd7953728a45b3d0565c2 | ORPH
   s390x     |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/be2c9d23192d7b59ce981b9cd9f9ac7a15998d94 | ORPH
  aarch64    |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/6a1a24ff53112a96628aa87f1c7426b657aefae7 |     
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/601b30d894bbeb540ced468a235f7e555b30977a | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b7ff99a364f85586e71a41fb4697cfbdd848976b | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c0e8467165f589f0f6b76b2198fb4159e4237277 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7ae6aab9f6463e068f9f89db7185eabd47c25005 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8fa573c68fc130e58721dd6a89d4a2dfa44bde95 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/1b078c88e438efc287486370e8ce2d53b8a21644 |     
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/9dc645203f4f332e621c59f6066efa8b5cb7a7a5 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
        host-python-lxml-5.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/f31a2455009e7dc30b2b0c5686b35e90ef594cf9 |     
 aarch64_be  |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/6c5aff49b45efa7418df3bb2f5b026eee691f93b |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 apache-2.4.62 | 1 
                    eza-0.18.8 | 1 
         gobject-introspection | 1 
       gst1-plugins-bad-1.22.9 | 1 
            host-binutils-2.42 | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  libffi-3.4.6 | 1 
                  libsepol-3.6 | 1 
               libunwind-1.8.1 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.8.12 | 1 
                    ncmpc-0.49 | 1 
                  nginx-1.26.1 | 1 
                 openssh-9.7p1 | 1 
                 pixman-0.42.2 | 1 
               procps-ng-4.0.4 | 1 
python-unittest-xml-reporti... | 1 
qt5base-da6e958319e95fe564d... | 1 
                  screen-4.9.1 | 1 
ulog-0389d243352255f6182326... | 1 
                ustreamer-6.11 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/ecb7bcf339d451ff7614a791c9d69f48bd4f47c5 |     
   x86_64    |           eza-0.18.8           | NOK | https://autobuild.buildroot.org/results/b95dc0fc940d155474bd228e70f2c8ff2152b60a |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/dc6c0ba862c8e19512d1ebc54fdba2017f32dee7 |     
   nios2     |    gst1-plugins-bad-1.22.9     | NOK | https://autobuild.buildroot.org/results/820012c6abf6f4886d320bf97d10915a15b5d9c7 | ORPH
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d51adfd259d1da42e5d40029ce44528aebb6b6b8 |     
  mips64el   |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/da1bc6f441860356816754e8f6aa37d6157b925c |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/83d2e7a8de47aedffa22fe1c88e59ee239bfd440 | ORPH
    or1k     |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/b2568923d6fa4cb6a2357cc1e4ea2fb55103f6cf |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/f5b28c0883aeb2677ed3438de64130146a723b69 |     
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/724caa658c0258b64a091b9f4e0adffb3c4c3442 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b0c237cb6ed0ba5ac49a8976beab15f6a5f11bd5 | ORPH
    sh4a     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/38c09d47b1af1f47f6019c4bc1ba4aaa118eeaf4 | ORPH
   nios2     |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/a21cf9b3abe1ca32afe87051aeea11e855029f06 |     
    or1k     |          nginx-1.26.1          | NOK | https://autobuild.buildroot.org/results/c1634cef3741f9f7d02aee1da9735cbdca8e1ff5 | ORPH
  powerpc    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/d093fd285e58f6e0201aff01488884d05862fe09 | ORPH
   mipsel    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/da57f6a434ec6544a9ae68b0df9f4ff9e96cd508 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1ad343dd3ec03de20703475580f96421de919eda | ORPH
  sparc64    | python-unittest-xml-reporti... | NOK | https://autobuild.buildroot.org/results/59bc7524dc36a8388b483ff8161a63f23b465a3d |     
   x86_64    | qt5base-da6e958319e95fe564d... | NOK | https://autobuild.buildroot.org/results/8fdea836a4d3e4e87d234f532dc090db2c1854d1 |     
   xtensa    |          screen-4.9.1          | NOK | https://autobuild.buildroot.org/results/d33751d88af521f0e09d74e86d94d3ce20976c20 | ORPH
  mips64el   | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/1992aa76a734a96ed2837ad0fb97515905b8db7b |     
 aarch64_be  |         ustreamer-6.11         | NOK | https://autobuild.buildroot.org/results/bf1ada7931b146842b94a6bde3a370c1714e0da7 |     
  riscv64    |         wtfutil-0.41.0         | NOK | https://autobuild.buildroot.org/results/ecb2d30ac880e75b1015e3377f96f9717da45372 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                elfutils-0.189 | 1 
                 host-gdb-14.2 | 1 
               lighttpd-1.4.76 | 1 
                nushell-0.85.0 | 1 
                    sslh-2.0.1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/20dc2f4138dad0cf60efe691ccbc014676caf8f3 | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/983fec29846e4b3e6c25c9cab670dafe288a19e2 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | https://autobuild.buildroot.org/results/30dfc2602d0022f0c75a4d93479a08ea2dd51ffb | ORPH
   armeb     |         nushell-0.85.0         | NOK | https://autobuild.buildroot.org/results/045b6314e4e27d08b4de999d785db7d7602657c6 | ORPH
   armeb     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/7e3b0f94f5619c0483ce1b8da27e1d2b9816cfa0 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

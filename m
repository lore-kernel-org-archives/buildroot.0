Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C57AC87FCB
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 03:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DBAD6101B;
	Fri,  1 Aug 2025 03:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKbuBlAtlq-E; Fri,  1 Aug 2025 03:15:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA21861072
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA21861072;
	Fri,  1 Aug 2025 03:15:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C30C5169
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 03:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B593740235
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 03:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MN-Kf4l7Uvjh for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 03:15:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09D3B400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09D3B400FF
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09D3B400FF
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 03:15:22 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so88647066b.3
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 20:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754018121; x=1754622921;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cTpB/FZTbq14C3P+BiIE3NpRWb6M9ErZ64dFtXSTPes=;
 b=rRoGshisFB7o2qg4In5Ymn6DFKYsUcNsoIEMXYrHpeqUhiekHObZSG8fwyq7GEbwXy
 l2cy8fQxWxVoHqaoLqAphzD4OTDmwfkqianVxskCEQa8zmKYurtmtTKtN/V96B7MyKvt
 QZwI79iVdl+2qC4M44KgQ0XSrqPQ75H5FrtSLM50Wh8yQE5kjBUaHRjxac2/lOuvQ6ha
 3bbQvKik+V1VRVWd/kYU6++MD//a/N5tgcOHxh1Xl5iYy6T7WIsQUyC9M997bioTfths
 SKonyVs4OX9eitaBIVvqpH9Ljy1gxl1qUesZn1N+K/fte+AuozWvd7lWz7NNd4VhDXfG
 n9zA==
X-Gm-Message-State: AOJu0YzG/ENRN0ejFlyMMvvyGBimuWlygizSpNkNo5J2O5g63auRAGJQ
 p2iDzhmFCQ1B+X+t00saoFMJq5WXGa6Tk7HM69VEqiKWu5reCV+mak2rpy89dQ==
X-Gm-Gg: ASbGncsAvDsxxGZCHsKPhS1IbrUMFBUwe0nLbgu68Bxj8hAPDmSA6PKfdZycdOl8jpV
 hchqPBnS9oL5YL+UzCB3MqNsT092RNh68Pj6d3PuxKhYhWzcv2gvtLPimsRTkdcusBvJE9jyap7
 UJhQTaK5ThxzrYJAI7j8H5ZemSpw/AUZHb2vhlcv/A11Z8PzxC+Rjn0FKZzqSag+VQmMfqdFnWE
 AifHE7h6ciIwZmNIcd7M2RN9JHr+Y/BUXZbup8p3DUBLjN4XllPwDsLdfQvPrfiVzPmip+3fuxC
 wjY0iekIzxZnrJTADUfCrr9Bj19qLlbH35+ee6M9D/aAaW6ZU6c+npFnfxE3OsYPta+4lzq0VlK
 3+A5FQ2VBFoDalDU6lCua1g+L7/80Wi1tEUQC
X-Google-Smtp-Source: AGHT+IFvoDtktYCU0tKAmso4UBfxdzMkKW1y37jtV3qP8YjhV50HBgeBQh5Ev9TF75nsf8W6HvufhA==
X-Received: by 2002:a17:906:dc93:b0:af6:3582:f01f with SMTP id
 a640c23a62f3a-af8fd6a2336mr1189060966b.2.1754018120636; 
 Thu, 31 Jul 2025 20:15:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a243619sm215833566b.129.2025.07.31.20.15.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 20:15:20 -0700 (PDT)
Message-ID: <688c3148.170a0220.3ab2d4.8c31@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 01 Aug 2025 03:15:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754018121; x=1754622921; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cTpB/FZTbq14C3P+BiIE3NpRWb6M9ErZ64dFtXSTPes=;
 b=OcJ60iKMX/gCo7/JI9tKcR4y1vaTn0srvatpGEBE5jAfTmS7swazz9IMlZNoGAbMJI
 zgeikJY0xm1pXE4ynaIOqwQd6VEczRhV22wDC33sElE3vhwyWL47M6ox8saqELyka7YJ
 qxZeTc9QXl7aFMz8K+AVqVRfMAqFCjgQOiiQ01ziOkiTVm8d8huaTj8t7Sh3fqMg49EU
 ZXdN9TxTKuLUE4RU+F6qZgx462y+4kxInyEHuN/tBnCBZBfyryEFDUomG5lORwWdBqzW
 r3TbFyjVCc8997N8sb2WvMJpe387cyZO5iZtiyQbxq3Cpso4WbLcOw7+WDiHosQ/mxry
 b2zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OcJ60iKM
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-31
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

Autobuild statistics for 2025-07-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  3  |  0  |  7  |
  2025.05.x  |  5  |  5  |  0  | 10  |
    master   | 20  | 118 |  0  | 138 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
  gobject-introspection-1.84.0 | 5 
            netstat-nat-1.4.10 | 5 
                   avrdude-8.0 | 4 
                   cvs-1.12.13 | 4 
                 host-gdb-14.2 | 4 
                liboauth-1.0.3 | 4 
               bctoolbox-4.4.8 | 3 
        liblog4c-localtime-1.0 | 3 
              libselinux-3.8.1 | 3 
                    mpir-3.0.0 | 3 
               asterisk-22.3.0 | 2 
                   bash-5.2.37 | 2 
              fluent-bit-4.0.3 | 2 
    host-llvm-libunwind-20.1.8 | 2 
libdbi-drivers-0bfae6c43134... | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
                    linux-6.16 | 2 
        s6-linux-utils-2.6.2.1 | 2 
                   thttpd-2.29 | 2 
                 agentpp-4.6.1 | 1 
           at-spi2-core-2.50.0 | 1 
                   atop-2.11.0 | 1 
             berkeleydb-5.3.28 | 1 
                   ccrypt-1.11 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                   eza-0.20.19 | 1 
                flashrom-1.5.1 | 1 
       freeradius-server-3.2.6 | 1 
                 fwupd-efi-1.7 | 1 
                    gcr-3.40.0 | 1 
           ghostscript-10.05.1 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
host-am335x-pru-package-5f3... | 1 
host-binutils-arc-2023.09-r... | 1 
         host-gcc-final-14.3.0 | 1 
         host-gcc-final-15.1.0 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.1.0 | 1 
     host-python-maturin-1.9.1 | 1 
                 inadyn-2.12.0 | 1 
                  iozone-3.506 | 1 
                  janet-1.35.2 | 1 
                       jose-14 | 1 
                lesstif-0.95.2 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libgee-0.20.6 | 1 
                libglvnd-1.4.0 | 1 
                  libite-2.6.1 | 1 
                  libjwt-3.2.0 | 1 
              libopenssl-3.5.1 | 1 
                 libspdm-3.5.0 | 1 
          linux-5.10.162-cip24 | 1 
                 lockdev-1.0.3 | 1 
                 logsurfer-1.8 | 1 
                  mbpfan-2.4.0 | 1 
                memtest86-7.20 | 1 
                openvpn-2.6.14 | 1 
                p11-kit-0.25.5 | 1 
                  pdmenu-1.3.6 | 1 
                  prboom-2.5.0 | 1 
procrank_linux-21c30ab4514a... | 1 
            python-yarl-1.18.3 | 1 
                python3-3.13.5 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
                 siproxd-0.8.3 | 1 
                    sslh-2.0.1 | 1 
               syslog-ng-4.8.1 | 1 
               tipidee-0.0.5.1 | 1 
uefisettings-f90aed759b9c22... | 1 
             ufs-utils-7.14.12 | 1 
        vulkan-headers-1.4.317 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/9bcd46808ff55f965031acf9c2abcdbdc15003b1 |     
   x86_64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/68fa30e1c0e25b8fc90875a291c3b45fc0f87b82 |     
  aarch64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/ea9976cfeeb6a0ec08f211ca4555c71768eb66e2 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d337f73f8b40dac18273788970282ce7ea42a5fe |     
    i686     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/defde3080cc2118042a4e48e2f6360d4fa28e08b |     
    i686     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2a46ba38146b505ee693b6d2162a888df0195dd7 |     
    mips     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/a5d46e9935eaca60de9a4089debb3ae42f9fed7c |     
    arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/58ae1aabba7d2b9cbf4b8db1f95cfb97ec633b9b |     
  aarch64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/0b2603423442b2a70aa82c316b360aacfc94a735 |     
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/64285b07209a8aece9efeb490ae00f4a424355e1 | ORPH
  powerpc    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/f8b2465d24822b8f650f16a728c3f3a9d07e448e | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ee7389f582a1b7544d1981bf273bcdab8209e4d1 | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/180cd4aeffe9f557710dffa7a2656ce77a82ebe0 | ORPH
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8399746966be0fff4bf247af51d7dbe5c670c9d3 | ORPH
    i686     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d48b651ab9ccc241d7919f45bc83ca4c7b7bec88 | ORPH
   sh4aeb    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ba4add75c00f7b1a18f855637f3350b44a10d63c | ORPH
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/c6d375c103e8644993018ade05a478137c7c8c63 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b779450cd5d9b1f5d26ee078cf9c7da353c94df1 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9016c293032b860c6063061bb77cfd61a7eebf82 | ORPH
   sh4aeb    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b7fa31779bb6a03d7dacbbdd2b8d3a6a8d361ecf | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a3aca63ca6377090efdb24b5b709782d93c6defe | ORPH
  aarch64    |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/4a47113ca74848fd8bdec3dacaa9d4aa71cd1fb8 |     
   mips64    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/1f4bd5da8c740645abeae8ce45ff202d31a85cc3 |     
  mips64el   |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/3aeb25d956072e8481d326c05ee9f856b855523d |     
   mipsel    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/ec0ceb11eb33ac6627046d0eb27106ee8d7fa678 |     
  sparc64    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/6a2223ea3296483aac9fae3bd6201d7fac3a1d7b |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/87e081a417fbf9dab590eaf0ab7081460ac2e49f |     
powerpc64le  |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/76ebf68be418daee8d279dc4a2a15ca794bc6e39 | ORPH
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/5d759d216dab6be50db7eb2bcbc37927cb7af931 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/3fddaa37f513a4a0ee0bd3c0b8a4e1e0f5eace87 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/38d8c322754828510e79558a208db0576f2d2157 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7a294b4446b130865561d1cbb4bdc17fd5328124 | ORPH
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ac7c327c32ee9bf15453fc25385ec4111a91af2a | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a432dc0a9852830abff2d4bc96402c74bab1a3b1 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9a724a3879590c6437ea3e75658fd663c8e777f7 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9ab8511b5f7e55fb79df5df9e9deac6db570d5ac |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c8b95f15da0bd4d074e81fc6c2ff0e813659fa94 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/9ec5b2ddd801135c54a0173719dbbd8eb550ecba |     
loongarch64  |     host-gcc-final-15.1.0      | NOK | https://autobuild.buildroot.org/results/e391cf47757ca3a97bb01a9e7f7b36dda998e7fc |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/774ac16d5bb55576d1435ade732e5897c3f1d842 | ORPH
    arm      |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a488bfc9ea708794dd2f2fc934e37e56936b2260 | ORPH
   x86_64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/39260357bcf2f7b68ac0d44658d6ba9718a077fa | ORPH
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/196b9e3dbb07a18e7d436a15bfc755632bb6a38c | ORPH
    sh4a     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/4eddf4d5783be86ff90f40203561e7b6aedd38a5 | ORPH
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/b25d71e7a4ed7ed711201a05c0aa1a32e0961902 |     
  aarch64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/2a4098149d5b5501fae7895b0467257e7ded67a1 |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/0f25eaf1394145bb733fcc2ece956e87abb0e259 |     
  sparc64    |   host-python-maturin-1.9.1    | NOK | https://autobuild.buildroot.org/results/a02d0e1ea0f2dfa9230dbd06ab844737dcbc33ab |     
   s390x     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/340dfead40d75d91efbcb629a97421e6de922eb5 |     
loongarch64  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/22d6d0d0151ef3c00b28418cacbab6693c889e99 |     
   x86_64    |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/ff005db7b14b32c6d4a70a0b68ae3f40263398e2 |     
microblazeel |            jose-14             | NOK | https://autobuild.buildroot.org/results/a27bc38026983f634402ae2453b843f6089dac68 |     
   s390x     |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/440888b7726c158eaf6938ce895dfa68623e9437 | ORPH
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e8c8865ebfea394870eef2439067db8b601d2384 |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/bb30924128f8622f2da2e2d3368ceea7eedb18e0 |     
  aarch64    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/ca61d7dcef34d43b2bbc53e74d81c8afb7726e2c |     
    sh4      |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/50db79e58ef4dbe1cdd5ad8c8a3c69f8841c8434 |     
    or1k     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/2c0e76452c223c3fda84ae1a3122a6d44e49090b | ORPH
  riscv32    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/f91261125243efbd2111b1fe3a4d63969d6007dd |     
   arceb     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/43adc791b31dd930fb569995b8da2a97d63df3ff |     
  mips64el   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/cb70be7742ce882a04e65796b0cfab5c74d452a1 |     
    arm      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/ef1857cb4b863cc9ea4240a7af5a88cd9eb806fa |     
    m68k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9258f875d985f1b30d99b858bf8e12d94998028c |     
  sparc64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/80b561a21493a8974d8d50a27d5fe0c0a2972ba2 | ORPH
   mipsel    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/0b4e8db4ed5429ab9068f27a5a63300f893cf9c9 | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/21bb431653ec4b8f58ec24598199a68715e8d3eb | ORPH
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/deed2aa80971c74c32414abd8516ec316d2e91af | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/de72379caf2db8685f6a854bdf1391dd7b780357 | ORPH
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ec93029a30758a90fb9c7d4a53374d80b6c6f5de |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b8a197ea9b30ae2187db419e6f32875f2e692c3d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/987daf7438c8b9d5a6c5b71b457faae390424356 |     
 aarch64_be  |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/87b8805975ef132a58c40e622e2e023199f6ee2a |     
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/8b6ac68230c0eda47274b18427d740b857bbb4dd | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/5361fbe7b0ce4d1df1f622dc530cfc634245ad12 | ORPH
   s390x     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/acce7a51697c6099e7f4ceffab62d7d0d96d3981 | ORPH
 powerpc64   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/d5c2e0405b47f57d348b00abe3db7a64f22c242e | ORPH
   mipsel    |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/5cc01fa0965b349eef79af1ced2ed51748fbd955 | ORPH
    or1k     |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/9c5ebc34bfb8ec4eae350560ac52255c25a36a38 | ORPH
    mips     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/27325dae52e8bb9967dfcdb05343ebd85658ec63 |     
   xtensa    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/bb8b6104899a723db97bd104059affdbcfc52d28 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/5b3886caa4fb5c0519a624d81eb74b0e221b43e7 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6439388e396c2e29943d8a30e1f0617b6a9755a5 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5f6c2c09be4793887fc71efb9ca3d6840a942677 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1e9ae21cd94ac4003019bb86e964e0ff83ecada9 |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/4828ba1ff1a02c76ad334f913c5742c5085118de | ORPH
microblazeel |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/8f4d25161fe3bf3a9a3a0056a3e6a9e7e8e88443 | ORPH
    arm      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/4da3cd0d9cc1f17dacfd1a94b20edba01273bcd2 | ORPH
    arm      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/28db85eccbad671f05c5a175dfc748373ad4f43a | ORPH
    arm      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/9c564273f42d6bc21aee4cde4a4a6c39bf63ccab | ORPH
   mips64    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/f1ae4a8a9f3a9394204aac7358b3dcbfba644ece |     
    mips     |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/e7cb831dbeb792f1ab70c14e0f3e28343df65d11 | ORPH
    arm      |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/8684c025d8c6e55bd4a29fc6eadf06ab6a9a0c92 |     
    m68k     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/c126117532cf3bd45f3289c7a051789b48d18e3a | ORPH
   sparc     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/658d985335f65a8ccbe5082c40de6b7c0c8a6912 | ORPH
    m68k     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/e7fc179595baa859dc7d5310fa8526bcc85c3a90 |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/beb1720196e3f2253012ab5b7580d756d79bf75e |     
  riscv32    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/97c2083260f0061b15ee1a199e90bdb8a1b0d540 | ORPH
 microblaze  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/79315f2f86b5546b9a540440bba25ab35cb21df8 |     
  aarch64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/dbd9de3d7ecf59fa3d42ee33e44388e28d290b14 |     
   x86_64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/496b9b665cec66ffe663fbb5bb9b5cf1497b296f |     
  aarch64    |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/c335acdeed982f415ea2de6f88fa1e91f2c10d8b |     
   armeb     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/16efa512ddde31e13d926604e62f15176844c87b | ORPH
 microblaze  |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/bad7de331ba5bc6dcf684f58abc0b221dde3893b |     
 powerpc64   |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/20634f3188872864bbedad76cffdd47587f0a544 | ORPH
   sh4eb     |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/de6aa04d4982e0c1ad83f3761c51a010e3ee8fbc | ORPH
 microblaze  |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/d5ea3866f953e1a5594a9a12122668cfa3a7b883 |     
   x86_64    | uefisettings-f90aed759b9c22... | NOK | https://autobuild.buildroot.org/results/775d8f0de8257ff5865c16574a7e3b436e7a7c17 |     
microblazeel |       ufs-utils-7.14.12        | NOK | https://autobuild.buildroot.org/results/01b90bd7d78a34ae732191b750efc69f195c78ec |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fc7ad34e35ad4eda146edbd3745b39851f6c9ef4 |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/1490b087849ea3925e5dd442ba712b459af3d747 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/e7e85350cc1c4e9f447736e8d2ed9aac57d0977e |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/921f0045fc21b41d6328258036e2cc590ab6688a |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/27ed30746fc2a61731848c8395b9bcbef534c6fe |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/53ece419a92a28a3073f1964549592ac7a448dcf |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2e5cc263242145bc20293a51fb5ab9ea54f39312 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/771a7df0002a252f2ee4c72f780ef277d59dedde |     
  sparc64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/25e0d78f6a37e641db0c3b02d9f248eababa2893 | ORPH
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/8ebe33e91a59687dc9278ef32970080042bbe56a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 host-gdb-15.2 | 1 
           libzenoh-pico-1.2.1 | 1 
        ltp-testsuite-20250130 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a0fc6d45e6de8fd73106a14d2da55f262cd9004a | ORPH
microblazeel |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/0c4644b17646d3ec482f0a4cf02d6fde19db2c99 |     
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ce2aa03acd5ce04b0a914fbe2d29d0aac407a2a1 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              host-guile-3.0.9 | 1 
          host-oniguruma-6.9.9 | 1 
           libzenoh-pico-1.2.1 | 1 
                pipewire-1.2.7 | 1 
               syslog-ng-4.8.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/11d44307f9ff5c1bf7629b36938a26230292047d |     
  mips64el   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/43af23c83a5bbd8ac9918d23a18dd90b7d7ac29d |     
 microblaze  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/e6e75d2cbe6959851cd254cf297fcdec0ab844fd |     
   armeb     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/0f4d5b47a9becd657babeb5ea4853e288fc83192 |     
microblazeel |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/51e3e74ba3b641a22353f382c456807ad21f2b6d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

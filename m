Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752DEC83030
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 03:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 013A7820A2;
	Sun,  6 Jul 2025 03:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbxJ10SnAf4h; Sun,  6 Jul 2025 03:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC0C5820A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC0C5820A5;
	Sun,  6 Jul 2025 03:15:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E00312E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 03:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54417401DF
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 03:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jXdBXF1OX3t for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 03:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0982F400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0982F400B5
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0982F400B5
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 03:15:06 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae3ec622d2fso349618666b.1
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 20:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751771705; x=1752376505;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WtqIQREMaC+axrCrIacJPyaOPvLwZ66FFDbvhqR90Gk=;
 b=XzlE2y1RpoK6bk4k6wWVbdUyGYgZ3C/eY7eST1i+J/8I+AXHtqadCls9sNwqbFkPKi
 MeK4rdzyGs3d4uhtiWBEZ39wDm6HiYJLFNWBfdtzFYK9ar1uLF7m/xlblJVgH4QzabHZ
 /JP3YU3wmxQsqAGukZLLAumP53dbgnq2pwGUKrsbUxg/xk07FwXoDISxETNMxVgsDJ3+
 P6AdDYRIfhH89+/J8CyxhhYk1HSsXWi+b8xJV6GK7epy+gs5c18wyuw04Ld6fQjDyYsw
 tfTwW9ccHP64kd54Kn8QHoagSeBgxEVJmI3bjLNYgfLDe58sIEqUwNqZTihkr5Jlipcs
 wUaw==
X-Gm-Message-State: AOJu0YwIngOJfEKfJhyg+tfzdiN6HgjH27Cc+xwzYwvb6rN7pFMtWS8C
 A2qmTK6Zq4/izdpHWqClD8vSnHHU9+hSz9jqgSUT7xNUpWEahv5e7Tz9Ih/eXw==
X-Gm-Gg: ASbGncsNDdBiq/Hg3vgg8WbUicQTrfNzxicjjl5x790wwkmwxAJr8st5avEpCAFB0+8
 1resAagh1zndXTBIF4bNPWP99Z/2yIHjJngCymws6GNj44fVdd2UMxLSoVANDOgIvMNB6IFO62Y
 aVb53C0tquyYGojdtYSoedzVp/rkEToX+azAX1QT/7omgs9+kx4ruAnnUE7659cN3Zw3dM9wxwS
 3KXATCeu335IQEmBn+huwPYPtcjeHf+kwwibH6FrfTJZorj3mg7NJZNZf17FJ0Pvs7kyiuJbU80
 aOUEh3EnWH90WMZS+ww8oXM7pZyLwqBiRJrr2Q7hAnfQ6g5JE0FACSA7EqycEzeBXdSj4dO9qjz
 g
X-Google-Smtp-Source: AGHT+IH4lYt40wA/CHYwaGoYWpOyqqW845o8J4E8ahprQvb/KsMK+wi9BBCZ8kHY57DDx5KKA4vb8Q==
X-Received: by 2002:a17:907:9444:b0:ade:3dc4:e67f with SMTP id
 a640c23a62f3a-ae3fe4575ffmr720277666b.9.1751771704849; 
 Sat, 05 Jul 2025 20:15:04 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b5e785sm437495966b.155.2025.07.05.20.15.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 20:15:04 -0700 (PDT)
Message-ID: <6869ea38.170a0220.1f7e31.a5fd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 06 Jul 2025 03:15:04 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751771705; x=1752376505; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WtqIQREMaC+axrCrIacJPyaOPvLwZ66FFDbvhqR90Gk=;
 b=F0kfycLazS2HmYe3XNXd9rBmjJLztCKEa5Jc+viC8/O+4hIiPwT/AlX2kgD1LW22du
 pI8cWbSinFYb3NYD5+4nwjAvN2m6EQU8gcnblTMhTmLb581CKR2sGYtgQXaxVkESSLSm
 q9uHfmb45LT2FKXO2nS3l/TlqiHsejgJ1hsVgP3A1LcXwDfTMb4ptjlqr1XBkrEnpumG
 w4GaCH1rdGZ0xbUdU6EZX2xdMgNi0OZLEX1dfyNZvxcObqlwiZkLWS2cs0MaJKJb0EXQ
 vYDNcZTSMg3VNOIRf2s78zL5eWoUAyG6f6umCukjnny/WQD27KaxGzqzpUMqSEHcm61/
 T3WQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F0kfycLa
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-05
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

Autobuild statistics for 2025-07-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  4  |  0  |  7  |
  2025.05.x  |  5  |  4  |  0  |  9  |
    master   |  5  | 40  |  0  | 45  |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.37 | 4 
                    bmx7-7.1.1 | 2 
             dahdi-linux-3.3.0 | 2 
       host-gcc-initial-14.3.0 | 2 
                libsolv-0.7.30 | 2 
                libsoup3-3.6.5 | 2 
                  ntp-4.2.8p18 | 2 
       shadowsocks-libev-3.3.5 | 2 
                 apitrace-10.0 | 1 
                  bcusdk-0.0.5 | 1 
                  cairo-1.18.4 | 1 
                   crun-1.18.2 | 1 
                elfutils-0.192 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 hddtemp-0.4.3 | 1 
        host-berkeleydb-5.3.28 | 1 
                 host-gdb-15.2 | 1 
              host-rust-1.86.0 | 1 
               ipmitool-1_8_19 | 1 
               libcap-ng-0.8.5 | 1 
                 libcddb-1.3.2 | 1 
           libfreeimage-3.18.0 | 1 
                libsepol-3.8.1 | 1 
              mariadb-10.11.11 | 1 
                openssh-10.0p1 | 1 
            python-tornado-6.5 | 1 
                python3-3.13.5 | 1 
          sane-airscan-0.99.33 | 1 
               syslog-ng-4.8.1 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/4fcd3c50eede19e15e1ee671067bef25ea541262 |     
   arceb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/27bb985273c691fa51d7b260f48df9f17998621e | ORPH
 aarch64_be  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/da13d92a1477ef38a168fdb9939885b9d220ce3f | ORPH
  powerpc    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/d2415299184676826aac49770f035a9377d4ca09 | ORPH
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e6ee26c92abca814596ac68a485189a642a7c7f5 | ORPH
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/cd656d8e172f1e51486e3e38984e9ed611ac7542 |     
   sh4aeb    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/bbed258feeb56315739235c3da3f38d73be07fdf | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/dd306ac1b5cf8f5cc07ec816661196055451a0f6 | ORPH
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/b622e0cc612b6c9a12edbee0e34786f950a26578 |     
    arc      |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/2cc2b645b87291f1157da59b1f2a1d234da61197 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/24221394b87d5f53792265942060673bb31d1036 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a570133b7aaea25493662b5a3a1bbe25763d54b3 | ORPH
   xtensa    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9c2eba00c9701975cf49b708e797bd576f6707e1 | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f42c06e40523e77087720f08499a6bab7fdd39a8 | ORPH
    or1k     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/06b44df261318ce1d07f6cb20b26e4ad64222940 |     
   mips64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/97a0ae6e6c8eefec7f0d4cb70b9719c9e9141ca3 | ORPH
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/d159645dab9206dd46f45e79241fc8a950bd0326 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/7d284ca51a29dabb038477cc17795f729c59a05c |     
  aarch64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a7bfa6abf748bb035dc78524bdb476a6da3dc7e9 | ORPH
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/28745c5e1a03256418cdd7da89ac83bf4a5f4391 |     
    or1k     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/8d8552883efcc7b1a00906ba73a9fd167a7d326d |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/d95be56be6c0c3ea5f424a0f1cf84c9915027dcc |     
  riscv64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/7236cf5fd4f33aabd3178586f877dff04d754abe |     
   sh4aeb    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/1a9b99e63b2fa0913e6ed86d9c2efee6559bb89a |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/85f741e62e3a4e0cb0e3c047fc79ddfe5a4a62de |     
  aarch64    |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/743e0aeb17baf91b2428c3ffd3bf24bd1279400f |     
  powerpc    |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/8cb8eee982d640d1fefa04a0395e94cacd6e61f3 |     
    sh4a     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/9337caa6876f4f0680eed5f7748dc769a632ff62 |     
   s390x     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/d96793787fbff50d3b605866b092fe97272c50d1 |     
 aarch64_be  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/df5f67af18464c5f879a27116ad16af7e40f72c6 | ORPH
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e3645e8b1f96a36d79bd6a74f3ce282154fc1aeb |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5f52e90f5cda800589a7260385283880bd484714 |     
   sh4aeb    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/ff9b10e14f31a6417ca31c063f5f1ba11a9676ff | ORPH
microblazeel |       python-tornado-6.5       | NOK | https://autobuild.buildroot.org/results/3d7ec3acf1fdc7ecf440151cdeb1c51f0ce29d15 |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/6d8c0e491b16c85f7b4792cfa17f604c2eedb091 |     
    or1k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/6effeb323c60cec3badb867c43ab7adfdb1b3933 |     
microblazeel |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/e554cef2f43e43156c95ac3227d7261467b390f5 | ORPH
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/9f09692297e5ec931ce09c3a67e5a42f608ed1cc | ORPH
 microblaze  |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/be91f5bc30d0e09e48a397280b4427eff916e2ab |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b33afac8bc783fb4fdb63d55a81495eb800180a0 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
                    bmx7-7.1.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
       shadowsocks-libev-3.3.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/33788da89187facc0cf8e6678bfd1d862d958ae3 |     
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b776e34d1c5bc3904ea7138bd6c4ac17a1f0fd34 | ORPH
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/06440f48be90c12fa89682a3e1365006348871df |     
   s390x     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/070581d95f2739cee3b4cb8252639dd92b5a8421 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

            gdk-pixbuf-2.42.12 | 2 
                 expect-5.45.4 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/fa5f3576758b645c5b3ff42b62a759a3954a276e | ORPH
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/83fd1448d980a802ccb53c8cb6b31e0896c40db9 | ORPH
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/bb33081df9239ba94e178cfef742a38eedf86079 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/1a0a551de30e527c9ac9e78891f93a44007afe3d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

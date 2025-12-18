Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC1ED68BE3
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 06:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2522181831;
	Thu, 18 Dec 2025 06:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfWmRxIvw5qt; Thu, 18 Dec 2025 06:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B68FC81702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766038577;
	bh=XRNdw06JnWjgTynoCN9WfWqbOpzkibBf1KN/kPHez4c=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i+mQeHg9+8ONTAEOf6Qlride1gJ8mNlIIDcas5PW9shMh/lEeke/BlLZfIym+vs5b
	 3vxZxtcQuJ0JTxE+6K72wZZQ3Nikxqz2jmzuFIrxYTp7GaCfe0AXMIeoX3GIQWdTqA
	 kbrJgtoIr/9QbTymuProk+zTmNhQXy9rWdHmn0U7QKcRsoHm02w1TWe1mQzS6D5jWn
	 F1rnrzc+kR6sK08fKXlT5O2v5LlZkbnUEgxznSCnMreIodnD1UC8xmNSI3GUS/2R/J
	 Jepr6jFDqVHRRwL5EkoMR1eeNT59mB1/ks8vl6yuVjemo13SGb84GtFRBywfSCiNdo
	 hMFAcKWwXdQHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B68FC81702;
	Thu, 18 Dec 2025 06:16:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C7821A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 06:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 494EE60671
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 06:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7i4_FQegMXgs for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 06:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72BA360595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72BA360595
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72BA360595
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 06:16:13 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b7a72874af1so42865766b.3
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766038571; x=1766643371;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BU6sryiy70Rb41F7BAx81QSGBdhq5hCkSsaKs/7FE+s=;
 b=FpLZHHq2fgtABkFPUEYUZqkoFQibzAxZ2VqhjtdolklFUaRLQu1ntdkS+CG+U4i11f
 8le7qXR1v/uQsgweEvyAIIlhvKzL2LSdAQBIg3TtmfbAUyo9tmztXPYRKKvoLDELDaf0
 UKn6GwHYf1wj+ZR/SxI9rHSCsqkVh8rCvrHb2NmKapF+28qKn59H7yebM3fBoqARXFZ0
 SzMWwkRAg1qHlX5rEHdEdTX3gcRC7rYvdewhoDzwYlDnIWp61FeLpGxdbcgKyydI287i
 8kaW/iKhJq4YY9/rgxMQ2geLYNwJuqJC4CGkV8FAqE4TnCHvEVypKijB81z8dugz4sMS
 xX4A==
X-Gm-Message-State: AOJu0YzOKlJQdvEhakeQo0lfDW5/xyBIJHN1roHQCHvAYhqfnULx1Nqc
 hiUUUvb7TnhKMDGm3uEpwxG3keA6yJcJ+U+Mk9zQcVD0LtVVkwpxLZjImMo2wA==
X-Gm-Gg: AY/fxX4V641/XXqyJfOAxzr4PpzR/3omR5cY58mIyJql3qDDWr5qZJNBQ5jU7I6+KQ+
 //hC6BbiPJbOTlD89oBn2VfdUheU0g7B6Opcx7ZjZGfu4tp83JIwv/d8AnyLK7q/wZrpgNMzJ0V
 C/gqpun9cu+U296aGD0WGz4vMvT9udhx1LFUH7MSoMah66wFVzPWC1c9Tl2Yx3eKke65Bn1FNK+
 mSRfry5o112zhvgOemOxymQ0ztAGdKTE9H9ABv4pdpM2QWpMPRpyuWWwEZJO4EqPM2Bql1SwLey
 2ELU27jt4Qvoczdhwymm1cMreqM2dTlwzW1Uxg2/WU89Plu8whvvUTxHb6UtljgUMtL+/rukSt0
 h0qkNvjZ2kErKzcg794Pm8i6BKSIpg7m7mkG/sjeXOlnmB5nTrnreL6OLVqQG+gWC9UkRk8YWGi
 qF7tMwGOKyBdOvoKEc2A==
X-Google-Smtp-Source: AGHT+IGNB2mLphL13gD53i6rrmsCISiH7KoiYmg+4SG2RUK60Y+yiu2kyJNbk9qEO1vDjM0Dxwmk8g==
X-Received: by 2002:a05:6000:144e:b0:431:66a:cbc4 with SMTP id
 ffacd0b85a97d-431066acfd4mr7098079f8f.17.1766031630347; 
 Wed, 17 Dec 2025 20:20:30 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324498f8f1sm2517922f8f.21.2025.12.17.20.20.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 20:20:30 -0800 (PST)
Message-ID: <6943810e.5d0a0220.9f5b1.8a7b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 18 Dec 2025 04:20:29 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766038571; x=1766643371; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BU6sryiy70Rb41F7BAx81QSGBdhq5hCkSsaKs/7FE+s=;
 b=Up/8n7jYt8s5bGDnNtr92GprdQ8xWXTk7ArFtH3z1Bd3hsqAJehXvq0L1H1Q2rVBUB
 OXiao6Qc5WYLngRQTGvf7MDH0L4ogFcc4Jrjga4Rqof5dClXhBSupZcyhaJAMiOtjwaL
 HSuuGcqc/KnTVbyjoRMKhs0oN8TnLPiuyxPcZYP7R5GxeLPPjXbjtT9ntRx256MAuJoE
 99yCtN5RYIwwZsK+nJEnmZhWxryvsPs7CpUEom3G+TyymQf3QXuu0A47txFwB4XpGrZJ
 8qvADX4fI7X8fsnCAjuHAFZ5ZmylfYxOeJ/xSpPi5BvkFY6EZ5/+uZAelCKaSKUIsuZh
 U9MQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Up/8n7jY
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-17
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

Autobuild statistics for 2025-12-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 62  | 57  |  0  | 119 |
  2025.11.x  |  9  | 30  |  0  | 39  |
    master   | 59  | 281 |  1  | 341 |

Classification of failures by reason for master
-----------------------------------------------

                libselinux-3.9 | 42
           host-libselinux-3.9 | 29
                       unknown | 12
              host-json-c-0.18 | 11
                       cfm-0.3 | 8 
                libcuefile-475 | 7 
                netdata-1.37.1 | 7 
                 jasper-2.0.33 | 6 
     libphidget-2.1.9.20190409 | 5 
                   dante-1.4.4 | 4 
                  iozone-3.508 | 4 
                  libcgi-1.3.0 | 4 
libcorrect-f5a28c74fba7a997... | 4 
                    mpir-3.0.0 | 4 
               asterisk-22.5.2 | 3 
             dahdi-linux-3.3.0 | 3 
               graphene-1.10.8 | 3 
                host-gmp-6.3.0 | 3 
                 libiqrf-0.1.2 | 3 
              libopenssl-3.6.0 | 3 
                 libuwsc-3.3.5 | 3 
                   perl-5.40.3 | 3 
            18xx-ti-utils-R8.8 | 2 
alure-14beed2a86d5a36030e90... | 2 
azmq-v1.0.3-54-g819b24035cf... | 2 
                  brotli-1.2.0 | 2 
                  cairo-1.18.4 | 2 
                   cvs-1.12.13 | 2 
firmware-utils-c42a3bc53da8... | 2 
            gdk-pixbuf-2.42.12 | 2 
                haveged-1.9.19 | 2 
            host-autoconf-2.72 | 2 
            host-libtool-2.4.6 | 2 
    host-mender-artifact-4.2.0 | 2 
               iproute2-6.17.0 | 2 
               libconfig-1.8.1 | 2 
libdill-32d0e8b733416208e04... | 2 
              libmhash-0.9.9.9 | 2 
                  libsvg-0.1.4 | 2 
                  linux-6.18.1 | 2 
linux-serial-test-bf865c37c... | 2 
                   lsof-4.99.4 | 2 
odhcp6c-53f07e90b7f1da69771... | 2 
                openobex-1.7.2 | 2 
                    rtty-8.1.2 | 2 
       sp-oops-extract-0.0.7-1 | 2 
uhttpd-15346de8d3ba42200249... | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.66 | 1 
                  bitcoin-30.0 | 1 
                busybox-1.37.0 | 1 
                   ccrypt-1.11 | 1 
           crucible-2025.05.28 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
           dmraid-1.0.0.rc16-3 | 1 
             drbd-utils-9.21.4 | 1 
                   duma-2.5.21 | 1 
                easydbus-0.1.0 | 1 
                  ffmpeg-6.1.3 | 1 
                      fio-3.41 | 1 
            gettext-gnu-0.22.4 | 1 
           ghostscript-10.06.0 | 1 
gli-779b99ac6656e4d30c3b24e... | 1 
                        gnutls | 1 
google-breakpad-f49c2f1a202... | 1 
             hawktracer-0.11.0 | 1 
          host-binutils-2.43.1 | 1 
       host-gcc-initial-13.4.0 | 1 
       host-gcc-initial-14.3.0 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
            host-go-src-1.25.5 | 1 
host-gobject-introspection-... | 1 
                host-gperf-3.3 | 1 
              host-guile-3.0.9 | 1 
                host-m4-1.4.20 | 1 
                 inadyn-2.12.0 | 1 
      libabseil-cpp-20250127.0 | 1 
                  libenca-1.19 | 1 
               libglib2-2.86.1 | 1 
                  libite-2.6.1 | 1 
                  libnids-1.26 | 1 
                  libsepol-3.9 | 1 
               lightning-2.2.3 | 1 
               linux-pam-1.6.1 | 1 
             matchbox-lib-1.12 | 1 
                 mbedtls-3.6.5 | 1 
neon-2-sse-097a5ecacd527d5b... | 1 
             ntfs-3g-2022.10.3 | 1 
           oath-toolkit-2.6.12 | 1 
                opencv4-4.12.0 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
               python3-3.13.11 | 1 
                    quota-4.10 | 1 
rtl8821cu-3d1fcf4bc838542ce... | 1 
                 rtl_433-25.02 | 1 
        s6-linux-utils-2.6.2.1 | 1 
      softether-4.30-9700-beta | 1 
toolchain-external-bootlin-... | 1 
                   trinity-1.9 | 1 
uclibc-ng-test-132c6134d691... | 1 
ustream-ssl-68d09243b6fd447... | 1 
             util-linux-2.41.2 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/483304d52f8998a386636033d07badbf1035dc01 |     
  aarch64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/81eb624f4b7c567ae7a3a01b0df482014abc548f |     
loongarch64  | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/a24d16f7c7a60cc9bb0c1034dd5290da498158f3 |     
 microblaze  | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/b2499a36899cc187ab30e47d4292c0474a6e6db6 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/7e4d724d15556acf2d89e6cd6dd7386ba7d3cb7f | ORPH
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/add5b30a64e2df6746d8d82e176b3100d7fb8997 |     
loongarch64  |         apache-2.4.66          | NOK | https://autobuild.buildroot.org/results/4da3e6dc5349ee71af57e72fc84b9c3bbea38515 |     
   sh4eb     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/b75a82fb4b9e683c9b4e3486bcfb57eb54f93205 |     
   sh4aeb    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/7aac7d1cc7e23289d9934e1a91066a25078dd275 |     
 aarch64_be  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/d13abc830b5a7b691cd9cf08bc44ed202b6bd0a5 |     
microblazeel | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/e5c3756f2a6c0f37356b32cdb581507541153de5 |     
    or1k     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/b3a39f24534f972746ebe37ad8fd6b3adbb2a829 |     
   mips64    |          bitcoin-30.0          | NOK | https://autobuild.buildroot.org/results/6bbd822d55dfcf3862e8b713323e0f34f65990ee |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/819269e3ed986db28071360a5969af0d100926c9 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/deb3d9082dd6d46632942f5f8b53741b74d7803b |     
 powerpc64   |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/5e688e5f65c3ab06c8b1228357872262d177476e | ORPH
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/bdfb9799fae2602b6025520d239c78fb576d92b7 |     
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/5bb821469f89f6682d040bb7ab491a0a644d4edd |     
    or1k     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/8e653cc74b4f95f03d05b17805924f7f776c8e68 | ORPH
   armeb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/aa070dd814293b467b157f015b95abb3f0595ea1 |     
   armeb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/38ebc09fe9e35293b519550fa06965fa7358ca0f |     
   mips64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/0abf27ecf3b956c83b8a805635435a6e6fe60a5b |     
    mips     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/02d7e89d8701a54408b62412b56a4a60f5a74096 |     
  aarch64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/cb53aba2bf08b8785be686833db9cf920aea1624 |     
 powerpc64   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6c64f9e72638328bc70cc4b59ef5d722c63b99b8 |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/54e6d04d850ea1065e867c68813584b930b6a14c |     
    mips     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/7fa3f704403d7921bd372e124493c90b88d84704 |     
    i686     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/0b59fb382f7a1d9c3644da71e7bd53b6a19418ce |     
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fb82556b460a1a8a8144a95f37db576959c122a6 | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/048f37ab26f2b5295968dfc74d556836cf0bf860 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9a450699800d5d11806fd2567481078b67dd2265 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3b1b4f63dcccd530639084bc304777d8a4078868 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e05ee80c418eba4b8a30275b4f3bf1b283de7a55 | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/698bd6a665efbbafd7c2ea6d2183c43a4e94d942 | ORPH
   mips64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7fed7f61dc577bdf6a4353aa4073eedd05c77d3c | ORPH
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/05117e4878a741ea3f4fec1d700bbbc0fff36520 | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/aa5fa0de8e8babbe3c48a9907dfe06d4d048a46b | ORPH
   s390x     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/6c18bbfeffafba3d11b7b0f8462d1bfbaa7c397d | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/86ae8884782d951847e0e9f774afabb70f76e45a | ORPH
microblazeel |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/cca13e5a6785f54c6afef925e1f0378615261c6f |     
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/225fd4405081ee240da31d9c13e2eca04437d121 | ORPH
  mips64el   |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/074c3eadab1e9558a7fc1e27529858c5bc07fd12 |     
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/1747da59a85a7954f24fc30c41cc19fae7403fc6 |     
loongarch64  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/8bef3400298799db95e747dd59ba89a578faa4c0 |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/796c0c38a05d3f75049ba54cdf1befc534c89eef |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/83d344e69c99bfa9412f6dae0d45afd320862360 |     
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/694996a3800a220411137d07af7aff2a8e6445fa | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e09dcc0dfb32d680ed36bbbc23db538038a14bf4 | ORPH
 microblaze  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/c43c38a3e9fed2af44b4da96449042c31e6be9c9 | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/26b47e5d4c70c0405df4f29b4be2b860d24faf2f |     
powerpc64le  | gli-779b99ac6656e4d30c3b24e... | NOK | https://autobuild.buildroot.org/results/067ac313d7254ee61f038315b899b5fbd59e16b7 | ORPH
microblazeel |             gnutls             | TIM | https://autobuild.buildroot.org/results/03a81160798f790a0e96bdd145c800251ab81ef6 |     
    arm      | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/894809f9371e257b4fbf404efa9b41635cee6134 |     
    i686     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7576c8eb7ede52b31d157c37820b00c53c2eaf2d |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/b6b2599c34a7a680ee466ddadc93b6a0a70ac6ff |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/216f0320f13a0e813601680f4257f9c408e6256f |     
   x86_64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/10150839393f412dd1a48333de56854c5314fabc |     
   sparc     |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/34c125ce5bebc3aff7e2d566da133772d446f9aa |     
 aarch64_be  |       hawktracer-0.11.0        | NOK | https://autobuild.buildroot.org/results/c86d4b2127f09f57c83bbc81bfec847055b67ae7 |     
    arm      |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/d6e8e0294a37582a56551fecf5904004640bc568 | ORPH
 microblaze  |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/6df6dd292982b9f773d05f7872ef12174a0987c7 | ORPH
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6172ff3e36c9f86742222bfb771ce38ff1ac27c0 |     
   x86_64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/d7ae8999af7ca1a619dab59b9bbbf3af35a92a90 |     
   armeb     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/ba5c985e3518205fb8ea093073f1bef77d2725a6 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/e461be49bddc83b75a7c3c1f9ec1cdbc5ce7c7ff | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9b22b5a80e5bca44a4d5e4aa5c92fd664695744b | ORPH
  riscv64    |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/d98b7fd04237b8cf5f7e752f95d027890d218206 | ORPH
powerpc64le  |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/1dfedba86874a8502d5201ecb290cf6581e7d39d | ORPH
   mips64    |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/78f1f8d387f0e4ff3d62853ec7d46e5c4e0fdb28 | ORPH
    i686     |       host-go-src-1.25.5       | NOK | https://autobuild.buildroot.org/results/9a5e665628ee5064507d8581737a805418cd1620 |     
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/52b542cc731f36f0759637d46d657100596b1761 | ORPH
   sparc     |         host-gperf-3.3         | NOK | https://autobuild.buildroot.org/results/bdfbfa9128233af658f6b5e89d40d6ea30e62ebc | ORPH
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/d47bad8a2eb61036562bf7f246c284bbe64c9624 |     
    mips     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/442d063b0db6bbd158639e65e6356271099b68dc |     
   mips64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/6b10b0b9249f4a9fd48e67cfd2d39de1ab841fd3 |     
   mips64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/fd7489bf6514b315285feb863c9d82c2aa09e0f2 |     
   sh4eb     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/a1f161826341edba9b896217c95f639cb2fa73f0 |     
loongarch64  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/343b7421ccb23df1c658840b908ff072e12253df |     
  sparc64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/68bc26c118150a83fd120c6b4a3c7a891dbdc142 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/df25586608159ea6decc7fcbc0d709595a7eb2b9 |     
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/0a3c4f88827511524c4b9a39eb9c2299c2a443a7 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/e6472ec163f4607aea0f8e3eee84d16f209200ac |     
   x86_64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/7376db3efefdc826a3e406e2e5cddb8368f0c957 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/b5a1d53e0108642a5e452427568f850075e2b5f8 |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/3dddd640f142e1f4185d08722f8ac3b68c021c61 |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/51cb0cb35bc8d0c241f36bd44260a211f078d24f |     
    i686     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/250f74f4340b3cccef673bf806ed6b706a2113c3 |     
  powerpc    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/fd6d3edd5f74d094621ac9fdb93db24520b7a6e3 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0e73af0056656e142a6f7eaaa583e3b632b0c96b |     
powerpc64le  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/75f083cfdc41dbe3860650dc25b8ebf6a0eb6b69 |     
  riscv64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/62b624f80adb6232f84104dc554724c1a1de41f2 |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/04008e246bfd4fb2c404ad2932cb19daf3e2acae |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/03aa910510bcdbc5799fbeffdead6f028224fb98 |     
powerpc64le  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7b01a85f765e3293480a96bfa77af00ae316b78f |     
  aarch64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/fcc89aba83e6b80a6f497e4acb8884348412cf0f |     
    arc      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/3fdf1b92c6e1f2c5362bf34a558b17cae69ec6c9 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/99893dfb7d40202cc8f11dbd2ee394322bdb75ea |     
loongarch64  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/afde72d3b4f03e0595c78a2476794ba17860a600 |     
loongarch64  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/8550e57f0a052d89d2745dd1d954d62b16f8013c |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/b638e6c45efa7e930dde189c679a2a6ee9926215 |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/01c0f3309d8f64051967c4a470d2aba2ac4c0665 |     
 powerpc64   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/1d7b58ff076685d67f42aebac31062e9bb4d5630 |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/393d801aea93ca84528bde791ad233d53d12e218 |     
    arc      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/1063ee7a90b4fcc14ad9bd5dc6877a44a88c0f23 |     
  riscv32    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/803b8010ac114f24deff5d38e7d49aff4d95ec3b |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7778fe1ca6414c618a0981fe14aeecdcf05eae17 |     
    i686     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/dcbcc8122051ab08d4f07aad783cdbff155613be |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/33fb8f37103c7f64718e41ce78ce3560bb200f80 |     
  aarch64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/f6093b77133493727dd85d202c9265fc368001e4 |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a9a5040f1d7e09989b00fff12e861e5efd60d695 |     
  aarch64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/31ef8142cf1c2e001d3ddb350fd3efc083d24f8e |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/e9de3571beb0774301015bdb5d4880279af8d430 |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/dc45cad77f6ab72cf4eb1ed2d22895fc6fd76d2a |     
loongarch64  |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/10c795a334277dfd75c07f48d177544a52c65d48 | ORPH
  aarch64    |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/ea1e878580434c536769d9b7690233fab125554f | ORPH
   sparc     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/af7be4f6af5459e512224dd69c8c604dda3d4160 | ORPH
  riscv64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/851a934d927ac7484880ff714dd1e48124eddcb7 |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/f2b7dea2febad7b5c68db23337067549c007b6b3 |     
 microblaze  |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/31f2643209710eb5029bb33f970b3ad4b36ce583 |     
microblazeel |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/92ccb3106a10816290b92597c84e32a7702a3ca6 |     
  powerpc    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/247fe5c3948c54daab8a44acd0f85c28048d85ec |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/11210a7aed69f52345864cafb96269a65b7c8f02 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/bfd57724726bb8061bc584984c00df1e2327c557 |     
   sparc     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/a65b8f11800573f4c079de25178e69d287e7a1ba |     
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/7b94c7edc92d7f69dde237b636f3da64283b1cb5 |     
 aarch64_be  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/858f09560de0b87cc39bb8ab47f2273de44c239d |     
   mips64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/1a6d6f805048cda5ce84a78a2ae1876cc523969f |     
   sparc     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/bb86245775ffb0d54d755a997c989299cf106477 |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/5c391b262f5a483b5107a488472a6748c978a4b8 |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/a6d85077c0a965634c4b79f6176e0e1e9efe46ca |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/8557e10c75125f282ac43ccfded8f9a4161564cd |     
   mips64    |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/57c5f403ed4d91ec9ed2e04162408da005b35e1e |     
    m68k     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/177cad539dde9a409d344a89b6842706a7122f95 | ORPH
 powerpc64   |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/ed74fab1802b6671da826680d38f0b0c01858dd6 | ORPH
   sparc     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/2f5d79b47cc212e600ff506125522b4df7e47207 | ORPH
  powerpc    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/752ae561d3c67a4c3765b58df32b04102b040b89 | ORPH
   mipsel    |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/d764040c2fa582274c278a8290e4c1f4e7701cbb |     
powerpc64le  |        libconfig-1.8.1         | NOK | https://autobuild.buildroot.org/results/22467feb12073aea5bcfef6be8eebb7651761634 |     
   armeb     | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/bb803512337f8d7e93cdff7d1c9d0da1c4bba071 |     
  aarch64    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/bf4fd9b5530f5fd404563f64382c8f78b4a65835 |     
loongarch64  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/4409dd1f22df12b004a384e623225766d25e6394 |     
  mips64el   | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/92a77585ef0ceb1d35504649d82a2e76fa493fe0 |     
   mips64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/ca96d9be29ee768d97ddc73f68a2d80d0c5e40f1 | ORPH
    mips     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/2d647a1ca04cede0639629decc2a3773570e4528 | ORPH
    arm      |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/66e2d6927c0c8596b6feeb63d45d81cf7b1987ee | ORPH
   xtensa    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/a84a01bd8a1f425790dfd302fa724ac65ad46b6f | ORPH
    mips     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/0ce0d906ff24e4eba01749be830c9ddd6fd731d6 | ORPH
  sparc64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/a0b1bd27c4ea322643ddb1175633c9efba7a1b4f | ORPH
   x86_64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/432885b9b344e363055b4eefa628e98f4ab4c691 | ORPH
    arc      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c278d75ca79905f679f07bf33ac88c2a5c00615d |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/05c82046ef166db84848ce9c3545566e0c1314a4 |     
  powerpc    |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/2dcf478610d0340ae0e0c75c4f674811423ac657 | ORPH
 aarch64_be  |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/9c3fca2cd7f9206cbf09986799250db5341b06ce |     
powerpc64le  |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/1ea44e4716d8f327646e97e60cb348d972d50387 | ORPH
  aarch64    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/e730c380263bd61417ba72810980b99f4d3b1e21 | ORPH
   sparc     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/b5307bd9e6296c2c87590e2a821920771c26ad3f | ORPH
  riscv32    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/5debc62293057ac8d416f7552c8ec3ed5b8848e3 |     
loongarch64  |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/77933124bad5583e7c3b116518162c20a4fab8ea | ORPH
   x86_64    |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/a671878b5602805803554ca2d053d9c3d07818ca | ORPH
   mips64    |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/c8e6a25e4a3fcbbfe462d489395a362c2402b44e |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/1295bfaee00e7c6ffb957bcd1a5d1e857a2a8cbe | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/b09feadcf71c3a961e8baefaee91c801dc6029f8 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/264529d33c3afba68df4bce2b8eda8273ac6eb84 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/cf8e7f9a096ee1c5b2f335e1861f5e8bce9ead68 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0331260f1a3d8423bd1a9a48a10df35cf81738b7 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a459ab27356c833bb01af1a335532ce9d7befd6e |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0f2b19cf52f4e7a675942c3a6282c34237cb287a |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e612d3200eb219aff7d1323200d93e5fdc164ec1 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/413253c98c7bbbee663b2ac2c35f83197f3cef01 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1897180e4c556ead6df6b58bda2c8b6e40ead956 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2e26af8dd95fcdc78c84fd23cfa7ca795e154987 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/fa6449ab2bda4c1a6c9f393c679a62d74b062993 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/691c1ef203ab65068c604ed425e95e73bb723a99 |     
    mips     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/afdab7dc3053399d786842906a1cf9b81c06813a |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/3da05d29d65dd1bebcc46e4aaf9ee50fc6de2d81 |     
    mips     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/9efa4c9090e546df7bb92425d0ab34b1f81c5f63 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1df6c19ac3aa3a14db3017660a5b0e989d2dabf0 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2b3a76892c358fb7d5cc3c92320d3c3e673ec537 |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/90a59ddaba7f5f770ede4da0363c84a7c7c2cfda |     
   sparc     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/797a8d556833c4277853d5717577c5abc9dcf24f |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/23bbc36414fde49531974327a6ce893aacfae787 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/d441ac086f20979f8737a3c820dd84d27952d361 |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/3e6f441b43fe718ca87664d5bd02004491996c35 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/59ba154f60dd077681a780ab8ce212683d4fe51e |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/5c76907cc46743ae64d080eae170736a0dfbbc3e |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f878b8567670bc8d62af4912ea7f5d50974eca24 |     
   mipsel    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/89bcdfb5dad08d08fc36530530cf8e6c463491ba |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2975d1b544952500e39a359c7ecc2ca9662f4d99 |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/fe71b2bba523d566145c1ca63aa2d8c182af7028 |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/cb13f8cf7f621260ead2fa63785ef9f85bd7bd00 |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/11187b47b7d30273e44fd1deaa4a1017b00f9679 |     
   sh4eb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/7b3496b06fc6f7fbfc61c01541b3764b48da2a59 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/cbaa22f090901b01d650b56d5e9591ebaa503062 |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/fc0aff0e855d9652379a8e8b53a1ccd7b5e48dff |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c08a758620eab9460b3155fbb1163bd466ae1e47 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f69e8f40b463f9b59f79467357d55c9fd1fac3a1 |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/139b6da6b5ae496887db51f758a41cf9a1a7a49e |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c50330b6d7aced70829f09cf05106648dced6e11 |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/cd1d2e3aadee53d066c57eee47760804a5b5ca61 |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e27c60d32b7b89424f29486817f1cf89805f313e |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b1ee65498e93dbe5af31abd6c77621f15e517f43 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0f9c8b2c367f5f81b7ab672b4fe51b4cb1707a49 |     
  powerpc    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/07f035f579706e86a9d5710e5be0c0470a067354 |     
   sh4eb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/3998e0e7fc34e9f0a3197d1f508c0709e9747a10 |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6a9b520937ad236627b62e9586b730fe23e2f12e |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c91ff5d07e9ff057966550bf3d6815dd82718225 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a67a60cabe5b38ed91721843415bf260a50a86d1 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b35bf1fc003fbbedcdf1961e70ca9cc754559ae2 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/cd54ff0a83ee75a87e7e5ab7d2e440baeff9897d |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/4f650573d12a0bfc2a6ac236d0969fedfda83491 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/0e0cd0c8598028054b55400806ce558199c20fac |     
    arc      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/443c85b083f44696b0e11ae43d4adb36d06c56ee |     
    i686     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/41dfb57ddb7f0de6506cd53e956e52726f0e859d |     
    or1k     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/cf0e15ba7766f704a086494cb66d6739ab5ff6ec |     
    sh4      |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/0def977d8acee33ee761b8aa400ca05ffd9d377b |     
    mips     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/99d43b2517ff37e5ed512a149f6823bf867da714 |     
   x86_64    |        lightning-2.2.3         | NOK | https://autobuild.buildroot.org/results/811626211d70aebbb0dfe8cb497c81b4414dc083 |     
 powerpc64   |          linux-6.18.1          | NOK | https://autobuild.buildroot.org/results/a468bd6f7bbca81a0886dc6266eccd8184fc2be0 | ORPH
    sh4a     |          linux-6.18.1          | NOK | https://autobuild.buildroot.org/results/bf47dad0ffe82ee0a97972a3995cf30c5c3d93e5 | ORPH
    i486     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/2f5deddb9719b9c2c14b57c23148b998995ecf69 | ORPH
 powerpc64   | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/b7be959f7f16d0721117c334232d92c0401aec1d |     
   mipsel    | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/6c17dd3461bb83df54efd48b4ea554164de39331 |     
powerpc64le  |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/388acc62a5121ee4231d1f2cc3e3cb84f75932d7 | ORPH
    or1k     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/c97f1e67becffc9d18a7d93c88454ef46b0cccce | ORPH
    mips     |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/98fae38d4fabb5a29fc62cb39c4d0068193b27a0 | ORPH
  aarch64    |         mbedtls-3.6.5          | NOK | https://autobuild.buildroot.org/results/60f27ee47f0e5d2c80626a3632d72e9c15c71274 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f19be35acbac9a7fa3053d34d2734939fa0e8368 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a35b08911749071895e097e18678d6ad4f4ca6db |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/128ded3142925bcb86dc142f9d401ef53d512c4b |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d9590bb648b574c667f7e486a1cdb2714bba5b0e |     
    arm      | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/7362ef2191f399ff245c292d78ba6f01b1ab81a3 |     
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/4a699d447198a8a9b3ae2a7a8081b4c759c9c80c |     
    or1k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e7f4163bbbe2251bc4c7a077dca9ad2885787286 |     
  sparc64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/2866847e11dd37a655f53ea1b487df6bfc439164 |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/4446fc676b4d5e0721417150cce820784d8af106 |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e1a6326df61d73b8c22860fe0f0ad884aebe7f47 |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/4c0a04a0491406995c4fd24d141fb56246020d4a |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/cecad54ecb73b116b0a1e94d53419ca0ee6939f9 |     
 aarch64_be  |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/97d631d432e6337f30188b76416b8fe1b0005816 | ORPH
  sparc64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/85e12891d71c190b7d3846cffd9774d4d8e024f3 |     
 powerpc64   | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/17181a2f41f2974ce678347a09c1c398edb971ce |     
   s390x     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/ce821d60744d80fb209b531f5cd074601793209a |     
   mips64    |         opencv4-4.12.0         | NOK | https://autobuild.buildroot.org/results/0fa7283d6e83ef114ad4cca583460eba816aadd4 |     
loongarch64  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/8e25ed87e3ece3f7fde09abab858ac5c44cd3f41 | ORPH
 microblaze  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/064973c37293690d8e1f4946407bdaf7966af7f7 | ORPH
  sparc64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b349a87d3417152049b07935a88d0c55b5136abe | ORPH
   mips64    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/143449bfdc4209d9542c15d55274dc7440ed72cb | ORPH
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/8f92c7336dc25ce2a506d16096854991004d8d82 |     
  powerpc    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/ab7bda5a8ff62e0e67cf2030a82de7fb8f5d1703 |     
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/e672f96c2ab99634f4c8654eedc0a95120be6e3f |     
    sh4      |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/0f397e14ed13ab605a90dc50a8176fecc5cb5c47 |     
loongarch64  |           quota-4.10           | NOK | https://autobuild.buildroot.org/results/6f14b0780355c92599d6402ea8f7b1b188ef6433 |     
   mipsel    | rtl8821cu-3d1fcf4bc838542ce... | NOK | https://autobuild.buildroot.org/results/eb06df39fba6c8e54adc48cb75500b13d2473d3e |     
   sparc     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/f0a218031cb26f95ee015ea95fee22b9f8c1e571 |     
   x86_64    |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/f449842a0436e0a99329167506e78725f3504fff |     
  mips64el   |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/432aacf3b5e742a32ce54ab4babb7b17cbddb87f |     
   mips64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/d8c409bab4dc3618b37ee645d2edb14b214a0625 |     
    m68k     |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/f1f1c8b4d287a687a82bcdcaeec3bd448c881389 | ORPH
 aarch64_be  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/829ad911c60e4e85ed7c19cc1c5393e6800776fe |     
    arc      |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/ea9c40009ecf38035873eef4e351c24eead7a14c |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/4bd92842581d30fcf130d33f818798cd81aa0679 | ORPH
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/0fde082404e8c48db3afa956350dd69261075484 | ORPH
  riscv32    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/ffc6dcbf7fb291837af4063d6ab4ad3495c51c7c |     
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/12f2929dc6478b55ec7f85b3094b85a02a228e88 | ORPH
   xtensa    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/53d58903251c25004cea87dbdfaa439428608516 | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c26353b27f292bab231f370c034fe9373e941a86 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/83ef3fffa53dc80f9e5b94fa8a05f433fac0a12a |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9cc463a70d669a3ec309ff7fd746b0f4f6389b1d |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/8080ae3699492a66468ccd0b4081fdfb65374b69 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a04f3e20f64856a2bfc23d4ffafb19205aa55ca8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2c5b1dab06ceef9c38c923129b4e144c733aafa3 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/cc6fce74ddfeb80ac0e240f8a58b076c3bd347cb |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/24078c1185fcf726bce14b419a2d8d006e75e230 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/73ff465651e4a9b21414eecce0b4af14ed771665 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0bb65f408a623927262c0301866418651921d33d |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ea34c7d1efbc7b927205161ffb223a83e89c9873 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/e43b14fa6802ea48a193a0e073373b63106edafb |     
   armeb     | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/db4237e1d4fd7273d24e8fa9bf02b0b022b04a1a | ORPH
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | https://autobuild.buildroot.org/results/522f111535dd114ae9b7be565c50f51f74ee6c6a | ORPH
 microblaze  | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/dd0e52f3e431763a7783baf04e0a3ad5ae100cab | ORPH
powerpc64le  |       util-linux-2.41.2        | NOK | https://autobuild.buildroot.org/results/8e8d90b8faf0391a0417227050aca4038d988ffb | ORPH
    arc      |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/9954c75c2933fc5571342297ff9af3e3b87e7bda |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   cvs-1.12.13 | 3 
                       unknown | 3 
               asterisk-22.5.2 | 2 
firmware-utils-86739f2b3ae9... | 2 
                  libsvg-0.1.4 | 2 
            18xx-ti-utils-R8.8 | 1 
                  bitcoin-30.0 | 1 
                 dc3dd-7.2.641 | 1 
              e2fsprogs-1.47.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gstreamer1-1.24.13 | 1 
                 inadyn-2.12.0 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
                   libcap-2.77 | 1 
              libmhash-0.9.9.9 | 1 
                  libsepol-3.9 | 1 
        ltp-testsuite-20250530 | 1 
                    mpir-3.0.0 | 1 
             ntfs-3g-2022.10.3 | 1 
                     shim-16.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/2c81fbee0ca9dece09e9fe3d2d857421c765630a |     
    m68k     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/c315454c7cb7edb929d4cfadec3a5eea49a42bcc |     
  aarch64    |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/a981f01374d11e4ac9d4146c378cde3f8a6c6ac5 |     
    m68k     |          bitcoin-30.0          | NOK | https://autobuild.buildroot.org/results/1f49aaecb404ba28f2b47261370331b895a3f71d |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7e634f3d51b133e236ee1427cd0479538c69b1f3 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/44ef0c151c9390bec04dd6615ed35ec9742aa264 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a35d19eb257e6c2a01f30a01cd3aeaa7d2a1d02b | ORPH
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2f85b690b1a19984b804656cd44e14f65d7fe573 | ORPH
 microblaze  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/899d500674c2747ccc41e6bbb6286d17c637663d | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/15438e6a36bef80d9a4cddc641c39c7f1077d53d |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/e8686394046be0d543039d32837a7ba151f6f60f |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/50bf9f4467ea257e2abe56a83fe1c07f3521cb72 | ORPH
    or1k     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/d75ed827bbbf7437ff10b0102a11242da6a9ec1a | ORPH
   s390x     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/423b2f175b0ba7b05ee734c07562f2beed4548ae |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/4e69b01482d16a40384a64f59b3cb3ce5a1913f7 |     
   mips64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/44f860d3d647d156ed3f72d33e68e0566991b6ab | ORPH
   arceb     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/53968e8ad44abc733b48f1b8f7a1fc4612c320a6 |     
   mips64    |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/0ed6cfd3674a6afaf98144b26796c59e080f55a7 | ORPH
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/299bf058f8b8cb4f6c30eb7a76b004d765e59d60 |     
  riscv64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e7b94f70a5c19337a8144cc7a6a3522d536aeeef |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/ce4273396fc5098a81ea050aa01dee1353acfd56 |     
   sh4aeb    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/58e5beed45c9e02f00785e6e3f3bb698abf21243 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2679cafe658dcad18812ddacc75f497f33329c33 |     
   s390x     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/48dfb273b2aa4a091ee2ac787ddf244d8246872b | ORPH
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/766a0329e3852c1c8b53f1763cd4092646f1e01d |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/8f1879ad21929de1c123e93df687662482ae3b8c |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/584a2e0d8be3ba5d561ca3f2cf94a4304834783f |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/2aafdb1eddc7b90ebd446e51ae39c115a2ef78f9 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/2c6417b3b59be8bb53a51d948ebe96e89a820c98 |     
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/ec9585bea4e04884b447076711db9c46842b43ac |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 5 
                  cmake-3.31.8 | 3 
                  bitcoin-28.0 | 2 
                   cvs-1.12.13 | 2 
  gobject-introspection-1.82.0 | 2 
host-netsurf-buildsystem-75... | 2 
                 linux-6.12.61 | 2 
                 openssh-9.9p2 | 2 
                    zeek-4.1.1 | 2 
            18xx-ti-utils-R8.8 | 1 
             cni-plugins-1.3.0 | 1 
                   crun-1.18.2 | 1 
                  ffmpeg-6.1.3 | 1 
                   foot-1.16.2 | 1 
           ghostscript-10.06.0 | 1 
               graphene-1.10.8 | 1 
           host-go-src-1.23.12 | 1 
    host-mender-artifact-4.0.0 | 1 
          host-tipidee-0.0.5.0 | 1 
            igd2-for-linux-2.2 | 1 
                 libgee-0.20.6 | 1 
     libphidget-2.1.9.20190409 | 1 
               libunwind-1.8.1 | 1 
               linknx-0.0.1.38 | 1 
          linux-5.10.162-cip24 | 1 
                lmbench-3.0-a9 | 1 
        ltp-testsuite-20250130 | 1 
            mesa3d-demos-9.0.0 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
                  nginx-1.26.3 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.40.2 | 1 
          perl-net-ssleay-1.94 | 1 
                pipewire-1.2.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
                    qemu-9.2.0 | 1 
                 rtptools-1.22 | 1 
      softether-4.30-9700-beta | 1 
          sphinxbase-5prealpha | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
                   uhd-4.7.0.0 | 1 
           xapp_xlsfonts-1.0.7 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/35d03e2d622f80a0c688fab09158c93cb9875c83 |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/4f707deee1fef4fa4735ba86766bb99609a604a4 |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/f497cf8f34974b87a01705b6a049de4d13e91b5a |     
   mipsel    |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/c8bdb1f8c6ae1a22bb9f1631801579d9350bf7fd |     
powerpc64le  |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/ec6bbf6115fb0b33d0c814d11b45fe5afb2573b6 |     
   x86_64    |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/4a0f6282fd0090cc4c68a6e5c91a2a2b8eab37d5 |     
   x86_64    |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/a944faa2dc3934e4e258b78d464048833c610599 |     
   armeb     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/b537f8ef7754c3d732487e219aa73a9be767d7b8 |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4bb07f608b7693f4e78e55aee4156310f83b1135 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8287b698ef4d7c4e4bde076da419c0b32178548a | ORPH
    i686     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/4084ee960ac7ed5480776675360c6a8369ac2b38 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/0f6360d6ebbb2b5c83d9c5694b8643f7626bf9da | ORPH
   sparc     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/23373fabc28f9cdf00c8bdaf764ec59b12e438e4 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/7389272b9742289b608d6c5ea6b10ac1d52395f5 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8465e6a6b900f22be247867e481ae0a8e98c4872 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/e1f8749058dba47f803f44ba7e9de5aabc85857d |     
   sparc     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/792bc84c4a06a154a8173ad736b02620240e9e1b |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/fd95866ee7931c5f58bd45c4920ab2de11b00c82 |     
 microblaze  | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/cf3dab2d8505c7ad9480506eaaa8562098aec22e |     
 microblaze  | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/9934d615fe4cf56015799dc17cbeb7b49ece498b |     
  mips64el   |      host-tipidee-0.0.5.0      | NOK | https://autobuild.buildroot.org/results/be668c1653a9a294d26a85d3715811110e9983de |     
   sparc     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b73f6f728766046d25b9b281ab07493ae5ddeeb2 |     
   sparc     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/e50d752781fc827b09837a4f12be82e859449b35 |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/98b93ccc823585e31aa9c7423bf00ad9bc3c1573 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/22f76320ab629fe1a1ba60d53925584d23578618 | ORPH
  sparc64    |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/538988d04339ea4212fac61fbaffb81f1099d400 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/42540fe6bc99187ff40ac8ba39eb27dc2f56f2a6 | ORPH
 powerpc64   |         linux-6.12.61          | NOK | https://autobuild.buildroot.org/results/7ce2f1bcb1fd21a67ff96686cc61b1e1bb2ca766 | ORPH
    m68k     |         linux-6.12.61          | NOK | https://autobuild.buildroot.org/results/998e1a999f75eaa20ac17ec32fbe68e06a7b7b7b | ORPH
    mips     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/c0e4c8a9ea1acb3a39db9e47e48ca00e41e39f71 | ORPH
 aarch64_be  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/77bf3e15d5cca3c9129f08af090e7e16e69c8315 |     
  sparc64    |       mesa3d-demos-9.0.0       | NOK | https://autobuild.buildroot.org/results/2eb49864842d5279b5e5e0d72d13ea537dc6c4ad |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/00d1e964d0c1b0faf028d46586d5a6f59d71882b |     
   mips64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/baad746094a82287f1ca2ed4174838baf342d47b |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/4b00d20663e10e99fd2988297b9fb4d38bda55d0 | ORPH
 microblaze  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/d758bd177b3fc8a8b3426e6870bdf6586770e1fa | ORPH
    or1k     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/f4a114966721ea3225b4ebe7ae724380ba64a27f | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/1a70e0dd00e55e8c0f74cd7135b514400e901854 |     
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2bbf2d4237418205cff2ebbdea7f1eb6764f05cc |     
microblazeel |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/7bcde7b2dae9caa35c74f3dd783924c2d5e92032 |     
   x86_64    |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/41dd6545121dd2dc8e6ff4519955be55b985d480 |     
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/389a20b780f14cfccb19573a18e5d3ad6761ea59 |     
 powerpc64   |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/47a3fe470680acc998c7fe0976fe06b01558e785 |     
   mips64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/eda6852ddc662304283642201cd3dbbbfb2e737f | ORPH
   mipsel    |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/296132eae8a27ba263f4625861c173fa3ffa8767 | ORPH
microblazeel |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/d10ad060f6cb701d072bed1e59ad6eadfef44602 |     
   s390x     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/fd390bbac10a3f9e9f4aeb8953a8b32b59c15cad |     
 powerpc64   |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4da7d04862029466857aecc31e3c067f6af51b12 |     
    m68k     |          uhd-4.7.0.0           | NOK | https://autobuild.buildroot.org/results/175877b9d090003b00fc329e62a36eb50092beb7 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/15e5c7b1434fba7483fe6bd1deef5f5721be1c97 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/640c7571d53a9c691c713cdcbc39efd43128f71d |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/e1f633c8db5fe4fc208968760ec93a4419e083fe |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/e053acbb1baddd29683f15f6a622f21d78c05e1d |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/e9dcfe51b9ed26a6d267ab92ccc5d118be7d7d6f |     
    mips     |      xapp_xlsfonts-1.0.7       | NOK | https://autobuild.buildroot.org/results/67223f05bcd9f99830e343a969724e01aec18bbd | ORPH
 microblaze  |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/0eed536a97c42ca9073d6e0ef5c7b2f02ea5b4bc |     
microblazeel |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/d44545d94f8a980c6b620474673ff0c76c2d3b0d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

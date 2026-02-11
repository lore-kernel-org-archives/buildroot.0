Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816EDEB595E
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 04:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC7C160A64;
	Wed, 11 Feb 2026 04:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68DC_Yx1kz6f; Wed, 11 Feb 2026 04:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9488D60ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770783474;
	bh=BORR32dzEBQsjOHOQG5N5GqAGzhEUDVl5fR0SiCnWHs=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A8gz0qjlKYJ3BAvksL8CpeQMz8lHElWKgiPvb9vHaYlIziOl6qrukDrYJLtkgq3RV
	 cIBMirys+wgugR+btmoV00PFA7u7bvKoRV++YamboCYlgeB6NumlhAQpZMukDaoYU7
	 vqqnOqSSfTiACHpv7xfiLMJj7n7O6d9ZOwOOk+SsTiDlXdnyTFekKbAws59sLWP/Iw
	 j+6M396HV+RVWI1NC/17VGNnyI7ygNKk1ADq0VvV3SgF6my/rTEoyrzyaJE3oDpKUH
	 +6nKEjPXoyHmEw/PYpsvgNZR7ao6B0vQEvjs6/FYG3lTegzT6O72spHiKdU9ALKPxq
	 sduMEJ0JPbEug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9488D60ABC;
	Wed, 11 Feb 2026 04:17:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 053001F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 04:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA69140835
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 04:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJTcavW_MpTF for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 04:17:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09A664026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09A664026A
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09A664026A
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 04:17:50 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43626796202so1246595f8f.3
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 20:17:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770783469; x=1771388269;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Vre+jvh17kQgLWXPwWdwTcSBCYO1ogCMYFzaI3R82A=;
 b=hzcEZ4uVOkIQPnLW6OgqZ5AdBlg059Jk0zP5voxCZnXLUyuqPMwMY4os30sOolr+EI
 c6ELR5M0ptwfliEbRgmf7z2RI8M+tuNHTzAI1TNTW+D5BvssiOpy2H4oGYPR+04Vb4YB
 QxNOW3yq+diKO4AA1x+sf5p9uArlxY/kETJWjixWg/56L/l7HSQZJx38rbjy1LLkfLLF
 8mLr84LheiXJ8NVSxC2uu8A813lGS4NaWr3Ja9hT3q/9IJ/x7tZVAjBvivzgqXP+D9xR
 Wre/duIa2LqJuhCZfb6UdPvOwlpGd6AE3Ojknyl++VPOypO27EUjgvzdKC3t5lBlyAne
 yH3g==
X-Gm-Message-State: AOJu0Yx3b6UpsY5ZuwV2bqGGCiIqwAIz0BLqC1ejBFkPaM2Am/ryFwqX
 LFmOn+US35DYdreaM5yXfip12+U9eMFpLH512NMNV1NYi5G3Rbua08fwUVgGKw==
X-Gm-Gg: AZuq6aJRIItu/B7CAoJfcAjaQT/+QX5XATqdu0IRYOJcVCDUsBDZvg9Ba9h8TSjF8Ie
 ionZb0s1uPk/izKZ1h1j8IxGvXdhkK+BPDRyRe8SU0Etk2mOUsIZeQYwEmvzq/YjEBY1IB4gF8R
 WxLe3vjFmNGKyaM6ZcP1xnMz4URdYsNjsGF4JtAWBq0tUbW797SaH7VmhP9Oezgttt55siWOcOR
 dBk/wvYRWr9fU49Kj8QPqG6W53zLrBdf50Z/0q1kQFNLnUagwvzFJqf4o1CLUZEyILgfbgz3Sp2
 dY7zLDTxZBYh9B5w/Ua9KMMpY0JWChrmXsA7Mjq3gt+CDrV6H2U3ytfK/rdbDcRjf2PkQleDGNV
 VyBVwinijTwBIUlTcGBtAkWjuGblSEmqCF32w1YLWIcxdzjW35dCZj8K8pj9Q5+biHeCWsNbtbn
 FqUuPLyitePGimGggdHYr6cJ2/BU4w0g==
X-Received: by 2002:a05:6000:18a8:b0:437:6e63:9172 with SMTP id
 ffacd0b85a97d-4376e6396c7mr12255108f8f.4.1770783468424; 
 Tue, 10 Feb 2026 20:17:48 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e3a9acsm1551273f8f.30.2026.02.10.20.17.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 20:17:48 -0800 (PST)
Message-ID: <698c02ec.050a0220.22020.0cc3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 11 Feb 2026 04:17:48 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770783469; x=1771388269; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0Vre+jvh17kQgLWXPwWdwTcSBCYO1ogCMYFzaI3R82A=;
 b=UdSf39ISsDus+UYZf/3froYJ1Very5XOTtSvslaFwN0BSmttvClXDFZ1gJdyh13elv
 dnS7+iNnk/gtZ+Se330P40WBQbW9dyqydvi3mi9QNTD62lUaURL7UWPYmgBNYHVY1OTF
 w62cWeBb/HO/q8yELm3LctLU5ZR12rF26y0EjF0+bfrkLwLcGaqlcXOdJnVcU8zoD0xj
 Vu0w4tbJ0gfH6RSyVpKtF46eyJ87+ROEZ7j0Nqv4qTEGJlqKd+RXz2/URnlAUDWQOLT4
 ZtuqXCDp7Hx/E1n7jzIDFQeAY+7IO/0r+8Va+SYzc6EvcxsobR5fRn/0YLlSoiMf4CYq
 owFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UdSf39IS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-10
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

Autobuild statistics for 2026-02-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 10  |  0  | 13  |
  2025.11.x  |  1  |  1  |  0  |  2  |
    master   | 48  | 63  |  0  | 111 |

Classification of failures by reason for master
-----------------------------------------------

                   strace-6.18 | 5 
libdill-32d0e8b733416208e04... | 3 
                       unknown | 3 
                host-m4-1.4.21 | 2 
    host-mender-artifact-4.2.0 | 2 
                 rtl_433-25.02 | 2 
           at-spi2-core-2.58.2 | 1 
                     avahi-0.8 | 1 
               bpftrace-0.24.2 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
             docker-cli-28.3.2 | 1 
                   duma-2.5.21 | 1 
            erofs-utils-1.8.10 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
            host-gnutls-3.8.11 | 1 
              host-guile-3.0.9 | 1 
              host-rust-1.88.0 | 1 
        host-sentry-cli-2.20.3 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                libmpeg2-0.5.1 | 1 
              libopenssl-3.6.1 | 1 
                  libsepol-3.9 | 1 
                 libssh-0.11.3 | 1 
          linux-5.10.246-cip66 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                    linux-6.19 | 1 
           lttng-libust-2.14.0 | 1 
                       mrp-1.2 | 1 
                    ne10-1.2.1 | 1 
                     nvme-2.15 | 1 
           oath-toolkit-2.6.13 | 1 
                openocd-0.12.0 | 1 
                openswan-3.0.0 | 1 
            optee-client-4.9.0 | 1 
             parsec-tool-0.7.0 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.42.0 | 1 
          powerpc-utils-1.3.11 | 1 
               pulseaudio-17.0 | 1 
                 rtptools-1.22 | 1 
           sane-backends-1.1.1 | 1 
              shellinabox-2.20 | 1 
       sp-oops-extract-0.0.7-1 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
ustream-ssl-5a81c108d20e247... | 1 
        wireless_tools-30.pre9 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/7a319fb35fe0ea42f1b62f3b9a7f7324b3bdc2c5 |     
    arc      |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/82211606e045cc2c212491b48f0cde086ae0831b | ORPH
   x86_64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/14671c54fdf0a2e44bcce7ff61ca9b89a925eca9 |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2e78b807575385b11f5a95cabd229f4fd1da1234 | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/40fc200ff9ac76cff087a9b9178d9dc29646ae14 | ORPH
    arm      |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/f0b1c28f1a9a22c134c565c75d4200a5600d28c7 |     
  aarch64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/8ed7fa83638965de7fa40a77c823f219060a3f03 | ORPH
   mips64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/73636df3de5ab1efc779f6ad0a00e98f66421b87 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/fbeb4535835e52dffaad2c2b1ac078b65d7d8ab8 |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8acd34c4df75818f4d498a4f92660609b46eb7f6 | ORPH
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f41277fc1f0b7a8da5c5c961cb4cf8d0e693c6e8 | ORPH
  mips64el   |       host-gnutls-3.8.11       | NOK | https://autobuild.buildroot.org/results/7b95414d299803c611f98a2a32173fcd988d4a47 | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/814bd5d0a6d454b723d68ea0dd1512abe576788e |     
  sparc64    |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/45f7a3518e0e439ea6c2130412255d90f67f907f | ORPH
powerpc64le  |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/e305e0a40fcdc9509e31d6ca5a43087a8bccd835 | ORPH
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/b1c60c55ce6998524ac3302cff5d51349127a807 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/f267eccf90baef25c141b3918fdd6b91ff3818c8 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/fe078032e5ada78d5d98b0026df1c1f451c5ce1f |     
   x86_64    |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/5fd9efaccd6e3b25b0775ebc1290404f63f6fe85 |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/71205a7c2b4e1671153cf0e259f46b53740b7de0 | ORPH
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/b6b5973ae097ddd81f248ea71a30b1f1d51cc0ff |     
    hppa     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/a96874b99090861eee9127ca1bbc7b6f9336a929 |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/f45ddb210759925011e09dae6729e32b944acc36 |     
    arm      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/e8ed631c7c0ab3a7ede20f49d534a4961dd574a8 |     
    arm      |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/15c39c7c803f9b500715e8f96a4f98facb7b74c0 | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/fa5596db22133edf804d8b950042ad150ecbf7ab | ORPH
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/ad9fd29da1026645ec52cbb0d90dafaf938a05ad |     
  powerpc    |         libssh-0.11.3          | NOK | https://autobuild.buildroot.org/results/6df34745b0ed378a412994c56651bd4fa13c8273 | ORPH
powerpc64le  |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/96a80a172c695d3a0875bde29febd0994483ce41 | ORPH
    sh4      |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/8f64985939e1ce4c591814f85dafc50bc5479314 | ORPH
    arc      |           linux-6.19           | NOK | https://autobuild.buildroot.org/results/a4dcf7fc6c66cda7100533b9b25e85820e7c636f | ORPH
   mipsel    |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/4af257cdfed692bcfe0609eacf4ad94d207e493c |     
  mips64el   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/8799515cf6706b37e0ce5dbc0ea33255e2da1619 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/95cdc4750faf4ecc634b681621438ebc246cdaea |     
    arc      |           nvme-2.15            | NOK | https://autobuild.buildroot.org/results/1bd32b6da71c118a4463fddf5c833620d2beb349 | ORPH
 microblaze  |      oath-toolkit-2.6.13       | NOK | https://autobuild.buildroot.org/results/f277bed4e61c7487a196d14baffdc7864a1307c6 |     
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/493b3558a08ff2a3108838acc9103ea7c0fa4bd5 | ORPH
   s390x     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/f9869d8b5e75c5fdedf77b162264eaf07a206a59 | ORPH
  powerpc    |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/f9171f91f4d9927d52c0cb60ab5e845f2062d117 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/be31098416a60583056805be8894d40c600010c3 |     
 aarch64_be  |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/558c5491e721f55bc24956943fa4a0ce36691cac |     
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e6b6676540d81927d77da934509c129043940416 |     
 powerpc64   |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/c35e4f39569753922482a60dff3c6ced75a1fb18 | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/cad506c002f3cf73ad9a02d1b2bd749f59c3ad56 | ORPH
 microblaze  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/5e121791f8f609839772d98b04a2a30575435da7 |     
 aarch64_be  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/2b4de79213d213318e7f1c884e1efb4fcff23c96 |     
  powerpc    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/713f55e0332780567c0d05927faf90d5a8f5cfdc | ORPH
    sh4a     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/801d7f0f0f27e6fb06787dd457818ff65cc5cae8 |     
   s390x     |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/afdf351a886c2bdd5e207d0360e5ce8ebaf7f4a6 |     
  sparc64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/fba3063bbbb699c75debed4d5fefcc2c21f0a0af |     
  sparc64    |          strace-6.18           | NOK | https://autobuild.buildroot.org/results/7da17ab61696bfa3d66283e0cc301c0296bd5276 |     
    or1k     |          strace-6.18           | NOK | https://autobuild.buildroot.org/results/d64be783a3a59d125e9f8625dbfa0568c176995e |     
  sparc64    |          strace-6.18           | NOK | https://autobuild.buildroot.org/results/652f43a9f40012e254adf7a99f82bf2e71f5c0e8 |     
  riscv64    |          strace-6.18           | NOK | https://autobuild.buildroot.org/results/46bbcb980ea2783d42c48db4cebe6f26b8ac3a87 |     
 aarch64_be  |          strace-6.18           | NOK | https://autobuild.buildroot.org/results/e31e28d2da836ff900da3c12f4d2b5dc004a29b6 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/9e3f96bb25a7e6a98dc945aacb180d02e99f463f |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/ad3bf3adaf7afece5672b8fa41687b4ce09883a1 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/4838e29646a4078dc916726879227d825ae7776d |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/6a9ea7851339f3282fe6533918eb20f8a7db432e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8a5104180a631452649e1e2881e17c6129e982d6 |     
powerpc64le  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/a5b1948d7748770685ca6c7037945ad155199fc9 | ORPH
 microblaze  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/eb4cf185468aac9602e9ab67cfbd786c27688005 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/c087a5c4c4a844eaec6f5b84d96141552eb519f7 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

               iproute2-6.17.0 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/ea37306c391cdb007fcab67789c86a5f80ba1054 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 3 
           host-libselinux-3.7 | 2 
                       unknown | 2 
                  libbpf-1.5.0 | 1 
libuci-f3fc0b76040685829191... | 1 
              skalibs-2.14.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/a8449ed89eb5b9e8031c14e086c595b87d9038e7 |     
  sparc64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/69c748180ce91b4992862e9af84972b202b25ff8 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/c657c99690bdd6d052bb840026bc0007e1ac2529 |     
powerpc64le  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/6a42e3ba8447a37878acc69d83dafc4647a2a835 |     
 microblaze  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/358395201979fafb04f135a6df21367c2d2e07e2 |     
   s390x     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/7b74fefdb719802bf3748adb737a689f14f56e45 |     
   arceb     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/c5c16143bb07ce6d9b5798c92163aa0a7d9899ea |     
    or1k     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/14114220733acdf18485a894bf666fe34ba52fd5 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/2cde6cfd1a0fda5a50b7d47f4a26cc27c596cdc7 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/fa80396ba9de92f195430b325a51cd5265b119b5 |     


Gitlab CI results for 2026-02-10
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/13048088054 |      
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/13032682122 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/13032681941 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

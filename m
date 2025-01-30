Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7B7C0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 04:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E428560A61;
	Thu, 30 Jan 2025 04:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WffmfL455Ns6; Thu, 30 Jan 2025 04:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 852C460903
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 852C460903;
	Thu, 30 Jan 2025 04:14:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8696C942
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 04:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65D0740253
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 04:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcXXoCYwOsJ6 for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 04:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 705CA400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 705CA400F6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 705CA400F6
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 04:14:42 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso86842866b.1
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 20:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738210480; x=1738815280;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vjm5B64wzFyjXe1JkSFqhhTGEgZL5wosqwFjPQc+Xqg=;
 b=tdd9GY3Kust4AkoRssI/PlJeuc0UvdJL32afI98ynX5t4PRFaIK07/bZlWUzwWpt5R
 iETOvumupEtNwtklw1dWaUOIFm8kS3lpq/ZezfUWt+ws0io7Xn5Ffy/6f2MEktlcoIcv
 VwhZgOtxriR9pzRNhks6HDZZzdpmYhqMbfL3IF26xno8r3GBRCAcs+2pcb8ZQBZKCCwb
 T8ujZJWTqV3rIKnPGuSS6aF+OufBTvsrnfKzPaNISHBVGXWB6mY67wiEIIf2A723WzyW
 3cl01eRP/l05rtPN6tanpLsN/qM+G4s9Mbm5fViOnY138VIqzJtCVGOoIukU51hc2EDe
 8YvA==
X-Gm-Message-State: AOJu0YyfCnamE4i7/EIi8LznpOynU40uD94ko4yjabdkI2BVJMf9a7Kd
 kvAX5Gt4GAXQrbLTisOSmcpxWah7WeHXvbOPVtRhc+ExlCwZXGFnkC2uWw==
X-Gm-Gg: ASbGncuJLsJAQzP7XeYUsfRElcajb6C56xgyJGREbKDDkUuxN8IQFfGfVCjg4h+Vkj1
 ZVarGUZKzveqR9SCp5Cv0BY1Nv2qsP50mQ5ujzNGIPLL3twoolW6SC4tjAzLeRbhIZ7KU4Pe/T2
 +40Z//5ke+nMRfRpmcamemxivgu3qsnQJTtOw69IIj4s4XIYeZuzej7oZHcM/RUocfh43aSK2AG
 idY84d1j+QQcXSzRz+ln3sFB4UZNFq7Um4XVyd7q0LWwSkNRpl351A+EoJhrqAXg/r9Nnhf5Dx4
 FXkB22rUg9YEbbtCKug=
X-Google-Smtp-Source: AGHT+IETfpKC542otJvsDYBsHfIo04rEkYOEigMjzdM+M9NG2kr4dLV5TXbmIuCSvODdUf02uirUdw==
X-Received: by 2002:a17:907:9711:b0:ab3:47c8:d3c6 with SMTP id
 a640c23a62f3a-ab6cfcca024mr485590666b.11.1738210479964; 
 Wed, 29 Jan 2025 20:14:39 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a562f2sm46955666b.173.2025.01.29.20.14.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 20:14:39 -0800 (PST)
Message-ID: <679afcaf.170a0220.661af.0ef0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 30 Jan 2025 04:14:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738210480; x=1738815280; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vjm5B64wzFyjXe1JkSFqhhTGEgZL5wosqwFjPQc+Xqg=;
 b=H94SSBsgLiFXsejgngc3Evbx8pqOUixtQW8HJwx+ASlKz7Gyy63g02n9/R7lHwMjvF
 oZXJyphDJyFKrLcF57iE8Vyc0aPXR0/Uw6h8q1nkw0gapR7aTt4tc2qd061m4mmyON7O
 BYcN1Tce5xN8TaXgyjloZOZUkYkUbG/ff+GLw8ZJjfLh00YC/M7eSqxZG77CtOI6vX8D
 i0dAtafnBfJR0am6qJ21M9EKok6Sbl+gSMEFGgo4naoMmHN3Q6AjUJ79Sj59g/sb8/30
 yHya1xNU28xL92NmjOapI90B5DwzM8tSjmnfaZfK5TC0FAyDbPBQ/N5vlfRbac2UGnOO
 cQaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H94SSBsg
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-29
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

Autobuild statistics for 2025-01-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  3  |  0  |  3  |
  2024.11.x  |  4  |  1  |  0  |  5  |
    master   | 12  | 61  |  1  | 74  |

Classification of failures by reason for master
-----------------------------------------------

                   linux-tools | 3 
             util-linux-2.40.2 | 3 
                    bat-0.24.0 | 2 
                 c-ares-1.34.2 | 2 
            gettext-gnu-0.22.4 | 2 
           libzenoh-pico-1.1.0 | 2 
                 linux-6.12.11 | 2 
                   perl-5.40.0 | 2 
                       unknown | 2 
               valgrind-3.23.0 | 2 
               apcupsd-3.14.14 | 1 
                   bird-2.15.1 | 1 
             bluez5_utils-5.79 | 1 
                    brltty-6.6 | 1 
                   cvs-1.12.13 | 1 
                    dust-0.9.0 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.2 | 1 
fs/ext2/ext2.mk:66: /home/a... | 1 
                   fwupd-2.0.4 | 1 
                 gerbera-2.4.1 | 1 
glibc-2.40-18-g564178076272... | 1 
  gobject-introspection-1.76.1 | 1 
                   grpc-1.51.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               host-nodejs-src | 1 
    host-python-greenlet-3.1.1 | 1 
httping-0e26c53d5fe504eb720... | 1 
                  iozone-3.506 | 1 
                latencytop-0.5 | 1 
              libopenssl-3.4.0 | 1 
                librsvg-2.50.9 | 1 
              libunistring-1.3 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
             lirc-tools-0.10.2 | 1 
                memtest86-6.20 | 1 
                  nginx-1.26.2 | 1 
                    ngrep-1.47 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.28 | 1 
                 openssh-9.9p1 | 1 
               postgresql-17.2 | 1 
         python-remi-2022.7.27 | 1 
                s6-dns-2.3.7.2 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                   swipl-9.2.8 | 1 
           uboot-tools-2021.07 | 1 
                 weston-14.0.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        apcupsd-3.14.14         | NOK | https://autobuild.buildroot.org/results/0e6a7c09afe87c0085230a1106b733fdf530fad6 |     
   x86_64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/46f6c66f93ee3a8c5696e787153efe8334341869 |     
    i686     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/24553ecd60fcc0a6e2b6af05e3ffe5126af1b7c9 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1f18a5414507c6f9171af03f4fcbcb2f40c807d3 |     
  mips64el   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/a931916577e849f514688ea15ac1eb918338b6d7 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/07187130550d196a7119b9b10f911d875a58177f |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/7849fde88531f04527e85009bb6f90439e3970bf | ORPH
    i686     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/7f621ededaba69fda4c114f81c388d348513cb11 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d1239f77cc8097197c30431ea7d4d7e90f2ab7ca | ORPH
   x86_64    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/c468b751e301ec97c6806451b9d807982577cda9 | ORPH
   mipsel    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/f22ed9ab5aabe687f55158192857087f82722c10 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/5f4aada71f1fe061956cdc14379d3b3a81ecaa04 |     
    mips     | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/a53898a075034696807424744d91ad136a35ca04 |     
  riscv32    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/201aa96b7ee279bdf702486ccf0ce6434a51cbd4 |     
powerpc64le  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/c3f49c2eadefa7ba000da20119c538a2a407a23f |     
    arm      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/94887dd33c0733d6bbba35d33f8fdec1f9102c02 | ORPH
 microblaze  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/242f8ed9c04fecdc8a5196f26088e8dcbba78144 | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/2038eb048c5bec16569d9c2a169712f012dd469b |     
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4a0cefb288cf41fc6cbcf941db8dc71722c2fece | ORPH
 powerpc64   |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/0ec950d3a0000d94160d169ce28e151ce8c24a55 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/a43a0ca4dddf383996853673643c9a1aacd55b3e | ORPH
powerpc64le  |        host-nodejs-src         | TIM | https://autobuild.buildroot.org/results/d5ee7015460de0f5482ed33ec56ff07b54bf293a |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/37d4c222120b5c3aaf6115ceabbacfd98ac2b0a8 |     
 aarch64_be  | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/c6c4cc964a54e3ba36fb1d8ed8a29a521efe08c2 |     
   sparc     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/c1774364c6bbef88af7021b020beb7e676b2c1d2 |     
    or1k     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/999187c3fcffeb8df4861dd2cab2e55ebe81ecfe | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/64444e15d23af84ef787aa18020e3a513d3aded9 | ORPH
    i686     |         librsvg-2.50.9         | NOK | https://autobuild.buildroot.org/results/580eed0baf3353668ca380d1f20bbab518640dac |     
    mips     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/fcd761cb67265266f13192abbe5d20e34a45a4f6 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/eba95db2137387f8829338ed45d51fed654b0379 |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/c2e60b4d6ba5c21b0ba0376a1ff254895691ce98 |     
  sparc64    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/f794bd4c5489ad315911a2715dd7a1afbe71e1dd |     
   mips64    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/b5cf8243a62e0194113365d7491b5528d85267cf |     
 powerpc64   |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/99ddc4b626c4aea36fc55a87ea0e7ea99f897bf7 | ORPH
    arm      |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/97a71952f7bf74dd6ab590048494efad9a757c66 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/d4d6d898ba01459afe0dfa7c336972b18031fb4a | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/46f955398e611ad115e21688ad3c80de62fa7119 | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b4e94fd806bdba9d044fa8f85afcca32a7354102 | ORPH
 powerpc64   |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/31d4ea16eeb7dbd9bcb29e205d8db2d8d08ae92a | ORPH
    i586     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/3b236f0eafca9ddc7005c690b75221e7e38ed905 |     
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/a87f34b2e18e921cb36e5c8d7a428b9b51ee30d5 | ORPH
    sh4      |           ngrep-1.47           | NOK | https://autobuild.buildroot.org/results/90cbe2955a0c6020fe77e3ec32ed2fd71030a2d0 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3026281998f729043aeed38eae272dc19e6d2fda |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/6c65edd275a631f2c7c885f34da325838560ef5b |     
  riscv64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/9d5a9a21dc661118dbf2367398521056f47f4b92 |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/f9f9660dfdc4f555cf5ea7d8aacca2b3f03eb246 | ORPH
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/b6b0be1980a72932216eec241c0a71b3f7b7dd44 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/b1fc10f0af4876910bd304134b25796d5ac62a63 |     
 aarch64_be  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/ec8510a9ed9d2ca14fac1cb8664f5be1c87acb8b |     
   s390x     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/45b2c3fa7826ea1fe53d661ef93a26cd6f69242f |     
 powerpc64   |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/fbf7088f040f71225974b4c2da7fe9fc4fb6df0b |     
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/60a8c324a7f501b6b7c1cacea3e054b297317750 |     
   s390x     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/55ce67244e7ba75d5aa55edb8f186d846f2cb1cd |     
   armeb     |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/ae03e21354ea1e1c585c9a252e32edfc24a38d79 | ORPH
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/2748aced798b2d2b488fba68a9c5781c979f575e |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/a564cdb916babed5a1f854ccf7c75c7e19eef44e |     
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5f2f24640618f3287ba8cee6a86c021604cc0f77 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d4ce854d2bebefb9f65a9fd7443f1c9ddb3459a2 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d8bea3751bd1be7e04debaad9e85671ea5258091 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/5f2228aa3d6dd6e965748abd4fe6be06362970da | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/109bff9f04fd08f7e54ac758177ba78d91d559a3 | ORPH
    i686     |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/55023959f2da6d50831cff5be677b03abdcae6b7 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  assimp-5.3.1 | 1 
                     cgic-2.07 | 1 
        host-python-lxml-5.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/789022ccff227851d4b5d46612d35c1aa0280c89 | ORPH
    arc      |           cgic-2.07            | NOK | https://autobuild.buildroot.org/results/f1d806d5474507b7004da0afa5d35d9cfc336532 |     
   armeb     |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/f89e9b98da550eb9d1a3da8427e8ce760ef9b5ae |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/70a4db1bb6a971bf1e12729c25b5bbadfdcfd1d0 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

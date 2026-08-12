Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E146C5CFC1
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 03:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E6186061F;
	Wed, 12 Aug 2026 03:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HM4DHupwExvx; Wed, 12 Aug 2026 03:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9CF860803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786504977;
	bh=Cjo8Wsf3rUENIFXwchn4pXQ3v8aPMW3exO5rhe3UMws=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gC23iZDEwwID9pb/O9knug8relsvVkDjGurFYejf2dY19CLJl8BfcTX0R5ylAfGVq
	 5NB/ySQq/888nD53ydWYoV+9sjVD1z5/nDjvL4dhtoBsWGkl42iovRzIMaZqWt9YCZ
	 xl7jeOUy8hzA39aE7ReSleFKmiABqcgYq74OZRDYfrXmZ7ZBSyhg4cdJhG4Tc3GNF8
	 DwPIWQzpmGCRG/C2iQMyZNjXPW+RbsvQCjzlGnl0ADDBJ8f4iXxP2jHu/sp+E1QNSB
	 BaAEcVOG1oVCfjXT6QpUbWtPjP3Wz3alaXScimEtvnEKD2qsY/EvLUOImOvy1l8H2D
	 Sh2Qd/RpKsxhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9CF860803;
	Wed, 12 Aug 2026 03:22:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0B5449B
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 03:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB53E60803
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 03:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4CnK5R1sXEy for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 03:22:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19E016061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E016061F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19E016061F
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 03:22:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so3042075e9.1
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786504971; x=1787109771;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=56+cdCdGcn3SR3/tj+FFgnjIygR2oMfWdwDsTWxRXbM=;
 b=U0B87bRhMY/H0rF1+OTG8tjwRymfGBY1r41QutfYoWn5EJJQJXqp6yn4Zz54j7dcqW
 vnL8NhEDRHU1sI8inzrTpIU479dxHPhvjPdoESCYyvCCpOtznxIpJuulpZX/Ej73HTY5
 lHEKrvEU/WVNFKyrf3FPgz5MFDX+hUg8LksHsPHR58NmhDMUE15+XvYIab6+tFRJ0BDZ
 N7ptP6fyrRHE9gJoW3QXyoiKPDB3wuwox5Js2yC1U4fZewHBlx3rVJkGEWx4rfgqGXdw
 6zo7IIM07RkDLrORAW/e6oeUNjpjZUybFqnubo0qB3Q+GBmZPaHDontpgefiZN3ixVP/
 ShEA==
X-Gm-Message-State: AOJu0YwZzNi59aYaizEC3Yz2ckfprznFCzl3Tw1PTtQhYUAKSiXxKYe8
 ixwnvuxtgWlOG5Lz+D0nKKo0Mi2fn2wU+HuD2onQJT/92iK/i9zZRtKt9hqKg91r
X-Gm-Gg: AR+sD12ndk5aTO1tpbB4cXSPPurzo7eayx0WjyJhrkI2HpDFSpDspS+FMbfEDJd95tj
 ej0r3xhyiaweZtPbChBQIUNS8nps2rL3pG1+hTXphPoeISPxf/H8zCMDM+m9NZfSUJLT1wHLKm0
 yxk3oBakNP2gWmmPm2TF9WmUdka+cMW5ROYiPxiTs3cC+Ab+FDd/twrdGa2/kQutvwDlsogdAy7
 6eKmW5A1rGCwuz1i9xQZPXVi45qsP4D8b49XWdCDagTb5+YzRMgnaaQffDu36U7I/Xf84yy5VUQ
 uChWFwOQuThR+U3JW+fFDGdCoX6oqW9m+zWrR3RlYaqgcPE5BVNSGUpg0/MH3CvjUAtLfQqZtZ9
 4m5Vb+Lp8mFI+/X3elpOI98zCdd8vFb1Juiklt8/p10QZo1hqyZ1+0HfPrSt1v//Cg9fJTB0Fc/
 pU0xlTCZQQVvyhnVEchzZVQy3HJtk2eAA19dxc5QIzeaome/DW6E8/j83M1IqNv7Pf
X-Received: by 2002:a05:600c:a21b:b0:499:5a50:b022 with SMTP id
 5b1f17b1804b1-4997c0fd924mr12286995e9.3.1786504970803; 
 Tue, 11 Aug 2026 20:22:50 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d4e400sm3379244f8f.21.2026.08.11.20.22.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 20:22:50 -0700 (PDT)
Message-ID: <6a7be70a.e862d496.2ec1a1.8c4a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 12 Aug 2026 03:22:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786504971; x=1787109771; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=56+cdCdGcn3SR3/tj+FFgnjIygR2oMfWdwDsTWxRXbM=;
 b=qMew61aGvVegi4Uaeow2zqIoT+2BQzI985b3ypNK9cgBp8bHcmdPVAf3ypdcrvsexU
 B1e115s9prPZtbBIS4EXPYBl8pCf7FQjsxPTXtfQkEGWhA/uUexi5Du4wz6WE9zs2umb
 pSFqqWgzG1sTZyvPKg+rwSIwvYu+xViDV9eGcLZoHoNMNrhBB+m/3Se4kB5Ry3MccO9l
 P8ZawPfLZp1Ds1SHjYVAD/Bdu9GSsB67CPNvwCdsADcjYRhaVIlDANUxUdvOvKiGtQnl
 b5CPTqN1M93E1pghT1ZFCRKD3bUgFYgpEyv0z9gNDcfwWgpOM2uWnV8ZT7MrZACojnY3
 l3pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qMew61aG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-11
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

Autobuild statistics for 2026-08-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  | 19  |  0  | 25  |
  2026.02.x  |  4  |  7  |  0  | 11  |
  2026.05.x  |  7  |  5  |  0  | 12  |
    master   | 41  | 69  |  0  | 110 |

Classification of failures by reason for master
-----------------------------------------------

        edk2-edk2-stable202602 | 4 
               tcf-agent-1.8.0 | 4 
                       unknown | 4 
python-remi-2022.7.27-37-g1... | 3 
uhttpd-15346de8d3ba42200249... | 3 
                   ccrypt-1.11 | 2 
                    flex-2.6.4 | 2 
                    grub2-2.14 | 2 
    host-mender-artifact-4.4.1 | 2 
              jpeg-turbo-3.2.0 | 2 
                  libva-2.24.1 | 2 
                    olsr-0.9.8 | 2 
                   perl-5.42.3 | 2 
                 uclibc-1.0.59 | 2 
            18xx-ti-utils-R8.8 | 1 
                   atop-2.13.0 | 1 
                  broot-1.58.0 | 1 
               collectd-5.12.0 | 1 
             dahdi-linux-3.3.0 | 1 
                    emlog-0.70 | 1 
                enscript-1.6.6 | 1 
                     fd-10.3.0 | 1 
                gnuchess-6.3.0 | 1 
                  gnupg-1.4.23 | 1 
  gobject-introspection-1.86.0 | 1 
                   gvfs-1.57.2 | 1 
                haproxy-2.6.27 | 1 
       host-gcc-initial-16.2.0 | 1 
                iproute2-7.1.0 | 1 
                     kbd-2.9.0 | 1 
      libabseil-cpp-20260107.1 | 1 
                  libgta-1.2.1 | 1 
           libmicrohttpd-1.0.9 | 1 
                 libzlib-1.3.2 | 1 
                   linux-7.1.8 | 1 
                   linux-tools | 1 
               llama-cpp-b8117 | 1 
                opendoas-6.8.2 | 1 
                  prboom-2.5.0 | 1 
                 rtl_433-25.02 | 1 
         s6-networking-2.7.0.4 | 1 
               tcpreplay-4.5.2 | 1 
           uboot-tools-2026.07 | 1 
             util-linux-2.41.5 | 1 
            vorbis-tools-1.4.3 | 1 
wilink-bt-firmware-43fca73c... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/1823c3dbb53857f4eb894103db9d384056f79f2a |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/44a8a0c9f42f1ec81f3ca08b07c967aec8e4c42d |     
    i586     |          broot-1.58.0          | NOK | https://autobuild.buildroot.org/results/ba984fa35609069402413035acab2b097f25dd60 |     
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/cb9d9601c12c30bcac6f44f0a40cc01c7a094a1b | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/fe0048ae7b940f2744ea3f4dbb906067784b8c5c | ORPH
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/58090494d69eaa8e677d568f33bc1ac9020d685d | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/16cf1254824207dc419f2dde6fb27cb43fffc16d | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/01b2f8e520fe1884096108c3e86c0c4f69771896 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/093790a48677d8baf9377ad5455ad3ce720a003d |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/60ec8e45d0e4137d1f1c514a74835465990f954d |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f56ea060461164bde411bb9995568d5321ff3beb |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/2af241a52b3c2ef12ec75e103a803736dc7df265 |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/111003ce034f6b29203bdce411ecb61d272e74a8 | ORPH
  aarch64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/65d772a96250c3c2e22f405647f3b0f61d138814 |     
  mips64el   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e7cbb9bee77f3c4027ae038d75daad6eeb919be0 | ORPH
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/300781f310150d0b14adb5d284f2f1bcbeb8cce5 | ORPH
    i686     |         gnuchess-6.3.0         | NOK | https://autobuild.buildroot.org/results/d703a3bc88f3f79307a94ec6d1204bacb837ad23 | ORPH
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/282fc16be235efd5b8a20abaa60d124b1bfe17b3 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/451322df525107f5553299dc9d3d7d56c20f1935 | ORPH
    i586     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/dbedc71fdfba4c580f3dd0cb9b57e2ebbcf85275 |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/7076898b40db909120d0e9e9f45a2c067cd9df32 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/82028da3bf00e298c1f16f345f9fb713909b3e25 | ORPH
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/8f2519637848e7a5bc87bea4b5535ebd472942bf |     
    i686     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/3342a812b489b9c7106fdb23f10044bab7a14bb9 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/ff0948074eb698fa01737b4822fda40b56fc8cea |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/589392154e14c0b120321e4f794c33d96005fe1b |     
    i686     |         iproute2-7.1.0         | NOK | https://autobuild.buildroot.org/results/a508e3fc7401a6a81a0935367cccb8c0d566572e |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/0a2bf4af1320fc77b458416a43de1bd0f20c305c |     
    arm      |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/354d0adb24bb49c8e076c4acb77704f4161d60c1 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/3dc4a3c3bfa6778813660c2de3ab3aa7d0bc302d | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/a887b04dc888ddccb43ad30575d8bc23933c5a18 |     
    i686     |          libgta-1.2.1          | NOK | https://autobuild.buildroot.org/results/cca0ba3ef0be46688160113e262ee1fa3c7c8cfb |     
  riscv64    |      libmicrohttpd-1.0.9       | NOK | https://autobuild.buildroot.org/results/d4e1cd861ae91eba0bd486c8ec2e703efcfc8583 |     
  aarch64    |          libva-2.24.1          | NOK | https://autobuild.buildroot.org/results/3fc9f4a83b823446a1251487f3e99069ba4290f8 |     
  riscv64    |          libva-2.24.1          | NOK | https://autobuild.buildroot.org/results/6c2c590d085a5f495eeece7ec8c146a1339f53c0 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/eacd8b1e31e7c59ba268c82b87a51e4cfe8bb560 | ORPH
   armeb     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/f2e7edf778fed427be563b091f7ef8d0a2718254 | ORPH
    arm      |          linux-tools           | NOK | https://autobuild.buildroot.org/results/cca5c246c62fbab509250e033453f4c6297785f1 | ORPH
    i686     |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/c59ecf348a7bfc4b3fb2b7ae85401acdca0613dd |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/60a7b291e01b9299c742ca95621b7b0e5f4dd30c | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/4aa8e18193df97d3f2727f63078216788327949f | ORPH
    i686     |         opendoas-6.8.2         | NOK | https://autobuild.buildroot.org/results/755c81eda753dce17e6bd75e8ee6dcc562c92a97 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/1cea67016f38d9cbb4c9dea39537dd26567a219f |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/1806862a5c6d97e0d38b2f57f78aae23dbbe8cd0 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/f22d9d8c25f14ebf3f5288e741a19e56d2a88b55 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/6785c857284781e1a4da2c8b8f7e1c24d0187646 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/795e2ea6d343061af0d80098520fc0509b263bae |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f2dc52de2376abf564f0a01548edc4838951cbb4 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/1e2598721ff753e412b0e7a47fff3091bae13cd3 |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/682b51569a1ba9de670a5e62b3d19d5ef23aed4f |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2c6885c81cfb577cabc621d3d442a399b012bc1c |     
    i586     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/3102ce609b924ce5a92bfe8d28d63daf01826460 |     
    i586     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/397fb1ee8c54ff2993e1fef06fc4a5132662e07a |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/dddaeb0a9fa24547b59bba8dbf18acec24c70722 |     
    i686     |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/835f7458140c7025f1bfca5e7c0b77c6c9b51d22 | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/f89c3070123737ca77e0c71050d2fbf7fdf96b74 | ORPH
    i586     |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/8dd36897b352729ead74768aeba7b88046201676 |     
    i586     |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/5bcc1a12bc15354b31ee0a4ca79d6e770e125ff1 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5bf710a9f1e6a5b98c440946a03cd19ef5e3ed43 | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c2744792bc61a841391ed310dbafb90373a1ac4a | ORPH
  powerpc    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/07b54182396236ca7ad4920e9670f2fce93827f9 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/50f07c21f55dc8352efbec627ec292a050315d6f |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/ef101f1d4d7efd3a974be464538cbd6e61083614 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/787bab354b1c7b4929d82cb21dc06ef6e9bae45c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c8029ae8df33d3804765aad32f3d1febd9d68c77 |     
  riscv64    |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/1de7c7c66db7e0644a181a97c5fae7fa3c2e425f |     
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/5d5ac9cad8a5a9ef375a37ec56b7ed0d4b36f16b | ORPH
    i686     | wilink-bt-firmware-43fca73c... | NOK | https://autobuild.buildroot.org/results/f4b446a7af35f99a4c35b09bd452aac7d6d53db9 | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/8f5f14e77569b3c0d3c3f8570ad89b4de563a08d |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                       unknown | 2 
  distribution-registry-v3.0.0 | 1 
              host-rust-1.96.1 | 1 
                libgsasl-2.2.4 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/96bd793cd495f9a920a03784a712bf83bb1a66fc | ORPH
   x86_64    |        host-rust-1.96.1        | NOK | https://autobuild.buildroot.org/results/be26a0c7b523746da471151517119b31cdedbc2d |     
    i686     |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/751e5a880a2b21646ac68cacff9293646879b866 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/5e57956030942cc1c743403e4d2b3514252f468b |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0c9e63eb911d41e40e6069a38adb43887555001a |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
  distribution-registry-v3.0.0 | 1 
              erlang-26.2.5.15 | 1 
                   guile-3.0.9 | 1 
              libopenssl-3.6.2 | 1 
           libzenoh-pico-1.2.1 | 1 
                memtest86-7.20 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c96e62defa3f09239303ca731372f308211fea46 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/4022bc0e64cdcaf0505a43a0a25829166ebe0621 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/223c23e243030e9f5a1259deb56cbd24b649a100 |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/f99106bdae4e35e8b120ea08c061ce83fa6cae06 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/f28d55679c1605e7a3e2817e856411b377b4f547 | ORPH
    i686     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/2cd905e2a247a548698285223b275d98dabd14fd |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/6a0e7214f288aa80d202022921a98f165bebdbe7 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 3 
  gobject-introspection-1.82.0 | 2 
        host-python-lxml-5.3.0 | 2 
            18xx-ti-utils-R8.8 | 1 
                 ddrescue-1.28 | 1 
host-netsurf-buildsystem-75... | 1 
              libgcrypt-1.11.1 | 1 
              libopenssl-3.5.7 | 1 
                memtest86-7.20 | 1 
           oath-toolkit-2.6.12 | 1 
package/linux-headers/linux... | 1 
                  pdmenu-1.3.6 | 1 
rtl8821cu-96c65c58b54424117... | 1 
ti-sgx-um-909e237baf47d0bde... | 1 
                tinifier-4.1.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/c58f55838005cf468400003abaa3db53a245b5db |     
    i686     |         ddrescue-1.28          | NOK | https://autobuild.buildroot.org/results/b50483a2d090983e9bcff95e9acaa2f933c49127 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/7eaa6dd5ccfd4bd1271ef1aa5ec6ae7e454921bf | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c9cae91259d2b890ae080ed9a7c192c6def49db5 | ORPH
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/7ef8e624024c3afeaf2c790b5526b22c943a8476 |     
  powerpc    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/0ad9a9c8b6d21735ff3a82b99416e572564ef918 |     
   arceb     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/79c94a09a228f530d3a37e327b3150fd14e12999 |     
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/5f0a5f4700d12e8e3e1c811de385a95f45d1a6c7 | ORPH
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/940cf8b5585ccf20b20b9b171ca35c837afeeb7a |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/91bb1649caaa7fd30d3e0e75ec97d262dae027aa |     
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/a4c84d1a03c639cc26b35ce09957ce7c5e2eb0bb | ORPH
  riscv64    |        libopenssl-3.5.7        | NOK | https://autobuild.buildroot.org/results/fb0fc72aabfb40ddfba0c360259e08cf2057614b | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/2f4a86c49885c2e082e77fa0de7347fb78b1f367 |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/0678190ac45f219769647e806618d519f00be26b |     
    arm      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/2f0ee2c953467eb17aa2ba689fe2c190b5aa5911 |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/831a52a3cff1fd1378219497a199fa9b75509d72 |     
    i686     | rtl8821cu-96c65c58b54424117... | NOK | https://autobuild.buildroot.org/results/c5c77aacba70139db32d396c3117488905d8671b |     
    arm      | ti-sgx-um-909e237baf47d0bde... | NOK | https://autobuild.buildroot.org/results/858a1f9342e83dfe8d33c28fabe4738a34aeee6a |     
    i686     |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/f17a4aa71259d772206e2b4a0b788fa525405601 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

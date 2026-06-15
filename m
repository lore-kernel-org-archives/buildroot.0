Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ACECD98C5
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 08:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13AE940117;
	Mon, 15 Jun 2026 08:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9DdcP7Tz60Z; Mon, 15 Jun 2026 08:43:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3440B40BC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781513023;
	bh=WzVRWIgGfrgitjuoL04CAgDzs8WJTOzZGgsOy6noqd4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RzRA4hywGaI9LZ3A0xh888HgVHp8NBvCOKoRo2Wa2H6z2ltwCcnMXbd0al//TXv7F
	 l3sfF1OOj/6S8+Raw8M3ip3fHJjwAQGCrVOtBX8Cpf7lG/O1m+DvuJ9d3JI+OiO1wP
	 ixT3tcf2pslkuCyS7++622ggu38Owx+TEhvThv5tvwdR6JveLCkppp26JbQBzftlSh
	 mi/9JE95fc7fI7Qy9WtecHKEwwD1hlf5iHXaM10WjYIpfRJftS1zU2Z3HI5/+egCPk
	 F6wT+XZn+u/y6eIPqg5o3qNllMbzs3pWllkLeUO0izwZGfHXBXblrmlNMk/s5zUoe9
	 zdpFdrMiW3HOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3440B40BC4;
	Mon, 15 Jun 2026 08:43:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32C77DE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 03:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E0D660DA6
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 03:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0H9hukhh-wyN for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 03:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71BB360DA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71BB360DA8
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71BB360DA8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 03:27:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso24446395e9.1
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 20:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781494050; x=1782098850;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kgPKBFIhNxQXnegcsPEYpS1zBEOwbI3DU4jPC0WN0AM=;
 b=jf7OztcOrZ7tLRqGXKXKOxzReyFdCoxh8Ap+ygcxakavAsszukqj54iu4AbAsFlkEj
 Z8ags9UCDrABRJW3qJPMDPpErytz1v8Cx8imdSTeeLFwc6tPvg4wWNRNtjgWZc/8vE8F
 WrV2l0GxjtJ/thsMx+sHnp7x06N1QYd5rNzXrs/ino2FcJrl8oeEC5305gEeYlC9A1rJ
 LwR4IpWMRa3XSlaZ0j6ywZopO0SbMIHy66q13jidpGijwqulXc/Zv6lHWR86YZscCUNK
 TO8I2BixJznyzdEpikFV1xmqOZGivamH3dpjEWY96OPpnqwh1hrueM84yT4VDfQhnwej
 p64Q==
X-Gm-Message-State: AOJu0Yw58cLVQPHwEGlAcia/6/CBUaKMB+poTJ/d7JORFCUgOSibccp3
 4p685yzo1WhV2+tvqcQAOksG52UjXSgoJ4MOkgJArQQJf/UqMrMSXUlZUt97hTlD
X-Gm-Gg: Acq92OGvHaQ20TLzRgCVS7wvx/Yh37DgygE/m3T8hTIHseMrgoo1EJYYEYC74DTcebC
 aMEs8scB9WaZ7ZEQr2r1zi4LzpnbM85erx/ABJCOPMN5eHWLtD0EfDhzSp/XB0UXGPXEBzHH8/Y
 pgorRFaoeYpwR6fbl9j3CPIaKw1zE7M8DqpTuIwuEGoOZDkz0G2QdMcK0Qr/swA2o7NzOHaEzYt
 nnCYV0WWYwZx0PHo1HXNhzM4o/7oJ46/VlLLXCIed1PbznTq9ruuXBNJUcu45L+Mf/b4j/6Sx57
 xklkoukK5b3OCM2u/rpepBOm1UzmsQYLGX7Eh5x9iYEqS33skOx5WLIBY/N4Ck4HEaSLTP9dL0C
 JyHzXHfoyp4yMzIlMMKnaaf5h3fuSzkFatzv3SrshQl3zcVtalbP7ngSv9wCJPRksB+lKc2PdiM
 puZNyQ2b7IXykBkDGGXwIWTsVG1w==
X-Received: by 2002:a05:600c:1d06:b0:490:b8e6:be40 with SMTP id
 5b1f17b1804b1-492200c01c2mr119981245e9.21.1781494048790; 
 Sun, 14 Jun 2026 20:27:28 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2e592csm32496522f8f.36.2026.06.14.20.27.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2026 20:27:27 -0700 (PDT)
Message-ID: <6a2f711f.892a62f1.395abf.ce58@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 15 Jun 2026 03:27:27 -0000
X-Mailman-Approved-At: Mon, 15 Jun 2026 08:43:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781494050; x=1782098850; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kgPKBFIhNxQXnegcsPEYpS1zBEOwbI3DU4jPC0WN0AM=;
 b=P7zpY2dV28HCjakHf9AYvIM/Rvu7QEsc7rvICgacL120dIauczAcJuzJYuOyG9Uk9f
 N8fTCGb6baLW5oWiF//0TUEyRroykQT7NS/tmmgBMoXSb97jePqlD1AE9Dgp5uGc6o21
 988Uf1uNKtg2PdOS308jRJVocyk2fP68bMeJtU1qaNLhRoNrWwggMryexAtgEkhVv/fs
 Sy2QdJ//zPDE9ITUbIK0PlRR4m3bVoH1n6pTSya8rzJuvreCQwEYQDuIkpSvgxLuZshK
 PZ/FFtELQXMo/2yD5wENW0k1CbDMDKtnJpjfo/ujvb8YEUhOtQqcfrwpPb31alV3SAG+
 rN4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=P7zpY2dV
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-14
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

Autobuild statistics for 2026-06-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  | 26  |  0  | 36  |
  2026.02.x  |  0  |  5  |  0  |  5  |
  2026.05.x  |  4  |  8  |  0  | 12  |
    master   | 73  | 265 |  0  | 338 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 21
               host-dracut-110 | 14
                   perl-5.42.2 | 9 
uhttpd-15346de8d3ba42200249... | 8 
                       unknown | 7 
              host-guile-3.0.9 | 6 
                host-odb-2.4.0 | 6 
      libabseil-cpp-20260107.1 | 6 
            18xx-ti-utils-R8.8 | 5 
                    lua-ev-1.5 | 5 
        edk2-edk2-stable202602 | 4 
  gobject-introspection-1.84.0 | 4 
    host-mender-artifact-4.2.0 | 4 
        ltp-testsuite-20260529 | 4 
                    olsr-0.9.8 | 4 
                  bcusdk-0.0.5 | 3 
glibc-2.43-27-g4070d808bea1... | 3 
    host-gcc-bare-metal-16.1.0 | 3 
host-google-breakpad-f49c2f... | 3 
              host-pahole-1.28 | 3 
libfutils-c326ce0cc2a735438... | 3 
   openvmtools-11.3.5-18557794 | 3 
               valgrind-3.26.0 | 3 
                 zabbix-7.2.13 | 3 
                 aichat-0.30.0 | 2 
                  broot-1.57.0 | 2 
               collectd-5.12.0 | 2 
             dahdi-linux-3.3.0 | 2 
              erlang-26.2.5.15 | 2 
                  ffmpeg-6.1.5 | 2 
firmware-utils-c42a3bc53da8... | 2 
                   guile-3.0.9 | 2 
          host-binutils-2.45.1 | 2 
       host-gcc-initial-16.1.0 | 2 
                 host-gdb-14.2 | 2 
            host-go-src-1.26.3 | 2 
                   i2pd-2.59.0 | 2 
            igd2-for-linux-2.2 | 2 
     kvm-unit-tests-2025-06-05 | 2 
                libmpeg2-0.5.1 | 2 
               libsigsegv-2.14 | 2 
   libtorrent-rasterbar-1.2.20 | 2 
                  ntp-4.2.8p18 | 2 
           oath-toolkit-2.6.14 | 2 
            optee-client-4.9.0 | 2 
                  pdmenu-1.3.6 | 2 
 qcom-db410c-firmware-1034.2.1 | 2 
        s6-linux-utils-2.6.2.1 | 2 
           sane-backends-1.4.0 | 2 
                     shim-16.1 | 2 
              skalibs-2.14.3.0 | 2 
              tailscale-1.78.1 | 2 
             util-linux-2.41.4 | 2 
          aardvark-dns-v1.17.1 | 1 
               acpica-20251212 | 1 
               alsa-lib-1.2.16 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
amazon-ecr-credential-helpe... | 1 
                     apr-1.7.6 | 1 
                   bird-2.15.1 | 1 
                  bitcoin-31.0 | 1 
             cni-plugins-1.7.1 | 1 
                   dante-1.4.4 | 1 
                   dbus-1.16.2 | 1 
                 ddrescue-1.30 | 1 
                  delve-1.22.1 | 1 
                 dmidecode-3.7 | 1 
docker-credential-acr-env-0... | 1 
                enscript-1.6.6 | 1 
              execline-2.9.6.1 | 1 
                   exim-4.99.4 | 1 
              fftw-quad-3.3.10 | 1 
                      fio-3.42 | 1 
                    flex-2.6.4 | 1 
               freeipmi-1.6.18 | 1 
                     gdbm-1.26 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  gnupg-1.4.23 | 1 
                 gnupg2-2.5.20 | 1 
                    grub2-2.14 | 1 
host-am335x-pru-package-5f3... | 1 
            host-binutils-2.44 | 1 
       host-gettext-gnu-0.22.4 | 1 
            host-libtool-2.5.4 | 1 
            host-mfgtools-0.02 | 1 
              host-rust-1.96.0 | 1 
                 host-tar-1.35 | 1 
      host-uboot-tools-2026.04 | 1 
host-vboot-utils-7dfa482d6a... | 1 
          host-xfsprogs-6.19.0 | 1 
            igh-ethercat-1.6.8 | 1 
                  iozone-3.508 | 1 
            jpeg-turbo-3.1.4.1 | 1 
               libdvbcsa-1.1.0 | 1 
                libglvnd-1.7.0 | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.3 | 1 
                 libsepol-3.10 | 1 
               libxmlrpc-r3335 | 1 
               lightning-2.2.3 | 1 
                  linux-7.0.11 | 1 
                   linux-tools | 1 
                  linuxptp-4.4 | 1 
                  luvi-v2.15.0 | 1 
                   ncftp-3.3.0 | 1 
                openntpd-6.8p1 | 1 
                openscap-1.4.4 | 1 
                openssh-10.3p1 | 1 
                   patch-2.7.6 | 1 
          pkcs11-helper-1.31.0 | 1 
               pulseaudio-17.0 | 1 
       python-autobahn-25.12.2 | 1 
               qt5opcua-5.15.2 | 1 
rtl8188eu-cca7c28087db740d7... | 1 
                 rtptools-1.22 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
                      tar-1.35 | 1 
               tcf-agent-1.8.0 | 1 
toolchain-external-bootlin-... | 1 
ulog-0389d243352255f6182326... | 1 
                wf111-5-2-2-r3 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                      x265-4.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/98064fde7aa6991b39e9593046caae5497723ab9 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/67edec78d225aa48e7e5db9a57ce9d5cdcb0408f |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/fb1030bd46123cb74d7959e236713e9076960a91 |     
  mips64el   |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/fd6518d9c71b3abe47939dc724bdde4e018ce18d |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/39c652d0f4995d48f7d2bbb7ca051648487ee22f |     
   x86_64    |      aardvark-dns-v1.17.1      | NOK | https://autobuild.buildroot.org/results/fad8a348e66d65b43b1c562e3dc0795046550275 | ORPH
powerpc64le  |        acpica-20251212         | NOK | https://autobuild.buildroot.org/results/fa136398db61d680cdec82848919baeafe55b4b6 | ORPH
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/8766144e071d6bb7fbdc51d8574d5853501dc225 |     
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/67fc1e84c7fe182d8e717a2022e7dff5687f2eaf |     
    i686     |        alsa-lib-1.2.16         | NOK | https://autobuild.buildroot.org/results/fd479b444def3a3992037c26f5e167ca7683a8fe |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/51e55940b5dcdc5700dbbb7e94c7841e22e3cf3a | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/4f4174d27ccf822d2178c0ce578ef4c7b6086304 | ORPH
    i686     |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/0a22a7c69b39e1d1d4680e7fa57a0a671be5e38e |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/72f8352f372a29ad4f98b4eefe07684922546330 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/9a93e8b0af6b4e9c688b43cd5cf3bf8004da4ee0 |     
    i586     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d3d450d2bc167af213d609ff0f986dd4be70e915 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/fd209fb9e8ca4c5c182f56778bb77537c7c7d6aa |     
    i686     |          bitcoin-31.0          | NOK | https://autobuild.buildroot.org/results/093253c79fed1c5b93decc3124e9ef4622168efe |     
    i586     |          broot-1.57.0          | NOK | https://autobuild.buildroot.org/results/2bc2fda8402d4fae1b82d3f8bdbef5284bec5b8b |     
    i586     |          broot-1.57.0          | NOK | https://autobuild.buildroot.org/results/a7e9790171d4fafdb8e7084bc44de0452d9b136f |     
    i686     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/991b9bca45ed277ed4a3d9c27f081ebd96442115 |     
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/b69dbd72ca68bbdc244dbfdb6fe1e208cadfb4e6 | ORPH
  aarch64    |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/a39106b04e41359fbf11c02643622c32d0f9c9a5 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c4e4f5f562b80988a0a7be85b87c38ef8b8b5e70 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0d0d25f093dd744f2ecca8384e6cc112091b1ffc | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/91ee216f12b71f5fc8d7b9e4ba529f369242970c | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/2fbb197292921233c09c8bedb7e51d7f5b039fc9 | ORPH
    i686     |         ddrescue-1.30          | NOK | https://autobuild.buildroot.org/results/b7b1094b2359841c648af58d496e9968a794ea36 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/5806f2b130104d5dde77cfc57fe87fe40a433a1d |     
    i686     |         dmidecode-3.7          | NOK | https://autobuild.buildroot.org/results/29fced3f2a207aed8a0ca51dcb8646435fbcbdb3 |     
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/e3742c08a2105cb4e05f53099820ab31f2c25895 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/0bca0eb7650822ef7a94f6debb1d83104ebbac5f |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/0fd5e4886a6a2f7a0d8d5887eadb5029a6f9dcb6 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/6c26931be87ae5172795af978c8aade56579fb75 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/c5beb3c683bf1c4319183888130891374a27e312 |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/577111928bdf528ac0c15e3565c0f5de203ade29 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/08c1bfaafe6d75733ccc79bbd76e22a1f0b36c16 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/95a2ca16bdc4f3463b75abfb0b219dbbfa1fbc63 |     
    i686     |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/9c0ff441946c1c8a7a5e42c539c63d31a2e86361 |     
    arm      |          exim-4.99.4           | NOK | https://autobuild.buildroot.org/results/2bd80a2abbec8afa2e7bf8a7ef0b142872aefd65 |     
    i586     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/a70fd77da0545d510a8a4bafeecf5ea467f2d964 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/c03ad2e9603969f92e7e5e5c30b1d7e0049c7568 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/fa9a6e1c2cd7bbd71fab4e423a860693bfbb39c3 | ORPH
    i586     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/8a5e5e3b54ee98f5760b04d03e4d7a9e75b0a361 |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/f2365bd7cec50eda79e777387e2ec4f4f566299c |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/d67e7ed09fe2f2dde517a3d1807fa54d72a3ac83 |     
  riscv64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/6f094be5772d7442d67f51132cfb9394bc90503a | ORPH
    i686     |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/26495895e93357653210f55228aad2630f1cb7ec |     
    i586     |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/c7be1f1c2c5d552658383651f42085d320a489da | ORPH
    i586     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5d1b816d08ee1c3ef72e2ddb5729a664885d25bd | ORPH
   mips64    | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/1c021f4ef0525a085b005f70792304f918fba55c |     
  riscv64    | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/9a4cf7427db45c623b707820def86308ddb56a16 |     
  mips64el   | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/692a50ffa9f20d65e4049cec65642393b060d65c |     
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/0a7ac898da81f7696aa1e279f30ccb0731ef2bcb | ORPH
  mips64el   |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/8b354e876d076b288f7d226471708967d8dc590a |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/445bf97df4f24a9bb474841c059f52f759fae012 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/34b41dfe1961cdf86aa95dee25d544507dd916fd | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/62b6681a43ad9b2ece080c894167471d22fc9141 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4492d13b2b71c413d66f28f62d4f9e14f37dd53f | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/7e899a2ec0b858f64adf97a113aa0fe07cd7c3b4 |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/83e29d82cfaea8edf633bd071ed17a302c7fd90b |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/491ddb6f7fd7010e049da614847cada25b2bdf92 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/1174e12d0941a339980134549f23ee6cfcbb8b3a |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/5670fec6df782b8649c3227d839a508d49cc383a |     
  aarch64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/1d9989db6c7a3267d35a29644f2edafcf18e80bc |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/26256d18006b6a1b683e82856c72eff91b2f9fd5 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/2f5e3782cd09120b905e7cc9f57af8c33558e0f6 |     
    i586     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/44397be9787f8c00dbbe88b85ed45e5a084aba8c |     
  riscv64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/88cfd9eb24c5197b8a7ceaeb4951b16b23dfd662 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/bba5fd96f910253eaa88fa58b1f2a735ef8b91de |     
    sh4a     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/8851b5804e11c9535c34d14ae1c69e8b6175c7c8 |     
 microblaze  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/86b95e140b8bd32d6274fb68a75e86907893c0c1 |     
  mips64el   |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/c55fe60d22eb3076fb789b47687379932b97ccb5 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/81bdc58e439f0bd8e625e531a48e50b3f650d02d |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/d3af86b6e14ae90f8dec64a76faf1262f7c07306 |     
    arm      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/668f3868c440174652b8c2f55ca0162b7311e7a9 |     
   sparc     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/6c29d5393d56a43ac6671adc2762941e1481d98f |     
    arm      |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/c2e81bb29298ea4cfc5b0b0bbfac882667f53add |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/3723edd9003883f5f7897e48ff0c30e350d4b38e |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/1edd690709a8a33f0dd7dcc9319b4880bb01dc16 |     
  mips64el   |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/af98d04f0733b390b78447462d9c60f85c04b2cd |     
powerpc64le  |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/69551470da95d61de2cf469f645afb18a515d5d0 |     
    i686     |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/abd95f565c63c757e72889271930d2dcf2027ccb |     
   sh4aeb    |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/f5d024bb6e3e6909cff7537bd590bb9b979a33fd |     
    arm      |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/5312cfe2a9c4b57dacce1cfd4b604b692944dec8 |     
  aarch64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b374f88ee93592f9fc7d54f2a801b03ed7c16776 | ORPH
    hppa     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a3e3037cebf82a8befda3fab258a230d3ac596e3 | ORPH
  riscv64    |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/2b98f81d626e792d392740ca8d22c1e2214e7163 | ORPH
    i586     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/dfef8b500ca6d1db3b75db3ca7593e5002b551c9 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/4437f429bfaa4c474b9dffded315e0a7b43fdaad |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/48ac22ec558eee81375d1f72369a84de649a5d93 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/18279c367e72e80847b86f904ea69058b503386f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/44ccbb1a3f5f0448417c32c79afb20fb064f596a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/80cff90df44ae7d489525a05374fa2e8cd39cf8c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/219ff712a59c8f730c99b10979adb5ad772cd562 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/66e6c0531638a0002d3b7081ff06bc9dc58b8f4c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b967ee1384703f1668c3676984177265297081dc | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/20d37ccf22922134ec1c2f64f2fb0e3026bb4889 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6af33100e5baf10a20ecf798249c3cc7fcebb4b6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bb03ab95a7a0d75476898156c07d42aabca86c88 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c997998ff77f6f89472e33a70b76f5ea895994b7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cbce2e7c527bfa19b79cdddf0bed60657dbd7fb7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fa633e10ef441f166495b7b8ba697a8779fcbe26 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c2d662312d6fbeeeb38ffd648d9b9c50c4f67630 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6370dd9c408b5ac0691bb3d52a7cdca210a97b82 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/60098d0755603b68ad8289734aa68f55f83ac43d | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a5696dc505b4b9483564d0778d8e5dd0ba26d3e1 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c9820ba35291727f103196a8029e67b7869aa5bf | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f6d6bbe8c91253c2899a41a8ae8d7b21141bf0e8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3fcf9c82aa71bb53417b4dfab6d6d40af12bfc64 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/57c44ab9ed0756c5b3f278acbd5d4113df19bcae | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/c952a81195ea654e3cce57a91969bb7720afe5b8 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/6b7c89302836414dc3f29dce26c686a44eaaccdd |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/1813d34f594b0bf3615543c430f242912532f69a |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/dd483228204f5274511c74f82b0afa80d60f3179 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0b644ff0c938f7284ca0fed912494d6975ab402f |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8a4078c5d6f2af9de3321de16a6fc00b6d1df65c |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/54881abd1d11bef0a8076ac795294b94e33cf458 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/259d335b765e9875e071af689a1858cf0ee900ff |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/6b4c276afc6f364fc4bda6ad8f7ade635d2d3fdd |     
    i686     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/8c970a4653ea6291f74d1436d8147e24d1e96225 | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/82f82e7c56fd95cf9ac7cf3c2e3361d0f6ae7b7b |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/981d91c907ec407f08cff4a4fb328342956610e4 |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/cfcdad27e9d67d8b0e44671c37937e1e8b771cd7 |     
  aarch64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/2d08231b3cc9bbed5b5e27a7694c9bfdb21f3232 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/34bc013e6c23f27fd6d68789ff3a4b9aa8c8383b |     
  riscv32    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e1529397425b23ce4f58bd17697ecf707ee7b6ed | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/22f3cff504c76b73055198dfd17849df9772fa6b | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/fbdef1c6b7562c680e21094c32c5bb0e7b416d5e | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/074fb665c2ea7d8dfd14db6d44ff8660ccc0c19f | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d05e834f0057000e13844cc172f01d1c42e66472 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/18ca4b76a84af92ee7a726a09daadd19cb58533e | ORPH
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/9820ec9b88fe72e1c0b55473feb4220965d2fcbf |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/39a3048a32e124fa0c5404cd4012e6210157d674 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/510f69e7983c58e973fc6c786e8c01ff9646535b |     
   x86_64    |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/0ee977fa138456835173592f1ae370cac44aa6d8 |     
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5be1619d23f859bb8cf2335386e30d87725d308d | ORPH
    hppa     |    host-uboot-tools-2026.04    | NOK | https://autobuild.buildroot.org/results/83f1061ed56417d22cf4ad2c65610b2dadc5e314 | ORPH
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/00c0b18543e31617872d634e956b5ff9e27d5368 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/c4ab7f91a800ceb60589076a0ffafa0d1e062634 | ORPH
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/5bdfa0ddba9a118a38e8a87bf1ea47a85729824b |     
   x86_64    |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/6f923ea5860c9515e5a137df3c8ba99293232b74 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7990cc7c753fdeecbd7489a0421f7149d5d7f0f4 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/432b30b7cc5fd47f5126932d510ff4fed98b1b3f |     
    i686     |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/0d43775520c477bb37bfec3936b47b521b1bbc72 |     
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/327e1b754c558807438edcd71183418238a4abd1 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/92e24b883708e39e911e4e99951878b4270392a9 |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/ac4059a9d0a1acc24ae92a99eb6640561a58e8e5 |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/8ba86bca59f376b32b1d20d1159515f0b3d4ac2a |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/642a0456a36f4cf053e1edc0cd8ab1b26784fec8 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/28fe165b6135cce1c0ad0ee6702d69b7bb58d21e |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/983dd23ca2b10b57b996d1d2acdabfc7564dcb31 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/ec3a9f26a4d04341fb871d2d6c5cec9786465ebf |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/23e0acb04d2880aebbea9a723885656b5c521294 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/dcde6b59f47820cc5e155d2400e3593fb9364a38 |     
    i686     |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/11e74d5d14fc250f374c6f665408dbc183c25e62 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/8b17302fff6866f0b78ebfd545f04bedd307c248 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/617dd424131dcabe91dfc969d439308edf685aa2 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/044a81e60ee7f78bae4330499a0ebb39d8dc7ed6 |     
  mips64el   |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/edbeea07903a29acc03125a13bc554416cfa2433 | ORPH
powerpc64le  |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/01fd3a25e0756a416dd0e5570e5cefb815e2686a | ORPH
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/5cc73fc24fa7a6d943b339e2854460a11d57d3c7 | ORPH
    arm      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/0ee4b19ab6526b4c2e21ac99521f2716805c911e | ORPH
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/dc6c7cf03bfd18f252dab0d5b656b8f901763527 | ORPH
   xtensa    |         libsepol-3.10          | NOK | https://autobuild.buildroot.org/results/b0fa78b5ad22380f1e48cf1b246b382a4b722aa3 |     
    i686     |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/7104a56ecde09add555667b95ab2f6d3baa68992 |     
    i686     |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/7c550c3e8ca387cefb7758128a813cc74fe7d303 |     
   x86_64    |  libtorrent-rasterbar-1.2.20   | NOK | https://autobuild.buildroot.org/results/4865671ba7746d5951b08063b1b2a605a0c54f1d |     
    i686     |  libtorrent-rasterbar-1.2.20   | NOK | https://autobuild.buildroot.org/results/a484055f41bdb2b02665c584b865e96a62978067 |     
    i686     |        libxmlrpc-r3335         | NOK | https://autobuild.buildroot.org/results/39ec2f7bf504e62b545e3e01bf362b57dda1e82a |     
    i686     |        lightning-2.2.3         | NOK | https://autobuild.buildroot.org/results/a835dca81c72e4a2188b23760db9b473112bed98 |     
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/c49694cc75fe6688115c9245b0f0f56062c6f4f2 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/ab65ef89dae46578428813696bd924f4030d6c4b | ORPH
    i686     |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/2dca663fde9ca13bd318aebf0b6881d1119351ec |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/f66e65d0dab3928fcc05fac66dc9964062fe084f |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/24febea7e3018743658936b5a5f21a0165ef5a8d |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/595be966b6507ab199afaff0c61db545dba8ef51 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/9e1b7686a10847bd10ba36bfa96c8f40771f6ce5 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/366db008bdb5c2ce6a23d75b72a52f1d3b929197 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/e891e3e478bdf616f1d0c62dba82294bce3bbb06 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/ef691d11cdf4508bbd10115dc21c69997450b7e3 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/c771424280eeaa8f4c55600e2e23005d7aef34db |     
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/4483f713d15b1856375090b266cc1d5e77d61a83 |     
    i686     |          luvi-v2.15.0          | NOK | https://autobuild.buildroot.org/results/d81fd6d675f372c985d759d3593615d73fb53626 | ORPH
    i686     |          ncftp-3.3.0           | NOK | https://autobuild.buildroot.org/results/76f731acdeb1db65758084d36154316e00db8da5 |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/18ee2797edbf9ad3aacd0fc17f4927f1858f7fbd |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9d13f8da4a15a82bdb8bc63d33dbd81b301dda60 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/033ab8ed80c2794ce0d0b28569110c283c7b143b |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/d2bcfc59b81e9cda6dc82cb7c572d46555cc1b26 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/54723f0605f2ef2ef0824752d9a4f0053b11bb74 | ORPH
    sh4      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/e5de1f72d9bcb5310caab108b61c2be40be62a36 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/ff54f35373da575f413f1da25142c18dbcb7b21f | ORPH
  mips64el   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/d0d5369bd0b22c5a171454aacd8a777f2f04f74e | ORPH
  riscv64    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/1a449badc5411b420721c8b562de7b4f3dd6dce9 | ORPH
    mips     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/31d26d9469c0d02c58b32085f37043e752b7dca4 |     
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/4999c722dbe8ca4ad8f6d668d1be09020c6a3746 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/44a8fd23b2ae355454e7ba4605124474e49204d6 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/21b643169739a2b3fe8cd8914b2ef640df97f9b6 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/68f5b4d5da5092c2ea82678f32b5069ab5d37d83 |     
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/e1dbe747c454be2a0e49bac8a0d408226c3de89e |     
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/aea08a99d978f4b5bf01bb69a4afe625aa7169eb |     
  mips64el   |          patch-2.7.6           | NOK | https://autobuild.buildroot.org/results/b0fb78b862a5106cfe5322c701761bb5d7f15c9e | ORPH
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/2352a7546a701256e9b31edfc018c1a101168bbc |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/963930e4326bc2488e8b62767b861e34fce4d51a |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7270ffd69e8ab3b4507468210ba98db6b414124b |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/d711fc6726b8a389a908b80a8d516ee4ae6d2bb0 |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/1bb86e7ca41bc4ea58c8ec53c477d27609ee14b2 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4cbf76d29600df14d65411036df089e2d2b8e16e |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/d9f0ee4e97fb704605d72a08ae255b7ad5ac8779 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/da63f2a7170894097602b13d64089ec45062443a |     
    i586     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8c85864ef43e5d7faba633d132c478123e3f3ad5 |     
    i586     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/1af4e2716afbf4a33635265177f4a1af29257b9e |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f54c5af42c5a70eaf8c92531a80ad43c6082df93 |     
    i686     |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/1367b99110b6dac605dfb93107b7b7eead9021af | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6390d170c0f859cdb8abde037e98f12d644d73ee | ORPH
    i686     |    python-autobahn-25.12.2     | NOK | https://autobuild.buildroot.org/results/f3d77cc76bd6563d644a9cef970f294bf1a54ecb |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/4504262b4652346a93e20080d7f905eb0d95bccd |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/6528bcec26abdf3685237c8751111db5065705c1 |     
    i686     |        qt5opcua-5.15.2         | NOK | https://autobuild.buildroot.org/results/1f06b1efdde65fcd99ff79a63ed01b749788dec8 |     
    i686     | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/569c6d8515791b6eae2ba01d635cfaeefbe37dc0 |     
   mips64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/550a998ad31adbae89771223416b7b91e4d28acd | ORPH
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/a7f02f6e36cae6c75f97adc8b5723f69d6141ae5 |     
    arm      |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/ee6f1dae574903ace5a6797a65bcf11dc4d31bf4 |     
    i686     |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/7c2a8fcf20061ce0450032b4cb5d6c695d64e8c2 |     
powerpc64le  |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/816663ae3c0de3d627e94a13809763e3b84ccb67 |     
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/136d1afc2ecacea6a4e12b915073e3eaf5c8ca01 |     
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/2d92e6262f763c9317f326b130e182154fae2635 |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/bf7b5efd4ed03c59714fee922aa0e4ae5471dd4b |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/de23b566049704e7da0b3dae7aebf9b116e646bb |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/fb5c8ff54c89452b9fe37e90cd8ce776581f73f4 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/27761ab3b75d68c0e858368e962b3a48a00644e2 |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/05ecec45f4412756081b765234768fd558583227 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/3c1dbba06744fcc577f8c9d54f4b497d1aa1484a |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/5ddcd87b8c4fdb9f23d84432b1c7ca8928f718a7 |     
    i686     |            tar-1.35            | NOK | https://autobuild.buildroot.org/results/4b6dbbea5543cd16783ac2ecca95167bc550a312 | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/5d7a38d91ba4828d2fe324f9a442c3437cd4e986 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/1af7c3a35660c9a7cec77a3a4c153adbf6e16c69 | ORPH
    hppa     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e73f7b364fdcadc80fcab01bacfbbc3cf6279706 | ORPH
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/652c6cd93f9297dcec36c960061720041f1facb0 | ORPH
   sh4aeb    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/cbb3edc3503affec29ce006b2b9b15d0826bf289 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/56e49372e6012389ebcdae0667b2da96bbf75900 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/6fb99e25b76061382bf71eaf2649223285c5b663 | ORPH
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b1f6fe0fd605ab29bb95ba88784fe32a04cc3611 | ORPH
  aarch64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/141256581bd3d0973d73e9cc38dd7da045c1d3da | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/27c1ed55a220c13c167ce3e67d503207bc5837d3 | ORPH
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/3b582788fe7c1fef5c005432ec75bad8d234d1ff |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ece313fa8609b5ad7cfa0627b0695d68e3ef5e40 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2b9bd6d8a58e133627ef3ee06e61cbcb4ca72b6b |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0d1fda9d7dab22adb2309eb3c02382b0518bde2e |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4aec5e0c8cf7bc1e7fcc1d721bb1da665b98bf35 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/9e504c3698bceee693a823008b4a32e68cec7740 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a27b8251762e9740295f16ab008bd1e1418f8820 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/89af02818a0eb04ee9fa89bebd90ce9ffaf80f99 |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/89da3e0bca7191622e015c6f7918950743b90250 |     
    arm      |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/69951549031324139f953e16389162835c3bf9e3 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/80c5b2126128983b0f39eb77b1b164a7e96c32eb | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/cccd3d7aa58b60488c2244623ed91eea82c6fe39 | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/c5db538f77ff4b1a668b14c2af7295398a598c00 | ORPH
    i686     |         wf111-5-2-2-r3         | NOK | https://autobuild.buildroot.org/results/c8c9e5f9666e59d7467de277e9c6d3157258df84 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/a646ea1d93c5cd6a36e349d1d05e349ab7cfba3e |     
    i686     |            x265-4.1            | NOK | https://autobuild.buildroot.org/results/579a8e65534a622852e952a5314d29e359b0cbd3 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/06cd56e1629100b4259cda5c63370f9534a20a56 |     
    i686     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/827b2c68211a135069c45d69028d7a93fb7b64de |     
powerpc64le  |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/0bac610aa23e97b2ea88cc347cea011de940a1d5 |     
powerpc64le  |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/a33ae58f02a4dd5363457638ad25c2e097bba388 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

  gobject-introspection-1.84.0 | 2 
                  linux-7.0.11 | 2 
      libabseil-cpp-20260107.1 | 1 
libfutils-c326ce0cc2a735438... | 1 
                  ntp-4.2.8p18 | 1 
               tcpreplay-4.5.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c3d5b18d82db90fa683b7b092bb0ec3d2225ba4b | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2c743a654d4c8d180e0ac84ad2c2f5639dcdb14b | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/12c6d279b12aae14a3f5cc90a8d2fbcf1565a862 |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/4b2f2801f2444c2984f718dad20c65f6197ff584 |     
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/29f16911c6eb5d9504673f4a67647fd1a76fdd24 | ORPH
    i586     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/108210eaa5b1e189836140c670fcf965fa3f0c1b | ORPH
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7c558d02b21e413943dd1ad613154a8882f5f906 |     
  mips64el   |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/d6dd2b920d20afb28d5ff3992c7f09e5d6daaae7 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

             cni-plugins-1.7.1 | 1 
docker-credential-acr-env-0... | 1 
  gobject-introspection-1.84.0 | 1 
                  iozone-3.508 | 1 
              openjdk-21.0.4+7 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/2afafc71ee8238b4507bd06007ebb79fa20a7cf0 |     
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/5463cd3f91bfd1324172fa3b66fcc1fbf84e664f | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/989183e17114fabd4174d901ac55c3ee47d3d18e | ORPH
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f5b4fbce0ed636a36ee1828753b49f7a34f1a263 |     
    i686     |        openjdk-21.0.4+7        | NOK | https://autobuild.buildroot.org/results/87e2e66de957eb526497bb4294d7ac84b3c67925 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
 host-softether-4.30-9700-beta | 2 
package/wine/wine.mk:347: w... | 2 
                       unknown | 2 
                   crun-1.18.2 | 1 
                flannel-0.26.0 | 1 
                freerdp-2.11.8 | 1 
                 fwts-25.03.00 | 1 
  gobject-introspection-1.82.0 | 1 
               gocryptfs-2.3.2 | 1 
              host-rust-1.82.0 | 1 
           libfreeimage-3.18.0 | 1 
             libtorrent-0.13.8 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
                 mesa3d-24.0.9 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.4 | 1 
rtl8822cs-40450f759c8a930d2... | 1 
                     shim-16.0 | 1 
                tpm2-tss-3.2.3 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/14668f433be2fae95ad775fad7830a2ba32376de |     
powerpc64le  |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/bc072426b9639c58d27920692f12af597651d5e5 |     
    i686     |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/b8631afc3a7da88f54aab471c43f2d88eb8d3c97 | ORPH
    arm      |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/cb3488a2b17176b249753b3ff51850fe9322a5cb | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c37d53c2351b7401e920e1e1d7d11c95c65efc7b | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/16644267a1f809ff5fa0e4060e83ded26d61073b |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/facbfccec0961597806625ed8424f7212dfa54a1 |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/d19f635e7a2baee696eff4907a0d97bbea2f4654 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d97f7607520f372f07f163f2b251ea36fdb8173c |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/6be8f550e619f7b455099f35d553baa21633c476 |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/93b9fda5ca519d8b998d99f1b5f8dec1b26f0986 |     
    i686     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/7f1d3771623ae1dd85fc7f7e787c42027e340064 |     
  mips64el   |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/9cf7cc0e81a39b28df0f2787ae678802274f9ed9 | ORPH
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/b888fec2e4b09a80be983d42948ec3e6f287b51a |     
    i586     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/2d22adef78f61940fc1f848f063da2c5a82a2656 |     
    arm      |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/53c305658339d3d53e6b8c998de10fd00deb237b |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/82c03c967310ee865a6582a735a3f1f26cf07536 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/4631a7e9a33e0ed3b481e5571ceffe92d03d8c19 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/50c04b8ceb4d57a24e477bbd31c7b70c525d85c1 |     
powerpc64le  |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/d0e6127b0235f08f9b39a3813f222c7c6f991cb9 |     
    i586     | rtl8822cs-40450f759c8a930d2... | NOK | https://autobuild.buildroot.org/results/839cf3b04c191891c0ae4de22f8884f15031a01c |     
    i686     |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/b5e458b6d76b0abd2d605a39c499ef34ceffd34a |     
    i686     |         tpm2-tss-3.2.3         | NOK | https://autobuild.buildroot.org/results/27f6aa565b3247bfd69c96ea048d934a7c3b9f47 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5bce61c40a732b154038c9f0164f662254593c4e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/56e177914d0a877069ebcbca10a5925cb1b47d19 |     
   x86_64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/93d122f29f5a0d89bb1ac457d167fb44a7324a7c | ORPH


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                  aardvark-dns |  DISTRO  | https://release-monitoring.org/project/242641 | v1.17.1      | 2.0.0        | ORPH
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.6        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/000018 | 20251212     | 20260408     | ORPH
                      adsp-ldr |  DISTRO  | https://release-monitoring.org/project/388235 | 1.0.1        | 1.0.2        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 50.0         |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2026.1       | ORPH
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/000038 | 1.2.16       | 1.2.16.1     |     
  amazon-ecr-credential-helper |  DISTRO  | https://release-monitoring.org/project/359761 | v0.10.1      | 0.12.0       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/226905 | 4.2.2+git... | 35.0.2       |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 13.0         | 14.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 5.0.1        |     
                      argparse |  DISTRO  | https://release-monitoring.org/project/007317 | 0.7.1-1      | 0.7.2        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                        assimp |  DISTRO  | https://release-monitoring.org/project/006988 | 6.0.2        | 6.0.5        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.9.0       | 23.4.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.58.2       | 2.60.4       |     
                         atftp |  DISTRO  | https://release-monitoring.org/project/015219 | 0.8.0        | 0.8.1        |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.3       | 2.36.4       |     
                     atkmm2_28 |  DISTRO  | https://release-monitoring.org/project/373360 | 2.28.4       | 2.28.5       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.5        | 4.1.4        | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.18.1       | ORPH
                  b43-fwcutter |  DISTRO  | https://release-monitoring.org/project/000152 | 019          | 020          |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.37       | 5.3          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.17.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2026.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2025.4       | 2026.1       |     
                   bats-assert |  DISTRO  | https://release-monitoring.org/project/372274 | 2.2.0        | 2.2.4        |     
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.15      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.49      | 9.20.23      |     
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.45.1       | 2.46.1       |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.3.1        |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.8.3        | 1.8.5        |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.86         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.86         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 8.2.11       | 8.2.13       |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.91.0-1     |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.12.0       | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.5.0       | 7.7.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.24.2       | 0.26.1       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.8          | 6.9.1        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 7.0          | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/006428 | 0.8.0        | 0.13.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.14       | 0.6.5        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/021328 | 2.4.3        | 2.5.0        |     
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/009026 | 20260223     | 20260601     |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.1       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.5       | 1.14.6       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 2.0.0        | 2.0.1        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.311        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.4.0        |     
                        catch2 |  DISTRO  | https://release-monitoring.org/project/007680 | 3.15.0       | 3.15.1       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.8.2        | ORPH
                        cdrkit |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/000287 | 7.4          | 7.5          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.6.1        | 2.6.2        |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.8.1     | 2026.6.0     |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.5        | 2.0.13       |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.20.1     | 4.3.20.2     |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.1       | ORPH
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.10.1       |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.2.1        |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.8        | 1.4.9        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.7        | 2.3.1        |     
       containers-image-config |  DISTRO  | https://release-monitoring.org/project/378977 | v5.35.0      | 5.36.2       | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.10         | 9.11         | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.43.1       | 0.47.0       |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/021408 | 2.1          | 2.2          |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.24         | 1.28         |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 3.5.0        | 5.1.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.25       | 3.0.27       |     
                        davici |  DISTRO  | https://release-monitoring.org/project/021340 | 1.4          | 1.6          | ORPH
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.5.2        | 2.6.2        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.26.3       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/011429 | 10.2.4       | 10.3.2       |     
                      dhcpdump |  DISTRO  | https://release-monitoring.org/project/021415 | 1.9          | 1.10         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20251001 | 1.3-20260107 | ORPH
                     ding-libs |  DISTRO  | https://release-monitoring.org/project/013710 | 0.6.2        | 0.7.0        |     
         distribution-registry |  DISTRO  | https://release-monitoring.org/project/378976 | v3.0.0       | 3.1.1        | ORPH
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0.1       |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 28.3.3       | 29.5.3       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.25.0       | 0.34.1       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.38.2       | 5.1.4        |     
         docker-credential-gcr |  DISTRO  | https://release-monitoring.org/project/377457 | v2.1.30      | 2.1.32       | ORPH
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 28.3.3       | 29.5.3       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2026.2       |     
                      dos2unix |  DISTRO  | https://release-monitoring.org/project/000453 | 7.5.5        | 7.5.6        |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/007454 | 3.3.1        | 3.4.0        |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.4        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.3        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/000457 | 1.16.1       | 1.17.0       | ORPH
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 25.11        | 26.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 110          | 111          |     
                      drm-info |  DISTRO  | https://release-monitoring.org/project/299264 | 2.9.0        | 2.10.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/016911 | 1.7.2        | 1.8.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 10.2         | 11.0         |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.2.3        | 1.2.4        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.9.0        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.6        |     
                      easydbus |  DISTRO  | https://release-monitoring.org/project/115313 | 0.1.0        | 0.2.1        |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/000666 | 3.4.0        | 5.0.1        | ORPH
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 26.04        |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.16       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.2.5.15    | 29.0.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.27       |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/009323 | 1.1.3        | 2.0.1        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/016913 | 1.11.10      | 1.11.12      |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.31       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.34       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.9.6        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.60       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.34       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.26       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.29       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.23       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.16       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.10       | 1.9.1        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 4.0.1        | 4.4.0        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.9.9.1      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.9        | 1.4.1        |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.23.3       | 0.23.4       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.2       | 1.38.1       | ORPH
                        fbterm |  DISTRO  | https://release-monitoring.org/project/008331 | 1.7.0        | 1.8          | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.3.2        | 3.3.3        | ORPH
                            fd |  DISTRO  | https://release-monitoring.org/project/373722 | 10.3.0       | 10.4.2       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/000790 | 3.11.2       | 3.12.2       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 6.1.5        | 8.1.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                          ficl |  DISTRO  | https://release-monitoring.org/project/021430 | 3.065        | 3065         |     
                          file |  DISTRO  | https://release-monitoring.org/project/000807 | 5.47         | 5.48         | ORPH
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.4.2        | ORPH
                  firmware-imx |  GUESS   | https://release-monitoring.org/project/390526 | 8.27         | 8.31         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.28.5       |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/021434 | 1.14         | 1.15         |     
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.5        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 4.2.0        | 5.0.7        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.7        | 2.5.5        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/011526 | 12.1.0       | 12.2.0       |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.17.1       | 2.18.1       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.26.0       | 1.27.0       | ORPH
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.4          | 5.5          |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/000853 | 3.2.8        | 3.2.10       |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/010442 | 2.11.8       | 3.26.0       | ORPH
                           frr |  DISTRO  | https://release-monitoring.org/project/018555 | 10.5.4       | 10.6.1       |     
                         ftxui |  DISTRO  | https://release-monitoring.org/project/373193 | 6.1.9        | 7.0.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.17         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.16.0       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.1.5        |     
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.11.4       | 3.13.1       |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.12      | 2.44.6       | ORPH
                     genext2fs |  DISTRO  | https://release-monitoring.org/project/021440 | 1.5.0        | 1.6.2        |     
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 3.0.2        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 1.0          | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/008735 | 2.2.2        | 2.3.0        |     
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/001157 | 10.07.0      | 10.07.1      |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/017093 | 0.7.0        | 0.8.0        | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 19.0.1       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.88.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.1        | 1.0.3        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.3          | 0.3.1        |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/001223 | 1.84.0       | 1.86.0       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.6.1        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.8.1        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.46       | 1.3.47       |     
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.14.3       | 0.16.0       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.80.0       | 1.81.1       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 50.1         |     
                         gssdp |  DISTRO  | https://release-monitoring.org/project/001262 | 1.6.4        | 1.6.5        |     
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.13      | 1.29.1       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/021847 | v1.1.8       | 1.1.10       | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.13      | 1.28.4       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.13      | 1.28.4       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.13      | 1.28.4       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.13      | 1.28.4       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.13      | 1.29.1       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.13      | 1.28.4       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.13      | 1.28.4       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.9.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.13      | 1.26.11      | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.2       | 0.16.0       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.13      | 1.28.4       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.13      | 1.28.4       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.10      | 3.24.11      |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 5.18.0       | 5.20.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.11       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.9        | 1.6.10       |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.4       | 0.14.5       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.57.2       | 1.60.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.27       | 3.4.0        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/011695 | 1.9.21       | 1.9.22       |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.3.0        | 1.4.0        |     
                       hiredis |  DISTRO  | https://release-monitoring.org/project/001318 | 1.3.0        | 1.4.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.26.4       | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 2.0.1        | 2.0.2        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/005387 | 0.406        | 0.408        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.12.2       | 2.14.0       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.59.0       | 2.60.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 78.2         | 78.3         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                  igh-ethercat |  DISTRO  | https://release-monitoring.org/project/021674 | 1.6.8        | 1.6.9        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.2-23     | 7.1.2-25     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.12.5       | 1.12.6       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.25.9.0     | ORPH
              intel-vpl-gpu-rt |  DISTRO  | https://release-monitoring.org/project/372126 | 26.2.1       | 26.2.2       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.508        | 3.510        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.2        | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/001394 | 1.8.11       | 1.8.13       | ORPH
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.3        | 3.7.0        | ORPH
                           joe |  DISTRO  | https://release-monitoring.org/project/001467 | 4.6          | 4.8          | ORPH
                          jose |  DISTRO  | https://release-monitoring.org/project/011761 | 14           | 15           |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.9.0        | 2.10.0       | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.4        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.27.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.27.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.27.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.27.0       |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.6        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.2        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/021863 | 3.91         | 3.98         | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20260107.1   | 20260526.0   |     
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 5.0.1        |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.6.2        | 1.7.0        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        | ORPH
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 1.0.0        | 1.1.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/006308 | 1.18.0       | 1.18.2       | ORPH
                      libecoli |  DISTRO  | https://release-monitoring.org/project/375859 | 0.10.1       | 0.11.7       |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.5       | 1.13.6       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                       libglew |  DISTRO  | https://release-monitoring.org/project/007878 | 2.2.0        | 2.3.1        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.86.5       | 2.88.1       |     
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.24.3       | 2.1.0        | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.2.4        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 2.2.2        | 2.2.3        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/012587 | 1.0.23       | 1.0.24       | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.51      | 3.24.52      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.21.0       | 4.22.4       | ORPH
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.51       | 0.5.53       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/001637 | 3.0.20       | 4.0.3        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.3       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.3        | 0.2.6        |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/001649 | 1.7.0        | 1.8.0        | ORPH
                       libldns |  DISTRO  | https://release-monitoring.org/project/014817 | 1.9.0        | 1.9.2        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.49         | 250          |     
                    liblogging |  DISTRO  | https://release-monitoring.org/project/001654 | 1.0.6        | 1.0.8        | ORPH
                        libmad |  DISTRO  | https://release-monitoring.org/project/021487 | 0.15.1b      | 0.16.4       | ORPH
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.13.3       |     
                         libmd |  DISTRO  | https://release-monitoring.org/project/015525 | 1.1.0        | 1.2.0        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.13.6       | 0.14.2       |     
                libmodsecurity |  DISTRO  | https://release-monitoring.org/project/068638 | 3.0.15       | 4.0.0.0      |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.11alpha    | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 3.7.10       | 4.2.14       |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.1        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.3.0        | 1.3.1        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.23       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 6.2.3        | 6.3.0        |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/007953 | 4.38.2       | 4.39         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/002503 | 3.124        | 3.125        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.7        |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/002566 | 3.6.3        | 4.0.1        | ORPH
                     libosmium |  DISTRO  | https://release-monitoring.org/project/007023 | 2.22.0       | 2.23.1       |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2026.1       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.2.1        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.10.7       | 8.0.1        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                         libqb |  DISTRO  | https://release-monitoring.org/project/009399 | 2.0.8        | 2.0.10       |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/007307 | 1.36.0       | 1.38.0       |     
                  libqrtr-glib |  DISTRO  | https://release-monitoring.org/project/192056 | 1.2.2        | 1.4.0        |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/001709 | 0.21.4       | 0.22.1       |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/001713 | 1.11.0       | 1.12.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.3.2        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.62.3       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.7        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.8.1        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.1       | 2.12.2       |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.35       | 0.7.39       |     
                      libsoup3 |  DISTRO  | https://release-monitoring.org/project/011483 | 3.6.6        | 3.7.1        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/018547 | 2.7.0        | 2.8.0        |     
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.15.3       | 0.16.14      | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.20       | 2.0.13       |     
                 libtraceevent |  DISTRO  | https://release-monitoring.org/project/288159 | 1.8.7        | 1.9.0        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.4        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.3.3        | 1.5.1        |     
                  libudev-zero |  GUESS   | https://release-monitoring.org/project/145201 | 1.0.3        | 1.0.4        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.25      | 1.18.5       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 1.0.3        | 1.0.4        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.15.5       | 0.15.6       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.12         | 2.14         |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/001750 | 0.1.8        | 0.1.9        |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.18.0       | 8.18.3       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 12.4.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.16.0       | 2023.4.0     |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.9.2        | 1.13.2       |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/003531 | 2.47         | 2.59         |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.6.1        | ORPH
                    libxmlsec1 |  DISTRO  | https://release-monitoring.org/project/005200 | 1.3.9        | 1.3.11       |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 3.13.6       | 5.4.9        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.9.0        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.9.0        |     
                      lighttpd |  DISTRO  | https://release-monitoring.org/project/001817 | 1.4.82       | 1.4.83       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.28.0       |     
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.8.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2025.10.13   | 2026.06.12   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.20       | 1.0.22       | ORPH
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cpp |  DISTRO  | https://release-monitoring.org/project/021499 | 1.1.4        | 1.1.6        |     
                          lpac |  DISTRO  | https://release-monitoring.org/project/371628 | 2.2.1        | 2.3.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/001842 | 0.651        | 0.660        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.14.0       | 2.15.1       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.14.3       | 2.15.1       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.14.0       | 2.15.1       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.5.0        |     
                  lua-argparse |  GUESS   | https://release-monitoring.org/project/007317 | 0.7.1-1      | 0.7.2        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                      lua-zlib |  GUESS   | https://release-monitoring.org/project/380938 | 1.3-0        | 1.4          |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/001856 | 3.12.2       | 3.13.0       |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.2        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.51.0-1     | 1.52.1-0     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.41      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 6.0.6        | 7.0.0        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/001863 | 2.9.2        | 2.9.3        |     
                          lzip |  DISTRO  | https://release-monitoring.org/project/001866 | 1.25         | 1.26         | ORPH
                         lzlib |  DISTRO  | https://release-monitoring.org/project/021513 | 0.4.1.53-4   | 0.4.3        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/145824 | 9.22         | 26.01        | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.8        | 1.7.9        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.17     | 13.0.1       | ORPH
              matchbox-desktop |  DISTRO  | https://release-monitoring.org/project/235369 | 0.9.1        | 2.0          | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.30       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/001953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 3.6.6        | 4.1.0        |     
                        mbpoll |  DISTRO  | https://release-monitoring.org/project/368619 | 1.5.2        | 1.5.4        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20260511     |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.8.2      |     
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/001966 | 8.00         | 8.10         |     
               mender-artifact |  DISTRO  | https://release-monitoring.org/project/020630 | 4.2.0        | 4.4.0        |     
                    menu-cache |  DISTRO  | https://release-monitoring.org/project/001968 | 1.1.0        | 1.1.1        | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2026.04.1    |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.16.1       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.2.1        |     
                  minizip-zlib |  DISTRO  | https://release-monitoring.org/project/005303 | 1.3.1        | 1.3.2        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2026.05.1    |     
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.30.0       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.12       | 4.0.0.0      |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 4.0.0        | 4.0.1        |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/012413 | 1.33.5       | 1.33.6       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.40.0       | 0.41.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 7.0.0        | 8.0.0        |     
                     msgpack-c |  DISTRO  | https://release-monitoring.org/project/235285 | 6.1.0        | 7.0.1        | ORPH
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.48       | 4.0.49       | ORPH
                           mtr |  DISTRO  | https://release-monitoring.org/project/002029 | 0.95         | 0.96         | ORPH
                      multicat |  DISTRO  | https://release-monitoring.org/project/021734 | 2.3          | 2.4          | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.14.3       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.27.2       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.3.2        | 2.3.3        |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.45         | 1.46         |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/002048 | 2.16.03      | 3.01         | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.26.1       | 3.27.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.9.2        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.6-20251231 | 6.6-20260613 | ORPH
                         ndctl |  DISTRO  | https://release-monitoring.org/project/010381 | 83           | 84           |     
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                         neard |  DISTRO  | https://release-monitoring.org/project/021866 | 0.19         | 0.20         |     
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.3.1        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 4.4.3        | 4.5.0        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.17.1      | 2.0.0        | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/021534 | 1.234        | 1.238        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.37.1       | 2.10.3       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.14       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.4.5        | 2.8.2        |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/002073 | 3.10.2       | 4.0          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/021197 | 1.56.0       | 1.56.1       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/069977 | 1.12.0       | 1.12.5       |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.6        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.6        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.68.1       | 1.69.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.30.2       | 1.31.1       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                           nnn |  DISTRO  | https://release-monitoring.org/project/017080 | 5.1          | 5.2          |     
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.22.0      | 26.3.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.22.0      | 26.3.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.3.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                         nqptp |  DISTRO  | https://release-monitoring.org/project/293307 | 1.2.4        | 1.2.8        |     
                       ntfs-3g |  DISTRO  | https://release-monitoring.org/project/002504 | 2022.10.3    | 2026.2.25    | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.108.0      | 0.113.1      | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 610.43.02    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 580.95.05    | 610.43.02    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 2.15         | 3.0-a.5      | ORPH
                        octave |  DISTRO  | https://release-monitoring.org/project/002528 | 11.1.0       | 11.3.0       |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.18         | 2.19         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v14.4.1      | 14.5.2       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.4        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.5.4        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.24.3       | 1.25.2       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2025.07.22   | 2026.05.29   |     
                opencl-headers |  DISTRO  | https://release-monitoring.org/project/223257 | 2025.07.22   | 2026.05.29   |     
             opencl-icd-loader |  DISTRO  | https://release-monitoring.org/project/378666 | 2025.07.22   | 2026.05.29   |     
                   openconnect |  DISTRO  | https://release-monitoring.org/project/015179 | 9.12         | 9.20         |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.8.1        | 1.8.2        |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.13.0       | 5.0.0        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.8        | 5.0.10       |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.63.2       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.17.4       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 13.1.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.9.0        | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.41       | 0.4.42       | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/002575 | 2.2.0        | 2.3.0        |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.6.0        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.28         | 1.31         |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                        parsec |  DISTRO  | https://release-monitoring.org/project/183223 | 1.4.1        | 1.5.0        |     
                        parted |  DISTRO  | https://release-monitoring.org/project/002596 | 3.6          | 3.7          |     
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.10       | ORPH
                       pcmanfm |  DISTRO  | https://release-monitoring.org/project/002607 | 1.3.2        | 1.4.0        |     
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.5.1        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                    perl-clone |  DISTRO  | https://release-monitoring.org/project/005875 | 0.47         | 0.50         |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.07         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.23         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.41         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.98         | 6.99         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.013        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.648        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/002835 | 0.85         | 0.87         |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.86         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/002967 | 3.83         | 3.85         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/002975 | 6.16         | 6.17         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/002977 | 7.01         | 7.02         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.59        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.097        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.81         | 6.83         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/003050 | 6.14         | 6.15         |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/011809 | 5.515        | 5.517        |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.052        | 0.053        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.42         | 9.46         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.53         | 1.55         |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/006578 | 1.0051       | 1.0054       |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/010665 | 2.002004     | 2.002005     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                 perl-sys-mmap |  DISTRO  | https://release-monitoring.org/project/005675 | 0.20         | 0.21         |     
           perl-time-parsedate |  DISTRO  | https://release-monitoring.org/project/003469 | 2015.103     | 2026.0219    |     
                 perl-timedate |  DISTRO  | https://release-monitoring.org/project/003463 | 2.33         | 2.35         |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/003485 | 5.34         | 5.35         |     
           perl-www-robotrules |  DISTRO  | https://release-monitoring.org/project/003506 | 6.02         | 6.03         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0213       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.27       | 5.1.28       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.5.0        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.5.0        | 3.5.3        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.5.1        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.14.2       | 1.15.3       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.7.0       | 5.8.3        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 126          | 127          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 25.10.0      | 26.06.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.6.2        | 3.6.4        |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.17         | 4.23         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.13       | 1.3.14       | ORPH
                          pppd |  DISTRO  | https://release-monitoring.org/project/003703 | 2.5.2        | 2.5.3        |     
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.10      | 0.14.11      |     
                       proftpd |  DISTRO  | https://release-monitoring.org/project/007609 | 1.3.9a       | 1.3.9b       | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/009463 | 9.8.0        | 9.8.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.6       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 34.1         | 35.1         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.15         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.10.5       | 1.11.0       |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/021245 | 4.0.0        | 4.0.4        |     
       python-aiohappyeyeballs |  DISTRO  | https://release-monitoring.org/project/373934 | 2.6.1        | 2.6.2        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/006713 | 3.13.5       | 3.14.1       |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.17.2       | 1.18.4       |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.22.0       | 2.23.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.17.0       | 2.18.0       |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/003779 | 4.14.3       | 4.15.0       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/026271 | 3.0.1        | 3.0.2        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.43.1       | 1.43.29      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.43.1       | 1.43.29      |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 6.2.4        | 7.1.4        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/064102 | 5.9.0        | 6.1.2        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2026.4.22    | 2026.5.20    |     
                python-chardet |  DISTRO  | https://release-monitoring.org/project/003798 | 5.2.0        | 7.4.3        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.5        | 3.4.7        |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/003802 | 8.3.3        | 8.4.1        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.3        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 48.0.0       | 49.0.0       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.1.3        | 3.2.5        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/021939 | 4.2.1        | 4.2.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/021697 | 1.1.0        | 1.1.1        |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 5.0.14       | 5.0.22       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.2.1        | 5.3.1        |     
                python-distlib |  DISTRO  | https://release-monitoring.org/project/034504 | 0.4.0        | 0.4.3        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/003849 | 0.22.4       | 0.23         |     
                 python-dotenv |  DISTRO  | https://release-monitoring.org/project/019788 | 1.2.1        | 1.2.2        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.1       | 0.19.2       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.13.0       | 4.13.2       |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 5.1.0        | 5.3.0        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/047977 | 0.136.3      | 0.137.0      |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/011739 | 3.29.0       | 3.29.4       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 6.0.2        | 6.0.5        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 25.9.23      | 25.12.19     |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.62.1       | 4.63.0       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/006459 | 3.1.46       | 3.1.50       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 16.1.0       | 16.3.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.54.5       | 3.56.3       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/025386 | 2.30.3       | 2.31.0       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.49.1       | 2.54.0       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.74.0       | 1.75.0       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/006870 | 3.5.0        | 3.5.1        |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.76.0       | 1.81.1       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.76.0       | 1.81.1       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/003882 | 23.0.0       | 26.0.0       |     
              python-hatchling |  DISTRO  | https://release-monitoring.org/project/185085 | 1.29.0       | 1.30.1       |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/012002 | 3.3.1        | 3.4.0        |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.3-1      |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/005487 | 3.11         | 3.18         |     
              python-installer |  DISTRO  | https://release-monitoring.org/project/197662 | 1.0.0        | 1.0.1        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 9.8.0        | 9.14.1       |     
            python-iterable-io |  DISTRO  | https://release-monitoring.org/project/374467 | 1.0.1        | 1.0.4        |     
         python-jaraco-context |  DISTRO  | https://release-monitoring.org/project/062309 | 6.0.2        | 6.1.2        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/020165 | 4.4.0        | 4.5.0        |     
            python-jaraco-text |  DISTRO  | https://release-monitoring.org/project/023436 | 4.0.0        | 4.2.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/003893 | 0.19.2       | 0.20.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/016910 | 1.4.9        | 1.5.0        |     
                  python-librt |  DISTRO  | https://release-monitoring.org/project/388232 | 0.9.0        | 0.11.0       |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.3.1        | 3.4.0        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/015512 | 2.2.0        | 2.2.1        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 6.0.2        | 6.1.1        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.23.0       | 0.24.0       |     
python-magic-wormhole-mailb... |  DISTRO  | https://release-monitoring.org/project/019823 | 0.6.0        | 0.8.0        |     
         python-markdown-it-py |  DISTRO  | https://release-monitoring.org/project/088959 | 4.0.0        | 4.2.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.9       | 3.11.0       |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.2.1        | 0.2.2        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/042653 | 1.11.2       | 1.14.0       |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/021702 | 1.1.4        | 1.1.5        |     
        python-mdit-py-plugins |  DISTRO  | https://release-monitoring.org/project/149444 | 0.5.0        | 0.6.1        |     
                 python-memray |  DISTRO  | https://release-monitoring.org/project/267110 | 1.19.1       | 1.19.3       |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.19.0       | 0.20.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.2.0        | 3.2.1        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 11.0.2       | 11.1.0       |     
                   python-mpd2 |  DISTRO  | https://release-monitoring.org/project/019721 | 3.1.1        | 3.1.2        |     
                 python-mpmath |  DISTRO  | https://release-monitoring.org/project/003930 | 1.3.0        | 1.4.1        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/021831 | 1.1.2        | 1.2.0        |     
              python-multipart |  DISTRO  | https://release-monitoring.org/project/018463 | 0.0.22       | 0.0.32       |     
                   python-mypy |  DISTRO  | https://release-monitoring.org/project/008453 | 1.19.1       | 2.1.0        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 2.4.0        | 2.4.6        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 2.0a0        |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.11.5       | 3.11.9       |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 4.0.0        | 5.0.0+rtd1   |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/016689 | 0.8.6        | 0.8.7        |     
            python-pdm-backend |  DISTRO  | https://release-monitoring.org/project/306904 | 2.4.8        | 2.4.9        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 12.0.0       | 12.2.0       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 26.1         | 26.1.2       |     
           python-platformdirs |  DISTRO  | https://release-monitoring.org/project/200932 | 4.9.6        | 4.10.0       |     
            python-poetry-core |  DISTRO  | https://release-monitoring.org/project/071155 | 2.3.2        | 2.4.1        |     
              python-propcache |  DISTRO  | https://release-monitoring.org/project/375192 | 0.4.1        | 0.5.2        |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.27.2       | 1.28.0       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 34.1         | 35.1         |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/003979 | 2.9.11       | 2.9.12       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/013384 | 3.0.1        | 3.0.4        |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.11       | 0.8.1        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20260313.1   | 20260818.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/039654 | 2.13.3       | 2.13.4       |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.46.3       | 2.47.0       |     
      python-pydantic-settings |  DISTRO  | https://release-monitoring.org/project/342182 | 2.14.0       | 2.14.1       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/016219 | 0.32         | 0.33         |     
                  python-pyjwt |  DISTRO  | https://release-monitoring.org/project/005653 | 2.12.1       | 2.13.0       |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/021583 | 0.23.0       | 0.24.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/015600 | 3.13.0       | 3.13.1       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.27.2.3     |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/007284 | 1.1.2        | 1.2.0        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/005535 | 26.1.0       | 26.3.0       |     
             python-pypa-build |  DISTRO  | https://release-monitoring.org/project/132276 | 1.3.0        | 1.5.0        |     
                  python-pypng |  DISTRO  | https://release-monitoring.org/project/006706 | 0.20220715.0 | 0.20250521.0 |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.13       | 1.2.14       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.6.2        | 2.0.0        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.22       | 7.1.27       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/003765 | 9.0.3        | 9.1.0        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 1.3.0        | 1.4.0        |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2026.1.post1 | 2026.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 27.1.0       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/003992 | 7.4.0        | 8.0.0        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/005548 | 2026.4.4     | 2026.5.9     |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/004004 | 2.33.1       | 2.34.2       |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.30.0       | 2026.5.1     |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.13.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.4        |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/066067 | 0.19.0       | 0.19.1       |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/010428 | 0.17.0       | 0.18.0       |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.39.0       | 4.44.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.58.0       | 2.62.0       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/007917 | 24.2.0       | 26.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/004021 | 80.9.0       | 82.0.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 9.2.2        | 10.0.5       |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/010429 | 2.2.2        | 2.3.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.15.3       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.3        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.16.0       | 5.16.2       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.8.3        | 2.8.4        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/004034 | 2.0.49       | 2.0.50       |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/036570 | 1.1.0        | 1.3.1        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/021613 | 1.3.4        | 1.3.5        |     
             python-telnetlib3 |  DISTRO  | https://release-monitoring.org/project/133741 | 4.0.2        | 4.0.4        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.8.1        | 5.10.0       |     
                python-textual |  DISTRO  | https://release-monitoring.org/project/209284 | 8.2.5        | 8.2.7        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/021614 | 0.22.0       | 0.23.0       |     
                python-tomlkit |  DISTRO  | https://release-monitoring.org/project/019609 | 0.14.0       | 0.15.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/007498 | 6.5.5        | 6.5.7        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/036051 | 4.67.3       | 4.68.2       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/012211 | 5.14.3       | 5.15.1       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2026.4.28.13 | 2026.6.1.19  |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/004071 | 25.5.0       | 26.4.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/019661 | 24.8.0       | 26.6.0       |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.5.1        | 4.5.2        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/021617 | 1.3.4        | 2.0.0        |     
           python-types-psutil |  DISTRO  | https://release-monitoring.org/project/221807 | 7.2.2.202... | 7.2.2.202... |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.9.0.202... | 2.9.0.202... |     
       python-types-setuptools |  DISTRO  | https://release-monitoring.org/project/214295 | 82.0.0.20... | 82.0.0.20... |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/004076 | 5.12.0       | 5.13.0       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/004079 | 4.0.0        | 4.0.2        |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/028526 | 0.46.0       | 0.49.0       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/008743 | 0.2.14       | 0.8.1        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/011057 | 68.1         | 69.0         |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/020617 | v3.1.1       | 3.3.3        |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/006181 | 1.8.9        | 1.8.10       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/006108 | 2.0.1        | 2.2.1        |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/011805 | 3.2.1        | 3.2.2        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.23.0       | 1.24.2       |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/050636 | 20230507.3   | 20260518.1   |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.148.0      | 1.0.0        |     
           python-zipstream-ng |  DISTRO  | https://release-monitoring.org/project/215954 | 1.9.0        | 1.9.2        |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/066674 | 23.1.1       | 25.12.3      |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/004112 | 8.4          | 8.5          |     
                 python-zopfli |  DISTRO  | https://release-monitoring.org/project/050016 | 0.4.1        | 0.4.3        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/013254 | 3.14.5       | 3.14.6       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 11.0.0       | 11.0.1       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.1        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                qoriq-mc-utils |  DISTRO  | https://release-monitoring.org/project/377824 | 10.39.0      | 10.40.0      |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.18      | 6.11.1       |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.9.1        | 6.11.1       |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.9.1        | 6.11.1       |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/004141 | 1.5          | 1.7.1        |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.8.0        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.16.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 62.0         | 63.0         |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20250923   | 2.20260312   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.7       |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/015461 | 14.1.1       | 15.1.0       |     
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.48         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 11.0.4       | 11.1.1       |     
                       rrdtool |  DISTRO  | https://release-monitoring.org/project/004214 | 1.10.2       | 1.10.3       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2510.0     | 8.2604.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/059450 | 2.8          | 2.10         |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 25.02        | 25.12        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.15.3       | 0.16.14      | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 9.0.4        | 9.1.0        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 4.0.3        | 4.0.5        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.3.5        | 1.4.3        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 45.2         |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.42.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.15.0.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.2      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.2.0.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.4.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.8.0.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.6.1.1      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.9.1        | 08032024     |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.1          | 2.2          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.10.1       |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                           sdl |  DISTRO  | https://release-monitoring.org/project/004777 | 1.2.15       | 3.4.10       | ORPH
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.12       | 3.4.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 3.2.4        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/004783 | 2.2.0        | 3.2.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.6        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                         seatd |  DISTRO  | https://release-monitoring.org/project/234932 | 0.9.1        | 0.9.3        | ORPH
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.15.0       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.7        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.32.8       | 0.32.10      |     
                       setools |  DISTRO  | https://release-monitoring.org/project/008951 | 4.5.1        | 4.6.0        | ORPH
                        shadow |  DISTRO  | https://release-monitoring.org/project/004802 | 4.18.0       | 4.19.4       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 4.3.7        | 5.0.4        | ORPH
                      shapelib |  DISTRO  | https://release-monitoring.org/project/004804 | 1.6.2        | 1.6.3        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
                   shellinabox |  DISTRO  | https://release-monitoring.org/project/009501 | 2.20         | 2.21         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       siproxd |  DISTRO  | https://release-monitoring.org/project/179540 | 0.8.3        | 0.8.4        |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.15.0.0     |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/009216 | 1.22.2       | 1.23.0       |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.9.1        | 20201217     | ORPH
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/096795 | 1.3.3        | 1.3.4        |     
                      snagboot |  DISTRO  | https://release-monitoring.org/project/351979 | 2.5          | 2.6.1        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.8.2        | 1.8.3        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.6.5        | 3.6.6        |     
                        snooze |  DISTRO  | https://release-monitoring.org/project/376662 | 0.5          | 0.5.1        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.11.1.0     | 3.12.2.0     |     
                      softhsm2 |  DISTRO  | https://release-monitoring.org/project/004850 | 2.6.1        | 2.7.0        | ORPH
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                     spi-tools |  DISTRO  | https://release-monitoring.org/project/020628 | 1.0.2        | 1.1.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.16.0       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/004880 | 7.5          | 7.6          | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.22       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.3.1        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.23.7       | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.21.02      | 0.21.03      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 6.0.5        | 6.0.7        |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 26.03        |     
                      supertux |  DISTRO  | https://release-monitoring.org/project/004911 | 0.6.3        | 0.7.0-rev.1  |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/016289 | 4.2.5        | 4.3.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 8.0.4        | 8.0.5        |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/020562 | 1.2.1        | 1.2.2        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.4.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 10.0.2       | 10.1.5       |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/015714 | 2025.12      | 2026.05      |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.41.4       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 49.0         | 50.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 3.7.11       | 4.5.4        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.9       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 258.7        | 260.2        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.14         | 3.18         | ORPH
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.98.5       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.2        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2023.0.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.11.0       |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.3        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.8.1        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.21.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.15.10      |     
                           tig |  DISTRO  | https://release-monitoring.org/project/004969 | 2.6.0        | 2.6.1        |     
                          time |  DISTRO  | https://release-monitoring.org/project/004971 | 1.9          | 1.10         |     
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.27.1       | 2.27.2       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.1.2        |     
                     tinyproxy |  DISTRO  | https://release-monitoring.org/project/008699 | 1.11.2       | 1.11.3       | ORPH
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20260601     |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.7.2      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.3        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.3.1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/004980 | 3.6a         | 3.6b         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/018777 | 1.9.1        | 1.10.0       |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/007873 | 3.3.3        | 3.4          |     
                          tree |  DISTRO  | https://release-monitoring.org/project/005006 | 2.2.1        | 2.3.2        |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.19         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.9.0.1      | 4.10.0.0     |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.9.7        | 1.9.17       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.91.2       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.2.0        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.52         | 6.60         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.10.0       | 2.11.3       | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.4       | 2.42.1       |     
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.4       | 2.42.1       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.18      | 0.56.19      | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/013639 | 3.26.0       | 3.27.1       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.1.0        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.8.2        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.4        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.2148     | 9.2.0649     |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.2.0        | 3.3.0        |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.84.0       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.4.317      | 1.4.354      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.4.317      | 1.4.354      | ORPH
                    vulkan-sdk |  DISTRO  | https://release-monitoring.org/project/370476 | 1.4.313.0    | 1.4.350.0    | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.4.317      | 1.4.354      | ORPH
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.7        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.9.0        | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/010061 | 1.24.0       | 1.25.0       |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.48         | 1.49         | ORPH
                 wayland-utils |  DISTRO  | https://release-monitoring.org/project/129361 | 1.2.0        | 1.3.0        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.52.3       | 2.53.3       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.23         | 2.25         | ORPH
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 11.0         | 11.11        |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.4.16       | 4.6.6        |     
                       wlroots |  DISTRO  | https://release-monitoring.org/project/018357 | 0.20.0       | 0.20.1       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.10.0       | 4.0.0        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.50.5       | 2.52.4       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.47.1       | 0.49.1       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       | ORPH
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 4.1          | 4.2          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.30       | 2.0.0        |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.1        | 1.1.2        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.9        | 1.1.1        | ORPH
                  xapp_fstobdf |  DISTRO  | https://release-monitoring.org/project/017156 | 1.0.7        | 1.0.8        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.10       | 1.0.11       | ORPH
                      xapp_ico |  DISTRO  | https://release-monitoring.org/project/021722 | 1.0.6        | 1.0.7        | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.6        | 1.0.7        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20250912     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.3        | 1.2.4        | ORPH
                xapp_setxkbmap |  DISTRO  | https://release-monitoring.org/project/012314 | 1.3.4        | 1.3.5        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xcalc |  DISTRO  | https://release-monitoring.org/project/005164 | 1.1.2        | 1.1.3        | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.1.0        | 1.1.1        |     
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.6        | 1.2.7        | ORPH
                      xapp_xfd |  DISTRO  | https://release-monitoring.org/project/015024 | 1.1.4        | 1.1.5        | ORPH
                    xapp_xkill |  DISTRO  | https://release-monitoring.org/project/014993 | 1.0.6        | 1.0.7        | ORPH
               xapp_xlsclients |  DISTRO  | https://release-monitoring.org/project/014989 | 1.1.5        | 1.1.6        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.3        | 1.5.4        | ORPH
                xdata_xbitmaps |  DISTRO  | https://release-monitoring.org/project/013645 | 1.1.3        | 1.1.4        | ORPH
                       xdotool |  DISTRO  | https://release-monitoring.org/project/008648 | 3.20211022.1 | 4.20260303.1 | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.19.5       | 4.21.1       |     
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/015059 | 1.0.5        | 1.0.6        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.1        | 1.4.2        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.19.0       | 7.0.1        | ORPH
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.47         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.19       | 1.3.20       | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.12       | 1.8.13       | ORPH
            xlib_libXcomposite |  DISTRO  | https://release-monitoring.org/project/001769 | 0.4.6        | 0.4.7        | ORPH
               xlib_libXdamage |  DISTRO  | https://release-monitoring.org/project/001771 | 1.1.6        | 1.1.7        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.6        | 1.3.7        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.2        | 1.8.3        | ORPH
              xlib_libXinerama |  DISTRO  | https://release-monitoring.org/project/001779 | 1.1.5        | 1.1.6        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.2.1        | 1.3.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.4        | 1.5.5        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.14       | 1.0.15       | ORPH
              xlib_libXxf86dga |  DISTRO  | https://release-monitoring.org/project/001797 | 1.1.6        | 1.1.7        | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.6        | 1.1.7        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.8        | 1.1.9        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.3        | 1.2.0        | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.14         | 6.15         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.30         | ORPH
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/005284 | 0.8.0        | 0.9.0        | ORPH
                            yq |  DISTRO  | https://release-monitoring.org/project/303696 | 4.49.2       | 4.53.3       |     
                         ytree |  DISTRO  | https://release-monitoring.org/project/005296 | 2.12         | 2.13         |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.15.2       | 4.16.0       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.13       | 7.4.11       |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.3        |     
                        zellij |  DISTRO  | https://release-monitoring.org/project/300087 | 0.44.2       | 0.44.3       |     
                  zisofs-tools |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     | ORPH
                           zix |  DISTRO  | https://release-monitoring.org/project/370005 | 0.8.0        | 0.8.2        |     
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.8        | 0.9.9        |     
                           zsh |  DISTRO  | https://release-monitoring.org/project/005307 | 5.9          | 5.9.1        |     
                     zxing-cpp |  DISTRO  | https://release-monitoring.org/project/101246 | 2.3.0        | 3.0.2        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                         avahi | CVE-2026-34933   | https://security-tracker.debian.org/tracker/CVE-2026-34933  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-32883   | https://security-tracker.debian.org/tracker/CVE-2026-32883  
                         botan | CVE-2026-32877   | https://security-tracker.debian.org/tracker/CVE-2026-32877  
                         botan | CVE-2026-32884   | https://security-tracker.debian.org/tracker/CVE-2026-32884  
                         botan | CVE-2026-34582   | https://security-tracker.debian.org/tracker/CVE-2026-34582  
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                   cpp-httplib | CVE-2026-45352   | https://security-tracker.debian.org/tracker/CVE-2026-45352  
                   cpp-httplib | CVE-2026-45372   | https://security-tracker.debian.org/tracker/CVE-2026-45372  
                   cpp-httplib | CVE-2026-46527   | https://security-tracker.debian.org/tracker/CVE-2026-46527  
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                  cups-filters | CVE-2025-64503   | https://security-tracker.debian.org/tracker/CVE-2025-64503  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-33997   | https://security-tracker.debian.org/tracker/CVE-2026-33997  
                 docker-engine | CVE-2026-34040   | https://security-tracker.debian.org/tracker/CVE-2026-34040  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-42790   | https://security-tracker.debian.org/tracker/CVE-2026-42790  
                        erlang | CVE-2026-42789   | https://security-tracker.debian.org/tracker/CVE-2026-42789  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                         expat | CVE-2026-50219   | https://security-tracker.debian.org/tracker/CVE-2026-50219  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-53463   | https://security-tracker.debian.org/tracker/CVE-2026-53463  
                   imagemagick | CVE-2026-53461   | https://security-tracker.debian.org/tracker/CVE-2026-53461  
                   imagemagick | CVE-2026-53464   | https://security-tracker.debian.org/tracker/CVE-2026-53464  
                   imagemagick | CVE-2026-53462   | https://security-tracker.debian.org/tracker/CVE-2026-53462  
                   imagemagick | CVE-2026-53465   | https://security-tracker.debian.org/tracker/CVE-2026-53465  
                   imagemagick | CVE-2026-53460   | https://security-tracker.debian.org/tracker/CVE-2026-53460  
                   imagemagick | CVE-2026-48994   | https://security-tracker.debian.org/tracker/CVE-2026-48994  
                   imagemagick | CVE-2026-48724   | https://security-tracker.debian.org/tracker/CVE-2026-48724  
                   imagemagick | CVE-2026-48734   | https://security-tracker.debian.org/tracker/CVE-2026-48734  
                   imagemagick | CVE-2026-48733   | https://security-tracker.debian.org/tracker/CVE-2026-48733  
                   imagemagick | CVE-2026-49218   | https://security-tracker.debian.org/tracker/CVE-2026-49218  
                   imagemagick | CVE-2026-49219   | https://security-tracker.debian.org/tracker/CVE-2026-49219  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-41257   | https://security-tracker.debian.org/tracker/CVE-2026-41257  
                            jq | CVE-2026-41256   | https://security-tracker.debian.org/tracker/CVE-2026-41256  
                            jq | CVE-2026-33947   | https://security-tracker.debian.org/tracker/CVE-2026-33947  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-43895   | https://security-tracker.debian.org/tracker/CVE-2026-43895  
                            jq | CVE-2026-43896   | https://security-tracker.debian.org/tracker/CVE-2026-43896  
                            jq | CVE-2026-43894   | https://security-tracker.debian.org/tracker/CVE-2026-43894  
                            jq | CVE-2026-32316   | https://security-tracker.debian.org/tracker/CVE-2026-32316  
                            jq | CVE-2026-40612   | https://security-tracker.debian.org/tracker/CVE-2026-40612  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       quickjs | CVE-2025-69653   | https://security-tracker.debian.org/tracker/CVE-2025-69653  
                       quickjs | CVE-2025-69654   | https://security-tracker.debian.org/tracker/CVE-2025-69654  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                          ruby | CVE-2026-46727   | https://security-tracker.debian.org/tracker/CVE-2026-46727  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                          sudo | CVE-2026-35535   | https://security-tracker.debian.org/tracker/CVE-2026-35535  
                      swupdate | CVE-2026-28525   | https://security-tracker.debian.org/tracker/CVE-2026-28525  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-47162   | https://security-tracker.debian.org/tracker/CVE-2026-47162  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2026.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-2026-43951   | https://security-tracker.debian.org/tracker/CVE-2026-43951  
                        apache | CVE-2026-42535   | https://security-tracker.debian.org/tracker/CVE-2026-42535  
                        apache | CVE-2026-42536   | https://security-tracker.debian.org/tracker/CVE-2026-42536  
                        apache | CVE-2026-48913   | https://security-tracker.debian.org/tracker/CVE-2026-48913  
                        apache | CVE-2026-34355   | https://security-tracker.debian.org/tracker/CVE-2026-34355  
                        apache | CVE-2026-34356   | https://security-tracker.debian.org/tracker/CVE-2026-34356  
                        apache | CVE-2026-49975   | https://security-tracker.debian.org/tracker/CVE-2026-49975  
                        apache | CVE-2026-29170   | https://security-tracker.debian.org/tracker/CVE-2026-29170  
                        apache | CVE-2026-29167   | https://security-tracker.debian.org/tracker/CVE-2026-29167  
                        apache | CVE-2026-44119   | https://security-tracker.debian.org/tracker/CVE-2026-44119  
                        apache | CVE-2026-44186   | https://security-tracker.debian.org/tracker/CVE-2026-44186  
                        apache | CVE-2026-44185   | https://security-tracker.debian.org/tracker/CVE-2026-44185  
                        apache | CVE-2026-44631   | https://security-tracker.debian.org/tracker/CVE-2026-44631  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                         avahi | CVE-2026-34933   | https://security-tracker.debian.org/tracker/CVE-2026-34933  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-32883   | https://security-tracker.debian.org/tracker/CVE-2026-32883  
                         botan | CVE-2026-32877   | https://security-tracker.debian.org/tracker/CVE-2026-32877  
                         botan | CVE-2026-32884   | https://security-tracker.debian.org/tracker/CVE-2026-32884  
                         botan | CVE-2026-34582   | https://security-tracker.debian.org/tracker/CVE-2026-34582  
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                   cpp-httplib | CVE-2026-45352   | https://security-tracker.debian.org/tracker/CVE-2026-45352  
                   cpp-httplib | CVE-2026-45372   | https://security-tracker.debian.org/tracker/CVE-2026-45372  
                   cpp-httplib | CVE-2026-46527   | https://security-tracker.debian.org/tracker/CVE-2026-46527  
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                  cups-filters | CVE-2025-64503   | https://security-tracker.debian.org/tracker/CVE-2025-64503  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-33997   | https://security-tracker.debian.org/tracker/CVE-2026-33997  
                 docker-engine | CVE-2026-34040   | https://security-tracker.debian.org/tracker/CVE-2026-34040  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-42790   | https://security-tracker.debian.org/tracker/CVE-2026-42790  
                        erlang | CVE-2026-42789   | https://security-tracker.debian.org/tracker/CVE-2026-42789  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                         expat | CVE-2026-50219   | https://security-tracker.debian.org/tracker/CVE-2026-50219  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-53463   | https://security-tracker.debian.org/tracker/CVE-2026-53463  
                   imagemagick | CVE-2026-53461   | https://security-tracker.debian.org/tracker/CVE-2026-53461  
                   imagemagick | CVE-2026-53464   | https://security-tracker.debian.org/tracker/CVE-2026-53464  
                   imagemagick | CVE-2026-53462   | https://security-tracker.debian.org/tracker/CVE-2026-53462  
                   imagemagick | CVE-2026-53465   | https://security-tracker.debian.org/tracker/CVE-2026-53465  
                   imagemagick | CVE-2026-53460   | https://security-tracker.debian.org/tracker/CVE-2026-53460  
                   imagemagick | CVE-2026-48994   | https://security-tracker.debian.org/tracker/CVE-2026-48994  
                   imagemagick | CVE-2026-48724   | https://security-tracker.debian.org/tracker/CVE-2026-48724  
                   imagemagick | CVE-2026-48734   | https://security-tracker.debian.org/tracker/CVE-2026-48734  
                   imagemagick | CVE-2026-48733   | https://security-tracker.debian.org/tracker/CVE-2026-48733  
                   imagemagick | CVE-2026-49218   | https://security-tracker.debian.org/tracker/CVE-2026-49218  
                   imagemagick | CVE-2026-49219   | https://security-tracker.debian.org/tracker/CVE-2026-49219  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-41257   | https://security-tracker.debian.org/tracker/CVE-2026-41257  
                            jq | CVE-2026-41256   | https://security-tracker.debian.org/tracker/CVE-2026-41256  
                            jq | CVE-2026-33947   | https://security-tracker.debian.org/tracker/CVE-2026-33947  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-43895   | https://security-tracker.debian.org/tracker/CVE-2026-43895  
                            jq | CVE-2026-43896   | https://security-tracker.debian.org/tracker/CVE-2026-43896  
                            jq | CVE-2026-43894   | https://security-tracker.debian.org/tracker/CVE-2026-43894  
                            jq | CVE-2026-32316   | https://security-tracker.debian.org/tracker/CVE-2026-32316  
                            jq | CVE-2026-40612   | https://security-tracker.debian.org/tracker/CVE-2026-40612  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                 python-django | CVE-2026-48587   | https://security-tracker.debian.org/tracker/CVE-2026-48587  
                 python-django | CVE-2026-6873    | https://security-tracker.debian.org/tracker/CVE-2026-6873   
                 python-django | CVE-2026-8404    | https://security-tracker.debian.org/tracker/CVE-2026-8404   
                 python-django | CVE-2026-35193   | https://security-tracker.debian.org/tracker/CVE-2026-35193  
                 python-django | CVE-2026-7666    | https://security-tracker.debian.org/tracker/CVE-2026-7666   
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       quickjs | CVE-2025-69653   | https://security-tracker.debian.org/tracker/CVE-2025-69653  
                       quickjs | CVE-2025-69654   | https://security-tracker.debian.org/tracker/CVE-2025-69654  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                         redis | CVE-2026-23479   | https://security-tracker.debian.org/tracker/CVE-2026-23479  
                         redis | CVE-2026-25243   | https://security-tracker.debian.org/tracker/CVE-2026-25243  
                         redis | CVE-2026-23631   | https://security-tracker.debian.org/tracker/CVE-2026-23631  
                          ruby | CVE-2026-46727   | https://security-tracker.debian.org/tracker/CVE-2026-46727  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                          sudo | CVE-2026-35535   | https://security-tracker.debian.org/tracker/CVE-2026-35535  
                      swupdate | CVE-2026-28525   | https://security-tracker.debian.org/tracker/CVE-2026-28525  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-47162   | https://security-tracker.debian.org/tracker/CVE-2026-47162  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2026.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                  aardvark-dns | CVE-2026-35406   | https://security-tracker.debian.org/tracker/CVE-2026-35406  
                        apache | CVE-2026-43951   | https://security-tracker.debian.org/tracker/CVE-2026-43951  
                        apache | CVE-2026-42535   | https://security-tracker.debian.org/tracker/CVE-2026-42535  
                        apache | CVE-2026-42536   | https://security-tracker.debian.org/tracker/CVE-2026-42536  
                        apache | CVE-2026-48913   | https://security-tracker.debian.org/tracker/CVE-2026-48913  
                        apache | CVE-2026-34355   | https://security-tracker.debian.org/tracker/CVE-2026-34355  
                        apache | CVE-2026-34356   | https://security-tracker.debian.org/tracker/CVE-2026-34356  
                        apache | CVE-2026-49975   | https://security-tracker.debian.org/tracker/CVE-2026-49975  
                        apache | CVE-2026-29170   | https://security-tracker.debian.org/tracker/CVE-2026-29170  
                        apache | CVE-2026-29167   | https://security-tracker.debian.org/tracker/CVE-2026-29167  
                        apache | CVE-2026-44119   | https://security-tracker.debian.org/tracker/CVE-2026-44119  
                        apache | CVE-2026-44186   | https://security-tracker.debian.org/tracker/CVE-2026-44186  
                        apache | CVE-2026-44185   | https://security-tracker.debian.org/tracker/CVE-2026-44185  
                        apache | CVE-2026-44631   | https://security-tracker.debian.org/tracker/CVE-2026-44631  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                         avahi | CVE-2026-34933   | https://security-tracker.debian.org/tracker/CVE-2026-34933  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
                      binutils | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
                      binutils | CVE-2025-69646   | https://security-tracker.debian.org/tracker/CVE-2025-69646  
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69645   | https://security-tracker.debian.org/tracker/CVE-2025-69645  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-32883   | https://security-tracker.debian.org/tracker/CVE-2026-32883  
                         botan | CVE-2026-32877   | https://security-tracker.debian.org/tracker/CVE-2026-32877  
                         botan | CVE-2026-32884   | https://security-tracker.debian.org/tracker/CVE-2026-32884  
                         botan | CVE-2026-34582   | https://security-tracker.debian.org/tracker/CVE-2026-34582  
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                   cpp-httplib | CVE-2026-45352   | https://security-tracker.debian.org/tracker/CVE-2026-45352  
                   cpp-httplib | CVE-2026-45372   | https://security-tracker.debian.org/tracker/CVE-2026-45372  
                   cpp-httplib | CVE-2026-46527   | https://security-tracker.debian.org/tracker/CVE-2026-46527  
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                  cups-filters | CVE-2025-64503   | https://security-tracker.debian.org/tracker/CVE-2025-64503  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-33997   | https://security-tracker.debian.org/tracker/CVE-2026-33997  
                 docker-engine | CVE-2026-34040   | https://security-tracker.debian.org/tracker/CVE-2026-34040  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-42790   | https://security-tracker.debian.org/tracker/CVE-2026-42790  
                        erlang | CVE-2026-42789   | https://security-tracker.debian.org/tracker/CVE-2026-42789  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                         expat | CVE-2026-50219   | https://security-tracker.debian.org/tracker/CVE-2026-50219  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                    freeswitch | CVE-2026-49847   | https://security-tracker.debian.org/tracker/CVE-2026-49847  
                    freeswitch | CVE-2026-49843   | https://security-tracker.debian.org/tracker/CVE-2026-49843  
                    freeswitch | CVE-2026-49840   | https://security-tracker.debian.org/tracker/CVE-2026-49840  
                    freeswitch | CVE-2026-49841   | https://security-tracker.debian.org/tracker/CVE-2026-49841  
                    freeswitch | CVE-2026-49842   | https://security-tracker.debian.org/tracker/CVE-2026-49842  
                    freeswitch | CVE-2026-49848   | https://security-tracker.debian.org/tracker/CVE-2026-49848  
                    freeswitch | CVE-2026-49472   | https://security-tracker.debian.org/tracker/CVE-2026-49472  
                    freeswitch | CVE-2026-49475   | https://security-tracker.debian.org/tracker/CVE-2026-49475  
                    freeswitch | CVE-2026-45771   | https://security-tracker.debian.org/tracker/CVE-2026-45771  
                           frr | CVE-2026-28532   | https://security-tracker.debian.org/tracker/CVE-2026-28532  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                           frr | CVE-2026-5107    | https://security-tracker.debian.org/tracker/CVE-2026-5107   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-53463   | https://security-tracker.debian.org/tracker/CVE-2026-53463  
                   imagemagick | CVE-2026-53461   | https://security-tracker.debian.org/tracker/CVE-2026-53461  
                   imagemagick | CVE-2026-53464   | https://security-tracker.debian.org/tracker/CVE-2026-53464  
                   imagemagick | CVE-2026-53462   | https://security-tracker.debian.org/tracker/CVE-2026-53462  
                   imagemagick | CVE-2026-53465   | https://security-tracker.debian.org/tracker/CVE-2026-53465  
                   imagemagick | CVE-2026-53460   | https://security-tracker.debian.org/tracker/CVE-2026-53460  
                   imagemagick | CVE-2026-48994   | https://security-tracker.debian.org/tracker/CVE-2026-48994  
                   imagemagick | CVE-2026-48724   | https://security-tracker.debian.org/tracker/CVE-2026-48724  
                   imagemagick | CVE-2026-48734   | https://security-tracker.debian.org/tracker/CVE-2026-48734  
                   imagemagick | CVE-2026-48733   | https://security-tracker.debian.org/tracker/CVE-2026-48733  
                   imagemagick | CVE-2026-49218   | https://security-tracker.debian.org/tracker/CVE-2026-49218  
                   imagemagick | CVE-2026-49219   | https://security-tracker.debian.org/tracker/CVE-2026-49219  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-41257   | https://security-tracker.debian.org/tracker/CVE-2026-41257  
                            jq | CVE-2026-41256   | https://security-tracker.debian.org/tracker/CVE-2026-41256  
                            jq | CVE-2026-33947   | https://security-tracker.debian.org/tracker/CVE-2026-33947  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-43895   | https://security-tracker.debian.org/tracker/CVE-2026-43895  
                            jq | CVE-2026-43896   | https://security-tracker.debian.org/tracker/CVE-2026-43896  
                            jq | CVE-2026-43894   | https://security-tracker.debian.org/tracker/CVE-2026-43894  
                            jq | CVE-2026-32316   | https://security-tracker.debian.org/tracker/CVE-2026-32316  
                            jq | CVE-2026-40612   | https://security-tracker.debian.org/tracker/CVE-2026-40612  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                      libfuse3 | CVE-2026-33150   | https://security-tracker.debian.org/tracker/CVE-2026-33150  
                      libfuse3 | CVE-2026-33179   | https://security-tracker.debian.org/tracker/CVE-2026-33179  
                     libgcrypt | CVE-2026-41989   | https://security-tracker.debian.org/tracker/CVE-2026-41989  
                     libgcrypt | CVE-2026-41990   | https://security-tracker.debian.org/tracker/CVE-2026-41990  
                      libinput | CVE-2026-50292   | https://security-tracker.debian.org/tracker/CVE-2026-50292  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-33298   | https://security-tracker.debian.org/tracker/CVE-2026-33298  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                      mongoose | CVE-2026-6986    | https://security-tracker.debian.org/tracker/CVE-2026-6986   
                      mongoose | CVE-2026-6985    | https://security-tracker.debian.org/tracker/CVE-2026-6985   
                      mongoose | CVE-2026-2966    | https://security-tracker.debian.org/tracker/CVE-2026-2966   
                      mongoose | CVE-2026-2967    | https://security-tracker.debian.org/tracker/CVE-2026-2967   
                      mongoose | CVE-2026-2968    | https://security-tracker.debian.org/tracker/CVE-2026-2968   
                      mongoose | CVE-2026-5244    | https://security-tracker.debian.org/tracker/CVE-2026-5244   
                      mongoose | CVE-2026-5245    | https://security-tracker.debian.org/tracker/CVE-2026-5245   
                      mongoose | CVE-2026-5246    | https://security-tracker.debian.org/tracker/CVE-2026-5246   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nano | CVE-2026-6843    | https://security-tracker.debian.org/tracker/CVE-2026-6843   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2026-35387   | https://security-tracker.debian.org/tracker/CVE-2026-35387  
                       openssh | CVE-2026-35386   | https://security-tracker.debian.org/tracker/CVE-2026-35386  
                       openssh | CVE-2026-35388   | https://security-tracker.debian.org/tracker/CVE-2026-35388  
                       openssh | CVE-2026-35385   | https://security-tracker.debian.org/tracker/CVE-2026-35385  
                       openssh | CVE-2026-35414   | https://security-tracker.debian.org/tracker/CVE-2026-35414  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-39892   | https://security-tracker.debian.org/tracker/CVE-2026-39892  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-django | CVE-2026-48587   | https://security-tracker.debian.org/tracker/CVE-2026-48587  
                 python-django | CVE-2026-6873    | https://security-tracker.debian.org/tracker/CVE-2026-6873   
                 python-django | CVE-2026-8404    | https://security-tracker.debian.org/tracker/CVE-2026-8404   
                 python-django | CVE-2026-35193   | https://security-tracker.debian.org/tracker/CVE-2026-35193  
                 python-django | CVE-2026-7666    | https://security-tracker.debian.org/tracker/CVE-2026-7666   
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       quickjs | CVE-2025-69653   | https://security-tracker.debian.org/tracker/CVE-2025-69653  
                       quickjs | CVE-2025-69654   | https://security-tracker.debian.org/tracker/CVE-2025-69654  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                         redis | CVE-2026-23479   | https://security-tracker.debian.org/tracker/CVE-2026-23479  
                         redis | CVE-2026-25243   | https://security-tracker.debian.org/tracker/CVE-2026-25243  
                         redis | CVE-2026-23631   | https://security-tracker.debian.org/tracker/CVE-2026-23631  
                          ruby | CVE-2026-46727   | https://security-tracker.debian.org/tracker/CVE-2026-46727  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sqlite | CVE-2026-11822   | https://security-tracker.debian.org/tracker/CVE-2026-11822  
                        sqlite | CVE-2026-11824   | https://security-tracker.debian.org/tracker/CVE-2026-11824  
                          sudo | CVE-2026-35535   | https://security-tracker.debian.org/tracker/CVE-2026-35535  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                      suricata | CVE-2026-22264   | https://security-tracker.debian.org/tracker/CVE-2026-22264  
                      suricata | CVE-2026-22259   | https://security-tracker.debian.org/tracker/CVE-2026-22259  
                      suricata | CVE-2026-22262   | https://security-tracker.debian.org/tracker/CVE-2026-22262  
                      suricata | CVE-2026-22258   | https://security-tracker.debian.org/tracker/CVE-2026-22258  
                      suricata | CVE-2026-22261   | https://security-tracker.debian.org/tracker/CVE-2026-22261  
                      suricata | CVE-2026-31932   | https://security-tracker.debian.org/tracker/CVE-2026-31932  
                      suricata | CVE-2026-31935   | https://security-tracker.debian.org/tracker/CVE-2026-31935  
                      suricata | CVE-2026-31937   | https://security-tracker.debian.org/tracker/CVE-2026-31937  
                      suricata | CVE-2026-31933   | https://security-tracker.debian.org/tracker/CVE-2026-31933  
                      swupdate | CVE-2026-28525   | https://security-tracker.debian.org/tracker/CVE-2026-28525  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2024-42040   | https://security-tracker.debian.org/tracker/CVE-2024-42040  
                   uboot-tools | CVE-2026-33243   | https://security-tracker.debian.org/tracker/CVE-2026-33243  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-47162   | https://security-tracker.debian.org/tracker/CVE-2026-47162  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                     wireshark | CVE-2026-9759    | https://security-tracker.debian.org/tracker/CVE-2026-9759   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-2026-43951   | https://security-tracker.debian.org/tracker/CVE-2026-43951  
                        apache | CVE-2026-42535   | https://security-tracker.debian.org/tracker/CVE-2026-42535  
                        apache | CVE-2026-42536   | https://security-tracker.debian.org/tracker/CVE-2026-42536  
                        apache | CVE-2026-48913   | https://security-tracker.debian.org/tracker/CVE-2026-48913  
                        apache | CVE-2026-34355   | https://security-tracker.debian.org/tracker/CVE-2026-34355  
                        apache | CVE-2026-34356   | https://security-tracker.debian.org/tracker/CVE-2026-34356  
                        apache | CVE-2026-49975   | https://security-tracker.debian.org/tracker/CVE-2026-49975  
                        apache | CVE-2026-29170   | https://security-tracker.debian.org/tracker/CVE-2026-29170  
                        apache | CVE-2026-29167   | https://security-tracker.debian.org/tracker/CVE-2026-29167  
                        apache | CVE-2026-44119   | https://security-tracker.debian.org/tracker/CVE-2026-44119  
                        apache | CVE-2026-44186   | https://security-tracker.debian.org/tracker/CVE-2026-44186  
                        apache | CVE-2026-44185   | https://security-tracker.debian.org/tracker/CVE-2026-44185  
                        apache | CVE-2026-44631   | https://security-tracker.debian.org/tracker/CVE-2026-44631  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                         avahi | CVE-2026-34933   | https://security-tracker.debian.org/tracker/CVE-2026-34933  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
           binutils-bare-metal | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
           binutils-bare-metal | CVE-2025-69646   | https://security-tracker.debian.org/tracker/CVE-2025-69646  
           binutils-bare-metal | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
           binutils-bare-metal | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
           binutils-bare-metal | CVE-2025-69645   | https://security-tracker.debian.org/tracker/CVE-2025-69645  
           binutils-bare-metal | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
           binutils-bare-metal | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
           binutils-bare-metal | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
           binutils-bare-metal | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
           binutils-bare-metal | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
           binutils-bare-metal | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2025-54605   | https://security-tracker.debian.org/tracker/CVE-2025-54605  
                       bitcoin | CVE-2025-54604   | https://security-tracker.debian.org/tracker/CVE-2025-54604  
                         botan | CVE-2026-32883   | https://security-tracker.debian.org/tracker/CVE-2026-32883  
                         botan | CVE-2026-32877   | https://security-tracker.debian.org/tracker/CVE-2026-32877  
                         botan | CVE-2026-32884   | https://security-tracker.debian.org/tracker/CVE-2026-32884  
                         botan | CVE-2026-34582   | https://security-tracker.debian.org/tracker/CVE-2026-34582  
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                      bpftrace | CVE-2024-2313    | https://security-tracker.debian.org/tracker/CVE-2024-2313   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                   cpp-httplib | CVE-2026-45352   | https://security-tracker.debian.org/tracker/CVE-2026-45352  
                   cpp-httplib | CVE-2026-45372   | https://security-tracker.debian.org/tracker/CVE-2026-45372  
                   cpp-httplib | CVE-2026-46527   | https://security-tracker.debian.org/tracker/CVE-2026-46527  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                  cups-filters | CVE-2025-64503   | https://security-tracker.debian.org/tracker/CVE-2025-64503  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-33997   | https://security-tracker.debian.org/tracker/CVE-2026-33997  
                 docker-engine | CVE-2026-34040   | https://security-tracker.debian.org/tracker/CVE-2026-34040  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-42790   | https://security-tracker.debian.org/tracker/CVE-2026-42790  
                        erlang | CVE-2026-42789   | https://security-tracker.debian.org/tracker/CVE-2026-42789  
                        erlang | CVE-2026-23943   | https://security-tracker.debian.org/tracker/CVE-2026-23943  
                        erlang | CVE-2026-23941   | https://security-tracker.debian.org/tracker/CVE-2026-23941  
                        erlang | CVE-2026-23942   | https://security-tracker.debian.org/tracker/CVE-2026-23942  
                        erlang | CVE-2026-28808   | https://security-tracker.debian.org/tracker/CVE-2026-28808  
                        erlang | CVE-2026-28810   | https://security-tracker.debian.org/tracker/CVE-2026-28810  
                        erlang | CVE-2026-32147   | https://security-tracker.debian.org/tracker/CVE-2026-32147  
                         exiv2 | CVE-2026-27631   | https://security-tracker.debian.org/tracker/CVE-2026-27631  
                         expat | CVE-2026-50219   | https://security-tracker.debian.org/tracker/CVE-2026-50219  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                         forge | CVE-2025-66030   | https://security-tracker.debian.org/tracker/CVE-2025-66030  
                         forge | CVE-2025-66031   | https://security-tracker.debian.org/tracker/CVE-2025-66031  
                         forge | CVE-2025-12816   | https://security-tracker.debian.org/tracker/CVE-2025-12816  
                         forge | CVE-2026-33891   | https://security-tracker.debian.org/tracker/CVE-2026-33891  
                         forge | CVE-2026-33896   | https://security-tracker.debian.org/tracker/CVE-2026-33896  
                         forge | CVE-2026-33895   | https://security-tracker.debian.org/tracker/CVE-2026-33895  
                         forge | CVE-2026-33894   | https://security-tracker.debian.org/tracker/CVE-2026-33894  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                    freeswitch | CVE-2026-49847   | https://security-tracker.debian.org/tracker/CVE-2026-49847  
                    freeswitch | CVE-2026-49843   | https://security-tracker.debian.org/tracker/CVE-2026-49843  
                    freeswitch | CVE-2026-49840   | https://security-tracker.debian.org/tracker/CVE-2026-49840  
                    freeswitch | CVE-2026-49841   | https://security-tracker.debian.org/tracker/CVE-2026-49841  
                    freeswitch | CVE-2026-49842   | https://security-tracker.debian.org/tracker/CVE-2026-49842  
                    freeswitch | CVE-2026-49848   | https://security-tracker.debian.org/tracker/CVE-2026-49848  
                    freeswitch | CVE-2026-49472   | https://security-tracker.debian.org/tracker/CVE-2026-49472  
                    freeswitch | CVE-2026-49475   | https://security-tracker.debian.org/tracker/CVE-2026-49475  
                    freeswitch | CVE-2026-45771   | https://security-tracker.debian.org/tracker/CVE-2026-45771  
                           frr | CVE-2025-61101   | https://security-tracker.debian.org/tracker/CVE-2025-61101  
                           frr | CVE-2025-61107   | https://security-tracker.debian.org/tracker/CVE-2025-61107  
                           frr | CVE-2025-61105   | https://security-tracker.debian.org/tracker/CVE-2025-61105  
                           frr | CVE-2025-61106   | https://security-tracker.debian.org/tracker/CVE-2025-61106  
                           frr | CVE-2025-61103   | https://security-tracker.debian.org/tracker/CVE-2025-61103  
                           frr | CVE-2025-61104   | https://security-tracker.debian.org/tracker/CVE-2025-61104  
                           frr | CVE-2025-61100   | https://security-tracker.debian.org/tracker/CVE-2025-61100  
                           frr | CVE-2025-61102   | https://security-tracker.debian.org/tracker/CVE-2025-61102  
                           frr | CVE-2025-61099   | https://security-tracker.debian.org/tracker/CVE-2025-61099  
                           frr | CVE-2026-28532   | https://security-tracker.debian.org/tracker/CVE-2026-28532  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                        giflib | CVE-2026-26740   | https://security-tracker.debian.org/tracker/CVE-2026-26740  
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-5450    | https://security-tracker.debian.org/tracker/CVE-2026-5450   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         glibc | CVE-2026-5928    | https://security-tracker.debian.org/tracker/CVE-2026-5928   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                      harfbuzz | CVE-2026-22693   | https://security-tracker.debian.org/tracker/CVE-2026-22693  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                           icu | CVE-2025-5222    | https://security-tracker.debian.org/tracker/CVE-2025-5222   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-53463   | https://security-tracker.debian.org/tracker/CVE-2026-53463  
                   imagemagick | CVE-2026-53461   | https://security-tracker.debian.org/tracker/CVE-2026-53461  
                   imagemagick | CVE-2026-53464   | https://security-tracker.debian.org/tracker/CVE-2026-53464  
                   imagemagick | CVE-2026-53462   | https://security-tracker.debian.org/tracker/CVE-2026-53462  
                   imagemagick | CVE-2026-53465   | https://security-tracker.debian.org/tracker/CVE-2026-53465  
                   imagemagick | CVE-2026-53460   | https://security-tracker.debian.org/tracker/CVE-2026-53460  
                   imagemagick | CVE-2026-48994   | https://security-tracker.debian.org/tracker/CVE-2026-48994  
                   imagemagick | CVE-2026-48724   | https://security-tracker.debian.org/tracker/CVE-2026-48724  
                   imagemagick | CVE-2026-48734   | https://security-tracker.debian.org/tracker/CVE-2026-48734  
                   imagemagick | CVE-2026-48733   | https://security-tracker.debian.org/tracker/CVE-2026-48733  
                   imagemagick | CVE-2026-49218   | https://security-tracker.debian.org/tracker/CVE-2026-49218  
                   imagemagick | CVE-2026-49219   | https://security-tracker.debian.org/tracker/CVE-2026-49219  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-41257   | https://security-tracker.debian.org/tracker/CVE-2026-41257  
                            jq | CVE-2026-41256   | https://security-tracker.debian.org/tracker/CVE-2026-41256  
                            jq | CVE-2026-33947   | https://security-tracker.debian.org/tracker/CVE-2026-33947  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-43895   | https://security-tracker.debian.org/tracker/CVE-2026-43895  
                            jq | CVE-2026-43896   | https://security-tracker.debian.org/tracker/CVE-2026-43896  
                            jq | CVE-2026-43894   | https://security-tracker.debian.org/tracker/CVE-2026-43894  
                            jq | CVE-2026-32316   | https://security-tracker.debian.org/tracker/CVE-2026-32316  
                            jq | CVE-2026-40612   | https://security-tracker.debian.org/tracker/CVE-2026-40612  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libbson | CVE-2024-6381    | https://security-tracker.debian.org/tracker/CVE-2024-6381   
                       libbson | CVE-2025-0755    | https://security-tracker.debian.org/tracker/CVE-2025-0755   
                       libcdio | CVE-2024-36600   | https://security-tracker.debian.org/tracker/CVE-2024-36600  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2025-70968   | https://security-tracker.debian.org/tracker/CVE-2025-70968  
                  libfreeimage | CVE-2025-65803   | https://security-tracker.debian.org/tracker/CVE-2025-65803  
                     libgcrypt | CVE-2026-41989   | https://security-tracker.debian.org/tracker/CVE-2026-41989  
                      libglib2 | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
                      libglib2 | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
                      libglib2 | CVE-2025-14087   | https://security-tracker.debian.org/tracker/CVE-2025-14087  
                      libglib2 | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
            libglib2-bootstrap | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
            libglib2-bootstrap | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
            libglib2-bootstrap | CVE-2025-14087   | https://security-tracker.debian.org/tracker/CVE-2025-14087  
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                      libinput | CVE-2026-50292   | https://security-tracker.debian.org/tracker/CVE-2026-50292  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mbedtls | CVE-2025-66442   | https://security-tracker.debian.org/tracker/CVE-2025-66442  
                        mesa3d | CVE-2026-40393   | https://security-tracker.debian.org/tracker/CVE-2026-40393  
                mesa3d-headers | CVE-2026-40393   | https://security-tracker.debian.org/tracker/CVE-2026-40393  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                      mongoose | CVE-2025-51495   | https://security-tracker.debian.org/tracker/CVE-2025-51495  
                      mongoose | CVE-2026-6986    | https://security-tracker.debian.org/tracker/CVE-2026-6986   
                      mongoose | CVE-2026-6985    | https://security-tracker.debian.org/tracker/CVE-2026-6985   
                      mongoose | CVE-2026-2966    | https://security-tracker.debian.org/tracker/CVE-2026-2966   
                      mongoose | CVE-2026-2967    | https://security-tracker.debian.org/tracker/CVE-2026-2967   
                      mongoose | CVE-2026-2968    | https://security-tracker.debian.org/tracker/CVE-2026-2968   
                      mongoose | CVE-2026-5244    | https://security-tracker.debian.org/tracker/CVE-2026-5244   
                      mongoose | CVE-2026-5245    | https://security-tracker.debian.org/tracker/CVE-2026-5245   
                      mongoose | CVE-2026-5246    | https://security-tracker.debian.org/tracker/CVE-2026-5246   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                      protobuf | CVE-2026-0994    | https://security-tracker.debian.org/tracker/CVE-2026-0994   
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2025-69228   | https://security-tracker.debian.org/tracker/CVE-2025-69228  
                python-aiohttp | CVE-2025-69230   | https://security-tracker.debian.org/tracker/CVE-2025-69230  
                python-aiohttp | CVE-2025-69227   | https://security-tracker.debian.org/tracker/CVE-2025-69227  
                python-aiohttp | CVE-2025-69229   | https://security-tracker.debian.org/tracker/CVE-2025-69229  
                python-aiohttp | CVE-2025-69226   | https://security-tracker.debian.org/tracker/CVE-2025-69226  
                python-aiohttp | CVE-2025-69223   | https://security-tracker.debian.org/tracker/CVE-2025-69223  
                python-aiohttp | CVE-2025-69224   | https://security-tracker.debian.org/tracker/CVE-2025-69224  
                python-aiohttp | CVE-2025-69225   | https://security-tracker.debian.org/tracker/CVE-2025-69225  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-django | CVE-2026-5766    | https://security-tracker.debian.org/tracker/CVE-2026-5766   
                 python-django | CVE-2026-48587   | https://security-tracker.debian.org/tracker/CVE-2026-48587  
                 python-django | CVE-2026-6907    | https://security-tracker.debian.org/tracker/CVE-2026-6907   
                 python-django | CVE-2026-6873    | https://security-tracker.debian.org/tracker/CVE-2026-6873   
                 python-django | CVE-2026-8404    | https://security-tracker.debian.org/tracker/CVE-2026-8404   
                 python-django | CVE-2026-35193   | https://security-tracker.debian.org/tracker/CVE-2026-35193  
                 python-django | CVE-2026-35192   | https://security-tracker.debian.org/tracker/CVE-2026-35192  
                 python-django | CVE-2026-7666    | https://security-tracker.debian.org/tracker/CVE-2026-7666   
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-tornado | CVE-2026-35536   | https://security-tracker.debian.org/tracker/CVE-2026-35536  
                python-tornado | CVE-2026-31958   | https://security-tracker.debian.org/tracker/CVE-2026-31958  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
               python-werkzeug | CVE-2025-66221   | https://security-tracker.debian.org/tracker/CVE-2025-66221  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2025-13837   | https://security-tracker.debian.org/tracker/CVE-2025-13837  
                       python3 | CVE-2025-12781   | https://security-tracker.debian.org/tracker/CVE-2025-12781  
                       python3 | CVE-2025-13462   | https://security-tracker.debian.org/tracker/CVE-2025-13462  
                       python3 | CVE-2025-12084   | https://security-tracker.debian.org/tracker/CVE-2025-12084  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
                       python3 | CVE-2026-3644    | https://security-tracker.debian.org/tracker/CVE-2026-3644   
                       python3 | CVE-2026-4519    | https://security-tracker.debian.org/tracker/CVE-2026-4519   
                       python3 | CVE-2026-3087    | https://security-tracker.debian.org/tracker/CVE-2026-3087   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2025-54566   | https://security-tracker.debian.org/tracker/CVE-2025-54566  
                          qemu | CVE-2025-54567   | https://security-tracker.debian.org/tracker/CVE-2025-54567  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       qt6base | CVE-2025-5683    | https://security-tracker.debian.org/tracker/CVE-2025-5683   
                       quickjs | CVE-2025-69653   | https://security-tracker.debian.org/tracker/CVE-2025-69653  
                       quickjs | CVE-2025-69654   | https://security-tracker.debian.org/tracker/CVE-2025-69654  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                         redis | CVE-2026-23479   | https://security-tracker.debian.org/tracker/CVE-2026-23479  
                         redis | CVE-2026-25243   | https://security-tracker.debian.org/tracker/CVE-2026-25243  
                         redis | CVE-2026-23631   | https://security-tracker.debian.org/tracker/CVE-2026-23631  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sqlite | CVE-2026-11822   | https://security-tracker.debian.org/tracker/CVE-2026-11822  
                        sqlite | CVE-2026-11824   | https://security-tracker.debian.org/tracker/CVE-2026-11824  
                         squid | CVE-2026-33515   | https://security-tracker.debian.org/tracker/CVE-2026-33515  
                         squid | CVE-2026-33526   | https://security-tracker.debian.org/tracker/CVE-2026-33526  
                         squid | CVE-2026-32748   | https://security-tracker.debian.org/tracker/CVE-2026-32748  
                          sudo | CVE-2026-35535   | https://security-tracker.debian.org/tracker/CVE-2026-35535  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                      suricata | CVE-2026-22264   | https://security-tracker.debian.org/tracker/CVE-2026-22264  
                      suricata | CVE-2026-22259   | https://security-tracker.debian.org/tracker/CVE-2026-22259  
                      suricata | CVE-2026-22262   | https://security-tracker.debian.org/tracker/CVE-2026-22262  
                      suricata | CVE-2026-22258   | https://security-tracker.debian.org/tracker/CVE-2026-22258  
                      suricata | CVE-2026-22261   | https://security-tracker.debian.org/tracker/CVE-2026-22261  
                      suricata | CVE-2026-31932   | https://security-tracker.debian.org/tracker/CVE-2026-31932  
                      suricata | CVE-2026-31935   | https://security-tracker.debian.org/tracker/CVE-2026-31935  
                      suricata | CVE-2026-31937   | https://security-tracker.debian.org/tracker/CVE-2026-31937  
                      suricata | CVE-2026-31933   | https://security-tracker.debian.org/tracker/CVE-2026-31933  
                      swupdate | CVE-2026-28525   | https://security-tracker.debian.org/tracker/CVE-2026-28525  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40226   | https://security-tracker.debian.org/tracker/CVE-2026-40226  
                       systemd | CVE-2026-40225   | https://security-tracker.debian.org/tracker/CVE-2026-40225  
                       systemd | CVE-2026-29111   | https://security-tracker.debian.org/tracker/CVE-2026-29111  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                   uboot-tools | CVE-2024-42040   | https://security-tracker.debian.org/tracker/CVE-2024-42040  
                   uboot-tools | CVE-2024-57259   | https://security-tracker.debian.org/tracker/CVE-2024-57259  
                   uboot-tools | CVE-2024-57254   | https://security-tracker.debian.org/tracker/CVE-2024-57254  
                   uboot-tools | CVE-2024-57257   | https://security-tracker.debian.org/tracker/CVE-2024-57257  
                   uboot-tools | CVE-2024-57258   | https://security-tracker.debian.org/tracker/CVE-2024-57258  
                   uboot-tools | CVE-2024-57255   | https://security-tracker.debian.org/tracker/CVE-2024-57255  
                   uboot-tools | CVE-2024-57256   | https://security-tracker.debian.org/tracker/CVE-2024-57256  
                   uboot-tools | CVE-2026-33243   | https://security-tracker.debian.org/tracker/CVE-2026-33243  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
               util-linux-libs | CVE-2026-27456   | https://security-tracker.debian.org/tracker/CVE-2026-27456  
                           vim | CVE-2026-46483   | https://security-tracker.debian.org/tracker/CVE-2026-46483  
                           vim | CVE-2026-28419   | https://security-tracker.debian.org/tracker/CVE-2026-28419  
                           vim | CVE-2026-28422   | https://security-tracker.debian.org/tracker/CVE-2026-28422  
                           vim | CVE-2026-28418   | https://security-tracker.debian.org/tracker/CVE-2026-28418  
                           vim | CVE-2026-28421   | https://security-tracker.debian.org/tracker/CVE-2026-28421  
                           vim | CVE-2026-28420   | https://security-tracker.debian.org/tracker/CVE-2026-28420  
                           vim | CVE-2026-28417   | https://security-tracker.debian.org/tracker/CVE-2026-28417  
                           vim | CVE-2026-45130   | https://security-tracker.debian.org/tracker/CVE-2026-45130  
                           vim | CVE-2026-39881   | https://security-tracker.debian.org/tracker/CVE-2026-39881  
                           vim | CVE-2026-41411   | https://security-tracker.debian.org/tracker/CVE-2026-41411  
                           vim | CVE-2026-47162   | https://security-tracker.debian.org/tracker/CVE-2026-47162  
                           vim | CVE-2026-35177   | https://security-tracker.debian.org/tracker/CVE-2026-35177  
                           vim | CVE-2026-33412   | https://security-tracker.debian.org/tracker/CVE-2026-33412  
                           vim | CVE-2026-44656   | https://security-tracker.debian.org/tracker/CVE-2026-44656  
                           vim | CVE-2026-34982   | https://security-tracker.debian.org/tracker/CVE-2026-34982  
                           vim | CVE-2026-42307   | https://security-tracker.debian.org/tracker/CVE-2026-42307  
                           vim | CVE-2026-34714   | https://security-tracker.debian.org/tracker/CVE-2026-34714  
                     wireshark | CVE-2026-0962    | https://security-tracker.debian.org/tracker/CVE-2026-0962   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

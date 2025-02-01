Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1236C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 04:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4CB742874;
	Sat,  1 Feb 2025 04:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZe4J1S8CkFz; Sat,  1 Feb 2025 04:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EC5B427C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EC5B427C9;
	Sat,  1 Feb 2025 04:14:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB24461
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 04:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9CBB427C1
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 04:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbnU-WFJo-cg for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 04:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C96AF427BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96AF427BC
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C96AF427BC
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 04:14:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab70043cd05so277882266b.0
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 20:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738383283; x=1738988083;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/m/AHsCxbOv90DDPEd6tLvIQGFSoFoK83PfAfA95URg=;
 b=UyqgS7G7RXW9r6XUGXhQJMN0LuFUIn599njo+pV4ffl3/RHc8yz2YZZtA5O076JNTY
 NvhiIiNgTp4QJyDZKA3NOL0Ahu5f1UwxBpKxd0IioiAFRJLbSeTf0FlAqtT5aQmyNntC
 mdo0Z/KeZlSZpRaUSC9e18ChXtGwRh9Ao6BBMRBJRZMYjBMvA0B6wLX7XZfxInXbyspm
 4+8S2GbtLrUCcpD+lGIWL2U4dKsARA2hIydQPtgk3NnQzNJxZk53zj1Jl0Mhh4ixlaMu
 IvPiXd7KmN9vqnN3Ikumc80YdG6PbOY6bEa4iEmPHPi+fW7NlFES7odZy6dAs5STXk1K
 sFsQ==
X-Gm-Message-State: AOJu0YxG0HSplr06g5aWnndMS2vKygLAO34pfFam11gunvLm+V9Vc5Iv
 tKn+1v8ejs/XAf68Y/Mz943qwx6fZO+6AhD9vNTL5An5H0KQKk1mAc6SYw==
X-Gm-Gg: ASbGncsAxXtg52mvv8iQ+noFZ02P4MYJKtVGH5l+pWO7ZKhf6HSmdspqHRsqyl1KbvG
 RRcYunZF/3KLhsnWejE6d5otiKAJXBzebL0RSFQJQq9zU0ufYrDMmjlOHujLD0Ved/9UHKYVzQW
 Fn8pscEm7OKi1zBMq84y8e+i56DJFckT0UlQ+48Sizys0axK3CqrWOkli+bdtWLhWkj746YcvVt
 wu3t8eRBf1tGzzZ8rZ7qb/YrvQbqW1PBDKTjcJf1NlAhrB++7a29jmvjWON4XxPXRQT//1kFreY
 W72wA4VDQiD4pKfiumI=
X-Google-Smtp-Source: AGHT+IEXyI+qoUhYVFIhuljbh0OjAO3NjYb8DjNrclG+fGB42S19lLrv+yYVWiaolvzTTKXBFcWvww==
X-Received: by 2002:a17:907:971b:b0:ab6:597a:f5ee with SMTP id
 a640c23a62f3a-ab6cfcc5099mr1491574366b.12.1738383282372; 
 Fri, 31 Jan 2025 20:14:42 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ffe44sm387025366b.113.2025.01.31.20.14.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 20:14:42 -0800 (PST)
Message-ID: <679d9fb2.170a0220.a5e50.e0da@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 01 Feb 2025 04:14:41 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738383283; x=1738988083; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/m/AHsCxbOv90DDPEd6tLvIQGFSoFoK83PfAfA95URg=;
 b=Ou3pVXbBj7agLf+vRai4GKrruE2LBLKgBm5JP/PSwhTT5lLc6rXGJA61Es5NVmijaq
 JPm2lQqIEITASpuH0xqmtDcmtgCI1aY8gvOVHP0MQOgLM9rWp/y684olS4z8sKYz1V1T
 nIfHENeQmkmuBvTi6cb2k4Utb0p9MDQEt9dbUK59e0c3Q1eIkjyRNpsqvOtzz/4Qyfmr
 w92MV0WcAdtgdES0WF2mzxx45jhmSuPbrwEVzVzU2qOA7FMbt9CELc4BdAn8DKoUXX8l
 MMzgE/enUWlEtBfiiwyg6Tk7AMIlByQJtjLVUV1ua+kDpAkUTc1SVunCSoC0cQYKnNfo
 i4XQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ou3pVXbB
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-31
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

Autobuild statistics for 2025-01-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  3  |  0  |  7  |
  2024.11.x  |  2  |  2  |  1  |  5  |
    master   | 18  | 227 |  0  | 245 |

Classification of failures by reason for master
-----------------------------------------------

libbroadvoice-f65b0f50c8c76... | 10
                  ffmpeg-6.1.2 | 9 
  gobject-introspection-1.76.1 | 9 
                 linux-6.12.11 | 7 
                  ntp-4.2.8p18 | 7 
             util-linux-2.40.2 | 7 
            gstreamer1-1.22.12 | 6 
                       unknown | 6 
                  bcusdk-0.0.5 | 5 
                   bird-2.15.1 | 5 
                latencytop-0.5 | 5 
          linux-5.10.162-cip24 | 5 
                   linux-tools | 5 
     bandwidthd-2.0.1-auto-r11 | 4 
                   perl-5.40.0 | 4 
           at-spi2-core-2.50.0 | 3 
          cloudflared-2025.1.0 | 3 
host-heimdal-f4faaeaba371ff... | 3 
              libopenssl-3.4.0 | 3 
                 libv4l-1.28.1 | 3 
                  libva-2.22.0 | 3 
               procps-ng-4.0.5 | 3 
                    azmq-1.0.3 | 2 
  binutils-arc-2023.09-release | 2 
                 c-ares-1.34.2 | 2 
                 coreutils-9.5 | 2 
                   crun-1.18.2 | 2 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
                   eza-0.18.24 | 2 
                   foot-1.16.2 | 2 
            gdk-pixbuf-2.42.12 | 2 
               graphene-1.10.8 | 2 
              host-rust-1.82.0 | 2 
 host-softether-4.30-9700-beta | 2 
                libesmtp-1.1.0 | 2 
libg7221-dbfc29d4806ecdace5... | 2 
libsilk-4268a02240c35c6055b... | 2 
               libunwind-1.8.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               mariadb-10.11.6 | 2 
                 openssh-9.9p1 | 2 
                   pcre2-10.43 | 2 
                pipewire-1.2.7 | 2 
               pulseaudio-17.0 | 2 
         python-remi-2022.7.27 | 2 
          sphinxbase-5prealpha | 2 
               valgrind-3.23.0 | 2 
                     ace-7.1.1 | 1 
               acpica-20241212 | 1 
                  assimp-5.3.1 | 1 
             batman-adv-2024.4 | 1 
             bluez5_utils-5.79 | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
                   bullet-3.25 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
             cni-plugins-1.3.0 | 1 
               collectd-5.12.0 | 1 
             connman-gtk-1.1.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
           crucible-2023.11.02 | 1 
                 dc3dd-7.2.641 | 1 
               dvbsnoop-1.4.50 | 1 
                elfutils-0.189 | 1 
                 enchant-2.3.3 | 1 
                 erlang-26.0.2 | 1 
                espflash-3.2.0 | 1 
                 expect-5.45.4 | 1 
firmware-utils-86739f2b3ae9... | 1 
              fmlib-LSDK-21.08 | 1 
             fontconfig-2.16.0 | 1 
fs/ext2/ext2.mk:66: /home/b... | 1 
                   fwupd-2.0.4 | 1 
                 gerbera-2.4.1 | 1 
            gettext-gnu-0.22.4 | 1 
                     gsl-2.7.1 | 1 
               harfbuzz-10.0.1 | 1 
    host-python-greenlet-3.1.1 | 1 
               host-swig-4.1.1 | 1 
imx-lib-3f777974c0c146817e2... | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
             libapparmor-3.1.7 | 1 
             libargtable2-2.13 | 1 
                 libcdio-2.1.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libdrm-2.4.124 | 1 
                libglvnd-1.4.0 | 1 
             libopenh264-2.4.1 | 1 
                 libpng-1.6.44 | 1 
                  libsepol-3.7 | 1 
           libzenoh-pico-1.1.0 | 1 
       matchbox-keyboard-0.1.1 | 1 
           mediastreamer-4.4.8 | 1 
                 mesa3d-24.0.9 | 1 
                    mpir-3.0.0 | 1 
                  nginx-1.26.2 | 1 
           oath-toolkit-2.6.12 | 1 
                 openal-1.22.0 | 1 
               postgresql-17.2 | 1 
            python-evdev-1.8.0 | 1 
        python-selenium-4.27.1 | 1 
rtl8189fs-9a82349c2c40515f9... | 1 
squeezelite-71c012ad9ba102f... | 1 
                    sslh-2.0.1 | 1 
                tpm2-tss-3.2.2 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/d111052d8da68db72ff31a2e81d6fc159a79e165 | ORPH
powerpc64le  |        acpica-20241212         | NOK | https://autobuild.buildroot.org/results/5dff5a7468b8986b231600189ea070db4faae40f | ORPH
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/8d0c03726a0f73a30a6858e1c0c4ab66c5a65ead | ORPH
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/ef2ead19af6452ebf8cabf3d3337748346ca9f58 |     
   armeb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/98093846cca20c62b6dac2f61dce9cca72c7ca28 |     
   mips64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b7ff9236265dd91f8686fcabd3047db451f74db9 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/a4f6e490940577b0eb5f58c60f4052cf9760f5b5 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/82b448bed02ac146d5b1315065c0d622a3c23f2e |     
  powerpc    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/7ce7ae13b3826827b3c5518940af451dfbf5e19a |     
   armeb     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/4fd3769a2083c60c5e73aee6588c9bb497e64f81 |     
   xtensa    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/4fa2ccf42f93a99c341e657c65262ceb77df9567 |     
microblazeel |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/4f32664fed819ffa8884436f92feadfe2f7cb85a |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/edaef1c664e05f2d5adce229c909631bd1a0932c |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8d072cb1ea890d9c410ce02738ff63c991f1f696 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/0e28d11bd388a8d79699ca29f80a378676d6e772 |     
  powerpc    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f780bcf23c9d91fecc820cfa30c6c367444e0d58 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/e0c7aae9951f74ecad7a9a10afbe0ea8a1cb1244 |     
   sh4aeb    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/092b50579e36efff10962e1ef99a162a60ed1bc2 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/7c51684328b8c02d62b61a0014649f59a1689f35 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/a96938c4b50338f9cd85c948ac185db879ea5db3 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/e227e9e3467e591c83b1f2548bb276a8c2de7d03 |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/58444b7655c3a2d9f33070925ee9c6a701d60e49 |     
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/fddaf9a52091068b37a55ab170a09fb9d5787657 |     
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1a4b5e6f81366c3fc52fefe971817078662510d6 |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/81bc768c851e544a7c0eb04ef410eb908ac403ef |     
  sparc64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/fb331b52aacf07285b174061f1ccd337ad4fbb52 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/117544431bdc99e31fb9917b81e59911015f0fd8 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/13470d2a4815a8d9913d172695a7770a3c8fc61a |     
   arceb     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/6cd82bceba4aa43633d9d14cddcd61796b8297f7 |     
    i686     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/ab999ba1d89a23bcb449f57e5ccd26561f0c968c | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/3c3e8fdd6a0e37f79f218382476be4f93ce8fb9e | ORPH
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/6d2d81c2d94efdfea159d68e8439203250f64be3 | ORPH
   s390x     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/56631bd8bc763b452140fed3b351c31609dcfd6a |     
   x86_64    |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/5faa6efa7684f8a490cfd0726c8919688997b528 |     
   s390x     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/d729510b8597a2e182767519a24e7268a74e8a12 |     
   s390x     |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/92b0d7b6147be2389ab324895ee75c9480e1e390 |     
    arc      |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/3dad689b5dfa1cc57764e22154d4d38d1236a1bc | ORPH
   mipsel    |       connman-gtk-1.1.1        | NOK | https://autobuild.buildroot.org/results/54d8cc10e4d017deabf8664898a2d09e3a115f66 | ORPH
    sh4a     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/3b8f08c6cae19a90ef0a03b1bc8b18ab19bcf0fe | ORPH
  powerpc    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/733943959528275be1776a4d0dbf903d62834ba3 | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/e7e6a4516d8a8b4ce370a3a29402091540a661a7 |     
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/13a741af9d0b249a02a679a70c768610112c96fc |     
   s390x     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/a304a0b6fd2ffac411c716266a47aa4c0121fd6c |     
 aarch64_be  |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/21a011d832d0f27bf1ce9b772b53bca0e8eb2daf |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b77944250052381584539e2e04a529d3377e64e6 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cba9a0efc700de2cc8dfe7393531a2c7d8939db6 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6c038cf0f36a6236c9cea6d63d29ae8a37eee588 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/54433100712835f1c51cbabe90526aaf1658815f | ORPH
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/9f3fefe5578dc41272e460146b566ac20f6cde75 | ORPH
   mips64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/37204a3a51b2cf1a7430fdb4b44ca9b9172ace25 |     
  powerpc    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/daf40a3e7f067fbc7e6008eb2845bc730880a52b | ORPH
   s390x     |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/cce308668b35f3c6f4828a92a6d3d65d723fd0d8 |     
   mipsel    |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/3804d5a7f79d1399cda2f9761a75447d1c9abcbd |     
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/a49bb77ece5710fddef2f69ae70186985350289e |     
powerpc64le  |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/f1c34d4188c7338a0df4106bee7db11d01a4f7ee | ORPH
  aarch64    |          eza-0.18.24           | NOK | https://autobuild.buildroot.org/results/a6a2406641e6a1d9106aac57b08580588224cc03 |     
  sparc64    |          eza-0.18.24           | NOK | https://autobuild.buildroot.org/results/1452aa16f32767e8c7cb82cdd34fcfc455f2acbf |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d60ceac52578e90e82e2eb3b49818dcee16fe08f |     
   s390x     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a09540fb2078cc25bac8019fe798536a5318e367 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/33eba1d19843dbbe90bdf40008bcaa09009ca775 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/6eb420a8c5896f154f5ade82a40fc3f8d3666c67 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0cd9d98b9370e370c70c41181ac45e9b7f24fbca |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f07b87d758df03efa776f5f088a60aa85d088cbc |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8ece375fe1f6d04d9df7e70ea7501514e57b997e |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b71b5ee6f09f91a5bb21b6abf9f2524119c1b5cd |     
  sparc64    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3824e75a0873df3ba6604beb2e7bf997ecd71eac |     
    or1k     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/a3dc7ba04754b2235c40f86807792a8821495c83 |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/6cf5965c515ae55c5ca91c49f46fbb3b9a21c969 | ORPH
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/d8fbecfd75d814b2b4331993b3cff81d859b70e9 | ORPH
   mipsel    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/946cc9b1e35cba06b2728818941632bb8338f3d6 |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/0242a7ce95e1168acb13dd63ef282f51d54419ed |     
 powerpc64   | fs/ext2/ext2.mk:66: /home/b... | NOK | https://autobuild.buildroot.org/results/9a7bc2eb1a1bd69464989e7736b08e9d4046c380 |     
   s390x     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/3e674997bf111debd569b526ce64c93c118b80a3 |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d53f752b90e601d4d02811030e0a45d55c4e48b4 | ORPH
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f3b9e9435a970f1ca6dd279d1ba293cb593ab15f | ORPH
   mips64    |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/56babd49ab11779a8514dc472f536170990be216 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/99bcedb52dbde77420980b4c23ee7c4449d4fc56 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/33b532f3c11738ce2eb2ec77a386cd72c156104b | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8a738865ce5475cbf4fce4ea25888ac7d364094f | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/84163719839efcff1784d7f2ea2c58de8d316803 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8a5cafad34e82c74a4852675159694fd92d84188 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/70139dc5dd2627655208daa5f888851daf75f6c2 | ORPH
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/272eea7bc5f0e6a9848bd5c3c59faa4b2ac065d7 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/cc367889fa6e684458d062128846d01908befae4 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ba6d26d301e241be9652d3b3d1de1705d96eb501 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6f212a76c80077a8998661e9d8e44d417f9d0dbb | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/6041b3d1026a2646b040c4de8c147597f2cb9d8a |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9bb09619a564e13b0cab371aaa7daba3870a08e4 |     
 powerpc64   |           gsl-2.7.1            | NOK | https://autobuild.buildroot.org/results/1229638bc6e4eaf0d34920e4c450d40d7959c394 | ORPH
  aarch64    |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/b0066943332e611eee0abbbf3103572a5db36fab | ORPH
    m68k     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/895f4ff58744088d891125ae883c3dd786cb116b | ORPH
   s390x     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/a217cd1a6aa9db134849a6de4b16fb48ef3de435 | ORPH
   s390x     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/66907281c820d709ec9a657e109fe0576f2fa806 | ORPH
powerpc64le  |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/dc3191fee11efadb132de0d3aaef7606ef7ec81e | ORPH
    arm      |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/78c5cbd250ecf9fbd4b60b8ce568ae66ec919574 | ORPH
   mipsel    |        harfbuzz-10.0.1         | NOK | https://autobuild.buildroot.org/results/d0e00f7f99f2c4f7c4d52101f41ab07abc0e0a97 |     
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/86b1b760d55b3c03bc85faf5f547ce4ea04403c2 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/6a2c388c81fece89f028988141309f2a18979926 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/8979bb259f346de3a028b1cc40f6c7601d4dbbd7 | ORPH
    arc      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/85c476e231c706b300642bf7c9a0cd06ae040783 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/36d4fed438de16abe7afeeb4fa80fb68ea31b8cb |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/11e42f9e02932aac4a5e599f6b7780a0a0de59b2 |     
    mips     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/1f23d92822ba0f2128f8cb0f470d0f4519d411f8 | ORPH
   armeb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/dbb1cd3148d00309f8c0c090957a1519a437bea9 | ORPH
    mips     |        host-swig-4.1.1         | NOK | https://autobuild.buildroot.org/results/3c135b2e059c58a52522076a2787c629c3548b2f |     
    arm      | imx-lib-3f777974c0c146817e2... | NOK | https://autobuild.buildroot.org/results/353f320fd95c9d4481e4b4e07c98d9774f89722a |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/324c872e09792d2b847da159b0119e920314f468 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/047ac0c97aa862d27798cb89afdaee9c44c23536 |     
powerpc64le  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/b31a3c5a602bb1e5bf9b327aa8be5ec508da9ebc | ORPH
 microblaze  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/6c9563eae027148059b00c913e4a493369c27cef | ORPH
 powerpc64   |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/420569df7b1ce799c10f38393d70e4228c526447 | ORPH
microblazeel |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/81200815fb24673693bd82dbc416f5c7ca1c2826 | ORPH
    sh4      |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/47267bfb0289a9de7df72bb6b909dd5a4337d535 | ORPH
  aarch64    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/e1619107ab8adcf529ffa368c90c7de8cb01b211 |     
   sparc     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/04993f7cf931b351165422684817cf0bc7a9476c | ORPH
  mips64el   | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/6d66f1d9ff71b9d456fecc217917920d3fdb849a |     
   armeb     | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/0a4f96fc26eb82ac617aeb9924547db029c579b2 |     
   mips64    | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/0e291493827eca05736937a9a181161095b6ea49 |     
  mips64el   | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/d55f969762f4642c7b32eb5990a9c7affe5a0086 |     
  mips64el   | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/f128ce378897bc2a21eb56aba956fdb18063f4bc |     
   mips64    | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/24964d8636d85722c8f2e657fbb21c590c6b4b2e |     
   xtensa    | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/ee742de6831d86c0d8489a0d2960f53949aa6f32 |     
 powerpc64   | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/63363b11502ca7a060d709dd6576d91bf7640faf |     
 powerpc64   | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/eb78caa0fdc9343534ee5f04d398d9750331641a |     
  mips64el   | libbroadvoice-f65b0f50c8c76... | NOK | https://autobuild.buildroot.org/results/e97a90ba50664b6ad0e2ff92cf59a4a2b5f142d3 |     
   armeb     |         libcdio-2.1.0          | NOK | https://autobuild.buildroot.org/results/b41295d34b01bb35efe91481621a0a783f6cac53 |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/bc6b752a221b48c03de7de1b2ad8fa81f6aac31a |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/fd59a5d84766129a2d52984e03f5326b46cf97e8 |     
    mips     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/c06b4f0eb88cf72b834f930719deb3bd22dc899b | ORPH
   x86_64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/c1e5b0a019827f4d393957fbad2f2875f3de3b0c | ORPH
   armeb     | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/8c63b98868d347a0788656cf5071c4eba8e88589 |     
   xtensa    | libg7221-dbfc29d4806ecdace5... | NOK | https://autobuild.buildroot.org/results/a8e7ebfae886550527c5310c0737e51fd73054f2 |     
   armeb     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/ed236056a4253e5cf4b39859f250c0d0e86b861b | ORPH
    i686     |       libopenh264-2.4.1        | NOK | https://autobuild.buildroot.org/results/63bb360ac06a2b2f47c8658b0a5513b5de824320 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/983fe7c559a7890222a55ecd5e415bd20aca6a3a | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a8cc536a6cf278d1d0af9287a83b199f6aa06493 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/b59c9f997fcc26c1236879a344ff66600fdf969d | ORPH
 aarch64_be  |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/c18856f6d076e5bc037d22e47529a89d9bbde054 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/b17e1e1b87763199871ed622a667306921c6b576 |     
   armeb     | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/e1e5f1b9f8902e94d9cd519f5a7cd3916ef90277 |     
    arc      | libsilk-4268a02240c35c6055b... | NOK | https://autobuild.buildroot.org/results/5f2af59d0bfc617ed5a749099b26f7819053a7fb |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/f6b6f87bbe91989e73d99a6a05fcd625f1ccb835 | ORPH
  powerpc    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/94eb6b7a16bb451b4eaa5cbf817da1fb3555da8e | ORPH
   sh4aeb    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/6fb05ea4fd832df7aeffad6756b76311ab9e9f98 |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/81dfad24e96f23baf582b4049819a65ed1453a12 |     
    sh4      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/ef75ead09b08a8aa285f1bc1a90d31a3436ed67b |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/d8998730a6b9e3a8c61445df3fd5c4b5032f3680 |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2cc3bbedc05964a45fd3a9c9b93bd7d7e58250af |     
   arceb     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/571d1e8d382342d8874c9799952bad0df3e80cc3 |     
    arc      |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/dd7c1ad38de077d54f0c3561a711d87674b4e9c5 |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/da141ddaf297b2bb711e244d31ef6097f097897d | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/70801c63e92ba7e5af4073418b84d53c71cf9877 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/97e359767458e4219a5fb87b9440a996b7e3fc60 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b372aedff9588794cde6b34d2283aa9b1955c4d8 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/39408ce28e4ee7aaf28082a3b214f1c08dad4b8b | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d583431831d9096aecc97b110963b89e27f3c0df | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/693899d995d67ecb8cf5593e382c329296bf65fa | ORPH
  powerpc    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/5eb68053fe777bc04cea20581680b30dba5b0c8e | ORPH
    i686     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/9bef66d206f23e26d02847c9286199562c93b02c | ORPH
   x86_64    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/0f45572c2045d5e027d8381a35d8e01c31c2df3f | ORPH
    i686     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/0d314e6ad95a324f11dcc8dc97bec9385d4f3852 | ORPH
 powerpc64   |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/05b7e18d9c0b342699e1470e03aba559fa07f38d | ORPH
    m68k     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/ee08450754d213fcf1795f703254b95c6442deb4 | ORPH
    i686     |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/47e416012f1520576ea8cf84e76d3944af528593 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/cbba9436b5c0f11ab8e814605a09882f3a6c322c | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e943427800f29598a7e354539b4ba7405a1cea5b | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/379ea8304ade1bf49a49f111c30307a944cdb256 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/08bfb2fa69b4af6fb43521bff3fbeb13b0e05974 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/893e7da0bf560d84181f8fe7737560085241445c | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/075a0dee4192c74a741c0721fc5cb7baf771fc69 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e7eca1993240a875cd3574f463c31d59891febfe | ORPH
powerpc64le  |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/dbc6910c5762b34524df20fe2a56719c5003e760 | ORPH
 microblaze  |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/c88a8897766b4def4cd52bce3c2d168a3c460928 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/893c118bca6e6d07a3fedeb0a322632d04ce1f25 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ef797d77328f7d9411659ac75ede31668d7fdc8b |     
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/e02869eed28ca395d51a5bc6e99825f7addf4cbe | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c3f8880fca27cab45179f38a2b87c777d0775907 |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6398035081c2a149b72dd198e9f33dbb2fd964b4 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b634b62b2ab1771e2e634ab3e24c597e7b47bc3a |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/231a43fc52adedc0a354a664295ea8beabe5e8d1 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/17a59103aaf1b84e1f667da9bc67625035d63292 |     
    mips     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ca70f20b9e85c351421a5b780bfc83ae36246ae2 |     
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/375f67c59a81fb14eb7e06736fa025e898830ccc |     
    arm      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c61f6b2f8cb8312ab9a7ea9324ffeb6a37d4f57a |     
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/5209ba492bfae2c0aae4c965426f90425cbbf487 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/efdb8a1fa6dc2eb92d18e21e489a9536b7fec50a | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/5b435131a506f1b01fa8bba9ecd459b5c172810a | ORPH
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/9231c4cd6dd82b76f267f5aa1e805f21b8348e01 | ORPH
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/cc53fde2c4dbc9a373e0512846173ebdee8638d4 | ORPH
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/504461384dbecefeabe5cec256bdd50bd615ef00 |     
    or1k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9a564e7837f796eb6c8e2f5c479bf1b58dfb7359 |     
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/7adf28b463af70704c2a9d0e708c1cae47ff11a5 |     
    m68k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/4264e28244fab7ddd6399c01a3d8832522ba4ac4 |     
   sparc     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/711a46a6c6581096fa52ec78049c0215d6016501 |     
    mips     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/499f871d40009462eb3330f6416c2c88412d1601 |     
   x86_64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/55f27ec6725751c749398589dfe969a01b1902fe |     
 microblaze  |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/767641380060a6fd599fe3a298e57c23505a4c71 | ORPH
   mipsel    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/d9ce067ba1c6fd384a2795ed14be3911058e5b2a | ORPH
    i686     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/ffe1ac47cda6e8b571e6f214f7d7535c34363085 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/8a24d04ee42905f9687085b01f7119ebfc613e61 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4b48fd53c244dac57d86d8f9c78c76b236f9352f | ORPH
  mips64el   |       python-evdev-1.8.0       | NOK | https://autobuild.buildroot.org/results/55d60df47edd50c6ba20e13f2f3ce750fd5d9bc8 |     
   mipsel    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/9df7bc974d21d9f9ed2036dc0ba1cafed571181c |     
  sparc64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/b8573bb75c09856007a8ffffaf82a20c2e158792 |     
  sparc64    |     python-selenium-4.27.1     | NOK | https://autobuild.buildroot.org/results/66d66f3c6fc5186776721a9f4899a297a6448f1c |     
 powerpc64   | rtl8189fs-9a82349c2c40515f9... | NOK | https://autobuild.buildroot.org/results/69a3d03c7e4e131199975c6c6aa49b04a9623dcc |     
   armeb     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/cccf9e4315a15ae0260b0b10372e3b34874e94ad |     
 microblaze  |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/633a390e08536d918ba4379bf44df64288fd180b |     
    m68k     | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/5abe6e504d743c5742573c3fac5213238fd009d3 |     
    sh4      |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/85676cd9123c1f227eeeeb2c06c6b8e6230b3985 | ORPH
powerpc64le  |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/61bff56aab9e6ebe008031e718a5f58142d24f7f | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/a891aecd626b8123b66a46ebb7c8750164eb1337 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/412b3627680f1dfa4e0cd2facf14ea0efc3255f0 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/460a11a3ebc8b0ca89af8ff495e93d7f3dd74af9 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/29bbc63c2dda7141fa44f5053ce439f50d0ba28a |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/982b4aa60445fe108e0131e89f5129a6bcf46246 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/057096bffecffb278f692b61c758ad09ae6f141f |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d4f443f4ba2fb833b6ec489de11041fa8b02c05b | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2dbfc12a45f5035b7e7df4d48aa913ca5d0340be | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/44602ac2287aadc5c68efb3793b14bb48942f99b | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/959fe2366f7567ee14ded602aedc3e0a5d7682f0 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bf3e62c976d7b3da0d8d10b17bb2178858272e87 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0c0932de90518d4cf85861948c1bb249dd13e27f | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f49600aba922d13264a9463d30b83c49832c5945 | ORPH
  mips64el   |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/242a3966b47a7e4f5feef69e249847fa84b19ac3 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/8f313e877e6d1a2affca302cbd46c325ee2cb840 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/d4d9e9081d58e052c32d85042906d0c205111d32 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4d35aa034115331f205d8799c06cd6c46a28f668 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/aa0c989b711815deff1833285dcd8a7a9d7fd6e8 | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/f2f14f4996a1994545ea5c26d4dd06ba85df1ddf |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
                  host-qt6base | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/a0af365c5b85e135967b3042b452357d6c828bed |     
  aarch64    |          host-qt6base          | TIM | https://autobuild.buildroot.org/results/785d0f94e974f1dcd1df8b3b8ebc3351c66d7338 |     
  riscv32    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/25af3ee1040fbc7c59c8f0c9023a95b051d48592 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

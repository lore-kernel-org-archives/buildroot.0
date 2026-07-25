Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DA8C531D0
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 03:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C132560AF4;
	Sat, 25 Jul 2026 03:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RknKE2MQnvLA; Sat, 25 Jul 2026 03:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BB7460B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784949916;
	bh=FJ0/LwgHO6UYX+Sf3R6NGnedfhyOBsCRtVRPN81W2Dk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=As2eqpNQAyJcWsQnJymLD04LReHMWCTdSz8knsAVX78VNUzjsrSvbxwFkgXnjFYVT
	 b0tCd/1GT6o6iu1T/NkTyHreSazx9STrrgxPwPFFcyZ3jI1CG2MXg6ikvZmqR94liI
	 VawocorfTQ+jYnZT9A3HpBvC+lxjEf8xhMnGaxgN8XR+ES9/eJ7AL7hbaA8hLY+Y2T
	 N9e+HLQU6wmMC/dZke5WYABVP2H/hhDYzGDoC8scfPjt5GN5d8aSV2vOib4sjiTZXF
	 fA+mG12IuVxr3KPnYLpbi+bZMjyhb3OsG2ZeuEBg5fY2S5kcA0ivjv7zCVr17WLdQV
	 8tf5RhSG5suJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BB7460B01;
	Sat, 25 Jul 2026 03:25:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0655C3B1
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 03:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E036A811DE
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 03:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coXDOngMyFz5 for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 03:25:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 752CC80D8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 752CC80D8F
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 752CC80D8F
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 03:25:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-495590dde14so11194275e9.0
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 20:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784949910; x=1785554710;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=yyAwrRXVZSSAtfaGEzhUQVcum1T4Gi3PH6wwG+b60Yc=;
 b=GaPrDHUONXDhgMLhbK88ypPKrXhvM/Eghj5LE7HOrsPEvNTZzUPSsa8t3CENHFxNKP
 cWl95iJOZxtyUDDle7yvX4QqPb4JXGT0nEp7FN3Y2bjf6e/hUwt92Yzk5MH+3iHYs3QX
 P9akUIlhZ9W15DscNDS0JRQjawSf5hN5R4ineGxFtiUjzs8JMK4bAYkN1jajQbmyRsi4
 vDf565xbyY6z3JPQ8jVFrInNAtL/7IwID/LrJ0aY0TZutpMJhKluTK5tJMjRIFCliXU6
 LsSgBdW7vaiRXL7OuT167xMFTJtZfTebDEQhNA1z4yxR3UpFg/gLu6ZlDNUXNLe0Fpr1
 TQsg==
X-Gm-Message-State: AOJu0Ywn0N6u2EClZsZMaTLQzS2oVkMzLhDG/5KeJnE/yFQCqkz/fg+H
 z7qyYWdn72wbPmLKh/zOx7DQ0lJ+WpZYUaSlYLZKYLq5LWGaI8vAoKsLAeBJ0wlL
X-Gm-Gg: AR+sD114lDWHziOPDEmJlPapL9C9TvQHbYaQgBselP4BAaXInwlVeRuNcuoouysDaJI
 PYm3c9EhqcUoCfk+LYcaA/j8wEEWPC7Yy+g/vd+VdJkeV3xpNVMeq4uaHMRef6NynqpIie5O0hC
 8SbwYZ71UEWW7+M8t2TtOGW5MsOQV2btYlQ+sRkuOme6yX4FoRMV4Go7vDR4niWABhFxbZQjCYY
 fhdtUPO2r/Qa3RZcEg5vHYysoRoUIPEDeZ+TAnadCrcnjaWeP2N6ALAvNqpPuU8b0ZNETHF0Fp7
 UsvI50F/28r91xSC6h7e7PD4/yFGvvJBJOHdWF0NKNHFlLP7VRxqitqh1HdwtegAWDBQaEAbv9W
 zesePmH1nAsoVBsLZHX7aUxlLhB55b+QjltTf2mpEXVpgHM9ncLZbjTVRCVSRzuP89zZXelvDS2
 A7u0cf
X-Received: by 2002:a05:6000:2403:b0:478:77c1:787c with SMTP id
 ffacd0b85a97d-47f9fea7e10mr729966f8f.56.1784949909864; 
 Fri, 24 Jul 2026 20:25:09 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a60asm29393689f8f.3.2026.07.24.20.25.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 20:25:09 -0700 (PDT)
Message-ID: <6a642c95.3c943127.33051c.b411@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 25 Jul 2026 03:25:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784949910; x=1785554710; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yyAwrRXVZSSAtfaGEzhUQVcum1T4Gi3PH6wwG+b60Yc=;
 b=rolRYp+a3gonMneqaK8nUFjKspNl1BmCeJYJHkcLz/KBCgrSzle4eIRe698VVyeGS9
 pxjPm9eVoqKmRqGFbuq2BcOfisjl1A47/94WkaUriH8r7NPyxK9TJtrzpeiPoa2eAgNi
 QtR6JiC4TvUftQWeQJN7P0hCzYlr2+9X9OhLt2jbZ4LLRfcvFjpYgwPqJZJ2jLBmlpfL
 dNvkCjJREHbA8XvH/brkRUBYJIagVIt+JOiU9R3BiBZL/F5srFPWgOm8TFEUgvh3kEB7
 8+pMHXct+jKSNxEFr3u2+BbmwiIev0RIWjfvTNPmsWbPxlmOnEN3R6bsBhpu5OGTCyCt
 FrGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rolRYp+a
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-24
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

Autobuild statistics for 2026-07-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  7  |  0  |  8  |
  2026.02.x  |  1  |  1  |  0  |  2  |
    master   | 43  | 185 |  0  | 228 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 20
               host-dracut-111 | 7 
                   perl-5.42.2 | 5 
                       unknown | 5 
            gdk-pixbuf-2.42.12 | 4 
                host-odb-2.4.0 | 4 
                   linux-7.1.4 | 4 
               linux-pam-1.7.2 | 4 
             alsa-lib-1.2.16.1 | 3 
                  bcusdk-0.0.5 | 3 
                   ccrypt-1.11 | 3 
        edk2-edk2-stable202602 | 3 
                enscript-1.6.6 | 3 
                  ffmpeg-6.1.5 | 3 
host-am335x-pru-package-5f3... | 3 
                  ntp-4.2.8p18 | 3 
                    attr-2.6.0 | 2 
                   bird-2.15.1 | 2 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
              erlang-26.2.5.15 | 2 
  gobject-introspection-1.84.0 | 2 
            host-binutils-2.44 | 2 
            host-go-src-1.26.5 | 2 
              jpeg-turbo-3.2.0 | 2 
               libepoxy-1.5.10 | 2 
                    lua-ev-1.5 | 2 
          lua-lunix-20220331-1 | 2 
                  prboom-2.5.0 | 2 
                 systemd-258.7 | 2 
              tailscale-1.78.1 | 2 
               tcf-agent-1.8.0 | 2 
                 uclibc-1.0.58 | 2 
            18xx-ti-utils-R8.8 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
               arp-scan-1.10.0 | 1 
                   atftp-0.8.0 | 1 
                 binutils-2.44 | 1 
                  boinc-8.2.11 | 1 
                  boost-1.83.0 | 1 
               bpftrace-0.24.2 | 1 
                  cairo-1.18.4 | 1 
          cloudflared-2026.6.1 | 1 
  distribution-registry-v3.0.0 | 1 
             docker-cli-28.3.3 | 1 
                easydbus-0.1.0 | 1 
edid-decode-6f117a8f8c0e76e... | 1 
                    fcft-3.3.2 | 1 
                      fio-3.42 | 1 
                flannel-0.26.0 | 1 
              fluent-bit-4.2.0 | 1 
          gitlab-runner-15.5.0 | 1 
                 gnuplot-6.0.4 | 1 
                    grub2-2.14 | 1 
                 hidapi-0.15.0 | 1 
          host-binutils-2.45.1 | 1 
         host-gcc-final-16.1.0 | 1 
host-gcc-initial-arc-2024.1... | 1 
    host-mender-artifact-4.2.0 | 1 
            host-mtools-4.0.48 | 1 
           host-p11-kit-0.26.2 | 1 
          host-xfsprogs-6.19.0 | 1 
                  ifplugd-0.28 | 1 
                  iodine-0.8.0 | 1 
                ipmiutil-3.1.9 | 1 
                iproute2-7.1.0 | 1 
                     kbd-2.9.0 | 1 
kismet-52bcb902e36b2df1562c... | 1 
                 lcdproc-0.5.9 | 1 
              libatasmart-0.19 | 1 
                libdaemon-0.14 | 1 
              libopenssl-3.6.3 | 1 
             libqrencode-4.1.1 | 1 
                 libsepol-3.10 | 1 
   libtorrent-rasterbar-1.2.20 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
          lua-cqueues-20200726 | 1 
               madplay-0.15.2b | 1 
                  multicat-2.3 | 1 
                    ncmpc-0.52 | 1 
            nss-myhostname-0.3 | 1 
                    olsr-0.9.8 | 1 
               openblas-0.3.33 | 1 
                openntpd-6.8p1 | 1 
                 opensc-0.27.1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   psmisc-23.7 | 1 
    python-cryptography-48.0.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
          python-tinyrpc-1.1.7 | 1 
       python-tpm2-pytss-2.3.0 | 1 
qt5base-bebdfd54917e25d1c10... | 1 
                 rtl_433-25.02 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                  sysprof-49.0 | 1 
                tpm2-tss-4.1.3 | 1 
              traceroute-2.1.6 | 1 
uclibc-ng-test-132c6134d691... | 1 
        udev-gentoo-scripts-33 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
               valgrind-3.26.0 | 1 
            vorbis-tools-1.4.3 | 1 
                     wine-11.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/19dca9d9fa0aaed5b4541505e62e60c6f7478913 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/eadfd158766c8f5ecfdc61e911bcee53abf35077 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/ff9d45e4a59f8c8ba9314cd7f573ad6de497260c |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/d37847f657d47de1f9cc0b03d3a9df7094cf15c9 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/c5dec7285192879f858911d487082ffae6ef8ae8 | ORPH
    i686     |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/441ba852209b5327827aeb63f9917bb3fef80bc0 |     
    i686     |          atftp-0.8.0           | NOK | https://autobuild.buildroot.org/results/aacae966f61349562602369f42d2245b1105de29 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/0291e49583e90ab9ca6ae86cf816cef19889626a |     
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/cda44ed21df466385347c0be0f588d7036eafdcb |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/af6526f58fd962864396279fd84379d60751573d |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f3140bacbee84f6075adb2787b22040fd4459b6d |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/e43b55431da19176b1accf8c1529963ce02d2691 |     
    i686     |         binutils-2.44          | NOK | https://autobuild.buildroot.org/results/757d0dc299fbf700e7b863fa6aadc4102dc2000d |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1635ce83536c8ddd4a2ac50c840fe75b30ac5704 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/920948d3232036b9fa5cc8bd726aecbefecad98f |     
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/485e3fbd47589aa7074e54ecd6144eb01222165f |     
   s390x     |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/3900dd1a452b89526da6dda8d6eccaa994fbef9a |     
   x86_64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/f4ae57c58d6f85475a2409cba5c29851fe924c37 |     
    hppa     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/54bbea14bef321c193d9b6450b253edf832c6b8d |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/460be63e37c8c18c413f03d3f323413b8cdb77d0 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/a9ad8e0ca6421c196df96c638d199bc9e0312b52 | ORPH
   x86_64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/691e5f0a767b8f55f9cc29baca5b3a8c9926ceda | ORPH
   s390x     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/a53dc5c505c7e6e9a37df95f9f83507273076630 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/09a107dfffaefd276f33feb4a8d6ca129748adf6 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e5a5906232a180e40697854feee287bc96539cce | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6fe45d77bdf3728de50104fc9824efd37046511f | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2f1917adb32dcdcfd52f4dfb5d3b4ac453e79e73 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/c067a4a1df1eb7790b3fafbe00c8d172ff2085bb | ORPH
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/4eb07f94aa4648ec7f0cb6374f78f0c10ad9acc2 |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/782062a3d98922d32e15112812c02d90543d2556 |     
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/7c2ee511b620882805dde5170e670931dac7c86b | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/6971884aaad8fedce1efed3d2412600d9254d4ea |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/36ba0d09c736159729716e12930a5f6d87d5620d |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/7b697f9bbb9d7793e7189e02ccc28f64c9c7a438 |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/dc072ab1f3d242da5c21fe8858f6ff5939be497e | ORPH
powerpc64le  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/5304e865dd60aad12b58685d768e7bfccc477d22 | ORPH
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/f661ab74a16e3e3fa0d6463d96acae416b0c7095 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/c672ef2ff6b18f8dff29d9a9402e50d3647864e5 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/dba15dfb63157cbfdd2ad7beade685de19c4fe41 |     
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/a971125edbc2b41fdf74492ac77879ea42a8324a | ORPH
    i586     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/011cd70bc79f5e039611b8ca21196f245b691da7 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/6748f3eef63dae770fc0f5d9b97f681dd0fae8b0 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/fd50a611bc29109704f9a5fc0c8003af8656d350 |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/2a487a4d091f716724b3215306eae01b07310ebf |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/5c6bf427f82544dbdb5bd427d935b58d29dfee83 |     
    i686     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/b1e4da284ab86bc9bf8328b842878691f8b193b0 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/02527c21b287ef898ca59a28148a11ae78cd4ac5 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1ec8bd972ead0d8793d3a9fb8de02092dba9dcf7 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/22fab354ceb12b87bcdf417b64512644d35106ae | ORPH
    i586     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f7dbf350d0b0b7458cbf0917eaf74e2066215a1f | ORPH
    arm      |      gitlab-runner-15.5.0      | NOK | https://autobuild.buildroot.org/results/dd05f6bdaeef6b6c5284f572adb1b63aec7015ac |     
  riscv32    |         gnuplot-6.0.4          | NOK | https://autobuild.buildroot.org/results/a21743941080eb33ccac6447c704cd4b1c696d24 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ded87fc4c2ba09b263d4678b54a12cae1048d44e | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/aeefb33a6227ee3fdf16a080f36475ae8284df21 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/9446424df28ad8db7d7eb7032ad7da90e6127144 |     
    i686     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/53ef3eea50963dbc4f69304aa5c13dc9c639b688 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/193c3d4c834a78eece42812c292f49e68ede5d92 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5f0abf6edd505b8a4803503ec29e43af44658bc8 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/6c8d51a5ccba03b1abed1ee20d82a92bad3c7e5c |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/1ea583d37b20fe2732d1a945c9f9b787ee741880 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/44b9a4bfa4c6ae6e4fd6f9233a90053552ec6ddc |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/5c2fcd54327993dac5875de5a2cf4605a9b63162 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/862d62f3ec034041ef05fbd5aa05fefed3c72725 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/0dea50e4f68e92c5d9bb90082722e96a9777c0cb |     
   x86_64    |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/97419f30fc28a9d14417f2ca54dae67935530641 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/426e741453cc648e0708ec64abbff4d0ba57d963 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/2c51298671cfc61d724091a82dc4dfe478ef454f |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/fc5ef751128f8ac5274373d6a04c23598cb03c6d |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/538a1f062c9a0f90a9c230e386453157dbe41aa9 |     
powerpc64le  |     host-gcc-final-16.1.0      | NOK | https://autobuild.buildroot.org/results/873c1507bb5a92905ddbf569b40ae1effef2ae24 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/f7528cb377bbbf3d8ad9d066baecfac7838fa8ef |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/1c6935417c92c79b963b4cbe7fea622725dc30e7 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/1db8fbcb283732efafa3991d9c0a0ef84f2ee230 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ad25bf4889288e52b3aa7f85f296f56b6be542f0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8d1feddc25c9271a6761c07ab3bd33e4e9db84eb | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cd95f7d8fe249927f2c3054bffaa7d86d71bff1b | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f4dde1679645b0b48a0d36d834610e70f3189b56 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/90dafd05461ac853af2ce86deffe82b4d4ab50a5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5c964e5d46c15bc5e396f52f0d84043cdff8f038 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5027571805909ea2d31031e76e02ea8190444611 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2de3a8c51d9fc36a6b7dbdb8918f89e83d1b5c2f | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c4a59b25a8347dbde2172afa721098c1cdcb82f5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/154f6a6139ffe051e8ee3f11079964cc00c667a5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d5c943174e1a4f47f377e6dc0152e056a8ac331a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aa69773863fcd9502701bb75bbb51d23f8210f5e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8029c4003fe996c605e92645dedf86c030529a67 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e1ec16faf47d90dd2ada625687fe6a88175d7786 | ORPH
    i586     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1a9aea1e7772bae27e2c6b7d4348e4932afd5803 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c794a775ab359e28163fcc798cc69ddd8986492c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ce7adc00e2933ff06d2f93bcb730a66567f5d935 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/856fc0c06c0982669d892333dda5a4b02567fd27 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eb8b1d3a26fdd3762593373daa5da7d5ac44905a | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/931fe4e4603d4e32888d8aa4db43f5480c26655f | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/ab374dca8d0053dea0c4225d905f590868db8861 |     
  aarch64    |       host-mtools-4.0.48       | NOK | https://autobuild.buildroot.org/results/bb7fe2baa58ee9e64f1587ee9492c13f4e6c1c77 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e6bfd0f965a741c612f5bd83b5530e0fc06d3608 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/311bc74a3bbf98ea2f7c69b99f20cbba5be20baa | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8d1789ff4ad79a3f6902f61466a7fe8c87855eaf | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/9c45901ec0b5b1df5a1260443bb36eac31641ed8 | ORPH
 powerpc64   |      host-p11-kit-0.26.2       | NOK | https://autobuild.buildroot.org/results/4ced5ff7c3461289b7f08f2fb9e3a3cfb19045cd | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/23fa73630e9dd7e85563730b26135c1b756e6f79 | ORPH
    i686     |          ifplugd-0.28          | NOK | https://autobuild.buildroot.org/results/c60e6c6aa8aba8af91eef09bf640307e1d3b2ca5 | ORPH
  aarch64    |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/ad758673ad61b5681f00f0cf3ba282fa2d2c28d8 | ORPH
   x86_64    |         ipmiutil-3.1.9         | NOK | https://autobuild.buildroot.org/results/f7b1ac369e0119fe1d1faca549a51adfea062906 | ORPH
    i586     |         iproute2-7.1.0         | NOK | https://autobuild.buildroot.org/results/798f84125951d8a00a75211a751dcf07ffa65691 |     
    i586     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/ac7ba4b016528fd3df84c1915de1699397fbb762 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/f2880573ce50f9d4c50f942a14851a956668095f |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/cd0ebbbb11972060c7b67f2f4da0c485479ccd56 | ORPH
    i686     | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/ed37f5f419be84e7fa1c4491aca2880ab2136e17 | ORPH
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/ba4b1b3dcea9fcbbfd013b31f25b1c33b99b8dbf | ORPH
    i686     |        libatasmart-0.19        | NOK | https://autobuild.buildroot.org/results/2a5aeba1c2c202b4a732690a78eef95838ac74d8 |     
    i686     |         libdaemon-0.14         | NOK | https://autobuild.buildroot.org/results/a976ac6d6061db9cdbf804d330a5a6d073bc3c34 | ORPH
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/64b1c35fa90e31367eedc4463902df41d64221f1 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/78ce5f85ef67ab75eaaed28bb8cdf9099e9b0478 |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/f89b0c91526eae9e2c6b7f537b3fe88dc3f07327 | ORPH
    i686     |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/d86305c8bd3152dca14dd323799eac035869ac32 |     
   xtensa    |         libsepol-3.10          | NOK | https://autobuild.buildroot.org/results/469403cd4d4e96816d176bc8e4eec39dfe34fba2 |     
    i686     |  libtorrent-rasterbar-1.2.20   | NOK | https://autobuild.buildroot.org/results/6639f2357c70a11d43f72352539e757d30f3be77 |     
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/b51c85cac0e5b2585fa56dddd504e72b3eebfbfd | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/1a184e28cca71c319d6f130951de7889f5227d31 | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/fc335cf07dcda5b84a144405790bfbb6d33bcbc0 | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/5d9ba3a1dc08add3ce6e84234f44befcf9ade09c | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f344130779a4c99454df6fe1fbe19f15640d54b7 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/ae9538cba482a85edf7b2628a0c90cc6477ce2e1 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/9d0456715b64d8cf28439125e1ba5d42068bc182 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/26744867b80b04f8446742987c88dd1031446d45 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/98b3547b84962003ba41805f48a4cd782c2e6960 | ORPH
   x86_64    |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/521e38771500b9edf97a9b9035b4be5a61684f7d |     
    i686     |      lua-cqueues-20200726      | NOK | https://autobuild.buildroot.org/results/ec2b59141d6c375f1d41709abc69694be39f421e |     
  mips64el   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/c8be6b7845ac24a5f7501731ec186242512bc8ea |     
powerpc64le  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/305cee3191e9db1dbbce2160d2b70b7db4e343b3 |     
  aarch64    |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/efcb68ba8e649f02a9b1242d87fcdf07d0da1a16 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/e430523f387c016f2ed8fff36a1f8b3c719f154e |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/b1bccc664e400882646f1778a4b6e8fe999b9bdb | ORPH
    i686     |          multicat-2.3          | NOK | https://autobuild.buildroot.org/results/a81b2c7ca3812badfc05ec0527e08a4c25565665 | ORPH
    i686     |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/f4f44a194d671881fecde60feb37614a2440c7b4 |     
    i686     |       nss-myhostname-0.3       | NOK | https://autobuild.buildroot.org/results/c122f8192bddd4de7d5427fddfc2cd8202ba3f4b |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9ea1f81b4f52a905d498760bb965c1caed57bfde |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5fece68f4662870af82da407478168c4b5a1ced0 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/330cdf3624ca5dc2026e68c5dfc1e92ef7287164 |     
   mipsel    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/178cd9d709dcb70cb340e7e4a23eb5be794c05bc | ORPH
  mips64el   |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/a872d2c47e158056168beacb672775ee40280ea0 |     
   x86_64    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/1ef938840dc9fd7dcfba640b3d18cd831fda0461 | ORPH
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/1217ee6fa80ace6a9dee60c873aaf50e02488173 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/d3c67fe6b4b3852b6924a49cfbe65f311d2dc729 |     
    arm      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4e1f4920d6fb729c3a8055c949570bee8419029f |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/eb65caf4fc37bb8fec47202c7218ed2b6073a49d |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/053015f4f10f2570544753fd3823e5e93343a610 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/65c87bfe90c963280bb133fd52e194b0e45063cb |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/3a6bc3d9e4a3ece619c630726dc27c0e2b1d7187 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/0026e2cd22d85c62223521f719ff5b1420172044 | ORPH
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/33480d32fdad080b9d53f33c7fe57a1fa4da1bc5 | ORPH
powerpc64le  |          psmisc-23.7           | NOK | https://autobuild.buildroot.org/results/3747b0fa1ec7b87d400acfce819be550d0be0a6b | ORPH
  powerpc    |   python-cryptography-48.0.0   | NOK | https://autobuild.buildroot.org/results/cea559e90f5f385a7952313c7bc2fa937486ac9d |     
   x86_64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/0310aed2b62b51cf0841350a848a2e4ec1969a51 |     
   s390x     |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/b09992538205b4c25089a6ae7fadfe2041fdafbf |     
  aarch64    |    python-tpm2-pytss-2.3.0     | NOK | https://autobuild.buildroot.org/results/3c4d80f8cf798fd6694b47177ac0683bad339ba2 |     
    i686     | qt5base-bebdfd54917e25d1c10... | NOK | https://autobuild.buildroot.org/results/9c4ff1e68ed614813931b39d9aee7ace5d99d31a |     
    i586     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/3fbb0caf2500aad51a7d9fcfb53f6872fdb4f802 |     
    or1k     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/6aaf28c1a9a25e270f9f70b46526e8e2d62231f9 |     
   x86_64    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/95087eb97ba397760923a109761a0331de798073 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/9e9591a8b136ca1573e2d03ae17ee6ef7e8f6ef5 |     
   x86_64    |          sysprof-49.0          | NOK | https://autobuild.buildroot.org/results/fcba577eeaf806910918472f0a0dad9f69cda72f |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/e4eeb7c4a9e3ff90f1ec5b43b9b6a2a85ee7ae2a |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/ee6dfd1622494f7cb54a0ca08712650b94a64f48 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/9d8c823bd37229fcce1e4df427c512cd6afe1079 |     
  mips64el   |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/099710e937732a24b3449fbbe31874b1a32cea86 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/cae391d8f0f4b1357df22a0227f803d8d5f3eb31 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/571e493b70058ebedaa7c75a27d26e82133e51c9 |     
   x86_64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/542930ae9fa3e3d716cdf2bcaf961548a6714594 | ORPH
    i686     |        traceroute-2.1.6        | NOK | https://autobuild.buildroot.org/results/1ed8f02debd9804f5f8841ddfb4c48ebe950ceb0 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/8cea00c9b94ea76d8bcc2d77abf2df6469520d92 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/8a2c6f4f0d9215b0e9eb271887811e24e935d6a2 |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/7d931ff3b158c22e13def8f3cdd22cf6939bc3d2 |     
    i686     |     udev-gentoo-scripts-33     | NOK | https://autobuild.buildroot.org/results/c44a2183b9b4a76b73e8940b45f2e59bb366f141 | ORPH
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e9f9275fdae55778b7793b722f429493788c29d6 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5d6aaaa201cdb8a41af6ba1125d519919278bdb0 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/97bb8f2c483b841d17a9f37fe21afc6e14a93108 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/84f4e00a540d15c83ff5757ca503f2da15c02f05 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/837eb32563541f4777857df55f888926213907b0 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f89eab4d928e1452e8e3cc11a2b5f3db2a575988 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/4ec43fdf6e09ebb8ea9f9cd9b0f93f8f19b9dd6e | ORPH
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/b059bf304c5970458f46567451be1d6fee61cf46 | ORPH
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/9b3c801bee471002f2c59250a9b2a544a8b5916c | ORPH
    i686     |           wine-11.0            | NOK | https://autobuild.buildroot.org/results/dfab291333f0de850c509d9efecc95cfdb878fc6 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 fwts-25.11.00 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         fwts-25.11.00          | NOK | https://autobuild.buildroot.org/results/ad72b3f82174784e204302bb30f7241837afa7cd | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 logsurfer-1.8 | 2 
                    ccid-1.5.2 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
        host-python-lxml-5.3.0 | 1 
                   perl-5.40.4 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/ae8f766f5983e88779d2a38457f79b4c18cccae5 | ORPH
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/45f92be99c8201173ee391b0fc4f092b7f995980 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2eb1cb5ca75867debe959578b8c57d0a8c28667d | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/1acb429ce5cdd12946de0fc0ecff1260db3d8349 |     
    i586     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/0ae47de932d8a7c81ac269cd9f2f88ed5459a7b2 |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9de53f1c69e558e6ebe1aed3c9b01d91d00d83a8 |     
    i586     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/4fa251e73675c78162272dfaeb2dd0b2841593b3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

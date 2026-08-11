Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AB1C5AD55
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 03:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49BC380EE7;
	Tue, 11 Aug 2026 03:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-QmFXUeXUtq; Tue, 11 Aug 2026 03:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2DD280EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786418591;
	bh=KAmTOUEQ4xApnWENj6doUK7fk4Z+CpLPVHju5qqXCVs=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aTQmxNrzZvJ6R50E3yelYB6G9gJK6sha0xC9DGbgqas65DxKb8vCMJls0GfG9BxB0
	 AK9zTfb+R3iZ1SgVx3wHWRxF9T+uFy2I9OgzNhX38kv1qWpGdEzXvFR7O0CQdHZ/YX
	 OGMk6G4fZYGkgQGln1LxLl6V/Q4VhP9EwJFXyOL0+4EhJF8JiUHiUZCOcagQJme/nP
	 2eo7GHI3cFiLjQqdpoBtcRRtRfFxpxEWJZRf32ZZNDETLZl9FESZzQ778mA8HoS/KU
	 yKw3Yi5Ff0Pk4lP0sH+FCkyyrriDIgw2w82peH2UF6OLFPssICFKVhWEtyLjuPOEwg
	 U9Yu1Y/G8W9VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2DD280EB4;
	Tue, 11 Aug 2026 03:23:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D9B376B
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 03:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4928880E06
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 03:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwpJJBbH8eMY for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 03:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3728480EB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3728480EB3
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3728480EB3
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 03:23:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so1870283f8f.0
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 20:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786418585; x=1787023385;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=O/dJooeDzvB2QkA1/h6k3E4argJmtEKdsFvXbznUW1U=;
 b=aVgDZN1qj6dHSi6Nv7cje0qYoaWSZbTkikFEVyuwm6ly0DLru6Y6JI0kzdshhOKc5k
 XzJ4Vl2PO8Zf4SZ5jmktj9MUHTRJzIQbgIFWozNgbGiW1Li1nCV18qX/mO5EEPoYJiIZ
 caZWg+RZQZ6Hmgi6C1NaBnVWo4Mzk176tpMfHAw4fdKhX+lhxpcKmR5DivpSAC+tgAEZ
 qcOXOD7nqIikdMlvuRCub+YIb+/J2C9emW1YMep0XDVDtiweOJLj9Zy1+Z42E6P4spb7
 ukCebJ29ArJmtTMyZW92L9EFvPoV7Wl+BFChk3OV+E3lKB3Pd3IowNt2fbJ1zgunJDoi
 MlxQ==
X-Gm-Message-State: AOJu0YzQvJJ7Y+1G6Xbt3quDiWA25nV2szRjdmwEXo3XK9ivJugDj2v6
 aL148epzES6xPrs3kPNrkPwAx1f3LwzDi+ub25m18ksqvPUUXTw8ags5Ck7wSFXx
X-Gm-Gg: AR+sD11DUP63//vtVyafl71qLXLCRzQX4SXMqIbFOMZSB2ujaiiEM6xs0WOeaSd0/5c
 j9HkYXXGiAj7JfVG1Jy5X7BW3d5Fj8o54MtR8cyLVViLRCITdIi3/s4ONaGDUQwGdFNU74pE5RI
 SqaJLo0IHItZkiPUORLiIkigpSbcXwMzmMHbMbY8aN7827kke9ek6QJWNpGH2C+y7VkysJxH6zN
 id/oskWbpsCoCqDbR65SXSbu9phGsXJme5fPqVS5G62ukY+SwodowT2JbZP0VAHrobGtSENWlNy
 mm6Y2/aMcxtpDtaRR5ct+hU6eXqmLgKKvZ6umBzXaPED5xni7OLm/HNP+y0sf/GexkHRbDObODr
 YJGO5A6a/OTSbgNok3FU+k02N0oWGc/MScqbUft3ftH5xBF5eYzDPOtQZPkMZd6KYB0rA2g1uB5
 8BojfT8Xn8y5QZpSWa6obLL2UopTA1JUyjxwtoPQXxZLXHBaf1QVBEqPepGwfYBcK6lpezQvWFl
 Q==
X-Received: by 2002:adf:e012:0:20b0:47f:ecbb:55f4 with SMTP id
 ffacd0b85a97d-4814add94dcmr193119f8f.27.1786418584664; 
 Mon, 10 Aug 2026 20:23:04 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4814a5ac75dsm713138f8f.7.2026.08.10.20.23.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 20:23:04 -0700 (PDT)
Message-ID: <6a7a9598.a02854e2.31d790.45fc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 11 Aug 2026 03:23:04 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786418585; x=1787023385; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=O/dJooeDzvB2QkA1/h6k3E4argJmtEKdsFvXbznUW1U=;
 b=tOBKzRaiHxLcEKHgNhMRsy1wLksiion0lG8G+1mKljnH4q92nOmdLaWQW8dWWEXIMe
 wSyaJYnSAHewZkoPUIKfLxHXYgOt5HT42sIjT75ZhigQtQJqfkMf7lbGT0M+2nMU83aa
 jw4pyfS8za84scGKG1AIbgAD9iW2CnGpcoK+79FSascfmjpP3dODnXXgledvm5YRzOM+
 Qi3QkWRePLuT788BHXJuvTQ1yzh6z0PjAvNQcLV3jhsM2MV8Zb4PZcJoJG1/KEvc4l25
 xKf8O1vJEFCNmUHhwxexDrYbT/e1aA3WF3teh7EaF6XonQKcgt3kIN3KZ5kiOlCgDWQN
 WZ7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=tOBKzRai
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-10
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

Autobuild statistics for 2026-08-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 29  |  0  | 38  |
  2026.02.x  |  3  | 13  |  0  | 16  |
  2026.05.x  |  6  |  9  |  0  | 15  |
    master   | 50  | 153 |  1  | 204 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 14
               host-dracut-111 | 6 
              erlang-26.2.5.15 | 5 
                       unknown | 5 
                host-odb-2.4.0 | 4 
      libabseil-cpp-20260107.1 | 4 
uhttpd-15346de8d3ba42200249... | 4 
            gdk-pixbuf-2.42.12 | 3 
                   gvfs-1.57.2 | 3 
          lua-lunix-20220331-1 | 3 
                    olsr-0.9.8 | 3 
                   perl-5.42.3 | 3 
                 systemd-258.7 | 3 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
        edk2-edk2-stable202602 | 2 
                    fcft-3.3.2 | 2 
                  ffmpeg-6.1.5 | 2 
glibc-2.44-23-g11ac3d78fc5e... | 2 
  gobject-introspection-1.86.0 | 2 
              host-bison-3.8.2 | 2 
       host-gcc-initial-16.2.0 | 2 
            host-go-src-1.26.5 | 2 
    host-mender-artifact-4.4.1 | 2 
              jpeg-turbo-3.2.0 | 2 
               libepoxy-1.5.10 | 2 
                libmpeg2-0.5.1 | 2 
               linux-pam-1.7.2 | 2 
                   linux-tools | 2 
        ltp-testsuite-20260529 | 2 
                openntpd-6.8p1 | 2 
 qcom-db410c-firmware-1034.2.1 | 2 
                 rtl_433-25.02 | 2 
               tcf-agent-1.8.0 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                    attr-2.6.0 | 1 
                     bc-1.08.2 | 1 
                   bird-2.15.1 | 1 
                   ccrypt-1.11 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                   dbus-1.16.2 | 1 
              dropbear-2026.94 | 1 
              e2fsprogs-1.47.4 | 1 
edid-decode-6f117a8f8c0e76e... | 1 
                    emlog-0.70 | 1 
              fftw-quad-3.3.10 | 1 
             fontconfig-2.17.1 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
                    grub2-2.14 | 1 
                heirloom-mailx | 1 
                 hidapi-0.15.0 | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.45.1 | 1 
host-google-breakpad-f49c2f... | 1 
               host-grub2-2.14 | 1 
              host-rust-1.97.1 | 1 
                  hwloc-2.12.2 | 1 
                   i2pd-2.59.0 | 1 
            igd2-for-linux-2.2 | 1 
                iproute2-7.1.0 | 1 
                     kbd-2.9.0 | 1 
                 lcdproc-0.5.9 | 1 
                    lftp-4.9.3 | 1 
libftdi1-v1.6rc1-2-g92d657b... | 1 
                   libidn-1.43 | 1 
                 libldns-1.9.0 | 1 
                 liburing-2.12 | 1 
                   linux-7.1.7 | 1 
        linux-headers-6.12.102 | 1 
           linux-headers-7.1.8 | 1 
                    lua-ev-1.5 | 1 
                 mdevd-0.1.6.5 | 1 
            nodejs-src-22.22.0 | 1 
                  ntp-4.2.8p18 | 1 
                openssh-10.4p1 | 1 
               pulseaudio-17.0 | 1 
       python-autobahn-25.12.2 | 1 
            python-iwlib-1.7.0 | 1 
           sane-backends-1.4.0 | 1 
                 sudo-1.9.17p2 | 1 
                    szip-2.1.1 | 1 
          usb_modeswitch-2.6.2 | 1 
               valgrind-3.26.0 | 1 
                   wget-1.25.0 | 1 
        wireless_tools-30.pre9 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/aa200329b32d0461771ccba6c86a94340cd7dcde | ORPH
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/1fb9d072792bd17a00246bfcf6e347bc14f3ed81 |     
    i686     |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/d327578c4ebefcebdf51ec6cfd000dd66ea76d58 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/fbd7802ee9949497db8d234faffe068718e0cf60 |     
  riscv64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/363eefd98bd6c6d67219dfbf209ac2cf6bf561f0 | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/fea8bf81b62bd19240f92ed5ec56bbe0dfa6f8a4 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/235b8726a72c068da46e4d3d693974c4cee42d14 | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fb65dac9311b4714c855242c0fa8369d7a911244 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/257dfff2e5e2a2abfc85043a664546465fa9f8b0 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5a80f332d70366a968d5bf7cf08c9b9ecd60dd2a | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/5710e94b428b0fb854532a504bc64043e0a70926 | ORPH
    i686     |        dropbear-2026.94        | NOK | https://autobuild.buildroot.org/results/c4c76dd4eb07b3a808000d08e61cff92ff931f94 |     
  riscv64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/4dd2a152e843cc3e8d155062d942a91df25c9a92 | ORPH
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/57dc56f7fa9f790a1469d72d6c0eb42d28c10175 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/fd374bdd278176b463d74dd55e6e8eb45220f550 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/5ba8c3a73cabdb14bf30ba3c721c6c7648d4bd9f |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/e008fd089c87ebe4881ad4fb17adbe2707ea6a6f |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/4c1981ebfc331c8c5ba1467cc5c5059f391126c9 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/8b9b8fe74a1f7ef9ba0eef00b275634fcece56e2 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/4109b129c6517a8338974b789c804ced313c0b3f |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/5f83e7591c947fe4effe2dd6c6987a9f82223981 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/7daef0e66e82878130e237dffbe29dc63785afcc |     
powerpc64le  |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/df0986e4933f9010155d9ebb5f2ccfa2f1d289d4 | ORPH
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/6bd96120d5272d242c0f606a9931923704f35660 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/4c77bd6d417fb943771c7a6a13f1e546a5f4318a |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/e1008bffb3a7d314ee11af828a60c55121220055 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/0fab5841f9f11e08d7035713d6e17edb4df1621b | ORPH
    i686     |       fontconfig-2.17.1        | NOK | https://autobuild.buildroot.org/results/cfccd264d50d4864482acbf497b308e310e409d3 | ORPH
  riscv64    | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/5f168ca9ad41876d1a82e29c0ace1e731c7d95be |     
    i586     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/da882051cf6bad29ecb2502c0784b664b25e58db | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3f2b7ac6088eadd8cfc19d83186300835aaaee1b | ORPH
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6d0d4a72a2ffb27bd05c7d795e6086b5ac9afa96 | ORPH
    hppa     | glibc-2.44-23-g11ac3d78fc5e... | NOK | https://autobuild.buildroot.org/results/37205be09ba9d864e3af1f4b0338693ecfcb041b |     
    or1k     | glibc-2.44-23-g11ac3d78fc5e... | NOK | https://autobuild.buildroot.org/results/ad5148d83f81b5178a279cc04f525a44101232c1 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/55bea02f07a2171b02e504b2371f6992ac1936eb | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/bda30e973cf23c3a9c22a1299fb08bb46204ab15 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/7e7297e853dead64e3df942f7d56fb24555cbb47 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/b13384b354d17e3b5ca61114032a47a455c978eb | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/027e80be354bd6d22f706a2cfca7d4fd5389e17f | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/b7e70f7d3aa983fe45953ded96d32d5ce66885e1 | ORPH
    arm      |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/56369437e1d1155a5ec14a4f17493bd71b869b0d |     
    i686     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/06fd21a79c951e8e5d9b30cd7892892b74729a49 | ORPH
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/f60ff8ae09235a34cf55c32f2ab2a975ceb72960 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/16ec6f54da5d5ac47e75e83eb0a0651d4edfb737 |     
    i686     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/1631578d8794ea4a38cdf139c6394ba2c50e90c5 | ORPH
  aarch64    |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/0dbecfb51e44a10e14ce211f2aef95fd4d6ea2d1 | ORPH
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/8ef408d48ce0d7c1dc239252205ed224c7f5f3b9 |     
powerpc64le  |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/ea049e85b79a0df5f7f8ae699985d42402a1887b |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/079364be9bf7177c965f2ba8315453250e91df4c |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/0601baa1f2063e5e895dfbae7d1b9cbc0f95ef23 |     
powerpc64le  |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/d9d5631b4e5a819d317575457dd60e8186bfca3a |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/b5987d7dcc95e086a5e25e6a3fe14c6d2a33bf25 |     
    i586     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/177fba0012fb25da7d116a600fbd2b1c34f10ac2 |     
    i686     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/05c0976cec6891d9c84ebc0192550cdd8cc63776 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/8df44bac7d0b7f833230f5f49976396fae1bf30d |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/8aac1af4d0e22ab90a44e9bfbbe50dc078b34421 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dc94c8d9905a59ec40fff1e231bd3a0bf0b6344b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e5069513ff1f3d90420b62b489aaa5a42ffd802c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/85c4dae0c3427245d0f305986c0a9bdd86a68df2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2a858b825a751c696eaa2b576b2e1dc80ab37fe6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a33ee9cd98dfb0dc30b55c95466a15c6eff1ad85 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6b56d44281f65bcd1389369317889c0b44428202 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6acfb52d87462171f8da8ec7d0d101309ccb13b3 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/664f7dbb1bf76c0cf315735659462d988dca724d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f9ab1dd01c16d0c034d78911768c940695700d2b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6e34896cc168906eb2b329113391fffc0c0c3a42 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b3f7ecf6942960f46f24e7c6b2f699fa8f344477 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/42351b063dfd9ca6c62c5c579e6553c25268d7bd | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e08a291ca5eec9e5c6f3d83c55bd0d3377c1ae20 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fa00ad3db5114ee93b8ac1cc1c0ddf03d1802e12 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/32d40a9e4643dfe5e00627b22b4c823a442de0ae |     
  riscv64    |        host-grub2-2.14         | NOK | https://autobuild.buildroot.org/results/25df0562613ec623877e552ece2fae24ef81db10 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/8a76863b4e8dc623c4b11c329e3933fd67b6ff20 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/f983c094c364b450f51a6cff68e4218993a1f2ff |     
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e5902a41680f49355d88af55fd80d360c7a129a8 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6287fa6b9a571f25f99e651fcd0565491a52bcbe | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b8afa138a836df6f3af4a44e1c6de17c44fcdb21 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/0458d2436fe9b3591411ff9fbeeb55db569f79bf | ORPH
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/829ca5d9707a3872943f8832d5d70aecdf3299bf |     
   x86_64    |          hwloc-2.12.2          | NOK | https://autobuild.buildroot.org/results/3b11ca1b1156cf44b51cc16c7ac80d00fae4339c |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/200507f1b997f1146e04d565d520a8ab4f5cdd74 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/54dd0cffa3170b5144d2c6578d08bddf6681cd1e |     
   x86_64    |         iproute2-7.1.0         | NOK | https://autobuild.buildroot.org/results/370c9d05247d17ab9079abc84b0880b694fab035 |     
  riscv64    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/056bfa55a045de0ebf827ebacb9ddc31783f92b8 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/dab9272868862d973cc6d5d27b5e2683df3d406c |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/a9ae12ca6f660dacef68a152ac6a7e55e5258059 | ORPH
  riscv64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/7f8d20dbe9ec69fa6e65a6eb3eb94edaa83d5f1f | ORPH
  mips64el   |           lftp-4.9.3           | NOK | https://autobuild.buildroot.org/results/d11b70954dee86a08a21513d231c587363a49c8c |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/cdcb34d71cad9ee060f5e36b9bfdfad83f16bdbf |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/3b52e714934e1fd1aac6dbbfad97764c035fcc52 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/5cd3a45c000cb3dc3bf5813f19837980dee39965 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/c04c4f6b5d36a8ecaa2c079545624f197d7fd501 |     
  riscv64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/2f622381e3e401f4fae9a7a0c031df166a923856 |     
   x86_64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/979289d703b05b4e384d08801c11424b394576e2 |     
    i686     | libftdi1-v1.6rc1-2-g92d657b... | NOK | https://autobuild.buildroot.org/results/debf8140ef54f15ee9994b4d526ae7633a26f178 |     
    i686     |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/08dea0e7ff4194370cd21bad5f90c57493a116f6 |     
  riscv64    |         libldns-1.9.0          | NOK | https://autobuild.buildroot.org/results/2d2aa339b300a4a4dee211da414886c97d1da3ca | ORPH
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/150e9736602c7c491035aab6e8fb11cf4c1d3624 | ORPH
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/b78cc54f4c4f1baae49a5b3e92d8c11a3d950471 | ORPH
  riscv64    |         liburing-2.12          | NOK | https://autobuild.buildroot.org/results/09adc83bfd9c801ea2e6df61ba31ed43ca67f039 |     
    i686     |          linux-7.1.7           | NOK | https://autobuild.buildroot.org/results/c83a3dccfddcec6ebffdacacd932672c2470ab22 | ORPH
    sh4      |     linux-headers-6.12.102     | NOK | https://autobuild.buildroot.org/results/b65403ca79f92f51396bf6d417e4b05e8513a12c | ORPH
   x86_64    |      linux-headers-7.1.8       | NOK | https://autobuild.buildroot.org/results/5b1bd4588202793214aba6b783a450b9a52f5ee4 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/3f56d783b17a7124252740c72aecaced1fcf8dc4 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5ba877dc6707abcf5d0c49268c5b5695f4d3de73 | ORPH
microblazeel |          linux-tools           | NOK | https://autobuild.buildroot.org/results/498a61987b9d7be41b6fc87d564265f29dc03a1c | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/fd04e5f742d8181753d3ef58fe56be9761972d98 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/6824043355c20e1a639732cf96d4aec719c2a5b0 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/aa7281d17599f21b9b014d1670b592a313e1d2ad |     
  riscv64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/6e7e15aced049a33c5417ff9fbda1888644a5d07 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/da7de624977b46b549982e6768b4dd4a5199847f |     
    i586     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/ac542f8b119f6b9d47f36055c953f7830b0f0a8f |     
   x86_64    |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/5212f7c6731c6ac3db9b13aa2d6d33834bfef249 |     
    i686     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/4ab624b37f915f7be786fe78490c3ee74427ab66 |     
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/75856ce408c1d89316198190bd8f747b84d7994c |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c50ae49816dd97f10fdfab7ef562cac6fe6fcc5e |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/e70903a8e1e295d905608c09976d3cfeb0256204 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/eaaffab8650fc44f95385d5aeba8b21a0930acf4 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/788b2c2f6a9e0156f256a0cadacc59b48add3c5d | ORPH
  mips64el   |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/deb42beb7b0d069985aaf1157c4375d20e4bb788 | ORPH
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/0e6919c20e5a4446ab0f5185b35f68b80d0ea90b | ORPH
    arm      |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/3fbc57a12f8618f24d3fb45746488e0db615f120 | ORPH
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/7bbecb08942645a583da301d6476533c4ca6b453 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/317f8d41ba1d06679e49a013138e7cc701603a9b |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/9fe93f24ea816ce6e71867e81b1de44b6da130a6 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fbdae6bcc7ab49a43189513ac0068c34cfd63285 | ORPH
    i686     |    python-autobahn-25.12.2     | NOK | https://autobuild.buildroot.org/results/e5fb0d8665e9b5ecf720081d8b88de457d22b3ac |     
powerpc64le  |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/377e808e4241b6e7c3867cb85748ef299889ffc2 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/f486979288213ff6bd443d8108755311c9548c92 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/30753cc69defe4db58d3666550017253e34ebc57 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/db9e27e2286e2f7c86bd6ef77297c0f14d137da6 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/5fac7afabdfffe1a43ecf3d52a15116dd31157f3 |     
  aarch64    |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/c43f8e594bfe5eb056db4d8f5c9e25c1797df244 |     
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/a63599fb0bdc40ccf6baa4322beeadc7e021a588 | ORPH
    arm      |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/b5becf449fe0dcca270eb8fa607344cb4294e90c |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/8bd0a9d739119730a64548e4045b3fcdd08c3ca5 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/ccd95c889ffaa0d6f9773924f81437e2958cee3a |     
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/63f9317b194fd20118c9107c6ac0531bbc990023 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9f9e956f190618e9a8ec908da47860f09a0ca121 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fc5e5cd23db6e02f9204891a40f1f14c03dd7185 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/099cfb52662cfccb3202537fca66c53d86a08cc4 | ORPH
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/bf7f46ed8cf06d43111eadad55c45454abd3db84 | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/17a9573509d7c169f361fce622f863b2b381a79b | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/90b679bf7de086e40149e6442dce01d10878bd9e | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3244da2853897b6056796e7ccedb57d538c41874 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6a68761e6860c93cfe959482ca3acbac93aeba32 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/10d58b696f4463979a672408ade14a9ed5101925 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/f48c93fd3418a7a4eab55cdcf239f3d7b4f24ab4 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/5ce879b59429cd8bfffd99c9b151b611253553cc |     
  mips64el   |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/1a624645fadff1693f841a572b844af814e923ca | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/3c0c267b24115546253d2cd6e63fe50568df8963 | ORPH
   x86_64    |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/c2b84ce62faa39a7c03134c3f7b11ce0121809ac |     
   armeb     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/4f2b44ace6c679f967498b50813d2cd89e8a3c64 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/e97e748163f8357f9b1a866a5e01af82c602d0cd |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   bzip2-1.0.8 | 1 
                   dante-1.4.4 | 1 
                   i2pd-2.59.0 | 1 
                 octave-11.1.0 | 1 
                 systemd-258.7 | 1 
              tailscale-1.78.1 | 1 
uhttpd-15346de8d3ba42200249... | 1 
                     wine-11.0 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/1ce9ebc5ef775b47718187dde15985caee3d69c0 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/47a0c50f76e7c9d4f8ac1b08c189d747e560ff43 | ORPH
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/c5b5bffc3a07d6df845dfa64beb75888fa437170 |     
    i686     |         octave-11.1.0          | NOK | https://autobuild.buildroot.org/results/f991f37ad18a137955839b4115562ac5db2d5b78 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/c06449254a569857625dec6608ca146649b65259 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/22d868afaf0c65b5897e1db65e605d82c463d0dc |     
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/8344e27b6318fc72d295c8939306c3dd1364ba61 | ORPH
    i686     |           wine-11.0            | NOK | https://autobuild.buildroot.org/results/c2d21514f349b734edeefffecf6e4711cb301260 |     
    arm      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/35f167436afb8a6ca8dea382054ee5d014fade06 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

               linux-pam-1.7.2 | 2 
                       unknown | 2 
          cloudflared-2025.8.1 | 1 
               host-make-4.4.1 | 1 
                 libiconv-1.18 | 1 
     libphidget-2.1.9.20190409 | 1 
                libressl-3.9.2 | 1 
           libzenoh-pico-1.2.1 | 1 
                 linux-6.19.14 | 1 
               tcf-agent-1.8.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/731bce857202fc379a2f76740b29c4c4d09f58fd |     
powerpc64le  |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/e797c3cff0b2334b9f03ee713684ebe63b955e93 | ORPH
    m68k     |         libiconv-1.18          | NOK | https://autobuild.buildroot.org/results/8b53d8581dee369635ecd0068764aa40762cdb22 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f18b386ebe7dc1f8bb33bc6f7dbc815afd6817c9 |     
    i686     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/34397456e7b4720e8bd6c39d23133b8b21429b4f | ORPH
    i686     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/bbf7518879c853c69f09b863336641b00cd010be |     
    i686     |         linux-6.19.14          | NOK | https://autobuild.buildroot.org/results/082395a0eeb967145da71a900313ec63b2935d73 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e66514df6470f5987ce23ad0e8a252cacdb72f8a | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/55f5ec6db2b744633cd4c17fb69d7328f534b948 | ORPH
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/41564754d3e591eb131d396c3d772fa77e386589 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/8393f5b3871f867f7eccd0ddf3b3d07bca82ec3e | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9784a4ba6d28d674a0b6de734e3e12233d827364 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/94fbb461925482a0e0221a3eec46ea83d4e703b7 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 5 
                  ffmpeg-6.1.5 | 2 
        ltp-testsuite-20250130 | 2 
                memtest86-7.20 | 2 
                  bcusdk-0.0.5 | 1 
              e2fsprogs-1.47.2 | 1 
              erlang-26.2.5.15 | 1 
               freetype-2.13.3 | 1 
                    gcr-3.40.0 | 1 
glibc-2.41-143-gfc7a48bc9e9... | 1 
  gobject-introspection-1.82.0 | 1 
       host-nodejs-src-22.22.0 | 1 
        host-python-lxml-5.3.0 | 1 
                 libgee-0.20.6 | 1 
                  libva-2.22.0 | 1 
            nodejs-src-22.22.0 | 1 
           oath-toolkit-2.6.12 | 1 
                   perl-5.40.5 | 1 
                    polkit-125 | 1 
             python-lxml-5.3.0 | 1 
          qt6declarative-6.8.1 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/2905b87578aa5ca94f7eb6ceec7a71752800ed73 |     
  mips64el   |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/bcc644febdee1c5b1aa3ebf652a30453815ec3cf | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/83fd683db300c55698fc17ff22e866bf1307da97 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/919516e04dbdb0f812d7f929b8bbe8955ffe0302 |     
    arc      |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/909c66ab6869bf2d9772f41b12591a463b96db51 |     
    i686     |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/69f9e9020d4ea224b12528827818a0e79fd6115b |     
    i686     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/54006b1aa875fe04c399f1471efd5a792628cb01 | ORPH
    i686     | glibc-2.41-143-gfc7a48bc9e9... | NOK | https://autobuild.buildroot.org/results/cd0acc0c65202a32cf7623e02118ba142fa84449 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/14869e06241619651d1a616f7de44993007e887d | ORPH
  riscv64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/2aa06105f339fe90ac39306bd29a5a47efeca6d9 |     
    arm      |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/517b2ec60127d11ba9f442a89ede7b55ca347479 |     
    arm      |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/9803fe192b1b6f14e430106bf416b8387ba8bef5 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/41ec6dbcba8e63a0a302a2a0f31525551e42e66f |     
  riscv64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/0dd2b76fc7ffefcf418895aa68853e9baf54d127 |     
    i686     |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/69954cb042254bb05af48d2814f3dcae25325083 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/4a6d893281aeadc0965fdff5046fe33ec13897c1 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/e7599f8ef613cbd94d1acafb27786439327b4603 |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/5670b3a1f2bcb3072e17d36efc639efa5c35c590 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a9afb731e50c04aa94cbc831a999efeec42750e0 |     
    i586     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ae54772ae91f669e541776cfe251cc830e7791e2 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/7b008a76075a5ac58b19baa5dea28779cdad8e6d |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/3ead1b7e56f0ec2e21c29a7a8cc95170244fae8c |     
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/1d220a49a4c5b5ff4c7b1ae79e0c96f20727f86b |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/f9e00799c19bdcb6a57a5ec89215c3267ddda638 |     
    arm      |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/375ec9aa352a1aade19facb3e7154ad5ee91596b |     
    i686     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/3edc295265ffe0086ff565f9e20de902dd7a4089 |     
    i686     |       python-lxml-5.3.0        | NOK | https://autobuild.buildroot.org/results/1f2f556a25db280ae12bd632c947906500fa0da0 |     
    i686     |      qt6declarative-6.8.1      | NOK | https://autobuild.buildroot.org/results/ff5924247ed04b4a6aa3db852ab0ed3bfbb957a0 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5a1f605bd49a4e1e3df6bd32ff4b1be248d5d47a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

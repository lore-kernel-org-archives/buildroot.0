Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9EDC61DBD
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 03:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E713E807E5;
	Thu, 27 Aug 2026 03:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PrOQo6B99KF; Thu, 27 Aug 2026 03:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787801401;
	bh=unRCfwoD6ksAP/77wPzdtZh7EjfB+eWPSL6Ro4pVESo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S5cS012EitTDYY/PDRDHOdQ6MbgbzNNsHOJ3hHRZJRh9rpLfSkb1tp0GZAxk4ybRB
	 fLOjN3JP3c9yCsFizQpGMdYwcrvzM1zaW0XEXMX82Pv2hO8Fr0mDARjrGLjuA1HPQl
	 V4oR7Uh0w8uJdAvqVz72KlCsGqvWh8+nQpxjSO9oVn0oyxb0danpN+OqtYJg2ofATX
	 OmamEa1S4lQLBmwDYb8QHD6LjApIlfzMwIeBDZ01YWOJfnh33hNPQ0DI4K7ZKf7hTS
	 6XPnx6GDwBe49MdbwLZyQ0PK431+lyk0IAVErvowRM4R76KFrqPi7+tnqFW60/kHgp
	 ppnO+pFbd4cig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60CA5807A1;
	Thu, 27 Aug 2026 03:30:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0813C334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC94460633
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Cj8YRp08dmW for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 03:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Dr85s3LT
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE1C660649
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:29:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-495437bb891so3114105e9.1
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787801394; x=1788406194; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9Rqo7WcFD/IsWa2Op1/PzyYDeQz6xycCPVEujKFGovg=;
 b=Dr85s3LTL/0DiaeGf7IVKV8GDscD6P3remFV55JkHmKx6MImr+3xspQeKReyx1hXBz
 p25lGFsWG094I35iLGJruTorykKp7tZtGf0WtZsTslMcE08jfoBYzomQI9YrNFP7fwPG
 73AdSiABvadHpnQtOSpdguWeRssiNbHB0M3SVlgpcKWzs6InJBufwNa2VP70slg8F4BB
 antnOlrWSJ+Sj7fStagQs+4bDGxEWOGj+4YJhnX/26o193KN9D9EI1aw/NXkFtoUNiqw
 ZqqOmyYwFYDeC4LDnDZmaSItKlNBkC3CeL04ykva4nMeyngW1jxF5yZ0x9j/GJ30tg7Q
 G6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787801394; x=1788406194;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9Rqo7WcFD/IsWa2Op1/PzyYDeQz6xycCPVEujKFGovg=;
 b=cPqMlzuZ30u/nnAk25t/a7eOJgRnXuOykcYj++0nzi1REcrWPuHHxMOoelPMRG4fnG
 WprAfknYTCWUKyEjxePs8EcF+PU8LTwGniswC4X5WQfJNC9stcTyc0kSjVmiK3yBskdQ
 uLKzL540RWUmqz0Lp54gTM5gNeUuqCegSr+3CbOMUo9YIj2vqw9L0WOWALj4OyvrJgx2
 IsB7dfWXdS3uBBG7hwWmr36JMhNdBaHKePFKuQ7qVr5l0Ctuz4+gLVCVnra90SB0eHa4
 l1QuWL14UBsGAsiKUXxbIuIKHvpxVLY1ziAPHEFYHQIWh4M03nwTWm1hCATBurx+8K7c
 +95Q==
X-Gm-Message-State: AFuF++k+vC7vEsNWsYy9cwcMqAUdJEWsFr+BLoGwliVVlDCGKPiZbG0l
 gGx9lBQEZP7NwDKUzlNdRA7+wkVAufHJfaFplDPNknySDqTjIJQdCyXHJ6p2EJki
X-Gm-Gg: AR+sD11rs+W/9FihIxZ5O5G8DRtEfo5UXdiZUz4x4K7oGKk1G2gFWn+/AD8YgXgDzlD
 FRto66tiT6T3xyhdXDhz3r4cIYTPHzz/+iiio2LfVNwxYEGc17o6lqqR44KY7xsLkE7P4mK+POo
 HWBTInrTjMIPmm8SCk0aswEZ5fTsOIdM1I4vHl5p8lcNIM6ws73IaSPV0e3F5BBhpK/0f7Sjcp4
 5o3dqPntMsTfiKHnlGB6Rj9Ka4OVeb8BfuVolodlneK/PVzGxkwcbGKnG2VKiDdkNLw/2vO6/aR
 frPAN4YhrSHLznCKg35dbKiqtJRjzMDUWC4uKT7qGPivOT3BEZYcRJdur4lZH10kWFpJBkBGs00
 CqP4wAQhNuNmZIlCxegUmVMlc/1vQjNg5CjDnminj9ShEnzDDVWICWR6ZIfkMgWKea4HbBNCrpa
 9UKQvqGAQyQfbpufUgWqTiSr4bgg7qwgoPUaxMPqLj171K172kYiZ/u/4KxhG8nrk=
X-Received: by 2002:a05:600c:3e8e:b0:499:5f80:83ac with SMTP id
 5b1f17b1804b1-49b0dfd7d2cmr36907395e9.7.1787801394307; 
 Wed, 26 Aug 2026 20:29:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b49236652sm17161625e9.2.2026.08.26.20.29.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 20:29:53 -0700 (PDT)
Message-ID: <6a8faf31.78c1dacf.48ab0.b2f6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 27 Aug 2026 03:29:53 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-26
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

Autobuild statistics for 2026-08-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 26  |  0  | 35  |
  2026.05.x  |  2  | 11  |  0  | 13  |
    master   | 31  | 86  |  0  | 117 |
     next    |  2  |  9  |  0  | 11  |

Classification of failures by reason for master
-----------------------------------------------

               tcf-agent-1.8.0 | 4 
              erlang-26.2.5.15 | 3 
  gobject-introspection-1.86.0 | 3 
                libglvnd-1.7.0 | 3 
                  linux-7.1.10 | 3 
        ltp-testsuite-20260529 | 3 
package/vim/vim.mk:88: host... | 3 
                       unknown | 3 
                   bird-2.15.1 | 2 
                   dante-1.4.4 | 2 
              fluidsynth-2.5.7 | 2 
package/vim/vim.mk:87: vim-... | 2 
               pulseaudio-17.0 | 2 
                 systemd-258.7 | 2 
            18xx-ti-utils-R8.8 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                   atop-2.13.0 | 1 
                    attr-2.6.0 | 1 
                  bcusdk-0.0.5 | 1 
               bpftrace-0.24.2 | 1 
                    ccid-1.5.2 | 1 
             dahdi-linux-3.3.0 | 1 
        edk2-edk2-stable202602 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-6.1.5 | 1 
                    flex-2.6.4 | 1 
                   gvfs-1.57.2 | 1 
host-am335x-pru-package-5f3... | 1 
       host-gcc-initial-15.3.0 | 1 
                 host-gdb-17.1 | 1 
                host-lzip-1.25 | 1 
    host-mender-artifact-4.4.1 | 1 
       host-nodejs-src-22.22.0 | 1 
                 host-tar-1.35 | 1 
            igd2-for-linux-2.2 | 1 
                 imlib2-1.12.5 | 1 
                  iozone-3.508 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                    lftp-4.9.3 | 1 
      libabseil-cpp-20260107.1 | 1 
               libepoxy-1.5.10 | 1 
                libgsasl-2.2.4 | 1 
                libkcapi-1.5.0 | 1 
            libnetconf2-3.7.10 | 1 
                  libnl-3.12.0 | 1 
     linux-5.10.254-cip72-rt32 | 1 
        linux-headers-5.10.266 | 1 
              luabitop-1.0.2-1 | 1 
                  mender-3.5.3 | 1 
                    olsr-0.9.8 | 1 
                openocd-0.12.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
                 pixman-0.46.4 | 1 
                  prboom-2.5.0 | 1 
                 protobuf-35.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 rtptools-1.22 | 1 
                    sbctl-0.18 | 1 
              tailscale-1.78.1 | 1 
                tpm2-tss-4.1.3 | 1 
                 uclibc-1.0.59 | 1 
ulog-0389d243352255f6182326... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/09c58c9be35809b1f77361a6a5c40f940862e212 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/709487b5fe507979baed7e963294b985de71c95c | ORPH
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/d8af109d43a36c7dc968e0501ddb87542ce0b716 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/ca87c05f7b3a526f7a5c4c5e91d4e4348b594197 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c1f98e29d049e277d0be22094ff95ddc8440f32e |     
    i586     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/75593ac8b300443911d470cd067c7a4933fd0132 |     
  riscv64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/3642f1723ee856d737c8a1b74a8186f0d6cb25c2 |     
  aarch64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/a3e3fd696685864977c688aa11c2653357cf6207 |     
  mips64el   |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/775314104af1fd7d3dedcd77392ad5313a0531b4 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b847a1f71d42679c3975c7ad38309203dbac735e | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/d157621638f22d78c8de450aed2646bee035fa85 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f92b34d51b0095d2ae345c67881669e6872fd99c | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/df5b3ab241ad2d382c02ba58dcc1cd25b57f6ee6 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/bd2d5b012aad992442b846cc81548c89f0c7d419 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/0dd34f3094bf910f69eef3f6f1badbec56c8f8a4 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/94e19694bfc2d5564153de73741d6c61821ea997 |     
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/2d13b2912e8b4dbed5381fb6b7c9aa2433dfb50c | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/f9a94a85e18331e542840392a858183ae8afe2a3 |     
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/aac730b57adb5b54964f1054de781750952ef7d4 | ORPH
    i686     |        fluidsynth-2.5.7        | NOK | https://autobuild.buildroot.org/results/eac819bc6e1731647b129f07eb4eb3f08840b5d5 |     
    i686     |        fluidsynth-2.5.7        | NOK | https://autobuild.buildroot.org/results/048df28f6ab97a16731e62d7f56c6eba565cda63 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/b20e25c26fa2c3cc6216b292b7f8d2ab37f8971d | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/6a65701ffebf4eaf8d86f023ed6b0c5507fb8a8c | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/f227032152f6ceba53bd1e851a0349832855ac3e | ORPH
  aarch64    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/47c723ba363d18da9914713b2f41489641a2050f | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/6c3967e4de2d9b4926c8b1c68d33122218fb50a7 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/e440c941586cf78d53a189cb03869d9ebaf6a0c6 |     
    i686     |         host-gdb-17.1          | NOK | https://autobuild.buildroot.org/results/922fe1bc454c386f27148b146892239e8238c94b | ORPH
    arm      |         host-lzip-1.25         | NOK | https://autobuild.buildroot.org/results/a37c32ec385632af2a01ad785abfd0018e69db5f | ORPH
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/fb550e7d60d89924f8649872f079de5b11b2443e |     
powerpc64le  |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/54fe6e35ccfe600b0af309c4a9dd7659c1919668 |     
    i586     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/58376de1a1f0813a27edf520e65044a96c918407 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/95cb8dacbf9fce8bb4603cbfbc847b9d54d69a75 |     
    i686     |         imlib2-1.12.5          | NOK | https://autobuild.buildroot.org/results/9bbf3f90f918460c1d915619c4da56d947bec26e |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/3dde2629b1034365f8afbef79043b0c703dd2798 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/40f0797759ef5debd882a97c085fda603ffcba05 |     
  aarch64    |           lftp-4.9.3           | NOK | https://autobuild.buildroot.org/results/54be80af00b11bd8ac8341ebd0b9b7bc71345a23 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/ee4e0ecceb63d306fa55e2c8a968443aad0accde |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/c6f791adc65e45d0d5c43c922e77064ed5fcccf4 |     
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/d6a328c85d5371dcc5434a35a82d47a3218ae508 | ORPH
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/35111972c3688733895db9e5357c54b0799169ae | ORPH
   mipsel    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/8c0aa75050b918907fe37fa710415da0eb1b59d4 | ORPH
    i686     |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/3052d2eca37b89261aad04996fc3d473787c3444 | ORPH
    i686     |         libkcapi-1.5.0         | NOK | https://autobuild.buildroot.org/results/9c83a3e070214711f4d666d0d1c8d1397f03342d |     
  mips64el   |       libnetconf2-3.7.10       | NOK | https://autobuild.buildroot.org/results/36f785950fda803c19e8d539e5198f585b8a9598 |     
  mips64el   |          libnl-3.12.0          | NOK | https://autobuild.buildroot.org/results/47f882482c0b1a90d9aecbcc2189e9e431f77697 | ORPH
powerpc64le  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/0a044d912258d8e513362b5ef32e01991c920492 | ORPH
    i686     |          linux-7.1.10          | NOK | https://autobuild.buildroot.org/results/d44aa4f62f11af5d07bd42dc91a94ae100bcd54d | ORPH
    i686     |          linux-7.1.10          | NOK | https://autobuild.buildroot.org/results/45b37b5203fb34e47189a57ddb27cba6a96d3fb0 | ORPH
    i686     |          linux-7.1.10          | NOK | https://autobuild.buildroot.org/results/d50dbe791a772be6081ca9160e15937b0b828afb | ORPH
    i686     |     linux-headers-5.10.266     | NOK | https://autobuild.buildroot.org/results/c9d23b58b2fbf7490f598a28ffe9a23390d7894a | ORPH
    i586     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/e1789c219f2d9207b9b4ce0c8f5e0e6d26c0d1de |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/43c3d50a519393d865f9dcbe4fda8c0b1172ec94 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/98e1cecd964a5fff25582475dc47f7004732cd28 |     
  mips64el   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/a5ac747104a6a3c36e60134f88ea52e7e41a1bb8 |     
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/909782e3359564e20fc1c6673edbb99575de2868 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/650edf74dec513ad540f80f4d3ef8c8222dfd711 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/1b6663e9cfce3290023d1605a18e0ea1761f33d4 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/79a87edb0eb718e975c4f2f69d8f30bc65cdc872 |     
    i686     | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/fe92f57c15cab36020925ddbd024cdc5a4531907 |     
    i686     | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/ac5c4dbec780bf13b477e989317daf53416375af |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/2f89edd6d4a3b8874d94951ce2cc802af3361e41 |     
  riscv64    | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/f82ff7a7d0f904dd0621836d2b72df406cc07e7b |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/4bc159ce363440e8166e32f9bdeeb2d6bfce5b89 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/95ced9c5ea86a2477bf50f029a227b35d5fc8e3c | ORPH
    i586     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/f08e8396b6bd77c31fd726e0d8a6bc86197ad26c | ORPH
    m68k     |         protobuf-35.1          | NOK | https://autobuild.buildroot.org/results/dd355b442e8023b703541542e786f477ede83694 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ddfd412f313ddeb373326b3557e559f1b269da4e | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5535fd3b3d54d1c02f59a5b292ac38f3db2559b3 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c85ff1e83fb332c9f18f940ace3055057860421a |     
loongarch64  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/badc16b30d9b27de0c0e9cfd6062b8a603046720 | ORPH
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/f4d4bf48cb0d36da514761c65625253b35464b61 | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/2ed10a2210a392194c8928aa69235d06b461c253 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/461dc5a6d1ce44797d2581c9e373f109ef463960 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/fa927f9906f36a974de2569c1c0245157b39017d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c308e2fda1341eee8fd3ed7fed1c4d1972b6a53f |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/882d3e7301349e44e45a0e9e98185145c4313ba2 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/09bb9cbda5dd7cc40c82160781f0c91b4fe5b365 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d074d1d99145223eeeb1640b8890f164c49af00e |     
powerpc64le  |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/2bf5020c22dc02beaadc4c45add725ecfb99dddb | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/a09468550a1685f6318432bee1b598400265c51d |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/15f8e69cc179e0dd84854a9f9aff4e6786f7f3eb |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/f11d9b7d83b126d4d3a770e8bc5064b3914e0de3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0e7d09b3dbce3f6dc09d4efd42e423e6d1eab961 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/17ad1d926987b18d0761cb3e7900bccfd2c9170a |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/e6e6777a40d3935d01d1542c4a66ed354d42e72c |     


Classification of failures by reason for next
---------------------------------------------

                  botan-3.11.1 | 1 
                  dpdk-25.11.2 | 1 
  gobject-introspection-1.86.0 | 1 
                       gsl-2.8 | 1 
    host-mender-artifact-4.4.1 | 1 
              jpeg-turbo-3.2.0 | 1 
      libabseil-cpp-20260107.1 | 1 
               libecoli-0.11.3 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          botan-3.11.1          | NOK | https://autobuild.buildroot.org/results/d74d46eecaa472592f918b480d5e065abecae9ad | ORPH
   x86_64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/036e06493ed177c84e4294d6988bbf758a492416 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/61d8ac6b0753adc9e10e891e3e29921db7d08418 | ORPH
  mips64el   |            gsl-2.8             | NOK | https://autobuild.buildroot.org/results/572a553d0b9f4c83e7c9c60e6d5f2859fcafae31 | ORPH
   x86_64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/430bfd7ae5c24054812703aba60ab296ac3d6461 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/8e18bb311c253c2ee3a1be56cb4a3deb0b7bfd7a |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/835a39664ac45b90c1bb533fff7a2c36b8738364 |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/e2e93c0826f7a7525c58b99581ff1c5f34828ef8 |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/c1eaed6189da8574468f0ea8ef99c2905c6e6132 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

               tcf-agent-1.8.0 | 3 
            minizip-zlib-1.3.1 | 2 
               collectd-5.12.0 | 1 
                  ffmpeg-6.1.5 | 1 
                     kbd-2.9.0 | 1 
                 libavif-1.4.1 | 1 
                  sysprof-49.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/03249e5563c743347833103458d5c696e7ca878e | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/40d29d9940d35e2c694b632222d2b4ba831245a2 |     
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/4a37b9d800c2833767d030338a6b17e956dc4ea9 | ORPH
  riscv64    |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/d16a3ffbe841a205acb181657e3626d4581ff807 |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/874a2e5c7f750fcae41d4a27671fc780a3476086 |     
powerpc64le  |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/6baca98c95c5c413de214e35e5e87dcba320e48d |     
    i686     |          sysprof-49.0          | NOK | https://autobuild.buildroot.org/results/4e8dec81ce5f950cd707583a35933caae2ad9c15 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/63e87eaf27af23f775c70fb777f95c907e82255e |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f799fa37d61ba471d52726156891264931fd3617 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/763880c4b8edcebecb748af6b52b1fc84b19c5b2 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/eae5e0e92b2cc895a7841644af789cdb93b63eec |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 4 
    host-mender-artifact-4.0.0 | 2 
                       unknown | 2 
                    ccid-1.5.2 | 1 
                cryptopp-8.9.0 | 1 
dtv-scan-tables-7098bdd2754... | 1 
                    fcft-3.1.8 | 1 
  gobject-introspection-1.82.0 | 1 
host-autoconf-archive-2023.... | 1 
            host-mtools-4.0.48 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
              libmodbus-3.1.11 | 1 
             libtorrent-0.13.8 | 1 
                memtest86-7.20 | 1 
                openswan-3.0.0 | 1 
package/linux-headers/linux... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
rtl8189es-6b4cfb5c37f10c099... | 1 
                   swipl-9.2.9 | 1 
                wf111-5-2-2-r3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/b1db41e22d64867214a11f8cf498d65179bf1e40 | ORPH
  aarch64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/2d470e6eddb6bb10b7d060245ce6cc4ebec9c8d8 |     
    i686     | dtv-scan-tables-7098bdd2754... | NOK | https://autobuild.buildroot.org/results/cfbb7db2e86c2035166995c9dfb91b60e8c86b04 |     
    i686     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/20eeb4e14e64f8bb283b92b68ce4a402b739ac48 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/abd7ffdaf84da0095a0238b38e05190c64f82559 | ORPH
    i686     | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/bd51837eaf20e3c34ad38e68604f10799fdff838 | ORPH
   arceb     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/051e0fb756c10583eef640439211cb3121b51e4c |     
    i586     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/f665878c5c01937decc1e24c08472c4f59ec1d75 |     
  aarch64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/a347fb99d03810f17e216f8de6243dc08dfbc852 |     
  mips64el   |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/c725a826f4f40849e2939bb4c0cd107ed3165462 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/6a67a04dbe6e1615fb7e18084eee212b0fc3c91d |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/aa495c049d1258744d4d14397225ab3b082f9ef3 |     
  riscv64    |       host-mtools-4.0.48       | NOK | https://autobuild.buildroot.org/results/f010cacf7a663dcde3f20bf55cc940a0ff0bdccd | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/8fb7637d147f5a2559541a82af3ad212343fe025 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/d916baa8e037eacb13eb8d851cb2a308567e7136 |     
  aarch64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/161cf898aeb6c4e77942e69b91626714286d8691 |     
    i686     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/abc952b80c7dd386e35b25a19bb24ae681f07a9e | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/8a1c069bdc89b28a9c828e91fea184f0a5a54ad5 |     
    i686     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/1413da79bf76586d310fa7e2f4c6053bbd7296cc |     
powerpc64le  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/2dbda511d1b41a40ddcc0cf0d33168d122357c4e |     
   arceb     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/bfbd29ade48b2c0e46139a7e0e81c102fc3666b1 |     
   sh4eb     | rtl8189es-6b4cfb5c37f10c099... | NOK | https://autobuild.buildroot.org/results/eb4beb05ddf8a96ddbbff569ba1ff7dae09accb1 |     
    i686     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/3bf5b23e619bcb510b3ad41c6be1dd1791dce81d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f1e10d22a669f9f0d122c69b6af99f9378d0bdc6 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/07c901ecb3223154360affdd3a041d345c0214be |     
    i686     |         wf111-5-2-2-r3         | NOK | https://autobuild.buildroot.org/results/b0ff8389e7f7f6757ad48e86e3c7d2de9a42e2a8 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE67E77188
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 04:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B48BA80D4B;
	Thu, 16 Jan 2025 04:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ProJwydQ7rCz; Thu, 16 Jan 2025 04:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9332180D11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9332180D11;
	Thu, 16 Jan 2025 04:17:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38AE0B89
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 04:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26351608B9
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 04:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ax3257XhcFoe for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 04:17:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92208608BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92208608BB
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92208608BB
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 04:17:46 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3f57582a2so3397221a12.1
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737001064; x=1737605864;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=05PrGt5QbV2ZqdT2T5zWq1e4SohToOit817wo8wRE8k=;
 b=cXPhj6mqHCdVs3t+KRl+xAkLiSk6gGo6wLoeeLNJ+wFc/74qvRljmMQnX20etTPNHh
 A4PI2Iqf1iYNIroNjAlu2neALKXPyk25q5cXv/7cA6BGsZ2aQOO/vbJfSK2HDMTWa7yr
 b3NSH2kfjuVLimKGUv+Pm2vXPZ/Uk5TX+pfYDkWUzJLTnCClunH076U87JpP1et2L6q5
 yO2WufFxNvJjbTggbvR0zuaW4GOHwJ5HnPdnfgaWUP4K/fh9Hvdf8xGcfu908oqQcjbK
 exs/Aym6LG1npdRO3n4hDzj3yii168hGWzDYKo9Akvn6+HgrahhVk1jpZrD1IjrDcwUI
 NaRw==
X-Gm-Message-State: AOJu0YwEyeEr+nzTRXTK70KPwsoINVlNXfU738tuWF4yyzGJfuKBWVTy
 dNs4dLFhDkTgUIpU1IjZuKhZs9LKygaOOqMlGW1xC4lwiNmFOtNBsdnqDg==
X-Gm-Gg: ASbGncuAIvZx1adNSbVpwi0+96I7UqDYnz3AE3dx2M7+4+wljE1RX3xpQDsmexwDbVW
 iSCYdGcRwdoCLbFy5AB5lCl2kCCnZd5WSqRtX9VirrlUXIDb5A9AK3vrlkIFcCq1GO79aO7RFRJ
 WhOfrOKFpS/zqFGvgy8okTQ4OFm+xRms3CvZw96WSlhzGK3i4KcH37dVHGkcXmM6T4FDbDQF0ZH
 8WilLB2t6m385VxUsOZ9o3lrzffLbOI4CLdDfbgkGxwy32sL6E3e3L5kBTE
X-Google-Smtp-Source: AGHT+IFK9fneV7UV1mMG7uN+5eb7YYzMCJwfXUi0iWLGesrAu4GC7AFakg+rUAM2rYOppQNRwFpgDw==
X-Received: by 2002:a17:907:9905:b0:ab3:3283:faf9 with SMTP id
 a640c23a62f3a-ab36e433e77mr95242666b.24.1737001064235; 
 Wed, 15 Jan 2025 20:17:44 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9564857sm857700966b.96.2025.01.15.20.17.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 20:17:44 -0800 (PST)
Message-ID: <67888868.170a0220.be445.21dd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 16 Jan 2025 04:17:43 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737001064; x=1737605864; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=05PrGt5QbV2ZqdT2T5zWq1e4SohToOit817wo8wRE8k=;
 b=XzQ0Wh+Cl31xeXo1egymlMdRzDc+gWXeyxcHbAPk0qKGfr0jIrzev+mWr5RibekxVX
 tsHPV1z37jr856mTEJ2JgXgReTp66V7Hv3I4+gXdEZTJgZ2MKQfBoB+hkZ1VJ7xE8Tkj
 tN7UqS2N7feuiT8Y6dWgEc/RXXnHq5tiJZk9zjvagKp2mwRuTg4Wkh5jsJafPQk9CTQA
 CQQz/3JZeVWy+bvnwMiqjpOv+AaN286ECTQOipZTGe/v28WD5e6ZufGBsAGyLKSYem6X
 3IA+viV5iXeqoqwvpambR/whajpHXkP7wRdbypInjSpICOgg0MmvuSFtgP1aC+qFNQai
 myGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XzQ0Wh+C
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-15
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

Autobuild statistics for 2025-01-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  5  |  0  |  7  |
  2024.11.x  |  1  |  5  |  0  |  6  |
    master   | 14  | 41  |  0  | 55  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 3 
                 hddtemp-0.4.3 | 2 
               iproute2-6.12.0 | 2 
                  ramsmp-3.5.0 | 2 
                       unknown | 2 
             util-linux-2.40.2 | 2 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
                      fd-9.0.0 | 1 
                  ffmpeg-6.1.2 | 1 
              fmlib-LSDK-21.08 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                  fwupd-1.9.20 | 1 
        gmrender-resurrect-0.1 | 1 
  gobject-introspection-1.76.1 | 1 
            gstreamer1-1.22.12 | 1 
                   gvfs-1.48.1 | 1 
               host-runc-1.2.0 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
          libcamera-apps-1.5.0 | 1 
               libglib2-2.76.1 | 1 
              libopenssl-3.4.0 | 1 
                  linuxptp-4.4 | 1 
                lmbench-3.0-a9 | 1 
        ltp-testsuite-20240930 | 1 
                  ntp-4.2.8p18 | 1 
                   perl-5.40.0 | 1 
                pipewire-1.2.7 | 1 
               procps-ng-4.0.5 | 1 
               pulseaudio-17.0 | 1 
               tcf-agent-1.8.0 | 1 
           v4l2loopback-0.13.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/65542a1c72975e58ab15e56e910a4d64b35a22b5 |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4c6f0625b3ec0a227f62741bb4eee62f9ec2cabc | ORPH
   armeb     |            fd-9.0.0            | NOK | https://autobuild.buildroot.org/results/8b9f1785e9071092f470c66ba5a350dc562aa37a |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8067f7adeb210e63b93db44f9326f4bf9b062dae |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/9a2d17648fd5ceda8420bf94a573fc92a2d09714 | ORPH
   mipsel    | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/af7e0f105e292b7e81308a7fe776f075a1459f46 |     
   x86_64    |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/badd2451790b338a8b1afed4b68f1f7f5ee8b3f1 |     
   s390x     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/a3b29f273039170489ce8889c6790eb76cb626f1 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/2e0fec4da5384db0d445e7248ae75072712c9c79 | ORPH
    mips     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/82819d0d7fe3900d5fc08ba8a1d280e8237bd762 | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | https://autobuild.buildroot.org/results/6eadf1a25c7a21dc7e2e94a2af8c3fe0b99851b9 | ORPH
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/4667108e250869f765ffac91b41d7117c248c2f3 |     
   mips64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/2670819ab71c23e97e6c6c58c109c16500d10389 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/84f80622f16639199f445b7f218272c7b5d9fd66 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ac6f4d743f98f2f3e298eee6adfe04d12abb9b24 |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e2b258a1c8077d949eb163f6f28bbcbf0704a5a9 |     
    mips     |        host-runc-1.2.0         | NOK | https://autobuild.buildroot.org/results/37d3234396159905fae23750d1fb45f79d7eca9e |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/7fc30112e70f5e7b434de8c8d1258ba6a26d268f |     
   mipsel    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/6b0469e05fcc509e8ef69124519d8dd45885bd9f | ORPH
    or1k     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/ae51e6942d7112bf8d0064e36e4059661b71da95 |     
    or1k     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/3c917a08a58cc9b3845c7c6a871a24699c6abcde |     
    arm      |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/837cc2e42450f709a96ccf0e5ad45aa2fec3634a |     
   nios2     |      libcamera-apps-1.5.0      | NOK | https://autobuild.buildroot.org/results/214ba8aeab3b081b486438c095b162cff562744a |     
microblazeel |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/ee3221e4bfdfc18960eb037f7e69804f8359fa46 |     
  riscv32    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/cf71670381dfb6c39dc266248e4899cbd9abeaf6 | ORPH
   sparc     |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/1a6641838d88e79386e984637ae5e99cbd5c8608 |     
    arm      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/d1ebcfd89559f37a43a0baf2b7bbf9a774e84c9e | ORPH
    i686     |     ltp-testsuite-20240930     | NOK | https://autobuild.buildroot.org/results/35691ca0eb54438422f2a04eb291a2d1d89c917e |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e9bfcdfda502781edf39b83d43f3e0a0cd00c32e |     
   x86_64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/536c055f3436faa3bcf7684cbe624c0ab9210b90 |     
   arceb     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/6a6299e9a835a64b44a1854503aec495f1d6e412 |     
    mips     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/c8c5b8e6680488796fc1ee5ac10d133af5d5874c | ORPH
  powerpc    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5328c9438dc000bcba9ba41df340bfbc7e450add | ORPH
    arm      |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/0ca4777ec965e597f749092df5c9722ad1961ca2 |     
    arm      |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/1a81ae7c251aa5f400e95fb1dec68f32391b21fa |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/44c9aa25e739bb2fccbcd8f6f138c5d9f01d370e |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/011827df38fb555226a41168a7e70525230cb45d |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/cfbd161bdcef28c46f69bed65a742319d4e11c90 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/64d20e1a16606db9e87bb12590cc5ee81fa13e90 | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b9feb6b63e402c14196044ab44042b54deaf4ed7 | ORPH
   nios2     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/d0d900621b9a1cac134c5f765b0377654e999736 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bsdiff-4.3 | 1 
                   foot-1.16.2 | 1 
     host-moby-buildkit-0.11.6 | 1 
          linux-5.10.162-cip24 | 1 
          moby-buildkit-0.11.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/f3e0bcc12f31669185455c247eeb79c08047b9d7 |     
 aarch64_be  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/00ff2ac345ab74e1d1f95aeeb06dc7b9df83326b |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | https://autobuild.buildroot.org/results/4b205f0f095b5461a20ae6577850fede233efe8d |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1d788b5ffaa073f1316b295695fbf65b9d4c18de | ORPH
    arm      |      moby-buildkit-0.11.6      | NOK | https://autobuild.buildroot.org/results/4dbaa6250cac31d485923f2cffadb794bbf71f5c |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
  gobject-introspection-1.76.1 | 1 
httping-0e26c53d5fe504eb720... | 1 
        python-selenium-4.26.1 | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e0420993a2bb76ed961196c00aba1bd9ed8a2f97 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b18e31ccdb2a117d16add8eee55f4209d4f0eccf | ORPH
   nios2     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/1df2d0f69e3a25ffc8f132d00dd2be8b057f4bbc |     
  aarch64    |     python-selenium-4.26.1     | NOK | https://autobuild.buildroot.org/results/6dc9e9ef4417e45e244e8ddf5293bda764573921 |     
   s390x     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/f0399144a6f98794e117f82dec146eda982f12d6 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

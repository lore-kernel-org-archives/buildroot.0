Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347A7CCFA1D
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 04:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD1F7841F8;
	Thu,  6 Nov 2025 04:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NC8L3vZEm9HB; Thu,  6 Nov 2025 04:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F1D841F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F1D841F7;
	Thu,  6 Nov 2025 04:21:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72373462
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 04:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 586BA61461
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 04:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxGkbvVjJXnw for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 04:21:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 950AC61455
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 950AC61455
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 950AC61455
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 04:21:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-429bccca1e8so319770f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Nov 2025 20:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762402908; x=1763007708;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ykIvq3oLmzrCMqt21uYAdLjZBotOZ0L1PAHmtioSR8=;
 b=W1e8Kl69hbKhtodfbCH+0Ec1RN/GwJGMBnw+Qf3t/w5fttyp/J5eI6OtcBpb26IS6B
 TR+CEhxe9Y2tMLQyyLo6Q47bD0c41FHc5P6U9MiJza9gL0WeAE8ZS/gNpDEKuYkBt1W4
 UjRtuvAG80/H43TlgMssFHCq7VO9Ojs2bKBq7xr4tWBc6ZH6HJVGrTsHnp3TrOCxRqgN
 our5RvOxfzEoD/fM/sFWOC4ZF+yERj+OoHrgtvx3ayu6od98OlWXx6G9sGBPkZy1rxRY
 w5f89hmCFbjg8ag86ZpeH7FQm9US9YOjdRfv4sH/qF8pC+5ZVAjTNwgSrJ62v/2xyXIQ
 prDg==
X-Gm-Message-State: AOJu0Yzuz9m45HqW9hW7lhe8cOgDN1N0GbM91yO9STkMvbPCWBzL7+uX
 WbOo+gOvrtP61EkJMyO/fXMO8dwCh/fBtC24mOlWaWUlWlAivAoIjJOSpicATg==
X-Gm-Gg: ASbGncvkXwe5IWFn/RbA0DZ7mOx42KCaTa209LMKKOCYZewPEUyFlxCn28w75mbLBUS
 zSwmlgvSxoP/m3H1fgqkPEC13MWbvny7tWbVAEW2yzvy2OFzikezUAqftT1Ux6UI2kFEC05H1BD
 x0uB39Hpj5VSAaFlx+z3UqtE722t6tYGBRIYV8lmqSVSDCLhplZW3ViaZ7Xgte+tcpWOFEl1wFu
 cvhXqnWOkCdDgnp5ejTAsSR3ZV4HNU/MT3z4IS+mG0Jw7TXekuJvh+AVxtRJGsajFFj7fP24Yad
 PAHzuDJKcX2QZJZMjRN34k/7zJz+NofTpQQIO//PzuCbdtnYXdZ1iNqaULj9WrYQFq82MTU8P37
 ghBtL612N4p5CNO9eNfJpkKsqddfghpsQgeLD5/jfikLoHW6T3OimEG/iX2UOx64kuQfzFRYuuE
 TuMM1/YrA=
X-Google-Smtp-Source: AGHT+IH29eHr/xOh4e+B9wHpZDs8h58SbkEFJBvlHwDBG/hiiYEOfTeBNxqzwVquZvnQF9DpRP7AwQ==
X-Received: by 2002:a05:6000:40db:b0:429:d11b:9ecd with SMTP id
 ffacd0b85a97d-429e33138dcmr4632063f8f.57.1762402907968; 
 Wed, 05 Nov 2025 20:21:47 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb4106e0sm2411976f8f.11.2025.11.05.20.21.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 20:21:47 -0800 (PST)
Message-ID: <690c225b.5d0a0220.1f8729.57fa@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 06 Nov 2025 04:21:47 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762402908; x=1763007708; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5ykIvq3oLmzrCMqt21uYAdLjZBotOZ0L1PAHmtioSR8=;
 b=haPZv6WS4W37/cwIWF7y1WRuCXqQ3jPnkEwpuL1NeigJ+kgk3rO2NpmV87iP3AvZV4
 9eXUKeUGn65JhO+iIkyxbeFImIqKS3zGnJke6V5A4KoSFPu8nf5hNZ3NpkxjFlXn8Ijh
 74+aZbokMhzJcUqwB6TLUeojYrX2j5GzXFPzadvW1xSwDin9aDbfp7DqcjnxOB3fdXdL
 x4VhkalT9fHpwMovBfjiaNL5pSzOG5shvOIK2waigCT/jLEn3FmI4jdzt9N8wyXPx6Zs
 OgcEv5BNf8FSSeB/pXjn1U88neLh8PxQE9cy4lHNMXngk0GfHJ9LyZiwxMYk398Wm1El
 6Abg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=haPZv6WS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-05
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

Autobuild statistics for 2025-11-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  5  |  0  |  6  |
  2025.05.x  |  5  |  2  |  0  |  7  |
  2025.08.x  |  3  |  3  |  0  |  6  |
    master   | 29  | 103 |  1  | 133 |

Classification of failures by reason for master
-----------------------------------------------

                  libnvme-1.16 | 17
                  janet-1.39.1 | 4 
                   libcap-2.77 | 4 
                  libsvg-0.1.4 | 4 
              host-swipl-9.2.8 | 3 
                  iozone-3.508 | 3 
                       unknown | 3 
               bctoolbox-4.4.8 | 2 
             dahdi-linux-3.3.0 | 2 
               dvbsnoop-1.4.50 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
              host-guile-3.0.9 | 2 
              luabitop-1.0.2-1 | 2 
                netdata-1.37.1 | 2 
                openocd-0.12.0 | 2 
                python3-3.13.9 | 2 
             alsa-utils-1.2.14 | 1 
                      atf-0.23 | 1 
             batman-adv-2024.4 | 1 
                  bitcoin-30.0 | 1 
             bubblewrap-0.11.0 | 1 
             cni-plugins-1.7.1 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
           dmraid-1.0.0.rc16-3 | 1 
             docker-cli-28.3.2 | 1 
                  dpdk-24.11.3 | 1 
                enscript-1.6.6 | 1 
                        ffmpeg | 1 
firmware-utils-86739f2b3ae9... | 1 
               freeipmi-1.6.16 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  gensio-2.5.5 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.84.0 | 1 
           heirloom-mailx-12.5 | 1 
host-am335x-pru-package-5f3... | 1 
         host-gcc-final-14.3.0 | 1 
                 host-gdb-14.2 | 1 
           host-openocd-0.12.0 | 1 
               libglib2-2.86.1 | 1 
              libmhash-0.9.9.9 | 1 
                  libnfc-1.8.0 | 1 
                  libnss-3.117 | 1 
              libopenssl-3.6.0 | 1 
              libsodium-1.0.20 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                lmbench-3.0-a9 | 1 
          matchbox-panel-0.9.3 | 1 
                    mpir-3.0.0 | 1 
              netavark-v1.16.1 | 1 
                openssh-10.2p1 | 1 
package/python-flask-cors/p... | 1 
                   perl-5.40.2 | 1 
              php-xdebug-3.3.1 | 1 
procrank_linux-21c30ab4514a... | 1 
               pulseaudio-17.0 | 1 
                 rrdtool-1.9.0 | 1 
          sane-airscan-0.99.33 | 1 
                    sdl-1.2.15 | 1 
                  snort-2.9.20 | 1 
                    sslh-2.0.1 | 1 
             strongswan-5.9.14 | 1 
                     unzip-6.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |       alsa-utils-1.2.14        | NOK | https://autobuild.buildroot.org/results/168930125b2db9216220cc7195fb4a79a2f6f5ea |     
microblazeel |            atf-0.23            | NOK | https://autobuild.buildroot.org/results/09b0109342a876627647fb8b59b38f75adaa1680 |     
 aarch64_be  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/7b83e88b9b028d5557fcc3d172d5f1df28ff3d07 |     
    sh4a     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/afbc83093f4648a2cd149af9dd68152ec79568fc | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/00f6a73a4ef71bf520adcb7aeafc9dadc9708e56 | ORPH
    mips     |          bitcoin-30.0          | NOK | https://autobuild.buildroot.org/results/f1464610ffe7fc2924a62743266a1ef2252ad51e |     
    arc      |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/2d0662c0ae0b1df78378bef3ba7cf6443e8bee6d |     
  aarch64    |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/9ec16f88bc28e7cc717ac3334a702495b2cafb26 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e3f4b0a3e5346f5176eb2128cd6817139050f2f7 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3247031caec24929cd6ee0671f8d79846e38a361 | ORPH
    m68k     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/89da41d6b314f575012c19c015f8461a96d1d5bf | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/8ad40500022bc96fc01d78477b2a759d7bac37f3 | ORPH
   x86_64    |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/1f1416aede3ba488aafdd109919da40353813d70 |     
  aarch64    |          dpdk-24.11.3          | NOK | https://autobuild.buildroot.org/results/3aba6ef27d266037a6b809ddaaf584df7d30d860 |     
    arm      |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/ea6786248b9ecf0eb1c1c1f7cdd0202462b75e00 |     
    arc      |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/83e0ada7bd26eda2ba276b503f67f603673bd72d |     
    i586     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/53376330867377dedd772c4b1739df98be1944e5 | ORPH
  riscv64    |             ffmpeg             | TIM | https://autobuild.buildroot.org/results/b791be82f0bd2dd85e2ffe2e09867bcf3e27d3b9 |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/a177b4bb6068e65a4391662a31bee35e219feb44 |     
  powerpc    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/292597c3c93855393925bce71c98e282087fd1ba |     
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/61b216659590b7dbf355cda08bb769acc54b64d6 | ORPH
   arceb     |          gensio-2.5.5          | NOK | https://autobuild.buildroot.org/results/4cb15b4aa8e2876c5d014390d035273e508e8195 |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/1c8a8142c8da8582de6e8b73d03355a3fa6f6893 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/79d407d65fd0c8e657b95cabab215f2b3816c252 |     
   mips64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/cef3fbe62dcbf9b61c911288311b5a6686d27829 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a975c7f1d37481c0fcadb9ca5a9bec198102bfbf | ORPH
   armeb     |      heirloom-mailx-12.5       | NOK | https://autobuild.buildroot.org/results/9ad595a6c3bc33bd332180b810681118d75715c4 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/72ebbf4377294adaf99ed85d86e7f7f232026a83 |     
 powerpc64   |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/2e0cab5c61ee0f199707803501ef25c2396971cf |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8dfd042bf9c5ab83889e9c178c7bc72feb64c670 | ORPH
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8b576429ff0bc61c030bb7b39232f74baf8886ef |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/189d1b6ad74727185bc7d2ae410fdd84c1933d1f |     
    arc      |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/0a97e111d21036dcccd1743b8a08f292eb731229 | ORPH
 powerpc64   |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/eeb8f0063340986319377ea783905faa12ba1116 |     
   mipsel    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/9a2ae1681c0eb3f99fb823fabb58e7cf91618cdd |     
    or1k     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/72dc3998ab1db46aa5a60f2af17bc36cd76a6f39 |     
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/550ceb66345695b6a572a2560d2e80a55e11dd29 |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/bb94363f62eba69a5d87a544a6a538f130d718ce |     
microblazeel |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/fec18506db9e9e4e02a194964291b79bf494955c |     
   x86_64    |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/c3378c138980b77ad5202223e7e1dbd8443bcf93 |     
   arceb     |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/444c54ccd9ee0e548ba6a86019e3861b3a1793d0 |     
 microblaze  |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/525cb1f49d351cf14a4970acdfdbe4e44ffc7b07 |     
    arm      |          janet-1.39.1          | NOK | https://autobuild.buildroot.org/results/7564818a0279605c51ad260ff7f430b96755c17e |     
   mipsel    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/04d89d6a4d9314a3bb925ee91b4b20f9356f07a3 |     
    or1k     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/f40c9723abb11961a5f129afd63754438ac24df3 |     
   sparc     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/9c5806e939d968a917016accfa6d0b80423d6285 |     
    i686     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/902e1c0140ddcdf98e0bffaabb66132f5e50e502 |     
    m68k     |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/0da8bd24980986ed3baa29fabbff0830d92a6f3e |     
    mips     |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/9869aff6285317d5af25e382fc1a3e23fb548f57 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/bb41c2e4685b5b7e39626dd7de61723716e1dc43 |     
   mipsel    |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/e95c30686854b8f19ba8fcf11910c5f8386d3cba |     
    sh4a     |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/5efe3da7f841fba9370d3a1dc613e2431fe5a5c8 |     
  mips64el   |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/9f6fef08d3a10dfa63f485015b2e097c4e1cb459 |     
  mips64el   |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/8d2177ec66652394475a866f002586caa54959fc |     
 aarch64_be  |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/e66bdd989147fbde29a751174caa448db486284e |     
   armeb     |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/e9f3b4b5e91c540d4f0d08e4f6f5d0c88b79a223 |     
   xtensa    |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/60bb3c29fb07bc1a94f1bf17e136eeb62088b94b |     
 powerpc64   |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/1e67f35fa02bf9a9568fc22c93987208135b7401 |     
powerpc64le  |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/7eca0385050388d3cfb7b715c176bf43be853ca0 |     
 aarch64_be  |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/484c88624302854b104a919cb2540fbc644d5967 |     
 aarch64_be  |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/e9d7e88469de65793a3215a499f2d19b7e4ca285 |     
   s390x     |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/1c503ddff65a349b7eb85e11ebf09153335c054c |     
   mipsel    |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/ddf02e0693b67d29918bfc83ec22789fb3d10029 |     
   mips64    |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/c4ffc5d9c3ebc86f68c869f000157101c38c3ceb |     
loongarch64  |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/968acd168bbb55bca29eeca69c157dff6dc1a15c |     
  sparc64    |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/bdd6d34624907703a15db2b2f472a9af373388f2 |     
   armeb     |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/3e3e8a5e48cc493580d3875b9d9369ec41997a86 |     
    arc      |          libnvme-1.16          | NOK | https://autobuild.buildroot.org/results/ae5e379c5dd3a15a1f8d1401ed3995d8dea24957 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/28cb173cdb8cfbf75fbe4c8ad2c9ba6088865812 | ORPH
   mips64    |        libsodium-1.0.20        | NOK | https://autobuild.buildroot.org/results/042ca50f5601608e844d752cc8d5a49f10bffef0 |     
    i586     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/a1f7e7be1bdeff081f08c41459661776731373e4 |     
    arc      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b5a0a13369293ed08acab0636d668d3c36dad0e8 |     
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/ddf6caa0a085b8171cc2b319b76176c1a28e428b |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/deb7859701652c1e477c76c69d4fd58fcc1db615 |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2acb2752eb0ffaa2e1c6a2a67384e4550804fb56 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0fa12ceac2897b4e953c1d8be09efbddb21e498c | ORPH
    or1k     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/4472c4d965d7f58d77d5f5b0f0ac6254267ca4a0 | ORPH
microblazeel |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/97a26e80c029a38f6d153dab10480d3d58bb0011 |     
   x86_64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/7ce321109bf28be9a6c72aa1e9c2c2b5d57a61ce |     
microblazeel |      matchbox-panel-0.9.3      | NOK | https://autobuild.buildroot.org/results/1a58af9998cc51fc6a09e4fff105abb26aa42f09 | ORPH
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/790ea56ed719e041d6d09cb2280d867bf3c29c99 |     
    arm      |        netavark-v1.16.1        | NOK | https://autobuild.buildroot.org/results/c36d72c646395d1719297cc4e75c05efe6d1a310 | ORPH
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/c291170b2743856ddf1487cd2bfdbcdaa6c14e96 |     
   mips64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/de0abe03e0e08f53785c2c889fd2606a8ce1b58d |     
   mipsel    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/ccc0aa2f72e27d2ff0fa82daecc7dc7e15d7d8c3 | ORPH
   s390x     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/5ed6d02fe0a6816b30593a0ae7d0c9d736f27d13 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/7400ae2974c6fea78d51d72ecd97fb462658e31b | ORPH
   s390x     | package/python-flask-cors/p... | NOK | https://autobuild.buildroot.org/results/6680775a1953e059592ae3712c736aa1cda6e8ad |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ec855cba0449308acb13c3ccfe4974b1cff9be1e |     
 aarch64_be  |        php-xdebug-3.3.1        | NOK | https://autobuild.buildroot.org/results/bb849ae378b1d3f94549114936bf4fa889c2dc84 |     
  mips64el   | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/1441d2c00a0c12a85a05405fb2b1d5fcb1da870e | ORPH
  mips64el   |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7ecf07df2945d45438f7b580a200070d0ece8548 | ORPH
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/3ecf51ffacee2160689c4d7470ed8d455dbfb8d2 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/9ce383950567d0eb0a7aba1c368adbb514054750 |     
    arc      |         rrdtool-1.9.0          | NOK | https://autobuild.buildroot.org/results/bf4a3083d6ca0397776a6a269b946117fff4f794 |     
   s390x     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/f099039e232bba88e682ddfb9d93aa56d08d376a |     
   x86_64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/431a7e681557b8934f4576cb98d6d6cd2c76006a | ORPH
    i686     |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/4f14aa18ddd993390f81d18fe7d7bdd05129f92b |     
   sh4aeb    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/f5ea5c68c255369d516a08e2d9884a64097d89ae | ORPH
   xtensa    |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/fa0b281e2650d70b0cac58652c5e7e0bcb26d25c |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/b590488d4e5443fe45b65c2826824a1086f8c79f |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/39db5ae9aad95e4976c3d8a40aca95b26568f8ea |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/117808ab119e1cc2a3b013e270a3dc99f580d495 |     
   armeb     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/f7e8887fa2aa4eb5aab16ee08d06647fd44b84e0 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               dvbsnoop-1.4.50 | 1 
            gdk-pixbuf-2.42.12 | 1 
              wireshark-4.2.13 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/84327c11a9fcecca6ac76e60139b1e5eb37a7eae |     
   armeb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/563234c831c9b3533132caff4356035b978c1d3b | ORPH
powerpc64le  |        wireshark-4.2.13        | NOK | https://autobuild.buildroot.org/results/50f72e7eae642680e2377529ca5aa2c435477d42 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    bat-0.25.0 | 1 
               bctoolbox-4.4.8 | 1 
                netdata-1.37.1 | 1 
           oath-toolkit-2.6.12 | 1 
                   perl-5.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/36c601cd682a1b977a8cb5af799a9ffad50f8546 |     
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/273f212ef69aa5b0b9642719b4a3137ca1367e6e | ORPH
    arm      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/c69fe32a2e3a054529852fe662016a9f13dbd4cd |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/56a6e7463757ee9ef30d85b80cbda92271aab697 |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/4e77cc9e5dce2d70c83308469b370b1999b33fb5 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               aircrack-ng-1.7 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        aircrack-ng-1.7         | NOK | https://autobuild.buildroot.org/results/805e4dd1eb31d69b06c40a7bf937608ffa8a5b99 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d16d673d93a48155a4f1229fc6077cece3f46936 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

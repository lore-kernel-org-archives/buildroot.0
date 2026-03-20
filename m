Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693051093172
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 04:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D5961783;
	Fri, 20 Mar 2026 04:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBmKCVPJ2KDL; Fri, 20 Mar 2026 04:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2007661738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773980723;
	bh=S3Ug8divWoKiWw1b0NsZbNTtgbfXpiFojwQkixky1Fk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hKCI6bnGH1p9KSWEKBqLrQIsQP4hJza+qeBT5RIDQQ4ESg2M8lZAjJaz4sB/oTjwv
	 b1NRnFM0/xAB0qRpnybd3KiMCWwIugLReRcBbRRerVXQuys941rbnOfPMM7YZnEVeY
	 hWamI3scj9uFDkBVWDDW6vcMOY2pzI9lVjOFKVwWDp2snNeOR5zjgHbnOlVFipCm6L
	 D1HeyOuO0gXWZ0K8JiDc2PAPj6p+7eQ4planXIRXeE+L+Sya07caYFHKFUM7K4/ehq
	 54u/o3KdEm0A6VBCxwcBAv4zspHj3mmyMa+Pky1dsgHXSHUhHg5p+hvEUAiWDJX0cF
	 MHBmEaq5Us03w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2007661738;
	Fri, 20 Mar 2026 04:25:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3CD265
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 04:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 001A784616
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 04:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knKom9n1s317 for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 04:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDD1584615
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD1584615
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDD1584615
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 04:25:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-486fd27754bso7634915e9.3
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 21:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773980718; x=1774585518;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kRxg+WdJTkPlPAS0T75qsFKXZSPfnuqhFVgATpRWCms=;
 b=jKERwRT00L616V1/Fco3xqOKqYwvCSzBS8Nzu8xbMUhRHlpvjxFdEmWuQ5sMt8mviZ
 GN6HKiR3wJVBxM8EMJvCoA5k4yrJKiROwyNuvIKvAKcvNZvZYeoPWS7OWO5OrL1FTl+Z
 oGnHX1sjxCtTcZtKLmCpzZt7pWz6s4/S03HH6NejBI1cMtk1b2o+K6kGKhj3A3vmu1OX
 PZAsi1MnVq7ZRY4KyKv1wT2bRpxchk5vDpVTZWbfiQx3hoSpecG4EdUffXWtem3nMkwL
 aOImVN9Ii5+SQCirSUjqVRQS3F5c+82hdjrs6OTcoR9ZKN1yRaCeGA71R0lzRGmgAU8A
 K9rQ==
X-Gm-Message-State: AOJu0YxDMjNXMn0iZLIIvelsyVBKpuqPEAkGBFQNI+ckir2oXXr/Qr6k
 xpMxlTU31WtU/FhTFiDmXSPxudSjKD/GVx9DxD+g7M4uLHis8xuiw9lrlEhDO8C3
X-Gm-Gg: ATEYQzxS/OTFfg/yGJSt6hAQLVXgrGvZ1a1kTbYidWYigv/hCCABGya0YBOdA4GdouX
 qakAW9s6TYAUnaKE3lcHUgUrwCm2ctioibwGNRg06atBea3SbIhBpafiucht74dCTYiQIXNE+y0
 zJFgTYHWbUK6fCmA1J50B1j3G9MfaadTCTnQ8bABNNkchjNkjBYemyUfSezTXbkmTQi44Erwwvl
 r1RGWcFfeJjDrmnZLYQS7tMDv+MlqiE7jyQ0bSmlG1X+XpTTR/SR2+ENyoHL0GNf+2HUWadHWV7
 tjluhi4Mrqyf6EZWV+YmKZ3BgtvtiPrqtA0VzU5zRPHUBAcuZoJgYMU4QyjgSMuIWmTP9Y4Xdk+
 U+Ngj0IxdvcxzIQ0uNCvJb+H6raxoQQNa34IZ7lsqjbIygUAYQKoxWRfL4mMatOR0bmE3yG9+2/
 SXp9BOb/nVzmFN3mQc370ztxG9Zg==
X-Received: by 2002:a05:600c:a4a:b0:485:4eaf:eb14 with SMTP id
 5b1f17b1804b1-486fee0fbf6mr20575875e9.21.1773980717128; 
 Thu, 19 Mar 2026 21:25:17 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fd9845a2sm89451095e9.6.2026.03.19.21.25.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 21:25:16 -0700 (PDT)
Message-ID: <69bccc2c.050a0220.230fe7.e9eb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 20 Mar 2026 04:25:16 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773980718; x=1774585518; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kRxg+WdJTkPlPAS0T75qsFKXZSPfnuqhFVgATpRWCms=;
 b=Vi57FzJTDPFyOEJrywjHROTjHLOGjD58s+52ToOZMBR0uNHHtcXPoi7k/OavoBWwm1
 cpQzetNJU5Kv47E2Zof4nQYvo2tLYzmUyO/o1iY2FkgRhmaUplFZpgc81tFLWmf2B1b/
 M8om05e4yiWZ36OooKJXVxeL9tqM4vIds7sKrpJWBZZlY+g9tOAPQZigJMd7fyWHrVeB
 aDzNybKV3csTd9GVMWDJbdqxNjfJoG1/wXUWjBJZu43tD+Yg7FuOi/PKQJZ7akDOyY2k
 OzWis0l6og6iupAkXUo1LC9oK1La4Nl878D1R3fCbvbnFh0LZN/lvTsP4YFmQAhHMYPc
 u/Cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vi57FzJT
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-19
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

Autobuild statistics for 2026-03-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 12  | 31  |  0  | 43  |
  2025.11.x  |  3  | 11  |  0  | 14  |
    master   | 43  | 108 |  2  | 153 |

Classification of failures by reason for master
-----------------------------------------------

                 mdevd-0.1.6.5 | 5 
                   perl-5.42.0 | 5 
glibc-2.43-10-gc3ceb93dc4f6... | 4 
       shadowsocks-libev-3.3.5 | 4 
                flashrom-1.7.0 | 3 
                       unknown | 3 
                    bat-0.26.0 | 2 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
              host-guile-3.0.9 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                  libnfs-6.0.2 | 2 
     libphidget-2.1.9.20190409 | 2 
                 libzlib-1.3.2 | 2 
                  linux-6.19.8 | 2 
                       mrp-1.2 | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
                   s6-2.13.1.0 | 2 
          usb_modeswitch-2.6.2 | 2 
ustream-ssl-5a81c108d20e247... | 2 
           alsa-utils-1.2.15.2 | 1 
                   atop-2.12.1 | 1 
             batman-adv-2025.4 | 1 
                  broot-1.55.0 | 1 
                  brotli-1.2.0 | 1 
docker-credential-acr-env-0... | 1 
                   duma-2.5.21 | 1 
                 fdk-aac-2.0.3 | 1 
                  ffmpeg-6.1.4 | 1 
firmware-utils-c42a3bc53da8... | 1 
           ghostscript-10.06.0 | 1 
                  giflib-5.2.2 | 1 
  gobject-introspection-1.84.0 | 1 
            gstreamer1-1.24.13 | 1 
                     gzip-1.14 | 1 
                 host-gdb-14.2 | 1 
    host-mender-artifact-4.2.0 | 1 
            host-protobuf-34.0 | 1 
              host-rust-1.88.0 | 1 
                   i2pd-2.59.0 | 1 
            igd2-for-linux-2.2 | 1 
            igh-ethercat-1.6.8 | 1 
                   iotools-1.8 | 1 
     kvm-unit-tests-2025-06-05 | 1 
              libcamera-v0.7.0 | 1 
libdill-32d0e8b733416208e04... | 1 
                  libgudev-238 | 1 
                libnss-3.120.1 | 1 
            libunistring-1.4.2 | 1 
                  libva-2.23.0 | 1 
                linux-firmware | 1 
                 linux-headers | 1 
        ltp-testsuite-20250930 | 1 
          lttng-modules-2.14.3 | 1 
            minizip-zlib-1.3.1 | 1 
                    olsr-0.9.8 | 1 
                openocd-0.12.0 | 1 
               openscap-1.3.12 | 1 
                openssh-10.2p1 | 1 
            optee-client-4.9.0 | 1 
                    opus-1.6.1 | 1 
package/mender-update-modul... | 1 
      passt-2025_06_11.0293c6f | 1 
               pulseaudio-17.0 | 1 
           python-html5lib-1.1 | 1 
          python-protobuf-34.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
                  sdl2-2.32.10 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 systemd-258.4 | 1 
               tcf-agent-1.8.0 | 1 
                tpm2-tss-4.1.3 | 1 
                    unscd-0.54 | 1 
             util-linux-2.41.3 | 1 
               valgrind-3.26.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/9bca76778f7ce26605e025ed7af199537401f7a5 |     
  powerpc    |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/c0a9daa0dcbdaf10c4f8a904bc220f438a4215c8 |     
   armeb     |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/3cf378b205fb181c100c755ad521db79378bcd7b |     
 powerpc64   |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/0daec33be39df9c700811ec70fe1c760f8aaaf8d |     
    or1k     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/3e087d44d27ec2902004772e46fb2ef575425e2a |     
   armeb     |          broot-1.55.0          | NOK | https://autobuild.buildroot.org/results/68dfa015eeccc0784bbd8412273687f98019915e |     
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/72fdeb0156df4d243f57bd16506b5bb9a4267ba7 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/555d9af8a26383760dae997953ffa2407f43e1a5 | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/600a12207af44ea697f5541e5571eced5171410f | ORPH
    i586     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/bd5f080f42c6a03bdbd4e3843fec6345c4a09d05 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/9f37c360fb28f4f8c2fdab6d9b14f5ff79b0a683 | ORPH
   x86_64    | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/52b4c0f207eecf3cf26000ff8eb86bf3c2f92f4f | ORPH
  aarch64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/d8b2fdf9619cb1cdd2c51640bd495e2fca7c4912 | ORPH
    arm      |         fdk-aac-2.0.3          | NOK | https://autobuild.buildroot.org/results/70fbbad2b6bad058d2f5149cc3cb9b086d4c9216 |     
   sh4aeb    |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/61568770a42578d2cd7be9d7a49449ad8fecd33a |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/3ed27aa50e89f0a93af7a66c25de662627a7321f |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/cb573bf989b69d3a4fd6892c47ab1772f2ee93fc |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/3c1ab30d321ae63563a07e43717ea3150c9f79c4 |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/f4c3c98ecf59180ce892f6f05c256d0a4903d65d |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/09a5a2aa96ca05053ad7210e74547aaa40764287 |     
    sh4a     |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/3162ceb96f972abd187abbd3f4c71c2a2ac8d023 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/74bef0c0b92cbb5403f732a09cbeab9c4e9cd8a4 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/037b4837fc52dc9e33fcb65133f297b4ba2fa4c1 |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/05211174e7d9368ea30c0db9e9ccfc611af161db |     
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/64a82166b7db7c254f66fa87c62434da98c2e581 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/38d944a5211f65dab2a1dc1f23f6028806b099eb | ORPH
loongarch64  |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/a0d9ec8ae09b264bfa66c3f621bb507e09fac3e9 | ORPH
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/755192db9232a064d105f49eee9be52fe6b6e442 | ORPH
   xtensa    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a015d92aff705cf49c31f1bcd9b891980040a73c | ORPH
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/109135a9f221ea39ef9b2019a63ab365fbcf7dc4 |     
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/a089ae0b11ff1d3c0239888ceeccedd89b1baf41 |     
powerpc64le  |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/0bd240a082284a00f55c6914411932a6a66c28ef |     
 microblaze  |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/6ca038c036fa85e36efccbb8aeb3510c2d218298 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/fd8ef3a690dbf7fde760040e0e8e04a576f9e170 |     
  sparc64    |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/5ef2b4b6b038e1192a1587449273b864c4c3f18f |     
    arc      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a33744e499f226d2edf5519795c0115cf0a04fb5 |     
   x86_64    |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/e8d6831b349aba7305fa2e9bf107dd686585be6a |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/28fcd9a57ea9741f39d3b3d3cf58efedc5056bde |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/54674b97740f0161c9e3289b3720104051fa7719 |     
  sparc64    |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/c6a3fe0137aeefa721e82ee06d344ef828efaedd |     
    arc      | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9e08d55862bd3ea9ff735095d04219c3a3620c54 |     
   xtensa    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/d9d1facbbc3edfb924da29492771fdb668ea9ebd |     
   x86_64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/d1068842b163a592ff5a0e740ce755d4dadd3b5d |     
    or1k     |          libgudev-238          | NOK | https://autobuild.buildroot.org/results/d11d7d04dc8a083a9869633d8ac2829da0903e5f |     
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/280fb1899eeb2377377926abfaf374a57083b18d | ORPH
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/a5f3e321588a3e722299031df63a90041485652c | ORPH
   s390x     |         libnss-3.120.1         | NOK | https://autobuild.buildroot.org/results/7e2da5628419b30fa58b6ce4bae32d0f11e0b804 |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/466ebdd3b211f245b5b583337d612969dc79d50a |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a0ec0a54ad57608f2281196ab9e72b016ffca775 |     
  sparc64    |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/c5bf8672b12407b816ab2c37a18c25501204af15 |     
  aarch64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/5bf6e4f69b2ce74010408e8d77abef4c5685c2ce |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/8800662abb4c1d5851edd7c26c122d1c0082568a | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/86d20f92a7529c491d652e863be3bcc0d11672ec | ORPH
    sh4a     |          linux-6.19.8          | NOK | https://autobuild.buildroot.org/results/62c4ee92c65b7bd07905d547d9f4d6908529511b | ORPH
    sh4a     |          linux-6.19.8          | NOK | https://autobuild.buildroot.org/results/74c26d3c92a5064761e4917165062163a5fdf5ea | ORPH
   sparc     |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/812004c841b33d269b9ba0e597f0e70add8aea6f |     
  mips64el   |         linux-headers          | TIM | https://autobuild.buildroot.org/results/b28f6e157db5b653d36919a6350708058ff5f8ce |     
  sparc64    |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/ca60d6ca3edf335c2fa859b3639061c65c1da63f |     
 microblaze  |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/948b3c9a8678e5bc92b64a70cbc8af0e7106bb9c |     
loongarch64  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/ab75b4fcd5ec0aa5ab6fe7e439299980c8caca46 |     
microblazeel |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/0e7055e2d4796398a663435f376da16941c12931 |     
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/7d120cd9930f0a22cbd0d50656c42b4db3105418 |     
  powerpc    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/69f72ec99915df9405753033c9529f36e7553c7a |     
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/a831633b7644db9b785b90133c16d59dcb28814d |     
   x86_64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/1198fbf207dfc4b8c65797f9e9676677c2bdfd9f |     
    or1k     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/fa45c666374764b2885f96e03a4be9ad03069745 |     
 aarch64_be  |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/144016a9fd3a626f29b03147333dbe217e21982a |     
   mipsel    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/e58279ec1b6a9ce030c56434c636ac4177b561c3 |     
  mips64el   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/da6206768951b25543cf169d8811b281aec5f412 |     
    arm      |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/ba59a8399149f75b70fae18b24bd7e809322a282 | ORPH
 microblaze  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/9861a708bf94c442f3fa454de999905eeebe617e | ORPH
   armeb     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/4e322ae918116c2ea6c4dd68e8723012be020a27 |     
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/0e6e3d9e7399505c9487368009eff9899134f7bf | ORPH
   armeb     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/6d002f99d855d01c9945e8053e5d00bf1ac60e41 |     
   armeb     |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/4f52fc144b2b57bb7532c745e70ad04099db3236 |     
   s390x     | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/96197a64a1e5aab97d65f2700760b1f21a84bcf3 |     
    i586     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/aa62da4fbfb731c21e8b1def6e7e7415b80a5b9a | ORPH
loongarch64  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/5d5198489a3e9c3ed985a5f7b7b5a6893a49b9f8 |     
    sh4      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/fc1e2ae2f74efd326583561ca4a88821cc1ab847 |     
microblazeel |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/93207e34a5f0b82b4511c28ae2168a50c749055c |     
  riscv32    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/35a58cd8890f3c7e6e363a7a9c3f1725cce6117c |     
  mips64el   |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/5a9fb01853d1100fcc3840f695b67fd14eb094a6 |     
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/abe07d7a59159036841875c74cfba1907025df93 | ORPH
 microblaze  |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/be4bc160fa871d85b8ca00d12cf5adec516022a4 |     
    m68k     |      python-protobuf-34.0      | NOK | https://autobuild.buildroot.org/results/fe09839b40492c76a7b71413339d3e3f1f0a772e |     
   mipsel    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/b7433e645f7bedfdc9a6d82c525a4db1bb0ca4f9 |     
  sparc64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/8b3935a973b9eddb6b44aa7d758e4bd233ca1d15 |     
   sparc     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/dbcfed6d667438fbc72641ed5043f5490572606c |     
powerpc64le  |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/d5c95f57f714b388b963927c07e9b43f2a7d8736 |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/76116e3dc14549019ddb0b7f791875926fd3aef1 |     
microblazeel |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/d18138fd706449166c464a3abaa649cbb0295212 | ORPH
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/6c61f90fc4272726b16eea4f7ec195bd39e96c7e | ORPH
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/4a602fe067a2de96bb04602c2e84eae9248b50b9 | ORPH
microblazeel |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/4f7b8499ad4d50cce79d15aa43d0399c906b8dcb | ORPH
    sh4      |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/8150f3c801dc08a68bba681c5e568785fc78782d |     
 aarch64_be  |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/1620dd3e3186c087c757bee1783a96584fb48248 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/cede8dacfcee066a97b2484f9ad72bea48b25749 |     
    arc      |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/00917927aa3fb63bc90c0922cacc6455457ca275 | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/c1d40e284e8ea2296a774730203ec935c9a92098 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/8c5f53e4b8af0090c2105edd5598b61f74563368 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/3260dfe546875cec325502e6fe65b558cdcf8728 |     
  powerpc    |           unscd-0.54           | NOK | https://autobuild.buildroot.org/results/6342727debb4b470e67133bca2f49d1a67195bd0 |     
 microblaze  |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/1a1b17909182eb17b178db6288f5b6d534cf6654 | ORPH
  riscv64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/c7eddc0a2590fca496288147cc8ddb98191adb6e | ORPH
  powerpc    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/560e208150000f73f7929f54b8a489c51e778947 | ORPH
 microblaze  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ff9b28a04ab0540a37c1026fa49cbfe280f826bd | ORPH
  riscv64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/4e9a53b9e66233ca8e2761b19db4c76ffa18e62a |     
   mips64    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/75021f33ae00c77fefe4c3a92c18ecd878313b19 | ORPH
    i486     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/6d31005bae1b8705fc26d30dc62d1406c9ba1a07 |     
   x86_64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/27e89b8dbab6a22827722ba9106310a56232f19b |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                 apache-2.4.66 | 1 
                    azmq-1.0.3 | 1 
                      fio-3.41 | 1 
           ghostscript-10.06.0 | 1 
            host-go-src-1.25.7 | 1 
              libmhash-0.9.9.9 | 1 
                 libzlib-1.3.2 | 1 
               lrzsz-0.12.21rc | 1 
        ltp-testsuite-20250530 | 1 
package/linux-headers/linux... | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         apache-2.4.66          | NOK | https://autobuild.buildroot.org/results/ac263249ac6c3ee066714530322c7141ff142eec |     
  powerpc    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/50be3284d0581d14df4c383e048a14c8fb4d6fa2 |     
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/12e8ec30994887a269c571fcf9102524f7bfb8cd |     
   sparc     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/eed88a2a77cb8c4ff8c59bac5091221e6873004c |     
    i586     |       host-go-src-1.25.7       | NOK | https://autobuild.buildroot.org/results/df1dbfe492a636bdbce295d612e134f5d01d525a |     
   sh4aeb    |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/ca61d6ef03396d8e193a7256ac5c746ec2ce8b03 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/ebaa105e908c405ec16d126ec37c2b3496da4901 | ORPH
   x86_64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/16bdbf7408947b3b6aa4c3e8963dc33fcfc413d5 | ORPH
powerpc64le  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/a252e4bcaa573b0baa360cd7ce99453a94de7c99 |     
 aarch64_be  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/50c8b0cb275a073d005fdb17a26e1a02e1946499 |     
    or1k     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/c7c9f0c4bd885e4cac651c6762fce0daffb5f8e8 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-faketime-0.9.10 | 5 
              libopenssl-3.4.4 | 3 
                    ficl-4.1.0 | 2 
                   dante-1.4.4 | 1 
                  dpdk-24.11.1 | 1 
                    gcr-3.40.0 | 1 
                 gerbera-2.4.1 | 1 
  gobject-introspection-1.82.0 | 1 
                host-odb-2.4.0 | 1 
                 libgee-0.20.6 | 1 
                 libssh-0.11.4 | 1 
                 libzlib-1.3.2 | 1 
          linux-5.10.246-cip66 | 1 
                 logsurfer-1.8 | 1 
           oath-toolkit-2.6.12 | 1 
                setserial-2.17 | 1 
      softether-4.30-9700-beta | 1 
              tailscale-1.78.1 | 1 
              udpcast-20230924 | 1 
                       unknown | 1 
        util-linux-libs-2.40.2 | 1 
                    wipe-2.3.1 | 1 
                 wolfssl-5.7.2 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7a1b654d50ea09067e3f53817c062a42618342e9 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/6d734f7bae641b16f1a92f43269032c29ca6b568 |     
  mips64el   |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/9608073a4e9c1ee4ac3c7e206950120b0d30b554 |     
    sh4      |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/7d8d7dd16b341c861b7573d7d06e0bba90aff994 |     
    m68k     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/cbd1f4958cadc0eee4e80fbc1f0b70d9ad329fe9 | ORPH
  sparc64    |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/ac4981cb39e73a03965c058fdd1d469096056f19 |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/66bdf742ecd0cc7940facf564727f97275ee28c6 | ORPH
   mips64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/eb25c64b7afbaad31ca060f86b2f3018d303b083 | ORPH
powerpc64le  |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/00794997cfa0bd4ea8a4bc66f8da77647a4458b8 | ORPH
  riscv64    |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/f7aec2935398e62096ce2387fec6597a2c87004a | ORPH
    mips     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/2e8af19d889f5f658be7bd294ded727776f5a914 | ORPH
    or1k     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/4ceac1a3b63a85a8a77b887fbb221446ba91dc0b | ORPH
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/64542418be417353b7b007cde9e2658d1b7572b1 | ORPH
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/dabb961e0fc6ade5cfc0fee96bc096e308eec390 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/6016338cbbe1cf4d271f6262d7f9d6367f784f31 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/9f6ec799dec5dd7be5196443cfd8ec8e212ee0d2 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/346baa9d4b42dd694eed21046503510390953663 | ORPH
   mips64    |         libssh-0.11.4          | NOK | https://autobuild.buildroot.org/results/56f953616741a60a710a2e8dd26d0841c42f72eb | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/73a6d12ef675d0d077f344b49347a291e5829bfc | ORPH
   armeb     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/649b3a6371a2e78d72949bece5f4deeaa9b04de0 | ORPH
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/f4e8dfd455b076ec9f1b24ede8f2f7def1cd1163 |     
    m68k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/43f8e9b97d39c4dc9cc0073753a8b057b05eb2c7 |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/e1936c33c8ca4fb39cd0d939bd0878bf859c5b94 | ORPH
 aarch64_be  |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/4e381a745a326728e79bfb9144a9e50f361f5538 |     
powerpc64le  |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/41ef0f5d074435c834e12754ff88f12eeebeec00 |     
  aarch64    |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/1039d436c497d7ae05448ea760b325a019ddb422 | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/1889fa5697db357c9313b4e9a23393ce9260c1a7 |     
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/ef90e2f788abd6191a2bb81d26104a32bb33cff1 |     
powerpc64le  |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/012be1e70578112b3598b367eab4075699716044 | ORPH
   mipsel    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/e56e9781564cf0236600fe4b0a2c7c74920177f9 |     
    arm      |         wtfutil-0.41.0         | NOK | https://autobuild.buildroot.org/results/626e12fd2ac581480ca59b38896ffc71e79ff158 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

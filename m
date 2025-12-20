Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB88D637B2
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 06:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7424780841;
	Sat, 20 Dec 2025 06:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtKp9Ghm7miR; Sat, 20 Dec 2025 06:15:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A988780386
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766211346;
	bh=LNgSDAHcmvjDcwY2ntT5hkqjPgzW5tzy1SNxNzv9ARs=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V4WBtGqpvkADmtIBgiXKX/8TrDHHaUk6EiNLCF4Kf4sXwRfSQBlxxXvhdoNdc+X40
	 CIEETKeFGTXh5AkfmekoNO/L8CK3BbZ2oIKECMqbsEDxegD3SagkOJ2DL/C+0tM8V4
	 woTuoegWlMfK8ZJr6x+MmSQK5CM9QxXQvql423aHEjUg9OAqNJkZPATXkZ+TUSdPqR
	 SAZPxAKav6RTgTQVejLtw1zjb3f54x8Kul1pJ/YySGK3zv92+GHusWArrC8AQgRxKr
	 XK/qs9TsYsPQ/2YK7E48gAvqups+6JPJy9qM355V2PE/Brh96pgms4dNDRVTQCh9R/
	 A8y2kokf9zEJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A988780386;
	Sat, 20 Dec 2025 06:15:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A7981A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 06:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0126640379
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 06:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Td3b6q8CJUdV for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 06:15:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A2D84011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A2D84011D
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A2D84011D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 06:15:42 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7eff205947so329463566b.1
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766211340; x=1766816140;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJajrVC8r++zTT+zum/6WZaA8lqjFn5QaN8ovhDvWXk=;
 b=jpwI26Yb69J4O+IhIceoQFxVKhQXlpEKJ4Wjhd9vSO9vIYdXdxxqlWMLxsZKtSRHYN
 Vgd6TAPEjuWz17PwsEu36RsxHCXjhfcpFGDhwACmdylEYN1pIOhxsEPQsWhY+ZCOcIjL
 2zGWv4YfH3VCMU9A8uSWbY8xiW6itAwVhiu0DHuwXstpI+Q38QXSiP7b9ju9GIyYgNrZ
 tNGNL8dIeEoDvGVEywXRhJQsxv9KuIjIST+m7pRAtBpdijF2ifthyEfrst5jZ8G1fLJ5
 9Z7LoASAxG0chfGyT93BdmBFnSGgrfOgajFxrWAZst+yMXmo4mxtdc/SJDg89rSVwY6W
 IirA==
X-Gm-Message-State: AOJu0Ywwm9gNZO1N5twULwOjWCmjk07xSfSnsh/Ctlf6XN8Zb4CLfVEP
 W0eFbpThQDKhsyWUw+RkcSvpqk5stZSJv8r4uVeZV6bL2Y1D8rKDu5UypTpDaQ==
X-Gm-Gg: AY/fxX72OrISf31dtVRGghCyPJDdODBjxNw4VougpiAw6XELAu73+o3BHhFYgY8IbK0
 T/Qxxpf/9S2HMYLKBAVTt3Y/uCcgB7LGY5AaDEc0IgkQZE+3xP2wmjDYDktIbQrTqjYv04WVMKj
 Q3R4mePs02Ewt6CY6VEDNYlXx6ry5WO5peA93/1UG/9+JUnFsT1RNanyQuANPyYP5Q/7m/adF3U
 gr8mqck81GrArCGmrdDUvc8If+lBQKzn294sYo7XXiA9s4ZD9NFKoAh9xQMWfZTSR0EMpVx4Y1c
 lyafuIr8EgL0d9WoaToyUjaC0z0t2yQApggiWNBoQDxtIcgH6p7iUi2c+7WNEYo0w3JyiRrZPyY
 S+7Q93JfamzAjZsG1ZvSGYpczTszq+DkdID7d5ZGlSUhojBvDWLDaILbzUWhDqaJrxve7mLEoXJ
 fbVmmPUIInW+rl4obVsA==
X-Google-Smtp-Source: AGHT+IHq1QygScwJ1934AkrUYdkXBK05281D9e9kw8SwFKIfgKmoR1FyuZ7HlvwHI3q+xC6KAhJCGQ==
X-Received: by 2002:a05:600c:310c:b0:476:4efc:8ed4 with SMTP id
 5b1f17b1804b1-47d19549f9bmr40064585e9.11.1766204270493; 
 Fri, 19 Dec 2025 20:17:50 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4e91sm72724975e9.13.2025.12.19.20.17.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 20:17:50 -0800 (PST)
Message-ID: <6946236e.050a0220.17fd47.94f9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 20 Dec 2025 04:17:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766211340; x=1766816140; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NJajrVC8r++zTT+zum/6WZaA8lqjFn5QaN8ovhDvWXk=;
 b=lr/IQCXc/7uWejB5FGa/vhPdFiRgzxqs4rJtEfkYz5ZAZcPI3qfAH6hoxb/qnA8s+b
 B+xYwTeZL6t+WacapzZ8aI6OITJ67h0q2R9Hs7naJH/eDpQIAUVuMc1m03tBBgghl9+N
 SRdxOPjM2INOFrS+N6/HQDPBwJXVpDkxMy47pUMvZjD/tn8wxBSMNAciFwHhfEhCgfK6
 bXwMpuIEtyVGJLW86mE+LzMEG8PUMp6qX2FbwxR7W5fIVsxKJq9aiNXSGy6NM2WTT2UJ
 EzUCcbfUzKfPHRBc0ymPz1diyEhPR7VTEYLbSb+sT5jZBTPQfyikyOYgtOTKeHoxi6Bj
 28qQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lr/IQCXc
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-19
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

Autobuild statistics for 2025-12-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 33  | 100 |  0  | 133 |
  2025.11.x  | 15  | 28  |  0  | 43  |
    master   | 70  | 250 |  0  | 320 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.9 | 38
                libselinux-3.9 | 30
                       unknown | 12
                       cfm-0.3 | 9 
                 libuwsc-3.3.5 | 7 
                  libcgi-1.3.0 | 6 
     libphidget-2.1.9.20190409 | 6 
                   cvs-1.12.13 | 5 
               linux-pam-1.6.1 | 4 
neon-2-sse-097a5ecacd527d5b... | 4 
                openobex-1.7.2 | 4 
            18xx-ti-utils-R8.8 | 3 
             berkeleydb-5.3.28 | 3 
                  cairo-1.18.4 | 3 
                libcuefile-475 | 3 
              libopenssl-3.6.0 | 3 
                  linux-6.18.2 | 3 
        ltp-testsuite-20250530 | 3 
                   nanomsg-1.2 | 3 
odhcp6c-53f07e90b7f1da69771... | 3 
azmq-v1.0.3-54-g819b24035cf... | 2 
                  brotli-1.2.0 | 2 
                 dc3dd-7.2.641 | 2 
             drbd-utils-9.21.4 | 2 
          esp-hosted-1.0.4.0.0 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
               graphene-1.10.8 | 2 
                 host-gdb-14.2 | 2 
                 jasper-2.0.33 | 2 
                     kbd-2.9.0 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                  libsvg-0.1.4 | 2 
          linux-5.10.162-cip24 | 2 
linux-serial-test-bf865c37c... | 2 
                    ne10-1.2.1 | 2 
                netdata-1.37.1 | 2 
                openssh-10.2p1 | 2 
                   perl-5.40.3 | 2 
                    rtty-8.1.2 | 2 
uhttpd-15346de8d3ba42200249... | 2 
alure-14beed2a86d5a36030e90... | 1 
               arp-scan-1.10.0 | 1 
                  bitcoin-30.0 | 1 
                    brltty-6.8 | 1 
                   ccrypt-1.11 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
            cppcms-2.0.0-beta2 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                  dpdk-24.11.3 | 1 
                   duma-2.5.21 | 1 
              e2fsprogs-1.47.3 | 1 
                enscript-1.6.6 | 1 
                    eza-0.23.3 | 1 
                    fcft-3.3.2 | 1 
                      fio-3.41 | 1 
            freeswitch-1.10.12 | 1 
  gobject-introspection-1.84.0 | 1 
                   gvfs-1.57.2 | 1 
host-am335x-pru-package-5f3... | 1 
          host-binutils-2.45.1 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.88.0 | 1 
                   i2pd-2.58.0 | 1 
                 inadyn-2.12.0 | 1 
                  iozone-3.508 | 1 
               iproute2-6.17.0 | 1 
libcorrect-f5a28c74fba7a997... | 1 
libdill-32d0e8b733416208e04... | 1 
                libdrm-2.4.131 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
             libgphoto2-2.5.33 | 1 
                 libiqrf-0.1.2 | 1 
                libressl-3.9.2 | 1 
                  libva-2.23.0 | 1 
                libxml2-2.15.1 | 1 
                   lsof-4.99.4 | 1 
            lttng-tools-2.13.8 | 1 
                   lzlib-0.4.3 | 1 
                    mpir-3.0.0 | 1 
                   ncftp-3.3.0 | 1 
           oath-toolkit-2.6.12 | 1 
                opencv3-3.4.20 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
                   perl-5.42.0 | 1 
           python-brotli-1.2.0 | 1 
               python3-3.13.11 | 1 
                rocksdb-6.20.3 | 1 
rtl8723bu-bb6fcc9d14b1ec8eb... | 1 
rtl8821cu-3d1fcf4bc838542ce... | 1 
                safeclib-3.7.1 | 1 
                setserial-2.17 | 1 
              shellinabox-2.20 | 1 
                tinifier-4.1.0 | 1 
           uboot-tools-2025.10 | 1 
uclibc-ng-test-132c6134d691... | 1 
ustream-ssl-68d09243b6fd447... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/8ab38e794134e07166ec5351a008f3d36fec2e2a |     
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/b7f7e63312c64c29c4e2ba5a8d34e87af4ae9993 |     
powerpc64le  |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/6e87fa14ecc97ae181fd648a47061d1be8154a8d |     
   mips64    | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/ba35639740e4b331405a211db5e1f7e09797178f |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/fbf5999fde3ed9a10d4cff143c48c1c6a7dd7fd6 |     
  sparc64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/56f4edf6462e7eac952e9220fc31ad333cd0e49a |     
    m68k     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/6ca084916eb484584bf57a6ba9d2a2bd903b00b8 |     
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ea4a731f7f02eb139ff570b930313be5932a21b6 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/3e3f1ccfff5d7d18a499fccbaca154959c8e227b | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b1de077bad0e0a8adbbae67c0fea4c1d206ea10b | ORPH
  powerpc    |          bitcoin-30.0          | NOK | https://autobuild.buildroot.org/results/280d00499d31458efeefc08d038857f7999dc3b5 |     
powerpc64le  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/d449149b83ab769b9b54981a38dfb8fa06ce9111 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/04c448f78698df2bee831e59e2bf271f2f8a7e9a |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/27570702f8234d0200e81543f95444fb6de450f6 |     
    arc      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/b8ca066e28467f28a68a0e9e1512823973542b62 |     
    arc      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/4ccb2f416b21e1e479e83d0575075814c7f4d489 |     
  aarch64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/f9b6e216f31650c1850cb9e05d8d5c61302fad52 |     
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/a393868dff8847359eb03adf00bc3288603e068c | ORPH
   sparc     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/7505706cfa3e447b1cc02bff1fb03e0531e5488d | ORPH
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/baeb13e0f7c633f71f3de8256c453816dfb53ebe |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/061a04e800394ec03898511cdb277308bca38f5b |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a93f15facafbd2610a7e2bf943c156b1566004fb |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b38953dff4aaf86e89638b80884b74bb4f414f35 |     
   mips64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b26daf2793b388b8054b8b8b0c4df7a765f4d1c8 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6ef6516fe4f4da9cf250251e49be5437e8cc916c |     
  powerpc    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6098dc186c87041166c18f331ddcb4c2285d419f |     
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/2cbf5559a33ef233249a78601d69153fe878e322 |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/2439eb873d82f8eda35dfa3b2d2ae5a9a8df879d |     
 microblaze  |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/c0e2846d30078fce2131e01fa20a50fc3da162ce | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/16b04d21e8f4171ee526f78c900dc3f45281e301 | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/dcc1007fbc1c25511727c9165dd3f715b089890a | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b133a30b1cc772cf2be227a726510128cc3f4e2b | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a183de024984660c0235719874175b3a3d1263d8 | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a8bd00835ac9a226e72aa653fe61d36dab110ed5 | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f8bf0cbe0c640c67f6611737f43744758b930e7a | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/55de3262db8e838a0651ba32248f77d6de797434 | ORPH
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/604ba0271ae7d75f7dfa9e8806bcbde766011dd4 | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/62fbd88a4e5c2bc1fdc362d222b1e56ec551e6a6 | ORPH
  aarch64    |          dpdk-24.11.3          | NOK | https://autobuild.buildroot.org/results/47bc07cd914cc1f67647c5a8ada29e7df51b9f24 |     
    arc      |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/3d40ee6476219859d7578014eb3d5f4ef836dca8 |     
    or1k     |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/974a4e6eba2d5b4f3bfe46a3eff29b784f0aa773 |     
   s390x     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/4c4b2d98d49d996a3060686d5922a90620914bd2 | ORPH
  mips64el   |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/1500dae42d13f654b33a0a8e21d5887bd66fd187 | ORPH
   armeb     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/d11f23cf1cc8735d7cb0185e35108f253c0051ca | ORPH
  aarch64    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/d9f0d26894fbaad0ba47e8022b476f8766d1a913 |     
   sparc     |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/326017e07f12ea26677316a44b9b1b8947b04fc0 |     
   armeb     |           eza-0.23.3           | NOK | https://autobuild.buildroot.org/results/50ed2659045aa4590121486e9f7a9274d956f46d |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/7403b2cf5fe29ef9c3c1aa33e719a3c3a1f32903 | ORPH
    arm      |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/3a29da170ca6290bb3e68b2d6541cda822a144be |     
microblazeel |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/3839d70c341d732f8241131599fa150a7b75dbff |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/ee5b012ebe47b223ea7824760eb321171b36b6f3 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/1c2df3b3be824442d2592593260c966387647490 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f9b84c07231d528b51faacf9d5c872342de3bd4e | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7a078102e9d19128500aaaf3af4ecc6717ad859e |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9bd9a2b06032ff73203c6c822ca0d64260e33206 |     
    or1k     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/af52ca3f0bcfaf6fb4aec99d9752f757bba07855 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e340ba18a59b99c5ea0b45074d3924dfaa8535c9 |     
 powerpc64   |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/729cacb8def6cbc05f306bb0f0565b39f74a5da1 |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/aa1d8ddfde919a4f4489c0dbda37df0c271551ca | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/489d027d381d6a071f16480dae3f655a5da015b6 | ORPH
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/04ec55f69fb0e569ea201264e3e38cde3a6b15d7 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/112cb9d17cc31d88d8f15de158fe170ba372077e |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/58e41ed4ff2f07a190c55e12a2c63869cd8c12b1 |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/61943a68a257e6614f685004397a5e903f8dad16 |     
 aarch64_be  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/4f493cb91c85cc27015adbd0504c607aa27f7de8 |     
  powerpc    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/841fe96163b48d17d72a04b38a9e59e94a6fd3c7 |     
    arc      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/dd94efc85ab7e25aa29ec2073dd1aca26e5b17cb |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/6f3895969dc07763607ecf7a619349dfdd7b9d43 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/6315c4dde7a28465e8dd6696148e7ef51bc54d3d |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0ab5fec5d0c66410236d71e6bac6eeff3a40a523 |     
  powerpc    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/c7d4d2d8b75a069bc6d03060107f251aeb7db7a4 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/25799d46e0ac76b64739e8c0327f834a39c14edb |     
    or1k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/722f603c7bfc5032f3c3372db296396fa1ca81ea |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/c298d7c5392d100feb64f3d01a224d0e6251a3fa |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/048b46e3e6925fe13bc8ab4f2ef08fbc7b0ffac8 |     
  aarch64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/974017af75e3d25bb4681afe72164ba3fdf446c3 |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/cadad7a4a9bacc28096d00799bd5546568a882df |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a497f7d97844f8135a058fe6fdf93e582a574adb |     
 powerpc64   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/9dd2d3d6b3ec60f71b655168f62ac5903c65ab47 |     
  riscv64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/73f239b9b5f847fa20f2a7475bc7ed16f3191f30 |     
 powerpc64   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7b870aed2bc1a78dd825d39cab80a2256f7a1412 |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/45f7136ccdffed7372f95c0e92addac48c999a29 |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/f1e3d6fa4bdfd8e3b001f2f39a60f3ed8d569b84 |     
   sparc     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/584d86a30dd3902599e09f4abf6b2edc1b77d4cf |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a951e8010d5f3e7d9166240c8c23fa1cb8f77625 |     
 aarch64_be  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7420e57788b2e7e12106ff3d52bc63b9e1bfbf84 |     
  riscv64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/acb77750bee0a7a25c8373799dee997681add120 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/dceef90721b5a6dab61dd2f1010e07a038816c78 |     
    arc      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/cfa1076a12e8719a07c048bbd307114f53a6905b |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/9b377a5a422924c973b8649c05ee1a3e94b730f0 |     
    sh4      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/332612867da1c16dc4934dc66c2ec326e3db1d2b |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/9a4b0435494f6f46d8ac808db19c25e6ede19dc3 |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/d6663d365a28cd35d3582ebdca082c72ac8f491d |     
  riscv64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/4ba350f742c709a26f07c3461cc4cf5185bd20a6 |     
powerpc64le  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0e6c3b083eeca23ac927a43dc039943bcd098d85 |     
   mipsel    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/cc9fb3dc4428f45b8c0e7b395c0291813b0d9634 |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/67a77cbfe45d8a20c9d02ba205c1664662092504 |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/40d55bff21b4667dad6541e8aa5cff9b62eaacfb |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/f6dd6862519bb5d3896f5bba5bf3e5471e1f3195 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/5e540eee807ec3b313fbf0d496d78b9380e7c073 |     
 microblaze  |          i2pd-2.58.0           | NOK | https://autobuild.buildroot.org/results/275af93701c16f3d058a1e0874eee269c7a14b11 |     
microblazeel |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/81a52f820570361774514d2b28f8ffcea0bd4586 |     
   sh4eb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/91195f1f4086ff56fb1e0c03b7a7490acbf749b5 |     
   sparc     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/7c3c19383b12ad714729266a397540c44261c5a3 |     
powerpc64le  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/75552133b0070793e4470aaa2a0a105f9f11490d |     
loongarch64  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/863fe90b425bbe797d355ba1f800a705edb5df4b |     
   xtensa    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/7f4b82bce5d2321642fa54303ec471fcc26ce6b8 | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/47aea197ffe17a5e51f21e59b92555d333991d99 | ORPH
  riscv64    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/9227f693792dfffe75a0f2f7d108cf146f7b3a11 | ORPH
microblazeel |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/e96cc94f66712d8167b227f7a2ec917840860066 | ORPH
loongarch64  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/eb8f355b55146469fc31f2194bf642c6ab468b63 | ORPH
   xtensa    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/4128f766d1657d8b45343574e2968dc9d6f221ea | ORPH
loongarch64  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/fbcc40dd029e4c3e365e1a75385d68d25503ccdf | ORPH
microblazeel |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/6252008927ed042421bd6dfff92ac722c45821b0 | ORPH
 microblaze  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/b635bb97b16bfea1c99c6bfb218dc3afb946e2f1 |     
    mips     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/74f7f80b1ab5ee27df8689e4fc1972ef6a2776dc | ORPH
   xtensa    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/4b48ff18dc6a92cdb15633023019acd40bc3567b | ORPH
   mipsel    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/40d0d260e698f89346fa4a537715e1bbb057621e | ORPH
 aarch64_be  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c69c934268831382f5264bd600ba0764a9e32df5 |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/bd2851a18471b74d93c571928af28f5eac19f28c |     
microblazeel | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/a5c7515e80af05b7e1ca760d2e8ae6e45bf0a015 | ORPH
  aarch64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/786852fd11e17ef74bd28d1b6f4203a74cb77ce1 |     
   armeb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/304d866387d30e5325edf1ae07317f57dcf1312c |     
    arc      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/7dcee103573bc85ee06303b632ad1065e10cfa28 |     
   mips64    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/cb50e158446e83249fc54e54e5a63ccf36e3be96 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/c52fc7511eb4a0803b37d4ddc2d1f65c804c000c | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/f4a30d35cfcfec0b7498a1f79dbe288f431346f2 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/4842df554ff91e72f491b5e43465297210c971d7 | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/0d14d78b84906f5aa3ca519169bf069de9643b98 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/da8fa7620bd2bd1ecf5bcc11cf9443f4912b4195 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d87aa2f6be322f56c29c482c5a5002641c665873 |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3af54358c9591c79fc815d32c68aed6df98577aa |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/132d71c3b43d331a8bba444b1f3ba563403f2b84 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8334f7fdac7051ed4f074ed272c166c5c12c87ae |     
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/93a4861df1f025fb41edad511d6a7822fcaf403a | ORPH
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6431245382ede55c413cacfea2bf9f9ce55a0f42 |     
  powerpc    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/182ae7103c0c59cf4b7b069bb8ee2be188595abe |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/83f70689e7423133d2aff3f095ef1376ffe4626f |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2f9d621430fc3bf1b1ff7b54d1defb3b9d50250a |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6a3210b619a5d57eecdcfe528ed51c3adcad0c62 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/ac9739e9afc947531e96570b5016a89829ebe932 |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/bf22eb677f213b0356a8f9fce7c76d07f1600643 |     
    i686     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/9e0ba0bb2cf1f63a1b37e7de12290f1598d4a582 |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/223994003587ddd4ae62e3e21ad1d4be6db95257 |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/cb5bbaed1d546bde504202f4ebcb8aa8a299efee |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1da798525043d4f50a2513116a0797d539199f06 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6da85dbd92d1f317fcfe36182dd9d7cbfd910623 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/621391e246af620339e17e4e1d33c39447ae4f9f |     
  riscv32    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/44f8df3ff0acc85e3620a5225a5a5dbc9679fb21 |     
    arc      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/3d971bd56d7580f0e4bdf289ba3fbb350251237d |     
   armeb     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/de225a1aca4c446892502f4aa6308587f4f3c7c3 |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6975925d0152f8b7b6cd2383eede70ac4699a86e |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/327a666f422bf88f4a3ffe41da7615c1a4be6080 |     
    mips     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/9f75678c4495a76ab425216225bb9784a0847a1d |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/51a1092af39dcb2d3e68cfc3641cab709fbed678 |     
    sh4      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2c44c0627fff5ecb3cfb186d0d1ba9f0f31d9d42 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2a68011c8ff55c461642e9a45b6835e30bbb6e91 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e13fdc5e3afb37177276a847197953c7bfa91fa6 |     
    m68k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/923990ceae1bf2c7c903f622529ccfea145891b9 |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e9acffbc6ff2fbc0f0785f47544950821557e416 |     
  powerpc    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/b7213885e268c46c46f9e10554e4485de8a929fd |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/84a74af233cb275573aa52a2c3ea557c44af428f |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/134aca1e55331819057a3956da160eb6f84f966a |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/32f8798aa9a06dc66b3c78c3749961b78dc7cbb7 |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/734286542d4aa3922f42e44aee9c8845b64668a5 |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/aa607f0577f6e63eff7cadae2d301dd3238038ce |     
   s390x     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b456bb9fdef20341bae588a5db62065cd05ee507 |     
   sh4eb     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/ac027e5da73c221d47cb5af099f9e2553e3d730b |     
   armeb     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/435cba39d716506c810857b068b85748be61403a |     
  powerpc    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/1631a00404581075ea976272bb7991af9ef699ae |     
    sh4a     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/012b533715637056dacbfb93e35e6daaa45cfb2d |     
microblazeel |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/6042ae4e7a65f5e4ba6d7e7680092c4a10546d2a |     
   s390x     |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/1dff7634d06c91b606d132117db0ee0ab950cabf |     
   mips64    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/dcfb59181c5ddc0d4d79004cfe02ecb726afff41 |     
  aarch64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/75bbd4f0134194f159067e8b0ba954f5c4507d4e |     
    mips     |         libxml2-2.15.1         | NOK | https://autobuild.buildroot.org/results/2f80ae0014cef46bd8ef157857c9c76d83ae77c8 |     
    arc      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0b126fb5f5684b0afc6a6744ae0cf5d0963ec18a | ORPH
    or1k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/83c4c8b9a9f1f98de847d7890baab8f4ea28f02f | ORPH
   mipsel    |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/49acf044a28e072c351a7e1accde3f647c2a4ec1 | ORPH
 powerpc64   |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/e697c1da88cca5c9ba6b88c7b3f5a55230b3df04 | ORPH
   armeb     |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/c0c1ac3af8bad72a5fdd29f020dfc581415602ae | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/440b29021e57f9b9cfd2d5f93911757fe6e34247 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/3b5ff9b328603e691609fc1011f1b7313be91f2e | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8693f6a9789531dc770c786ac09d689fe1b34b80 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/cfa8fef6c3e731c137bb3f50c83b0adb9cfe61a4 | ORPH
  powerpc    | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/e59b9584ecf2e68c3c16f57a0ab8da7a82fdbdbc |     
 microblaze  | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/15e7503001d8e0db6e73b6090375f4ee5dea12ac |     
 aarch64_be  |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/0956fe801cdb016291835bd4736b4f892012b5d7 | ORPH
   mips64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/b23f986b810d8667e7aaa734088d4884a3dc1cf1 |     
 powerpc64   |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/2cdae533ea00612b60b756d9e81de33770bc6a81 |     
    or1k     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/7c88ffca9b90fd9676ccea64f535b94fe04ad7a3 |     
 aarch64_be  |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/957e544ea437f18a168540d280b88233d3f77766 |     
    i686     |          lzlib-0.4.3           | NOK | https://autobuild.buildroot.org/results/605be74b38566d89ae7a95ce0f144c3f05a9a769 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/bf55e62f962649101746f93d0775aeddb2523e5d |     
   mipsel    |          nanomsg-1.2           | NOK | https://autobuild.buildroot.org/results/4ae73b0adf076ba786a89fe86065cc2aaea32ff2 |     
   s390x     |          nanomsg-1.2           | NOK | https://autobuild.buildroot.org/results/aa38072a32ce42081e57f8cf7310ab969fd7be53 |     
    sh4a     |          nanomsg-1.2           | NOK | https://autobuild.buildroot.org/results/56ab58574b608ec768a5359a677737d6dcc9469b |     
   s390x     |          ncftp-3.3.0           | NOK | https://autobuild.buildroot.org/results/064dfa408d63f08548098b1e48120d3faab02684 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/df5458feca485ac83c6538a925c56f37fa78fa01 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/f93d67c20f796aec7ca81221692733dc5249a1ac |     
loongarch64  | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/22817758bed822fc40a197ee9e4cfe199e60c303 |     
loongarch64  | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/5194a440aa1cfe6ed58bd8dc2bcbbb4565b8451a |     
 powerpc64   | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/d7151ca1dcad495b49217d2adae074024905a14c |     
 powerpc64   | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/1698e3111b0b10458ae7e9e04556056e283bc90d |     
    i586     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e64c82399b023659c2fb15afa735f99da6c60160 |     
    or1k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/83c22c7e8e54fa0ee043f318a6b71112335ac7a9 |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/a28cde83f661e9cac4b22050d443e88907b859f8 |     
microblazeel | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/59e5c30be6decd78d39e78ed502f601965637035 |     
    arm      | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/c8250bb638cb2e0492b4aa347bdf38bb60605584 |     
microblazeel | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/b0427d9cd95b59c88e2197a7c99bed25a5b77992 |     
    m68k     |         opencv3-3.4.20         | NOK | https://autobuild.buildroot.org/results/f9ce556cf82ba2ca5e333bea92fc02fac33e462e | ORPH
powerpc64le  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/ade07a29fca3428ccd2c5bb68eccc84b60e89ff8 | ORPH
    m68k     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/1a8fb57e09e546c22724e25d16dcb7820cf6a62d | ORPH
    sh4a     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/69c1127dfc20d0b8cf7224a9158ec98d60be0ba3 | ORPH
powerpc64le  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/7342d07b854c6816aa653fa311de8b2a98715ad5 | ORPH
microblazeel |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/267d4e53cf4071d614c670a9f8c12b24edb1e468 | ORPH
  riscv64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/955ed7d2ca2bcb8ab3097982b38abe9a654d5e9e | ORPH
  aarch64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/d9e804cc0b68897b8c0e1c1b74e1e8336716a3fd | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/8399f16d7a7a65366c8a3973ea8a266929b3446b | ORPH
    sh4      |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/63dde0e4aa8b1c1b12f284d1f7725163815b9b30 |     
    arm      |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/0ad38de7d2f09ef5036429b749e2e07991c71b4e |     
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/8efa838d5be78c07b124f85c533f3ca3c927fa14 |     
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/989d9f05d12083298b1c1fa102f5dd87849dee67 |     
   sh4aeb    |        python3-3.13.11         | NOK | https://autobuild.buildroot.org/results/7c8e1cda104a69d86407afe0ba921c1283646f40 |     
powerpc64le  |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/bc12fc9312f91e9736374d8e9acc312360289995 |     
powerpc64le  | rtl8723bu-bb6fcc9d14b1ec8eb... | NOK | https://autobuild.buildroot.org/results/427831d134599098a962fb4470a5c2f9f9d677a7 |     
    i686     | rtl8821cu-3d1fcf4bc838542ce... | NOK | https://autobuild.buildroot.org/results/8ac13b2e1f665103b36dee081c5db68832db53e1 |     
loongarch64  |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/45cd0d45d9c504349aa97de19771fa36dc2d7b70 |     
  sparc64    |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/08d3172d0f40e8daed78b2ac117fe44a44f9b58a |     
   x86_64    |         safeclib-3.7.1         | NOK | https://autobuild.buildroot.org/results/3a5e78336e700d9b3023940b90245d2f63a2c67f |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/62b36e85940c67b52e7713a37862b88f923cd25a | ORPH
  powerpc    |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/5bec20fc2750fbae2bd771d7f85181efb94f24e6 |     
    arm      |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/ea1abc2bfc207bdae4d33b446f307d92031f33d7 |     
   armeb     |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/f222f4eb0921e60a93486395520181d598db62d1 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/c9ff0ff75b799a26ed4100880f4c631802504bc3 |     
    arm      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/97aa6af7e143b5694ce80326a8568995daf43363 | ORPH
    sh4a     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/578c89bc941a2631f732723af2d20b263c604094 | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6e95ff54ca5849a892ef41b993aad13c3346beae |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/044c772c73a924ec3c62e291ac12c48f19994270 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/796ea4105c8018560337568149df1390de634c6d |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/b36c56c20e6bf380e708ea9ce63ee0146563cb61 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/129a543053bae8c30362efa328bc9f26787b1b04 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e4890f7f3d2892e6353592853a32c38bdb3695ad |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/ae92d7712674483806407229a58a1c2ff4cf072a |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/b96a930438d08d631d61e672b0aac6ba247daadf |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/67abc4d6efb59cc8af3a9ad0fdf5f41016549bf4 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/b0f17170b4bbca7328b03e6b1a61deeae0231f1f |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/039eb76fe2cdfe366bb91f1f66d222248b320cfb |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/823cf18f8f15d32cf4968413d14b601615adf340 |     
   s390x     | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/615b3ec7fd1d7bbe72852de2b11b14308c649b89 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

     libphidget-2.1.9.20190409 | 3 
                netdata-1.37.1 | 3 
        ltp-testsuite-20250530 | 2 
             util-linux-2.41.1 | 2 
amazon-ecr-credential-helpe... | 1 
                 apitrace-13.0 | 1 
                   cvs-1.12.13 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
           dmraid-1.0.0.rc16-3 | 1 
    host-mender-artifact-4.2.0 | 1 
                 libmbus-0.8.0 | 1 
              libopenssl-3.6.0 | 1 
                  libva-2.22.0 | 1 
            libxkbcommon-1.9.2 | 1 
                    mosh-1.4.0 | 1 
                  mupdf-1.23.9 | 1 
                openssh-10.2p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.3 | 1 
               tcf-agent-1.8.0 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/02667bf85fd1a77edfd57cf7daed0a99c503da4b | ORPH
    or1k     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/95d93224c07bd5a049a4637ac16916490455d9c4 |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7030789038018bd1505b97e623a128f6917b0cc6 | ORPH
powerpc64le  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/72f3eec3711bdb81aa6437381ac1e4e6657a27e6 | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/4f80dfeb06b0a177bfa6c9f427139056709d504f | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/0ff8b7e5cd6ea16845d6134a56f4a34a0538a9b6 |     
    m68k     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/f7b34f6e97fb0a1afc8c02a56b233e79fcb176fa | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/af6e336a907f890a3f320145f65ca93fea5fba62 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c7b3e67f43e181125ed75a16a5ddb971c919b0e5 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/35579d6d7acfcf11e8ab8cd38f7134ab8b649ab1 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9e18e7e08c839cf48af70a8a4a85d0dd05bd3588 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/ffd6272cb26a66de2e266e0b8376ca2b7be25b97 |     
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/f3633485f0a8b27dbcc3fc5e76c4fc9c9e3d06ac |     
  riscv32    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/d638d13c614f64e624596c0e9e4779942d120e34 |     
powerpc64le  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/e95e072a47e92de1fa1c8aad0e7ce5439ae0a248 |     
   mipsel    |           mosh-1.4.0           | NOK | https://autobuild.buildroot.org/results/abc9747109eb3079340002a19fec6deee34b15e0 |     
   xtensa    |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/5724fc1c8015621ef7beef1a80df9238c43a6cbe |     
  sparc64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/12ddbd35c41d9aa880294d5890ed44807bd9a93d |     
   sh4eb     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/96e9caf0e1e3872195a0fc69f9d6ee0503150877 |     
    arm      |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/ee8d8c491654e61cd98177e0f928f025a0580008 |     
   mipsel    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/382aaa6255cff9bcb66501604d0ae23fced32a4e | ORPH
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/d73ae5d8120bd7db36330ae2cdca59c3ded87540 | ORPH
   arceb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/d02bb200da6e05e2080af48b03c1d76fac9ad9df |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fb9cd7b648ba7635b144015dffd04c8f3495c99a |     
powerpc64le  |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/ccf30e9f9eaa682fd1e8d5519baf9029a343f632 | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/57142898c1cf9ce283f719f54fd5eaecdf4d9083 |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/3c6ffa64a1dfebfda754222600c3602acebabe7c | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/2aee5e9cf2284fbed74d9a2929e86cafd03807a7 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 21
                libxslt-1.1.45 | 14
                       unknown | 8 
                 libgee-0.20.6 | 3 
     libphidget-2.1.9.20190409 | 3 
                 openssh-9.9p2 | 3 
                   crun-1.18.2 | 2 
                   cvs-1.12.13 | 2 
              execline-2.9.6.0 | 2 
                   exim-4.98.2 | 2 
host-go-bootstrap-stage2-1.... | 2 
                  jack2-1.9.22 | 2 
                  pdmenu-1.3.6 | 2 
                   perl-5.40.3 | 2 
            18xx-ti-utils-R8.8 | 1 
           at-spi2-core-2.50.0 | 1 
              containerd-2.0.2 | 1 
               freeipmi-1.6.14 | 1 
                   fwupd-2.0.4 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.82.0 | 1 
    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
                 inadyn-2.12.0 | 1 
      libabseil-cpp-20250127.0 | 1 
                  libbpf-1.5.0 | 1 
                libdrm-2.4.124 | 1 
                   libks-2.0.5 | 1 
                  libnss-3.108 | 1 
             libtorrent-0.13.8 | 1 
libuci-f3fc0b76040685829191... | 1 
               libunwind-1.8.1 | 1 
                 libusb-1.0.27 | 1 
            libxkbcommon-1.9.2 | 1 
                 linux-6.12.61 | 1 
                  linuxptp-4.4 | 1 
              mariadb-10.11.15 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
                  nginx-1.26.3 | 1 
                opencv3-3.4.19 | 1 
             parsec-tool-0.7.0 | 1 
                 protobuf-29.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
                   trinity-1.9 | 1 
                       zsh-5.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/70f65136b00ecc1cade5f8e93f3ba9d4cfe87c78 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/197c5727f822d95999ea2429b26f04ca2bb37b2d |     
powerpc64le  |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/a425d3d4ceec87ee22f775cd8dc7360a2d69ce7f |     
  mips64el   |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/7cda7d80ec5b53c75656aab62dfe75316ae25f3f |     
 aarch64_be  |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/a3ab2036d4d7fa5c60deaf3e085a1f5631b6b9b5 |     
   sh4aeb    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7f678a1e4898a3646cdbb7bab9961df7f2234b62 | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3d65e499458cfce4754a912ce113e9aaff2a9bc3 | ORPH
   xtensa    |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/2ae93d96ea86e54646780ef78529f20639f4410d |     
 aarch64_be  |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/35b27026a5d1d6bb5ce85bae5a5ce1b2441ad11b |     
    sh4      |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/72324fee9d1937febd78ebaa3c20c0981fd4b46e |     
   mipsel    |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/4b5cf484843eb9f23f50ab4b0e3b9d36ec6474b4 |     
   armeb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/3e3d040c1c278bd91165d4aa30f72974eae68c86 |     
   s390x     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/288a35655277eb0121b502c35d70f6a9c0af78ae |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/08f0d19ef3b24692c2e5d338d0d21230d8690549 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5d27919b421340909351d1eebdfe9f74dc460447 | ORPH
 microblaze  | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/105fd70dd4ef240774a76da4f79999175553f59b |     
 aarch64_be  | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/247abd1d55025568c3a145704367d3b2571c51b0 |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d180f121d2e779b37f481af744bd4e5db6f44bbc |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/9fee0c93e54cb711f891a694ad79c754aac952f2 |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/b9e6cbc340a82695ea2d085d681d87846f840661 |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a86c56409f7d2a3a459447d19bdee13cd2708eb1 |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/766539ef81ff989f60ad7f7e6bd6725f813c2be6 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/fb1667f557112df0566ef8b5f7eb39301ba87903 |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d23a40d82fc407d51874603e93b090bc60fedd22 |     
   armeb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/6a22f443051d571e0d038ca63594500454b1fe9f |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/2d18f8dcb3bbbd993f839023cbdaaa33175cbfcb |     
    m68k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a00db93c09ee71655c3e92c81b02410b64ca4376 |     
    i686     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/ea36fc5a4c7aea28b62e1adcfae41c1eb042db07 |     
  sparc64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f5c91de67d540332f691ab22ef01cace07c2c71b |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/74439847a8f2a260e1eff2e5f50c404edf27e102 |     
    i686     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/2dbb3c24299b8387ce011c0591b3a5c935b7e2d0 |     
  powerpc    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/182d93795736dd14d6e69c7620cd7177cd5384de |     
   armeb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/2bfde29e16a8e47cf9c2a9d4bac066e5913ae917 |     
   sparc     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/81629357b525876456b9b8986cc57e59067e9c30 |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/80de47ded68b3f359878b5e5038c8edc8ac2f621 |     
   xtensa    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/3bdad20878b1b319359a8622998fb336c8f24362 |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a80bbbed080f8fa751ace3ad7891dee5d95ebfb1 |     
   sh4eb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/276dbf876994851753482f39b8df91b2d5ab9381 |     
powerpc64le  |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/b1ac2440ff2d0d90e65dd6c3922b973ef937af74 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/453066313aa1c19ed4b6d4d9141b40352077dd18 |     
    arm      |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/5fea98e9c98672383937c760ba2cd58e51ce8e2e |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/62e8831671d8a446827e6796538a36a3b204e8c7 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/a4a9f19928644a0164d3b474518cf0191cde1eaa |     
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/10f8931afa4a5462eb32caab5191976c62b07f62 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/03fca256524c96f88555d0ad85cf6a7e233d174e |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/03886a5cb718b44ea4965a65a02ff5438163fa20 |     
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/662a81a1c6ef2fa627e7567bd9b97fb7a0e4c6b0 |     
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/f360d32987463a38e55b50856009d357fe32e686 |     
  mips64el   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/647860f30255e1f5c8ccac067075307a723898e9 |     
 aarch64_be  |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/686cd4cfb67513270186035dfb33cd11a18e0055 | ORPH
    m68k     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/fb39c9c8ee1649c6c21a7c464d7baf721e65ea7a |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/be762f4b62b0eb984b5de63401fc9f26b88d8ed2 |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b6bde80ccd5e0e967facaeff61d5c9de7eee6f04 |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/54169ababe7322b7aef4257586bebda8bc9c94ff |     
    i686     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/916603edd589ecdf0f7aa9b541642dac9bfc4c07 | ORPH
    arc      | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/dfa56d53ff27101c64c0eda13d4721e606a9ee00 |     
   mipsel    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/edb73005bd89cab82e04038b4f2f2f0dc26bf115 | ORPH
    arc      |         libusb-1.0.27          | NOK | https://autobuild.buildroot.org/results/ecd4c1385d129c6cd8272c2c60db75230991ddb3 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/4804304fa0a689cec3b6e858c8cd2ae7dc6d8fb7 |     
   arceb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/44b6ba9523368fa44c8c412edc59c7ac7a53fb19 |     
  riscv32    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/2960892f94947f1f16305f88a9933197943f4564 |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/37fa6c3f8ee1f51869d091c87a930d68de391cd1 |     
   sparc     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/83bd0e2e4ece738fa954d24c5e64b028b28be82e |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/68081a51a499db9e85924aeab790e03f69fcd84d |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/36291fb174bdded4cb42c4430c8180d192dbd924 |     
   armeb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/46c087a33466939d5ee39bb30e1b86e1b7d6b717 |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/63db66a158b28bf4b330e9baddac999317085488 |     
   arceb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/435ba30ec66f5d68ee95b8861e77f1f3c06e90df |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/3b0b8b24b0d6b5dbd3ef8eb33a44e28ca093512e |     
  powerpc    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/c07a6969e4d027054877e9cf2662f76d11d8181a |     
   mipsel    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/3568f6ee231077ee96017a4ea1d0c3e3c5862d8e |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/89f7e5ffb1960dc99870e95b7e1360b3ecc554af |     
   s390x     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/b882e3ef4659654b22f44b26b87816e9aabc29cd |     
    m68k     |         linux-6.12.61          | NOK | https://autobuild.buildroot.org/results/70f99c0fd477babfdc17efa87883df166a08f0de | ORPH
  riscv32    |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/a2abc01aec92a2286aab0d57c41911e57f6a6b8a |     
 microblaze  |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/e9257c3e29f2d706d29e051f5123d154d5139d0d | ORPH
   xtensa    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a4ecbf2b50ddcf9154043a78f0bf784c86d61dec |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/df0f80ba4bf6d81d8e35ed331745d105e5f63d2c |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/bbd1244259236b0949c1e5928bed5372a1937505 | ORPH
 aarch64_be  |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/adc07cbe4a6c1faded0878d5d174ce76d8e9d73e | ORPH
  aarch64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/b61541f3f69bf4f17d30a49e7ee6be831c3c07ad | ORPH
    m68k     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/d3de2617c10f07f5734df871997f3fbf0b94c071 | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/0d2e7fc78b2b76949de6e1b395e8cfdc9e059a59 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/b0e9bc7b1f6113913209c32da68febd4bdcdbd5c |     
   mips64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/7009ee8feb5442e9d79e85b0bf5adf300481ca56 |     
  aarch64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/281fce7b54c0adc4221e2f63d9b7dbc90dfe93e0 |     
   s390x     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/9ce7a1527f34d4a6c730ed389ded3b9424a2ac12 |     
   s390x     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/974b947436eb8d3b309aa18ba0c1f4f19cab7ce5 |     
    m68k     |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/9422475a547aa809d90f8cff0592434b875d40f1 |     
   s390x     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/1ba63db52c50dc6656132cb6e80cf063e85b028e |     
   mipsel    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/cfe2f42eb23b3b866ed71084733e994008b988bb | ORPH
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/5959029c434fbeccf73c3e7eaf18e7d642736c60 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6abc1647eeed80ba1db2b1fabcbdefbc90e129a1 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/8d94e1f4cf66a25763ab21b0633366a892f34409 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/6cc0661d2724ec446d6e1ae81d60cd471fbbc0e6 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/36a28133c040f9419b9e93bda4da37fb94241b82 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/256546c0a1c60c1c8155ad018771fadbe02b20de |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/4c83c3df97aa16fbfc870093b99d9d461f3a97ff |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/7b3bff62872b87de02323b6a19446f83af3b8533 |     
   arceb     |            zsh-5.9             | NOK | https://autobuild.buildroot.org/results/8e03c4622665482886f76e085073976def385e29 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
